## H01 (CBirkbeck) — answered

The four genuine prerequisites are HeightsRationalPointsAndObstructions §§0.16, 0.18–0.19, 0.30, 5.17a–f; EffectiveDiophantineMethods §0.11 and Layers 3–4; InverseGaloisAndArithmeticFundamentalGroups IG.2; and MordellLawrenceVenkatesh §6.4, as consumed in TauCetiRoadmap/ArithmeticDynamics/README.md:146, 156, 160, 164, 176, 180, 184, 200, 246 and 254. The PR dependency paragraph must list those four direct prerequisites and its merge paragraph must require all four to precede ArithmeticDynamics respecting their own prerequisites; the merge order already does this at lines 52, 156, 175 and 203 before ArithmeticDynamics at line 268, and PR metadata is outside this job’s permitted edits, so that external correction remains outstanding.

## H02 (CBirkbeck) — applied differently

TauCetiRoadmap/ArithmeticDynamics/README.md:7705 changes monic, all-level-only specialization into the general positive-degree finite-polynomial comparison, with surviving leading coefficient, separability, an equivariant root bijection and injective Galois homomorphism; lines 7709 and 7711 derive compatible finite polynomial and rational towers, and §5.59 at lines 8034 and 8042 now verifies the homogeneous-numerator, resultant, infinity and separability guards in both characteristic cases (juul-generic-iterates line 612, line 626, line 661 and line 678). The comparison stays in §5.39 on native Polynomial.Gal because neither PolynomialGaloisGroups on main nor PolynomialGaloisGroupsPartII §1.3 exports that general theorem: requesting it as an existing supplier output would invent a dependency, whereas its generalization here repairs the existing specialization target without replanning either supplier.

## H03 (CBirkbeck) — answered

The historical filing/login directions grant no authority for this task; no filing, login or external write was performed, and no mathematical edit is needed for that observation.

---

**Source, ownership and signature evidence.**

- The open-roadmap inventory identifies the four H01 suppliers at heads 82cf8af, 5499fdb, 740b9cc and 73dc3e8 respectively; none of their folders occurs on content main d225eaf. Their cited sections were read at those heads, including the bounded-height completeness statements and their arithmetic-data hypotheses, the Tate-limit normalization, the Legendre coefficient model, and the guarded root-compatible Hilbert interface.
- The four ED0 names identified in the initial citation leads belong to EffectiveDiophantineMethods §0.11 (its API bullets), rather than the pinned libraries. Their occurrence in the supplier contract is intentional. The subsequent citation resolution found no missing cross-roadmap section; its library-name scan was unavailable, so pinned API checks below were done directly against the specified library copies.
- Ownership was searched by coefficient specialization, integrally closed coefficient domains, leading coefficients, decomposition groups and root actions in main, the board packages, and the open-roadmap index, including the supplied sibling checkouts. PolynomialGaloisGroups owns the root-action infrastructure; PolynomialGaloisGroupsPartII §1.3 owns bounded merging for monic integral polynomials at every prime; InverseGaloisAndArithmeticFundamentalGroups IG.2 owns guarded Hilbert/full-group specialization. None states the arbitrary normal-domain comparison needed here. The existing §5.39 owns its enlargement, and no supplier edge or Lean declaration was added.
- The legal arXiv v6 copy of the existing reference juul-generic-iterates was fetched through the sources service: Lemma 4.1, p.13, is at line 612; its general-field, nonmonic guards are at line 613 and line 615; the rational-numerator application is at line 626; Theorem 5.1 and the characteristic-two application are at line 661 and line 678. No missing text is needed for these repairs, and the settled waived texts were not reopened.
- At the specified pins, Mathlib/FieldTheory/PolynomialGaloisGroup.lean:56 defines Polynomial.Gal as the automorphism group of its native splitting field, without a separability or irreducibility field. Lines 204 and 212 supply its root-action homomorphism and faithfulness. Mathlib/Algebra/Polynomial/Eval/Degree.lean:180 supplies degree preservation when the leading coefficient survives. Mathlib/RingTheory/Invariant/Basic.lean:351 supplies surjectivity on residue fraction-field automorphisms under the finite-group, invariant-ring, prime-over-prime and compatible scalar-tower hypotheses at lines 182 and 187; §5.39 supplies the root comparison and inertia argument, rather than claiming the library theorem already proves them. These exact inputs were added to the supplier contracts at README lines 449 and 582.
- The worktree and content manifests have identical Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 pins. One scratch file containing the file’s real declarations and `#check @name` for every one of its 15 declarations elaborated successfully; comparison with §§0.1, 3.57–3.58, 3.88, 5.64, 6.14, 6.23, 6.57, 6.84, 6.86–6.87, 6.90, 6.111–6.112 found no lost hypotheses or generality mismatch. Suggested.lean is unchanged: the new comparisons are proof inputs, while the arboreal headline still lacks its native tower/action carriers at the pins, as its module docstring records.

**Adversarial mathematics pass.** The first table covers the repaired statements, their proof-route assertions and every added Check; the second records concrete instances for all 15 existing acceptance declarations whose signatures were compared. Finite samples test guards and conventions, and do not constitute proofs of the admitted headlines.

| Statement | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| Native Polynomial.Gal carrier | H=X; H=X²+1 over ℚ | Splitting fields ℚ and ℚ(i); group orders 1 and 2 | Definition has no separability or irreducibility premise | Exact supplier added |
| Residue fraction-field stabilizer surjectivity | H=2X²−1 over ℤ, primes 7 and 5 | At 7: decomposition and residue groups both 1; at 5: both C₂, residue root satisfies r²=3 in 𝔽₂₅ | Correct fraction-field theorem and scalar hypotheses retained | Supplier corrected to IsFractionRing form |
| Finite-polynomial group inclusion and root bijection | H=2X²−1, reduction at 7 and 5 | At 7 roots 2,5 and group 1; at 5 two conjugate roots over 𝔽₂₅ and group C₂; generic roots ±1/√2 and group C₂ | Root counts 2=2; subgroup orders 1≤2 and 2≤2 | General nonmonic theorem added |
| Leading-coefficient guard | Same H modulo 2 | lc maps 2→0; H maps to 1; degrees 2→0; root counts 2→0 | Degree/root comparison excluded | Negative-control Check added |
| Positive degree and total zero-polynomial degree | H=0, H=1, H=X | Natural degrees 0,0,1; only H=X meets positive degree, with one root and trivial group | No zero/constant stand-in | Positive-degree premise explicit |
| Separability and collision exclusion | H=X²+1 modulo 2 | H becomes (X+1)²; derivative 0; two distinct generic roots→one distinct residue root | Root bijection excluded | Characteristic-two negative control added |
| Localization and monic normalization | H=2X²−1 in ℤ[1/2], then modulo 7 | H/2=X²−1/2; 1/2 maps to 4; roots remain 2,5; discriminant of H/2 is 2, nonzero modulo 7 | Root sets unchanged; all inverted elements survive | Proof route handles nonunits in A |
| Decomposition/inertia and equivariance | Same H at 5 | Frobenius r↦r⁵=−r, since r²=3 and r⁴=4; both root actions are the transposition, inertia order 1 | Injection direction is special→generic | Root-action comparison explicit |
| Arbitrary target field E | A=ℚ, H=2X²−1; E=ℚ and ℚ(√2) | Over ℚ group C₂→C₂; over ℚ(√2) group 1→C₂; both root sets have two elements | Additional base extension shrinks the group | General E retained |
| Finite monic tower from top-level separability | f=X²+1, α=0, N=2, reduction at 5 | P₂=X⁴+2X²+2=(X²−1)(X²+3) modulo 5; discriminant 512→2; G₂ has order 2 versus generic order 8 | Separable through N=2 | All-level hypothesis replaced for finite conclusion |
| Parent-map compatibility | Same tower at 5 | f(1)=f(4)=2; for r²=2, f(±r)=3; Frobenius fixes 1,4 and exchanges r,−r, with both parents fixed | Reduction commutes with edges and restriction | One prime used for all levels |
| Infinite tower premise | Same f and prime 5, N=3 | P₃(0)=5→0 and P₃′(0)=0; gcd modulo 5 is X, whereas gcd(P₂,P₂′)=1 | Finite N=2 conclusion valid; infinite conclusion excluded | Separate all-level corollary retained |
| Level zero and degree one | N=0; f=X+1, α=0 | P₀=X, one root, group order 1; level i of X+1 has root −i and group order 1, with f(−i)=−(i−1) | Identity and unary towers included | d≥1 stated; constant f excluded |
| Rational numerator/fibre comparison | Φ=(X²+1)/(X²+2), depths 1 and 2 | Res=1; P₁=X²+1, P₂=2X⁴+6X²+5; gcd(P₂,P₂′)=1 and disc(P₂)=2560; fibre sizes 2 and 4 | Numerator need not be monic | Homogeneous rational corollary added |
| Rational denominators at child roots | Same Φ | Q₂=3X⁴+10X²+9; gcd(P₂,Q₂)=1; Φ(∞)=1, Φ²(∞)=2/3 | No simultaneous numerator/denominator zero or infinite zero-fibre point | Resultant/parent conditions stated |
| Resultant guard | U=V=X²+Y² over ℚ | Res=0; ratio is constant 1 and zero fibre empty; unreduced X²+1 has two algebraic roots | Spurious numerator roots excluded | Negative-control Check added |
| Separable rational map in characteristic two | U=X²+XY+Y², V=X² | Res=1; P₁=X²+X+1 and P₂=X⁴+X³+1; derivatives 1 and X², gcds 1; root counts 2 and 4 | Characteristic two is covered | Positive Check added |
| Inseparable rational negative controls | Φ=X²; Φ=(X²+1)/X² in characteristic two | First P₁=X², derivative 0; second P₁=(X+1)² and P₂=1, with degree 0 rather than 4; resultants 1 | Resultant alone cannot ensure distinct affine fibres | Separability and leading guards retained |
| Generic quadratic iterate formula | N=X²+s₁X+s₀, D=u₂X²+u₁X+u₀ | P₂=N²+s₁ND+s₀D²; lc=1+s₁u₂+s₀u₂²; at (s₀,s₁,u₂,u₁,u₀)=(1,0,1,0,2), lc=2 | lc≠1 in a valid example | Nonmonicity witness added |
| Lost point at infinity | Φ=(X²−1)/X² over ℚ | Res=1; Φ(∞)=1 and Φ²(∞)=0; P₂=1−2X², degree 2<4, disc=8 | Even a separable affine numerator loses the projective fibre if lc vanishes | Infinity guard negative control added |
| Rational generic specialization outside the quadratic characteristic-two case | D=1, g=f(X+t)−t, f=X²+1 | Res=1; P₁=(X+t)²+1−t, P₂=(X+t)⁴+2(X+t)²+2−t, both lc=1; at t=0, disc(P₂)=512 | Degree survives at every level of the chosen clean specialization | Polynomial specialization identified explicitly |
| Translation direction and normalization in characteristic two | φ=(X²+X+1)/X², through depth 2, t transcendental | φ(∞)=φ²(∞)=1; g(∞)=g²(∞)=1+t≠0; raw leading coefficients 1+t; scaling both first forms by (1+t)⁻¹ gives first lc=1 and second lc=(1+t)⁻² | Left conjugation and nonzero scaling preserve all needed guards | Characteristic-two route expanded |
| Generic characteristic-two group orders | n=1,2,3 | Rational binary-tree orders 2,8,128; polynomial affine-group orders 2,8,32 | Level 2 alone does not separate the cases | Existing exception and checks retained |

| Acceptance declaration | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| forwardOrbit | id at 0; successor at 0 | Ranges {0} and ℕ, including index-zero value 0 | Matches §0.1 | None |
| noRationalFourCycle | c=0,x=0; c=−1,x=0 | Minimal periods 1 and 2, both unequal to 4 | Matches §3.57 | None |
| noRationalFiveCycle | Same two cases | Minimal periods 1 and 2, both unequal to 5 | Matches §3.58 | None |
| atMostOneRationalThreeCycle | c=−29/16, x=−1/4 | Orbit −1/4→−7/4→5/4→−1/4; each of the three choices for y equals the corresponding displayed alternative | Exact-period hypotheses retained | None |
| stoll_integer_family_card_gal | a=1, n=0,1,2; a=0 | Orders 1,2,8 equal 2^(2^n−1); a=0 fails the integer-family premise and has group order 1 | Depth-zero subtraction and family premise match §5.64 | None |
| IsFiniteUnionAP | Empty witness; pairs (0,7), (2,1) | Unions ∅, {7}, {1,3,5,…} | Zero step gives a singleton | None |
| rittCommonIterate | F=G=X²,n=1; F=ωX²,G=X²,n=2, ω³=1 | First pair agrees; second iterates both X⁴, and γ³=ω³=1 with r=2,s=0 | Both directions have the intended compositional convention | None |
| ellipticStandardProjection | Identity and swap matrices at O; swap at affine (0,0) on y²=x³−x | xRep(O)=(1,0); identity→∞, swap→0; xRep(0,0)=(0,1), swap→∞ | Left matrix action and zero-denominator branch agree | None |
| legendreTorsionImages | t=2 and 3; singular t=0,1 | Smooth discriminants 64,576; branch torsion images {0,1,2,∞} and {0,1,3,∞}; singular discriminants 0,0 | Real definition exists without ellipticity; headline guards supply it | None |
| polynomialOrbits_meetingLine | F=G=X²,x=y=2,a=1,b=0 | Infinitely many diagonal pairs; conclusion holds at n=1 with z²=z² | Equal degree, nonlinear and slope binders retained | None |
| lechIntegralAssembly | L=ℚ,s={0,1/6},N=3,p=5 | Norms 0 and 1, each ≤1; 5>3; at p=2 norm(1/6)=2, so an arbitrary-prime conclusion would fail | Finite marks and essential finite type remain explicit | None |
| legendreTorsionSpecializations_infinite | a=2,t=2 | (2,0) on E₂ has order 2 and projects to 2; both algebraicity and nonbranch conditions hold | The computed instance agrees with §6.87; infinitude is the admitted headline | None |
| polynomialLine_returnTimes | F=0,G=X+1,x=y=0, diagonal; F=G=0 | First return set {0}; second return set ℕ; an inconsistent constant-coordinate equation gives ∅ | Constants, singleton and empty sets supported | None |
| uniformLegendreCommonTorsion | t₁=2,t₂=3; equal parameters | Common branch images {0,1,∞}, count 3; equal parameters give an infinite torsion image whose Set.ncard is 0 | Distinctness plus separate finiteness avoid a vacuous ncard bound | None |
| uniformThreeBranchCommonTorsion | E₂,E₃ with identity projections; E₂ twice | Branch intersections have counts 3 and 4 respectively | Exactly-three guard distinguishes finite-bound case; ellipticity binders remain present | None |

**Verification outcomes.**

`lake build TauCetiRoadmap.ArithmeticDynamics.Suggested`: exit 0, eleven expected declaration-uses-sorry warnings, and exactly `Build completed successfully (8976 jobs).`

The scratch signature elaboration exited 0 with the same eleven admitted-target warnings and all 15 requested types. `git diff --check` passed. The precommit full gate reported only `dirty=1`; the required full gate passed after commit 8b597e6, with a clean worktree.

Dependency direction output:

```text
depcheck: 33 roadmaps, 303 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted; no ownership moved from a later roadmap and the merge order was not edited.

Repair commit: `8b597e6 ArithmeticDynamics: review repairs (guard rational iterate specialization)`. Only TauCetiRoadmap/ArithmeticDynamics/README.md changed; Suggested.lean and all other repository files are unchanged, and nothing was pushed.

Full gate: exit 0. Exact summary:

```text
gate ArithmeticDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
