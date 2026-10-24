# ArithmeticDynamics human-review response

Commit: `591665b` (README repairs only; `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean` is unchanged).

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:7510` retains the unrestricted discriminant recursion but changes its square-class consequence to require separability, equivalently c₁,…,cₙ≠0 in characteristic different from two; the other square-class references carry the same guard. The added x²−1 check computes c₃=−1 and discriminant 0, while the recursion agrees with jones-arboreal-survey line 370 and the field separability criterion in `TauCeti/RingTheory/Polynomial/Resultant/Discriminant.lean:669`.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:9577` adds §6.83a, preserving arbitrary polynomial degrees, finite nonzero marks and a wandering point under specialization to a number field, then proving degree comparison including the mixed linear/nonlinear case. Sections 6.84 and 6.90 now consume this result before invoking the equal-degree theorem; ghioca-tucker-zieve-2008 line 579 restricts Lemma 5.7 to number fields, and lines 610–669 and 728–751 supply the specialization and isotrivial zero-height branches.

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:164` separates the general height-machine identities and chosen relative normalization from absolute number-field normalization and bounded-degree Northcott. The new checks give infinitely many degree-one height-zero constants over ℚ(t), but only {0,1,−1,∞} over ℚ, matching `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:86` and its §0.16 contract, and call-silverman-1993 line 133.

## H04 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:188` changes the E11 import from unconditional complete list to its supplied torsion list plus the explicit premise rank E11(ℚ)=0, and carries that separate premise through the conventions, §§3.84–3.85, §3.89 and §3.14's bound. `TauCetiRoadmap/EffectiveDiophantineMethods/README.md:4171` requires the separate rank datum, and poonen95 lines 432–446 identify its exact dynamical use; the independent Morton argument and `atMostOneRationalThreeCycle` receive no E11 premise.

## H05 (CBirkbeck) — answered

HeightsRationalPointsAndObstructions, EffectiveDiophantineMethods, InverseGaloisAndArithmeticFundamentalGroups and MordellLawrenceVenkatesh are genuine open prerequisites, with the interfaces and heads recorded below. The PR dependency/merge-order text still needs the concrete correction below because this job excludes PR metadata edits; `TauCetiRoadmap/ArithmeticDynamics/README.md:144` additionally replaces undeclared Legendre supplier names with its actual §6.4 coefficient-model and formula contract, retaining the model over every commutative ring.

## H06 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:1834` replaces 1/z² versus 2/z² with 2/z² versus 3/z², both having native invariants (0,0). The check derives the two possible conjugacy equations c³=3/2 and c³=6, excluded by their 2-adic valuations −1 and 1, and records that 1/z² instead has native invariants (−2,0).

## H07 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:3832` restricts the simple-zero example to characteristic different from two, scopes the repeated endpoint to ℚ, and adds the characteristic-two value 2. The factorization X²−Y²=(X−Y)² over 𝔽₂ gives that value directly; the order definition and general-field theory remain unchanged, consistent with ms95 line 740.

**Dependency-text correction for the worker.**

The replacement should state that open prerequisites include the following suppliers, each of which must precede ArithmeticDynamics; the other suppliers in the exact contracts retain their existing positions and interfaces. The absence of Lean imports from roadmap modules does not remove these mathematical prerequisites.

| Supplier | Verified open head | Required interface |
|---|---|---|
| HeightsRationalPointsAndObstructions | `82cf8af`, #1017 | §§0.9–0.16 global-height fields and height machine, §0.18 Tate limit, §§5.17a–f projective adelic foundations; its number-field Northcott contract imports ArakelovGeometryAndAbelianHeights §§1.12–1.14 |
| EffectiveDiophantineMethods | `5499fdb`, #1046 | §0.11 bounded-height covers, Layers 3–4 Mordell–Weil and rational-point certificates; §3.26 supplies E11 torsion, with all-point completeness requiring separate rank zero |
| InverseGaloisAndArithmeticFundamentalGroups | `740b9cc`, #850 | IG.2 Hilbert irreducibility and specialization |
| MordellLawrenceVenkatesh | `73dc3e8`, #1231 | §6.4 native Legendre coefficient model, discriminant and smooth-fibre j-invariant, using ModularCurves §4C's universal family |

All four folders are absent from main `6bddefd`; their indexed open heads supply the interfaces above. The merge-order file was not edited.

**Ownership and citations.**

Object searches covered main, the indexed open roadmap heads, the board packages and all 32 supplied sibling folders, using wandering-point specialization, synchronized degree comparison and the E11 arithmetic model rather than proposed declaration names. The new §6.83a is the polynomial-dynamical specialization adapter already needed by this roadmap's GTZ proof: general height theory stays in HeightsRationalPointsAndObstructions, the curve dictionary stays in AlgebraicCurves Layer 12, and E11 arithmetic stays in EffectiveDiophantineMethods §3.26; no ownership moved and no supplier was added above this roadmap.

Citation resolution against main `6bddefd` and the 338 indexed open heads found no unresolved cross-roadmap citations. The four ED0 names flagged in the input are explicitly planned in `TauCetiRoadmap/EffectiveDiophantineMethods/README.md:1035` through its §0.11 API; they are supplier interfaces, rather than pinned-library declarations or missing definitions owned here. The Legendre names removed at line 144 occur neither in the supplier's README or Suggested.lean nor at the pins; its §6.4 gives the coefficient model and formulas in prose.

The pinned libraries are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Direct checks include `Polynomial.discr` at `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:935` (determinant with degree sign; even the zero polynomial has discriminant 1), the monic field criterion at `TauCeti/RingTheory/Polynomial/Resultant/Discriminant.lean:669`, and `Northcott` at `Mathlib/Order/Northcott.lean:36` (finite sublevels, requiring its own instance); an admissible height structure alone does not include Northcott. `WeierstrassCurve.Affine.Point.xRep` at `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:887` sends O to (1,0), and an affine point to (x,1), so the retained projection correctly includes infinity.

Legal text evidence for the changed mathematics is ghioca-tucker-zieve-2008 lines 579–603, 610–669 and 706–751 (arXiv v2), jones-arboreal-survey lines 362–377 (arXiv v1), poonen95 lines 421–446 (arXiv v1), call-silverman-1993 lines 131–147, and ms95 lines 738–745. No waived citation was reopened, no source passage was copied, and no source manifest or other roadmap was edited.

**Elaborated signatures.**

All 15 declarations were placed together with `#check @name` in one scratch file, elaborated successfully and compared individually with their README statements. No signature or binder changed: both orbit theorems retain `[Field K] [CharZero K]`, the Lech statement retains the field, ℚ-algebra and essential-finite-type instances, and the three-branch theorem retains both ellipticity instances; the four definitions have real bodies. The README's conditional Poonen classification has no Lean stand-in: its missing Jacobian/rank carriers are already identified in the module docstring, and the independent Morton headline remains unconditional.

**Adversarial mathematics record.**

The table covers the added or changed mathematical claims and all 15 acceptance declarations; unchanged theorem statements attached to revised proof routes retain their generality. Concrete computations test the contracts and their negative cases, and do not constitute proofs of the admitted headlines.

| Statement | Instances tried | Values computed on each side or negative control | Result | Change |
|---|---|---|---|---|
| General height class: tensor powers and linearity | O(1), O(2), trivial bundle on ℙ¹; [2:1] | h=log 2; 2h=2log 2; trivial height=0 | Tensor/zero normalization agrees | Keep independent of Northcott |
| General height class: functoriality and class dependence | Squaring [2:1]; bounded representative h+1 | h([4:1])=log 4=2log 2; (h+1)−h=1 | Pullback O(1)=O(2); bounded changes preserve class | Separate identities |
| Ample lower bound | Standard O(1) at 0, 1, 2, ∞ | Heights 0,0,log 2,0, all ≥0; replacing h by h−1 gives bound −1 | Lower boundedness does not mean every representative is nonnegative | Preserve bounded-below assertion |
| Relative versus absolute normalization | [2:1] over ℚ and ℚ(√2) | Relative log 2 and 2log 2; absolute log 2 and (2log 2)/2=log 2 | Extension factor is degree | Split normalization clauses |
| Bounded-degree Northcott | ℚ(t), geometric degree; ℚ, absolute height; B=0,D=1 | Every rational constant has degree 1 and height 0, infinitely many; over ℚ exactly 0,1,−1,∞, cardinal 4 | General-field finiteness fails | Restrict finiteness or assume it |
| E11 torsion-to-complete-list implication | O and (0,0),(0,−1),(1,0),(1,−1); abstract ℤ⊕ℤ/5 | Each affine curve equation is 0=0; torsion cardinal 5; ℤ⊕ℤ/5 also has torsion cardinal 5 but infinitely many elements | Torsion completeness alone is insufficient | Add separate rank-zero premise |
| §3.84 E11 exclusion and §3.85 comparison | Four affine E11 points | η=−1,−1,1,1; t=2,−2,2,−2; t²=4=2(η³+η²−η+1) | All listed finite images are forbidden η-values | Guard every all-point invocation |
| §3.89 and §3.14 bound under both ranks | c=−29/16 and −21/16, points ±1/4,±3/4,±5/4,±7/4 | Each eight-point set is forward invariant; −29/16 has 5/4→−1/4→−7/4→5/4; −21/16 fixes 7/4 and −3/4; plus ∞ gives 9 | Attainment examples remain consistent | Carry both rank premises to the upper bound |
| Other §3.26 arithmetic lists consumed with their data | E15 (−1,0); E17 (1,−1); E24 (1,−1); E40 (0,1); Morton (2,2) | Equation sides respectively 0=0, −1=−1, 1=1, 1=1, 4=4; listed cardinalities 4,4,4,4,6 | Coordinate models agree; these values do not certify rank | Retain supplier's descent/reduction-data hypotheses |
| §5.27 unrestricted discriminant recursion | f=X²+a, α=0; a=−1,0,1,2; n=1,2,3 | Discriminants: (4,0,0), (0,0,0), (−4,512,335544320), (−8,6144,367219703808); each equals its recursion RHS | Ring identity survives collisions | Retain recursion |
| §5.27 square-class ratio | a=1, n=1,2,3 | Disc/cₙ=4,256,67108864=2²,16²,8192² | Nonzero ratios are squares | Add separability |
| Square-class negative control and characteristic two | a=−1,n=3; f=X² over 𝔽₂ | c₃=−1 but Disc=0; in characteristic two Disc=0=c₁ and 4c₁=0 | Neither has a unit square class | Guard repeated square-class references |
| Integer discriminant prime support | a=1,n=2,3; a=2,n=2 | 512=2⁹; 335544320=2²⁶·5; 6144=2¹¹·3; products 2c₁c₂c₃=−20 and −912 contain the indicated odd primes | Support consequence agrees with recursion | Retain integral assertion |
| §6.83a degrees and wandering specialization | ℚ(t), f=g=X²; x=t versus x=2 | t↦2 gives 2,4,16; t↦0 gives 0,0,0 and fails wandering; constant 2 has geometric heights 0,0,0 and specialized absolute heights log 2,2log 2,4log 2 | Wandering preservation needs the isotrivial branch | Add arbitrary-degree specialization |
| §6.83a finite nonzero marks and domain | T={t}; R contains t and t⁻¹ | t↦3 gives 3·(1/3)=1; t↦0 would give 0·α(t⁻¹)=1, impossible | Ring specialization respects marks; it cannot extend to the field ℚ(t) with t↦3 because t−3 would map to 0 | Specify R→M and inverses |
| §6.83a evaluation transport and distinct diagonal points | f=g=X², x=y=t, t↦2; n=0,1,2 | α(t),α(t²),α(t⁴)=2,4,16=f_α^[n](2); diagonal pairs (2,2),(4,4),(16,16) are distinct | Infinite indices yield distinct values when the coordinate wanders | Expose preservation law |
| §6.83a mixed linear/nonlinear comparison | f=X²,g=X+1,x=2,y=1 | Pairs (2,1),(4,2),(16,3),(256,4); heights 2ⁿlog 2 and log(n+1)≤nlog 2 | Exponential/linear bound comparison excludes an infinite synchronized intersection | Include mixed degrees |
| §6.84 equal-degree reduction | f=g=X²+1, x=0,y=1 | Shared orbit values 1,2,5,26; degrees 2=2; common iterate exponent 1 gives f=g | General specialization adapter supplies wandering, with Ritt refinement still separate | Consume §6.83a |
| §6.90 affine conjugation | ℓ(z)=2z+1, g(z)=z² | ℓ⁻¹gℓ(z)=2z²+2z; at z=1, ℓ(4)=9=g(3) | ℓ∘g′=g∘ℓ has the required direction | State transformed starting coordinate |
| §6.90 return sets, finite/infinite and constants | f=g=X²,x=y=2; f=0,g=X+1,x=y=0; f=g=0 | Return sets ℕ, {0}, ℕ; first is an infinite distinct orbit despite generic height 0; last has one orbit point | Singleton and eventually periodic cases are necessary | Add explicit cases |
| §6.90 axis-parallel and periodic-line cases | f=X²,x=−1, vertical X=1; f=−X,g=−X,x=y=1, diagonal | First coordinate −1,1,1 gives return set {n≥1}; second returns at every n and has two orbit points | Repeated coordinate yields eventual periodicity; orbit-point and index counts differ | Make the reductions explicit |
| Legendre supplier coefficient model and formulas | t=2; t=0,1; characteristic 2 | At t=2, Δ=64 and j=1728; t=0,1 gives Δ=0; characteristic 2 gives Δ=0 for every t | Coefficient model is unrestricted; smooth j-formula has nonzero denominator | Replace undeclared names by exact section contract |
| §0.40 native invariant example | a/z² for a=1,2,3 over ℚ | Rational fixed sets {1},∅,∅; invariants (−2,0),(0,0),(0,0) | The old pair has unequal native invariants | Use a=2,3 |
| §0.40 conjugation convention and obstruction | γ(z)=cz and γ(z)=c/z | Left conjugates have coefficients ac³ and c³/a; a=2,b=3 requires c³=3/2 or 6 with v₂=−1 or 1 | Neither valuation is a multiple of 3 | Supply explicit nonconjugacy computation |
| §3.1 binary-form multiplicity | X²−Y² at [1:1] over ℚ,𝔽₂,𝔽₃ | Orders 1,2,1; over 𝔽₂ the factor is (X−Y)²; X²Y has orders 2 at 0 and 1 at ∞ | Characteristic guard is necessary | Repair check and repeated endpoint |
| `forwardOrbit` | Identity at x; squaring at 2, n=0,1,2 | Identity range {x}; squaring range begins 2,4,16, including 2 at n=0 | Real-body definition includes the starting point | None |
| `noRationalFourCycle` | c=0,x=0; c=−1,x=0; c=−29/16,x=5/4 | Minimal periods 1,2,3, each ≠4 | Degenerate and known cycle cases agree | None |
| `noRationalFiveCycle` | c=0,x=2; c=−1,x=1; c=−1,x=0 | Minimal periods 0,0,2, each ≠5 | Nonperiodic convention is 0 | None |
| `atMostOneRationalThreeCycle` | c=−29/16,x=5/4, y=−1/4 or −7/4 | f(x)=−1/4; f²(x)=−7/4; f³(x)=5/4 | Both other cycle positions satisfy the stated disjunction | No E11 premise |
| `stoll_integer_family_card_gal` | a=1,n=0,1,2; a=0,n=1 outside hypotheses | Galois orders 1,2,8 match 2⁰,2¹,2³; excluded a=0 gives 1 versus would-be 2 | Zero level and nonsquare guard agree | None |
| `IsFiniteUnionAP` | Empty set; {7}; ℕ | Empty index set gives ∅; (step,offset)=(0,7) gives {7}; (1,0) gives ℕ | Zero step is necessary for singletons | None |
| `rittCommonIterate` | F=−X³,G=X³,n=2; F=−X²,G=X²,n=2; n=1 | Cubic second iterates X⁹=X⁹, γ⁴=1; quadratic second iterates −X⁴≠X⁴, γ³=−1; n=1 forces γ=1 | Both directions and monomial s=0 case agree | None |
| `ellipticStandardProjection` | Identity matrix and coordinate swap; O and affine point with x=0 | Identity gives ∞ and 0; swap gives 0 and ∞ | Zero denominator yields infinity; invertible matrix keeps representative nonzero | None |
| `legendreTorsionImages` | Smooth t=2; O and three two-torsion points | Images include {∞,0,1,2}; at t=0, Δ=0 while the coefficient model still exists | Definition uses actual native points; ellipticity belongs to theorems | None |
| `polynomialOrbits_meetingLine` | F=G=X²,x=2,y=4,a=1,b=0; a=0 negative control with y=b=2 | Shared values 4,16,256; n=1 yields z²=z²; with a=0 the line Y=2 is not preserved since 2→4→16 | Nonzero slope and infinite distinct points are material | None |
| `lechIntegralAssembly` | L=ℚ, s={0,6,1/6}, N=3 | p=5>3; norms 0,1,1≤1; p=2 would give norm(1/6)=2>1 | Integral marks include zero and can exclude primes | None |
| `legendreTorsionSpecializations_infinite` | a=2, t=2,4,4/3; excluded a=0,1 | t=2 gives two-torsion; doubled x at t=4 is 0 and at t=4/3 is 4/3, giving four-torsion; a=0,1 are persistent two-torsion | Explicit fibres agree; three examples alone do not prove infinitude | None |
| `polynomialLine_returnTimes` | Constant cases and zero-step representation | {0}=(0,0) progression; ℕ=(1,0) progression; zero line coefficients A=B=0 are excluded | Generality equals §6.90, including constants | Proof route repaired |
| `uniformLegendreCommonTorsion` | t₁=2,t₂=3; excluded t₁=t₂ | Common branch values {∞,0,1}, cardinal 3; equal-parameter torsion-image intersection is infinite although its Set.ncard is 0 | Distinctness and separate finiteness assertion prevent vacuity | None |
| `uniformThreeBranchCommonTorsion` | Identity projections on E₂,E₃; on E₂,E₂ | Branch intersections {∞,0,1}, cardinal 3, versus {∞,0,1,2}, cardinal 4 | Three-branch hypothesis includes the intended example and excludes the identical pair | None |

**Validation.**

`lake build TauCetiRoadmap.ArithmeticDynamics.Suggested` exited 0 with eleven expected `sorry` warnings and the exact final line:

```text
Build completed successfully (8976 jobs).
```

The single-file signature elaboration exited 0. The requested dependency-direction command exited 0 with this complete output, containing no UPWARD or CYCLE line:

```text
depcheck: 33 roadmaps, 300 edges, 0 problem(s)
```

The gate against `origin/main` exited 0 on committed head `591665b`; the worktree is clean and nothing was pushed. Its exact summary line is:

```text
gate ArithmeticDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
