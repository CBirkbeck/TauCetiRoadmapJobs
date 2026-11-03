# Review of FaltingsFinitenessAndIsogenyTheoremsPartII (pull request #1738 at 5b87710)

**Verdict:** accepted

Three P3 findings; no P1 or P2 findings. Acceptance is conditional on the nine named mathematical supplier extensions listed below, as permitted by the review brief, and on the existing source waivers. This is readiness for human final approval, not approval or merge.

## R01 (P3) — Restore the supplier-contract identifiers

**Location:** `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:57`, also lines 67–77, 118 and 124. The paragraphs start “Consume the following extension of”.

**Claim:** These are the nine precise supplier extensions registered in the design, but none retains its prescribed `gap:<slug>` identifier in the README. That prevents matching the public contract to its registered identity by the intake's specified format. This is a registration defect, not missing mathematical ownership.

**Witness:** The README has zero `gap:` occurrences; `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/design/plan.json:3091` and lines 3103–3147 register the nine corresponding slugs.

**Repair:** Replace each opening with `What <Supplier> must provide (gap:<slug>):`, preserving its mathematics. Match these pairs:

| README line | Supplier | Slug |
|---|---|---|
| 57 | AbelianSchemesAndArithmeticModuli | hom-specialization-saturation |
| 67 | ArakelovGeometryAndAbelianHeights | hermitian-maximal-slope-existence |
| 69 | ArakelovGeometryAndAbelianHeights | hermitian-symmetric-power-slope |
| 71 | ArakelovGeometryAndAbelianHeights | hermitian-morphism-slope |
| 73 | ArakelovGeometryAndAbelianHeights | hermitian-metric-rescaling |
| 75 | ArakelovGeometryAndAbelianHeights | semistable-abelian-tangent-metric |
| 77 | ArakelovGeometryAndAbelianHeights | cubist-model-symmetric-ample |
| 118 | ClassFieldTheory | cyclic-maximal-subfield |
| 124 | AutomorphicBundles | fixed-siegel-cusp-family |

**Repair check:** Each proposed identifier has exactly one corresponding named entry in the design and one displayed mathematical contract. The saturation request remains about the missing torsion-free cokernel; it does not request the already supplied injectivity again. Historical superseded gap entries are addressed under the settled-findings audit below.

## R02 (P3) — Update the Fourier–Jacobi declaration locator

**Location:** `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:122`: “B5.1a, `ScalarFourierJacobi.expansion`”.

**Claim:** The cited section has a valid successor, but this declaration name is stale. The present section describes the torsor comparison with the scalar expansion supplied by ShimuraCompactifications.

**Witness:** `TauCetiRoadmap/AutomorphicBundles/README.md:4566` names `ScalarFourierJacobi.torsorDescription`; line 4570 identifies ShimuraCompactifications §7.15's `HodgeLineFJ` as the underlying expansion.

**Repair:** Cite AutomorphicBundles §12.2 (formerly B5.1a), its torsor-level scalar Fourier–Jacobi description, and the underlying `HodgeLineFJ` construction it consumes. Remove the nonexistent `ScalarFourierJacobi.expansion` attribution. The older B4/B5 section numbers themselves are not missing suppliers: the supplier explicitly provides their conversion.

**Repair check:** The coefficient specialization used here is over characteristic zero with rational coefficients, within the section's good-characteristic field and flat-coefficient setting. Its determinant-weight expansion is the required object. No new foundational target or supplier gap is needed.

## R03 (P3) — Correct the degree-one-field source attribution

**Location:** `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:954`: “for the D≥2 form and the separate D=1 form”.

**Claim:** Masser–Zannier Lemma 2.2 states the bound with a field-degree upper bound D≥2. It does not state a separate D=1 formula. The roadmap's unified theorem and its actual proof are sound.

**Witness:** mz20 line 397 introduces D≥2; mz20 lines 402–404 give the short proof without a separate D=1 assertion.

**Repair:** Attribute the D≥2 form to mz20 Lemma 2.2 and the all-degree input to gr14 Theorem 1.4 and EllipticCurveModularityPartII §6.0f. Alternatively explain that the mz20 statement also covers fields of degree one by taking its upper-bound parameter D=2.

**Repair check:** For E:y²=x³+1 over ℚ, j=0 and the identity degree is 1. The roadmap gives 1≤C. Substituting D=1 into the unclamped source expression gives 0; applying the source with upper bound D=2 gives 4c(log 2)², which is positive.

## Verified sound

The review covered both files at the specified head: all 50 numbered target subsections, their definitions, API clauses, proof routes, Checks and examples; the conventions and supplier contracts; all 15 seeded source targets; and both Lean headline theorems. The ledger contains 94 computed rows. Exact arithmetic was also recomputed with rational determinant calculations and finite-field enumeration. Numerical examples below test the statements and their hypotheses; they are not proofs of the general deep theorems.

### Principles, shape and gate

The folder extends the parent beyond qualitative number-field finiteness/Tate theory. It does not replace the parent or duplicate its qualitative construction. The all-prime assertions retain the finite exceptional set and its contribution to the global bound. Both CM and non-CM elliptic curves, arbitrary division-algebra index, nonprincipal polarizations and finitely generated characteristic-zero fields remain in scope. There is no computational algorithm proposed as roadmap content.

The README has the required Summary, ownership, conventions, exact contracts, build explanation, ordered layers, examples, dependencies, consumers and references. Definitions have API clauses and at least three discriminating Checks; additional nontrivial quantitative results are identified as targets rather than hidden assumptions. Section 2.3 explicitly owns the filtered-jet argument and tangent-height estimates; §2.8 owns the field-degree bound for principalization; §8.1 owns function-field algebraicity.

The worker's gate at this exact head reports all checks passing:

```text
gate FaltingsFinitenessAndIsogenyTheoremsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The independent dependency check produced:

```text
depcheck: 204 roadmaps, 1629 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The diff outside this folder was empty. The worktree remained unchanged. Independent direct elaboration of `Suggested.lean` succeeded with only its two expected `sorry` warnings.

### Seeded source verification

Locators below refer to the supplied legal source extractions. Where OCR obscured a formula, the corresponding cached PDF page was inspected. Preprint internal pagination is kept distinct from published pagination.

| Target | Text and locator opened | Hypotheses and support |
|---|---|---|
| 1.2 Rosati length | mw94-preprint lines 103–165; §2, internal pp. 2–4, (2.1), Lemmas 2.2–2.3 | Abelian trace, positive Rosati form, square root; rational scalar extension preserves the norm. The roadmap correctly keeps Tr(1)=2g and absolute scalar value. |
| 1.5 Degree polynomial | mw94-preprint line 149, Lemma 2.3 proof, internal p. 4; lines 433–438, §6 internal p. 11; mz20 lines 917–924, p. 656 | Lattice determinant and homogeneous degree polynomial, with zero on nonisogenies. Positive complex orientations remove the absolute value. Dimension zero is separately specified. |
| 1.6 Degree inequality | mw94-preprint lines 148–165, Lemma 2.3, internal p. 4 | Positive dimension and exponent g, with denominator 2g; rational extension follows by homogeneity. |
| 1.8 Weak Siegel bounds | mz20 lines 817–872, Lemma 4.1, pp. 653–655 | Both-sided diagonal comparability, lower diagonal bounds and bounded real part match. The b/c reciprocal factors and reversed d ratio match; ordering diagonal entries is unnecessary. |
| 2.8 Short endomorphisms | mw94-preprint lines 245–375, §4 proposition and §5, internal pp. 6–10 | Integral elements span the rational End algebra; polynomial field/height dependence and principalization reduction are supported. The quoted principalization field bound is visible at lines 348–350; its primary Lemma 5.3 remains waived. |
| 2.10 Off-diagonal isogeny | mz20 lines 893–924, Lemma 4.2, pp. 655–656 | Principally polarized complex varieties, rationally nonzero degree polynomial, bounded integral coefficients and square-root discriminant. The roadmap supplies a full integral short basis, not merely a flagged basis. |
| 3.3 Norm body | mw95 lines 149–180 and subsequent §2 discussion, pp. 8–9 | Full regular norm, ordinary real coordinate measure, discriminant-normalized volume supremum. The division hypothesis excludes zero-norm nonzero order elements. |
| 3.4 Norm-body lower bound | mw95 lines 230–338, Lemmas 3.1–3.3, pp. 10–14; particularly line 319, p. 13 | General division ℚ-algebras, not only quaternion algebras. The cyclic maximal subfield is precisely assigned to the named contract. |
| 3.6 Isotypic traces | mw95 lines 485–493, Lemma 5.2, p. 18 | Isotypy over the same field as End and the regular/abelian trace ratio m/(2g) are retained. Taking absolute discriminants accounts for the Rosati involution's determinant. |
| 4.1 Hom cross-discriminant | mw95 lines 399–416, §4, pp. 15–16 | Opposite Hom directions between simple isogenous objects; square of the determinant, not its absolute value. |
| 5.5 Geometric isogeny | ts18 lines 154–163, Theorem 2.3, pp. 382–383; mw95 §7, pp. 22–23 | Dimension-dependent polynomial bound using the field and height of the source. The conclusion is geometric and does not assert rational Hom for twists. |
| 7.1 Integral image algebra | ry25 lines 456–497, §4.6, Theorem 4.7, pp. 260–261 | End defined over the ground field and its integral centralizer; algebraic span is distinguished from closure. The separate product-comparison proof establishes their equality in the relevant setting. |
| 7.4 Fixed-prime index | ry25 lines 515–541, proof of Theorem 4.7, pp. 261–262 | Fixed A,k,ℓ,d; rational commutant equality plus finitely many bounded-index open subgroups. The roadmap supplies the compact matrix-group/topological-generation step explicitly. |
| 7.6 Large-prime equality | ry25 lines 542–599, pp. 262–263 | Simultaneous residual semisimplicity and End comparison, centralizer reduction, double centralizer and Nakayama. The roadmap correctly uses M′ and the dual row-lattice ambient space. |
| 7.7 Uniform integral bound | ry25 lines 456–497 and 591–599, Theorem 4.7, pp. 260–263 | Finite product of fixed-prime bounds; dependence on A,k,d, not dimension alone. The product-comparison argument covers each open subgroup. |

Additional source checks included bost95 Theorem 4.1 and Theorem 4.2 with remarks (pp. 128–130, lines 381–453); Proposition 5.3 (pp. 134–135, lines 553–567); and Lemma 5.4 with its three inequalities (pp. 136–137, lines 598–628). The PDF confirms the jet-union indexing and the powers in the inequalities. The semistable extension requirement is retained instead of using only the potentially good-reduction proof.

gr14 Theorem 1.4, p. 347, lines 177–195 supports the imported elliptic numerical bound; gr14 §3.2, pp. 358–359, lines 607–639 and §6.8, p. 377, lines 1432–1441 support the slope conventions and symmetric-power estimate. noot95 lines 130–179, Proposition 1.3/Corollary 1.5, pp. 163–165 were checked for specialization and the invocation of function-field Tate theory. deligne84 Theorem 2.7, printed p. 39, lines 528–553 supports the full-Galois commutant input, not an unsupported assertion about arbitrary adelic subgroups. mw93-isog-preprint §4, internal pp. 5–6, lines 210–245 supports the short-period reduction. The inaccessible primary components are listed separately below.

### Adversarial calculation ledger

Notation: E is a non-CM elliptic curve unless marked Gaussian; q is squared Rosati length; disc is the signed regular discriminant; Δ is normalized subvariety degree. “Retain” means the computed instance agrees with the stated claim and requires no mathematical change. Constants in existence bounds are not falsely assigned numerical optimal values.

| Statement | Instances tried | Computed values on the two sides / excluded model | Result and change |
|---|---|---|---|
| Composition convention | Matrix units on E² | e₁₂e₂₁=e₁₁, whereas e₂₁e₁₂=e₂₂ | Retain order “after”. |
| Trace conventions | E, Gaussian E, dimension zero | Tr_A(1)=2; regular traces 1 and 2 respectively; empty trace 0 | Distinguishes all three conventions; retain. |
| Hermitian/alternating convention | Gaussian periods 1,i | E(i,1)=1, E(1,i)=−1 | Retain first-variable linearity and sign. |
| Height and polarization conventions | δ=4; formal h=−1; g=1 | χ=2, quotient degree 2; max(1,1,−1)=1; Zarhin dimension 8, formal height −8 | Negative-height substitution is formal, not a claim that an elliptic curve has h=−1; retain. |
| Empty determinants and natural index | Rank zero; infinite quotient | det(0×0)=1; infinite additive index has Lean value 0 | Explicit nonzero-index guard prevents a false finite bound; retain. |
| Hom-saturation contract, R01 | 2ℤ⊂ℤ and ℤ⊂ℤ² | First has equal ℤ₃-spans but cokernel order 2; second has torsion-free cokernel but ranks 1≠2 | Both saturation and rank comparison are necessary; restore identifier only. |
| Maximum-slope contract, R01 | Trivial Hermitian line and vector 1 | μ_max=0=−h(1); degree and field degree both double under a degree-two extension | Normalization agrees; restore identifier. |
| Symmetric-power contract, R01 | Rank 1, n=0,1,2; standard rank 2, n=2 | Rank-one slope 0=bound 0; rank-two monomial squared norms 1,1/2,1; μ_max=(log 2)/2≤4 log 2 | Quotient norm excludes unit-monomial wrong model; retain mathematics. |
| Morphism-slope contract, R01 | Multiplication by 2 on the trivial line | h(φ)=log 2+log(1/2)=0; μ_min=μ_max=0 | Zero map excluded; retain. |
| Metric/tangent contracts, R01 | Squared norms ×4; L→L⁴; symmetrization | Tangent slope shift −log 2; dual +log 2; tangent lengths 1→2; symmetrization slope shift −(log 2)/2 | Signs agree in §§2.3–2.4; retain. |
| Cubist symmetric-ample contract, R01 | Product type (1,2), powers n=1,2 | χ=2, c₁²=4, map degree 4; section ranks 2 and 8; degree/rank difference from principal case is (log 2)/4 | Principal-only construction cannot supply this case; named extension is needed. |
| Cyclic-maximal-subfield contract, R01 | Brauer invariants 1/3,−1/3 | Index 3, ℚ-dimension 9; doubling gives nonzero 2/3,−2/3; required lower bound 2⁹=512 | Quaternion-only theory fails this instance; retain all-index contract. |
| Cusp-family contract and R02 | τ=it, u=e^(−2); forbidden rescaling e^(−N)u | log(1/\|u\|)=2 versus N+2 after rescaling; decay gives ct≤log M+log(1/\|u\|) | Fixed arithmetic normalization is essential; update locator only. |
| Real minima suppliers | L=2ℤ×3ℤ, rectangular K | λ₁=1, λ₂=3, volume 8, covolume 6: 24=4·6; basis coordinates give 3·(4/3)=4 | Real, not squared, minima; retain. |
| Short basis versus flag suppliers | ℤ², unit disk, shear basis | Minima 1,1; flag-preserving basis lengths 1,√5 when N=2 | Prescribed flag alone does not give the needed bound; separate HeightsAndUnits supply is correct. |
| Hilbertian contracts | ℚ, ℚ(t), quadratic extension; Y²=T | Transcendence degrees 0,1; extension degree 2; T=2 fibre degree 2 connected, T=1 fibre has 2 components | Finite degree alone is insufficient; retain connected/full-image condition. |
| 1.1 representations | Gaussian i, zero and identity | P=(1,i); κ(i)P=(i,−1)=P[[0,−1],[1,0]]; ρ(0)=0, ρ(1)=I | Correct block signs; multiplication agrees with composition. |
| 1.1 lattice-preservation API | Scalar √2 and scalar 2 on ℤ+iℤ | √2·1∉ℤ+iℤ; 2·1 and 2i lie in lattice | Complex linearity alone does not define an integral endomorphism; retain. |
| 1.2 positivity/scalars | 0,−1,i,1+i on Gaussian E | q=0,2,2,4; lengths 0,√2,√2,2; 2≤2√2 | Norm, absolute scaling and triangle inequality agree. |
| 1.2 shear control | S=[[1,1],[0,1]] on E² | q(S)=6, q(I)=4, both degrees 1 | Degree does not bound length; retain. |
| 1.3 discriminant and sublattice API | ℤ[i], ℤ[2i], rank zero | Gram diag(2,2) gives 4; diag(2,8) gives 16=2²·4; empty determinant 1 | Correct index square and normalization. |
| 1.3 covolume/basis API | Gaussian order, sign-changed basis | Covolume 2, its square 4=Gram determinant; sign change keeps determinant 4 | Both directions of basis independence tested; retain. |
| 1.4 submultiplicativity | Scalars 2,3; shear S² | q(6)=72≤8·18=144; q(S²)=12≤6²=36 | Inequality, not multiplicativity; retain. |
| 1.5 degree polynomial | [−2] on E and E²; projection; g=0 | det=degree 4,16; projection 0=0; empty determinant/degree 1=1 | Handles nonisogeny and empty case correctly. |
| 1.6 degree inequality | [−2] on E², shear, rational [1/2] on E | 16=(16/4)²; 1≤(6/4)²=9/4; 1/4=(1/2)/2 | Retain g≥1 and rational degree. |
| 1.7 trace and bilinear formula | Gaussian 1,i | Rational trace 2=2Re(i·conj(i)); uncorrected complex trace 1; real Gram determinant 4 versus complex Gram determinant 0 | Roadmap corrects source normalization. |
| 1.8 coordinate bounds | τ=2i, κ=2i; identity; zero | (a,b,c,d)=(0,4,−1,0), q=8; b≤2C√8 and \|c\|≤C√8/2 both require C≥1/√2; zero gives 0≤0 | Reciprocal/reversed factors consistent; no ordering needed. |
| 2.1 minimal period subvariety | E² periods (η,η), (η,0), 0 | Minimal dimensions 1,1,0; product-principal Δ=2,1,1 | Zero period handled; diagonal differs from a factor. |
| 2.2 multiplicity estimate | Degree-two elliptic section; two points and length-two thickening | length·d_L(0)=2·1=2=d_L(E) in both cases | Scheme length is necessary; retain nonreduced case. |
| 2.2 exclusions | Zero section; empty S; dimension zero | Zero section at length 3 would give 3≤2; empty S gives 0≤2; dimension zero has 0 proper abelian subvarieties | Existing nonzero and g≥1 hypotheses exclude countermodels. |
| 2.3 jets and graded pieces | g=2, i=0,1,2; g=3, i=2 | Cumulative lengths 1,2,3 and 6; graded ranks in g=3 are 1,2,3; omitting xy gives 5 | Full derivatives and truncation agree; retain. |
| 2.3 union and restriction | g=2, M=N=2, D=4 | Union length 9+5=14, not 19; principal h⁰=16, kernel≥2; type (1,2) h⁰=32, kernel≥18 | Intersection at 0 is correctly absorbed. |
| 2.3 sufficient inequalities | g=2, d=r=h=1, N=2 | M≥CD; D²d_L(A)≥CM; M²≥16CD(D+M+log 2) | Exponents agree with the source; the dimension-count example does not claim these necessary. |
| 2.3 tangent-height estimates | B=F=0; rank b under L→L⁴ | Height 0, log degree 0; height shift b log 2, log-degree shift b log 4 | Correct rank-zero and metric scaling; retain. |
| 2.4 period theorem | Principal E, zero/nonzero period; degree-three L | Δ=1 in principal cases; full E with degree-three L has Δ=3, not polarization map degree 9 | Normalized degree distinguished; constants remain dimension-dependent. |
| 2.4 arbitrary-ample reduction | Symmetrize L on b-dimensional B | Riemann form and squared period norm ×2; Δ×2^b; slope shift −(log 2)/2 | Same normalization as the supplier contract; retain. |
| 2.5 cusp-height evaluation | Fixed nonzero value e^(−2); zero; rescaled value | Inverse logarithmic height 2; rescaled value gives N+2; zero has no finite logarithmic inverse | Fixed family and nonzero coordinate indispensable; primary locator waived. |
| 2.6 imaginary-part bound | τ=it and τ=100+it | Both have Im τ=t; \|u\|≤Me^(−ct) gives ct≤log M+log(1/\|u\|) | No accidental dependence on real translation; retain weak-region hypotheses. |
| 2.7 short period basis | Rank zero; lattice vectors (1,1),(1,−1) | Empty Δ/product 1; determinant −2 gives integral index 2 despite rational span 2 | Full integral basis, not independent family, is correctly required. |
| 2.7 minima route | 2b minima each ≥a, product ≤P | Largest minimum ≤P/a^(2b−1); at b=1,a=1,P=2 gives ≤2 | Denominator positive by lattice/nonzero-period input. |
| 2.8 spanning conclusion | End(E)=ℤ; independent vectors in ℤ² | q(1)=2; two vectors above have rational rank 2 but index 2 | Rational spanning claim is appropriately weaker than integral generation. |
| 2.8 principalization | δ=1,4,9 on elliptic curves | Quotient degrees 1,2,3; for δ=4 there are 3 order-two subgroups; δ=9 has 4 order-three subgroups; ¼log4=½log2 | Square-root degree and field-degree tests agree; primary orbit bound waived. |
| 2.8 wrong quotient | Quotient by all E[2] | Degree 4, pulled-back polarization map degree 16, versus desired degree 2 and map degree 4 | Maximal isotropic subgroup condition excludes it. |
| 2.9 End bounds | Non-CM E; Gaussian E; y²=x³−x over ℚ | D_λ=2 and 4, basis q=2; rational End rank 1 becomes 2 over ℚ(i) | Arithmetic/geometric End distinguished; retain. |
| 2.10 off-diagonal construction | Swap and diagonal identity on E² | Swap q=4, length 2, √D=4; diagonal identity has both off-diagonal degrees 0 | Off-diagonal polynomial test needed; retain. |
| 2.10 polynomial grid | g=1 | Total degree 4; grid has 5 values per coordinate | A nonzero polynomial cannot vanish on that full grid; source dimension factor matches. |
| 2.11 polarized isogeny | Identity; [2] on E | Minimum degree 1 gives log 1=0; [2] degree 4 and height difference 0≤½log4=log2 | No logarithm of zero or negative height assumption. |
| 3.1 regular discriminant | ℤ, ℤ[i], ℤ[2i], M₂(ℤ) | Values 1,−4,−16,−16; M₂ trace(1)=4 | Full regular trace, not reduced trace; retain. |
| 3.1 nondegeneracy/basis law | Dual numbers, empty algebra, index-two sublattice | Dual-number Gram diag(2,0), det 0; empty det 1; −16=2²(−4) | Nonvanishing needs semisimplicity; roadmap has it. |
| 3.1 trace pairing API | Matrix units, basis change determinant −1 | tr_reg(eᵢⱼeⱼᵢ)=n≠0; determinant multiplier (−1)²=1 | Rational characteristic zero prevents trace collapse. |
| 3.2 class index | PID orders; ℤ[2i] acting on ℤ[i] | PID index 1; [ℤ[i]:αℤ[2i]]=2Norm(α)≥2, equality at α=1; rank zero index 1 | Finite generation/full span give the intended lattice class. |
| 3.2 opposite algebra | Hamilton basis | Left and right traces: tr(1)=4, tr(i)=0, tr(i²)=−4; same signed disc −256 | Right-module interface preserves regular discriminant. |
| 3.3 norm body | ℚ basis 1 and basis 2 | N=x or 2x; discriminants 1 or 4; coordinate interval lengths 2 or 1; products both 2 | Basis-normalized invariant determined. |
| 3.3 unit/multiplication API | Basis 2 in ℚ; 1+i in ℚ(i) | Coordinate unit 1/2 has N=1, coordinate 1 has N=2; N(1+i)=2 and N((1+i)²)=4=2² | Excludes wrong coordinate-unit convention; retain. |
| 3.3 complex volume | ℚ(i) | N=x²+y², disk area π, √\|disc\|=2, p=2π | Ordinary real area, no omitted complex factor. |
| 3.4 lower bound | ℚ, ℚ(i), Hamilton division algebra | 2=2¹; 2π≥4; N=(a²+b²+c²+d²)², √\|disc\|=16, volume π²/2, p=8π²≥16 | Split/nonsplit and complex normalizations agree. |
| 3.4 odd index | Central index-three division algebra over ℚ | m=9; required lower bound 512; Brauer double still nonzero | All-index supplier essential; no 2-torsion shortcut. |
| 3.5 class-index headline | ℤ,e=2; ℤ[2i],e=1 and e=2 | 1≤1; least index 2≤√16=4; product lattice index 4≤16 | Correct exponent e/2 and positive finite index. |
| 3.6 trace comparison | Non-CM E, Gaussian E, non-CM E² | (2g)^m\|disc\| and m^mD_λ respectively 2=2,16=16,4096=4096 | Same-field isotypy retained; no general-product overclaim. |
| 4.1 cross-discriminant | Rational and Gaussian self-Hom; 2ℤ paired with 3ℤ | c=1, (−4)²=16, 6²=36 | Square, not absolute determinant. |
| 4.1 symmetry/scaling API | Reverse paired lattices; sign change; indices 2,3 | 36 remains 36; sign 6→−6 preserves 36; scaling factor 2²3²=36 | Both Hom directions and separate basis changes agree. |
| 4.2 product formula | E²,E⁴; Gaussian E² | −16=(−1)2⁴; disc M₄(ℤ)=2³²=4294967296; disc M₂(ℤ[i])=2¹⁶=65536 | Parity and factor 2^(4m) verified. |
| 4.3 simple isogeny | Self-isogenies of E and Gaussian E | Identity degree 1≤1 and 1≤16; Gaussian scalar 1+i has degree 2=Norm(1+i) | Source/target direction and norm-to-degree exponent agree. |
| 4.4 stable power | Diagonal E⊂Eᴺ, including N=1,2 | Coordinate inverse degree 1; i₁(ℤ)^(2g)=1 | Ambient N correctly absent. |
| 4.5 polarization-free bounds | E with its dual; Zarhin construction | \|disc End E\|=1, cross-disc=1; dimension 8; formal h→8h | Uses regular rather than Rosati discriminant; retain. |
| 4.6 stable subvariety | Diagonal A⊂A⁸; A=E×E′ nonisogenous | Projection degree 1; two simple multiplicities both 1 | Requires an actual product; retain. |
| 4.7 product-dual | E×E′ with canonical dualities | Degree 1·1=1; formal factor heights −1 and 2 sum to 1 | Lower-height input needed to control separate factors. |
| 5.1 simple-factor product | Simple E; E²; projection E²→E | Product maps have degree 1; projection has positive-dimensional kernel and is not a finite isogeny | Equal-dimensional finite-map condition retained. |
| 5.2 quantitative factorization | Simple E and E² | One factor with multiplicity 1 or 2; minimal N=1 and log N=0 | No quantitative bound assumed in choosing the qualitative minimum. |
| 5.3 unpolarized rational estimate | Identity; degree-four [2] on E | Degrees 1 and 4; quasi-inverse bound N^(2g−1)=4 in g=1 | Direction reversal does not change the required field. |
| 5.4 relative extension | k=ℚ,K=ℚ̄; E² over ℚ(t) | Infinite [K:k] but D=1; GL₂(𝔽₃) has 48 elements, square 2304; identity factorization degree 1 | Finite Hom-definition bound used instead of [K:k]. |
| 5.5 geometric estimate | Non-CM E and nontrivial quadratic twist | Geometric isomorphism degree 1; rational Hom rank 0 | Geometric conclusion is essential and correctly stated. |
| 6.1 j-height headline and R03 | D=1,j=0; D=2,j=0 | Identity degree 1≤C and ≤4C; unclamped D=1 factor 0; source D=2 factor 4(log2)²>0 | Mathematical statement sound; repair attribution. |
| 6.1 constants and quantifiers | h_F≤h(j)/12+3, D≥1 | C₀=9781210000000; C=9C₀=88030890000000; H≤3max(1,log D)(1+h(j)) | One constant precedes fields/curves; no CM exception. |
| 7.1 algebra definition | Scalar End on Ẑ²; trivial V; rank one | Scalar algebra rank 1 inside matrix rank 4, infinite quotient; rank-one generated algebra is all Ẑ, index 1 | Finite span not definitionally closure; retain. |
| 7.1 universal property/multiplication | GL₂; scalar subalgebra C | (I+e₁₂)−I=e₁₂, e₁₂e₂₁=e₁₁; I+e₁₂∉C and generated algebra not⊂C | Both directions of containment equivalence discriminate. |
| 7.2 product and closure | Local lower-left-divisible orders at 2,3 | Mod 2 sizes 16/8=2; mod 3 sizes 81/27=3; global index 6; all primes yield infinite product quotient | Finite exceptional set necessary; controls are not falsely called Galois images. |
| 7.2 finite-span route | Local algebra rank r≤(2g)² | At g=1, at most 4 local generators; a finite coset decomposition gives a finite sum of compact modules | Independence supplies a product subgroup; prime idempotents then recover the product. |
| 7.3 row lattice | Gaussian action; scalar action | Commutator [[b+c,d−a],[d−a,−b−c]]; saturated two-row lattice M_A=1; mod 2 and 3 kernels have 4 and 9 elements, dimension 2 | Injectivity at 2 retained; dual ambient space correct. |
| 7.3 exceptional primes | ψ(x)=2x; ψ=0 | Integral kernel rank 0; mod 2 kernel dimension 1, mod 3 dimension 0; saturation index 2; zero map index 1 | Surjectivity requires ℓ∤M_A; retain. |
| 7.4 bounded local subgroups | ℤ_ℓ, d=ℓ²; rank-one scalar action | Subgroups of indices 1,ℓ,ℓ²: count 3; generated-algebra index always 1 | Quantifier order correct. |
| 7.4 finite-generation necessity | ℤ_ℓ× for odd ℓ; ∏ℕ𝔽_ℓ | Uniform subgroup index ℓ−1; infinite product has infinitely many distinct index-ℓ coordinate kernels | Imported matrix-group structure excludes countermodel. |
| 7.5 residual refinement | Full GL₂ residual image; trivial image on 𝔽₂² | Commutant dimensions 1 versus 4 | Threshold and semisimplicity not discarded; primary result waived. |
| 7.6 large-prime equality | Full GL₂; finite ℤ_ℓ quotient Q | Residual algebra dimension 4 equals centralizer rank 4; Q/ℓQ=0 forces Q=0 and index 1; Q=ℤ/ℓ has dim(Q/ℓQ)=1 | Correct Nakayama application and M′ threshold. |
| 7.7 uniform integral bound | Exceptional bounds 4,9; no exceptions | Product 36; empty product 1 | All primes accounted for; constant depends on A,k,d. |
| 8.1 rational and integral Tate | Constant non-CM E/ℚ(t), ℓ=2,3 | Both End lattices rank 1; ℚ(t) has one field generator but is not a finite-type ℚ-algebra | Correct field finite-generation hypothesis. |
| 8.1 saturation step | 2ℤ₂⊂ℤ₂ | Rational spans equal, integral index 2; torsion quotient nonzero | Rational equality alone insufficient; torsion-quotient factorization is explicitly supplied. |
| 8.2 specialization | Constant E; Legendre fibre λ=−1 | Constant End rank unchanged; generic Legendre rank 1, chosen CM fibre rank 2 and j=1728 | Existence of a chosen fibre, not every fibre; retain. |
| 8.2 integral equality | 2ℤ⊂ℤ; ℤ⊂ℤ² | Equal ℤ₃-spans with torsion order 2; saturated inclusion with ranks 1,2 | Both independent exclusions are present. |
| 8.3 supported image | Diagonal C₂ at two primes; trivial group | Projection orders 2,2 but supported groups and W have order 1; W(1)=1 | Supported groups are not projections. |
| 8.3 nonabelian control | Diagonal S₃ in two faithful matrix representations | Each projection order 6, each supported subgroup order 1 | Same distinction survives noncommutativity. |
| 8.3 connected-product API | ∏GL_n(ℤ_p); single-prime {±I} | Connected product gives W=U; finite {±I} has identity component {I} and W=1 | Identity component, compactness and closedness are used. |
| 8.4 supported-image bound | V⊂W, [W:W′]=2 | [V:V∩W′]=1 or 2; trivial V gives 1≤2 | Specialization subgroup need not be open in W; its intersection is open in V. |
| 8.5 full-field bound | U=ℤ,W=2ℤ,U′=3ℤ; nested lattices | Intersection 6ℤ; [2ℤ:6ℤ]=3=[ℤ:3ℤ]; ambient indices decrease 6→3 | Inclusion/index direction correct. |

In positive-characteristic, inseparable or non-Hausdorff tests, no extra scope is inferred from the source: the quantitative variety targets here explicitly assume characteristic zero, and the group arguments use compact closed subgroups of finite-dimensional matrix groups. The native elliptic isogeny degree includes inseparable degree, but the acceptance theorem specializes it to number fields. Zero rings are admissible only for the raw discriminant definition, where the empty determinant is 1; the division-algebra headline cannot instantiate them. Empty sets, rank zero, negative scalar maps, nonreduced subschemes, noncommutative multiplication, small primes and infinite-index junk values were tested above where relevant.

### Pinned APIs and duplication by object

The pins inspected were Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The following declaration bodies/signatures were opened, not inferred from a later library. Paths in this table are relative to the respective pinned library.

| File and line | Declaration / actual content relevant to this review |
|---|---|
| Mathlib/LinearAlgebra/Matrix/Trace.lean:43 | `Matrix.trace` sums the diagonal. |
| Mathlib/LinearAlgebra/Trace.lean:75 | `LinearMap.trace` uses a finite basis when available and otherwise returns zero; the roadmap's finite-dimensional/basis hypotheses avoid that junk case. |
| Mathlib/Algebra/Module/LinearMap/Defs.lean:1018 | `LinearMap.mulLeft` is left multiplication, available in the noncommutative algebra setting used here. |
| Mathlib/RingTheory/Discriminant.lean:67 | `Algebra.discr` is in the commutative-algebra setting; it does not subsume the noncommutative regular-order definition. |
| Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean:65 | `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` retains strict volume inequality, symmetry, convexity and the lattice/fundamental-domain data. |
| Mathlib/NumberTheory/Height/NumberField.lean:145 | `NumberField.absLogHeight₁` is the absolute logarithmic height; nonalgebraic junk is irrelevant over the number-field carrier. |
| Mathlib/Analysis/Matrix/Normed.lean:657 | `Matrix.frobenius_norm_mul` supplies the real matrix product bound with the Frobenius norm instance. |
| Mathlib/GroupTheory/Index.lean:55,561 | Natural subgroup index is the cardinal of the quotient; infinite quotient gives zero. The additive version is supplied by the same construction. |
| Mathlib/Algebra/Module/Lattice.lean:67 | `Submodule.IsLattice` includes finite generation and full span. |
| Mathlib/Algebra/Module/ZLattice/Basic.lean:433 | `IsZLattice` uses an explicit discrete-topology binder; its field expresses full span. |
| Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean:244 | `isSemisimpleRing_iff_pi_matrix_divisionRing` supplies the structural matrix/division-ring decomposition. |
| TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95 | Native abelian variety: proper geometrically integral group scheme over a field. |
| TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:83 | Native End is the additive reindexing of Hom, with composition multiplication. |
| TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:61 | Native abelian `IsIsogeny` means finite and surjective; it is not an arbitrary homomorphism. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139 | `TauCeti.Isogeny` carries the function-field pullback and infinity condition on native affine Weierstrass curves. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean:94 | `TauCeti.Isogeny.degree` is the finite function-field degree, not a free supplied scalar. |
| TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63 | Full rational integral lattice with symmetric integral pairing; neither positivity nor nondegeneracy is bundled. |
| TauCeti/Algebra/Module/ZLattice/Covolume.lean:42 | `ZLattice.covolume_sq_eq_det_gram` requires the full discrete lattice and real inner-product/Borel-volume setting. |
| TauCeti/RingTheory/Semisimple/DoubleCentralizer.lean:260,293 | Subalgebra and algebra-homomorphism double-centralizer forms; finite-dimensional faithful image/semisimple-module hypotheses are retained. |
| TauCeti/Topology/Algebra/Group/Profinite/ZHat/Decomposition.lean:164,184,189,329 | Ring/product equivalence, continuity in both directions, convergence of finite prime-idempotent sums. |
| TauCeti/Topology/Algebra/Group/Profinite/ZHat/Component.lean:70,121,136 | Component ring map, continuity and surjectivity. |
| TauCeti/Topology/Algebra/Group/OpenSubgroup/TopologicallyFinitelyGenerated.lean:114 | Finiteness of open subgroups of each index for compact topologically finitely generated groups. |

Object searches were run through `roadmaps grep` across main and indexed open heads, through the supplied sibling files, the board packages, and the pinned libraries. Searches included regular trace/discriminants, order class indices, norm bodies, cross-discriminants, short End spans, uniform residual/integral Tate bounds, supported adelic images, cyclic maximal subfields and Hermitian tangent/symmetric-power slopes. No duplicate fully qualified name for any of the three Lean declarations was found in another readable roadmap.

The generic objects are assigned to existing owners: integral lattices and covolumes to the pin; orders to ClassicalArithmeticCompletion; reduced-trace discriminants to PELModuli; real minima and basis estimates to SuccessiveMinima, GeometryOfNumbersAndQuadraticArithmetic and HeightsAndUnits; compact matrix-group structure to ArithmeticGaloisRepresentations; sharp elliptic isogeny estimates to EllipticCurveModularityPartII. This roadmap's regular, possibly noncommutative discriminant, quantitative class-index theorem, j-height conversion and uniform/specialization extensions differ from those supplies. The division-ring theorem is not a commutative discriminant theorem renamed.

### Resolved cross-roadmap supply and settled gaps

All `Needs` lines were read. Repeated citations were resolved by supplier/section; consumer-only mentions were not turned into dependencies. The relevant current sections are:

| Supplier | Resolved ownership and witness |
|---|---|
| AbelianSchemesAndArithmeticModuli | A3.3–A3.5, A3.9, A3.11; A4.1; A5.1–A5.4; A6.1, A6.4–A6.14, A6.20, A6.22, A6.25. Its README A5.1 begins at line 2510, A6.7 at 2936, A6.20 at 3329, A6.25 at 3438. A3.11 supplies the geometric quotient, not the new bounded field-degree theorem. A6.25 supplies injectivity; torsion-free cokernel is separately requested. |
| ArakelovGeometryAndAbelianHeights | §§1.1–1.6, 2.4, 2.7, 3.4–3.5, 4.4, 5.7–5.9, 6.1–6.2, 6.5. README §1.3 at 227, §2.7 at 839, §3.4 at 1026, §5.8 at 1580, §5.9 at 1622. The existing cubist construction is principal; type (1,2) genuinely needs the symmetric-ample extension. |
| GeometryOfNumbersAndQuadraticArithmetic | README §§0.2–0.3 at 247/323 and §1.3 at 436: adapted bases/projections and real minima product bound. The squared-minima convention in another section is not substituted. |
| SuccessiveMinima | README §§0.1–0.2, 1.5, 1.11: Gram bounds, prescribed flags and attainment. No claim that a flag bounds individual vector lengths. |
| HeightsAndUnits | Completed/HeightsAndUnits/README.md:270, §2.1: full integral basis with the gauge bound max(a_j,½Σa_i); both its general independent-vector and minima specializations are consumed. |
| RepresentationTheory/SemisimpleAlgebras | README Layers 2–3 and 6, latter at 293: structural decomposition, density and splitting/maximal subfields. It does not supply the stronger cyclic number-field presentation. |
| ClassicalArithmeticCompletion | README §7.4 at 14393 and §7.21 at 14867: full finite orders and maximal overorders. |
| PELModuli | README M0.3 at 529: reduced-trace discriminant, distinguished from the full regular trace by M₂(ℤ), −1 versus −16. |
| ClassFieldTheory | README Layer 10 at 1552: cohomological global Brauer sequence. The cyclic maximal subfield is an explicit extension, not falsely claimed as this section's existing theorem. |
| AutomorphicBundles | README compatibility mapping at 217–221: B4→Layer 11; B5.1a→12.2; B5.n→12.(n+1) for n≥2. Cusp forms §11.2, analytic comparison §11.9 and genus-one comparison §12.14 resolve the old labels. R02 records the stale declaration name in §12.2. |
| FaltingsFinitenessAndIsogenyTheorems | README R28.4.5 at 1870, R28.4.6 at 1898, R28.6.7 at 2808: number-field semisimplicity/integral Hom and almost-all-prime commutant. The new bounded-extension uniformity and function-field algebraicity are not assigned to those sections. |
| EllipticCurveModularityPartII | README §6.0f at 712, quantitative-elliptic-isogeny: all number-field degrees, both CM and non-CM, geometric conclusion, explicit 10⁷d²(max(h_F,985)+4log d)². Its sharp-period proof remains there. |
| ArithmeticGaloisRepresentations | README §5.8 at 3346 and compact-subgroup block at 3354, §6.4a at 4013, §7.6 at 4507: compact analytic subgroup charts, finite Frattini detection and monodromy. Finite topological generation follows from its open uniform subgroup and finitely many cosets. |
| NeronModelsAndSemistableAbelianVarieties | README §6.0 at 3652: independence, compatible torsion specialization and full image at a selected auxiliary prime, with the Noether-normalization bridge. |
| InverseGaloisAndArithmeticFundamentalGroups | README IG.2.4 at 1907, IG.2.6 at 2141, IG.2.8 at 2379: Hilbertian permanence, full-group specialization retaining constants, and finitely generated characteristic-zero fields. |

The resolver's report that AutomorphicBundles B4.2 is absent is a false positive against the supplier's explicit compatibility mapping; R02 is the narrower declaration-locator issue actually found.

The nine live mathematical contracts are precise in hypotheses and owners. The maximal-slope existence, symmetric-power and morphism inequalities are distinct inputs; the metric-rescaling contract explicitly derives its consequence from the supplier's degree law instead of requesting that law again. The semistable tangent lattice and general symmetric-ample cubist construction specify metrics, extension behavior and normalization. The cyclic request includes odd index. The cusp-family request specifies the fixed arithmetic family and exactly the weak region used. The Hom request has been narrowed to saturation.

The prior repair record `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/reports/FIX-PKG-FaltingsFinitenessAndIsogenyTheoremsPartII~2.md` marks retirement of legacy G1–G8 and the coarse slope entry as not actionable in the append-only design. Its reason remains valid: their mathematical content is now owned in §§2.2–2.8, 7.5 and 8.1, imported from the sharp elliptic/compact-group suppliers, supplied by the advanced pin, or replaced by precise named contracts. These are not re-raised as unowned mathematical prerequisites. R01 concerns the later removal of the nine live README identifiers, not retirement of those historical entries.

### Headline acceptance test and padding

The README's deep end results are the period theorem (§2.4), short-End and discriminant estimates (§§2.8–2.9), polarized isogeny estimate (§2.11), class-index bound (§3.5), polarization-free discriminants (§4.5), quantitative simple factorization and rational/relative/geometric isogeny bounds (§§5.2–5.5), elliptic j-height bound (§6.1), adelic product comparison (§7.2), uniform residual and integral Tate bounds (§§7.5,7.7), finitely generated field Tate comparison and End-preserving specialization (§§8.1–8.2), and supported/full image bounds (§§8.4–8.5).

Two are statable on the pinned carriers and are present: `class_index_bound` and `elliptic_isogeny_j_height_bound`. Their only added definition is the real-bodied `regularOrderDiscriminant`. The module docstring identifies the other headlines and the missing polarized complex-lattice, stable-height, abelian degree or Tate-module/action interfaces. Searches in the pinned native abelian files did not reveal those combined interfaces; no free predicate, arbitrary matrix substitute or sorry'd data is used.

A scratch copy with `#check @name` for all three declarations elaborated successfully. The output retains the division-ring and finite-dimensional hypotheses, both full-span hypotheses, finite ℤ-generation of M, e>0 and the nonzero additive-index clause. The elliptic statement retains the number-field and nonsingularity instances, genuine native geometric isogenies and a positive constant quantified before all fields and curves. No section binder was lost; no signature change is needed.

Each admitted theorem was tried with solving `simp`, `rfl` and `infer_instance` branches on a scratch copy. Neither closed. The object search found no one-library-lemma restatement. The two theorems are general quantitative headlines, not small-value Checks or boundary cases. No padding deletion is warranted.

## Not verifiable

These are limits of source certification, not new requests. The settled keys were preserved; no source was renamed or requested again.

- **mw93-periods:** The primary text remains waived. Lemma 5.3 for the principalization field bound, Lemmas 8.4/8.6 (pp. 439–440), equation (7.4) (p. 436), and the underlying period/auxiliary arguments cannot be certified directly. I checked the available author preprints mw94-preprint and mw93-isog-preprint, the combination in mz20 pp. 656–657, and Bost's alternative period route. These are evidence for the uses, not a claim to have read the waived primary pages.
- **mw95-refine:** The primary chapter, Theorems 1–2 and Corollary 1, pp. 211–224, remains waived. The supplied record says the publisher endpoint returned no PDF. ry25's simultaneous bounded-extension application was read at lines 483 and 548 onward; this does not certify the chapter's complete proof.
- **igusa:** Lemma 20, p. 104, remains uncertified. The book was not accessed. The weak-region decay is a precise AutomorphicBundles contract, and mz20 pp. 656–657 supplies the cited combination, not an independently checked proof of Igusa's statement.
- **fw84:** Chapter VI §3 remains uncertified. The primary chapter was not accessed. noot95 line 172 explicitly invokes it; §8.1 correctly treats function-field algebraicity as work owned here rather than deriving it from equality of specialized images.

No inaccessible source was counted as directly verified. The accepted verdict uses the brief's settled-waiver and declared-contract rules.

## Source issues

- **Error** in mw95 at §2, printed p. 8, mw95 lines 146–154: the source says a unital finite-free additive order automatically has separable rational algebra and nonzero trace discriminant; it should be assumed semisimple before asserting nonvanishing, since ℤ[ε]/(ε²) has discriminant zero; affects a stated result.
- **Error** in mw95 at §2 class-index definition, printed p. 8, mw95 lines 157–161: the source says every torsion-free module of finite rational rank has a free submodule of bounded finite index; it should be restricted to finitely generated order lattices, since ℚ over ℤ has rank one but no finite-index free rank-one submodule; affects a stated result.
- **Misprint** in mz20 at equation (22), printed p. 653, mz20 line 788: the source says the rational trace equals the ordinary complex trace expression; it should be twice the real part of that complex trace; affects a stated result.
- **Misprint** in mz20 at the Gram determinant following Lemma 4.1, printed p. 655, mz20 line 888: the source says to use the un-realified complex trace entries for the Rosati Gram determinant; it should be the entries twice their real parts, giving determinant four on the Gaussian basis instead of zero; affects a stated result.
- **Misprint** in mz20 at the scalar-length observation following Lemma 4.1, printed p. 655, mz20 line 873: the source says scalar length is n times the dimension factor; it should be absolute value of n times that factor; affects a stated result.
- **Misprint** in mz20 at the proof of Lemma 4.2, printed p. 656, mz20 line 921: the source says equation (50) defines the zero-diagonal block construction; it should be equation (27); affects the proof.
- **Misprint** in ry25 at the proof of Theorem 4.7, printed p. 263, ry25 line 590: the source says the row-lattice saturation intersects its rational span with E₀; it should be E₀∨, the ambient lattice of those rows; affects the proof.
- **Misprint** in ry25 at the proof of Theorem 4.7, printed p. 263, ry25 line 591: the source says to use the final adelic bound M in the large-prime threshold; it should be the previously established residual threshold M′; affects the proof.

