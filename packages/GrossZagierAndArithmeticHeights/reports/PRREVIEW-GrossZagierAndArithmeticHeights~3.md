# Review of GrossZagierAndArithmeticHeights (pull request #1487 at d96f687)

**Verdict:** needs changes

## R01 (P2) — Retire the fulfilled regulator gap and its remaining ownership claim

**Location:** `packages/GrossZagierAndArithmeticHeights/design/plan.json:16` (the `point-kummer-logarithm` entry), and `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:5715`: “§9.5 proves the abelian exponential comparison at arbitrary reduction.”

**Claim:** The repaired contract and §9.5 correctly import the comparison, but the active design gap still requests it from PadicHodgeRegulators, and References still assigns its construction here. This leaves two incompatible accounts of the same prerequisite. A gap requesting material already supplied is a P2 under the review's gap rules.

**Witness:** `TauCetiRoadmap/PadicHodgeRegulators/README.md:607`–612 (§1.9, supplied head) covers arbitrary reduction, the rational Kummer image, exponential/logarithm diagram, de Rham identification, and quotient naturality. It supplies every item still requested by this gap.

**Re-raised: r2b F02 in FIX-RT-GrossZagierAndArithmeticHeights~2.** That repair report's reason was inability to inspect an authorized supplier copy. The supplied head is readable, and this head's own README:94,137,5310 now correctly recognizes its generality. The earlier availability reason no longer applies.

**Exact repair:** Retire `point-kummer-logarithm` from the active design gaps; keep the explicit §1.9 import. Replace the final sentence at README:5715 with the same arbitrary-reduction supplier attribution, leaving §9.5 responsible for its p-new residue, cusp-normalization, Abel–Jacobi and root-interpolation comparisons. Do not add another general exponential construction.

**Repair test:** For A=E₅×E₅ over ℚ₅ with Tate periods 5, log([6],[36])=(55,110) modulo 125. The supplier gives projection 55, addition 40, and log([30])=log([6])=55. Importing it covers this nonelliptic multiplicative example with no extra gap or construction. Good reduction and the zero-dimensional case are also explicitly included in §1.9.

## Previous findings

- R01 — repaired: README:9,109,5062–5080,5142–5160 import EffectiveClassNumbers §2.8. The owned variants retain ring conductors, even discriminants and ramified level; classical specializations are compatibility Checks.
- R02 — partly repaired: README:94,137,5310–5333 now imports arbitrary-reduction point comparisons. README:5715 still claims local ownership, and design/plan.json:16–19 still requests the supplied comparison as a gap. See this report's R01.
- R03 — repaired: Suggested.lean:14–17 names §5.3's coherent Waldspurger formula and §5.2's half-weight comparison, with their missing automorphic, period, Whittaker and L-function carriers.

## Verified sound

:robot: AI-assisted incremental re-review of 46 changed lines since ab88199. The reviewed head is d96f687cc91acf422a17db16429b33ae34e2cedb. I checked the three prior findings, all changed passages, their affected supplier contracts, the cited classical and semistable specializations, and the Lean acceptance test. This is not a new full review of the unchanged 290-target roadmap.

**Gate and elaboration.** The outside-folder diff is empty and the worktree is clean. The independent gate returned:

```text
gate GrossZagierAndArithmeticHeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The requested independent dependency command returned:

```text
depcheck: 204 roadmaps, 1626 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line appeared. The targeted build `lake build TauCetiRoadmap.GrossZagierAndArithmeticHeights.Suggested` completed successfully (8981 jobs), with only the expected sorry warning at Suggested.lean:43. Direct `lake env lean` elaboration also succeeded. The worker's supplied gate independently includes build=0 OK.

On a scratch copy, `#check @TauCetiRoadmap.GrossZagierAndArithmeticHeights.canonicalHeightRat_exists_unique` retained K, Field K, Height.AdmissibleAbsValues K, DecidableEq K, the affine Weierstrass curve W, and W.toAffine.IsElliptic. Its conclusion is the unique ℚ-quadratic map on ℚ⊗ℤW.Point restricting to P.canonicalHeight. No binder or mathematical statement changed. Separate alternatives in a one-tactic probe (`simp`, `rfl`, `infer_instance`) all failed to close the theorem. Reading the quadratic base-change declarations below found no single-lemma existence proof for this ℝ-valued extension; the uniqueness lemma alone does not discharge existence. No padding finding arose.

I read the repository README's normative writing rules and CONTRIBUTING, and compared the main-branch AlgebraicCurves and AlgebraicVectorBundles openings and structure. No PR file, source manifest, library pin or merge-order file was edited.

**Headline inventory.** The README's headlines remain: rational canonical-height extension (§0.2); Poincaré/coefficient heights and Faltings–Hriljac (Layers 1–2); strict GL₂ realizations (§3.4); half-weight and coherent Waldspurger comparisons (§§5.2–5.3); projected arithmetic kernels and the classical coefficient identity (§§8.1,8.6); YZZ/CST, ring-class and elliptic Gross–Zagier (§§8.11,8.14–8.19); and analytic-subgroup, eigenlogarithm and p-adic special-value comparisons (Layer 9). The new docstring entries accurately describe the two omitted central-value families. They introduce no free-scalar replacement or sorry'd carrier. The only theorem signature remains §0.2's actual rational tensor extension.

**Pins inspected.** Mathlib is pinned at 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. These six named declarations were opened afresh; paths are relative to their library roots.

| Declaration | File and line | Scope verified |
|---|---|---|
| `WeierstrassCurve.Affine.canonicalHeightQuadratic` | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:341` | ℤ-quadratic, ℝ-valued, with ellipticity. |
| `canonicalHeightQuadratic_apply` | Same file:350 | Restriction is the native point height. |
| `neronTatePairing_self` | Same file:384 | The diagonal is the canonical x-height. |
| `QuadraticForm.baseChange` | `Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:127` | Ring-valued quadratic-form extension; not the signature here. |
| `QuadraticForm.baseChange_tmul` | Same file:131 | Scalar factor a² on pure tensors. |
| `QuadraticMap.baseChange_ext` | Same file:158 | Uniqueness from agreement on 1⊗m; no existence assertion. |

Object searches in both pins for toric periods, Waldspurger comparisons, Maass/Kohnen forms and Rankin interfaces found no native carriers sufficient for the newly named headline statements. The searches and the previous review's library inspection support the docstring omissions; a search is not an exhaustive absence proof.

**Ownership and supplier resolution.** The affected imports were checked against the supplied heads, using `roadmaps show`, `roadmaps grep` and direct reads. EffectiveClassNumbers §2.8 at README:639, especially :658–669, supplies exactly the classical formulas, quotient comparison, and H/K height normalization now imported. The new wording distinguishes the CST extensions and §8.6's stronger coefficient identity. PadicHodgeRegulators §1.9 at README:605–625 supplies the entire requested abelian comparison, with no reduction hypothesis. Its §§0.1,1.1–1.3 at :421,447,474,497 fix the homological twists, exponential domain and inverse logarithm. These are five regulator sections, not an inference from a matching title.

ColemanIntegrationPartII §§4.2,4.3,7.2,7.4,7.7 at README:786,807,1134,1174,1247 supply smooth-residue comparison, annular valuation correction, proper holomorphic integration, degree-zero evaluation and the branch-independent Tate logarithm used in §9.5. The negative valuation correction agrees with the revised point-class comparison. None of these imports needs to be reconstructed here.

The citation resolver found no cross-roadmap citation found nowhere. Its rerun explicitly skipped pinned Lean-name checks; I did not interpret that as proof of library-name existence. The worker's seven older CM-interface leads are unchanged and do not concern these repairs. Ownership searches covered the altered classical quotient/height and abelian Kummer/logarithm objects in the indexed main/open roadmaps and the supplied supplier heads. The package plan was inspected for the remaining regulator gap. Unchanged interfaces outside this incremental scope retain the previous report's stated limits.

**Sources and seeded sample within the changed dependency scope.** Of the new 15-target sample, §8.5 supplies the changed ring-class route and §9.12 consumes the changed §9.5 comparison, so both were reopened. The other sample targets are outside the changed passages; §6.40 and §8.1 also retain explicit previous-review rows below. I did not restart the full source sample on unchanged material. There is no literal unverified/uncertified locator flag in the README.

| Passage | Source locator read | Verification |
|---|---|---|
| §§8.15,8.19 extension and constants | cst line 37–86, conditions (1)–(2), printed p.1; Theorem 1.1, p.2 | Ring conductor, allowed ramification, primitive character, unit index, 2⁻μ, finite Rankin function, and degree denominator match. Classical specialization retains the supplier's height normalization. |
| §8.5 admissible order and test line (seeded) | cst line 265–300, Definitions 1.3–1.4, pp.5–6; line 1486–1507, Proposition 3.7, p.24 | The conductor-selected split orientation and N₂-off unit condition are retained. The torus acts by χ⁻¹, not χ. The dimension statement concerns actual representations and test vectors. |
| §9.5 primitive and root formulas | castella-exceptional line 606–611, Proposition 2.7, p.13; line 737–780, Theorems 2.10–2.11, pp.15–16 | At r=j=0 the primitive is cusp-normalized, Ω_p⁰=1 and c⁰/0!=1. The multiplier is 1−a_pχ⁻¹(p̄); the roadmap distinguishes the source's split standing hypothesis from its own nonsplit extension. |
| §9.12 multiplicative formula (seeded) | castella-multiplicative line 425–456, Theorem 3.2 and proof, pp.9–10 | The square, ε_p=0 for p dividing N, optimal quotient, unit differential factor and trace sum agree. No exceptional zero is produced by 1−a_p/p. |
| Root versus square convention used by §§9.5,9.12 | castella-hsieh line 670–686, Definition 3.7 and Proposition 3.8, p.13; castella-multiplicative line 401–415, Theorem 3.1/proof, pp.8–9 | The former defines the linear CM measure and squares its value in interpolation. The latter's construction sentence misses that square; the README already corrects it. |

**Computed adversarial table — fresh checks.** H denotes a formal height value in scaling tests, not a claimed numerical height of a particular global Heegner point. These tests check constants, maps and hypotheses; they do not numerically evaluate global L-functions.

| Statement | Instances tried | Computed values on both sides / wrong-model value | Result; change |
|---|---|---|---|
| §8.15 classical compatibility; scope:9 and contract:109 | c=1,D=−7,h=u=1,μ=0 | Both constants are 8π²(φ,φ)/√7; converting H-relative height gives hH/h=H. | Previous R01 repaired; imported classical statement. |
| §8.15 new class-number Check | h=3, K-relative height H | Classical expression A·(3H)/3=A·H; average has height H/9, so gives A·H/9. | Finite sum and field conversion agree; averaging fails. |
| §8.15 new even-discriminant Check | D=−4,c=1,u=2,μ=0 | 8π²/(2²·2)=π²; u=1 incorrectly gives 4π². | Retain; beyond the classical supplier's odd-D scope. |
| §8.15 extended ring-class coefficient | D=−7,c=3,u=1,μ=0; abstract u=3,μ=1 scale | Coefficient 8π²(φ,φ)/(3√7); unit/ramification factor 1/(9·2)=1/18. | CST constants retained; this is a constant calculation, not an L-value computation. |
| §8.15 higher-dimensional quotient outline | Maps f=(2,0),g=(3,0)ᵀ; composition c=6 | e=g·(1/6)·f=diag(1,0); e²=e. Replacing 1/6 by 1 gives e²=diag(36,0)≠diag(6,0). | Checks inverse-composition normalization; no new construction of the supplier's elliptic comparison. |
| §8.19 quotient formula and new scaling Check | H=3,deg f=2; f replaced by [2]f | H/deg f=3/2; 12/8=3/2. C² and height both scale by 4 in the period expression. | Both formulas agree with imported quotient comparison. |
| §8.19 classical and torsion Checks | D=−7,c=1,χ=1; height 0 | Constant 8π²(φ,φ)/(deg f·√7); torsion gives 0 on both sides. Constant map would set both denominators to 0 and is excluded. | Positive degree/nonzero C retained. |
| §9.5, revised contract:94,137 and residual References claim:5715; R01 | A=E₅×E₅, P=([6],[36]), tangent coordinates du/u | log₅(6)=5−25/2≡55; log₅(36)=2log₅(6)≡110 mod125. Supplier and imported map both give (55,110). | Mathematical import repaired; retire redundant gap and contrary attribution. |
| §9.5 new quotient-naturality Check/API | Projection and addition on that product; [6]→[30] | dpr₁(55,110)=55; dadd(55,110)=165≡40; corrected log(30)=log(6)=55. | Detects wrong quotient map and omitted Tate correction. |
| §9.5 differential transport and cusp normalization | Differential pullback 2ω, AJ value 3; shift primitive by 5 | Quotient logarithm 2·3=6; unscaled value 3 is wrong. Degree-zero correction 5−5=0; cusp value changes 0→5. | Supplied naturality and owned normalization remain distinct. |
| §9.5 point-comparison boundary | Zero-dimensional abelian variety; torsion; semistable V=ℚ₅ | First two give κ=0 and log=0. For V=ℚ₅, dimensions H¹_e=0 and H¹_f=1. | No assertion of equality for arbitrary semistable representations. |
| §9.12 consuming §9.5 (seeded) | p=5,a_p=±1,χ=norm | Multipliers 4/5 and 6/5; squares 16/25 and 36/25, each valuation −2. Family factor 1−a_p⁻¹ is 0 when a_p=1. | No conflation with family exceptional zeros. |
| §8.5 matrix Check (seeded) | A=[1,−1;22,−8],D=−7,N=11 | A²=[−21,7;−154,42]; A²+7A+14I=0; lower-left 22≡0 mod11. | Confirms embedding fragment only; optimality still required. |
| §8.5 inverse-character convention (seeded) | χ(t)=ζ,ζ³=1,ζ≠1 | Required scalar ζ⁻¹=ζ²; wrong scalar ζ differs. Toric invariance with a t-fixed vector would give P=ζP, hence P=0. | Full eigencondition retained. |
| Suggested.lean:14–17, §5.2 headline | d=±1; F→2F | Gamma real parts 1/4 and 3/4; coefficient norm-square and Petersson norm both multiply by 4. | Missing carriers named; no surrogate theorem introduced. |
| Suggested.lean:14–17, §5.3 headline | Vector scales 2,3; torus volume 4; zero vector | Both bilinear sides scale by 6; volume-period product scales by 16; zero gives 0=0. | Missing carriers named; previous R03 repaired. |

**Unchanged statements carried forward.** The following 41 rows preserve the previous report's computed values and its qualifications, each explicitly attributed. Three prior rows concerning the altered ownership/imports are replaced by fresh rows above. The inherited table was not recomputed wholesale.

[previous review]: packages/GrossZagierAndArithmeticHeights/reports/PRREVIEW-GrossZagierAndArithmeticHeights~2.md

| Statement | Instances tried | Values on the two sides / wrong-model value | Result; change |
|---|---|---|---|
| §0.2 and the sole Lean theorem | Rational scalar 0, 1/2, 1, 2; torsion | q(r⊗P)=r²H gives 0,H/4,H,4H; torsion gives 0. Integer restriction at r=1 gives H. | Consistent; retain.  Carried from [previous review]. |
| §0.1 height polarization | q(n)=n²H, P=Q | (4H−H−H)/2=H=q(P); full polarization gives 2H. Rank-zero determinant=1. | Distinguishes factor 2; retain.  Carried from [previous review]. |
| §0.3 gamma normalization | s=1 | 2(2π)⁻¹Γ(1)=1/π; omitting 2 gives 1/(2π). At a central zero the completed derivative is √N L′/π. | Retain.  Carried from [previous review]. |
| §0.4 unit index | D=−7,−4,−3 | Unit counts 2,4,6 give u=1,2,3; u⁻²=1,1/4,1/9. | Retain exceptional units.  Carried from [previous review]. |
| §§0.5, 0.12 CM action | C₃ class g, N=2, K=ℚ(√−23) | Fricke class 0→−1=2→2+1=0; inverse-convention first image would be 1. | The stated inverse is discriminating.  Carried from [previous review]. |
| §§0.9, 0.11 trace/field normalization | h=3, point Q | Trace 3Q has height 9H and log 3log Q; H-field/K-field height ratio=3, K/absolute ratio=2. | Different factors must not be conflated.  Carried from [previous review]. |
| §1.1 Poincaré comparison | Elliptic principal polarization, x=y=P | Pullback polarization gives B_x(P,P)=H; replacing the dual point by its negative gives −H. | Sign test only; retain.  Carried from [previous review]. |
| §1.2 coefficient trace | M=ℚ(√5), diagonal trace pairing | Trace form on (1,√5) is diag(2,10); dual basis (1/2,√5/10) gives trace 1 on each matching pair and 0 across. | Distinguishes trace recovery from one embedding.  Carried from [previous review]. |
| §1.5 rational descent | G=C₂, fixed vector x | Tr(x)=2x; (1/2)Tr(x)=x; unnormalized inverse gives 2x. Zero module gives 0→0. | Retain rational averaging.  Carried from [previous review]. |
| §2.3 admissible graph measure | Genus-one circle length 2; one-point good reduction | μ=ds/2 has mass 1; g(s)=s²/4−s/2+1/6 has mean 0, g(0)=1/6,g(1)=−1/12. Point graph μ=δ_v,g=0. | Agrees with Tropical §6.6; genus-zero division excluded.  Carried from [previous review]. |
| §2.5 finite Néron symbol | ℙ¹, a=(0)−∞, b=(1)−(p) | Intersection −1 gives +log p; log of f(b)=log(p⁻¹)=−log p gives the same negative-log symbol. Ramified degree 2 gives 2log p/2. | Retain sign and extension denominator.  Carried from [previous review]. |
| §2.5 vertical correction | Intersection matrix [−2,2;2,−2], corrected section | Adding (1/2)C₁ changes intersection 0 to 1/2; symbol changes 0 to −(log q)/2. | Bare horizontal intersection is excluded.  Carried from [previous review]. |
| Layer 2 Faltings–Hriljac comparison | Principal divisor and degree-zero class; scale [2] | Principal class height and global pairing both 0; the polarized quadratic scaling is 4 on both sides. | Only principal/scaling probes; no general proof certification.  Carried from [previous review]. |
| §3.4 strict GL₂ realization | Coefficient degree d=1,2 | Rank-two M realization has ℚ-dimension 2,4, matching 2dim A; M₂(ℚ) has dimension 4 and is not a degree-two field. | Distinguishes strict field condition; not a realization proof.  Carried from [previous review]. |
| §§3.9, 8.4 differential normalization | ω=2πif dz; φ replaced by [2]φ | iω∧ω̄=8π²|f|²dxdy; C² and deg φ both multiply by 4. | Retain.  Carried from [previous review]. |
| §5.2 half-weight value | Half-weight form with squared norm6; scalar2 | Unit-normalized coefficient12 becomes12/6=2; multiplying the form by2 multiplies coefficient norm-square and Petersson norm by4. | Normalization probe only.  Carried from [previous review]. |
| §5.3 coherent toric pairing | Two vectors scaled by 2 and 3 | Bilinear toric-product value and invariant-pairing-normalized expression both scale by 6; zero vector gives 0 without dividing by its norm. | Homogeneity probe only.  Carried from [previous review]. |
| §6.32 trace cosets | D=−7,N=1; rows [1:1],[2:2] | Inverse ratios 1 and 4·2=1 mod7 agree; products 1 and 4 disagree. Coset count 1+7=8. | Retain c* inverse convention.  Carried from [previous review]. |
| §6.40 pseudo-theta separation | Degree 4; parameters N=±1 | (1+i)⁻⁴=(1−i)⁻⁴=−1/4. For positive distinct N, moduli (1+N²)⁻² are distinct. | Roadmap's positive choice excludes source-proof failure.  Carried from [previous review]. |
| §6.50 zero-term correction | δ=2, normalized W₀(s)=2⁻ˢa | W₀′(0)=−a log2; adding a logδ gives 0. With a=0 all terms are 0. | Distinguishes normalized zero term.  Carried from [previous review]. |
| §6.69 weight-two central value | k=1,D=−7,h=u=1 | Prefactor (2π)²·2/√7=8π²/√7; r(0)=1/2 and δ(0)=2 give endpoint product 1. | Retain k=1 coefficient and endpoint.  Carried from [previous review]. |
| §7.6 integral order sandwich | ℚ₃(√3), ℚ₂(i), split algebra | Odd case lattice upper-right in 3ℤ₃ has index 3; dyadic two parity conditions give index 4; split lattice gives index 1. Multiplication by discriminant 3 or 4 lands in the respective lattice. | Strict inclusion really occurs; retain.  Carried from [previous review]. |
| §7.14 split vertical term | Q′ disjoint components; degree-zero divisor P−Q on one component | Distinct-component intersection=0; total component degree 1−1=0, so fiber correction pairing=0. | Only the stated maximal-level specialization is tested.  Carried from [previous review]. |
| §7.22 CM component | K=ℚ(√−7),N=2, conjugate level primes | Connected kernel rank2/étale rank1 gives (1,0); opposite prime gives rank1/rank2 and (0,1). | Retain orientation.  Carried from [previous review]. |
| §7.69 kernel invariance | N=2, γ=[1,1;2,3] | det γ=1; w₂γw₂⁻¹=[3,−1;−2,1], also determinant1 and lower-left divisible by2. | Retain simultaneous conjugation.  Carried from [previous review]. |
| §7.75 norm-ideal map | D=−7,N=1,p=3,q=23,a=O,b=j | N(b)=69, N(c)=0,N(c′)=161: 0+3·161=483=69·7. Zero ideal has no class. | Retain separately counted endpoint.  Carried from [previous review]. |
| §7.81 hyperbolic parameter | D=−4,N=1,τ₁=τ₂=i,γ=[1,1;0,1] | m=1,n=(1−1)²+(1+0)²=1; other norm=(1+1)²+(1−0)²=5=n+4m. | Correct matrix identity; outside odd-D arithmetic scope.  Carried from [previous review]. |
| §8.1 projected kernel identity | Projection onto first coordinate | I′=(2,7), Z̃=(1,3): projections 2 and 2·1 agree, while 7≠2·3. | Illustrates necessity of projection, not an arithmetic-kernel evaluation.  Carried from [previous review]. |
| §§8.2, 8.8 character conventions | C₃ over 𝔽₇,ζ=2; trivial C₃ over 𝔽₃ | Sum vector (1,2,4) shifts to (4,1,2)=4v, not 2v. In 𝔽₃, trace of fixed 1 is 0; division by 3 is excluded. | Retain inverse character and invertibility hypothesis.  Carried from [previous review]. |
| §8.3 global sign | One or two exceptional local signs | Product −1 for one; product +1 for two. Odd incoherent ramification gives −1, whereas even parity does not. | Retain parity and matching hypothesis.  Carried from [previous review]. |
| §8.6 coefficient identity | T₁=identity, u=1 versus u=3 | ⟨c,T₁c⟩=H requires a₁=H or H/9 respectively under H=u²a₁. | Constant check only; not a Fourier-coefficient computation.  Carried from [previous review]. |
| §8.7 bilinear coefficient height | L=ℚ(i), B(x,y)=1 | B(ix,iy)=−1; Hermitian extension would give +1. Trace of scalar1 from a quadratic field is2. | Retain bilinear/Hermitian distinction.  Carried from [previous review]. |
| §8.8 shared marked point | h=3,ψ=[2] | Q→3Q→6Q; heights H→9H→36H; logs l→3l→6l. Basepoint correction hT=3T. | Marking and isogeny factors are necessary.  Carried from [previous review]. |
| §§8.9, 8.11 YZZ normalization | K=ℚ(i),class number1 | Completed L(1,η)=1/4, volume2L=1/2; volume-scaled height=1/4 of probability height. Finite L-value π/4 gives a different constant. | Normalization probe; book theorem remains waived.  Carried from [previous review]. |
| §8.18 non-torsion/rank implication | Two real coefficient embeddings, each derivative nonzero | Orders1+1=2=dim A; replacing a component by a zero of order3 gives total4, not2. | Checks product-order step only.  Carried from [previous review]. |
| §9.1 cotangent saturation | ℤ₃, J=A×B with dimensions1,2; ℤ₂ | Ranks1→3→2; quotient free rank2. 3R⊂R has quotient length1. At p=2,e=1, inequality1<1 fails. | Retain bound and saturation distinction; general DVR source uncertified.  Carried from [previous review]. |
| §§9.2, 9.13, 9.19 eigenlogarithm | E:y²+y=x³−x, P=(0,0),p=11 | #E(𝔽₁₁)=17; t(17P)=5640481/5106896≡22 mod121; log(P)≡22/17=44 mod121≠0. Torsion gives0. | Actual one-dimensional algebraic-point test; no higher-dimensional certification.  Carried from [previous review]. |
| §9.11 Brooks square | Linear CM values1,2; scaling by2 | (1+2)²=9, not1²+2²=5; scaling gives36. At t_K=2, extra JSW multiplier gives18, not9. | Normalization test; retain full-sum/quotient-sum distinction.  Carried from [previous review]. |
| §§9.12, 9.16, 9.17 Euler factors | p=5,a_p=±1 at multiplicative reduction; E37 at p=11 | Multiplicative factors4/5,6/5 are nonzero. For E37, a₁₁=12−17=−5; good factor=(12+5)/11=17/11, square289/121. | Retain separate good/multiplicative formulas.  Carried from [previous review]. |
| §9.17 tame CM hypotheses | K=ℚ(√−7),N=37,p=11,c=1 | Roots of x²+7 modulo37:17,20; modulo11:2,9. Thus both primes split; class number and unit index are1. | Actual admissible scalar-factor test; no full L-value computed.  Carried from [previous review]. |
| §9.21 Iwasawa-algebra membership | F(T)=1+T and unbounded coefficients5⁻ⁿ | Integral series has coefficient valuations0,0 and F(0)=1; Σ5⁻ⁿTⁿ has valuations−n and is not in O^ur⟦T⟧, despite convergence on a smaller disc. | Analytic continuity alone does not establish bounded coefficients.  Carried from [previous review]. |

## Not verifiable

- This is an incremental review, not an exhaustive new adversarial pass. The prior report supplied 44 rows and explicitly did not certify every assertion among all 290 targets. I carried forward 41 rows and added 16 fresh rows. Algebraic scaling and projection examples do not prove global kernel, L-value, or realization theorems.
- The 13 seeded targets outside the changed dependency scope were not newly source-certified: §§6.11,6.16,6.23,6.36,6.40,6.54,6.66,6.77,7.28,7.38,7.47,7.73,8.1. The previous report's §6.40 and §8.1 evidence remains in the inherited table. There was no fresh full-review requirement for these unchanged passages.
- `yzz-book` and `yzz-draft` remain settled waived; `argos` and `blr` remain settled uncertified. Their text was not requested again. In particular, the waived general-level YZZ proof inputs and the general-DVR cotangent comparison have the limits recorded in the previous report.
- I resolved the changed supplier attributions and the named regulator/integration sections above. I did not newly certify every unchanged section/declaration in every *Needs* line, every open sibling, or the unchanged seven CM-interface leads. For open work without an authorized supplied copy, ownership was not checked. No missing-supplier finding rests on an unavailable copy.
- The three unrelated historical gap entries were not reopened in this incremental pass. The one regulator gap touched by the previous finding is explicitly addressed in R01. No acceptance conditional on assumed or unidentified gaps is issued.
- No new missing text was requested, and no source manifest was edited. The review is complete without waiting for additional sources.

## Source issues

- **Error** in yuan-zhang at Lemma 6.1 proof, printed p.583 (yuan-zhang line 2126): the source says distinct integer parameters always give an invertible Vandermonde system; it should be distinct positive sufficiently divisible parameters, whose transformed moduli differ; affects the proof.
- **Misprint** in castella-multiplicative at Theorem 3.1 proof, printed p.9 (castella-multiplicative line 410): the source says the central-value function is the twisted linear CM measure; it should be the square of that twisted measure; affects the proof.
- **Misprint** in cst at the conjecture following Theorem 1.1, printed p.2 (cst line 91): the source says a ramified level prime occurs with valuation two; it should be valuation one for the stated cyclic maximal-order Heegner construction; affects a stated result.

The first source issue is carried from the previous review and was reopened: in degree four, parameters 1 and −1 both give −1/4. The second is confirmed by castella-hsieh line 670–686, where the linear measure's value is squared in interpolation; README §9.12 already makes that correction. For the third, a ramified quadratic prime ideal 𝔭 has 𝔭²=(p), so O_K/𝔭² has additive group (ℤ/p)² rather than ℤ/p². CST's preceding conditions (1)–(2), followed by this roadmap, already require the correct range. None of these source issues is a new roadmap finding.
