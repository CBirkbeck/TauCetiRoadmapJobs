# Review of EllipticKTheory (pull request #1489 at 356badf)

**Verdict:** accepted

:robot: AI review. No findings remain. This is an incremental re-review of 53 changed lines since 52dfcf3, not a new full review. Acceptance means ready for a human's final approval, conditional on the four declared supplier contracts; it is neither approval nor merge.

## Previous findings

- R01 — repaired: README §1.2, lines 528–549, makes arbitrary-Weierstrass geometric integrality a target using ModularCurves Layer 1A base change and pinned ordinary integrality. The nonexistent instance is removed from the supplier contract and Lean docstring.

The previous report at 52dfcf3 contains one finding. Its historical disposition table is not a second set of outstanding findings. The repair introduces no new mathematical or ownership defect.

## Verified sound

**Scope and evidence.** I reviewed every changed passage in Scope, the Tau Ceti contract, the acceptance-test paragraph, Layer 1 and the Lean docstring, together with the immediate geometric consumers in §§1.1–1.5 and the exact-constant-field input in §4.1. The remaining mathematical review and one-tactic padding probes are carried from [r2], as required for this incremental pass. There are **0 findings and 0 blocking findings**. The head is 356badffd7c5f32a03830352d7dea9f78b66bf11; the outside-folder diff and worktree status are empty.

**Repair and generality.** README lines 528–536 now ask for geometric integrality of the morphism for every commutative ring and every Weierstrass equation. For a map to a field K, the supplied base-change comparison gives the projective model of the coefficientwise image over K. Tau Ceti's ordinary-integrality instance applies to that field without ellipticity. This proves precisely the pinned Mathlib condition. It does not imply reducedness of the total space over a nonreduced base. The zero-ring Check correctly distinguishes the vacuous morphism property from the nonemptiness required for an integral scheme.

The genus calculation remains arithmetic: a singular plane cubic has h¹(O)=1 even when its normalization has genus zero. The polynomial is a nonzero cubic hypersurface in a regular projective plane, so it has pure dimension one and no embedded points, the hypotheses used by the two Stacks lemmas. The regularity and point/place comparisons still require ellipticity; the cusp does not enter them merely because §1.2 now treats it.

**Gate and elaboration.** I reran the prescribed gate, then the targeted build and direct elaboration separately. The gate output was:

```text
gate EllipticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The explicit dependency check returned:

```text
depcheck: 204 roadmaps, 1500 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. `lake build TauCetiRoadmap.EllipticKTheory.Suggested` completed successfully (9059 jobs); direct `lake env lean` on `TauCetiRoadmap/EllipticKTheory/Suggested.lean` exited 0. Both reported only the six expected `sorry` warnings. No import object remained missing.

A scratch copy with `#check @` for all **14 declarations** also elaborated successfully. The finite-field theorem retains ellipticity and i≥1; the three model theorems retain NumberField, S.Finite and the generic marking; last-place reciprocity retains IsFunctionField and degree one; Bloch correction retains the exact divisors and residue identifications. No needed binder disappeared. The resolver's initial `genericFibreInclusion` lead is a local definition at Suggested.lean:114 and is confirmed by the signature probe.

**Headline coverage and padding.** The headline list is unchanged: elliptic K₀ and its ring comparison; curve localization and coniveau; the integral motivic tower and Adams comparison; Harder finiteness, positive descent and finite-field classification; twisted Frobenius orders; minimal marked regular models and terminal uniqueness; the model-independent integral part and vertical condition; last-place reciprocity; Bloch correction and quotient descent. The six statable headlines remain `card_twistedFrobeniusKernel`, `exists_minimalRegularProperModel`, `locallyMinimal_terminal`, `minimal_unique`, `tame_last_point` and `blochCorrection`. The docstring still identifies the missing carriers for the other headlines.

The added geometric-integrality extension is elementary supporting theory, rather than a replacement headline. It properly remains in the README. No theorem, definition, signature or proof body changed in Suggested.lean; only its ownership explanation changed. Accordingly the previous six-theorem one-tactic audit is carried forward, not represented as newly run. No added padding or stand-in exists.

**Pinned declarations reopened.** Both checkout revisions agree with lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The following are library-relative paths at those pins.

| Library and file | Declaration or definition inspected | What it supplies and does not supply |
|---|---|---|
| Mathlib/AlgebraicGeometry/Geometrically/Integral.lean:40 | `AlgebraicGeometry.GeometricallyIntegral` | Integrality after every field-valued base change; no total-space integrality assumption. |
| Mathlib/AlgebraicGeometry/Properties.lean:239 | `AlgebraicGeometry.IsIntegral` | Explicit nonemptiness and domain sections on nonempty opens; the empty scheme fails. |
| Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Basic.lean:123 | `WeierstrassCurve.Affine.irreducible_polynomial` | Irreducibility over an integral domain, without ellipticity or a characteristic exclusion. |
| Mathlib/AlgebraicGeometry/FunctionField.lean:37,51 | `Scheme.functionField` and its Field instance | The generic stalk is a field under IsIntegral, not just irreducibility. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Integral.lean:60 | `WeierstrassCurve.isIntegral_projModel` | Integral total model over a domain; it does not itself state geometric integrality. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Projective/Chart/BaseChange.lean:97 | `Projective.chartRingBaseChangeEquiv` | Arbitrary scalar extension of chart rings, with no ellipticity condition. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Affine/CoordinateRing.lean:518,527 | `isIntegrallyClosed_coordinateRing`, `isDedekindDomain_coordinateRing_of_isIntegrallyClosed` | The first requires ellipticity; the second uses normality. Singular integrality does not replace these conditions. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/PointPlace.lean:325,334 | `pointEquivDegreeOnePlace` and its standing binders | Elliptic rational points correspond to degree-one places. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/Divisor/Class.lean:79,88 | `pointEquivDegreeZeroDivisorClass`, `val_pointEquivDegreeZeroDivisorClass_some` | The additive comparison sends P to (P)−(O), fixing the sign. |

These are nine files, inspected directly. Object searches in both libraries found no geometric-integrality instance for the projective Weierstrass model at these pins. The repair no longer claims one.

**Ownership, suppliers and shape.** I ran `roadmaps grep` for geometric integrality and the Weierstrass object, used `roadmaps show` for the relevant owners, and searched the board packages. Existing-roadmap revisions were not used as suppliers. ModularCurves and JacobianChallenge were read on main; the relevant main AlgebraicCurves passages were also opened.

| Resolved citation | Current witness |
|---|---|
| ModularCurves Layer 1A | TauCetiRoadmap/ModularCurves/README.md:449–460 constructs the general projective cubic and states base-change compatibility; only smoothness carries the ellipticity qualification. |
| ModularCurves Layer 2A | TauCetiRoadmap/ModularCurves/README.md:647–650 explicitly concerns the smooth cubic. It does not own the singular extension as stated here. |
| JacobianChallenge Layer B | TauCetiRoadmap/JacobianChallenge/README.md:135–142 supplies coherent cohomology, genus and the curve cohomology framework. |
| AlgebraicCurves Layer 12 | TauCetiRoadmap/AlgebraicCurves/README.md:1468 onward separates regular models from arbitrary singular integral curves; 12A–12C supplies the function-field, closed-point and residue dictionary used by §1.4. |

The new extension has an explicit owner in Scope and §1.2, and its Needs line names earlier suppliers. It introduces no generic carrier and does not repeat the smooth headline in Lean. The newly strengthened non-example Checks are mathematical computations, not algorithms. No new definition needs a separate API block. The layer order, examples and dependencies retain the shape checked against main roadmaps in [r2].

The whole README was rerun through the citation resolver: no missing cross-roadmap citation was reported. That tool explicitly cannot certify library names on its host; the changed library claims were therefore checked locally at the pins as above. Semantic re-reading was confined to the changed dependency neighborhood, rather than repeating the full review of unrelated suppliers.

All four unchanged declared gaps still have the same slugs in `packages/EllipticKTheory/design/plan.json` and the README's exact supplier contracts: field-motivic-comparisons, motivic-k-comparisons, function-field-steinberg-homology and general-scheme-adams-pullback. The change neither expands them nor draws their conclusions into the elementary geometric-integrality proof. Acceptance remains conditional on those named contracts.

**Sources and seeded sample.** The seeded targets §§1.1, 1.4 and 1.5 were reopened as the immediate geometric neighborhood, along with changed §1.2. The other twelve seeded targets (§§2.6, 2.7, 3.4–3.6, 3.8, 5.3, 5.4, 5.6, 6.5, 6.6 and 7.7) are unchanged; their computed adversarial rows are carried from [r2]. This is not a claim to have re-fetched or newly certified every unchanged locator.

| Passage | Readable source and result |
|---|---|
| §1.1 | poonen line 6048–6063, §5.7.6, (5.7.29), PDF p.158 (printed p.144): the characteristic-independent homogeneous equation gives the stated affine chart; Y=Z=0 forces X³=0. |
| §1.2 | stacks line 211637–211675, Lemmas 53.9.1–53.9.3, tags 0BYB–0BYD, compiled pp.4448–4449: the plane hypersurface has dimension one and no embedded points; H⁰=k and h¹=(d−1)(d−2)/2 apply to the singular cubic too. |
| §1.4 | stacks line 210974–211018, Theorem 53.2.6, tag 0BY1, compiled pp.4433–4434: regular proper/projective curve and function-field correspondence. The supplied point/place dictionary, not geometric integrality alone, identifies the closed points and valuations. |
| §1.5 | weibel line 3337–3355, Example I.5.16, printed pp.58–59, assumes algebraic closure. The arbitrary-field point/class diagram here is supported by the pinned Tau Ceti equivalence and the named geometric suppliers, not by dropping Weibel's hypothesis. |

No newly unverified locator or new source request was introduced. The settled unavailable sources remain listed below.

**Adversarial table.** There are **152 rows**: ten freshly computed rows for the changed statements and their immediate consumers, followed by 142 unchanged rows explicitly carried from [r2]. The two old §1.2 rows are replaced, not carried with their obsolete missing-instance diagnosis. Finite instances discriminate conventions and hypotheses; they do not substitute for the general proof route above. In the carried rows E₋ and E₊ are y²+y=x³+x and y²+y=x³+x+1 over 𝔽₂, and O denotes the origin.

| Statement | Instances tried | Computed values on the two sides | Result | Change / provenance |
|---|---|---|---|---|
| §1.2 geometric-integrality extension and base change | Cusp over R, R→K a field map; identity K→K | K⊗R R[x,y]/(y²−x³) = K[x,y]/(y²−x³) = K[t²,t³]; identity sends x,y to x,y | Domain for every field K; projective model integral by the pinned theorem | New target replaces the absent pinned-instance claim |
| §1.2 irreducibility route | Polynomial root g of y²+(a₁x+a₃)y−(x³+a₂x²+a₄x+a₆) | For deg g≤1 the left contribution has degree≤2, versus 3; for deg g≥2 its degree is 2 deg g≥4, versus 3; g=0 gives zero versus a monic cubic | No root in K[x], including characteristics 2 and 3 | Rechecked the retained proof route |
| §1.2 dimension, H⁰ and H¹ | Smooth cubic and cusp y²z=x³ over a field | Dimension 1; h⁰=1; h¹=(3−1)(3−2)/2=1; the cusp normalization is ℙ¹ with h¹=0 | Arithmetic genus one, not geometric genus one | Explicit singular scope passes |
| §1.2 Euler characteristic and function field | Cusp coordinate ring A=K[t²,t³] | χ=1−1=0; t=t³/t²=y/x in Frac(A), so Frac(A)=K(t), a field | Nonzero x is inverted in the fraction field, not evaluated at the cusp | Rechecked both retained Checks |
| §1.2 characteristic-five cusp Check | y²=x³ over 𝔽₅ and any extension K | Kernel of x↦t²,y↦t³ is (y²−x³); derivatives (−3x²,2y) at (0,0)=(0,0); arithmetic genus 1 versus normalization genus 0 | Geometrically integral and singular | Expanded Check passes |
| §1.2 characteristic-two cusp Check | y²=x³ over 𝔽₂ and any extension K | Coordinate ring K[t²,t³] is a domain; derivatives (x²,0) at (0,0)=(0,0) | Integrality survives inseparable field extensions; smoothness fails | New Check passes |
| §1.2 characteristic-three cusp Check | y²=x³ over 𝔽₃ and any extension K | Coordinate ring K[t²,t³] is a domain; derivatives (0,−y) at (0,0)=(0,0) | Same conclusion at p=3 | New Check passes |
| §1.2 square-zero-base Check | R=𝔽₅[ε]/(ε²), constant cusp | ε≠0 and ε²=0 in R[x,y]/(y²−x³); every R→K sends ε to 0, yielding K[t²,t³] | Total scheme not reduced; every field fibre integral | New Check separates morphism from total-space integrality |
| §1.2 zero-base Check | R=0 | Spec R=∅ and Proj=∅; Hom(0,K)=∅ for a field K because 0=1 would map to 0=1; field-fibre condition true, Nonempty Proj false | GeometricallyIntegral is true; IsIntegral total scheme is false | New Check agrees with both native definitions |
| Dependent §§1.1, 1.3–1.5 and Layer 1 examples | Smooth y²=x³−x and cusp y²=x³ over 𝔽₅ | Smooth curve has 7 affine points + O=8; cusp has 5 affine points + O=6, but only 5 nonsingular points including O; cusp local embedding dimension 2 versus dimension 1 | The broadened §1.2 does not broaden the smooth point/place or regular-stalk claims | Ellipticity remains required downstream |
| Conventions: tame orientation | ℚ(t), {2,t} at 0 | README residue 2; inverse convention 1/2 | distinguishes conventions | Carried from [r2] |
| Conventions: sign | {t,t} at 0, char 0 and 2 | (−1)·res(1)=−1; in char 2 this is 1 | matches, including p=2 | Carried from [r2] |
| Conventions: residue degrees | ℚ(t), div(t²+1) | degree 2−2·1=0; unweighted count 1−2=−1 | norms/degrees necessary | Carried from [r2] |
| §1.1 projective cubic/chart equations | Z=1, Y=1, and Y=Z=0 | affine equation is y²+a₁xy+a₃y−x³−a₂x²−a₄x−a₆; missing-chart locus requires X³=0, hence X=0 | two charts cover | Carried from [r2] |
| §1.1 origin and point dictionary | [0:1:0]; cusp y²=x³/𝔽₅ | origin in Y-chart only; cusp has 6 projective points but 5 nonsingular group points | ellipticity required for dictionary | Carried from [r2] |
| §1.1 elliptic point group | y²=x³−x/𝔽₅ | affine point count 7, plus O gives 8=4·2; (2,1) doubles to (0,0) | ℤ/4⊕ℤ/2 | Carried from [r2] |
| §1.3 regularity and DVRs | smooth closed point; generic point | closed stalk dimension=embedding dimension=1; generic field dimension 0 | DVR assertion correctly codimension-one only | Carried from [r2] |
| §1.3 regular versus smooth | k=𝔽₂(t), (y−x)²=t | ring k(√t)[x] regular; after √t base change, ε²=0 with ε≠0 | smoothness fails; regular scope meaningful | Carried from [r2] |
| §1.4 function field/closed points | y²=x³+1/ℚ, y=3 | x³−8=(x−2)(x²+2x+4); second residue field has degree 2 | not all closed points rational | Carried from [r2] |
| §1.5 group/divisor comparison | P=(2,1) on y²=x³−x/𝔽₅ | 2P=(0,0), −P=(2,4); class of (P)−(O) corresponds to P, not −P | sign fixed | Carried from [r2] |
| §1.6 isogeny degree and zero map | identity, [2] in char 0, zero | degrees 1,4; zero has no finite function-field degree; identity kernel size 1; [2] kernel size 4; zero fibre is all E | zero excluded from finite-isogeny carrier | Carried from [r2] |
| §1.6 inseparability | Frobenius in char 2 | degree 2, geometric kernel has 1 point; differential 0 | degree need not equal point-kernel size | Carried from [r2] |
| §1.6 line-bundle pullback by zero | origin-valued constant morphism | pulled-back line is a 1-dimensional constant fibre, Pic class 0 | actual constant morphism retained | Carried from [r2] |
| §2.1 rank–determinant | closed point on curve; Spec F | [Oₓ]↦(0,O(x)); on Spec F its sole point gives (1,O) | dimension-zero exception correct | Carried from [r2] |
| §2.1 rank–Pic inverse | (r,L)=(0,O(P)) | (r−1)[O]+[L]=[O(P)]−[O], rank 0, determinant O(P) | inverse matches | Carried from [r2] |
| §2.1 nonseparated control | affine line with doubled origin | div(t)=o₁+o₂; [o₂]=−[o₁]; Pic=ℤ, K₀=ℤ², versus A¹ K₀=ℤ | regular does not imply separated | Carried from [r2] |
| §2.2 Euler characteristic | ℙ¹, O(n), n=−1,0,1 | χ=0,1,2 equals n+1; degrees −1,0,1 | degree is not χ | Carried from [r2] |
| §2.2 exact constants | ℙ¹ over 𝔽₄ viewed over 𝔽₂ | χ(O)=2, g=0, degree O=0; false 1−g gives 1 | H⁰=F assumption matters | Carried from [r2] |
| §2.2 point pushforward | quadratic closed point | χ(Oₓ)=2=[κ(x):F]; rank of Oₓ on curve 0 | pushforward differs from rank | Carried from [r2] |
| §2.3 principal divisor/Picard | t on ℙ¹ and A¹ | div on ℙ¹=[0]−[∞], line class 0; O(0) has degree 1. On A¹ [0] is principal, class 0 | proper/affine distinction | Carried from [r2] |
| §2.4 elliptic Picard splitting | O(P), O(O) | coordinates (1,P),(1,O); inverse (d,P) gives O(P+(d−1)O) | diagram fixes origin | Carried from [r2] |
| §2.4 index obstruction | real conic x²+y²+z²=0 | no degree-one points; degree image 2ℤ; hyperplane degree 2 | cannot replace index by 1 | Carried from [r2] |
| §2.5 descent of classes | real elliptic rational 2-torsion; real conic | rational point class is fixed and descends; conic O(1) on ℙ¹_ℂ is fixed but would have forbidden degree 1 | origin removes Brauer obstruction | Carried from [r2] |
| §2.6 square-zero product | z=[O(P)]−[O] on curve | z²=[O(2P)]−2[O(P)]+[O]=0 by rank–det; componentwise degree product would be 1 | stated ring law necessary | Carried from [r2] |
| §2.6 unit/rank-zero controls | (1,O), (0,L) | (1,O)(0,L)=(0,L); (0,L)(0,M)=(0,O) | unit and nilpotent ideal correct | Carried from [r2] |
| §2.7 K₀ elliptic coordinates | E/𝔽₅ above | K₀=ℤ²⊕ℤ/4⊕ℤ/2; [O_P]=(0,1,P); [O_P]−[O_O]=(0,0,P) | concrete point coordinate correct | Carried from [r2] |
| §3.1 curve localization | ℙ¹_ℚ and ∞ | supported point class (0,1) maps to generic rank 0; [O] maps to 1 | rank map, not degree map | Carried from [r2] |
| §3.2 degree-two boundary | {t,t²+1}/ℚ(t) | residues at 0, quadratic point,∞ are 1,i,1; norm i=1. Swapped symbol gives −i at quadratic point | residue sign/norm correct | Carried from [r2] |
| §3.3 divisor boundary | t²+1 on ℙ¹_ℚ | valuations +1 at degree-two point, −2 at ∞; degree 2−2=0 | integer valuation, not norm value | Carried from [r2] |
| §3.4 restriction | ℙ¹→A¹→Gₘ | [0]−[∞] restricts to [0], then 0; removing no points gives identity | both endpoints correct | Carried from [r2] |
| §3.5 finite pullback | t=s², {2,t} | residue 2 becomes 2²=4; e=2, residue extension degree 1 | ramification, not residue degree | Carried from [r2] |
| §3.5 inseparable pullback | char 2, t=s², unit a | residue a becomes a², e=2 despite inseparability | separability unnecessary | Carried from [r2] |
| §3.6 finite transfer | residue extension ℚ(i)/ℚ | N(i)=1, N(2)=4; identity extension N(2)=2 | norms, no extra e factor | Carried from [r2] |
| §3.7 rational injectivity | ℙ¹_ℚ, ∞_*{−1,−1} | generic image 0; structure pushforward is order-two {−1,−1}≠0; tensor ℚ gives 0 | integral injection would fail | Carried from [r2] |
| §3.7 both projective summands | K₂(ℙ¹_ℚ)=K₂(ℚ)² | both summands torsion, rational source=0 and rational image=0 | rational claim matches | Carried from [r2] |
| §3.8 integral injection | ℙ¹_𝔽₂ | K₂(ℙ¹)=0²=0, residue kernel 0 | finite-field K₂ vanishing used | Carried from [r2] |
| §3.8 all closed points | {t,t²+t+1} over 𝔽₂ | at quadratic point θ≠1, θ³=1; rational-point residues all 1; norm θ=1 | rational points alone miss class | Carried from [r2] |
| §4.1 determinant/units | ℙ¹_𝔽₃ and A¹_𝔽₃ | K₁(ℙ¹)=C₂², units C₂, SK₁=C₂; K₁(A¹)=C₂, SK₁=0 | nonaffine SK₁ retained | Carried from [r2] |
| §4.1 exact constants | proper curve with H⁰=F | generic determinant image is F×; on ℙ¹_𝔽₃ its size is 2, not 4 | determinant is not all K₁ | Carried from [r2] |
| §4.2 point splitting | rational point P on ℙ¹ | P*P_*=1−1=0; π_*P_*=1; V(ℙ¹)=0 | self-intersection and section differ | Carried from [r2] |
| §4.3 coniveau in degree zero | ℙ¹ | coker div=Pic=ℤ; generic-rank kernel term ℤ; K₀=ℤ² | exactly two columns | Carried from [r2] |
| §4.3 coniveau in degree three | ℙ¹_ℚ versus A¹_ℚ | F¹K₃(ℙ¹)=ℤ/48, quotient ℤ/48; F¹K₃(A¹)=0 | filtration not discarded | Carried from [r2] |
| §4.4 third K-group | rational point on elliptic E/ℚ | constants and point pushforward split off two copies of ℤ/48, with π_*P_*=id, P*P_*=0 | kernel-only formula insufficient | Carried from [r2] |
| §4.5 rational weights/rank filtration | K₀(ℙ¹), z=1−[O(−1)] | ψ²1=1, ψ²z=2z, z²=0 | weights 0 and 1 | Carried from [r2] |
| §4.5 integral weight warning | K₀(ℙ²), z=1−[O(−1)] | ψ²z=2z−z²; ψ²(z+z²/2)=2(z+z²/2); integral eigenlattice has index 2 | rational denominators essential | Carried from [r2] |
| §4.5 regular integral tower | k=𝔽₂(t), X=A¹ over k(√t) | X regular; geometric base change has ε²=0; weight-zero rank is ℤ on both X and its polynomial stages | scope exceeds smooth perfect-field tower | Carried from [r2] |
| §4.5 tower layers/degree range | field, weight 1; curve n=0 | H¹(F,ℤ(1))=F×; for a curve CHʲ(X,0)=0 if j>1 | indices agree with n+1 bound | Carried from [r2] |
| §4.5 coefficient generalized weights | ℤ/25 extension, operator ×12 | on kernel and quotient C₅, eigenvalue 2; (12−2)=10≠0 mod25, but 10²=0 | generalized eigenspace needed | Carried from [r2] |
| §4.5 differential weights | eigenvalues 2 and 4 | difference −2 invertible over ℚ, so rational cross-weight differential 0; mod2 difference 0 | torsion differential not excluded | Carried from [r2] |
| §4.6 indecomposable K₃ | ℚ and ℚ(i) | rational dimensions 0=r₂(ℚ), 1=r₂(ℚ(i)); Gysin shifts field weight 2 to curve weight 3 | quotient and weight shift agree | Carried from [r2] |
| §5.1 proper pushforward | ℙ¹ O(−1), elliptic O and O(O) | pushforwards 0,0,1 respectively; Euler characteristics same | matches | Carried from [r2] |
| §5.1 finite-flat transfer | Spec ℚ(√2)→Spec ℚ | K₀:1↦2; K₁:2↦N(2)=4 | transfer not inclusion | Carried from [r2] |
| §5.1 nonproper negative control | A¹→ℙ¹ | stalk at ∞ of j_*O allows all tⁿ, unbounded pole order; no finite O-module generators | coherent pushforward excluded | Carried from [r2] |
| §5.2 isogeny projection formula | [3] in char 0 | f_*f*1=(9,0,O)=[f_*O] | matches degree here | Carried from [r2] |
| §5.2 degree-two obstruction | separable degree-two f, char≠2 | f_*f*1=(2,0,P_f); 2·1=(2,0,O), P_f nonzero of order 2 | integral degree-only formula false | Carried from [r2] |
| §5.3 determinant line | étale double isogeny | f_*O=O⊕L, L²=O and L≠O; h⁰(L)=0 versus h⁰(O)=1 | nontrivial line detected | Carried from [r2] |
| §5.3 multiplication in coordinates | y=(r,e,P), f_*O=(d,0,P_f) | product=(dr,de,dP+rP_f); at y=1 gives (d,0,P_f) | rank-dependent term retained | Carried from [r2] |
| §5.4 projective bundle basis | O(m), m=−1,0,1 | coefficients (m+1,−m)=(0,1),(1,0),(2,−1); rank=a+b=1, degree=−b=m | O(−1) convention fixed | Carried from [r2] |
| §5.4 finite-field examples | ℙ¹_𝔽₂ | K₁=0, K₂=0, K₃=C₃² of order 9 | genus zero differs from elliptic case | Carried from [r2] |
| §5.5 degree-one zero-cycle | closed degrees 2 and 3 | degree([x₃]−[x₂])=3−2=1; its pull/push composite ×1 | rational point not assumed | Carried from [r2] |
| §5.5 single-point negative control | degree-two point only | transfer after restriction ×2, not ×1 | cannot silently split by one closed point | Carried from [r2] |
| §5.5 affine SK₁ versus K₁ | 𝔽₃[t,t⁻¹] | units C₂⊕ℤ, SK₁=0, K₁=C₂⊕ℤ | SK₁ vanishing does not imply finite K₁ | Carried from [r2] |
| §5.5 Steinberg finite generation | rank 1 over 𝔽₃[t], 𝔽₂[t,t⁻¹] | St₁=ℤ; Aut=C₂ gives H₀=ℤ,H₁=C₂; Aut=ℤ gives H₁=ℤ | finite generation, not finiteness | Carried from [r2] |
| §5.5 tame cokernel | ℙ¹_𝔽₂ | final F₂×=1; residue θ at degree-two point has norm θ³=1; tame map onto all residue terms | reciprocity plus exactness needed | Carried from [r2] |
| §5.6 Harder scope | ℙ¹_𝔽₄ viewed over 𝔽₂ | K₁=C₃², order 9; using base q=2 in geometrically connected formula would give 1 | full constants handled | Carried from [r2] |
| §5.6 properness control | Gₘ/𝔽₃ | K₁=C₂⊕ℤ infinite, versus proper ℙ¹ K₁=C₂² finite | nonproper object excluded | Carried from [r2] |
| §5.6 characteristic-primary argument | finitely generated uniquely p-divisible abelian A | free rank must be 0 since ×p on ℤ is not onto; p-primary torsion 0 since ×p injective | finite prime-to-p conclusion justified | Carried from [r2] |
| §5.7 geometric groups | ℙ¹ over algebraic closure | J=0; K₂ᵢ=0, K₂ᵢ₋₁=D(i)²; K₂ with D-coefficients=D(1)² from K₁ torsion | one-degree Bockstein shift | Carried from [r2] |
| §5.7 equivariant splitting | order-four element, Frobenius ×3 | F(x)=−x, not x; section followed by edge returns x | abstract splitting alone insufficient | Carried from [r2] |
| §5.7 restriction/transfer | 𝔽₉/𝔽₃, unit −1 | restriction −1; norm (−1)⁴=1; composite on C₂ is ×2=0 | fixed convention agrees | Carried from [r2] |
| §5.8 Frobenius on H¹ | y²=x³−x/𝔽₃ | a=0, det π=3; arithmetic H¹ determinant=1/3, geometric=3; twist j=2 gives 3⁴/3=27 | contragredient twist correct | Carried from [r2] |
| §5.8 coefficient prime | algebraic closure in char 2 | μ₂ has 1 geometric point (trivial group), μ₃ has 3; ℤ/2 has 2 | invertibility cannot be dropped | Carried from [r2] |
| §5.8 continuous coinvariants | trivial discrete ℤ versus compact ℤℓ | H¹(Ẑ,ℤ)=0 but coinvariants ℤ; H¹(Ẑ,ℤℓ)=ℤℓ equals coinvariants | topology and coefficient scope correct | Carried from [r2] |
| §5.8 rational cohomology | Spec 𝔽q, j=0 versus j≥2 | H¹(Ẑ,ℚℓ)=ℚℓ; for nontrivial weight qʲ, qʲ−1 invertible and H¹=0 | source's unrestricted assertion avoided | Carried from [r2] |
| §5.8 descent vanishing | j≥2, curve degrees 0,1,2 | Frobenius magnitudes qʲ,q^(j−1/2),q^(j−1), all >1; F−1 onto divisible torsion, H¹=0 | exact sequence has zero cokernel | Carried from [r2] |
| §5.9 positive descent | q=2,3 and n=1 | K₁ orders 1 and 4 equal (q−1)²; n=0 has ℤ rank and is infinite | positive-degree restriction necessary | Carried from [r2] |
| §5.10 subgroup zero/addition | points killed by prime-to-p m,n | 0 killed by 1; mn(P+Q)=0+0=0; qⁱπ(P+Q)=P+Q | actual subgroup laws | Carried from [r2] |
| §5.10 torsion exclusion | rational order-two (0,1) on ordinary char-2 E | πP=P but every annihilator even; no coprime-to-2 annihilator | not in B₀ | Carried from [r2] |
| §5.10 rational membership | (0,0) on y²=x³−x/𝔽₃, i=1 | 3P=P since 2P=0; (q−1)P=0 | in B₁ | Carried from [r2] |
| §5.10 twist matters | E₊/𝔽₂ | #E₊(𝔽₂)=1, a=2; deg(1−2π)=1−4+8=5, while B₀ has size 1 | twist distinguished from ordinary points | Carried from [r2] |
| §5.10 base change and p-torsion | field-map transport; mP=pP=0, gcd(m,p)=1 | π commutes with field map; Bézout combination gives P=0 | functoriality/exclusion agree | Carried from [r2] |
| §5.11 even orders headline | E₋ and E₊, i=1,2 | traces −2,+2; 1−a·2+8 gives 13,5; 1−a·4+32 gives 41,25 | positive determinants and prime-to-2 | Carried from [r2] |
| §5.11 lattice cokernel versus kernel | scalar 5 on ℤ₅⊂ℚ₅ | lattice kernel 0, cokernel C₅; kernel on ℚ₅/ℤ₅ is C₅, with class 1↦1/5 | snake-map direction correct | Carried from [r2] |
| §5.11 odd orders | q=2,i=2; q=3,i=1 | (2²−1)²=9; (3−1)²=4 | matches two cyclic factors | Carried from [r2] |
| §5.11 no characteristic factor | q=pʳ, i≥1 | 1−a qⁱ+q^(2i+1)≡1 mod p | p-primary part absent | Carried from [r2] |
| §5.11 excluded i=0 | ordinary E/𝔽₂ with 4 rational points | degree(1−π)=4 but B₀ deletes all 2-primary points, cardinal 1 | theorem correctly requires i≥1 | Carried from [r2] |
| §6.1 marked model definition | identity generic marking versus [−1] twist | on y²+y=x³−x, (0,0) maps to (0,−1) under [−1] | distinct markings not silently equal | Carried from [r2] |
| §6.1 proper versus Néron | split nodal fibre | smooth locus is Gₘ, missing node; proper fibre contains node | Néron model is not proper model | Carried from [r2] |
| §6.1 regular total space | 37a1 at 37, lifted point (5,18) | equation value 222=6·37, not 0 mod37² | nodal fibre can have regular total space | Carried from [r2] |
| §6.1 nonregular equation control | 11a1 at (5,5) over 11 | equation value 0; both partials divisible by 11 | raw equation needs resolution | Carried from [r2] |
| §6.2 excellent surface resolution | xy=z² at origin | embedding dimension 3 versus dimension 2; away from origin equality 2=2 | modification must change singular point only | Carried from [r2] |
| §6.2 specified model comparison | already regular model; scaled y²=x³−81x | identity resolution for first; scaled discriminant gains 12 at 3 versus good original y²=x³−x | resolving equation not selecting good primes | Carried from [r2] |
| §6.3 marked morphisms | identity; blowup of closed smooth point | identity map restricts to id; blowup exceptional fibre ℙ¹ has >1 point, so blowdown not iso | blowup model is nonminimal | Carried from [r2] |
| §6.3 minimality predicate | smooth minimal elliptic model | no exceptional (−1)-curve; every outgoing regular-model contraction has empty exceptional set | outgoing-isomorphism convention coherent | Carried from [r2] |
| §6.4 common resolution | blowup X′→X and X | common model X′, maps identity and blowdown; both generic restrictions id | marked directions correct | Carried from [r2] |
| §6.5 contraction | exceptional ℙ¹ versus smooth fibre | normal degree −1 versus 0; first contracts to regular point, second fails exceptional criterion | criterion discriminates | Carried from [r2] |
| §6.6 terminality headline | X=minimum M; X=BlₓM | Hom(M,M)={id}; Hom(X,M)={blowdown} | unique incoming morphism | Carried from [r2] |
| §6.6 positive genus | ℙ¹ over DVR, marking diag(π,1) | determinant valuation 1 cannot be made 0 by scalar scaling (changes by even integer) | genus-zero marked uniqueness fails, excluded | Carried from [r2] |
| §6.7 marked uniqueness headline | M=M; elliptic involution | unique marking-preserving iso is id; [−1] has different generic map | unmarked automorphisms excluded | Carried from [r2] |
| §6.7 localization | S=S′; invert 37 for 37a1 | identity base change; remaining fibres smooth after deleting bad prime | terminal comparison preserved | Carried from [r2] |
| §6.8 image independence | marked blowup π:X′→X | j*π_*=j′*; π*j* classes restrict identically; image inclusions in both directions | equality, not only one inclusion | Carried from [r2] |
| §6.8 S-monotonicity/colimit | S⊂S′; finite representative | restriction sends each image class to itself; finite diagram uses finitely many denominators | increasing images exhaust K₂(E) | Carried from [r2] |
| §6.9 good-prime condition | good fibres over 𝔽₂ and 𝔽₃ | K₁ sizes (2−1)²=1, (3−1)²=4; rationalized groups both 0 | integral surjection at q=2, rational generally | Carried from [r2] |
| §6.10 full fibre/G-theory | nilpotent thickening of a component | dévissage identifies G₁ with reduced component's G₁; multiplicity does not multiply rational rank | no singular K=G shortcut | Carried from [r2] |
| §6.10 split node | 2 vertices, 2 parallel oriented edges | ∂e₁=∂e₂=s−c; kernel span(e₁−e₂), dimension 1; Frobenius identity | split multiplicative rank 1 | Carried from [r2] |
| §6.10 nonsplit node | Frobenius exchanges branches | F(e₁−e₂)=−(e₁−e₂); invariants solve 2x=0 over ℚ, hence 0 | nonsplit rank 0 | Carried from [r2] |
| §6.10 additive fibres | type IV and type II | IV: b₁=3−4+1=0; pairwise triangle would give 1; II has one branch, b₁=0 | incidence graph correct | Carried from [r2] |
| §6.10 vertical criterion | constant {−1,3}, component multiplicity m | residue (−1)ᵐ, order≤2; tensor ℚ gives 0 | torsion residue allowed rationally | Carried from [r2] |
| §6.10 nonintegral control | u=1/3, component V=0 at 3 | ord(v)=1, ord(w)=0; residue 1/w̄ with nonzero divisor, infinite order | every nonzero multiple excluded | Carried from [r2] |
| §7.1 unit-valued tame definition | f=t²u,g=t³v | ord(f³/g²)=6−6=0; tame u³/v² (sign (−1)⁶=1) | denominator is a unit | Carried from [r2] |
| §7.1 Steinberg/sign | t,1−t at 0,1,∞ | tame values 1,1,1; at ∞ sign −1 cancels residue −1 | relation holds, sign essential | Carried from [r2] |
| §7.1 symbol candidate | coefficient +1 and −1 on same pair | Finsupp sum 0; product of residues c·c⁻¹=1 | cancellation respected | Carried from [r2] |
| §7.1 candidate versus K₂ | single formal pair (t,1−t) | formal coefficient vector nonzero; K₂ class zero by Steinberg | candidate not identified with quotient | Carried from [r2] |
| §7.2 finite certificates | zero candidate and {2,t}/ℚ(t) | empty support certifies zero; residues of {2,t} at 0,∞ are 2,1/2 | false empty certificate rejected | Carried from [r2] |
| §7.2 norm-one negative control | quadratic residue −1 over ℚ | norm (−1)²=1 but residue −1≠1 | norm check alone insufficient | Carried from [r2] |
| §7.3 integral certificates | symbols of model units; u=1/3 | orders (0,0) give 1 on each divisor; bad component gives 1/w̄≠1 | vertical condition discriminates | Carried from [r2] |
| §7.4 last rational place headline | all other values 1, degree-one P₀ | reciprocity leaves N(c)=c=1 | degree-one norm injectivity supplies conclusion | Carried from [r2] |
| §7.4 inseparable residues | k=𝔽₂(s), {s,t²−s} | residue at degree-two point s, norm s²; infinity s⁻²; product 1. Unnormed product s⁻¹ | inseparable norm retained | Carried from [r2] |
| §7.5 torsion functions | rational 2-torsion P=(0,0), y²=x³−x | div(x)=2(P)−2(O); C=1 would force P=O | prescribed divisor fixes annihilator | Carried from [r2] |
| §7.5 rho and excluded characteristic | C=1; ordinary char2 C=2 | rho has zero divisor and is constant for C=1; char2 rational 2-torsion sum is nonzero | prime-to-characteristic hypothesis meaningful | Carried from [r2] |
| §7.5 normalizations | 11a3 torsion function example | first norm equals −x⁵, not x⁵ | sign retained | Carried from [r2] |
| §7.6 Bloch correction headline | local c=−1,C=5 | first tame c⁵=−1; correction c⁻⁵=−1; product 1 | matches | Carried from [r2] |
| §7.6 correction sign control | local c=2,C=3 | correct 2³·2⁻³=1; reversed correction gives 2⁶=64 | excludes plus-sign error in exponent | Carried from [r2] |
| §7.6 outside support and origin | point outside T; O | outside: all orders 0 so 1; all nonorigin residues 1 force O-residue 1 by reciprocity | no missing origin correction | Carried from [r2] |
| §7.6 C=0 and trivial subgroup | every div f_P=0; T={O} | auxiliary functions constant, correction residues 1; empty sum=0 | retained Lean generality true | Carried from [r2] |
| §7.7 integral obstruction | {1/y,x} on y²=x³−x | at (0,0),(1,0),(−1,0),O values −1,1,−1,1; doubled symbol has all 1 | unmultiplied formula would fail | Carried from [r2] |
| §7.7 tensor obstruction | P=(1,0), rational half-point test | resulting quartic at candidates x=±1 has value 4, not 0; no rational half-point | cannot divide integrally by 2 | Carried from [r2] |
| §7.7 divided versus integral Sₐ | C=3 | divided coefficients 1 and 1/3; integral coefficients 3 and 1 | rational normalization explicit | Carried from [r2] |
| §7.7 normalization at points | repeated points versus distinct points | 1/x at O has value 0, so division undefined; distinct normalized values 1,−1,1 | distinctness prevents zero denominator | Carried from [r2] |
| §7.7 constant/torsion quotient | div h=nD, ζⁿ=1 | n{h,ζ}={h,ζⁿ}={h,1}=0; constant tensors persist before quotient | torsion disappears only after ℚ | Carried from [r2] |
| §7.8 constant-field transfer | ℚ(√2)/ℚ | N(x−√2)=x²−2; transferred symbol {x−√2,y} becomes {x²−2,y} | projection formula matches | Carried from [r2] |
| §7.8 degree-two residue norm | x₀²+2x₀+4=0 | N(1/x₀)=1/4; scalar 2 has norm 4 | residue target not ℚ before norm | Carried from [r2] |
| §7.9 restriction/corestriction | quadratic Galois extension | res Nβ=β+σβ; N res a=2a; at a={−1,−1}, 2a=0 | rational division by degree necessary | Carried from [r2] |
| §7.9 quotient, not canonical lift | k=ℚ(s,t), constant {s,t} | t-residue=s≠1, so constant class nonzero; two lifts differing by it have same quotient | quotient target essential | Carried from [r2] |
| §8.1 explicit symbols | u=4, (x,y)=(4,20) | v=1,w=0,h=5; opposite point v=−1,w has pole,h=0 | zeros/poles distinct and normalized | Carried from [r2] |
| §8.1 eight residues | ordered support from README | both {v,w} and {−1,h} give (−1,1,−1,1,1,−1,1,−1); coordinatewise product all 1 | certificate matches source | Carried from [r2] |
| §8.1 specializations | Q=(−16,0), u=4 | specialization {−1,5}; residue at 5 is −1≠1 | horizontal tame-zero need not mean zero K₂ class | Carried from [r2] |
| §8.1 discriminant/general parameter | u=4; u=1/3 | Δ=16·4⁴·15²=921600; Δ(1/3)=1024/6561; u=0,±1 gives Δ=0 | corrected exponent 2 | Carried from [r2] |
| §8.2 degree-two worked example | {y−3,x} on y²=x³+1 | values 1/2,1/x₀,−2,−4,1; normed product (1/2)(1/4)(−2)(−4)=1 | all factors checked | Carried from [r2] |
| §8.2 raw-product warning | same example | unnormed product 4/x₀=−1−√−3, not 1 | field norms indispensable | Carried from [r2] |
| §8.3 split fibre integrality | 11a3 symbol; u=4 | component function orders 0 give tame 1; for u=4, 4u=16 integral and 2α passes all vertical checks | no good-prime shortcut | Carried from [r2] |
| §8.3 bad denominator | u=1/3 at 3 | 4vw=−3(v²−1)(w²−1), generic V=0 gives ord v=1, residue 1/w̄ | infinite order obstruction persists | Carried from [r2] |

## Not verifiable

- **bloch**, ICM Helsinki construction, printed p.514, and **young**, Lemma 3.1 p.37 / Theorem 3.3 p.41: settled as waived. Their original text remains unavailable in the supplied legal cache. No new request was made; the unchanged normalization and residue computations are carried from [r2].
- **geisser-levine**, Theorems 1.1, 8.1 and 8.3, and **grayson**, pp.69–90: settled as uncertified. This incremental review does not certify their original proofs and does not reopen their source requests.
- The previous review's qualification about the published status of the Weibel V.3.11 correction remains: this increment did not verify an errata publication.
- Ownership was searched for the changed geometric-integrality object in main, the board packages and the supplied open-work inventory. No claim is made about unpublished work or open heads absent from that inventory. Unchanged ownership and source conclusions retain the scope and qualifications of [r2].

None of these limitations blocks the verified repair or constitutes a new supplier-gap finding.

## Source issues

No new source issue was found in the passages reopened for this increment. Previously recorded source errata remain in [r2].

- none

[r2]: packages/EllipticKTheory/reports/PRREVIEW-EllipticKTheory~2.md
