# Package report: RankZeroOneBSDPartII

The package preserves the six-layer accepted design, all 17 target statements, all 18 definition API facts and all 12 original definition Checks. The README has 2, 2, 3, 3, 4 and 3 targets in Layers 0–5. It also gives the native coefficient definition required by its one statable headline, with three API facts and three discriminating Checks. The layer/target skeleton was generated from the JSON before the prose was assembled. Only the top-level `gaps` array of `packages/RankZeroOneBSDPartII/design/plan.json` changed; comparison of all other parsed fields with the saved input is equal, and the edit preserved the other JSON bytes.

`design/review.json` and pre-existing files under this package's reports directory were absent. The accepted review is embedded in `design/plan.json`; its corrections were read and retained: a proposition on the actual isogeny, identity/composition transport, and both directions of admissible-family compatibility. No suspicious instruction was found in the design or source material.

## Headline inventory recorded before writing Suggested.lean

| Headline | Acceptance-file disposition |
| --- | --- |
| Low finite Selmer dimension equals p∞ corank | Not statable: lacks the classical odd-primary elliptic Kummer/Selmer interface and its arithmetic comparison. |
| Infinitely many complementary Heegner fields | Not statable: lacks the continued actual elliptic L-function, finite analytic order and arithmetic root-number interface. |
| The selected Heegner field has Selmer corank one | Not statable: lacks classical elliptic p∞ Selmer and its quadratic comparison. |
| Corank-one augmentation control | Not statable: lacks arithmetic ordinary anticyclotomic Selmer modules and the specialization/local-condition maps. |
| Exact bottom Heegner specialization factor | Not statable: lacks the source-normalized Heegner tower and its actual Kummer comparison. The Howard unit comparison is an imported part, not an extra theorem here. |
| Corank one gives a non-torsion trace point and simple base-change zero | Not statable: lacks the Heegner point and continued base-change L-function. |
| Eisenstein p∞ converse | Not statable: lacks classical elliptic Selmer corank and continued L-function/analytic order. |
| Mordell–Weil rank equality and whole-Sha finiteness | Not statable: native point rank exists, but the required classical elliptic Sha/Kummer identification and analytic-order interface do not. |
| Finite-Selmer converse | Not statable: lacks the same arithmetic Selmer, Sha and analytic interfaces. |
| Positive admissible zero and odd Selmer-ratio strata | Not statable: lacks the actual isogeny-kernel character/local twist and global Selmer-ratio family interfaces. |
| Relative analytic-rank proportion bounds | Not statable: lacks those arithmetic family interfaces and continued L-function. |
| Positive absolute low-rank twist proportions | Not statable: same arithmetic and analytic interfaces. |
| Nineteen-a3 admissible density 3/8 | Not statable: a squarefree residue count can be stated, but the actual kernel-character/local-twist identification defining admissibility is missing. The residue count is supplier-owned and is not substituted. |
| No quadratic twist of the obstruction curve has good reduction at 3 | Stated as `TauCetiRoadmap.RankZeroOneBSDPartII.no_good_three_twist`, using the real coefficient definition `TauCetiRoadmap.RankZeroOneBSDPartII.scopeObstructionCurve`. It quantifies over all nonzero elements of ℚ₃, hence includes all rational twists, and tests a native minimal model. |

The old design's ten model/API admissions would violate the headline-only rule. None was copied into the acceptance file. The nineteen-a3 definition and all its coefficient/invariant/tangent Checks remain in the README; it is not needed to state the one native-carrier headline. The file contains one theorem, one real-bodied coefficient definition, a single `import Mathlib` and the one used Tau Ceti module. It contains no arbitrary proposition standing for missing arithmetic data.

## Corrections and unsupported interfaces

- The accepted good-at-three-twist hypothesis and restricted intersection bounds are retained. CGLS Theorem 5.2.1 explicitly keeps good odd-prime reduction; its Corollary 5.2.3 proof only discusses arranging the character condition. W has j=357911/2160 with v₃(j)=−3, so the latter step cannot establish good reduction for every rational three-isogeny family (CGLS line 79, line 2145, line 2198). This is a gap in that displayed conversion, not a counterexample to every possible unrestricted density theorem.
- The nineteen-a3 admissible set has mass 3/8. Bounds within unrestricted Selmer-ratio strata cannot be transferred unchanged to that set. The retained absolute bounds are (1/2)μ(A₃∩T₀) and (5/6)μ(A₃∩(T₁∪T₋₁)); no numerical value for either intersection is asserted (CGLS line 2206; BKLOS line 654).
- The separate `RankZeroOneBSD` folder is absent from the provided main tree, the indexed open roadmap heads and the board. The README retains the continuation's mathematical boundary but replaces the obsolete BSD-numbered supplier citations with verified owners: EllipticCurveModularity R29.3–R29.6, HeegnerPointEulerSystems Layer 8, the Selmer roadmap, and the arithmetic-statistics parts. No nonexistent base module is imported and no base theory is planned again.
- ArithmeticStatistics is an index. ST.0/ST.5 citations were replaced by Part I §§0.1, 0.5 and Part VII §5.10. The latter's bounds are conditional on Part III's seven-part C(F,ι,Σ). The new rational-count supplier gap requests a proof of C for the rational families and their duals; the package's accepted unconditional endpoints are not silently weakened and C is not silently discarded.
- SelmerIwasawaCohomology §4.28 compares family specializations; it does not supply an unconditional equality of root number and corank parity for an arbitrary ordinary elliptic curve. The route now consumes ArithmeticStatisticsPartVI's supporting “Elliptic p-parity” theorem. Its same supporting section explicitly supplies the general forward rank-at-most-one/whole-Sha theorem over ℚ, without the residual restrictions of its preceding converse application.
- The former GAP-CT is closed by the exact §4.29 elliptic alternation, divisible-radical and reduced-primary paired-factor statement. PS Corollary 9 itself assumes a finite group; the source locator now emphasizes Theorem 5 and Corollaries 6–7, and the finite quotient is obtained from the supplier, without assuming finite whole Sha (PS line 64, line 425, line 461).
- Native isogenies are `TauCeti.Isogeny`, not a fabricated `WeierstrassCurve.Affine.Isogeny`. Native quadratic twists and canonical heights have moved into `QuadraticTwist/Basic.lean` and `CanonicalHeight/Basic.lean`; the naive-height finiteness theorem is now Mathlib's `Mathlib/NumberTheory/Height/EllipticCurve.lean`. These locators were corrected at the pins.
- The raw twist uses discriminant parameter 4d; minimal-model good reduction, rather than raw discriminant valuation, occurs in the Lean signature. The proof route explicitly includes 2 in its finite local prescription and keeps the admissible 3-adic class fixed. “Local torsion on E and E′” in that route now explicitly means on the selected twists.
- Direct invariant arithmetic caught an erroneous auxiliary c₆ value introduced during packaging: for W, −1+36·3−216·9=−1837. The final README uses −1837 everywhere. The accepted design's Δ, c₄ and j values were correct and are unchanged.

Five exact supplier gaps replace the obsolete frontier: `eisenstein-local-dictionary` (EllipticCurves Layers 2,4,5), `complementary-heegner-twists` (ArithmeticStatisticsPartVI, supporting low-rank input), `quadratic-analytic-factorization` (EllipticCurveModularity R29.6), `cgls-ordinary-control` (SelmerIwasawaCohomology §§3.9–3.11), and `rational-three-isogeny-count` (ArithmeticStatisticsPartIII, windowed cubic counting contract). Their one-sentence needs occur verbatim in the JSON gaps and in the corresponding README supplier subsections. They are library obligations, not assumed conclusions in Lean.

## Duplication and ownership sweep

Searched the supplied main tree, board package READMEs/designs and open roadmap heads through `roadmaps list`, `roadmaps grep` and `roadmaps show`. Searches used the mathematical objects: cyclic isogeny/kernel character; ordinary/local reduction; twists and j-invariance; finite and infinite Kummer/Selmer groups; paired reduced Sha; quadratic decomposition; root-number parity; completed algebra/augmentation control; Heegner family, stabilization and main-conjecture equality; explicit heights; squareclass denominator and Selmer ratios. Additional model searches used 19a3, 2160 and 357911. The relevant named open-head suppliers were read rather than inferred from search snippets. The other supplied open-head families were included in the cross-roadmap object searches; no declaration of this package uses a supplier's fully qualified name.

Main examples read: `TauCetiRoadmap/EllipticCurves/README.md`, `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md`, and `TauCetiRoadmap/ModularForms/README.md`. Their files and `lake-manifest.json` have no difference between the content checkout and its main ref for these paths. The main ref and both library checkout revisions were verified before reporting missing objects. The libraries match the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

The explicit removals from this package's ownership/signatures, with the retained supplier, are:

| Object removed from local development | Exact owner consumed |
| --- | --- |
| A replacement elliptic curve, discriminant, coefficient map or j | Mathlib `WeierstrassCurve`, `Δ`, `c₄`, `c₆`, `map`, `IsElliptic`, `j`, `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`: 76, 120, 124, 131, 230, 366, 388. |
| A replacement isogeny/degree/point map | `TauCeti.Isogeny`, `TauCeti.Isogeny.degree`, `TauCeti.Isogeny.toPointHom`, `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean`:139, `Degree.lean`:99, `PointHom/Basic.lean`:89. |
| A one-parameter twist operation and generic discriminant/j-invariance proofs | `WeierstrassCurve.quadraticTwistOf`, `Δ_quadraticTwistOf`, `isElliptic_quadraticTwistOf_iff`, `j_quadraticTwistOf`, `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean`:169,239,299,306. |
| A raw-equation substitute for good reduction | `WeierstrassCurve.minimal`, `HasGoodReduction`, `hasGoodReduction_iff_isElliptic_reduction`, `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean`:299,323,328. |
| New canonical-height positivity, zero criterion and bounded-height finiteness | `Point.canonicalHeight_nonneg`, `Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder`, `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean`:260,332; `NumberField.finite_setOfPred_logHeight₁_le`, Mathlib Height/NumberField:431; `Affine.finite_naiveHeight_le`, Mathlib Height/EllipticCurve:116. |
| New generic Selmer, corank, Kummer and quadratic-comparison theory | SelmerIwasawaCohomology §§2.9–2.12a, 4.26, 4.28; EllipticCurves Layer 7. The local low-dimension application remains §0.2. |
| A Cassels–Tate construction and unresolved GAP-CT stub | SelmerIwasawaCohomology §4.29 explicitly states elliptic alternation and paired finite reduced primary factors. |
| An ordinary modular family parity theorem used as root-number parity | ArithmeticStatisticsPartVI supporting “Elliptic p-parity”; the generic family parity remains SelmerIwasawaCohomology §4.28. |
| Reconstruction of the Heegner tower, nonzero tower class and paired rank-one structure | HeegnerPointEulerSystems §§8.6–8.6a, 8.24, 8.31, 8.34. |
| The Howard unit-line/level-zero factor part of design §EC.2 | HeegnerPointEulerSystems §8.13. The retained §2.2 target is the fully traced κ₀/Kummer(P_K) identity and its permitted-character unit consequence. |
| A second proof of the anticyclotomic Eisenstein equality | HeegnerPointEulerSystems §§8b.2, 8b.10 with its independent contracts and scalar corrections. The new argument is its augmentation use. |
| A second explicit Gross–Zagier theorem or height normalization | GrossZagierAndArithmeticHeights §§0.1, 8.14, 8.17–8.19. |
| Re-proving the forward low-analytic-rank theorem | ArithmeticStatisticsPartVI supporting “Heegner logarithm and low rank”; the new §3.2 is its application after the converse. |
| Squareclass heights, local counting, density towers and global/local ratio distribution | ArithmeticStatisticsPartI §§0.1,0.5; ArithmeticStatisticsPartVII §5.10; Part III's counting contract. The admissible inverse image and analytic conversion remain here. |
| A second shared p-converse predicate or CM/Skinner converse | CMRankZeroConverse §C.0 and RankOneConverse §§PC.0–PC.6 retain their accepted design ownership. |
| Ten model/API/Check proof placeholders | All these elementary facts remain in README §5.1. The Lean file carries only the actual local obstruction headline and the coefficient definition it requires. |

The native definitions were read with their full contexts, rather than inferred from their names. The decisive bodies at the pins are:

```lean
protected class IsElliptic : Prop where
  isUnit : IsUnit W.Δ

noncomputable def minimal (W : WeierstrassCurve K) : WeierstrassCurve K :=
  (W.exists_isMinimal R).choose • W

class HasGoodReduction (W : WeierstrassCurve K) : Prop extends IsMinimal R W where
  goodReduction : valuation K (maximalIdeal R) W.Δ = 1

protected noncomputable def LSeries (W : WeierstrassCurve K) (s : ℂ) :=
  LSeries ((↑) ∘ W.LFunction) s
```

The first body is in `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`:366, the next two in `Reduction.lean`:299,323, and the last in `LFunction.lean`:84. The reduction declarations carry a DVR, fraction field and scalar map in their surrounding signatures; the acceptance theorem specializes them to ℤ₃⊂ℚ₃. The L-series definition adds no analytic continuation hypothesis or theorem. The cohomological Sha body in `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean`:71 is an indexed infimum of restriction kernels on supplied TopRep data; it does not choose elliptic Kummer conditions or the relevant local point modules. Thus the missing comparison interfaces were not inferred merely from a failed name search.

`roadmaps resolve` reports RankOneConverse §§PC.0 as absent from main/open heads. This is an ownership-only citation, checked directly in `packages/RankOneConverse/design/README.md` and its accepted design; it supplies no input to a target here. CMRankZeroConverse §C.0 was likewise checked in `packages/CMRankZeroConverse/design/README.md`: the exact shared implication is stated there. Both precede this package in the merge order. The resolver's statement that it could not inspect pinned Lake packages is a tooling limitation; every library name used was inspected manually in the supplied pinned sources. No missing-library verdict is based on that resolver output.

No notion was moved down from a later roadmap: every consumed owner is on main or earlier in the order. The source-specific traced comparison and obstruction example have no competing owner in the available searches. The absent parent name is not a fabricated dependency edge.

## Adversarial mathematics pass

The table records actual small calculations and negative controls, not proofs of the deep theorems. Deep conclusions were also compared with their cited legal source statements and exact supplier hypotheses. Abstract module examples test the algebraic step only; they are not represented as arithmetic realizations of arbitrary elliptic curves. Source locators do not stand in for unresolved supplier obligations.

| Statement | Instances tried and values on each side | Result | Change |
| --- | --- | --- | --- |
| §0.1 Converse-condition definition | p=2 gives 2>2 false; p=3 gives true. At p=3 η(Frob)=−1, η(I)=1; ωη(I)=−1. φ=1 or ω makes an excluded equality true. | Pass | Retained |
| §0.2 Low-dimensional Selmer comparison | (corank,dim M[p])=(0,0),(1,0),(1,1) gives dim Sel_p=0,1,3. For cyclic ℤ/9, order=9 but every alternating self-pairing is zero. | Pass | Retained |
| §1.1 Complementary fields | r=0: w=+1, complementary order=1, twist sign=−1; r=1: w=−1, complementary order=0, twist sign=+1. Both products of root signs equal −1. | Pass | Supplier/source input explicit |
| §1.2 Corank over K | Two branches give 0+1=1 and 1+0=1. At a split p place [K_v:ℚ_p]=1, so the local p-torsion dimension remains 0. | Pass | Retained |
| §2.1 Augmentation control | Over R=ℚ₃⟦T⟧: R has dim coinvariants 1 and torsion length 0; R⊕R/(T) has dimension 2 and torsion length 1. A ℤ/3 error tensors to 0. | Pass | Supplier/source input explicit |
| §2.2 Exact traced factor | For p=3,a₃=2, unit root α≡5 mod9, β≡6: (1−α⁻¹)²≡1 and α²(β−1)²≡4 mod9; both valuations are 0. At α≡1 mod3 the first factor is 0 mod3 and is not a unit. | Pass | Retained |
| §2.3 Non-torsion trace and simple zero | For S=R,κ=T, bottom κ=0 and char quotient squared=(T²), so the required unit ideal equality fails. For κ=1 it is (1), bottom=1. h_x(P)=2h_(O)(P)=2 when h_(O)(P)=1. | Pass | Retained |
| §3.1 p∞ converse | Base-change order 1 minus complementary order 1 gives 0; minus 0 gives 1. At r=2 the natural-number expression 1−r=0 gives 2+0≠1, so r∈{0,1} is essential. | Pass | Retained |
| §3.2 Rank and whole Sha | Forward theorem receives analytic order 0 or 1 and outputs the same rank. A hypothetical ⊕_(ℓ≠p)ℤ/ℓ has trivial p-primary part but infinite total order, so a single finite primary part is insufficient. | Pass | Retained |
| §3.3 Finite-Selmer converse | With rational p-torsion 0, dimensions 0,1 force coranks 0,1 by c+2s. Dimension 3 permits (c,s)=(1,1), so no rank-three converse is claimed. | Pass | Retained |
| §4.1 Admissible-family definition | For a good rational 3-kernel the local classes (1,2,3,6) give admissibility (false,true,false,false). For good kernel η the first two truth values reverse. Negative-j-valuation model gives four false values. | Pass | Retained |
| §4.2 Positive admissible ratio strata | Fixed c₃=1 and real ratio 1 or 1/3 gives m=0 or −1; fixed c₃=3 gives m=1 or 0. Each chosen local rectangle has positive denominator, without changing its 3-class. | Pass | Retained |
| §4.3 Relative bounds | Even rank support {0,2}, mean≤1: mass(0)≥1/2. Odd support {1,3}, mean≤4/3: 3−2q≤4/3 gives q≥5/6. For masses 1/8 and 1/4, absolute bounds=1/16 and 5/24. | Pass | Supplier/source input explicit |
| §4.4 Positive absolute proportions | If μ₀,μ₁>0 then μ₀/2>0 and 5μ₁/6>0. For W, μ(A₃)=0 and both products are 0, showing why the good-twist existence hypothesis remains. | Pass | Retained |
| §5.1 Nineteen-a3 model definition | (a₁,a₂,a₃,a₄,a₆)=(0,1,1,1,0) gives (b₂,b₄,b₆,b₈)=(4,2,1,0), Δ=−19,c₄=−32,c₆=8,j=32768/19. | Pass | Retained |
| §5.2 Exact admissibility/density | The affine counts at x=0,1,2 are 2,2,1; #E(𝔽₃)=6, trace=4−6=−2. Allowed d≡2 mod3 has mass (1/3)/(1−1/9)=3/8=0.375<0.416. | Pass | Retained |
| §5.3 No good twist; Lean headline | W has b₂=1,b₄=3,b₆=9,b₈=0, Δ=−2160,c₄=−71,c₆=−1837. j=357911/2160 has v₃=0−3=−3. d=1,2,3,6 all retain that j; minimal good reduction would give v₃(j)≥0. | Pass | Corrected c₆; native minimal model |
| §0.1 API: constructor | p=3,good=true,degree=3,φ=η gives true∧true∧true; replacing φ by1 gives false. | Pass | Retained precise hypotheses |
| §0.1 API: good odd/degree projection | At p=3 all projections are (prime=true,3>2=true,degree=3); p=2 gives false oddness. | Pass | Retained precise hypotheses |
| §0.1 API: actual kernel/quotient | For φ=η with η²=1, ψ=ωη and φψ=η²ω=ω. Replacing actual φ=1 by a freely chosen η would change rejection to admission. | Pass | Retained precise hypotheses |
| §0.1 API: duality | φ=η gives ψ=ωη; ωψ⁻¹=η. The two excluded cases 1 and ω are exchanged. | Pass | Retained precise hypotheses |
| §0.1 API: diagram transport | On a one-dimensional kernel, conjugating character scalar −1 by basis unit 2 gives 2·(−1)·2⁻¹=−1. | Pass | Retained precise hypotheses |
| §0.1 API: identity transport | Kernel basis unit 1 gives 1·φ(g)·1⁻¹=φ(g); for φ(g)=−1 both sides=−1. | Pass | Retained precise hypotheses |
| §0.1 API: composition transport | Over 𝔽₅ take basis units 2 and3: product=1, so direct and sequential conjugation both give φ(g)=4. | Pass | Retained precise hypotheses |
| §4.1 API: membership iff | Good rational kernel at local2: good=true,η≠1,ω=true, membership=true; local1 gives true∧false=false in both directions. | Pass | Retained precise hypotheses |
| §4.1 API: squareclass invariance | 18/2=9=3², so [18]=[2] and both are admitted; [1] gives false. | Pass | Retained precise hypotheses |
| §4.1 API: initial twist translation | For rational-kernel E,d₀=2, translated admissibility at d=1 is true because [2·1]=[2]; at d=2 it is false because [2·2]=[1]. Heights 1 and2 differ. | Pass | Retained precise hypotheses |
| §4.1 API: duality | For twisted φχ=η, dual=ωη; both avoid {1,ω}. For φχ=1 dual=ω; both rejected. | Pass | Retained precise hypotheses |
| §4.1 API: local inverse image | [1],[2],[3],[6] give four local classes; [18] maps to [2]. A₃ is the inverse image of singleton {[2]} in the rational-kernel example. | Pass | Retained precise hypotheses |
| §4.1 API: iff converse condition | For d=2 membership and (Eᵈ,3,ιᵈ) condition both=true; d=1 both=false from kernel1; d=3 both=false from bad reduction. | Pass | Retained precise hypotheses |
| §5.1 API: coefficients | All projections are exactly 0,1,1,1,0; replacing a₂ by0 gives b₂=0 instead of4. | Pass | Retained precise hypotheses |
| §5.1 API: invariants | 16−48=−32; −64+288−216=8; −8·8−27+9·4·2=−19. | Pass | Retained precise hypotheses |
| §5.1 API: ellipticity | −19≠0 in ℚ, hence a unit with inverse −1/19. Over 𝔽₁₉ its image is0 and the arithmetic ellipticity assertion is not made. | Pass | Retained precise hypotheses |
| §5.1 API: j | (−32)³/(−19)=32768/19. Reversing the sign of Δ would give −32768/19. | Pass | Retained precise hypotheses |
| §5.1 API: base change | Identity ℚ→ℚ preserves (0,1,1,1,0). The map to the zero ring sends all five to0, consistent with its 1=0; no map ℚ→𝔽₃ exists since 3·(1/3)=1 would map to0=1. | Pass | Retained precise hypotheses |
| §0.1 Check: nontrivial unramified | p=3,η(Frob)=−1,η(I)=1; ωη(I)=−1, so neither character is1 orω. | Pass | Retained precise hypotheses |
| §0.1 Check: excluded characters | φ=1 has E[ι](ℚ_p) dimension1 and fails φ≠1; φ=ω fails φ≠ω. | Pass | Retained precise hypotheses |
| §0.1 Check: bad prime/two | p=2 gives 2>2=false; a multiplicative prime gives p∤N=false even if E[p] is reducible. | Pass | Retained precise hypotheses |
| §0.1 Check: nonsplit extension | Upper triangular matrices with diagonal (η(g),ωη(g)) and nonzero upper entry have the same kernel and determinant; multiplying diagonals still gives ω(g). No zero-entry test occurs. | Pass | Retained precise hypotheses |
| §4.1 Check: rational kernel | Local (1,2,3,6) returns (0,1,0,0) as membership indicator; a character-only definition would admit an additional ramified class. | Pass | Retained precise hypotheses |
| §4.1 Check: square multiple | 2 and18 differ by3²; both map to [2]. Counting two representatives would give multiplicity2 instead of1. | Pass | Retained precise hypotheses |
| §4.1 Check: no good twist | W has v₃(j)=−3; every nonzero twist also −3, so all four local indicators are0. | Pass | Retained precise hypotheses |
| §4.1 Check: permitted initial character | For φ=η, d=1 gives η and admission; d=2 gives η²=1 and rejection, reversing the rational-kernel case. | Pass | Retained precise hypotheses |
| §5.1 Check: discriminant | Δ=−19, whereas +19 differs by38 and −19²=−361 differs by−342. | Pass | Retained precise hypotheses |
| §5.1 Check: mod-three point count | Affine solutions (0,0),(0,2),(1,0),(1,2),(2,1): count5; plus O=6; trace3+1−6=−2, distinct from coefficient a₃=1. | Pass | Retained precise hypotheses |
| §5.1 Check: raw twist parameter | t=0,n=−2 gives D=8. Δ=−19·8⁶=−4980736; the incorrect −19·2⁶ is −1216, differing by factor4096=4⁶. | Pass | Retained precise hypotheses |
| §5.1 Check: flex | At (0,0), partials F_x=−1,F_y=1, tangent y=x; substituting gives −x³=0, the same zero polynomial equation x³=0, hence intersection multiplicity3. | Pass | Retained precise hypotheses |
| 0 eisenstein-converse-data additional Check 1 | Under permitted local pair η,ωη, invariant dimensions are0+0=0; ordinary unit-root trace is nonzero modp. With φ=1 the invariant dimension is at least1. | Pass | Retained precise hypotheses |
| 0 small-selmer-corank additional Check 1 | ℤ/9 has order9, but B(1,1)=0 forces B(a,b)=abB(1,1)=0; perfectness fails for all9 characters. | Pass | Retained precise hypotheses |
| 0 small-selmer-corank additional Check 2 | (ℚ₃/ℤ₃)⊕(ℤ/3)² has 3-torsion dimension1+2=3 and corank1. | Pass | Retained precise hypotheses |
| 1 auxiliary-fields additional Check 1 | r=0 gives complement order1; r=1 gives complement order0. | Pass | Retained precise hypotheses |
| 1 auxiliary-fields additional Check 2 | All N-primes have split local degree1+1=2; an inert degree2 place fails that prescription. | Pass | Retained precise hypotheses |
| 1 selmer-corank-over-k additional Check 1 | The known twist has order1−r and finite Sha; E has initial corank r but no initial Sha finiteness value. The corank sum still computes1. | Pass | Retained precise hypotheses |
| 2 augmentation-control additional Check 1 | X has free rank1; X_E has free rank0, so replacing the former loses1 in the coinvariant count. | Pass | Retained precise hypotheses |
| 2 augmentation-control additional Check 2 | R⊕R/(T) gives dim=1+1=2, contradicting the required1. | Pass | Retained precise hypotheses |
| 2 augmentation-control additional Check 3 | In R[1/3], 3 is invertible and T has residue0; a finite ℤ/3 module becomes0 while R/(T) remainsℚ₃. | Pass | Retained precise hypotheses |
| 2 heegner-specialization-factor additional Check 1 | κ=T in R is nonzero, but its bottom value is0. | Pass | Retained precise hypotheses |
| 2 heegner-specialization-factor additional Check 2 | After trace both Artin translates have the same image P_K, giving (1−α⁻¹)²P_K; before trace they remain distinct terms. At α≡5 mod9 the traced coefficient is1 mod9. | Pass | Retained precise hypotheses |
| 2 heegner-point-nontorsion additional Check 1 | Inverting T makes (T²)=(1), hiding the length2 obstruction; before inversion its valuation is2. | Pass | Retained precise hypotheses |
| 2 heegner-point-nontorsion additional Check 2 | The circular alternative assumes rank1 and finite Sha as inputs; the retained route starts only with corank1, leaving both arithmetic outputs unassumed. | Pass | Retained precise hypotheses |
| 3 p-converse additional Check 1 | r=0: order0 iff central value nonzero; r=1: order1 and first derivative nonzero. | Pass | Retained precise hypotheses |
| 3 p-converse additional Check 2 | p=3 passes 3>2; a reducible two-character representation passes; neither implies p≥5 or irreducibility, so those predicates are absent. | Pass | Retained precise hypotheses |
| 3 rank-and-sha additional Check 1 | Finite whole Sha is output after central order0 or1, whereas the input corank fixes only a p-adic rank. A direct sum over other primes would be infinite despite p-part0. | Pass | Retained precise hypotheses |
| 3 mod-p-converse additional Check 1 | A bare cofinite group (ℚ₃/ℤ₃)^0⊕ℤ/3 has dim p-torsion1 and corank0; elliptic alternating pairing excludes its reduced finite factor. | Pass | Retained precise hypotheses |
| 3 mod-p-converse additional Check 2 | p=3 satisfies oddness but 3≥5=false; the stated theorem retains p=3. | Pass | Retained precise hypotheses |
| 4 admissible-twists additional Check 1 | W has rational 3-kernel dimension1 but μ(A₃)=0. Nineteen-a3 has allowed local2 and μ(A₃)=3/8. | Pass | Retained precise hypotheses |
| 4 admissible-ratio-strata additional Check 1 | Fixed local2 stays local2 under the two real sign prescriptions; switching its local3-class to1 changes membership from1 to0 and is not allowed. | Pass | Retained precise hypotheses |
| 4 admissible-ratio-strata additional Check 2 | Fixed finite ratio1 gives odd exponent−1; fixed ratio3 gives odd exponent+1, with absolute exponent1 in each case. | Pass | Retained precise hypotheses |
| 4 relative-proportion-bounds additional Check 1 | If μ(Σ₀)=1/8, relative1/2 gives absolute1/16; using1/2 directly overstates it by factor8. | Pass | Retained precise hypotheses |
| 4 relative-proportion-bounds additional Check 2 | A binary outcome with mass1/2 at rank0 and1/2 at rank2 has mean1 but rank0 density1/2, not an assertion of exact Goldfeld behavior for the arithmetic family. | Pass | Retained precise hypotheses |
| 4 positive-twist-proportions additional Check 1 | The converted subset lies in A₃ of mass3/8; outside it the conversion proves0 facts about analytic rank. Positive lower bounds do not compute a density1/2. | Pass | Retained precise hypotheses |
| 5 nineteen-a3-model additional Check 1 | Changing a₂ from1 to0 changes b₂ from4 to0; changing a₃ from1 to0 changes b₆ from1 to0. | Pass | Retained precise hypotheses |
| 5 nineteen-a3-admissibility additional Check 1 | (3/4)·(1/2)=3/8, whereas assigning half the full mass gives1/2. | Pass | Retained precise hypotheses |
| 5 nineteen-a3-admissibility additional Check 2 | P=(0,0) has affine coordinates; O has projective coordinates[0:1:0], so P≠O. | Pass | Retained precise hypotheses |
| 5 nineteen-a3-admissibility additional Check 3 | 0.375<0.416 applies only to subsets of the admissible method set, while the full twist set has mass1. | Pass | Retained precise hypotheses |
| 5 no-good-three-twist additional Check 1 | Every twist has the same j=357911/2160 and valuation−3; character changes cannot turn −3 into a nonnegative value. | Pass | Retained precise hypotheses |
| scopeObstructionCurve real definition | Its coefficient projections are1,0,3,0,0; the zero tuple would give Δ=0 instead of−2160. | Pass | Explicit in README/signature |
| Obstruction API: projections/ellipticity | Δ=−2160≠0 overℚ, inverse−1/2160; unit discriminant condition=true. | Pass | Explicit in README/signature |
| Obstruction API: c₄,c₆,j | c₄=1−72=−71; c₆=−1+108−1944=−1837; (−71)³/(−2160)=357911/2160. | Pass | Corrected c₆ to −1837 |
| Obstruction API: local base change and j | d=1,2,3,6 gives raw Δ=−8847360,−566231040,−6449725440,−412782428160; each j remains357911/2160. | Pass | Explicit in README/signature |
| Obstruction Check: tangent/order | F_x(0,0)=0,F_y(0,0)=3; tangent3y=0, hencey=0 overℚ; intersection gives x³=0. | Pass | Explicit in README/signature |
| Obstruction Check: denominator | 2160=16·27·5; numerator357911≡2 mod3. Valuation ratio=0−3=−3, with denominator nonzero. | Pass | Explicit in README/signature |
| Obstruction Check: zero and nonzero twists | d=0 gives D=0,Δ=0, no elliptic twist. d=1 and3 give v₃(Δ)=3 and9 while v₃(j)=−3 in both. | Pass | Explicit in README/signature |
| Convention: native carriers/universe | ℚ andℚ₃ have1≠0 and characteristic0. On the zero ring Δ=0 is a unit since0=1, so it is excluded from every arithmetic theorem rather than covered by “Δ nonzero”. | Pass | Explicit in README/signature |
| Convention: odd prime/actual kernel | p=0,1 are not prime; p=2 fails>2; p=3 passes. For kernel1, choosing an unrelatedη would falsely change admission0→1, forbidden by using the actual kernel. | Pass | Explicit in README/signature |
| Convention: corank/dual | D=ℚ₃/ℤ₃ has D⊗ℚ₃=0 but dualℤ₃ of rank1. The zero discrete module has dual rank0. | Pass | Explicit in README/signature |
| Convention: quadratic projectors | For c=diag(1,−1), (1+c)/2=diag(1,0) and (1−c)/2=diag(0,1); sum=id. In characteristic2, 1=−1 and the integral projector formula is invalid. | Pass | Explicit in README/signature |
| Convention: Λ involution/localization | T↦(1+T)⁻¹−1=−T/(1+T) has order1 and leading coefficient−1. T=0 remains a prime after inverting3; 3 becomes a unit. | Pass | Explicit in README/signature |
| Convention: discriminant/unit index | D=−7 gives u_K=1; D=−3 gives u_K=3 and fails D<−4. Both are odd, so oddness alone does not enforce the condition. | Pass | Explicit in README/signature |
| Convention: Heegner source/trace | On trace of two conjugates P+σP, σ permutes the two terms; (1−aσ) acts as (1−a) after trace. Applying two such factors gives(1−a)². No division by the number of conjugates occurs. | Pass | Explicit in README/signature |
| Convention: height factor/polarization | h_(O)(P)=1,h_(O)(2P)=4 gives h_x(P)=2,h_x(2P)=8,B_x(P,P)=(8−2−2)/2=2. A half-height Gram in rank1 gives1 rather than2. | Pass | Explicit in README/signature |
| Convention: signed ratio | c=1,3,1/3 gives signedm=0,1,−1 and absolutem=0,1,1; the latter union is precisely T₁∪T₋₁. | Pass | Explicit in README/signature |
| Convention: squareclass height | [18]=[2], heights are both2; naïve representative height18 would be wrong. [−1] and[1] both have height1 but are distinct squareclasses. | Pass | Explicit in README/signature |
| Convention: local Haar/squarefree mass | After excluding9-divisibility, each unit residue has mass(1/3)/(8/9)=3/8; each valuation-one squareclass(1/9)/(8/9)=1/8; sum=1. | Pass | Explicit in README/signature |
| Convention: cutoff/denominator | At X=1 signed squarefree set={−1,1}, count2; at X=0 it is empty,count0. A conditional0/0 is not used to assert a positive proportion. | Pass | Explicit in README/signature |
| Native IsElliptic and minimal reduction contracts | Overℚ, Δ=−19 is unit; overℤ, −19 is nonzero but not unit. Native good reduction requires a minimal equation with multiplicative valuation1, equivalent to additive discriminant valuation0. | Pass | Explicit in README/signature |
| Native twist discriminant/ellipticity/j contracts | D=8 scales Δ by8⁶,c₄ by8² and c₄³/Δ by1. D=0 gives singular equation and no j claim. In characteristic2 trace1,norm−d gives D=1, but the arithmetic headlines explicitly useℚ₃. | Pass | Explicit in README/signature |
| Native height/Northcott contracts | O has canonical height0 and finite order1; a rational order-three point has height0 and order3. Positive non-torsion test h_x=2 gives nonzero height. The zero criterion retains Northcott. | Pass | Explicit in README/signature |
| Native cohomological Sha/raw L-series boundary | An empty family of localization kernels has intersection=whole H¹, whereas the arithmetic Sha uses all places. The literal L-series outside convergence supplies no asserted continued value; no0/0 convention is treated as analytic continuation. | Pass | Explicit in README/signature |
| Elliptic local dictionary supplier gap | Good rational kernel at3: local admissibility indicators(0,1,0,0). The dual exchanges1↔ω andη↔ωη, preserving the same indicators. | Pass | Explicit in README/signature |
| Quadratic analytic factorization supplier gap | Central orders(a,b)=(0,1),(1,0) give product order1 in both cases; an arbitrary unrelated analytic germ1 would give order0 and is excluded by actual Euler-factor comparison. | Pass | Explicit in README/signature |
| Ordinary control supplier gap | A local finite3-error contributes rank0; an H²/Tor error need not vanish. Example R/(T) has nonzero Tor₁^R(−,R/(T))=R/(T), so surjectivity is not inferred. | Pass | Explicit in README/signature |
| Complementary twist supplier gap | For w(E)=−1 request order0 and for+1 request order1, with all split local degrees1. The opposite choices would give base-change signs+1 rather than−1. | Pass | Explicit in README/signature |
| Rational counting supplier gap | The mean tests are1+3^0=2 and1+3^1=4, dual mean4/3. Dropping an unknown counting error equal toX would alter a predicted mean2 to3; the explicit o(X) contract is therefore needed. | Pass | Explicit in README/signature |
| Cassels–Tate supplier/general-polarization boundary | For (ℤ/3)², B((a,b),(c,d))=(ad−bc)/3 is perfect alternating, each diagonal0. For a cyclicℤ/9 alternating form is0; a divisibleℚ₃/ℤ₃ summand lies in the radical. General principal polarizations need not share elliptic alternation. | Pass | Explicit in README/signature |
| Heegner main-conjecture/scalar contract | In R=ℚ₃⟦T⟧, scalingκ by3 gives unit ideal(3)=(1) and preserves rational index; scaling byT gives quotient ideal(T) and changes squared valuation by2. A tower scalar cannot be silently treated as a unit. | Pass | Explicit in README/signature |
| Gross–Zagier height/source contract | Replacing π by[2]π sends pointP to2P, h_x to4h_x and degree to4degree; the quotient is unchanged. If h_x(P)=2, the new numerator is8 and both numerator/degree ratios agree. | Pass | Explicit in README/signature |
| Statistics numerator/relative-density contract | Massq=1/2 at0 and1/2 at2 has mean1; mass5/6 at1 and1/6 at3 has mean4/3. These attain the two bounds, not a larger bound. | Pass | Explicit in README/signature |
| Abstract group/category boundaries | Elliptic point and Selmer groups are abelian; in S₃, (12)(23)≠(23)(12), so it is not an admitted carrier. A square-zero or inseparable characteristic-p thickening is not a characteristic-zero field, and receives no elliptic-curve arithmetic conclusion. | Pass | Explicit in README/signature |
| Nonvacuity and hypothesis direction | The no-good theorem quantifies over the concrete coefficient model and all nonzero locald; d=0 is excluded explicitly. No hypothesis asserts bad reduction or contains the conclusion. The Selmer converses use actual groups, not arbitrary vector spaces. | Pass | Explicit in README/signature |

The table contains 110 rows. Each original target, definition API item and definition Check has its own row; repeated accepted target Checks are also recorded separately. The computed extra invariants were independently evaluated with exact rational arithmetic; no large computation or executable algorithm is proposed as a roadmap target.

## Elaboration and declaration signatures

Ran the prescribed `lake env lean` on `packages/RankZeroOneBSDPartII/Suggested.lean` from the pinned content environment. Exit status 0; exactly **one** warning: ``warning: declaration uses `sorry` ``. It is the admitted `no_good_three_twist` theorem at line 48. There were no errors and no other diagnostic messages. The one Tau Ceti object file existed, so no targeted module build was required. No bare build, update, cache fetch, set_option or library edit was used.

A separate scratch Lean file contained the same declarations plus `#check @` for **both** declarations and was elaborated once. Its printed types were:

```lean
TauCetiRoadmap.RankZeroOneBSDPartII.scopeObstructionCurve : WeierstrassCurve ℚ
TauCetiRoadmap.RankZeroOneBSDPartII.no_good_three_twist : ∀ (d : ℚ_[3]),
  d ≠ 0 →
    ¬WeierstrassCurve.HasGoodReduction ℤ_[3]
        (WeierstrassCurve.minimal ℤ_[3]
          ((TauCetiRoadmap.RankZeroOneBSDPartII.scopeObstructionCurve.map
            (algebraMap ℚ ℚ_[3])).quadraticTwistOf 0 (-d)))
```

The nonzero parameter hypothesis is present in the elaborated theorem, and the definition has no silently dropped context. No binder correction was needed. The README was made explicit about local ℚ₃ parameters, base change, trace/norm convention and minimalization to match this signature. The scratch run also exited 0, with one sorry warning and those expected `#check` outputs.

## Sources, identifiers and dependency validation

All three works were fetched through the supplied sources service, legally from their author pages, and read in their line-numbered extractions. Each has a single lifetime manifest key, complete bibliographic fields, version note, locator and service provenance, status certified. No source text or PDF was copied into the repository and no additional unread reference is required. Published CGLS pagination, the 25-page BKLOS author pagination and the corrected 32-page PS author pagination are distinguished. Source-specific claims use CGLS line 1847, line 1934, line 2001, line 2145–2215; BKLOS line 156–173, line 643–661, line 674, line 713–765, line 800–811; PS line 64–74, line 425–462.

Own-identifier audit: the only backticked local names in the README are `scopeObstructionCurve` and `no_good_three_twist`; both are declared, and both Lean names appear in the README. API and Check names from the input catalogue were rewritten as prose, not padded into Suggested.lean. The final text has no absolute machine paths, process headings, dollar/LaTeX delimiters or unimplemented local API identifiers. Metadata matches main's one-line topic convention.

The prescribed dependency command was run with `--name RankZeroOneBSDPartII`, the supplied `--order` and `--movable`. Its exact output follows:

```text
depcheck: 52 roadmaps, 592 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line for this roadmap. No merge-order or content-repository file was edited. The only package edits are the four delivery files, the top-level gaps array and this report; scratch work and logs are outside the package.
