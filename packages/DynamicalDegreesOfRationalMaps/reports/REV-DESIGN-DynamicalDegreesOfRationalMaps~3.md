# Review of DynamicalDegreesOfRationalMaps (design, round 3)

**Verdict:** needs changes

One P2 finding. All six findings from round 2 are repaired. The new finding is a missing hypothesis in the machine-readable plan; the corresponding README statement is correct. No finding is re-raised as previously not actionable. This is a design review, not package acceptance or a Lean build.

## R01 (P2) — The plan loses the positive-iterate hypothesis

**Location.** `packages/DynamicalDegreesOfRationalMaps/design/plan.json:1382`, target 6.3, “Fibonacci map [yz : xy : z^2]: f^n = …”; its hypotheses at line 1383 contain no restriction on n. Compare `packages/DynamicalDegreesOfRationalMaps/design/README.md:679`, which correctly says “For `n ≥ 1`”.

**Claim.** The plan states the homogeneous-coordinate formula for fⁿ without the README's n ≥ 1 condition. The Conventions explicitly include f⁰ = id and use Mathlib's natural Fibonacci numbers.

**Witness.** At n=0, Nat subtraction gives fib(0−1)=fib(0)=0, fib(1)=fib(2)=1. The claimed tuple becomes [1:y:z], of coordinate degrees 0,1,1, whereas f⁰=[x:y:z].

**Exact repair.** In target 6.3's statement and hypotheses, restrict the coordinate tuple to n ≥ 1, as the README already does. State f⁰ = id separately; the degree formula deg(fⁿ)=fib(n+2) may still include n=0. Add a plan Check distinguishing the n=0 identity from the invalid substituted tuple. Preserve the existing positive-iterate formulas.

**Repair test.** At n=0 the separate identity gives [x:y:z] and degree 1=fib(2). The excluded tuple is not even well defined on projective representatives: [2:3:1]=[4:6:2] over ℚ would give [1:3:1] and [1:6:2], which are not proportional. At n=1,2,3 the restricted formula gives [yz:xy:z²], [xyz:xy²:z³], [xy²z²:x²y³:z⁵], of degrees 2,3,5. This repairs the exact failing instance without narrowing the dynamical theorem.

## Verified sound

### Previous findings, checked first

The quotations below are from `packages/DynamicalDegreesOfRationalMaps/design/README.md`; the matching plan entries were also read. Each quote is under 40 words.

| Round-2 finding | Repaired passage | Status and verification |
| --- | --- | --- |
| R01, composition | §6.1, line 639: “Let `f = [F]` be dominant and `g = [G]` any rational map”; line 640: “Its iterates are taken in the composition of morphisms” | Repaired. The constant-at-a-Cremona-base-point tuple substitutes to (0,0,0) and is excluded; constant morphism iterates are still included. Squaring followed by Cremona gives degree 4=2·2. |
| R02, ownership | §3.1, line 310: “Nefness is imported”; §3.2, line 329: “This subsection adds nonintegral `Z`, the Euler-characteristic numbers and positive real combinations” | Repaired. AlgebraicModuliForArithmeticGeometryPartII §§0.1,1.5,1.7 supplies curve components, nefness and Kleiman. The redundant gap is removed from both files. §3.4 imports the positive-square smooth Hodge theorem from SchemeAndStackFoundations §5.10. |
| R03, finite rank | §1.4, line 214: “If `dim X > dim Y`, the finite-basis argument does not apply” | Repaired. Projection ℙ²⇢ℙ¹ has transcendence-degree difference 1 and totalized e=0 before and after extension; no zero-rank basis is asserted. Squaring has basis {1,z}, rank 2, also in characteristic 2. |
| R04, product target | §1.3, line 188: “as the scheme-theoretic image of the `K`-morphism `(ι_U, f_U, (g∘f)_U) : U → X ×_K Y ×_K Z`” | Repaired. For ℙ¹_ℂ over ℝ, Y×Z has two components; the direct image is the integral triple diagonal, with all graph projections of degree 1. |
| R05, pins | Contract line 60: “Mathlib/Analysis/Subadditive.lean:33, 106, 109, 155”; line 73: “`AlgebraicGeometry.Scheme.Hom.isReduced_image`” | Repaired. Pins match the manifest. Native ampleness, curve intersections, reduced images and dominant-morphism field maps are now consumed. All named declarations were reopened locally; see inventory below. |
| R06, coefficients | §4.1, line 449: “For a proper `K`-scheme `T` put `CH_*(T)_ℝ = CH_*(T) ⊗_ℤ ℝ`” | Repaired. √2·O(1) pulls back to √2[point] of degree √2 in real Chow homology; O(1) gives the integral class of degree 1. The linear extension uses the supplier's additive first-Chern action. |

Pattern searches covered dominance and composition in §§1.1,1.3,4.4–4.5,5.1,6.1–6.4; finite-degree use in §§1.1–1.4,4.1–4.4; geometric integrality in §§1.4,2.4,4.3,5.3; nef ownership in Conventions and Layer 3; real coefficients in §§2.2–2.3,4.1; and all library contracts. None of the six repaired defects survives. R01 above is a distinct plan/README mismatch exposed by the n=0 pass.

### Mathematical pass with computed values

Read all 27 targets and their APIs, all 102 planned Checks, the conventions and worked examples. The seven definition/construction targets have API lists and respectively 6,5,4,3,4,3,4 Checks (§§1.1,1.2,1.3,2.3,4.1,5.1,5.4). Recomputed all changed passages, all 15 seeded targets and the headline families. Untouched material was compared with the computed rows of the round-2 report, not its uncomputed assurances. Closely related API claims are grouped below to keep the report within the comment limit.

| Statement / API | Instances | Computed values on each side / defining tests | Result / change |
| --- | --- | --- | --- |
| Conventions: composition, degree direction, ampleness | f(z)=z², g(z)=z+1; ℙ¹ | f.comp g at 1 is 2; reversed order is 4. Target-count degree gives (deg₀,deg₁)=(1,2), not (2,1). O(1) has two affine section charts; nonzero sections of O have nonaffine locus ℙ¹. | Correct. |
| §1.1 pullback, determination and degree | z² over char 0 and 2; id; projection ℙ²⇢ℙ¹; constant | z↦z²; [K(z):K(z²)]=2 in both characteristics, separable degree 1 in char 2. Two squares give 4=2·2. Identity gives 1; projection finrank=0 with trdeg difference 1. Constant has no dominant field pullback. | Correct; map-specific birationality excludes z² even though the pair ℙ¹,ℙ¹ is birational. |
| §1.2 graph and projections | id, z², Cremona, linear projection, constant | Graph dimensions d,1,2,2,1. First projection degree 1 in each case. Second degrees 1,2,1,0-junk,undefined respectively; the projection's fibres are ℙ¹. Constant second image is one point. | Correct. Reducedness uses a quasi-compact map from integral U; no ambient-product integrality needed. |
| §1.3 correspondence and degree | two squares; σ²; ℙ¹_ℂ/ℝ | W→Γ_g has degree 2, whereas composite degree is 4. σ² has graph the diagonal and all generic projection degrees 1. ℂ⊗ℝℂ=ℂ×ℂ has two factors; W is one triple diagonal of dimension 1. | Repair verified. |
| §1.4 normalization/base change | cusp; projection ℙ²⇢ℙ¹; z²; ℙ¹_ℂ/ℝ | Normalization generic degree 1. Projection gives e=0=0, but 1,v,v²,… remain independent. Square gives rank 2=2. Base-changed real identity graph has two components. | Repair verified; finite-basis argument used only in equal dimensions. |
| §2.1 component formula | double point; line plus isolated point; reducible conic | Empty intersection 2=2·1; coefficient of n in (n+1)+1 is 1=1+0; conic degree 2=1+1. | Correct; generic lengths retained and lower-dimensional component ignored. |
| §2.2 Chow comparison | ℙ²; ℙ¹×ℙ¹; surface Riemann–Roch | H²=1 on both sides. h₁h₂=1 and h₁²=0; χ(O(a,b))=(a+1)(b+1). Mixed coefficient in ½(n₁D₁+n₂D₂)² is D₁D₂, with no extra factor 2. | Correct. |
| §2.3 real extension | √2h₁+h₂; −H on ℙ¹; h₁+h₂; z² | Squares 2√2 and 2; individual ruling squares 0. Negative degree −1 excludes nefness. Pullback degree of tH is 2t=2·t. | Correct on explicitly defined finite positive combinations; no identification with every class of the full nef cone. |
| §2.4 constants and multiplicity | ℙ¹_ℂ/ℝ; pointless real conic; Spec F/K | c=2, degree 2=2·1; c=1, degree 2=2; dimension zero gives [F:K]=[F:K]·1. | Correct. |
| §2.4 imperfect field and ample pullback | K=𝔽₂(t), conic x²+ty²; ℙ¹_Q̄→ℙ¹_Q | Cotangent dimension at vertex 2>1. χ=2n+1; normalization ℙ¹_K(√t) has χ over K equal to 2n+2. Leading coefficients 2=2. Base change gives 2[line]. Infinite extension is affine, not finite. | Correct; normalization before constants and quasi-affine ample pullback are essential. |
| §3.1 numerical nef interface | O(a,b); ℙ¹_ℂ/ℝ; blow-up | Ruling degrees b,a. O(1,−1) has −1. O(1) over ℝ has degree 2=1+1 geometrically; O(−1) gives −2=(−1)+(−1). Pullback H on blow-up has square 1 and exceptional degree 0. | Imported nefness agrees with numerical intersections; no new nef carrier. |
| §3.2 Kleiman interface | double line; h₁²; h₁h₂; real sum | Degrees 2=2·1, 0, 1, and (√2h₁+h₂)²=2√2. Non-nef O(1,−1) has square −2. O(1,0)+O(1,1)=O(2,1), square 4. | Correct extension to multiplicities and real coefficients. |
| §3.3 Siu | A=(1,1), B=(1,0), C=(0,1), then C=(1,0); r=1 | 2≤2; 0≤2; curve case AB=BA. With non-nef B=(1,−1), 2≤0 fails. Volume lower bound p^(r−1)[pA^r−rqA^(r−1)B] is positive under the displayed strict condition. | Correct; volume/bigness supplied by ArakelovGeometryAndAbelianHeightsPartII §0.3. |
| §3.4 Hodge inequality and reduction | ℙ¹×ℙ¹; quadric cone; blow-up with H=2L+E; two-point blow-up | H=(1,1), D=(1,−1): 0≥−4. Cone H=D=O(1): 4=2·2. H²=3, H·E=−1: D=E gives 1≥−3; D=L gives 4≥3. H=E₁,D=E₂ instead gives 0<1, excluded by H²>0. | Correct without nef H; both sides scale by c² and δ² in reductions. |
| §3.4 orthogonal combination | H=2L+E, D=L | D″=3L−2(2L+E)=−L−2E; D″H=0; D″²=−3=3(3−4). | Supplier Hodge index applies exactly; no duplicated smooth-surface proof. |
| §3.5 mixed Hodge/log-concavity | rulings; A=(2,1),B=(1,1); disconnected planes | 1≥0; 9≥8. For aH,bH, s_k=a^k b^(d−k) gives equality. Disconnected planes give 16<25. | Integrality and generic irreducible slices required; multiplicity μ scales both sides by μ². |
| §3.6 product Siu | (ℙ¹)³ with B=h₁+h₂+h₃,A₁=h₁,A₂=h₂,C=h₃; i=r | B³=6, A₁A₂C=1, A₁A₂B=1, B²C=2: 6≤8. Telescope x=(1,2,2), y=(1,2,6) gives 1≤2 and 2≤8/3. i=r gives identical products. | Correct constant; denominators positive after ample perturbation. |
| §3.6 negative control | two planes, B=(O(1),O(2)), A=C=(O(1),O) | Left 5·1=5; right 2·1·1=2. | Reducible-support generalization is false and excluded. |
| §4.1 definition, models, integral/real cycles | square on ℙ¹; id with M=√2H; Cremona | Basic degrees (1,2). Degree-2 model gives 2=2·1 and 4=2·2. Integral H gives [point], degree 1; √2H gives √2[point], degree √2; zero gives 0. Cremona product degree=2. | Repair verified; real output is CH⊗ℝ. |
| §4.2 endpoints, integrality, positivity | Cremona; Frobenius; id with ruling polarization | (1,2,1); Frobenius deg_k=p^k and e=p^d. Non-big h₁ gives deg₁(id)=0; h₁+h₂ gives 2>0. | Correct; no division by a zero top self-intersection. |
| §4.3 normalization/field extension | cusp with O(1); ℙ¹_ℂ/ℝ; Cremona ℚ→ℂ | Pullback O(3), degree 3=3; real graph degree 2=1+1; Cremona (1,2,1) on both fields. | Correct cycle interpretation where base change is reducible. |
| §4.4 sub-multiplicativity | two squares; σ²; Frobenius then square; endpoints | 4≤1·2·2=4; 1≤2·2·2=8; 2p=p·2. k=0 gives L₁^d=(L₁^d)(L₂^d)/(L₂^d). | Correct. Denominator e(f₁)L₂^d>0; generic degree cancels once. |
| §4.5 uniform comparisons | swap on ℙ¹×ℙ¹, ω=(1,1),ω′=(2,1); ℙ¹ | Degrees 2,5; mixed intersection 3; volumes 2,4; c=9/4,c′=9/16,C=9; 5/2 lies in [1/9,9]. Curve degree ratio is deg ω′/deg ω for every f. | Correct quantifier order: C precedes f. |
| §5.1 limit and exact infimum | degree-2 ℙ² morphism; id with ω=H/2; Cremona | Limits (1,2,4); adjusted first terms (1,4,4). For id,k=1, degree=1/4,C=8, adjusted term=2, root limit=1. u₀=k log(d−k+1)≥0 and u₀/0=0. Cremona alternates 2,1 and roots tend to 1. | Correct Fekete normalization and bounded-below divided sequence. |
| §5.2 properties | Frobenius; Fibonacci; squaring iterates | p^(2k)=p^(k−1)p^(k+1); (1,φ,1) with φ²=φ+1≈2.618≥1; λ₁((z²)^m)=2^m. | Correct positivity, endpoints, log-concavity, iterate and λ_k≤λ₁^k laws. |
| §5.3 invariance | conjugate Cremona; cusp id; real complex line id | λ₁=1 before/after conjugation; 3^(1/n)→1 on both normalization models; 2^(1/n)→1 using both geometric graph components. | Correct. |
| §5.4 entropy | degree-2 ℙ² morphism; Cremona; Fibonacci; n=0 | log e=log4=h=2log2; h=0; h=logφ≈0.4812 with 0≤h≤2logφ; h(f⁰)=0=0h(f). Maximizers {2}, {0,1,2}, {1}. | Correct interval and entropy laws; no topological-entropy claim over arbitrary fields. |
| §6.1 forms/composition/morphism iteration | common-factor identity; constant into σ base point; squared coordinates with σ | (x²,xy,xz)/x=(x,y,z), degree 1. Constant gives substituted (0,0,0), excluded. σ² reduces xyz(x,y,z) to degree 1<4. Squaring before or after σ gives degree 4=2·2. Constants have degrees 1 at n=0 and 0 for n≥1. | Repair verified; classification still includes nondominant maps. |
| §6.2 degree formulas | Cremona; Frobenius p=2,3; degree-2 ℙ² morphism | Cremona recursion 2≤2,1≤4; Frobenius degrees 1,p,p²; morphism iterate degrees (1,2^n,4^n). Exceptional divisor projects into codimension 2, giving A^(d−1)E=0. | Correct; inseparable degree retained. |
| §6.3 standard examples and boundary | Fibonacci n=0,1,2,3; Cremona d=3 | README n≥1 gives homogeneous degrees 2,3,5. Plan n=0 instead gives coordinate degrees (0,1,1), versus identity degree 1. Cremona degree 3 then 1<9, e=1 and all λ=1. | R01: add the missing plan bound; positive iterates and README correct. |
| §6.4 affine maps | (x²,y); Hénon; (y,z,x+yz); (x,xy) | Extensions have degrees (1,2,2), λ=(1,2,2), e=2 in first case. Hénon inverse (v−u²,u), e=1, degree sequence 2^n. Three-variable inverse (w−uv,u,v), degrees 2,3,5, λ₁=φ. (x,xy) misses (0,1) and has a full line over (0,0). | Correct; proper plus affine gives finite, dominant plus proper gives surjective. |

All five worked-example rows agree with these values. The zero-dimensional intersection convention is retained (empty product is field degree/length); the dynamics explicitly assumes d≥1. Nonreduced cycles, inseparability, small characteristic, identity maps, negative coefficients, non-big nef classes and non-dominant composition were tested. All logarithm arguments and division denominators in the actual routes are positive. The graph constructions name source and target and determine the image rather than merely postulating projection properties.

### Sources and seeded sample

The manifest has 15 works: 13 readable legal cached extractions and two settled uncertified books. No new source was required, no source was fetched, and the manifest was not changed. All 15 seeded sections were checked. The plan flags only the settled Lazarsfeld/Fulton locators as uncertified; they remain listed under Not verifiable. The table gives the cached version's page, not an unverified journal-page correspondence. Guedj PDF pages differ from printed pages by two.

| Seeded target | Source text opened | Support and qualification |
| --- | --- | --- |
| 1.1 | stacks-morphisms line 6046, Definition 52.8/tag 02NY, p.132; dinhsibony2005 line 69, p.2 | Integral, dominant, locally finite type, generically finite gives the full function-field degree. Complex generic-preimage count is only motivation; inseparable degree follows from the algebraic definition. Native morphism pullback supplies the construction. |
| 1.2 | dinhsibony2005 line 45, p.2; dang2020 line 21, p.1; guedj2010 line 1099, printed p.29/PDF31; stacks-morphisms line 488, Lemma 6.7, p.11 | Graph/projection convention agrees. Analytic sources are complex; the arbitrary-field result is the design's scheme-image construction, using the reduced-image theorem. |
| 1.3 | dang2020 line 1285 through line 1334, proof of Theorem 5.2.1, pp.25–26 | The auxiliary graph diagram supplies the common model and degree direction. The design extends that construction through direct image from integral U, avoiding the nonintegral-product defect. |
| 2.2 | stacks-chow line 3995, Lemma 41.4/tag 0BFI, pp.82–83, proof through line 4026 | Exact proper-field comparison including dimension-d fundamental cycle. Component reduction, Chow modification, divisor difference and restriction induction match. |
| 2.4 | stacks-varieties line 691, Lemma 8.6/tag 054Q, p.15; stacks-morphisms line 3862, Lemma 38.7(2)/tag 0892, p.85 | Separable algebraic closure of constants controls geometric irreducibility. The stronger algebraically closed constants obtained after normalization suffices. Ample pullback is along a quasi-affine map, not assumed finite. |
| 3.4 | kleiman2005 line 3803, Theorem B.27, p.79; cutkosky2015 line 994 through line 1003, p.22 | Kleiman uses geometric irreducibility and H²>0, not nef H; Cutkosky discusses arbitrary fields. The design's constants/alteration route supplies the additional generality. |
| 4.1 | dang2020 line 21, p.1; dangfavre2021 line 436 and footnote at line 452, p.12; dinhsibony2005 line 61, p.2; russakovskiishiffman1997 line 499, p.13 | Target exponent convention and degree/pushforward comparison agree. Generic-degree scaling follows from the projection formula; real coefficients use CH⊗ℝ. Fulton remains uncertified. |
| 4.2 | dangfavre2021 line 454, footnote 5, p.12; russakovskiishiffman1997 line 506 through line 511, p.13 | Integral line-bundle degrees, top degree and morphism formulas agree. General positivity is independently obtained from imported nefness and §3.6; complex point counting is not used for inseparable maps. |
| 4.3 | dang2020 line 18, p.1; truong2020 line 1529, §6.3, p.36 | Truong explicitly notes reducibility after algebraic closure. The design correctly retains the full fundamental cycle and asserts a map between integral base changes only under geometric integrality. |
| 4.5 | dang2020 line 31 through line 41, Theorem 1(ii), p.1; dangfavre2021 line 457, Theorem 1.3 second item, p.13; dinhsibony2005 line 256, Corollaire 7, p.7 | Constants uniform in f and birational invariance supported. The explicit constant here follows from two applications of §4.4 and passes the 2-versus-5 test. |
| 5.1 | dangfavre2021 line 461, p.13; dang2020 line 42, p.1; dinhsibony2005 line 256, p.7; silverman2014 line 383 through line 413, Proposition 7, pp.9–10 | Adjusted sequence is submultiplicative; the design includes the necessary C in its infimum. Silverman's C=1 case concerns projective-space degree only. |
| 5.4 | dinhsibony2005 line 33, Théorème 1, p.1; guedj2010 line 1178, Théorème 2.4, printed p.31/PDF33 | Maximum of logarithms matches the algebraic entropy quantity. Bounds/iteration follow from the design's λ API. Dinh–Sibony's complex topological-entropy theorem is not imported over arbitrary fields. |
| 6.2 | russakovskiishiffman1997 line 516, Lemma 4.4, pp.13–14, and line 582, Lemma 4.6, pp.14–15; guedj2010 line 1141, Example 2.2, printed p.30/PDF32; silverman2014 line 350 and line 387, p.9 | Degree and composition inequalities supported in their complex setting. The design's effective-divisor argument supplies arbitrary-field recursion and the first-degree equality. |
| 6.3 | silverman2014 line 358, Example 5, p.9; guedj2010 line 1272, Example 2.5, printed p.33/PDF35; russakovskiishiffman1997 line 542, p.14; truong2020 line 1542, §6.4, p.37 | Positive Fibonacci iterates and Cremona examples agree. Source regularity assertion is false but not copied. The plan must retain the positive-iterate domain (R01). |
| 6.4 | silverman2014 line 373, Example 6, p.9; dangfavre2021 line 177, Theorem 2, p.5 | Three-variable degree sequence is 2,3,5. Dang–Favre is cited only for the proper-polynomial setting, not its characteristic-zero spectral conclusion. Affine properness uses the exact pinned finite/proper/affine equivalence. |

Also reopened the changed/supporting locators: stacks-morphisms line 2198, Lemma 26.16, pp.48–49 (flat base change with quasi-compact image map); stacks-constructions line 1267, Lemma 13.1/tag 01NE, p.28 (generating sections); stacks-varieties lines 4716,4778,4784, pp.102–103 (components and multilinearity); kleiman2005 line 3624, Lemma B.12, p.75; cutkosky2015 lines 274–287, p.6, and lines 983–1033, pp.21–22; dang2020 lines 840–883, pp.17–18, and lines 1271–1358, pp.25–26. Siu's integral-support repair avoids the source error described below.

### Pinned declarations opened

The plan's baseline equals `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. These are local pinned files, not current upstream APIs. The resolver's remote library search is unavailable; local inspection supplies the evidence.

| File at the pin | Declarations and hypotheses checked |
| --- | --- |
| `Mathlib/AlgebraicGeometry/Birational/RationalMap.lean` | PartialMap:48, dense domain and actual morphism; RationalMap:377, quotient; IsOver:396; compHom:440, no dominance needed; fromFunctionField:501, irreducibility; equivFunctionFieldOver:562, integral source and target locally finite type; domain:575; dense_domain:586; toPartialMap:608, reduced source/separated target. |
| `Mathlib/AlgebraicGeometry/Birational/Dominant.lean` | RationalMap.IsDominant:74, dominance of representatives. |
| `Mathlib/AlgebraicGeometry/Birational/Composition.lean` | comp:155, first map dominant; comp_id:170; composite dominance:173; comp_assoc:182; isOver_comp:193; id_comp:217. Varieties meet irreducibility/nonemptiness requirements. |
| `Mathlib/AlgebraicGeometry/Birational/Birational.lean` | PartialIso:39; IsOver:55; symm:88; toRationalMap:166; Birational:182 is Nonempty(PartialIso X Y), not a predicate on f. |
| `Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean`; `IdealSheaf/Basic.lean` | Hom.image:658, imageι:661, toImage:706, dominant instance:716 under QuasiCompact; Hom.ker:691. Image is the kernel subscheme. |
| `Mathlib/AlgebraicGeometry/FunctionField.lean`; `Morphisms/Proper.lean` | functionField:37 is the generic stalk, a field under integrality; IsFinite.iff_isProper_and_isAffineHom:97 is the exact conjunction used for affine polynomial maps. |
| `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Scheme.lean`; `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean`; `Mathlib/RingTheory/Polynomial/UniqueFactorization.lean` | Proj:855; homogeneousSubmodule:87 and gradedAlgebra:613; MvPolynomial.uniqueFactorizationMonoid:128 over a UFD. |
| `Mathlib/Analysis/Subadditive.lean` | Subadditive generated at 33–35; lim:106 is infimum over n≥1; lim_le_div:109 and tendsto_lim:155 require bounded-below divided terms including n=0. |
| `Mathlib/LinearAlgebra/Dimension/Free.lean`; `Mathlib/Data/Nat/Fib/Basic.lean`; `Mathlib/NumberTheory/Real/GoldenRatio.lean` | finrank_mul_finrank:76; fib:56 uses iteration from (0,1); goldenRatio:36 is (1+√5)/2. This confirms the n=0 witness in R01. |
| `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean`, `Pullback.lean`, `TensorProduct.lean`, `Dual.lean`, `Class.lean` | InvertibleSheaf:119; pullback:100; tensorProduct:65; dual:44; LineBundleClass:50 is the skeleton of invertible sheaves and has CommGroup at 142. |
| `TauCeti/AlgebraicGeometry/LineBundle/Ample.lean` | IsAmple:71 explicitly includes quasi-compactness and affine nonvanishing loci of positive powers; of_pow:96 assumes a positive power. |
| `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean`, `EulerCharacteristic.lean`; `LineBundle/Degree.lean` | Cohomology:61; eulerCharBelow:105 is a finite alternating finrank sum; eulerDegree:130 is the curve degree. Coherent finiteness and vanishing must precede its interpretation as χ. |
| `TauCeti/AlgebraicGeometry/IntersectionNumber/Basic.lean`, `FieldTower.lean` | intersectionNumber:111 is curve eulerDegree after pullback; intersectionNumber_eq_finrank_mul:66 includes compatibility of the two field structures. No arbitrary-dimensional multilinear intersection is supplied by this carrier. |
| `TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Basic.lean`; `SchemeTheoreticImage/Basic.lean` | IsEffectiveCartier:78 uses a locally regular generator; isReduced_image:78 requires the section's quasi-compact map and reduced source. |
| `TauCeti/AlgebraicGeometry/Morphisms/Dominant.lean`; `Scheme/BaseAlgebra.lean` | functionFieldMap:151, id:206, comp:212, ext_of_functionFieldMap_eq:221; functionFieldAlgHom:409, id:421, comp:427. The general morphism case is native; passage to rational-map equivalence classes is the new target. |
| `TauCeti/AlgebraicGeometry/Scheme/FunctionField.lean`; `EllipticCurve/Isogeny/FunctionField.lean`; `Birational/AlgHom.lean` | Dimension/trdeg:101 under integral/locally finite type binders at 55; Isogeny.fieldPullback:167 is specialized to Weierstrass isogenies. homOfFunctionFieldAlgHom:71 has the valuation-stalk hypothesis at 64, so it is not the general rational-map construction. |

Object searches covered rational maps and graphs, generic field maps/degrees, nefness, intersections, Hodge/Siu/Teissier inequalities and dynamical degrees in both libraries. Existing native objects are consumed; the higher-dimensional mixed degree and dynamical limit are not redeclared library objects. There is no Lean declaration in this design to collide by fully qualified name.

### Cross-roadmap citations, ownership, and order

Read the board package index first; its three listed packages are AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory. Searches used `roadmaps grep` and `roadmaps show` over main and the supplied open-head index. No existing roadmap of this name or earlier owner of the full arbitrary-field rational dynamical-degree theory was found. The general supporting objects remain with their named suppliers.

| Supplier file | Resolved evidence |
| --- | --- |
| `TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/README.md`, #1260 | §4.3, lines 795–801: coherent Euler polynomial, mixed coefficient, multilinearity, function-field-weighted projection, Cartier restriction, ample positivity, base extension. |
| `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometryPartII/README.md`, #1754 | §0.1 at 95 supplies curve component lengths; §1.5 at 335, especially 346, gives nef pullback/base change over Noetherian bases; §1.7(ii) at 393 gives arbitrary-field Kleiman and nef plus ample. |
| `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md`, #853 | §1.4 at 706, very ampleness at 708 and high powers at 731: finite-type map over quasi-compact base, properness for closed embeddings. Taking Spec K meets these hypotheses. |
| `TauCetiRoadmap/ArakelovGeometryAndAbelianHeightsPartII/README.md`, #1833 | §0.1 at 152 and §0.3 at 208–211: geometric nefness, volume, nef Hilbert–Samuel and Siu over arbitrary fields, including degree-zero dimension. |
| `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md`, #873 | §5.1 at 2801, irreducibility clause at 2810–2813: geometrically irreducible generic codimension-s inverse image when dim image>s. Applied to very ample embeddings, including curve slices when i=r. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, main | §§0.3:695,0.7:923,0.11:1129,0.20:1448,0.30:2050,2.6:3554,3.3:4917,4.11:5820,4.12:5915,4.13:5945,4.16:6349,4.19:6683,5.1:6902,5.2:7000,5.3:7045,5.10:7565. Hodge at 7601 assumes only H²>0. Several sections explicitly pass their objects to native Tau Ceti. |
| `TauCetiRoadmap/StableReduction/README.md`, main | Layer 2 at 405; line-bundle powers/pullback/generation and projective geometry at 437–444. |
| `TauCetiRoadmap/ArithmeticDynamics/README.md`, #1335 | §§0.18:1332 and 0.26:1564 give binary forms, constants, multiplicative degree and their scheme-endomorphism identification. Higher-dimensional rational maps here are a distinct extension. |

The supplied overlap report has no conflicting shared head, dropped cited id or revision-only cited id. Its five closest candidates were compared: #1754 is the imported nef/Kleiman owner; #1833 is the imported volume owner; #1796 `TauCetiRoadmap/AdicCoefficientsAndComparisonsPartII/README.md:13` imports ordinary alterations and adds degree-controlled/valuative versions; #545 `TauCetiRoadmap/AbundanceStatement/README.md:19` concerns normal projective characteristic-zero abundance infrastructure and is not used as a supplier; #1656 SchemeAndStackFoundations supplies the foundations already cited on main. Its open scope was also read; it does not own these dynamical degrees. #853 §9.10's mixed-intersection bound at line 10319 is within the smooth characteristic-zero effective-very-ampleness development; it is not the arbitrary-field singular mixed Hodge target here.

No overlap item calls for a revision-order dependency. The new §1.4 and §§1.5/1.7 moduli suppliers add roadmap folders and precede this candidate. No supplier cites this candidate back. All Needs lines were read. Local target prerequisites progress from the two independent foundations (graphs; numerical intersections), through positivity and mixed degrees, to limits and examples. No route needs a later target or a prohibited supplier. There are no declared gaps (`gaps: []`).

Dependency check output on the unchanged candidate:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2139 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The citation resolver found no unresolved cross-roadmap citation. It does not check pinned library names on its host; the local checks above cover those names.

### Principles, shape and package-stage checks

The design develops general projective-variety theory over arbitrary fields, with no good-prime restriction, imposed smoothness shortcut or characteristic-zero resolution route. Surface reduction uses alterations and cancels their full generic degree. No computational algorithm, copied source passage, sorry'd data or set_option appears in the design. The scope is distinct from ArithmeticDynamics' projective-line theory and from the imported foundations. The six layers are mathematical, not named after source chapters; graph and numerical foundations feed positivity and degree estimates, and the dependency lines force positivity before submultiplicativity and limits. No assertion that the plan follows a source's organization was found.

The README has the required Summary, Scope, Conventions, exact supplier contracts, build explanation, six layers with Examples and Dependencies, consumers, worked examples and References. Main-branch SchemeAndStackFoundations and StableReduction were read for repository shape. The definition/construction APIs have at least three Checks, as counted above. Every target has a locator. R01 records the concrete plan inconsistency rather than treating its shorter statement as an exact copy of the README.

There is no Suggested.lean in this design. The headline list is graph integrality/projectivity/projections (§1.2); Khovanskii–Teissier and product Siu (§§3.5–3.6); degree positivity/endpoints/base change (§§4.2–4.3); submultiplicativity/comparisons (§§4.4–4.5); dynamical limits, properties, invariance and entropy (§§5.1–5.4); projective/affine degree formulas and standard examples (§§6.2–6.4). These are covered by the computed table. The package-only tests for statable signatures, module-docstring omissions, one-tactic padding, Lean binders, imports and declaration-name agreement cannot be run on a nonexistent acceptance file. They are not recorded as passing. The plan's prospective names are not claimed as existing Lean declarations in the README.

Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run, no passing build or warning count is claimed, and no Lean process was left running. No design file or manifest entry was modified.

## Not verifiable

- `lazarsfeld2004`: Theorems 1.4.9,1.6.1,2.2.15 and Corollaries 1.4.10,1.6.3 are settled uncertified/paywalled. No text was requested again. Dang's related citation to 2.2.13 does not by itself disprove the design's 2.2.15 locator.
- `fulton1998`: Theorem 1.4 and Proposition 2.5 are settled uncertified/paywalled. Supplier contracts support their mathematical use, but this is not direct textual certification.
- Journal pagination/renumbering relative to the explicitly cited arXiv versions was not certified; the source table refers to the cached versions recorded in the manifest.
- No Suggested.lean elaboration, #check binder audit or one-tactic probe is available in this design lane. Package acceptance remains a separate check.

## Source issues

- **Error** in dang2020 at Proposition 3.4.1, printed page 17, and Theorem 3.4.4, printed page 18: the source says the global-ratio Siu bound holds on every closed subscheme; it should be restricted to integral supports, with componentwise bounds otherwise; affects a stated result.
- **Misprint** in dang2020 at Proposition 3.4.1 proof, printed page 17, line 857: the source says the kernel-section dimension is strictly greater than the difference of the other dimensions; it should be greater than or equal to that difference; affects the proof.
- **Misprint** in dang2020 at Theorem 3.4.4 proof, printed page 18: the source says the final constant uses ambient dimension n; it should use support dimension r as in the theorem and telescoping factors; affects nothing.
- **Misprint** in dinhsibony2005 at Corollaire 7 proof, printed page 7: the source says the limit is the infimum of unadjusted degree roots; it should be the infimum after multiplying degrees by the submultiplicativity constant; affects the proof.
- **Misprint** in dinhsibony2005 at Corollaire 7 proof, printed page 7: the source says the displayed bound yields λ(f)≤λ(h); it should yield λ(h)≤λ(f), followed by reverse conjugacy; affects the proof.
- **Error** in silverman2014 at Example 5, printed page 9: the source says the Fibonacci birational map and its inverse have disjoint indeterminacy loci; it should say they intersect at [0:1:0]; affects nothing.
- **Misprint** in silverman2014 at Example 6, printed page 9: the source says the nth iterate has degree F_n; it should say F_(n+2), giving degrees 2,3,5; affects nothing.
- **Misprint** in guedj2010 at Théorème 2.4(a), printed page 31 (PDF page 33): the source says the adjacent-index inequality includes l=k; it should stop at l=k−1 because λ_(k+1) is undefined; affects a stated result.
- **Misprint** in cutkosky2015 at §2.2, printed page 6, lines 275–276: the source says Pic(X) is the group of Cartier divisors; it should be Cartier divisors modulo principal divisors; affects nothing.

Independent witnesses for these source-only issues: on V=(ℙ²×{q})∪({p}×ℙ²) inside ℙ²×ℙ², A=h₁+2h₂,B=2h₁+h₂,C=h₁ give A²V=5, BCV=2, ABV=4, ACV=1, hence the claimed Siu bound 10≤8 fails. On ℙ¹ with A=2H,B=H and m distinct divisor points, h⁰(m(A−B))=m+1=(2m+1)−m, refuting the strict sign. For the Fibonacci map the inverse is [vw:u²:uw], and both base loci contain [0:1:0]. On ℙ¹, the nonzero Cartier divisor [0]−[∞] represents the trivial Picard class. None of these errors is copied into the design.
