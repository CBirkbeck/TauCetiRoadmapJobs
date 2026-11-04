# Review of MaassForms (pull request #1717 at 151d335)

**Verdict:** needs changes

Four findings: one P1 and three P3. The gate passes. The blocking issue is the identification of the Petersson product with the supplied complex Hilbert product. No pull-request file was changed. This is a full review; unavailable source texts are distinguished from claims checked against readable sources.

## R01 (P1) — Conjugate the ambient Hilbert product in the Petersson comparison

**Location:** `TauCetiRoadmap/MaassForms/README.md:251–255`: “the Petersson product is … times the ambient product”.

**Claim:** The first-slot-linear product ∫f·conj(g) equals the positive index reciprocal times the native product on the character-isotypic subspace of L²(Γ₁(N)∖ℍ).

**Witness:** At N=1, χ=1, the automorphic L² functions f=i and g=1 have Petersson value iπ/3 and native value −iπ/3. CongruenceSpectralGap specifies the conjugate-linear-first-slot convention.

**Repair:** Write
`petersson N f g = [Γ̄₀(N):Γ̄₁(N)]⁻¹ * inner ℂ g f`
after the indicated pullbacks, or conjugate the native product with the original argument order. Carry this bridge into §0.5 and the form/operator comparisons in Layer 3. Keep the stated first-slot-linear Petersson convention and its correct Hecke adjoint formula. Add a Check with f=i and g=1 in both orders. Swapping the arguments gives iπ/3, and the reverse pairing gives −iπ/3, as required; diagonal norms are unchanged.

The relevant declarations are `MeasureTheory.L2.inner_def`, `Mathlib/MeasureTheory/Function/L2Space.lean:136`, and `inner_smul_left`, `Mathlib/Analysis/InnerProductSpace/Defs.lean:251`. The supplier fixes the same convention at `TauCetiRoadmap/CongruenceSpectralGap/README.md:32`. A scratch Lean probe proved `inner ℂ I 1 = -I`, `I * star 1 = I`, and `inner ℂ 1 I = I` with the pinned library. At N=5 the effective index is 2: the two uncorrected sides are 2πi and −2πi, so the index factor does not repair the conjugation.

## R02 (P3) — Point the Gaussian covolume citation to Layer 4

**Location:** `TauCetiRoadmap/MaassForms/README.md:1537`: “KleinianGroups Layers 1 and 3 (`covolume_bianchiGaussian`)”.

**Claim:** Those layers supply the named Gaussian covolume.

**Witness:** `TauCetiRoadmap/KleinianGroups/README.md:338–358` places the covolume theorem in Layer 4, with `covolume_bianchiGaussian` at line 354. Layer 3 constructs the Bianchi group.

**Repair:** Cite KleinianGroups Layer 4 for the covolume and Layer 3 for the group; retain Layer 0 for the carrier/action. Include Layer 4 in the corresponding supplier/dependency description. The intended volume remains Catalan's constant divided by 3, approximately 0.3053218647. The owner exists and is earlier: this is a locator correction, not an unowned prerequisite or a new supplier.

## R03 (P3) — Specify the level in the width-four cusp-integral Check

**Location:** `TauCetiRoadmap/MaassForms/README.md:521`: “At a regular cusp of width 4 … full-period integral 4”.

**Claim:** Width 4 alone makes the full-period integral of 1+2e(x/4) equal 4.

**Witness:** At N=12, the cusp 1/3 has width 12/gcd(9,12)=4. The defined full-period integral runs from 0 to N, so it equals 12; the constant term is 1.

**Repair:** Specify “at N=4, cusp 0”, or distinguish the one-width integral 4 from the full-period integral N. The corrected formulas give one-width integral 4 and constant term 1 at both N=4 and N=12, and full-period integrals 4 and 12 respectively. The definition in `Suggested.lean:101` and the general formula in §0.4 are correct; this Check confuses the two periods.

## R04 (P3) — Give the Gaussian Hecke assertions a precise source locator

**Location:** `TauCetiRoadmap/MaassForms/README.md:1595–1609`: “the coefficient formula … self-adjointness of `T_n` on `R`-even forms”.

**Claim:** Section 7.4 supplies the element-indexed Gaussian Hecke algebra, its coefficient formula, adjoints and eigenbasis, with the R-even restriction needed for ideal indexing.

**Witness:** The subsection has no theorem, equation or page citation. The bibliography only assigns EGM Chapters 1–3 and 6–8 to all of Layer 7; none identifies these Hecke assertions.

**Repair:** Attach exact section/theorem/equation and printed-page locators for the Hecke formula and adjoint, identifying the change from the source's unit and Fourier conventions. Alternatively give a specified derivation from precise cited inputs. Retain the discriminating tests T₁=Id, Tᵢ=R and R=-1 ⇒ Tᵢ=-Id; an ideal-indexed source formula cannot be applied to the R-odd space unchanged. The algebraic unit tests pass below. EGM could not be read legally in this run, so this finding does not allege that its theorem is false or absent.

## Verified sound

### Previous findings, checked before the full pass

The eight findings at 8ddd85a were checked individually. Quoted passages below are from this head.

| Previous finding | Passage at this head | Assessment and witness |
|---|---|---|
| R01, Eisenstein L² rejection | README:1849, “for Re s>1” and “E(z,0)=1” | Repaired. At s=2 the cusp norm diverges; at s=0 the squared quotient norm is π/3. |
| R02, zero forms and positivity | README:1527, “For a nonzero Maass form”; worked example:1858, “nonzero holomorphic cusp form” | Repaired. The zero function at λ=-1 is retained in the submodule and excluded from the positivity implication. |
| R03, character bad-prime headline | Suggested.lean:420, `norm_fourierCoefficient_of_conductor`; :430 and :439 give the other branches | Repaired. Primitive quadratic character modulo 5 selects norm 1; trivial character selects squared coefficient 1/5. |
| R04, the six missing/imprecise locators | README:433, “The precise inputs are Mathlib's”; :1310, “Remark 2.27, (2.104)” | The identified locations are repaired by exact inputs or explicitly described adaptations. DIT now cites §5 and equations, not a nonexistent §5.2 subsection; IK (5.7) now has p.95. Unread books remain uncertified. The full pass finds another missing locator at §7.4 (R04 above). |
| R05, completion-agreement padding | Suggested.lean:528, “Λ(·, f) is entire” | Repaired: `completedLFunction_eq` is gone; entirety and functional equation remain. Agreement remains a README API fact. |
| R06, wrong exponential | README:1015, “e(1/8)” | Repaired. Both sides of conj(a)=-ia are (1−i)/√2. |
| R07, definition-specific Checks | README:419, “|Re z| fails smoothness”; §6.3, “N=4 … 49” | The named smoothness and conductor defects are repaired, and point/width/mode tests were added. A newly added width Check still needs R03 above. |
| R08, certificate construction | README:1771, “the construction targets here are the two spectral estimates” | Repaired. No certificate record or packaging predicate is a target; rank-one isolation and bounded measurements are explicit. |

No finding here re-raises a repair marked “not actionable in this package”.

### Gate, elaboration, signatures and acceptance statements

The supplied gate at the exact head reports all checks passing, including text scans, dependency checking, the targeted module build, no stray files and no outside-folder edits. Independent HEAD verification returned 151d335b3844950cb7eb31e1ab067dd474a87fc8; the outside-folder diff and worktree status were empty.

The required dependency check returned exactly:

```text
depcheck: 204 roadmaps, 1615 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. Every *Needs:* line, the supplier contracts and the ordering block were read. There are no declared supplier gaps. R02 corrects the location within an existing supplier, without changing the graph.

Direct elaboration of `TauCetiRoadmap/MaassForms/Suggested.lean` succeeded with only 32 sorry warnings. The 562-line file has a single `import Mathlib`, three used individual Tau Ceti imports, no sorry-valued data and no option override. An independent scratch file appended `#check @...` for all **72 actual declarations** (36 definitions and 36 theorems); it elaborated, and the signatures were compared with the README. No section hypothesis was lost. The supplied signature inventory's count of 73 includes a parser match on the word “theorem),” in a docstring; that is not a target-file error.

In particular, positive level is explicit on the analytic theorems; positivity uses nonzero forms/nonzero eigenspaces; the full bad-prime branches retain conductor-exponent hypotheses; Weyl's law retains even χ; the residual theorem retains g≠0, η≥0, smoothness, automorphy, cuspidality and square-integrability of both g and Δg. Junk values of the total definitions do not silently enter those theorems.

All 32 admitted declarations were probed on a scratch copy with `simp`, `rfl` and `infer_instance`; none closed. Object-based searches found no single pinned theorem directly proving these specialized results. The zero/addition/scalar closure statements are scaffolding used by the actual submodule definitions, as the previous review already distinguished. No new padding finding resulted.

Headline coverage:

| README endpoint | Acceptance-file coverage |
|---|---|
| All-cusp Fourier–Whittaker expansion, exceptional branch, coefficient uniqueness and decay (§§2.3–2.4) | `fourierMode_eq`, `hasSum_fourierMode`, `fourierCoefficient_injective`, `fourierCoefficient_le`, `decay_atImInfty`. |
| Finite multiplicity and bounded-interval discreteness (§§3.4–3.5) | `finiteDimensional_maassCuspSpace`, `cuspidalSpectrum_finite`; the operator and Hilbert-basis realization are expressly unstatable until the supplier carrier exists. |
| Full Hecke/newform theory, cross-level strong multiplicity one, all conductor branches (§4.6) | Hecke preservation/coefficient/product/adjoint statements; `IsNewform.heckeOperator_eq`, `fourierCoefficient_mul`, `eq_of_eventually_eq`; all three general-character bad-prime theorems; Fricke and parity statements. |
| Selberg 3/16, level-one lower bound, even-character Weyl law (§§5.3–5.5) | `selberg_three_sixteenths`, `levelOne_eigenvalue_ge`, `weyl_law`. The character scattering family/matrix is named in the module docstring as unavailable. |
| Absolute convergence, all-prime Euler product, entire completion and character-dual functional equation (§§6.1–6.2) | `lfunction_summable`, `lfunction_eulerProduct`, `differentiable_completedLFunction`, `completedLFunction_functional_equation`. |
| Completed-L-function card (§6.4) | Docstring names the missing `AnalyticLFunctionData` carrier. |
| Picard Fourier/spectral/Hecke/L-function endpoints (§§7.3–7.5) | Docstring names the missing Picard action and quotient measure; it does not substitute an arbitrary function/type for them. |
| Residual eigenvalue localization and quantitative coefficient recovery (§8.3) | `exists_eigenvalue_near` is stated; the projection/measurement theorem is identified as awaiting the spectral projection and bounded mode functionals. |

The conjectures are propositions, not asserted theorems. The general-character statements include bad primes, imprimitive characters, exceptional parameters and the spectral threshold. No route-specific “good primes only” shortcut or replanning of a whole earlier roadmap was found.

### Computed adversarial pass

Every numbered subsection, definition, API bullet, convention, theorem signature and worked example was read. The following 130 rows record the computed instances. The table separates tests of coordinate/local models from claims of global automorphy. Such tests can refute a formula; passing them does not prove existence of the forms or the admitted theorems. Decimal Bessel/Mellin values are independent numerical sanity checks, not interval certificates. “Retain” means no defect detected in the displayed test. The unrelated scheme/positive-characteristic test classes do not apply to these fixed real/complex analytic carriers.

| Statement | Instances tried | Values on the two sides / excluded model | Result; change |
|---|---|---|---|
| Positive hyperbolic Laplacian, §0.1; `hyperbolicLaplacian` | f=1, y² | Δ1=0=0·1; Δy²=−2y²=2(1−2)y². Opposite sign gives +2y². | Retain. |
| Unitary-weight conversion, §0.1 | k=0,1,1/2 | k²/4−k/2=0,−1/4,−3/16; direct differentiation of y^(−k/2)F gives the same shifts. | Retain; half weight is a coordinate test only. |
| `IsSmoothOnUpperHalfPlane` | 1; abs(x); 1/y | Derivatives of 1 vanish; abs(x) has one-sided derivatives −1,+1; (1/y)'=−1/y² for y>0 although no boundary limit exists. | Retain open-domain restriction. |
| Reflection commutes with Δ, §0.2 | x,x²,y² | Reflection values −x,x²,y²; Laplacian values 0,−2y²,−2y² in either order. | Retain. |
| Positive dilation covariance, §0.2 | y², dilation 2 | Δ(4y²)=−8y²=(Δy²)(2z). | Retain. |
| Energy identity, §0.2 | C² bump (1−x²)³(1−(y−2)²)³ on its rectangle | Integration by parts and the polynomial gradient integral both give 4194304/1156155; negative Laplacian convention would negate only the left value. | Retain scalar coordinate identity; R01 concerns its Hilbert-space bridge. |
| `IsAutomorphic`, §0.3 | N=1 constant 1; N=3 odd χ; zero | Law at −I gives 1=1, 1=−1, 0=0 respectively. At T the multiplier is χ(1)=1. | Retain odd-character zero space. |
| Noncommuting group actions, §0.3 | S:z↦−1/z, T:z↦z+1 at z=i | ST(i)=(−1+i)/2; TS(i)=1+i. The native slash law is imposed on the full group, not just its abelian generators separately. | Retain. |
| Bare character space is not a Maass space | Weight zero slash law | Slash multiplier 1; no derivative or L² condition appears in its native definition. | Retain separate analytic predicates. |
| `pt`, §0.4 | (x,y)=(0,1),(2,3) and y≤0 | Valid points have coordinates (0,1),(2,3). Nonpositive heights invoke ofComplex's junk branch, excluded by every cusp-integral test's y>0. | Retain. |
| `cuspWidth` | N=4, cusp 0 and 1/2 | 4/gcd(1,4)=4; 4/gcd(4,4)=1. Replacing c² by c gives the wrong value 2 in the second case. | Retain. |
| `cuspMultiplier`; regular versus irregular cusps | Trivial χ at N=4; cubic χ at N=9,cusp 1/3 | Multipliers 1 and e(1/3); the latter is not 1 and permits frequencies in ℤ+1/3. | Retain. |
| `cuspIntegral` at a regular cusp | g=1+2e(x/4), N=4 versus N=12 | ∫₀⁴g=4 and ∫₀¹²g=12; (1/4)∫₀⁴g=1 in both cases. | R03: specify N or distinguish periods. |
| Irregular full-period vanishing | N=9, w=1, g=e(x/3) | ∫₀⁹g=0; ∫₀¹g=(e(1/3)−1)/(2πi/3)≠0. | Retain full N-period condition. |
| `IsCuspidal` | Zero; constant 1 at positive N | All integrals 0 versus Iσ(1,y)=N≠0. | Retain; checking only ∞ is not substituted for all cusps. |
| `gamma0PSL`, effective action | I,−I,T | I·i=(−I)·i=i; T·i=1+i. I and −I have the same PSL image. | Retain; raw SL fundamental-domain predicate is unusable here. |
| `IsSquareIntegrable`; quotient measure | Constant 1, N=1,2 | Squared norms π/3 and π; Γ₀ indices 1 and 3. | Retain unnormalized quotient measure. |
| Effective Γ₀/Γ₁ index | N=1,…,7 | Degrees 1,1,1,1,2,1,3; φ(N)/2 alone would give 1/2 at N=1,2. | Retain explicit low-level cases. |
| `petersson`, zero/scalar laws | f=0; f=i,g=1,N=1 | Pairings 0; iπ/3=i·P(1,1). Native inner(i,1)=−iπ/3. | First-slot linearity correct; R01 fixes ambient comparison. |
| Petersson addition and norm | f=1,f'=i,g=1; f=2i,N=1 | P(1+i,1)=(1+i)π/3=P(1,1)+P(i,1); P(2i,2i)=4π/3. | Retain. |
| Hilbert comparison after repair | N=1 and N=5 constants | Swapped native pairings iπ/3 and 4πi; multiplying by indices 1 and 1/2 gives iπ/3 and 2πi. | R01 repair passes both. |
| `IsMaassForm`, §1.1 | Zero, λ=-1; constant 1,λ=0 | Δ0=(−1)0=0, norm²0; Δ1=0·1=0 and norm²π/3. | Retain zero in every eigenspace. |
| `IsMaassCuspForm`; zero/scalar/additive closure | 0; f and −f at fixed λ | Cusp integral 0 for zero and f+(−f); Δ(cf)=cλf=λ(cf). | Retain closure scaffolding. |
| `maassCuspSpace`; nonzero hypotheses | Odd χ; f=0 | Submodule is ⊥ for odd χ; zero belongs to it, so membership alone does not imply λ>0. | Retain explicit nonzero hypotheses. |
| `spectralParameter`, §1.2 | λ=1/4,5/4,1/5 | sqrt(λ−1/4)=0,1,0; final 0 is total-function junk, not the exceptional spectral order. | Retain branch distinction. |
| `besselOrder` | Same λ; λ=0 | Orders 0,i,sqrt(1/20),1/2; λ=1/4−ν² in each case. | Retain. |
| Integral K, symmetry, §2.1 | ν=±1/2,u=1 | Both integrals 0.461068504447895; sqrt(π/2)e⁻¹ has the same value. | Retain supplier K rather than redeclare it. |
| Imaginary-order bound by K₀ | ν=i,u=1 | Kᵢ(1)=0.2894280370; K₀(1)≈0.4210244382; absolute-value inequality holds. | Retain. |
| K₀ small-argument constant | u=e⁻¹⁰ | K₀(u)=10.1159315214; −log(u/2)−γ=10.1159315157. | Retain constant log2−γ. |
| K/I Wronskian orientation | (ν,u)=(1/2,1),(i,1),(0,2) | KI'−K'I=1,1,0.5; 1/u=1,1,0.5. Reverse orientation gives negatives. | Retain. |
| Growing solution and threshold | ν=1/2,u=1; ν=0 | I₁/₂(1)=0.9376748882 versus K₁/₂(1)=0.4610685044; at threshold the second zero mode is sqrt(y)log(y). | Retain independent growing solution. |
| K Mellin transform | s=2.5,ν=1.3i | Integral 0.726036530106716; gamma product 0.726036530106716. Re s=2.5>abs(Re ν)=0. | Retain convergence hypothesis. |
| `fourierMode`, §2.2 | g=e(x), frequencies 1 and 0 | ∫₀¹e(x)e(−x)=1; ∫₀¹e(x)=0. | Retain Fourier sign. |
| `fourierModeAt` | Width 4, g=e(x/4), v=1,0 | Normalized modes 1,0; omit 1/w and the first becomes 4. | Retain. |
| Shifted mode orthogonality | κ=1/3,w=1, modes 1/3,4/3 | Matched integral 1; cross integral ∫₀¹e(±x)=0. | Retain nonintegral frequency. |
| Mode differential equation | sqrt(y)Kν(2πabs(v)y/w) | Substitution gives eigenvalue 1/4−ν²; v↦−v leaves it unchanged, v=0 is separately treated. | Retain. |
| Zero modes and cusp L² | Threshold sqrt(y), sqrt(y)log(y) | Squared cusp integrals grow as log Y and (log Y)³/3, respectively. | Retain zero constant term. |
| `fourierCoefficient`, factor two | Mode α sqrt(y)Kν(2πabs(n)y) | Asymptotic limit is α/2; for α=2 it is 1, not 2. | Retain. |
| `fourierCoefficientAt` | w=4, v=±1, mode 2sqrt(y)Kν(πy/2)e(vx/4) | Recovery factor sqrt(abs(v)/w)=1/2; coefficient 1 for both signs. | Retain absolute value and width. |
| `fourierMode_eq`, all-cusp expansion | Zero form; one local mode, κ=1/3 | Both sides 0 for zero; matched local mode has coefficient 1 and reconstructed amplitude 2sqrt(y)Kν, other integer-offset modes 0. | Retain; local model is not asserted globally automorphic. |
| `hasSum_fourierMode` | Zero; g=e(x/4) in a width-4 coordinate | Sum 0=0; one nonzero Fourier term reconstructs e(x/4). | Retain. |
| `fourierCoefficient_injective` | f and 2f with a_f(1)=1; zero | First coefficients 1 and 2 distinguish forms; all-zero coefficients reconstruct zero. | Retain; no equality from only finitely many coefficients. |
| `fourierCoefficient_le` | n=0; raw dilation d=4 of normalized f | At zero both sides are 0; a_(f(4z))(4)=2, compatible with C sqrt(4)=2C. | Retain sqrt(n) normalization. |
| `decay_atImInfty` and all-cusp decay | Frequency 1; irregular frequency 1/3 | Kernel exponential rates e⁻²πy and e⁻²πy/3. A universal e⁻²πy at irregular cusps would fail. | Retain distinct rates. |
| Nonnegative/nonzero eigenvalues, §2.5 | Zero at −1; constant 1 at 0 | Energy 0=−1·0 for zero; 0=0·π/3 for constant. Constant term 1 excludes the latter from cusp positivity. | Retain nonzero and cuspidal hypotheses. |
| Diamond projector, §3.1 | Effective N=5 group C₂, character ±1 | P±=(1±D)/2; P±²=P±, P+P−=0 when D²=1. | Retain inverse-character projection convention. |
| Odd character projection | N=3, χ(−1)=−1 | Central contributions 1+(−1)=0; projected subspace is zero. | Retain. |
| Reducing restriction and resolvent, §3.2 | A=diag(0,2), constant coordinate | Restricted A=0; (A+i)⁻¹=−i, while the other coordinate gives (2−i)/5. | Retain domain-preserving restriction. |
| Eigenvector regularity, §3.3 | Constant λ=0; zero | Weak equation has both sides 0; smooth representatives 1 and 0 respectively. | Retain PDE bootstrap with its supplied weak-domain input. |
| Cuspidal compactness, §3.4 | Fourier frequencies abs(n)≥1 at y>Y | Horizontal Poincaré lower scale 4π²Y² versus zero for constant mode; tail factor (2πY)⁻²→0. | Retain exclusion of constant channels. |
| Finite multiplicity and bounded spectrum | Zero space; model diag(1,1,2), T=1 | Dimension/count 0 for zero; multiplicity at 1 is 2, and N(1)=2. | Retain multiplicity, not distinct-value counting. |
| Orthogonality/residual boundary, §3.5 | diag(1,2) eigenvectors; constant quotient function | Inner(e₁,e₂)=0; constant has eigenvalue 0 and nonzero constant term. | Retain residual constant separately from cusp space. |
| `cuspCount` | T<0, odd χ; model double eigenvalue at T | Counts 0,0,2 respectively; a set-cardinality count would incorrectly give 1 for the last. | Retain finrank weighting and ≤ endpoint. |
| `heckeOperator`, §4.1 | n=1; n=0 | T₁f=f because only (1,1),b=0 contributes; T₀ is junk 0 and positive-index theorems exclude it. | Retain. |
| Hecke preservation | f=0; arbitrary positive n | Tₙ0=0, Δ0=λ0 and every cusp integral 0. | Retain; substantive nonzero case remains a target. |
| `fourierCoefficient_heckeOperator` | m=n=p, p∤N | Coefficient at p of Tₚf is a(p²)+χ(p)a(1); for a(1)=1,a(p)=0 this is 0 iff a(p²)=−χ(p). | Retain. |
| `heckeOperator_mul` | m=n=2; coprime m=2,n=3 | T₂²=T₄+χ(2)T₁; T₂T₃=T₆. At a₂=0,χ₂=1, a₄=−1. | Retain divisor normalization. |
| `petersson_heckeOperator`, §4.2 | χ(n)=i,a=e(1/8) | conj(a)=(1−i)/sqrt(2)=−ia. Treating Tₙ as self-adjoint would force a real, which it is not. | Retain character adjoint; R01 changes only ambient convention bridge. |
| Joint diagonalization | One-dimensional eigenvalue e(1/8) | Real and imaginary parts are both 1/sqrt(2); each is a real symmetric scalar operator. | Retain use of real/imaginary parts for normal operators. |
| `reflection`, `IsEven`, `IsOdd`, §4.3 | e(x)+e(−x), e(x)−e(−x),0 | Reflection signs +1,−1; zero satisfies both. First two values at x=0 are 2,0. | Retain parity exclusivity only for nonzero forms. |
| `frickeOperator`, §4.4 | N=2; N=4,z=i/2 | W₂²=−2I on matrices but identity on ℍ; W₄(i/2)=i/2. | Retain projective action, no holomorphic scalar. |
| Partial Atkin–Lehner unit rule | N=6,Q=2,R=3; Q=R=2 | Product indices 6 and 1; QR/gcd(Q,R)² gives those values. | Retain exact-divisor restriction. |
| Character transport under Fricke | Cubic χ | χ↦χ̄=χ², distinct from χ; applying twice returns χ. | Retain pseudo-eigenvalue/two-form equation. |
| `levelRaising`, `levelRaisingLinear`, §4.5 | d=1,2,4 | a_(f(dz))(d)=1,sqrt(2),2 for a_f(1)=1; a_(f(2z))(1)=0. | Retain raw dilation rather than normalized dilation. |
| `oldSpace` and inclusion | N=1; level-one lift to N=4 | No positive proper divisor at N=1, so oldSpace=⊥; the old lift is included at N=4 and has level-four squared norm 6 times the original for d=1. | Retain. |
| `newSpace` and `petersson_add_left` | Oldspace=⊥; sums orthogonal to oldspace | At N=1, newspace equals cusp space; two pairings 0+0=0 retain orthogonality. | Retain. |
| `IsNewform` | 0,f,2f,f(2z), with a_f(1)=1 | First coefficients 0,1,2,0; only f passes normalization. | Retain normalization separate from submodule membership. |
| `IsNewform.heckeOperator_eq` | n=1; ramified p with a(p)=0 | T₁f=1f; the zero local factor parameter forces Tₚf=0. | Retain theorem at all positive n. |
| `IsNewform.fourierCoefficient_mul` | Good p, a(p)=0; bad p with α=1,c=0 | a(p²)=−χ(p); in trivial-character p=2 Steinberg branch, a(2)²=a(4)=1/2. | Retain good and bad divisor terms. |
| Cross-level strong multiplicity one | f versus 2f and f(dz),d>1 | Positive first coefficients 1 versus 2 and 0; neither wrong model meets the normalized-newform hypotheses. | Retain comparison of newforms, not all oldforms. |
| Bad-prime branch c=α | N=5, primitive even quadratic χ | α=c=1 and norm a(5)=1; trivial χ has c=0 and norm 1/sqrt(5), a different branch. | Retain new general-character Lean headline. |
| Bad-prime branch α=1,c=0 | N=10, quadratic χ induced from 5,p=2 | Prime-to-p character value χ₅(2)=−1; a(2)²=−1/2, norm=1/sqrt(2). | Retain prime-to-p character factor; zero extension χ mod 10 at 2 is not substituted. |
| Bad-prime branch α≥2,c<α | N=25,c=1 versus c=2 | α=2,c=1 ⇒ a(5)=0; c=2 ⇒ norm a(5)=1. | Retain exhaustive conductor distinction. |
| `frickeSign` and sign theorem | Trivial χ, Wf=±f; f=0 | Branch values +1,−1; zero selects +1 as junk. Normalized-newform hypothesis excludes zero. | Retain. |
| Newform reflection dichotomy | Nonzero even and odd forms | Reflection square is 1; eigenvalues +1 and −1; 0 cannot be a reflection eigenvalue of a nonzero vector. | Retain. |
| Conjugate coefficients, §4.7 | e(x)+i e(2x) | Plain conjugation gives coefficients 1,−i at −1,−2; conjugate reflection gives 1,−i at +1,+2. | Retain distinction between the two conjugations. |
| Normalized dual and self-duality | Odd normalized f; conjugate reflection | Plain conjugate first coefficient −1; conjugate-reflection first coefficient +1. Real positive coefficients are fixed by duality. | Retain. |
| Selberg 3/16, §5.3 | Supplied lower bound 21/100 | 21/100−3/16=9/400>0; exceptional t at equality is 1/5. | Retain restriction to Γ₁(N), all characters. |
| Level-one bound, §5.4 | Lower bound 3π²/2 | 3π²/2≈14.80440660>1/4; nonzero-eigenspace assumption excludes the zero subspace at λ=−1. | Retain. |
| Selberg conjecture as proposition | Empty cusp space; hypothetical λ=1/5 | Vacuously true on empty spectrum; 1/5<1/4 would refute the conjecture on a nonzero cusp eigenspace. | Retain as hypothesis, not assertion. |
| Regular cusp channels, §5.5 | N=1; N=9 cubic character and cusp 1/3 | One channel at N=1; irregular cusp has multiplier e(1/3) and contributes no constant-term channel. | Retain character-weighted comparison. |
| Scattering functional equation | Level-one scalar φ(s)=ξ(2s−1)/ξ(2s) | ξ(u)=ξ(1−u) gives φ(s)φ(1−s)=1 wherever regular; at s=1/2 the continued scalar is −1, whose square is 1. | Retain meromorphic interpretation. |
| `weyl_law` and leading constant | N=1; N=3 even versus odd χ | Index/12 is 1/12 and 1/3; odd-character count is identically 0, not asymptotic to X/3. | Retain even-character hypothesis. |
| Scattering matrix size versus cusp count | N=4 trivial χ | Cusp count sum φ(gcd(d,4/d))=1+1+1=3; matrix is 3×3. | Retain; no one-channel shortcut. |
| `lfunction`, §6.1 | Coefficients 1,2 at n=1,2; s=2 | Sum 1+2/4=3/2; n=0 contributes 0 even if its stored coefficient is nonzero. | Retain native LSeries convention. |
| `lfunction_summable` | σ=5/4, ε=1/4 | Mean-square exponent 1+ε=5/4; complementary Cauchy–Schwarz exponent 2σ−1−ε=5/4>1. | Retain unconditional Re s>1. |
| `lfunction_eulerProduct` | Good p with a(p)=0; bad p with a(p)=0 | Good factor (1+χ(p)p⁻²ˢ)⁻¹; bad factor 1 because χ(p)=0 too. | Retain all primes. |
| `parity`, §6.2 | Nonzero even/odd; zero | δ=0,1; zero chooses 0. Root-sign multipliers 1,−1. | Retain newform hypothesis where dichotomy is used. |
| `completedLFunction` | f=0; λ=1/5 and 1/4 | Unique entire extension of zero is 0; gamma shifts δ±sqrt(1/20), and δ,δ. | Retain choice definition and exceptional branch. |
| Even Mellin constants | N=1, δ=0 | 4·2^(s−2)·(2π)⁻ˢ=π⁻ˢ; rescaling height by sqrt(N) supplies N^(s/2). | Retain factor-two convention. |
| Odd Mellin constants | δ=1 | Axis value 0; derivative of paired ±n modes contributes 8πi n, and division by 2πi supplies Γℝ(s+1±ν). | Retain transverse derivative and N^(−1/4). |
| `differentiable_completedLFunction` | Zero function; actual-newform hypotheses | Zero extension has derivative 0; using the total LSeries outside its convergence region is avoided by choosing the entire extension. | Retain substantive existence theorem; agreement alone would be padding. |
| `conjugateReflection` | First coefficient 1, odd parity | Dual first coefficient conj(1)=1, unlike plain conjugation's −1. | Retain normalization. |
| Functional equation | Trivial χ, Fricke ε=±1, δ=0,1 | Root numbers ε,−ε; applying twice multiplies by ε²=1. For general χ, the partner is χ̄. | Retain unit-modulus scalar and actual Fricke relation. |
| Ramanujan/Satake equivalence, §6.3 | χ=1,a(p)=2 | Roots 1,1; a(pᵏ)=k+1=τ(pᵏ). | Retain use of unitary phase law. |
| Wrong-model test for Satake converse | Arbitrary χ=-1,a(p)=2 | Polynomial roots 1±sqrt(2), not unit modulus despite abs(a)=2; this data violates the eigenform adjoint phase condition. | Retain restriction to genuine normalized eigenforms. |
| Analytic conductor | N=1,δ=r=0,s=1/2; change N or δ | Values 49/4,49 for N=4,81/4 for δ=1. | Retain level and parity factors. |
| Conductor order symmetry | N=1,δ=0,s=1/2,r=±1 | Both values 41/4+3sqrt(5)≈16.9582039325. | Retain unordered gamma shifts. |
| L-function card, §6.4 | Real-place Maass newform | Two real gamma shifts, zero complex shifts give degree 2; positive level is its integral conductor. | Retain supplied card rather than redeclare it. |
| H³ Laplacian, §7.1 | yˢ,s=0,1,2,3 | Δ₃yˢ=s(2−s)yˢ gives 0,y,0,−3y³; dropping y∂y would give the wrong middle values. | Retain drift term. |
| H³ measure | Cusp y>Y, unit torus area | ∫Y∞y⁻³dy=1/(2Y²), versus 1/Y for the H² density. | Retain dimension-specific measure. |
| Picard carrier and positivity, §7.2 | Constant 1; zero at λ=-1 | λ=0 with constant term 1; Δ₃0=(−1)0=0. Only the nonzero form enters positivity. | Retain repaired hypothesis. |
| Picard cusp/stabilizer | Translations 1,i and rotation −1 | Fundamental translation area 1; applying rotation twice gives x; there is one ideal class/cusp for ℤ[i]. | Retain. |
| Gaussian covolume | Catalan G | G/3≈0.3053218647, agreeing with the intended supplied value. | R02 changes locator, not value. |
| H³ spectral branch | λ=0,1,2 | t=1, order0, r=1 respectively; λ=1−t² or 1+r² as appropriate. | Retain constants and threshold. |
| H³ Fourier pairing, §7.3 | n=i, x=x₁+ix₂ | Re(nx)=−x₂, while Re(conj(n)x)=x₂. | Retain specified pairing. |
| H³ zero frequency | Cuspidal f; constant 1 | Torus integral 0 versus 1; n=0 cannot be inserted into Kν(2πabs(n)y). | Retain separate constant mode. |
| H³ modified Bessel mode | yKν(2πabs(n)y) | Substitution gives λ=1−ν²; for λ=0,ν=1, not the H² order1/2. | Retain. |
| R,J coordinate symmetries, §7.4 | x₁²+x₂²; x₁²−x₂²; x₁x₂; x₁x₂(x₁²−x₂²) | Signs (++),(−+),(−−),(+−), respectively. | Retain four symmetry classes; local polynomial tests only. |
| Gaussian Hecke unit law | n=1,i; R-even/odd vectors | T₁=Id; Tᵢ=+Id or −Id according to R. | Formula passes; R04 requests locator. |
| Gaussian divisor representative | Replace a by ia | νn/a² changes to −νn/a²; a_f(−m)=a_f(m) makes summand unchanged. | Retain; sign suffices for divisors, R-even is needed for ideal indexing. |
| Gaussian Hecke product | Coprime Gaussian prime ideals; m=n a prime generator | Divisor sum has one term T_mn in coprime case; equal-prime case has T_(n²) plus T₁. | Formula passes; R04. |
| Gaussian eigenform normalization | J-odd,R-even form | J leaves coefficient at n=1 fixed, but eigenvalue −1 forces a(1)=−a(1)=0. | Retain normalized forms only where a(1)≠0. |
| H³ Mellin transform, §7.5 | s=1,ν=i,abs(n)=1 | ∫yKᵢ(2πy)dy=0.0172896861564; Γ(1+i/2)Γ(1−i/2)/(4π²) matches. | Retain half arguments. |
| H³ gamma normalization | s=r=1 | Γ(1+i/2)Γ(1−i/2)=0.6825694503; unhalved shifts give Γ(1+i)Γ(1−i)=0.2720290550. | Retain correct degree-four factor and conductor16. |
| H³ ideal sum and completion | Four generators per nonzero ideal, R=J=+1 | Element sum is 4 times ideal sum; Γℂ product supplies factor4, so Λ equals four times the stated vertical Mellin integral. | Retain unit multiplicity. |
| Invariant dictionary, §8.1 | Normalized level1 even/trivial form; dual | N=1,k=0,degree2; conjugating real coefficients preserves them. | Retain intrinsic invariants. |
| Intrinsic prefix, §8.2 | N=1, trivial character; old lift f(2z) | Prefix (1,0,1) for normalized source; lift has a(1)=0 and does not receive a normalized-newform prefix by this construction. | Retain distinction from table indices. |
| Spectral multiplicity versus Hecke multiplicity one | Humphries Theorem1.1 at N=9,25,225 | Density lower bounds 2/5,14/19,28/95; corresponding multiplicities at least2,2,4. Equal λ alone does not give equality of all Hecke eigenvalues. | Retain Humphries boundary. |
| `exists_eigenvalue_near`, §8.3 | A=diag(1,2),g=(1,1)/sqrt(2),λ₀=3/2 | Residual norm 1/2; distance to spectrum 1/2. For an exact eigenvector both are 0. | Retain ≤ endpoints and domain. |
| Nonzero residual hypothesis | g=0,λ₀=-1,η=0 | Residual 0≤0, but distance from nonnegative spectrum to −1 is at least1. | Retain g≠0. |
| Rank-one isolation | Projection onto both eigenspaces of diag(1,2) | Rank2, Pg=g, but Ag=(1,2) for g=(1,1), not λg. | Retain rank-one hypothesis. |
| Projection error and denominator | q=1/10,C₁=Cₙ=b=1,abs(ℓₙ(g))=1 | Norm bound q=.1; lower norm sqrt(.99); denominator .9; coefficient error bound 1/9+1/9=2/9. | Retain strict b>C₁q; equality would give denominator0. |
| Zero residual coefficient recovery | q=0 | Both error terms 0; normalized projected vector has ℓ₁=1. | Retain bounded functional interpretation. |
| Rigorous count semantics | k=0; negative interval radius | Zero count means empty spectral range, not an eigenvalue at midpoint; negative radius gives empty interval. | Retain. |
| Eisenstein worked example | s=0 versus s=2 | E(z,0)=1 with norm²π/3; y² leading term has cusp norm (Y³−1)/3→∞. | Retain repaired Re s>1 rejection. |
| Holomorphic comparison worked example | Nonzero weight k; F=0 | Weight drift shift k²/4−k/2 generally remains; at F=0 all equations have both sides0. | Retain nonzero rejection qualification. |
| Level/index/cusp worked data | N=1,2,3,4,5,6,9 | (index,cusps)=(1,1),(3,2),(4,2),(6,3),(6,2),(12,4),(12,4). | Retain arithmetic values. |
| Higher-level worked data | N=11,19,23,26,101,105 | (12,2),(20,2),(24,2),(42,4),(102,2),(192,8). | Retain arithmetic values. |
| Displayed numerical Fourier checks | Printed level-one parameter R | λ=91.1413453364; KᵢR(2π)=6.827942759e−8; KᵢR(4π)=3.184740579e−8. | Formula checks only; no spectral certification. |

### Sources: all 15 seeded targets

No locator in the README is explicitly flagged “unverified”. Every bibliography work was attempted through the sources service. The following table records which parts of each sampled target were actually verified. Source extraction line numbers below identify evidence, not copied passages. Page numbers refer to the version actually read; BLS is explicitly cited as arXiv:1803.06016v2, and SH as arXiv:2201.08760v2.

| Seeded target | Text/locator inspected | Outcome and scope |
|---|---|---|
| 0.1 hyperbolic Laplacian | booker-lee-strombergsson line 118, §1.1 p.3; pinned Laplacian:231; AutomorphicSpectralTheory §1.16 | BLS uses −y² times the two real second derivatives. Weight conversion was differentiated directly; no holomorphicity assumption was imported into weight-zero functions. Iwaniec Chapter1 was unreadable. |
| 0.3 automorphy and parity | booker-lee-strombergsson line 118, p.3; pinned `functionCharSpace`:88 | BLS allows imprimitive even characters and uses χ(d). The −I proof gives the zero odd-character space; this is a deduction, not a claimed BLS theorem for odd characters. |
| 1.2 spectral parameter | booker-lee-strombergsson line 135, p.3; dlmf §10.27 line 110 | BLS uses order sqrt(1/4−λ); Kν=K−ν permits the selected sign. Threshold and imaginary/real branches agree. The cached spectral-index knowl reverses the real/imaginary descriptions; see Source issues. |
| 2.3 Fourier–Whittaker expansion | duke-imamoglu-toth line 536, (5.7), p.962; BLS line 135, p.3; dlmf §10.25 line 206 | DIT has factor two; BLS's coefficient convention has no leading two. README follows DIT and derives its coefficient limit with the 1/2 asymptotic factor. General cusp/character extension is explicitly local ODE work here, not claimed verbatim from level-one DIT. |
| 3.1 diamond reduction | CongruenceSpectralGap §0.2; native character decomposition; direct C₂ projector test | Supplier supplies the self-adjoint maximal-domain operator. The bounded finite-group symmetry/restriction is new work here. R01 prevents the stated product identification from being used unchanged. No accessible textbook theorem specifically asserting this exact specialization was certified. |
| 3.4 cusp compact resolvent | CongruenceSpectralGap §§0.5b,0.6; SelfAdjointSpectralTheory Parts C–E; Fourier/Poincaré calculation | Principal congruence cusp compactness is actually supplied; finite-index and character restriction is the stated comparison. The zero-mode and Y⁻² tail controls pass. Iwaniec/Hejhal source chapters could not be certified. |
| 4.4 Atkin–Lehner/Fricke | Pinned Fricke matrix and adjugate comparison; ModularForms Layer6; seymour-howell line 236, §2.4 p.4 | SH confirms the squarefree trivial-character sign/local-coefficient convention. General-character and partial-involution arguments are adaptations using the supplied matrices. Original Atkin–Lehner/Atkin–Li text unavailable; not certified at those published locators. |
| 4.6 full eigenform and multiplicity one | BLS lines168–214, §1.1 pp.4–5, Lemma1.4; AL.2.1.4, AL.2.2.4–5, AL.3.7.1 | Newspace/dilation and local representation/conductor cases match. The local factor gives c=α ⇒ abs(a_p)=1, Steinberg c=0,α=1 ⇒ a_p²=χ_prime-to-p(p)/p, and remaining c<α,α≥2 ⇒0. The original Atkin–Li theorem remains unread. |
| 4.7 self-duality/conjugate form | BLS line123 transformation law; DIT line536 Fourier convention; AL local/global duality contracts | Direct conjugation computation distinguishes negative-index plain conjugation from coefficientwise dual obtained by conjugate reflection. Literal self-duality, not self-duality up to twist, agrees with ModularForms Layer9. |
| 5.3 Selberg3/16 with character | CongruenceSpectralGap §5.3, README:826–848 at its supplied head | Bound is for nonconstant bounded congruence-invariant C² eigenfunctions and is 21/100. Cusp decay supplies boundedness; restriction to Γ₁(N) trivializes χ. 21/100≥3/16. Selberg's original pp.1–15 unavailable. |
| 5.5 scattering/Weyl | BLS line2273, §2.7 (2.74–75), pp.30–31; line2317, Lemma2.19 p.32; line2786, Remark2.27 (2.104), pp.38–39; DIT line565, (5.10), p.963 | BLS distinguishes regular cusp channels and the ordinary scattering determinant from the parity-separated determinant. The README cites the ordinary determinant. DIT supports the level-one X/12 specialization. Huxley's original chapter remains unavailable. |
| 6.2 completed L-function | DIT lines544–556, (5.8–9), pp.962–963; dlmf §10.43 line728, (10.43.19); AL.2.6.1–4 | Level-one DIT completion differs from Γℝ-normalized completion by π^δ; README's Mellin calculation accounts for this. General level/character and exceptional-order extension is proved here via Fricke/decay, not attributed to DIT verbatim. |
| 7.4 Gaussian symmetries/Hecke | Coordinate/unit computations above; EGM retrieval attempt | Unit and symmetry identities pass. Exact source locator absent (R04); EGM text unavailable. No claim to have verified its adjoint theorem against the book. |
| 8.2 intrinsic label prefix | lmfdb label line90; humphries line65, Theorem1.1 p.2 | Label source has level/weight/character followed by database-dependent spectral ordering. Humphries gives positive-density higher Laplace multiplicity at nonsquarefree level, not a failure of Hecke strong multiplicity one. |
| 8.3 rigorous spectral estimates | booker-strombergsson-venkatesh line370, §3 Prop.1 and Remark(2), p.9; seymour-howell line188, §2.3 pp.3–4; lmfdb rigor line90 | BSV separates existence from uniqueness. SH uses spectral separation and coefficient ratios. The roadmap adds explicit rank-one projection, a nonzero normalization denominator and bounded mode measurements; its estimate was recomputed independently. |

Additional readable checks: dlmf §10.28 line73 gives the Wronskian orientation; §10.30 line137 and §10.31 line88 distinguish −log(u) asymptotics from the constant-corrected K₀ expansion; §10.32 line345 gives the integral with its sector restriction, automatically satisfied by positive real u; §10.39 line83 gives the half-order formula. The DIT residues at line505 onward give E(z,0)=1. These checks did not copy source prose into the roadmap or report.

Legal source links used for attribution: [BLS v2](https://arxiv.org/abs/1803.06016v2), [DIT published article](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), [DLMF Mellin formula](https://dlmf.nist.gov/10.43.E19), [SH v2](https://arxiv.org/abs/2201.08760v2), and [LMFDB label knowl](https://www.lmfdb.org/knowledge/show/mf.maass.label).

### Pinned declarations opened and duplication by object

The audit searched objects as well as declaration names: quotient measures/fundamental domains, cusp width and multiplier data, weight-zero slash laws, modified Bessel kernels, Laplacian realizations, normalized Hecke sums, Fricke matrices, local conductors/newvectors, spectral projections and L-function cards. The following are concrete pinned inputs that were opened:

| Pinned file and line | Declaration/content and restriction checked |
|---|---|
| `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:68`, :355, :407 | `IsFundamentalDomain`, `integrableOn_iff`, `setIntegral_eq`: null-measurability, a.e. covering and pairwise a.e. disjoint translates; invariance is needed to compare integrals. The predicate does not remove a nonfaithful central action itself. |
| `Mathlib/MeasureTheory/Function/L2Space.lean:132`, :136 | Native L² inner product integrates the native fibre inner product; `MeasureTheory.L2.inner_def`. |
| `Mathlib/Analysis/InnerProductSpace/Defs.lean:251`, :254 | `inner_smul_left` conjugates the scalar; `inner_smul_right` does not. |
| `Mathlib/Analysis/InnerProductSpace/Laplacian.lean:231`, :239 | `laplacian_eq_iteratedFDeriv_complexPlane`, `laplacian_const`: coordinate trace of the real Hessian, without the hyperbolic negative y² factor. |
| `Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean:1372` | Integration by parts requires the derivative/product integrability inputs; compact support supplies them in the proposed coordinate application. |
| `Mathlib/Analysis/InnerProductSpace/JointEigenspace.lean:110`, :121 | Finite-dimensional commuting symmetric-family diagonalization; it is not directly a theorem for an arbitrary nonreal-character Hecke operator. Real/imaginary parts resolve that distinction. |
| `Mathlib/Analysis/InnerProductSpace/LinearPMap.lean:241`, :340 | Dense-domain and closedness conclusions require self-adjointness; bare `LinearPMap` does not imply either. |
| `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:245`, :249, :291, :305 | `conductor`, `conductor_dvd`, `IsPrimitive`, `primitiveCharacter`; modulus and conductor are different native data. |
| `Mathlib/NumberTheory/LSeries/Basic.lean:74`, :88, :164, :178 | `LSeries.term` sets n=0 to zero; `LSeries` is the sum and `LSeriesSummable` its convergence assertion. It does not automatically analytically continue the series. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:45`, :53 | `Complex.Gammaℝ`, `Complex.Gammaℂ`; the π powers and factor2 determine the completion normalizations. |
| `Mathlib/Analysis/SpecialFunctions/Bessel.lean:55`, :75 | `Complex.besselJ` is J, with slit-plane analyticity; it is not the positive-argument modified K kernel required here. |
| `TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Ring.lean:88` | `functionCharSpace` imposes every Γ₀ slash relation, with no smoothness, holomorphicity or integrability. |
| `TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Basic.lean:121` | `HeckeRing.GL2.twistedHeckeSlashSum` is the weighted representative sum on functions; its existence alone does not give the analytic preservation statements. |
| `TauCeti/NumberTheory/ModularForms/HeckeSlash/Diamond.lean:217` | `trace_translate_adjugateGL_natDiagGL_eq_diamondOp_heckeTNat` supplies the adjugate/diamond inverse factor used in §4.2. |
| `TauCeti/NumberTheory/ModularForms/Fricke/Matrix.lean:69`, :110 | `frickeGL` and its square; projective action removes the scalar −N. |
| `TauCeti/NumberTheory/ModularForms/Fricke/AtkinLehnerBar.lean:60` | Adjugate/bar comparison used to transport the Fricke character. |
| `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace.lean:78`, :91, :135 | Native open half-space and its height/Riemannian geometry. These definitions do not themselves supply the Picard PSL₂(ℂ) automorphic action or quotient spectral measure. |

No pinned Maass newform, character scattering matrix or Picard automorphic spectral carrier was located by these object searches. This is a bounded search result, not a claim about every future library version.

Cross-roadmap ownership was checked on main and on the supplied new-roadmap heads using the roadmap search/show tools, then the relevant passages were read. The 14 citation-resolver leads are seven local `IsNewform.*` declarations present in this file and seven LMFDB knowl identifiers, not missing Lean imports. The two main-branch shape examples read were ModularForms and completed OrthogonalL2Bases.

| Owner / resolved location | Boundary checked |
|---|---|
| `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:689–710`, §4.5 | Owns K integral/ODE/asymptotic, the existing Maass carrier/Fourier normalization and level-one Hecke/adelic comparisons. This roadmap's level/character and all-cusp extension explicitly compares back; it introduces no second named K definition. |
| `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:519–599`, §§0.25–0.28 | Complex-order I, Whittaker comparison and growing asymptotics cover imaginary order, zero and the required real orders; the H³ constant reaches order1. |
| Same, :1281–1324, §§1.16–1.16a | Differential operator and maximal-domain realization; weight conventions require the displayed conjugation shift. |
| Same, :1415, §1.23; :1593, §2.4; :2337–2360, §§4.3–4.4; :2402–2422, §§4.8–4.9; :3026, §6.6 | Untwisted Eisenstein comparison, meromorphic continuation, spectral decomposition, level-one Weyl law and coarse trace formula exist. Character cusp-channel comparison remains owned here. |
| `TauCetiRoadmap/CongruenceSpectralGap/README.md:150–198`, §§0.1–0.2 | Effective quotient measure and nonnegative self-adjoint maximal-domain Laplacian. Its weak-domain regularity step supplies the input to PDE Lane E. |
| Same, :285–315, §§0.5b–0.6; :826–848, §5.3 | Principal congruence cusp compactness, residual/spectral description and the 21/100 bound are actually stated. |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:244–272`, AL.R.1–3; :1565–1592, AL.2.1.4; :1689–1720, AL.2.2.4–5 | Archimedean/tensor comparisons, standard local factor and normalized GL₂ newvector, including ramified places. |
| Same, :1794–1860, AL.2.6.1–4; :2129–2156, AL.3.5.3–3.6.1; :2182–2190, AL.3.7.1 | Level-one completion comparison, positive self-pair/absolute Euler convergence and strong multiplicity one. The general-character completion is not falsely attributed to the level-one target. |
| Same, AL.0.5.1 and AL.0.5.3 | K specialization is consumed, while its Bessel–Laplace Mellin kernel has an extra exponential factor: it is not the same new Mellin target as §2.1(v). |
| `TauCetiRoadmap/ModularForms/README.md:678–705`, Layer6; :1018, Layer9 | Exact-divisor/Fricke and character transport conventions, plus literal self-duality. Holomorphic old/new spaces supply a pattern, not the nonholomorphic theorem itself. |
| `TauCetiRoadmap/LFunctions/README.md:346–383`, Layer0 | The actual analytic data card, dual and property predicates are supplied; no duplicate card is constructed here. |
| `TauCetiRoadmap/KleinianGroups/README.md:226–254`, Layer0; :315–358, Layers3–4 | H³ action/measure, Bianchi group and Gaussian covolume exist. R02 fixes the layer locator. |
| `TauCetiRoadmap/PDE/README.md:322–340`, Lane E | Elliptic bootstrap with its weak-Sobolev hypotheses; not an unrestricted regularity claim for arbitrary distributions. |
| `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md:785–835`, PartC; :1041–1065, PartD; :1196–1232, PartE | Reducing subspaces, resolvent/core statements and PVM/projection estimates. These are inputs, not newly owned generic spectral theory. |
| `Completed/OrthogonalL2Bases/README.md:275–315`, B2 | Basis/coordinate-isometry packaging is used as a pattern; its polynomial specialization is not mistaken for a spectral theorem. |
| `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:1850–1866`, §7.2; :2215–2229, §7.32-raw | Half-weight multiplier/Whittaker spaces differ from weight-zero Γ₀(N) character forms. The unitary-weight conversion is explicit. |
| `TauCetiRoadmap/BianchiModularForms/README.md:83–101` | Its cohomological Bianchi scope differs from the scalar Picard spectrum here; it explicitly consumes MaassForms §2.1(v). It is not made a supplier. |
| `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/README.md:3–25` | Owns Schwartz multipliers, weighted quotient spaces and cuspidal-support isolation, not a replacement construction of these classical Maass spaces. |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:75–99` | Its classical-group/doubling and converse-theorem extensions do not duplicate the weight-zero character comparison here. |

The board-package and open-roadmap object searches found the same relevant owners, rather than a separate owner for the character/Picard comparisons. No fully qualified declaration in this acceptance file was found duplicated in the readable sibling Lean files. No upward dependency was introduced by a downstream citation. No entire earlier roadmap is being replanned; the extension is by character and scalar Picard geometry, with the generic theories imported.

## Not verifiable

Source access does not certify mathematical content. The review was completed without parking it or treating missing legal access as evidence of a false theorem.

- **iwaniec-spectral**, *Spectral Methods of Automorphic Forms*, Chapters1,3,4–8,11: the service reached the AMS landing page, not readable chapter text. The exact book statements supporting §§0–5, including the level-one bound, were not certified.
- **iwaniec-topics**, *Topics in Classical Automorphic Forms*, Chapter2: no legal text was resolved. Regular/irregular cusp formulas were checked algebraically and against accessible BLS conventions, not against this chapter.
- **bump**, §§1.9,2.1: Cambridge landing page only. No claim of having checked its page-level Maass statements.
- **atkin-lehner**, Theorems3,5, and **atkin-li**, Theorem3: no legal full text resolved. The Maass/general-character claims were checked using readable BLS and the supplied local/global representation targets; the original published theorem locators remain uncertified.
- **huxley**, pp.141–156: no legal full text resolved. BLS's explicitly cited ordinary scattering determinant was read instead; this does not certify all of Huxley's chapter.
- **elstrodt-grunewald-mennicke**, Chapters1–3,6–8: service classified the Springer source as paywalled/uncertified. In particular, §7.4's Gaussian Hecke adjoint was not checked against this book.
- **iwaniec-kowalski**, §5.1 (5.7), p.95 and Chapter15: AMS landing page only. Conductor values were recomputed, but the printed locator was not certified.
- **booker-strombergsson-then**, pp.78–108: Cambridge landing page only. DLMF identities and independent integral checks were available; the paper's full uniform bounds were not verified.
- **hejhal**, volume2: paywalled/uncertified. No inaccessible proof step was assumed read.
- **maass**, pp.141–183; **roelcke**, 1953/1955; **roelcke-ii**, Math. Ann.168 pp.261–324; **selberg**, 1965 pp.1–15: no legal text or only publisher landing/paywall was resolved. Roelcke I was already settled as uncertified and was not reopened.
- Several fresh **lmfdb** knowl requests returned a reCAPTCHA page. Readable earlier service-cache copies of the label, spectral-index, dimension, Picard Fourier and rigor knowls were used and are identified by source/line above. Live page revision agreement, the full website code, and individual displayed database records were not certified. The worked decimal computations check arithmetic consequences only.
- The 11 unresolved, unsettled requests are recorded together in the scratch missing-reference file. No source manifest was edited, as this review is read-only. Settled uncertified texts were not renamed into new requests.

## Source issues

- **Error** in lmfdb at `mf.maass.spectral_index`, lines95–97 (web knowl, no printed page): the source says the ordinary and exceptional spectral parameters are respectively imaginary and real; it should be real and imaginary for λ=1/4+R²; affects a stated result.
- **Error** in lmfdb at `mf.maass.picard.fourierexpansion`, line91 (web knowl, no printed page): the source says the K-Bessel sum includes the zero Gaussian frequency; it should be summed over nonzero frequencies, with any constant mode handled separately; affects a stated result.
- **Error** in lmfdb at `mf.maass.mwf.dimension`, lines90–100 (web knowl, no printed page): the source says the described multiplicity concerns a newform eigenspace while illustrating it with oldform lifts; it should distinguish full cusp-space oldform multiplicity from newspace multiplicity; affects a stated result.
- **Error** in lmfdb at `mf.maass.mwf.dimension`, line100 (web knowl, no printed page): the source says the extension from 9 to other odd square divisors remains conjectural; it should be identified as proved by Humphries Theorem1.1, p.2, with its stated density and multiplicity; affects a stated result.
