# Review of GrossZagierAndArithmeticHeights (pull request #1487 at ab88199)

**Verdict:** needs changes

## R01 (P1) — Import the classical Gross–Zagier formulas from their earlier owner

**Location:** `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:9`, with the repeated targets at lines 5061 and 5133 (§§8.15, 8.19).

**Claim:** The scope paragraph excludes EffectiveClassNumbers §2.8 as a supplier because this roadmap gives the classical formulas a kernel/local-height proof. It explicitly assigns their odd-discriminant, conductor-one cases and quotient-polarization comparison to this roadmap again.

**Witness:** `TauCetiRoadmap/EffectiveClassNumbers/README.md:658` (§2.8, supplied head) already owns the class-character formula, elliptic formula, quotient-polarization comparison and H/K height conversion, with the same hypotheses and constants.

This is an ownership conflict, not a disagreement about the formulas. A different proof route does not confer ownership of an earlier roadmap's theorem. At c=1, odd D, split level and trivial character, both specifications give the coefficient `8π²(f,f)/(deg(φ)u²√|D|)` multiplying the K-relative elliptic height. The class-character formula over H differs only by the explicitly supplied factor h(K).

**Exact repair:** Import the classical statements and the quotient/relative-height comparisons from EffectiveClassNumbers §2.8. Remove the assertion that the choice of proof route makes them owned targets here. Keep §8.6's stronger coefficient identity and the genuinely extended conductor, even-discriminant and ramified-level statements, explicitly distinguishing their extra content. The imported classical theorem can serve as a compatibility test for those constructions. At D=−7, c=1, h=u=1, μ=0, this repair preserves the coefficient `8π²(f,f)/(deg(φ)√7)`; replacing φ by [2]φ still multiplies numerator height and denominator degree by 4.

## R02 (P2) — Use the regulator supplier's arbitrary-reduction comparison

**Location:** `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:136`, line 5293 (§9.5), and its *Needs* line at 5315.

**Claim:** The contract restricts PadicHodgeRegulators §1.9 to good reduction and assigns the general abelian exponential/Kummer comparison, with arbitrary reduction, to §9.5.

**Witness:** `TauCetiRoadmap/PadicHodgeRegulators/README.md:605–629` (§1.9, supplied head) explicitly treats abelian varieties with no reduction assumption, their Kummer logarithms, and isogeny/quotient naturality; it includes the same Tate-curve normalization.

**Re-raised: r2b F02 in FIX-RT-GrossZagierAndArithmeticHeights~2.** That repair report's reason was that the alleged supplier copy was unavailable and §1.9 could not be checked. This brief supplies that head, and its §1.9 is readable. The former availability objection therefore no longer establishes a supplier gap. The package's `design/plan.json:16–19` also still asks for this supplied comparison under `point-kummer-logarithm`.

**Exact repair:** Cite §1.9 for arbitrary-reduction abelian point classes and remove that general comparison as a construction owned by §9.5. Retain the p-new residue relation, cusp-normalized primitive, Castella comparison and root interpolation. Reconcile the now-redundant `point-kummer-logarithm` gap with that exact supplier contract. This is not a request to assume equality of local conditions for arbitrary semistable representations.

For the nonelliptic test A=E₅×E₅ over ℚ₅, with Tate period 5 on each factor, the supplier sends ([6],[36]) to (55,110) modulo 125 in the chosen tangent coordinates. Projection to the first factor gives 55, not 40. Replacing [6] by [30] gives the same point and logarithm. Importing the supplied comparison therefore covers the arbitrary-reduction instance that the current contract incorrectly excludes.

## R03 (P3) — Name the coherent Waldspurger headline in the module docstring

**Location:** `TauCetiRoadmap/GrossZagierAndArithmeticHeights/Suggested.lean:11–22`.

**Claim:** The docstring enumerates the unstatable headline families, but omits the coherent complex Waldspurger period formula. A p-adic special-value formula and a Gross–Zagier derivative formula do not name that central-value theorem.

**Witness:** `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:1561` states the general coherent toric-period product identity as the principal result of §5.3; Suggested.lean neither states it nor names its missing carriers.

**Exact repair:** Add §5.3's coherent Waldspurger formula to the docstring's unstatable-headline inventory, identifying the quaternionic automorphic representations, normalized toric periods and associated L-functions it needs. Include §5.2's half-weight central-value comparison in that inventory as well. Do not add scalar stand-ins. This keeps the existing period normalization: multiplying the two vectors by 2 and 3 multiplies both sides by 6, and replacing probability periods by volume-4 periods multiplies their product by 16.

## Verified sound

The evidence below supports the individual checks listed here. It does **not** certify every mathematical assertion in this 290-target README; the limits are recorded under Not verifiable. There are three findings: two blocking findings, one P1 and one P2, and one P3 docstring omission. Neither requires changing the mathematical scope of the whole roadmap, so the verdict is needs changes rather than rejected.

**Gate and scope.** The reviewed Git head is ab8819924d09f0b1db3841ea07358f70222e494c. The diff outside this roadmap folder is empty. The worker's gate reports every scanner, metadata, dependency, cleanliness, outside-folder and targeted-build check passing, including zero sorry-data, set_option, stray-files and import violations. Independent direct elaboration of Suggested.lean succeeded with the single expected sorry warning. No pull-request file was changed.

The requested dependency command returned:

```text
depcheck: 204 roadmaps, 1615 edges, 0 problem(s)
```

There were no UPWARD, CYCLE or moved lines. A separate traversal of explicit internal target links found 290 targets and no directed cycle. That traversal does not prove the absence of implicit mathematical prerequisites. I read the normative repository README and CONTRIBUTING, and compared the main-branch AlgebraicCurves and AlgebraicVectorBundles roadmaps for shape.

**Lean acceptance test and headlines.** Suggested.lean has one theorem, `TauCetiRoadmap.GrossZagierAndArithmeticHeights.canonicalHeightRat_exists_unique`, at line 39. Its elaborated signature retains the field, admissible absolute values, decidable equality, affine Weierstrass curve and ellipticity assumptions. It extends the native integer-quadratic height to the actual rational tensor product; it is not a theorem on an unrelated free scalar. The scalar-first tensor order agrees with README §0.2 after tensor commutation.

On a scratch copy, single-tactic attempts using `simp`, `rfl` and `infer_instance` did not close it. `#check @...canonicalHeightRat_exists_unique` retained all the binders above. Mathlib's quadratic base-change extensionality proves uniqueness once an extension exists; its ring-valued base-change construction does not directly supply this ℝ-valued extension of a ℤ-quadratic map. I found no one-lemma exact proof in the declarations inspected. Thus this check produced no padding finding; the failed probe is not a proof of mathematical depth.

The README's principal results are the rational height extension (§0.2); Poincaré/coefficient heights and Faltings–Hriljac (§§1–2); rational strict-GL₂ realizations (§3.4); coherent Waldspurger comparisons (Layer 5); the projected arithmetic kernel identity (§8.1) and classical coefficient identity (§8.6); YZZ/CST and ring-class/elliptic Gross–Zagier (§§8.11, 8.14–8.19); and the p-adic analytic-subgroup, eigenlogarithm and BDP/Brooks/Castella comparisons (§§9.2, 9.5, 9.11–9.21). The module docstring names the missing arithmetic models, CM points, Jacobians, cohomological realizations, kernels, L-functions, CM measures and logarithm interfaces for the broad headline families it omits. General abelian varieties themselves **do** exist at the Tau Ceti pin; their existence alone does not supply these comparisons. I did not establish a missing statable headline. The coherent central-value family is not separately enumerated in the docstring; this is R03.

**Pinned declarations opened.** Paths here are relative to the respective pinned library roots.

| Library declaration | File and line | What was verified |
|---|---|---|
| `WeierstrassCurve.Affine.canonicalHeightQuadratic` | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:341` | Actual ℤ-quadratic map, with ellipticity; not a rational tensor extension. |
| `canonicalHeightQuadratic_apply` | Same file, line 350 | Evaluation is `Point.canonicalHeight`. |
| `neronTatePairing`, `neronTatePairing_apply`, `neronTatePairing_self` | Same file, lines 368, 378, 384 | Half polarization; diagonal equals the canonical x-height. |
| `QuadraticForm.baseChange`, `baseChange_tmul` | `Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:127`, line 131 | Base change of a ring-valued quadratic form. |
| `QuadraticMap.baseChange_ext` | Same file, line 158 | Agreement on 1⊗m gives equality; it asserts no existence. |
| `Complex.Gammaℂ`, `Gammaℂ_def` | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:53`, line 55 | Factor 2 in `2(2π)^(-s)Γ(s)`. |
| `NumberField.instAdmissibleAbsValues`, `totalWeight_eq_finrank` | `Mathlib/NumberTheory/Height/NumberField.lean:77`, line 157 | Infinite-place multiplicities and total weight [K:ℚ], not absolute normalization by division. |
| `EisensteinSeries.hasSum_qExpansion_E2` | `Mathlib/NumberTheory/ModularForms/EisensteinSeries/E2/Summable.lean:107` | Holomorphic E₂ has constant coefficient 1 and positive coefficients −24σ₁(n); the nonholomorphic correction is additional. |
| `AbstractMeasure.amiceTransform`, `amiceTransformEquiv` | `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean:76`, line 157 | General coefficient-ring forward transform; the displayed inverse equivalence is specifically for ℤ_p coefficients. |
| `CuspForm.peterssonInnerCosets_eq_peterssonInner` | `TauCeti/NumberTheory/ModularForms/Petersson/Adjoint.lean:351` | Actual coset-domain integral, with the central quotient retained. |
| `CuspForm.peterssonInnerCosets_self_re_nonneg`, `peterssonInnerCosets_self_im` | `TauCeti/NumberTheory/ModularForms/Petersson/FiniteIndex.lean:286`, line 296 | Nonnegative real self-pairing and zero imaginary part. |
| `AbelianVariety` | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | A native abelian-variety carrier is present; the search must not confuse missing arithmetic comparisons with absence of abelian varieties. |

These are 19 named declarations, counting the three pairing declarations separately. Object searches covered quadratic maps and tensor extension, canonical/Poincaré heights, CM/Heegner points, Jacobians, modular/Shimura curves, Rankin functions, abelian varieties and p-adic logarithms. Filename hits for elliptic “Jacobian” coordinates were not treated as Jacobian varieties.

**Ownership and supplier checks.** The concrete conflicting contracts resolved at the supplied heads are EffectiveClassNumbers §2.8 (lines 639–675) and PadicHodgeRegulators §1.9 (lines 605–629). TropicalAndBerkovichArithmetic §6.6 (line 2204), §6.7 (line 2239) and §6.8 (line 2279) were also opened: they supply the positive-genus admissible measure, normalized Green kernel, model-potential approximation and curvature/sign comparison. In particular, genus one and the metric rescaling are present; §2.3 should consume those objects. The four design-gap entries were read; no `gap:` slug occurs in the head README. This means the old gap list cannot itself certify the head's present supplier contracts.

The citation resolver reports no cross-roadmap citation found nowhere. Its seven Lean-name leads are supplier-interface names, not seven missing imports in Suggested.lean. I did not turn that scanner output into seven findings. `roadmaps grep` and `roadmaps show` were used for the ownership searches; a name match in an unprovided or revised open head was not treated as verification of the allowed main/supplied-head version. The two concrete ownership findings above rely on files explicitly supplied in this brief. Exhaustive resolution of the remaining supplier interfaces is a limit below.

**Seeded source sample.** All 15 requested targets were examined against the available extracted texts, with the following distinctions. Printed page numbers, rather than extraction page markers, are used.

| Target | Source text opened | Result and limit |
|---|---|---|
| 2.5 Finite-place Néron symbol | gz86 line 151, I §4 (4.1), p.228; line 1065, III introduction (0.1), p.252 | The negative intersection sign and degree-zero symbol agree. Extension normalization was also checked on a ramified quadratic change. |
| 6.32 Trace cosets | gz86 line 1934 and lines 2010–2014, IV §2, p.276 | The residue is c* d with c* an inverse. README §6.14 already defines c*. It is not the noninvariant product cd. |
| 6.40 Pseudo-theta reduction | yuan-zhang lines 2059–2127, Lemma 6.1(1), pp.582–583 | Finite nonsingular pseudo-theta sum and automorphy are present. README excludes improper truncations and uses positive separating parameters. The source proof issue is recorded below. |
| 6.50 Local derivative/zero term | yuan-zhang lines 2192, 2227 and 2287, §7.1, pp.585–586 | The nonzero Whittaker derivative k and normalized zero-term correction c are different constructions. The logarithmic δ correction is retained. |
| 6.69 Weight-two central value | gz86 lines 2583–2598, IV Theorem (5.6), p.291 | At k=1 the coefficient is 8π²/√|D|, with the endpoint term. This check does not certify the roadmap's separate correction of the higher-weight factorial. |
| 7.6 Order sandwich | yuan-zhang lines 2597–2605, Lemma 7.3, p.592 | The discriminant sandwich is the cited assertion; unit discriminant gives equality. Odd ramification and a dyadic example distinguish it from equality in general. |
| 7.14 Split vertical correction | yuan-zhang lines 4087–4094, §8.3, p.621 | The vanishing uses the specified Q′/maximal-level setting and the component argument. It is not a general assertion at arbitrary split level. |
| 7.22 CM reduction component | gz86 lines 1235–1244, III Proposition (3.1), p.256 | The two conjugate primes select connected versus étale cyclic kernels and the opposite endpoint components. |
| 7.69 Atkin–Lehner invariance | gz86 lines 699–703, II (2.25), p.242 | Simultaneous action on both arguments and normalization of the determinant-m matrices agree. |
| 7.75 Norm-ideal map | gz86 lines 1590–1608, III (9.3)–(9.6), p.265 | The norm equation and nonzero minus-part are present. README separates α=0 from the ideal-class assignment. Bars in the extracted connecting-ideal formula are poorly resolved; I did not independently certify its source erratum. |
| 8.3 Global sign | zhang-survey lines 696–710, §4.2, pp.586–587 | The sign is (−1)^#Σ with the central-character condition. The cited YZZ-book location remains waived; the readable survey independently confirms this sign computation. |
| 9.1 Cotangent saturation | jsw lines 1402–1409, Proposition 5.1.7 proof, pp.34–35 | Confirms the ℤ_p, p>2, good-reduction optimal-quotient use of BLR. It does not verify the general-DVR extension; BLR §7.5 Theorem 4(iii), p.187 is settled uncertified. |
| 9.11 Brooks function | brooks lines 1997–2024, Propositions 8.9–8.10, p.4237; burungale lines 1041–1056, Lemma 5.5/(5.8), p.28 | Confirms the square of the full class-group CM sum and continuity. Burungale supplies a measure construction with a different class-group summation convention. The stated normalization comparison remains additional work, not a consequence of continuity. |
| 9.17 BDP weight two | bdp lines 4361–4394, Assumption 5.12/Theorem 5.13, p.1137 | At k=2,r=j=0, the conductor, odd-discriminant, split-good-p and central-critical-family hypotheses are retained. The norm twist cancels the N(a) in the finite sum and produces p⁻¹ in both Euler-factor terms. |
| 9.21 Iwasawa integrality | skinner-published lines 552–585, §2.6, pp.342–343; castella-hsieh lines 670–686, Definition 3.7/Proposition 3.8, p.13; burungale lines 1041–1056 | O^ur, not O, is the coefficient ring asserted by Skinner. His explicit warning that continuity needs a further bounded-measure argument is respected by the roadmap's construction route. The source families' distinct hypotheses must remain attached. |

No literal “unverified” locator flag was found in the README. Waived and uncertified texts were not requested again and no source manifest was edited.

**Computed adversarial witnesses.** The rows distinguish actual arithmetic examples from algebraic normalization tests. A normalization test does not numerically evaluate the global L-function or prove the theorem. “Retain” means that this particular test found no correction; it is not a certification of all inputs. H denotes a canonical x-height, and a formal positive H in a scale test is not an asserted height of a particular point.

| Statement | Instances tried | Values on the two sides / wrong-model value | Result; change |
|---|---|---|---|
| §0.2 and the sole Lean theorem | Rational scalar 0, 1/2, 1, 2; torsion | q(r⊗P)=r²H gives 0,H/4,H,4H; torsion gives 0. Integer restriction at r=1 gives H. | Consistent; retain. |
| §0.1 height polarization | q(n)=n²H, P=Q | (4H−H−H)/2=H=q(P); full polarization gives 2H. Rank-zero determinant=1. | Distinguishes factor 2; retain. |
| §0.3 gamma normalization | s=1 | 2(2π)⁻¹Γ(1)=1/π; omitting 2 gives 1/(2π). At a central zero the completed derivative is √N L′/π. | Retain. |
| §0.4 unit index | D=−7,−4,−3 | Unit counts 2,4,6 give u=1,2,3; u⁻²=1,1/4,1/9. | Retain exceptional units. |
| §§0.5, 0.12 CM action | C₃ class g, N=2, K=ℚ(√−23) | Fricke class 0→−1=2→2+1=0; inverse-convention first image would be 1. | The stated inverse is discriminating. |
| §§0.9, 0.11 trace/field normalization | h=3, point Q | Trace 3Q has height 9H and log 3log Q; H-field/K-field height ratio=3, K/absolute ratio=2. | Different factors must not be conflated. |
| §1.1 Poincaré comparison | Elliptic principal polarization, x=y=P | Pullback polarization gives B_x(P,P)=H; replacing the dual point by its negative gives −H. | Sign test only; retain. |
| §1.2 coefficient trace | M=ℚ(√5), diagonal trace pairing | Trace form on (1,√5) is diag(2,10); dual basis (1/2,√5/10) gives trace 1 on each matching pair and 0 across. | Distinguishes trace recovery from one embedding. |
| §1.5 rational descent | G=C₂, fixed vector x | Tr(x)=2x; (1/2)Tr(x)=x; unnormalized inverse gives 2x. Zero module gives 0→0. | Retain rational averaging. |
| §2.3 admissible graph measure | Genus-one circle length 2; one-point good reduction | μ=ds/2 has mass 1; g(s)=s²/4−s/2+1/6 has mean 0, g(0)=1/6,g(1)=−1/12. Point graph μ=δ_v,g=0. | Agrees with Tropical §6.6; genus-zero division excluded. |
| §2.5 finite Néron symbol | ℙ¹, a=(0)−∞, b=(1)−(p) | Intersection −1 gives +log p; log of f(b)=log(p⁻¹)=−log p gives the same negative-log symbol. Ramified degree 2 gives 2log p/2. | Retain sign and extension denominator. |
| §2.5 vertical correction | Intersection matrix [−2,2;2,−2], corrected section | Adding (1/2)C₁ changes intersection 0 to 1/2; symbol changes 0 to −(log q)/2. | Bare horizontal intersection is excluded. |
| Layer 2 Faltings–Hriljac comparison | Principal divisor and degree-zero class; scale [2] | Principal class height and global pairing both 0; the polarized quadratic scaling is 4 on both sides. | Only principal/scaling probes; no general proof certification. |
| §3.4 strict GL₂ realization | Coefficient degree d=1,2 | Rank-two M realization has ℚ-dimension 2,4, matching 2dim A; M₂(ℚ) has dimension 4 and is not a degree-two field. | Distinguishes strict field condition; not a realization proof. |
| §§3.9, 8.4 differential normalization | ω=2πif dz; φ replaced by [2]φ | iω∧ω̄=8π²|f|²dxdy; C² and deg φ both multiply by 4. | Retain. |
| §5.2 half-weight value; R03 | Half-weight form with squared norm6; scalar2 | Unit-normalized coefficient12 becomes12/6=2; multiplying the form by2 multiplies coefficient norm-square and Petersson norm by4. | Normalization probe only. |
| §5.3 coherent toric pairing; R03 | Two vectors scaled by 2 and 3 | Bilinear toric-product value and invariant-pairing-normalized expression both scale by 6; zero vector gives 0 without dividing by its norm. | Homogeneity probe only. |
| §6.32 trace cosets | D=−7,N=1; rows [1:1],[2:2] | Inverse ratios 1 and 4·2=1 mod7 agree; products 1 and 4 disagree. Coset count 1+7=8. | Retain c* inverse convention. |
| §6.40 pseudo-theta separation | Degree 4; parameters N=±1 | (1+i)⁻⁴=(1−i)⁻⁴=−1/4. For positive distinct N, moduli (1+N²)⁻² are distinct. | Roadmap's positive choice excludes source-proof failure. |
| §6.50 zero-term correction | δ=2, normalized W₀(s)=2⁻ˢa | W₀′(0)=−a log2; adding a logδ gives 0. With a=0 all terms are 0. | Distinguishes normalized zero term. |
| §6.69 weight-two central value | k=1,D=−7,h=u=1 | Prefactor (2π)²·2/√7=8π²/√7; r(0)=1/2 and δ(0)=2 give endpoint product 1. | Retain k=1 coefficient and endpoint. |
| §7.6 integral order sandwich | ℚ₃(√3), ℚ₂(i), split algebra | Odd case lattice upper-right in 3ℤ₃ has index 3; dyadic two parity conditions give index 4; split lattice gives index 1. Multiplication by discriminant 3 or 4 lands in the respective lattice. | Strict inclusion really occurs; retain. |
| §7.14 split vertical term | Q′ disjoint components; degree-zero divisor P−Q on one component | Distinct-component intersection=0; total component degree 1−1=0, so fiber correction pairing=0. | Only the stated maximal-level specialization is tested. |
| §7.22 CM component | K=ℚ(√−7),N=2, conjugate level primes | Connected kernel rank2/étale rank1 gives (1,0); opposite prime gives rank1/rank2 and (0,1). | Retain orientation. |
| §7.69 kernel invariance | N=2, γ=[1,1;2,3] | det γ=1; w₂γw₂⁻¹=[3,−1;−2,1], also determinant1 and lower-left divisible by2. | Retain simultaneous conjugation. |
| §7.75 norm-ideal map | D=−7,N=1,p=3,q=23,a=O,b=j | N(b)=69, N(c)=0,N(c′)=161: 0+3·161=483=69·7. Zero ideal has no class. | Retain separately counted endpoint. |
| §7.81 hyperbolic parameter | D=−4,N=1,τ₁=τ₂=i,γ=[1,1;0,1] | m=1,n=(1−1)²+(1+0)²=1; other norm=(1+1)²+(1−0)²=5=n+4m. | Correct matrix identity; outside odd-D arithmetic scope. |
| §8.1 projected kernel identity | Projection onto first coordinate | I′=(2,7), Z̃=(1,3): projections 2 and 2·1 agree, while 7≠2·3. | Illustrates necessity of projection, not an arithmetic-kernel evaluation. |
| §§8.2, 8.8 character conventions | C₃ over 𝔽₇,ζ=2; trivial C₃ over 𝔽₃ | Sum vector (1,2,4) shifts to (4,1,2)=4v, not 2v. In 𝔽₃, trace of fixed 1 is 0; division by 3 is excluded. | Retain inverse character and invertibility hypothesis. |
| §8.3 global sign | One or two exceptional local signs | Product −1 for one; product +1 for two. Odd incoherent ramification gives −1, whereas even parity does not. | Retain parity and matching hypothesis. |
| §8.6 coefficient identity | T₁=identity, u=1 versus u=3 | ⟨c,T₁c⟩=H requires a₁=H or H/9 respectively under H=u²a₁. | Constant check only; not a Fourier-coefficient computation. |
| §8.7 bilinear coefficient height | L=ℚ(i), B(x,y)=1 | B(ix,iy)=−1; Hermitian extension would give +1. Trace of scalar1 from a quadratic field is2. | Retain bilinear/Hermitian distinction. |
| §8.8 shared marked point | h=3,ψ=[2] | Q→3Q→6Q; heights H→9H→36H; logs l→3l→6l. Basepoint correction hT=3T. | Marking and isogeny factors are necessary. |
| §§8.9, 8.11 YZZ normalization | K=ℚ(i),class number1 | Completed L(1,η)=1/4, volume2L=1/2; volume-scaled height=1/4 of probability height. Finite L-value π/4 gives a different constant. | Normalization probe; book theorem remains waived. |
| §§8.14–8.15 CST/ring-class constants | u=3; one ramified level prime | Unit factor1/9 and ramified factor1/2 give1/18; at u=1,μ=0 both are1. | Retain extra factors; classical ownership is R01. |
| §§8.15, 8.19; R01 | c=1,D=−7,h=u=1,χ=1; φ→[2]φ | Both owners' coefficient is8π²(f,f)/(deg φ√7); height/degree becomes4H/(4d)=H/d. | Exact overlap; import earlier theorem. |
| §8.18 non-torsion/rank implication | Two real coefficient embeddings, each derivative nonzero | Orders1+1=2=dim A; replacing a component by a zero of order3 gives total4, not2. | Checks product-order step only. |
| §9.1 cotangent saturation | ℤ₃, J=A×B with dimensions1,2; ℤ₂ | Ranks1→3→2; quotient free rank2. 3R⊂R has quotient length1. At p=2,e=1, inequality1<1 fails. | Retain bound and saturation distinction; general DVR source uncertified. |
| §§9.2, 9.13, 9.19 eigenlogarithm | E:y²+y=x³−x, P=(0,0),p=11 | #E(𝔽₁₁)=17; t(17P)=5640481/5106896≡22 mod121; log(P)≡22/17=44 mod121≠0. Torsion gives0. | Actual one-dimensional algebraic-point test; no higher-dimensional certification. |
| §§9.5, 9.20; R02 | E₅×E₅,([6],[36]),projection | Logs (55,110) mod125; projection55, sum40. [30]=[6] gives55. | Supplier already covers this arbitrary-reduction test. |
| §9.11 Brooks square | Linear CM values1,2; scaling by2 | (1+2)²=9, not1²+2²=5; scaling gives36. At t_K=2, extra JSW multiplier gives18, not9. | Normalization test; retain full-sum/quotient-sum distinction. |
| §§9.12, 9.16, 9.17 Euler factors | p=5,a_p=±1 at multiplicative reduction; E37 at p=11 | Multiplicative factors4/5,6/5 are nonzero. For E37, a₁₁=12−17=−5; good factor=(12+5)/11=17/11, square289/121. | Retain separate good/multiplicative formulas. |
| §9.17 tame CM hypotheses | K=ℚ(√−7),N=37,p=11,c=1 | Roots of x²+7 modulo37:17,20; modulo11:2,9. Thus both primes split; class number and unit index are1. | Actual admissible scalar-factor test; no full L-value computed. |
| §9.21 Iwasawa-algebra membership | F(T)=1+T and unbounded coefficients5⁻ⁿ | Integral series has coefficient valuations0,0 and F(0)=1; Σ5⁻ⁿTⁿ has valuations−n and is not in O^ur⟦T⟧, despite convergence on a smaller disc. | Analytic continuity alone does not establish bounded coefficients. |

The elliptic logarithm row was recomputed by the rational group law: 17P has coordinates (−239785/2337841,331948240/3574558889). For t=−x/y of valuation 1, the formal logarithm equals t modulo 11², giving the displayed nonzero value. This checks an actual point, unlike the rows explicitly labelled normalization or projection probes.

## Not verifiable

- **Full per-statement adversarial coverage is incomplete.** The table records 44 rows, including all 15 seeded targets, the three findings, and tests of the main headline families. It does not provide a discriminating computed instance for every theorem, API bullet and convention among all 290 targets. In particular, the higher-dimensional realization, global kernel, analytic-subgroup and global L-value identities have only the limited tests identified in their rows. They must not be treated as independently proved or fully red-teamed by this report.
- **YZZ primary text:** `yzz-book` and `yzz-draft` are settled waived. I used their locators and the available CST, Zhang survey and Yuan–Zhang texts where applicable; I did not inspect or request the waived books. The book-only proof inputs, including those indicated in §§7.4 and 7.47, are not text-certified here.
- **General-DVR cotangents:** `blr`, §7.5 Theorem 4(iii), p.187, is settled uncertified. The supplied JSW proof verifies only its ℤ_p application. The arbitrary mixed-characteristic DVR generality in §9.1 is not independently certified by that secondary application. `argos` is likewise settled uncertified and was not requested again.
- **Every supplier citation:** the mechanical resolver found no missing roadmap citation, but this report does not manually certify every section/declaration/hypothesis in the supplier table and all *Needs* lines. Ownership against open work was checked for the explicit conflicts and selected interfaces above, not exhaustively across every supplied sibling. For open work without an authorized supplied copy, no ownership conclusion is asserted. The four CM interface names among the resolver's seven leads remain unconfirmed against an allowed supplier version; no absence finding is based on them.
- **Historical gap bookkeeping:** the four design gaps remain listed while their literal slugs are absent from the head README. The regulator and tropical supplied heads now contain substantial corresponding interfaces. R02 addresses the regulator overlap; the complete reconciliation of all four historical entries, including ideal zeta/genus factorization and the continued E₂ family, is not certified here. No acceptance conditional on an unidentified or assumed gap is being issued.
- **Source corrections beyond the witness below:** several targets explicitly amend source formulas. I did not independently verify every such amendment. In particular, the connecting-ideal bars in gz86 III (9.3)–(9.5) are ambiguous in the available extraction, and the higher-weight factorial amendment is beyond the k=1 seeded check. These were not promoted into source-error findings on the strength of the README alone.

No new unavailable text was requested. All settled waivers/uncertified entries were left settled, and the review is not parked awaiting a source.

## Source issues

- **Error** in yuan-zhang at Lemma 6.1 proof, printed p.583, line 2126: the source says any distinct integer parameters yield an invertible Vandermonde system; it should be distinct positive sufficiently divisible parameters, whose transformed moduli are distinct; affects the proof. For degree four, N=1 and N=−1 both transform to −1/4. The roadmap already uses the positive choice.
