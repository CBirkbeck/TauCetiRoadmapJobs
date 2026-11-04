# Review of HilbertModularSurfaces (pull request #1730 at 75a5869)

**Verdict:** needs changes

Locations below abbreviate `TauCetiRoadmap/HilbertModularSurfaces/README.md` and `TauCetiRoadmap/HilbertModularSurfaces/Suggested.lean`. The pull-request worktree was not changed.

## R01 (P1) — Swapping embeddings does not give the dual cusp

**Location:** Suggested.lean:342; README.md:594–603, especially “the lattice `M` for the opposite order of the embeddings”.

**Claim:** The asserted `CuspDatum.period_swap` is false. Reversing the ordering of the two positive coordinates preserves the positive-cone resolution, up to reversal. Multiplication of the lattice by an element of negative norm changes the quadrant and is a different operation.

**Witness:** F = ℚ(√3), M = ℤ[√3]. Reduced bases (2+√3,1) and (2−√3,1), for the respective embedding orders, both have period (4). The asserted sums are 1 and −1.

**Repair and retest:** Replace the swapped-embedding assertion by invariance under reversal of the cyclic sequence. Define the dual using βM with N(β)<0 and transport V. With β=√3 the reduced quotient 3/(3−√3) has period (3,2); its sum is −1, giving 1=−(−1). Keep both tests. Also distinguish this operation from Galois conjugation, which transports the level ideal as well as the component.

## R02 (P1) — Meromorphy does not determine the value at −1

**Location:** Suggested.lean:387–391; README.md:814–816, “which pins `ζ` uniquely”.

**Claim:** The hypotheses of `dedekindZeta_neg_one_eq_siegel` permit arbitrary changes at −1. Mathlib deliberately defines meromorphy independently of the value at an isolated point.

**Witness:** Mathlib/Analysis/Meromorphic/Basic.lean:271 (`MeromorphicAt.update_iff`) preserves meromorphy after `Function.update ζ (-1) 0`. Agreement on Re(s)>1 persists; for D=5 the proposed equality becomes 0=1/30.

**Repair and retest:** Add `AnalyticAt ℂ ζ (-1)` (or the appropriate normalized continuation with this property), and use identity of meromorphic germs followed by continuity at −1. The updated function is then excluded, whereas the genuine continuation has value 1/30. The scratch Lean probe proved preservation of meromorphy and the arbitrary updated value.

## R03 (P1) — The native fundamental-discriminant predicate admits D=1

**Location:** Suggested.lean:380–382.

**Claim:** `siegelZetaMinusOne_spec` claims strict positivity for every natural D satisfying `Int.IsFundamentalDiscr`. That native predicate includes 1, unlike a real quadratic field discriminant.

**Witness:** The scratch Lean probe proves `Int.IsFundamentalDiscr 1`, `siegelZetaMinusOne 1 = 0`, and `¬ 0 < siegelZetaMinusOne 1`. The sum has no permitted b.

**Repair and retest:** Use D>1 as well as fundamental discriminant for the README positivity result, or state it for the discriminant of a real quadratic field. Retain D=1 as a negative control. Delete this secondary arithmetic API theorem from Suggested.lean if it is not retained as a headline; the actual Siegel theorem supplies the acceptance target.

## R04 (P1) — The rationality criterion needs rational curves

**Location:** README.md:1014–1016, “contains curves `C₁, C₂` with `C₁² = C₂² = −1`”.

**Claim:** Self-intersection −1 alone does not mean exceptional. The first alternative of 5.3(i), copied mathematically from Assaf Proposition 6.4.1, is false for curves of positive genus.

**Witness:** On a degree-two polarized K3, choose transverse smooth C₁,C₂ in |H|. Each has genus 2, square 2, intersection 2. Blow up three separate points on each: squares −1, intersection 2, q=0, κ=0.

**Repair and retest:** Require two distinct smooth rational (−1)-curves in the first alternative. The K3 witness is excluded because both genera remain 2; the D=13 configuration in 6.3 satisfies the repaired condition. The second alternative is a separate criterion. Do not perpetuate the source omission.

## R05 (P1) — Determinant images and projective indices depend on the gamma type

**Location:** README.md:365–369; 1095–1096.

**Claim:** The determinant surjection onto all positive units is false for full level. The projective index asserted uniformly for all i is false already for Γ₁, so equality of gl/sl groups cannot be inferred from h⁺=h for these types.

**Witness:** F=ℚ(√5), N=(3), ε=(1+√5)/2. Full-level determinants are 1 mod 3, but ε² is not. diag(ε²,1) belongs to Γ₁; its determinant-one scalar normalizations have d=±ε⁻¹≠1 mod 3.

**Repair and retest:** Consume HilbertModularForms §1.2’s actual determinant images: full level uses positive units congruent to 1. For each gamma type quotient that determinant image by squares of its actual scalar subgroup. Restrict the unitIndex formula and gl/sl coincidence presently used for surface invariants to Γ₀. At this Γ₁ example the projective quotient is nontrivial even though h⁺=h=1; at unit level the Γ₀ formula remains valid.

## R06 (P1) — The nonsquare determinant appears with the wrong exponent

**Location:** README.md:631–633, “`γ² = u⁻¹ζ`”.

**Claim:** For det(γ)=u the CM identity must have u, not u⁻¹. This error is also in the cited source and its author errata.

**Witness:** Over ℚ(√3), let u=2+√3 and γ=(0,−u;1,0). Then det γ=u, projective order 2, and γ²=−uI; the claimed right side with ζ=−1 is −u⁻¹I.

**Repair and retest:** Write γ²=uζ in the CM algebra, retaining the necessary generator normalization. Check norms: both corrected sides have relative norm u². In this example ζ=−1 and −u=−u; the old formula has norm u⁻². Record the source error separately.

## R07 (P1) — The Artin composite uses a quotient that is not defined

**Location:** README.md:724–728, “`{±1}² → Cl⁺(R)/Cl(R) → Gal(K/F)`”.

**Claim:** The ordinary class group is a quotient of the narrow class group, not a specified subgroup of it. The displayed quotient and therefore its kernel do not define the type-distribution condition. In the nonselective case the asserted Artin map from the unramified narrow class group need not exist either.

**Witness:** TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean:150–159 gives the surjection Cl⁺→Cl. For ℚ(√3), (++),(+−) map to 1,[(√3)] in its kernel C₂, not to a quotient by a supplied inclusion.

**Repair and retest:** Use the signature quotient → ker(Cl⁺→Cl) → Cl⁺, then the Artin character only in the unramified/selective case. Include the level-prime and squares quotient from Assaf’s corrected selectivity statement. The (++),(+−) example yields the two different Artin values; no fictitious embedding Cl→Cl⁺ is needed.

## R08 (P1) — The rational continued-fraction recurrence excludes its terminal case

**Location:** README.md:498–501, “`0 < r′ < r`”.

**Claim:** The stated strict lower bound on the remainder is false for terminal integer quotients, which are within the hypotheses.

**Witness:** n=3, r=1: b₁=3 and r′=3·1−3=0. The written inequality says 0<0, whereas Suggested.lean correctly returns [3] and stops.

**Repair and retest:** State 0≤r′<r, terminate at r′=0, and assert 0<r′ only for a nonterminal step. Check (3,1)→[3] and (5,2)→3−1/2 with r′=1. Keep the terminating case in the README.

## R09 (P1) — The rotation-factor converse fails at order two

**Location:** README.md:714–716, “`ζ′ = ζ iff det β ≫ 0`”.

**Claim:** Inversion fixes the primitive root of order two, so equality of rotation factors cannot detect signs of det β at that order.

**Witness:** γ=(0,−1;1,0) has factor (−1,−1). Conjugate by β=diag(√3,1). The determinant has mixed signs, but inversion leaves both factors equal to −1.

**Repair and retest:** Keep the componentwise law ζ′=ζ^ε. State the converse only when q>2 (each primitive factor then differs from its inverse). The q=2 example becomes the negative control; for q=3, exp(2πi/3)≠exp(−2πi/3).

## R10 (P1) — Integrality cannot reject every incorrect assignment of types

**Location:** README.md:891–895, “a wrong assignment of rotation types is detected”.

**Claim:** This blanket claim contradicts the roadmap’s own negative control. Integrality is necessary, not sufficient, and cannot be used to choose types without the arithmetic distribution theorem.

**Witness:** README.md:1329–1332 replaces the two order-five types at D=5 by (5;1,1),(5;1,4). It gives e=15, K²=−3, χ=1: all integral, yet the types are impossible.

**Repair and retest:** Say integrality rejects some inconsistent assignments and require 3.7–3.8 independently. The original record gives (14,−2,1), the wrong record (15,−3,1); both pass integrality, only the original passes the rotation test.

## R11 (P1) — The compactification and infinite-fan contracts cite nonexistent sections

**Location:** README.md:82–84, 125, 472–474, 551–557, 807–808.

**Claim:** Current ShimuraCompactifications has no C6 sections. These are prerequisites, not cosmetic references: the cusp stabilizer, boundary completion and minimal contraction are used to construct X. Also, the finite native toric Fan is not the infinite cusp fan.

**Witness:** ShimuraCompactifications README.md:3685 names §8.32; :4103 names §8.56. TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean:89 requires `finite_cones`; the rays (2+√3)^j, j∈ℤ, give infinitely many distinct rays.

**Repair and retest:** Resolve every C6 citation to the current named target, including §8.56’s full affine stabilizer. Consume ShimuraCompactifications §0.13 and §2.1 for arithmetic cone systems and analytic charts instead of asking finite Fan to carry them. For the displayed rays, the replacement admits infinitely many cones but finitely many unit orbits. Recheck the actual hypotheses, as in R12.

## R12 (P2) — The cited Hilbert compactification contracts are only tame-level contracts

**Location:** README.md:125; 551–555; 807–808.

**Claim:** The roadmap needs every nonzero Γ₀ level, including ramified levels and levels above 2 and 3. Its cited Hilbert-layer compactifications and cusp-completion contracts retain a smaller tame range; renumbering the citations alone does not supply the general comparison.

**Witness:** ShimuraCompactifications README.md:3100–3119 restricts the level relative to Δ_F,2,3; HilbertModularVarietiesAndShimuraCurves README.md:1309–1311 explicitly requires a separate comparison elsewhere. F=ℚ(√5), N=(2) is a worked example here.

**Repair and retest:** Give the all-level analytic comparison via the earlier general arithmetic compactification targets, or own the needed level-descent/comparison theorem with precise hypotheses and inputs. Keep N=(2), N=(3), and the ramified prime over 5 as negative controls against accidental tame assumptions. Do not narrow this roadmap to good levels.

## R13 (P2) — Import the existing group and cusp targets instead of planning them again

**Location:** README.md:337–339, 365–390, 394–400, 432–433; 997.

**Claim:** The scope table misses existing ownership: HilbertModularForms §1.4 already owns the cusp set, finiteness, level-one class-group bijection and the general Γ₀ cusp count. §§1.2–1.3 already own the index and transport. The generic rationality criterion also has an earlier owner.

**Witness:** HilbertModularForms README.md:509–519 states these cusp targets, and :472–475 the determinant/index target. NeronModelsAndSemistableAbelianVarietiesPartII README.md:9823–9825 states Castelnuovo–Zariski rationality. Native `NumberField.units_sq_index_eq` is at Units/ElementaryTwoQuotient.lean:84.

**Repair and retest:** Delete these duplicate construction/theorem targets and cite their owners by section in scope/contracts. Retain the new explicit cusp-ideal parametrization, surface resolution and genuine comparisons. At level one import #cusps=h; at prime level import index=N(p)+1. For q=P₂=0 import the general rationality criterion; develop only the additional configuration criterion here.

## R14 (P2) — Replace the certificate procedure by the mathematical classification

**Location:** README.md:1033–1041, 1057–1070, 1138–1139.

**Claim:** The headline classification is replaced by soundness of a finite checking procedure and a promised stored certificate list. Soundness of such a procedure does not prove the list exists or is complete. Restricting the curve library to N≤4 is explicitly justified only by this route.

**Witness:** An empty list satisfies “every checked certificate determines κ” but proves none of the D≤500 classifications. No target supplies the asserted complete list of geometric configurations; higher-level claims in 6.5 also reuse the interface while their curves are excluded.

**Repair and retest:** State and prove the classification as a mathematical theorem with complete geometric proof inputs. Develop the general Hirzebruch–Zagier curve/intersection theory needed by those inputs (or assign it to an earlier owner); use N≤4 computations as Checks. Remove executable checking/stored-table requirements. The empty-list witness must no longer discharge the headline.

## R15 (P2) — State the higher-power and conductor-divisible local embedding formula

**Location:** README.md:685–687, “the general formula for `e ≥ 2` and for `𝔭 ∣ 𝔣`”.

**Claim:** This is not an exact target: it omits the formula, local hypotheses and dyadic branch even though arbitrary levels depend on it. The e=1 formula cannot fill that gap.

**Witness:** Voight, Proposition 30.6.12, printed p.544, voight line23163: for ℤ₂[i], roots modulo 2 number 1 and roots modulo 4 number 0; local counts at levels 2 and 4 are 1 and 0.

**Repair and retest:** State the root-set formula with M(s)={x mod p^s:fγ(x)=0}: m=#M(e) for unit discriminant, otherwise #M(e)+#image(M(e+1)→R/p^e), with the complete local setup and any maximal-level case. It gives 1 and 0 in the dyadic witness; split/inert/ramified e=1 gives 2/0/1. This is a mathematical count, not an algorithm.

## R16 (P2) — The period theorem omits its statable fundamental-unit conclusion

**Location:** Suggested.lean:245–253; README.md:512–515.

**Claim:** The docstring and README promise that the period product is the fundamental totally positive multiplier unit. The Lean theorem asserts only nonemptiness and total positivity; it does not state membership in the multiplier unit group or generation of that group.

**Witness:** For w=2+√3 the required generator is 2+√3. Its square 7+4√3 also passes the asserted positivity condition, but generates an index-two subgroup. No generator law appears in the signature.

**Repair and retest:** State the headline on the actual span ℤ{1,w}: the period product is >1 at v₁, preserves the lattice, and its integer powers exhaust the positive multiplier units. These use native submodules, units and integer powers already used here. The square fails the exhaustion law because 2+√3 is missing.

## R17 (P2) — The record accepts gamma types for which its promised cusp data are absent

**Location:** README.md:1090–1113; 1148–1151; Suggested.lean:408–416.

**Claim:** HMSPrefix admits every nonzero level and all three gamma types. Section 7.2 promises cusp data for one/full, while 1.5 supplies neither full level nor nonsquarefree Γ₁. No type refinement or alternative general cusp datum repairs the missing branch.

**Witness:** F=ℚ(√5), level=(4), gammaType=one, ambient=gl is a valid prefix. Section 7.2 demands its cusp records, but 1.5’s Γ₁ row requires squarefree level. gammaType=full has no row at any level.

**Repair and retest:** Complete the general cusp stabilizer and resolution interface for all admitted types, using the full affine stabilizer rather than excluding difficult levels. Make each record branch and its dependencies explicit. The (4)/one and full-level examples must receive defined data, as does the existing Γ₀ example.

## R18 (P2) — The zero-weight vanishing claim needs a nonzero weight

**Location:** README.md:901–903, “every Hilbert modular form of a weight with a zero entry is constant and then zero”.

**Claim:** The asserted vanishing includes parallel weight (0,0). Koecher’s principle and vanishing of nonparallel constant terms do not eliminate its constant form.

**Witness:** f=1 at weight (0,0) has a zero entry, constant term 1, and is not zero. The weights needed for irregularity are (2,0) and (0,2), whose constant terms are 0.

**Repair and retest:** State the zero-entry vanishing theorem for nonzero weights in the appropriate nonnegative range, with the full proof input that forces constancy; then apply it to (2,0),(0,2). Preserve weight (0,0), f=1 as the negative control. HilbertModularForms §§2.2,2.5 alone state support/constant-term results, not this additional vanishing theorem.

## R19 (P1) — The supplied push gate fails its build check

**Location:** Suggested.lean:1.

**Claim:** The supplied head gate is FAIL with build=1 because the Mathlib module-system warning is not an allowed sorry warning. Direct elaboration succeeding does not clear that gate.

**Witness:** The recorded warning says the file imports module-system Mathlib and recommends a leading `module`. Direct `lake env lean` returned exit 0 and exactly 16 sorry warnings, so this is a targeted-build gate failure, not a type error.

**Repair and retest:** Adopt the pinned module declaration/export form and rerun the targeted build and gate until only sorry warnings remain. Keep the single import Mathlib. The standalone movable dependency check passes; the local gate rerun’s NOT IN ORDER message is the documented insertion case, not an additional dependency finding.

## R20 (P3) — Remove acceptance-file padding and unused carriers

**Location:** Suggested.lean:61–69, 152–184, 395–429, 454–460.

**Claim:** The file carries 26 proved numerical examples, an API catalogue, and prefix/index definitions used by no headline theorem. These are README Checks, not acceptance targets. None of the 16 sorried theorems closed under the simple-tactic probe; this does not make the numerical examples or unused definitions headlines.

**Witness:** The nine hjExpansion examples are repeated README boundary/value Checks. HMSPrefix, GammaType, AmbientType, levelIndex and unitIndex appear in no theorem conclusion. The 13 local-table examples merely evaluate explicitly defined lists.

**Repair and retest:** Delete these from Suggested.lean; keep their mathematics and tests in the README. Also remove secondary API statements such as the Kodaira table-inclusion theorem and reduction-preservation API if not needed as headline targets. Keep only a few nontrivial checks of retained definitions. Do not “repair” padding by proving it in place.

## R21 (P3) — Supply the required definition APIs, Checks and precise source locators

**Location:** README.md:1, 341–407, 508–538, 1098–1114; Suggested.lean:6–36.

**Claim:** The README lacks the required Summary, Exact supplier contracts and How to read the build sections, per-layer Examples/Dependencies, and three discriminating Checks plus a prose API for each definition. Many theorem targets have no locator at all. The Lean docstring does not name the missing geometric classification headlines individually.

**Witness:** For example, 0.2’s principal-polarizability definition and 1.2’s cusp ideals have no local API/three-Check block; 2.7 has no source locator. The Assaf reference gives pages243–259, but author errata line38 gives285–312.

**Repair and retest:** Restructure without thinning the mathematics. Give each definition its API and three discriminating Checks, every theorem an exact version/theorem/page locator, and each layer its inputs. In the module docstring list cusp/elliptic resolution, Chern/Hodge comparison, simple connectivity and classification endpoints with missing carriers. Correct Assaf’s bibliography; declare inaccessible texts uncertified rather than implying verification.

## Verified sound

I read all 47 numbered README targets, all conventions and worked examples, and the full Lean file. I inspected the worker’s 53 signatures and re-elaborated a scratch copy with `#check @name` for all 53. The six flagged missing `NumberField` binders occur on definitions whose bodies only need a field/real embeddings; no necessary quadratic hypothesis disappears from the relevant periodicity/negative-definiteness theorem signatures. Those theorems explicitly retain degree two and distinct embeddings. No sorry data, set_option, forbidden import, stray file, change outside this folder, or fully qualified declaration collision was found.

The direct requested elaboration passed with 16 sorry warnings. A scratch copy tried `simp`, `rfl`, and `infer_instance` separately with backtracking on all 16 admissions: none discharged a theorem. Inspection found no direct pinned lemma with the same remaining conclusions. The same run proved the D=1 counterexample and the meromorphic-update facts. This is elaboration/evidence, not a proof of admitted statements. The worker’s targeted-build warning remains R19.

The explicit dependency command with the supplied candidate order returned:

```text
depcheck: 204 roadmaps, 1617 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The generic gate rerun instead returned `depcheck=1` and `NOT IN ORDER: HilbertModularSurfaces (insert it after its last supplier)` before building. Under the brief this is the automatic placement case, not a defect; it does not override the passing explicit movable check or erase the worker’s recorded build failure. The supplied gate otherwise reports zero for every scanner, metadata, dirty, stray-file and outside-folder check.

**Headline coverage.** The README endpoints are cusp classification/counts and Hirzebruch resolution (1.3–2.7); CM elliptic counts/types and their resolutions (3.2–3.10); Siegel/proportionality and Chern numbers (4.2–4.5); irregularity/Hodge and cusp-form comparison (4.6–4.8); minimal-model/configuration criteria (5); simple connectivity, small-discriminant classification and general type (6). Lean has rational/quadratic HJ results, cusp numerical properties, string negative definiteness and Siegel’s formula. The geometric quotient/resolution and surface invariants do lack their actual surface carriers at these pins; free numerical replacements would not suffice. The fundamental-unit conclusion is already statable using the kept carriers (R16). The module documentation must account for the omitted geometry/classification individually (R21).

**Adversarial target table.** Values here were computed by exact rational arithmetic, elementary lattice/matrix calculations, or the explicit geometric examples specified in the row. “Agreement” tests the given instances, not a universal theorem. For global classifications without an accessible primary proof the table tests numerical compatibility only. Zero levels, nonfields and repeated embeddings were tested against their explicit exclusions.

| Target | Instance and computed values on both sides | Result / change |
|---|---|---|
| 0.1 real quadratic frame | D=5: ε=(1+√5)/2, Nε=−1, positive-square index1; D=12: ε=2+√3, Nε=1, index2; unit-square index=4=2² in both | Numeric agreement; import existing unit-index API |
| 0.2 narrow classes/components | D=5: (h,h⁺)=(1,1), inverse-different class=1; D=12: (1,2), inverse-different class≠1; h⁺/h=1,2 | Agreement; LMFDB component knowl supports class/flag convention |
| 0.3 groups/index | Unit level:1·empty product=1; inert (2) in D=5:4(1+1/4)=5; Γ₁ at(3): ε² determinant gives nontrivial projective quotient although unitIndex=1 | Γ₀ agrees; general-i claim fails R05 |
| 0.4 effective action/quotient | Scalar εI acts as z↦z; det=ε². In SL scalars satisfy ε²=1, hence ±1. Finite effective order2 acts as (−1,−1) on tangent coordinates | Agreement for effective quotient; supplier citations resolved below |
| 1.1 cusp orbit | D=5 level1: #orbits=1=h; D=12:1 cusp on each of2 components. Translation m=1 fixes ∞ but sends z to z+1 | Agreement; owned by HilbertModularForms1.4 |
| 1.2 s,M | b=R,N=(2): (1:0) gives s=R,M=(2); (0:1) gives s=R,M=R; scaling(1,0) by2 changes s to2R and leaves M=(2) | Agreement: scale factor cancels and both M divide N |
| 1.3 cusp parameters | Same prime level has M=R and M=N; W₁ exchanges0 and∞, hence M↔N/M; unit level has one residue class in the zero quotient | These boundary tests agree; full parametrization sourced |
| 1.4 cusp count | D=5,N=(2):1·1·(1+1)=2; D=12,N=R: h⁺h=2 total=1+1; D=85:N=R gives2 cusps/component | Agreement with source and stated examples; import shared count |
| 1.5 cusp types | D=5,(2): at0, M=2R,V=U⁺; at∞,M=R,V=U⁺; gcd divisor ideal=R so k=1; D=12 level1 sl has k=2 | Table tests agree; one/full branches missing R17 |
| 2.1 finite HJ | 5/2=3−1/2; 5/3=2−1/3; 3/1=3 with remainder0, not >0; (0,0),(2,5) give[]; (4,2),(2,1) both[2] | Recurrence fails terminal test R08; values correct |
| 2.2 periodicity/unit | w=√3→2+√3→2+√3; conjugate of latter=2−√3∈(0,1); digit4; product2+√3. Its square7+4√3 is also positive but not generator | Period tests agree; fundamental-unit law missing R16 |
| 2.3 cusp datum/cycle | D=12,M=R: d=1; gl k=1 gives[-4], length1,sum−2; sl k=2 gives[-4,−4],length2,sum−4; subgroup U itself has relative index1 | Agreement of definitions; rank0/1 and ℤ[1/2]-span rejected by rank/FG |
| 2.4 cusp resolution | One vertex b=3: nodal square2−3=−1, not smooth exceptional; two vertices(2,4): off-diagonal2, not1; smooth components only beyond nodal case | Local numerical model agrees; infinite-fan contract R11 |
| 2.5 intersection/genus | Matrices[-1],[-2,2;2,−4] have negated leading minors(1),(2,4). All-two cycle has constant-vector quadratic value0; nodal arithmetic genus1, K·S=1=3−2 | Agreement; all-two excluded by period_spec |
| 2.6 cusp contributions | D5: length1,sum−1; D8:length2,sum−2; D5 level(2): length2,sum−2 | Agreement |
| 2.7 dual/orientation | Swapped embeddings on ℤ[√3]: period(4),(4), sums1,1, asserted1=−1; √3-scaled lattice: period(3,2),sum−1 | False R01; actual dual passes1=−(−1) |
| 3.1 elliptic fixed points | γ=(0,−1;1,0): discriminant−4 at both places, fixed point(i,i), order2, tangent(−1,−1); identity discriminant0 and all points fixed | Agreement, scalar identity excluded |
| 3.2 CM dictionary | u=2+√3, γ=(0,−u;1,0): det=u, γ²=−uI vs claimed−u⁻¹I; norms u² vsu⁻² | False identity R06; norm-one roots test gives K=F(i) |
| 3.3 possible orders | φ(4)/2=1, φ(6)/2=1; φ(8)/2=φ(10)/2=φ(12)/2=2; order12 unit overD12 has nonsquare norm2−√3. q=8,10 require norm−1 fields and add no gl cases | Order-list arithmetic agrees; source has q≤6 error in nonsquare branch |
| 3.4 CM order counts | D5 at level1:h=Q=1 for each of i,ζ₆,ζ₅ orders; (2/h)h/Q=2 points/order; maximal conductor1 gives h(S)=h(K), unit index1 | Tested normalization agrees; source norm-index formulas opened |
| 3.5 local embedding | Split/inert/ramified maximal order at e=1:1+(1,−1,0)=(2,0,1). ℤ₂[i]: M(1)={1},M(2)=∅, so levels2,4 give1,0 | First clause agrees; complete target needed R15 |
| 3.6 level-one forms | D13:h(−52)=2,h(−39)=4→a₂=2,a₃=4; D28:h(−112)=2,h(−28)=h(−7)=1→a₂=4, not3 | Small counts agree; primary Prestel text uncertified |
| 3.7 rotations | γ=(0,−1;1,0):t=0,u=1,z=i, derivative−1; mixed-sign β leaves−1 unchanged. Forq3 inverse roots differ | Converse false R09; derivative normalization passes |
| 3.8 distribution | D5 counts3-types=(1,1),5-types=(1,1); D21 sl components have3-types(4,1),(1,4), total(5,5); signature class(++),(+−)=(1,[(√3)]) in D12 | Examples agree; stated quotient is undefined R07 |
| 3.9 string/Chern cycle | (5,2):[3,2],coefficients(−2/5,−1/5),Z²=−2/5; inverse3 gives reversed coefficients and same square. (3,2):[2,2],Z=0 | Agreement; all 13 local rows recomputed |
| 3.10 elliptic resolution | For(3,1),Q=[−3],z=−1/3 gives Qz=1=b−2; for(5,2),Qz=(1,0)=(3−2,2−2) | Adjunction/discrepancy signs agree |
| 3.11 elliptic record | D5 order counts2,2,2,total6; lengths1+1+1+2+2+2=9. (4,2) rejected sincegcd=2 | Agreement; database pages partly inaccessible |
| 4.1 surface | D5 cusp nodal square−1 is not an exceptional smooth curve; elliptic strings have squares≤−2. Resolution minimal over singularities can still have other(−1)-curves | Distinction between resolution/minimal surface retained |
| 4.2 Siegel | D=1:sum0,value0,contradicts >0; D5:σ₁(1)+σ₁(1)=2→1/30; altered continuation at−1 gives0≠1/30 | R02,R03; finite-sum values agree |
| 4.3 volume | D5:2(1/30)=1/15; level(2):5/15=1/3. D12:sl2(1/6)=1/3,gl1/6 | Agreement of normalization; source sign/index defects recorded |
| 4.4 Chern | D5:e=1/15+1+3+5/3+8/3+28/5=14; K²=2/15−1−1/3−4/5=−2 | Agreement; 32 worked rows recomputed |
| 4.5 integrality | Correct D5:(14,−2,1); wrong5-types:(15,−3,1), also integral; wrong3-types givesK²=−7/3 | “Rejects every wrong type” false R10 |
| 4.6 irregularity | q=0 impliesb₁=b₃=0. Weight(0,0):f=1,a₀=1 contradicts broad vanishing; required weights(2,0),(0,2) are nonparallel | R18; state actual zero-entry vanishing input |
| 4.7 Hodge | D5:χ=(−2+14)/12=1,pg=0,h11=14−2=12,b2=12,signature(−2−28)/3=−10=2−12 | Agreement; D29 givesχ2,h11=24,pg1 |
| 4.8 cusp-form comparison | D5:sumχ1=dim0+h⁺1; D21 sl:1+2=1+2; D24 sl/gl:1+2=1+2 | Numerical consistency, not an independent cusp-dimension proof |
| 4.9 record invariants | D21 sl components:(e,K²,χ)=(18,−6,1),(25,−1,2); D12gl/sl:(15,−3,1)/(16,−4,1) | Agreement; components cannot be dropped |
| 5.1 blowdown | Blowupℙ²:(K²,e,χ)=(8,4,1), contraction gives(9,3,1); K3 six blowups:(−6,30,2) returns(0,24,2) | Numerical transformation agrees |
| 5.2 Kodaira table | Minimal ℙ²:(1,9)→{−1,2} contains−1; K3:(2,0)→{0,1} contains0; blown-up rational:(1,−2) minimal-set∅ but lower-bound set{−1,0,1,2} | Agreement as necessary possibilities, not existence for every numeric pair |
| 5.3 rationality/configuration | K3 genus2 curves: squares2−3=−1 each,intersection2,q0,κ0; false criterion gives rationalκ−1. D13 exceptional configuration after blowdown has squares−1,intersection2 | R04; rational-curve repair separates them |
| 6.1 simply connected | Source’s F=ℚ(√11) two components haveπ₁=1; for rationalD5,π₁=1 and blowups preserve1 | General all-F/all-b theorem not certified without book |
| 6.2 small HZ curves | a=b=0,λ=1 gives determinantN=1 and equationz₁−z₂=0 (diagonal); N=5 excluded though general construction makes sense | Mathematical definition test passes; route-bound scope R14 |
| 6.3 rational smallD | D13 adjacent(−2)-curves meetingF₃ once become squares−1,intersection1+1=2; χ1,K²−3 consistent with rationality | Configuration computation agrees; primary remaining smallD proofs not certified |
| 6.4 classification | D29:χ2,K²−4 leaves{0,1,2}; claimedκ0 needs geometry. Empty certificate list validates no κ. D85:−8+8=0 vs0+2=2 | Certificate soundness does not prove classification R14 |
| 6.5 largeD/level | D5,N=(2):computedχ1,K²−2 permits4 dimensions; rationality is separate Hamahata theorem. D=501=3·167 is squarefree and1 mod4, so it is an eligible discriminant just beyond the bound | Numerical compatibility only; primary bound/classification not certified |
| 7.1 prefix | N=0 rejected; N=R accepted;6 formal type pairs; (4)/one/gl admitted although no corresponding cusp-type branch exists | R17; no numerical prefix substitutes for surface carrier |
| 7.2 record | D5:levelNorm1,narrowCard1,is_pp=true,nbCusps1,nbEll6,lenRes10,e14,K²−2,χ1,h20=0,h11=12 | Internal assembly agrees; one/full promise fails R17 |
| 7.3 page mapping | D5χ=1 but arithmetic genuspa=0; conventional mathematical values differ by1. nbEll2+nbEll3+nbEll5=6 | Mapping arithmetic agrees; exact database coverage uncertified |

**Lean theorem checks.** All 53 declaration signatures were inspected; these are the 16 admitted theorem checks. Numerical checks also covered all 13 local singularity rows, 32 surface rows, and 21 zeta/cusp-period rows; representative values appear in the target table above.

| Declaration | Computed positive / negative or boundary instance | Result / change |
|---|---|---|
| two_le_of_mem_hjExpansion | [3,2] has minimum 2; n=1 admits no 0<r<n | 3,043 coprime pairs through n=100 pass |
| hjExpansion_reverse | 2·3 mod 5=1; [2,3]=reverse[3,2]; r′=0 gives residue0≠1 | 3,043 pairs pass |
| RotationType.localChernSelfIntersection_eq_of_isSwap | (5,2)/(5,3):−2/5=−2/5; (12,5) self-swap:−1=−1 | 3,043 pairs pass |
| RotationType.resolutionLength_eq_of_isSwap | (5,2)/(5,3):2=2; (3,1) self-swap:1=1 | 3,043 pairs pass |
| RotationType.localChernSelfIntersection_eq_zero_of_r_eq_pred | q=2: c=0,ℓ=1; q=6:c=0,ℓ=5; r=1,q=3 gives c=−1/3 | A-type discriminated |
| stringPlumbing_isNegativeDefinite | −Q has principal minors3,5>0; [2] gives minor2 | Correct for tested strings |
| exists_isReduced_hjStream | √3 reaches reduced value at j=1; rational2 never does | Required irrational hypothesis excludes counterexample |
| isReduced_hjStream_one | 2+√3 maps to itself; both embeddings unchanged | Agreement |
| hjPeriod_ne_nil_of_isReduced | period[4], product2+√3 has conjugate2−√3>0; square7+4√3 is also positive | Stated positivity passes; missing generator law R16 |
| CuspDatum.period_eq_hjPeriod | Basis(2+√3,1) and its unit multiple both have quotient2+√3, hence cycle[4]=[4] | Scaling test passes; cyclic rotation is the correct equivalence |
| CuspDatum.period_spec | [4]:nonempty,min4≥2,4≥3; all-two cycle has zero mode | Correct discriminating exclusion |
| CuspDatum.cycleIntersectionMatrix_negDef | −Q for [−4] has determinant2; for [−4,−4], leading minors4,12>0 | Quadratic hypotheses present |
| CuspDatum.period_swap | D12 gives1=−1, false; negative-norm lattice gives1=−(−1), true | R01 |
| siegelZetaMinusOne_spec | D1:0>0 false; D5:60·1/30=2 integer | R03 |
| dedekindZeta_neg_one_eq_siegel | D5 continuation updated at−1:0 vs1/30 | R02 |
| kodairaPossibilitiesMinimal_subset_kodairaDims | χ1,K²=−2,K²min9:{−1,2}⊆{−1,0,1,2}; K²min11:{2}⊆same | Secondary API padding R20 |

**Seeded source audit (all 15 targets).** Source identifiers below name the service’s line-numbered extractions. `assaf` is arXiv:2301.10302v2; its printed preprint pages are used, not silently converted to the published pagination. The author’s May 2025 revision and separate errata were also fetched. `voight` is the author’s version 1.0.7u, not an assertion about the 2021 printing’s page numbers. The README does not mark additional locators “unverified”; inaccessible references and targets without locators are accounted for below.

| Target | Text/locator inspected | Support and limit |
|---|---|---|
| 0.2 Narrow classes/components | lmfdb line90, component_ideal knowl; native NarrowClassGroup contracts below | Supports the component class and principal-polarizability flag. The exact sequence is the native wide/narrow sequence, not Cl⁺/Cl. |
| 0.4 Action/effective quotient | No external theorem/page supplied here; HilbertModularForms0.1,1.2 and ShimuraVarieties P.6,0.4,1.2 opened | The claimed quotient route exists; the free quotient theorem applies on the free locus, and the normal finite analytic quotient supplies singular points. |
| 1.2 Cusp ideals | assaf line232, Lemma3.1.2, p.5; line460, p.10 | Supports s=aR+c b⁻¹ and M=N+c(bs)⁻¹ with nonzero pair/ideal hypotheses. Scale and boundary tests above pass. |
| 1.4 Number of cusps | assaf line315, Corollaries3.1.18 and3.1.23, pp.7–8; dasgupta-kakde line503, Corollary3.12, p.12 | Supports total/per-component distinction and unit quotient. In DK the Γ₁ cusp construction is explicit; transferring to Γ₀ uses Assaf’s additional quotient. |
| 2.3 Cycle of cusp datum | assaf line425, §3.3, pp.9–10; hirzebruch line1246, §2.5 theorem, PDF p.35 | Complete rank-two lattice, totally positive multiplier subgroup, finite index; primitive period repeated by that index. Nodal exception must be retained. |
| 2.5 Cycle intersection matrix | hirzebruch line1075 through1106, §2.4, PDF pp.31–32 | Text explicitly treats node, double edge, and all-two zero mode. OCR omits some displays; direct matrices/minors above independently verify the claimed formulas. Exact printed-page/display certification remains limited. |
| 2.7 Dual cusps | No exact theorem/page locator supplied | No source certification; swapping embeddings is refuted by explicit D12 calculation (R01). |
| 3.4 Embedding counts | assaf line680, (4.1.5),(4.2.2), Proposition4.2.3, pp.14–15; assaf errata line23; voight line22731, Lemma30.3.14, p.535; line23896, Corollary31.1.10, p.560; line30540, Proposition39.4.12, p.727 | Source distinguishes norm-one/full-unit counts, order overorders, unit index and component selection. The quaternionic curve formula cannot simply replace the surface factor; the D5 calculation checks 2/h. |
| 3.5 Local embedding numbers | voight line23163, Proposition30.6.12, p.544; line23174, Example30.6.14; line23194, Lemma30.6.16, p.545 | Maximal-order e=1 formula includes residue characteristic2. The later simplified Lemma30.6.17 assumes odd residue cardinality. README must state the full root-set formula (R15). |
| 3.11 Elliptic record | Internal 3.4–3.9 assembly; assaf §4; lmfdb elliptic_point extraction line5 | Arithmetic rows recomputed; the knowl fetch contains a browser challenge, so its field schema is not certified. |
| 4.5 Integrality/local tables | assaf line1038, §6.3, p.21; Theorem6.2.3 at line1013 | Noether/integrality supported; universal error-detection claim is not. All thirteen rational local terms match direct computations. |
| 4.9 Record Chern invariants | assaf line1013, Theorem6.2.3, pp.20–21; §6.3 | Supports the surface formulas after normalization and local contributions. The source’s preceding volume formula needs correction; supplied type/cusp data are essential. |
| 5.2 Enriques–Kodaira table | assaf line1054, Table1, p.21; beauville French1978 V.1 at line2291, printed p.74; V.10 at line2446, p.79 | Table agrees as necessary numerical possibilities. Source prose incorrectly includes Enriques at χ2; README table itself does not. English1996 classification-chapter/page locators remain uncertified. |
| 6.1 Simple connectivity | assaf line1216, Example7.3.2, p.25, citing van der Geer IV.6.1 | This passage only certifies the two F=ℚ(√11) components it discusses. General theorem across all stated F/components requires the inaccessible book; not inferred from the example. |
| 7.2 Record | Internal layers; assaf §6 and worked examples; lmfdb component_ideal line90 | Numeric assembly checked on D5 and multi-component rows. Full current LMFDB schema unavailable, and one/full cusp branches are not supplied (R17). |

**Pinned declarations opened and object-based duplication audit.** Paths in this table are relative to each pinned library root. Native definitions were read with their hypotheses, not inferred from their names.

| Pin and declaration | File/line and what the carrier actually contains |
|---|---|
| Mathlib `MeromorphicAt`; `MeromorphicAt.update_iff` | `Mathlib/Analysis/Meromorphic/Basic.lean:36,271`: punctured-neighborhood analytic germ; isolated point values are not fixed. This is the R02 witness. |
| Mathlib `Int.IsFundamentalDiscr` | `Mathlib/NumberTheory/FundamentalDiscriminant.lean:41,61`: includes squarefree integers congruent to1 mod4, including1. It is not a real-quadratic-field existence predicate. |
| Mathlib `FractionalIdeal.dual` | `Mathlib/RingTheory/DedekindDomain/Different.lean:229`: trace-dual fractional ideal, not a cusp-resolution construction. |
| Tau Ceti `NumberField.IsTotallyPositive` | `TauCeti/NumberTheory/NumberField/TotallyPositive.lean:71`: positivity at every real infinite place; vacuous for a totally complex field. The relevant quadratic theorems retain distinct real embeddings. |
| `NumberField.NarrowClassGroup`, `toClassGroup`, `toClassGroup_surjective`, `toClassGroup_ker` | `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean:83,150,159,206`; finite/cardinality comparison in `Finite.lean:59`. Supplies the canonical direction Cl⁺→Cl and its kernel. |
| `narrowEquivNarrowClassGroup` and narrow kernel comparison | `TauCeti/NumberTheory/Global/RayClass/Narrow/Basic.lean:134`; `Kernel.lean:254`. Resolves the ray-class/narrow-class carrier comparison. |
| `NumberField.units_sq_index_eq` | `TauCeti/NumberTheory/NumberField/Units/ElementaryTwoQuotient.lean:84`: full-unit square index 2^(rank+1). Real quadratic rank1 gives4, distinct from the positive-unit index1 or2. |
| `TauCeti.PlumbingGraph`, matrix and negative definiteness | `TauCeti/LowDimTopology/Plumbing/IntersectionForm.lean:88,108,150,155`: a simple graph with integer weights, hence it handles a chain; a nodal loop/double-edge cycle needs the separate matrix used here. |
| Algebraic toric `Fan` | `TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean:83–89`: finitely many cones. Does not itself provide an infinite arithmetic cusp fan or singular analytic gluing. |
| `BinaryQuadraticForm.reducedForms` | `TauCeti/NumberTheory/BinaryQuadraticForm/Reduced.lean:76,82`: finite reduced forms of discriminant −D, including imprimitive forms; D=0 has empty box. Ordinary class numbers require primitive forms. |
| `TauCeti.hurwitzClassNumber` | `TauCeti/NumberTheory/HurwitzClassNumber.lean:84`: weighted count, including imprimitive forms; H(0)=−1/12. It is not h(𝒪_D). |
| `Scheme.genus` | `TauCeti/AlgebraicGeometry/Cohomology/Genus.lean:64`: dim H¹(𝒪), guarded by finite dimensionality; for a surface this is irregularity, not χ−1. |
| `Scheme.Modules.eulerCharBelow` | `TauCeti/AlgebraicGeometry/Cohomology/EulerCharacteristic.lean:105`: truncated alternating finrank, with no built-in finiteness/vanishing. A genuine surface χ needs finiteness and truncation beyond H². |

Object searches covered cusp orbits/stabilizers, arithmetic toric fans, HJ periods and strings, unit-index groups, CM order counts, Chern cycles, surface rationality and Kodaira classification in pinned libraries, main, the supplied open heads and board packages. The roadmap service’s `roadmaps grep/show` was used to locate ownership; matched passages were read. The main examples read for shape included ImaginaryQuadraticClassNumber and Completed/AnalyticToricGeometry. No declaration in another readable roadmap had the proposed fully qualified namespace/name. Generic Fuchsian cusp data concern complex dimension one and are not a duplicate of the rank-two translation lattice here. The surface-specific resolutions and rotation/Chern arithmetic have a coherent new scope after the duplicate group/cusp targets in R13 are removed; wholesale rejection as a replanned roadmap is not warranted.

**Resolved cross-roadmap contracts.** Locations are README lines in the named main/new-head roadmap. Later revisions of existing roadmaps were not substituted for main.

| Supplier | Located contract and audit result |
|---|---|
| GlobalNumberFields (Completed) | Layer2 at `Completed/GlobalNumberFields/README.md:279` supplies moduli/ray-class carriers; Layer11 at571 supplies orders, invertible Picard ideals and conductor comparison. It does not identify all proper ideals with invertible ones. |
| ImaginaryQuadraticClassNumber (main) | H1.3 primitive reduced forms, H1.4 conductor formula, H2.2 quadratic zeta factorization were read. H2.2 says quadratic K, so its use for a real quadratic field is legitimate. |
| SchemeAndStackFoundations (main) | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:7129,7175`: §5.9 intersection and §5.10 adjunction/Noether/Hodge index exist with smooth projective hypotheses. |
| ComplexKahlerGeometry (main) | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1245,1274,1444`: K6.0 submanifold metrics, K6.1 compact Hodge theory, K7.2 Fubini–Study. Compactness is not lost. |
| ComplexManifolds (main) | `TauCetiRoadmap/ComplexManifolds/README.md:238`: Milestone4 is free, properly discontinuous, Hausdorff/local-compact quotient descent; not a theorem for stabilizer singularities. |
| FuchsianOrbifolds (main) | `TauCetiRoadmap/FuchsianOrbifolds/README.md:215,263`: Layers1/3 are one-variable elliptic/cusp charts; Layer6.1 names X(1). Used as models, not as two-dimensional quotient theorems. |
| HilbertModularForms (new open head) | §§0.1,1.2,1.3,1.4 at `TauCetiRoadmap/HilbertModularForms/README.md:315,465,496,507`; §§2.2,2.5,3.2,3.5,6.1 at617,695,806,894,1235. These resolve the groups/action/measure/forms contracts and expose duplicate cusp/index ownership R13. |
| ShimuraVarieties (new open head) | P.6 and §§0.1,0.4,1.2,2.5,2.7,2.8 at `TauCetiRoadmap/ShimuraVarieties/README.md:201,213,268,360,594,628,647`: analytic quotients, Baily–Borel and algebraization routes found. |
| HilbertModularVarietiesAndShimuraCurves (new open head) | H0.3,H1.1,H1.10,H5.2 at `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:245,352,525,1307`: polarization conventions align after the stated lattice conversion; level hypotheses matter (R12). |
| ShimuraCompactifications (new open head) | §0.13 at `TauCetiRoadmap/ShimuraCompactifications/README.md:655`, §2.1 at1174; Hilbert range at3100, contraction§8.32 at3685, full stabilizer§8.56 at4103. All C6 citations are stale (R11); correcting them also requires checking R12. |
| AutomorphicBundles (main/base text) | B3.Hilbert.0a is explicitly the alias of §7.2, at `TauCetiRoadmap/AutomorphicBundles/README.md:219,2307`. Its prime-to-p/ramified-splitting scope is stated; this alias is not a missing-section finding. |
| AnalyticToricGeometry (Completed) | Layers0,2,3 give finite-fan analytic charts. Its scope excludes the infinite arithmetic cusp fan; use the earlier arithmetic-fan targets and prove the comparison. AnalyticToricGeometryPartII does not silently change this to a general complex singular-fan theorem. |
| NeronModelsAndSemistableAbelianVarietiesPartII (new open head) | `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md:9823`: §6.1 owns q=P₂=0 ⇒ rational. Earlier ownership resolves this generic input; R13. |

The 28 resolver leads comprise eight local declarations, eighteen LMFDB identifiers, and two stale C6 citations. The manual audit found further stale C6 citations. No upward/cyclic supply was found by the movable dependency check; no declared supplier gaps were supplied by this package. The defects are missing/mis-scoped contracts, not an instruction to wait for Mathlib or to use a later supplier.

## Not verifiable

The following are limits of source certification, not inferred mathematical falsehoods. Every bibliography work was submitted through the sources service. The review is complete with a needs-changes verdict; it is not parked for missing texts. No source manifest or PR file was edited.

- **van der Geer, Hilbert Modular Surfaces (1988):** publisher DOI10.1007/978-3-642-61553-5 is paywalled/uncertified. In particular IV.6.1 (all-field/component simple connectivity), the VII classification criteria/table and the general-type bound were not read in the primary book. Assaf gives some secondary statements/examples, not certification of every primary hypothesis or page.
- **Prestel (1968):** DOI10.1007/BF01350863 is paywalled/uncertified. The level-one formulas can be tested numerically, but their exact original locators/hypotheses were not certified.
- **Hartshorne (1977):** DOI10.1007/978-1-4757-3849-0 is paywalled/uncertified. Supplier statements and the accessible Beauville original support some standard surface facts, not the exact Hartshorne page locators.
- **Hamahata (1995):** DOI10.1002/mana.19951730113 returned Wiley HTTP403. Theorems3.5,4.6,5.15,6.13 and the complete higher-level general-type lists in6.5 remain uncertified; Assaf Theorem6.5.1 gives only its quoted selection.
- **Beauville (1996 English edition):** Cambridge subscription landing page. The legal Numdam French1978 original was read at II.17, V.1 and V.10; this does not certify the English edition’s full classification-chapter/page locators. The French classification continues through IX–X, so an unspecified VI–VIII citation is insufficient.
- **Hirzebruch–van der Geer (1981):** sources search and MPIM institutional catalogue were checked; full text is restricted to institutional/registered access. ChapterII.1 was not read. Hirzebruch1973 supplies an accessible alternative for the local cusp construction, with some OCR display omissions.
- **Siegel (1969):** service lookup and legal catalogue searches did not yield the original text. Zagier1976 was obtained from the author page, but several formulas are absent from its extraction; the original Siegel locator is not certified. The exact rational sums in this report were computed independently.
- **Fulton (1993):** publisher DOI10.1515/9781400882526 did not supply open text; an indexed UT Austin institutional PDF returned404. Section2.6 was not certified.
- **Cox (1989):** service citation lookup found no legal full text; Theorem7.24 remains uncertified.
- **LMFDB schema knowls:** component_ideal was readable. The hmsurface, elliptic_point, elliptic_points, cusps, and general genus/Kodaira requests returned browser-challenge content; the remaining schema URLs either failed the service’s host classification or returned404 (cusp_resolution, elliptic_point_resolution). No challenge was bypassed. Thus7.3’s claim to match every named database field is not certified. The challenge text is not source evidence.
- **No exact locator supplied:** 2.7’s duality rule and several configuration/record assertions cannot be certified at an author-specified theorem/page. R01 has an independent counterexample, and R21 requires exact locators. The sampled numeric assembly statements were tested as recorded above, not certified by invented source references.

## Source issues

These describe defects in the versions actually read; they do not presume that the inaccessible primary book has the same defects. Preprint pages below are the printed page numbers in arXiv v2.

- **Error** in assaf immediately before Lemma4.1.1, preprint p.13, assaf line627: the source says determinants are normalized modulo squares of positive units; it should use squares of all units, as clarified in author errata item4, p.1; affects a stated result.
- **Error** in assaf at Lemma4.1.1(b), preprint p.13, assaf line631: the source says γ² equals u⁻¹ times a root of unity when detγ=u; it should be u times that root; affects a stated result.
- **Error** in assaf at Lemma4.1.1(b), preprint p.13, assaf line632: the source says nonsquare-determinant projective orders in real quadratic degree are at most6; it should permit order12 over ℚ(√3); affects a stated result.
- **Misprint** in assaf at §3.3 following (3.3.4), preprint p.10, assaf line450: the source says the next minus-continued-fraction term uses denominator w−b; it should use b−w; affects the proof.
- **Error** in assaf at (4.3.19), preprint p.17, assaf line872: the source says signatures map through a quotient Cl⁺/Cl; it should use the signature quotient identified with ker(Cl⁺→Cl), followed by the appropriate Artin character; affects the proof.
- **Error** in assaf at proof of Corollary4.3.13, preprint p.16, assaf line815: the source says a CM extension must ramify at a finite place; it should distinguish real ramification from finite ramification, as ℚ(ζ₁₂)/ℚ(√3) is finite-unramified; affects the proof.
- **Error** in assaf at (6.2.2), preprint p.20, assaf line1007: the source says the positive volume equals a negative multiple of ζ_F(2); it should use the positive functional-equation factor, giving 1/15 rather than −2/15 at D5; affects a stated result.
- **Error** in assaf at normalization preceding (6.2.2), preprint p.20, assaf line1001: the source says the reference group is PGL₂⁺ while retaining the PSL₂ volume formula; it should divide by the positive-unit square index when using PGL₂⁺; affects a stated result.
- **Misprint** in assaf at discussion after Table1, preprint p.21, assaf line1067: the source says Enriques surfaces occur among the χ=2 possibilities; it should omit Enriques there because χ=1; affects nothing.
- **Error** in assaf at Proposition6.4.1(i), preprint p.22, assaf line1082: the source says two intersecting curves of square−1 imply rationality when q=0; it should require smooth rational exceptional curves, excluding genus-two curves on a blown-up K3; affects a stated result.
- **Error** in assaf at Example7.3.2, preprint p.25, assaf line1218: the source says ℚ(√11) has h=h⁺=2; it should say h=1 and h⁺=2; affects nothing.

For the last correction, the Minkowski bound is √44/2<3.32: the prime above2 is principal via 3+√11 of norm−2, and3 is inert. Norm−1 is impossible modulo11, so the narrow class number doubles. For the finite-ramification correction, discriminants give 144/12²=1. For the order12 correction, t²−t+(2−√3) has projective eigenvalue ratio of order12 and totally positive nonsquare determinant2−√3. These witnesses separate actual source errors from mere OCR omissions.
