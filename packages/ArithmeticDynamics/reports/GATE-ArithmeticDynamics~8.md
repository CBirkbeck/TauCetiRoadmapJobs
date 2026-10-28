## H01 (CBirkbeck) — applied

In `TauCetiRoadmap/ArithmeticDynamics/README.md:1755`, the quadratic, noninjectivity and cubic-stabilizer checks now explicitly assume an algebraically closed characteristic-zero field; §0.31's repeated unqualified chain-rule claim was deleted and its proof and iterate API scoped to positive-degree maps in characteristic zero, with the empty-product case stated at line 1665. The new controls compute the empty quadratic marking fibre over 𝔽̄₂ and the failed characteristic-two composition rule, while retaining the arbitrary-field degree-one bijection (milnor-1993 line 579; silverman-aws-2010 line 232).

## H02 (CBirkbeck) — applied

The computed prime-saturation requests in `TauCetiRoadmap/ArithmeticDynamics/README.md:221` and line 5256 were replaced by EffectiveDiophantineMethods §§3.29, 4.25: G≅ℤ³, finite index under rank J(ℚ)=3, and the point-list theorem for full saturation, retaining the exact arithmetic and local-data hypotheses. Cancellation takes place in ℚ₅, where even 5I(D)=0 implies I(D)=0, as used by Stoll's Lemma 5 and Theorem 6 (stoll08 line 330 and line 415).

## H03 (CBirkbeck) — applied

At `TauCetiRoadmap/ArithmeticDynamics/README.md:7175`, the unweighted infinity sum became Σ(e(P′)−1)deg P′=n−Σdeg P′≤n−1, with every sum explicitly restricted to places above infinity. The new degree-four cover check has a degree-two residue field and contribution 2, rather than the unweighted 1; identity, wild and constant-extension controls preserve the stated hypotheses (juul-generic-iterates line 269).

## H04 (CBirkbeck) — applied

At `TauCetiRoadmap/ArithmeticDynamics/README.md:1471`, the general global-section calculation is now imported from SchemeAndStackFoundations §2.6, with the supplier contract, ownership paragraph and Needs list updated; the Picard classification, concrete binary-form/chart adapter and rational-map/endomorphism comparison remain here. The owner is `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3443` on main, and the section calculation identifies H⁰ with the graded polynomial component (stacks-projective line 808); the added [2:1] check gives chart values 2 and 1/2 related by 2=2²·(1/2).

## Verification

**Ownership and citations.** Main was checked at 82e5289; EffectiveDiophantineMethods is a new roadmap consumed at head 5499fdb, not a revision of a main roadmap. Object searches covered main, board packages, the indexed open roadmap heads and all 64 README/Lean files in the 32 supplied open folders. SchemeAndStackFoundations owns general projective-space cohomology, AlgebraicCurves Layers 6–7 own place degrees and Hurwitz, and EffectiveDiophantineMethods owns the arithmetic saturation and point-list theorems. GenericDoublePointInterpolation §0.2 imports the general section interface for its bounded-polynomial comparison; the retained construction here concerns ArithmeticDynamics binary lifts, both chart evaluations and the endomorphism comparison. No new generic carrier or Lean declaration was added, and no ownership moved from a later supplier.

The citation resolver found no missing cross-roadmap citation. Its eleven pinned-name leads are explicit planned outputs in EffectiveDiophantineMethods §0.11, ComplexComparisonPartII §C−1.1 and AlgebraicModuliForArithmeticGeometry §7.10.2, rather than claims that those names exist at the pins. The five sources used for these repairs were read from the source service's legal copies with their existing bibliography keys; no source request remains unresolved.

**Pinned definitions and hypotheses.** The package checkouts match Mathlib 6b7abb3 and Tau Ceti a91d3aa. `Mathlib/Algebra/Polynomial/Roots.lean:56` defines the zero-polynomial branch as `if h : p = 0 then ∅`, and line 69 proves `Polynomial.roots_zero`; that convention supplies an empty multiset, not all geometric points. `Mathlib/Algebra/CharZero/Defs.lean:75` gives `Nat.cast_ne_zero` under characteristic zero, so a positive multiplier in ℚ₅ can be cancelled. `Mathlib/RingTheory/RamificationInertia/Basic.lean:72` states `Ideal.sum_ramification_inertia_eq_finrank` for a finite flat algebra over a domain; AlgebraicCurves Layer 6 supplies the affine-model and infinity-chart comparisons needed to use it for places. Searches at these pins do not identify an existing dynamical marking or projective-section comparison that the repairs duplicate.

**Adversarial mathematics record.** Each row covers a changed mathematical statement or a distinct boundary used by its repair; repeated supplier-contract and target formulations share a row.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| §0.31 critical-point chain rule | Characteristic 0, f=z², g=z³ at 0; characteristic 2, the same maps | In characteristic 0, local degree 6=2·3 and multiplicity 5; in characteristic 2, Jacobians have coefficients 4=0, 9=1, 36=0, so composite membership is false while membership for g is true | The unrestricted critical-point equivalence fails | Delete its duplicate unqualified API bullet and qualify the proof sentence |
| §0.31 local degree and critical multiplicity of iterates | f=z² over ℚ, n=0,1,2 at 0 | Local degrees 1,2,4 equal the respective products 1,2,2·2; multiplicities 0,1,3 equal degree minus one | Empty product and zeroth iterate agree | State characteristic 0 and positive degree; index by k<n |
| §0.31 identity-map control | f=id, n=0,1,2 | Every local degree is 1; each product is 1 and each critical multiplicity is 0 | No spurious critical point | Add explicit identity and zeroth-iterate checks |
| §0.34 quadratic singleton fibre | z² over ℂ | Jacobian 4X₀X₁ has two simple roots; the two orderings are exchanged by inversion; two markings give one orbit | Singleton assertion holds with stated scope | Add algebraic closure and characteristic zero |
| §0.34 quadratic noninjectivity | z²+1 over ℂ | Critical points 0,∞; only ∞ is fixed among them, so a commuting Möbius map fixes both and is az; coefficient comparison gives a²=a and a=1; two orderings give two orbits | An explicit fibre has cardinality 2 | Scope the assertion and name its witness |
| §0.34 degree-one fibre | An invertible linear lift over any field | Jacobian is its nonzero determinant of degree 0; critical multiset has cardinality 0 and there is one Fin 0 marking | Forgetful fibre has cardinality 1 | Retain arbitrary-field generality |
| §0.34 inseparable quadratic control | z² over 𝔽̄₂ | Jacobian 4X₀X₁=0; critical multiset has cardinality 0, whereas a Fin 2 tuple has cardinality 2; fibre cardinality 0 | Refutes the old singleton claim | Add negative control |
| §0.34 cubic stabilizer | z³ over ℂ and characteristic 2 | At 2 over ℂ, f(−2)=−8=−f(2), while −1≠1; in characteristic 2, −1=1 and −z=z | Nonidentity assertion needs scope | Apply characteristic-zero scope to the repeated endpoint |
| Stoll torsion conclusion in the imported contract | Supplied good-reduction orders at 7 and 13 | Orders 7238 and 50439 have gcd 1; 7 does not divide 50439 and 13 does not divide 7238 | Reduction data exclude torsion, including the two residue-prime parts | Retain exact arithmetic hypotheses of ED §3.29 |
| Stoll subgroup rank in the imported contract | Degree-zero divisors on ten points, six independent relations, supplied reduction image | Free rank 9 minus 6 gives upper bound 3; a quotient (ℤ/3)³ of order 27 gives lower bound 3 | Both bounds give rank 3 | Consume G≅ℤ³ from ED §3.29 |
| Full saturation definition and finite index | G=5ℤ×ℤ² in ℤ³ | Index 5; D=(1,0,0) is outside G but 5D=(5,0,0) is inside; Gˢᵃᵗ=ℤ³ | Full saturation does not require G to be 5-saturated | Replace computed prime-saturation requests in both occurrences |
| Nonzero multiplier in the saturation definition | D=(0,0,0,1), G=ℤ³×0 in ℤ⁴ | For m≥1 the last coordinate of mD is m≠0; for the forbidden m=0 it would be 0 | Requiring m≥1 prevents universal, vacuous saturation | Give the full definition explicitly |
| Ambient rank premise | G=ℤ³×0 in ℤ⁴ | rank G=3, rank ambient=4; saturated subgroup still has last coordinate 0, excluding D=(0,0,0,1) | Subgroup rank alone does not imply saturation equals the ambient group | Retain rank J(ℚ)=3 in all-point and six-cycle conclusions |
| Integration annihilates full saturation | m=1 and m=5, target ℚ₅; target 𝔽₅ as control | mI(D)=0 implies I(D)=(1/m)·0=0; 5·(1/5)=1 in ℚ₅; 5·1=0 in 𝔽₅ despite 1≠0 | Cancellation works even for 5 dividing m, using ℚ₅ rather than reduction | State the integration argument explicitly |
| Stoll saturation point list | Supplied p=5 local data at (∞,−1), (∞,0), and other residue classes | Local bounds are 2,1,1 respectively; ten listed points occupy nine residue classes, with exactly two in the first class | Local counts cover the saturation locus; rank supplies all-point completeness | Consume ED §4.25 with every listed local-data hypothesis |
| §5.8 Hurwitz at degree one | Identity extension k(t)/k(t) | n=1, g=0, infinity degree 1 and e=1; contribution 0 and −2=−2·1+0 | Boundary attains the inequality | Add identity check |
| §5.8 weighted fundamental identity at infinity | ℚ(u), t=1/(u²+1)² | n=4; unique closed place has e=2 and degree 2; Σ e·deg=4=2·2 | Residue degrees must remain | Keep degrees throughout |
| §5.8 infinity contribution and bound | Same degree-four cover | Weighted contribution (2−1)·2=2; n−Σdeg=4−2=2≤3=n−1; unweighted contribution is 1 | The restored equality distinguishes the error | Add degree-two-residue witness |
| §5.8 finite-place hypothesis | Same degree-four cover | Finite contributions at t=0 and t=1 are 3 and 1; total Hurwitz is −8+2+3+1=−2 | The auxiliary cover fails finite unramifiedness | State explicitly why it is excluded |
| §5.8 genus inequality | Hypothetical n=1,2,3 under all hypotheses | −2≤2g−2≤−n−1 gives upper bounds −2,−3,−4; only n=1 can coexist with g≥0 | Rules out every n≥2 | Preserve the genus conclusion |
| §5.8 wild control | x^p−x=t, p=2,3,5 | True Hurwitz RHS −2p+2(p−1) is −2,−2,−2; replacing the different by e−1 gives −3,−4,−6 | Wild cover is excluded by tameness | Add exact different and p=2 values |
| §5.8 full-constant-field control | ℚ(i)(t)/ℚ(t) | n=2, constant degree 2, g=0 and different degree 0; cross-multiplied equality −4=−4; omitting the constant degree would assert −2=−4 | Constant extension is excluded | Add constant-field check |
| §0.26 imported section calculation | ℙ¹_K, d=0,1,2 | Basis sizes 1,2,3 equal d+1; bases are 1; X₀,X₁; X₀²,X₀X₁,X₁² | The imported graded component matches concrete binary forms | Import SchemeAndStackFoundations §2.6; retain only its concrete comparison here |
| §0.26 chart-normalized section comparison | X₀X₁∈O(2), point [2:1] over ℚ | Chart functions have values 2 and 1/2; transition gives 2²·(1/2)=2, while equality of untrivialized functions would assert 2=1/2 | Pins the transition direction | Add the two-chart witness |
| §0.26 generating-section and endomorphism comparison | Constants, identity, and (X₀²,X₀X₁) at [0:1] | (1,0) gives ∞; (X₀,X₁) gives [0:1] at [0:1]; the common-factor pair evaluates to (0,0) | Degree zero and base-point exclusion remain correct | Preserve this comparison and its existing checks |

**Acceptance signatures.** I compared all fifteen elaborated `#check @name` types supplied for `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean` against their README statements. The supplied mechanically elaborated scratch module begins with the exact unchanged acceptance file and checks every declaration; no binder was lost and no signature needed changing.

| Declaration | README contract and retained binders | Computed boundary witness | Result/change |
|---|---|---|---|
| `forwardOrbit` | §0.1; arbitrary type, self-map and starting point | Identity at 0 has orbit {0}; successor at 0 has orbit ℕ, including index 0 | Agrees; unchanged |
| `noRationalFourCycle` | §3.57; c,x∈ℚ | c=−1 sends 0→−1→0, minimal period 2≠4; c=0,x=0 has period 1≠4 | Agrees; unchanged |
| `noRationalFiveCycle` | §3.58; c,x∈ℚ | Same period-two and period-one instances give 2≠5 and 1≠5 | Agrees; unchanged |
| `atMostOneRationalThreeCycle` | §3.88; both exact-period-three hypotheses retained | c=−29/16 sends −1/4→−7/4→5/4→−1/4; the three disjuncts give exactly these three values | Agrees; unchanged |
| `stoll_integer_family_card_gal` | §5.64; integer families, inequalities, congruences, nonsquare condition and n retained | a=1, n=0,1,2,3: asserted orders 1,2,8,128 equal 2^(2^n−1); n=0 polynomial is X with trivial group | Agrees; unchanged |
| `IsFiniteUnionAP` | §6.14; finite pairs of step and start, allowing zero step | Empty index set gives ∅; (0,2) gives {2}; (2,1) gives {1,3,5,…} | Agrees; unchanged |
| `rittCommonIterate` | §6.23; degree>1 and n>0 retained; monomial support permits s=0 | F=−X³,G=X³,n=2 give X⁹=X⁹ and (−1)^(1+3)=1; for degree 2 the second iterates are −X⁴ and X⁴, and (−1)^(1+2)=−1 | Both classification directions distinguish the witnesses; unchanged |
| `ellipticStandardProjection` | §6.57; W, invertible 2×2 matrix and native point; definition does not require smooth W | Identity matrix sends native vectors (0,1) to 0 and (1,0) to ∞; coordinate swap reverses these two images | Agrees, including zero denominator; unchanged |
| `legendreTorsionImages` | §6.111; actual coefficient model, native torsion and standard projection | t=2 gives coefficients (0,−3,0,2,0), discriminant 64, (0,0) of order 2 projecting to 0, and O of order 1 projecting to ∞ | Agrees; unchanged |
| `polynomialOrbits_meetingLine` | §6.84; Field K, CharZero K, nonzero slope, equal degree>1 and infinite set of pairs all retained | F=G=X², x=y=2 on v=u give (2,2),(4,4),(16,16); n=1 gives z²=z²; for v=−u, x=2,y=−2 there is only the pair (2,−2) | Infinite distinct intersections are required; unchanged |
| `lechIntegralAssembly` | §6.86; Field L, Algebra ℚ L, Algebra.EssFiniteType ℚ L, finite marks and N retained; existential prime instance precedes ℚ_[p] | L=ℚ, marks {0,1/6}, N=3, p=5 give norms 0,1; p=2 would give norm 2 for 1/6 | Agrees with an existential sufficiently large prime; unchanged |
| `legendreTorsionSpecializations_infinite` | §6.87; a and parameters algebraic, a,t≠0,1 retained | a=2,t=4 doubles to x=0; t=4/3 doubles to x=4/3; both marks are four-torsion, with denominators nonzero | Agrees; unchanged |
| `polynomialLine_returnTimes` | §6.90; Field K, CharZero K, A≠0 or B≠0; constant polynomials allowed | F=1,G=0,x=2,y=0 and line u=1 give return times {1,2,3,…}=(1,1); identity maps at (2,3) on u+v=5 give ℕ=(1,0) | Includes constant and index-zero cases; unchanged |
| `uniformLegendreCommonTorsion` | §6.111; all four smoothness guards, distinct parameters, explicit finiteness and bound retained | t=2,3 share at least {0,1,∞}, giving B≥3; for equal t=2, projected 2^m-torsion has sizes 4,10,34 at m=1,2,3 and grows without bound | Distinctness and separate finiteness remain essential; unchanged |
| `uniformThreeBranchCommonTorsion` | §6.112; both W.IsElliptic instances and both invertible matrices explicit | Legendre t=2,3 with identity matrices have branch intersection {0,1,∞}, cardinality 3; identical t=2 has branch intersection cardinality 4 and is excluded | All hypotheses survive elaboration; unchanged |

**Build and gates.** Commit `f5ba4b1` changes only `TauCetiRoadmap/ArithmeticDynamics/README.md`; `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean` is unchanged. The worktree is clean and nothing was pushed.

`lake build TauCetiRoadmap.ArithmeticDynamics.Suggested` exited 0, with eleven expected admitted-theorem warnings:

```text
Build completed successfully (8976 jobs).
```

The dependency-direction command exited 0, with no UPWARD or CYCLE line:

```text
depcheck: 33 roadmaps, 311 edges, 0 problem(s)
```

The prescribed gate exited 0:

```text
gate ArithmeticDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
