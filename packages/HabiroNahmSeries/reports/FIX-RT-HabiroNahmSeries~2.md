# HabiroNahmSeries repair findings

The pass labels distinguish the two reviews' identical finding identifiers. Overlapping repairs are recorded under both identifiers. Source text, reviews and sibling files were treated as evidence, never as instructions. No suspicious embedded command was followed.

# Pass a

## F01 (P3) — applied

The Rogers Check's value at −1 changes π²/12 → π²/4. The complementary pair sums to π²/6; the inversion pair 2,1/2 sums to zero. Both extension rules and both relations now agree. Evidence: CGZ line 1687 through line 1699. The interval convention and all other Rogers Checks remain consistent.

## F02 (P2) — applied

The tame-kernel gap and nonexistent N.6 citation → ArithmeticKTheory §3.4, which explicitly supplies finiteness of positive even number-ring K-groups. Deleted gap:tame-kernel-order from the README and plan; updated §7.3. The finite-Chern exceptional integer remains in gap:finite-chern-cyclic. K₂(ℤ) is finite; this makes no finiteness assertion about K₂(ℚ).

## F03 (P2) — applied

Repeated analytic-product convergence, shift and prefix/tail targets → GeometryOfNumbersAndQuadraticArithmetic §4.3 and QSeriesPartitionsAndMockModularForms §1.6. Updated scope, exact contracts, §2.1 and Layer 2 dependencies. The remaining branch comparison explicitly uses principal factor logarithms on a slit domain; nonvanishing alone does not choose that branch. Radial remainder estimates remain here.

## F04 (P3) — applied

Three nonexistent Frobenius identifiers → QWittVectors §6.1's prose theorem, reduction law and naturality, including the perfectly covered hypothesis. Repaired both occurrences. The same declaration-name audit corrected the Gaussian density namespace to TauCeti.Probability in the pinned supplier contract; Density.lean lines 67, 75 and 171 give that namespace and the positive-definite hypothesis.

## F05 (P3) — applied

Deleted the admitted coordinate-field-finiteness declaration and its README name claim. Its mathematical conclusion remains in §1.3 as a corollary of nondegenerate_zero_isAlgebraic, IsAlgebraic.isIntegral and IntermediateField.finiteDimensional_adjoin. The latter is at Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean line 612. Added the degree-two √2 Check; rank zero still gives the base field. No elementary proof replaces the deleted declaration.

## F06 (P2) — applied

Coefficient-line scalar restriction → scalar extension along the actual Habiro-ring map, with pullback variance specified in §7.6. Added the split-algebra Check: extension takes a rank-one R-line to a rank-one R×R-line, while restriction gives R⊕R. HabiroRings §6.1 supplies tensor pullback and its composition law. No norm/transfer theorem is asserted.

## F07 (P2) — applied

Rational analytic carrier → real symmetric positive definite A and real B,C in quadraticExponent, NahmDatum and both analytic headline signatures. Rational specialization is explicit in denominator, algebraicity, nontrivial-root phase and arithmetic-descent targets. Added the unrestricted real order-one expansion in §2.5 and irrational-data Checks. Evidence: GZ line 327 through line 328; the Gaussian domination argument uses no rationality.

## F08 (P3) — applied

Added discriminating leading-coefficient Checks in §3.1: 7q_w²+3q_w³ at width three has order 2/3 and coefficient 7; translating the chart gives 7ζ₃²; adding the cancelling germ gives 5q_w³, order one and coefficient 5. These follow directly by substituting q_w↦ζ₃q_w. They remain prose Checks without Lean padding.

## F09 (P2) — applied

Moved level cancellation and its level-admissibility consequence from §5.5 to the end of §5.6, after Gaussian normalization, mixed regularity and refined-piece identification. Moved the full Frobenius congruence from §6.1 to §6.3 after both intrinsic congruences. Coefficient localization stays in §6.1. Updated the affected dependencies without renumbering or reorganizing layers.

## F10 (P2) — applied differently

The comparison coefficient changes (5ζ₆−7)/3 → (5ζ₆−7)/27, as GSWZ line 2740 requires. Added an explicit transport from f₁(h), fixing the polar exponential, logarithmic scalar, determinant root and coefficient conjugation. The Bernoulli expansion reproduces both coefficients in GSWZ (278). All-order integrality remains a separate target; it is not inferred from those coefficients.

# Pass b

## F01 (P2) — not actionable in this package: unavailable supplier head and existing gaps require human resolution

HabiroNumberFields is absent from main a07e202, the available board packages and the supplied open-roadmap index; roadmaps show also reports it absent. The two existing gaps therefore remain. The verifiable scalar-extension portion now consumes HabiroRings §§6.1–6.2, including involution compatibility by coherent pullback. Removing the remaining repeated gaps requires the human settlement stipulated for re-raised findings.

## F02 (P2) — not actionable in this package: unavailable integral supplier and regulator ownership require human resolution

The cited K3BlochGroups head is unavailable in the permitted copies; gap:integral-bloch-comparisons remains. Applied the verifiable part: §1.5 now evaluates Polylogarithms §2.1's descended regulator instead of rebuilding it. Its §2.3 comparison does not supply injectivity; ArithmeticKTheory §3.4 states ranks independently of regulator values. Assigning the remaining comparison to an unseen supplier requires human settlement.

## F03 (P2) — not actionable in this package: unavailable supplier head and existing gap require human resolution

PadicHodgeRegulators is absent from main a07e202, available board packages and the supplied open-roadmap index; roadmaps show confirms this. The claimed Layer 5 cannot be checked there. Existing gap:local-k3-regulator already requests the precise local lattice, comparison and root-generation input. Its requested section labels are retained as a contract, not reported as verified supplier targets.

## F04 (P2) — applied differently

Split the former HabiroRings gap: §§5.9 and 6.1–6.6 directly supply the ring, pullback and conditional completion results; gap:etale-habiro-hodge-degree-zero now requests the cohomological equivalence from HabiroCohomologyFoundations. Updated scope, contracts, plan and §7.6 dependencies. Reversed κ to the supplied direction and inserted κ⁻¹ into η. Evidence: Wagner line 1826 through line 1836.

## F05 (P2) — applied

Same repair as pass a F02: deleted gap:tame-kernel-order and replaced both N.6 references by ArithmeticKTheory §3.4. Its supplied head states finiteness of K₂ of a number ring, including ℤ. The exceptional integer still belongs to the retained HabiroNumberFields contract; the unavailable excludedInteger declaration was not invented as an import.

## F06 (P3) — applied

The title changes nahm → Nahm, preserving the proper name consistently with Habiro and the body of the roadmap. No mathematical target changes.

## F07 (P3) — applied

The unnamed first and second Gaussian-comparison bullets in §5.6 now explicitly define the targets gaussianGlobalNormalisation and gaussianMixedRegularity. Their hypotheses and conclusions are unchanged. The layer dependency text uses those same names. Coefficient localization explicitly consumes the first target, and refined-piece identification consumes both before the relocated level theorem.

## F08 (P3) — applied

The undeclared name inside a code span → the prose target formalNahmSeries_qInv followed by a code span containing only its equation. The mathematical identity is unchanged. Its coefficientwise inversion was recomputed in 2,114 exact instances; no API lemma or Check was added to Suggested.lean.

## F09 (P3) — applied

Both README occurrences and the source manifest change Zagier (28)–(30), pp. 47–48 → pp. 46–48. The coefficient-ring citation changes GSWZ §2.7, pp. 34–36 → pp. 35–37. Evidence: Zagier line 2510, line 2526 and line 2530; GSWZ line 1830 and line 1896 through line 1904. The other page ranges concern different claims.

# Verification outcomes

Elaboration from the content checkout with the mandated lake env lean invocation exited 0: seven declaration-uses-sorry warnings, no errors or other warnings. The final scratch signature probe, containing the final module and #check @name for all sixteen declarations, also exited 0 with the same seven warnings. No TauCeti module import or build was needed. Suggested.lean has one import Mathlib, nine real-bodied definitions/structures, seven admitted headline theorems, no admitted data, no examples and no set_option.

The final dependency check exited 0 with this exact output:

```text
depcheck: 23 roadmaps, 201 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Its earlier run gave the same output.

The declaration/README check found all sixteen retained names. The removed name has no remaining README claim. All seven gap slugs agree between the README's exact contracts and the plan; the plan changes only its top-level gaps list. The source manifest parses, retains ten unique certified works and adds no second key or missing-reference request. git diff --check exited 0. No separate gate failures were supplied in the brief.

The optional citation resolver still cannot resolve HabiroRings, HabiroCohomologyFoundations, HabiroNumberFields, K3BlochGroups and ArithmeticQuantumTopology from its index. HabiroRings was verified directly at the expressly supplied head; the middle three are explicit contracts, and ArithmeticQuantumTopology is only a downstream owner. The resolver also reports no indexed pinned packages on its host; all pinned-library checks here used the worker's actual manifest and source trees. These leads were not treated as mathematical failures or as permission to delete a contract.

## Elaborated signature comparison

Every row was checked mechanically with #check @name and compared with the README. No needed section binder disappeared. NahmDatum's fields, rather than extra section hypotheses, carry real symmetry and positive definiteness into the two analytic theorems.

| Declaration | Elaborated binders and result compared with README | Change |
|---|---|---|
| quadraticExponent | N; real A, B, C; integer coordinate vector; real output | ℚ coefficients/output → ℝ |
| NahmDatum | N; real A, B, C; A.IsSymm and A.PosDef fields | Real analytic carrier |
| NahmEq | N; real A,x; open-cube equations | None |
| existsUnique_nahmEq | N,A; explicit A.PosDef; unique NahmEq solution | Docstring admits real data |
| nondegenerate_zero_isAlgebraic | N; rational square P; complex x; explicit zero and determinant hypotheses; every coordinate algebraic | None |
| nahmSummand | N; D:NahmDatum N; τ:ℂ; natural coordinate vector | Real exponent via D |
| analyticNahmSum | N; D; τ; complex total sum | Real data via D |
| nahmSummand_summable | N,D,τ; explicit 0<τ.im; Summable | Real data via D |
| analyticNahmSum_holomorphic | N,D; DifferentiableOn on the open upper half-plane | Real data via D |
| formalExponent | N; integral A; natural vector; integer output | None |
| formalNahmSeries | N; integral A; multivariate power series over RatFunc ℚ | None |
| formalNahmSeries_qDifference | N,A; explicit A.IsSymm; j; full-column rescaling identity | None |
| generalizedQBinomial | Integer upper index and natural lower index; RatFunc ℚ | None |
| formalNahmSeries_symmetrisation_qBinomial | N,A; explicit A.IsSymm; finite-support multi-index; full coefficient identity | None |
| rationalGaussTaylor | Natural m; rational output | None |
| rationalGaussTaylor_eq_gaussSum | m; explicit 0<m; complex quadratic norm equality | None |

The deleted coordinate-field declaration is exactly the finite-coordinate corollary of the preceding algebraicity target: convert each algebraicity proof with IsAlgebraic.isIntegral and apply IntermediateField.finiteDimensional_adjoin to Set.range x. Both pinned signatures were printed in the same probe. No new declaration was introduced to stand in for a missing headline carrier.

## Source, ownership and supplier audit

Checked legal cached versions under all ten existing source identifiers. Newly changed mathematics uses CGZ line 1687–1699; GZ line 327–328; GSWZ line 867–884 for the factor-log expansion, line 1830–1904 for synthesis/Frobenius and line 2720–2742 for the figure-eight normalization; Wagner line 1826–1836 for the étale degree-zero comparison; and Zagier line 2510–2530 for the corrected pagination. No source passage was copied into the package or this report.

Read the main-branch ComplexTori and LocalGaloisGroups roadmaps for shape. Checked object ownership using roadmaps grep, the board packages, the main checkout, and the expressly supplied sibling checkouts. The relevant positive matches were the analytic Pochhammer supplier, q-series finite-prefix supplier, Polylogarithms' descended regulator and HabiroRings' ring/module pullback. The real analytic datum, Nahm-specific expansions, signed formal identities and normalized Gaussian comparisons remain this roadmap's work; no generic product or embedding-regulator construction is planned twice. None of the Lean declarations reuses another readable roadmap's fully qualified declaration name.

| Supplier citation | Copy and exact interface verified | Consequence |
|---|---|---|
| GeometryOfNumbersAndQuadraticArithmetic §4.3 | Available open head: qPochhammer, shift, zeros in its analytic coefficient bridge | Generic analytic product imported |
| QSeriesPartitionsAndMockModularForms §§1.6, 2.4, 3.1, 3.3, 5.2 | Supplied open head: prefix/tail limits, Euler/binomial evaluation, lower-index adapter, Rogers–Ramanujan and eta multiplier | Extra q-Lucas/Andrews–Gordon/all-cusp contract retained |
| HabiroCyclotomicCompletions §1.1 | Available open head: finite/formal QToolkit objects and laws | No second elementary q-calculus |
| PolylogarithmFunctions Layers 1,3,5,6 | Available open head: principal Li₂, identities, Bloch–Wigner, increasing interval Rogers | Complementary projective extension stays local |
| Polylogarithms §§2.1,2.3 | Supplied open head: rational descended regulator and calibrated comparison | Nahm regulator is evaluation of its map |
| ColemanIntegration Layer L2, §L2.Fb | Available open head: local logarithms/polylogs and antisymmetric projective relation carrier | Integral CGZ comparison remains a gap |
| GeneralAlgebraicKTheory | Available open head: K-theory carriers and comparisons | No replacement K-theory carrier |
| KTheoryFiniteLocalFields §§1.8,7.4 | Available open head: finite Chern maps and local reduction | Does not by itself supply the missing number-field injectivity theorem |
| ArithmeticKTheory §3.4 | Supplied open head: positive even number-ring groups finite; ranks independent of regulator values | Tame-kernel gap deleted; regulator injection not inferred |
| QWittVectors §§1,2.4,6.1–6.2 | Supplied open head: perfect coverage and prose completed étale Frobenius theorem | Invented declaration names deleted |
| HabiroRings §§5.9,6.1–6.6 | Supplied open head, including its explicit cohomology ownership boundary | Direct κ and pullback/completion imports; separate cohomology gap |
| FuchsianOrbifolds Layers 3–5 | Main: cusp coordinates, meromorphic compactification/descent | Scalar cusp estimates stay local |
| ModularForms | Main: general modular geometry | No second modular curve |
| StandardDistributions Layers 1,5 | Main: moments and covariance/affine maps | Algebraic filtered Wick functional remains local |
| ThetaSeries Layer 1 | Main: full-rank lattice Poisson formula and Gaussian input | Polynomial-Gaussian lattice application stays local |

The unreadable HabiroNumberFields, K3BlochGroups, PadicHodgeRegulators and HabiroCohomologyFoundations copies were confirmed absent from the permitted main/board/index copies. Their section labels are requested contract locations, not statements about inspected exports. Pass b's alternative board heads are not among the expressly supplied readable heads. The repeated availability/ownership disputes in F01–F03 must be decided by a human. ArithmeticQuantumTopology is never a prerequisite. No later supplier or merge-order edit was introduced.

Pinned-library checks used Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Matrix.PosDef at Mathlib/LinearAlgebra/Matrix/PosDef.lean line 164 includes Hermitian symmetry and strict positivity, not rationality or nonempty rank. The finite-coordinate corollary uses the finite-set integrality hypotheses of IntermediateField.finiteDimensional_adjoin, not arbitrary infinite algebraic coordinates. Tau Ceti's Gaussian Density.lean line 171 requires positive definite covariance; PolynomialMemLp.lean line 100 requires nonzero envelope variance. Its GaussSum.lean line 172 gives the nondegenerate norm identity and line 284 the quadratic-radical quotient identity. No unavailable Tau Ceti declaration was imported.

# Adversarial mathematics ledger

Rows record actual values, including negative controls; they are finite mathematical tests, not proofs of the roadmap's universal targets. The exact rational calculations used q=2 and q=3/2, rank zero, rank-one A=−3,…,4 and all symmetric rank-two matrices with entries −1,…,2, with each coordinate index 0,…,3. They gave 2,114 product comparisons, 2,114 inversion comparisons, 4,160 full-column difference comparisons and 288 rank-one order-m comparisons, all equal. The last family included m=1,2,3, every permitted k and three supported indices.

For real convergence the proof route remains valid without a denominator: if λ>0 is a lower quadratic bound, ½nᵀAn+B·n≥λ‖n‖²/4−‖B‖²/λ. On a compact upper-half-plane set the Euler denominator is bounded below by the positive infinite product with base ρ<1. This gives a summable Gaussian majorant uniformly there. Rationality enters only when reducing phases or constructing arithmetic fields.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| Empty-index conventions | N=0 | sums 0; products and determinant 1 | Consistent | None |
| Analytic quadratic exponent | A=2,B=0,C=−1/60; n=0,1 | 60Q=−1,59 on both formulas | Equal | Real carrier |
| Analytic input positivity | A=√2; all-ones 2×2 | first quadratic value √2>0; second at (1,−1) is 0 | First accepted, second rejected | Irrational Check |
| Formal input symmetry | A=((0,1),(0,0)); n=(1,1) | exponent numerator 1, half 1/2 | Outside symmetric domain | None |
| Denominator predicate | Q=n²/4; d=2,4 | dQ(1)=1/2,1 | Reject 2, accept 4 | Rational scope explicit |
| Strong period | Q=n²/4; D=2 | Q(n+2)−Q(n)=n+1 | Integral, despite least denominator 4 | Rational scope explicit |
| Zero-rank denominator/period | C=3/2 and 1/2 | denominator 2; every period difference 0 | Constant need not be cleared by a period | None |
| Signed/unsigned convention | A=3 | unsigned polynomial x³+x−1; signed z³−z+1 | Discriminants −31 and −23 differ | None |
| NahmEq | A=1,2; x=0,1 | root 1/2; root (√5−1)/2; endpoints fail strict cube inequalities | Positive roots accepted | None |
| Signed unit equations | A=2,z=2 in 𝔽₅ | 1−2=4=2² | Equal | None |
| Formal odd sign | A=1,t=1 | 1−z=−z would give 1=0 | Rejected over nonzero ring | None |
| Nahm discriminant | A=3 and all-ones rank two | z⁻³(3−2z); (2−z)/z | Determinants give stated formulas | None |
| Nondegenerate solution predicate | A=2,z=2 in 𝔽₅ | δ=0; golden characteristic-zero root has δ=(5+√5)/2 | Separates solution from simple solution | None |
| Deformed degeneracy | A=3,z=3/2,t=4/27 | 1−z=−1/2=−tz³; 3−2z=0 | δ inverted excludes it | None |
| Positive-solution existence/uniqueness | A=1,2,√2; N=0 | x=1/2,0.618033989,0.559792963; empty tuple unique | Positive roots, residual at √2 about −5.6·10⁻¹⁷ | Real scope |
| Saddle Hessian | A=√2 | H=2.685871932>0 | Positive | None |
| Clearing polynomial | d=1,M=2,−1 | 1−Y−Y²; (1−Y)Y−1 | Negative powers cleared too | Rational scope |
| Clearing torus domain | y=0 with a monomial clearing factor | cleared monomial can be 0; inverse y⁻¹ undefined | Excluded from equivalence | None |
| Cleared Jacobian sign | d=1,A=2 | −c(2+x/(1−x))/y=−1−2y at its root | Sign agrees | None |
| Nondegenerate algebraicity | P=X²−2,x=√2 | P(x)=0; J=2√2; J²=8≠0 | Hypotheses present | None |
| Coordinate-field corollary | √2; rank zero | degrees 2 and 1 | Finite-adjoin theorem applies | Removed Lean padding |
| Positive coherent root lift | x=1/4,d=2 | y=1/2; y²=1/4; −1/2 fails positivity | Unique positive choice | None |
| Root-lift compatibility | x=1/16,d=4 then 2 | (1/2)²=1/4 | Compatible | None |
| Coherent fields | A=1/2 | y=1−x, x=y² | Both generated fields ℚ(√5) | None |
| Unsigned Bloch boundary | A=2 | x∧x²=2(x∧x)=0 | Zero in exterior square | None |
| Rational boundary lift | A=1/2 | x=y², 1−x=y; y²∧y=0 | res(c₂)=2β | None |
| Signed boundary | A=3 | z∧(−1), twice it 0 | Unmultiplied integral class not inferred | None |
| Antisymmetric convention | Sixth root z | z⊗z can have order 2, exterior z∧z=0 | Convention distinction retained | Gap retained |
| Integral-model evaluation | Signed cubic | z(1−z²)=1; δ(2z²+3z−9)/23=1 | Exact quotient reductions | None |
| Integral-model localization | Further invert 5 | both maps send z to z, δ⁻¹ to same inverse | Evaluation square commutes | None |
| Embedding regulator | Real embedding, conjugate pair | D(real)=0; D(conjugate z)=−D(z) | Same descended map's values | Import Polylogarithms |
| Regulator torsion test | Unsigned cubic | real value 0; nonreal pair approximately ±0.79158 | Real-only criterion fails | Full-embedding criterion retained |
| Rational restriction | finite degree d | cor∘res=d; over ℚ, d⁻¹d=1 | Injectivity needs comparison, not divisibility alone | Gap retained |
| Rogers interval/complement | golden x | complementary π²/15; increasing π²/10; sum π²/6 | Same convention throughout | None |
| Rogers inversion | 2,1/2 | −π²/12+π²/12=0 | Equal to target relation | Corrected Check |
| Rogers complement | 2,−1 | −π²/12+π²/4=π²/6 | Equal to value of [0] | Corrected Check |
| Rogers projective endpoints | 0,1,∞ | π²/6,0,−π²/6 | Constant zero excluded | None |
| Rogers torsion quotient | 3[0] | 3π²/6=π²/2=0 modulo π²/2 | Not zero as real number | None |
| Nahm Rogers torsion implication | rank zero; class [0] | Λ=0; order 3 gives 3Λ=π²/2 | Rational Λ/π²; converse not inferred | None |
| Imported finite Pochhammer | w=0,1; n=2 | 1; zero factor; (1−w)(1−qw) | Indices agree | Generic targets imported |
| Imported product domain | q=0 | (w;0)∞=1−w | No unjustified q≠0 guard | None |
| Factor-log branch | q=w=1/2 | factors 1−2⁻ʳ⁻¹ positive; exp(sum logs)=product | Agrees on slit domain | Explicit branch |
| Zero-free versus chosen log | q=1/2,w=3 | first factors −2,−1/2; no zero factors | Product nonzero, chosen domain rejects | New negative Check |
| Analytic summand | A=√2,τ=i/(2π); n=0,1 | numerators 1, exp(−1/√2) | Real-data summand | Widened |
| Summability/holomorphy domain | Im τ=1/(2π); Im τ=0 | q=e⁻¹<1; at q=1 denominator at n=1 is 0 | First in domain, second excluded | Widened |
| Analytic constant shift | N=0,C=1/2, τ↦τ+1 | e(C(τ+1))/e(Cτ)=−1 | q alone loses branch | None |
| Block/permutation analytic laws | two rank-zero constants C,D | e(Cτ)e(Dτ)=e((C+D)τ) | Factors and exponents agree | Real data |
| Shifted Euler–Maclaurin | f(s)=s,a=0,M=1 | sum θ; integral+endpoint=1/2+θ−1/2=θ | Correct B₁ sign | None |
| Euler–Maclaurin degeneracy | M=0; constant f | all terms 0; all derivative corrections 0 | No empty-interval defect | None |
| Radial Pochhammer remainder | w=0; m=1 | all Li coefficients 0; empty cyclic product 1 | ψ=0 | None |
| Displacement guard | w near 1, negative ν | w exp(−νε/m) can reach 1 | Crossing a zero invalidates logarithm | Guard retained |
| Bernoulli window scaling | ν=v/√ε, ‖v‖≤ε⁻¹⁄¹² | ε‖ν‖≤ε⁵⁄¹² | Positive small parameter | None |
| Dedekind phase | (a,m)=(1,3),(2,5) | s=1/18,0; χ=e^(πi/18),1 | Different from printed binomial phase e(1/5) in second case | None |
| Euler normalization | m=1 | inverse Euler correction exp(−ε/24)=1−ε/24+… | First coefficient −1/24 | None |
| Saddle B sign | n=s/ε+v/√ε | −εBn/m=−Bs/m−Bv√ε/m | Negative linear term | None |
| Saddle Gaussian covariance | H=1,m=2 | exp(−v²/4), second moment 2 | Covariance m/H | None |
| First analytic coefficient | A=2,B=C=0 | −1/60; deleting Euler term adds 1/24, giving 1/40 | Normalization distinguishes them | None |
| Finite-product modulus endpoints | n=0,∞ | Li₂(1)−π²/6=0; Li₂(0)−π²/6=−π²/6 | Endpoint main terms agree | None |
| Tail window | ‖v‖≥ε⁻¹⁄¹² | Gaussian envelope ≤exp(−cε⁻¹⁄⁶) | Smaller than every fixed ε-power | None |
| Polynomial saddle parity | cubic v³√ε; square | odd degree 3 integrates 0; square degree 6 contributes ε | Integral ε-powers survive | None |
| Formal Gaussian | rank one M=1 | bracket 1=1,v=0,v²=1,v⁴=3,v⁶=15 | Normalized Wick law | None |
| Coupled Gaussian | covariance ((2,1),(1,2)) | bracket v₁v₂=1; bracket v₁²v₂²=4+2=6 | Off-diagonal contractions retained | None |
| Gaussian integral bridge | M=1 | ∫e^(−v²/2)=√(2π); normalized second moment 1 | Positive denominator | None |
| Gaussian filtration | infinite constant-weight even monomials | infinitely many values (2r−1)!! at the same weight | Excluded input | None |
| Lattice covolume | N=1,H=1,h=m√ε | integral √(2πm), leading unscaled sum √(2πm)/(m√ε) | m⁻¹ factor, not m | None |
| Strong-denominator Gauss sum | A=1,D=2,m=3,a=1 | terms 1,−1; average 0 | No division by leading Gauss factor | None |
| Denominator refinement | same, D=4 | terms 1,−1,1,−1; average 0 | Same value | None |
| Retained branch representative | a=2,4 versus a=1 | D=2 phase average 1,1 versus 0 | Same q-root can differ | None |
| Real order-one radial theorem | A=√2 | x=.559792963,H=2.685871932,Λ=.739465740,K=.919663307 | No denominator used | Added generality |
| Real radial numerical check | ε=.1,.05,.025 | exp(−Λ/ε)f=.917970021,.918816160,.919239609 → K=.919663307 | Consistent leading asymptotic; not an all-order proof | New Check |
| Rational radial theorem | A=2,m=1 | leading [H(1−x)]⁻¹⁄²; relative coefficient −1/60 | Rational specialization unchanged | Scope separated |
| Constant-C radial factor | C arbitrary | e(aC/m)(1−Cε/m+…) | Phase and first correction retained | Real C at a=0; rational at other roots |
| Radial generated fields | d=2,m=3,x=1/4 | η³=1/2; E=ℚ(ζ₃), degree 2; η has degree 3 over ℚ | Strict enlargement | None |
| Kummer root covariance | η↦ζη | θ=ηᵈ↦ζᵈθ | Rational powers must move too | None |
| Kummer descent/nonvanishing | Φ=0,ε; Φ=√2(1+3ε−ε²) | first two have Φ₀=0; last normalizes to 1+3ε−ε² | Guard and normalization discriminate | None |
| B-root field factor | A=1,B=1/4,m=1 | leading 2⁻¹⁄⁴, square 2⁻¹⁄²∉ℚ | No omission of B radicals | None |
| Cyclic constant comparison | m=1; augmentation | empty D=1, Kummer quotient trivial | No chosen root inferred for other m | Gap retained |
| Andrews–Gordon matrix | r=0,1,2 | empty; (2); ((2,2),(2,4)) | Ordering correct | None |
| Trigonometric Rogers sum | n=3,5 | 0; π²/15=(5−3)π²/(6·5) | Endpoints agree | None |
| Cusp normalized order | width 3, germ 7q_w²+3q_w³ | k/w=2/3; coefficient 7 | Order and coefficient differ | Added |
| Leading coefficient chart law | same, σT | coefficient 7e(2/3)=7ζ₃² | Root phase present | Added |
| Leading cancellation | add −7q_w²+2q_w³ | 5q_w³; order 1; coefficient 5 | Both data change | Added |
| Width refinement | j at widths 1,r | indices −1,−r; normalized order −1 both times | No width dependence | None |
| Cusp widths/index | projective Γ(3) | four widths 3 sum 12, not SL₂ index 24 | Central sign handled | None |
| Radial Möbius identity | σ=((2,1),(5,3)) | σ⁻¹(2/5+iy)=−3/5+i/(25y) | Scale 25y and phase e(−3v/5) | None |
| Cusp growth sign | normalized order −λ at zero | exp(+2πλ/y); at y=t/(2π), exp(4π²λ/t) | Λ=4π²λ | None |
| Residue majorant split | A=2,B=1,C=11/60,m=2 | shifted B=1/2,3/2; Q(0)=11/60,Q(1)=131/60 | Base e⁻⁴ᵗ | None |
| Majorant rank zero | C=7,t=log 2 | exp(−7log 2)=1/128 | Independent of m | None |
| Even Euler-block bound | m=2,n=1 | modulus 1+e⁻ᵗ≥1, empty block product 1 | Even order retained | None |
| Cusp infinity minimum | A=2,B=−3,C=5 | Q(1)=Q(2)=3 | First term 2q³ | None |
| Modular first cancellation | A=2,C=−1/60 | (1−t/60)(1+t/60)=1+O(t²) | First positive power cancels | None |
| Fixed radical field | E fixed, varying n | n=1 Kummer quotient 1; s stays fixed | No n-dependent E or M_E | None |
| Unbounded good orders | excluded primes divide L | d=1+L²k≡1 modulo each excluded prime | gcd(d,excluded product)=1 | None |
| Modular phase sign | imaginary-axis inverse transform | Λ/ε=Λ/(dh)−2πiλc/d | Phase e(−λc/d) | None |
| Divisibility bridge | 1∈ℤ; torsion in ℤ/r | 1 not in nℤ for n>1; torsion divisible by coprime n | Free coordinate detects obstruction | None |
| Modularity endpoint | rank zero | Λ=0; invariant e(Cτ) forces C=0; class 0 | Boundary consistent | Rational endpoint retained |
| Multivariate log/exp | F=1+t₁t₂ | log F=t₁t₂−t₁²t₂²/2+t₁³t₂³/3+… | Constant 2 excluded | None |
| Plethystic coefficients | Euler Pochhammer | L₁=1, L_n=0 for n>1 | Unique integral Laurent family | None |
| Admissibility negative control | exp(−T/(1−q)²) | L₁=1/(1−q), pole at 1 | Not admissible | None |
| Root Laurent map | 1/(1−q) at ±1 | −x⁻¹; 1/2+x/4+x²/8+… | Pole versus regular expansion | None |
| Plethystic invariants | Euler product | V=Li₂(T),δ=(1−T)⁻¹,U₁=1 | Constants 0,1,1 | None |
| Root unit sign | Euler product,m=2 | U₂=(1+T)⁻¹⁄²=1−T/2+3T²/8+… | Positive (m−1)/(2m) term consistent | None |
| Formal q inversion | all exact test matrices | 2,114 matching coefficient pairs | Equal | Name formatting only |
| Formal exponent | A=−1,n=2 | (−4−2)/2=−3 | Negative exponent allowed | None |
| Formal series coefficients | A=3,q=2 | coefficient t=8; coefficient t²=512/3 | Nonconstant model | None |
| Full q-difference theorem | same, coefficient t | (1−2)8=−8=(-2)³ | Column/scalar signs agree | None |
| Full q-difference generality | 4,160 exact comparisons | every LHS−RHS=0 | Negative/singular/coupled matrices included | None |
| Deformed solution | A=0,1,3 | 1−t; (1−t)⁻¹; 1+t+3t²+12t³+… | Signed convention | None |
| Shift cocycle | A=0 | R₁=1−t; R₋₁=(1−q⁻¹t)⁻¹; R₁σR₋₁=1 | Inverse shifts valid | None |
| Root orbit | A=0,m=2 | (1−t)(1+t)=1−t² | z₀(t²) | None |
| Mixed shift/potential | A=((2,1),(1,1)) | mixed G₁ coefficient −q³; at q=1, −1 | Same mixed potential coefficient | None |
| Residue potential | A=3 | ΘV=t+5t²/2+28t³/3+165t⁴/4+… | log z has same coefficients | None |
| All-root residue | A=0,3;m=2 | residues t²/4; −t²/4−5t⁴/16+… | ζ/m² factor correct | None |
| Critical-value formula | A=0,z=1−t | −Li₂(1−z)=−Li₂(t)=V | Zero constant fixes ambiguity | None |
| Logarithmic Hessian | A=0 | Θ²V=−t/(1−t)=Λ⁻¹ | Ordinary z-Hessian would differ | None |
| Admissibility finite support | A=1,3 | L₁=q; for A=3, q³,q⁷,q¹⁰+q¹¹+q¹³ | Laurent polynomials | None |
| Dwork logarithm | F Euler,p=5,m=1 | t coefficient 5/(1−q)=−5/x | Simple pole permitted | None |
| Congruence-series normalization | m=1,k=0; m=2,k=1 | initial coefficient 1; initial t-index 1 in H | Constant and support fixed | None |
| Order-m system parity | A=1,m=3 | sign (−1)³=−1 | Opposite sign rejected | None |
| Order-m system recurrence | 288 exact comparisons | every LHS−RHS=0 | All allowed rank-one k tested | None |
| Restricted Adams family | F=1+t₁t₂,m=2 | L_(1,1)=−(1−q²); L_(2,2)=(1−q²)/2 | Triangular coefficient law | None |
| Level coefficient ring | A=0,m=2 | degree-two coefficient has denominator Φ₄=1+q² | c=4 excluded from restricted residue | None |
| Level evaluation | (t;q²)∞, smooth index 2 | L₂=1/(2(1+q²)); at q=−1, 1/4 | Value in ℤ[1/2] | None |
| Filtered Gaussian definition | one coordinate | bracket w⁶=15h³C³ | Finite number of contractions per weight | None |
| Gaussian block Fubini | Λ=((0,1),(1,0)) | full determinant −1; first-block determinant 0 | Full integral exists, iterated premise fails | None |
| Corrected local ψ | m=1,2 | w²/h terms cancel; m=2 linear subtraction Li₁(u²)w/(2h) | No denominator m² in linear term | None |
| Gaussian normalization target | A=1,m=3; N=0 | recurrence sign −1; empty integral 1 | Targets now unambiguously named | Named |
| Gaussian mixed regularity target | A=0, two variables | product of two reciprocal Pochhammers, no negative t-indices | Mixed poles cannot be ignored | Named |
| Refined identification | initial t^k coefficient | both normalizations 1; recurrence differences all 0 | Uniqueness applies over Laurent field | Ordered before cancellation |
| Level cancellation target | A=0,m=2,c=2 versus 4 | t² residue 1/4 at c=2; Φ₄ pole retained | Larger localization necessary | Moved after comparisons |
| Coefficient scheme | N=0 | ℤ[T]/(T²−1); after 2, two factors | Étale only after 2 | None |
| Kummer coefficient extension | p∤m, w^m=z unit | derivative mw^(m−1) a unit; p=m=5 makes derivative 0 | Good-index premise necessary | None |
| Unsigned WKB normalization | A=3 | z₀=1−t+3t²−12t³; signed z=1+t+3t²+12t³ | Explicit t change needed | None |
| WKB first coefficient | A=0,1,3 | A(A−1)X²/2=0,0,3X² | Normalization distinguishes A | None |
| Completed Frobenius | ℤ_p×ℤ_p | φ(a,b)=(a,b) at constant base; preserves both factors | No chosen-branch shortcut | Prose supplier theorem |
| p-saturated identity | ℤ_p→ℤ_p | pⁿ maps to pⁿ, transferred valuation n | All powers transfer | None |
| Nonfaithful branch | u²=1,u↦1 | u−1↦0; at u=−1 gives −2 | Reduction injectivity fails at odd p | None |
| Actual A=5 branch | modulo 5 | δ=z⁻⁵(5−4z)=z⁻⁴; T=±z² | T−z² gives 0 and −2z² | Both components retained |
| Gaussian coefficient localization | rank zero | only constant 1; rational denominators absent | Independent of full congruence | Ordered first |
| First-jet polynomial | rank one four inputs | 5/24,29/24,1/8,1/2 | Sixth/mixed Wick contractions retained | None |
| First-jet empty case | no coordinates | Jet=c | No dropped scalar constant | None |
| First-jet integrality guard | p=m=5 | Φ₅ modulo 5=(X−1)⁴ | Non-étale case excluded | None |
| Jet coordinate denominators | p∤Δm | product over Kummer roots 1−z a unit | Each factor is a unit in full finite algebra | None |
| Potential Frobenius expression | all η=0 | W_p=p∑ℓ₂(1−z) | Positive linear-term convention retained | None |
| Regulator specialization | ξ=0 | D_pξ=0; φ(D_pξ)/p−pD_pξ=0 | No complex π² constant | None |
| Refined constant-unit congruence | unit a=1 | log(φ(1)/1^p)=0∈pS | Independent input | Ordered before full congruence |
| Full Frobenius congruence | N=0,F=1 | log 1−p log 1=0 | On both square-root factors | Moved to §6.3 |
| Kummer orientation | m=1; changed representative εu^m | torsor trivial; chosen root multiplied by u | Torsor unchanged, orientation still required | None |
| Finite-presentation specialization | signed cubic at t=1 | relation becomes z³−z+1=0 | Localized coordinates must stay units | None |
| Formal-series non-evaluation | ∑tⁿ at t=1 | infinitely many constant terms 1 | Not the specialization map | None |
| Scalar extension of lines | R→R×R | R⊗_R(R×R)=R×R, ranks (1,1) | Invertible over target | Imported pullback |
| Scalar restriction negative control | same trivial target line | underlying R-module R⊕R has rank 2 | Not a Picard map | Fixed variance |
| Involution compatibility | R×R swap twice | (a,b)↦(b,a)↦(a,b) | Pullback composition identity | No extra gap needed |
| Habiro membership nonvanishing guard | sum g+(−g) | constant and sum 0 | Element can be zero; generator cannot | None |
| Auxiliary products Ψ,P | γ=2,q=2,F⁺=t,μ=(1,1) | Ψ=16t⁴,P=16t²; reversed composition 256t⁴ | Two products differ | None |
| Signed auxiliary shift | γ=1,q=2,F⁻=t,ν=1 | t/2 | Negative shift retained | None |
| Auxiliary uniqueness guard | coefficient ring K×K,q=(2,1) | q−1=(1,0) kills (0,1) | Nonzero is weaker than regular | None |
| Powered principal part | A=0,γ=2 | −Li₂(t²)+Li₂(t)≠0; t coefficient 1 | Does not prove unpowered gluing | None |
| Product gluing localization | A=0,γ=5 | t coefficient 3−2x+x²+x³/5+… | Need 1/5 | None |
| Descendant curve | m=2,q=−1+x,ν=1 | t=q²=1−2x+x² | Starts at 1; q starts at −1 | None |
| Negative descendant | m=1,ν=−1 | t=1−x+x²−… | Valid formal unit curve | None |
| Torsion power/converse | ξ=0; zero collection | fⁿ has index 0; zero gives no nonzero Kummer constant | Converse requires nonvanishing | None |
| Rational summation kernel | A=0,N=m=1 | J=(1−w)/(1−w−t) | Required rational denominator visible | None |
| Kernel expansion localization | t=u,w=1−2u | first x coefficient 2/u−4 | Pole needs (1−w)⁻¹ | None |
| Ordered residue normalization | A=0,m=1 | raw −1/(1−t), corrected +1/(1−t) | Augmentation +1 | None |
| Finite root residue | A=0,m=2,T²=t | T(2+2/T)/(2(1−T²))=1/(1−T) | No augmentation pole | None |
| Generalized q-binomial | r=−1,k≥0 | [−1 choose k]=(-1)^kq^(−k(k+1)/2) | Not zero at negative upper index | None |
| Product theorem negative index | A=−1,k=2,q=2 | [−4 choose 2]=155/512; product coefficient 155/8 | LHS=RHS | None |
| Product theorem coupled case | A=((2,1),(1,1)),k=(1,1),q=2 | both coefficients −45/4 | Off-diagonal data retained | None |
| Product theorem rank zero | empty matrix | coefficient 1=empty product | Correct unit | None |
| Coupled residue q-scalar | A=((0,1),(1,0)),q=−1 | normalized (1+T)/(1−T); omitted scalar negates it | c_A=1 matters | None |
| Cubic inverse and discriminant | z³−z+1 | z(1−z²)=1,δδ⁻¹=1; polynomial discriminant −23 | Exact quotient arithmetic | None |
| Cubic symmetrization | k=1,q=1,−1 | q⁻²+q⁻¹+1+q+q² gives 5,1 | q-Lucas boundary consistent | None |
| Cubic m=2 numerator | coefficient T² | corrected value 4; missing z⁻¹ gives 5 | Wrong numerator rejected | None |
| Cubic product exponents | s₁,s₂,s₃=1,1,3 | product starts 1+t+3t²+12t³ | Sign −ns_n | None |
| Cubic small-prime descent | first coefficients over ℤ[z,1/23] | denominators use 23 only; no value for an arbitrary higher jet | Finite check supplies no all-order p=2,3 theorem | Obligations retained |
| Quartic coordinates | quotient by u⁴+u³+3u²−3u−1 | u⁸v⁵=1−u, u⁵v⁴=1−v | Exact reductions | None |
| Quartic discriminant inverse | displayed δ,δ⁻¹ | product reduces to 1 | det A=7 is different | None |
| Quartic integral element | e=(u³−u²+2)/5 | e²−3e+1 reduces to 0 | Written denominator does not prevent integrality | None |
| Quartic basis ledger | displayed trace Gram matrix | determinant −475; polynomial discriminant −11875=25(−475) | Index 5 consistent; maximality remains its stated proof obligation | None |
| Quartic coordinate norms | u,v,1−u,1−v | −1,1,1,−1 | Units | None |
| Quartic discriminant norm | δ | 9025=25·361 | Need primes 5,19 | None |
| Quartic arithmetic localization | Δ multiple 6·475·k_K | visible primes 2,3,5,19 plus prime divisors k_K | No assertion k_K=1 | Supplier finiteness imported |
| Quartic analytic/formal shift | diagonal (8,4) | formal linear term (4,2), cancelled by t=(q⁻⁴,q⁻²) | Zero analytic B recovered | None |
| Quartic variable conversion | ε=log(1+x) | ε=x−x²/2+x³/3; ε²=x²−x³ | a₂=c₂−c₁/2,a₃=c₃−c₂+c₁/3 | None |
| Quartic order/rank endpoints | 60ξ, eight proposed generators | relation/rank require exact certificates, not regulator 0 or eight listed vectors | No unconditional numerical inference added | Targets retained |
| Figure-eight signed solution | z=(1+i√3)/2 | z²−z+1=0; δ=(2−z)/z=−i√3 | Norm δ=3 | None |
| Figure-eight symmetrized jet | a₁=11/(72i√3), a₂=−697/31104 | 2a₂−a₁²=−1/27 | Exact | None |
| Figure-eight completed transport | polar factors and constant logs | −3Li₂(z²)/h+3Li₂(z²)/h=0; total constant log 0 | Normalized constant 1 | Defined explicitly |
| Figure-eight first comparison coefficient | same normalization | −1/6+5i√3/54=(5ζ₆−7)/27 | Matches GSWZ (278) | Factor 9 repaired |
| Figure-eight second comparison coefficient | same normalization | 16/243−5i√3/81=(−30ζ₆+31)/243 | Matches GSWZ (278) | Recomputed normalization |
| Figure-eight wrong-field control | omit conjugation of φ | −1/6−i√3/108 | Different first jet | Added Check |
| Cubic-pair scalar identity | α³−α²+1=0 | −24α²+32α−26=−2(2α²−2α+3)² | Reduces modulo cubic | None |
| Monogenic Frobenius | cubic mod 2 | X³+X+1, derivative X²+1, no common root | Unique simple-root lift | None |
| Bad power-basis index | quartic at p=5 | polynomial discriminant has factor 5² beyond field discriminant | Polynomial reduction alone insufficient | None |
| Rational Gauss scalar | m=0,1,2,3,4 | 2,1,0,1,2 | Root theorem excludes 0 | None |
| Gauss norm headline | m=1,…,12 | 1,0,1,2 repeated three times | Squared-sum/m agrees within 10⁻¹⁰; exact m=4 gives 2 | None |
| Odd order scaling | m=0,2,4, multiplier 3 | 2,0,2 on each side | m=0 harmless for scalar law | None |
| Prime-two Gauss gluing | edge 1→2 | constants 1 and 0 | Fails over ℤ, allowed after 2 inverted | None |
| Gauss square companion | m=1,3,4 | i,−i,−2 | At m=4, (i/4)(2+2i)²=−2 | Printed +2 not used |
| Rogers–Ramanujan raw residue | negative golden root | F₁=−1/2−√5/10; −5F₁²−5F₁=1 | Raw/normalized sign distinct | None |
| Degree-zero transport direction | κ:H_rel→H_R, d:qHdg→H_rel | η(a)=d⁻¹κ⁻¹(a); then κdη(a)=a | Types and inverse directions agree | κ direction fixed |
| Degree-zero unit/product | a=1; rational Gauss orders 1,2,4 | η(1)=1; constants retained as 1,0,2 | All components kept | Supplier gap explicit |
| Global line tensor law | ξ=0 | L₀⊗Lη≃Lη; Picard identity 0+[Lη] | Unit compatibility | Imported |
| Completed line triviality | R=ℤ×ℤ; bases 1,1+X | both reduce to 1, differ by unit 1+X | Trivial class, noncanonical basis | Exact supplier consumed |
| Higher-cohomology degree | N=0 versus affine top dimension N | degree 0 for étale point; degree N for top form | No forced degree-zero higher export | Gap retained |
| Analytic-radius distinction | ∑(x/p)ⁿ | radius ‖p‖_p<1; at x with ‖p‖_p<‖x‖_p<1 terms grow | Positive radius is not whole unit disc | None |

The all-order analytic remainders, Gaussian mixed regularity, full-algebra divisibility transfer, Kummer orientation, product gluing, exact quartic Bloch order, descendant dimension and small-prime descent remain proof targets with the explicit hypotheses and inputs in the README. The ledger does not claim finite samples prove them. No source assertion of a large finite computation was promoted to an all-order theorem.

# Maintainer notes

The only deleted Lean name is TauCetiRoadmap.HabiroNahmSeries.nondegenerate_coordinateField_finite. Consumers should use the algebraicity target and the pinned finite-adjoin theorem. quadraticExponent and NahmDatum now have real coefficients; callers with rational data use their real casts. The two analytic theorem names are unchanged.

The seven retained gaps include the new cohomological owner gap and exclude the obsolete tame-kernel gap. The HabiroRings relative-ring comparison is consumed in its supplied direction. Scalar extension, not ordinary scalar restriction, transports coefficient lines; no norm theorem was added. The determinant involution is covered by coherent pullback on the full algebra.

Pass b F01–F03 repeat supplier-availability/ownership disputes from the preceding repair; the stipulated human decision is still needed. No absent supplier export is asserted as verified. The stronger real analytic results, the changed normalization Checks and every other edited statement remain subject to the fresh independent review required by the brief. No commit, push, pull-request write, tooling change or merge-order change was made.
