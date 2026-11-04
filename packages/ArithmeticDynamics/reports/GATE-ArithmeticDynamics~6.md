# ArithmeticDynamics human-review response

## H01 (CBirkbeck) — applied

In `TauCetiRoadmap/ArithmeticDynamics/README.md:158` and `:1860`, unrestricted convergence-implies-summability is replaced by comparison under default unconditional `Summable`, with orbitwise geometric domination at `:1862` and the alternating counterexample at `:1876` (`Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:90`; call-silverman-1993 line 218). The finite-orbit result retains arbitrary h through the explicit (1+α)M bound at `:1914`, and the elliptic adapter supplies its 5D bound before invoking the comparison at `:2040`; HeightsRationalPointsAndObstructions §0.18 remains the sole Tate-construction owner.

## H02 (CBirkbeck) — applied

The Legendre lift identity in `TauCetiRoadmap/ArithmeticDynamics/README.md:2949` and its use in §6.67 at `:9361` now require n≥1, matching §6.55 and degree-four homogeneity (demarco-krieger-ye-2020 line 288). The Checks at `:2949` and `:9147` evaluate t=2 at (0,1): the two sides differ as (1,1) and (−1,−1) at n=0, and agree as (−4,0) and (−256,0) at n=1,2.

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:180` adds the NeronModelsAndSemistableAbelianVarieties §§1.3, 1.7–1.9 supplier contract, and §6.85 at `:9645` and `:9653` explicitly consumes section extension, local existence, the abelian-scheme case and Dedekind gluing. The supplier provides the models, while §6.85 retains construction of D_P, local-height comparisons and uniformly summable adelic errors; the O(1) endpoint is the Tate result recorded at ingram-2011-variation line 27 and call-silverman-1993 line 565.

## H04 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:5471` replaces “Theorems 1–3, pp.1–2,6–8” with arXiv v1 §2 p.4, §3 display (3) p.7, Theorem 3 p.18 and Theorem 6 p.23, respectively locating the quotient interpretation, model, Jacobian rank and six-point completeness (fps95 line 146, line 276, line 729 and line 934). The other FPS citations were searched for the same mismatch; §3.58 already gives the latter theorem locators correctly.

## H05 (CBirkbeck) — answered

The review reports the historical passage, “That reply directs filing a target issue in another repository and discusses login/template permissions.” That instruction is outside this task and was treated as untrusted discussion data: no filing, login, access request or external write was performed, and it requires no roadmap edit.

## Validation and ownership

Commit: `da5b04a` — `ArithmeticDynamics: review repairs (summability, iterate endpoint, supplier ownership and locators)`; only `TauCetiRoadmap/ArithmeticDynamics/README.md` changed, and nothing was pushed.

`lake build TauCetiRoadmap.ArithmeticDynamics.Suggested` exited 0 with eleven expected declaration-uses-`sorry` warnings and the exact outcome:

```text
Build completed successfully (8976 jobs).
```

The final requested gate exited 0:

```text
gate ArithmeticDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The requested dependency check with `--movable` exited 0, with no UPWARD, CYCLE or moved line:

```text
depcheck: 33 roadmaps, 306 edges, 0 problem(s)
```

The precommit gate had only `dirty=1`; the committed gate above has every counter zero. The worktree is clean.

A scratch module containing `#check @name` for all fifteen declarations of `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean` elaborated successfully once. Each resulting type was compared with its README statement: all field, characteristic-zero, finite-generation, positive-degree, positive-iterate, infinitude, smoothness and parameter-distinctness hypotheses remain present; no binder or Lean declaration needed changing. In particular the projection definition intentionally also exists on singular models, whereas the three-branch headline explicitly binds both ellipticity instances, and both uniform-bound headlines assert finiteness before using natural cardinality.

Citation resolution was rerun against main `fe54001`, the indexed open heads and the pinned packages. No cross-roadmap citation was unresolved; its four library-name leads are the explicitly planned ED0 declarations in EffectiveDiophantineMethods §0.11 (`TauCetiRoadmap/EffectiveDiophantineMethods/README.md:1034`), not missing pinned declarations asserted to exist. The added supplier sections were read at NeronModelsAndSemistableAbelianVarieties head `3710abd`, and the bounded-error Tate contract at HeightsRationalPointsAndObstructions head `82cf8af` (§0.18); neither roadmap is on main, so their new-folder heads are the relevant supplier copies.

Ownership was searched by the Tate-series, Néron-model, parameter-divisor and local-height objects across main, the board packages, the indexed open-roadmap files and all thirty-two sibling roadmap folders supplied in the brief. The Tate construction stays in HeightsRationalPointsAndObstructions §0.18, and generic models and extensions stay in NeronModelsAndSemistableAbelianVarieties §§1.3, 1.7–1.9; the parameter-divisor comparison is this roadmap's existing §6.85 target, not a new foundational construction. No later supplier, ownership move or additional Lean declaration was introduced.

The Mathlib pin is `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and the Tau Ceti pin is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Mathlib's native default summation is unconditional (`Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:90`, `:115`, `:137`); its x-representative is [1,0] at zero and [x,1] at an affine point (`Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:887`), without requiring ellipticity; its minimal period is zero for a nonperiodic point (`Mathlib/Dynamics/PeriodicPts/Defs.lean:245`). The elliptic bound and quadratic law were checked at the pin in `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:191` and `:285`, with their ellipticity hypothesis.

The legal extractions read for these repairs were fps95 (arXiv v1), demarco-krieger-ye-2020 (arXiv v2), ingram-2011-variation (arXiv v3) and the supplied call-silverman-1993 extraction. No settled waived citation was reopened, no source passage was copied into the roadmap, and no missing-text request remains.

## Adversarial mathematics pass

This table records the changed mathematical assertions and conventions, their affected comparisons, and all fifteen retained Lean declarations. Finite instances check endpoints and discriminate definitions; they do not prove the admitted headline theorems.

| Statement | Instances tried | Computed values on each side | Result | Change |
|---|---|---|---|---|
| §1.1 finite telescoping, n≥0 | φ=id, h=1, α=2, n=0,1,2 | h+partial errors = 1,1/2,1/4; h(φⁿP)/2ⁿ = 1,1/2,1/4 | Includes empty sum and initial iterate | Finite identity kept without error bound |
| §1.1 summability convention and normalized-limit comparison | Successor and h(n)=2ⁿ(1+(−1)ⁿ/(n+1)), P=0 | e₀,e₁,e₂ = −3/2,5/6,−7/12; normalized terms = 2,1/2,4/3 →1; ordered error sum = −1; h(0)+default tsum = 2+0 = 2 | Unrestricted comparison is false, despite h≥0 | Require default Summable; add negative Check |
| §1.1 absolute-error divergence witness | Same sequence, n=0,1,2,3 | Partial absolute sums = 0,3/2,7/3,35/12; H_n+H_(n+1)−1 gives the same four values and tends to ∞ | Ordered convergence does not imply unconditional summability | Harmonic-sum Check added |
| §1.1 orbitwise error domination and tail | φ=id, h=1, α=2, C=1, n=0,1,2 | abs(e_n)=1/2,1/4,1/8 = C·2^(−n−1); absolute tails = 1,1/2,1/4 = C·2^(−n)/(2−1) | Geometric estimate attained; denominator α−1 positive | Add orbitwise sufficient hypothesis |
| §1.1 bounded-height sufficient condition | Same orbit, M=1, α=2 | abs(error)=1≤(1+2)·1=3; abs(e₀)=1/2≤3/2; for M=0,h=0 both sides 0 | Orbitwise height bound suffices without a global bound | Add C=(1+α)M |
| §1.1 scalar refinement | S=ℝ, φ(x)=2x, h(x)=x, P=1, c=−2 | Original limit 1; scaled limit −2 = c·1; both one-step errors 0 | Negative scalars allowed | Retain global-error refinement |
| §1.1 iterate refinement | Same scaling example, k=2; also φ=id,h=1,C=1 | Scaling example gives limit 1 with α=2 and α²=4; identity-map new error abs(1−4)=3=C(1+2) | Positive k and new geometric bound consistent | Retain refinement |
| §1.1 nonnegativity | S=nonnegative reals, φ=2x, h=x, P=1; replace h by −x | Limits 1 and −1, respectively | h≥0 is necessary for the stated implication | Retain explicit hypothesis |
| §1.5 finite-orbit Tate value | z²−2, P=−2, h=absolute height, α=2 | Orbit −2,2,2; heights log 2,log 2,log 2; normalized values log 2,(log 2)/2,(log 2)/4 →0; error sum = −log 2, so h+sum=0 | Finite orbit gives a summable series for arbitrary height values | Make summability step explicit |
| §1.18 elliptic comparison and zero point | P=O, m=2,3 | h(O)=g(O)=0; h(mO)−m²h(O)=0; defining limit=0=g(O) | Elliptic normalization preserved | Establish 5D bound before series comparison |
| §1.18 error-bound algebra | D=1, g(P)=1, g(2P)=4, h(P)=2, h(2P)=3; m=3 with g(3P)=9,h(3P)=8 | abs(3−4·2)=5=5D; abs(8−9·2)=10=D(1+3²) | Both constants can be attained under the bounded-distance laws | Explicit bound added, general-m bound retained |
| §§2.44,6.55,6.67 positive-iterate lift identity | t=2, (z,w)=(0,1), n=0,1,2 | A∘F₂ⁿ: (1,1),(−4,0),(−256,0); −F₋₁ⁿ∘A: (−1,−1),(−4,0),(−256,0) | Fails only at n=0 in this witness; even homogeneity preserves minus sign thereafter | Qualify all affected uses by n≥1 |
| §2.44 escape-rate consequence | Same positive iterates at complex place | 4^(−n)log(norm(F₂ⁿ(0,1))) = (log 4)/4 at n=1,2; reflected orbit gives identical values; scalar −1 contributes log 1=0 | Removing n=0 does not change limit | Keep escape-rate equality |
| Added Néron-model supplier contract | Constant elliptic curve over ℚ(t), P=O, local ring ℚ[t]_(t); bad fibre of y²=x³+x²+t | Identity section restricts to O and extends to O; discriminants of the latter model at t=0,1 are 0,−496 | Smooth good model satisfies contract; singular Weierstrass fibre is not a smooth Néron model | Import actual models and section extension |
| §6.85 parameter-divisor variation retained | Constant elliptic curve, P=O, D_P=0; possible error sqrt(h) at h=1,4,9 | Specialized height and h_(D_P) both 0; sqrt(h)=1,2,3 is unbounded though sqrt(h)/h=1,1/2,1/3→0 | O(1) requires more than specialization limit | Preserve local comparison and summable errors as §6.85 work |
| §3.85 FPS model and point-list citation | FPS sextic at x=0,−3; the two infinities | Sextic values 1,1 give four affine points with y=±1; leading coefficient 1 gives y/x³=±1 at infinity, total six | Matches display (3) and Theorem 6 | Correct locators, no mathematical weakening |
| §3.85 stable cycle versus rational marking | f=x²−2 on ζ₁₁+ζ₁₁⁻¹ | Exponent classes modulo ±1 run 1,2,4,3,5,1; cycle polynomial x⁵+x⁴−4x³−3x²+3x+1 has values −1 at both possible rational roots ±1 | Galois-stable five-cycle has no rational marked point | Cite quotient distinction at §2 p.4 |
| forwardOrbit | Identity; successor at 0, indices 0,1,2 | Identity range {x}; successor values 0,1,2 include starting point 0 | Native nonnegative iteration retained | No Lean change |
| noRationalFourCycle | c=0,x=0; c=−1,x=0; c=1,x=0 | Orbits 0→0, 0→−1→0, 0→1→2→5; minimal periods 1,2,0, all different from 4 | Fixed, periodic and wandering conventions consistent | No Lean change |
| noRationalFiveCycle | Same three cases | Minimal periods 1,2,0, all different from 5 | No false positive from period zero | No Lean change |
| atMostOneRationalThreeCycle | c=−29/16, x=−1/4 | Iterates −1/4,−7/4,5/4,−1/4; the three possible y equal exactly the three disjuncts | Nonvacuous exact-three-cycle instance | No Lean change |
| stoll_integer_family_card_gal | a=1,2,−8 at n=0,1; excluded a=0 | n=0: polynomial X, order 1=2^(1−1); n=1: irreducible quadratics have order 2=2^(2−1); a=0 gives order 1≠2 and fails hypotheses | Depth zero and nonsquare guard consistent | No Lean change |
| IsFiniteUnionAP | Empty index set; pair (0,7); pair (2,1) | Resulting sets ∅, {7}, {1,3,5,…} | Empty unions and singleton progressions supported | No Lean change |
| rittCommonIterate | F=−X³,G=X³,n=2; F=−X²,G=X²,n=2; n=1 | Cubic second iterates both X⁹, γ=−1,s=0 gives γ⁰=γ⁴=1; quadratic second iterates −X⁴ and X⁴ give −16 and 16 at x=2, and γ³=−1≠1; at n=1 γ¹=1 forces γ=1 | Both directions and monomial case discriminated | No Lean change |
| ellipticStandardProjection | Legendre t=2, identity matrix and coordinate-swap matrix, P=O,(0,0) | Identity gives ∞,0 from vectors (1,0),(0,1); swap gives 0,∞ from (0,1),(1,0) | Denominator-zero branch gives infinity; no 0/0 | No Lean change |
| legendreTorsionImages | t=2 and singular endpoints t=0,1 | Branch images {0,1,2,∞}, each from 2-torsion; discriminants 64,0,0 respectively | Real definition permits endpoints; smooth headlines exclude them | No Lean change |
| polynomialOrbits_meetingLine | F=X²,G=X²/2,x=2,y=4,a=2,b=0 | Orbit pairs (2,4),(4,8),(16,32); G(2z)=2z²=2F(z), n=1 | Nontrivial slope and actual carrier appear in statement | No Lean change |
| lechIntegralAssembly | L=ℚ,s={0,1/6},N=3; L=ℚ(√2),p=7 | p=5 gives norms 0,1≤1; primes 2,3 give norm(1/6)=2,3 and fail; 3²−2=7 and derivative 6 is a 7-adic unit | Arbitrarily large prime, integral marks and whole-field embedding compatible | No Lean change |
| legendreTorsionSpecializations_infinite | Fixed mark a=2, parameters t=2,4 | At t=2, x=2 is 2-torsion; at t=4, f₄(2)=0 and f₄(0)=∞, giving order 4; both parameters are smooth and algebraic | Mark need not remain a branch point | No Lean change |
| polynomialLine_returnTimes | F=0,G=1,x=y=0, diagonal; F=G=0 with x=y=0, diagonal; same orbits with line X=1 | Return sets {0}, ℕ and ∅ respectively, represented by (0,0), (1,0) and empty AP index set | Constant polynomials and index zero covered | No Lean change |
| uniformLegendreCommonTorsion | t₁=2,t₂=3; excluded equal parameters | Branch intersections {0,1,∞} have cardinal 3, so any uniform bound is ≥3; equal parameters have all infinitely many projected torsion points | Distinctness excludes immediate infinite counterexample | No Lean change |
| uniformThreeBranchCommonTorsion | Legendre curves at 2,3 with identity projections; same curve twice | Projected two-torsion intersection sizes 3 and 4 respectively | Exactly-three premise includes intended endpoint and excludes identical projections | No Lean change |
