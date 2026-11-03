# Review of CurvesOverFiniteFields (pull request #1729 at 9d88665)

**Verdict:** needs changes

AI review of the two specified roadmap files at Mathlib `f6090c70` and Tau Ceti `358314d4`. There are 13 findings: four P1, five P2 and four P3. The gate passes; the blocking findings concern mathematics, ownership and acceptance-test coverage. No pull-request file was changed.

## R01 (P1) — The elliptic point-count headline admits singular coordinates

**Location:** `TauCetiRoadmap/CurvesOverFiniteFields/Suggested.lean:306`, “`{P : Place k F} … (hW : P.IsWeierstrassCoordinates W x y)`”. README §5.1, line 955, explicitly requires a degree-one place.

**Claim:** Genus one and the coordinate predicate suffice for equality of the function-field and Weierstrass point counts. The signature omits `P.degree = 1`.

**Witness:** Over 𝔽₂ take E: v²+v=u³+u+1. The place u=0 has degree 2. Set x=u⁻², y=u⁻³ and W:y²=x³. The coordinate conditions hold, but N₁(E)=1 and W.pointCount=3.

Here u=0 has residue polynomial v²+v+1, irreducible over 𝔽₂; its derivative is 1, so u has order one there. Thus x and y have orders −2 and −3 and are regular elsewhere. The pinned coordinate structure has exactly these four order conditions and the equation, with no degree condition: `TauCeti/FieldTheory/FunctionField/Elliptic/WeierstrassEquation.lean:70`. The pinned nonsingularity theorem explicitly requires the missing hypothesis: `Elliptic/Nonsingular.lean:126`.

**Repair:** Add `(hP : P.degree = 1)` to this headline and keep it in its elaborated signature. Add the degree-two cusp construction as a negative-control Check. It is excluded by the repair because 2≠1; the original curve's coordinates at infinity have degree one and give the correct equality 1=1.

## R02 (P1) — The second owner of the polynomial theory still exists

**Location:** `TauCetiRoadmap/CurvesOverFiniteFields/README.md:80`: “`AbelianVarietiesOverFiniteFields` consumes 4.1–4.11 by section and defines none of these objects a second time”.

**Claim:** The sibling's polynomial preliminaries are citations of this roadmap.

**Witness:** At the supplied open head, `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:360`–458 still constructs Weil polynomials, real polynomials, slopes, angle rank, powers, twists, Weil roots, geometric extension degrees and virtual counts in §1.0.

**Repair:** Complete the ownership move in the sibling: replace those constructions and their APIs with imports by section from this roadmap, preserving only geometric comparison targets there. Alternatively move the polynomial layer to that owner and consume it here in a consistent merge order. Do not assert that a sibling already defers when it does not. For the common test P=T²−2T+5, both sections currently construct h=X−2 and slopes {0,1}; after the repair there must be one construction and one citation.

This is the surviving duplication component of previous R01. The reverse input from the sibling's elliptic classification has been removed here; I do not report the old cycle as still present. No supplied repair report marks this finding settled.

## R03 (P1) — Nonsquare q does not make the real factor symmetric

**Location:** `TauCetiRoadmap/CurvesOverFiniteFields/README.md:652`–655: “`P` is symmetric iff `P_real` is, which for non-square `q` is automatic”.

**Claim:** Products of real-rooted irreducible Weil factors are automatically symmetric for nonsquare q.

**Witness:** At q=2, P=(T²−2)(T²−2T+2)=T⁴−2T³+4T−4 is Weil. Its real factor is T²−2, and its constant coefficient −4 differs from q²=4. README line 666 already gives this counterexample.

**Repair:** Replace “automatic” by the condition that the exponent of T²−q is even. Retain the separate square-q condition on both real-root multiplicities. The displayed counterexample then fails because its exponent is 1; (T²−2)² passes because its exponent is 2. The repaired m/2 formula earlier in §4.5 remains correct.

## R04 (P1) — The angle power rule loses multiplicity at real roots

**Location:** `TauCetiRoadmap/CurvesOverFiniteFields/README.md:755`–757: “the angles of `weilPower hP r` are the `r θ_i` reduced modulo `2` … replaced by their absolute values”.

**Claim:** Mapping the stored angle multiset this way gives the angle multiset after a Weil power.

**Witness:** P=T²+2 has angles [1/2]. Its second Weil power is (T+2)², whose angles are [1,1]. The stated map gives [1]. Both conventions and this power appear in the README.

**Repair:** Account for the two roots represented by each nonreal-root angle. Such an angle contributes two copies when its powered roots become real, and one copy otherwise; an originally real-root entry contributes one. Alternatively reconstruct and power the full root multiset before filtering. This returns [1,1] in the witness and [1/2] for r=1.

## R05 (P2) — Symmetry is repeatedly treated as if it included monicity

**Location:** `TauCetiRoadmap/CurvesOverFiniteFields/README.md:582`, “for symmetric `P`, `P(0) = q^g`”; line 592, “`h_P` is monic”; lines 603–605, the prefix determines P. Also §4.2's factorization converse at line 563.

**Claim:** The coefficient symmetry predicate supplies normalization, including the real-root criterion without an additional monicity assumption.

**Witness:** At q=2,g=1, P=2T²+4 satisfies every symmetry equation. But P(0)=4≠2, h_P=2X is not monic, and its roots satisfy the interval condition although P is not Weil.

**Repair:** Keep the general symmetry predicate, but explicitly require `P.Monic` for normalized constant coefficients, monicity of h, the Weil iff, prefix recovery and the factorization converse. In the unnormalized theory state P(0)=qᵍ·leadingCoeff(P). The Lean iff already has `hm`; match the prose to it. The witness then gives 4=2·2 and is excluded from normalized assertions. P=T²+2 and 2T²+4 also demonstrate why their identical prefix (1,2,0) cannot determine an unnormalized P.

## R06 (P2) — The finite slope count needs a nonzero constant coefficient

**Location:** `TauCetiRoadmap/CurvesOverFiniteFields/README.md:678`–682: “for a monic `P` of degree `2g` a multiset of `2g` rationals”.

**Claim:** The Newton polygon of reverse P always supplies that many finite slopes, identified with valuations of all roots.

**Witness:** Take q=2,g=1,P=T². Its reversal is 1, whose Newton polygon has zero finite slopes, not two. Its two roots are zero, whose valuations are ∞, not rational numbers.

**Repair:** For arbitrary monic P, count the finite slopes as deg(P)−ord₀(P) and separate zero roots. State the 2g-slope dictionary under P(0)≠0, automatic for Weil polynomials with prime-power q. This matches `TauCetiRoadmap/NewtonPolygons/README.md:107`–112. The corrected count is 2−2=0 for T² and 2−0=2 for T²+2.

## R07 (P2) — The twist-exponent classification divides by zero

**Location:** `TauCetiRoadmap/CurvesOverFiniteFields/README.md:838`–842: the twist exponents are a union over matchings whose ratios `β/α` are roots of unity. §4.10 begins with arbitrary monic P.

**Claim:** This ratio classification applies to all the monic polynomials admitted by the definitions.

**Witness:** P₁=P₂=T has equal positive Weil powers for every exponent. Its only matching has ratio 0/0=0, which is not of finite order. The stated union is empty instead of all positive integers.

**Repair:** State the formula on positive exponents, require equal zero-root multiplicities, and apply torsion-ratio matchings to the nonzero roots. Preserve the simpler formulation when both constant coefficients are nonzero. For T against T the remaining matching is empty, its lcm is 1, and every positive exponent is recovered.

## R08 (P2) — Polynomial count-recovery headlines are statable but absent

**Location:** `TauCetiRoadmap/CurvesOverFiniteFields/README.md:930`–932: “`N_1, …, N_g` determine `P`; so does the full sequence `(A_r)_{r ≥ 1}` when `q ≥ 2`”. No corresponding theorem occurs in `Suggested.lean`.

**Claim:** The acceptance test covers the polynomial layer's headline results; its missing-carrier list does not include these results.

**Witness:** Both signatures elaborate using only the file's existing monicity/symmetry/Weil predicates, `virtualCurveCount`, `virtualAbvarCount`, quantification over positive integers and equality P=Q. No supplier carrier or new encoding is needed.

**Repair:** State these recovery theorems with `sorry`: first-g curve counts at fixed q>0,g for monic symmetric P,Q; and all positive abelian counts for symmetric Weil P,Q at q≥2. Cite FunctionFieldArithmetic §5.6 as the proof input for the first. Keep q≥2 in the second: at q=1, (T−1)² and T²−1 have identical abelian counts, all zero, but are different polynomials. The proposed signatures and the q=1 negative control were checked.

## R09 (P2) — Scalar Weil purity does not include algebraic integrality

**Location:** `TauCetiRoadmap/CurvesOverFiniteFields/README.md:277`–281: after defining a q-Weil number as an algebraic integer, it says DeligneWeightsAndPurity's `IsWeilNumber q 1 α` “is that predicate”.

**Claim:** The scalar supplier predicate and the integral Weil-number notion coincide on arbitrary characteristic-zero fields.

**Witness:** At q=2, α=(1+i√17)/3 has both conjugates of modulus √2, so scalar purity holds. Its monic minimal polynomial is X²−(2/3)X+2; its nonintegral trace excludes algebraic integrality.

**Repair:** In convention 7 identify integral q-Weil numbers with `IsIntegral ℤ α ∧ IsWeilNumber (q : ℝ) 1 α`, for q>1. Keep §5.3's existing integrality hypothesis. The witness then fails the integral conjunct, while α=1+i passes both. The supplier explicitly separates integrality at `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:563`–565.

## R10 (P3) — Two degenerate Checks contradict the actual definitions

**Location:** `TauCetiRoadmap/CurvesOverFiniteFields/README.md:609`: symmetry at g=0 holds “exactly for the nonzero constants”; line 947: “`virtualAbvarCount hP 0 = 0`”.

**Claim:** These descriptions include all boundary cases.

**Witness:** `IsWeilSymmetric q 0 0` is true because natDegree(0)=0 and every equation is 0=0; a Lean probe proves it by simp. For P=1 the empty determinant gives virtualAbvarCount(0)=1.

**Repair:** Say “all constants, including zero” in the first Check. In the second give 1 for degree zero and 0 for positive degree. These agree with the actual definitions and with §4.10's existing empty-basis Check.

## R11 (P3) — Eight definitions are an unused API catalogue

**Location:** `TauCetiRoadmap/CurvesOverFiniteFields/Suggested.lean:114`, 154, 168, 204, 210, 224, 230 and 242.

**Claim:** The file keeps only definitions needed to state its headline theorems.

**Witness:** `IsAlmostOrdinary`, `weilGaloisGroup`, `IsIsotypic`, `IsTwistOver`, `twistDegree`, `IsGeometricallyIrreducible`, `geometricExtensionDegree` and `IsJacobianCompatible` occur in no theorem signature; the twist predicate's only dependent declaration is the unused twist degree.

**Repair:** Delete these definitions from `Suggested.lean`; retain their definitions, APIs and Checks in the README. None is needed by the two recovery headlines in R08. The original 20 admitted theorems were separately probed with simp, rfl and infer_instance: none closed, so this finding is about unused definitions, not a claim that those theorems are one-tactic padding.

## R12 (P3) — Restore the required dependency and definition structure

**Location:** `TauCetiRoadmap/CurvesOverFiniteFields/README.md:397` onward; there are no `*Needs:*` lines, no layer-ending `### Examples` or `### Dependencies`, and Layer 4 appears after its consumers.

**Claim:** The global ordering paragraph supplies the required local construction contracts.

**Witness:** §2.1 uses §4.4, and §3.2 uses §4.4 again. §4.10 gives one grouped Checks list for three different definitions; geometricExtensionDegree receives only its third bullet. Definitions' APIs remain dense milestone paragraphs.

**Repair:** Put the independent polynomial theory first in build order, add per-target Needs lines and per-layer Examples/Dependencies, and split definition APIs and Checks into the required lists. Give each definition three discriminating tests, not three bullets shared between unrelated definitions. Use the required Summary, Conventions, Exact supplier contracts and How to read the build structure. Moving §4.4 before §2.1 removes the concrete forward reference; the mathematical dependency need not change.

## R13 (P3) — Several sampled targets have no exact supporting locator

**Location:** `TauCetiRoadmap/CurvesOverFiniteFields/README.md:488`–523, 559–565, 805–814, 825–876 and 1145–1173.

**Claim:** Section-level source references certify the sampled mathematical assertions.

**Witness:** §3.5 has no theorem/page locator; §3.3 cites “Ihara 1981”; §4.10's torsion-ratio classification and finite full twist class have no exact locator. The angle knowl states Arg(α), not the stored half-list divided by π.

**Repair:** Attach an exact theorem/proposition or proof-page locator to each substantive claim, including the intrinsic proofs of polynomial operations. For the angle-list storage convention cite a record or storage specification; distinguish it from the mathematical angle knowl. Keep inaccessible texts explicitly uncertified rather than claiming their statements were read. Source access failures are itemized below and are not themselves mathematical findings. Replace the residual `\binom{…}{…}` at lines 472 and 574 by the required plain mathematical notation.

## Verified sound

This section records successful checks and the boundary cases that exposed the findings; a finite collection of examples is not a proof of all universal claims.

### Disposition of the previous review

The twelve previous findings were examined before the full pass. No repair report with a “not actionable in this package” disposition was supplied or found among this package's reports.

| Previous finding | Passage at this head | Disposition |
| --- | --- | --- |
| R01 ownership/cycle | README 181–182: “Nothing from that roadmap is an input here.” | **Partly repaired.** The reverse dependency is removed; the sibling still constructs §1.0. Present R02. |
| R02 failing build | Suggested 1–7: `module`, `public import Mathlib` and individual Tau Ceti imports. | **Repaired.** Gate passes; direct elaboration succeeds with only sorry warnings. |
| R03 missing headlines | Suggested 274,280,286,306 now contain the class-number-one corollary, Serre, Ihara and point-count comparison. | **Partly repaired.** All requested statements were added; the last has the missing degree-one hypothesis in present R01. |
| R04 endpoint multiplicity | README 650: “with multiplicity `m/2`”. | **Repaired.** (T²−2)² gives h=X²−8 once. Present R03 concerns a different sentence in the same section. |
| R05 supersingular slopes | README 686: “equivalent, for a Weil `q`-polynomial”. | **Repaired.** The T²+16 negative control is retained at 736–739. |
| R06 angle ranks | README 1072 and 1083: angle rank “`1`”; exact rational relations are stated. | **Repaired.** Relations yield dimension 2 after adjoining 1. |
| R07 padding | The former card_aroots, integrality, finiteness, Dickson free-variable theorem, pRank_example and boundary examples are absent. | **Repaired for the identified declarations.** No retained theorem closed under the one-tactic probes. Unused definitions are a distinct present R11. |
| R08 names/links | README 540–543 cites Deligne's API in prose; 153 links Completed/PolynomialGaloisGroups; 125–127 labels Newton names as suggestions. | **Repaired for the listed issues.** The invented hk name is gone; Waterhouse is Chapter 2, pp.527–528. |
| R09 later-roadmap interface stub | The former §5.5 is gone; README 1140 puts the genus-two Euler-factor interface under consumers. | **Repaired.** No dependency on HyperellipticCurves is introduced. |
| R10 per-definition Checks | README 898: “Checks (weilRoots, IsGeometricallyIrreducible, geometricExtensionDegree)”. | **Partly repaired.** Values are now supplied, but the lists are shared rather than three discriminating Checks per definition. Present R12. |
| R11 form/locators | Suggested 24: “Headline theorems not statable at the pins”; README 1163 cites Mathlib's Dickson file. | **Partly repaired.** Docstring, numbering and cited prior issues are corrected; required local shape and exact locators remain incomplete, R12–R13. |
| R12 argument convention | Suggested 111–122: all three strata predicates take q. | **Repaired.** q=12 consistently gives p=2 and exponent 2; mathematical claims use prime-power hypotheses. |

### Gate, elaboration and signatures

The supplied gate at exactly `9d886653ac23d7e484050d7520aef2d1bf6c7672` reports:

```text
gate CurvesOverFiniteFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The requested dependency check was run again:

```text
depcheck: 204 roadmaps, 1629 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The outside-folder diff is empty and the worktree remains clean. No algorithms, sorry-defined data, option overrides, unauthorized imports or source-text blobs were found. The single Mathlib import uses the module-system spelling accepted by the gate.

Direct `lake env lean` elaboration of the requested module succeeded, with exactly 20 sorry warnings and no other warning/error. A corrected scratch copy appended `#check @name` for **all 42 actual declarations**; all signatures elaborated. The supplied 43-entry signature transcript had mistakenly parsed “class-number-one” in prose as a declaration and reported a probe error; that was a probe-generation artifact, not a module failure.

All 20 admitted theorems were tried with `simp`, `rfl` and `infer_instance`, each as a single closing tactic on a copy. None closed. Candidate pinned trace/root lemmas require actual base-change, characteristic-polynomial or root-multiplicity arguments; no direct single-library-lemma closure was identified. No section binder disappeared. Comparing the actual signatures with the README nevertheless exposed the **never-written** degree-one hypothesis in R01. The two proposed recovery signatures in R08 also elaborate. No reviewed file was edited.

### Headline coverage

The README's end results are: the function-field Weil-polynomial link and constant-extension dictionary (§§2.1–2.4,3.1); coefficient and class-number bounds, including class number one (§3.1); Serre and Ihara (§§3.2–3.3); necessary Jacobian count conditions (§3.4); maximal/minimal criteria (§3.5); the real-polynomial equivalence and endpoint classification (§§4.4–4.5); Newton/ordinariness and angle-rank-zero equivalences (§§4.6–4.7); the CM-field theorem (§4.8); Weil-power root/trace/product theorems and finiteness of roots (§4.10); bounds and recovery from counts (§4.11); elliptic point-count/supersingularity, zeta and scalar-Weil comparisons (§§5.1–5.3).

The file states the class-number/Serre/Ihara results, real-polynomial dictionary, endpoint classification, elementary ordinariness, angle and CM results, Weil-power results, virtual curve bound and two elliptic comparisons. Its docstring names the missing L-polynomial/count, slope, zeta and scalar-Weil carriers. These explanations do not justify omission of the polynomial recovery results, whose carriers already exist here (R08).

### Suppliers and ownership checked

The read-only main copies of AlgebraicCurves and NewtonPolygons were read for shape and mathematical contracts. Searches used both `roadmaps grep` and object terms in the pinned libraries, main, the supplied open heads and board packages. Renaming the objects does not resolve R02.

Resolved contracts, with repository-relative locations:

- `TauCetiRoadmap/FunctionFieldArithmetic/README.md:484` (§0.2), 1726–1761 (§5.1 counts, Euler product, log derivative, constant extension, Möbius inversion), 1781–1807 (§5.2), 1809–1837 (§5.3 rationality, symmetry, L(1)), 1839–1864 (§5.4 curve/Jacobian comparison), 1866–1887 (§5.5), 1889–1917 (§5.6 recovery). These are present at the supplied head. Its N₀=0 differs intentionally from the virtual algebraic N₀=2−2g.
- `TauCetiRoadmap/SchemeAndStackFoundations/README.md:7273`–7307: §5.11 uses smooth projective geometrically irreducible curves, and identifies the genus-one bound. For q=2,g=1,N=1, its squared intersection inequality is 4≤8.
- `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:561`–619: §§0.1–0.3, real-base scalar purity, algebraicity and q>1, with integrality separate; 990–1006: §1.6 point counts and reversed numerator; 3174: DWP.10. The algebraic-integer qualification in §5.3 is essential.
- `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md:2019`–2034: R28.5.1 is the fixed-degree/fixed-modulus finiteness owner. Its generality includes negative modulus (empty positive-degree locus), unlike the √q specialization.
- `TauCetiRoadmap/NewtonPolygons/README.md:80`–112: normalization and finite-root convention; §§2.1,3.2,3.3 supply the coefficient polygon, product and root dictionary. R06 identifies the mismatch with its explicit treatment of zero roots.
- `TauCetiRoadmap/WeilConjectures/README.md:237`, 605–615 and 1078–1098: WC.1, §1.16 and §5.20 supply numerator conventions and Newton/recurrence formulas, including repeated and empty root lists.
- `TauCetiRoadmap/EllipticCurves/README.md:741`, 774–787: trace-divisibility supersingularity, fixed-point extension counts, trace recurrence and zeta rationality. `TauCetiRoadmap/AlgebraicCurves/README.md:1245`–1255 supplies genus one and point/place comparison; Layer 8 supplies constant extensions.
- `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:2794`–2806: F3.2 supplies Honda–Tate and the division-algebra exponent. The cited nonrealization of T²−2 agrees with the real quadratic exponent-two case.
- `Completed/PolynomialGaloisGroups/README.md`, Layers 0,2,6: native splitting-field group, permutation dictionary, labels only through degree five. `Completed/NumberFieldArithmetic/README.md`, scope and degree/discriminant sections, supplies the number-field infrastructure. `Completed/AlgebraicCodingTheory/README.md` is an exclusion, not an arithmetic supplier.
- Open `AbelianVarietiesOverFiniteFields` §1.0 still owns the overlapping objects (R02); its §§5.3–5.6 discuss the claimed geometric comparisons. Open `HyperellipticCurves/README.md:122`–124 and §5.3 consume the Weil-polynomial interface. `packages/AbelianSurfacesModularity/README.md:63`–71 consumes this roadmap's §§4.1,4.3,4.6,4.11; it specializes to quartics rather than supplying a competing generic theory. The other object-search matches were consumers or the named finiteness/weights suppliers.

No new upward supply was found. There are zero local Needs lines to audit; that absence is R12, not evidence that prerequisites are absent. The broad cross-roadmap contracts are mostly present, but they do not resolve the two-owner conflict.

### Pinned library declarations opened

The following are inspected source locations, not claims about a newer library:

| Pin-relative file | Declarations / content checked |
| --- | --- |
| `TauCeti/FieldTheory/FunctionField/Basic.lean:51` | IsFunctionField is existence of a transcendental element with finite-dimensional extension over k(x); it does **not** assert exact constants. |
| `TauCeti/FieldTheory/FunctionField/Place/Basic.lean:495` | Place.degree is residue-field finrank. |
| `TauCeti/FieldTheory/FunctionField/Place/BoundedDegree.lean:94` | finite_setOf_degree_le, with finite k and hF. |
| `TauCeti/FieldTheory/FunctionField/RiemannRoch/ClassNumber.lean:82`,202,210 | Effective-divisor finiteness; classNumber is Nat.card of the degree-class kernel; positivity. |
| `TauCeti/FieldTheory/FunctionField/ConstantExtension/Genus.lean:69` | genus_eq_genus_of_constantCompositum_eq_top, under the finite separable constant-extension setup and exact original constants. |
| `TauCeti/FieldTheory/FunctionField/Elliptic/Basic.lean:188` | degreeOneEquivDegreeZeroClassGroup requires a degree-one base place. |
| `TauCeti/FieldTheory/FunctionField/Elliptic/WeierstrassEquation.lean:70`,213 | Five coordinate fields, and existence theorem explicitly taking degree one. |
| `TauCeti/FieldTheory/FunctionField/Elliptic/Nonsingular.lean:126` | isElliptic needs degree one; genus alone is insufficient. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:73`,85,101 | Count includes singular affine solutions plus infinity; comparison with the native point type requires ellipticity; integer trace. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Supersingular.lean:86` | Geometric p-torsion definition, not the equation a=0. |
| `Mathlib/RingTheory/AdjoinRoot.lean:697`,737 | Monic power basis indexed by Fin natDegree, including the empty basis of AdjoinRoot 1. |
| `Mathlib/RingTheory/Polynomial/Dickson.lean:122` | The evaluated identity has parameter 1; the claimed general-parameter extension is not this exact lemma. |
| `Mathlib/NumberTheory/MahlerMeasure.lean:106` | finite_mahlerMeasure_le: degree bounded above and Mahler measure bounded; 121 and 216 supply cyclotomic input. |
| `Mathlib/Analysis/Polynomial/MahlerMeasure.lean:223` | Leading coefficient times product of max(1,norm root). |
| `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean:138` | Kronecker requires integrality and all embeddings, yielding a positive root-of-unity exponent. |
| `Mathlib/NumberTheory/NumberField/CMField.lean:69` | IsCMField bundles total complexity and quadratic extension of the maximal real subfield. |
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean:96`,108; `Mathlib/RingTheory/Trace/Basic.lean:86` | Matrix trace/root identity; power-basis trace lemma concerns a minimal polynomial and has nontriviality/splitting hypotheses. It does not immediately prove the arbitrary-monic Weil-power target. |

Native reverse, aroots, monic-factor, splitting-field/Galois-action and finite-field extension names were also searched at the pins. The cited zetaFunction, Newton slope multiset and Hermitian-function-field modules are absent at these pins, as stated; their absence is not a failed import here. I did not certify claims about an unprovided later Tau Ceti checkout.

### Seeded source sample

There are **15 seeded targets**. No README locator is explicitly marked unverified; unavailable texts were still attempted through the source service. Waterhouse and nine of the seventeen reference knowls were readable. Eight knowls returned browser challenges, which were not treated as source text.

For the website source key `lmfdb-av-fq`, each citation below names its knowl as well as the extraction line; these are separate pages of the same source. No passages were copied into this report.

| Seeded target | Text and locator actually inspected | Assessment |
| --- | --- | --- |
| 3.1 RH and corollaries | FunctionFieldArithmetic §§5.3–5.4; Stichtenoth Theorems 5.2.1/5.2.3 attempted | Supplier formulas and independent product estimates checked. Book theorem numbers/pages **uncertified**; see Not verifiable. |
| 3.2 Serre | Serre 1983 pp.397–402 and Stichtenoth 5.3.1 attempted | Full texts unavailable. The displayed AM–GM argument was checked algebraically, including separate genus zero. |
| 3.3 Ihara | Tokyo repository copy of pp.721–724 attempted; Stichtenoth 5.3.3 attempted | HTTP 503; no original equation number certified. The quadratic inequality and all table values were recomputed. |
| 3.5 maximal/minimal | Supplier root bound and README equality argument; Serre 2020 attempted | Equality criterion follows from equality in the root triangle estimate. The README supplies no exact original locator, R13. |
| 4.2 closure | Mathlib monic-factor/root machinery; DeligneWeightsAndPurity §0.3 | Root-power direction valid for r>0; monicity is missing from the unqualified factorization converse, R05. |
| 4.3 finiteness | Faltings R28.5.1; Mathlib MahlerMeasure line 106; lmfdb-av-fq, nf.weil_polynomial line 92 | Finiteness at prime-power q supported by the knowl; all natural q follows from the stated Mahler argument. The supplier owns the theorem. |
| 4.4 real polynomial | waterhouse1969 lines 309–316, printed p.528; Mathlib Dickson line 122; lmfdb-av-fq, av.fq.lmfdb_label lines 98–102 | Waterhouse supports the nonreal Weil-number/real-subfield dictionary, not every integral polynomial identity as a separately stated theorem. General-parameter Dickson identity is an explicit new target. R05 concerns lost monicity. |
| 4.5 endpoints | waterhouse1969 lines 294–308, printed p.528 | Prime-power real cases supported. Extension to arbitrary natural q is elementary minimal-polynomial reasoning. Nothing in this passage asserts the false automatic symmetry of R03. |
| 4.6 Newton strata | NewtonPolygons Conventions 2–4; lmfdb-av-fq, av.fq.newton_elevation lines 90–100; p_rank lines 90–91; ordinary line 90; supersingular line 90 | Knowls concern realized abelian varieties and integral-vertex polygons. The README correctly distinguishes arbitrary polynomial slopes at q=8. Finite-slope count still needs R06. |
| 4.8 number field/Galois | waterhouse1969 lines 294–316, printed p.528; native AdjoinRoot, CMField, Gal | Real and nonreal number-field alternatives supported. Number-field/Galois knowls blocked; their display conventions were not certified. |
| 4.9 factorization | Mathlib UFD vocabulary and Waterhouse lines 240–245, printed p.526 | Isotypic characteristic polynomials versus simple varieties supported. The database's “geom_squarefree” interpretation was not certified from a readable locator. |
| 4.10 powers/twists/roots | waterhouse1969 lines 317–325, printed p.528, supports Frobenius powering; native power basis | The complete polynomial twist-exponent and finiteness claims need their own precise support. Zero roots refute the ratio formula as written, R07. |
| 4.11 counts | FunctionFieldArithmetic §§5.3–5.6 and independent Newton sums; curve_point_counts knowl attempted | Supplier identity and recovery comparison checked; knowl's rejection-policy wording unavailable. Arithmetic checks below do not rely on that wording. |
| 5.2 elliptic zeta | EllipticCurves Layer 3, lines 774–787; FunctionFieldArithmetic §5.1 | Fixed-point counts and formal logarithms match for r≥1. The named later Tau Ceti zeta declarations are not at the pin and were not read elsewhere. |
| 5.3 scalar comparison | DeligneWeightsAndPurity §0.1, lines 563–585 | This section's algebraic-integrality assumption gives the right comparison. Convention 7 drops it in an earlier identification, R09. |

Additional convention checks: `lmfdb-av-fq`, av.fq.l-polynomial lines 90–95 confirms reversal and inverse-root modulus. The angle-rank definition at av.fq.angle_rank lines 90–92 uses all nonzero roots and Arg/(2π); rational rescaling by 2 and conjugation do not change the rank used here. av.fq.frobenius_angles lines 90–92 does not specify the database half-list/multiplicity convention, so “verbatim” needs a storage/record citation.

### Adversarial mathematics table

Notation: E₂ means P=T²−2T+2 at q=2; O₂ means P=T²−T+2. Power sums are sᵣ, virtual curve counts Nᵣ=qʳ+1−sᵣ and abelian counts Aᵣ=P⁽ʳ⁾(1). Lists keep multiplicity. Integer Newton recurrences and elementary symmetric identities were recomputed, not copied from the previous review. Rows with failures identify the required change.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Carrier: finite field and exact constants | 𝔽₂(t); 𝔽₄(t) viewed over 𝔽₂ | Exact case q=2,N₁=3; nonexact case every place degree is even, N₁=0≠3 | hex excludes the wrong constant field | None |
| Counts a_d,A_n,N_r | ℙ¹/𝔽₂, r=1,2 | a₁=3,a₂=1; N₂=3+2·1=5; A₂=7, not 5 or 1 | Distinct objects | None |
| Count index zero | Supplier and virtual count for E₂ | Supplier N₀=0; virtual N₀=2−2=0; for genus 0 virtual N₀=2≠0 | Positive-exponent restriction needed | Present |
| Constant extension degree | E₂, degree 2 | q'=4,g'=1,s₂=0,N₁'=5=N₂ | Correct normalization | None |
| Reversal convention / 2.1 | E₂; ℙ¹ | L=1−2T+2T² reverses to T²−2T+2; 1 reverses to 1 | Correct | None |
| Root sum/product / 2.1 | E₂ | roots 1±i; sum 2=3−1, product 2=qᵍ | Correct signs | None |
| Root nonvanishing and cardinality | E₂; P=1; q=0,P=T² | two nonzero roots; empty roots; two zero roots at q=0 | q>0 excludes zeros | None |
| Inversion symmetry / 2.1,4.4 | E₂; 2T²+4 | 2/(1+i)=1−i; 2/(i√2)=−i√2 | Multiset stable, scaling immaterial | None |
| Integer count formula / 2.2 | E₂, r=1,2,3,4 | s=(2,0,−4,−8), N=(1,5,13,25) | Agrees with recurrence | None |
| Characteristic recurrence / 2.2 | E₂ at r=0,1; P=1 | s₂=2·2−2·2=0; s₃=2·0−2·2=−4; empty case 0=0 | Correct | None |
| Constant-extension polynomial / 2.3 | E₂, r=2 | powered roots ±2i; P'=T²+4; L'=1+4T² | Correct | None |
| Constant-extension class number / 2.3 | E₂, r=2 | (1−2i)(1+2i)=5=L'(1)=N₂ | Correct | None |
| Genus-one class number / 2.4 | O₂; E₂ | L(1)=1−1+2=2=N₁; 1−2+2=1=N₁ | Correct | None |
| Genus-one recurrence / 2.4 | O₂ | s₀=2,s₁=1,s₂=−3,s₃=−5; N₂=5+3=8 | Matches elliptic supplier | None |
| RH link / 3.1 | E₂; P=1 | root norms √2,√2; no roots in genus zero | Weil predicate true | None |
| Coefficient bound / 3.1 | E₂,j=1,2 | 2≤2√2; 2=binomial(2,2)·2 | Correct | None |
| Class-number bounds / 3.1 | E₂; q=4,g=1 minimal; g=0 | (√2−1)²≈0.1716≤1≤5.8284; 1≤1≤9; 1≤1≤1 | Correct | None |
| Class number one / 3.1 | q=4,g=1; q=5,g=0 | q=4≤4 with h=1; rational field has h=1 but 5>4 | Positive genus is necessary and present | None |
| q=4 equality consequence / 3.1 | P=(T−2)²; proposed g=2 | L=(1−2T)²,N₁=1; at g=2 N₁=5−8=−3 | Forces g≤1 for curves | None |
| Cosine formula / 3.1 | E₂ at r=1,2 | 3−2√2 cos(π/4)=1; 5−4 cos(π/2)=5 | Correct two-root weighting | None |
| Serre inequality / 3.2 | E₂; O₂; g=0 | deviations 2,1,0; bounds 2,2,0 | Pass, equality attained | None |
| Serre proof AM–GM | q=2,m=2,x=2 | m+1−x=1, m+1+x=5; product lower bounds 1≤1,1≤5 yield −2≤2≤2 | Signs correct | None |
| Ihara quadratic / 3.3 | E₂; O₂ | g=1: S²−gS=2≤6=q²−q+2qg; 0≤6 | Correct direction | None |
| Ihara value / 3.3 | q=2,g=2; q=16,g=1; g=0 | 3+(√84−2)/2≈6.5826; 17+(33−1)/2=33; q+1 | Floor 6; weaker than Hasse 25 at q=16 | None |
| Ihara improvement threshold | q=4; g=1,2 | threshold (4−2)/2=1; equality of bounds at g=1; Ihara floor 11<13 at g=2 | Correct strict threshold | None |
| Nonnegative virtual counts / 3.4 | P=(T²−2)² | N₂=5−8=−3<0 | Correct rejection | None |
| Divisibility monotonicity / 3.4 | 2.2.ac_c, r=2,3,4 | 1≤5; 1≤1; 5≤9 | Correct, equality allowed | None |
| Möbius condition / 3.4 | 2.2.ac_c, r=2,3,4 | N₂−N₁=4; N₃−N₁=0; N₄−N₂=4; quotients 2,0,1 | Nonnegative integer place counts | None |
| Maximal criterion / 3.5 | q=4,g=1,P=(T+2)² | N₁=9=5+4; α=−2 twice; L=(1+2T)² | Both directions agree | None |
| Minimal criterion / 3.5 | q=4,g=1,P=(T−2)² | N₁=1=5−4; α=2 twice; L=(1−2T)² | Both directions agree | None |
| Maximal/minimal genus zero | P=1, any field q | N₁=q+1 on both sides; empty root condition; L=1 | No square-q conclusion at g=0 | Present |
| Weil predicate / 4.1 | E₂; (T−1)(T−2); 2E₂; 0 | root moduli √2,√2; 1,2; right roots but leading coefficient 2; nonmonic zero | T,T−1,T−2 controls separate q=0,1,4 | None |
| q=0 classification / 4.1 | T⁰,T,T²; T²+T | all zero roots for first three; last has root −1 of norm 1≠0 | Exactly powers of T | None |
| q=1 / cyclotomic case | T−1,T²+1; T−2 | roots of unity orders 1 and 4; root 2 norm 2≠1 | Correct boundary | None |
| Constant coefficient identity / 4.1 | E₂; T−2,q=4; P=1 | 2²=2²; (−2)²=4¹; 1=q⁰ | Odd degree and empty roots handled | None |
| Modulus uniqueness / 4.1 | T−2; P=1 | root norm²=4 fixes q; empty polynomial works at q=0,1,2 | Positive degree necessary | Present |
| Integral scalar versus purity | α=(1+i√17)/3; α=1+i | both norm²=2; traces 2/3 versus 2; minpoly coefficients −2/3 versus −2 | Convention 7 overclaims | R09 |
| Product closure / 4.2 | E₂(T²+2) | roots 1±i,±i√2 all norm √2; constant 4 with square 16=2⁴ | Correct | None |
| Monic divisor closure / 4.2 | T²−2 divides (T²−2)² | divisor roots ±√2 retain the same modulus, though symmetry fails | Weilness survives, symmetry need not | None |
| Factorization converse / 4.2 | 2(T²+2) | only monic irreducible factor T²+2 is Weil; original leading coefficient 2 | Needs monicity of original P | R05 |
| Finiteness / 4.3 | n=0; q=0,n=2; q=2,n=2 | {1}; {T²}; six polynomials: T²−2 and T²−aT+2 for a=−2,…,2 | Finite, real branch included | None |
| Mahler bound / 4.3 | E₂; T²−2; P=1 | M=√2·√2=2=(max(1,√2))²; empty product 1 | Supplier specialization correct | None |
| Polynomial coefficient bound / 4.3 | E₂,j=0,1,2 | 2=2; 2≤2√2; 1=1 | Correct binomial direction | None |
| Symmetry equations / 4.4 | E₂ at j=0,1,2 | 2=2; −4=−4; 4=4 | Weighted symmetry correct | None |
| Symmetry at g=0 | P=0,1,2 | natDegree=0 in each; equations 0=0,1=1,2=2 | Zero wrongly excluded in Check | R10 |
| q=0 symmetry / 4.4 | T⁴+T,g=2 | every weighted equation 0=0; h=X², root bound 0; P has unit-modulus nonzero roots | q>0 needed for iff/spec | Present |
| Constant normalization / 4.4 | 2T²+4,q=2 | P(0)=4; qᵍ=2; qᵍ·lc=4 | Missing monicity | R05 |
| Dickson identity / 4.4 | a=2,n=0,1,2; x=1+i,y=1−i | D₀=2=1+1; D₁(2)=2; D₂(2)=4−4=0=x²+y² | General parameter correct | None |
| Real polynomial construction / 4.4 | 2.2.ac_c | h=2−2X+(X²−4)=X²−2X−2 | Parameter-one wrong model gives X²−2X | None |
| Polynomial reconstruction / 4.4 | h=X²−2X−2,q=2,g=2 | −2T²−2(T²+2)T+(T²+2)²=T⁴−2T³+2T²−4T+4 | Equals P | None |
| Real-root interval iff / 4.4 | E₂; T²−4T+2 | h root 2 lies within ±2√2; root 4 lies outside; latter P roots 2±√2 have unequal norms | Both directions discriminate | None |
| Monicity in interval iff | P=2T²+4 | h=2X has root 0 inside interval; P not Weil | Lean carries hm; prose must too | R05 |
| Dickson triangular change / 4.4 | g=2 | (h₀,h₁,h₂)=(a₂−2qa₄,a₃,a₄); diagonal (1,1,1), determinant 1 | Unimodular | None |
| Prefix / 4.4 | 2.2.ac_c; g=0 | (2,2,−2,2) gives c₃=−4,c₄=4; normalized g=0 gives P=1 | Correct under normalization | R05 for unnormalized use |
| Prefix non-example q=0 | T⁴,T⁴+T | both prefixes (2,0,0,0), different coefficient of T | q>0 condition matters | Present |
| Irreducible real-root classification / 4.5 | q=2,4,0,1 | minimal polynomials T²−2; T∓2; T; T∓1 | Lean disjunction handles all four | None |
| Real-root multiplicities / 4.5 | (T²−2)²; (T−2)² | m=2 gives h=X²−8 once; m₊=2 gives h=X−4 once | m/2 repair correct | None |
| Real-factor symmetry / 4.5 | (T²−2)E₂ | real-factor exponent 1; constant −4 versus required 4 | “Automatic” false | R03 |
| Real/complex decomposition | (T²−2)E₂ | P_real=T²−2, P_cplx=E₂; product T⁴−2T³+4T−4 | Unique factor split; complex part symmetric | R03 only for parity assertion |
| Finite slopes / 4.6 | P=T²; P=T²+2 | reverse 1: 0 slopes; reverse 1+2T²: two slopes 1/2 | General monic claim false | R06 |
| Valuation normalization / 4.6 | q=4,P=T²+4 | v₂(roots)=1; dividing by r=2 gives 1/2 twice | Correct | None |
| Slope orientation / 4.6 | q=2,P=T²+2 | reverse coefficients heights (0,∞,1); slope 1/2; reciprocal root valuation −1/2 | Matches NewtonPolygons | None |
| Slopes [0,1] and duality | O₂; T²−2T+8,q=8 | {0,1}; {1/3,2/3}; 1−s permutes each | Correct Weil instances | None |
| pRank definition | 2.2.ad_f;2.2.ab_a;P=1 | first odd indices 2,3,0; degree minus index 2,1,0 | Correct | None |
| Ordinary middle-coefficient iff | Same two quartics; P=1,g=0 | middle coefficients 5 odd,0 even,1 odd; ranks 2,1,0 | True,true,true for appropriate iff | None |
| Almost ordinary | 2.2.ab_a; P=1,g=0 | rank+1=1+1=2; 0+1≠0 | Correct exclusion of genus zero | None |
| Non-prime-power junk | q=12; q=1 | minFac(12)=2,factorization at 2=2; q=1 exponent 0, supersingular inequalities 0≤2v | Prime-power guards matter | Present |
| Supersingular coefficient criterion | T²+2;O₂;T²−2T+8;T²−4T+8 | limiting tests 2≤2; 1≤0 false; 3≤2 false; 3≤4 true | Correct | None |
| Supersingular slope iff | T²+16 at q=2 | coefficient test 2≤8 true, slopes {2,2}≠{1/2,1/2} | Weil hypothesis now present | None |
| Almost-ordinary slopes | q=8,(T²−2T+8)(T²−T+8) | reverse heights (0,0,1/3,1,2); slopes 0,1/3,2/3,1; rank 1 | Refutes unguarded half-slope identification; README distinguishes it | None |
| Elevation zero/one | ordinary g=2; previous q=8 product | heights through x=2: (0,0,0), (0,0,1/3); lattice counts 0,1 | Matches rank g and g−1 | None |
| Supersingular elevation | g=0,1,2,3,4 | sums of ceilings of x/2 are 0,1,2,4,6; formulas give 0,1,2,4,6 | Correct | None |
| Product slopes and pRank | O₂(T²+2) | slopes {0,1,1/2,1/2}; ranks 1+0=1 | Correct additive rule | None |
| Frobenius angles | E₂; (T−2)²;(T²−2)²;1 | [1/4];[0,0];[0,0,1,1];[] | Real multiplicity convention explicit | None |
| Angle cardinality | Same first three, g=1,1,2 | 2·1=2+0;2·2=2+2;2·4=4+4 | Lean theorem agrees | None |
| Angles determine P | q=2,[1/4];q=4,[0,0] | roots 1±i give E₂; two roots 2 give (T−2)² | Need full real multiplicity as defined | None |
| Angle rank zero iff | E₂; O₂ | α²/2=i torsion; O₂ gives (−3+i√7)/4, minimal polynomial 2X²+3X+2, nonintegral | ranks 0,1 and supersingular true,false | None |
| Angle rank bound/product | E₂·O₂ | rational angle plus one irrational angle: span dimension 2, rank 1≤0+1≤2 | Correct | None |
| Rank under powers | E₂ at r=2,4; O₂ at r=2 | ranks 0→0→0; irrational θ becomes rational only if θ was rational, so 1→1 | Correct despite multiplicity error in separate formula | None |
| Angle-list power formula | T²+2,r=2 | mapped list [1]; actual powered list [1,1] | False as a multiset formula | R04 |
| Corrected ordinary example ranks | 2.2.ad_f;3.2.ad_c_b | θ₂−θ₁=1/3; θ₁+θ₂=2/7,θ₁+θ₃=6/7; each span with 1 has dimension 2 | Rank 1 in both | None |
| Number-field carrier / CM | E₂; T²−2; T−2 | ℚ(i), degree 2 and CM; ℚ(√2), degree 2 real; ℚ, degree 1 real | No-real-root guard discriminates | None |
| Real subfield / 4.8 | 2.2.ac_c | h=X²−2X−2, real subfield ℚ(√3); extension ℚ(i,√3), degree 4, discriminant (−4)·12·(−3)=144 | Correct | None |
| Galois group versus real group | 2.2.ab_a | h discriminant 17, real group C₂; quartic splitting group D₄ order 8 | Groups not identified | None |
| Further field checks | 2.2.ad_f;3.2.ad_c_b | ℚ(√5,√−3) discriminant 5·(−3)·(−15)=225; ℚ(ζ₇) discriminant −7⁵=−16807 | Correct | None |
| Isotypic / irreducible / squarefree | T⁴+4; (T²−2)²;1 | factors E₂ and T²+2T+2, squarefree/nonisotypic; repeated irreducible, isotypic/nonsquarefree; unit with empty factors | Predicates distinguish the examples | None |
| Weil power definition / roots | E₂,r=2;T²−2,r=2 | T²+4 roots ±2i; (T−2)² roots 2,2 | Characteristic polynomial keeps multiplicity | None |
| Weil power versus minimal polynomial | E₂,r=4 | characteristic (T+4)² versus minimal T+4 | Correct Check | None |
| Weil power zeroth/identity | P degree n;P=1 | r=0 gives (T−1)ⁿ, s₀=n; r=1 gives P; empty matrix gives 1 and 0 | Correct | None |
| Composition of powers | E₂,r=s=2 | power four (T+4)² on both routes | Correct | None |
| Weilness under powers iff | E₂,r=2;P=T,q=0,r=2 | norms √2 square to 2=√4; 0²=0=√0 | r>0 sufficient | None |
| Symmetry under powers | E₂,r=2;P=T⁴+T,q=0,r=2 | T²+4 symmetric at q=4; zero constant preserved in q=0 example | No inverse-zero argument needed | None |
| Product formula sign | P=T−2,r=2;P=1 | (T−2)(−T−2)=4−T²=−(T²−4); empty case 1=1 | Sign (−1)^((r−1)n) correct | None |
| Trace/power-sum theorem | E₂,r=0,1,2 | trace 2,2,0 equals sum of 0th,1st,2nd root powers | Correct | None |
| Twist equivalence and multiples | E₂ and T²+2T+2 | second powers both T²+4; fourth powers both (T+4)² | Equality transitive/reflexive; multiples preserve it | None |
| Twist degree need not divide exponent | T²∓3T+3 | second power T²−3T+9; third T²+27; minimum exponent 2, yet exponent 3 also works | Correct | None |
| Twist zero denominator | P₁=P₂=T | equality for every r≥1; sole ratio 0/0=0 not torsion; purported union empty | False classification | R07 |
| Finite twist classes | n=1,P=T−2;P=T | integer torsion multiples of 2 give T−2,T+2; zero root gives only T | Finite, with zero case handled separately | R07 |
| No-twist Check | O₂ and E₂ | E₂ angles rational; O₂ angle irrational; no positive multiple makes their root-angle sets equal | twistDegree=0 | None |
| Weil-root sets / finiteness | r=2,P=(T−2)²; T²+4;T+2 | {T²−2}; {T²−2T+2,T²+2T+2}; ∅ | Cardinalities 1,2,0 | None |
| Weil-root degree boundary | P=1;P=0,r≥1 | only Q=1 gives empty root list; no monic power equals zero | {1};∅ | None |
| Geometric irreducibility | O₂;E₂;T−2;1 | O₂ powers retain distinct nonreal roots; E₂⁽⁴⁾=(T+4)²; (T−2)⁽ʳ⁾=T−2ʳ;1 unit | true,false,true,false | None |
| Geometric extension degree | T²+2;E₂;(T²−2)²;1 | root-ratio orders {1,2};{1,4};{1,2};empty; least exponents 2,4,2,1 | Correct | None |
| Coincidence stabilization | T⁴+4,r=1,2,4 | ordered equal-root pairs 4,8,16; at r=4 all further powers keep 16 | Degree 4, not first-collision exponent 2 | None |
| Further extension-degree Checks | 2.2.ac_c;2.2.ad_f;3.2.ad_c_b | torsion ratios generated by ζ₁₂,ζ₆,ζ₇; lcm orders 12,6,7 | Correct | None |
| Virtual abelian count / 4.11 | E₂,r=2;P=1 | (1−2i)(1+2i)=5; empty product 1 | Correct | None |
| Virtual abelian bounds | q=4,P=(T∓2)²,r=1 | A₁=1 or 9; bounds (2−1)²=1,(2+1)²=9 | Both endpoints attained | None |
| Virtual Hasse inequality | (T²−2)²,q=2,r=2 | N₂=−3, squared deviation (−3−5)²=64; RHS 4·2²·2²=64 | Bound does not imply positivity | None |
| Abelian count composition | E₂,r=s=2 | A₄=25; (T²+4)⁽²⁾(1)=(1+4)²=25 | Correct | None |
| Newton-data recovery / 4.11 | q=2,g=2,N₁=1,N₂=5 | b₁=1−3=−2;2b₂=(−2)(−2)+(5−5)=4, so b₂=2; symmetry gives −4,4 | Recovers 2.2.ac_c | R08: state headline |
| First-g recovery genus zero | P,Q monic symmetric of degree 0 | both P=Q=1 without count input | Correct | R08 |
| Full abelian-count recovery | q=1,(T−1)²,T²−1; q=2,E₂,O₂ | at q=1 all Aᵣ=0 for both, P≠Q; at q=2 A₁=1 versus 2 already separates | q≥2 is necessary | R08 |
| Jacobian-compatible definition | actual 2.2.ac_c; (T²−2)² | first Möbius quotients 2,0,1; second example N₂=−3 | Necessary condition distinguishes | None |
| Virtual abelian index zero | P=1; degree 2 P | empty determinant 1; det(1−Id₂)=0 | Universal zero Check false | R10 |
| Elliptic coordinate comparison / 5.1 | E/𝔽₂ at degree-two u=0; at infinity | cusp coordinates give 1≠3; original degree-one coordinates give 1=1 | Signature false | R01 |
| Supersingular comparison / 5.1 | q=2,a=−2; q=4,a=4; q=8,a=2 polynomial | p divides a and 1≤2v,2≤2v hold in first two; third has 3≤2 false | r≤2 restriction correctly separates polynomial case | None |
| Elliptic zeta / 5.2 | E₂ | Z=(1−2T+2T²)/(1−3T+2T²)=1+T+3T²+…; log Z=T+(5/2)T²+… | Coefficients match N₁=1,N₂=5 | No pinned zeta object to elaborate |
| Scalar/monic-minpoly dictionary / 5.3 | integral α=1+i; nonintegral α=(1+i√17)/3 | minpoly X²−2X+2 monic integral; rational minpoly X²−(2/3)X+2 not integral | §5.3 guard correct, convention 7 wrong | R09 |

### Worked-example and bounds recomputation

These additional computations use Newton sums from the stated polynomial coefficients. Labels identify README examples; database metadata were not used to infer the values.

| Example | N₁,…,N₆ recomputed | A₁,…,A₄ recomputed |
| --- | --- | --- |
| 1.2.ac | 1,5,13,25,41,65 | 1,5,13,25 |
| 1.2.ab | 2,8,14,16,22,56 | 2,8,14,16 |
| 1.2.a | 3,9,9,9,33,81 | 3,9,9,9 |
| 1.3.ad | 1,7,28,91,271,784 | 1,7,28,91 |
| 1.4.ae | 1,9,49,225,961,3969 | 1,9,49,225 |
| 1.4.e | 9,9,81,225,1089,3969 | 9,9,81,225 |
| 2.2.ac_c | 1,5,1,9,41,65 | 1,13,25,169 |
| 2.2.ab_a | 2,4,2,24,42,64 | 2,16,26,416 |
| 2.2.a_a | 3,5,9,33,33,65 | 5,25,65,625 |
| 2.2.ad_f | 0,6,9,10,30,87 | 1,19,76,171 |
| 2.2.a_ae | 3,−3,9,1,33,33 | 1,1,49,81 |
| 3.2.ad_c_b | 0,0,3,28,35,87 | 1,29,301,8149 |

For each row, Nᵣ=qʳ+1−sᵣ and Aᵣ=∏(1−αᵢʳ) give the same integers as the trace and determinant constructions. In particular, N₂=−3 for 2.2.a_ae rules out a curve realization; Weilness alone does not ensure positive virtual curve counts.

| (q,g) | floor of Hasse–Weil upper bound | Serre upper bound | floor of Ihara upper bound |
| --- | --- | --- | --- |
| (2,0) | 3 | 3 | 3 |
| (2,1) | 5 | 5 | 5 |
| (2,2) | 8 | 7 | 6 |
| (2,3) | 11 | 9 | 8 |
| (2,4) | 14 | 11 | 9 |
| (3,2) | 10 | 10 | 9 |
| (4,2) | 13 | 13 | 11 |
| (7,3) | 23 | 23 | 22 |
| (16,1) | 25 | 25 | 33 |

Ihara need not improve the other bounds: the last row is a negative control against treating it as their minimum. The adversarial table has 118 statement rows, supplemented by these 12 example rows and nine bound comparisons.

## Not verifiable

These limits concern source certification, not a request to park this review. Independent mathematics, ownership checks and elaboration were completed. No source manifest was present in the reviewed folder, and none was created or edited. Unavailable works were recorded together in the scratch missing-reference list using stable source keys.

- **stichtenoth2009**, *Algebraic Function Fields and Codes* (2009): the source-service DOI/title lookup did not yield a legal full text; the arXiv fallback returned HTTP 429. The earlier review's description as uncertified was not treated as evidence of theorem numbering. The cited Theorems 5.1.15, 5.1.16, 5.2.1, 5.2.3, 5.3.1 and 5.3.3, their pages and original hypotheses remain uncertified.
- **serre1983**, *Sur le nombre des points rationnels d'une courbe algébrique sur un corps fini*, pp.397–402: source-service lookup returned HTTP 429; author/institutional searches did not provide a readable legal copy. The printed theorem and proof locator were not certified.
- **serre2020**, *Rational Points on Curves over Finite Fields*: source-service lookup returned HTTP 429; catalogues and publisher/search results did not provide the text. No chapter-level claim is certified from those listings.
- **ihara1981**, *Some remarks on the number of rational points of algebraic curves over finite fields*, pp.721–724: the Tokyo repository copy returned HTTP 503. The Kyoto author bibliography did not supply an accessible copy. The displayed bound was checked independently, but no original equation or page-specific proof was read.
- **honda1968**, *Isogeny classes of abelian varieties over finite fields*, pp.83–95: the Project Euclid fetch returned an Incapsula error page. This is not the paper and was not used as evidence.
- **tate1966**, *Endomorphisms of abelian varieties over finite fields*, pp.134–144: the Springer DOI/title lookup did not provide the article; the fallback returned HTTP 429. Its background citation remains uncertified.
- **dickson1993**, *Dickson polynomials*: the source-service lookup returned HTTP 429. The pinned Mathlib recursion and evaluated identity were inspected instead; that does not certify an unspecified locator in the book.
- **lmfdb-av-fq**: av.fq.weil_polynomial, av.fq.number_field, av.fq.galois_group, av.fq.curve_point_counts, av.fq.initial_coefficients, lf.newton_polygon, lf.newton_slopes and g2c.good_lfactors returned browser challenges. Their mathematical prose and display conventions were not read. The nine readable knowls are identified in the source audit above.
- The exact stored half-list convention for Frobenius angles, the “geom_squarefree” metadata interpretation, and database rejection-policy wording were not established by a readable specification. Polynomial examples and ranks were checked independently; this does not certify every database field assertion.
- Claims about declarations in a later, unprovided Tau Ceti checkout were not verified. At the supplied pin, the missing-carrier statements were checked by source search. Ownership searches used main, board packages and the supplied open heads; no unprovided open checkout was sought.

## Source issues

- none

The differently oriented polynomial terminology in the LMFDB label and L-polynomial knowls was treated as a convention requiring translation, not as a proved mathematical error in either source.
