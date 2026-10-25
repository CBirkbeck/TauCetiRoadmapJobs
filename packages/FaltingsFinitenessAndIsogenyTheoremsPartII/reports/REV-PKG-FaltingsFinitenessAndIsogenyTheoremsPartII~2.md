<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1273#issuecomment-6396694167 -->
Review (codex) of 530454f

Verdict: needs_changes

1. **F01** (P1) General-polarization interpolation lacks its claimed cubist-model supply

   **Location.** `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:392`, with the dependency at line 410: “let L be symmetric ample” and “§§1.1–1.6, 2.4, 2.7, 3.4, 5.8 for Hermitian sections, semistable cubist models”.

   **Claim.** The cited supplier constructs the semistable cubist model needed for the interpolation theorem for every symmetric ample L, including arbitrary reduction.

   **Witness.** `TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/README.md:1586` restricts the construction to a symmetric principally polarizing line and fixed even r. On E₁×E₂, the product line of type (1,2) has χ=2, intersection degree 4 and polarization-map degree 4.

   The supplier's section-module construction at line 1588 concerns L and L^(r²) in that model. Section 2.4 constructs the Hodge line; it supplies no general cubist model. The example is admitted by the new §2.2b and excluded by §5.8's principal hypothesis. Taking powers gives type (n,2n); symmetrization gives type (2,4). Neither is principal. The added interpolation paragraph therefore has a real missing input, despite correctly retaining arbitrary reduction in its conclusion. The five slope gaps do not supply a line-bundle model.

   **Exact repair.** Add a named ArakelovGeometryAndAbelianHeights supplier contract, with the same new slug in the plan's append-only gaps list, extending §5.8's Moret–Bailly model construction from principal L to every symmetric ample L on an abelian variety over a number field, after finite semistable extension, with its cubist Hermitian extension and the finite locally free section lattices for the tensor powers used in §2.2b. Specify the canonical L² metric using probability Haar measure and finite-extension compatibility. Keep the filtered section-degree proof owned by §2.2b; do not request the whole interpolation theorem from the supplier. Cite that contract in line 410. This repair includes the type-(1,2) example with χ(L^D)=2D², while retaining the principal case χ(L^D)=D². An explicit owned reduction transporting all jets and metrics to the principal case would also work, but no such reduction is currently stated. Do not narrow §2.2 to principal polarizations.

2. **F02** (P1) The bounded integral basis is attributed to a supplier that explicitly excludes the bound

   **Location.** `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:85`: “Section 1.2 gives positive successive minima and a genuine integral basis bounded in terms of them”; see §2.3, lines 421–425, and §2.7, line 489.

   **Claim.** GeometryOfNumbersAndQuadraticArithmetic §§0.2 and 1.2 supply the bounded integral basis used for the short-period basis theorem.

   **Witness.** `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:581` explicitly excludes individual gauge bounds. In ℤ², (e₁,Ne₁+e₂) has the prescribed flags and determinant 1, but second length √(N²+1), while both Euclidean successive minima are 1.

   Section 1.2.7 supplies a real basis of lattice vectors attaining minima, which need not generate the integral lattice. Section 0.2.8 supplies an integral basis with the same flags, without controlling lengths. Their stated interfaces do not give the claimed bound. The missing strengthening already has an owner on main: `TauCetiRoadmap/HeightsAndUnits/README.md:250`, §2.1, especially its minima form at lines 270–274. It gives an integral basis with b_i in max(1,(i+1)/2)λ_iK, for a symmetric convex body with zero in its interior and a full discrete lattice.

   **Exact repair.** Import HeightsAndUnits §2.1 in Scope, an exact supplier contract, §2.3's Needs and Layer 2 Dependencies; use it wherever §2.7 requests a bounded integral basis. Retain GeometryOfNumbersAndQuadraticArithmetic for minima, their product bound and flag calculus. Add no new generic basis target or gap. For the witness lattice, HeightsAndUnits gives the standard basis with lengths 1,1 and bounds 1,1; the unbounded same-flag basis no longer masquerades as its output. A scratch dependency check including this import reports no problem.

3. **F03** (P2) The sharp elliptic estimates already belong to an available roadmap

   **Location.** `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:965`, 981 and 1007–1028: the non-CM graph, CM graph, sharp surface estimate and quadratic stable-height isogeny theorem are planned here as owned results.

   **Claim.** This package owns the Gaudron–Rémond sharp elliptic proof and its graph/surface inputs.

   **Witness.** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:711` states the all-number-field, CM/non-CM geometric bound. Line 713 expressly owns Proposition 6.9, both period graphs, the degree-two/twelve extensions and the sharp proof.

   That supplier gives 10⁷D²(max(h_F,985)+4 log D)². With H=max(1,h_F,log D), its bound is at most 9,781,210,000,000 D²H², exactly the strength requested here. This is the same mathematical object, not merely a similar application. After the dependency tool's required movable placement, EllipticCurveModularityPartII precedes this package. Adding its §6.0f citation in a scratch copy creates no cycle.

   **Exact repair.** Delete the duplicated owned targets and proof development in §§6.1–6.3; record their import from EllipticCurveModularityPartII §6.0f in Scope and Exact supplier contracts, then update §6.4 and Layer 6 dependencies. Keep the distinct j-height consequence and its native Lean headline. Definitions needed exclusively by the imported proof leave with it; do not leave removed-target stubs. The numerical comparison above verifies that the import supplies the package's bound also at D=1 and for negative stable height. This is a repairable ownership overlap, not a reason to reject the entire Part II.

4. **F04** (P3) The quotient-metric symmetric-square Check has the wrong slope

   **Location.** `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:80`: “For a rank-two trivial bundle, the n=2 symmetric-power bound is 0≤4 log 2”.

   **Claim.** Sym² of the trivial rank-two Hermitian bundle has maximal slope zero with the quotient metric specified at line 67.

   **Witness.** In Sym²(ℤ²), e₁²,e₁e₂,e₂² have squared norms 1,1/2,1. The primitive mixed line has slope (log 2)/2; these three orthogonal lines give maximal slope (log 2)/2.

   The minimum-norm lift of e₁e₂ is (e₁⊗e₂+e₂⊗e₁)/2, whose squared norm is 1/2. The claimed theorem's upper bound remains valid; the numerical Check is wrong.

   **Exact repair.** Replace the inequality by (log 2)/2≤4 log 2, approximately 0.34657359≤2.77258872. Explain that assigning every monomial unit norm would incorrectly give zero. Under a degree-two scalar extension, this corrected normalized slope remains (log 2)/2. Preserve the rank-one zero-slope Check separately. The same computation verifies the correction and the quotient-metric convention.

5. **F05** (P3) Profinite component homomorphisms have the wrong file locator

   **Location.** `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:49`: “with the component ring homomorphisms in `ZHat/Ring.lean`”.

   **Claim.** That file declares the component homomorphisms.

   **Witness.** At the pin, `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Component.lean:70` declares `TauCeti.zHat.component`; lines 121 and 136 prove continuity and surjectivity. `ZHat/Ring.lean` constructs the ring but declares no component homomorphism.

   **Exact repair.** Cite `ZHat/Component.lean:70` and the exact name `TauCeti.zHat.component`, retaining `ZHat/Ring.lean` only for the ring structure. Keep the correct Decomposition citations. At ℓ=2 and 3 the repaired locator gives component(0)=0, component(1)=1 and the expected reductions modulo ℓ^k. This is a locator correction: the mathematical supply already exists at the pin.

6. **F06** (P1) The claimed all-class Brauer restriction supply is only stated on 2-torsion

   **Location.** `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:93`: “its group law and restriction compatibility. Use the all-class comparison, including odd torsion”; §3.4 at lines 649–651 expressly consumes this arithmetic bridge.

   **Claim.** QuadraticFormInvariants Layer 7B, milestones 2–3 and 5, supplies base-change/restriction compatibility for every Brauer class.

   **Witness.** `TauCetiRoadmap/QuadraticFormInvariants/README.md:2467` states naturality for ι, the 2-torsion comparison defined at line 2456; line 2501 explicitly says “on 2-torsion”. A class α of order 3 has 2α≠0 and is outside that domain.

   Milestones 2–3 really do give an all-class comparison. However, milestone 2.5 and its continuous-cohomology counterpart refine the splitting field over a fixed ground field; they do not assert naturality when the ground field changes. No all-class ground-field naturality declaration occurs in the cited README or Suggested.lean. A number-field class with local invariants 1/3 and −1/3 distinguishes the missing case from the quaternion examples. This finding does not re-raise F04's settled legacy G3 retirement.

   **Exact repair.** The minimal repair here is to consume the already declared `gap:cyclic-maximal-subfield` directly in §3.4, as its statement already supplies a cyclic maximal subfield and presentation for every division algebra over its number-field center. Remove the assertion that this package additionally consumes the cohomological-to-algebraic restriction bridge, and remove the QuadraticFormInvariants supplier/Needs citation if it then has no consumer. Leave the proof of that bridge with the supplier fulfilling the cyclic contract; do not rebuild it here. For an index-three division algebra the repaired contract supplies a degree-three cyclic maximal subfield and presentation directly, with no invalid use of a 2-torsion theorem. If the package retains the bridge as a separate consumed input, it must instead name an actual all-class supplier or declare precisely that missing naturality contract, including finite separable base change and compatible separable closures.

Six findings: three P1, one P2 and two P3. The four blocking findings concern supply and ownership, not a failed Lean build. No author file was changed. The previous repair report's maintainer-only gap retirements remain settled; none is re-raised here.

## Verified sound

The review read all 53 numbered subsections, all 55 Needs lines, all eight Examples and Dependencies endings, the conventions and supplier contracts, both TOML files, the Lean file, and all 17 plan-gap entries. It revisited every repaired passage and sampled target; the 127-row numerical record below also covers unchanged targets rather than relying on uncomputed earlier summaries. Six findings remain; the following positive evidence is not an acceptance verdict.

### Previous findings, checked before the new pass

The repair report's restriction on editing existing design gaps is correct under this job's append-only rule. The residual legacy entries are recorded below, not re-raised. Quotes are from the repaired package, not from sources.

| Previous finding | Status and repaired passage | Independent result |
|---|---|---|
| F01, nonexistent consumer | Repaired: packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:15, “Elliptic and surface open-image theorems, real multiplication images, and density/automorphy results are outside this roadmap.” | The old name and its six unrelated consumer Checks are absent. |
| F02, unowned proof inputs/legacy G1,G2,G4,G5 | Partly repaired: packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:406, “The kernel therefore supplies a nonzero auxiliary section with all the stated jet vanishings”; :439 names the arithmetic evaluation estimate. | Multiplicity, interpolation, tangent heights and residual refinement are now targets. R01 concerns a newly used supplier hypothesis; R03 identifies existing ownership of the sharp part. Legacy retirement remains settled. |
| F03, function-field Tate step | Repaired: packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:1222, “The function-field Tate comparison is a target of this subsection”. | Rational algebraicity, independently transferred semisimplicity and integral saturation are distinguished; §8.1 does not use §8.2. G7 retirement is settled. |
| F04, legacy G3/G8 | Not repaired in the legacy entries; settled as not actionable. packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:99 names “gap:cyclic-maximal-subfield”; :113 names the analytic and Frattini supplies. | The named contract and the actual ArithmeticGaloisRepresentations §§5.8,6.4a exist. No duplicate mathematical request is inferred from the old prose. |
| F05, Minkowski supplier | Repaired: packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:35, “The strict inequality is retained.” | Opened the named Mathlib theorem at line 65. R02 is a different supplied-basis claim, exposed by following the repaired supplier pattern elsewhere. |
| F06, Part I boundary/commutant overlap | Repaired: packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:7, “FaltingsFinitenessAndIsogenyTheorems reaches R28.6”; :1170, “uniformity over subgroups of index at most d”. | R28.6.6 and R28.6.7 are cited. The explicit exceptional set/every-prime injection in §7.3 distinguishes its variant. |
| F07, missing native elliptic headline | Repaired: packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:1040 names “elliptic_isogeny_j_height_bound”. | packages/FaltingsFinitenessAndIsogenyTheoremsPartII/Suggested.lean:66 states it on nonsingular Weierstrass curves; D≥2 and geometric isogenies remain explicit. |
| F08, norm-body stand-in | Repaired: packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:647 retains the norm-body theorem; packages/FaltingsFinitenessAndIsogenyTheoremsPartII/Suggested.lean:10–27 identifies missing geometric carriers. | The three former norm-body scaffolding declarations are absent; only the genuine class-index and elliptic headlines remain. |
| F09, legacy G6 | Not repaired in the legacy entry; settled as not actionable. packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:49 consumes “TauCeti.zHat.ringEquivPiPadicInt”. | Product equivalence and prime idempotents are native. R05 only corrects the separate component-file locator. |
| F10, compound slope gap | Partly repaired: packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:67 specifies “the induced quotient Hermitian norms on SymⁿĒ”; :71 specifies “squared norm”. | Five precise contracts match the five appended plan entries. R04 corrects their new rank-two Check. Retirement of the old coarse entry remains settled. |
| F11, specialization injectivity repeated | Repaired mathematically: packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:55 requests “the cokernel of the A6.25(1) specialization map on geometric Hom is torsion-free”. | Existing injectivity is consumed; the remaining contract adds saturation. The immutable earlier plan sentence is settled. |
| F12, period generality and relative factorization | Repaired: packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:362 permits an “ample” line; :921 states factorization “simple over K”. | Arbitrary polarization and arbitrary extension K/k are retained. Source statements support them; R01 concerns their required model supply. |
| F13, five incorrect locators | Repaired: packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:577 cites the definition after (2.1); :965 and :981 cite the respective graphs; :1104 attributes the product argument correctly; :284 uses (22). | Read mw95 lines 157–164, gr14 lines 1813 and 1995–2012, ry25 lines 492–497 and mz20 line 788. |
| F14, process identifiers | Repaired: references use “mw94-preprint”, “ry25” and numbered README sections. | The old design identifiers do not occur in the README/manifest. No set_option, algorithm, sorry'd data or invented replacement carrier was found. |

### Source verification

All 15 seeded targets were compared with the accessible text at their stated locator, including hypotheses and page/version numbering. The manifest has 14 works: ten readable cached texts and four settled inaccessible works. Formula-bearing Bost pages and the class-index and complex-trace pages were also viewed as rendered legal cached PDFs where extraction omitted mathematics. Preprint citations retain internal preprint pages; published gr14/mw95/mz20 use printed pages. No new source key or fetch was necessary. The inaccessible works are listed under Not verifiable; their proofs are not certified by this review.

| Seeded target | Locator read | Comparison with the package |
|---|---|---|
| 1.1 Rational and complex representations | mz20 line 783, (21), p.653 | κP=Pρ; lattice basis and complex embedding are fixed. The rational extension is obtained from the integral map. |
| 1.2 Rosati length | mw94-preprint lines 103–147, (2.1), Lemma 2.2, internal pp.3–4 | Uses abelian trace of vv†; q([n])=2gn². General Rosati is rational; principal polarization supplies integral adjoints. |
| 1.3 Rosati discriminant | mw94-preprint lines 85–99, Lemma 2.1, internal pp.2–3; mz20 lines 886–888, p.655 | Gram determinant, basis independence and squared index law agree. The package correctly repairs the complex realification factor. |
| 1.4 Rosati submultiplicativity | mw94-preprint lines 138–147, Lemma 2.2, internal p.3 | Frobenius product inequality; rational maps follow by clearing denominators. It is an inequality, not multiplicativity. |
| 2.1 Minimal period subvariety | mw94-preprint lines 229–234, (4.1), internal p.6; bost95 lines 151–157, Theorem 2.2, pp.119–120 | The smallest connected abelian subvariety containing the period in its tangent space is the object estimated. Zero period gives the zero subvariety. |
| 2.2a Multiplicity estimate | bost95 lines 381–389, Theorem 4.1, p.128 | Nonzero section, finite subscheme and proper connected abelian subvariety; scheme length, not point count. Tensor-power exponent is g−dim B. |
| 2.5 Imaginary-part height bound | mz20 lines 937–958, Lemma 4.3, pp.656–657 | Weak y-region retained; no extra bound on x is introduced. Arithmetic value and weak-region cusp decay are separate inputs. Their settled primary sources remain unread. |
| 2.8 Short off-diagonal isogeny | mz20 lines 893–928, Lemma 4.2, pp.655–656 | Both off-diagonal maps nonzero isogenies; norm bound is C√D. Nonzero homogeneous degree-4g polynomial is tested on {0,…,4g}^r. |
| 2.9 Polarized rational isogeny | mw94-preprint lines 409–464, §6, (6.1)–(6.4), internal pp.11–12 | Rationality, polarization dependence and use of a least degree in logarithmic absorption agree. |
| 3.4 Division norm body | mw95 lines 319–344, Lemma 3.3 and (3.11), pp.13–14 | p_D≥2^m for division rational algebras; cyclic arithmetic needs the declared number-field maximal-subfield contract. |
| 3.5 Class-index bound | mw95 line 164, Class Index Lemma, p.8; lines 189–234, pp.9–10; line 344, p.14 | Exponent e/2 and opposite-module version agree. The package includes finite generation omitted from the source's shorthand class-index definition. |
| 4.1 Hom cross-discriminant | mw95 lines 392–412, before Lemma 4.2, pp.15–16 | Square of the determinant pairing the two Hom lattices; basis/index transformation is squared on each side. |
| 4.3 Simple cross-discriminant bound | mw95 lines 417–438, Lemma 4.2, pp.16–17 | Simplicity and isogeny are required; degree bound is c(A,B)^g. Uses division norm/degree conversion. |
| 5.2 Quantitative simple factorization | mw95 lines 45–50, Theorem I, p.5; lines 620–628, 661–695, pp.22–23 | Factors are relative to K, even for arbitrary K/k; the final field-degree argument gives dimension-only polynomial exponents. |
| 8.5 Finitely generated field bound | ry25 lines 456–477, Theorem 4.7, p.260; lines 652–674, pp.264–265 | Full geometric End is defined over the ground field; one bound precedes all open subgroups of index ≤d; all primes retained. |

Additional repaired inputs checked: bost95 Lemma 5.4 and (5.9)–(5.10), lines 598–603, pp.136–137; arbitrary-reduction extension at lines 624–628; Proposition 5.3, lines 553–567, pp.134–135; gr14 semistable metrics, lines 607–639, pp.358–359; Proposition 3.10, lines 668–687, p.359; symmetric-power bound, lines 1432–1441, p.377; Proposition 6.9, lines 1609–1653, pp.380–381; Theorem 1.1, lines 96–103, p.345; mz20 Lemma 2.2, lines 397–404, p.644; noot95 Proposition 1.3 and Corollary 1.5, lines 130–172, pp.163–165; ts18 Theorem 2.3, lines 154–163, pp.382–383. The residual theorem's precise application in ry25 does not replace the waived mw95-refine proof. Deligne's theorem at deligne84 line 534, p.39, concerns the full number-field Galois algebra; the package separately owns the open-subgroup product argument.

### Pinned declarations and ownership

The manifest pins were checked against the checkouts: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following declarations were opened, including their enclosing hypotheses. Paths beginning Mathlib or TauCeti are relative to the corresponding pinned library repository.

| Pinned file and line | Declaration / content verified | Boundary relevant here |
|---|---|---|
| Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean:65 | MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure | Finite real dimension, Haar measure, countable lattice/fundamental domain; strict >2^n covolume. |
| Mathlib/LinearAlgebra/Matrix/Trace.lean:43 | Matrix.trace is the finite diagonal sum | Empty trace is 0; no field assumption needed. |
| Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:63 | Matrix.det | Finite decidable indices, commutative coefficient ring; empty determinant 1. |
| Mathlib/LinearAlgebra/Matrix/ToLin.lean:582 | LinearMap.toMatrix | Actual bases, source/target order; finite indexing. |
| Mathlib/LinearAlgebra/Trace.lean:75 | LinearMap.trace | Defined as 0 without an available finite basis; the order theorem supplies a finite basis explicitly. |
| Mathlib/Algebra/Module/LinearMap/Defs.lean:1018 | LinearMap.mulLeft | Left multiplication, not reduced trace; used over ℤ for a possibly noncommutative order. |
| Mathlib/RingTheory/Discriminant.lean:67; RingTheory/Trace/Defs.lean:70 | Algebra.discr and Algebra.trace | Commutative algebra B; do not replace the noncommutative order invariant. |
| Mathlib/Analysis/Matrix/Normed.lean:657 | Matrix.frobenius_norm_mul | The Frobenius norm instance must be used, not an unspecified matrix norm. |
| Mathlib/Algebra/Module/Lattice.lean:67 | Submodule.IsLattice | Finite integral generation and full scalar span, with the scalar tower. |
| Mathlib/Algebra/Module/ZLattice/Basic.lean:433 | IsZLattice | Full span with the discrete-topology parameter; not a claim that an arbitrary subgroup is discrete. |
| Mathlib/GroupTheory/Index.lean:55 | AddSubgroup.index via Nat.card | Infinite quotient has value 0; packages/FaltingsFinitenessAndIsogenyTheoremsPartII/Suggested.lean:55 explicitly excludes it. |
| Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean:244 | isSemisimpleRing_iff_pi_matrix_divisionRing | Structural decomposition, not cyclicity over number fields. |
| Mathlib/NumberTheory/Height/NumberField.lean:145 | NumberField.absLogHeight₁ | Log of absolute multiplicative height; transcendental junk is irrelevant over a NumberField. |
| TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95 | AbelianVariety | Proper geometrically integral group scheme over a field; smoothness is derived. |
| TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:83 | AbelianVariety.End | Native additive Hom with composition, not arbitrary linear endomorphisms. |
| TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:61 | IsIsogeny | Finite and surjective. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean:99 | TauCeti.Isogeny.degree | Function-field extension degree; positive and includes inseparability. |
| TauCeti/Algebra/Module/ZLattice/Covolume.lean:42 | ZLattice.covolume_sq_eq_det_gram | Full discrete real inner-product lattice and Borel volume. |
| TauCeti/RingTheory/Semisimple/DoubleCentralizer.lean:260, :293 | Subalgebra.centralizer_centralizer_of_isSemisimpleModule; AlgHom.centralizer_centralizer_range | Required finiteness/semisimplicity retained; recovers the image, not an unfaithful source. |
| TauCeti/Topology/Algebra/Group/Profinite/ZHat/Ring.lean:69 | Ring on Additive zHat | Unit is the profinite generator; R05 fixes the component locator. |
| TauCeti/Topology/Algebra/Group/Profinite/ZHat/Component.lean:70, :121, :136 | component, continuous_component, component_surjective | Positive prime instance; compatible prime-power reductions. |
| TauCeti/Topology/Algebra/Group/Profinite/ZHat/Decomposition.lean:162, :182, :187, :320 | ringEquivPiPadicInt, continuity in both directions, tendsto_sum_idem | Ring/topological product and finite-sum limit of prime idempotents. |
| TauCeti/Topology/Algebra/Group/OpenSubgroup/TopologicallyFinitelyGenerated.lean:114 | finite_openSubgroup_index_eq | Compact topological group plus finite topological generation; finite union gives index ≤d. |

Object searches used both the pinned libraries and `roadmaps grep` over main and the supplied 357-head index, then opened the relevant supplier statements. Searches covered Rosati/regular traces, lattice bases/minima, division norm bodies, class indices, cubist models, Hermitian slopes, zero estimates/interpolation, Hom specialization, Tate comparison, residual semisimplicity, centralizers, profinite image algebras, Frattini groups and quantitative elliptic isogenies. The source theorem names alone were not the search keys. No collision with the three fully qualified names in Suggested.lean was found. The native commutative discriminant is not the noncommutative extension. The native generic Tate module is not an abelian Tate module with the integral geometric-End action required here.

The board package index was read before any absence claim. The 20 indexed remote package heads were also attempted: five were readable and gave no relevant overlap; fifteen returned 404 and are listed below. Named open roadmap heads were covered by the roadmap tool's index; the inaccessible separate board branches are not silently counted as searched.

### Resolved cross-roadmap contracts

These are the statements actually read on main or the supplied open heads, not recollected section names. Open-head output's extra header line was removed when recording repository line numbers.

| Supplier | Sections / file lines read | Resolution |
|---|---|---|
| AbelianSchemesAndArithmeticModuli | TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1414 A3.3; :1440 A3.4; :1453 A3.5; :1626 A3.9; :1765 A4.1 | Finite-flat quotient, torsion divisibility, duals, rational Rosati and integral Tate realization. Principal integrality is distinguished from general rational Rosati. |
| Same | TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:2439 A5.1; :2486 A5.2; :2539 A5.3; :2570 A5.4 | Period/Betti comparison, linear-first Hermitian convention, Appell–Humbert, χ=∏d_i and intersection g!χ. |
| Same | TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:2744 A6.1; :2801 A6.4; :2834 A6.5; :2850 A6.6; :2866 A6.7; :2886 A6.8; A6.10–A6.14 at :2920–2993 | Degree, simple Hom, reducibility, homogeneous degree, finite free Hom, semisimple blocks, trace/characteristic polynomial and positivity. |
| Same | TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:3241 A6.20; :3267 A6.22; :3350 A6.25 | Torsion field defines Hom, coefficient Hom, relative rigidity and normal-base extension. Specialization injectivity exists; its cokernel saturation is an additional declared contract. |
| ArakelovGeometryAndAbelianHeights | TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/README.md:155–350 §§1.1–1.6; :760 §2.4; :839 §2.7; :1026–1080 §§3.4–3.5; :1203 §4.4 | Hermitian norms/degrees, Hodge line, Deligne shift, stable height/product/duality, isogeny height change. Maximum-slope operations are not silently inferred from ordinary degree. |
| Same | TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/README.md:1582 §5.8; :1622 §5.9; :1657 §6.1; :1675 §6.2; :1736 §6.5 | Theta/matrix comparison, j-height bound, Zarhin dimension/height multipliers, dimension-only lower bound. General cubist-model claim fails as R01 explains. |
| GeometryOfNumbersAndQuadraticArithmetic | TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:238 §0.1; :275 §0.2; :362 §0.3; :452 §1.2; :701 §1.5 | Gram/covolume, adapted flags, minima/product estimates. No bounded integral basis in the cited sections: R02. |
| HeightsAndUnits, main | TauCetiRoadmap/HeightsAndUnits/README.md:250–274 §2.1 | Existing general gauge and minima forms of the bounded integral basis; the correct replacement for R02. |
| IntegralLattices, main | TauCetiRoadmap/IntegralLattices/README.md:507 Layer 0; :590 Layer 1 | Integral lattice and dual/discriminant carriers. These are imported, not rebuilt. |
| SemisimpleAlgebras, main | TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:212, :233, :293, Layers 2,3,6 | Simple-module/block assembly, density, algebraic Brauer group and splitting; does not assert the requested number-field cyclic maximal splitter. |
| QuadraticFormInvariants, main | TauCetiRoadmap/QuadraticFormInvariants/README.md:2293 Layer 7B; :2326 crossed products; :2434 comparison; :2467 naturality | All-class crossed-product/H² comparison exists; the stated ground-field naturality is only on 2-torsion. R06 corrects the overclaim. |
| ClassFieldTheory, main | TauCetiRoadmap/ClassFieldTheory/README.md:1552 Layer 10 | Cohomological global Brauer sequence including infinite places; the cyclic degree-index extension remains the precise declared gap. |
| FaltingsFinitenessAndIsogenyTheorems | TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md:1812 R28.4.5; :1840 R28.4.6; :2624 R28.6.6; :2645 R28.6.7 | Number-field Tate/semisimplicity, cyclic non-CM Hom, almost-all-prime integral commutant and separable-order reduction. The package's genuine extensions are explicitly distinguished. |
| ArithmeticGaloisRepresentations | TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:3309 §5.8; :3955 §6.4a; :4431 §7.6 | Compact analytic subgroup structure, finite Frattini detection and algebraic monodromy. |
| NeronModelsAndSemistableAbelianVarieties | TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:3538 §6.0 | Independence, compatible torsion specialization and full-image Hilbert specialization, including the finite-type passage. |
| InverseGaloisAndArithmeticFundamentalGroups | TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:1881 IG.2.4; :2115 IG.2.6 and the following Frattini subsection | Hilbertian finite extensions/function fields and finite full-image criterion; constant-field components are not confused with geometric connectedness. |
| AutomorphicBundles | TauCetiRoadmap/AutomorphicBundles/README.md:3840 B4.2; :4060 B4.9; :5002 B5.13 | Cusp sections, analytic/algebraic comparison and Fourier conventions. B5.13's rank-one expansion alone is not the general weak-region decay; the fixed-family gap supplies the extension. |
| EllipticCurveModularityPartII | TauCetiRoadmap/EllipticCurveModularityPartII/README.md:711–724 §6.0f | Existing sharp surface/graph/quadratic theorem and its proof; R03. |

The README's downstream mention of AbelianSchemesAndArithmeticModuliPartII was resolved as an existing distinct Betti/counting consumer, not a dependency. No supplier inference is made from an unnamed outside open-image project. The main ComplexTori and Isoperimetry roadmaps were read for shape. This package has the required opening, scope, conventions, contracts, ordered layers, examples, dependencies, consumers and references. Its definition/API/Check blocks were inspected; R04 is the numerical Check defect found. No copied source passage, route-specific good-prime restriction, executable algorithm or process-directed instruction was adopted.

### Gaps and direction

The eight operative named contracts are hom-specialization-saturation, cyclic-maximal-subfield, fixed-siegel-cusp-family, hermitian-maximal-slope-existence, hermitian-symmetric-power-slope, hermitian-morphism-slope, hermitian-metric-rescaling and semistable-abelian-tangent-metric. Each slug occurs in the README and plan. The five newly appended slope entries agree with their README text. Their field, rank, metric, nonzero-map and semistable-extension hypotheses are precise. They request extensions of the cited supplier statements, not replacements for existing native objects. The specialization plan entry retains its old redundant injectivity clause; the README correctly requests only the missing cokernel assertion. The coarse hermitian-maximal-slope entry and G1–G8 remain maintainer housekeeping under the settled prior repair decisions. R01 requires a genuinely additional contract; R02 needs an existing owner, not a gap.

The required dependency check returned:

```text
moved: FaltingsFinitenessAndIsogenyTheoremsPartII moved in the merge order from #47 to #228, right after its last supplier AutomorphicBundles (ArithmeticGaloisRepresentations, InverseGaloisAndArithmeticFundamentalGroups, NeronModelsAndSemistableAbelianVarieties, GeometryOfNumbersAndQuadraticArithmetic, ArakelovGeometryAndAbelianHeights, FaltingsFinitenessAndIsogenyTheorems also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 51 roadmaps, 588 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurred. The moved line is the authorized movable placement, not a finding. A scratch copy adding the HeightsAndUnits §2.1 and EllipticCurveModularityPartII §6.0f contracts returned the same placement after AutomorphicBundles, additionally named EllipticCurveModularityPartII among the passed suppliers, and `depcheck: 51 roadmaps, 589 edges, 0 problem(s)`. The merge-order file was not edited.

### Acceptance signatures and padding

The headlines identified in the README are the period theorem; short-endomorphism spanning and discriminant bounds; polarized rational isogeny bound; division-order class-index bound; polarization-free discriminant bounds; quantitative simple factorization; rational, relative and geometric isogeny estimates; sharp surface and quadratic elliptic stable-height estimates; elliptic j-height estimate; adelic product comparison; uniform residual and integral number-field Tate bounds; finitely generated field Tate comparison; End-preserving specialization; and supported/full finitely generated field index bounds.

Suggested.lean states the two statable headlines: class_index_bound and elliptic_isogeny_j_height_bound. Its only definition, regularOrderDiscriminant, has a real body on native order/basis carriers and is needed by the first theorem. The module docstring names the other headlines and their missing polarized period/height or abelian Tate/End-action interfaces. There is no norm-body replacement theorem, arbitrary predicate standing for a missing carrier, or sorry'd data.

Elaborating the exact package file with `lake env lean` from the pinned content checkout succeeded with exit 0. The only warnings were the two expected “declaration uses sorry” warnings, at packages/FaltingsFinitenessAndIsogenyTheoremsPartII/Suggested.lean:47 and :66. The imported degree module's object file existed; no build was necessary. A scratch copy with #check @name for all three declarations also elaborated. Comparing all expanded binders with the README found no lost hypothesis: division algebra and finite rational dimension, full order and module spans, e>0 and Module.Finite ℤ M all survive; the elliptic theorem retains NumberField, both IsElliptic instances, D≥2 and geometric isogeny existence. C is quantified before the field and curves.

Both sorried theorems were tried with the single tactic simp in a scratch copy. Both left substantive existential goals unsolved. Reading their definitions and the pin confirmed that rfl/infer_instance or one existing lemma does not prove either assertion. Neither is padding. The module has one Mathlib import, one actually used Tau Ceti import, the correct namespace, declaration docstrings and layer order; it has no set_option, lemma, admitted example or extra data definition. No Lean process was left running.

### Computed adversarial record

The following rows are evaluations and countermodels, not assertions that finitely many examples prove a theorem. A symbolic C in a bound remains symbolic. Each definition's competing model and each theorem's boundary instances are recorded; API identities sharing a carrier are split where they test different laws. In all rows, “retain” means no mathematical change from that test, subject to R01–R03 and R06's supply/ownership corrections. Characteristic-p/DVR/zero-ring inputs are excluded where the displayed number-field, division-ring, positive-rank or prime hypotheses require it. The finite nonreduced jet and non-abelian subgroup cases are tested explicitly.

| Statement / law | Instances tried | Computed values on the two sides / competing models | Result | Change |
|---|---|---|---|---|
| End multiplication convention | Matrix units on E² | e₁₂e₂₁=e₁₁; reversed order=e₂₂ | Composition direction distinguished | Retain |
| Field versus coefficient extension | Gaussian elliptic curve over ℚ and ℚ(i) | Rational End rank 1; geometric End rank 2; tensoring the first with ℚ still has dimension 1 | Different operations | Retain |
| Height clamp and constants | D=1, h_F=−1; identity isogeny | H=max(1,1,−1)=1; degree 1 requires C≥1 | Negative heights allowed | Retain |
| Polarization degree | Elliptic line of degree 3 | χ=3; polarization-map degree=9; principalization degree=3 | Square-root convention | Retain |
| Zarhin convention | g=1, h_F=h | Dimension 8; height 8h; for h=−1, height −8 | Both multipliers eight | Retain |
| Abelian versus regular trace | Non-CM E and E² | Tr_A(1)=2,4; regular traces=1,4 | Not interchangeable | Retain |
| Hermitian sign convention | Gaussian periods 1,i | E(i,1)=1; E(1,i)=−1 | Linear-first convention consistent with supplier | Retain |
| Empty determinants / degrees | Zero module and dimension-zero abelian variety | det(empty)=1, tr(empty)=0, degree(identity)=1 | Zero-dimensional exception explicit | Retain |
| Positive-dimensional denominator | g=0,1 | 2g=0,2; g=0 would introduce total division by 0 | Inequality requires g≥1 | Retain |
| Prime convention | ℓ=2,3 | Possible exceptional local additive indices 4,9; product 36 | Neither small prime discarded | Retain |
| §1.1 rational/complex representation | [−2] on E; i on Gaussian E | κP=−2P=Pρ; ρ(i)=[[0,−1],[1,0]], κ(i)=i, both traces 0 | Equation and signs hold | Retain |
| §1.1 lattice characterization/injectivity | Scalar √2 and scalar 0 | √2·1 is outside ℤ+iℤ; zero lattice action gives zero tangent action | Arbitrary complex scalars excluded | Retain |
| §1.1 basis change and composition | Swap Gaussian basis; compose i with i | ρ(i) conjugates to [[0,1],[−1,0]]; κ(i²)=−1 and ρ(i)²=−I₂ | Compatible homomorphisms | Retain |
| §1.2 positivity / nondegeneracy | E with 0,1,−1,i | q=0,2,2,2; lengths 0,√2,√2,√2 | Only zero has zero length | Retain |
| §1.2 homogeneity / triangle | Scalars 2,3,5 on E | q=8,18,50; ℓ(5)=5√2=2√2+3√2 | Absolute scalar convention | Retain |
| §1.2 norm versus degree | S=[[1,1],[0,1]] on E² | q(S)=2(1+1+0+1)=6; degree(S)=1 | Degree cannot replace norm | Retain |
| §1.3 Gram discriminant | ℤ[i], ℤ[2i], empty lattice | det diag(2,2)=4; det diag(2,8)=16; empty determinant=1 | Index-two law 16=2²·4 | Retain |
| §1.3 basis / covolume law | Gaussian basis swapped or sign reversed | Gram determinant remains 4; covolume=2; its square=4 | Orientation-independent positive invariant | Retain |
| §1.4 submultiplicativity | Scalars 2,3; shear S; zero | q(6)=72≤8·18=144; q(S²)=12≤6²=36; q(0)=0≤0 | Multiplicative equality false | Retain |
| §1.5 determinant degree | [−2] on E; E² projection; dimension 0 | Degree=4=det ρ; projection=0=det ρ; dimension-zero degree=det(empty)=1 | Isogeny/nonisogeny split correct | Retain |
| §1.5 homogeneous polynomial / zero | [t] on E and on E² | Degrees t² and t⁴; at t=0 both 0; zero polynomial is excluded before a nonzero grid value is used | Correct degrees and nonzero premise | Retain |
| §1.6 degree bound | [−2] and S on E² | 16=(16/4)²; 1≤(6/4)²=9/4 | Equality and strict examples | Retain |
| §1.7 realification trace | v=i,w=i; v=1,w=i on Gaussian E | 2 Re(i·overline(i))=2; missing conjugation gives −2; missing 2 gives 1; cross pairing=0 | Normalization excludes both wrong models | Retain |
| §1.8 coordinate scales | τ=2i, κ=2i | (a,b,c,d)=(0,4,−1,0); y=2; b-scale=2, c-scale=1/2; ℓ=√8 | Reciprocal scales necessary | Retain |
| §1.8 real-part restriction | τ=i versus τ=100+i | y=1 in both; x=0 versus 100; the second violates a fixed small x-bound | Coordinate theorem's x-hypothesis retained | Retain |
| §2.1 minimal period subvariety | E²: (η,η), (η,0), 0 | Dimensions 1,1,0; product-principal normalized degrees 2,1,1 | Zero and diagonal distinguish the minimum from the whole variety | Retain |
| §2.1 leastness / transport | Swap factors of period (η,0) | Minimum changes E×0 to 0×E; degree remains 1 | Isomorphism transport holds | Retain |
| §2.2 arbitrary polarization | Elliptic lines of degree 1 and 3; zero period | Nonzero-period subgroup degrees 1,3; zero subgroup degree 1 in both | Constant must record polarization degree | Retain; R01 supply |
| §2.2 polarization powers | L to L⁴; dim A=g, dim B=b | Δ_A multiplies by 4^g; Δ_B by 4^b; squared period norm by 4 | No principal-only substitution | Retain |
| §2.2a multiplicity | Degree-two line on E; two reduced zeros | length(S)·d_L(0)=2·1=2=d_L(E) | Equality instance | Retain |
| §2.2a nonreduced scheme | L=O(2[0]), length-two thickening | Scheme length 2 gives 2≤2; reduced point count gives 1 | Multiplicity retained | Retain |
| §2.2a zero and empty inputs | Zero section with length-three S; empty S | Zero section would require 3≤2; empty gives 0≤2 with B=0 | Nonzero hypothesis necessary | Retain |
| §2.2a tensor-power version | L^D and dim B=b | D^b length·d_L(B)≤D^g d_L(A); cancellation gives D^(g−b) | Exponent fixed | Retain |
| §2.2b jet definition / truncation | dim W=1, orders 0,1,2 | Coordinate rings have dimensions 1,2,3; truncations 3→2→1; reduced model has 1 at every order | Full jets determined | Retain |
| §2.2b graded piece | dim W=2, order 2 | Cumulative length 6; homogeneous piece has dimension 3; omitting xy gives totals 5 and 2 | Symmetric-power grading correct | Retain |
| §2.2b translation / union | g=2,M=N=2, primitive period | P has order 2; origin jet length 9, P-jet length 5; union length 14, not 19 | Shared origin counted once | Retain |
| §2.2b noninjectivity | Principal surface, D=4, previous T | Source dimension 16, target dimension 14, kernel dimension≥2 | Sufficient arithmetic conditions need not be necessary | Retain |
| §2.2b three parameter inequalities | g=2,r=h=d=1,N=2 | M≥CD; D²d_L(A)≥CM; M²≥16CD(D+M+log2) | All three scales match Bost | Retain |
| §2.2b cubist-model hypothesis | Product line of type (1,2) | χ=2, intersection degree=4, map-degree=4; principal values 1,2,1 | Required general model absent from cited supply | R01 |
| §2.2b height normalization | Dimension 2 | h_Del−h_F=log π; replacing squared Hodge metric by π⁻² changes normalized degree by log π | Supplier convention agrees | Retain |
| §2.2b tangent-height upper bound | B=0; rank-b subspace, L to L⁴ | h(0)=0 and log d_L(0)=0; height shifts b log2, degree log shifts b log4 | Rank-zero and scaling compatible | Retain |
| §2.2b subspace-height lower bound | F=0; degree-two extension | 0≥−c_g H; unnormalized degree and denominator both multiply by 2 | No field-degree loss | Retain |
| §2.3 short integral period basis | Zero lattice; diagonal pair in ℤ² | Empty basis size 0, degree 1; det((1,1),(1,−1))=−2, index 2 | Independent family is insufficient | Retain theorem; R02 |
| §2.3 claimed basis supply | Euclidean ℤ²; same-flag basis e₁,Ne₁+e₂ | Minima 1,1; supplied flag lengths 1,√(N²+1); HeightsAndUnits can choose 1,1 | Flags do not bound lengths | R02 import tested |
| §2.4 fixed-family value bound | Fixed nonzero value e⁻²; scale by e⁻ᴺ | log max(1, reciprocal)=2 versus N+2 | Arbitrary family rescaling would defeat uniformity | Retain fixed normalization |
| §2.5 weak imaginary-part bound | τ=it and 100+it; δ=1 | Both have tr y=t and y≥diag y≥I for t≥1; decay/evaluation combine as ct≤log M+log reciprocal | No x-bound needed here | Retain |
| §2.6 short End span | Non-CM E; independent rank-two vectors | q(1)=2; two independent vectors can have rational rank 2 but integral index 2 | Target says spanning set, not integral basis | Retain |
| §2.7 End discriminant estimate | Non-CM E and Gaussian E | Rosati determinants 2 and 4; Gaussian End over ℚ has rank 1, over ℚ(i) rank 2 | Definition field matters | Retain; R02 for basis route |
| §2.8 off-diagonal extraction | Swap and identity on E² | Swap q=4, length 2, both off-diagonal degrees 1; identity both 0 | Nonzero polynomial excludes useless endomorphism | Retain |
| §2.8 polynomial selection | g=1, swap coefficient t | P(t)=t⁴, P(0)=0, P(1)=1; grid 0,…,4 contains a nonzero value | Degree-4g grid valid | Retain |
| §2.9 least rational isogeny / height | E→E; [2] | Least N=1, log N=0; [2] degree 4, height difference 0≤(log4)/2=log2 | Uses least degree for absorption | Retain |
| §3.1 signed regular discriminant | ℤ, ℤ[i], ℤ[2i], Lipschitz quaternion order | Determinants 1,−4,−16,−256 | Whole regular trace and sign retained | Retain |
| §3.1 nondegeneracy boundary | Dual numbers ℚ[ε]/ε² | Trace Gram diag(2,0), determinant 0 | Semisimple hypothesis excludes false nonzero assertion | Retain |
| §3.1 basis and suborder laws | Gaussian order, index-two suborder | (−4)·2²=−16; sign change of basis multiplies determinant by (−1)²=1 | Signed index law | Retain |
| §3.1 zero-ring data definition | Subring of zero ring, empty basis | Matrix is 0×0, determinant 1 | Real-body definition is total; division theorem excludes zero ring | Retain |
| §3.2 class-index definition | PID order; O=ℤ[2i], M=ℤ[i]; rank 0 | PID index 1; [M:αO]=2Norm(α), minimum 2; zero-module index 1 | Finite full lattices, not arbitrary torsion-free modules | Retain |
| §3.2 opposite modules / monotone bound | Gaussian O and Oᵒᵖ; I=2,3 | Discriminants both −4; an index-2 witness meets I=2 and I=3, least value remains 2 | Minimal parameter matters | Retain |
| §3.3 norm body / basis invariance | ℚ with basis 1 and 2 | sqrt discriminant×volume=1·2=2 and 2·1=2; coordinate of 1 is 1 versus 1/2 | Jacobian cancellation | Retain |
| §3.3 Gaussian norm body | ℚ(i), basis 1,i | N=x²+y²; disk area π; sqrt absolute discriminant=2; product 2π | Ordinary real measure | Retain |
| §3.3 regular norm identities | ℚ scalars 0,1,2,3 | N(0)=0, N(1)=1, N(2·3)=6=2·3 | Correct normalization and multiplicativity | Retain |
| §3.3 division boundary | M₂(ℚ), e₁₂ | e₁₂≠0 but determinant of left multiplication=0 | Division cannot be dropped from nonzero-norm step | Retain |
| §3.4 division-body lower bound | ℚ; ℚ(i); rational Hamilton algebra | 2=2¹; 2π≥2²; 16·π²/2=8π²≥2⁴ | Real, complex and nonsplit instances agree | Retain |
| §3.5 class-index headline | O=ℤ,e=2; O=ℤ[2i], M=ℤ[i]^e | Indices 1≤1; e=1: 2≤4; e=2: evident index 4≤16 | Half-rank exponent consistent | Retain |
| §3.5 finite-generation / infinite-index guard | M=ℤ[1/2]; full finite lattice | First is not finitely generated, every cyclic quotient infinite with native index 0; finite full lattice index≥1 | Both safeguards necessary | Retain |
| §3.6 isotypic trace comparison | Non-CM E; Gaussian E; non-CM E² | (2g)^m·abs disc = m^m·Rosati det gives 2=2, 16=16, 4096=4096 | Right trace scaling | Retain |
| §3.6 nonisotypic boundary | E×E_CM | For the two central factor idempotents, regular traces 1,2 but abelian traces 2,2 | No single proportionality outside isotypy | Retain |
| §4.1 Hom pairing and square | Self-Hom ℤ; self-Hom ℤ[i]; lattices 2ℤ and 3ℤ | Cross-discriminants 1,16,36; paired determinant in last example 6 | Square, not determinant itself | Retain |
| §4.1 basis and index law | Negate one basis; replace 2ℤ by 4ℤ | Determinant −6 still gives 36; determinant 12 gives 144=2²·36 | Both sides' index squares | Retain |
| §4.2 matrix-block determinant | M₂(ℤ), M₄(ℤ), M₂(ℤ[i]) | Regular discriminants −16, 2³², 2¹⁶ | Parity and coefficient dimension correct | Retain |
| §4.3 simple cross-discriminant isogeny | Identity on non-CM E and Gaussian E | Degrees 1≤1¹ and 1≤16¹ | Simple self-isogenies fit | Retain |
| §4.3 norm-degree conversion | Gaussian scalar 2 | Regular norm 4; elliptic degree 4=4^(2g/m), g=1,m=2 | Exponent fixed | Retain |
| §4.4 stable power bound | Diagonal E⊂E^N, End E=ℤ | Coordinate inverse degree 1; i₁(ℤ)²=1 for every N≥1 | No N-dependence introduced | Retain |
| §4.5 polarization removal | Non-CM E and its Zarhin variety | Ordinary End discriminant 1; Zarhin dimension 8 and height 8h_F | Principal construction applied to enlarged variety | Retain |
| §4.6 stable subvariety bound | Diagonal A⊂A⁸ | Projection inverse degree 1; dim B=dim A | Actual product premise used | Retain |
| §4.7 product-dual isogeny | Product E×E′; identities | Product degree 1·1=1; factor-height sum h+h′ (e.g. −1+2=1) | Negative individual height not dropped | Retain |
| §5.1 product-target restriction | Identity on E; projection E²→E | Restricted identity degree 1; projection has kernel dimension 1 and is not an isogeny | No dimension-changing degree shortcut | Retain |
| §5.2 quantitative factorization | Simple E and E² | Multiplicities 1 and 2; least product-isogeny degree N=1, log N=0 | Relative simplicity and least degree compatible | Retain |
| §5.3 reverse isogeny bound | [2] on E, degree N=4 | Dual degree 4=4^(2g−1); composite [4] degree 16=4·4 | Correct quasi-inverse direction/exponent | Retain |
| §5.4 Hom definition field | g=1, 3-torsion | GL₂(𝔽₃) order (9−1)(9−3)=48; joint field bound 48²=2304 | Dimension-only finite descent | Retain |
| §5.4 arbitrary relative extension | K=k, k̄, k(t), A=E² | Identity factorization degree 1 in each; k(t)/k has infinite degree but base D unchanged | No finite-extension restriction silently added | Retain |
| §5.5 geometric isogeny | Non-CM E and nonsquare quadratic twist | Geometric isomorphism degree 1; rational Hom rank 0 | Geometric conclusion cannot become k-rational | Retain |
| §6.1 non-CM graph | E=E′, identical period bases | G={(x,y,x,y)}, dim 2; intersection with 0²×E² has order 1=N | Graph/intersection formula sound | Import under R03 |
| §6.2 CM graph | Gaussian E=E′, shortest periods 1,1 | Diagonal dim 1; projection degrees 1,1; composite 1·1=1 | Different dimension and product degree | Import under R03 |
| §6.3 avoidance distance definition | Gaussian E²; B diagonal or coordinate factor | Diagonal δ=1/√2, ρ=1; coordinate δ=ρ=1 | Quotient norm distinguishes avoidance from shortest period | Import under R03 |
| §6.3 x and factorial convention | L=L₀^a, a=10⁵; coordinate B and B=0 | d_X=2a²=2·10¹⁰; d_B=a; x(B)=1/(2a)=5·10⁻⁶; x(0)=1/(√2a) | Coordinate factor minimizes; factorial retained | Import under R03 |
| §6.3 large-degree surface inequality | Previous scaled Gaussian product | δ⁻²=10⁻⁵; degree term x log(2·10¹⁰)=0.00011859499 | RHS degree term alone suffices for C≥1 in this test | Import under R03 |
| §6.3 scaling / extension averages | L to L⁴; degree-two field extension | x→x/4; δ,ρ→2δ,2ρ; cotangent slope→μ+log2; sum and D both double | Scale and normalization agree | Import under R03 |
| §6.3 matrix-period preparation | Gaussian product L₀ and L₀⁴ | Mean ρ⁻²=1,1/4; d_L=2,32 | Weakened source bound has correct scale | Import under R03 |
| §6.3 cotangent-slope preparation | g=2; h⁰(L)=1,16 | Upper bound 3h_Del+64log2; tensor fourth power increases upper bound by 6log2, slope by log2 | h⁰=d_L/2 is essential | Import under R03 |
| §6.3 quadratic elliptic theorem | Identity at D=1,2; imported explicit bound | N=1≤C H²; D²=1,4; 10⁷(max(h,985)+4logD)²≤9,781,210,000,000H² | Stronger supplier implies target | R03 |
| §6.4 native j-height theorem | j=0, D=1,2 | D=1 formula with logD would be 0; separate bound is C; D=2 gives 4C(log2)²≈1.921812C | D≥2 guard survives Lean elaboration | Retain |
| §7.1 finite algebraic span | Trivial image on Ẑ²; full elementary matrix image | Trivial span rank 1 versus centralizer rank 4; (I+e₁₂)−I=e₁₂ and e₁₂e₂₁=e₁₁ give full matrix rank 4 | Algebra differs from the group and from arbitrary centralizer | Retain |
| §7.1 unitality / universal property | Rank-one T, identity subgroup | Span of identity is Ẑ, rank 1; the zero submodule lacks 1 | Smallest unital algebra fixed | Retain |
| §7.2 product and index | Additive local indices 2 at 2, 3 at 3, 1 elsewhere | Product index 6; infinite sequence of nontrivial finite factors has unbounded finite-product indices | Closure needed before full product | Retain |
| §7.3 saturated centralizer kernel | ψ(x)=2x; ψ=0 | First integral kernel 0, saturation index 2; mod2 kernel dimension 1, mod3 dimension 0; second saturation index 1 | Injection every prime, equality outside divisors | Retain |
| §7.3 dual row lattice convention | Matrix ψ=[2 0] | Rows span 2ℤ·e₁* in dual; saturation quotient order 2; kernel ℤ·e₂ | Source-dual direction fixed | Retain |
| §7.4 bounded-index finiteness | ℤ₂ and d=5 | Open subgroups 2^nℤ₂ with indices≤5 are 1,2,4: three choices | Finite maximum well-defined | Retain |
| §7.4 compact/finite-generation boundary | Discrete infinite direct sum of C₂ | Infinitely many coordinate kernels of index 2 versus three choices above | Structural hypotheses not removable | Retain |
| §7.5 residual theorem | Full GL₂ versus trivial action on 𝔽₂² | Commutant dimensions 1 versus 4; full GL₂ generated algebra has dimension 4 also at p=2,3 | Exceptional threshold cannot be replaced by zero | Retain |
| §7.6 integral generation | Finite ℤ_ℓ-module Q with Q/ℓQ=0; divisible torsion module | Nakayama gives Q=0, index 1; ℚ_ℓ/ℤ_ℓ has Q/ℓQ=0 but Q≠0 | Finiteness is essential | Retain |
| §7.7 uniform global index | Exceptional bounds at 2,3 | 4·9=36; all remaining local factors 1 | Full-prime product retained | Retain |
| §8.1 rational Tate comparison | Constant non-CM E over ℚ(t) | Hom⊗ℚ_ℓ and equivariant End each dimension 1, for ℓ=2,3 | Field finite generation, not finite algebra generation | Retain |
| §8.1 semisimplicity transfer | Constant E; identity full-image specialization | Generic and special representation matrices coincide; invariant direct-sum dimensions 2=1+1 in a split test | Equality of selected image transfers complements | Retain |
| §8.1 integral saturation | f=[ℓ^n] on E | Tate map divisible by ℓ^n; quotient factor [1] has degree 1; original degree ℓ^(2n) | Rational comparison alone is not the saturation proof | Retain |
| §8.2 integral End specialization | 2ℤ⊂ℤ at auxiliary prime 3 | Tensor equality over ℤ₃; integral cokernel ℤ/2≠0; torsion-free cokernel would force index 1 | Declared saturation input necessary | Retain |
| §8.2 compatible torsion specialization | Constant E over ℚ(t) | End rank 1→1; ℓ^n-torsion cardinality ℓ^(2n) on both fibres | Actual realization and direction fixed | Retain |
| §8.3 supported subgroup | Diagonal C₂ in two prime factors | Each projection has order 2, each supported intersection order 1; W=1 | Projections are the wrong model | Retain |
| §8.3 connected algebraic closure | Finite supported ±I; full GL_n | First identity component {I}, W=1; second connected closure GL_n, W=U for product U | Connected component is necessary | Retain |
| §8.3 product / trivial-image law | Product U=∏U_ℓ; U=1 | Supported finite products converge to U in product topology; W(1)=1 | Closure and empty/trivial case explicit | Retain |
| §8.4 subgroup index direction | Cyclic C₆ with H of index 3; S₃ with H=C₂,V=C₃ | In cyclic test V=G gives 3=3; in S₃, V∩H=1 and [V:1]=3=[S₃:H] | Coset-set injection works without normality | Retain |
| §8.4 trivial subgroup boundary | V=1, [W:W′]=2 | [V:V∩W′]=1≤2 | No nontriviality hypothesis needed | Retain |
| §8.5 full-image passage | W=2ℤ, U′=3ℤ inside ℤ | W∩U′=6ℤ; [W:6ℤ]=3; ambient indices 6→3 on enlargement | Monotone index direction correct | Retain |
| Maximal-slope / vector-height contract | Trivial line, vector 1; degree-two extension | μ_max=0=−h(1); unnormalized degree/field-degree 0/2=0 | Rank and normalization fixed | Retain contract |
| Symmetric-power contract, rank one | Trivial line, n=0,1,2 | Slopes 0,0,0; bounds n(0+2log1)=0 | n=0 included, rank zero excluded | Retain contract |
| Symmetric-power Check, rank two | Sym² trivial ℤ² with quotient metric | Squared monomial norms 1,1/2,1; μ_max=(log2)/2≈0.346574≤4log2≈2.772589 | Stated zero LHS false | R04 |
| Morphism-slope contract | Multiplication by 2 on trivial line | Log operator norms log2 and −log2 sum to 0; inequality 0≤0 | Finite places cannot be omitted | Retain contract |
| Metric-rescaling contract | Squared metric multiplied by 4 | Slope 0→−log2; dual 0→+log2 | Correct half-log and sign | Retain contract |
| Semistable tangent metric contract | Gaussian period 1, L to L⁴ | Tangent length 1→2; dual norm 1→1/2 | Matches Layer 6's slope shift | Retain contract |
| Cyclic maximal subfield contract | ℚ and Hamilton division algebra over ℚ | Index/maximal-field degree 1/1 and 2/2; latter splitter ℚ(i), twisting parameter −1≠0 | Split and nonsplit cases admitted | Retain contract |
| Claimed all-class restriction supply | Brauer class with local invariants 1/3 and −1/3 | Order 3; doubled invariants 2/3 and −2/3 are nonzero, so α∉Br[2]; cubic splitting gives zero after restriction | 2-torsion naturality has the wrong domain | R06 |
| Fixed cusp-family normalization | Multiply a family value e⁻² by e⁻ᴺ | Zero set unchanged, reciprocal log changes 2→N+2 | Common zero condition alone cannot fix scale | Retain fixed Fourier/trivialization data |
| Minkowski strict volume | ℤ⊂ℝ; (−1,1) and (−2,2) | Volumes 2=2·covol and 4>2·covol; nonzero lattice points absent then ±1 present | Strict inequality confirmed | Retain corrected supplier |
| Profinite prime idempotents | Distinct primes 2,3 | e₂²=e₂, e₂e₃=0; finite-sum projection becomes 1 once its prime is included | Product topology limit / non-domain retained | Retain; R05 locator |
| Component ring maps | Integers 0,1,6 at ℓ=2,3 | Components 0,1,6; reductions of 6 mod2 and mod3 both 0 | Correct native file provides required equations | R05 |
| Frattini finite detection | ℤ_ℓ versus infinite product of C_ℓ | Frattini quotient order ℓ versus infinite product; first has one topological generator, second no finite generating set | Finite-generation boundary explicit | Retain imported structural theorem |
| Worked trace example | Four matrix units of End(E²) | Squared Rosati lengths 2,2,2,2; Gram determinant 16; regular determinant −16 | All layers' conventions agree | Retain |
| Worked adelic example | Exceptional bounds 4,9; diagonal C₂ | Bound 36; supported subgroup order 1 versus projection order 2 | Index product and support distinguished | Retain |


## Not verifiable

- mw93-periods is settled as waived: main theorem pp.407–409, (7.4) p.436, Lemmas 8.4/8.6 pp.439–440 and matrix-height input §9. The primary proof and numbering cannot be independently checked without that text. Accessible mw94-preprint, bost95 and gr14 support the stated period target; mz20 supplies the combination used for cusp values.
- mw95-refine is settled as waived: Theorems 1–2 and Corollary 1, pp.211–224. The precise bounded-extension residual statement is corroborated by ry25's application; the chapter's proof was not read.
- igusa is settled as uncertified: Lemma 20, p.104. Its weak-region cusp-decay proof was not accessible. No stronger fundamental-domain hypothesis was silently substituted.
- fw84 is settled as uncertified: Chapter VI §3. Noot's explicit use at noot95 line 172 was read; the primary finitely generated field Tate proof was not accessible. The package now owns that substantive step instead of deriving it from equal specialized images alone.
- The supplied board package head addresses for ArithmeticLocallySymmetricSpacesPartII, CompletedCohomologyAndLocalGlobalCompatibilityPartII, CrystallineCohomologyPartII, EndoscopicTransferAndUnitaryTraceComparisonPartII, HigherHidaAndColemanTheory, LawrenceVenkateshMethod, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PELModuliPartII, PadicHodgeTheoryPartII, PadicLocalLanglandsForGL2QpPartII, RealSurfacePeriodIndex, SchemeAndStackFoundationsPartII, ShimuraVarietiesPartII, VStackSheavesAndLisseCategoriesPartII and VectorBundlesAndIsocrystalsPartII returned HTTP 404. Ownership against those separate board heads is not certified. The ordinary supplied open-roadmap index was searched independently. The five readable board heads were AnalyticNumberTheory, ArithmeticStatistics, AutomorphicCongruences, KatoEulerSystems and LogicAndDefinabilityInNumberTheory.

No settled source was requested again, no missing-reference entry was added, and no author manifest entry was changed. These source-access limits are not new blocking findings.

## Source issues

- **Error** in mw95 at §2, order/lattice definition, printed p.8: the source says every rational algebra arising from its stated order definition is separable; it should be restricted to semisimple rational algebras before asserting nonzero discriminant; affects nothing.
- **Misprint** in mw95 at §2, class-index definition after (2.1), printed p.8: the source says all torsion-free modules of the specified finite rank have bounded free-submodule index; it should require finitely generated order lattices; affects nothing.
- **Misprint** in mz20 at (22), printed p.653, and Gram formula, p.655: the source says complex matrix trace equals the rational representation trace; it should use twice the real part of the complex Hermitian trace; affects nothing.
- **Misprint** in mz20 at Lemma 4.2 proof, printed p.656, mz20 line 921: the source says formula (50) constructs the block endomorphism; it should refer to formula (27); affects nothing.
- **Misprint** in mz20 at Lemma 4.2 proof, printed p.656, mz20 line 927: the source says the cited Rosati length law is multiplicativity; it should say submultiplicativity; affects nothing.

The first two defects are witnessed respectively by ℤ[ε]/(ε²), whose trace Gram determinant is 0, and ℤ[1/2], whose quotient by any nonzero cyclic subgroup is infinite. The complex-trace defect gives 1 versus 2 already for the identity of an elliptic curve. The package corrects these hypotheses and normalizations; none was copied into its theorem statements.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "530454fdb9f50f837aa7fcb07c0a0305377d2cf4", "job": "REV-PKG-FaltingsFinitenessAndIsogenyTheoremsPartII~2", "model": "gpt-6-astra", "worker": "chris-8"} -->
