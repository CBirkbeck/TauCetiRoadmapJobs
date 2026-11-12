<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13019#issuecomment-6790503912 -->
Red team round 1 pass a (codex) of 2131a2b

Verdict: needs_changes

1. **F01** (P1) Unmatched vanishing includes targets with colliding block spectra

   **Location:** `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md:362` (§1.4), also §§1.2, 4.9–4.10. “SRO(f_Ξ,δ_H)=0 for every regular δ_H with no source match”.

   **Claim:** The relation imposes zero at every product-regular target without a regular source match, and §4.10 asserts the tensor lattice unit satisfies it.

   **Witness:** Unramified E/F, a=b=1, α=β=1; choose c∈O_E× with N(c)=−1. Target (c,c) contracts to (1,1): product-regular, no regular source match, but its tensor-unit stable relative orbital integral is 1.

   **Exact repair text:** “All target orbits tested in relative transfer are strongly regular relative to the source: each contracted block is regular semisimple and the two contracted characteristic polynomials are coprime. The unmatched-zero clause applies only on this locus.” Insert this convention into §1.2 and use “strongly source-regular target” in §§1.4 and 4.9. Preserve unmatched vanishing on this locus, including the nonreference forms. The supplier already makes this restriction in `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:950` (§2.11; strongly G-regular).

   **Repair test:** The pair above has resultant 0 and is excluded from the tested locus; its stable value remains 1 without contradiction. Distinct contractions 1 and 1+π have nonzero resultant −π and remain tested, with factor −q⁻¹. This does not remove the nonreference-form zero clauses.

2. **F02** (P1) The regularization proof invokes an uncited supplier theorem

   **Location:** `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md:520` (§3.2 proof route). “applies Tate’s continuation in each nonsplit factor”.

   **Claim:** The listed inputs suffice to construct and evaluate every regularized torus integral at s=0.

   **Witness:** The §3.2 Needs list contains no local Tate continuation theorem. Its owner is `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:938`, AL.1.3.2; AL.1.2.1 and AL.1.2.3 distinguish unramified rational continuation from ramified entire continuation.

   **Exact repair text:** Add to the supplier contracts and §3.2 Needs: “AutomorphicLFunctionsAndLocalFactors AL.1.1.2, AL.1.2.1, AL.1.2.3 and AL.1.3.2 supply local Tate integrals, their meromorphic continuation and regularity at zero for nontrivial quadratic characters, over each finite extension F_i/F, with multiplicative unit volume one.” Keep generalized orbital regularization here, importing the rank-one theorem. No new gap is required: this supplier is earlier in the merge order.

   **Repair test:** For the unramified quadratic character and 1_O, the continuation is (1+q^(−s))⁻¹ and takes value 1/2 at zero; with the trivial character it is (1−q^(−s))⁻¹ and has a pole. The contract supplies the actual nontrivial-character branch used in §3.2.

3. **F03** (P3) Cite the analytic implicit theorem actually needed

   **Location:** `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md:211` (§0.6 proof route and its Needs). “the implicit function theorem gives local analytic sections”.

   **Claim:** The named pinned `HasStrictFDerivAt.implicitFunction` supplies the analytic conclusion. The target is mathematically sound, but this cited declaration only supplies the strict-differentiable implicit function.

   **Witness:** `Mathlib/Analysis/Calculus/Implicit.lean:465` supplies a local implicit map; its conclusions do not assert analyticity. The needed result already exists as `ImplicitFunctionData.analyticAt_implicitFunction`, `TauCeti/Analysis/Analytic/Inverse.lean:131`, over arbitrary nontrivially normed fields.

   **Exact repair text:** Add to the Tau Ceti supplier contract and §0.6 Needs: “Use `ImplicitFunctionData.analyticAt_implicitFunction` from `TauCeti/Analysis/Analytic/Inverse.lean`, with the polynomial contraction and a continuous linear kernel-complement projection, to obtain analyticity of the implicit section.” In the proof route, explicitly combine this theorem with the strict implicit-function data. Do not construct a second analytic inverse theorem.

   **Repair test:** At standard rank-one X₀=1, r(z)=−N(z) has derivative dr₁(h)=−Tr(h). On the F-line its derivative is −2, invertible in every characteristic-zero F, including ℚ₂. The local section is analytic and satisfies r(s(−1+ε))=−1+ε after shrinking its neighbourhood. The theorem's complete normed-space hypotheses hold for these finite-dimensional spaces over F.

## Verified sound

Read all 899 lines of `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md` and all 38 lines of its `Suggested.lean`, together with the repository README and CONTRIBUTING rules. The tables below record boundary computations, not substitutes for proofs of the general theorems. R01 affects the relation used by downstream targets; the other rows do not certify that erroneous relation.

### Acceptance-test inventory

| File / declaration | Section and context | Instances and computed values | Result |
|---|---|---|---|
| `Suggested.lean`: no declarations | One `import Mathlib`; empty namespace `TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparisonPartII`; no variables, instances, definitions, theorems or examples | Declaration count=0; sorry-data count=0; padding count=0; missing elaborated contexts=0 | No signature to elaborate or one-tactic probe to apply; no Lean command was run |
| Hironaka isomorphism | README §2.3; unramified E/F, all residue characteristics | Rank 0: ℂ→ℂ, 1↦1. Rank 1: e_j↦T^j, e_(2d)↦T^(2d); free rank 2 | Named in module docstring; actual spherical functions, analytic Hecke algebra and normalized Satake missing at pins |
| Adjacent-rank comparison | §4.4; n≥1, unramified E/F | n=1, φ=1_(π^d O_E×): both tests=1_(π^(2d)O_F×), ω=1; odd valuation gives 0=0 | Named in docstring; relative matching, orbital distributions and spherical base change missing |
| Cyclic fundamental lemma | §4.6; n=a+b, a,b>0 | φ=1_K gives e_0 and e_0⊗e_0; φ=c_(2,1) gives target e_2⊗e_0+e_0⊗e_2 | Named in docstring; ordinary transfer and analytic spherical carriers missing |
| Relative unit fundamental lemma | §4.10; same positive block ranks | Reference target at collision (1,1) has value 1 versus demanded 0: R01; nonreference target functions=0 | Named in docstring; relative distributions and factor missing; must repair README relation |
| Full-module operator | §5.1; a,b>0 | e_(1,0)↦−e_1⊗e_0−e_0⊗e_1; e_(1,1)↦−q⁻¹e_1⊗e_1 | Named in docstring; same analytic spherical carriers missing |

There are five headline theorems in this inventory. None can be honestly stated using only a few simple definitions on the pinned carriers. In particular the arithmetic GL_n Hecke ring and GL₂ newform Satake parameters are not the required analytic spherical algebra. No weakened headline, freely supplied predicate or duplicate fully qualified Lean declaration is present.

### Boundary computations for all target sections

The numbered subsections are the target units: there are 36. Bold text in the mathematical body marks Checks, not additional separately named theorems; the bold source-correction labels are audited below. Every row includes its standing context. Here q≥2, v is normalized valuation, π is a uniformizer, and every orbital value uses the stated Haar normalization. Counts in the last column count the README Check bullets in that subsection, all read and recomputed; some bullets contain multiple instances.

| Statement / context | Instances tried and computed values on the two sides | Result / change; Checks |
|---|---|---|
| Conventions; characteristic-zero local F; quadratic étale E | Standard rank 1: δ²=−I, r(1)=−1. N(c)=−1 gives r₋(c)=1=r₊(1). D=π gives η(D)·abs(D)=−q⁻¹; over ℚ₃(√3), η(−1)=−1. q=2 gives q_E=4 and abs(π)_E=1/4. Torus mass 2 changes 1 to 1/2 | Signs, absolute values and measure directions agree; 3 |
| Hermitian classification gap; field / split cases | Rank 0: det(empty)=1, one class. Rank 1: classes 1,ε remain distinct modulo norms. Split E: N(1,t)=t, quotient size 1 | Gap scope distinguishes these cases; 3 |
| Integral orbit gap; unramified E/F | Rank-one valuations 0,1,−1 are distinct. Gram π has dual π⁻¹O_E, quotient length 1; Gram 1 has length 0. Over 𝔽₄/𝔽₂, N(ω)=1 and Tr(ω)=ω+ω²=1 | Dyadic case does not use division by 2; 3 |
| Unit-vector gap; unramified self-dual lattice | Rank 1: w⁻¹w=1 for N(w)=1. p(w)=w and p²(v)=w·h(w,w)·h(w,v)=p(v). h(0,0)=0≠1 | Zero vector excluded; 3 |
| §0.1; étale, equal finite ranks | X=1 gives δ*=−δ; changing lower-left sign gives δ*=δ. Split rank 1: (g,h)=(2,1) sends (1,1) to (2,1/2), product 1; wrong second action gives product 4. X=diag(1,π) gives δ²=diag(−1,−π²,−1,−π²) | Block and exchange-adjoint conventions agree; 3 |
| §0.2; étale; standard-coordinate API also over commutative star rings | Standard r₁(1)=r₂(1)=−1. Forms (1,ε): r(1)=−ε⁻¹. diag(1,π): both charpolys=(T+1)(T+π²). Split (1,0): both contractions=0. Rank 0: both determinants=1 | No invertibility assumed for the product identity; 4 |
| §0.3; étale algebraic quotients | (0,1) and (1,0) both map to 0 but cannot lie in the same GL₁ orbit. Section (−Z,I) maps to Z. diag(1,π) has trace 1+π, determinant π, polynomial T²−(1+π)T+π. Unequal forms send 1 to −ε⁻¹ | Quotient is not asserted to classify singular rational orbits; 3 |
| §0.4; étale symmetric regularity | Rank 1 z=0: polynomial T², repeated zero, not regular. Forms (1,π), z=1: T²+π⁻¹. diag(1,π): (T²+1)(T²+π²). Split diag(1,0): T²(T²+1), so distinct contracted eigenvalues alone do not suffice. Rank 0: polynomial 1 and trivial rank-zero stabilizer | Invertibility condition is necessary; 3 |
| §0.5; étale invertible locus | Unramified rank 1: −1 lifts, −π does not (norm valuation 0 versus 1). Forms (1,ε): fibre above −ε⁻¹ is U(1), and t↦(t,t) projects to t. Split fibre over T≠0: (u,−T/u) contracts to T, stabilizer quotient is F× | Algebraic torsor and rational-image distinction retained; 3 |
| §0.6; étale local analytic sections and cutoffs | 1_O_E cut over O_F× becomes 1_O_E× and pushes to 1_O_F×. Chart mass 2: ∫(h/2)1_J=h, versus ∫h1_J=2h. At X₀=1 the derivative on the F-line is −2, invertible also in ℚ₂; analytically, −(sqrt(1−ε))²=−1+ε on a sufficiently small ball | R03: add the existing pinned analytic implicit theorem; 3 |
| §0.7; étale regular X, positive Haar measures | Rank-one unit RO=1, not 0. Torus doubled: 1/2. Group masses 2 and 3, torus mass 4: RO=6/4=3/2 | Quotient orientation and scaling correct; 3 |
| §0.8; étale; compact support in Hom versus invertible Hom | For 1_O_E, values at valuations −2,0,1,2 are 0,1,0,1. Values at π^(2j) are 1 for every j≥0 and accumulate at zero. For 1_O_E× the values are 1 precisely at valuation 0 | Correct noncompactness distinction; 3 |
| §0.9; étale regular X with transported measures | X=1: RO=1=Orb. X=π⁻¹: 0=0. X=π: 1=1. Torus doubled on both sides: 1/2=1/2; doubling on one side gives 1/2≠1 | Integration-in-stages normalization agrees; 3 |
| §1.1; étale, a,b>0, existing elliptic datum | Field a=b=1: four form pairs (1,1),(1,ε),(ε,1),(ε,ε). Second contraction at 1 for form ε is −ε⁻¹. Split centres have dimensions 2 and 1, leaving a positive-dimensional quotient | Proper split elliptic data excluded; 3 |
| §1.2; étale regular matching | Distinct scalars with difference π: factor −q⁻¹ (−1/2 at q=2); unit difference: factor 1. Different characteristic products: matching false, factor 0. Equal scalars: resultant 0, hence not source-regular | Factor formula sound; R01 requires this domain in §1.4; 3 |
| §1.3; étale fixed-space stable class | Two orbital values 2,5: stable sum 7, nontrivial-character sum −3. Switch basepoint: 3=(−1)⁻¹·(−3) | Character orientation agrees with supplier; 3 |
| §1.4; étale relative transfer | At Δ=−q⁻¹ and source A=1, required target=−q⁻¹, not 1. On a genuinely source-regular unmatched target the zero-source condition is 0, so value 1 fails. Adding an orbital-kernel element contributes 0. Collision target (c,c), N(c)=−1: SRO=1 versus asserted 0 | R01; 3 |
| §1.5; étale compact support away from singular maps | 1_O_E× pushes to 1_O_F×; 1_O_E gives values 1 at every π^(2j), hence is not compact on F×. Target chart mass 2: (1/2)1_(B×J) pushes to 1_B, unscaled test pushes to 2·1_B | Cutoff proof repairs the source's support argument, conditional on corrected transfer domain; 3 |
| §2.1; unramified, all integral dominant coweights | Rank 1: e_0(1)=1,e_1(1)=0; e_0(π)=0,e_1(π)=1; e_−1(π⁻¹)=1. Hecke unit acts with coefficient 1. Rank 0: singleton, det=1, one basis element | Both form classes and negative coweights retained; 5 |
| §2.2; unramified, complex normalized Satake | Both composites send Z₁ to q⁻¹X² for a=b=1. ξ_E(Z₁Z₂)=q⁻²XY, coefficient 1/4 at q=2. BC(T_10,E)=T_20,F−(q−1)T_11,F: coefficient of odd coweight is −1 at q=2 | Corrects false even-coweight support argument; 3 |
| §2.3; unramified full spherical module | Rank 1: ê_j=(−1)^jU^j, dictionary U=−T gives T^j; action shifts j by 2d, so e_1 is noncyclic and H⁻¹H(e_1)=e_1. Rank 2: μ(e_10)=q−1, ê_10=√q(U₁+U₂), H(e_10)=−T_10; ê_20=q(U₁²+U₂²)+(q+1)U₁U₂, ê_11=−U₁U₂, their stated combination gives q(T₁²+T₂²). Rank 0: rank 2⁰=1 | Polynomial and low-rank normalizations agree; OCR qualification below; 7 |
| §3.1; field, separable regular x, cyclic reference | Rank 1 norm quotient has two elements, one on each form. S₁ empty gives one element. With S₁={1,2}, ζ=(ε,1), κ_{1}(ζ)=1 and κ_{2}(ζ)=−1 | Complementary-coordinate character, not subset-coordinate character; 3 |
| §3.2; field, nontrivial quadratic characters on nonsplit factors | Unit shell integral=1; π-shell=−1 unramified. Integral-ball continuation=(1+q^(−s))⁻¹, value 1/2 at zero. Trivial character instead has denominator 1−q^(−s), a pole. Surviving-coordinate rescaling by π multiplies value by η(π)=−1 | R02 adds exact continuation supplier; 3 |
| §3.3; field, raw germ, r=#S₁ | Rank 1 unit: raw G=1/2 and averaged sum=(1/2)(1+0)=1/2, not 1. v=π,v*=π⁻¹: ω=−1,G=−1/2, product 1/2. Rank 2: HHᵗ=4I, inverse coefficients 1/4. Rank 0: coefficient 1 | Finite inversion normalization correct; 3 |
| §3.4; unramified additive descent | Integral matrix/vector unit descends to product integral units with coefficient 1. Nonintegral vector gives 0 on both sides. a=b=1,m₁=π: du=q⁻¹du′, and normalized descent with determinant twists gives the same q⁻¹ | Additive versus group measure factor correct; 3 |
| §3.5; field determinant identity; unramified descent | a=b=1: det[v,xv]=x_b−x_a=−D. Ramified ℚ₃(√3), x_a=0,x_b=1: ω=1=signed formula, unsigned formula=−1. Unramified D=π: raw Jacobian q, transfer factor −q⁻¹. Mixed a=2,b=1 example: D=−1, full cyclic determinant −1; wrong retained vector gives inner coset values 1,0, prescribed zero vector gives 0,0 (changed positive test gives 1,1) | Mixed split factors correctly zeroed; 4 |
| §3.6; unramified augmented comparison assumed in every rank | r_n=2,r_a=r_b=1: 2⁻²=2⁻¹·2⁻¹. D=π: −q⁻¹, not −1. Three nonreference tests contribute 0. If η(c_b)=−1, b-block stable sum and source-basepoint correction both acquire −1 and cancel | Lower-rank use and reference sign accounted for; 4 |
| §3.7; unramified, descended agreeing Weil actions | Two decompositions differ by C in the intersection: W_GL C−W_U C=0. If intersection=0 and A,B nonzero, A−B≠0 lies only in the sum. At 1,1,1: trace pairing gives 4=2+2, norm gives 4≠1+1 | Sum-space action and bilinear kernel correct; 3 |
| §3.8; unramified, n≥1, adjacent comparison assumed | Norm-one projector gives p(w)=w,p²=p even over ℤ₂. q(a)=π,t∈π⁻¹O: ψ(tq(a))=1; unit q(a) permits a value ≠1. diag(π⁻¹,π)n(t)diag(π,π⁻¹)=n(π⁻²t); union π^(−1−2j)O=F | No division by 2; all upper unipotents obtained; 3 |
| §4.1; unramified signed/positive adapter | N(c)=−1 gives −N(c)=1; diag(1,π) goes to diag(1,π²), while norm-one c gives the negative. In ℚ₃(√3), unit norm residue is a square, so −1 mod 3 is excluded | Ramified case explicitly excluded here, not silently reused; 3 |
| §4.2; unramified spherical pushforward | Rank 1 double coset πO_E× pushes to e_2; π⁻¹O_E× to e_−2; valuation-one target has value 0 | Determinant valuations double; 3 |
| §4.3; unramified product contraction, n≥1,m=n−1 | 1_K⊗φ contracts to vol(K)φ=φ; mass 2 would give 2φ. m=0 gives a one-point integral with value φ. γ₁=I gives Ω=ω(γ₂); n=1 gives ω=η(1)=1 | Rank shift and unit normalization agree with contract; 3 |
| §4.4; unramified adjacent comparison | n=1,φ supported at valuation d over E: both sides supported at 2d over F with value 1; odd valuation gives 0=0. Nonreference block-form component is zero by the product comparison contract | Independent product supplier retained; 3 |
| §4.5; unramified augmented comparison, every positive rank | Rank 1 reference lattice value=1, other-form test=0; raw singular germ=1/2. φ at valuation 1 over E: matrix valuation 2 gives value 1, valuation 1 gives 0 on both test sides | Regular and singular-vector values distinguished; 3 |
| §4.6; unramified proper block endoscopy | Unit: e_0↦e_0⊗e_0. c_(2,1): target e_2⊗e_0+e_0⊗e_2, each coefficient 1. Rank-one e_1 has odd support and cannot equal a sum of even e_(2d) | Cyclic-only scope correct; Check's later c_(2,1) notation is not a proof dependency; 3 |
| §4.7; unramified lattice grades | Φ_1,2=e_2, Φ_1,1=0; all negative grades=0; Φ_1(π^(2d))=1 for all d≥0. Rank 2 grade 2: coefficients 1 at (2,0), q+1 at (1,1), hence 3 at q=2. Rank 0: single grade, density=overlattice count=1. Self-density for n=2,q=2: (3/2)(3/4)=9/8>0 | Finiteness per grade, noncompact total and density denominator sound; 6 |
| §4.8; unramified, d≥0 | n=2,d=1: q(Z₁+Z₂)↦X+Y. d=0: 1↦1⊗1. a=b=1,d=2: X²+XY+Y², three terms. Rank 0: h_0=1,h_d=0 for d>0, c_0,0=1,c_0,d=0 | No denominator or natural-subtraction failure; 3 |
| §4.9; unramified, all four relative data simultaneously | Total grade 2: target values at valuation pairs (2,0),(1,1) are 1,0. Single datum (π,1) has odd total valuation: source and twice-source both satisfy its unmatched condition, while ordinary reference value would change 1→2. Odd/negative total gives 0=0; block valuations (2,4) pick only grade 6 | Simultaneous quantifier is necessary; R01 repairs target domain; 4 |
| §4.10; unramified, a,b>0, all residue characteristics | Four target functions: tensor unit,0,0,0, including zero at form pair (π,π) despite even total discriminant. q=2,D=π: factor −1/2. Grade 2 has exactly e_2⊗e_0 and e_0⊗e_2. Collision reference target contradicts current §1.4 by 1≠0 | R01 blocks theorem as presently defined; 3 |
| §5.1; unramified, a,b>0, transported algebras | Unit maps to tensor unit. Cyclic c_2,1 maps to two even terms. Noncyclic e_10 maps to −e_1⊗e_0−e_0⊗e_1; simultaneous spectral sign changes cancel, mixed ones reverse it. e_11 maps to −q⁻¹e_1⊗e_1. e_22 maps to q⁻²e_2⊗e_2; general central coefficient q⁻²ab | Full-module algebra map makes no unsupported orbital-transfer assertion; 5 |

The table covers 135 Check bullets: 12 in conventions/contracts and 123 in the 36 numbered subsections. Definitions have at least three Checks in their subsection; the associated API identities were checked with the same instances, including zero maps, lift independence, scalar multiplication and identity actions. The degenerate objects excluded by the standing hypotheses do not manufacture counterexamples: q=1, a zero coefficient ring, equal characteristic, an inseparable quadratic algebra and nonreduced test rings are not inputs to the local-field theorems. Split quadratic algebras are handled as étale algebras, not as fields. Rank zero is retained where claimed; proper endoscopy retains a,b>0. No quotient integral is claimed for a non-unimodular stabilizer without the modular condition. Determinant divisions occur only on invertible or cyclic loci, and volume divisions have positive finite denominators.

### Suppliers, pins and ownership

Resolved 24 distinct cited supplier sections against current main or the available open head, including the named targets within them; checked all seven declared gap slugs against both `design/plan.json` and the README. Counts exclude repeated Needs citations. The sole resolver warning about `IntegralHermitianLattice.ofCarrier` is not a defect: it is a planned target in the cited supplier, not a pinned declaration.

| Supplier contract | Current evidence and scope comparison |
|---|---|
| EndoscopicTransferAndUnitaryTraceComparison §§1.1, 1.4, 1.5, 1.14, 1.17 | `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:166`, `:288`, `:323`, `:555`, `:638`: crossed-module/abelianized cohomology, endoscopic data, rational classes, norm-coordinate centralizers and pure-form inv. Its character is trivial on a and nontrivial on b, as used here. |
| Same supplier §§2.1, 2.4, 2.9, 2.11, 2.12 | Same file `:688`, `:764`, `:891`, `:948`, `:979`: raw quotient orbital integral is distinguished from discriminant-normalized integral; κ reindexing gives κ(d₀)⁻¹. §2.11 explicitly requires strong G-regularity. §2.12 has odd-unramified scope; the larger factor formula is correctly a declared gap. |
| Same supplier §§3.3, 4.7, 4.9(b) | Same file `:1141`, `:1855`, `:1912`: characteristic coefficients, characteristic-zero Lie smooth transfer, spherical base change. Coefficients in §3.3 are indexed from the constant term; the package asks for all nonleading coefficients without imposing an inconsistent order. |
| GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9, 3.2 | `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:703`, `:772`, `:878`: lattice and dual with Dedekind/nondegeneracy hypotheses, signed carrier/adjoint, unramified Hermitian densities including dyadic places. The saturation density sum at equal source/target rank supplies the density side of the new contraction adapter. Its other Hironaka space is U(2n)/(U(n)×U(n)), not this X_n. |
| AdelicAlgebraicGroups §2.2 | `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:1773`, `:1852`: quotient-measure explicitly consumes AnalyticNumberTheoryPartII §5.3k, including integrable functions, Haar scaling and integration in stages. It is a valid supplier interface; right/left convention agrees in these unimodular groups. |
| SmoothRepresentationsOfLocalGroups SR.4.1 and SR.4.3 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md`, targets satake-isomorphism and parabolic-descent; latter at `:3421`. The E-map substitutes q⁻ᵇX and q⁻ᵃY. The F-map here uses q^(−b/2),q^(−a/2); squaring gives the E substitutions. |
| SchemeAndStackFoundations §1.24 | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3174`: affine semilinear Galois descent applies to the equivariant coordinate-ring isomorphism. The elementary invariant-ring proof remains here. |
| ReductiveGroupsPartII RG2.0 | `TauCetiRoadmap/ReductiveGroupsPartII/README.md:640`: smooth-group-analytic-charts exists for characteristic-zero local groups; analyticity of the section additionally uses the pinned analytic implicit theorem (R03). |
| MetaplecticAutomorphicForms §§2.1, 2.5, 3.2a | `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:404`, `:522`, `:608`: weilIndex, weil_generators and splitHermitianOscillator. At ε=+1 the pairing is (ℓ(y),k(x)), with GL(A) acting by (g,(g⁻¹)∨); this gives the exchange adjoint and works at rank zero. |
| Proposed extra dependency for R02 | `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md`, AL.1.1.2, AL.1.2.1, AL.1.2.3, AL.1.3.2: actual rank-one local zeta integral and continuation, not higher-rank Langlands. Earlier than this package in `merge-order/ORDER.txt` (positions 95 and 152). |

The seven declared contracts have named owners and matching slugs: `jr-local-comparison`, `jr-weil-descent`, `jr-product-base-change`, `unitary-factor-all-quadratic`, `hermitian-field-classification`, `unramified-hermitian-lattice-orbits`, `unramified-unit-vector-transitivity`. Their present absence from the supplying roadmap is not a finding. They keep the needed dyadic/ramified branches separate from narrower current theorems. The product comparison contract explicitly forbids dependence on the unit theorem proved here, so the conditional route is acyclic.

At the manifest pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, all 11 named library declarations were found and their types/bodies read:

| Declaration(s) | Pinned file and evidence |
|---|---|
| Matrix.conjTranspose | `Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean:43`: entrywise star followed by transpose |
| Matrix.IsHermitian; Matrix.isHermitian_mul_conjTranspose_self; Matrix.isHermitian_conjTranspose_mul_self | `Mathlib/LinearAlgebra/Matrix/Hermitian.lean:45`, `:286`, `:290`: equality Aᴴ=A and the two Hermitian products; no local-field or measure structure |
| Matrix.charpoly; Matrix.charpoly_mul_comm | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140`, `:279`: determinant of TI−A; square finite matrices over a commutative ring |
| MvPolynomial.hsymm | `Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean:312`: complete homogeneous symmetric polynomial; degree-zero value 1 |
| MvPolynomial.bind₁ | `Mathlib/Algebra/MvPolynomial/Monad.lean:67`: substitution via algebra evaluation |
| HasStrictFDerivAt.implicitFunction | `Mathlib/Analysis/Calculus/Implicit.lean:465`: complete normed source, finite-dimensional target and surjective strict derivative; R03 supplies the missing analytic citation |
| TauCeti.map_normUnits_unitFiltration; TauCeti.mem_normGroup_iff_dvd_normalizedValuation | `TauCeti/NumberTheory/LocalField/Norm/Unramified/Basic.lean:126`, `:158`, with hypotheses at `:64`: finite-dimensional unramified valued extension of nonarchimedean local fields. Depth 0 gives surjectivity on units; inertia degree 2 gives even norm valuations |

For R03, additionally read `TauCeti/Analysis/Analytic/Inverse.lean:58`, `:131`, `:148` and `Mathlib/Analysis/Calculus/FDeriv/Analytic.lean:422`: the general analytic implicit theorem and the analytic inverse result hold over arbitrary nontrivially normed fields, not only ℝ/ℂ.

Object searches covered the pinned libraries, main and Completed roadmaps, board packages, and the open-head index through `roadmaps grep` and `roadmaps show`. The arithmetic Hecke ring at `TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Basic.lean` uses ℤ and arithmetic p-local double cosets. `TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:90` defines GL₂ newform parameters as polynomial roots, not the spherical Satake isomorphism. Neither provides a missing headline carrier.

The nearest open heads were compared: GanGrossPrasadUnitaryGroups owns relative Bessel/period specializations and delegates general Jacquet–Rallis geometry to the same parent; AutomorphicLFunctionsAndLocalFactorsPartII owns doubling comparisons; ExceptionalThetaCorrespondencesForG2 owns exceptional theta models; MetaplecticAutomorphicForms supplies generic Weil theory; the base endoscopy roadmap supplies ordinary endoscopy. None independently owns this X_n transform or the relative contraction/graded-lattice comparison. The new geometry and comparisons are therefore appropriately owned here, with R02 supplying the omitted generic input. No duplicate Lean qualified name can occur in this empty acceptance file. The overlap report's absence of dropped ids or conflicting edits was consistent with these heads.

The requested read-only dependency check returned exactly:

```text
depcheck: 237 roadmaps, 2145 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Within the roadmap, the actual proof chain is Layers 0–2 → Layer 3 reductions → §§4.1–4.5 → §4.6 → §§4.7–4.10, with Layer 5 using §§2.2–2.3. The mention of c_(2,1) from §4.8 in a §4.6 Check is a worked example, not a forward input to the proof. The §4.9 equivalence refers to the statement of §4.10 and does not assume that theorem. The delayed all-ranks augmented hypothesis of §3.6 is supplied by §4.5.

The read-only diff from origin/main contains only this package's README and existing repair report. No file outside the package is changed by the reviewed pull request. README/Suggested contain no pull-request number, process instructions, `set_option`, Lean `lemma`, computational algorithm, sorry-defined data or free-Prop stand-in. The layers are mathematical, not source chapter headings. The last repair report marks its findings applied; none is re-raised here as a previously settled nonactionable finding.

### Source locator audit

All five cited works are present under their existing manifest keys, from the legal cached copies specified for this review. The arXiv pagination is explicitly the cited pagination; Hironaka uses printed pagination. The following table has 32 locator bundles, covering every numbered target's main source and the auxiliary source uses. “Located” is distinct from proving the theorem. Three Hironaka formula blocks remain only partly readable, as recorded below.

| Source locator bundle | Text evidence | Comparison performed |
|---|---|---|
| Leslie25 §1.2, pp.3–4; §2.1 and (2.1), pp.13–14 | Leslie25 line 110, line 518, line 551 | Off-diagonal minus sign, adjoint and two contractions |
| Leslie25 §1.5.4 and Lemma 1.8, pp.11–12 | Leslie25 line 478, line 493 | Centralizer, norm factors and volume-one compact subgroup |
| Leslie25 Proposition 2.1 and Lemma 2.2, p.14 | Leslie25 line 556, line 578 | Invariant quotient and characteristic coefficients |
| Leslie25 Lemmas 2.3–2.4, p.15 | Leslie25 line 590, line 621 | Torsor and invertibility of regular elements |
| Leslie25 (2.3)–(2.4), pp.15–16; Lemma 2.5, p.16 | Leslie25 line 632, line 642, line 657 | Quotient integral, fibre pushforward and orbital comparison |
| Leslie25 §§2.2.2–2.2.3, (2.7), pp.18–19 | Leslie25 line 721, line 785 | κ sum, rational correction and resultant factor |
| Leslie25 §2.3 and Definition 2.10, pp.20–21 | Leslie25 line 803, line 842 | Form labels and relation; R01 exposes missing strong-source-regular qualifier |
| Leslie25 Theorem 2.12, p.21 | Leslie25 line 873 | Reference tensor unit and other-form zeros |
| Leslie25 Lemmas 3.1–3.2, pp.23–24 | Leslie25 line 961, line 999 | Modulus, determinant twists and Satake substitutions |
| Leslie25 (3.7), Proposition 3.4, p.26 | Leslie25 line 1116, line 1140 | Full dominant-integral orbit module and free rank |
| Leslie25 Theorem 3.5, Remarks 3.6–3.7, p.27 | Leslie25 line 1153, line 1155, line 1169 | Cyclic FL, Fourier isomorphism and explicitly conjectural augmented full transfer |
| Leslie25 (3.8), Lemma 3.8, pp.28–29 | Leslie25 line 1197, line 1221 | Fibre count and finite determinant grades |
| Leslie25 Remark 3.9 and Corollary 3.10, p.29 | Leslie25 line 1242, line 1248 | Density interpretation and graded equivalence |
| Leslie25 Lemma 3.11, pp.29–30 | Leslie25 line 1258 | Cyclic embedding as contraction pushforward |
| Leslie25 Proposition 3.12, (3.9)–(3.10), pp.30–31 | Leslie25 line 1297 | Integral determinant shells and homogeneous-polynomial splitting |
| Leslie25 §4.1.1–§4.1.4, (4.1),(4.6), pp.31–34 | Leslie25 line 1360, line 1423, line 1457, line 1513 | Cyclic factors, Hermitian invariants and block variant; treated as declared supplier input |
| Leslie25 Proposition 4.5, Lemma 4.6, Theorem 4.7, pp.35–36 | Leslie25 line 1567, line 1615, line 1626 | Norm torsor and finite inversion; raw normalization requires averaging |
| Leslie25 Proposition 4.8, Definition 4.9, pp.37–39 | Leslie25 line 1660, line 1685, line 1722, line 1751 | All-ranks use, additive descent, upper test and BC/Levi commutation |
| Leslie25 §5.1 and Proposition 5.1, pp.40–41 | Leslie25 line 1838, line 1910 | Trace Fourier kernel and descended action |
| Leslie25 Proposition 5.2, Theorem 5.3, pp.42–43 | Leslie25 line 1920, line 1961, line 2000 | Weil reduction and adjacent-rank endpoint |
| Leslie25 §§7.1–7.2, (7.5)–(7.7), Definition 7.4, pp.49–51 | Leslie25 line 2250, line 2353 | Product contraction and Ω; agreement with the declared contract |
| Leslie25 Theorem 11.1, p.78; §11.2, p.86 | Leslie25 line 3696, line 4021 | Independent product comparison and the n−1 substitution |
| Leslie19 Proposition 1.3, p.4; Conjecture 4.4 and Proposition 4.5, p.15 | Leslie19 line 174, line 693, line 699 | Supported transfer versus unrestricted conjecture; cutoff repair is necessary |
| Leslie19 Lemmas 3.6, 3.9, pp.12–13 | Leslie19 line 558, line 608 | Torsor, stabilizer and cohomology kernels |
| Leslie19 Lemma 4.6, p.16; Appendix A Proposition A.3, pp.25–26 | Leslie19 line 754, line 1379 | Hermitian classes and submersion pushforward; submersion and compact pushforward conclusions; exact analytic pin supplied in R03 |
| Xiao18 §§2.1–2.2, pp.4–6; Proposition 3.8, pp.11–12 | Xiao18 line 130, line 147, line 226, line 486 | Regularity, zero split-factor coordinates and both-form torsor |
| Xiao18 §4.1, pp.15–16; Lemma 4.6 and Theorem 4.7, pp.19–21 | Xiao18 line 710, line 932, line 977 | Rank-one continuation and character inversion; missing averaging checked directly |
| Xiao18 Lemma 5.1, pp.21–22; Theorem 6.1, pp.23–24 | Xiao18 line 1015, line 1128, line 1185 | Descent and ordered determinant; ramified sign counterexample computed |
| BP21 §2 Lemma 1, pp.4–5 | BP21 line 151 | Unit-vector reduction and rank shift |
| BP21 §3 (4)–(5), pp.5–6; Proposition 1, p.7; §4, p.8 | BP21 line 238, line 337, line 379 | Polar Fourier kernel, agreement on intersection, extension to sum and unipotent argument |
| Hironaka99 (2.2)–(2.3), p.566; Theorem 1, p.569 | Hironaka99 line 478, line 508, line 633 | Locations, residue-characteristic scope and spectral normalization; exact OCR exponents partly unreadable |
| Hironaka99 (2.5)–(2.7) and Theorem 2, p.571 | Hironaka99 line 687, line 697, line 705, line 715 | Normalized transform, module isomorphism and orbit-volume normalization; polynomial checks recomputed separately |

Additional source-error witnesses: at n=2, T=I has repeated eigenvalues; extending the regular-locus fibre function by zero assigns it 0 although nearby regular unit Gram matrices have value 1. For the lattice-inclusion claim, in a hyperbolic integral basis take x=diag(π,π⁻¹): xx^τ=I, but x^τΛ is a different self-dual lattice, so it is not contained in Λ. For the claimed GL(Hom)-stability, a vector-space automorphism of M₂ can send the nonzero vector I₂ to the nonzero singular matrix diag(1,0). These errors are not copied into this roadmap's corrected definitions.

## Not verifiable

- No Lean build or elaboration was run, as required. The acceptance file has no declaration for a scratch `#check`; an elaborated-signature table is therefore empty, not an omitted test.
- Hironaka99 is an OCR extraction. The existence, locations and qualitative content of Theorems 1–2 and the transform are visible, but several exponents and coefficients in (2.2), Theorem 1 and (2.5)–(2.7) are garbled. The low-rank polynomial and volume checks above were recomputed; complete glyph-by-glyph certification of those three formula blocks is not claimed. No source error is inferred solely from garbled OCR.
- The seven announced supplier gaps remain conditional proof inputs. This audit checks their scope, names and registration, not future implementations or the full independent spectral proof of the product comparison. No missing-source request is needed: all five cited works are legally available in the given cache.
- The general deep comparison theorems were checked against their source statements, normalization computations and dependency routes, not formally proved. The report identifies the concrete failures found; finite instances cannot certify their full generality. No published correction to the source issues below was verified; they refer to the cited versions only.

## Source issues

- **Misprint** in Leslie25 at Lemma 1.8, printed p.12 (Leslie25 line 478): the source says the centralizer of an endomorphism of V is taken in U(W); it should be taken in U(V); affects nothing.
- **Misprint** in Leslie25 at §2.2.3, printed p.19 (Leslie25 line 785): the source says the endoscopic embedding is η in this occurrence; it should be ξ, retaining η for the quadratic character; affects nothing.
- **Misprint** in Leslie25 at the first reduction, printed p.22 (Leslie25 line 897): the source says the reduction is an unresolved proposition reference; it should be Proposition 3.12; affects nothing.
- **Misprint** in Leslie25 at §4.1.2, printed p.32 (Leslie25 line 1423): the source says the Hermitian invariant uses powers of x; it should be powers of the Hermitian variable y; affects nothing.
- **Misprint** in Leslie25 at §4.1.4, printed p.33 (Leslie25 line 1476): the source says the Hermitian block embedding has upper-left entry x; it should be y for input (y,w); affects nothing.
- **Misprint** in Leslie25 at Remark 4.4, printed p.35 (Leslie25 line 1543): the source says the appendix contributor's surname is Gordan; it should be Gordon; affects nothing.
- **Misprint** in Leslie25 at Proposition 4.8 proof, printed p.38 (Leslie25 line 1722): the source says the upper augmented test is φ tensor the vector unit; it should be (φ∗e_0) tensor the vector unit; affects the proof.
- **Error** in Leslie25 at §5.1, printed p.40 (Leslie25 line 1838): the source says the Hermitian Fourier kernel uses the norm of the pairing; it should be the trace pairing, keeping y fixed, with self-dual measure; affects a stated result.
- **Misprint** in Leslie25 at Lemma 3.1, printed p.23 (Leslie25 line 978): the source says E-valued determinant moduli use the F absolute value; it should be the normalized E absolute value, with abs(π)_E=q⁻²; affects a stated result.
- **Error** in Leslie25 at Proposition 4.8 proof, printed p.39 (Leslie25 line 1751): the source says base-change support has even coweight entries; it should be justified by squared Satake variables, permitting odd entries such as the nonzero T_(1,1) coefficient; affects the proof.
- **Error** in Leslie25 at Theorem 4.7, printed p.36 (Leslie25 line 1629): the source says the raw germ equals the unaveraged character sum; it should be the sum divided by 2^(number of nonsplit factors); affects a stated result.
- **Error** in Xiao18 at the inversion and Theorem 4.7, printed pp.20–21 (Xiao18 line 977): the source says finite character inversion has no averaging factor; it should be divided by 2^(number of nonsplit factors) for the displayed raw distributions; affects a stated result.
- **Gap** in Leslie25 at Proposition 4.8, printed p.38 (Leslie25 line 1717): the source says its two-form-parity signs implement Xiao's four-form construction; it should be accompanied by a convention conversion, since Xiao18 line 1143 weights only the second form; affects the proof.
- **Gap** in Leslie25 at Proposition 5.2 proof, printed p.43 (Leslie25 line 1961): the source says the defect is acted on inside the intersection of orbital images; it should be acted on in their sum, extending the agreeing actions; affects the proof.
- **Error** in Xiao18 at Theorem 6.1 proof, printed p.24 (Xiao18 line 1185): the source says the ordered cyclic ratio is η(D_ab); it should be η((−1)^(ab)D_ab) with its stated concatenated volume form; affects the proof.
- **Gap** in Leslie25 at Proposition 4.8, printed pp.37–38 (Leslie25 line 1660, line 1730): the source says the comparison hypothesis is needed in rank n; it should be assumed also in the two block ranks used in the proof; affects a stated result.
- **Error** in Leslie25 at §2.3, printed p.20 (Leslie25 line 803): the source says there are two Hermitian form classes in every rank; it should be one at rank zero, two at positive rank over a quadratic field, one for split E; affects a stated result.
- **Error** in Leslie25 at Definition 2.10, printed p.21 (Leslie25 line 842): the source says unmatched target orbits have zero stable value without specifying source-regularity; it should be restricted to strongly source-regular target orbits, excluding colliding block spectra; affects a stated result.
- **Error** in Leslie19 at Definition 1.2, printed p.4 (Leslie19 line 168): the source says unmatched targets must have zero stable orbital integral without the source-regular qualifier; it should be restricted to disjoint contracted block spectra; affects a stated result.
- **Error** in Leslie25 at §3.3, printed p.28 (Leslie25 line 1187): the source says extension by zero from the regular contraction image is locally constant on X_n; it should be defined by fibre integration on the whole invertible contraction image; affects a stated result.
- **Error** in Leslie25 at §3.3, printed p.28 (Leslie25 line 1210): the source says integrality of T is equivalent to L⊆Λ_n⊆L∨ for an arbitrary Gram representative; it should be equivalent to L⊆L∨, without that fixed intermediate lattice; affects the proof.
- **Error** in Leslie19 at §3.2, printed p.12 (Leslie19 line 574): the source says invertible Hom maps form a GL(Hom)-stable locus; it should be the relevant unitary-equivariant twisted locus; arbitrary vector-space automorphisms need not preserve invertibility; affects the proof.
- **Gap** in Leslie19 at Proposition 4.5 proof, printed p.15 (Leslie19 line 716): the source says multiplication by the invertible-locus indicator retains compact support inside that locus; it should be replaced by a compact open invariant-base cutoff away from determinant zero; affects the proof.
- **Misprint** in Xiao18 at §2.1 orbital integral, printed p.4 (Xiao18 line 139): the source says the first test argument is Ad(g); it should be Ad(g)x; affects nothing.
- **Misprint** in Xiao18 at §2.2 cyclic basis, printed p.6 (Xiao18 line 229): the source says the first vector in the cyclic basis is x; it should be w; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "2131a2bf47f5f9646f790629beb1aee0d280835b", "job": "RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
