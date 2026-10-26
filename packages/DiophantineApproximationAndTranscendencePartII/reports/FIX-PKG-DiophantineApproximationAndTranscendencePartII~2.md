# Repair report

The review file contains Claude's ten findings and Codex's three findings. Their common F01 is settled once below, explicitly for both reviews. Codex F02 overlaps Claude F06; both identifiers have sections recording the same repair. The other repeated identifiers denote different findings and retain their original severities.

## F01 (P1) — not actionable in this package: maintainer scope decision required

Both reviews identify the same unowned G1. The frozen design requires a valid general replacement or a maintainer decision releasing it. Removing G1 would make that scope decision without authorization. The exact identifier and unresolved ownership are now exposed under Exact supplier contracts. G1, the centred theorem and the translated-disc counterexample remain; no supplier or false general theorem was invented.

## F02 (P2) — applied

Claude: deleted multiplierLogBound and multiplier_rank_bound, their docstrings and the empty Layer 1 Lean comment. README §§1.4–1.5 retain the complete mathematics with prose names. CDT25 line 886 proves J≤A, so mean_rank_bound implies each multiplier bound. With quotient representation the families of bounds are equivalent, rather than strictly weaker; their supporting role still justifies removing these acceptance declarations.

## F03 (P2) — applied

Claude: deleted circleDiscrepancy, fekete_circle, vandermonde_discrepancy_gap and the empty Layer 3 Lean comment. README §§3.1,3.6,3.8 retain their definitions, APIs, hypotheses and Checks without claiming Lean declarations. CDT25 line 1018 identifies the damping construction as another proof of the integrated theorem. No retained Lean declaration uses these deleted names.

## F04 (P2) — applied

Claude: removed eisenstein_denominators from the acceptance test and its name from README §0.4. The full algebraic-series denominator theorem, finite coefficient-field argument and Puiseux case remain README targets. BB11 line 26 and BB11 line 543 support them. For n≥1 the second conclusion follows by multiplication by c^(n−1); n=0 uses integral a₀.

## F05 (P2) — applied

Claude: removed andre_algebraicity and its README declaration claim. The open-disc theorem, shrinking argument and strict-threshold Checks remain in §2.3. Setting p=x and χ=t and choosing 1/λ<r<1 gives the closed-disc arithmetic_algebraicity hypotheses. With λ=2 and r=3/4 the new derivative modulus is 3/2 and the square-root realization becomes exp(3z).

## F06 (P2) — applied

Claude: deleted descent from the Part I §5.1 supplier contract. README §4.1 now explicitly owns order-preserving descent for rational-coefficient series, with a finite number-field basis proof and concrete Checks. Part I §5.1 supplies scalar enlargement, not descent. The local claim concerns annihilators only; it does not claim preservation of a particular meromorphic solution basis.

## F07 (P3) — applied

Claude: added PowerSeries.substInv and both composition identities to From Mathlib and the Needs of §§0.5,4.8. The pinned substitution file has these at lines 456,510,542, with zero constant and invertible linear coefficient for the identities. Updated both inverse-coordinate Checks: coefficients −1/32,1/256 become −2,16 at tangent scale 4; both compositions have vanishing degree-4 and degree-7 coefficients.

## F08 (P3) — applied

Claude: replaced the alleged missing general-capacity interface in the module docstring by the actual missing arithmetic holonomic span W and its differential-equation carrier. The centred circle numerator is a native radius-r circle average, and its capacity is r. The missing-carrier explanation now agrees with README §5.1 and ClassicalArithmeticCompletion §6.40.

## F09 (P3) — applied

Claude: removed duplicate sentences in §§1.1,2.3,3.4,3.8,3.9,4.3,5.1,5.2 and the repeated modular benchmark Check. The same pattern also occurred in §§1.4,2.5,3.6,3.10,4.2,4.6,4.8; those repetitions were consolidated too. Every hypothesis, formula, proof route and computed Check remains, except the duplicate noncomputational benchmark bullet.

## F10 (P3) — not actionable in this package: frozen plan nodes are outside the permitted edits

Claude: confirmed eight stale prerequisite strings on three nodes and another stale supplier-contract string. Their named roadmap is absent as a folder from main, board packages and the open index. Only the plan's top-level supplier gaps may be edited. The README already uses ClassicalArithmeticCompletion §§6.18,6.40 and gap:complex-logarithmic-equilibrium. Repointing frozen plan nodes requires the maintainer; plan.json is unchanged.

## F02 (P3) — applied

Codex: the same descent repair is recorded under Claude F06. Removed the unsupported imported promise and explicitly located the existing descent target and proof in §4.1. For exp(x), the equation a₀+a₁=0 has matrix rank 1 and rational kernel spanned by (−1,1), unchanged by extension to ℚ̄. No new supplier gap is needed.

## F03 (P3) — applied

Codex: corrected the pinned PowerSeries.subst locator from line 155 to line 157; substAlgHom remains at line 170. Read the declarations themselves. The inner series is the first argument: substitution of χ=t into f=x² has coefficient 1 at degree 2. The direction convention and all uses of substitution are unchanged.

## Verification and consequences

- Required packages/DiophantineApproximationAndTranscendencePartII/Suggested.lean elaboration from the pinned content checkout: exit 0. Exactly two warnings, both `declaration uses sorry`, at packages/DiophantineApproximationAndTranscendencePartII/Suggested.lean lines 50:8 and 70:8. There are no TauCeti imports, so no object-file build was needed. No Lean process remains running.
- Elaborated one scratch copy containing `#check @name` for all six remaining declarations: exit 0, six signatures printed, the same two expected warnings. Compared every type with README §§0.1–0.2,2.1–2.2. IntegralSeries, Uniformizes, positiveLogMean and rationalFunctionField retain their native carriers. Both theorems retain nonconstant p, the Laurent equality fixing pSeries, χ₀=0, χ₁=1, integrality, neighbourhood holomorphy, φ(0)=0, strict expansion and the germ relations. mean_rank_bound also retains actual ℚ(p)-independence. No binder was lost and no retained theorem signature changed.
- Acceptance file audit: 85 lines, one `import Mathlib`, four real-bodied definitions, two headline theorems with sorry, one module docstring, correct namespace and layer order. No set_option, sorry-valued data, admitted example, API-only theorem or declaration claim for a deleted name remains. All six retained Lean names occur in the README.
- Required dependency gate: exit 0, with exact output below. No UPWARD, CYCLE or moved line.

```text
depcheck: 51 roadmaps, 584 edges, 0 problem(s)
```

- Citation resolution: exit 0; no unresolved cross-roadmap citations and no unresolved Lean names. The resolver explicitly did not inspect pinned library names, so those were checked directly against the library files, as recorded below.
- `git diff --check`: exit 0, no output. No additional gate failures were supplied in the brief.
- Edits are confined to packages/DiophantineApproximationAndTranscendencePartII/README.md, its packages/DiophantineApproximationAndTranscendencePartII/Suggested.lean and this report. packages/DiophantineApproximationAndTranscendencePartII/metadata.toml, packages/DiophantineApproximationAndTranscendencePartII/sources.toml and packages/DiophantineApproximationAndTranscendencePartII/design/plan.json are unchanged. No commit, push or external write was made.
- G1 still requires the human scope decision described above. The existing complex-logarithmic-equilibrium supplier gap remains a separate prerequisite for the energy arguments; its slug, supplier, section and needs already agree between README and plan. Neither it nor the dependency gate resolves G1. No new arbitrary-compact theorem has been asserted.
- Deleted acceptance names: eisenstein_denominators, multiplierLogBound, multiplier_rank_bound, andre_algebraicity, circleDiscrepancy, fekete_circle, vandermonde_discrepancy_gap. Their mathematical targets remain in the same README sections. No retained local declaration consumes them. Board design material for ModularFormsPartII consumes the corrected W theorem by section, which is unchanged; its modular application is downstream, not duplicated here.

## Source, ownership and supplier evidence

Read the main-branch DiophantineApproximationAndTranscendence and ClassicalArithmeticCompletion roadmaps as shape examples. Main was the content checkout, not either roadmap's open revision. The supplied three legal source extractions were sufficient; no additional source was cited, fetched or requested. The manifest already contains exactly one certified entry for each work. Numbering uses the published CDT25 offprint, BB11 arXiv v2 and Saff10 arXiv v1. No source text has been copied into package files.

| Claim family | Source passage verified |
|---|---|
| Radius threshold and André examples | CDT25 line 145, Lemma 1.1.2, p.629; CDT25 line 169, §1.1.1, pp.630–631; CDT25 line 242, (1.1.4)–(1.1.5), p.631 |
| Main rank/algebraicity and holonomic objects | CDT25 line 440, Theorem 2.0.1, p.635; CDT25 line 467 and CDT25 line 479, Definition 2.0.4 and local-basis convention, pp.635–636 |
| Corrected scalar spans and pole clearing | CDT25 line 489, Corollary 2.0.5; CDT25 line 502, its proof, p.636; explicit counterexample recomputed below |
| Auxiliary construction and inverse denominators | CDT25 line 546, Lemma 2.1.2; CDT25 line 574, CDT25 line 576 and CDT25 line 597, pp.637–638 |
| Multiplier and algebraicity routes | CDT25 line 519, Lemma 2.0.8; CDT25 line 614 and CDT25 line 632, (2.2.1)–(2.2.3); CDT25 line 706, powers argument |
| Quotient and logarithmic comparison | CDT25 line 711, Lemma 2.3.1; CDT25 line 886, Remark 2.3.3, pp.639–641 |
| Lexicographic averaging | CDT25 line 936, Lemma 2.4.2; CDT25 line 973 and CDT25 line 1001, §2.4.6, pp.642–643 |
| Discrepancy, Fekete and damping | CDT25 line 1018, alternative proof; CDT25 line 1063, Lemma 2.5.3; CDT25 line 1082, Definition 2.5.4; CDT25 line 1096, variation; CDT25 line 1110, Fourier comparison; CDT25 line 1134, Lemma 2.5.9; CDT25 line 1235 and CDT25 line 1327, damping/extrapolation |
| Compact sampling formula being refuted | CDT25 line 1364, §2.5.27 and (2.5.28), p.649 |
| Eisenstein and finite coefficient field | BB11 line 26, §1, p.1; BB11 line 543, Theorem 6.1, pp.10–11; BB11 line 764, §8, p.14 |
| General energy/equilibrium contract | Saff10 line 272 and Saff10 line 297, potential and lower semicontinuity; Saff10 line 310, existence; Saff10 line 315, positive-capacity uniqueness distinction; Saff10 line 326, Theorem 1.9; Saff10 line 387, Example 1.10 |

Cross-roadmap citations were resolved again, reading Part I §5.1 on main, ConformalMappingPartII §§0.1–0.6,1.3–1.4,3.5–3.8 at its supplied open head, ProbabilisticAndMetricNumberTheory §2.7 at its supplied open head, GeometryOfNumbersAndQuadraticArithmetic §§0.1.1–0.1.2 at its open head, and ClassicalArithmeticCompletion §§6.18–6.19,6.40 on main. Part I's cited scope sections §§0.2–0.3,2.8,5.2–5.3 exist at those numbers. The exact contracts agree after deleting the unsupported descent attribution.

Ownership searches used the roadmap service, main/Completed and board packages, by arithmetic algebraization, holonomy rank, coefficient descent, algebraic-series denominators, meromorphic bases, Fekete extrema, circular discrepancy and logarithmic energy. Generic formal inversion is native; continuation, meromorphic bases and quotient representation belong to ConformalMappingPartII; interval inequalities belong to ProbabilisticAndMetricNumberTheory; Hadamard belongs to GeometryOfNumbersAndQuadraticArithmetic; finite capacity normalization belongs to ClassicalArithmeticCompletion. The rational-series annihilator descent is the existing local compatibility claim made explicit, not a new general differential-equation construction. No competing owner for that claim or the arithmetic rank theorem was found. Ownership against unprovided open pull-request contents was not checked; index matches alone were not treated as supplier statements. No declaration was given another roadmap's fully qualified name.

The pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, verified from the content manifest. Directly opened the following pinned declaration locations and surrounding hypotheses:

| Library object | File and line; relevant restriction |
|---|---|
| Coefficients and rescale | Mathlib/RingTheory/PowerSeries/Basic.lean:76,583; coefficient n scales by a^n |
| Substitution | Mathlib/RingTheory/PowerSeries/Substitution.lean:39,157,170; HasSubst is nilpotence of the constant coefficient, without convergence |
| Compositional inverse | Mathlib/RingTheory/PowerSeries/Substitution.lean:438,456,510,542; commutative ring, invertible linear term, zero constant for the identities |
| Laurent embedding and rational-function algebra | Mathlib/RingTheory/LaurentSeries.lean:391; Mathlib/FieldTheory/RatFunc/Basic.lean:756 |
| Generated field and extension degree | Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean:34; Mathlib/FieldTheory/RatFunc/IntermediateField.lean:162; adjoin is field closure, not a finite-dimensionality assertion |
| Clearing one algebraic scalar | Mathlib/RingTheory/Algebraic/Integral.lean:146; not uniform denominators of a series |
| Integral Siegel bound | Mathlib/NumberTheory/SiegelsLemma.lean:155; positive rows, strictly more columns |
| Finite domain algebra is a field | Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean:521; field base, commutative domain, finite dimension |
| Stirling | Mathlib/Analysis/SpecialFunctions/Stirling.lean:246; factorial asymptotic, from which the stated limit follows |
| Cauchy coefficient estimate | Mathlib/Analysis/Complex/Liouville.lean:42; positive radius, DiffContOnCl and complete target |
| Jensen | Mathlib/Analysis/Complex/JensenFormula.lean:375; nonzero radius and nonzero centre value, hence remove the zero order |
| Circle mean | Mathlib/MeasureTheory/Integral/CircleAverage.lean:55; normalized by (2π)⁻¹, definition alone asserts no integrability |
| Vandermonde and Gram–Schmidt | Mathlib/LinearAlgebra/Vandermonde.lean:219; Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean:374; determinant uses z_j−z_i |
| Native variation | Mathlib/Topology/EMetricSpace/BoundedVariation.lean:60,1256; monotone partition sums, no built-in continuity; composition needs finite variation |
| Weak compactness and convergence | Mathlib/MeasureTheory/Measure/Prokhorov.lean:65,183; Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean:365; Hausdorff Borel carrier and bounded continuous tests |
| Product and continuity sets | Mathlib/MeasureTheory/Measure/FiniteMeasureProd.lean:144; Mathlib/MeasureTheory/Measure/Portmanteau.lean:353; second-countable pseudometrizable/measurable-open conditions and null frontier, respectively |
| Empirical probability | TauCeti/Probability/Process/EmpiricalMeasure.lean:48,54,100; nonempty finite indices, multiplicities, strongly measurable integrand and complete real normed target |
| Polydisc Cauchy | TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean:116; complete target, differentiability on closed polydisc, interior evaluation; factor (2πi)^d |

## Computed adversarial pass

The table records my own evaluations and proof checks. API indices follow the bullet order within the named subsection. All statements use characteristic-zero coefficient fields; no claim is made for DVRs, characteristic-p fields, schemes or nonabelian groups. Native total functions were tested at zero where relevant. Approximate circle quadrature is labelled numerical and is used only as a consistency check, not as a proof. Deleted acceptance statements are still tested as README targets. Every changed mathematical claim, including the strengthened inverse expansion and the precise descent statement, is included.

| Statement | Instances tried | Values computed on both sides | Result | Change |
|---|---|---|---|---|
| Coefficient/factorial convention | F=x², n=0,1,2 | coefficients 0,0,1; derivatives 0,0,2; 2/2!=1 | agrees | none |
| Arithmetic versus analytic coordinates | χ=t/2, φ=2z, f=x² | f∘χ=t²/4; F∘φ=4z²; χ₁=1/2 fails tangent premise | distinguished | none |
| Substitution argument order | f=x², χ=t and χ=t/2 | quadratic coefficients 1 and 1/4; reversing the latter gives 1/2 instead of 1/4 | agrees | locator 157 |
| Haar and positive logarithm convention | g=2,1/2,0 | J=log2,0,0; arclength at 2 gives 2πlog2 | cutoff/mass fixed | none |
| Vandermonde sign convention | d=1 and z=(1,−1) | 1=1; product 2 versus determinant −2; norms 2=2 | correct parity | none |
| Characteristic-zero/Puiseux convention | u=x^(1/2), y=1+u/2 | u-scale 2 gives 1+u; coefficient 1 integral; N=0 excluded | no zero root denominator | none |
| Limit order and dimension factor | d=1,2,10,100; κ=1/2 | d/(d!)^(1/d)=1,1.414214,2.208125,2.632085; 3^(1/d)→1 | consistent with e limit | none |
| Library formal inverse contract | P=X+X² over ℤ; P=2X over ℤ or ℚ | inverse X−X²+2X³−5X⁴; 2b₁=1 has no integral solution but b₁=1/2 over ℚ | unit premise necessary | native contract cited |
| Inverse over the zero ring | P=0 in the ring with 0=1 | X=0, inverse=0, both compositions 0=X; linear coefficient 0=1 is a unit | generic ring contract survives | none |
| Native substitution nilpotence | field constant 1; dual-number constant ε with ε²=0 | 1^n=1≠0 over ℚ; ε²=0 in ℚ[ε]/(ε²) | HasSubst distinguishes nilpotence from a convergence claim | none |
| §0.1 integral lattice definition | f=Σ(x/2)^n, M=1,2; f=0 | first coefficient 1/2 versus 1; zero coefficients all 0 | membership separated | none |
| §0.1 tangent lattice definition | χ=t+t²/4, M=2,4 | ordinary quadratic coefficient at 2 is 1; tangent coefficients 1/2,1 | distinct lattices | none |
| §0.1 IntegralSeries | 0,1,1+x/2 | coefficients 0; (1,0,…); offending 1/2 | true,true,false | none |
| §0.1 API 1, coefficient criterion | f=1+x/2, M=2 | M⁰a₀=1, Ma₁=1, higher coefficients 0 | both descriptions agree | none |
| §0.1 API 2, native rescale | f=1+x/2, M=2 | f(2x)=1+x, integer coefficients (1,1) | image and predicate agree | none |
| §0.1 API 3, subring | f=x/2, h=1+x/2, M=2 | (f+h)(2x)=1+2x; fh(2x)=x+x²; scale-one 1+x integral | sum/product closed | none |
| §0.1 API 4, divisible scales | M=2,N=4, a_n=2^(−n) | M^na_n=1; N^na_n=2^n | inclusion direction correct | none |
| §0.1 API 5, constants | c=2,1/2, M=1,4 | M⁰c=2 or 1/2 in each case | scaling cannot clear constant | none |
| §0.1 API 6, tangent equivalence | χ=t+t²/4,M=4 | χ(4t)/4=t+t²; 4^(2−1)/4=1 | both directions agree | none |
| §0.2 Uniformizes | φ=2z, f=x, g=2z or 3z | required pullback 2z; 2z−3z=−z is not zero as a germ | true,false | none |
| §0.2 positiveLogMean | g=2z,0,1/2 | J=log2,0,0; raw log at 1/2=−log2 | nonnegative real body | none |
| §0.2 rationalFunctionField | p=x,x²,2 | fields ℚ(x),ℚ(x²),ℚ; extension degrees 1,2,∞; constant native finrank 0 | finite-degree premise needed | none |
| §0.2 API 1, central coefficient | f=1 and f=x² | g(0)=1=a₀; second Taylor coefficient 2/2!=1 | n=0 included | none |
| §0.2 API 2, uniqueness | F=x versus −x, φ=2z | pullbacks 2z and −2z; linear coefficients 1 and −1 | wrong germ excluded | none |
| §0.2 API 3, ring laws | f=x,h=x²,φ=2z | u(f+h)=2z+4z²; u(fh)=8z³=(2z)(4z²); u(1)=1 | compatible | none |
| §0.2 API 4, shrink | φ=2z,r=3/4 or 1/4 | derivatives 3/2>1 and 1/2<1 | shrinking and expansion distinguished | none |
| §0.2 API 5, Taylor substitution | f=x²,φ=2z+z² | (2z+z²)²=4z²+4z³+z⁴ | exact coefficient identity | none |
| §0.2 API 6, common radius | f₁=(1−x)⁻¹,f₂=(1−2x)⁻¹ | radii 1,1/2; common radius 1/4>0 | finite minimum works | none |
| §0.2 API 7, constant means | c=0,1/2,2 | log(max(1,abs c))=0,0,log2 | zero permitted | none |
| §0.2 API 8, generated field | p=x² | x²,x^(−2) belong; x absent since extension degree 2 | field closure, not linear span | none |
| §0.2 API 9, constant boundary | p=0 or 2 versus x | ℚ(x)/ℚ infinite versus degree 1 | nonconstant guard works | none |
| §0.2 API 10, affine coordinate | p=x², a=2,b=3 | x²=((2x²+3)−3)/2; a=0 gives only ℚ | equality for nonzero slope | none |
| §0.2 API 11, rotation | g=2z, rotation i | J(2iz)=log2=J(2z)≥0 | invariant | none |
| §0.2 branch and pole Checks | sqrt branch with value −1; f=(1−x)⁻¹,φ=2z | −1≠a₀=1; pullback pole at 1/2 | realizations fail | none |
| §0.3 overconvergence | 1+x²,R=2,r=3/2; Σx^n,R=1 | n≥3 coefficients 0≤C(2/3)^n; radius-one coefficients all 1 | strict threshold necessary | none |
| §0.4 Eisenstein | f=1/2, sqrt(1−4u),0 | c=2,M=1 gives (1,0,…); sqrt coefficients 1,−2,−2,−4; zero coefficients 0 | scalar necessary only when needed | README only |
| §0.4 scalar absorption | integral a₀, n=1,2 | (cM)a₁=cMa₁; (cM)²a₂=c(cM²a₂); exponent at n=0 is 0 | absorption identity valid | README only |
| §0.4 tail recurrence/field | f=sqrt2+sqrt(1−4x), P=(Y−sqrt2)²−1+4x | P_Y at f has constant 2, s=0; N=1 gives 2N=2>N+s=1; coefficients lie in ℚ(sqrt2) | finite field/linear tail valid | none |
| §0.5 inverse denominator theorem | p=x,χ=t; p=x²,χ=t | χ and inverse both t; M=1 in both, even p′(0)=0 in second | ramified coordinate allowed | inverse API cited |
| §0.5 tangent inverse | χ=t+t²/4,M=4 | scaled χ=t+t²; scaled inverse t−t²+2t³−5t⁴+… | integral inverse over ℤ | native construction cited |
| §0.5 degree-four inverse | p=x+x⁴/32 | χ=t−t⁴/32+t⁷/256; M=4 gives −2,16; inverse of x+2x⁴ begins t−2t⁴+16t⁷ | same-scale inverse valid | Check recomputed |
| §1.1 tensor independence | p=x,f=1,D=2,d=1,2; wrong family 1,p | coefficient matrices I₂,I₄, determinants 1,1; p·1−p=0 | ℚ(p) premise necessary | duplicate removed |
| §1.2 constraint count | d=2,α=3 | 1,x,y,x²,xy,y²: 6=binomial(4,2), not 9 | strict total degree correct | none |
| §1.2 surplus/degree asymptotic | d=1,m=1,κ=1/2, in count model | D/α→3; rows/(columns−rows)→1/2 | correct ratio; not an all-d uniformity claim | none |
| §1.2 cofinal dimension guard | p=x+2,f=1,d=1 | coefficient at lowest degree of (T−2)^αQ has magnitude at least 2^α; height/α≥log2 | explains excluded uniform small-κ assertion | none |
| §1.3 lowest jet | F=x₁−x₂,χ=t+t²/2,φ=2z+z² | integral degree-one coefficients 1,−1 become 2,−2; beta=1 | lower modulus 2 | none |
| §1.3 tangent premise | χ=2t,F=x/2 | F∘χ=t integral but original coefficient 1/2 | non-tangent model fails | none |
| §1.4 multiplier definition | (h,g)=(1,1),(1+z,0),(1−2z,2z) | sup maxima 1,2,6; A=0,log2,log6 | logarithm fixed | definition kept in prose |
| §1.4 API 1, two suprema | h=1+z,g=0 | sup norms 2,0; maximum 2 | neither supremum alone suffices | none |
| §1.4 API 2, positivity | h=1 and h=1−2z | sup abs h=1 and 3; A≥0 | normalization excludes zero multiplier | none |
| §1.4 API 3, exponential threshold | h=1,g=2z,a=log2 or 0 | A=log2; bound exp a=2 admits boundary norm 2, exp0=1 fails | iff tested both ways | none |
| §1.4 extrapolation | m=1,φ=g=2z,h=1 | log2≤e log2=1.884169… | consistent limiting inequality | duplicate removed |
| §1.5 multiplier rank | same data, h=1−2z | A=log6; 1≤7.026656593, while mean bound gives 1≤2.718281828 | supporting consequence | README only |
| §2.1 mean_rank_bound | m=0; family {1},p=x,χ=t,φ=2z | 0≤e; 1≤e, J=log2, denominator log2 | empty and rank-one cases | retained headline |
| §2.1 nonrational family | {1,sqrt(1−4x)}, φ=(1−exp(8z))/4 | λ=2; numerical J=1.889831247, RHS=7.411259946≥2 | numerical consistency; not proof | none |
| §2.2 arithmetic_algebraicity | f=sqrt(1−4x),0,1 | annihilators Y²−1+4x,Y,Y−1; first has degree 2, not rational | strength correct | retained headline |
| §2.3 open-disc consequence | sqrt example,r=3/4; r=1/4 | rescaled φ′ moduli 3/2,1/2; realization exp(3z) in first | first satisfies closed-disc premise | README only |
| §2.3 binomial arithmetic | m=2 and m=3 | coefficients for sqrt: 1,−2,−2,−4; cube root of 1−9x: 1,−3,−9,−45 | integer examples; m² scaling correct | none |
| §2.3 strictness | lacunary Σx^(2^k),φ=z | derivative 1; radial terms at dyadic roots eventually all approach 1, unbounded sum | infinitely many singularities exclude algebraicity | none |
| §2.4 first lexicographic coefficient | G=3z₁²z₂,1−z,z₂^100+z₁ | log3=mean log3; 0=mean log abs(1−z); least vector (0,100) versus order 1 | coefficient/order distinction | none |
| §2.5 averaging proof | φ=2z, least vector (0,100); m=1 | coefficient factor 2^100; resulting rank inequality 1≤e | same normalization | duplicate removed |
| §3.1 discrepancy definition | singleton, antipodal pair, roots of order 3 | sup errors 1,1/2,1/3 | nonempty lower bound | definition in prose |
| §3.1 empty convention | d=0 | guard gives 0; raw 0/0 count yields error ℓ, supremum 1 | explicit totalization needed | none |
| §3.1 API 1, half-open arcs | antipodal tuple, arc length 1/2 starting at 1 | frequency 1/2=length; tiny arc at 1 has error tending 1/2 | supremum 1/2 | none |
| §3.1 API 2, rotated star | singleton at angular coordinate 1/2 | fixed-cut star 1/2; supremum over cuts 1 | circular adapter distinct | none |
| §3.1 API 3, bounds | d=1,2,3 regular polygons | D=1,1/2,1/3, hence 1/d≤D≤1 | endpoints attained | none |
| §3.1 API 4, permutation | (1,1,−1) versus (−1,1,1) | both atom weights 2/3,1/3 and discrepancy 2/3 | multiplicities retained | none |
| §3.1 API 5, rotation | (1,−1) and (i,−i) | discrepancies 1/2 and 1/2 | invariant | none |
| §3.1 API 6, repetition | (1,−1) and (1,1,−1,−1) | weights 1/2,1/2 and D=1/2 in both | repeats do not improve D | none |
| §3.1 API 7, empirical agreement | (1,1,−1) | arc shrinking around 1 has mass 2/3; error tends 2/3 in tuple and measure | agrees | none |
| §3.1 API 8, Haar characterization | Haar versus δ₁ | all Haar arc masses ℓ, D=0; δ₁ gives D=1 | wrong probability excluded | none |
| §3.2 weak continuity | half masses at exp(±i/n); regular d-gon | D=1−1/(πn)→1=D(δ₁); 1/d→0=D(Haar) | atoms handled by mesh | none |
| §3.3 Koksma | g=Re z, singleton 1; g=c | error 1≤variation 4 times D=1; constant error/variation 0 | turns and values retained | none |
| §3.4 Erdős–Turán | d-gon,K=d−1≥1; singleton,K=1 | Fourier means 0 give 1/d≤3/d; singleton 1≤9/2 | constant 3 correct | duplicate removed |
| §3.5 variation/positive log | Re z; h=0,z,2z,1−z | variations 4; 0,0,0; positive log at z=1 is 0 | cutoff removes singularity | none |
| §3.6 Fekete bound/equality | d=1; (1,−1),(1,1),(1,i); regular triple | 1=1; 2=2; 0<2; sqrt2<2; 3sqrt3=3^(3/2) | equality iff polygon, both directions | README only |
| §3.7 Haar equilibrium | Haar, δ₁, antipodal probability | energies 0,+∞,+∞; antipodal off-diagonal part −log2/2 | diagonal cannot be discarded | gap retained |
| §3.8 discrepancy gap | collision; regular d-gon; d=1 | 0<exp(−cd²); polygon D=1/d<ε eventually; singleton V=1>exp(−c) | threshold d₀ is necessary | README only |
| §3.8 truncation identity | antipodal pair, A>0 | truncated energy A/2−log2/2; off-diagonal part −log2/2; difference A/2 | d-limit precedes cutoff limit | duplicate removed |
| §3.9 damping coefficient | d=2,F=x₁−x₂,φ=2z,M=1 | H=2(z₁−z₂)², coefficients 2,−4,2; selected coefficient 2=λ^1 | beta remains 1, not 2 | duplicate removed |
| §3.9 ceiling and S=0 | SD/(cd)=1/2; S=0 | ceiling 1 cancels growth, floor 0 does not; M=0 gives V⁰=1 on collisions | correct rounding/zero convention | none |
| §3.10 four limits | κ=1/2,d=2,10,100 | 3^(1/d)→1; logd/d=.346574,.230259,.046052→0 | remainder removed only after d-limit | duplicate removed |
| §4.1 H definition | 1, exp x, exp(x/(1−x)) with χ=L/(1+L) | 1 integral; exp coefficient 1/2 fails; last pullback exp L=(1−t)⁻¹ integral but essential at 1 | arithmetic and local basis independent | none |
| §4.1 API 1, exact membership | f=1 versus exp x,χ=t | witness D(1)=0, basis {1}; exp coefficient 1/2 not integer | not arbitrary D-finite ring | none |
| §4.1 API 2, zero/unit | f=0,1 | pullbacks 0,1; derivative annihilates both | nonzero unit retained | none |
| §4.1 API 3, ring closure | f=h=(1−x)⁻¹,χ=t | f+h=2/(1−x), −f=−1/(1−x), fh=(1−x)⁻², integral coefficients 2,−1,n+1 | compatible with §4.2 | none |
| §4.1 API 4, restriction | U=ℂ,U′=D(0,1/2),f=(1−x)⁻¹ | singularity 1 lies in U and outside U′; basis condition needs fewer points | inclusion direction correct | none |
| §4.1 API 5, multipliers | χ=t,p=x; p=1/2 | p∘χ=t integral; constant 1/2 not integral | arithmetic premise essential | none |
| §4.1 API 6, local descent | f=exp x, order 1,degree 0 | coefficient equation a₀+a₁=0; matrix [1,1] rank 1, kernel dimension 1 over both fields | descent preserves order | ownership/route explicit |
| §4.1 descent leading coefficient | sqrt2 times ((1−x)D−1), f=(1−x)⁻¹ | basis components 0 and ((1−x)D−1); rational leading polynomial 1−x≠0; residual 0 | same order 1,degree 1 | new Check |
| §4.1 descent rank zero | f=0, L=1 | residual 1·0=0; leading coefficient 1≠0; order 0 stays 0 | zero series included | new Check |
| §4.1 descent rationality guard | f=exp(sqrt2 x) | D−sqrt2 annihilates; rational order-one coefficients would require p₀+sqrt2 p₁=0, hence p₀=p₁=0 | countermodel excluded | new negative Check |
| §4.1 local-basis/jet guard | x², D³; exp(1/(x−α)) | jet of x²=(0,0,2); latter has trivial monodromy but essential singularity | full meromorphic basis stronger | none |
| §4.2 rational multipliers | x·1; (1/2)·1; f=(1−x)⁻¹ squared | integral x; nonintegral 1/2; ((1−x)D−2)f²=0 | permitted multipliers exact | duplicate removed |
| §4.3 W definition/API 1 | finite sums of 1,p with ℚ(p) coefficients | (1/p)·p=1; scalar 1/p belongs by multiplying 1∈H | correct coefficient field | none |
| §4.3 V definition/API 2 | scalar x⁻¹ times 1∈H | x⁻¹∈V has valuation −1 | Laurent ambient needed | none |
| §4.3 API 3, algebra/scalars | scalar multiples a·1,b·1 | product ab·1 and unit 1 in each span | nonzero unital subalgebras | none |
| §4.3 API 4, extension identity | p=x², generators finite h_i | Σa_i(x)h_i is the same V sum; 1·h_i embeds W | V=ℚ(x)W in both directions | none |
| §4.3 API 5, integral coordinate | χ=t,p=x² | x∈H; finite field W contains x and x⁻¹; degree ℚ(x)/ℚ(x²)=2 | W=V need not mean base fields equal | none |
| §4.3 API 6, source V | χ=t | both definitions are span over ℚ(x) of H(U,t,ℤ) | identical carrier/scalars | none |
| §4.4 simultaneous clearing | f=(1−x)⁻¹,q=1−t,p=x; conjugate poles | q(p)f=1; (1−2x²)(1−2x²)⁻¹=1 at both conjugates | rational integral factor works | none |
| §4.4 arithmetic negative control | q=i(1−t), same f | q(p)f=i∉ℚ[[x]] | complex factor inadmissible | none |
| §4.5 corrected W bound | U=ℂ,p=x,χ=t,φ=2z | 1≤dim W≤e, integer dimension ≤2; λ=1 gives log1=0 | scalar field and strictness correct | none |
| §4.6 fields and V bounds | p=x²,χ=t; degree-four p below | base degree 2; W=V allowed; degree-four V rank≥4 and safe upper nB≈14.373492 | extension factor retained | duplicate removed |
| §4.6 field degeneracy guard | one-dimensional field algebra; zero ring | rank 1 and 1≠0; zero ring has 1=0 and cannot be the unital Laurent subalgebra | native domain hypotheses satisfied | none |
| §4.7 open-map finiteness | U=ℂ; U=𝔻; U=ℂ∖{1} | φ=2z gives derivative 2; Schwarz ≤1; φ=1−exp(2z) gives −2 and never 1 | hyperbolic radius not used outside domain | none |
| §4.8 both inverse identities | p=x+x⁴/32,χ=t−t⁴/32+t⁷/256+… | degrees 4,7 in each composition: −1/32+1/32=0,1/256−4/1024=0; degrees 0,2,3,5,6,8,9 also 0 | both equal t through degree 9 | expanded Check |
| §4.8 scalar-span counterexample | same p,φ=2z | degree 4; boundary norm≤5/2; B≤3.593373119<4; (5/2)³=125/8<16 | refutes V bound, preserves W bound | inverse dependencies added |
| §5.1 centred rescaling | r=1/2,φ=4z,p=x; φ=2z | cap=1/2; numerator log2; denominator log4+log(1/2)=log2; B=e; second denominator 0 | strict positivity necessary | docstring corrected |
| §5.2 translated compact obstruction | K=closedDisk(1/2,1/4),φ=8z exp(−20z) | cap=1/4; norm≤6exp(−5)=.040427682<1; numerator 0; denominator log2=.693147181; rank≥1 | proposed inequality 1≤0 false | G1 left to maintainer |
| Equilibrium supplier gap | radius-2 circle, singleton, {0,1} | minimum −log2, capacity 2; atomic energies +∞, capacities 0; distinct point masses both minimize on {0,1} | existence/nonempty and uniqueness/positive-capacity separated | existing contract retained |
| Worked modular benchmark | F=1+4x+36x²+…,φ=q−8q²+… | coefficient q is 4; coefficient q² is 4(−8)+36=4; theta square begins 1+4q+4q² | factor 16 and square agree | redundant noncomputational Check removed |

The square-root numerical integral was recomputed at 16384 and 65536 equally spaced angles, giving 1.889831252 and 1.889831247. The inverse compositions and tangent scaling were calculated with exact rational arithmetic. The rigorous counterexample inequalities use the displayed elementary bounds, independently of numerical integration. The source's general energy statement needs positive capacity for uniqueness; the retained supplier gap includes that condition. No remaining formula or worked example was changed by the Lean-only deletions.
