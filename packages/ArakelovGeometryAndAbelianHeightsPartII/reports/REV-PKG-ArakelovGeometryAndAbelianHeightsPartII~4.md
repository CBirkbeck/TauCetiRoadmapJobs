<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1056#issuecomment-6400850714 -->
Review (codex) of 9138ccd

Verdict: needs_changes

1. **F01** (P2) Restrict archimedean rescaling to powers that remain absolute values

   **Location:** `packages/ArakelovGeometryAndAbelianHeightsPartII/README.md:1142`, §7.6: “Replacing |·| by |·|^a (a > 0) replaces the canonical admissible metrics by their a-th powers”. The same unrestricted wording occurs in §2.4, line 486, and the φ API in §10.3, line 1447. The exponent-two Check is at line 1151.

   **Claim:** Every positive exponent gives another admissible valued-field setting for these analytic metrics, including archimedean fields. No nonarchimedean restriction appears in clause (1); clause (4) explicitly includes archimedean places.

   **Witness:** Over ℝ with its usual absolute value and a=2, the triangle inequality would require 4=|1+1|²≤|1|²+|1|²=2. Thus the proposed rescaled field is not a normed field.

   This fails before a curve metric can be constructed; take any smooth real elliptic curve to satisfy the positive-genus hypothesis. The Banach-spectrum supplier uses multiplicative seminorms, including their triangle inequality. At the Mathlib pin, `Mathlib/Analysis/Normed/Group/Seminorm.lean:69` explicitly requires this inequality. The source argument at yuan-2026 lines 3946–3950 concerns a nonarchimedean field with a uniformizer. It does not license arbitrary powers of an archimedean norm. Also scope §7.6(2)'s valuation-ring/model clause to nonarchimedean fields: the unit ball of the usual real absolute value is not a ring, since 1+1 lies outside it.

   **Exact repair:** State clause (1) for complete valued fields and a>0 **such that the rescaled absolute value is still an absolute value**. Explain that every a>0 is allowed nonarchimedeanly; for an archimedean absolute value represented by the usual one to exponent b>0, require ab≤1. Retain all valid powers, including a>1 when the original archimedean exponent is sufficiently small. Scope clause (2) to nonarchimedean K, including the trivial valuation. Give §2.4 the corresponding admissible archimedean exponent range, and apply the same qualification to §10.3's scaling API. The norm-equivariance statement in §2.2 already compares existing analytic points and needs no weakening.

   **Repair test:** The real usual norm with a=2 is excluded by 4>2. With a=1/2 the witness is √2≤2, Green value 1 becomes 1/2, and norm e⁻¹ becomes e⁻¹ᐟ². Starting with the square-root real absolute value, a=2 is allowed and recovers the usual norm. For ℚ₂, a=2 remains valid: |2| changes from 1/2 to 1/4 and Green value 1 becomes 2. The trivial-model norm remains 1. Add these positive and negative controls; label the existing a=2 Check nonarchimedean. The hybrid exponents used in §10.14 are eventually ≤1 and remain valid.

One finding: one P2, no P1 or P3. The two findings in the preceding review are repaired. The new finding is a missing domain restriction on rescaling absolute values, not a supplier-gap objection. The four authored package inputs were left unchanged.

## Verified sound

The review read all 91 numbered targets, all 91 individual `*Needs:*` lines, the conventions and supplier contracts, all 14 layer endings, and the Lean, metadata and source-manifest files. There are 44 explicit definition/API blocks, each with at least three Checks. The separate scratch ledger records a computed probe for every numbered target. The report below retains the sampled targets, headline families, repaired cases and the finding's affected targets, rather than reproducing the entire ledger. Numerical probes supplement, rather than establish, the general theorems; hypotheses and proof inputs were checked separately.

No replacement of the parent roadmap, good-primes restriction, computational algorithm, copied source passage, sorry'd data, `set_option`, or upward supply was found. The arbitrary-base, mixed signed, relative metrized extensions are distinguished from their supplied specializations. Integral schemes exclude the zero ring and empty scheme; finite inseparable degrees, singular projective models, real-place descent, and characteristics 2 and 3 remain in scope. Main-branch SchemeAndStackFoundations, StableReduction and AlgebraicVectorBundles were consulted for shape. The package retains the required prose/API/Checks structure.

### Previous findings checked individually

All package locations in this table refer to `packages/ArakelovGeometryAndAbelianHeightsPartII/README.md`. These quotations are from the repaired package itself.

| Previous finding | Repaired passage | Verification and status |
| --- | --- | --- |
| F01, nullary intersection and Siu | Line 580: “for d = 0 it is deg_k[X]. For d ≥ 1 there is also the extension allowing one arbitrary adelic entry.” | **Repaired.** Lines 25, 195, 572–580 and 720 separate the arities. Spec 𝔽₄/𝔽₂ gives empty intersection=volume=2, whereas an additive distinguished entry on Pic=0 would give 0. |
| F01, downstream dimension-zero uses | Line 1761: “for d = 0 the right-hand side is a^m deg_k[S]”; line 780: “The empty intersection on Spec F is instead 2” | **Repaired.** Scalarization has d≥1; vector height over a finite field is 0, distinct from cycle degree 2. The geometric point cases in §§11.2, 11.4 and 12.3 remain included; §11.3 retains arithmetic empty generic degree [K:ℚ]. For O(2) on ℙ¹ over 𝔽₄/𝔽₂, selected degrees are 4 and 8 at m=1,2. |
| F02, Moriwaki anchor | Line 1004: “gao-habegger-2019 lines 2596–2614 and 2639–2655”; §6.1 now cites “lines 2530–2555” | **Repaired.** These ranges contain the height comparison, specialization transfer, and polarization definition respectively, with the relative denominator retained. The old §11-over-ℚ̄ anchor is not used for this assertion. |
| F02, φ anchor | Line 1436: “yuan-2026 lines 1642–1689” | **Repaired.** The range contains the diagonal integral and positive-eigenvalue expansion. The earlier resistance-only anchor has been replaced. R01 concerns a different scaling-domain defect. |
| F02, Noether anchor | Line 2065: “p. 89, lines 2992–3001” | **Repaired.** This range contains the arithmetic Noether normalization, including the raw field-degree factor. It no longer points to the slope-inequality paragraph. |

The repaired arity pattern was searched through volumes, mixed terms, heights, empty generic intersections, and relative powers, including purely inseparable towers. The repaired locator pattern was checked in every other reference to the same passages. No finding marked not actionable is re-raised. The two declared supplier contracts remain legitimate contracts.

### Seeded source verification

The manifest has 20 works: 18 cached certified texts and two settled uncertified originals. No new source was needed and no manifest entry was changed. Pages below are printed pages of the versions identified in the manifest. In particular, Yuan–Zhang is arXiv v9; Cinkir's arXiv v2 Theorem 2.9 is the result cited elsewhere under the published number 2.11. Mathematical assertions were compared with the source hypotheses, not just with a matching theorem number.

| Sampled target | Locator read | Result |
| --- | --- | --- |
| 2.1 Global analytification | yuan-zhang-2025 §3.1, pp. 63–68, lines 2248–2455; yuan-2026 §2.1, p. 21, lines 705–711 | Glued multiplicative-seminorm charts, evaluation topology, base norm and real conjugation quotient agree. Separation/finiteness conditions on the topological assertions are retained. The archimedean ray has the admissible exponent range, relevant to R01 elsewhere. |
| 2.6 Integrable canonical measures | yuan-zhang-2025 §3.6.7–3.6.8, pp. 99–102, lines 3722–3824; Theorem 5.4.3, p. 168, line 6607; Lemma 5.4.4, pp. 170–171, lines 6767–6800 | Signed mixed construction, compact-test convergence and total mass are supported. Lemma 5.4.4 explicitly supplies no loss of mass on the nonproper space; degree is adelic there. Positive normalized probability requires positive top degree. |
| 3.1 Absolute intersection | yuan-zhang-2025 Propositions 4.1.1–4.1.2, pp. 103–105, lines 3843–3910 and 3943–3951 | Boundary extension with one arbitrary entry is correctly restricted to d≥1. Nullary degree is separately imported; projection uses total function-field degree and zero for nondominant maps. The source's own missing arity qualification is not copied. |
| 4.9 Global-field comparison | yuan-zhang-2025 §2.5.3, pp. 43–44, lines 1533–1572; §5.3.1, p. 152, lines 5945–5959; yuan-2026 §4.1.2, pp. 63–64, lines 2146–2170 | Same model data give the completion comparison. Relative versus absolute degree, scalar pullback of metrics and scalar pushforward of measures agree with the current suppliers. Agreement is not asserted merely on underlying bundles. |
| 7.6 Rescaling/good reduction | yuan-2026 §A.5, p. 117, lines 3946–3950; §A.6, pp. 118–119, lines 4011–4055 | Nonarchimedean rescaling, trivial model and good-reduction conclusions are supported. Unrestricted archimedean powers are not: R01. |
| 8.2 Admissible extensions | yuan-2026 Proposition 2.6, pp. 31–32, lines 1030–1105 | Normal flat base, positive-degree Abel construction, power/descent argument and uniqueness up to a pulled-back base bundle agree. No integral surjectivity is inferred from the algebraic torsion-cokernel input. |
| 10.2 Graph inequalities | cinkir-2011 Theorem 2.9, p. 5, lines 177–219; baker-rumely-2007 Lemma 14.4, p. 37, lines 1953–1968; de-jong-2018 Proposition 9.2, p. 31, lines 1508–1550 | Effective canonical divisor, positive genus range, edge-type coefficients and τ normalization agree. The signed canonical measure is not confused with the admissible probability measure. |
| 10.4 Global ε divisor | yuan-2026 §3.2, pp. 46–48, lines 1544–1640 | The divisor compares model and admissible canonical squares in the geometric setting; the sign and normalized Green value ε log e are correct. |
| 10.6 Global φ divisor | yuan-2026 §3.3.2, pp. 49–50, lines 1691–1713 | Φ=P−D³ and its canonical algebraic trivialization agree. The roadmap correctly integrates on the curve square, repairing the source's domain misprint. |
| 10.7 Difference-map triple pairing | yuan-2026 Theorem 3.6 and proof, pp. 51–52, lines 1734–1789 | Triple relative pairing is (12g−4)P−8Φ. Diagonal adjunction supplies the negative mixed term; positive canonical twice theta supplies the other signs. |
| 11.1 Uniform archimedean positivity | yuan-2026 Theorem 3.10 and proof, pp. 56–58, lines 1911–1994 | Fixed g>1, continuity, boundary coercivity through the complex-base completion and compactness give a uniform positive minimum. This is not an asserted sharp degeneration asymptotic. |
| 11.4 Canonical bigness | yuan-2026 Theorem 1.3, pp. 11–12, lines 382–420; Theorems 3.1–3.2, p. 40, lines 1320–1346 | Genus>1, maximal variation and the geometric/arithmetic alternatives agree. Dimension-zero geometric bases are explicitly allowed. Inputs from arbitrary-field moduli/Hodge positivity remain declared contracts. |
| 13.4 Lower canonical-square bounds | wilms-2022 Theorem 1.2, p. 3, lines 121–124; looper-silverman-wilms-2021 Proposition 6.1, p. 14, lines 704–747; zhang-2010 Corollary 1.3.3, p. 7, lines 253–258; yuan-2026 pp. 87–88, lines 2921–2960; cinkir-2015 Introduction (iii), p. 1, lines 37–51 | Number-field and function-field hypotheses are distinguished. Stronger characteristic-zero/hyperelliptic coefficients are retained, and hyperelliptic equality gives the improved g=2 coefficient. The sharp g=3 graph constant is 17/288. |
| 13.9 Number-field height comparison | yuan-2026 Theorem 4.14 and proof, pp. 92–95, lines 3096–3250; wilms-2022 Theorem 1.2, p. 3, line 121 | Semistable-extension invariance, division by [K:ℚ], c₅ of unrestricted sign and the positive lower bound are correct. The argument uses the corrected c(g)Δ boundary coefficient. The logarithmic upper constant is 6g log(2π²). |
| 13.10 Uniform comparison with max(h,1) | yuan-2026 Theorem 1.4, pp. 14–15, lines 477–494, with Theorems 4.11 and 4.14 | Quantifiers are ∀g>1 ∃positive constants ∀fields ∀curves. Function-field non-isotriviality is retained. Positive lower bound controls bounded h; the linear lower bound controls large h. Constants need not be effective. |

The two primary texts explicitly flagged uncertified remain so; see Not verifiable. Their available comparison formulas were checked, and no renewed source request was made.

### Computed adversarial evidence

Write W for the admissible canonical self-intersection, P for its relative Deligne self-pairing, D for the admissible diagonal bundle, and h for the stated stable Faltings height. H₁,H₂ are ruling classes on ℙ¹×ℙ¹. The table includes numerical tests of formula coefficients without claiming that freely prescribed W, φ or h occur on a curve. “Consistent” records the outcome of a probe, not a proof by examples.

| Statement | Instance and computed values on both sides / wrong model | Result and change |
| --- | --- | --- |
| 0.1 | Spec Z: deg O(1)=1, deg O(2)=2; principal 2 has log2-log2=0 | Consistent; no change |
| 0.2 | degree-two norm sends O(c) to O(2c); P1xS pairing of O(1)+pi*M with itself is 2M | Consistent; no change |
| 0.3 | O(-1),O(0),O(2) on Spec Z have volumes 0,0,2; Spec F4/F2 has volume 2 | Consistent; no change |
| 1.2 | constants -2,0,2 have norms 2,0,2; zero boundary gives infinity for nonzero divisor | Consistent; no change |
| 1.5 | Pic(P1)=Z excludes 1/2; rationalized degree 1/2 doubles to 1 | Consistent; no change |
| 1.6 | Pic(Spec Q/Q)=0; arithmetic O(1) has degree 1; quadratic absolute height (2log2)/2=log2 | Consistent; no change |
| 2.1 | Spec Z arch ray evaluates 2 as 2^t for 0<t<=1; i and -i have one real quotient image | Consistent; no change |
| 2.4 | ord_0(t),ord_infinity(t) give exp(-1),exp(1); real power two fails 4<=2 | R01: qualify valid rescaling |
| 2.6 | P1xP1: H1^2=H2^2=0,(H1+H2)^2=2,H1H2=1; -H1H2=0-1=1-2=-1; geometric point mass=1 | Consistent; no change |
| 3.1 | Spec F4/F2 empty degree=2=2*1; purely inseparable degree-two tower gives 4=2*2; unary Pic=0 map gives wrong 0 | Consistent; no change |
| 3.4 | E/F5 y^2=x^3+3x+2 has O,(1,+/-1),(2,+/-1), five points; nonzero rational P has order 5; Frobenius pullback O(P-O) becomes trivial | Consistent; no change |
| 4.3 | A=O(2),B=O(1): vol(A-B)=1=2-1; B=0 mixed term 0 and volume 2; dimension-zero volume 2 | Consistent; no change |
| 4.6 | quadratic height (2log2)/2=log2; t=u^2 gives geometric 1->2; Pic(F/k)=0 gives vector height 0 versus empty degree [F:k] | Consistent; no change |
| 4.9 | raw 2/2=1; two conjugate half-masses push forward to one unit mass; P1 max square 0 versus FS square 1/2 | Consistent; no change |
| 5.1 | q=4,2,1,shift 1 give invariant defects -3,-1,0; q=1 fails uniqueness | Consistent; no change |
| 5.2 | constant elliptic family Betti rank 2<4; torsion section rank 0<2 and height 0 | Consistent; no change |
| 5.3 | generic small sequence gives 0<=h(Y)<=0; repeated point fails genericity; limiting probability mass 1 | Consistent; no change |
| 5.4 | g=1,2 squared norm ratio pi^-g gives shifts log(pi)/2,log(pi); raw 2h divided by 2=h | Consistent; no change |
| 6.1 | empty polarization over Q gives [1:2] height log2; zero polarization over Q(t) gives all heights 0 | Consistent; no change |
| 6.3 | [0],[1],[2] of height-a point give 0,a,4a; torsion 0; zero polarization also makes nontorsion height 0 | Consistent; no change |
| 6.4 | degree-two cover upstairs generic height 6 and base-height factor 2 gives slope 6/2=3 | Consistent; no change |
| 7.3 | banana deleted-edge resistance 1/2; density (1/2)/(1+1/2)=1/3,total 1; good reduction Dirac mass 1 | Consistent; no change |
| 7.4 | g=2,g=1 canonical degrees 2,0; normalized Green mean 0 becomes 1 under shift; positive line has mass d>0 | Consistent; no change |
| 7.6 | real usual norm squared: 4>2; Q2 ∣2∣=1/2 becomes 1/4,Green 1->2; trivial-model norm 1 | R01: qualify valid rescaling |
| 8.2 | admissible base metrics O(1),O(2) differ by O(1); ratio exp(-1); uniqueness only modulo base | Consistent; no change |
| 8.6 | Fourier sum 2^-n cos(2pi*4^n x) bounded by 1; curvature coefficients -2pi^2*8^n unbounded, excluding finite signed measure | Consistent; no change |
| 8.7 | principal canonical height a gives self-pairing -2a, twice-theta height 2a; base constant pairs to 0 | Consistent; no change |
| 9.1 | g=2,d=1 gives A+8b both sides; d=0 fibre degree and square 0; g=1 coefficient 2g-2=0 | Consistent; no change |
| 9.2 | g=2,3 canonical coefficients (8,32),(24,384); difference 8w+P,12w+P; shift 16Theta+32P,128Theta+384P | Consistent; no change |
| 9.3 | g=2,3 cancellations -1/8+32/256=0,-1/24+384/9216=0; excluded g=1 denominator 0 | Consistent; no change |
| 10.1 | genus-two unit loop (delta,epsilon,phi,tau)=(1,1/6,1/12,1/12); bridge (1,1,1,1/4); edgeless zero | Consistent; no change |
| 10.2 | loop and bridge give delta+epsilon-2phi=1,0=3delta/2-6tau; K4 phi/delta=17/288 | Consistent; no change |
| 10.3 | good reduction phi=0; loop phi=1/12, nonarchimedean a=2 gives 1/6; spectral term 2∣I∣^2/lambda>=0 for lambda>0 | R01: qualify valid rescaling |
| 10.4 | genus-two unit-loop Green E/log(e)=1/6=model-square minus admissible-square correction; good reduction 0 | Consistent; no change |
| 10.6 | Phi=P-D^3=1/12 on loop, so D^3=P-1/12; two Chern factors require the square, not curve | Consistent; no change |
| 10.7 | g=2,3 coefficient 12g-4=20,32; g=2 expansion 8-24+24+12=20; phi coefficient -8 | Consistent; no change |
| 10.9 | g=2 coefficient product (2g+1)(g+1)/(g-1)^2=15; 1+19.5*15=293.5<=300; Hodge coefficient 1/25 | Consistent; no change |
| 10.10 | modified diagonal contribution 1-2+1=0; hyperelliptic phi=5,W=2 gives (5/2)*2-5=0; doubling both remains zero | Consistent; no change |
| 10.13 | unit loop Xi=1+1/6=7/6; good reduction 0; geometric Pic(Spec Q/Q)=0 | Consistent; no change |
| 10.14 | t=e^-n,a=1/n gives ∣t∣^a=e^-1; arch epsilon=0 versus boundary epsilon=1/6 prohibits continuous global epsilon | Consistent; no change |
| 11.1 | g=2,a=1/156 gives boundary coefficient 1/78; t=e^-n gives growth n/78+O(1)->infinity | Consistent; no change |
| 11.2 | Spec F4/F2 empty degree=volume=2>0; positive Hodge degree times 1/25 remains positive | Consistent; no change |
| 11.3 | quadratic K empty generic degree=2; raw lower bound 4c0/5,normalized 2c0/5 | Consistent; no change |
| 11.4 | g=2 over F4/F2: deg_F4 omega=2,deg_F4 i_omega*Theta=16; absolute 32 divided by 8=4 | Consistent; no change |
| 12.2 | S=Spec F4/F2,Y=P1,L=O(2),m=1,2 gives selected degrees 4,8; full m=2 top degree 16; a^m[F:k]=2^m*2 | Consistent; no change |
| 12.3 | same point base pairing big,volume 2; O(2) big; over positive-dimensional base pure fibre line has top degree 0 on every power | Consistent; no change |
| 12.4 | three points on P1 give degree 3; square grid degree 9,codim2, sqrt9=3; empty set size 0 | Consistent; no change |
| 12.5 | g=2 positive terms Abel 2P,difference 8w+P,shift 16Theta+32P | Consistent; no change |
| 12.6 | P1Z O(1) has degrees 1 at 2,3; arithmetic O(c) forgets to geometric 0; x^2-2 mod2 gives nonintegral F2[x]/x^2, excluded | Consistent; no change |
| 13.4 | g=2 W=1/30>=(1/5)(1/12)=1/60; hyperelliptic coefficient 2/5 gives equality; c(3)=17/288 | Consistent; no change |
| 13.5 | coefficient g=2,3,4,5 values 429/4,1648/17,139,877/8 all <144; constant height-zero family excluded from positive lower bound | Consistent; no change |
| 13.8 | K4 D=107/48; D-delta=-181/48; D-cdelta=15/8>0 | Consistent; no change |
| 13.9 | g=2,3,4 coefficients 439/4,3415/34,142<144; log sum 2glog(2pi^4)+4glog(2pi)=6glog(2pi^2) | Consistent; no change |
| 13.10 | H=max(1,24∣c5∣): h<=H gives max(h,1)<=H and W>=c'; h>=H gives W>=h/24; choose min(1/24,c'/H)>0; geometric g2 constant 4^-16/12 | Consistent; no change |

For R01 the repaired real square-root test is √2≤2, while the rejected usual-real square test is 4>2. For the final comparison, set H=max(1,24|c₅|) and c₃=min(1/24,c′/H), with c′=((g−1)/(2g+1))c₀>0. On h≤H, W≥c′≥c₃ max(h,1); on h≥H, W≥h/24≥c₃h. Thus the intermediate range between h=1 and the large-height regime is covered, not skipped.

The remaining target probes include tensor and principal relations, boundary growth exclusions, effective sections, norm composition, finite-cover positivity in both directions, good versus bad reduction, section evaluation and adjunction, and restriction to nonreduced fibres. In particular, on E/𝔽₅ given by y²=x³+3x+2, the four affine points are (1,±1),(2,±1), so E(𝔽₅) has order 5. Frobenius kills the pulled-back class of a nonzero rational 5-torsion point; the universal structure-sheaf pushforward hypothesis in §3.4 is essential and present. The ordinary injectivity target is not asserted for arbitrary finite covers.

### Pinned library and ownership audit

The pins read from `lake-manifest.json` are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches used objects as well as declaration names: invertible sheaves, degree, canonical height, adelic metrics/intersections, Deligne pairing, graph resistance, Moriwaki polarization and Faltings height. Generic adeles, restricted products, or graph combinatorics do not supply these missing geometric/metric carriers.

| Declaration opened at the pin | File and line | What it supplies and what it does not |
| --- | --- | --- |
| `NumberField.prod_abs_eq_one` | `Mathlib/NumberTheory/NumberField/ProductFormula.lean:98` | Product formula with nonzero argument and infinite-place multiplicities; f=2 gives cancellation. It does not define adelic line bundles. |
| `Projectivization.logHeight` | `Mathlib/NumberTheory/Height/Projectivization.lean:51` | Relative height on projective space under field, finite index and admissible-absolute-value assumptions; quadratic-field [1:2] gives 2log2 before division. |
| `TauCeti.AlgebraicGeometry.InvertibleSheaf` | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:112` | Full subcategory of rank-one locally free module sheaves. Its maps are module maps, not necessarily isomorphisms or isometries; no metric field. |
| `TauCeti.AlgebraicGeometry.AbelianVariety` | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Proper geometrically integral group object. Dimension zero is allowed; canonical adelic metric is not included. |
| `InvertibleSheaf.eulerDegree`, `LineBundleClass.eulerDegree` | `TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:70`, line 126 | Difference of Euler characteristics through H¹. The definition alone does not assert finiteness or arithmetic intersection properties. |
| `InvertibleSheaf.eulerDegree_canonicalBundle` | `TauCeti/AlgebraicGeometry/LineBundle/SerreDuality.lean:168`, standing assumptions at lines 48–55 | Canonical degree with integral Noetherian separated scheme, DVR stalk, valuative, coheight, function-field, constant-field and properness assumptions. Values 2,0 at genus 2,1 are already supplied. |
| `WeierstrassCurve.Affine.Point.canonicalHeight` and torsion criterion | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:119`, line 332 | Elliptic height from the x-coordinate limit; torsion equivalence uses ellipticity and Northcott. It is not the Moriwaki height of a general abelian variety or its relative admissible metric. |
| Additive seminorm triangle law | `Mathlib/Analysis/Normed/Group/Seminorm.lean:69` | Actual triangle inequality, ruling out the squared usual real norm used in R01. |

The board package index was read before checking ownership. The roadmap service was used to search open heads and main and to open every cited supplier; local main/board/pinned searches supplemented it. Relevant current open-head constructions were read, including ArithmeticDynamics, TropicalAndBerkovichArithmetic, GrossZagierAndArithmeticHeights, HeightsRationalPointsAndObstructions and JacobianChallengePartII. GenericDoublePointInterpolation and EffectiveBoundsPartII's polynomial-grid statements do not define the scheme-theoretic mixed degree needed by §12.4. The board's HeightsRationalPointsAndObstructionsPartII design consumes this package's height/bigness results; it is not used as an earlier supplier. No fully qualified Lean-name collision is possible here because this Suggested.lean declares no names.

Cross-roadmap references were resolved again, not carried forward from the previous verdict. The following table gives the consumed section ranges and representative actual file locations inspected. Paths are `TauCetiRoadmap/<name>/README.md` unless specified otherwise.

| Supplier | Sections resolved and representative lines | Ownership conclusion |
| --- | --- | --- |
| ArakelovGeometryAndAbelianHeights | §§1.1–1.3, 1.7–1.10, 1.12–1.15, 2.1, 2.7–2.8, 3.4, 5.0b, 5.3–5.4, 5.9, 6.5; lines 155, 414, 683, 839, 1026, 1359, 1445, 1736 | Hermitian degrees, squared Green convention, Faltings metric/stable height, Hodge compactification and Bost input remain imported. Continuous arbitrary-base and relative admissible extensions belong here. |
| HeightsRationalPointsAndObstructions | §§0.11, 0.16, 0.18–0.20, 0.26–0.29, 5.17a–5.17b, 5.17d–5.17f; lines 233, 407, 2705, 2736, 2776, 2797, 2813 | Relative heights and singular-projective arithmetic intersection/analytic inputs are present. No second projective intersection construction is claimed. |
| ArithmeticDynamics | §§4.1a, 4.3, 4.3a, 4.4, 4.40; lines 5878, 5896, 5912, 5926, 6749 | Positive top powers, Siu, global-field completion and equidistribution remain owned there. The present mixed signed extension and arbitrary-base completion are compared explicitly in §4.9. |
| SchemeAndStackFoundations | §§0.3, 0.20–0.21, 3.5, 4.11–4.12, 5.1–5.3, 5.5–5.6, 5.12; lines 551, 1302, 1394, 4876, 5528, 5613, 6567, 6653, 6701, 6768, 6921, 7336 | Models/flattening, norms, cycles, total residue-field degree, exterior products and Bézout are supplied. Nullary degree includes inseparable extensions. Geometric volume is not falsely attributed to this supplier. |
| ComplexComparisonPartII | §C5.4, line 3018 | Smooth complex current and cycle calculus is present. Singular Bedford–Taylor regularization is precisely the declared extension contract. |
| TropicalAndBerkovichArithmetic | §§0.1, 0.12, 0.15, 0.22–0.23, 2.7, 2.13, 3.1, 3.3, 6.1–6.4, 6.6–6.8; lines 189, 396, 455, 638, 673, 1170, 1265, 1469, 1522, 2049, 2094, 2120, 2145, 2204, 2239, 2279 | Banach points, skeletons, graph Laplacian, measures and curvature comparison agree. §6.4 includes its arbitrary-base net/Riesz extension after the countable-density case; that case alone was not mistaken for the whole contract. |
| GrossZagierAndArithmeticHeights | §§2.2–2.4, 2.8, 2.10, 2.12–2.13; lines 713, 740, 765, 845, 904, 956, 970 | Probability normalization, unsquared Green convention, archimedean metrics, −2 times height and real descent agree. |
| JacobianChallengePartII | §§1.2–1.4, 2.2, 2.4–2.7, 3.1, 3.3–3.13, 4.5–4.9, 5.1–5.2, 6.3; lines 211, 257, 314, 343, 355, 367, 430, 472, 547, 707, 737, 769, 799, 809, 1034 | Relative Jacobian, algebraic maps, negative Poincaré convention, positive dual-diagonal twice theta, torsion cokernel and Hodge comparison are imported. Degree-zero Abel maps are not declared finite. Layer 9 adds the metrized identities. |
| NeronModelsAndSemistableAbelianVarieties | §§3.3, 3.9–3.12; lines 1355, 1618, 1644, 1688, 1716 | Identity-component base change and differential lattices, not full-model base change. Excellent DVR and separable-extension qualifications are present. |
| MotivesAndAlgebraicCycles | §§2.2–2.3; lines 352, 369 | Chosen Weil cohomology, geometric cycle classes and homological-triviality predicate. No unconditional general Beilinson–Bloch height is imported; the special modified-diagonal height is owned here. |
| StableReductionPartII | Gap contract §MC.4–MC.6; package README lines 117–119 and matching design gap | Its unfinished section interfaces are contractual. Fine level, boundary thickness, Noether isomorphisms and arbitrary-field Hodge positivity/descent have a named owner. The resolver's missing-roadmap lead is therefore not supplier drift. |

The two gap slugs agree between `design/plan.json` and the README: `singular-pluripotential-products` and `curve-moduli-noether-positivity`. Their hypotheses and requested interfaces are explicit; they do not re-request an existing metric completion or algebraic curve degree. They remain prerequisites for eventual implementation, but are not findings. An accepted later review can record these two conditional gaps.

### Supplier order and dependency check

The required dependency check completed with exit code 0 and exactly this output:

```text
depcheck: 55 roadmaps, 623 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. All individual Needs lines and supplier citations were read against the contracts. Internal dependencies proceed from model and arbitrary-base constructions to admissible metrics, graph/global corrections, bigness and height comparison. No prerequisite was inferred merely from a bibliographic citation where an owned input was required.

### Headline coverage and Lean acceptance test

The README's end theorems are §§11.2–11.4 (maximal-variation nefness and bigness), §12.3 (potential-bigness criterion), §12.5 (theta applications), and §13.10 (uniform comparison with max(h,1)). The deep intermediate families below were checked too. All are named in the module docstring with the missing carriers; none is replaced by a free scalar assertion or a premise containing its conclusion.

| README headline family | Missing pinned carrier named in Suggested.lean |
| --- | --- |
| §§0.2, 3.2–3.3: metrized Deligne pairing, base change, projection | Relative Deligne pairing and continuous hermitian metric |
| Layers 1–2: arbitrary-base completion, realization, full faithfulness | Boundary-completed adelic divisor/line-bundle and global analytic realization |
| §§4.3–4.8: Hilbert–Samuel, Siu, pairing positivity, height/fundamental inequalities | Adelic intersection, volume and normalized height |
| §§5.1–5.3: invariant extensions, nondegenerate height inequality and consequence | Relative metric, local measure and nondegeneracy |
| §5.4: Hodge bundle and stable-height identity | Hodge metric, adelic Hodge line, stable Faltings height |
| Layer 6: Moriwaki height machine, Northcott, kernel, specialization | Arithmetic polarization and general intersection height |
| Layers 7–8: local and family admissible metrics; relative Hodge index | Berkovich curve metric and relative admissible bundle |
| Layer 9: arbitrary-degree metrized theta formulas and nefness | Canonical metrized theta, admissible bundle, Deligne pairing |
| Layer 10: graph bounds, global corrections, Hodge decomposition, Gross–Schoen | Polarized compact metric graph/resistance, Green kernel, adelic divisor, cycle-height pairing |
| §11.1: uniform archimedean φ positivity | Canonical Riemann-surface Green kernel and φ |
| §§11.2–11.4: maximal-variation bigness | Admissible bundle, adelic nef/big predicates and intersection |
| §§12.3, 12.5: criterion and theta applications | Relative adelic bundle, Deligne pairing and bigness |
| §12.4: arbitrary-curve product grid | Scheme-theoretic mixed degree of closed subsets of curve powers |
| §§13.3–13.10: correction, lower estimates and uniform height comparison | Canonical self-intersection, local invariants and stable Faltings height on curves |

These are substantial constructions, not a few simple definitions on native carriers. The existing elliptic canonical-height API does not make the general Moriwaki or curve-admissible assertions statable. Nor does a polynomial-grid theorem supply the scheme-theoretic mixed degree. No statable omitted headline or padded substitute was identified.

`Suggested.lean` has one `import Mathlib`, the prescribed module docstring and namespace, and zero declarations. The required `lake env lean` elaboration was run from the pinned content checkout with the package file as absolute input; it exited 0 with no output and **no warnings**. No Tau Ceti object build was needed. The requested own-declaration `#check @name` audit and one-tactic probes each have zero cases: there are no binders to lose and no sorried theorem to probe. No dummy declarations were introduced to manufacture a test count.

## Not verifiable

- `moret-bailly-1989`, Théorème 2.5, printed pp. 491–498: the primary text remains settled uncertified. Its Noether normalization was checked through yuan-2026 lines 2992–3001; this is not a certification of the inaccessible primary proof. No new request was made.
- `faltings-1984`, Theorem 6 and printed pp. 401–402 for δ: the primary text remains settled uncertified. The used δ identity and bounds were checked through wilms-2017 and the displayed Yuan comparison. No new request was made.
- Implementations of the two declared supplier gaps are not present as completed library APIs. Their precise contracts and matching declarations were checked; their future implementations cannot yet be reviewed. This does not create an additional finding.

No seeded target was left unread for want of another source. Ownership was checked against the indexed, readable roadmap heads and main; no unprovided checkout or inaccessible open-head content is silently asserted to have been examined.

## Source issues

- **Misprint** in yuan-zhang-2025 at §3.2.2, printed p. 72 (line 2632): the source says the Green-to-metric conversion uses exp(−g/2); it should be exp(−g) with its displayed −log norm convention; affects a stated result.
- **Error** in yuan-zhang-2025 at Proposition 4.1.1, printed pp. 103–104 (line 3857): the source says the distinguished-entry intersection has d−1 remaining entries without a positive-dimension qualification; it should be restricted to d≥1, with nullary degree treated separately; affects a stated result.
- **Error** in yuan-2026 at §3.3.1, printed p. 49 (line 1660): the source says normalized graph length descends by total extension degree; it should descend by ramification index when the new uniformizer is normalized; affects a stated result.
- **Misprint** in yuan-2026 at §3.3.2, printed p. 50 (line 1709): the source says the two-Chern-factor Green integral is over the curve; it should be over the analytification of the curve square; affects a stated result.
- **Error** in yuan-2026 at proof of Theorem 4.14, printed p. 94 (line 3208): the source says the geometric divisor minus the entire boundary is effective; it should subtract c(g) times the boundary; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9138ccddc86d3d39a610c7023a2cb9638b9cb0d2", "job": "REV-PKG-ArakelovGeometryAndAbelianHeightsPartII~4", "model": "gpt-6-astra", "worker": "chris-30"} -->
