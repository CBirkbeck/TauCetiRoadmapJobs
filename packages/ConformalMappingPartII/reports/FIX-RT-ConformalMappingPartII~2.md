# Repair report: ConformalMappingPartII

The prefixes `r2a` and `r2b` distinguish the finding IDs in the two supplied reviews. F01–F06 follow review r2a; F07–F09 are the additional distinct findings from review r2b. Each section records its original review alias. Their confirmations of the same issues are settled once below. All changes concern `packages/ConformalMappingPartII/README.md`, `packages/ConformalMappingPartII/Suggested.lean` and `packages/ConformalMappingPartII/sources.toml`; this report is the additional requested deliverable.

## F01 (P2) — applied

Reviews: r2a-F01.

README §2.2: holomorphy of both functions near x → g holomorphic near x and f holomorphic near g(x). Lean already has the correct `AnalyticAt ℂ f (g x)` hypothesis. The witness yields left side zero and right side −6: the totalized derivative convention is `deriv_zero_of_not_differentiableAt`, `Mathlib/Analysis/Calculus/Deriv/Basic.lean:239`. The Schwarzian normalization agrees with CDT-journal line 2423.

## F02 (P1) — applied

Reviews: r2a-F02.

Unowned complete-metric uniqueness → named `FinitePuncturedCover.metricComparison`, consuming RiemannianGeometry R4.3 and R4.7. Descend its metric equality before transferring finite area. Added normalization, scaling and incomplete-metric Checks. Evidence: `TauCetiRoadmap/RiemannianGeometry/README.md:663`, `:665`, `:734`, `:745`; McMullenRS line 5348 fixes the disc metric. The infinite-area universal disc is distinguished from its finite-area quotient.

## F03 (P2) — applied

Reviews: r2a-F03.

Locally owned countable-loop/countable-sheet proof → RiemannianGeometry R4.3’s native-cover Hausdorffness and second countability. Kept only the comparison of the real and complex pullback atlases. Evidence: `TauCetiRoadmap/RiemannianGeometry/README.md:670`; the pinned `TauCeti/Geometry/Manifold/Instances/UniversalCover.lean:63` constructs the atlas from the same covering projection. The domain may still have infinitely many complementary components.

## F04 (P2) — applied

Reviews: r2a-F04.

Unqualified ownership of surface prerequisites → PDE Lane C, items 12–15 for the Euclidean theory, with separate Needs lines for surface Perron, Dirichlet and Green targets. Named `SurfaceUniformization.dirichlet` and added three Checks. The surface transport and global assertions remain here. Evidence: `TauCetiRoadmap/PDE/README.md:290`; Uniformization line 152, line 155 and line 213.

## F05 (P2) — applied

Reviews: r2a-F05.

Former §§1.11–1.12 → §§1.6–1.7, before roots specialization in §§1.8–1.12. Updated every cusp-comparison reference and its source-manifest locator. Separated roots-cover existence/uniqueness dependencies from cusp-limit dependencies. The general deck realization consumes only the preceding cover theory; the metric and cusp comparison then precede its uses. No layer was reorganized.

## F06 (P3) — not actionable in this package: merge-order edits are outside the authorized files

Reviews: r2a-F06.

The witness holds: `git diff --stat origin/main...HEAD` includes `merge-order/ORDER.txt | 1 +`. This is a committed change, even though the working tree started clean. Removing it or preserving registration through a separate intake change requires maintainer action outside this package. No edit to the order file was made. This is not a missing mathematical supplier contract.

## F07 (P2) — applied

Reviews: r2b-F01.

Untyped hypergeometric parameters `0` and `-1` → explicit `(0 : ℂ)` and `(-1 : ℂ)`. The pinned `ordinaryHypergeometric` separates its scalar field from its argument algebra (`Mathlib/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean:59`, `:81`). The revised theorem elaborates over ℂ for every x, including outside the unit disc; terminating convergence is supplied at `:149` and `:154`.

## F08 (P3) — applied

Reviews: r2b-F02.

Redundant `simpa`, unused `iteratedDeriv_zero`, and two unnecessary `<;>` combinators → direct contradiction simplification, the shorter affine simplification, and sequential square-Schwarzian tactics. All affected examples remain proved. Elaboration reports no linter diagnostics; only the 44 intended theorem admissions remain.

## F09 (P3) — applied

Reviews: r2b-F03.

Added ConformalMapping L1 to scope and exact contracts, with local boundedness required before Montel. Added FuchsianOrbifolds Layer 4 to scope; retained its existing exact compactification contract. Evidence: `TauCetiRoadmap/ConformalMapping/README.md:102` and `TauCetiRoadmap/FuchsianOrbifolds/README.md:286`. The metric-invariance part of L2 is also explicit for `metricComparison`.

## Mathematical audit

Read every numbered target, its APIs and Checks, every Lean declaration, and the standing conventions. The tables include all 96 numbered subsections, the surface construction targets and the new metric comparison. “Retained” records the outcome of the stated mathematical instances, not a proof of an admitted target. Every Lean theorem has its hypotheses in its own signature; all 60 named declaration types were elaborated with `#check @name` in a scratch copy. There are no ambient section variables to disappear. The 15 examples are proved; the remaining analytic boundary cases are named theorem targets.

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| Cayley convention and native atlas agreements | z=0, 1/2, 1; disc, annulus, overlapping sheets | i, 3i, excluded denominator; injective disc versus noninjective annulus; identity transition | Retained |
| Domain, derivative and coefficient conventions | Empty/disconnected sets; n=0,1,2,3; zero coefficients | Pointedness/connectedness and positive order exclude the bad cases; jets are unscaled | Retained |
| Projective, circle and meromorphic conventions | g versus −g; constant functions; centre pole; removable point with wrong value | Lift sign cancels; means are probability means; centre log r and continuity guards are necessary | Retained |
| §0.1 `LinearEquation`, `initialJet`, `IsSolution`, companion API | y=0, 1, exp(−z), z²; n=1,2,3; coefficient 1/z at zero | Equation and analyticity both tested; second jet of z² is 2; companion vector (0,1) fails y″=0 system | Proof simplification only |
| §0.2 solution germs, jet equivalence, `initial_value`, `orderOne_constants`, `orderTwo_affine` | Zero coefficients, jets (u,v), (0,0,2) | Inverses give constants, u+v(z−x₀), z²; uniqueness is germ equality | Retained |
| §0.3 continuation | Constant equation; loop in an annulus | Ordinary-point continuation exists; no path independence without monodromy hypothesis | Retained |
| §0.4 `global_initial_value` | Simply connected disc versus annulus | Initial jet determines a global solution on the stated domain only | Retained |
| §0.5 punctured solution germs and meromorphic-basis API | Ordinary point, 1/z, exp(1/z) | Pole bound 0 or 1; identity monodromy of exp(1/z) does not supply meromorphic extension | Retained |
| §0.6 simultaneous pole clearing | p−p(α) with ramification; several algebraic images | A sufficiently high vanishing order clears every basis pole; minimal polynomials handle conjugates | Retained |
| §1.1 `noncompactCoordinate` | ℂ, 𝔻, compact sphere | First two have identity coordinates; sphere excluded by noncompactness | Retained |
| §1.1 `perron` | Constants bounded above by zero; harmonic replacement on a disc; all positive constants | Envelope zero; replacement compatible; unbounded family fails local boundedness | Import PDE local theory |
| §1.1 `dirichlet` | Boundary constants c; Re z on circle; annulus with values 0 and 1 | c; Re z; log\|z\|/log R | Name target; add three Checks |
| §1.1 `greenFunction` | Disc of radius R, pole zero; boundary circle; changed local coordinate | log(R/\|z\|); zero boundary; regular part changes harmonically | Import PDE; retain surface pole construction |
| §1.1 `discEmbedding` | Closed disc; annulus | Disc interior qualifies; annulus fails simple connectivity | Retained |
| §1.1 `exhaustion`, `limitEmbedding` | Radius-r disc exhaustion; exhaustion of ℂ; normalized derivative one | Identity limit on disc; plane alternative allowed; derivative prevents constant limit | Make Montel input explicit |
| §1.1 `PointedCover.exists_cover` and cover topology | Ω=𝔻, ℂ∖{0}, ℂ∖{±1}, infinitely connected domain | Two omissions force disc; one omission does not; no finite-connectivity restriction | Import R4.3 topology |
| §1.2 `PointedCover`, rotation/lift/derivative API, `identity_exists`, `square_not_cover`, `disconnected_not_cover` | Identity, dilation, z², disjoint two-ball union | Actual surjective covering passes; ramification and disconnected target fail | Retained |
| §1.3 `conformalRadius`, cover derivative/positivity/classical/affine API, `unitDisc`, `radiusTwo` | 𝔻, D(0,2), φ(z)=z/2; nonhyperbolic domain | 1, 2, reciprocal derivative 2; infimum outside geometric class uninterpreted | Retained |
| §1.4 `PointedCover.extremal` | Constant based map, F(az), \|a\|<1 and \|a\|=1 | Zero derivative; strict bound; equality exactly for rotation lift | Retained |
| §1.5 radius monotonicity | Disc inclusion into radius-two disc; equality domain | 1≤2; equality for identity inclusion | Retained |
| §1.6 projective deck realization | Disc, annulus, finite punctures | Trivial or free discrete deck action as appropriate; Cayley conjugation preserves quotient | Move before roots |
| §1.7 `metricComparison` | Value on coordinate vector 1 at zero; scaling c; pullback by z/2 | Squared length 4; curvature −1/c; incomplete curvature −1 metric has radial length log 3 | Name target; R4.3/R4.7; three Checks |
| §1.7 cuspComparison and cofinite/end/compactification/simple-q API | Three punctures; infinity puncture; primitive width versus m times width | Area 2π, three ends; reciprocal chart at infinity; linear term versus q_m^m | Descend metric equality first; move before roots |
| §1.8 `RootsCover`, existence and normalization API, `realRadialLimit`, `quarterTurn` | N=1,2,3; z=0; t→1⁻; source multiplication by i | N=1 excluded; target ℂ∖{±1} at 2; interior omits 1; quarter-turn derivative has positive imaginary part | Split existence and cusp-limit Needs |
| §1.9 cover derivative | Interior zero and nonzero points | Local biholomorphism gives nonzero derivative everywhere | Renumber only |
| §1.10 rotation equivariance | N=2 oddness; N=3, τ=2i; opposite matrix lift | Displayed matrix gives ζ₃⁻¹/3 under inverse Cayley; lift negation harmless | Renumber only |
| §1.11 `RootsCover.power_descent`, PowerDescent API | F(z)=az+O(z^(N+1)); N=2 roots ±z; nonzero lift of zero | G′(0)=a^N; independence of root; zero order N away from selected branch | Renumber only |
| §1.12 descended derivative | N=2,3; positive versus rotated derivative | Derivative is F′(0)^N, norm is corresponding power | Renumber only |
| §2.1 `schwarzian`, affine/expanded/Möbius API, `schwarzian.inverse` | 2z+1, z², 1/z, critical point zero | 0, −3/(2z²), 0 away from pole; no geometric interpretation at critical point | Simplify two proved examples |
| §2.2 `schwarzian_comp_apply` | Review witness with g(0)=1 and f nonholomorphic near 1; holomorphic affine composition | Wrong base-point hypothesis gives 0=−6; corrected hypotheses give chain rule | Correct README base point |
| §2.3 Möbius invariance | Translation, dilation, inversion; zero determinant or pole | Invariance only on nonsingular denominator domain | Retained |
| §2.4 Schwarzian ODE | w=z and z² away from zero; ratio of independent affine solutions | Q=0 or −3/(4z²); coefficient is S/2; denominator guard retained | Retained |
| §2.5 accessory formula | Three distinct finite punctures; move one to infinity | Cusp logarithm gives coefficient 1/2; no extra singularities; unpunctured infinity regular | Update cusp reference |
| §2.6 infinity constraints | Expand through X⁻³ | Coefficients cancel exactly for the three stated sums; O(X⁻⁴) remains | Retained |
| §2.7 symmetric accessory parameters | N=2,3; p₀=0 and roots | m₀=0, m_k=−(N+1)ζ^(−k)/(2N) satisfy all constraints | Retained |
| §2.8 `roots_inverse_schwarzian` | N=2, x=0; change inverse branch; X=1/x | Value 3/2; branch independence; x⁻⁴ chain weight | Retained |
| §2.9 inverse linear equation | N=2 at zero; arbitrary fundamental basis | Equation coefficient agrees with S/2; arbitrary ratio needs Möbius normalization | Retained |
| §3.1 `blaschkeFactor` and API | a=0, 1, −1; \|a\|<1 and \|z\|=1 | z, −1, 1; boundary modulus one with removable boundary factor | Retained |
| §3.2 `finiteBlaschke` and API | Empty product; one interior zero of multiplicity 2; boundary-only family | 1, z², −1; strict disc image requires positive interior multiplicity | Retained |
| §3.3 zero removal | g=z²; g=z−1; identically zero | Interior zero removed; boundary zero persists; zero germ excluded | Retained |
| §3.4 `herglotz_log` | g=1, exp(az); g with a boundary zero; R=0 | Normalized log 0 or az; zero-free and positive-radius guards essential | Retained |
| §3.5 derivative Herglotz | exp(az); nonunit constant | a or 0; normalization constant disappears on differentiation | Retained |
| §3.6 quotient phase | G=i; G=1 | Integral exponential 1 reconstructs i only with phase i | Retained |
| §3.7 radial smoothing | Boundary zero z−1; no zeros; g=0 | Nearby outer circle avoids isolated zeros; zero case separate | Retained |
| §3.8 `quotient_representation` | g=0,1,i; ε>0; boundary zeros | h=1 works for constants; smoothing handles boundary zeros | Retained |
| §3.9 quotient lower bound | g=h=1; isolated zeros of h | Zero equality; a.e. logarithmic identity and Jensen keep lower bound | Retained |
| §4.1 `gauss_equation`, `gauss_equation_terminating`, `gauss_terminating_checks` | (0,1,1), (−1,1,1), c=0; \|x\|>1 in terminating cases | Polynomials 1 and 1−x solve equation globally; denominator pole excluded | Constrain scalar parameters to ℂ |
| §4.2 descended ODE | Indicial equations at 0,1,∞; N=2 | Exponents {0,1/N} at 0, repeated 1/2 at 1 and repeated −1/(2N) at infinity agree | Retained |
| §4.3 hypergeometric solutions | N=2; leading powers at zero | Leading terms x^(1/N) and 1; c=2a₊ or 2a₋ avoids poles | Retained |
| §4.4 `inverseRatio` and API, `levelTwo_initial`, `levelTwo_cubic` | u=0, N=2; roots rotation | J₂=u+u³/4+O(u⁵); first derivative 1, third derivative 3/2 | Retained |
| §4.5 `inverseRatio.cover_inverse` | Both germ compositions; rotated source; zero point | Prefactor F′(0)⁻¹ gives both inverse germs; positive orientation permits real norm prefactor | Retained |
| §4.6 zero-balanced continuation | k=0; a=1/2; chosen versus shifted logarithm branch | Constant −log x−2γ−2ψ(a); ordinary Γ(2a) factor restored; both sides continued compatibly | Retained |
| §4.7 digamma coefficient bound | k=1, a=1/2; a=1/4 and 3/4; k increases | 2log 2−1; positive decreasing difference with index k+1 | Retained |
| §4.8 uniform remainder | \|x\|→0; a endpoints; a₊−a₋=1/N | Tail O(\|x\|(1+\|log x\|)); parameter derivative supplies required 1/N | Retained |
| §5.1 `gammaRadius` and API, `smallLevels` | N=1,2,3; N→∞ | 0 outside geometric range; stated Γ(1/4) and Γ(1/6) values; limit 1 | Retained |
| §5.2 positivity | N=2 and general N≥2 | Every Gamma argument positive; denominator nonzero | Retained |
| §5.3 alternative Gamma formula | N=2,3; reflection and duplication | Same values and no zero denominator | Retained |
| §5.4 inverse boundary ratio | Real x→1⁻; N=2 | Leading logarithms give stated Gamma ratio; inverse tends to unit-circle point | Update cusp reference |
| §5.5 `roots_conformal_radius` | N=2,3; arbitrary cover phase | Norm equals γ_N independent of phase | Retained |
| §5.6 log-Gamma expansion | z=0; z and −z; real −1<z<1 | Branch vanishes at 0; linear term −γz; real branch is log of positive Gamma | Retained |
| §5.7 odd-zeta series | N=2; cancellation of even powers | First terms ζ(3)/(2N³), 3ζ(5)/(8N⁵); positive absolutely convergent series | Retained |
| §5.8 `gammaRadius.positive_expansion` | N=2; first exponential cross term | ζ(3)²/(8N⁶)>0 plus positive tails; uniform N⁻⁶ upper bound | Retained |
| §6.1 ideal polygon | N=2,3; side reflection and based point zero | Ideal 2N-gon, area 2π(N−1); requires actual side-pairing witness | Retained |
| §6.2 primitive cusp | N=2; positive width and full stabilizer | h₂=2; mth power insufficient for primitive q | Retained |
| §6.3 free deck presentation | N=2; rotation fixing i | Rank N; nontrivial finite-order rotation cannot belong to torsion-free deck group | Retained |
| §6.4 PowerStabilizer and API | N=2; quotient image of rotation; conjugated actions | Deck index N; exact order N; action is actual Cayley conjugate | Retained |
| §6.5 maximal power invariance | Constant root-of-unity ratio; stabilizer fixing i | Ratio locally constant, hence constant; adjusting rotation gives deck element | Retained |
| §6.6 quadrilateral | N=2; Cayley images of vertices | Area π; general area 2π−2π/N | Retained |
| §6.7 `half_rotation_involution` | z=0; both signs of half rotation; omitted root values | Both sides 1 at zero; inverse half rotations differ by root rotation; denominators nonzero | Retained |
| §6.8 TriangleSupergroup and API | N=2; square of extra generator; antiholomorphic reflection | Area π/2, index two, square in power stabilizer; reflection excluded from PSL₂ | Retained |
| §7.1 `discCounting` and API, `centrePole`, `boundaryPole` | 1/z, constants 0 and 1, pole a with r=\|a\| | log r, zero, zero boundary weight; centre term essential | Retained |
| §7.2 `discCharacteristic` and API, `identity`, `centrePole` | Nonzero constant; z; 1/z; r→0⁺ | log⁺\|c\|; zero; −log r cancels log r | Retained |
| §7.3 counting positivity | Pole-free centre; centre pole; infinite order | Nonnegative weights except excluded centre pole; zero germ allowed | Retained |
| §7.4 `discCounting.zero_iff`, `scalarSpike` and API, `removable_not_continuous` | Spike value 2 versus punctured value 1; boundary pole | Order zero/count zero do not give pointwise analyticity without continuity | Retained |
| §7.5 local Jensen | az, 1/z, a≠0; zero germ | Mean log\|a\|+log r or −log r; trailing coefficient essential; zero germ excluded | Retained |
| §7.6 inversion identity | az and reciprocal; centre pole | Difference equals log of nonzero trailing coefficient, including singular centre | Retained |
| §7.7 translation bound | f=0; a=0,1; circle zeros | Positive-log triangle bound remains finite with totalized logs | Retained |
| §7.8 `local_first_main_translation` | Constant f≠a; f=a; removable wrong point value | First works; equal constant excluded by infinite order; germ constant rather than point value used | Retained |
| §7.9 power law | n=0,1,2; f=1/z | Zero at n=0; divisor and proximity scale, including negative centre contribution | Retained |
| §7.10 radial monotonicity | h=0,1,z; small r | Nondecreasing positive-log submean; valid without zero-free assumption | Retained |
| §8.1 uniform cusp ratio | N=2; M=M₀; x→0 on fixed branch | Γ prefactor cancels to 1/γ_N; remainder gains 1/N | Retained |
| §8.2 cusp height | ε→0 or 1; M=M₀; large N | Positive lower bound for 0<ε<1 and N beyond threshold | Retained |
| §8.3 transformed horoball | g=I, D=1; g and −g | Centre 1/2, diameter 1; sign invariant; determinant forces a²+c²>0 | Retained |
| §8.4 two-entry Shimizu | c≠0; c=0; matrix negation | Generic lower bound handles c≠0; full stabilizer and rotation needed for remaining entry | Retained |
| §8.5 `ExceptionalCuspSet` and API, `zero_not_mem`, `nonempty`, `rotated_large` | M>0; z=0; t^N=1−exp(−MN)/2; large \|F(z)\| | Zero excluded; surjectivity supplies member; large values belong to rotated set | Retained |
| §8.6 horoball exclusion | M=N/(1−r); r→0 and 1 | Diameter ≤A(1−r)/N<1−r after increasing N₀ | Retained |
| §8.7 `large_n_max_growth` | Cover phase; r→1; N<N₀ | Phase preserves circle sup; positive bound; small levels not claimed here | Retained |
| §9.1 kernel mean | w=R; r→0⁺ | Mean 1/(R²−r²), tending to 1/R² | Retained |
| §9.2 boundary L1 identity | g=1, exp(az) | Zero or balanced positive/negative logarithmic parts; factor 2 | Retained |
| §9.3 logarithmic mean inequality | H=0,1; indicator spike A on measure p | 0; p log A≤log⁺(pA)+1/e via −p log p≤1/e | Retained |
| §9.4 `normalized_log_derivative` | g=1, exp(az); r→0; boundary zero | Constant case zero; explicit log 2+1/e retained; zero-free guard excludes boundary zero | Retained |
| §9.5 radius transfer | r<1/4; r=1/4; r=3/4 | ρ<R; gap at least (1−r)/4; R=7/8 at 3/4 | Retained |
| §9.6 log derivative of 1−F^N | z=0; N=2; small r | f(0)=1; omitted roots make f zero-free; transfer removes 1/r | Retained |
| §9.7 `pivotMap` and API, `levelTwo_pole` | x=0,1,2; N=2 | Values 0, totalized 0, 4/3; germ at 1 still has order −1 | Retained |
| §9.8 partial fractions | N=2, x=2; x a root | Sum gives 4/3; root excluded | Retained |
| §9.9 pivot chain identity | z=0; F(z)=az+O(z^(N+1)) | Both sides zero; leading term −a^N z^N; all denominator guards hold | Retained |
| §9.10 characteristic lower bound | r→0; N=2; trailing coefficient of F^N−1 | Centre coefficient −1 has norm 1; bound NT−log 4 | Retained |
| §9.11 effective fixed-level bound | N=2; 0<r≤1/4 versus r→1 | All-radius constant remains an explicit proof target; asymptotic alone insufficient | Retained |
| §9.12 three characteristics | F^N, F^N/(F^N−1), 1/(F^N−1); r→0 | Translation/inversion constants at most log 4; unit trailing constant | Retained |
| §9.13 log derivative of 1−F | z=0; F(z)=1 excluded | Zero-free normalized function; same inner-radius transfer | Retained |
| §9.14 logarithmic-derivative divisors | Simple zero of F, including zero; reciprocal F/F′ | Equal pole orders one; reciprocal holomorphic | Retained |
| §9.15 reciprocal derivative bound | Near zero; simple zeros; N=2 | No derivative zeros; local inversion constants controlled by positive radius | Retained |
| §9.16 pivot upper bound | Near zero; omitted roots; r→1 | Composed factors holomorphic; no hidden pole-count contribution | Retained |
| §9.17 large-level mean bound | N=2 in absorption algebra; outer radius (1+r)/2 | N/(N−1)≤2; outer maximum bounds L_N | Retained |
| §9.18 finite completion | Empty finite list if N₀=2; nonempty finite list | Maximum with large-level C works in both cases; requires effective C_N | Retained |
| §9.19 `uniform_mean_growth` | All three maps; N=2,3; arbitrary phase; r→0 and 1 | Absolute constant covers all N≥2 and 0<r<1; phase invariant means | Retained |

Object-level checks distinguish the native pre-Schwarzian from this Schwarzian, native power descent from its covering specialization, and native global characteristic from the local closed-subdisc divisor wrapper. The native cover atlas is consumed, not rebuilt. Reviewed the ownership contracts in ConformalMapping, UniversalCovers, FuchsianOrbifolds, ClassicalArithmeticCompletion §6.20, DiophantineApproximationAndTranscendence §5.1, ComplexCurveModuli D0.4, RiemannianGeometry R4.3/R4.7 and PDE Lane C. ConformalMapping and UniversalCovers were also read as representative roadmap shapes.

The eight supplied open sibling folders were searched for the relevant objects. QSeriesPartitionsAndMockModularForms §2 concerns basic q-hypergeometric functions, not the ordinary Gauss series. ArithmeticDynamics §2.55 concerns dynamical Green functions, not the bordered-surface logarithmic Green pole. None of those open folders supplies a new prerequisite here. No object was moved from a later roadmap.

## Check outcomes

- Required elaboration, `lake env lean` on `packages/ConformalMappingPartII/Suggested.lean`, run from the pinned content checkout: **exit 0**. Exactly **44** `declaration uses sorry` warnings; **zero errors and zero linter diagnostics**. All 15 examples are proved. The file has 500 lines, a single `import Mathlib`, 3 structures, 13 real-bodied definitions and 44 theorem targets. No Tau Ceti module build was needed.
- Explicit-type audit, `lake env lean` on a scratch copy with `#check @name` for all 60 named declarations: **exit 0**, with the same 44 admission warnings and no other diagnostics. Complex scalar parameters and all guards remain in the elaborated types. A preliminary scratch-generation attempt used the wrong working directory and found no input file; the corrected audit is the successful run reported here.
- Required dependency check, using the supplied configuration and order, after the final README edits: **exit 0**. Exact output:

```text
depcheck: 9 roadmaps, 70 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

- Name agreement: **60/60** named Lean declarations occur in the README; no declaration was added or deleted. The 96 numbered subsections remain. All 24 Checks blocks were inspected, now containing 84 individual Checks.
- `packages/ConformalMappingPartII/metadata.toml` and `packages/ConformalMappingPartII/sources.toml` parse as TOML; `packages/ConformalMappingPartII/design/plan.json` parses as JSON. The sole existing gap, `little-picard`, still matches ModularForms Layer 10 in the README and plan. No new gap was needed: R4.3, R4.7 and PDE Lane C explicitly own the imported inputs.
- `git diff --check`: **exit 0**, no output. All source citations added here use the existing legal cached records. McMullenRS’s existing record gains §16, p.147; Hem88’s section reference follows the renumbering. No new source was fetched. KR16 remains uncertified and Hem88 retains its settled source disposition; neither was requested again. There is no new missing-reference request.

## Maintainer consequences

The order-file change in r2a-F06 requires a separate maintainer/intake decision; this repair deliberately leaves it untouched. No commit, push or external comment was made.

No Lean name changed. The two additional README target names are `SurfaceUniformization.dirichlet` and `FinitePuncturedCover.metricComparison`; both express the geometric construction on the supplier carriers without forcing a scalar substitute into Lean. For section citations, former projective-deck §1.11 is now §1.6, former cusp-comparison §1.12 is now §1.7, and the former roots §§1.6–1.10 are now §§1.8–1.12. RiemannianGeometry and PDE are additional explicit suppliers, already on main; their files were not edited. The existing conditional Little Picard contract remains a supplier obligation.

These repairs and local checks do not replace the fresh independent review required by the brief.
