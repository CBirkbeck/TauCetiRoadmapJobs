# Port report: EllipticCurveModularityPartII

Branch: `roadmap/elliptic-curve-modularity-part-ii`.
Head commit: `3c47aeb25c5668dfcbc6535d42e8be7f946fe3de`.
Base: `ae2562c` (the initial checkout was clean).

The commit adds exactly `TauCetiRoadmap/EllipticCurveModularityPartII/README.md`, `TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean` and `TauCetiRoadmap/EllipticCurveModularityPartII/metadata.toml`. The top-level roadmap list, pins, infrastructure, suppliers and merge-order file are unchanged. No push, pull-request write, issue write or comment was made. The package files were read as data; only this requested report was added to its reports directory.

## Draft pull request body

Develops effective residual comparisons for elliptic curves over ℚ, continuing the modularity roadmap with Martin’s sharp newspace bounds, Kraus’s square-root rationality thresholds and exact-conductor comparison curves, integral ideal-congruence Sturm theory, and uniform irreducibility with rational two-torsion. The final layer develops the five-level Cartan and winding arguments for integral j-invariants and Lemos’s surjectivity theorem for curves with a nontrivial rational cyclic isogeny. These comparisons provide reusable arithmetic inputs for Diophantine applications.

AI-assisted port and self-review by Codex (GPT-6).

## Validation

Build command: `lake build TauCetiRoadmap.EllipticCurveModularityPartII.Suggested`.
Exit status: **0**.
Exact outcome line:

```text
Build completed successfully (9233 jobs).
```

Warning count: **10**, all exactly `declaration uses sorry`; zero errors and zero other warnings. The ten warnings belong to the ten headline theorems. `Suggested.lean` and `metadata.toml` are byte-for-byte equal to the accepted package, so no later content edit invalidates this build. There are 21 declarations: ten admitted theorems and eleven supporting declarations with real bodies. Metadata is exactly `topic = "math.NT"`.

Gate summary:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate counts staged files as dirty. Its pre-commit invocation had every content, import, scope and dependency counter zero and only `dirty=3`; the clean-tree invocation is the final result above. An initial ownership sentence in Scope mentioning the downstream progression roadmap was parsed as a supplier edge. That downstream citation now lives only in Downstream consumers; the final check has neither an upward edge nor a cycle. No tooling or merge-order file was edited.

Exact dependency-check output, using the supplied order and `--movable`:

```text
depcheck: 40 roadmaps, 410 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line in this final output.

Citation resolution against `ae2562c` and the indexed open heads reports no cross-roadmap citations found nowhere and no Lean names found nowhere. Its external-library scan is unavailable, so the pinned-library checks below were done independently. `git diff --check` passes, and the commit contains no outside-folder path.

## Still-open roadmap dependencies

The dependencies adding new roadmap folders are:

- ArithmeticGaloisRepresentations.
- AutomorphicGaloisRepresentations.
- ComputationalNumberTheory.
- EisensteinIdealAndRationalTorsion.
- EllipticCurveModularity.
- EulerSystemsAndKolyvaginSystems.
- HeightsRationalPointsAndObstructions.
- ModularCurvesPartII.
- ModularSymbolsPadicLFunctions.
- NeronModelsAndSemistableAbelianVarieties.
- SerreWeightAndLevelOptimisation.
- WeightsInEtaleCohomology.

EllipticCurves, ModularForms, ModularCurves, StableReduction, JacobianChallenge and Chebotarev are consumed as they stand on main, including where an open pull request revises them. ErdosProgressionPowers is a consumer, not a dependency. The name EllipticModularityEffectiveComparisons occurs only in the downstream explanation of that consumer’s requested interface.

## Mathematical and editorial fixes

1. Consolidated the two descriptions of each sharp threshold into one definition with its complete API, three Checks, hypotheses, source and needs. All formulae, strict inequalities, the dimension-zero explanation, the lcm warning and the level-11 comparisons survive. Scope and ownership records this consolidation; no mathematical target was deleted.
2. Replaced proposed supplier section titles with verified section locators, distinguishing actual supplier targets from the accepted required extensions. Residual elliptic conductors now cite NeronModelsAndSemistableAbelianVarieties §5.3h, rather than attributing that specialization to the generic representation roadmap. Absolute irreducibility cites ArithmeticGaloisRepresentations §4.1; Dickson/Serre cites §§4.4–4.5; newform residual representations cite AutomorphicGaloisRepresentations §6.2.
3. Replaced the generic purity promise by the existing all-embedding Ramanujan target of WeightsInEtaleCohomology R34.5–R34.6. Its `newform_ramanujan` statement and normalized geometric realization were read. This replaces an owner-level missing specialization with the actual supplier, without rebuilding purity.
4. Replaced the missing cotangent section with NeronModelsAndSemistableAbelianVarieties §6.4d, retaining the connected-kernel, semistability, free-cokernel and strict ramification hypotheses. The general full-torsion specialization requirement is preserved; HeightsRationalPointsAndObstructions §1.18 supplies its good-reduction specialization, which suffices at the primes used here.
5. Added the missing parent modularity input to the removed-prime proof’s Needs, and made the modularity input of optimized/deletion-level supplier contracts explicit. This agrees with SerreWeightAndLevelOptimisation §§6.2–6.3, whose deletion-level result requires a modularity witness for E.
6. Distinguished the absolute winding class, whose boundary is zero, from its endpoint divisor in the Jacobian. With `D=α_*((0)−(∞))`, the upward path’s divisor maps to `−D`, not D. The new order-11 Check computes `−D=10D`. This also avoids the sign slip in the source’s identification of the endpoint divisor.
7. Pinned the width-p differential in the formal-immersion comparison: `ω_f=2πi f(z)dz=p·f(t)dt/t` for `t=exp(2πiz/p)`. For `f=t+2t²`, p=11, this is `(11+22t)dt`, with cusp value `11dt` modulo 23. The factor is a unit in the stated residue characteristics, so the formal-immersion argument and all Lean headline signatures retain their mathematics. The standing convention and the Layer 6 comparison now use the same normalization.
8. The coordinate existence clause of §6.15 is consumed from the explicit supplier contract; its local target is the integral-j iff in the specified coordinate. Its converse is explicit: an integer t dividing the constant term makes `f_r(t)/t` integral. The supplied Chen map is likewise used, with the local target retaining the genus-zero old-part vanishing argument.
9. Strengthened the small-definition Checks with plausible wrong values: the exceptional local-factor signs; exponent-zero priority; R₄ versus R₂; p+1−a versus p+1+a; cubing the wrong numerator factor; signed versus positive divisors; and set versus multiset cardinality. In particular t=8 and t=−64 both give j=1728, so 26 signed divisors give 25 distinct level-2 values.
10. Made the Martin link select v1 explicitly, retained all exact theorem/page locators, and removed source-certification process prose from the mathematical README. The uncertified Kenku source remains identified below, with no claim of reading its paywalled text.

No mathematical theorem hypothesis or conclusion in `Suggested.lean` changed. The accepted decisions retained include the sharp square-root thresholds, ℓ≥5 in the full-two theorem, ℓ≥11 in the single-two-point theorem, the full containment range of j-integrality without non-CM, arbitrary ideals and weights in integral Sturm, and the stated ownership of the remaining supplier extensions.

## Lean-to-README movement

**None during this port.** The accepted package already contains only headline theorems and the simple real-bodied definitions needed to state them. Its filters, thresholds, candidate sets, APIs and numerical examples were already README targets and Checks. No admitted example, sorry-defined datum, API lemma, `set_option` or extra Mathlib submodule import was carried into the target.

## Ownership and duplication sweep

The sweep used `roadmaps list`, `roadmaps grep` by mathematical object, and `roadmaps show` for the supplying heads, in addition to reading main, Completed and the board’s packages. Both README and Lean were searched in all **38** supplied sibling heads. Searches covered Martin dimensions, sharp/numerical Kraus thresholds, norm and removed-prime inequalities, two-torsion and cyclic kernels, rational isogenies, all-embedding eigenvalue bounds, Cartan algebras/correspondences, winding quotients, integral Sturm, cusp torsion and semistable cotangents. Index matches were read before use. No helper agents were used.

The models read include Completed/Multiquadratic and Completed/ContourIntegration, together with the relevant ModularForms and Chebotarev layers. The completion narratives of the models were not copied into the new roadmap.

- The general old/new, all-Hecke, coefficient-field, Atkin–Lehner and Galois-conjugation work stays with ModularForms Layers 3, 4, 6, 8 and 8G; the arithmetic dimension expression and sharp bound here are its newform-dimension application. No second newspace or character-space carrier is created.
- ComputationalNumberTheory §3.4 owns level-one prime-modulus congruence Sturm. The target here retains arbitrary positive level, character, number field and ideal, including weight zero and coefficient zero. Its overlap at that specialization is recorded in Scope and ownership.
- The generic modular curve, Cartan level, Jacobian, Hecke map, modular quotient and Abel–Jacobi constructions are consumed by section. The local targets retain the exact-divisor differential comparison, genus-zero old-part vanishing and five-level winding/formal-immersion arguments. Duplicate construction wording was changed to consumption, with the boundary recorded in Scope and ownership.
- Pinned torsion, scalar extension, isogeny degree/kernel/base change, coefficient fields, ramification groups and finite locally free group schemes are consumed directly. The simple torsion/Cartan/isogeny predicates serve the native headline signatures and do not constitute competing general carriers.
- ErdosProgressionPowers “Required effective modular comparisons” EC.0–EC.5 requests the same general comparisons under EllipticModularityEffectiveComparisons. Its progression targets are downstream and its no-square-root functions are numerical majorants. Ownership remains here, as in the accepted decision; no upward supplier import or rename of an outside folder was introduced. The alias mismatch remains a coordination item below.
- The wild local mod-5 Cartan calculations in EllipticCurveModularityWild3Adic concern local wild inertia and do not supply the global p>37 image theorem here. The remaining supplied heads add no competing owner for this six-layer effective comparison package.

No own declaration has another readable roadmap’s fully qualified name. No supplier theorem was copied into Lean. Searches for relevant Mathlib open work and Zulip discussions were made; no new construction or source reuse is based on an unrelated search result. Pinned APIs determine the formal vocabulary.

## Pinned API and binder audit

Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The actual dependency checkouts match these manifest revisions.

The native definitions were read at those pins. Selected exact bodies and their boundaries:

| Native object | Pinned repository-relative file and line | What was checked |
| --- | --- | --- |
| Torsion | `.lake/packages/mathlib/Mathlib/Algebra/Module/Torsion/Basic.lean:972` | `torsionBy := (Submodule.torsionBy ℤ A n).toAddSubgroup`; killed-by-n points, no finiteness or rank assertion at n=0. Its ZMod module is line 1010, `AddCommGroup.zmodModule torsionBy.nsmul`. |
| Irreducibility | `.lake/packages/mathlib/Mathlib/RepresentationTheory/Irreducible.lean:29` | `IsIrreducible := IsSimpleOrder (Subrepresentation ρ)` includes nontriviality; zero torsion at n=1 is not irreducible. |
| Newspace | `.lake/packages/TauCeti/TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean:202` | Γ₁(N) newspace, the Petersson orthogonal complement of oldforms. The trivial-character intersection is essential. |
| Character spaces | `.lake/packages/TauCeti/TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:279` and line 315 | The bodies are simultaneous diamond eigenspaces, not free function carriers. |
| Newform | `.lake/packages/TauCeti/TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104` | Extends EigenformAwayFromLevel; `isNew` is line 106 and `isNorm : (qExpansion 1 toCuspForm).coeff 1 = 1` is line 108. All-Hecke and bad-prime arithmetic are theorems consumed separately. |
| Galois action | `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:64` | `toFun e := Multiplicative.ofAdd ((Affine.Point.mapEquiv W e).torsionByCongr N)`; line 85 gives coordinate agreement. Composition is σ after τ. |
| Linear adapter | `.lake/packages/mathlib/Mathlib/Algebra/Module/ZMod.lean:81` | `AddMonoidHom.toZModLinearMap` keeps the additive function. |
| Scalar extension | `.lake/packages/TauCeti/TauCeti/RepresentationTheory/BaseChange.lean:100` | `Representation.baseChange` composes the action with Module.End base change on the tensor-product carrier. |
| Isogeny degree | `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean:99` | `Module.finrank φ.fieldPullback.fieldRange W₁.FunctionField`; positive degree is not a freely assigned natural. |
| Isogeny kernel | `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Kernel.lean:75` | Translation-fixing subgroup of the pulled-back function field; geometric kernel is taken after actual base change. |
| Endomorphism identity | `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Basic.lean:325` | `one := id W₁`, with composition multiplication; Hom/Add provides its additive structure and integer multiples. |
| Norm product/count | `.lake/packages/mathlib/Mathlib/RingTheory/Norm/Transitivity.lean:261` and `.lake/packages/mathlib/Mathlib/FieldTheory/PrimitiveElement.lean:360` | Product over all embeddings and exactly d embeddings, with finite separability; NumberField supplies the required setting. |
| Characteristic-zero Sturm | `.lake/packages/TauCeti/TauCeti/NumberTheory/ModularForms/SturmBound.lean:102` | Actual strict cusp width, finite relative index and discrete periods; coefficient zero is included. It is not an ideal-congruence theorem. |
| j-invariant | `.lake/packages/mathlib/Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:388` | Native c₄³/Δ expression; headline predicates retain IsElliptic. |
| Perfectness | `.lake/packages/mathlib/Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804` | `Matrix.SL2.commutator_eq_top` requires a≠0 and a²≠1; at p=5 use a=2. |
| Coefficient field | `.lake/packages/TauCeti/TauCeti/NumberTheory/ModularForms/Newforms/Fields.lean:48` and `NumberField.lean:157` in the same directory | Native coefficient field and number-field theorem with weight at least two. |
| Generic ramification/group schemes | `.lake/packages/TauCeti/TauCeti/RingTheory/Ideal/RamificationGroup.lean:60` and `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:131` | Generic carriers exist; they do not by themselves define elliptic conductors or Serre weight. |

A scratch file with `#check @name` for **every one of the 21 declarations** was elaborated once after the port, exit **0**. Every elaborated type was compared with its README statement and the supplied signature record. No binder was lost, and no declaration changed. The following table records all comparisons:

| Declaration | Required retained context and README match |
| --- | --- |
| localTerms | Natural p,e, Fin 5 → ℚ; totalization exactly §1.1. |
| martinValue | ℕ → ℚ; N=0 convention exactly §1.2. |
| newDimension | N and `[NeZero N]`; native trivial-character finrank, §1.3. |
| dimension_comparison | N and `[NeZero N]`; equality in ℚ, §1.3. |
| martin_bound | N and `[NeZero N]`; bound and both directions of equality criterion, §1.4. |
| norm_bound | Field/NumberField K, prime ℓ, nonzero prime ideal contracting to (ℓ), nonzero x in it, every embedding bound; no B≥1, §2.1. |
| rationality_of_small_prime_coefficients | Nonzero level, normalized native newform, trivial character and prime test through inclusive `6*q≤μ`; conclusion every coefficient integral, §3.1. |
| integral_sturm_congruence | Nonzero level, natural weight, character, NumberField/embedding, arbitrary ideal, actual form and all-index coefficient binding, inclusive bound and coefficient zero, §4.2. |
| GeometricTorsion | Elliptic rational E, natural n; points over ℚ̄, §5.1. |
| torsionModule | Same ellipticity and n; Module (ZMod n) on that subgroup, §5.1. |
| torsionRepresentation | Same context; actual geometric action on that ZMod module, §5.1. |
| FullRationalTwo | Ellipticity; rational killed-by-two cardinality four, §5.1. |
| RationalTwo | Ellipticity; nonzero rational point killed by two, §5.1. |
| full_two_irreducible | Ellipticity, prime ℓ via Fact, ℓ≥5, full rational two-torsion; native and scalar-extended irreducibility, §5.4. |
| rational_two_irreducible | Ellipticity, prime ℓ via Fact, ℓ≥11, rational nonzero two-point; both irreducibility assertions, §5.5. |
| NonCM | Ellipticity; all geometric endomorphisms are integer scalars, §6.1. |
| HasCyclicIsogeny | Elliptic source/target, actual isogeny, degree n and cyclic kernel over ℚ̄, §6.1. |
| ImageInNonsplitCartanNormalizer | Ellipticity and prime p; field subring of cardinality p² normalized by the actual action, §6.1. |
| nonsplit_of_not_surjective | Ellipticity, geometric NonCM, prime p>37, failure of surjectivity of the pinned action, §6.10. |
| lemos_integral_j | Ellipticity, r in the five-prime set, actual cyclic r-isogeny, prime p outside the set, containment; no non-CM hypothesis, §6.11. |
| lemos_surjectivity | Ellipticity, geometric NonCM, actual cyclic isogeny degree n>1, prime p>37; full additive automorphism image, §6.18. |

The missing-carrier docstring is retained: removed-prime/Kraus realization needs elliptic arithmetic and residual conductors and Serre weight; Cartan correspondence, winding and formal immersion need the actual modular curves, modular Jacobians/Hecke quotients and canonical integral models. Searches at the pins did not find these as completed native interfaces. No weakened headline, free predicate standing for missing theory or admitted data was introduced.

## Source verification

Seven legal PDFs were fetched and their SHA-256 hashes matched `packages/EllipticCurveModularityPartII/sources.toml`: Kraus1997, BS2020, Mazur1978, DarmonMerel2001, Martin2003, Lemos2017 and BPR2013. Locators below refer to text extracted from those exact editions; the README retains stable theorem and page locators. Statements are paraphrases, not copied passages.

| Source | Read locators supporting the port |
| --- | --- |
| Kraus1997 | line 178: standing modularity/irreducibility/weight hypotheses, including the ℓ≥11 local alternative; line 281: finite-prime rationality; line 358: two-isogeny repair; line 1018: arbitrary-weight/ideal Sturm; line 1040: filtered criterion; line 1065: local filters. |
| Martin2003 | line 63: arithmetic dimension formula; lines 71, 73, 75, 79: all local factors; line 105: sharp bound and equality; §4 proof at preprint pp.14–16. |
| BS2020 | line 159: deletion level; line 172: weight-two lift; lines 179–205: removed-prime congruence and norm bound; §3, pp.361–363: two-torsion isogeny arguments. The valuation is an exponent, notwithstanding the source’s prime-power wording. |
| Mazur1978 | line 31: prime-degree theorem; line 57 and following proof: exceptional-image cutoff; line 344: exact cotangent theorem and following characteristic-two boundary; line 957: prime-isogeny input. |
| Lemos2017 | line 38: final theorem; line 99: j-integrality away from p; lines 126 and 131: containment integrality and potentially good reduction; line 209: proper-image classification; lines 329 and 333: Chen isogeny and five-level quotient; §2 j tables and §3 proof at pp.5–10. The incorrect rank-zero-J₀(37) explanation is not used. |
| DarmonMerel2001 | line 484: exact-order-p divisor; line 552: winding quotient; line 616: full-new nonvanishing; lines 634–640: endpoint sign versus divisor order; line 679: characteristic-q cotangent argument; line 710: torsion descent. |
| BPR2013 | line 49: Theorem 1.1; p≥11, p≠13, exponent>1. Only the mathematical rational-point theorem is consumed. |
| Kenku1982 | Published pp.199–201 only. This remains the accepted uncertified source; no paywalled text was read or represented as verified. |

## Unresolved items retained from the accepted design

These are not passed off as supplied declarations or proofs:

- ArithmeticGaloisRepresentations: the exact ℓ≥11 weight-two/reduction converse and the quantitative p>17 elliptic exceptional-image exclusion.
- ModularCurvesPartII: the five normalized genus-zero coordinates; exhaustive j-images at 11,17,37; the BPR rational-point theorem; the mixed Chen isogeny. The supplying geometric carriers and related sections exist, but these exact additions are requirements, not invented existing sections.
- ModularSymbolsPadicLFunctions: the saturated integral winding-quotient/cotangent comparison and the full cuspidal-divisor torsion consequence. Its rational Drinfeld–Manin splitting alone is not an integral substitute.
- EulerSystemsAndKolyvaginSystems: unconditional finite rational points for every modular abelian factor with nonzero central L-value, with no coefficient-degree restriction. The generic conditional Euler-system bounds alone do not supply this.
- EisensteinIdealAndRationalTorsion: all cyclic isogeny degrees and the non-CM prime-degree list. Its §§7.8 and 8.9 explicitly distinguish rational invariant vectors from stable lines, so the rational-torsion exclusion is not substituted for either classification.
- NeronModelsAndSemistableAbelianVarieties: general full-torsion specialization under e<q−1. The actual good-reduction specialization used here is supplied by HeightsRationalPointsAndObstructions §1.18.
- The generic comparison supplier name requested in ErdosProgressionPowers is EllipticModularityEffectiveComparisons; that board entry contains a design but no accepted README/Lean folder. This port remains EllipticCurveModularityPartII as instructed. Reconciling the consumer’s name is outside the authorized folder, and no later roadmap is consumed to hide the mismatch.
- Kenku’s paywalled source and the complete uniform exceptional-prime proofs for every finite j-value were not independently reproved. The latter are explicit universal theorem targets, not claims established by sampled Frobenius data.

The accepted decisions assigning these extensions to their earlier owners are preserved. No outside supplier was edited, no unsupported supplier declaration was imported, and no new source request or permission request was opened.

## Adversarial mathematics pass

The following **178** rows give computed boundary/wrong-model values for the retained definitions, API laws, targets, conventions and supplier requirements. Exact rational computations compare Martin’s formula with the independent Γ₀ genus formula followed by old/new convolution inversion at every level 1…1500. Signed-divisor arithmetic gives all five candidate sets. Exhaustive finite group computations find 86 constrained modulo-four subgroups, including 19 with an odd upper-right entry, and verify their selection conclusion; a separate enumeration gives the order-240 normalizer in GL₂(𝔽₁₁). Small field point counts, signs, degree conditions and normalization calculations are included.

These are adversarial instances and source/hypothesis checks, not proofs of the admitted universal theorems. No computational algorithm is made a roadmap deliverable.

| Statement | Instances tried | Values computed / both sides | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 localTerms definition and prime-power branch | p=0, e=0 | ['1', '1', '1', '1', '1'] | Pass | Retained; tests exponent-zero priority, small primes, signs and totalization. |
| §1.1 localTerms definition and prime-power branch | p=0, e=1 | ['0', '0', '0', '0', '0'] | Pass | Retained; tests exponent-zero priority, small primes, signs and totalization. |
| §1.1 localTerms definition and prime-power branch | p=1, e=1 | ['0', '0', '0', '0', '0'] | Pass | Retained; tests exponent-zero priority, small primes, signs and totalization. |
| §1.1 localTerms definition and prime-power branch | p=4, e=2 | ['0', '0', '0', '0', '0'] | Pass | Retained; tests exponent-zero priority, small primes, signs and totalization. |
| §1.1 localTerms definition and prime-power branch | p=2, e=2 | ['1/4', '0', '-1', '1', '0'] | Pass | Retained; tests exponent-zero priority, small primes, signs and totalization. |
| §1.1 localTerms definition and prime-power branch | p=3, e=2 | ['5/9', '1', '1', '-1', '0'] | Pass | Retained; tests exponent-zero priority, small primes, signs and totalization. |
| §1.1 localTerms definition and prime-power branch | p=2, e=3 | ['3/8', '0', '1', '0', '0'] | Pass | Retained; tests exponent-zero priority, small primes, signs and totalization. |
| §1.1 localTerms definition and prime-power branch | p=2, e=4 | ['3/8', '1', '0', '0', '0'] | Pass | Retained; tests exponent-zero priority, small primes, signs and totalization. |
| §1.1 localTerms definition and prime-power branch | p=5, e=2 | ['19/25', '3', '-1', '1', '0'] | Pass | Retained; tests exponent-zero priority, small primes, signs and totalization. |
| §1.1 localTerms definition and prime-power branch | p=7, e=2 | ['41/49', '5', '1', '-1', '0'] | Pass | Retained; tests exponent-zero priority, small primes, signs and totalization. |
| §1.1 API: identity at exponent zero | p=0,1,2,3,4 | each vector=(1,1,1,1,1) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.1 API: nonprime positive exponent | p=0,1,4; e=1,2 | each vector=(0,0,0,0,0) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.1 API: prime table | p=2,e=4; p=5,e=2; p=7,e=2 | {'(2, 4)': ['3/8', '1', '0', '0', '0'], '(5, 2)': ['19/25', '3', '-1', '1', '0'], '(7, 2)': ['41/49', '5', '1', '-1', '0']} | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.2 martinValue definition and zero convention | N=0,1,11,30,35 | {0: 0, 1: 0, 11: 1, 30: 1, 35: 3} | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.2 API: empty product at level one | N=1 | 1/12−1/2−1/4−1/3+1=0; five empty products=1 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.2 API: five products | N=35 | T=(24/35,0,0,0,1); 35·(24/35)/12+1=3 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.3 newDimension, dimension_comparison, finrank API | N=1…1500 | Martin formula equals independent Γ₀ genus/old-new inversion at all 1500 levels; values {0: 0, 1: 0, 2: 0, 4: 0, 11: 1, 12: 0, 13: 0, 16: 0, 23: 2, 25: 0, 27: 1, 30: 1, 35: 3, 37: 2, 47: 4, 49: 1, 64: 1, 121: 4} | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.3 trivial-character intersection | N=13 | Γ₀ new dimension=0; Γ₁(13) genus=1+(13²−1)/24−(13−1)/2=2 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.4 martin_bound inequality and equality, both directions | N=1…1500 | 12g≤N+1 at every tested N; equality iff N=35 or prime N≡11 mod12; N=30:12<31; N=35:36=36 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §§1.5–1.7 sharpF, sharpG, sharpH definitions | N=1 | μ=1; μ(lcm(N,4))=6; (F,G,H)=(1,4,4) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §§1.5–1.7 sharpF, sharpG, sharpH definitions | N=2 | μ=3; μ(lcm(N,4))=6; (F,G,H)=(1,4,4) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §§1.5–1.7 sharpF, sharpG, sharpH definitions | N=3 | μ=4; μ(lcm(N,4))=24; (F,G,H)=(1,9,9) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §§1.5–1.7 sharpF, sharpG, sharpH definitions | N=4 | μ=6; μ(lcm(N,4))=6; (F,G,H)=(1,4,4) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §§1.5–1.7 sharpF, sharpG, sharpH definitions | N=11 | μ=12; μ(lcm(N,4))=72; (F,G,H)=(5.82842712,19.9282032,19.9282032) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §§1.5–1.7 sharpF, sharpG, sharpH definitions | N=35 | μ=48; μ(lcm(N,4))=288; (F,G,H)=(3148.63492,62.8564065,3148.63492) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.5 API: F formula, ≥1, dimension zero | N=1,4,11 | F(1)=F(4)=1; F(11)=3+2√2≈5.82842712>1 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.6 API: G formula, ≥1, 4∣N | N=1,4,11 | G(1)=G(4)=4; μ(4)=6; G(11)=13+4√3≈19.9282032 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.7 API: maximum, projections and strict iff | N=11, real bound 10 and 20 | H<10=False=(F<10 ∧ G<10); H<20=True=(F<20 ∧ G<20); F≈5.828≤H≈19.928=G | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.8 sharp/numerical majorant comparison | N=1 | F♯=1≤F_K=1; G♯=4≤G_K=4; H♯=4≤H_K=4 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.8 sharp/numerical majorant comparison | N=2 | F♯=1≤F_K=1; G♯=4≤G_K=4; H♯=4≤H_K=4 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.8 sharp/numerical majorant comparison | N=3 | F♯=1≤F_K=1; G♯=9≤G_K=25; H♯=9≤H_K=25 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.8 sharp/numerical majorant comparison | N=4 | F♯=1≤F_K=1; G♯=4≤G_K=4; H♯=4≤H_K=4 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.8 sharp/numerical majorant comparison | N=11 | F♯=5.82842712≤F_K=9; G♯=19.9282032≤G_K=169; H♯=19.9282032≤H_K=169 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §2.1 norm_bound lower and upper bounds | K=ℚ, x=5, λ=(5), B=5 | 5≤∣5∣≤5¹; all values=5 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §2.1 ramified norm input | K=ℚ(i), x=1+i, λ=(1+i), ℓ=2, B=√2 | Norm=2; 2≤2≤(√2)²=2 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §2.1 unramified norm input | K=ℚ(i), x=3, λ=(3), ℓ=3, B=3 | Norm=9; 3≤9≤3²=9 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §2.1 rejected zero and unit-ideal inputs | x=0 or λ=O_K | ∣Norm(0)∣=0<ℓ; unit-ideal contraction=ℤ≠(ℓ) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §2.2 removed-prime bound and nonzero norm element | p=2, M₀=11 | 3−2√2≈0.1715728752538097 >0; exponent=12/6=2; bound=(√2+1)²≈5.82842712474619; 7 exceeds it | Pass | Retained; boundary probe, not a proof of the universal target. |
| §3.1 rationality_of_small_prime_coefficients | N=11; normalized rational newform | μ/6=2; prime test set={2}; (a₁,a₂,a₃,a₄)=(1,−2,−1,2); recurrence a₄=a₂²−2=2 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §3.2 integrality estimate, bad-prime split | N=11,q=2, g=1; q∣N separately | q=2<5.82842712=F♯; bad prime coefficient∈{0,1,−1}; good bound 2√2≈2.828<3 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §3.3 exact-conductor rational realization | N=1 versus N=11, ℓ=7 | g⁺(1)=0 gives no primitive weight-two form; F♯(11)≈5.828<7; realization remains conditional on irreducibility, weight and conductor | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.1 krausLocalFilters branch | (p,e,a)=(2,0,3) | ([1, -3, 2], [1]) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.1 krausLocalFilters branch | (p,e,a)=(2,1,3) | ([1, -3], [1]) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.1 krausLocalFilters branch | (p,e,a)=(2,2,0) | ([1], [1]) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.1 krausLocalFilters branch | (p,e,a)=(3,0,2) | ([1], [1]) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.1 krausLocalFilters branch | (p,e,a)=(3,1,-1) | ([1], [1, -5]) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.1 krausLocalFilters branch | (p,e,a)=(3,2,0) | ([1], [1, -4, 3]) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.1 API: constant coefficients and functoriality | (p,e,a)=(3,1,−1), reduction mod5 | (V,V′)=(1,1−5X)→(1,1); both constant coefficients=1 in ℤ and 𝔽₅ | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.1 API over the zero ring | R=0, all six branches | 1=0 and every polynomial=0; each constant coefficient is still 1_R=0_R | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.2 integral_sturm_congruence coefficient zero | N=1,k=0,J=(2), f=1 | bound=0; a₀=1∉(2); deleting n=0 would make a false premise true | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.2 inclusive Sturm endpoint | N=1,k=12,J=(2),f=Δ | 12·1=12; a₀=0∈(2), a₁=1∉(2) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.2 arbitrary ideal, zero/unit/composite | J=(0),(1),(6) | 6∈(6), 2∉(6); every integer∈(1); only 0∈(0); modulus4:2∉(4),4∈(4) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.3 filtered congruence at bad primes | odd q=3, a_q=1 or −1 | (q+1)(a_q−1)=0 or −8, both 0 mod4 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.3 finite recognition level | N=11, L=44 | μ(44)/6=12; primes q≤12, q∤22 are {3,5,7} | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.4 point-count transfer trace gap | N=11, largest tested q=7 | 4√7≈10.583005244258363<G♯≈19.9282032; removed gap 8−2√7≈2.7084973778708186 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.5 finite matrix-selection theorem | all subgroups of constrained GL₂(ℤ/4) | ∣GL₂∣=96, allowed elements=24, subgroups=86, with an odd upper-right entry=19; all have every lower-left entry 0 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.5 subgroup closure negative control | A=[[1,1],[0,1]], B=[[1,0],[2,1]] | det(1−A)=0, det(1−B)=0, AB=(3, 1, 2, 1), det(1−AB)=2 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.5 Chebotarev conjugacy-class convention | G=S₃ | identity=1/6, transpositions=3/6, 3-cycles=2/6; all positive | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.6 isogeny repair and torsion transport | degree1 and degree2; ℓ=2,3,5 | gcd(2,3)=gcd(2,5)=1, but gcd(2,2)=2; identity degree1 preserves every torsion group | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.7 full-two realization strict maximum | N=11, ℓ=19 or23 | F♯≈5.828; H♯≈19.928; 19>F♯ but 19<H♯; 23>H♯; both auxiliary requirements are needed | Pass | Retained; boundary probe, not a proof of the universal target. |
| §4.8 deletion-level adapter | M=33, v₃Δ=6,v₁₁Δ=2,ℓ=3; M=45, v₃Δ=v₅Δ=7,ℓ=7 | first M₀=11; second M₀=9 retains v₃M=2; residual conductor prime to ℓ whereas additive coefficient-prime exponent is retained | Pass | Retained; boundary probe, not a proof of the universal target. |
| §5.1 GeometricTorsion API and degenerate n | n=0,1,2 over ℚ̄ | 0P=0 for every P; 1P=0 iff P=0; ∣E[1]∣=1, ∣E[2]∣=4 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §5.1 torsionModule API | n=2, nonzero P killed by2 | 3P=P, 0P=0, 2P=0; on n=1 only P=0; ZMod0=ℤ on all geometric points | Pass | Retained; boundary probe, not a proof of the universal target. |
| §5.1 torsionRepresentation identity/composition API | E:y²=x³−2; root labels 0,1,2 | σ labels [1,2,0]; τ labels [0,2,1]; (στ)0=1, (τσ)0=2; identity labels [0,1,2] | Pass | Retained; boundary probe, not a proof of the universal target. |
| §5.1 FullRationalTwo definition and API | cubics x³−x,x³−2x,x³+x+1 | rational two-torsion cardinalities 4,2,1; FullRationalTwo=True,False,False; geometric cardinality always4 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §5.1 RationalTwo definition and API | same three curves | nonzero rational two-point counts3,1,0; RationalTwo=True,True,False; identity does not qualify | Pass | Retained; boundary probe, not a proof of the universal target. |
| §5.1 rational-isomorphism invariance API | x=4x′,y=8y′ on y²=x³−x | new roots 0,±1/4; rational two-torsion cardinality4=4; identity preserved | Pass | Retained; boundary probe, not a proof of the universal target. |
| §5.2 composite-degree exclusions | ℓ=3,5,7,11 | 4ℓ=12,20,28,44; only12 in degree list; 2·7=14 allowed,2·11=22 excluded | Pass | Retained; boundary probe, not a proof of the universal target. |
| §5.3 invariant-line kernel construction | C₂×C₅ versus C₂×C₂ | order of(1,1) in C₂×C₅=lcm(2,5)=10=card; maximum order in C₂²=2<card4; intermediate dual-isogeny construction required for cyclic4 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §5.4 full_two_irreducible and absolute assertion | full two-torsion; ℓ=5,7; oddness at5 | forbidden degrees20,28; c=diag(1,−1) over𝔽₅ has det4=−1 and distinct eigenvalues1,4 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §5.5 rational_two_irreducible and cutoff | ℓ=7,11 | 2ℓ=14 allowed,22 excluded; prime7 counterexample available from cyclic14 locus; prime11 conclusion uses22 exclusion | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.1 NonCM definition and API | j=1728,0,−122023936/161051 | [i]²=[−1] and [ζ₃]³=1 are noninteger geometric endomorphisms; last j is nonintegral and excludes CM; End_ℚ alone misses[i] | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.1 HasCyclicIsogeny definition and API | id, quotient by rational two-point, [2] | degrees1,2,4; geometric kernels have cardinalities1,2,4 and maximum element orders1,2,2; [2] kernel fails cyclicity | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.1 prime-divisor passage API | cyclic n=14 kernel | unique subgroup of order7 is stable; quotient degree7; identity degree1 has no prime divisor | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.1 ImageInNonsplitCartanNormalizer definition | p=11, s²=2, C=𝔽₁₁[s] | ∣C∣=121, ∣Cˣ∣=120, ∣N(Cˣ)∣=240, ∣GL₂∣=13200 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.1 Cartan API: basis independence and unit equivalence | C and conjugation by diag(2,1) | conjugate generator=(0, 4, 6, 0); conjugate algebra still cardinality121, units120; zero fixed | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.1 Cartan API: cyclic subgroup characterization | p=11 | cyclic Cartan order120; split semisimple order divides10; nonsimple Jordan order divides110; neither reaches120 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.1 Cartan wrong models | scalar algebra, split diagonal algebra | card scalar=11≠121; split card121 but diag(1,0)diag(0,1)=0; split normalizer200∤240 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.2 potentially-good reduction obstruction | p=5 and p=3; residue primes2,11 | at p5 cyclotomic value2 has square4≠1; at p3 all unit squares=1; 2²=4≠1 mod5 while11²=1 mod5 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.3 exact divisor and normalized differential | r=5,p=11 versus r=p=5 | N=605,Q=121,gcd(Q,N/Q)=1, normalization 11⁰=1; at125,Q25,gcd25,5=5 fails | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.4 Cartan old-part vanishing scope | r=1,2,3,5,7,13 versus r=11 | g(X₀r)=0 at six stated levels; g(X₀11)=1, so a nonzero old source is possible | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.5 winding definition and oriented normalized period | f=q and f=q+2q² | W=i/(2π),i/π; 2πiW=−1,−2; upward path reversed gives+1,+2 | Pass | Clarified normalization and separated absolute homology from endpoint divisor. |
| §6.5 winding API: annihilator and quotient extremes | e=0; I=0 or I=T | Ann(0)=T, hence quotient0; I=0 gives J; I=T gives0; nonzero projection needs a theorem | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.5 winding nonvanishing negative control | f=q−2q² | frequency integrals1 and−1 sum0; W=0 and normalized period0 despite f≠0 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.5 boundary sign and order | r=2,p=11; D=α_*((0)−(∞)) | upward endpoint=−D=10D; order11=11; absolute H₁ boundary0 | Pass | Made map source, divisor sign and absolute/relative distinction explicit. |
| §6.5 small-prime boundary failure | p=3 | excluded divisor order1; PSL₂(𝔽₃)=A₄ has cyclic quotient order3 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.6 specified nonzero optimal rank-zero quotient | zero quotient and ideal extremes | A=0 gives dimension0, Cot₀A=0; I=T gives0 while I=0 givesJ; nonzero condition excludes it | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.7 coefficient support and characteristic restriction | r in five-level set; q>13 | genus0 gives dim H⁰(Ω¹)=0; a hypothetical descended nonzero differential contradicts0; q=23 avoids r,p | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.7 cotangent exactness and connected-kernel hypothesis | J=B×A with dimB=dimA=1; [23] on elliptic curve | quotient exact cotangent ranks1→2→1 with cokernel free rank1; isogeny [23] has cokernel𝔽₂₃ and reduction map0 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.7 explicit two-term formal-cusp normalization | p=11,q=23,f=t+2t² | ω=(11+22t)dt; cusp11dt≠0; df=(1+4t)dt; normalized scaled coefficients11,22 | Pass | Added cusp-width factor and computed Check. |
| §6.7 good residue primes and strict ramification | p=11,17; q=23,67; also q=2 | first q≡±1 modp are23,67; 1<22,1<66; at2,1<1 false | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.8 formal immersion on completions | k[[u]]→k[[t]], u↦t versus u↦t² | cotangent scalar1 versus0; first map surjective, second misses coefficient of t | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.8 torsion descent of rational point image | cusp differences killed by m, rational quotient killed by h; m=11,h=5 | 11u descends and5·11u=55u=0; u need not be rational before multiplication | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.9 denominator exclusion and torsion specialization | p=11,q=23,e=1; cusp collision | q modp=1;1<22; torsion reduction0 injects to imply image0; formal parameter u↦t gives coincident section | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.10 nonsplit_of_not_surjective and determinant alternative | p=41 | ∣SL₂∣=41(41²−1)=68880; determinant40; product2755200=∣GL₂∣; proper image cannot containSL₂ | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.10 exceptional/borel/split prime cutoffs | p=17,19,37,41,13 | 19>17,17≯17;41 absent from non-CM degree list;37 included;split exclusion excludes13 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.11 lemos_integral_j including CM | E:y²=x³−x,p=11 | j=1728∈ℤ;11 inert inℚ(i), so containment is compatible withCM | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.11 nonintegral j negative control | 11a model y²+y=x³−x²−10x−20 | j=−2¹²·31³/11⁵=−122023936/161051∉ℤ; small-isogeny and containment cannot both hold | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.12 lemosNumerator definition/API | r=2 | degree=3, leading coefficient=1, constant=4096 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.14 lemosIntegralJ definition/API | r=2 | signed divisors=26, distinct integer quotients=25; range -3375…16974593 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.12 lemosNumerator definition/API | r=3 | degree=4, leading coefficient=1, constant=729 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.14 lemosIntegralJ definition/API | r=3 | signed divisors=14, distinct integer quotients=13; range -368484688…406749952 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.12 lemosNumerator definition/API | r=5 | degree=6, leading coefficient=1, constant=125 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.14 lemosIntegralJ definition/API | r=5 | signed divisors=8, distinct integer quotients=8; range -23788477376…38477541376 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.12 lemosNumerator definition/API | r=7 | degree=8, leading coefficient=1, constant=49 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.14 lemosIntegralJ definition/API | r=7 | signed divisors=6, distinct integer quotients=6; range -371323264041…1168429123449 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.12 lemosNumerator definition/API | r=13 | degree=14, leading coefficient=1, constant=13 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.14 lemosIntegralJ definition/API | r=13 | signed divisors=4, distinct integer quotients=4; range -39091613782464…2045023375454208 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.12 and §6.14 outside-set conventions | r=11 | numerator=zero polynomial, natDegree0, integral-j set empty; signed-divisor routine is not applied to its zero constant | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.13 integral-parameter theorem, both directions | f=(T+16)³; t=−16,8 | j=0,1728; each t∈ℤ and t∣4096; converse uses t∣constant to get t∣f(t) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.13 necessary degree/nonzero hypotheses | f=T+1,t=1/2; t=0 | f(1/2)/(1/2)=3∈ℤ with t∉ℤ; total division at0 gives0 but modular coordinate is excluded | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.15 normalized coordinate and integral-value iff | r=2,t=8; u=2t | f(t)/t=1728, but f(u)/u=32768/16=2048; unmarked coordinate rescaling fails fixed j map | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.15 signed parameters and rational tables | r=13,t=1,−1; level11 | j=2101248,576; full level11 table has3 j values, including−32768; non-CM table has2 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.16 quadratic-twist surjectivity, both directions | p=5, χ=±1 | det(χρ)=χ²detρ=detρ; ∣GL₂(𝔽₅)∣=5·4²·6=480; twisting twice yieldsχ²ρ=ρ | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.16 perfectness convention | p=5,a=2 versus p=3 | 2²=4≠1 mod5; nonzero squares mod3={1}; library perfectness witness unavailable at3 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.17 finite-j exceptional-image theorem negative control | j=1728,p=43 | 43≡3 mod4; CM nonsplit-normalizer order2(43²−1)=3696 < ∣GL₂∣=3337488; non-CM condition excludes it | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.18 lemos_surjectivity and degree/prime boundaries | n=1,2; p=37,41 | 1>1 false,2>1 true;37>37 false,41>37 true; full group at41 has2755200 elements | Pass | Retained; boundary probe, not a proof of the universal target. |
| Supplier contract elliptic-modularity | 11a model at2,3 | point counts{2: 5, 3: 5, 5: 5, 7: 10};a₂=3−5=−2,a₃=4−5=−1 | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract optimized-weight-two-lift | N=1 and11 | g⁺=0 and1; first input has no primitive weight-two lift, second has one rational eigensystem | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract deletion-level-lowering | M=33,Δ valuations6,2,ℓ=3 | M₀=11; coefficient prime3 is removed; Frobenius assertion excludes q=3 | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract elliptic-conductor-and-weight | E11a,ℓ=5 or3 | M=11; actual residual tame conductors1,11; semisimplified conductor not substituted | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract residual-conductor-away-from-ell | q=11,v_qΔ=5;ℓ=5 or3 | multiplicative residual exponents0,1; 5∣5,3∤5 | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract weight-two-reduction-alternative | good, multiplicative divisible, additive coefficient prime | v_ℓM=0,1,≥2; deletion removes first two contributions, retains additive exponent | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract complex-conjugation-on-torsion | odd ℓ=5 versusℓ=2 | diag(1,4) has det4=−1; mod2 eigenvalues1=−1 coincide | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract odd-irreducible-absolutely-irreducible | c=diag(1,−1) at5 | two eigenvalues1,4 and split eigenlines; at2 polynomial(T−1)² lacks distinction | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract dickson-classification | upper unipotents over5; fullGL₂5 | unipotent group order5 fixes a line; full group480 containsSL₂ order120 | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract serre-inertia-exceptional-bound | p=17,19 | strict cutoff:17>17 false,19>17 true; does not replace it by37 | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract newform-residual-representation | N=11,q=2,λ∣5 | X²+2X+2 reduces identically in𝔽₅[X]; determinant2 retained | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract modular-abelian-conductor | d=1,2;N=11 | N^d=11,121; rational elliptic quotient usesd1 | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract coefficient-bound | q=2,c₂=−2 | ∣−2∣=2≤2√2≈2.828; strict gap3−2√2≈0.1716 | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract mixed-modular-curves | r=5,p=11 versusr=p=5 | gcd5,11=1 and good q=23∤330;gcd5,5=5 excludes coprime construction | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract mixed-modular-jacobians | baseX₀(1) versusX₀(11) | Jac dimensions0,1; old-image vanishing only at genus0 | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract newform-quotient | rational form level11, weight2 | dimension1; conductor11; weight12 Δ excluded from this Jacobian-quotient constructor | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract five-level-j-coordinates | r2,t8 and−16 | (8+16)³/8=1728; (−16+16)³/(−16)=0 | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract rational-isogeny-j-tables | levels11,17,37 | cardinalities3,2,2; level11 containsCM j=−32768, leaves2 non-CM | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract split-cartan-rational-points | p=13,41;m=2 | 13 excluded;41 included; split-normalizer curve at41²=1681 | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract chen-isogeny | r=1 or11,p=17 | genus ofX₀r=0 or1; old source dimension0 or1; quotient by p-old is required generally | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract integral-winding-comparison | ω=q+2q²; p-width11 | upward normalized period−2; cusp expansion(t+2t²) yields(11+22t)dt | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract cuspidal-divisor-torsion | D order11 | 11D=0;−D=10D≠D; absolute homology boundary0 | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract modular-rank-zero | dimA=1 or2 with nonzero central values | factor conductorN orN²; finite-group free rank0 in both dimensions; dim1 does not supplydim2 | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract cyclic-isogeny-degrees | degrees14,20,22,28 | 14 in list;20,22,28 not in list; prime-degree list alone tests none of20,22,28 | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract noncm-prime-isogeny-degrees | p=37,41,43 | 37 included;41 absent;43 may occur forCM and is excluded bynon-CM | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract neron-torsion-specialization | good q23,e1; boundary q2,e1 | 1<22 true,1<1 false; torsion reducing to0 is0 at23 | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Supplier contract optimal-quotient-cotangents | split abelian sequence dim1,2,1; multiplication23 | cotangent quotient free rank1 in split sequence; multiplication23 cokernel𝔽₂₃ is torsion and excluded | Pass | Boundary arithmetic agrees; availability is separately recorded in the supplier audit. |
| Conventions: arithmetic Frobenius reciprocal polynomial | E:y²=x³−x over𝔽₅ | #E=8; a₅=−2; det(T−F)=T²+2T+5,det(1−FT)=1+2T+5T² | Pass | Retained; boundary probe, not a proof of the universal target. |
| Conventions: valuation exponent, totalization and zero input | Δ=8,q=2;N=0 | v₂(8)=3≠8; martinValue(0)=0 by definition; newDimension(0) unavailable because NeZero0 is impossible | Pass | Retained; boundary probe, not a proof of the universal target. |
| Conventions: algebraic closure versus rational torsion | E:y²=x³−2x | rational killed-by2 cardinality2; geometric cardinality4; rational generator not required for stable cyclic isogeny kernel | Pass | Retained; boundary probe, not a proof of the universal target. |
| Conventions: width-one and width-p differential | f=q+2q²; p=11 | width1:ω=(1+2q)dq, period−2; width11:ω=(11+22t)dt,cusp11dt | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.3 newDimension definition | N=13 | finrank of Γ₁(13) newspace=2; trivial-character intersection finrank=0 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.5 F♯ formula | N=11 | (√(12/6)+1)²=3+2√2 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.5 F♯ lower bound | N=1,11 | 1≤1 and1≤5.82842712 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.5 F♯ dimension-zero API | N=1,4 | g⁺=0 implies exponent0 and value1 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.6 G♯ formula | N=11 | lcm(11,4)=44;μ44=72;(√12+1)²=13+4√3 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.6 G♯ lower bound | N=1,4 | 1≤4 in both cases | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.6 G♯ at4∣N | N=4 | lcm(4,4)=4;μ4=6;G♯=4 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.7 H♯ definition | N=11 | max(3+2√2,13+4√3)=13+4√3 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.7 F♯≤H♯ API | N=11 | 5.82842712≤19.9282032 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.7 G♯≤H♯ API | N=11 | 19.9282032=19.9282032 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §1.7 H♯ strict-inequality iff | N=11,ℓ=10,20 | False↔(True∧False);True↔(True∧True) | Pass | Retained; boundary probe, not a proof of the universal target. |
| §5.1 torsionRepresentation identity law | root labels ofx³−2 | identity acts0→0,1→1,2→2 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §5.1 torsionRepresentation composition law | σ=(012),τ=(12) | στ sends0→1;τσ sends0→2 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §5.1 torsionRepresentation coordinate agreement | σ(α)=ζα | (α,0) maps(ζα,0)=P₁≠P₀ | Pass | Retained; boundary probe, not a proof of the universal target. |
| §5.1 FullRationalTwo rationality API | y²=x³−x | four geometric two-points are all rational; rational cardinality4 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §5.1 FullRationalTwo impliesRationalTwo | y²=x³−x | rational two-point count4,nonidentity count3>0 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §5.1 two-torsion predicate isomorphism API | x=4x′,y=8y′ | roots−1,0,1 become−1/4,0,1/4;cardinality4→4 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.1 NonCM rational-isomorphism API | 11a curve andrational variable change | j=−122023936/161051 on both models;nonintegral inboth | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.1 HasCyclicIsogeny isomorphism API | rational isomorphism anddegree2 quotient | conjugating source/target preserves degree2 andkernel cardinality2 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.1 HasCyclicIsogeny stable-kernel API | cyclic14 kernel | its stable order2 and7 subgroups haveorders2,7; chosen rationalgenerator notneeded | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.5 winding annihilator API | windingclass0 | Ann(0)=T,associated quotient0 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.5 winding optimal-quotient API | ideals0,T | quotient by0=J;quotient byT=0 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.5 winding cotangent-lattice API | splitJ=B×A,dimB=dimA=1 | pullbackrank1 inrank2;saturatedquotientrank1,so reductionrank1 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.12 monicity API | r=2,3,5,7,13 | leadingcoefficients1,1,1,1,1;degrees3,4,6,8,14 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.12 constant-term API | r=2,3,5,7,13 | constants4096,729,125,49,13 | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.14 membership iff | r=2,j=1728;nonmemberj=1 | witness t=8 gives1728;1 absent from all26 signed-divisor evaluations | Pass | Retained; boundary probe, not a proof of the universal target. |
| §6.14 cardinality API | r=2,3,5,7,13 | distinct-value counts25,13,8,6,4 | Pass | Retained; boundary probe, not a proof of the universal target. |
| Conventions: normalizer index | p=11 | ∣N∣/∣C×∣=240/120=2 | Pass | Retained; boundary probe, not a proof of the universal target. |
| Conventions: exact-divisor direction | r=5,p=11 | quotient retains r5 andusesexactdivisor121;605/121=5 | Pass | Retained; boundary probe, not a proof of the universal target. |
| Conventions: strict threshold at positivelevel | N=11,ℓ=19,23 | 19<19.9282032<23;only23 exceedsH♯ | Pass | Retained; boundary probe, not a proof of the universal target. |


Pull request: #1491 (roadmap/elliptic-curve-modularity-part-ii at 3c47aeb)
