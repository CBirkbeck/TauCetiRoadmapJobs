<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1056#issuecomment-6482562193 -->
Red team round 2 pass a (codex) of c9ce4b5

Verdict: needs_changes

1. **F01** (P1) The new Hodge-index induction cites a narrower Bertini theorem

   **Location:** packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:1378: “whose zero locus is geometrically integral and normal by Bertini (SchemeAndStackFoundations §4.13)”.

   **Claim:** The cited supplier provides the hyperplane theorem needed for an arbitrary geometrically normal projective X in §8.8.

   **Witness:** TauCetiRoadmap/SchemeAndStackFoundations/README.md:5680 assumes smooth X. The quadric cone xy=z² in ℙ³_ℚ is geometrically normal but singular: vertex tangent dimension 3, local dimension 2. Thus the cited theorem cannot supply this section.

   **Exact repair text:** “The induction also requires geometric Bertini for geometrically integral, geometrically normal projective varieties over infinite fields: for a sufficiently high very ample embedding, a general hyperplane section is geometrically integral and geometrically normal when dim X ≥ 2.” Declare this as a named prerequisite owned here, or a precise gap to SchemeAndStackFoundations §4.13, and cite it instead of the supplied smoothness theorem. Keep §8.8 at its present generality. Add the quadric cone Check: its vertex has tangent-space dimension 3 and local dimension 2, so the smooth-input theorem is unavailable; a general section avoiding the vertex is a smooth integral conic. This repairs the geometric supplier edge; the arithmetic restriction step requires separate verification recorded below.

   The earlier a-F08 is only partly repaired: the inequality now has a named owner, but this new proof input is not supplied at the cited section.

2. **F02** (P2) Invariant extensions omit integrality of the total space

   **Location:** packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:868: “π : X → S projective flat with geometrically connected fibres”.

   **Claim:** These hypotheses suffice to form P̂ic(X/k) and assert the invariant extension theorem.

   **Witness:** Take S=Spec ℚ, X=ℙ¹ over ℚ[ε]/(ε²), f induced by z↦z², and L=O(1). The morphism is projective flat with geometrically connected fibres and f*L=2L, but ε≠0, ε²=0.

   **Exact repair text:** “Let S be flat essentially quasi-projective integral over k, X integral, and π : X → S projective flat with geometrically connected fibres.” The carrier of §§1.3–1.6 is then defined. This is exactly the missing hypothesis in yuan-zhang-2025 Theorem 6.1.2, lines 7304–7306. The square-zero example is excluded, while ℙ¹_ℚ with the same f and L remains included and gives h(2)=log 2.

3. **F03** (P1) The Gross–Schoen formula weights the local analytic invariant twice

   **Location:** packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:1621: “Σ_v φ(C_v)deg(v)”.

   **Claim:** The local invariant defined in §10.3 can be multiplied by the place degree in the global height formula under the conventions at line 29.

   **Witness:** Over K=ℚ(t), C:y²=(x²−t²−1)(x−1)(x−2)(x+1/2) has a split thickness-one node at t²+1. This place has degree 2: graph φ=1/12, analytic φ=1/6, written contribution 1/3, correct contribution 1/6.

   **Exact repair text:** “At finite places write φ_v for the reduction-graph invariant computed with ord_v(ϖ)=1, equivalently the local analytic invariant for |ϖ|=e⁻¹. The raw global correction is Σ_v φ_v deg(v), with deg(v)=[k(v):k] for function fields and log Nv for number fields; at infinity use the usual archimedean invariant and embedding multiplicities.” Replace φ(C_v) by this φ_v in both occurrences of the weighted formula in §10.10. Alternatively, under the function-field absolute values fixed in the conventions, sum the analytic φ(C_v) without another degree factor. Add the degree-two node Check: both corrected expressions contribute 1/6. Zhang's graph-valued local term is explicit in zhang-2010 lines 233–237; yuan-2026 lines 2884–2898 uses the graph-weighted convention followed by §13.2.

4. **F04** (P2) The Gross–Schoen construction silently extends its source's residue-field scope

   **Location:** packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:1623: “construct … a cycle extension numerically trivial on each normalized fibre”.

   **Claim:** Gross–Schoen §§6–8 supply this construction over every one-variable function field, including arbitrary constant fields.

   **Witness:** gross-schoen-1995 lines 657–663 requires residue fields finitely generated over the prime field. For K=ℂ(t), the residue field at t=0 is ℂ, which fails this condition; the cited proposition cannot be applied directly.

   **Exact repair text:** “Numerical-extension descent for the modified diagonal: for a good semistable curve model over a DVR with arbitrary residue field, its modified diagonal on the regular triple-product model admits a rational vertical correction numerically trivial on every normalized special-fibre component. Descend the finite special-fibre data to a field finitely generated over its prime field, use independence of the correction problem from the DVR (Gross–Schoen Lemma 7.6) and an equicharacteristic smoothing (Lemma 7.11), apply Proposition 7.2 there, and prove preservation of numerical triviality under scalar extension.” Make this a named subtarget before constructing the height, with its descent and cycle-base-change dependencies explicit. If using the source's cohomological proof, also name suppliers for its Tate/semisimplicity and weight inputs (lines 728–740 and 760–783); the present MotivesAndAlgebraicCycles §§2.2–2.3 supply neither those theorems nor their general-field versions. Do not narrow the final height theorem. For the ℂ(t) test, the finite model data descends to a finitely generated subfield and the corrected cycle pulls back to ℂ, so the missing application is accounted for.

## Verification of the previous findings

All locations in this table are in packages/ArakelovGeometryAndAbelianHeightsPartII/README.md. Each earlier finding was reconsidered against the present text, rather than accepted from the repair report. No previous finding was marked “not actionable in this package”.

| Earlier finding | Status | Repaired passage and present witness |
|---|---|---|
| a-F01, density | Repaired | :486, “that trivial point is the test set used in place of the discrete points”; :501 carries the split into effectivity. Spec 𝔽₂ has test-set cardinality 1 and analytic cardinality 1; the nontrivial discrete set still has cardinality 0. |
| a-F02, local Calabi cycle | Repaired | :1096–1098 introduces “Local Calabi uniqueness on curves”; :1114 uses it before §7.4. Norms 1 and e⁻¹ both have curvature 0; the clamp has self-intersection −log p. The former 7.3→7.4→7.3 edge is gone. |
| a-F03, small positive twists | Repaired | :738 adds volume continuity and “for every sufficiently large rational c”; :815 distinguishes “a small twist” in the nef case from “a sufficiently large twist” otherwise. For max O(1)+O(c−1), volume is 0 for c≤1 and 2(c−1)>0 for c>1. |
| a-F04, Deligne-pairing Check | Repaired | :762, “⟨L, L⟩ = ⟨O(1), O(1)⟩ + 2M”. With M=O(1), max metric gives 0+2=2; Fubini–Study gives 1/2+2=5/2. |
| a-F05, relative versus absolute height | Repaired | :1369–1370, “which is −2a after division by [K : ℚ]”. For [K:ℚ]=2 and absolute theta height a, −2[K:ℚ]a=−4a; division gives −2a. |
| a-F06, process narrative | Repaired | :69 now describes “the comparison is the target §4.9”; the sentence referring to the design's Checks is absent. The retained z↦z² example still has max(1,|z²|)=max(1,|z|)². |
| a-F07, spectral coefficient | Repaired | :1493, “(1/(2λ))” for the (i/2)-orthonormal basis; :1516 supplies the basis-change Check. With ω=√2β, (1/2)·4S=2S, equal to the β expression; the former coefficient gave 8S. |
| a-F08, arithmetic Hodge index | Partly repaired | :1376 now concludes “is pseudo-effective in P̂ic(F/k)_int,ℚ”; :1973 applies it to M and N on C². At g=3, N²=192, M·N=0, M²=−16. The expansion gives 16φ−56ω_a²≤0. Its new geometric Bertini supplier is insufficient: S01. |
| a-F09, mass theorem's dependency | Repaired | :660–664 gives §3.5 “Total mass … over a global field”; :514 and :896 now consume it. Standard O(1) on 𝔾ₘ has mass and geometric adelic degree 1, whereas the trivial metrized bundle has both 0. |
| a-F10, discriminating Checks | Repaired | :558–559 gives frame norms “1/2”, “1”, “1/4”; :1247 gives the nonconstant cosine weight. Tensor square and characteristic-two pullback give 1/4; Δcos(2πx)=−4π²cos(2πx)≠0 rejects the wrong metric. |
| a-F11, ampleness under generically finite pullback | Repaired | :1864 passes to “the closure Z of the image” and uses projection; :1870 records the blow-up. Exceptional degree is 0, while the theta pullback square is 8. Nef bigness survives; ampleness is no longer claimed there. |
| b-F01, trivial and archimedean fibres | Repaired | :1177 says “every line bundle then has exactly one admissible metric” and defines archimedean admissibility through “the b-th power”; :1230 and :1267 use the split. At a trivial point a frame has norm 1. At exponent b=1/2 a scalar 2 scales the norm by √2, not 2; the corresponding φ is halved. |
| b-F02, same pairing Check | Repaired | The same “⟨L, L⟩ = ⟨O(1), O(1)⟩ + 2M” passage and 0+2 versus 1/2+2 calculation as a-F04. |
| b-F03, hybrid obstruction | Repaired, with justified correction to proposed repair | :1709 fixes “S=M₍g,N₎ over ℤ[1/N]” and the second assertion concerns δ alone. Subtracting a hypothetical δ-divisor from Ξ and adding O(4g log 2π) gives finite value ε and archimedean value 0. The earlier review's proposed δ+ε obstruction was false: Ξ+O(4g log 2π) supplies that function. |
| b-F04, mixed-dimensional grid bound | Repaired | :1848, “d := m − dim Z … largest dimension”. The mixed union in :1856 has degree 3 and d=1, giving 2≤3; using a zero-dimensional component's codimension would give the false 2≤√3. |
| b-F05, locators | Repaired | :399 reads “yuan-2026 line 2262”; :1416/:1428 reads “yuan-2026 line 1239”; :1971 reads “yuan-2026 line 2972”; :1623 gives Gross–Schoen “pp. 660–679”. Gross–Schoen's §6 heading follows the printed page-660 header at lines 364–367, not page 661. |

## Statement and instance ledger

Each row covers the named target, its defining conventions, API consequences and Checks. Values are arithmetic or algebraic computations, not Lean test runs. A successful example is not a proof of the universal theorem. Symbols such as W and φ in coefficient tests denote formal intersection values; no existence of a curve with arbitrarily prescribed invariants is inferred.

Standing exclusions were applied before substitution: integral schemes exclude the zero ring, empty schemes and square-zero thickenings; positive genus and g>1 exclude the corresponding zero denominators; finite graph models exclude noncompact graphs; projective fibres exclude the nonproper local energy case. S02 records where integrality is actually absent. S₃ and Q₈ do not qualify as abelian varieties or Picard groups, so noncommutative-group tests are outside these signatures.

| Target and variable/instance context | Instances tried | Values on the two sides | Result / change |
|---|---|---|---|
| 0.1: projective integral flat arithmetic X, continuous conjugation-invariant norms | Spec ℤ; norms e⁻¹,e⁻²,e | Tensor degree 1+2=3; norm e has curvature 0 but degree −1 | Semipositivity does not imply arithmetic nefness |
| 0.2: projective flat f, relative dimension n, integrable metrics | Finite flat degrees 1,2; pullback O(1) | Norm degrees 1·1=1, 2·1=2; degree-three fibre gives metric shift 3c | Flat/norm and shift formulas agree |
| 0.3: dimension d, nef inputs for HS/Siu | Spec ℤ, c=−1,0,1; Spec 𝔽₄/𝔽₂ | Volumes 0,0,1; nef degrees 0,1; empty degree=volume=2; Siu 2−1=1 | Correct d=0 branch; non-nef degree −1 is not volume |
| 1.1: integral Cartier restriction, rational model coefficients | [2], ½[2] on Spec ℤ; constants 1,2 | Allowed coefficient 1 versus forbidden 1/2; (0,1)+(0,2)=(0,3) | Integral/rational distinction retained |
| 1.2: extended boundary norm | Spec ℤ, E=(0,1); projective field model E=0 | Norms of (0,±1)=1; norm of [2]=∞; E=0 gives norm(0)=0, norm(nonzero)=∞ | Correct extended/discrete topology cases |
| 1.3: underlying integral L and boundary-Cauchy rational models | Spec ℤ; Spec ℤ[1/2] | O(1)+O(2)=O(3); √2 modulo ℤ is not in ℚ/ℤ, so no rational model gives that 2-coordinate | Completion adds genuine classes |
| 1.4: divisor-class quotient | Principal divisor of 2; O(1) | log 2−log 2=0; degree O(1)=1≠0 | Kernel sign correct |
| 1.5: strong nef/nef/integrable | Spec ℤ c=−1,0,1; ½O(1) on ℙ¹ | Nef values false,true,true; all three integrable; rational degree 1/2 versus integral degrees ℤ | Rationalization is necessary |
| 1.6: essentially quasi-projective colimit, fixed base | Spec ℚ; identity model; forget vertical data | O(1) degree 1 before forgetting and class 0 after; identity preserves 1 | Noninjective forgetful map distinguished |
| 1.7: complex-valued base and boundary growth | Point; ℂ× boundary at 0 | Green values 1+2=3; (log r)²/abs(log r)=abs(log r)→∞ as r→0 | Quadratic-log wrong model excluded |
| 1.8: arithmetic curve, degree-zero kernel | ℚ, ℤ, ℤ[1/2] | Degree-zero groups ⊕ₚℝ/ℤ, 0, ℝ/ℤ respectively | Missing-prime coordinate detected |
| 1.9: nef effective domination | D=([2],0); D=(0,−1) | ([2],0)−D=0, ([2],0)+D=2[2]; (0,c)−D has coefficient −1 at 2; −1≤−1≤1 but −1<−1/2 | Finite support and metric both matter |
| 2.1: integral finite-type Banach-base analytification | Spec k; Spec ℤ, t=1,1/2; 2-adic point | Cardinality 1 over k; abs(2)=2,√2,1/2 respectively | Arbitrary-radius charts distinguish analytic points |
| 2.2: continuous normed Hᵥ-lines, unsquared Green function | div(2); scaled archimedean ray | exp(log 2)=2 versus wrong exp(log 2/2)=√2; Green O(1) gives 1,1/2 | Divisor/metric inverse and equivariance agree |
| 2.3: adelic analytic realization | O(1),O(2) on Spec ℤ | Archimedean values 1≠2; finite values both 0 | Finite places alone do not separate these metrics |
| 2.4: discrete/archimedean density with the explicit dimension-zero branch | Spec 𝔽₂; k(t); real exponent 2 | Corrected test closure has cardinality 1=1; discrete subset has cardinality 0; abs(t)=e⁻¹,e; abs(1+1)²=4>2 | Earlier a-F01 repaired; inadmissible archimedean power excluded |
| 2.5: normality for Green-only effectivity | Spec ℤ with O(c), c=−1,0,1; Spec 𝔽₂ | Green values −1,0,1; effectivity false,true,true; trivial-point Green 0≥0 | Both directions and corrected zero-dimensional test agree |
| 2.6: dimension n, mixed integrable measures | ℙ¹; ℙ¹×ℙ¹; n=0 | Masses 1,2,−1; polarization (2−0−0)/2=1; 0−1=1−2=−1; empty mass 1 | Signed extension consistent; now points to §3.5 |
| 2.7: proper model over trivial norm | Point; O(1) on ℙ¹ at abs(t)=2 and 1/2; Frobenius in characteristic 2 | Frame norms 1,1/2,1; tensor-square norm (1/2)²=1/4=pullback norm | Earlier a-F10 repaired; exp(−1) rescaling fails model normalization |
| 3.1: model dimension d; integrable projection formula | 𝔽₄/𝔽₂; purely inseparable tower degree 2 then 2; O(1) on Spec ℤ | Empty degrees 2=2·1; inseparable 4=2·2 (separable degrees would give 1); arithmetic value 1 | d=0 and inseparability treated correctly |
| 3.2: projective flat f, normal base, integrable inputs | Finite flat degree 2; degree-three fibre | ⟨f*O(1)⟩=O(2); a unit twist adds O(3)=3·O(1) | Relative degree factors agree |
| 3.3: composition/projection with flatness where needed | Degrees 2 then 3; fibre degree 3 | Iterated norm gives O(6)=composite norm; pairing with O(2) gives O(6) | Arity and degree products agree |
| 3.4: geometrically reduced connected fibres | Identity; Frobenius on E/𝔽₅, y²=x³+3x+2 | #E(𝔽₅)=5; P=(1,1) has order 5; F*O(P−O)=O while O(P−O)≠O | Correct added reducedness; source's weaker hypothesis fails |
| 3.5: integrable bundles on a quasi-projective global-field variety | O(2) on ℙ¹; O(1,0),O(0,1); O(1) on 𝔾ₘ | Mass=degree: 2=2, 1=1, 1=1; trivial bundle on 𝔾ₘ gives 0=0 | No circular mass dependency; boundary is outside the support of the max-metric mass |
| 4.1: analytic small sections, integral U | Spec ℤ c=−1,0,1 | Cardinalities 1,3,5; logarithms 0,log 3,log 5; norm of 1 at c=−1 is e>1 | Zero section retained; strict/weak norm boundary tested |
| 4.2: model-dimension volume | Spec ℤ c=−1,0,2; Spec 𝔽₄/𝔽₂ | Volumes 0,0,2 and 2 respectively; generic algebraic bundle is trivial in all arithmetic examples | Generic bigness alone insufficient |
| 4.3: nef Hilbert–Samuel/Siu; rational volume continuity; large twist | O(2)−O(1) on Spec ℤ; max O(1)+O(c−1); dimension 0 | 1=2−1; volumes 0 for c≤1, 2(c−1) for c>1; empty degree 2=volume 2 | Earlier a-F03 repaired; general perturbation uses continuity, not nef-only Siu |
| 4.4: normal base of positive model dimension, nef-big/effective inputs | Identity; max and FS O(1)+π*O(1) on ℙ¹_ℤ | Identity pairing L=L; max 0+2=2; FS 1/2+2=5/2 | Earlier a-F04 and b-F02 repaired |
| 4.5: finite surjective degree r, nef L | Identity; Frobenius of ℙ¹/𝔽₂; degree-zero L | Degrees 1=1·1, 2=2·1; zero degree pulls back to 0 | Bigness iff holds in both directions, including inseparable cover |
| 4.6: absolute arithmetic/relative geometric heights | [1:2] over ℚ, quadratic field; [1:t] under t=u² | Raw heights log 2,2log 2; absolute heights both log 2; geometric heights 1,2 | Field-degree adapter correct |
| 4.7: arbitrary big, nef geometrically big, general geometrically big inputs | Max O(1)−O(1), twisted by c | For 0<c<1, nonzero integral degree-m sections have norm at least exp(m(1−c))>1, volume 0; for c>1 volume 2(c−1)>0 | Large-twist repair excludes the old counterexample |
| 4.8: nef, positive geometric top degree | Spec ℚ with O(c); max O(1) on ℙ¹ | Point essential minimum c=normalized variety height c; on ℙ¹ both minima and variety height 0 | n+1 denominator consistent |
| 4.9: global-field carrier comparison | Quadratic K, FS O(1); finite fibre | Raw square [K:ℚ]/2=1, normalized square 1/2; unit Dirac pushforward has mass 1, not 2 | Arithmetic adapter and measure pushforward distinct |
| 5.1: f*L=qL, q>1, integral S; X integrality omitted | [2] on elliptic Θ; square-zero thickening of ℙ¹ | 4Θ=4Θ; unit base twist gives difference −3; on thickening f*O(1)=O(2) but ε²=0 with ε≠0 | S02: carrier unavailable on this admitted total space |
| 5.2: nef geometric part, dimension of Y | Constant elliptic family over a curve; torsion section; fibre elliptic curve | Betti ranks 2<4, 0<2, and 2=2; geometric top degrees 0,0,positive | Full rank detects nondegeneracy; arithmetic top degree may remain 0 |
| 5.3: nondegenerate Y and generic sequence | Generic torsion on a fixed abelian variety; repeated origin | Heights 0 in both; generic orbit limit mass 1; repeated orbit mass 1 but contained in degree-zero-dimensional closed subset | Genericity cannot be dropped |
| 5.4: smooth positive-genus family, Hodge metric | Genus 1 and 2; [K:ℚ]=2 | Squared norm ratio π⁻g raises height by (g/2)log π; raw Hodge degree 2h versus absolute h | Parent Faltings normalization agrees |
| 6.1: projective normal arithmetic polarization, transcendence degree d | ℚ, empty tuple; ℚ(t), H=O | [1:2] height log 2; zero polarization gives every intersection 0; quadratic base gives 2log 2 | Big-polarization condition essential |
| 6.2: Moriwaki height class; ample L and big B for Northcott | [1:n] over ℚ; zero polarization | h_O(2)=2log n=2h_O(1); h_O=0; zero polarization has infinitely many degree-one points of height 0 | Northcott hypotheses necessary |
| 6.3: symmetric ample L; big B for torsion converse | Order-2 point; non-torsion height a; zero polarization | Limits 0; [0],[1],[2] heights 0,a,4a; nontorsion zero-polarization height 0 | Quadratic scaling and converse scope agree |
| 6.4: big B, ample comparison, finite base cover | Degree-two base cover, generic height 3 | Upstairs height 6, base-height growth factor 2, quotient 6/2=3 | Cover-degree and degree-one normalization agree |
| 7.1: abelian A over complete nontrivial nonarchimedean K | Good reduction versus Tate elliptic curve; rigidified trivial bundle | Curvature δζ versus circle Haar, both mass 1; model atomic mass 1 differs from Haar; norm at origin 1 rules out e | Local normalization distinguishes admissibility |
| 7.2: positive-genus curve/square, finite extension allowed | Good reduction; genus-two banana; trivial line | Model banana masses 1+1=2, canonical edge masses 3·(2/3)=2 but atomic versus non-atomic; O constant curvature 0 | Total mass alone is not admissibility |
| 7.2a: smooth projective geometrically integral curve over complete nontrivial nonarchimedean field; integrable M with underlying O | Constant f=0,1; clamp of log abs(t) on length log p | Self-intersections 0,0,−log p; energies 0,0,log p | Constants are precisely the equality case; curvature-equal metrics have constant ratio |
| 7.3: canonical probability and admissible curvature criterion | Banana; good reduction; flat metrics 1,e⁻¹ | Edge density (1/2)/(1+1/2)=1/3, total 1; good-reduction mass 1; both flat curvatures 0 | Earlier cycle broken by §7.2a; equality of curvature fixes metric up to a constant |
| 7.4: symmetric canonical pair, mean zero, residue norm one | g=1,2; diagonal shift c; ramification factor 2 | Canonical masses 0,2; shifted mean c; shifted residue norm exp(c); Green 1 becomes 2 | Residue and positive-degree normalization exclude the wrong constant |
| 7.5: pointed split semistable DVR curve | Good reduction; unramified quadratic extension; elliptic circle | Graph Green 0 gives metric ratio 1; intersection length 1/e=1 rather than 1/2; circle length 1 gives ratio e_K^(1/12) | Ramification, not total extension degree, normalizes length |
| 7.6: powers that remain absolute values | ℚ₂ power 2; ℝ powers 2,1/2; trivial norm | abs(2):1/2→1/4; on ℝ,4>2 excludes power 2, √2≤2 allows half power; model norm 1^a=1 | Archimedean exponent bound necessary |
| 7.7: global field, all places, genus ≥1 | Degree-two extension; genus-one canonical bundle | Raw W→2W; arithmetic W/d=(2W)/(2d), geometric W→2W; elliptic pulled-back canonical square 0 | All-place assembly and normalization consistent |
| 8.1: normal integral base, fibrewise admissible integrable bundle | Base twist; banana dualizing bundle; cosine weight; trivial point | Fibre curvature 0; atomic and edge masses both 2 but measures differ; Laplacian −4π²cos(2πx)≠0; trivial frame norm 1 | Added negative controls distinguish admissibility, not merely total mass |
| 8.2: fixed L on curve/square/abelian scheme | Base twists O(1),O(2); identity twist | Ratio of norms e⁻¹; difference class O(1)≠0; identical metrics difference 0 | Torsor, not unique unnormalized extension |
| 8.3: normalized family pair, g≥1 | g=2; g=1 circle of unit length; transposition | deg w=2 and deg Δ*D=−2; elliptic w model ratio e_K^(1/12) despite both squares 0; swap leaves D unchanged | Genus-one positive-degree normalization is required |
| 8.4: rigidified twice-theta and odd Poincaré | n=0,2,3; twist O(1) | Heights 0,4hΘ,9hΘ; twisted [2] sides differ by O(−3); deg Θ on elliptic fibre 2 | Rigidification excludes constant error |
| 8.5: section x, admissible L | Twist L by base O(1); section self-pair | Both evaluation and pairing shift 1=deg(O(x))·1; ⟨O(x),O(x)⟩=−x*w, so b+(−b)=0 | Adjunction sign consistent |
| 8.6: integrable kernel of underlying Picard map | Base O(1), O(x), continuous Fourier weight | Underlying degrees 0 and 1; Fourier curvature coefficients −2π²8ⁿ unbounded whereas finite-measure coefficients are bounded | Continuity alone fails integrability |
| 8.7: admissible degree-zero M and vertical V | Torsion; quadratic K with absolute principal-theta height a; base constant c | 0=0; raw self-degree −4a, normalized −2a; mixed base contribution 0·c=0 | Earlier normalization defect repaired |
| 8.8: geom. integral normal projective n-fold, integrable M, nef geometrically big Lᵢ, primitive M | n=1 base class; FS O(1); clamp; genus-three square; quadric cone | 0≤0; FS +1/2 violates sign but deg M=1 excludes it; clamp −log p; N²=192,MN=0; cone tangent dimension 3>2 | Inequality examples agree; S01 supplier cannot support singular-input induction |
| 9.1: arbitrary integer d, genus ≥1 | g=2,d=1; d=0; g=1 | Pairing A+8b from both expansions; d=0 self-pairing 0; elliptic second identity 0=0 | Degree-zero and g=1 do not force forbidden division |
| 9.2: canonical/difference/shift, g>1 | g=2,3 | Canonical coefficients (8,32),(24,384); shift (16,32),(128,384); difference 8w+P,12w+P | Algebraic coefficient expansions agree |
| 9.3: rational nef combination, g>1 | g=2,3,1 | P coefficient −1/8+32/256=0, −1/24+384/9216=0; g=1 denominator 0 | Positive-genus boundary correctly excluded here |
| 10.1: effective polarized compact connected graph | Edgeless genus 2; one genus-two unit loop; doubled loop | (δ,ε,φ,τ)=(0,0,0,0),(1,1/6,1/12,1/12),(2,1/3,1/6,1/6) | μ_can must be allowed signed; homogeneity correct |
| 10.2: g≥2 graph bounds | Unit loop; g=4 constant | δ+ε−2φ=1=(3/2)−6/12; φ=1/12>1/39; t(4)=9/(8·33)=3/88>1/39 | Factors and lower bounds agree |
| 10.3: local φ, g>1, all three valuation types | Genus-two unit loop; unramified and ramified quadratic extensions; ω=√2β; degree-two place | φ=1/12,1/12,1/6; spectral (1/2)·4S=2S; analytic φ at degree-two place is 1/6 | Spectral repair correct; keep analytic and graph normalizations distinct in §10.10 (S03) |
| 10.4: geometric ε divisor, stable compactification | Good reduction; unit type-zero node in genus 2 | Green values 0,1/6; model square minus admissible square 1/6 | Correction sign positive |
| 10.5: boundary bound | Same node; no edges | 2δ−ε=2−1/6=11/6≥0; zero graph 0−0=0 | Effectivity test consistent |
| 10.6: φ divisor on base, diagonal triple pairing on curve square | Good reduction; type-zero unit node; archimedean half-ray | Values 0,1/12; archimedean b becomes b/2; P−D³=φ | Domain and sign agree; no double place weight in this divisor |
| 10.7: difference triple pairing | g=2, W=2, φ=5 (hyperelliptic relation) | RHS 4(3g−1)W−8φ=20·2−40=0; elliptic boundary g=1 also gives 0 if both invariants 0 | Triple-pairing coefficient consistent |
| 10.8: geometric φ boundary | Unit genus-two node | φ−δ/39=1/12−1/39=3/52>0; good reduction 0 | Uniform graph coefficient gives effectivity |
| 10.9: Hodge lower decomposition | g=2, λ=1 | c=1/25; effective remainder bound yields P≥1/25; constant family λ=P=0 | Positive coefficient, not positivity for every family |
| 10.10: canonical rational modified diagonal, arbitrary global constant field | Hyperelliptic g=2, W=2,φ=5; degree-two node; ℂ(t) | (5/2)·2−5=0; correct node contribution 1/6 versus written 1/3; trdeg(ℂ/ℚ) is not finite | S03 weighting; S04 source descent missing |
| 10.11: θ norm and δ | Genus 1; θ norm multiplied by e | φ=0; δ=−24I−8log(2π); I→I+1 gives δ shift −24 | Fourier normalization essential; g=1 outside g>1 end results |
| 10.12: arithmetic Noether, semistable model | g=2, degree 1 then 2 | W_Ar=12h−δ+8log(2π); extension doubles every raw term and constant to 16log(2π) | Field degree and sign agree |
| 10.13: arithmetic Noether divisor, k=ℤ or ℚ | Section sign change; unit node g=2; Spec ℚ forgetful map | abs(−s)=abs(s); δ+ε=7/6; geometric image on Spec ℚ is 0 despite arithmetic value 7/6 | Arithmetic carrier cannot be replaced by geometric one |
| 10.14: universal level-moduli hybrid obstruction | abs(t_n)=exp(−n), exponent 1/n; hypothetical δ-only divisor | Rescaled abs(t_n)=exp(−1); ε limits 0 versus 1/6; Ξ−E′+constant has archimedean value 0 and finite ε | Repaired obstruction is correctly scoped; δ+ε itself is globalized |
| 11.1: fixed genus >1 compact Riemann surfaces | Boundary error 1/156; t=e⁻ⁿ | 1/39−2/156=1/78>0; lower Green bound n/78+O(1)→∞ | Compactness can give positive minimum |
| 11.2: maximal variation over fixed constant field | Spec 𝔽₂,Spec 𝔽₄ over 𝔽₂; genus-two base curve λ=1 | Empty degree/volume 1,2; curve P≥1/25; constant family curve P=0 outside hypothesis | Zero-dimensional bigness and variation scope agree |
| 11.3: arithmetic base dimension d≥1 | d=1, g=2, K quadratic | Empty generic degree 2, lower raw degree (2c₀/5)·2=4c₀/5; normalized bound 2c₀/5 | Missing field factor would halve raw bound |
| 11.4: maximal variation, canonical bigness | g=2, dim S=0,[F:k]=2; dim S=1 | Positive term 16·2=32; dividing by 8 gives canonical degree 4; dimension-one base term 32P>0 | Both dimension branches agree |
| 12.1: projective flat with geometrically integral generic fibre | e=0,Y=S; positive-dimensional constant family with base L | m⊠L=mL, volume m^d vol L; base pullbacks have fibre top degree 0 in every power | m≥1 and positive fibre dimension distinguished |
| 12.2: nef L, positive a, relative powers | e=1,m=2; d=0,[F:k]=2,a=2; d=2,m=3,M²=3 | Exponents (2,1),(1,2) give aM, (3,0),(0,3) give 0; selected degrees 4,8; last term 2·3=6 | Multinomial/empty-degree conventions agree |
| 12.3: potential-bigness iff | d=0,[F:k]=2,a=2; e=0 | m=1,2 top degrees m!2^m·2=4,16; e=0 gives m^d vol L>0 iff vol L>0 | All three directions retain positive fibre degree |
| 12.4: nonempty reduced proper closed subset, d=m−max dimension | Three points; three-by-three grid; mixed-dimensional union; empty Σ | 3≤3; 3≤√9=3; degree 3,d=1 gives 2≤3, whereas 2≤√3 is false; empty 0≤bound | Maximum-dimension correction repaired |
| 12.5: maximal variation, generically finite theta pullback, normal base for potential bigness | g=2,dα=1; blow-up of Jacobian | Pairings 2P+ι*Θ,8w+P,16Θ+32P; exceptional degree 0; theta pullback square 8 | Projection through the image repairs the false ampleness step |
| 12.6: integral characteristic test schemes | ℙ¹ at p=2,3; Spec ℤ[x]/(x²−2) at p=2 | O(1) degrees 1,1; constant metric shifts 0,0; fibre ring 𝔽₂[x]/x² versus reduced test 𝔽₂ | No adelic carrier asserted for nonreduced fibre |
| 13.1: stable function-field Hodge height | Constant curve; degree 3 after extension degree 2; genus 2 | Heights 0,3/2; thresholds 3⁻¹⁶ and 4⁻¹⁶; fixed-constant-field base degree 2 doubles height | Auxiliary-extension independence distinct from changing base field |
| 13.2: finite global bad-place sums | Degree-one type-zero node g=2; degree-two extension | (δ,ε,φ)=(1,1/6,1/12)→(2,1/3,1/6); good reduction geometric sums 0 | Raw versus absolute sums consistent |
| 13.3: canonical-square correction | g=2, h=1/10,δ=1,ε=1/6,φ=1/12 | Model W=1/5; admissible W=1/5−1/6=1/30=(2/5)(1/12) | Correction and hyperelliptic relation agree |
| 13.4: canonical-square lower bounds, g>1 | g=2,3,4,5; genus-three Hodge application | Coefficients 429/4,1648/17,139, at most 109.625; limit 47; M²N=16φ−56W | Algebra correct; depends on S01 and the corrected §10.10 identity |
| 13.5: function-field comparison | h=1,δ=ε=0; coefficient A=139 | W=12, 1/12≤12≤12; 12/139>1/12 since 144>139 | Claimed coarser bounds follow |
| 13.6: Wilms δ lower bound, g≥1 | g=1,2; Jensen coefficient | Bounds ≈−10.5441,−21.0883; 6g log2−8g log(2π)=−2g log(2π⁴) | Strict lower bound and factor g agree |
| 13.7: Bost adapter and positive comparison height | g=1; h at lower bound and h=1 | Shift logπ/2≈0.572365; lower h=−1.491303; c≈2.491303 gives h+c=1; h=1 gives 3.491303≥1 | Faltings/Deligne shift necessary |
| 13.8: coercive arithmetic divisor | K₄ with six unit edges, c=17/288 | δ=6,φ=17/48,ε=11/6; D=107/48; D−δ=−181/48<0; D−cδ=15/8>0 | Corrected boundary coefficient survives negative control |
| 13.9: number-field comparison, g>1 | Log constants at g=2; coefficient bound | 4log(2π⁴)+8log(2π)=12log(2π²); 139+7/2=142.5<144 | Degree normalization and coarse coefficient agree |
| 13.10: uniform fixed-genus comparison | h≤1; h≥max(1,24abs(c₅)); function-field g=2 | max(h,1)=1; h/12+c₅≥h/24; c₃=4⁻¹⁶/12>0,c₄=12 | Constant independent of field; nonisotriviality needed geometrically |
## Verified sound

Read all 2,129 README lines and all 73 Suggested.lean lines. Inventory: **94 numbered targets**, **382 Check bullets read**, **94 grouped instance calculations** above, **0 Lean declarations**, **16 previous finding IDs revisited** (including the duplicate pairing finding), **11 named roadmap supplier contracts inspected**, **2 declared gap contracts matched**, and **18 readable source-locator groups inspected** below. The successful calculations establish the stated examples and normalization comparisons; they do not certify every proof of the general results.

The acceptance-test inventory has zero declaration rows: there are no definitions, instances, section variables, theorem binders, universe binders or admitted data to elaborate. No `#check @name` scratch elaboration is applicable. No Lean command was run. Suggested.lean uses one `import Mathlib`, its required namespace and a single module docstring. It contains no `lemma`, `set_option`, padding or replacement scalar theorem.

| README headline | Location | Statement boundary at the current pins |
|---|---|---|
| Metrized Deligne pairing, continuity and functoriality | §§0.2, 3.2–3.3 | Missing metrized relative-pairing carrier; named in docstring |
| Arbitrary-base adelic realization and full faithfulness | Layers 1–2 | Missing boundary-completed divisor/bundle carrier and analytic realization; named |
| Hilbert–Samuel, Siu, height and fundamental inequalities | §§4.2–4.8 | Missing adelic volume, intersection and height carriers; named |
| Invariant extensions, nondegenerate equidistribution, Hodge-height identity | Layer 5 | Missing relative metrized bundle, canonical measure and stable-height carriers; named |
| Moriwaki height machine, Northcott, canonical kernel and specialization | Layer 6 | Missing arithmetic polarization/intersection heights; named |
| Local Calabi, admissible extensions and both Hodge-index statements | Layers 7–8 | Missing curve metrics, local intersections and adelic pseudo-effectivity; new §8.8 is explicitly named |
| Theta identities and canonical nefness | Layer 9 | Missing metrized theta/admissible pairings; named |
| Graph inequalities, global divisors, Gross–Schoen height | Layer 10 | Missing polarized resistance graph, Green kernel and cycle-height carriers; named |
| Uniform archimedean φ positivity and canonical/pairing bigness | Layer 11 | Missing φ and adelic nef/big carriers; named |
| Potential bigness, grid degree bound and theta applications | Layer 12 | Missing relative adelic pairings; ordinary schemes alone do not provide the grid bound's mixed intersection degree; named |
| Canonical-square bounds and uniform stable-height comparison | Layer 13 | Missing admissible intersections, local invariants and stable Faltings height; named |

No statable headline was found missing. Pin searches by object, including adelic line bundles, metrized graphs, Deligne pairings, Moriwaki, Gross–Schoen and Faltings height, found no implementation of these missing carriers. The native algebraic carriers do not supply their analytic data.

The pins actually inspected are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`, as recorded in the current content manifest, rather than the pins in the earlier reports. Seven explicit library declaration citations were checked:

| Pinned declaration | File and evidence |
|---|---|
| NumberField.prod_abs_eq_one | Mathlib/NumberTheory/NumberField/ProductFormula.lean:98. Explicit x≠0 and infinite-place multiplicities. At x=2 over ℚ, 2·(1/2)=1; x=0 is excluded. |
| Projectivization.logHeight | Mathlib/NumberTheory/Height/Projectivization.lean:51. Field, AdmissibleAbsValues and finite index type; quotient of nonzero tuples. Values log 2 and 2log 2 over degree-one/two number fields remain relative. |
| InvertibleSheaf | TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:112. Full subcategory of locally free rank-one sheaves; morphisms are module maps. Zero endomorphism is admitted as a morphism but is not an isometry; no metric field exists. |
| AbelianVariety | TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95. Group object, proper structure map and geometric integrality; no metric. Dimension-zero identity object is allowed, square-zero thickening fails geometric integrality. |
| InvertibleSheaf.eulerDegree | TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:70. Difference of Euler characteristics truncated at 2; no automatic curve hypotheses. Trivial line degree 0; the README does not treat arbitrary junk values as arithmetic degree. |
| LineBundleClass.eulerDegree | TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:126. Isomorphism-invariant quotient of that same invariant; trivial class still has degree 0. |
| InvertibleSheaf.eulerDegree_canonicalBundle | TauCeti/AlgebraicGeometry/LineBundle/SerreDuality.lean:168, context :49. Integral, Noetherian, separated, codimension-one DVR stalks, valuative existence, coheight bound, function field, relatively closed constants and properness are retained. Values 0 and 2 at genus 1 and 2. |

The following current supplier interfaces were read by section, including normalization comparisons. Ownership searches used the roadmap search service, the supplied open-head checkouts, main (including Completed), and board packages. There is no duplicate Lean fully qualified name because this acceptance test declares none. The local Calabi extension, arbitrary-base completion and higher-dimensional adelic Hodge-index inequality have no competing owner located by object searches; the package owns those extensions. Ordinary projective arithmetic intersections, positive local measures, graph calculus, basic heights and algebraic Jacobian data are imported rather than restated as new owners.

| Supplier contract | Resolved section scope and computed compatibility |
|---|---|
| ArakelovGeometryAndAbelianHeights | §§1.1–1.3, 1.7–1.10, 1.12–1.15, 2.1, 2.7–2.8, 3.4, 5.0b, 5.3–5.4, 6.5. Squared versus unsquared Green values 2 versus 1 give the same degree 1. Faltings/Deligne height shift is g log π/2. |
| HeightsRationalPointsAndObstructions | §§0.11, 0.16, 0.18–0.20, 0.26–0.29, 5.17a–b, 5.17d–f. Raw degree log q, FS square 1/2; relative point height 2log 2 becomes absolute log 2 over degree two. |
| ArithmeticDynamics | §§4.1a, 4.3, 4.3a, 4.4, 4.40. O(2) curvature mass 2 is divided by degree 2 to probability mass 1. Genericity is a hypothesis; a repeated point has height 0 but is not generic on ℙ¹. |
| SchemeAndStackFoundations | §§0.3, 0.20–0.21, 3.5, 4.11–4.13, 5.1–5.3, 5.5–5.6, 5.10, 5.12. Finite flat norm degrees 2 then 3 give 6; inseparable fundamental degree is 2, not 1. The newly cited Bertini input fails the scope test in S01. |
| ComplexComparisonPartII | §C5.4 has smooth current calculus, analytic cycle integration and Chern/Poincaré–Lelong normalization. FS masses 1 and 2 agree. Singular nonlinear products remain precisely the declared gap. |
| TropicalAndBerkovichArithmetic | §§0.1, 0.12, 0.15, 0.22–0.23, 2.7, 2.13, 3.1, 3.3, 6.1–6.4, 6.6–6.8. Unit banana density 1/3 sums to 1; Δ has positive energy and curvature −Δ. Unit-loop τ=1/12 becomes 1/6 only upon ramified renormalization. |
| GrossZagierAndArithmeticHeights | §§2.2–2.4, 2.8, 2.10, 2.12–2.13. Unsquared mean-zero Green kernel, residue norm 1; canonical degree 2 at genus 2. Relative Faltings–Hriljac value −4a becomes absolute −2a over degree two. |
| JacobianChallengePartII | §§1.2–1.4, 2.2, 2.4–2.7, 3.1, 3.3–3.13, 4.5–4.9, 5.1–5.2, 6.3. Elliptic twice-theta degree +2 versus diagonal Poincaré degree −2; actual Picard/Brauer qualifications retained. Field-valued degree-one theta data does not replace the new relative arbitrary-degree calculation. |
| StableReductionPartII | Declared MC.4–MC.6 gap, not falsely certified as existing. Node thickness 1→2 under ramified degree two, and 1→1 under unramified degree two; finite inseparable descent is explicitly requested. |
| NeronModelsAndSemistableAbelianVarieties | §§3.3, 3.9–3.12. Tate component order n→en, identity special fibre Gₘ→Gₘ; full Néron-model base change is not imported. |
| MotivesAndAlgebraicCycles | §§2.2–2.3 provide chosen Weil cohomology and the cycle-class kernel, with geometric base change. Modified diagonal has class 0; a curve's fundamental class does not. These sections do not supply the stronger proof inputs discussed in S04. |

Both gap slugs, named suppliers and needs sentences agree between design/plan.json and README lines 95–119: `singular-pluripotential-products` and `curve-moduli-noether-positivity`. Their analytic and curve-moduli hypotheses and requested interfaces are explicit. Their absence from today's supplier is not reported as a defect. The current citation resolver's only unresolved roadmap lead is StableReductionPartII MC.4, covered by that declared gap. The resolver reports that it cannot inspect the libraries; the separate pin inspection above supplies that part of this review.

Dependency check output:

```text
depcheck: 184 roadmaps, 1205 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. This does not detect the narrower statement behind the valid supplier edge in S01. Read-only `git diff --stat origin/main...HEAD` listed 11 changed files, all inside this package; no out-of-folder modification was found. Source records have stable keys and version notes. No computational algorithm, PR-number reference or process narrative was found in the reviewed README or Lean file.

| Readable source-locator group | Text inspected and conclusion |
|---|---|
| yuan-2026 | Lemma 2.1 at line 863; §§2.2.3–2.3 at lines 1081, 1130, 1180, 1239; §§3.3.1–3.3.5 at lines 1642, 1697, 1795; potential bigness at 2020; Lemma 4.3 at 2235; Theorem 4.5 at 2319; Theorem 4.11 at 2871; Remark 4.12 at 2972; boundary estimate at 3195; Appendix A at 3531, 3830, 3956, 4017. Repaired source-normalization mistakes are recorded below. |
| yuan-zhang-2025 | Definitions/realization at lines 750, 805, 1298, 1413, 1508, 1759, 2417, 2603, 2649, 2878; intersection/Deligne statements at 3854, 3943, 3981, 4256, 4920; volumes/heights at 5121, 5439, 5460, 5747, 5821, 5945, 6219, 6396; mass at 6767; Hodge line at 7012; invariant extensions at 7304; nondegeneracy at 7542; Hodge index at 8311 and 8381; local inequality at 9945. S02 is a dropped source hypothesis. |
| yuan-2008 | §1.3 geometric Siu at line 198; Theorem 2.2 at 221; Theorem 2.3 at 380 and Corollary 2.4 at 388. The later Yuan–Zhang statements supply the continuous adelic generality. |
| moriwaki-2000 | Definition 3.3.6 at line 641; Proposition 3.3.7 at 648; §3.4 and Proposition 3.4.1 at 693–712. The package retains ampleness and symmetric-bundle hypotheses missing from some printed subsidiary assertions. |
| gao-habegger-2019 | Appendix A.1 at line 2530, Proposition A.1 at 2556 and its proof at 2574, canonical limit at 2583. The package uses projective normal polarization models and an ample comparison height. |
| demarco-mavraki-ye-2026 | §4, lines 659–686: nonzero top-power measures, positive constants and dense-open height inequality. This is an application, not an independent source for the arbitrary-base theorem. |
| zhang-2010 | Theorem 1.3.1 at line 206, local graph term at 233, and Proposition 2.5.3 proof at 1231–1295. The spectral basis correction agrees with the curvature expansion. |
| cinkir-2011 | Theorems 2.9–2.12 at lines 177–215. The graph inequality is characteristic-free; the arithmetic conclusion of Theorem 2.12 separately assumes characteristic zero. The package does not use that latter conclusion in positive characteristic. |
| baker-rumely-2007 | Theorem 14.1 and formula (14.1) at lines 1906–1925, Lemma 14.4 at 1953 and length homogeneity at 1963. The canonical measure may have negative atoms; the admissible probability is a different measure. |
| de-jong-2018 | Theorem 8.1 at line 1299 and its cubic expansion; Proposition 9.2 at 1508; Theorem 9.4 at 1580. In particular δ+ε−2φ=(3/2)δ−6τ. |
| wilms-2017 | Theorem 1.1 at line 31, genus-one convention at 37, Corollary 1.2 at 44; curvature (2.9), φ integral and positivity at 500–517. The repaired (i/2)-basis convention gives coefficient 1/(2λ). |
| wilms-2022 | Theorem 1.2 at line 121; its proof's arithmetic Hodge-index input. Number-field and semistability hypotheses are explicit; the function-field branch has a separate source. |
| looper-silverman-wilms-2021 | Proposition 6.1 and its proof at lines 695–762: M·N=0, N²=8g(g−1)³, and the arithmetic Hodge-index application. The new §13.4 expansion agrees numerically. |
| stacks-pullback | Tag 0E0L at line 3679: proper, flat, finite presentation, geometrically reduced connected fibres. The reducedness qualifier in §3.4 is essential. |
| wazir-2006 | Height machine at lines 97–139; canonical-height assertions at 142–151; Theorems 0.2–0.3 at 170–183. The roadmap adds the necessary ample comparison and symmetric canonical-height hypotheses. |
| cinkir-2015 | Type XIV at lines 780–788; concluding bounds at 1051–1071. For unit K₄, δ=6, φ=17/48, ε=11/6; the package's weakened boundary coefficient survives this test. |
| gaudron-remond-2014 | Definition 2.1 and Faltings-normalization comparison at lines 305–325, Corollary 8.4 at 2177. The lower bound is for h_Del, requiring the shift before use with h_Fal. |
| gross-schoen-1995 | Proposition 3.1 at line 193, Proposition 4.8 at 310, §6 heading at 367, Proposition 7.2 at 657, Lemmas 7.6–7.11 at 713–825, §8 at 874. The source's finitely generated residue-field hypothesis and cohomological inputs are the issue in S04. |

## Not verifiable

- `moret-bailly-1989`, Théorème 2.5, pp. 491–498, and `faltings-1984`, Theorem 6 and pp. 401–402, remain the two settled **uncertified** source entries. Their inaccessible texts were not requested again. Wilms' readable δ formula checks the numerical normalization independently, but does not certify those original passages.
- The two declared supplier gaps remain contracts rather than implemented or presently supplied theorems. This review is conditional on fulfillment of their exact stated interfaces.
- The full arithmetic hyperplane-restriction argument in §8.8 is not proved by the cited geometric Bertini assertion. The new proof route must account for arithmetic metric/restriction terms as well as the repaired geometric input; the inspected Yuan–Zhang Theorem 6.5.8 states the result and refers to earlier work for its proof. S01 identifies a directly verifiable missing input without certifying the rest of that induction.
- The numerical-extension construction in §10.10 is not certified over arbitrary constant fields merely by the available Gross–Schoen proposition; S04 identifies the needed descent and proof-input accounting. No general Beilinson–Bloch pairing is being assumed as an existing pinned theorem.
- No elaboration/build or execution of the planned theorems was performed, as required by the read-only brief. The empty declaration inventory makes the requested elaborated-signature comparison vacuous, not a successful compilation claim.

## Source issues

- **Error** in yuan-2026 at Lemma 2.1(1), printed p. 25 (yuan-2026 line 863): the source says geometric connectedness suffices for integral Picard pullback injectivity; it should be strengthened by geometric reducedness, since elliptic Frobenius kills nonzero p-torsion line bundles; affects a stated result.
- **Gap** in yuan-zhang-2025 at Lemma 3.1.1(1), printed pp. 67–68 (yuan-zhang-2025 line 2417): the source says divisorial valuations are dense without a dimension-zero exception; it should be supplemented by the trivial-valuation case, since Spec 𝔽₂ has one analytic point and no prime divisors; affects the proof.
- **Misprint** in yuan-zhang-2025 at §3.2, printed p. 72 (yuan-zhang-2025 line 2632): the source says the metric associated to Green function g is exp(−g/2); it should be exp(−g), inverse to the immediately stated −log norm convention; affects a stated result.
- **Misprint** in yuan-2026 at §2.2.3, printed p. 32 (yuan-2026 line 1100): the source says a pairing on X is added directly to the base class (2g−2)β₂; it should be added to its pullback (2g−2)π*β₂; affects the proof.
- **Gap** in yuan-2026 at proof of Theorem 2.3, §2.2.3, printed p. 32 (yuan-2026 line 1103): the source says the displayed condition determines β₂ for every positive genus; it should be given a separate positive-degree normalization when g=1, since its coefficient 2g−2 is zero; affects the proof.
- **Gap** in yuan-2026 at proof of Theorem A.1, §A.4, printed p. 113 (yuan-2026 line 3830): the source says taking L=ω proves the required Green-mean normalization; it should be replaced by a positive-degree admissible L in genus one, since c₁(ω)=0 there; affects the proof.
- **Error** in yuan-2026 at §3.3.1, printed p. 49 (yuan-2026 line 1660): the source says node count after a splitting extension is divided by its field degree; it should be divided by ramification index for unit-uniformizer normalization; an unramified quadratic extension does not halve the length; affects a stated result.
- **Misprint** in yuan-2026 at §3.3.1, printed p. 49 (yuan-2026 line 1671): the source says the spectral coefficient is 2/λ for an (i/2)-orthonormal basis; it should be 1/(2λ) for that basis and the displayed Laplacian; affects a stated result.
- **Misprint** in zhang-2010 at Theorem 1.3.1, printed pp. 6–7 (zhang-2010 line 215): the source says the spectral coefficient is 2/λ with an (i/2)-normalized holomorphic basis; it should be 1/(2λ), or retain 2/λ and use the i-normalization of Proposition 2.5.3; affects a stated result.
- **Misprint** in zhang-2010 at Proposition 2.5.3, printed p. 38 (zhang-2010 line 1238): the source says both factors of the second mixed curvature term are evaluated at y; it should be ωᵢ(y)∧ω̄ᵢ(x), as the following expansion requires; affects the proof.
- **Misprint** in yuan-2026 at §3.3.2, printed p. 50 (yuan-2026 line 1709): the source says the diagonal-square integrand is integrated over the curve fibre; it should be integrated over the fibre of X×ₛX; affects a stated result.
- **Error** in yuan-2026 at proof of Theorem 4.14, printed p. 94 (yuan-2026 line 3208): the source says D̃−Δ̃ is effective; it should be D̃−c(g)Δ̃, as the next page proves; unit K₄ gives D̃−Δ̃=−181/48; affects the proof.
- **Error** in moriwaki-2000 at Proposition 3.3.7(4), printed p. 15 (moriwaki-2000 line 654): the source says a big polarization gives Northcott finiteness for arbitrary L; it should be restricted to ample L; O on ℙ¹ gives infinitely many degree-one points of height zero; affects a stated result.
- **Misprint** in moriwaki-2000 at §3.4, printed p. 16 (moriwaki-2000 line 701): the source says the linear part is lim 2⁻ⁿ(2⁻²ⁿh(2ⁿx)−q(x,x)); it should be lim 2⁻ⁿ(h(2ⁿx)−2²ⁿq(x,x)); the printed limit annihilates the linear part; affects a stated result.
- **Gap** in gao-habegger-2019 at Appendix A.1, printed p. 54 (gao-habegger-2019 line 2533): the source says a quasi-projective arithmetic model with hermitian bundles specifies a Moriwaki polarization; it should be a projective normal model, or include projective extension data before taking arithmetic intersection degrees; affects a stated result.
- **Misprint** in baker-rumely-2007 at Theorem 14.1(A), printed p. 36 (baker-rumely-2007 line 1907): the source says μ_can is a probability measure; it should be a possibly signed measure of mass one; formula (14.1) assigns mass −1/2 to a trivalent vertex; affects a stated result.
- **Error** in wazir-2006 at Proposition 0.2(3), printed p. 3 (wazir-2006 line 105): the source says Northcott finiteness holds for every line bundle; it should be restricted to ample line bundles; the trivial bundle on ℙ¹ has infinitely many bounded degree-one points; affects a stated result.
- **Misprint** in wazir-2006 at proof of Proposition 0.2, printed p. 3 (wazir-2006 line 121): the source says successive proof paragraphs establish properties numbered one above the displayed properties; it should be renumbered to match Northcott (3), functoriality (4), domination (5), and the ratio limit (6); affects nothing.
- **Error** in wazir-2006 at Proposition 0.3, printed p. 4 (wazir-2006 line 148): the source says canonical heights of all ample line bundles are nonnegative; it should be restricted to symmetric ample bundles; for L=t_Q*Θ, the usual canonical height at −Q is −ĥ_Θ(Q)<0; affects a stated result.
- **Error** in wazir-2006 at Theorem 0.2, printed p. 4 (wazir-2006 line 170): the source says any base line bundle M bounds the specialization height error; it should be ample; for E×ℙ¹ and L=pr_E*Θ+pr_base*O(1), the zero-section error is unbounded while h_O=O(1); affects a stated result.
- **Error** in cinkir-2015 at concluding inequalities (7)–(8), printed p. 18 (cinkir-2015 line 1058): the source says the rational inequalities hold for all six nonnegative inputs; it should be restricted to C>0 or stated after clearing denominators; six zero inputs give C=0 and undefined fractions; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c9ce4b5bb7840dbea7bc53c828b00024ff225f9f", "job": "RT-ArakelovGeometryAndAbelianHeightsPartII~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
