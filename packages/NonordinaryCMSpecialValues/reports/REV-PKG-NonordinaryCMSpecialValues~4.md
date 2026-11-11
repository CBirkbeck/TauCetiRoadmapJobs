<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13089#issuecomment-6790426052 -->
Review (codex) of d61585d

Verdict: needs_changes

1. **F01** (P1) The theta trace is not the adjoint with the stated scalar products

   **Location.** `packages/NonordinaryCMSpecialValues/README.md:552`: “the adjoint of this inclusion is the trace”. The scalar product is defined at line 546.

   **Claim.** For `a ⊂ b`, the inclusion `i:T_{r,b}→T_{r,a}` has adjoint `t_b=Σ_{l∈b/a}ψ(l)A_l`.

   **Witness.** Take `K=Q(√−7)`, `r=25`, `a=O_K`, `b=(5)⁻¹O_K`, and `h∈T_{r,b}` of norm one. Then `⟨ih,ih⟩_a=1`, whereas `⟨h,t_b ih⟩_b=25`. FINIS06 line 240 repeats the error.

   **Exact repair.** Keep the trace as the unnormalized sum, since that is the normalization used in the Shintani operators. Replace the adjoint assertion by `i*=t_b/[b:a]`. Explain that the normalized scalar products make inclusion isometric and that `t_b i=[b:a]·id`. Add the displayed index-25 example as a negative-control Check. The repaired equality is `1=25/25`; the primitive kernels, surjectivity and dimension `175−7=168` are unchanged. Do not divide the Shintani trace itself by the index.

   The integrand in (5) for a function on `C/b` is `b`-periodic. Integration over `C/a` multiplies the integral by 25, while the prefactor `1/N(a)` is 1/25 of the prefactor `1/N(b)`. Thus the norms agree. Each summand `ψ(l)A_l` fixes `h`, giving the second value. The printed page 772 was inspected: this is a source error carried into the new API, not an extraction artifact.

2. **F02** (P1) The split étale CM component is incorrectly called formal

   **Location.** `packages/NonordinaryCMSpecialValues/README.md:369`: “Each `G(v, 𝔭)` is a height-one formal `O_𝔭`-module (relative Lubin–Tate).” Lines 12 and 36 explicitly include split primes in §§2.1–2.6.

   **Claim.** Every prime component of the CM `p`-divisible group at every place above `p` is a formal Lubin–Tate group.

   **Witness.** At `p=5`, `K=Q(i)`, `y²=x³−x` has 8 points, trace −2 and ordinary reduction. Its two CM components have dimensions 1 and 0; the latter has five geometric 5-torsion points. KATO04 line 5502 says p-divisible.

   **Exact repair.** State relative height one for the `O_𝔭`-linear **p-divisible groups**, without asserting that all are formal. At a split ordinary place distinguish the connected dimension-one component from the étale dimension-zero component. Apply the height-one reciprocity statement to those actual components, with the zero coLie contribution on the étale component; retain the full split/inert/ramified prime range. Restrict the use of `LubinTateFormalModulesAndQuasiCanonicalLifts` §§2.1–2.2 to connected formal components and cite the general p-divisible/Tate-module interface of `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.8 and R07.1.12–R07.1.13 for the component carrier. Add the split example alongside the existing inert Check.

   For a canonical-pair instance use `f=(8)`, `g=(40)`, `p=5`, over `Q(i)(40)`: its curve has `j=1728`, so its geometric ordinary reduction has the same component dimensions. At the place with `i≡2 mod 5`, multiplication by `2+i` has tangent scalar 4, hence its degree-5 kernel is étale, with five geometric points; a finite connected formal kernel has one geometric special-fibre point. The repair gives height one to both components, dimensions `(1,0)`, and uses formal Lubin–Tate theory only on the first. Kato's pp.258–259 use p-divisible groups, not the false formal identification. The cited Lubin–Tate supplier's §2.1 explicitly concerns connected groups.

   The alternative supplier makes the distinction explicit at `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:1220,1243`: its formal equivalence requires connectedness, and its étale example has trivial formal completion.

## Previous findings, checked first

The preceding review and repair report were read before this pass. The following quotations are from `packages/NonordinaryCMSpecialValues/README.md`, unless another file is named. “Repaired” refers to the original defect, not a certification of every new assertion nearby.

| Previous finding | Repaired passage and location | Status and verification |
| --- | --- | --- |
| F01, Finis fraction | Line 644: “the pairing standing in the denominator”; also `2^{ν(D)} D^{−1/2}`. | Repaired. FINIS06 printed pp.787,789 were inspected. Valuations are `1/4`, not `7/4`; combining (13) and (15) yields the `D^{1/4}` factor. |
| F02, torsion basis and translated evaluation | Line 369: “`ξ` of `p^m β`”; “`θ_n(z) = {}_aθ_E(z − ν_n)`”. | Repaired for the original basis, point, translation and missing good-reduction citation. The expanded all-prime claim has the new defect R02. At level one: `8−7=1`, not `15` or `8`. |
| F03, unspecified descent | Line 348: “the tensor power taken over `K(f)`”; “`ψ(a)⁻¹ (η_a^*)^{⊗ r}`”. | Repaired. Source and target, isogeny pullback and semilinearity are specified. For `(9)`, `r=2`, the identity acts by `81/81=1`. |
| F04, canonical sign too narrow | Line 244: “odd fundamental discriminant `−D`”; “`W(φ) = W(φ̄) = (2/D)`”. | Repaired. `D=7,23` gives +1; `D=11,19` gives −1. ROHRLICH-NOTES Proposition 1.5, line 666. |
| F05, unequal central values asserted | Lines 362,393,423: “The two values may coincide”; the tests use `ζ_25` and `ζ_25⁻¹`. | Repaired. The characters differ, since `ζ_25²≠1`, while wrong-sign central values give `0=0`. No remaining numerical-inequality claim of this kind was found. |
| F06, quotient isomorphism reversed | Line 325: “via multiplication by `λ`, from `ℂ/λ⁻¹f` to `ℂ/f`”. | Repaired. `4·(3/4)=3≡0`, and `4·1≡1 mod 3`; multiplication by 1/4 fails. |
| F07, ideal value outside its domain | Line 153: “unramified at `p`”; “no value is asserted”. | Repaired. The order-5 character of conductor 25 has no ideal-character value at (5). Other uses at §§0.1,1.3,3.4 retain unramifiedness. |
| F08, Boxall provenance | Line 658 cites “Boxall 1992, Theorem 1, pp.1063–1066”; `sources.toml:169` records BOXALL92, waived. | Repaired. The single lifetime key and reference are present. FINIS06 line 1587 is the exact application. Access was not requested again. |
| F09, undetermined theta normalizations | Lines 546,560,573,587,610,628 supply transformation laws, spaces, operators, functional, pairings and integral generators. | Partly repaired. The old free rescalings are excluded and the fraction is corrected. The newly supplied adjoint law is false: R01. |
| F10, later package duplicates CM foundations | Line 12: “Sections 2.1–2.6 are stated in Kato's generality”; line 860 supplies the downstream interface. | Not repaired across packages; settled as **not actionable in this package**. The reason is correct: this is the earlier owner and cannot delete the later package's targets. Not re-raised or counted. |
| F11, inverse elliptic unit and signs | Line 314: “`_az_f = _aθ_E(α)⁻¹`”; line 331: “`z^θ_{p^∞f} = −z_{p^∞f}`”; line 381 carries `(−1)^{r−1}`. | Repaired in the stated normalization. KATO04 p.253 was inspected. The logarithms are `−12 log 3` versus `+12 log 3`; the second logarithmic derivative has leading coefficient −24, not +24. The BKO class now rationalizes to the theta-value element. |

The F10 witness remains `packages/ModularIwasawaMainConjecturesPartII/README.md:285,303,317,348,380,413`: those passages still construct the same CM objects. The order is 345 before 378. The supplied board index was read; it supplies no PR number for this locally readable package, and none is invented. The unsettled downstream deletion is not a new in-package finding. No other previous finding was marked not actionable.

## Verified sound

### Extent and principles

Read all 43 numbered targets, their APIs and Checks, the seven layers, summary, conventions, supplier contracts, references, metadata and the complete Lean file. Rechecked every previous finding and every changed construction; relied on previous computed rows only for unchanged material. The two findings above are the exceptions to the following positive results.

The build order follows dependencies: characters feed signs and CM classes; the independent theta branch feeds divisibility; divisibility feeds units; lattice bounds and Galois averages feed nonvanishing. No layer is named after a source chapter. “Following Finis” at line 523 fixes the two prime roles, rather than prescribing a source's organization. The own targets have APIs, Checks and source locators, and every layer ends with Examples and Dependencies. The shape was compared with `Completed/Chebotarev/README.md`, `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/ClassFieldTheory/README.md`.

No algorithm, copied source passage, `set_option`, sorry'd data, admitted example, `lemma` declaration, machine path, PR number, hand-off note or process chronology was found in the README or Lean file. Mathematical source-error explanations have a lasting purpose. No source file, package statement, design plan or merge-order file was changed. The scope remains repairable; it is not a re-planning of an existing roadmap.

### Sampled source locators

All 15 seeded targets were checked. No locator is flagged unverified by the author beyond the manifest's explicit version/access limits. Ten cached texts were readable; BOXALL92 remains waived. The table distinguishes a source theorem from a deduction using the named suppliers.

| Sample | Text and locator opened | Support and limits |
| --- | --- | --- |
| 0.1 | JIA24 line 126, Property 1, pp.3–4; line 155 | Equivariance and the rational-principal law agree. The subsequent inverse `n⁻¹` is a source slip; the roadmap correctly uses `κ(n)n`. The pinned principal-ideal law gives the archimedean convention. |
| 0.2 | JIA24 line 18, Introduction p.1; BKO21 line 482, p.953; native ring-class and Picard interfaces | Jia supplies the anticyclotomic ring-class family. The exact order/conductor shift is a derived target, not asserted to be Jia's theorem: Picard growth gives `c=n+1` only with `p∤h_K`. |
| 0.3 | AL.1.5.2/1.6.2 forwarding to AnalyticNumberTheoryPartI §2.3a; AL.5.1.1; native ideal/uniformizer law | The weight-one norm bound gives `Re(s)>3/2`, entire continuation and a nonzero deletion polynomial at the centre. These are supplier deductions, not a fabricated external theorem number. |
| 0.4 | BKO21 lines 404–413, §3.0.2, p.951 | Good model, differential, conjugate curve and principal lattice are present. The roadmap does not embed all of C into C_p. |
| 0.6 | BKO21 lines 388–395,435–438, pp.951–952 | Split l, exclusions and finite characters agree. Order and conductor are correctly separated in the roadmap despite the source's repeated m. |
| 1.2 | BKO21 line 394, p.951; GREENBERG83 lines 246–285, pp.245–246; AL.1.3.5 | BKO states preservation. The roadmap gives the local paired-Gauss-sum argument, so its broader class-number statement does not rely on Greenberg's class-number-one setting. |
| 1.4 | JIA24 lines 42–70, p.2; BKO21 lines 479–488, p.953; AL.5.3.2 | Self-duality, equal reindexed series and the sign force zero. No positive-sign converse is inferred. |
| 2.5 | KATO04 lines 5478–5527, proof of Proposition 15.9, pp.258–259; p.259 image | Basis, translated input, factorial and evaluation now match the calculation. R02 concerns the added formal-group assertion, which the source does not make. |
| 2.8 | BKO21 lines 422–432, (3.4), p.952; KATO04 lines 5463–5475,5530–5536 | Direct weights, conjugation on the CM character, deleted support and coefficient line agree with the chosen theta-value sign. |
| 2.10 | BKO21 lines 404–407 and 423–430, pp.951–952 | Scaling follows from the displayed period and reciprocity equality: a differential rescaling cancels in the vector-valued output. |
| 3.1 | BKO21 lines 435–454, pp.952–953 | Compositum, field/corestriction directions and group-algebra factors agree; the roadmap repairs the l-layer/conductor shift. |
| 3.4 | RUBIN87 lines 191–205, Lemma 3.1 and proof, p.409; JIA24 lines 126–148 | The inert eigenvalue is −p. The roadmap's equivariance argument supplies the stated generality; the arithmetic Tate convention is explicit. |
| 5.2 | FINIS06 lines 95–99,911–917, pp.769,788; BKO21 lines 491–507, pp.953–954 | Canonical ramification support excludes all inert ramification, so every required μ and b term is zero. |
| 6.1 | ROHRLICH84 lines 763–800, §3 Proposition 1, pp.401–402; lines 896–919, Proposition 2 proof, pp.404–405 | Nonzero forms, `qZ_p`, algebraicity, supported q and the exact strict exponent ranges agree. The stronger quantified second bound is in the proof. |
| 6.4 | JIA24 lines 66–100, Theorem 1, pp.2–3; AH05 lines 141–152, p.4 | Jia supplies arbitrary class number. AH05 gives the class-number-one parity illustration and explicitly excludes n=0 from its order-index formula. BKO §6.0.1 is contextual, not a replacement for Jia. |

Additional repaired locators checked: ROHRLICH-NOTES Propositions 1.5–1.6, lines 666–679, pp.14–15; KATO04 §§15.3–15.8 and (15.5.1), lines 5234–5436, pp.251–257; FINIS06 (3)–(6), (9), Propositions 2.2/2.4 and 3.4/3.6/3.7, Lemmas 3.1/3.3/3.5, pp.771–789. The printed images of FINIS06 pp.772,787,789 and KATO04 pp.253,259 resolved fraction and OCR ambiguities. FINIS06 lines 1134–1148 and 1221–1225 give the valuation deduction and eventual unit theorem. FINIS06 lines 1571–1598 give the component-relation torsion argument and its invocation of Boxall.

### Computed adversarial table

These are mathematical calculations, not a claim that elaboration proves the theorems. Assigned valuations used to test a transcription are explicitly distinguished from an asserted global-character example. Unchanged cases also occur as computed rows of the previous review; they were checked against the present statements. Zero rings, positive-characteristic coefficient fields and nonquadratic CM fields do not satisfy the relevant field/character hypotheses; empty P and q=0,1 were tested on the total Lean count.

| Statement | Instances tried | Computed values on the relevant sides | Result / change |
| --- | --- | --- | --- |
| 0.1 type, equivariance, norm | Q(i), norm-5 prime; inert 7; inverse and norm characters | `(-1+2i)(-1−2i)=5`; `φ((7))=−7=κ(7)7`; inverse `−1/7`, norm `49` | Correct; wrong types excluded. |
| 0.1 density/index | Powers of 1+i at conductor (1+i)^3 | Valuations run through Z; congruence units have valuation 0 | Infinite index is compatible with complex density. |
| 0.2 conductor family | Q(√−7), p=5; Q(√−31), p=3 | Ring class order at 5 is 6; order-5 and order-25 conductors have c=2,3. Unramified order-3 class character has c=0 | Class-number and trivial-character exceptions retained. |
| 0.2 ideal-value domain | Order-5 character at (5); odd unramified ν | (5) is not prime to (25); zero extension would give 0. In the valid domain `x²=1`, odd order gives x=1 | F07 repaired. |
| 0.3 Euler factor / central continuation | Inert 7 at s=1; deleted p=5 factor; arbitrary continuation assignments | Factor `7/8`, wrong sign `7/6`; deletion `6/5`, v5=−1. Without holomorphy F(1) can be 0 or 1; two entire continuations have difference 0 | No 0/0, wrong factor or free-value stand-in. |
| 0.4 integral period | ω→2ω at p=5; ω→5ω; nonprincipal ideal in Q(√−5) | A→A/2, valuation unchanged; A→A/5 lowers valuation by 1. Nonprincipal ideal class ≠ principal class | Néron and lattice conditions discriminate. |
| 0.5 auxiliary prime | K=Q(√−7), p=5; l=23,11,13 | −7 mod23=16; 23 mod5=3. 11 mod5=1 excluded. 6 mod13 is nonsquare | Split and congruence restrictions both used. |
| 0.6 auxiliary characters | l=23, r=1; trivial; direct evaluation | Degree 23, conductor 23²; trivial c=0; `[g]`→ζ23≠ζ23⁻¹ | Order and conductor indices separated. |
| 1.1 canonical sign | D=7,23,11,19 | Jacobi symbols `+1,+1,−1,−1` | Full odd-discriminant theorem, F04 repaired. |
| 1.2 auxiliary sign | Paired local characters; odd value on stable ideal | Gauss product `ν(−1)=1`; stable-ideal value has square 1 and odd order, hence 1; root-number ratio 1 | Correct local cancellation. |
| 1.3 parity | c=0,2,3; class-number-three example | Multipliers `1,1,−1`; unramified order-3 character multiplies sign by 1 | No false order-index rule. |
| 1.4 forced zeros | ε=+1,c=3; ε=−1,c=0 | `Λ(1)=−Λ(1)` gives `2Λ(1)=0`, hence L=0; deleted value E·0=0 | No converse for sign +1. |
| 2.1 theta refinement / norm | E=C/Z[i], a=(5), h=[5],[2]; a=(2−i), kernel E[2+i] | Divisor degrees 25−25=0; [5] pushes divisor to 0; [2] preserves it. Distinct split-prime kernels intersect in 0 | Kernel condition and degree distinction retained. |
| 2.2 pair and inverse unit | f=3, λ=4; f=2; a=5, χ=1 | 4·3/4=3≡0; (1/4)·3/4=3/16≠0; ±1 coincide mod2. L′=−log3/2, 24L′=−12log3 versus theta +12log3 | F06/F11 repaired. |
| 2.3 zeta smoothing/sign | Theta units versus standard units; two normalized candidates | Kummer inverse is negative, `z^θ+z=0`; ratio constants obey u³=u⁸=1, so u=1 | Smoothing does not erase the sign or define a second normalization. |
| 2.4 descent | f=8, a=9, r=2; principal rescaling λ | `81/81=1`, without normalization 81; `λ^r/λ^r=1` | Descent is specified, F03 repaired. |
| 2.4 realizations | r=1,2; inert7; finite idele component6 | Filtration dimensions 2,1,0; dual Frobenius −1/7, twisted −7; numerator 6²=36 versus wrong 6 | Tensor bases, inverse action and exponent agree. |
| 2.5 translated ERL | Q(i), p=7, g=56, m=1; r=1,3 | ξ1=8, α1=1, ν1=7; 8−7=1; plus gives15. Scalars 1/7 and factorial 1/2. `ξ^(−r)=7^(−r)β^(−r)` | Original F02 repaired. |
| 2.5 all prime components | Split p=5, j=1728; i≡2 mod5 | #E(F5)=8, trace−2, slopes0,1; [2+i] tangent4, étale kernel has5 geometric points; connected formal kernel has1 | R02: use p-divisible components, dimensions0,1. |
| 2.6 reciprocity sign | a=5, r=1,2 near origin | dlogθ has 24/z; second derivative −24/z², versus E2-combination +24/z²; sign factor at r2 is−1 | Newly stated derivative sign is necessary in this normalization. |
| 2.7 integral class | α≡2 or1 modp, p≥5 | α(ᾱ−1)≡2 or0; the former is a unit, latter not | Projected integrality proof uses a unit; full lattice is a separate target. |
| 2.8 direct-character law | χ(g)=ζ25; forced zero c3; trivial p-character | Direct/inverse weights ζ25 and ζ25⁻¹ differ; corresponding central values may both equal0; p5 deletion6/5 | F05 repaired; orientation tested before scalar cancellation. |
| 2.9 twist | Scalar action φ(g)=a on T; dual coefficient | Diagonal action on x⊗t∨ is gx⊗a⁻¹t∨; omitting coefficient gives gx⊗t∨ | Correct inverse twist, conditional on named gap. |
| 2.10 period laws | ω→2ω, Ω→2Ω; Ω→−Ω | `(A/2)(2ω)=Aω`, γ fixed; second change γ,z,A all negate | Correct vector/scalar distinction. |
| 3.1 composita | p5, n0,1; l-character order23 | Local degrees24,600; ray exponent at l is2, field degree23 | Finite levels and inclusions agree. |
| 3.2 disjointness | Intersection degree l^j dividing h; coprime-degree trap p5 | l∤h forces l^j=1; 3 divides24, showing degree coprimality is not the argument | Ramification proof used. |
| 3.3 splitting | h=2; L-layer degree l^r | Number of local factors2l^r; augmentation(x,y)=x+y versus projection x | Semilocal sum and direct evaluation retained. |
| 3.4 Frobenius | p5 | Norm25, trace−10, points36; wrong +5 gives trace10, points16 | Negative parameter agrees across suppliers. |
| 3.5 Lubin–Tate | p5, n0,1; alternating bases | Degrees24,600; μ25 degree20 divides600. `[−p]((-1)^(n+1)P)=(-1)^n[p]P` | Sign and index conversion correct. |
| 4.1 local invariants / norm twist | ζℓ on units; unramified; z=i | μ=1/(ℓ−1), unramified μ=0; conjugated norm twist=i, unconjugated=−i | Finis type and local support agree. |
| 4.2 theta transformation | Q(√−7), r1,25; l=1,l′=(1+√−7)/2 | Dimensions7,175,7; ψ-values−1,1,1 and cocycle−1 give `1=−(−1)(1)`; trivial ψ would require1=−1 | Wrong semicharacter and negative δ excluded. |
| 4.2 adjoint | r25,a=O,b=(5)⁻¹O, unit-norm h | Inclusion norm1; trace25h; adjoint pairings1 and25; averaged trace gives1 | R01. |
| 4.2 primitive/family spaces | d25 and5, inert5; h=1 | Primitive dimensions175−7=168 and35; family symmetry requires even functions | Primitive/full and independent-component wrong models excluded. |
| 4.2 Shintani normalization | Split prime2 in Q(√−7) | E⁻E=2; γγ̄E⁻E=(1/2)²·2=1/2=λ((2)); omission gives2 | γ normalization fixed. |
| 4.2 functional / Yang | h=1 and3; l→5l; K=Q(√−7) | One versus three summands; valuation shift1 and squared numerator×25; Yang constant√7/π | Component sum fixes the functional. |
| 4.3 pairings / integral generators | iϑ; 5ϑ; rDN(a)=7 | b(iϑ1,ϑ2)=i b; hermitian value−i b. Scaling5 shifts l-valuation1 and pairing2; `G⊆Tint⊆7⁻¹G` | Bilinearity and primitive integrality discriminate. |
| 4.3 valuation identities | Diagnostic vW=vD=0,vb′=3/4,vEuler=1; general D | Fraction1/4 versus product7/4; D exponents−1/2+1/4=−1/4, cancelled by D^(1/4) | F01 and its second occurrence repaired. |
| 4.4 torsion relations | β0=(1,1),β1=(2,1) | Bar-relations `(x,−x)` cut out diagonal dimension1; relations on full pairs would give dimension2 | Correct component convention; primary theorem access waived. |
| 4.5–4.6 Finis headline | K=Q(√−7), valuation5, primitive l-value unit | v5(l/w)=0, μ=0,b5=0,v5(D)=0; total valuation0 | Eventual equality follows; no arbitrary small-level unit assertion. |
| 5.1 family | Prime normQ, s0 versus s1 | `1−(φ̄ν/Q)Q^0=1−φ̄ν Q⁻¹`; opposite norm twist shifts centre to−1 | Primitive Euler factors match. |
| 5.2 inert corrections | Canonical support at ramified primes; ν only at split23 | Every inert conductor exponent0; all μ5=0,b5=0 | Seeded assertion supported. |
| 5.3 deletions | ν≠1 at23; inert5 | Both 23-factors1; p-polynomial6/5, valuation−1 | Auxiliary and p-deletions separated. |
| 5.4–5.5 unit headline/witness | D7,p5,l23; orders23^r | v5(7^(1/4))=0; final value valuation0 outside finite set; conductors23^(r+1) are unbounded | Finite exception set yields nontrivial witnesses. |
| 5.6 coefficients | X^d−u with unit u,p∤d; compare d=p | Derivative at a unit root has valuation0 versus1 | Unramified coefficient argument retains coprimality. |
| 5.7 tensor kernels | Totally ramified F, unramified U; compare F=U | Allowed degree product, kernel0; wrong case `a⊗1−1⊗a≠0` maps to0 | Injectivity hypotheses discriminate. |
| 6.1 vanishing headline | P={5},α=β=1,q25,c2/5 | t≈3.6239; box −3…3; nonzero multiple of25 cannot occur; count0 | Consistent with eventual claim. |
| 6.1 power bound headline | Same data,d11/20,s7/16 | t≈5.8731, count0; 3/8<7/16<1/2; `0<25^(7/16)` | Exact strict range retained. |
| 6.1 boundaries | α5=5,β5=0,t1; P empty; q0,1 | q5 count6; q25 count0. Empty P gives box cardinal, but supported positive q only1; threshold2 excludes it. For nonempty P, q0 forces form0 and nonzero, count0 | No total-function counterexample to eventual statements. |
| 6.2 average headline | K=Q(√−7),support{5}; r<1/2,2r<a | Limit `(12/5)L(1,κ)≠0`; identically vanishing orbit average0; middle exponent r−a/2<0 | Correct limit and contradiction. |
| 6.3 Galois transport | σ(ζ25)=ζ25² fixing K; complex conjugation on Q(i) | Order25 and c3 preserved, zeros0→0; conjugation i→−i does not fix K | Distinct actions not conflated. |
| 6.4 nonvanishing headline | Correct-sign family and wrong-sign c3 | Vanishing orbit average0 contradicts nonzero limit; wrong-sign central value remains0 | Almost-all scope, no derivative claim. |
| 6.5 parity headline | Orders1,5,25,125; p3; wrong ε | c=0,2,3,4; signs+,+,−,+; wrong ε puts infinitely many zeros in claimed finite exception set | Existential sign constrained; no class-number or p≥5 narrowing. |

### Lean acceptance test, binders and padding

The summary's end theorems are the BKO almost-all unit theorem and the parity dichotomy. Other deep deliverables are Kato reciprocity and the integral class, torsion/ring-class disjointness and CM Lubin–Tate comparison, root-number formulas, Finis's weight-one theorem, Jia's average and nonvanishing, and Rohrlich's two estimates.

`Suggested.lean:130,140,166` states the two Rohrlich estimates and the parity dichotomy. The module docstring names the other headline groups and the absent period, CM attachment/torsion, local-root-number, cohomology, regulator and coefficient-transport carriers. It correctly recognizes that ring class fields themselves are native. The nonvanishing endpoint is included in the dichotomy. No statable headline was replaced by a free predicate or omitted in favour of an easier claim.

Ran the prescribed `lake env lean` on the package file from the pinned content checkout: exit 0, with only three `declaration uses 'sorry'` warnings. Both Tau Ceti imports have object files; no targeted build was needed. On a scratch copy checked `#check @name` for all ten public declarations and the local `factPrime` instance. Exit 0, only the same warnings. The types retain the CM/quadratic assumptions, odd prime, inert prime ideal, both unramifiedness conditions, odd finite twist and normalized uniformizers. No binder disappeared. The supplied signature report's two spurious entries, `)` and `fields`, came from docstring parsing and are not declarations.

Probed **all three** admitted theorems on another scratch copy with closing branches `simp`, `rfl`, `infer_instance` and `exact?`. Each remained unproved; each final diagnostic was “could not close the goal.” Read the native definitions and library near-matches as well. The three targets are not definition restatements, Checks, boundary cases or one-lemma duplicates. No padding finding. The probe is evidence against these simple proof routes, not a proof of the headlines.

All ten public Lean identifiers occur in the README. The backticked imported identifiers resolve at the pins or in the named supplier. Mathematical formulas such as `T_{r,a}` and `z^θ` are notation, not asserted Lean declaration names. The only imports are `Mathlib` and the two used individual Tau Ceti Hecke-character modules.

### Library and ownership audit

Opened these definitions at the pins, rather than relying on near-match summaries:

| Pinned file and line | Definition or comparison |
| --- | --- |
| `Mathlib/NumberTheory/NumberField/Basic.lean:102`; `ClassNumber.lean:65` | Integers are integral closure; class number is finite class-group cardinality. |
| `Mathlib/NumberTheory/NumberField/CMField.lean:70,142,154`; `Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean:666` | CM, conjugation, embedding law; degree two over Q is a separate hypothesis. |
| `Mathlib/RingTheory/FractionalIdeal/Basic.lean:83`; `DedekindDomain/Ideal/Lemmas.lean:490`; `Ideal/Norm/AbsNorm.lean:262` | Fractional ideals; height-one primes exclude the zero ideal; absolute norm is total but the finite-prime domain avoids its zero case. |
| `Mathlib/Algebra/MonoidAlgebra/Basic.lean:231,250` | `lift` and `lift_single`: singleton evaluates to b•F(a), without inversion. |
| `Mathlib/RingTheory/LinearDisjoint.lean:233` | `Subalgebra.linearDisjoint_iff_injective`, cited instead of re-planned. |
| `Mathlib/NumberTheory/LSeries/Nonvanishing.lean:412` | Nontrivial Dirichlet character nonvanishing at 1; not a Hecke-twist nonvanishing theorem. |
| `Mathlib/NumberTheory/Padics/PadicIntegers.lean:71`; `PadicNumbers.lean:545` | Native p-adic integers and numbers; primality is retained. |
| `Mathlib/RingTheory/Algebraic/Defs.lean:45`; `Mathlib/Data/Set/Card.lean:643` | Algebraicity uses a nonzero polynomial; ncard is encard.toNat, so finite boxes matter. |
| `Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:107`; `Mathlib/Analysis/Calculus/FDeriv/Defs.lean:172` | HasProd is convergence of finite products; Differentiable is pointwise everywhere, giving the entire-function condition. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70,80` | Continuous idele-class homomorphism to C×; finite order is separate, unitarity is not built in. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/FiniteComponent.lean:85,181,254,270` | Local component, conductor exponent, finite conductor and nonzero conductor. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean:120,155,200` | Prime-to-conductor domain, uniformizer comparison and principal-congruence law. |
| `TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:98,316,498`; `RayClass/Basic.lean:87` | Modulus, congruence on K×, prime-to-modulus ideals and principal membership. |
| `Mathlib/RingTheory/ClassGroup/Basic.lean:48` | Native `toPrincipalIdeal`. |
| `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:111,155,178,214,222,251` | Ring class field, unramifiedness, Artin/Pic equivalence, arithmetic Frobenius, degree and splitting iff generated by an order element. No CM elliptic attachment is supplied by these declarations. |

Object searches covered anticyclotomic characters, CM theta units/divisors, canonical pairs, zeta classes, root numbers, period/regulator maps, torsion/ring-class fields, Shintani operators and Rohrlich counts in the pins, main, board packages and open-head roadmap tooling. The Loogle/LeanSearch leads were compared with actual declarations: `MulChar.star_eq_inv` at `Mathlib/NumberTheory/MulChar/Lemmas.lean:73` needs a finite unit group; `DirichletCharacter.LSeries_eulerProduct_hasProd` at `Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean:114` concerns rational Dirichlet characters; `Int.Ioc_filter_dvd_card` at `Mathlib/Data/Int/CardIntervalMod.lean:70` counts a one-dimensional interval. None proves a headline here.

The open-head search's other Shintani hits concern base-change characters, cubic-order zeta functions or half-integral-weight lifts, not Finis's U(1) theta representation. The closest open roadmaps were read: KatoEulerSystems #1804 owns modular-curve classes; AnticyclotomicLocalUnits #1692 owns the local projections and signed theory; ComplexMultiplicationAndExplicitReciprocity #1254 owns the attached character and CM comparison inputs; CMRankZeroConverse #1744 owns the converse; ModularIwasawaMainConjectures #1499 owns the main-conjecture comparisons. Their scopes do not give another owner to these Finis/Rohrlich results. The known board-only CM duplication is the settled F10 item above. No collision of the ten public fully qualified Lean names was found.

### Resolved supplier citations, overlaps and order

Every Needs line and supplier contract was read. The resolver's sole missing-roadmap lead is false: `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:605,635,657,688,1066,1101` contains exactly §§2.1–2.4 and 4.3–4.4. It is in the supplied order immediately before this package. Its connected formal-group scope is material to R02.

| Supplier | Current citation evidence |
| --- | --- |
| ComplexMultiplicationAndExplicitReciprocity #1254 | `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md:372,453,595,638,642,646,670,674,688,699,703`: periods, torsion dictionary, ray fields, attached character, components, Frobenius, all-prime factors, induction and canonical existence/reduction. The general theta-series input also has GL2 induction; rational-curve examples are not treated as general Frobenius proofs. |
| AutomorphicLFunctionsAndLocalFactors #924 | `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:25,27` explicitly forwards AL.1.5.2/1.6.2 to AnalyticNumberTheoryPartI §2.3a. AL.1.1.1 at 651; AL.1.3.1/4/5 at 900,973,1004; AL.5.1.1/5.3.2 at 2379,2448. No broken id. |
| ArithmeticGaloisRepresentations #856 | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:2398`, root-number product; the global additive-character change has multiplier1. |
| SelmerIwasawaCohomology #869 | `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:222,236,250,264,1468,1492`, §§0.8–0.11,3.6,3.7. Finite-S Kummer and cyclotomic twist are present; general character twisting is explicitly a gap. |
| PadicHodgeRegulators #1498 | `TauCetiRoadmap/PadicHodgeRegulators/README.md:523,572,646`, §§1.4,1.7,1.11: Fil⁰ dual exponential, twist/trace and semilocal comparison. These do not identify an étale group with a formal one. |
| ModularSymbolsPadicLFunctions #968; GL2AutomorphicRepresentationsAndTransfer #931 | `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:1380,2520`; `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:2692`. Algebraic critical coordinates, their transport and quadratic induction. |
| PadicFamilies #1019; NoncommutativeAndEquivariantIwasawa #1307 | `TauCetiRoadmap/PadicFamilies/README.md:2364`; `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:2064`. Integer theta normalization is imported; ordinary rational-CM Siegel normalization is distinguished. |
| NeronModelsAndSemistableAbelianVarieties #852 | `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:3109`, §5.1, henselian DVR and prime-to-residue-characteristic Tate criterion. |
| Main analytic/Diophantine inputs | `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:953,1035`; `Completed/ArithmeticDirichletSeries/README.md:190,237`; `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:1356`. Finite-place subspace estimates, ideal counts and normalized Hecke continuation. |
| Main field/curve inputs | `Completed/GlobalNumberFields/README.md:508,531,571`; `TauCetiRoadmap/ClassFieldTheory/README.md:1924,2128`; `Completed/Chebotarev/README.md:410`; `Completed/LocalFieldsRamification/README.md:576,724`; `TauCetiRoadmap/EllipticCurves/README.md:423,647,683`. All cited layers resolve. |

The supplied overlap report has no conflicting head, dropped cited id or revision-only citation; the actual sections and the closest scopes were checked. AnticyclotomicLocalUnits' older NCM design labels are not ids newly dropped in this repair. No new overlap finding is inferred from that existing coordination issue.

The prescribed dependency command, with movable placement, produced:

```text
depcheck: 237 roadmaps, 2148 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No forbidden supplier is consumed.

Both declared gaps agree verbatim in substance between the README contracts and `packages/NonordinaryCMSpecialValues/design/plan.json:1892`: `al-local-frohlich-queyrut` has AutomorphicLFunctionsAndLocalFactors AL.1 as owner; `sic-character-twist` has SelmerIwasawaCohomology §3.7 as owner. They state a single precise missing comparison each, with their hypotheses and finite-S completion. The supplied cyclotomic twist is narrower. Neither is treated as unowned or raised as a finding. This needs-changes verdict does not claim conditional acceptance.

## Not verifiable

- BOXALL92, Theorem 1, pp.1063–1066: the primary text was not read; its access is explicitly waived. FINIS06's invocation and the component-relation application were read. No missing-source request was made.
- The published JIA24 version was not read. The checked locators are arXiv v1, as the manifest says. AH05 uses the recorded arXiv v2 pagination.
- A numerical example and a passing Lean elaboration do not prove the three admitted theorems. The analysis above verifies their sources, hypotheses, conventions and nontriviality; it does not claim completed formal proofs.
- The board index supplies no PR/head identifier for the locally readable Lubin–Tate and ModularIwasawaMainConjecturesPartII packages. Their local files and merge-order entries were checked, without claiming an unavailable branch comparison. Available open heads were checked through the prescribed tools.
- No additional source needed fetching; `sources.toml` was left unchanged. There is no outstanding source-access request.

## Source issues

- **Error** in FINIS06 at §2, equation (5) and the trace paragraph, printed p.772: the source says the unnormalized trace is the inclusion's adjoint; it should be the trace divided by the lattice index for scalar product (5); affects a stated result.
- **Error** in KATO04 at (15.4.2), printed p.252: the source says every CM isogeny norm preserves the smoothing function; it should require the kernel to meet the smoothing torsion trivially; affects a stated result.
- **Misprint** in KATO04 at the proof of Proposition 15.9, printed p.258: the source subtracts α from ξ but translates by plus that difference; it should translate by the negative difference to evaluate at α; affects the proof.
- **Error** in KATO04 at Proposition 15.9 and its proof, printed pp.258–259: the source identifies the theta-value input with the standard-unit zeta input; it should account for inversion as negation of the Kummer class; affects the proof.
- **Misprint** in KATO04 at (15.9.1), printed pp.259–260: the source omits the derivative parity factor in the stated period normalization; it should retain `(−1)^(r−1)` for the theta-value logarithmic derivative; affects the proof.
- **Misprint** in BKO21 at §3.0.2, printed p.952: the source uses the same exponent for character order and ray conductor; it should use conductor exponent m+1 for nontrivial order l^m; affects a stated result.
- **Misprint** in JIA24 at the rational-principal formula before (2.1), p.4: the source gives κ(n)n⁻¹ for the ideal character; it should give κ(n)n; affects the proof.
- **Misprint** in JIA24 at (2.43), p.10: the source gives a positive exponential in the tail bound; it should give exp(−N(a)/(Af)); affects the proof.
- **Misprint** in JIA24 at §4 before Proposition 5, p.18: the source imposes congruence modulo Z_p; it should impose congruence modulo qZ_p; affects a stated result.
- **Misprint** in JIA24 at (4.9), p.20: the source bounds the box by q⁻¹; it should bound it by q^c; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d61585d78b970a85232b619174b6ac788182dd34", "job": "REV-PKG-NonordinaryCMSpecialValues~4", "model": "gpt-6-astra", "worker": "chris-4"} -->
