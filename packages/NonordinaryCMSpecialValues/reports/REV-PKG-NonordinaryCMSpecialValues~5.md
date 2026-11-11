<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13089#issuecomment-6792050103 -->
Review (codex) of eaec275

Verdict: needs_changes

1. **F01** (P1) The theta system has a zero initial value

   **Location.** `packages/NonordinaryCMSpecialValues/README.md:377`, §2.5: “For `n ≥ 0` let `α_n`” and “`ξ^{⊗(−r)} ⊗ (θ_n(ξ_n))_n`”. The related canonical-pair sequence is at line 339.

   **Claim.** These evaluations give a norm-compatible system of multiplicative units, hence Kummer classes, including the specified initial index.

   **Witness.** Set `K=Q(i)`, `p=7`, `f=(7)`, `f_0=O_K`, `m=1`, `g=(7)`, `a=(5)`. Then `α_0=ξ_0=ν_0=0`, and `θ_0(ξ_0)=0`, since its order at zero is `25−1=24`.

   All the displayed ideal and unit-injectivity hypotheses hold: the four Gaussian units remain distinct modulo 7 and `(5)` is prime to `6·7·(7)`. On `E(C)=C/7Z[i]`, the rational class β is 1, so `α_0=7 mod 7=0`; also `E[p^0]=E[1]={0}`. Zero has no multiplicative Kummer class. It cannot be repaired by assigning it the additive zero class: field norms of nonzero theta evaluations remain nonzero. KATO04 line 5491 states the norm relation for `n≥1`, and the displayed system near KATO04 line 5523, printed p.259, explicitly has `n≥1` (the printed page was inspected).

   **Exact repair.** State the unit/Kummer system on a cofinal tail, for example `n≥m≥1`, where the point has annihilator `p^n f_0` and the canonical-pair hypotheses hold. Use its actual finite levels `K(p^n f_0)`; identify their inverse limit with the tower `K(p^∞f)` by cofinality. If the notation `K(p^n f)` is retained, explicitly reindex the evaluations to match those levels. Extend to earlier finite layers by corestriction, not by evaluation at zero. Apply the same cofinal convention to §2.3 wherever `p^n f` does not yet admit a canonical pair. Keep the evaluation at `α_m` and the scalar `p^(−mr)` unchanged. Add the unit-ideal `f_0` example as a negative-control Check.

   **Repair tested.** In the witness, the tail starts at `n=1`: `α_1=1 mod 7` has exact annihilator `(7)`, and `α_2=1/7 mod 7` has annihilator `(49)`. Neither lies in `E[5]`, so both theta evaluations are finite and nonzero. Their fields are `K(7)` and `K(49)`, with degrees 12 and 588 over K and transition degree 49. These are the canonical levels to which §2.2's norm law applies. No prime or CM field is excluded by this repair.

2. **F02** (P2) The local sign calculation uses the opposite additive character

   **Location.** `packages/NonordinaryCMSpecialValues/README.md:252`, §1.1: “in the standard additive character the archimedean factor is `−i`”. The standard factors are fixed to AL.1 at line 40; line 259 discusses changing conventions.

   **Claim.** The displayed local factors are those of the roadmap's declared standard additive character.

   **Witness.** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1006`, open #924, gives `i^max(a,b)`. For `φ_∞(z)=z⁻¹`, `(a,b)=(1,0)`, its value is `i`, whereas §1.1 says `−i`.

   ROHRLICH-NOTES line 1618 gives the negative-power convention; line 1844 defines its archimedean additive character with the negative exponential. AL.1.3.5 uses the positive exponential and explicitly gives `+i` for angular weights ±1. Thus Rohrlich's calculation is valid, but it has not been labelled as a calculation in a different convention. The later Check about changing every local character does not make the preceding assertion about the standard factors true.

   **Exact repair.** Label the displayed `−i` and ramified factors as Rohrlich's negative-exponential normalization. Then transport the entire family to AL.1 by `ψ_v(x)↦ψ_v(−x)`, multiplying each local factor by `φ_v(−1)`. State the resulting archimedean factor `+i` and retain the global formula `W(φ)=(2/D)`. Alternatively give all the local factors directly in AL.1's normalization. Add the two-place computation below to the Check, rather than changing only the infinite factor.

   **Repair tested.** For canonical `K=Q(√−7)`, Rohrlich's factors at infinity and 7 are `(-i,i)`, product 1. Both character values at −1 are −1, so AL.1's pair is `(i,-i)`, also product 1. Mixing the two conventions gives `(i,i)` and product −1. The headline canonical-sign formula and the parity theorem need no change.

3. **F03** (P3) Inverting a quadratic character does not reverse its sign

   **Location.** `packages/NonordinaryCMSpecialValues/README.md:145`, §0.1 Check: “The wrong sign `+7` is the law of the inverse quadratic character”.

   **Claim.** Replacing the quadratic character by its inverse produces +7 at the inert prime 7 of Q(i).

   **Witness.** `κ_K(7)=−1`, so `κ_K(7)⁻¹=−1` and `κ_K(7)⁻¹·7=−7`, not +7. Inverting the entire Hecke character instead gives `−1/7`.

   **Exact repair.** Describe +7 as the result of omitting the quadratic factor, or simply as the incorrect positive Frobenius sign. Retain the computed equality `φ((7))=κ_K(7)·7=−7`.

   **Repair tested.** Omitting κ gives `1·7=7`; retaining it gives `−1·7=−7`; inverting κ still gives −7. The revised Check distinguishes the intended wrong model.

Three findings: one P1, one P2 and one P3. Both findings of round 4 are repaired on their original counterexamples. The new findings concern an initial-level Kummer input, the stated local epsilon convention, and one incorrect negative-control explanation. The package sources were not edited.

## Previous findings, checked first

| Round-4 finding | Repaired passage in `packages/NonordinaryCMSpecialValues/README.md` | Status and independently recomputed witness |
| --- | --- | --- |
| F01, trace versus adjoint | Line 563: “the adjoint of the inclusion is `i* = [b : a]⁻¹ t_b`, not `t_b`”. | **Repaired.** For `r=25,a=O_K,b=(5)⁻¹O_K,D=7`, the integral multiplies by 25 and its normalizing prefactor divides by 25. Inclusion norm is 1; trace sends h to 25h; adjoint sends it to h. The new Check at line 568 gives `1=25/25`. |
| F02, split component incorrectly formal | Line 377: “it is not formal in general”; “`G(v, 𝔭̄)` is étale of dimension zero”. | **Repaired.** On `y²=x³−x` over F₅ there are 8 points and trace −2. At `i=2`, `2+i=4` and `2−i=0`; the respective geometric kernels have 5 and 1 points. The étale component has coLie=0 and the twisted dual has Fil⁰=0. Both sides of its reciprocity identity are zero. |

The new proofs adjoining these repairs were checked, not just their concluding sentences. For the theta repair, `b⊆a*`, the finite unitary action, invariants, surjectivity and unchanged primitive kernels agree; the unnormalized Shintani trace remains essential. For the CM repair, the connected Tate submodule has rank 0 or 2 over Z_p at a nonsplit prime, and positive dimension rules out rank 0; at a split prime the two components have heights `(1,1)` and dimensions `(1,0)`. The new FiniteFlat supplier citations resolve at their present head.

Pattern searches found no other unnormalized-adjoint assertion and no other claim that a split étale CM component is formal. The uses in §§0.4 and 3.5 concern inert primes. R01 is a different defect in the expanded §2.5, exposed by its permitted `f_0=O_K` case.

The earlier F10 downstream duplication remains settled as not actionable in this package. Its reason still holds: this package is the earlier owner. `packages/ModularIwasawaMainConjecturesPartII/README.md:285,303,317,348,380,413` still constructs the CM theta function, pairs, units, zeta element and realizations. The merge-order positions are 345 and 378. No deletion in the earlier owner is requested; this is not a re-raised or counted finding.

## Verified sound

### Coverage and principles

Read all 43 numbered targets, seven layers, APIs, Checks, conventions, supplier contracts, references, the complete Lean file, metadata and the 11-entry source manifest. Read the previous review and repair report first. For unchanged passages, reused the previous review's **computed** adversarial rows after comparison with the present statements; its prose assurances were not treated as calculations. The new table below covers every seeded target, all headline families, both repaired targets and all new findings. The three findings above are exceptions to the positive conclusions recorded here.

The package develops the stated library rather than replanning an existing roadmap. Its all-prime Kato branch retains split, inert, ramified, dyadic and triadic primes; the later BKO specialization retains its source hypotheses. The layer order is supported by dependencies: character and CM constructions feed local and special-value comparisons, the theta branch independently feeds divisibility, and the counting/average branch feeds nonvanishing. No source chapter is used as a layer name. The phrase about following Finis fixes the two prime roles, not the order of the roadmap.

All seven layers have Examples and Dependencies. Definitions have API blocks and multiple discriminating Checks; theorem statements carry hypotheses and source or supplier locators. The shape was compared with `Completed/Chebotarev/README.md`, `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/ClassFieldTheory/README.md`. No computational algorithm, copied source passage, process chronology, machine path, PR number, HTML anchor, `set_option`, admitted data, admitted example, `lemma` declaration or diagnostic command was found in the package README/Lean. No source entry was rewritten or added.

### Seeded source sample

All 15 requested targets were checked against the cached texts and current supplier contracts. The author flags no further unverified locator beyond the explicit access/version limits below. The page references below are printed pages unless a preprint page is specified.

| Target | Text opened | Verification |
| --- | --- | --- |
| 0.1 | JIA24 line 126, Property 1, pp.3–4; lines 138–155 | Rational-principal and conjugation laws agree; the inverse exponent later in the source is a misprint. R03 concerns the README's explanation, not the theorem. Native principal-ideal and infinity conventions were also checked. |
| 0.4 | BKO21 lines 404–413, §3.0.2, p.951 | Smooth model, Néron differential, conjugate curve and principal period lattice agree. The algebraic avatar is separated from the complex period; there is no map from all of C to C_p. |
| 0.6 | BKO21 lines 388–395 and 435–438, pp.951–952 | Split auxiliary prime, exclusions and finite anticyclotomic family agree. The roadmap correctly distinguishes field/order exponent r from conductor exponent r+1. |
| 1.1 | ROHRLICH-NOTES lines 666–679, Propositions 1.5–1.6, pp.14–15; lines 1618,1660,1844 | Odd-discriminant sign theorem and even-discriminant contrast agree. The local normalization needs R02; the global Jacobi-symbol formula is unchanged. |
| 1.2 | BKO21 line 394, p.951; GREENBERG83 lines 246–285, pp.245–246; ROHRLICH-NOTES lines 1618–1642 | BKO states preservation. The paired local Gauss-sum proof plus AL.1 supplies the arbitrary-class-number formulation; Greenberg's class-number-one setting is not silently generalized. |
| 2.6 | KATO04 lines 5463–5475 and 5495–5536, Proposition 15.9/proof, pp.258–259; §§15.4–15.8 | Source/target, direct finite-character weights, inverse action, tensor powers and deleted support agree. The roadmap's theta-versus-unit and derivative signs are explicit corrections. Its proof input §2.5 needs R01. Printed p.259 was inspected. |
| 2.9 | BKO21 lines 433–435, equation (3.5), p.952; SelmerIwasawaCohomology §3.7 | Diagonal inverse-character twist agrees. The general character-twist prerequisite is expressly a declared gap; finite-S completion is retained. |
| 3.3 | BKO21 lines 440–464, pp.952–953; native ring-class splitting criterion | The two regular group-algebra factors, direct ν-evaluation and H-augmentation agree. Splitting comes from the rational generator p in the order, with conductor prime to p. |
| 4.5 | FINIS06 lines 1221–1225, Theorem 4.1, p.795; lines 1571–1598, Lemma 4.5, p.803 | Quantifiers are uniform at sufficiently large m; the tower prime is odd and split, distinct from the reduction prime. The stated torsion-relation route matches the proof. |
| 4.6 | FINIS06 lines 101–122, Theorem 1.1, p.769; lines 1134–1148, p.794 | Both valuation-prime cases, weight one, discriminant fourth-root, split Gauss factor, finite exceptions and exceptional lower-bound case agree. |
| 5.1 | FINIS06 lines 61–70 and 101–119, pp.768–769; BKO21 lines 491–507, pp.953–954 | The norm twist has infinity component z, type (−1,0), and shifts L(0) to L(1). Positive sign follows from §§1.1–1.2, rather than from the norm twist alone. |
| 5.5 | BKO21 lines 501–511, proof of Theorem 3.4, p.954 | Cofinitely many unit values supply a nontrivial witness. The arbitrarily-large-conductor strengthening follows from the distinct orders in X_l. |
| 5.6 | BKO21 lines 503–507, p.954; KATO04 lines 5463–5475, p.258; §§2.8,3.3 | BKO's sentence gives a finite coefficient extension; unramifiedness is the roadmap's extra deduction. Prime-to-p class-group exponents, roots of unity and the p-unramified ray level justify that deduction. |
| 5.7 | BKO21 §2, pp.948–949, and lines 440–464,503–507; Mathlib linear-disjointness theorem | The tensor-injectivity assertion is a deduction using total ramification versus unramified coefficients, not a purported verbatim BKO theorem. The ramified-coefficient counterexample is retained. |
| 6.5 | JIA24 lines 38–70 and 92–100, Theorem 1, pp.2–3; BKO21 lines 479–488, p.953 | Correct-sign almost-all nonvanishing has no class-number-one restriction. The wrong-sign half follows from conductor parity and the functional equation. Both parity families are infinite by ring-class growth. |

Also checked the changed theta normalization at FINIS06 lines 194–240, pp.771–772, and its effect on (13)–(15), lines 862–940; the Kato basis and translation at KATO04 lines 5478–5494; and the two admitted counting bounds at ROHRLICH84 lines 763–800 and 896–915, pp.401–405. All cited works have a single lifetime manifest key. BOXALL92's waiver was respected.

### Computed adversarial table

These are tests of statements, conventions and hypotheses, not formal proofs of the deep theorems. Valuation assignments used to test an identity are identified as such; they are not claimed to realize a global Hecke character. Unchanged auxiliary cases also have computed rows in round 4.

| Statement | Instances tried | Values computed on the two sides / competing models | Result and required change |
| --- | --- | --- | --- |
| 0.1 equivariance/type | Q(i), norm-5 prime, inert 7; inverse/norm models | `(-1+2i)(-1−2i)=5`; `κ(7)7=−7`; inverse character gives `−1/7`, norm character 49 | Predicate separates the models. Inverse quadratic character still gives −7: R03. |
| 0.1 congruence/infinity | `(1+i)^n`, modulus `(1+i)^3` | Valuations n versus 0 for congruence units; pairwise distinct cosets | Infinite index does not contradict complex density. |
| 0.2 conductor/parity | Q(√−7), p=5; Q(√−31), p=3 | Ring-class order at 5 is 6; order 5/25 characters have c=2/3. Unramified order-3 class character has c=0, not 2 | Trivial and class-number exceptions preserved. |
| 0.3 Euler/central values | Inert 7; deletion at 5; arbitrary discontinuous continuation | Euler factor `7/8` versus wrong-sign `7/6`; deletion `6/5`, valuation −1. Free assignment gives candidate values 0 and 1, excluded by entire continuation | No division by a zero central Euler correction; continuation condition matters. |
| 0.4 integral period | `ω↦2ω`, `ω↦5ω`, at p=5; nonprincipal ideal | `A↦A/2`, valuation shift 0; `A↦A/5`, shift −1; class of `(2,1+√−5)` is nontrivial | Néron and principal-lattice hypotheses discriminate. |
| 0.5 auxiliary prime | D=7,p=5; l=23,11,13 | `−7=4² mod23`, `23=3 mod5`; 11=1 mod5; 6 nonsquare mod13 | Split and congruence conditions both needed. |
| 0.6 X_l | l=23,r=1; trivial character; generator g | Order/field degree 23, conductor 529; trivial c=0; evaluation `ζ23` versus `ζ23⁻¹` | Indices and direct evaluation correct. |
| 1.1 canonical signs | D=7,23,11,19 | `(2/D)=1,1,−1,−1` | Headline correct. |
| 1.1 local normalization | D=7, places infinity and 7 | Rohrlich `(-i,i)` product 1; AL `(i,-i)` product 1; mixed `(i,i)` product −1 | R02. |
| 1.2 auxiliary signs | Paired split local characters of odd order | `ν(−1)=1`; Gauss product 1; conjugation-stable ideal value satisfies x²=1 and odd order, hence x=1 | Root-number ratio 1 on both sides. |
| 1.3–1.4 forced zeros | c=0,2,3; ε=+1 | Parity factors 1,1,−1; at c=3, `Λ(1)=−Λ(1)` gives `2Λ(1)=0` and L=0 | No sign-positive converse asserted. |
| 2.1 theta divisor/norm | a=(5), h=[5] or [2] | Degree 25−25=0; [5] pushes divisor to 0, [2] preserves `25(0)−E[5]` | Kernel restriction excludes wrong isogeny law. |
| 2.2 pair/unit convention | Q(i),f=3,a=5; principal λ=4 | `4·(3/4)=3=0 mod3`; inverse map gives `3/16≠0`; standard-unit logarithm `−12 log3`, theta-value logarithm `+12 log3` | Direction and inversion agree. |
| 2.3 smoothing | Theta versus unit systems; smoothing by norms 4 and 9 | Kummer inversion negates; `z^θ+z=0`; normalization constants satisfy u³=u⁸=1, hence u=1 | Normalization fixed; use a cofinal valid-pair tail as in R01. |
| 2.4 realizations/descent | Q(i),f=8,a=9,r=2; inert 7 | Identity scalar `81/81=1` versus 81; dual Frobenius `−1/7`, twisted `49·(−1/7)=−7`; filtration dimensions 2,1,0 | Dual, tensor and descent conventions match. |
| 2.5 translated evaluation | p=7,f₀=8,m=1,g=56 | `ξ₁=8,α₁=1,ν₁=7`; `8−7=1` versus `8+7=15`; r=1 scalar 1/7, r=3 factorial 1/2 | Repaired translation/basis still correct. |
| 2.5 unit-ideal boundary | Q(i),p=7,f=7,f₀=1,g=7,a=5 | At n=0: `α₀=ξ₀=0`, theta value 0, required unit membership false. At n=1: annihilator 7, intersection with E[5] zero, evaluation nonzero | R01; omit initial evaluations and align cofinal fields. |
| 2.5 connected/étale repair | Q(i),p=5,i=2; nonsplit p | #E(F₅)=8, trace −2; tangent scalars 4 and 0, kernel points 5 and 1. Nonsplit connected Tate rank is 2, not 0; étale Fil⁰=coLie=0 | Original F02 repaired, including all prime types. |
| 2.6 derivative sign | a=(5), r=1,2 near origin | `dlogθ∼24 dz/z`; second derivative `−24/z²`; Eisenstein expression `+24/z²`; parity multiplier −1 | Signs agree with the explicit normalization. |
| 2.7–2.8 integral class | α=2 or1 mod5; χ(g)=ζ25; trivial p-character | Smoothing residue 2 or0; direct/inverse weights `ζ25≠ζ25⁻¹`; both wrong-sign L-values can be 0; deletion valuation −1 | Integrality and orientation are separate assertions. |
| 2.9 character twist | Scalar a on T; dual basis | Diagonal action `gx⊗a⁻¹t∨`, omitted twist `gx⊗t∨`; with a=−1 these differ by −1 | Correct inverse action, conditional on the declared supplier contract. |
| 2.10 period change | v=2; lattice unit u=−1 | `(A/2)(2ω)=Aω`; γ unchanged under simultaneous rescaling; Ω sign change negates γ and class | Vector and scalar laws consistent. |
| 3.1–3.3 towers/splitting | p=5,n=0,1; h=2,r=1,l=23 | Local degrees 24,600; semilocal factors `2·23=46`; augmentation of (2,3) is 5 versus one-place value 2 | Group-algebra factors and corestriction directions agree. |
| 3.4–3.5 Frobenius/Lubin–Tate | p=5; two successive bases | Frobenius −5: trace −10, norm25, #E(F₂₅)=36; +5 would give16. Degrees24,600; `[-p](-P₁)=P₀` versus `[-p]P₁=−P₀` | Negative parameter and index retained. |
| 4.1 Finis invariants | ζ₅-valued unit character; unramified local character; z=i | μ₅=1/4 versus0; `φ̄/N` infinity value i versus `φ/N` value −i | Local restrictions and type distinguish the family. |
| 4.2 adjoint repair | D=7,r=25,a=O,b=(5)⁻¹O; identity inclusion | Index25: inclusion norm1, trace25h, adjoint h; index1: trace=adjoint=id | Original F01 repaired. |
| 4.2 theta spaces/operators | D=7,r=1,25; split2 | Dimensions7,175,7; primitive175−7=168. Semicharacters −1,1,1 give `1=−(−1)(1)`. Shintani composite `(1/2)²·2=1/2`, unscaled composite2 | Wrong semicharacter/normalization excluded. |
| 4.2 functional/Yang | Class numbers1,3; functional rescaled by5 | One versus three component summands; `v₅(5l)=v₅(l)+1`; squared ratio multiplies25; D7 Yang constant `√7/π` | Functional is determined, no free scalar. |
| 4.3 valuation identity | Diagnostic `vW=vD=0,vb′=3/4,vEuler=1` | Correct fraction `1−3/4=1/4`; incorrect product7/4. D powers combine `−1/2+1/4=−1/4` | Repaired denominator and D^(1/4) normalization consistent. |
| 4.4 torsion relations | β₀=(1,1), β₁=(2,1), split p | Relations on barred components `(x,−x)` cut out diagonal dimension1; using both components yields no nonzero relation and dimension2 | Correct component condition; Boxall text waived. |
| 4.5 nonvanishing | D7,ℓ5, sufficiently large split23 level; normalized l/w unit | `v₅(l/w)=0`; l/w=5 would give1 and fails the promised conclusion | Exact eventual theorem, no small-level assertion. |
| 4.6 Finis headline | D7,valuation5,unramified inert components | Sumμ=0,b₅=0,`v₅(D^(1/4))=0`, and `2v₅(l/w)=0`; predicted value valuation0 | Both valuation-prime cases checked against the source formula. |
| 5.1 weight-one family | Prime norm Q=25, φ̄=-5, ν=1 | `λ=-1/5`; denominator at s0 `1+1/5=6/5`, identical to original denominator at s1 | Norm direction and centre agree. |
| 5.2–5.4 unit theorem | D7,p5,l23,ν nontrivial | Inert conductor exponents0; all μ and b=0; l-factors1,1; p-deletion6/5 has valuation−1 | Auxiliary deletion preserves unit statement; p-deletion does not. |
| 5.5 witness | Orders23^r, r=1,2,… | First conductors529,12167; strictly unbounded. A finite exceptional set removes finitely many distinct orders | Nontrivial witnesses at arbitrarily large conductor. |
| 5.6 unramified coefficients | p5,d=3,unit u; compare d=5; ν order23 | Derivative `3x²` has valuation0; `5x⁴` valuation1. `ord_23(25)=11`, so adjoining ζ23 has unramified degree11 | Prime-to-p exponent is used; no arbitrary ramified period rescaling. |
| 5.7 tensor kernels | F=Φ₀,p5,U=Φ(ζ23); compare U=F | Good tensor degree `24·11=264`, kernel0. Bad tensor has nonzero `a⊗1−1⊗a` mapping to a−a=0 | Both directions of vanishing iff follow from actual injectivity. |
| 6.1 vanishing headline | P={5},α=β=1,q25,c=2/5 | t≈3.623898, box −3…3, nonzero form magnitude≤6<25, count0 | Nontrivial asymptotic statement, not a definitional zero. |
| 6.1 power-bound headline | Same P,α,β,q; d=11/20,s=7/16 | t≈5.873095, box −5…5, count0; `3/8<7/16<1/2` and `0<25^(7/16)` | Strict exponent range checked. |
| 6.1 boundaries | α₅=5,β₅=0,t1; empty P; q0,1 | Counts at q5/q25 are6/0. Empty P,t1 gives9, but supported q≥2 none. For nonempty P,q0, form=0 and form≠0 give count0 | Eventual thresholds avoid empty-P/q1 counterexamples; total functions checked. |
| 6.2–6.4 averages/nonvanishing | D7,support{5}; all-zero Galois orbit | Rational limit `(12/5)L(1,κ)≠0` versus zero average0; exponent `r−a/2<0` when2r<a; conjugation of ζ25 to ζ25² preserves c3 and zeros | Correct-sign almost-all conclusion; no derivative assertion added. |
| 6.5 parity headline | Orders1,5,25,125; ε=+1; p3 | Conductors0,2,3,4; signs+,+,−,+. Odd c gives0. Wrong ε puts infinitely many actual zeros in the purported finite exceptional set | Existential ε constrained; p3 allowed, p2 excluded. |

Zero rings and positive-characteristic coefficient fields do not meet the number-field hypotheses; nonabelian examples do not meet the class-field/character-group hypotheses. Rank-zero representations cannot replace the explicitly rank-one CM/Tate lines. The finite-field, unit-ideal, trivial-character, empty-prime-set, ramified-coefficient, split/étale and n=0 cases above are admissible degeneracies, and were tested rather than dismissed.

### Lean acceptance test and padding

The prescribed `lake env lean` invocation on the package's `Suggested.lean`, from the content checkout, exited 0. The **only warnings were the three declarations using `sorry`**, at lines 130, 140 and 166. Both individual Tau Ceti imports were available; no targeted build was necessary. Imports are one `import Mathlib` and the two actually used Hecke-character modules.

A fresh scratch copy issued `#check @name` for all ten public declarations and for the local `factPrime` instance inside its section. It exited 0. The three headline types retain their algebraicity, nonzero-direction and exponent hypotheses, or their imaginary-quadratic, odd-prime, inert-ideal, unramifiedness, finite-order, conjugation and uniformizer hypotheses, respectively. No binder was lost. The supplied signature report's extra entries `)` and `fields` came from parsing docstring text; they are not package declarations.

Every sorried theorem was probed on scratch copies with each of `simp`, `rfl` and `infer_instance`: **nine failed proofs, zero closures**. The first two `simp` probes made no progress and the parity probe retained an unsolved substantive goal; all three `rfl` and all three instance probes failed. Pinned near-matches were read: none supplies a single-lemma proof. The three declarations neither restate definitions nor compute a Check or boundary case. No padding finding is raised.

| README headline | Acceptance-test treatment |
| --- | --- |
| §6.5 parity dichotomy, including §1.4 zeros | `centralValue_parity_dichotomy`, line 166; actual native Hecke characters and an entire Euler-product continuation predicate. |
| §6.1 two Rohrlich estimates | `rohrlichCount_eq_zero`, line 130; `rohrlichCount_lt`, line 140; native p-adic and finite-cardinality carriers. |
| §4.6 Finis divisibility | Named in module docstring: CM period, integral theta/local invariants and algebraic p-adic avatars missing. |
| §§5.4–5.5 BKO unit theorem and nontrivial witness | Named in docstring with the same missing period/value interfaces. |
| §§2.6–2.8 Kato reciprocity and integral BKO class | Named in docstring: coefficient cohomology, dual exponential and period map missing. |
| Layer 3 CM Lubin–Tate, disjointness and semilocal comparison | Named in docstring: CM curve attachment/torsion fields and Lubin–Tate modules missing; ring-class fields correctly acknowledged as native. |
| §§1.1–1.3 root-number formulas | Named in docstring: root-number carrier missing. |
| §6.2 Galois-average limit | Named in docstring: automorphisms acting on algebraic Hecke characters missing. |

The ten public Lean identifiers all occur in the README; its actual Lean-facing names resolve. Mathematical notation such as theta spaces is not being treated as a declaration catalogue. Object searches at the pins found no omitted statable headline on the specified carriers. The simple definitions have real bodies; the central-value predicate specifies an entire continuation from a nonempty half-plane, so it is not a free value predicate.

### Pinned declarations opened and object duplication

Paths in this table are relative to the corresponding pinned library repository. The content checkout's `lake-manifest.json` governs those pins.

| File and line at the pin | What was read and its relevant limit |
| --- | --- |
| `Mathlib/NumberTheory/NumberField/Basic.lean:102`; `ClassNumber.lean:65`; `CMField.lean:70,142,154`; `Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean:666` | Integral closure, class-group cardinality, CM/conjugation and quadratic extension. CM alone is not degree two over Q; the headline adds that condition. |
| `Mathlib/RingTheory/FractionalIdeal/Basic.lean:83`; `DedekindDomain/Ideal/Lemmas.lean:490`; `Ideal/Norm/AbsNorm.lean:262` | Fractional ideals and prime spectrum; height-one primes exclude the zero ideal, whose absolute norm has a total-function zero value. |
| `Mathlib/Algebra/MonoidAlgebra/Basic.lean:231,250` | Lift and singleton evaluation: coefficient b gives `b • F(a)`, with no inversion. |
| `Mathlib/RingTheory/LinearDisjoint.lean:233` | Injectivity of the multiplication map is equivalent to linear disjointness; this generic fact is cited, not rebuilt. |
| `Mathlib/NumberTheory/LSeries/Nonvanishing.lean:412` | Nontrivial Dirichlet-character value at 1, not an anticyclotomic Hecke nonvanishing theorem. |
| `Mathlib/NumberTheory/Padics/PadicIntegers.lean:71`; `PadicNumbers.lean:545`; `Mathlib/RingTheory/Algebraic/Defs.lean:45` | Native p-adic carriers with primality; algebraicity requires a nonzero polynomial. |
| `Mathlib/Data/Set/Card.lean:643`; `Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:107`; `Mathlib/Analysis/Calculus/FDeriv/Defs.lean:172` | ncard is encard.toNat, requiring finite boxes; HasProd uses finite products; differentiability is at every point. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70,80` | Continuous idele-class character into complex units; finite order is separate and unitarity is not bundled. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/FiniteComponent.lean:85,181,254,270`; `Ideal.lean:120,155,200` | Finite component, conductor/exponents/nonzero conductor, ideal character on its actual domain, uniformizer value and inverse archimedean principal law. |
| `TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:98,316,498`; `RayClass/Basic.lean:87`; `Mathlib/RingTheory/ClassGroup/Basic.lean:48` | Nonzero moduli, multiplicative congruence on K×, prime-to-modulus ideals and principal membership. Zero is not an admitted principal generator. |
| `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:111,155,178,214,222,251` | Native ring-class field, ramification bound, Artin/Pic comparison, arithmetic Frobenius, degree and splitting iff generated by an element of the order. These do not supply the attached CM curve/torsion tower. |
| `Mathlib/NumberTheory/MulChar/Lemmas.lean:73`; `Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean:114`; `Mathlib/Data/Int/CardIntervalMod.lean:70` | Near-matches require finite unit groups, rational Dirichlet characters, or count one-dimensional intervals; none proves a headline here. |
| `TauCeti/RingTheory/FormalGroup/Rigidity.lean:182` | Reduction determines a homomorphism between formal groups under finite-height/Hausdorff hypotheses. This is rigidity, not the CM Lubin–Tate attachment or division-field comparison. |

Object searches covered CM theta units, canonical pairs, elliptic zeta elements, anticyclotomic characters, Shintani operators, CM periods, torsion/ring-class comparison, local roots, and Rohrlich counts in both pins, main, board packages and the prescribed open-head search service. No public fully qualified name from this package was found in another open/main Lean file.

The closest open scopes were read: #1804 KatoEulerSystems owns modular-curve classes; #1692 AnticyclotomicLocalUnits owns the projections, Coleman derivatives and signed theory; #1254 ComplexMultiplicationAndExplicitReciprocity owns the CM-character attachment and comparison inputs; #1744 CMRankZeroConverse owns converse/twist applications; #1499 ModularIwasawaMainConjectures owns main-conjecture comparisons. The extra Finis hit in #1816 AutomorphicCongruences, `TauCetiRoadmap/AutomorphicCongruences/README.md:617,623`, consumes mod-p special-value inputs for a Fourier-coefficient theorem rather than constructing these theta spaces. The known board-only overlap is the settled downstream F10 discussed above.

### Current supplier resolution, gaps and merge order

Every Needs line and supplier contract was read against the current text. For open-head files below the path is `TauCetiRoadmap/<Supplier>/README.md`; numbers refer to that file, not to the extra wrapper line printed by the search service.

| Supplier | Current locations and resolution |
| --- | --- |
| ComplexMultiplicationAndExplicitReciprocity #1254 | Lines 372,453,595,638,642,646,670,674,688,699,703: periods, torsion/ray dictionary, character/Tate components, Frobenius, factors/induction, canonical existence and good reduction. The rational-curve induction example is supplemented by GL2's general quadratic induction. |
| AutomorphicLFunctionsAndLocalFactors #924 | Lines 25,27 forward AL.1.5.2 and AL.1.6.2 to AnalyticNumberTheoryPartI §2.3a; lines 651,900,973,1004,2379,2448 contain the local and central-factor contracts. R02 records the actual convention mismatch. |
| ArithmeticGaloisRepresentations #856 | Line 2398, Root-number product formula: the global product, with canonical additive character and normalization. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory #879 | Lines 988,1027,1160,1220,1247: R07.1.8,1.9,1.12–1.14 resolve and supply precisely the new Tate-module/connected–étale/formal/dimension input. |
| LubinTateFormalModulesAndQuasiCanonicalLifts | `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:605,635,657,688,1066,1101`: §§2.1–2.4,4.3–4.4. The resolver's missing-roadmap lead is false: the local board package exists and immediately precedes this one in the order. Its formal-group scope excludes étale components. |
| SelmerIwasawaCohomology #869 | Lines 222,236,250,264,1468,1492: §§0.8–0.11,3.6,3.7. Full field Kummer is completed; finite-S units are finitely generated. Cyclotomic twisting is supplied; general character twisting remains declared. |
| PadicHodgeRegulators #1498 | Lines 523,572,646: §§1.4,1.7,1.11. Dual exponential lands in Fil⁰; twists shift filtration; semilocal maps use all factors. |
| ModularSymbolsPadicLFunctions #968; GL2AutomorphicRepresentationsAndTransfer #931 | Lines 1380,2520 and 2692 respectively: critical algebraicity/coefficient transport and quadratic automorphic induction. |
| PadicFamilies #1019; NoncommutativeAndEquivariantIwasawa #1307 | Lines 2364 and 2064 respectively: normalized theta units versus the ordinary rational-CM Siegel normalization. They do not own this general Kato CM refinement. |
| NeronModelsAndSemistableAbelianVarieties #852 | Line 3109, §5.1: NOS over a henselian DVR, using a Tate prime distinct from residue characteristic. |
| Main analytic inputs | `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:953,1035`; `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:1356`; `Completed/ArithmeticDirichletSeries/README.md:190,237`: finite-place Diophantine bounds, Hecke continuation, Euler products and ideal counting. |
| Main field/curve inputs | `Completed/GlobalNumberFields/README.md:508,531,571`; `TauCetiRoadmap/ClassFieldTheory/README.md:1924,2128`; `Completed/Chebotarev/README.md:410`; `Completed/LocalFieldsRamification/README.md:576,724`; `TauCetiRoadmap/EllipticCurves/README.md:423,647,683`. The cited character, class-field, prime-choice, ramification, differential, Tate and Frobenius sections exist. |

The supplied overlaps report contains no conflicting head, dropped cited id or revision-only citation. Its closest roadmaps were inspected. AnticyclotomicLocalUnits' older NCM labels are not ids newly dropped by these repairs. The board-package index was read before resolving the locally readable Lubin–Tate package; no unavailable PR identifier was invented.

The prescribed dependency check, including movable placement, returned:

```text
depcheck: 237 roadmaps, 2149 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. The added FiniteFlat supplier is earlier (position 66 versus 345); no forbidden supplier is consumed.

Both gaps occur with matching slugs in the README and `packages/NonordinaryCMSpecialValues/design/plan.json:1894,1900`: `al-local-frohlich-queyrut` is assigned to AutomorphicLFunctionsAndLocalFactors AL.1; `sic-character-twist` to SelmerIwasawaCohomology §3.7. Each specifies a precise missing comparison with its hypotheses, rather than an unowned prerequisite or a duplicate of the narrower supplied theorem. They are not findings. This needs-changes verdict is not conditional acceptance.

## Not verifiable

- BOXALL92, Theorem 1, pp.1063–1066: the primary text was not read; its access is explicitly waived. FINIS06's application at lines 1571–1598 was read. No request to reopen the waiver was made.
- JIA24's published version was not read. All Jia locators checked here refer to arXiv v1, as the manifest explicitly records; no claim about published numbering is made.
- The board index gives no PR/head identifier for the locally readable Lubin–Tate and ModularIwasawaMainConjecturesPartII packages. Their files and order positions were checked; no comparison with an unavailable head is asserted. The available open heads were checked through the prescribed service.
- Numerical tests, source comparison and elaboration do not supply proofs of the admitted theorems. No completed formal proof is claimed.
- No new source was needed and no source-access request remains outstanding.

## Source issues

- **Error** in FINIS06 at §2, equation (5) and trace paragraph, printed p.772: the source says the unnormalized trace is the inclusion's adjoint; it should be divided by the lattice index for scalar product (5); affects a stated result.
- **Error** in KATO04 at (15.4.2), printed p.252: the source says the theta norm identity holds for every CM isogeny; it should require disjointness of the isogeny kernel and smoothing torsion; affects a stated result.
- **Misprint** in KATO04 at the proof of Proposition 15.9, printed p.258: the source subtracts α from ξ but uses the positive translation; it should use the negative translation to evaluate at α; affects the proof.
- **Error** in KATO04 at Proposition 15.9 and its proof, printed pp.258–259: the source identifies the theta-value input with the standard-unit input; it should account for inversion by negating the Kummer class; affects the proof.
- **Misprint** in KATO04 at (15.9.1), printed pp.259–260: the source omits the derivative parity factor in this period normalization; it should retain the factor (−1)^(r−1) for the theta-value logarithmic derivative; affects the proof.
- **Misprint** in BKO21 at §3.0.2, printed p.952: the source uses the same exponent for order and ray conductor; it should distinguish order l^r from nontrivial conductor l^(r+1); affects a stated result.
- **Misprint** in JIA24 at the rational-principal formula before (2.1), p.4: the source gives κ(n)n⁻¹ for the ideal character; it should give κ(n)n; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "eaec2750155aee2c6aaf598646538f0c911ff3b6", "job": "REV-PKG-NonordinaryCMSpecialValues~5", "model": "gpt-6-astra", "worker": "chris-8"} -->
