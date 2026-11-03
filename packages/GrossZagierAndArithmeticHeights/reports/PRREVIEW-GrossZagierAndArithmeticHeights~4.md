# Review of GrossZagierAndArithmeticHeights (pull request #1487 at c3a16ba)

**Verdict:** needs changes

## R01 (P2) — Retire the fulfilled regulator gap

**Location:** `packages/GrossZagierAndArithmeticHeights/design/plan.json:16–19`, the active `point-kummer-logarithm` entry. It still requests the nonelliptic point Kummer/exponential/logarithm diagram and the good-reduction finite local Kummer image.

**Claim:** The requested interface is already supplied. The README now consistently imports it, including the repaired References sentence at `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:5715`, but the design still declares it missing. A gap asking for an existing supplier target is P2 under this review's gap rules.

**Witness:** `TauCetiRoadmap/PadicHodgeRegulators/README.md:607–612` supplies the rational Kummer image, de Rham identification, exponential/logarithm comparison and quotient naturality for every abelian variety over a finite extension of ℚₚ, without a reduction assumption.

**Re-raised: r2b F02 in FIX-RT-GrossZagierAndArithmeticHeights~2.** That repair report's reason was inability to inspect an authorized supplier copy. The supplied head is readable; §1.9 explicitly covers the requested interface. The new README attribution itself recognizes this ownership. The former availability reason does not apply.

**Exact repair:** Remove `point-kummer-logarithm` from the active `gaps` array of `design/plan.json`. Keep the existing §1.9 imports and the repaired References sentence. No additional mathematical construction is needed. The slug is already absent from this head's README.

**Repair test:** On the nonelliptic multiplicative variety A=E₅×E₅ with Tate periods 5, the imported logarithm sends ([6],[36]) to (55,110) modulo 125. Projection gives 55, addition gives 40, and replacing [6] by [30] leaves 55. §1.9 covers these examples and good reduction; deleting the redundant gap removes no prerequisite.

## Previous findings

- R01 — partly repaired: README:5715 correctly imports the arbitrary-reduction comparison and leaves §9.5 its modular comparisons. The active point-kummer-logarithm entry remains at design/plan.json:16–19; this report's R01 is the remaining part.

## Verified sound

:robot: AI-assisted incremental re-review of 2 changed lines since d96f687, at head c3a16baec920cacb60d84bbf4a7939f67b375aa0. There is one semantic change: the final supplier/ownership sentence of References. The other sentences, all target statements and Suggested.lean are unchanged. I checked the prior finding, revised attribution, its §9.5 contract and affected consumers, and reran the gate and elaboration. The repair introduces no new mathematical or Lean defect.

**Gate and elaboration.** The head matches the requested commit; the outside-folder diff is empty and the worktree is clean. The independent gate returned:

    gate GrossZagierAndArithmeticHeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

The requested independent dependency check returned:

    depcheck: 204 roadmaps, 1629 edges, 0 problem(s)

No UPWARD, CYCLE or moved line appeared. The separate targeted build of `TauCetiRoadmap.GrossZagierAndArithmeticHeights.Suggested` succeeded (8981 jobs). Direct `lake env lean` elaboration succeeded with only the expected sorry warning at Suggested.lean:43. The worker's supplied gate also records build=0 OK.

A scratch copy with `#check @TauCetiRoadmap.GrossZagierAndArithmeticHeights.canonicalHeightRat_exists_unique` retains K, Field K, Height.AdmissibleAbsValues K, DecidableEq K, W and W.toAffine.IsElliptic. Its unique object is a ℚ-quadratic map on ℚ⊗ℤW.Point with values in ℝ restricting to the canonical height. It matches README:326–332; no binder changed. Scratch one-tactic alternatives simp, rfl and infer_instance fail to close it. The opened base-change declarations below supply no single-lemma existence proof for this ℝ-valued extension.

**Headline inventory retained.** The headlines are the rational canonical-height extension (§0.2); Poincaré/coefficient heights and Faltings–Hriljac (Layers 1–2); strict GL₂ realization (§3.4); half-weight and coherent Waldspurger comparisons (§§5.2–5.3); projected kernels and the classical coefficient identity (§§8.1,8.6); YZZ/CST, ring-class and elliptic Gross–Zagier (§§8.11,8.14–8.19); and analytic-subgroup, eigenlogarithm and p-adic special-value comparisons (Layer 9). Suggested.lean states §0.2 and names the missing carriers for the others in its docstring. This repair changes none of those signatures or omissions.

**Six pinned declarations reopened.** The manifest pins Mathlib at 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Paths below are relative to their library roots.

| Declaration | File and line | Verified content |
|---|---|---|
| WeierstrassCurve.Affine.canonicalHeightQuadratic | TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:341 | ℤ-quadratic, ℝ-valued height; ellipticity required. |
| canonicalHeightQuadratic_apply | Same file:350 | Native point-height restriction. |
| neronTatePairing_self | Same file:384 | Half polarization has diagonal the canonical x-height. |
| QuadraticForm.baseChange | Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:127 | Base change of ring-valued quadratic forms. |
| QuadraticForm.baseChange_tmul | Same file:131 | Pure-tensor scalar is squared. |
| QuadraticMap.baseChange_ext | Same file:158 | Uniqueness from values on 1⊗m; no existence assertion. |

**Affected supplier resolution and ownership.** Roadmaps show and roadmaps grep resolve PadicHodgeRegulators §1.9 at its supplied open head. I read README:605–624 and its §§0.1,1.1–1.3 at :421,447,474,497: these specify homological twists, local conditions, exponential and inverse logarithm. All five regulator section citations used by the changed claim resolve. The de Rham quotient and isogeny/quotient naturality are explicit at :610–612. This is a supplier contract, not a claim that its Lean implementation exists.

The revised sentence agrees with this roadmap's README:94,137,5310–5333. §9.5 owns p-new residue matching, cusp normalization, its Abel–Jacobi comparison and CM root interpolation. Consumers §§9.12 and 9.20 retain their multiplicative and good-reduction hypotheses respectively. ColemanIntegrationPartII §§4.2,4.3,7.2,7.4,7.7 were reopened at README:786,807,1134,1174,1247: smooth-residue comparison, annular valuation correction, proper holomorphic integration, degree-zero divisor evaluation and the corrected Tate logarithm are supplied. Ten affected supplier sections were read in total. General point-comparison ownership stays with PadicHodgeRegulators; the modular specialization stays here.

The resolver rerun found no unresolved cross-roadmap citation. It skipped external Lean-name verification, so its empty Lean-name list is not evidence of existence. The worker's seven CM-interface leads are unchanged and outside this repair. Indexed main/open ownership searches support the regulator attribution; the active board plan supplies the remaining finding. Other ownership results are inherited with [review 3]'s limitations. The normative repository README and CONTRIBUTING were read, and two main-branch roadmap openings (AlgebraicCurves and AlgebraicVectorBundles) were compared. No PR file, source manifest, pin or merge-order file was edited.

**Sources and seeded sample.** The changed sentence introduces no new source locator. Its §9.5 specialization was checked against castella-exceptional line 606–611 (Proposition 2.7, p.13: r=0 primitive normalized at infinity) and line 737–780 (Theorems 2.10–2.11, pp.15–16: squared interpolation and linear AJ formula). At r=j=0, the period exponent is 0 and the factorial/conductor prefactor is 1. The consuming §9.12 formula was checked against castella-multiplicative line 425–455 (Theorem 3.2 and proof, pp.9–10), including the optimal quotient, differential unit and multiplicative Euler factor. The general abelian theorem is consumed from its supplier; its proof is not newly certified here.

None of this round's 15 seeded targets is changed by the final sentence or uses this point-comparison repair as an input. They were not reopened as a full sample. The inherited table includes earlier evidence for §§0.5 and 9.1; the other seeded targets have no fresh certification in this incremental report.

**Computed adversarial table — changed claim and ownership split.** These four rows are fresh computations. They test conventions and the boundary between imported and owned results, not numerical global L-values.

| Statement | Instances tried | Values on both sides / wrong-model value | Result; change |
|---|---|---|---|
| References:5715 arbitrary-reduction import; §9.5; R01 | A=E₅×E₅, P=([6],[36]), periods 5 | log₅(6)=5−25/2=55 mod125; log₅(36)=110. Supplier and imported map give (55,110); a good-reduction-only map excludes A. | Attribution repaired; active gap remains redundant. |
| References:5715 de Rham and quotient naturality | Projection, addition, [6]=[30]; differential scaling 2, AJ value 3 | dpr₁(55,110)=55; dadd=165=40 mod125; corrected log(30)=55; differential pairing gives 2·3=6 on both sides, not 3. | Coordinates and differential conventions agree. |
| References:5715 owned residue/cusp/AJ comparison | F_tail=0,F_head=2,t=1/2; primitive shift 5 | 0+2t=1=2−2(1−t); constant shift changes cusp 0 to 5, but cancels on a degree-zero divisor as 5−5=0. | Supplied integration leaves specified cusp normalization and p-new matching here. |
| References:5715 owned CM root interpolation; §§9.5,9.12 | k=2,r=j=0,p=5,a_p=±1,norm character | Ω_p⁰=1,c⁰/0!=1; root factors 4/5,6/5, squares 16/25,36/25. Replacing both signs by +1 loses 6/5. | Linear root and squared value remain distinct. |

**Unchanged statements carried forward.** The next 56 rows are inherited from [review 3], including its inherited evidence; they are not newly recomputed. The prior row including the changed References attribution is replaced above. Historical repair labels describe the result at d96f687, not extra findings here. H is a formal height variable in scaling tests.

[review 3]: packages/GrossZagierAndArithmeticHeights/reports/PRREVIEW-GrossZagierAndArithmeticHeights~3.md

| Statement | Instances tried | Values on both sides / wrong-model value | Result; change |
|---|---|---|---|

| §8.15 classical compatibility; scope:9 and contract:109 | c=1,D=−7,h=u=1,μ=0 | Both constants are 8π²(φ,φ)/√7; converting H-relative height gives hH/h=H. | Previous R01 repaired; imported classical statement. Historical result from [review 3]. |
| §8.15 new class-number Check | h=3, K-relative height H | Classical expression A·(3H)/3=A·H; average has height H/9, so gives A·H/9. | Finite sum and field conversion agree; averaging fails. Historical result from [review 3]. |
| §8.15 new even-discriminant Check | D=−4,c=1,u=2,μ=0 | 8π²/(2²·2)=π²; u=1 incorrectly gives 4π². | Retain; beyond the classical supplier's odd-D scope. Historical result from [review 3]. |
| §8.15 extended ring-class coefficient | D=−7,c=3,u=1,μ=0; abstract u=3,μ=1 scale | Coefficient 8π²(φ,φ)/(3√7); unit/ramification factor 1/(9·2)=1/18. | CST constants retained; this is a constant calculation, not an L-value computation. Historical result from [review 3]. |
| §8.15 higher-dimensional quotient outline | Maps f=(2,0),g=(3,0)ᵀ; composition c=6 | e=g·(1/6)·f=diag(1,0); e²=e. Replacing 1/6 by 1 gives e²=diag(36,0)≠diag(6,0). | Checks inverse-composition normalization; no new construction of the supplier's elliptic comparison. Historical result from [review 3]. |
| §8.19 quotient formula and new scaling Check | H=3,deg f=2; f replaced by [2]f | H/deg f=3/2; 12/8=3/2. C² and height both scale by 4 in the period expression. | Both formulas agree with imported quotient comparison. Historical result from [review 3]. |
| §8.19 classical and torsion Checks | D=−7,c=1,χ=1; height 0 | Constant 8π²(φ,φ)/(deg f·√7); torsion gives 0 on both sides. Constant map would set both denominators to 0 and is excluded. | Positive degree/nonzero C retained. Historical result from [review 3]. |
| §9.5 new quotient-naturality Check/API | Projection and addition on that product; [6]→[30] | dpr₁(55,110)=55; dadd(55,110)=165≡40; corrected log(30)=log(6)=55. | Detects wrong quotient map and omitted Tate correction. Historical result from [review 3]. |
| §9.5 differential transport and cusp normalization | Differential pullback 2ω, AJ value 3; shift primitive by 5 | Quotient logarithm 2·3=6; unscaled value 3 is wrong. Degree-zero correction 5−5=0; cusp value changes 0→5. | Supplied naturality and owned normalization remain distinct. Historical result from [review 3]. |
| §9.5 point-comparison boundary | Zero-dimensional abelian variety; torsion; semistable V=ℚ₅ | First two give κ=0 and log=0. For V=ℚ₅, dimensions H¹_e=0 and H¹_f=1. | No assertion of equality for arbitrary semistable representations. Historical result from [review 3]. |
| §9.12 consuming §9.5 (seeded) | p=5,a_p=±1,χ=norm | Multipliers 4/5 and 6/5; squares 16/25 and 36/25, each valuation −2. Family factor 1−a_p⁻¹ is 0 when a_p=1. | No conflation with family exceptional zeros. Historical result from [review 3]. |
| §8.5 matrix Check (seeded) | A=[1,−1;22,−8],D=−7,N=11 | A²=[−21,7;−154,42]; A²+7A+14I=0; lower-left 22≡0 mod11. | Confirms embedding fragment only; optimality still required. Historical result from [review 3]. |
| §8.5 inverse-character convention (seeded) | χ(t)=ζ,ζ³=1,ζ≠1 | Required scalar ζ⁻¹=ζ²; wrong scalar ζ differs. Toric invariance with a t-fixed vector would give P=ζP, hence P=0. | Full eigencondition retained. Historical result from [review 3]. |
| Suggested.lean:14–17, §5.2 headline | d=±1; F→2F | Gamma real parts 1/4 and 3/4; coefficient norm-square and Petersson norm both multiply by 4. | Missing carriers named; no surrogate theorem introduced. Historical result from [review 3]. |
| Suggested.lean:14–17, §5.3 headline | Vector scales 2,3; torus volume 4; zero vector | Both bilinear sides scale by 6; volume-period product scales by 16; zero gives 0=0. | Missing carriers named; previous R03 repaired. Historical result from [review 3]. |
| §0.2 and the sole Lean theorem | Rational scalar 0, 1/2, 1, 2; torsion | q(r⊗P)=r²H gives 0,H/4,H,4H; torsion gives 0. Integer restriction at r=1 gives H. | Consistent; retain.  Carried from [review 3]. |
| §0.1 height polarization | q(n)=n²H, P=Q | (4H−H−H)/2=H=q(P); full polarization gives 2H. Rank-zero determinant=1. | Distinguishes factor 2; retain.  Carried from [review 3]. |
| §0.3 gamma normalization | s=1 | 2(2π)⁻¹Γ(1)=1/π; omitting 2 gives 1/(2π). At a central zero the completed derivative is √N L′/π. | Retain.  Carried from [review 3]. |
| §0.4 unit index | D=−7,−4,−3 | Unit counts 2,4,6 give u=1,2,3; u⁻²=1,1/4,1/9. | Retain exceptional units.  Carried from [review 3]. |
| §§0.5, 0.12 CM action | C₃ class g, N=2, K=ℚ(√−23) | Fricke class 0→−1=2→2+1=0; inverse-convention first image would be 1. | The stated inverse is discriminating.  Carried from [review 3]. |
| §§0.9, 0.11 trace/field normalization | h=3, point Q | Trace 3Q has height 9H and log 3log Q; H-field/K-field height ratio=3, K/absolute ratio=2. | Different factors must not be conflated.  Carried from [review 3]. |
| §1.1 Poincaré comparison | Elliptic principal polarization, x=y=P | Pullback polarization gives B_x(P,P)=H; replacing the dual point by its negative gives −H. | Sign test only; retain.  Carried from [review 3]. |
| §1.2 coefficient trace | M=ℚ(√5), diagonal trace pairing | Trace form on (1,√5) is diag(2,10); dual basis (1/2,√5/10) gives trace 1 on each matching pair and 0 across. | Distinguishes trace recovery from one embedding.  Carried from [review 3]. |
| §1.5 rational descent | G=C₂, fixed vector x | Tr(x)=2x; (1/2)Tr(x)=x; unnormalized inverse gives 2x. Zero module gives 0→0. | Retain rational averaging.  Carried from [review 3]. |
| §2.3 admissible graph measure | Genus-one circle length 2; one-point good reduction | μ=ds/2 has mass 1; g(s)=s²/4−s/2+1/6 has mean 0, g(0)=1/6,g(1)=−1/12. Point graph μ=δ_v,g=0. | Agrees with Tropical §6.6; genus-zero division excluded.  Carried from [review 3]. |
| §2.5 finite Néron symbol | ℙ¹, a=(0)−∞, b=(1)−(p) | Intersection −1 gives +log p; log of f(b)=log(p⁻¹)=−log p gives the same negative-log symbol. Ramified degree 2 gives 2log p/2. | Retain sign and extension denominator.  Carried from [review 3]. |
| §2.5 vertical correction | Intersection matrix [−2,2;2,−2], corrected section | Adding (1/2)C₁ changes intersection 0 to 1/2; symbol changes 0 to −(log q)/2. | Bare horizontal intersection is excluded.  Carried from [review 3]. |
| Layer 2 Faltings–Hriljac comparison | Principal divisor and degree-zero class; scale [2] | Principal class height and global pairing both 0; the polarized quadratic scaling is 4 on both sides. | Only principal/scaling probes; no general proof certification.  Carried from [review 3]. |
| §3.4 strict GL₂ realization | Coefficient degree d=1,2 | Rank-two M realization has ℚ-dimension 2,4, matching 2dim A; M₂(ℚ) has dimension 4 and is not a degree-two field. | Distinguishes strict field condition; not a realization proof.  Carried from [review 3]. |
| §§3.9, 8.4 differential normalization | ω=2πif dz; φ replaced by [2]φ | iω∧ω̄=8π²|f|²dxdy; C² and deg φ both multiply by 4. | Retain.  Carried from [review 3]. |
| §5.2 half-weight value | Half-weight form with squared norm6; scalar2 | Unit-normalized coefficient12 becomes12/6=2; multiplying the form by2 multiplies coefficient norm-square and Petersson norm by4. | Normalization probe only.  Carried from [review 3]. |
| §5.3 coherent toric pairing | Two vectors scaled by 2 and 3 | Bilinear toric-product value and invariant-pairing-normalized expression both scale by 6; zero vector gives 0 without dividing by its norm. | Homogeneity probe only.  Carried from [review 3]. |
| §6.32 trace cosets | D=−7,N=1; rows [1:1],[2:2] | Inverse ratios 1 and 4·2=1 mod7 agree; products 1 and 4 disagree. Coset count 1+7=8. | Retain c* inverse convention.  Carried from [review 3]. |
| §6.40 pseudo-theta separation | Degree 4; parameters N=±1 | (1+i)⁻⁴=(1−i)⁻⁴=−1/4. For positive distinct N, moduli (1+N²)⁻² are distinct. | Roadmap's positive choice excludes source-proof failure.  Carried from [review 3]. |
| §6.50 zero-term correction | δ=2, normalized W₀(s)=2⁻ˢa | W₀′(0)=−a log2; adding a logδ gives 0. With a=0 all terms are 0. | Distinguishes normalized zero term.  Carried from [review 3]. |
| §6.69 weight-two central value | k=1,D=−7,h=u=1 | Prefactor (2π)²·2/√7=8π²/√7; r(0)=1/2 and δ(0)=2 give endpoint product 1. | Retain k=1 coefficient and endpoint.  Carried from [review 3]. |
| §7.6 integral order sandwich | ℚ₃(√3), ℚ₂(i), split algebra | Odd case lattice upper-right in 3ℤ₃ has index 3; dyadic two parity conditions give index 4; split lattice gives index 1. Multiplication by discriminant 3 or 4 lands in the respective lattice. | Strict inclusion really occurs; retain.  Carried from [review 3]. |
| §7.14 split vertical term | Q′ disjoint components; degree-zero divisor P−Q on one component | Distinct-component intersection=0; total component degree 1−1=0, so fiber correction pairing=0. | Only the stated maximal-level specialization is tested.  Carried from [review 3]. |
| §7.22 CM component | K=ℚ(√−7),N=2, conjugate level primes | Connected kernel rank2/étale rank1 gives (1,0); opposite prime gives rank1/rank2 and (0,1). | Retain orientation.  Carried from [review 3]. |
| §7.69 kernel invariance | N=2, γ=[1,1;2,3] | det γ=1; w₂γw₂⁻¹=[3,−1;−2,1], also determinant1 and lower-left divisible by2. | Retain simultaneous conjugation.  Carried from [review 3]. |
| §7.75 norm-ideal map | D=−7,N=1,p=3,q=23,a=O,b=j | N(b)=69, N(c)=0,N(c′)=161: 0+3·161=483=69·7. Zero ideal has no class. | Retain separately counted endpoint.  Carried from [review 3]. |
| §7.81 hyperbolic parameter | D=−4,N=1,τ₁=τ₂=i,γ=[1,1;0,1] | m=1,n=(1−1)²+(1+0)²=1; other norm=(1+1)²+(1−0)²=5=n+4m. | Correct matrix identity; outside odd-D arithmetic scope.  Carried from [review 3]. |
| §8.1 projected kernel identity | Projection onto first coordinate | I′=(2,7), Z̃=(1,3): projections 2 and 2·1 agree, while 7≠2·3. | Illustrates necessity of projection, not an arithmetic-kernel evaluation.  Carried from [review 3]. |
| §§8.2, 8.8 character conventions | C₃ over 𝔽₇,ζ=2; trivial C₃ over 𝔽₃ | Sum vector (1,2,4) shifts to (4,1,2)=4v, not 2v. In 𝔽₃, trace of fixed 1 is 0; division by 3 is excluded. | Retain inverse character and invertibility hypothesis.  Carried from [review 3]. |
| §8.3 global sign | One or two exceptional local signs | Product −1 for one; product +1 for two. Odd incoherent ramification gives −1, whereas even parity does not. | Retain parity and matching hypothesis.  Carried from [review 3]. |
| §8.6 coefficient identity | T₁=identity, u=1 versus u=3 | ⟨c,T₁c⟩=H requires a₁=H or H/9 respectively under H=u²a₁. | Constant check only; not a Fourier-coefficient computation.  Carried from [review 3]. |
| §8.7 bilinear coefficient height | L=ℚ(i), B(x,y)=1 | B(ix,iy)=−1; Hermitian extension would give +1. Trace of scalar1 from a quadratic field is2. | Retain bilinear/Hermitian distinction.  Carried from [review 3]. |
| §8.8 shared marked point | h=3,ψ=[2] | Q→3Q→6Q; heights H→9H→36H; logs l→3l→6l. Basepoint correction hT=3T. | Marking and isogeny factors are necessary.  Carried from [review 3]. |
| §§8.9, 8.11 YZZ normalization | K=ℚ(i),class number1 | Completed L(1,η)=1/4, volume2L=1/2; volume-scaled height=1/4 of probability height. Finite L-value π/4 gives a different constant. | Normalization probe; book theorem remains waived.  Carried from [review 3]. |
| §8.18 non-torsion/rank implication | Two real coefficient embeddings, each derivative nonzero | Orders1+1=2=dim A; replacing a component by a zero of order3 gives total4, not2. | Checks product-order step only.  Carried from [review 3]. |
| §9.1 cotangent saturation | ℤ₃, J=A×B with dimensions1,2; ℤ₂ | Ranks1→3→2; quotient free rank2. 3R⊂R has quotient length1. At p=2,e=1, inequality1<1 fails. | Retain bound and saturation distinction; general DVR source uncertified.  Carried from [review 3]. |
| §§9.2, 9.13, 9.19 eigenlogarithm | E:y²+y=x³−x, P=(0,0),p=11 | #E(𝔽₁₁)=17; t(17P)=5640481/5106896≡22 mod121; log(P)≡22/17=44 mod121≠0. Torsion gives0. | Actual one-dimensional algebraic-point test; no higher-dimensional certification.  Carried from [review 3]. |
| §9.11 Brooks square | Linear CM values1,2; scaling by2 | (1+2)²=9, not1²+2²=5; scaling gives36. At t_K=2, extra JSW multiplier gives18, not9. | Normalization test; retain full-sum/quotient-sum distinction.  Carried from [review 3]. |
| §§9.12, 9.16, 9.17 Euler factors | p=5,a_p=±1 at multiplicative reduction; E37 at p=11 | Multiplicative factors4/5,6/5 are nonzero. For E37, a₁₁=12−17=−5; good factor=(12+5)/11=17/11, square289/121. | Retain separate good/multiplicative formulas.  Carried from [review 3]. |
| §9.17 tame CM hypotheses | K=ℚ(√−7),N=37,p=11,c=1 | Roots of x²+7 modulo37:17,20; modulo11:2,9. Thus both primes split; class number and unit index are1. | Actual admissible scalar-factor test; no full L-value computed.  Carried from [review 3]. |
| §9.21 Iwasawa-algebra membership | F(T)=1+T and unbounded coefficients5⁻ⁿ | Integral series has coefficient valuations0,0 and F(0)=1; Σ5⁻ⁿTⁿ has valuations−n and is not in O^ur⟦T⟧, despite convergence on a smaller disc. | Analytic continuity alone does not establish bounded coefficients.  Carried from [review 3]. |

## Not verifiable

- This is the requested incremental review, not an exhaustive new proof or adversarial pass over all 290 targets. It contains 4 fresh rows and 56 inherited rows. Scaling, projection and local logarithm tests do not certify global L-values or kernel identities.
- No new certification is claimed for the unchanged seeded targets §§0.5,6.6,6.20,6.35,6.68,7.10,7.18,7.39,7.65,7.82,7.89,7.95,7.108,8.17,9.1. The inherited rows identify the evidence available in this report.
- yzz-book and yzz-draft remain settled waived; argos and blr remain settled uncertified. The earlier report's book-only proof inputs and general-DVR cotangent comparison remain unverified from their source texts. No settled text was requested again.
- Unchanged source sentences elsewhere in References, unrelated supplier contracts, other open siblings and the three unrelated historical gap entries were not reviewed afresh. Ownership against open work without a supplied readable copy was not checked. The seven unchanged CM-interface resolver leads were not recertified.
- No missing-source request or manifest edit was needed. This review is complete; its blocker is the supplied-yet-declared-missing regulator contract, not source access.

## Source issues

No new source issue was found. These three issues are carried from [review 3], with its locators and qualifications; they are not new roadmap findings.

- **Error** in yuan-zhang at Lemma 6.1 proof, printed p.583 (yuan-zhang line 2126): the source says distinct integer parameters always give an invertible Vandermonde system; it should be distinct positive sufficiently divisible parameters, whose transformed moduli differ; affects the proof.
- **Misprint** in castella-multiplicative at Theorem 3.1 proof, printed p.9 (castella-multiplicative line 410): the source says the central-value function is the twisted linear CM measure; it should be the square of that twisted measure; affects the proof.
- **Misprint** in cst at the conjecture following Theorem 1.1, printed p.2 (cst line 91): the source says a ramified level prime occurs with valuation two; it should be valuation one for the stated cyclic maximal-order Heegner construction; affects a stated result.

