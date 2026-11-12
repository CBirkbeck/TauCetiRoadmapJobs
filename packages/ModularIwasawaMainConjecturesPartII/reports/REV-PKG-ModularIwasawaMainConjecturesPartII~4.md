<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12963#issuecomment-6788865154 -->
Review (codex) of 3ed676d

Verdict: needs_changes

1. **F01** (P2) The ideal action must preserve the level point

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:308`, also the API at :312. Package quotation: “For finite abelian `K′/K`, `a` prime to the ramification”.

   **Claim:** The quotient pair `(E/E[a], q_a(α))` is isomorphic to the Artin conjugate of the pair of modulus `f`, without requiring `a` prime to `f`.

   **Witness:** Put `π=1+i`, `K=ℚ(i)`, `f=(π³)`, `K′=K(f)=K`, `a=(π)`. Every prime is unramified in `K′/K`. But `ann(q_a(α))=(π²)`, whereas `ann(α)=(π³)`.

   The example is already available from the package's Check at :318: the four units inject modulo `π³`, the quotient unit group has order four, and the Gaussian class number is one. Thus the ray field is K. Analytically the original pointed curve is `(ℂ/π³ℤ[i],1)`; the quotient is `(ℂ/π²ℤ[i],1)`. Multiplication by `π²` kills the second point and does not kill the first. No pointed `O_K`-linear isomorphism exists, even after extending the field. This also prevents using this unrestricted `η_a` in later action formulas.

   Kato line 5235, (15.3.3), printed p.252, has the same missing condition; lines 5237–5239 assert the quotient-pair identification. A matching source sentence does not make the assertion true. Johnson-Leung–Kings' canonical-pair construction at JLK lines 570–582 does not justify dropping coprimality.

   **Exact repair:** Require `(a,f)=1` as well as unramifiedness before asserting the pointed Artin isomorphism. Carry the condition into its API and any use of `η_a` or `J_a`. Keep the arbitrary ideal-isogeny construction supplied by ComplexMultiplicationAndExplicitReciprocity separate from the pointed action. Add the example above as a negative-control Check. For the positive control `a=(5)`, `5−1∈(π³)` and `(5,π)=1`; the quotient point retains annihilator `(π³)`. The composite in §3.1 is `[5]`, and the normalized action is `5⁻¹·5=1`. This repair passes that existing Check and excludes precisely the failed level action.

2. **F02** (P2) Splitting does not imply height one without good reduction

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:552`; the scope at :29 says “any CM curve in the Coleman power series of §5.1”. Package quotation: “`F` has height one, so there is an isomorphism `θ : Ĝ_m ≅ F`”.

   **Claim:** The formal group of a curve as in §2.2 is height one over the completed maximal unramified base whenever p splits. Good reduction is imposed later at :565 for the two-variable construction, but not for this initial assertion or its interpolation API.

   **Witness:** For `E:y²=x³−25x`, `K=ℚ(i)`, `p=5`, one has `c₄=1200`, `Δ=1000000`, valuations `(2,6)`. Its special fibre is cuspidal; `[5]` on its formal group is zero, versus `T⁵` on `Ĝ_m`.

   This is a CM curve with endomorphism ring `ℤ[i]`, and 5 splits in K. The model is minimal at 5: its discriminant valuation 6 cannot decrease by a positive multiple of 12. Its reduction is `y²=x³`, whose smooth identity component is additive. The associated formal group therefore has infinite height, even after unramified extension. The formal completion of a minimal Weierstrass model at its identity exists over the stated base despite bad reduction. If an elliptic scheme over that base is intended instead, that is the missing good-reduction hypothesis and must be stated. The same curve appears in the package at :810.

   Coleman79 lines 61–89, Theorem A, start with a Lubin–Tate formal group, not an arbitrary bad-reduction CM curve. Yager lines 102–109 impose good reduction separately from splitting. The supplier NoncommutativeAndEquivariantIwasawa §4.3 likewise explicitly uses good ordinary reduction.

   **Exact repair:** Formulate the transported local construction for a one-dimensional height-one formal group over `Ô` with the stated action and chosen `θ`. For its CM elliptic-curve specialization, require good reduction at the selected split prime; it is then ordinary. State this before asserting height, the torsion tower or interpolation, and carry it into the scope and the inert negative-control discussion. Do not impose it on the all-prime theorem of §8.6. Add the curve above as a negative control. For `E₀:y²=x³−x` at 5, `Δ=64` is a unit and `#E₀(𝔽₅)=8`, so `a₅=−2` and the reduction is ordinary: the repaired hypothesis gives height one and permits the existing Coleman construction. For the original bad curve, heights `∞` and `1` exclude `θ`.

Two findings, both P2. The six preceding findings are repaired. The new findings concern missing hypotheses in intermediate constructions; neither requires narrowing the all-prime rational main conjecture. The required Lean elaboration and dependency check pass. No reviewed package source file was changed.

## Verified sound

### Previous findings, checked first

These are the six findings in the preceding review and their actual repairs, not merely the repair report's assertions. Quotations below are from the package. No finding marked “not actionable in this package” is reopened.

| Previous finding | Status | Repaired passage and recomputation |
|---|---|---|
| F01: Coleman projector and residual twist | Repaired | README:565 defines `col_θ(u) = −x⁻¹·μ_u` with boundary `(1−φ_F)D_θ log g_u`. At :581, for p=5 and `g=(2+T)/ω(2)`, the boundary has mass 0 and first moment −1; `col_θ` has first moment 0 and second moment 1. Under a=2, the raw boundary gives −4 versus ordinary pushforward −2; after division by x and the chosen minus sign, both second moments are 4. |
| F02: coefficient torsion confused with Iwasawa torsion | Repaired | README:575 says “the `Λ_{F′}`-torsion submodule of `U(F′)`”. At :582, `N(ζ₂₅)=ζ₂₅⁵⁵=ζ₅`, every `5^m u` has component `ζ₅≠1` at n=m, but `(σ−χ_cyc(σ))u=0`. Both assertions now use the appropriate ring. |
| F03: auxiliary ideal at p | Repaired | README:322 says “fix a prime `p` and an ideal `a` prime to `6p`”; :327 retains this for the API. For a=(5), p=5, m=1 the old inverse theta value is 0; for a=(7), the nonzero level-5 point lies in neither the zero nor pole divisor. The negative control is at :334; §3.2 also keeps the condition. |
| F04: quotient-isogeny pullback | Repaired | README:386 defines “`J_a = η_a ∘ q_a`” and uses its pullback in both realizations. Tensor bases are K, `K⊗ℚ_p`, and K(f), respectively. At :399 the principal-ideal test gives `(1/5)·[5]⁎=1`. R01 concerns the separate admissibility of the pointed `η_a`, not this repaired composite. |
| F05: norm of a prime over 7 | Repaired | README:376 uses “`a = (2 + √−3)` (norm 7)”. Norms are 7 for this prime, 49 for (7), and 25 for the inert principal ideal (5). |
| F06: nondiscriminating quadratic twist test | Repaired | README:197 uses “`χ(g) = i`”. The required multiplier is −i; the inverse-convention error gives +i. Their difference 2i is a unit over `ℤ₅`; the quadratic test gives −1 in both conventions and is retained only as agreement. |

I reread the changed definitions, API and Checks and searched the rest of the package for each repaired pattern: raw versus integrated Coleman operator, coefficient versus Iwasawa torsion, auxiliary ideals meeting the level, missing isogeny pullbacks, principal versus prime-ideal norms, and inverse-character conventions. The coefficientwise-versus-transported Frobenius and image-versus-divisorial-hull repairs from the earlier round were also recomputed. Unchanged material was reused only where the previous review recorded computed values; the seeded targets were read afresh.

### Principles, shape and Lean acceptance test

All 51 numbered subsections in nine layers were read, including their API, Checks, proof routes and dependencies. Every layer has Examples and Dependencies. Definitions have API lists and at least three Checks; the mathematical failures above are not cured by their Check counts. The two main-branch roadmaps opened for house shape were `TauCetiRoadmap/ModularForms/README.md` and `TauCetiRoadmap/ModularCurves/README.md`; the binding rubric, rather than any nonconforming older source-following prose in the latter, was applied.

The Part II scope builds on ModularIwasawaMainConjectures §§0.6–0.7. Generic carriers, theta functions, Euler-system theory and Katz measures have named suppliers; the new arithmetic specializations and CM proof are differentiated from them. The rational endpoint retains p=2, p=3, all CM weights k≥2, and the contained cyclotomic case. Rubin's narrower original hypotheses are distinguished from the all-prime JLK theorem. I found no computational-algorithm target, copied source passage, source-chapter layer heading, unforced source-order plan, sorry'd data, `set_option`, prohibited supplier, machine path or process residue in the reviewed roadmap text. The local correction R02 does not justify a good-primes-only endpoint.

`Suggested.lean` has a single `import Mathlib`, the required module docstring and namespace, and **zero declarations**. Thus the exhaustive one-tactic probe covers zero sorried theorems; there is no padding to delete. The explicit-signature/binder audit also covers zero declarations, so no `#check @name` can reveal a lost binder. Backticked names were resolved in context: none is an undeclared own Lean API promise. No name collision can arise from this file.

The required `lake env lean` invocation was run on the package file from the pinned content checkout: **exit 0, no output, no warnings**. No Tau Ceti import or targeted object build was needed. The old signature-tool syntax-error lead does not reproduce. No elaboration remains running.

| Headline | README | Acceptance-file treatment and carrier audit |
|---|---|---|
| Kato equality for every CM newform and every prime | §8.6 | Suggested.lean:10–15 names it as not statable: the native newform carries no Galois realization, arithmetic cyclotomic cohomology or zeta morphism. |
| CM case of Kato 12.4 | §7.8 | Named in the same paragraph; the arithmetic H¹ and H² carriers are missing. |
| Rational equivariant equality with tame factors | §6.2 | Suggested.lean:16–22 correctly acknowledges native ray fields, but lacks their unit/class norm-limit modules and CM elliptic units. |
| JLK all-prime equality | §4.5 | Suggested.lean:23–26 names the arithmetic two-variable complexes, determinant lines and zeta element needed. |
| Rubin equality and all-prime classical form | §4.8 | Suggested.lean:27–30 names the absent local/global unit and ramified Galois norm-limit modules. |
| Katz equality, specialization and θ-components | §§5.3–5.4 | Suggested.lean:31–33 names the absent Katz measure, Coleman map and arithmetic modules. |
| Katz functional equation and λ-identity | §5.5 | Suggested.lean:34–36 explicitly names both; the Katz measure is absent. |

None becomes statable through only a few simple native definitions. Arbitrary modules, measures or free predicates would be stand-ins for the missing arithmetic constructions. No statable headline was found omitted.

### Computed adversarial table

“Pass” below records a discriminating test, not a proof by examples. The table covers every seeded target, every headline group, all repaired patterns and both new findings. Remaining unchanged auxiliary tests with computed values in the preceding review were checked against their present definitions; they were not replaced by prose assurances. The standing imaginary-quadratic/characteristic-zero and finite-lattice hypotheses exclude zero rings, inseparable fields and nonabelian ray groups; those objects are not silently admitted by a Lean signature, since no such signature is declared.

| Statement | Instances | Computed values on the competing sides | Result / change |
|---|---|---|---|
| §0.1, ray group | K=ℚ(i), f=1 at p=2,5; f=(3), p=5 | Finite torsion orders 1,4,32; rank Γ=2 in each case | Pass; no prime-to-p restriction on arbitrary Δ |
| §0.2, rational characteristic ideals | `A/(p)`, `A/(T²)`, `(A/T)²` | First becomes 0 with ideal 1 after inverting p; latter lengths at (T) are 2 and 2 | Pass; integral p-factors not inferred |
| §§1.1–1.4, limits and Brauer term | `T₂μ₄`; trivial ℤ_p corestriction; one/two p-adic places | `T₂μ₄=0`, not μ₄; degree-p corestriction limit 0; kernel of sum `ℤ_p^s→ℤ_p` has ranks 0,1 for s=1,2 | Pass; h² is not blindly identified with all H² |
| §1.1, inverse twist | χ(g)=i versus χ(g)=−1 | −i versus +i; −1 versus −1 | F06 repaired |
| §§1.2,1.7, roots and rank | Qi at 5; cyclotomic versus transverse norms | p-unit rank 2 versus global-unit rank 0 at K; fixed finite roots raised to p^m eventually give 1; cyclotomic norm ζ₂₅ gives ζ₅ | Pass; the two tower directions are distinguished |
| §§1.5,6.1–6.3, Euler correction and rational headline | Qi, p=5, f=(3) | Δ has order32, inertia8, quotient4. Two quotient characters have Euler augmentation0, two have2; remaining28 components have zero local module. A simple Euler zero adds length1 versus0 if omitted | Pass; full equivariant statement retains correction |
| §2.1–2.2, theta normalization | c=5; cube-root rescaling; quotient E→E/E[a] | Logarithmic residue c²−1=24; u³=1 but u⁸=u²≠1; quotient pushes divisor to0, versus nonzero theta divisor | Pass; unrestricted isogeny norm is excluded |
| §2.3, canonical pointed action | π=1+i, f=π³, a=π versus a=5 | Ann original point=π³; quotient point=π² for a=π, π³ for a=5. Normalized [5] action=1 | **R01** |
| §2.3, rigidity | Qi with f=(3), (π), (π³) | Unit-image sizes4,1,4; ray degrees2,1,1; modulo π the nonidentity automorphism i fixes the point | Rigidity hypothesis passes; distinct from R01 |
| §2.4, smoothed units | p=5, m=1; a=5 versus7 | Bad inverse theta value0; with a=7, E[5]∩E[7]={0}, so value nonzero | F03 repaired |
| §§2.5–2.7, inverse character and auxiliary ideal | χ=i; Qi with depleted prime3; J=(S−a,T−b) | Euler values25+i versus25−i; depleted trivial derivative −log9/4≠0; additional trivial Euler factor gives order≥2 and derivative0. A/J has dimension1, but J at every height-one prime is A | Pass; whole ideal distinguished from a single factor |
| §3.1, CM realization | r=1,2; principal ideal(5); geometric/arithmetic Frobenius | CM tensor over K stays dimension1 over K, hence2 over ℚ; tensor over ℚ would give2^r. Action(1/5)·5=1. Frobenius absolute values √5 versus1/√5 | F04 repaired; R01 must also constrain pointed action |
| §§3.2–3.3, period and reciprocity | r=1; γ=0; inert p; auxiliary vanishing at r=2 | `N(a)=25`, size of ψ(a)=5, difference nonzero; at r=2 a principal auxiliary factor can be c²−c²=0. γ=0 gives0 on both sides. Relative height1 corresponds to absolute height2 when inert | Pass; identity allows vanishing factors, divisions require a nonzero choice |
| §4.1, integral twists | Δ=C_p | Idempotent uses1/p, nonintegral; character specialization sends1 to1 integrally | Pass; no illegal integral eigensplitting |
| §4.2, determinant shift | `[O →p O]`; scalar tensor with valuations(0,1,−1) | Determinant valuation+1; shift−1; an extra inverse+1. Tensor valuation0 does not imply each factor valuation0 | Pass; scalar TNC is not componentwise integral TNC |
| §4.3, zeta-element factor | N(a)=25, η(a)=1, p=3; a=O_K | Factor24≠0 in E_p, valuation1 in O_p; excluded unit ideal gives0 | Pass when “invertible” is read in the rational realization, as in JLK; no integral-unit claim inferred |
| §§4.4–4.6, all-prime JLK headline | DVR component H¹=A, z=t, H²=A/t; additional Euler t | Lengths1=1; extra Euler factor raises both corrected sides by1. Merely replacing z by t² gives1≤2, not equality | Pass; equality uses TNC/nonvanishing, not the bound alone |
| §§4.7–4.8, Rubin and classical headline | Qi,p=5; Q√−7,p=2 | Ray degree4 versus division-tower degree16; local-unit ranks1(split),2(inert). −7≡1 mod8 splits2, but2 divides #μ(H)=2 | Pass; original Rubin excludes the latter, all-prime classical JLK form has its stated p∤#Δ condition |
| §5.1, height-one input | `y²=x³−25x` and `y²=x³−x` at5 | Bad curve `(v₅c₄,v₅Δ)=(2,6)`, formal [5]=0; Gm [5]=T⁵. Good curve Δ64, point count8, a₅=−2, height1 | **R02** |
| §5.1, transported Frobenius | p=5, c³=1≠c, θ=cT | ε_F=cX, g=1+X/c, Φg=g, D_θ log g=1; trace law5=5. Wrong coefficientwise version gives5c versus5c² | Pass; previous transport repair retained |
| §5.1, corrected measure | p=5, g=(2+T)/ω(2), a=2 | h(0)=1/2, Dh(0)=1/4; boundary mass0, moment−1; corrected second moment1. Old projector mass2/5 and translate sum2. Corrected covariance second moments4=4 | F01 repaired |
| §5.1, torsion and normalization | u=(ζ_{5^(n+1)}); mass of preceding measure | `5^m u` has component ζ₅≠1; `(σ−κσ)u=0`. Mass `−log16/5` has valuation0 since16=1+15 | F02 repaired; no coefficient torsion assertion |
| §5.2, image versus hull | J=(S−a,T−b), nonzero ν; good CM curve at5 | `Aν/Jν≅Ô≠0` but all height-one localizations0; point count8 and ordinary Euler product `(32−24i)/25`, not its conjugate | Pass; characteristic ideal uses the hull |
| §5.3, Katz specialization headline | Pseudo-null `Z=A/(S−s,T)`; specialize T=0 | Z[T] and Z/T both have length1 on O[[S]] at(S−s), so contributions cancel; dropping either changes length by1 | Pass; both Tor and quotient terms retained |
| §5.4, anticyclotomic θ headline | Nontrivial θ at excluded decomposition factors; T versus pT | Correction modules have θ-component0 and ideal1. λ(T)=λ(pT)=1, although ideals(T) and(pT) differ | Pass; no μ=0 conclusion is smuggled in |
| §5.5, functional equation headline | Involution on Γ-coordinate; double dual character | T maps to `(1+T)⁻¹−1=−T/(1+T)`, a unit times T; λ1=1. `check(check χ)=χ` | Pass; tame unit factor does not change λ |
| §7.1, CM criterion | Classical levels32,27; non-CM level11 | `|D_K|Nf=4·8=32`, `3·9=27`. At2 inert in Q√−11, CM induction would give trace0; level11 has a₂=−2 | Pass; self-twist condition discriminates |
| §7.2, induction normalization | Two characters with values2,3; conjugation swap; k=2 | Restricted induced trace5, off-diagonal swap trace0; weights0,1. Scalar rescaling c preserves the fixed nonzero de Rham vector only for c=1 | Pass; archimedean comparison not promoted to G_Q-equivariance |
| §§7.3–7.4, comparison and twist | Index-two induction; χ=i | Induced restriction has two rank-one summands, total rank2; inverse twist factor−i, untwist restores1 | Pass; quotient/cohomological directions and twist agree |
| §7.5, descent | `A=k[[x,y]]`, a=x; H²=A/y or A/(x,y) | First H²[x]=0 and H²/x=k; second H²[x]=k and H²/x=k. Removing the Tor term loses length1. In characteristic0,2 and#Δ invertible; residue characteristic2 fails the hypothesis | Pass; exact sequence retains Tor |
| §7.6, contained case | p=2,3,5,7 | Imaginary quadratic subfields: Qi,Q√−2 at2; Q√−3 at3; none at5 (Q√5 is real); Q√−7 at7 | Pass; no missing dyadic case |
| §7.7, length lemma | A=ℤ_p[[T]], M=A/T, a=p; then M=A/p | First quotient length1, torsion0, divisor sum1. Second quotient has dimension1 and violates the height-one avoidance hypothesis | Pass in both directions of the test |
| §7.8, CM Kato12.4 headline | Generic component; zero module; Tate representation; rank-one CM curve | H² generic rank0 and H¹ rank1, while zero module has rank0. Tate module has nonzero root element killed by σ−κσ, so is not torsion-free. At the rank-one curve, central L-value0 cannot supply the needed nonvanishing | Pass; route uses nonabelian CM induction and infinitely many ramified twists |
| §7.9, inequality | H¹=A,z=t²,H²=A/t at DVR | Lengths1≤2, but1≠2 | Pass; inequality is not used as equality |
| §§8.1–8.2, period normalization | Both sign lines; r=k−1; γ=0 | c₊v₊=v₊ and c₋v₋=v₋ force c₊=c₋=1; period exponent k−1−r=0 gives1; zero gives0 on both sides | Pass; normalization excludes arbitrary rescaling |
| §8.3, ψ-component Euler vanishing | Inertia value i, characteristic-zero regular component | After g=1 the factor i⁻¹−1=−i−1≠0, with norm2; at p=2 it is still invertible after inverting p. Trivial inertia value instead gives0 | Pass; nontrivial inertia is essential |
| §8.4, elliptic/Beilinson–Kato bridge | r=k−1; γ=0; conjugation on inverse Tate line | Both interpolation factors have period power1; both zero vectors map to0; inverse Tate conjugation is−1 | Pass; no arbitrary period scalar or missing twist |
| §8.5, equality descent | M₁=M₂=A/y,a=x; fractional h=1/x | Quotient lengths1, torsion lengths0, both divisor sums1. h lies in x⁻¹A but not A_(x); intersection excludes its valuation−1 | Pass; Tor cancellation and generator condition retained |
| §8.6, all-prime endpoint | Coefficient extension of ramification e; integral p-factor | Lengths n,n become en,en; ideals(p) and(1) both become(1) after inversion | Pass; rational assertion neither loses primes nor implies an integral equality |
| §8.7, normalization dictionary | k=2 and k=3; full cyclotomic torsion | k=2 gives c↦c⁻¹; k=3 would force h(−1)²=−1, whereas an order-two character gives1 | Pass; central specialization restricted to even weight, endpoint not restricted |

### Source sample and source manifest

All ten recorded works were present in the supplied legal cache. No missing work was fetched, no manifest key changed, and no duplicate version key was introduced. All ten reference entries have manifest entries. No additional author-flagged unverified locator was found beyond the extraction limitations below. Printed pagination was distinguished from extraction page markers.

| Seeded target | Source text read at the stated locator | Result |
|---|---|---|
| 2.3 Canonical CM pairs | Kato lines 5226–5241, (15.3.1)–(15.3.3), p.252; JLK lines 570–582, §3.2, pp.13–14 | Existence and rigidity supported; pointed ideal action has the missing hypothesis R01, also present in Kato. |
| 3.1 Kato realization | Kato lines 5385–5453, §15.8, pp.256–258 | Correct realization dimensions and tensor bases. The repaired quotient-isogeny pullback matches line5434. |
| 3.3 Explicit reciprocity | Kato lines 5463–5527, Proposition15.9 and proof, pp.258–259; continuation through5571,p.260 | r≥1, twists, trace reduction and relative-height-one input present; the general reciprocity theorem is explicitly a supplier gap. Display-glyph limitation below. |
| 4.3 Tamagawa zeta elements | JLK lines 727–798, Definition3.8, Theorem3.9, Corollary3.10, pp.17–19 | Ramification-at-p level condition, rational invertible auxiliary factor, non-torsion and tensor determinant assertion supported; not separate integral eigenspace generators. |
| 4.8 Rubin and all-prime classical form | Rubin91 lines 485–562, §4 and Theorem4.1, pp.36–38; JLK lines 1000–1050 and1091–1148, Theorem5.2 and §5.4, pp.24–27 | Original restrictions p∤#μ(H), p∤[K₀:K] retained; all-prime character theorem distinguished from original Rubin. Classical use retains prime-to-p finite Δ. |
| 5.1 Coleman construction | Coleman79 lines61–89, TheoremA, and513–530, Theorem11/Corollary12; Yager lines102–109,466–545; Rubin91 lines633–648, Theorem5.1 | Correct transported norm and derivative, and repaired measure normalization. R02: initial height-one assertion lacks good reduction. Yager's full comparison formula is incompletely legible. |
| 5.4 θ-components | CGLS lines370–421, Definition1.2.1, Theorem1.2.2, Remark1.2.3, pp.7–8; Rubin91 lines671–718, Theorem5.3 | θ exclusions and local-condition identification present; package explicitly supplies prime-to-p class-number input for its Rubin route and does not own Hida μ-vanishing. |
| 7.2 CM induction | Kato lines5572–5666, §15.10, Lemma15.11(1) and proof, pp.260–262;5670–5676,p.263 | Galois comparison normalized by the fixed de Rham map; distinct from the archimedean comparison. |
| 7.5 Descent lemma | Kato lines5704–5730, Lemma15.13 and proof,p.264; BT line228 | Non-contained case, invertibility of2 and#Δ, principal kernel and Tor exact sequence match. |
| 7.7 Length lemma | Kato lines4912–4931, Lemma14.15 and proof,pp.243–244 | General noetherian ring, support and height-one avoidance hypotheses match; quotient and torsion terms both retained. |
| 7.8 CM Kato12.4 | Kato lines5738–5753,§15.15,p.265;4306–4341,§13.8,pp.227–228; BT lines182–184,Theorem2.3,p.4 | The source's nonvanishing/generic generation argument and torsion-freeness proof are present at the stated generality, including the separate contained case. |
| 8.3 Equivariant ψ equality | JLK lines1412–1498,§7.2,pp.34–36; Kato lines5738–5772,§§15.15–15.17,p.265; BT lines213–218,p.5 | Regular-prime equality and twist/local Euler removal checked. The source's inequality alone is not mistaken for equality. |
| 8.4 Elliptic to Beilinson–Kato elements | Kato lines5754–5760,§15.16 and(15.16.1),p.265; BT lines215–216 | Inverse Tate twist and fixed comparison match; rational identification, not equality of integral lattices. |
| 8.5 Equality descent | Kato lines5762–5772, proof of Proposition15.17,p.265, and4912–4931; BT lines213–218 | Kato proves inequality; package states and supplies the extra equal-divisor/Tor cancellation argument. The two-dimensional regular-local model computes correctly. |
| 8.7 Normalization dictionary | BT lines160–196,§§2.2.1–2.2.4,pp.4–5;224–243,Theorem3.1 and proof,pp.5–6 | Cohomological dual, j_* convention, full cyclotomic group and rational ideals match. Even-weight condition retained for central specialization only. |

Additional headline and changed-source readings: JLK lines399–455 (scalar coefficient TNC, including p=2), 970–1050 (auxiliary ideal and Theorem5.2), HuberKings lines716–741 (Proposition2.3.1, only up to powers of2), Kriz lines1034–1064 (Theorem27,p.22), BT lines208–218 (Theorem2.6,p.5), and BKO21 lines799–823 (Theorems6.1–6.2,pp.962–963, the inert signed scope boundary). JLK's Ω-perfectness proof has a separate source error recorded below; the package does not assert that integral singular Ω result.

### Library declarations opened at the pins

The manifest pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Searches covered objects, not only declaration names: completed group algebras, ray fields, class groups, units, CM level structures, theta/elliptic units, norm-limit arithmetic modules, Coleman and Katz measures, and attached newform realizations.

| Pinned declaration | File and line | What was checked |
|---|---|---|
| `ClassGroup` | `Mathlib/RingTheory/ClassGroup/Basic.lean:89` | Quotient of invertible fractional ideals with domain hypotheses; no arithmetic tower limit. |
| `Module.length` | `Mathlib/RingTheory/Length.lean:31` | Extended-natural length from the submodule lattice; finite length not automatic. |
| `Ideal.height` | `Mathlib/RingTheory/Ideal/Height.lean:36` | Infimum over relevant prime heights; not automatic purity. |
| `IsLocalization.AtPrime` | `Mathlib/RingTheory/Localization/AtPrime/Basic.lean:50` | Localization at the complement; not automatically a DVR. |
| `NumberField.Units.regulator`, `regulator_ne_zero` | `Mathlib/NumberTheory/NumberField/Units/Regulator.lean:267`, :290 | Actual regulator and nonvanishing, with fundamental-system independence nearby; not arbitrary-vector injectivity. |
| `NumberField.Units.torsion` | `Mathlib/NumberTheory/NumberField/Units/Basic.lean:145` | Unit torsion subgroup, not its Tate module. |
| `NumberField.IsTotallyComplex` | `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:210` | Every infinite place complex; no real-place dyadic correction. |
| `IsCyclotomicExtension` | `Mathlib/NumberTheory/Cyclotomic/Basic.lean:74` | Primitive-root and generation conditions, not a chosen infinite tower. |
| `cyclotomicCharacter` | `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean:308`, specification :324 | Total definition has a trivial fallback without enough roots; arithmetic uses algebraic closures, where the root hypothesis holds. |
| `PowerSeries`, `MvPowerSeries` | `Mathlib/RingTheory/PowerSeries/Basic.lean:57`; `Mathlib/RingTheory/MvPowerSeries/Basic.lean:86` | Actual coefficient-function carriers; the group-ring coordinate comparison is separate. |
| `TauCeti.completedGroupAlgebra` | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | Actual inverse-limit subalgebra; not the arithmetic module actions. |
| `TauCeti.GlobalNumberFields.Modulus` | `TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:98` | Nonzero finite ideal and finite real-place part. |
| `TauCeti.GlobalNumberFields.RayClassGroup` | `TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean:130` | Ideals prime to modulus modulo ray relation; agrees with the coprimality needed in R01. |
| `TauCeti.GlobalNumberFields.HeckeCharacter` | `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70` | Continuous multiplicative map on the idele class group, no CM realization. |
| `rayClassField`, `rayClassArtinEquiv` | `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:123`, :209 | Actual field, finite-dimensional/number-field/abelian instances at :135–143 and Artin equivalence. |
| `HeckeRing.GL2.Newform` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104` | New normalized eigenform; no attached p-adic Galois representation. |
| Generic characteristic ideal | `TauCeti/RingTheory/Iwasawa/Char/Ideal.lean:85` | Existing generic characteristic-ideal construction, not a new target owned here. |

No native object found in these searches makes a missing headline statable without constructing the arithmetic objects. The acceptance file does not redeclare any native object.

### Supplier, overlap and ownership audit

The board package index was read before drawing absence conclusions. The roadmap service was used to search objects and to retrieve supplier/current open-head files. Every `*Needs:*` line and supplier citation was read. The resolver reported no missing cross-roadmap citation or own Lean name; its library-name limitation was addressed by the pin reads above. The following is the resolved contract inventory; paths are `TauCetiRoadmap/<name>/README.md`, with sections serving as stable locators.

| Supplier | Resolved sections and object consumed |
|---|---|
| GlobalNumberFields; ClassFieldTheory; ProfiniteProPGroups | Layers2,9,10; §2.6 and Layers10,11,13; Layer9 prerequisites: moduli, characters, Artin convention, Brauer sequence, ray fields and completed algebra. |
| ModularForms; EllipticCurves; ModularCurves | Layers4–5,7,9; Layers1–2; Layers0,2: forms, multiplicity, L-functions, isogenies, torsion, formal groups, Cartier divisors. |
| PadicMeasuresIwasawaAlgebras | §§2.1–2.3,2.6,2.8,4.1,4.6,5.1: Amice transform, φ/ψ, division by x, unit measures, coefficient extension, pseudo-nullity, characteristic ideals, determinants. |
| SelmerIwasawaCohomology, #869 | §§0.9,0.10,2.8,3.0–3.3,3.7,3.15,3.17: Kummer and limits, Iwasawa coefficients, Shapiro, control, twists, j_* comparison and local conditions. Its §3.13 is not used as a general ray-tower rank theorem. |
| ArithmeticGaloisDuality, #858 | R02.4.3, R02.4.4, D7.5: Poitou–Tate, finiteness/Euler characteristic, derived duality. |
| IntegralIwasawaTheory, #1306; ColemanPowerSeries on main | §§2.6,7.1,7.2,10.0; Layer1 and §§2.37,2.39,2.44: weak Leopoldt, Coleman series, normalized integral map, compact coefficients. The repaired minus sign and inverse derivative agree. |
| EulerSystemsAndKolyvaginSystems, #1272 | §§2.2,2.5,8.1,8.2,8.6,8.7,8.14,8.25,8.37: generic Euler systems, twists and Rubin bounds. This package owns their CM elliptic-unit specialization. |
| ComplexMultiplicationAndExplicitReciprocity, #1254; ImaginaryQuadraticClassNumber | §§1.2,2.2,3.2,4.1,4.2; H3.1: ideal isogenies, periods, idele/torsion dictionary, ray values, weight-two character and lattice action. Arbitrary ideal isogenies do not imply arbitrary pointed action: R01. |
| AutomorphicGaloisRepresentations, #1007; PartII, #1006 | §§1.5,7.3; AG2.0: modular and algebraic Hecke-character Galois representations. |
| AutomorphicLFunctionsAndLocalFactors, #924; LFunctions | AL.1 global distributions and rank-one comparison; Layer7: completed Hecke functions, functional equation and intrinsic nonvanishing. |
| PadicHodgeRegulators, #1498 | §§1.4,1.7: dual exponential, twists and transfer. The precise relative-height-one reciprocity theorem is declared as a gap. |
| AutomorphicPadicLFunctionsPartII, #1543 | §§3.3,3.4,8.5: Eisenstein–Kronecker series and Katz measure. This package owns the elliptic-unit comparison, not the measure construction. |
| PeriodsAndSpecialValues, #1496 | PS.5.2, PS.6.5: determinant/period predicates. Scalar h⁰ TNC is handled here; PS.6.5's negative-weight result is not substituted for it. |
| NeronModelsAndSemistableAbelianVarieties, #852 | §5.1: reduction/formal-group input. R02 makes its good-reduction hypothesis explicit in the local specialization. |
| PadicFamilies, #1019 | §§4.0.1,4.0.3: integer-indexed theta functions and non-CM results. Ideal-indexed CM refinement and CM module structure are distinct local targets here. |
| NoncommutativeAndEquivariantIwasawa, #1307 | §4.3, README:2063,2077,2083: rational CM curve at p≥5 ordinary, elliptic units, Coleman image Jν and Katz equality. General K/class number is differentiated; R02 corrects the additional claim about arbitrary reduction. |
| KatoEulerSystems, #1804 | §§4.2,5.1,5.3: analytic nonvanishing, zeta morphism and interpolation. Its §§4.4,7.2 are not used to prove their own CM clauses; the needed CM input is §7.8 here. |
| ModularIwasawaMainConjectures, #1499 | §§0.1,0.6,0.7: modular datum, arithmetic H^i and rational conjecture formulation. The base roadmap is extended rather than replanned. |
| AnticyclotomicLocalUnits | §1.1: inert height-two interpolation, distinguished from the split height-one transport. |

The closest open heads in the overlap report were read: KatoEulerSystems #1804, AutomorphicCongruences #1816, ModularIwasawaMainConjectures #1499, EulerSystemsAndKolyvaginSystems #1272, and CMRankZeroConverse #1744. Object searches also inspected NoncommutativeAndEquivariantIwasawa, AutomorphicPadicLFunctionsPartII and EllipticCurvePeriodsAndModularParametrizations #1715. The latter's one-variable ring-class norm closures differ from the ideal-indexed every-modulus Kato units here. The scope paragraphs name the existing owners; no additional jointly owned construction or circular handoff was identified. The acceptance file declares no fully qualified name that could duplicate another roadmap.

The supplied overlap facts contain no conflicting head, dropped cited id, or id defined only by an unnamed revision. The current files support those facts, and the repair has not renumbered targets. No overlap finding is added. This does not claim ownership verification against open work whose files were not supplied.

The precise contract `gap:height-one-explicit-reciprocity` occurs at README:113 and in `design/plan.json`'s top-level `gaps`, with PadicHodgeRegulators §1.4 as owner. It specifies a finite local field, a p-divisible group with relative O_𝔭-height one, norm-compatible units in its torsion tower, the Kummer cup product, Tate basis and logarithmic-derivative value. It is neither unowned nor a duplicate native theorem. After the findings are fixed, acceptance can be conditional on this gap; its present absence from the supplier is not a finding.

The required dependency check, with the supplied name, merge order, movable setting and content checkout, returned exactly:

```text
depcheck: 236 roadmaps, 2152 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No merge-order, supplier or pinned-library file was changed.

## Not verifiable

- Yager's extraction is OCR. Chapter3's norm and derivative formulas and the good-reduction hypothesis are readable, but parts of Theorem1 and Chapter8 are too damaged to certify the complete displayed two-variable normalization directly. Coleman79 and Rubin91 provide readable complementary statements. No missing source key was invented for the same work.
- Kato's extraction loses some overbars and factors in (15.4.4), (15.5.1) and (15.9.1)–(15.9.2). Inverse-character, period and Frobenius conventions were recomputed, but those individual printed glyphs cannot be certified from this extraction alone.
- The cited source statements and proof steps used in the sampled routes were checked; this review does not reconstruct every proof in Rubin91 §§8–10 or claim examples prove the main conjectures.
- No readable head for InertAnticyclotomicCMMainConjecture was among the supplied files. Its signed inert boundary was checked against BKO21, and it is not consumed here. Ownership against other open pull requests without supplied readable files was not checked; the provided main/open heads and board package index were searched.

All ten bibliographic works were available; there is no newly missing reference to request. These limitations concern extraction or unavailable open-work files, not permission to guess their contents.

## Source issues

- **Error** in Kato at (15.3.3), printed page 252: the source says unramifiedness suffices for the ideal isogeny to preserve a CM pair's modulus; it should also require the ideal prime to the point modulus; affects a stated result.
- **Error** in JLK at the proof of Lemma 5.1, printed page 23: the source says removing the p-primary group factor gives a projective quotient module; it should not infer projectivity: the augmentation quotient of ℤ_p[C_p] has no module splitting; affects the proof.
- **Error** in BT at Theorem 2.1, printed page 4: the source says the two characteristic ideals agree without tame conductor corrections; it should retain away-from-p Euler modules, or use H² over the p f-open; affects a stated result.
- **Error** in Kato at Theorem 15.2(2), printed page 251: the source says the conductor-f elliptic-unit quotient and class module have equal lengths throughout the stated range; it should retain tame Euler factors where they are nonunits; affects a stated result.
- **Gap** in BT at the proof of Theorem 2.6, printed page 5: the source says equality follows through Kato's descent; it should supply equality bookkeeping, since Proposition 15.17 proves an inequality; affects the proof.
- **Misprint** in Kato at the proof of Proposition 15.17, printed page 265: the source says the required length result is Lemma 14.12; it should cite Lemma 14.15; affects nothing.
- **Misprint** in Kato at (15.4.2), printed page 252: the source says the theta norm identity holds for an unrestricted linear isogeny; it should require degree prime to N(a), since quotienting by E[a] sends the divisor to zero; affects a stated result.
- **Gap** in CGLS at Theorem 1.2.2, printed page 8: the source says Rubin's theorem supplies the comparison under the displayed assumptions; it should justify the prime-to-p class-field-degree input or invoke a theorem dispensing with it; affects the proof.
- **Misprint** in JLK at §1.2, printed page 4: the source says the character factors through a subgroup identified with Gal(F′/K); it should say quotient group for the subextension F′/K; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3ed676d4699faf6ba3321554e358b84aa3b154f4", "job": "REV-PKG-ModularIwasawaMainConjecturesPartII~4", "model": "gpt-6-astra", "worker": "chris-8"} -->
