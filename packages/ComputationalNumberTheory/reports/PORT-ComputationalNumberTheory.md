# Port report: ComputationalNumberTheory

Branch: `roadmap/computational-number-theory`

Head: `f972a3f30f25c266dbe862158662fda93f077f27`

Commit: `ComputationalNumberTheory: roadmap (README, Suggested.lean, metadata)`

The commit adds only `TauCetiRoadmap/ComputationalNumberTheory/README.md`,
`TauCetiRoadmap/ComputationalNumberTheory/Suggested.lean` and
`TauCetiRoadmap/ComputationalNumberTheory/metadata.toml`. The working tree is clean.
The base was clean at `a0af4de`. Nothing was pushed and no GitHub write was made.

## Validation

Command: `lake build TauCetiRoadmap.ComputationalNumberTheory.Suggested`

Exact outcome:

```text
Build completed successfully (8989 jobs).
```

Warning count: **140**, all reporting that a declaration uses `sorry`; no other warnings or errors.
The final Lean file has 1781 lines, 56 proved examples, no admitted data, and no
`set_option`. Its imports are `Mathlib` and the two used pinned Tau Ceti modules
`AlgebraicGeometry.EllipticCurve.PointCount` and
`AlgebraicGeometry.EllipticCurve.MordellWeil.XSubT`.
The build process has exited. Whitespace validation passed.

Full gate against `origin/main`, after committing:

```text
gate ComputationalNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency command: `tauceti-roadmap gate --depcheck` on
`TauCetiRoadmap/ComputationalNumberTheory/README.md`, with
`--name ComputationalNumberTheory --order merge-order/ORDER.txt --movable`
and the supplied configuration. Exact output:

```text
depcheck: 13 roadmaps, 99 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The gate scans the supplied sibling registry
and merge-order names; it does not discover every external open roadmap. In particular
`ZerosOfLFunctions` is another author's new roadmap and is absent from
`merge-order/ORDER.txt`. Its supply is allowed by the brief's explicit exception.
Its source and dependency list were inspected separately: it does not consume
ComputationalNumberTheory. No tooling or merge-order file was changed.

The manifest remains unchanged: Mathlib
`6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

## Draft pull request body

This roadmap builds exact arithmetic presentations and quantitative analytic bounds on native number-theoretic objects, from algebraic numbers, finite fields and number-field orders through integral modular forms and local elliptic descent. Its end theorems include primality criteria, factorization and integral-basis existence, Ore's residual criterion, finite saturation criteria, explicit Dirichlet and cusp-form enclosures, Platt's finite-conductor results, and sound Gram inequalities for explicit-formula applications.

The README specifies the full six-layer library, supplier contracts, discriminating checks
and worked examples. Suggested.lean records the light definitions and representative
milestones that can be stated on the pinned carriers.

Prepared with Codex (GPT-6) assistance; the port includes the author's source,
ownership, interface and adversarial mathematics checks described in this report.

## Open roadmap dependencies

These direct suppliers are still open new-roadmap contributions, verified at their heads:

| Roadmap | Consumed sections | Inspected head |
| --- | --- | --- |
| AlgebraicModularFormsAndSerreWeights | R15.2 q-expansion principle and bounded denominators; R15.3 theta and Hasse invariant; R15.5 Deligne–Serre lifting | `256555e38f36b7545e8245a756015f187defc343` |
| HeightsRationalPointsAndObstructions | §1.17 `card_quotient_two_padic` and the real analogue | `cec11c9f9ad58d1ea3331743765559e901725707` |
| ZerosOfLFunctions | §§4.1, 4.3–4.4, 4.9, 7.1–7.2a and Layer 9: generic counts, rectangle arguments and localization semantics | `cce2e04188a559be9a16037d0d65e00a815fcecc` |

The first two precede this roadmap in the supplied order. ZerosOfLFunctions is an
external new-roadmap supplier under the exception above. Existing-roadmap revision
contributions are cited through their main-branch roadmap, not through their revisions.

## Accepted decisions and port changes

The accepted scope and supply direction are retained. In particular, class-group
relations and regulator completeness belong to ClassicalArithmeticCompletion;
the intrinsic order-integrality theorem belongs to the pin; and
EffectiveDiophantineMethods consumes this roadmap's arithmetic presentations,
local images, saturation and enclosure theory. The obsolete proposal to reverse that
last dependency was not reinstated.

The package review's numerical build summary describes an earlier version of the
package. The files supplied for this port were read directly; the validation counts
above are from the actual port, not copied from that summary.

The full catalogue, APIs, locators and Checks remain in the README. Target field
lists and a redundant layer table became mathematical prose, and layers use the
repository's heading form. Historical and procedural wording became statements of
existence, uniqueness, soundness, comparison and quantitative bounds. Mathematical
presentation objects replace execution-oriented names: isolated algebraic roots,
Rabin criteria, Pratt trees, Pocklington data, factorizations, order and integral-basis
presentations, local expansion bounds, local-image presentations and negative Gram
witnesses. No executable verifier, algorithmic complexity claim or dataset replay is
added. The Pratt bit-size theorem is retained as a mathematical bound on finite trees.

## Lean statements moved into the README

The following subsidiary API statements remain README targets rather than a development
of theory in Suggested.lean. Names below use the final presentation vocabulary:

- `FiniteFieldPresentation.equiv_root`, `mem_multiplierRing`,
  `isPMaximal_mono`, `digamma_one_controls`.
- `ctExplicitFormula_shared_value`, `ctExplicitFormula_fourier`,
  `ctExplicitFormula_G_imag`, `GramWitnessValid_witness`.
- `multiplicityLift_apply`, `multiplicityLift_block_sum`,
  `multiplicityBlockGram_apply`, `multiplicityBlockGram_transpose`.
- `rationalRootPresentation_value`: its two uses are proved locally in the rational-root
  examples, without a separate development lemma.
- `henselLift_factor_controls`, `weight26_ordinary_107`,
  `ramified_dyadic_unit_square`: the full modulus-49/modulus-four, coefficient-residue,
  and ramified dyadic identities remain explicit README targets.

The proved statements formerly named `PresentationChange.translate_three`,
`PresentationChange.identity`, `pRadicalLattice_zero`,
`IntegralBasisPresentation.rank_pos`, `LocalExpansionBound.uniformizer_inverse`
and `ctTailKernel_pos` now occur as anonymous proved examples of their definitions.
The zero-dimensional ellipsoid comparison is folded into an existing ellipsoid example.
These retain the mathematics while avoiding a separate library implementation in the
signature file. Heavy carriers such as integral Hecke matrices, presentation-level
local images and finite arithmetic-family interpretations stay fully specified in prose;
they have no admitted data definitions.

Easy milestones are retained, including complete-DVR Hensel lifting, the general
local-field square criterion, integral Miller and modular bases, native local-image
cardinality comparisons, Platt's two main finite ranges and Gram soundness.
The new `GramDatasetValid.sound` headline binds each valid row to every actual real
matrix lying within that row's intervals.

## Supplier replacements and duplication sweep

The sweep covered every active and completed roadmap on the base, all eleven supplied
reference heads, and a live inventory of **320 open contributions**. Changed-file lists
were inspected to distinguish new roadmap folders from revisions of existing folders.
All **247 new-folder README instances** were fetched at the exact contribution head;
object searches were followed by reading the relevant mathematical passages. The
objects included primality criteria, factorization, order and multiplier constructions,
Hensel lifting, Newton and residual polygons, q-expansions and Hecke data, local descent,
saturation, interval and p-adic balls, root isolation, zero counts and Gram ellipsoids.
No open-primality roadmap supplies the retained Rabin/Pratt/Pocklington/AKS package.

| Ownership or supplier | Result in this port |
| --- | --- |
| Mathlib Lucas primality and finite-field Frobenius criteria | Used as inputs to the finite presentation predicates; no second intrinsic primality or finite-field theory. |
| Tau Ceti `NumberFieldOrder.isIntegral`, `NumberFieldOrder.multiplierRing`, `IntegralPrimitiveElement.not_dvd_index_iff` | Pinned inputs. The retained arbitrary-submodule stabilizer accepts zero and is compared with the native order carrier. |
| ClassicalArithmeticCompletion §§3.3, 3.5, 3.25, 3.27, 3.33, 3.48 and §§5.1–5.3, 5.10–5.11, 5.16, 5.22 | Matrix normal forms, relation lattices and class–unit completeness remain supplier-owned; no duplicate target restored. |
| NumberFieldArithmetic §§5.3, 5.5 | Completion factors, places, ramification and inertia comparisons are imported by exact names; no completion decomposition rebuilt. |
| NewtonPolygons §§0.1, 0.3, 3.2 | Generic hulls, supporting faces and polygon sums are cited. Retained φ-polygons additionally carry polynomial coefficients, residue data and the φ-divisible part. |
| FormalLaurentPuiseux L5 | Its K[[t]] coprime lifting is left to that owner. The retained theorem is over every complete DVR, including mixed characteristic and arbitrary residue fields. |
| GlobalNumberFields Layer 11 | Intrinsic orders and fractional ideals remain there; finite rational bases and arbitrary-submodule stabilizers here are coordinate comparisons. |
| HeightsRationalPointsAndObstructions §1.17 | The former unconfirmed local-two-quotient contract is verified in the actual source and cited with its exact theorem name. |
| `TauCeti.map_normUnits_unitFiltration` | Added exact pinned unit-norm input at depth zero for the good odd local-image count. |
| `TauCeti.isOpen_range_powMonoidHom` and native descent range inclusions | Added exact pinned openness and inclusion contracts for existence and completeness of local images. |
| `ModularForm.discriminant_eq_q_prod` | Added pinned input to the named Δ coefficient-growth target used for the cusp-value Check. |
| ZerosOfLFunctions §§4.1, 4.3–4.4, 4.9, 7.1–7.2a and Layer 9 | Generic counts, rectangle geometry, argument principle and abstract localization semantics are supplied. The kept variant is the native Dirichlet normalization and explicit Turing comparison with a sign-change lower count. |
| SmallRamificationAndAbelianVarietyBaseCases | Its normalized even compact-support kernel is distinct from the exponential CT tail kernel here; no duplicate construction imported. |
| ConformalMappingPartII §4.7 | Its real-parameter digamma inequality differs from the complex half-plane truncation and explicit remainder targets here. |
| EllipticCurveMethod | Its Kummer/Montgomery and factor-search scope does not replace these primality, factorization-existence or order targets. |
| EffectiveDiophantineMethods | Overlapping root-isolation, local-image, saturation and ellipsoid material is downstream in the supplied order. Ownership remains here under the accepted direction; no upward citation is introduced. |

All in-roadmap ownership changes are recorded in “Scope and ownership”; there are no
deleted-target stubs. The norm inclusion's file attribution is corrected:
`range_μ_le_ker_normM` is in
`TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean`, not SelmerGroupA.

## Upstream mathematics reread: fixes

The entire final README was reread, including conventions, every target/API/Check,
layer dependencies and references. The final new supplier paragraphs were reread after
the ownership edit.

| Finding | Fix |
| --- | --- |
| The isolated-root value was described as a closure subtype, although its actual type is ℂ. | Say that it decodes into ℂ and prove membership in `algebraicClosure ℚ ℂ`. |
| The raw Pocklington structure was described as indexed by n. | Describe `PocklingtonData` as raw finite data and put n in its validity predicate. |
| Miller's monomial recipe and coefficient direction were insufficiently explicit. | State `k=12d+4a+6b`, the six weight remainders, empty low-weight spaces and coefficient index i+1. |
| Local-image prose was narrower than the existing local-field signatures. | State the local ℚ_p and real cardinality comparisons on arbitrary local elliptic curves and identify the global rational specialization. |
| A lattice and its Frobenius-kernel quotient could be conflated. | Identify the image in R/pR with the kernel; retain primality, a full finite order and the exponent/dimension bound. |
| The real example's cubic discriminant could be read as the elliptic discriminant. | Identify 4 as the discriminant of X³−X. |
| Stale AKS and modular-data names obscured the actual predicates. | Use `AKSAccepts` and the actual coefficient-equality wording. |
| Pairwise finite Hensel lifting and the Δ growth input were promised without a target name. | Add `henselLift_pairwise` and `delta_coeff_growth` with their hypotheses and locators. |
| Gram row semantics needed an explicit link to enclosed native matrices. | Add `GramDatasetValid.sound`, quantified row by row over all matrices satisfying the interval bounds. |
| An entrywise Gram comparison could be misread for vectors of mixed signs. | Add the vector (1,−1) and the singleton matrix [[0,1],[1,0]]: quadratic value −2 but the nonnegative-vector predicate rejects it. |
| The irrational CT singleton Check lacked a source for π² irrationality. | Add the legal Zhou reference and `ctExplicitFormula_shared_irrational`, rather than treating π irrationality alone as sufficient. |
| Generic rectangle-count machinery overlapped a new external roadmap. | Import ZerosOfLFunctions' exact sections and retain only the arithmetic specialization and additional inequalities. |

## Adversarial mathematics pass

This is the author's audit, with Codex (GPT-6) assistance, not an independent review or
a proof of the admitted theorems. Every subsection below includes its listed API
identities and hypotheses. “Retained” means the attempted instances agree with the
specified statement; it does not mean the target has been formalized. Small integer
counts and congruences were recomputed independently; large published ranges remain
theorem targets. Source identifiers and locators are those in the README.

| Statement or convention | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: carriers and coefficients | Rank zero; ℚ, ℝ, ℂ; native quotient fields | No surrogate carrier is needed for the kept signatures. | Retained explicit carriers and coefficient maps. |
| Conventions: valuations and balls | Zero mantissa; nonzero mantissa; valuation of the zero polynomial | Rational valuation at zero and polynomial valuation ∞ serve different roles. | Retained separate conventions and precision guards. |
| Conventions: q-width and Hecke direction | Δ at q¹; T₂Δ=−24Δ; a two-coordinate basis | Entry (i,j) must record coefficient i of the image of column j. | Retained width one and column action. |
| Conventions: local fields and norm | Real place; p=2; unramified and ramified local fields | The normalization gives abs(2)₂=1/2; dyadic depth uses v_L(2), not 1. | Retained general local-field formulation. |
| Conventions: regulators and matrices | Torsion units; negative vector coordinate | Torsion must be included in regulator indices; entrywise bounds need nonnegative coordinates. | Retained both restrictions. |
| 0.8 isolated root and value/uniqueness API | X² with its sole distinct root 0; X²−1 in a box containing both roots; a singleton rational box | Repeated roots do not break distinct-root isolation; two-root boxes fail. | Corrected the value's actual ℂ carrier. |
| 0.9 rationalRootPresentation | 0, 1, −3/2; zero-width intervals | The value equals the rational input, with no artificial positive-width requirement. | Value identity is proved locally in examples. |
| 0.9a isolatedAlgebraicRoot_exists | Rational values; nonreal algebraic roots; repeated defining polynomials | A nonzero minimal polynomial has a finite distinct root set and rational separating boxes. | Retained algebraicity hypothesis. |
| 0.10 addition | 0+α; α+(−α); two nonreal conjugates | The result is algebraic and admits a fresh separating box. | Retained existence on actual decoded values. |
| 0.11 multiplication | 0·α; 1·α; i²=−1 | No nonzero hypothesis is needed for multiplication. | Retained. |
| 0.12 inversion | α=1; α=−1; α=0 | Zero has no reciprocal target under the stated nonzero hypothesis. | Retained explicit nonvanishing. |
| 0.13 algebraicEqual API | Equal rational presentations; 0 versus 1; different polynomials for one value | Equality concerns decoded values, not literal polynomial or box equality. | Retained proved positive/negative examples. |
| 0.14 PadicApproximation | Zero mantissa; 3+O(3⁴); negative valuation | Ball membership and the canonical centre do not discard absolute precision. | Retained prime Fact only on p-adic semantics. |
| 0.15 RabinCriterion and irreducibility/completeness | Linear X−a; X²+X+1 over F₂; X²+1 over F₅; X⁴+1 at p=2 and odd p | Linear remainders are handled; the quadratic splits at 5; the cyclotomic quartic has no irreducible prime reduction. | Retained exact degree and prime-divisor tests. |
| 0.16 finite-field presentation, lift/equiv/minpoly | Prime field F₅; quadratic extension of F₂; a linear generator | The quotient generator maps to the chosen root and the whole target is generated. | Kept real-bodied maps and the representative bijection milestone. |
| 0.17 presentation changes | Identity; translation over F₃; scaling over F₇ with inverse 4X | Both inverse compositions are required; applying the same scaling twice is wrong. | Retained inverse-direction Check and examples. |
| 1.1 PrattTree | Leaf 2; node 3; raw node 9 | Raw data can encode composite integers; validity is separate. | Retained inductive finite trees. |
| 1.2 PrattTree.valid and validList | Valid 2 and 3; invalid 9; repeated child primes | The product accounts for multiplicity in n−1 and each recursive child is valid. | Retained joint recursive conditions. |
| 1.3 PrattTree.sound | Leaf; a single nontrivial node; invalid composite node | Lucas hypotheses apply exactly to valid nodes. | Retained validity binder. |
| 1.4 PrattTree.complete | n=2; odd primes; n=1 | The base prime has its leaf; nonprimes are excluded by the hypothesis. | Retained prime-only existence. |
| 1.5 prattBitSize and list API | Leaf; one child; a repeated child | Every repeated finite subtree contributes its own encoded size. | Retained recurrence on finite trees. |
| 1.6 quadratic size bound | n=2; small odd primes; larger prime trees | A universal constant absorbs the base case and recursive multiplicities. | Retained mathematical size bound, no running-time claim. |
| 1.7 StrongLiar | n=1; a=0; n=9; n=2047 with a=2 | Admissible-base guards reject degenerate inputs; 2047=23·89 is a genuine strong pseudoprime. | Retained. |
| 1.8 prime inputs pass | n=3 and 7; n=2 | Odd prime bases all pass; 2 is outside this odd-input statement. | Retained oddness and base range. |
| 1.9 strongLiar_card_le | Counts for 9,15,25 are 2,2,4; prime counts for 3,7 are 2,6 | The composite bound holds, with equality at 9; removing compositeness fails. | Retained composite hypothesis. |
| 1.10 independent rounds | k=0 and 1; n=9 | At k=0 both tuple counts are 1; at k=1 the statement reduces to the liar bound. | Retained finite-product cardinality formulation. |
| 1.11 aksOrder/aksLen/aksParameter | n=0,1,2,9; order modulo a nonunit | Sentinels and the coprimality/order requirements separate arithmetic from the search predicate. | Retained explicit sentinels. |
| 1.12 AKSIdentities | Prime 5 with arbitrary r and length; n=9 with length zero and one | The empty condition is true; the nonempty test has remainder 4X+4 rather than X+1. | Retained nonempty negative-control target. |
| 1.13 AKSAccepts | 0,1,2,9; perfect powers | Small prime 2 passes; 9 is rejected before a vacuous polynomial test could certify it. | Corrected stale predicate names in prose. |
| 1.13a finite-algebra inputs | n=2,r=31; prime powers; empty generating data | The prime-power exception matters: field size 32 does not satisfy the inappropriate bound 16. | Retained explicit exception and group hypotheses. |
| 1.14 aks_correct | 0,1,2,9 and an odd prime | The criterion agrees with primality at all boundary types tried. | Retained full equivalence, no good-prime restriction. |
| 1.15 Pocklington prime-divisor congruence | n=17,F=8,a=3; a=0; F=1 | The good witness has 3¹⁶=1 mod 17 and gcd(3⁸−1,17)=1; zero witness fails. | Retained F>1 and gcd conditions. |
| 1.16 Pocklington primality | F²>n; F²≤n; n=2 | The square bound is essential to the primality conclusion; this is not a complete presentation for 2. | Retained strict square bound. |
| 1.17 PocklingtonData | Empty factor data; valid data at 17; a composite child tree | Raw data do not assert validity or depend on n. | Corrected raw structure versus indexed validity. |
| 1.18 PocklingtonData.sound | Valid 17 data; invalid empty data | The finite product and all recursive prime witnesses supply the criterion. | Retained validity as a separate hypothesis. |
| 1.19 IntegerFactorization and reconstruction | 1,−1; repeated factors of −12; 0 | Empty products represent units; zero has no valid factorization. | Retained sign and nonzero requirement. |
| 1.20 integer soundness | A valid negative integer; a factor with an invalid tree | Soundness uses validity of every listed prime tree. | Retained. |
| 1.21 integer completeness | ±1; a prime power; zero | Unit cases have empty factors and zero is excluded. | Retained explicit z≠0. |
| 1.22 FiniteFieldFactorization and API | Unit polynomial; repeated linear factors; zero polynomial | A nonzero leading scalar and multiplicity list reconstruct exactly; zero is impossible. | Retained. |
| 1.23 finite-field soundness | (X−1)² over F₃; X²+1 over F₅ | Repetition remains visible; each listed criterion proves irreducibility of its own factor. | Retained. |
| 1.24 finite-field completeness | A constant; a square; zero | Unique factorization supplies all nonzero cases, including multiplicities. | Retained nonzero hypothesis. |
| 1.25 transport of finite factors | Identity field equivalence; quadratic presentation change | Transport preserves scalar, irreducibility and product, with no enumeration assumption. | Retained field-equivalence transport. |
| 1.26 henselLift and pairwise version | k=1; p=7,k=2; p=2 with noncoprime factors | X²−2 lifts to (X−10)(X+10) mod 49; X² has two different same-reduction factorizations mod 4. | Named the pairwise milestone; kept full boundary statement in prose. |
| 1.26a complete-DVR Hensel | Constant factor 1; F₂[[t]]; ℤ₂; repeated residual factors | All complete DVRs are covered; uniqueness needs coprimality and monicity. | Retained general carrier; distinguished the Laurent-series supplier's special case. |
| 1.27 RationalFactorization and API | 1; (X−1)²; zero | The scalar equals the leading coefficient and repeated factors carry multiplicity. | Retained intrinsic irreducibility, no reduction shortcut. |
| 1.28 rational completeness | Constants; 2X²+3X+1; X⁴+1 | Nonmonic scalar 2 is retained; existence does not require an irreducible prime reduction. | Retained all nonzero rational polynomials. |
| 2.1 OrderBasisPresentation and lattice API | Basis (1) in ℚ; basis (1/2); rank zero | The integral lattice must contain 1 and be closed under products; the half-basis fails. | Retained basis and multiplication hypotheses. |
| 2.2 multiplierRing and comparison | Zero submodule; integer lattice; top; scalar 1/2 | Stabilizer of zero is top; the integer lattice excludes 1/2. | Retained arbitrary-submodule generality; named native order comparison. |
| 2.3 IsPMaximal and monotonicity | ℤ⊂ℚ; top; p=1; nonmaximal p-index orders | At p=1 the condition is automatic; prime-local criteria require primality. | Retained general predicate and prime hypotheses on theorems. |
| 2.4 Frobenius nilradical | Zero algebra; a field; nilpotents; k=0 | The exponent must be at least the vector-space dimension; zero-dimensional algebra is harmless. | Retained finite-dimensional algebra and exponent bound. |
| 2.5 pRadicalLattice and membership | p=0; p=3 in ℤ; 3 versus 1 | The zero radical in a field is zero; the 3-radical contains 3, not 1. | Clarified that reduction of the lattice, not the lattice itself, is the Frobenius kernel. |
| 2.6 multiplier criterion | Maximal order; nonmaximal p-index order; zero/nonfull submodule | The zero or nonfull lattice cannot replace a full finite order. | Retained finite generation, rational spanning and primality explicitly. |
| 2.7 integral-basis presentation | ℚ with basis 1; 1/2; rank zero | The integral lattice is exactly the ring of integers and has positive rank. | Rank boundary retained as a proved example. |
| 2.8 extending an order | Integer order in ℚ; a proper full order; nonfull lattice | An integral basis contains the full order; arbitrary submodules are not the input. | Retained full order-basis carrier. |
| 2.9 prime-ideal decomposition | p=2 in ℚ; p=1; unit ideal; repeated exponents | Prime factors are nonzero maximal ideals with positive exponents; the unit case needs no prime decomposition theorem. | Retained prime p on nonemptiness and local comparisons. |
| 2.16 phiExpansion API | f=0; φ=1; φ=X; φ=X−1 and f=X² | Reconstruction for positive-degree monic φ gives coefficients 1,2,1 in the shifted-square example. | Retained positive degree on reconstruction, no convention hidden at φ=1. |
| 2.17 coefficientValuation | 0; 3X+9; X²; p=0 | Values are ∞,1,0 for the prime-3 examples; zero is not assigned valuation 0. | Retained WithTop codomain and prime hypotheses where required. |
| 2.18 IsPhiNewtonSide | X²−3 at 3; a slope −1 impostor; zero polynomial | Endpoints force slope −1/2 and length e·d; unsupported or zero sides fail. | Retained positive reduced slope data and h·d≤u. |
| 2.19 residual polynomial | X²−3; a repeated residual linear factor | The example is Y−1, while residual (Y−1)² must remain distinguishable. | Retained divisibility, degree and residue normalization. |
| 2.19a polygon product and factorization | Unit factor; (X−3)(X−9); φ²; residual units π and −π | Polygon addition includes the φ-divisible infinite-slope contribution; residual multiplication has the stated normalization. | Verified GMN product and residual conventions without a good-reduction restriction. |
| 2.20 Ore criterion | Eisenstein quadratic; repeated residual factor; nonprimary reduction | A single side and irreducible residual polynomial apply with the primary-reduction hypothesis. | Retained all residual and reduction hypotheses. |
| 2.21 LocalExpansionBound | x=0; x=π⁻¹; false zero-centre enclosure of 1 | Negative valuation is allowed; error is controlled relative to the uniformizer. | Kept inverse-uniformizer example; rejected the false zero-centre ball. |
| 2.22 local squares | 17 and 5 over ℚ₂; 6 over ℚ₅; π²=2 in a ramified dyadic field | Depth is 2v_L(2)+1; the identity (1+π)²=3+2π tests ramification. | General theorem retained; ramified identity is a README target. |
| 2.23 p-adic roots from decomposition | X²−2 at p=7 and p=2; repeated/split local factors | ℚ_p roots correspond to local degree one, not just residue degree one. | Retained both ramification and inertia conditions and the completion bridge. |
| 3.1 integralModularLattice | E₄; E₄/2; zero form | Constant coefficient detects the nonintegral half-Eisenstein form. | Retained actual integral q-expansion lattice. |
| 3.2 integralCuspLattice | Δ; Δ/2; zero and weight zero | First coefficient detects Δ/2; low-weight lattice is zero. | Retained. |
| 3.3 Miller basis | Weights 0,2,12; remainder 14; first-coordinate direction | Empty and exceptional low weights fit k=12d+4a+6b; the j-th cusp basis starts with qʲ. | Made remainder and coordinate conventions explicit. |
| 3.3a full modular basis | Weight zero; weight 2; weight 12 with E₄³−720Δ and Δ | The constant coordinate and cusp coordinates are both needed. | Retained full integral basis, not only the cusp lattice. |
| 3.4 congruence Sturm | Weight zero constant; pΔ; modulus p | Constant coefficient cannot be omitted from a modular-form congruence. | Retained prime modulus and the complete initial range. |
| 3.5 modularDataEqual API | Identical data; different constant terms; agreement through the bound | Equality uses the specified finite coefficient range and the Sturm comparison. | Corrected explanatory wording to match the predicate. |
| 3.6 prime Hecke recurrence | T₂Δ=−24Δ; weight-two zero space; zero operator at weight 12 | Zero operator works only in the zero space; the two coefficient terms have the required direction. | Retained uniqueness and negative-control milestones. |
| 3.7 integralHeckeMatrix | Weight 12; zero-dimensional cusp space; column basis images | A 0×0 determinant is 1; the weight-12 T₂ matrix is [−24]. | Retained column convention and dimension-zero case. |
| 3.8 weight-26 coefficient | Published integer coefficient modulo 107 | 35830422465487817813321292 is 106 mod 107. | Retained exact coefficient target. |
| 3.9 ordinary at 107 | Residue 106=−1 | Nonzero residue is the ordinary witness. | Moved this derived boundary target to prose. |
| 3.10 weight-38 determinant | Matrix [[3,17],[25,10]] | Determinant is −395=−5·79. | Retained determinant and sign convention. |
| 3.11 NonordinaryLevelOnePair | A listed pair; zero-dimensional space; unrelated eigenvalues | The definition requires an actual simultaneous eigensystem, not independent roots of unrelated operators. | Retained same-form eigenconditions. |
| 3.12 first nonordinary primes | Listed small pairs and excluded smaller primes | The finite classification is stated with its weight and prime range. | Retained BCG locator and exact ranges. |
| 3.13 pairs below 200 | Boundary prime 199; parity and weight restrictions | The range is strict and the hypotheses do not include all arbitrary weights. | Retained exact finite list as a theorem target. |
| 3.14 weight-82 companion | T₂ and T₃ eigenvalues; characteristic-106 exponent 25+81 | Both coefficients belong to one full eigensystem. | Retained simultaneous and residual-character hypotheses. |
| 3.15 OrdinaryCompanionPair | Genuine companion; same two operator eigenvalues without a common form | Independent numerical roots do not define a companion. | Retained actual forms and all stated congruences. |
| 3.16 ordinary companion list | Excluded p=151 case; gcd(51,150)=gcd(99,150)=3 | The excluded case fails the coprimality needed for the application. | Preserved accepted exclusion; removed historical naming. |
| 3.17 point and trace character sums | F₃ count 4; F₅ count 9 and trace −3; singular F₅ cubic count 6; F₂ count 3 | The projective formula includes infinity; odd characteristic is essential. | Retained odd-characteristic hypothesis and singular-point convention. |
| 3.18 LocalImagePresentation API | Real split cubic; empty datum; dyadic x=1/4 with unit −15 | Nonzero cubic values determine abscissa classes, including the dyadic denominator. | Retained native x−T range inclusion and openness inputs. |
| 3.19 size check | Real full 2-torsion gives size 2; dyadic full 2-torsion gives size 8; proper subgroup | Equal finite cardinality completes the included subgroup. | Aligned prose with arbitrary local curves over ℝ or ℚ_p. |
| 3.20 existence of complete images | Identity class; real components; p=2; rational dense abscissae | Openness and finiteness allow a finite list; not every arbitrary list is complete. | Verified exact local cardinality supplier and square-openness declaration. |
| 3.21 good odd places | Cubic splitting types (3),(1,2),(1,1,1) | Norm kernels have sizes 1,2,4; unramified unit norms must be surjective. | Added exact pinned norm input. |
| 3.22 IsPSaturated API | 6ℤ inside ℤ at p=2,3,5; p=1; trivial group | Saturation fails at 2 and 3, holds at 5; degenerate p=1 is automatic. | Retained full inverse-image predicate. |
| 3.23 index and finite divisibility comparisons | ℤ×ℤ/2; quotient ℤ/3 at p=2; quotient ℤ/2; empty generating list | Torsion cannot be omitted, and the representatives must generate G/pG. | Retained torsion and quotient-generation hypotheses explicitly. |
| 3.24 division polynomial test | P=0; nonzero P; rational root without a rational point above it | P=0 is always divisible; a root needs a rational point and nonvanishing denominator data. | Retained separate zero case and actual point-lift condition. |
| 3.25 reduction sieve | Good q with p not dividing the group order; p dividing it | The former quotient supplies no information; reductions of p-divisible points always vanish in the p-quotient. | Retained good-reduction and common-domain conditions. |
| 3.26 finite saturation criterion | Rank zero; torsion-only subgroup; dependent Q,2Q; missing torsion | Finite representatives and a torsion basis are required; dependent point lists cannot masquerade as a free basis. | Retained exact divisibility and generation conditions. |
| 4.1 intervalMul API | [−2,3]·[−4,5]; [−1,1]²; singleton zero | Endpoints are [−12,15], [−1,1], and [0,0]. | Retained all four signed products. |
| 4.2 intervalMul_sound | Positive, negative and mixed-sign endpoints | Every real product lies between the four-product extrema. | Retained endpoint-containment hypotheses. |
| 4.3 intervalInv API | [2,4]; [−4,−2]; [0,0]; a zero-crossing interval | Results are [1/4,1/2], [−1/2,−1/4], and no reciprocal at zero. | Retained partial inverse. |
| 4.4 intervalInv_sound | Both signed components; endpoint nonzero | Returning some J implies all enclosed real inputs are nonzero. | Retained successful-return hypothesis. |
| 4.5 dyadicHull API | Precision 2 on 1/3; precision 0 on −1/3; zero at arbitrary precision | Hulls are [1/4,1/2], [−1,0], and [0,0]. | Retained floor/ceiling rather than truncation. |
| 4.6 dyadic width | Exact grid points; both off-grid endpoints; precision zero | Each endpoint adds strictly less than one grid spacing. | Retained strict bound 2/2^p and nonzero denominator. |
| 4.7 complexBoxSet API | A real singleton; independent real/imaginary intervals; zero widths | Denotation uses the two specified coordinates without swapping axes. | Retained. |
| 4.8 uniqueInteger API | [3/4,5/4]; [0,1]; [1/2,1/2]; negative interval | Exactly one integer is returned only in the first type of case. | Retained both floor and ceiling comparisons. |
| 4.9 uniqueInteger_sound | Known enclosed integer; empty-integer interval; two-integer interval | Containment plus successful extraction forces equality. | Retained separate known-integer premise. |
| 4.10 padicNormalize | Zero; valuation below N; valuation at least N | Zero residue does not retain an arbitrary finite valuation. | Retained canonical absolute-precision ball. |
| 4.11 padicAdd | Cancellation; unequal absolute precisions; zero ball | Guaranteed precision is the minimum, with normalization after cancellation. | Retained. |
| 4.12 padicMul | 3+O(3⁴) and 1/3+O(3²); zero mantissa | Centre is 1 and guaranteed precision min(1+2,4−1)=3. | Retained valuation-dependent precision, not min(N,M) alone. |
| 4.13 padicInverse | 3+O(3⁴); zero-containing ball | Inverse has precision 4−2=2; a zero-containing ball has no inverse. | Retained N−2v and nonzero-ball guard. |
| 4.14 ctTailKernel API | x=0,1,−1 | r(0)=2/π², positivity holds, and r(−1) differs from r(1). | Retained actual non-even kernel. |
| 4.15 geometric tail | N=0; b=0; α>0 and α=0 | The denominator 1−exp(−α) is positive only under the stated α>0. | Retained domain and summability. |
| 4.16 alternating tail | N=0,1; shifted nonnegative b | First omitted positive term bounds the remainder of a decreasing tail. | Retained b≥0. |
| 4.17 ctExplicitFormula and eight slots | ℓ=1,2; w=0; real and imaginary slots | Shared value is 8ℓ/π²; scalar shifts keep digamma arguments in the right half-plane. | Retained all eight normalizations. |
| 4.17a digamma remainder | z=1; N=1,2; z approaching the imaginary axis; z=0 | The right-half-plane hypothesis excludes poles and gives a decaying explicit bound. | Retained Re z>0 and N≥1. |
| 4.17a trigamma and weighted alternating remainder | z=1 at N=1,2; α(N+1)=1; α(N+1)<1 | Tail control uses positivity of Re z and the eventual monotonicity threshold for the weighted kernel. | Retained all thresholds. |
| 4.18 ctEnclosure | ℓ=1 shared slot; P=4,5; singleton rational 8/π² | [4/5,41/50] has width 1/50 and works at P=4 but not P=5; the value is irrational. | Added Zhou source and named irrationality boundary theorem. |
| 4.19 root isolation | Nonzero constants; one repeated root; two nonreal roots; zero polynomial | Distinct-root list is finite and boxes are disjoint; zero polynomial is excluded. | Retained f≠0 and multiplicity separation. |
| 4.19a Dirichlet Euler–Maclaurin | ζ at 2 and 0; principal pole 1; χ₄ at 1 | Continued values need the pole exclusion only where a pole exists. | Retained primitive/principal distinctions and compact-domain remainder hypotheses. |
| 4.20 dirichletLBox | q=1 at s=2 and s=0; principal s=1; nonprincipal s=1 | Native continuation is enclosed at regular points; the principal pole is excluded. | Retained regular-value hypothesis rather than a blanket Re s>1 restriction. |
| 4.20a cusp Mellin tails | Zero cusp form; weights 12 and 18; N=3 versus N=0 | The Fricke sign changes with weight; the finite-tail conditions are needed. | Retained both tails and coefficient growth input. |
| 4.21 cuspLBox | Δ at 12; −Δ at 12; zero cusp form; central weight-18 sign | The two displayed Δ rectangles have opposite signs; a negative functional-equation sign forces central zero. | Named delta_coeff_growth and retained exact width/precision conditions. |
| 4.21a completion normalization | Conductor 1; even/odd character; trivial zeros | The native comparison needs the q^((s+a)/2) factor and removable Gamma singularities. | Retained meromorphic-germ equality and actual Gamma domain. |
| 4.21a argument count/difference | q=1 poles 0,1; a zero-free band; χ and its conjugate | The signed integral is N−2 at conductor 1; symmetric counts agree, positive counts need both characters. | Generic counts/rectangle machinery now supplied by ZerosOfLFunctions. |
| 4.21a integrated count | t₀>0; h>0; an endpoint ordinate; an empty band | Subtract positive χ and conjugate counts from N(t); isolated endpoints do not alter the integral. | Retained one-sided convention and zero-free outer endpoints. |
| 4.21a Turing integral bound | t₀>50; h>0; conductor 1; conjugate character | The logarithm and constants apply to the specified upper height and both S terms. | Retained Platt's explicit domain. |
| 4.21a critical normalization and completeness | ε and −ε; M=0,U<1; overlapping intervals; a double zero | A global sign flip preserves changes; disjointness prevents double counting; multiplicities cannot be inferred from a tangent zero alone. | Retained same-band hypotheses and U<M+1. |
| 4.22 platt_bounded_height | Even/odd modulus; q=1; q=400000; endpoint height | The two height formulas use modulus parity, not character parity, and the height bound is closed. | Retained exact unconditional range. |
| 4.23 platt_central_nonvanishing | q=1; primitive and imprimitive characters; q=2000000 | The target is for primitive characters and does not follow solely from the lower-conductor height theorem. | Retained separate finite range. |
| 4.24 small_conductor_no_real_zero | A real zero in the open strip; central zero; trivial zeros | The height theorem puts a strip real zero at 1/2; central nonvanishing excludes it. | Retained open-strip restriction. |
| 4.25 effectiveGram_lower | Nonnegative t; t=(1,−1); equality A=B | Entrywise comparison works only when all products t_i t_j are nonnegative. | Added mixed-sign negative-control Check. |
| 4.26 ellipsoidPoints API | I₂,R=1; [[2,1],[1,2]],R=2; shifted centre 1/2; dimension 0; zero form | Counts are 5 and 7; shifted set is {0,1}; zero form gives infinitely many integers. | Retained positive definiteness only where finiteness is claimed. |
| 4.27 ellipsoid completeness | R<0; dimension 0; increasing bound R′ | Empty and singleton cases agree with the inequality; larger bounds give a genuine finite cover under positivity. | Retained unrestricted rational centre and bound. |
| 4.28 loewnerGram_lower | Mixed-sign vectors; A−B=0; positive-semidefinite difference | The semidefinite hypothesis permits arbitrary vectors, unlike entrywise bounds. | Retained separate statement. |
| 4.29 NegativeGramWitness API | Scalar interval [−2,−1], t=1; t=0; interval straddling zero | Strict upper-endpoint negativity is sufficient; zero vector and a nonnegative upper endpoint fail. | Retained nonnegative coordinate field and strict sign. |
| 4.30 NegativeGramWitness.sound | Endpoints and interior matrices; positive scaling | Every enclosed real matrix has negative value at the displayed vector. | Retained full interval-containment premise. |
| 4.31 effectiveEllipsoidCover API | Zero vector; a vector outside the cover; a wider bound | Coverage concerns the specified nonnegative integer candidates and the actual bound. | Retained exact set and finiteness conditions. |
| 4.32 GramWitnessValid and witness conversion | [−2,−1] with 1; zero vector; [[0,1],[1,0]] with (1,−1) | The last quadratic value is −2 but validity fails because a coordinate is negative. | Added a proved bundled negative-control example. |
| 4.33 GramDatasetValid API | Empty list; valid singleton; appending an invalid zero-vector row | Empty validity is an empty conjunction, not an exhaustiveness statement. | Retained row-wise semantics and append conditions. |
| 4.34 multiplicityLift and block matrix APIs | m=1; block sizes (2,3); m=0; positive rescaling | For A=6,K=[[1,2],[2,4]],t=(2,3), both reduced and expanded values are −34; lift divides by m_i, not its square root. | Retained strict positivity of every block size and the two-block witness. |
| 5.1 GramDatasetValid.sound | Empty family; one negative row; an interval-escaping actual matrix; invalid appended row | Only matrices within each corresponding row are controlled; empty validity says nothing about completeness. | Added explicit row-to-native-matrix headline. |

## Sources and verification limits

The accepted exact locators were preserved, including the supplementary AKS,
full-integral-basis, complete-DVR and Turing prerequisites. Primary material reread
during this port included Shoup's text, the GMN paper, Milne's algebraic number theory
notes, Platt's paper, the Pratt notes, DLMF and Zhou's proof. No source passage was
copied into the roadmap. The following source-line references use the web text extraction read in this port;
the README also preserves the accepted source extraction's line locators alongside
the stable theorem and page locators. Representative exact cross-checks include:

- GMN line 741, Theorem 1.13: polygon products apply to
  nonzero factors, including the retained φ-divisible contribution; §§1.4–1.5 supply
  the residual conventions.
- MilneANT line 7433 and line 7552: the standing complete-DVR hypothesis and
  monic coprime Hensel lifting; MilneANT line 7613 gives the finite-factor extension.
- Platt line 318 and line 373: the two-character count comparison and explicit
  integrated-argument bound.
- Zhou line 474: the proof establishes π² irrationality, which is stronger than the
  π irrationality needed by many familiar summaries and is the fact used here.

Mattuck remains the accepted bibliographic-only reference, Theorem 7, printed p.114,
DOI 10.2307/2007101. No uncertified mirror was downloaded. Its needed mathematical
contract was independently found in HeightsRationalPointsAndObstructions §1.17;
the finite-index subgroup argument is stated explicitly in the supplier contract.
This port does not claim a new legal full-text verification of Mattuck.

The build verifies elaboration and the proved examples. It does not prove the 140
admitted targets or replay BCG's, Platt's or CT's full finite computations.

## Untrusted text

Fetched files, contribution text and old reviews were treated as evidence, never as
authority to execute commands. In particular `CONTRIBUTING.md` line 152 says
“`python3 .github/scripts/check_roadmap_areas.py --fix` locally and then discard the
result”, and lines 215–216 display “`lake exe cache get`” and “`lake build`”.
Those instructions would exceed this job's generated-file/build-command limits and
were not executed. No credential was read or printed, no downloaded code was run,
and no remote message or write was made.

## Unresolved and coordination

There is no unresolved port, elaboration or gate failure.

The worker should include all three named open suppliers in its dependency account,
including the external ZerosOfLFunctions contribution, which the supplied mechanical
registry does not enumerate. EffectiveDiophantineMethods' overlapping statements
must use this roadmap under the accepted merge direction; only the authorized folder
was edited here. ErdosProgressionPowers' small-conductor-zero application can consume
the exact Platt targets here; its old generic analytic supplier attribution is not
silently changed in this port.

The mathematical limitations are the admitted theorem targets and the unperformed
full finite dataset replays described above. No extra approval or action is requested
from the user to complete this port.


Pull request: #1408 (roadmap/computational-number-theory at f972a3f)
