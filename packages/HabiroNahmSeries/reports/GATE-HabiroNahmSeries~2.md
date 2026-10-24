# HabiroNahmSeries review response

The five numbered findings contain six distinct points: the eta ownership and the Chern-interface integration are answered separately, in their original order. Repairs are committed as 7d3aeddf57179a077f1723f5036b9104479b351f; only TauCetiRoadmap/HabiroNahmSeries/README.md changes.

## H01 (CBirkbeck) — applied

TauCetiRoadmap/HabiroNahmSeries/README.md:812 replaces the fixed sine tuple in ξ_ζ with the root-dependent tuple and restricts the positive radial calculation to ζ₀=e(1/n), followed by field transport. The transport at TauCetiRoadmap/HabiroNahmSeries/README.md:818 also changes the cubic phase to e(−a/3), with n=5 and n=9 negative controls; CGZ (46), (51)–(52), CGZ line 1763 and CGZ line 1887 support the identities.

## H02 (CBirkbeck) — applied

TauCetiRoadmap/HabiroNahmSeries/README.md:1691 replaces the full-algebra rank-zero value 1 by T=(1,−1), recovering 1 only on the augmentation branch T=1. The conventions, Gaussian comparisons and coefficient-algebra API now retain the determinant factor and its negative involution law, including the branch restriction on the constant-one uniqueness comparison; this agrees with GSWZ Remark 1.9, GSWZ line 647.

## H03 (CBirkbeck) — applied

TauCetiRoadmap/HabiroNahmSeries/README.md:809 replaces the duplicate eta definition and boundary/torsion/root-change targets with the class supplied by TauCetiRoadmap/HabiroNumberFields/README.md:439, retaining here only the Nahm relation and analytic evaluation. The exact supplier contract at TauCetiRoadmap/HabiroNahmSeries/README.md:105 distinguishes the integral class from its quotient root-change law: the latter suffices after applying R_ζ, so no stronger integral scaling statement or edit to the owner is needed.

## H04 (CBirkbeck) — applied

TauCetiRoadmap/HabiroNahmSeries/README.md:820 connects the eta evaluation to HabiroNumberFields §§1.10, 1.13 and 1.14, retaining finiteChern_normalization_comparison, the exact-order premise and the good-order domain; the two signed readings give 2 and −2 modulo n. TauCetiRoadmap/HabiroNahmSeries/README.md:1665 uses §1.15's independently defined all-order Chern square and keeps the remaining Kummer-orientation comparison as a target, rather than extending the calibrated identity to excluded orders.

## H05 (CBirkbeck) — answered

The visible dependency and merge-order lists need K3BlochGroups, HabiroCohomologyFoundations and HabiroNumberFields as suppliers, and PadicHodgeRegulators must be identified as a required conditional local-K₃ supplier, rather than a consumer. These are corrections for the worker to make to the public description, which this job cannot edit; the correct repository merge order does not resolve the separate public-ledger defect.

## H06 (CBirkbeck) — applied

TauCetiRoadmap/HabiroNahmSeries/README.md:980 adds the uniform triangle majorant with nonzero Euler denominators, and TauCetiRoadmap/HabiroNahmSeries/README.md:987 derives exponential growth uniformly over a cusp period before invoking FuchsianOrbifolds Layer 3's puncture criterion. The sharper radial estimates are applied only after meromorphicity, with explicit Euler-factor, cusp-coordinate and negative-exponent Checks; the end order bound remains GZ Proposition 7.1, GZ line 768.

**Ownership and citation evidence.**

The content main branch is eafdde4, Mathlib is pinned at 6b7abb3 and Tau Ceti at a91d3aa. The object searches covered main, the board package inventory and the supplied open-roadmap inventory, and the relevant HabiroNumberFields text was read at a75a9d8, matching its supplied checkout and indexed head. HabiroNumberFields §1.7 owns eta, §§1.10 and 1.14 explicitly retain the independent normalization hypothesis, §1.13 separates eta calibration from generic good-order comparison, and §1.15 defines the all-order Chern square independently. Its scope assigns the Nahm evaluation and final assembly to this roadmap, so the supplier's construction does not consume the downstream calculation. The added uniform bound is about the actual Nahm summands; FuchsianOrbifolds Layer 3, item 5 retains ownership of the generic puncture criterion. The determinant continuation is part of the Nahm Gaussian expression, with the generic coefficient and module transport supplied by HabiroRings §§6.1–6.2 and HabiroNumberFields Layers 2–3. No generic carrier was added and no ownership move was needed.

Cross-roadmap resolution was repeated against main eafdde4 and the supplied index of 338 open roadmap heads and returned no unresolved roadmap citation or own Lean name. The changed section references were checked against the cited headings and statements, including HabiroNumberFields §0.2 for the exceptional integer, §0.9 for injectivity, §§1.1–1.5 for the cyclic map, and §§3.8–3.12 for effective descent, tensor products and inversion. PadicHodgeRegulators remains the conditional contract named in the brief; ownership against an open content pull request for that roadmap was not checked because no such checkout was supplied. No other unprovided open content head was fetched.

At the pins, Mathlib/LinearAlgebra/Matrix/PosDef.lean:164 defines PosDef by Hermitian symmetry and strict positivity on nonzero finitely supported vectors; it admits rank zero and excludes a singular nonzero real form. Mathlib/RingTheory/Unramified/Finite.lean:158 retains Module.Free for finite_of_free. TauCeti/Probability/Distributions/Gaussian/Density.lean:171 requires positive definite covariance for its density theorem, while TauCeti/Probability/Distributions/Gaussian/PolynomialMemLp.lean:100 requires nonzero envelope variance. TauCeti/LinearAlgebra/FiniteBilinearModule/GaussSum.lean:172 requires nondegeneracy, and :284 separately handles a quadratic-radical quotient. Searches of both pinned trees found no integral projective Bloch, Nahm Gaussian or indexed Habiro carrier on which to state the repaired arithmetic endpoints. All sources used are the legal cached versions recorded in packages/HabiroNahmSeries/sources.toml; no additional source or missing-reference request was needed.

**Acceptance signatures.**

A scratch copy with #check @name for all 16 declarations was elaborated, and every resulting type was compared with its README statement and the supplied signatures. No type changed and no binder disappeared: positive definiteness, the square polynomial system and nonsingular Jacobian, positive imaginary part, formal symmetry and positive Gauss order remain explicit where required. The final TauCetiRoadmap/HabiroNahmSeries/Suggested.lean is unchanged and contains none of the temporary signature checks. Its docstring already identifies the missing projective Bloch, cyclic Chern, weighted Gaussian and indexed Habiro carriers, so no substitute or extra API theorem was added for these README repairs.

**Adversarial mathematics record.**

Each changed mathematical statement or convention and each of the 16 acceptance declarations is covered below. Values involving trigonometric coordinates and dilogarithms are numerical checks, not proofs; power classes, symbol combinations and split-algebra computations are exact. The formal coefficient identities were evaluated by exact rational arithmetic at q=2 for every coordinate index from zero through two, including negative and singular matrices. Imported constructions are tested at their specified domains; these finite instances do not discharge the roadmap's all-order comparison targets.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| quadraticExponent | Rank zero C=3/2; A=2,B=1,C=11/60,n=0,1 | 3/2; 11/60 and 131/60 | Constant and half factor retained | None |
| NahmDatum | A=√2; all-ones rank two on (1,−1) | √2>0; quadratic value 0 | Real irrational data accepted; singular analytic data excluded | None |
| NahmEq | A=1,x=1/2; x=0,1 | 1/2=1/2; 1≠0; 0≠1 | Open cube essential | None |
| existsUnique_nahmEq | Rank zero; A=1 | One empty tuple; unique root 1/2 | Empty rank and rank one agree | None |
| nondegenerate_zero_isAlgebraic | X²−2 at √2; X² at 0 | Polynomial values 0; Jacobians 2√2≠0 and 0 | Repeated-root example is outside the nonsingular premise | None |
| nahmSummand | A=2,B=C=0,q=1/2,n=0,1,2 | 1,1,1/6 | Numerator and finite denominators agree | None |
| analyticNahmSum | Rank zero C=0,1/2 at τ=i | 1 and exp(−π) | Empty coordinate sum retains C | None |
| nahmSummand_summable | Rank zero; A=√2,B=C=0,q=e⁻¹ | One term; numerator exp(−n²/√2), successive ratio exp(−(2n+1)/√2)→0 | Quadratic decay needs no rationality | None |
| analyticNahmSum_holomorphic | Rank zero C=1/2; boundary τ=0 in rank one | exp(πiτ), value exp(−π) at i; denominator 1−1=0 at boundary | Half-plane domain retained | None |
| formalExponent | A=−1,n=2; A=3,n=1,2 | −3; 3,9 | Signed integral exponents retained | None |
| formalNahmSeries | A=3,q=2; rank zero | First coefficients 1,8,512/3; empty coefficient 1 | Formal branch remains constant one | None |
| formalNahmSeries_qDifference | A=0,1,3,−1; ((2,1),(1,1)), ((0,1),(1,0)); each index 0,1,2 | Every coefficient residual LHS−RHS=0 | Full column, negative diagonal and mixed indices pass | None |
| generalizedQBinomial | (r,k)=(−1,2),(−4,2),(2,1),(0,1); k=0, q=2 | 1/8,155/512,3,0; 1 | Negative upper index and empty product distinguished | None |
| formalNahmSeries_symmetrisation_qBinomial | Same six matrices, k=(2,…,2),q=2 | LHS=RHS: 1,1,10795/64,155/8,93345/128,0 | General product survives mixed and singular examples | None |
| rationalGaussTaylor | m=0,1,2,3,4,6,8 | 2,1,0,1,2,0,2 | Total order-zero value distinguished from theorem | None |
| rationalGaussTaylor_eq_gaussSum | m=1,2,3,4,5,6,8; zero-order control | Norm²/m=1,0,1,2,1,0,2; at m=0 totalized quotient 0≠2 | Positive-order premise essential | None |
| Root-dependent coordinates and embedding law | n=5,a=1,2 | X₂=0.618033988750 and −1.618033988750; √5↦−√5 sends the first to the second | Fixed positive tuple cannot be reused | Repaired |
| Nahm equations for the new tuple | n=7,a=1,2 | Both sides respectively (0.307978528370,0.198062264195) and (0.643104132108,3.246979603717) | Conjugate tuples satisfy the equations without positivity | Added check |
| Higher-rank tuple and denominator domain | n=3,9; all primitive roots for n=3,5,7,9,11 | Empty tuple at 3; at n=9,a=2 both sides (0.426022047760,0.550901214889,3.532088886238); 2j in 4,…,n−1 never 0 mod n | No denominator vanishes; residuals below 10⁻⁷ in all tested tuples | Repaired |
| Positive Rogers sum | n=3,5,7,9 | LHS/π²=0,1/15,2/21,1/9=RHS/π² | Distinguished positive specialization agrees | Retained |
| Complementary Rogers detector for root error | n=5, x and −φ | L(x)/π²=1/15, L(−φ)/π²=4/15; doubled difference −2/5, divided by period 1/2 gives −4/5 | Difference is outside period lattice | Added negative control |
| Integral half-root Nahm relation | n=3; n=5,a=1,2 | 2·0=[0]−[0]=0; supplied half-root sums give 2[x] and 2[−φ] on both sides | Pairing identity tracks the same embedding | Repaired |
| Supplied eta class and quotient scaling | n=3; n=5,a=2 and a=−1 | Eta=[0]; scaling 4 mod 5 and 1 mod 5 | Degenerate terms and quotient action retained at owner | Imported |
| Half-root scaling used after R | n=3,5,7,9 | 4((n+1)/2)² mod n=1,1,1,1 | Quotient law suffices; no stronger integral law used | Clarified |
| Distinguished radial phase | n=3,5 | Exponents 0 and 9/100 in e(·) | Phase is fixed before field transport | Retained |
| Fourth-power cyclic value | n=3,5 at distinguished root | ζ₃e(−1/3)=1; ζ₅ | Empty ξ and nonempty ξ agree with formula | Scoped to distinguished calculation |
| Cubic phase under transport | n=9,a=2 | Correct exponent 2/9−2/3=5/9 mod 1; untransported exponent 2/9−1/3=8/9 mod 1 | The two fourth-power values differ | Repaired throughout |
| Eta evaluation with correction | n=3; n=9,a=2 | 1²e(2/3)=ζ₃²; 2(5/9)+4/3=4/9 mod 1=ζ₉⁴ exponent | Cubic correction cancels transported phase | Repaired |
| Cyclic versus generic Chern domain | n=5,F=ℚ(√5); n=3 | gcd(5,w_F)=1, gcd(5,M_F)=5; gcd(3,2)=1 but 3 divides M_F | Eta calibration does not invoke generic good-order injectivity | Retained |
| Conditional scalar-reading comparison | n=5,(a,b)=(2,1),(2,−1); n=1 | ab⁻¹=2 and 3=−2 mod 5; all order-one classes 1 | Independent Chern sign and exact-order premise needed | Added explicit integration |
| All-order Chern square and orientation | m=1; m=3 with c=ζ₃ or ζ₃⁻¹ | ε₁=1; ε₃=ζ₃² or ζ₃ | Squaring does not erase inversion; no all-order R identity inferred | Retained as separate target |
| Cyclic-product quotient domain | m=1,w=0; m=2,w=1/2; m=1,w=1 control | 1=1; (1/2)/(3/2)=1/3=(1/2)²/(3/4); unsimplified ratio at last input is 0/0 while D₁(1)=1 | Rational-function identity and product evaluation separated | Domain made explicit |
| Imported coherent root-line contract | m=1; m=2, representatives 2 and 18 | Ordinary line at 1; (3y)²=9·2=18 | Representative change preserves the specified torsor class | Supplier sections resolved |
| Normalised Gaussian bracket | Empty rank; scalar covariance 1 | Empty bracket 1; moments 1,0,1,3 | Bracket normalization stays one | Distinguished from continuation |
| Full determinant algebra | δ=1 and δ=4 | T=(1,−1), T²=(1,1); T=(1/2,−1/2), δT²=(1,1) | Both split components required | Propagated |
| Gaussian determinant sign law | δ=1, determinant-free series 1+h | Full series (1+h,−1−h); involution gives (−1−h,1+h)=negative | Degree-one dependence fixes sign on every coefficient | Added explicitly |
| Augmentation uniqueness comparison | Rank zero, determinant branches T=±1 | Congruence series 1; Gaussian branch values 1 and −1 | Constant-one uniqueness compares the T=1 branch | Scoped comparison |
| Full rank-zero regularization | V=0,δ=1,m=1,ξ=0 | Full F̂=T; exp(0)Freg=T; augmentation value 1 | Removing the pole leaves T, not the diagonal unit | Repaired |
| Full leading-constant line | δ=ε₁=1 over K×K | T·a=(a,−a); T lies in the line; (1,1) would require a=1=−1 | Old value fails in characteristic zero | Repaired |
| Regularization and involution commute | F̂=T exp(V/h)(1+h) | Removing exp(V/h) gives T(1+h); applying involution in either order gives −T(1+h) | Potential is independent of determinant root | Added law |
| Specialization preserves determinant generator | Rank zero; split δ=4 | T↦(1,−1) or (1/2,−1/2); relation δT² maps to (1,1) | Specialization keeps both factors | Clarified |
| Kummer representative change in leading line | ε↦εuᵐ | Root ε^(1/m)↦uε^(1/m), leading line Tε^(1/m)K unchanged | Does not determine orientation itself | Retained |
| Symmetrization consistency | Rank zero; δ=4 | T²=(1,1); (±1/2)²=1/4 on each component | Scalar residue remains 1 at rank zero and δ⁻¹ generally | Pattern checked against Layer 7 |
| Numerator modulus bound | Rank zero C=7,−1; y=log(2)/(2π) | Modulus and positive-axis value both 1/128 or 2 | Negative Q is allowed | Added check |
| Nonzero Euler factors and reciprocal inequality | q=−1/2,r=1; q=1,r=1 control | 3/2≥1/2>0; reciprocals 2/3≤2; boundary factor 0 | Direction and y>0 premise discriminated | Added check |
| Full triangle majorant | Rank zero C=7,−1 at arbitrary x | LHS=RHS=1/128 or 2 | Whole-sum bound agrees in empty-rank cases | Added target and route |
| Cusp imaginary part and uniformity | σ=S,Y=10,X=0,1 | Im=1/10,10/101; reciprocals 10,101/10=Y+X²/Y | Uniform over the interval, not only its center | Added check |
| Finite-cusp exponential growth | A=2, Λ=π²/15,σ=S,Y=10,X=0,1 | Exponents Λ/(2πy)=π/3,101π/300; main exponent π/3 and bounded residual 0,π/300 | Order-one bound supplies uniform cusp growth | Added step before puncture criterion |
| Infinity growth and minimum | A=2,B=−3,C=5 | Q(0)=5,Q(1)=Q(2)=3; leading 2q³ | Exponential bound follows from minimum, without claiming this datum is modular | Existing endpoint checked |
| Cusp-order and modular first correction | Normalized Rogers–Ramanujan; empty rank invariant case | v₀=−1/60=−λ; −1/60+1/60=0; rank zero Λ=C=0 | Sharper radial conclusion is used after meromorphicity | Proof order clarified |

**Validation.**

`lake build TauCetiRoadmap.HabiroNahmSeries.Suggested` exited 0: `Build completed successfully (8976 jobs).` There were seven expected declaration-uses-sorry warnings and no errors. The signature elaboration also exited 0; the final build used the restored acceptance file.

The dependency-direction output was:

```text
depcheck: 33 roadmaps, 303 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The final committed-worktree gate output is:

```text
gate HabiroNahmSeries: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
