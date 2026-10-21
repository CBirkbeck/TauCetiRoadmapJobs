# QWittVectors design repair

All three findings are applied. The general endpoints, all primes and all preexisting public names are retained. The supplier gaps remain requests to their named owners; these edits do not claim that the missing supplier sections exist.

## F01 (P1) — applied

Strict coefficientwise vanishing on cocycles → an integral product homotopy in §9.4a, required before `QWitt.framedCohomologySystem`. Added its formula, coordinate normalization, quotient law and three Checks, including the nonzero two-variable boundary. Updated the §9.5 proof and dependencies in both design files and the Wagner source locators.

Wagner §4.8, p. 57, wagner line 2858, supplies the skew product. Lemma 4.17, p. 61, wagner line 3033, states the cohomology conclusion, but the inference at wagner line 3042 does not justify coefficientwise vanishing in several variables. The counterexample is valid: for ω=YdX+XdY, its scaled differential is zero, while `(γ_X−id)ω=hXdY` and `dX·ω+ω·dX=hX dX∧dY`. In ℤ[X,Y][[h]]/(h(h+2)), cancellation of h would make vanishing of hX imply X=2a₀, impossible over ℤ[X,Y]. Nevertheless the commutator is `d_H(−XYdX)`.

The added homotopy is proved directly from the defining skew rules, rather than attributed to the source's displayed inference. For ordered coordinate subsets I,J and k=|I|, its ith summand is zero unless i belongs to both subsets; otherwise it is

`H_i(a e_I,b e_J)=(−1)^k T_i γ_{J<i}(a)γ_{I>i}(b)e_I∧ι_i(e_J)`.

Here the wedge and contraction are on the exterior basis, and every coefficient is on the left. Set `μ_s(a e_I,b e_J)=γ_{J≤s}(a)γ_{I>s}(b)e_I∧e_J`. Each μ_s is a chain map: the two twisted Leibniz expressions for hD_j give its differential in the coordinate being differentiated, and the other coordinate operators commute. For coordinate i, the four cases of membership in I,J give `μ_(i−1)−μ_i=d_H H_i+H_i d_tensor`: if i belongs to neither or both, its ith-coordinate contribution is zero; if it belongs to exactly one, the difference is the corresponding signed `T_i hD_i` term. Contributions from j≠i cancel by the twisted Leibniz rule and γ_j(T_i)=T_i. Summing telescopes from the product to its signed opposite. This proves the identity for arbitrary input forms, before taking cocycles or a quotient.

The homotopy is continuous and A[[h]]-bilinear, so it descends through every q^m−1. For closed inputs the signed commutator is its differential. In particular `H(dX,ω)=−XYdX`, recovering the requested coordinate homotopy. No division, prime restriction or torsion hypothesis is used in §9.4a; §9.5 retains integer torsion-freeness to deduce strict odd alternation, including at 2.

## F02 (P2) — applied

Étale differential extension for arbitrary DGAs → the generic nonnegative graded-commutative, strictly odd-alternating DG B-algebra extension in `gap:ordinary-derham`, with commutative B and a B-linear extending differential. `QWitt.differential_etaleDifferential` now states only its q-Witt specialization. Added the skew square-zero excluded non-example; Layer 8 remains associative with its skew product.

The source's commutative context is explicit at Wagner §3, p. 37, wagner line 1802. Lemma 3.32, p. 51, wagner line 2561, uses the universal exterior de Rham map and tensor construction at wagner line 2566. In this class, `Ω*_{S/B}⊗_{Ω*_{P⁰/B}}P` gives the differential on `S⊗_{P⁰}P`; formal étaleness gives uniqueness. The supplier request includes its initial extension property among the same class of DG B-algebras. The local use has B=A[q], P=Q_mΩ* and S=Q_m(R′/A), whose degree-zero map is étale by §5.1.

The proposed excluded example is associative: P¹ is the square-zero ℤ[x]-bimodule with usual left action and evaluation-at-zero right action. The two actions commute, and d=0 satisfies Leibniz. Localizing on the left leaves the free module Su nonzero. Extending the multiplication would instead force u=(ux)x⁻¹=0. Thus the old arbitrary-DGA assertion fails even before constructing a differential. The generic supplier contract and the q-Witt theorem do not include this example.

## F03 (P2) — applied

Topic-only `needs` sentences → self-contained mathematical requests with hypotheses and conclusions, mirrored in the README. Preserved the detailed contracts and every supplier owner. Split the independent PD-presentation input into `gap:pd-presentation`, with §9.7 as its direct consumer; `gap:prismatic-frobenius` serves §9.6. Updated prerequisites, `neededBy`, supplier description, layer dependencies and source uses together.

| Gap | Mathematical content checked and retained in `needs` | Evidence |
| --- | --- | --- |
| `cyclotomic-contract` | Integral ideals with m>1; distinct positive indices and their precise intersection quotient; p-local Chinese remainders with m=p^αn, α≥0, n>0 and gcd(n,p)=1; equal radicals for every d>0. Mathlib's polynomial products remain imports. | Wagner Lemmas 2.1–2.2, p. 8, wagner line 305 and wagner line 320; Lemma 2.30, pp. 24–25, wagner line 1214 and wagner line 1261. |
| `ordinary-derham` | Arbitrary commutative bases, exterior DGA, strict odd alternation, the scoped B-linear étale extension of F02, and relative polynomial Cartier with a twisted source and no perfectness assumption. | Wagner Definition 3.1, p. 37, wagner line 1822; Lemma 3.32, p. 51, wagner line 2561; polynomial cycle decomposition, p. 73, wagner line 3597. |
| `cohomology-completion` | Possibly unbounded ℤ[q]-complexes, h=q−1, prime p, and all three degreewise conditions on both terms and cohomology, with degree-dependent bounds; ordinary/derived comparison, preservation and cohomology comparisons. | Wagner Lemma 4.25, pp. 64–65, wagner line 3198 and wagner line 3206. |
| `prismatic-frobenius` | Perfectly covered A, prime p, finite-coordinate étale framing; explicit D,I,S,Δ and Frobenius; q-PD comparison and iterated décalage with completed scalar extension, including reduction/Bockstein compatibility. | Wagner Lemma 4.32, p. 70, wagner line 3459; Bhatt–Scholze Theorem 15.3, p. 103, bhatt-scholze line 3898; Constructions 16.19–16.20 and Theorem 16.22, pp. 114–115, bhatt-scholze line 4316 and bhatt-scholze line 4378. |
| `pd-presentation` | Independently, perfectly covered A, smooth R/A and prime p; a surjection from a p-completely ind-smooth δ-Â_p-algebra, compatible δ-structure on its PD envelope, and the functorial multiplicative crystalline Poincaré equivalence. | Wagner §4.34, p. 71, wagner line 3492 through wagner line 3517. |
| `dga-bockstein` | Associative cochain B-DGA, commutative B, central termwise regular scalar, lift formula, square zero, signed derivation and naturality; F reduces from f to g and V multiplies by f/g in the reverse direction, with Fβ_fV=β_g. | Wagner §4.16, p. 61, wagner line 3026; §4.23, p. 64, wagner line 3178; the lift equation d((f/g)x)=fy when dx=gy. |
| `dga-quotient` | Homogeneous two-sided differential ideal, quotient/projection universal property, generated differential ideals, and preservation of graded commutativity and strict odd alternation. | Wagner Proposition 3.12 and Definition 3.13, pp. 40–41, wagner line 1956 and wagner line 1977. |

The radical claim also follows directly from cyclotomic reduction: write d=p^a n with p∤n; modulo p the factors for d and pd are positive powers of the same Φ_n. This proves equal radicals, including a=0, without asserting equality of ideals. For Cartier, the polynomial monomial decomposition over 𝔽_p remains valid after tensoring with any characteristic-p base, because it is a vector-space decomposition; it gives the stated relative cycle representatives without perfectness.

## Supplier and pinned-library verification

Read-only main is `0e8b058a97cc4f9401d2679313e0e937761c1024`. Roadmap form and ownership were compared with `TauCetiRoadmap/DerivedModuleAlgebra/README.md`, `TauCetiRoadmap/DGAInfinity/README.md` and `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`. DerivedModuleAlgebra §1.5 states Noetherian finite-cohomology and quotient-tower comparisons, rather than the full requested Wagner Lemma 4.25. DGAInfinity Layer 1 supplies associative DG carriers and cohomology multiplication; its category quotients do not supply the requested differential algebra ideal interface. Their Part II gaps remain explicit.

The open ArithmeticDynamics and ErdosProgressionPowers heads were verified as `1921611a7a96ac19fb15c2b1291b35958c3ef0cb` and `e101259371172a32b3dd13e926676ae33b6af5cd`. Their scope and relevant text were compared with the board copies in `packages/ArithmeticDynamics/README.md` and `packages/ErdosProgressionPowers/README.md`. Neither supplies the missing DG, de Rham, completion or prismatic interfaces; ArithmeticDynamics' cyclotomic uses concern polynomial factorization and dynamical periods.

GitHub code search located candidates, and the relevant files were read at the manifest pins:

- Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`: `KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale`, in `Mathlib/RingTheory/Etale/Kaehler.lean`, supplies the degree-one scalar-extension equivalence for a commutative scalar tower and formal étaleness. It is an input to exterior de Rham extension, rather than the generic DG theorem. `Polynomial.prod_cyclotomic_eq_X_pow_sub_one` and `Polynomial.prod_cyclotomic_eq_geom_sum`, in `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean`, already give the positive-index polynomial product identities and are not requested again.
- Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: `TauCeti.kaehlerBasisOfFormallyEtale`, in `TauCeti/RingTheory/Kaehler/FormallyEtale.lean`, transports degree-one bases under formal étaleness without finiteness of the algebra map. `TauCeti.explicitBockstein1`, in `TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/Basic.lean`, has continuous group-cohomology carriers and mod-two coefficients; it is not the associative regular-parameter DGA Bockstein requested here.

No outside owner was assigned an invented declaration. No ownership moved across the merge order. No new source work was needed: the existing legal cached versions cover these findings, and the Wagner manifest record now includes the precise added locators and uses. No missing-reference file was needed.

## Check outcomes

The prescribed dependency command, with the candidate `packages/QWittVectors/design/README.md`, `--only QWittVectors` and `merge-order/ORDER.txt`, exits **0**. Its complete output is:

```text
candidate: QWittVectors is not in the merge order yet; checked as if placed after HabiroCyclotomicCompletions (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 12 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

| Check | Exact outcome |
| --- | --- |
| JSON/TOML parsing and source records | PASS: plan and manifest parse; eight certified source records. |
| README/plan agreement | PASS: all 53 targets, 165 public API clauses and 161 Checks agree, including statements, hypotheses and proof routes. |
| Definition/construction coverage | PASS: all 28 retain their API and at least three Checks. |
| Internal dependencies | PASS: every target prerequisite resolves strictly earlier; all seven gap records match their README introductions/details and exact direct consumers. |
| Scope and name comparison | PASS: no old target or API was deleted or renamed; one new target, §9.4a; existing target edits limited to §7.7, the §8.4 consumer list, §9.5 and the §9.7 gap prerequisite. |
| Product-homotopy sign calculations | PASS: 5,268 exact polynomial specializations, ranks 0–3, q=1,2,−1,3, every exterior-basis pair, and coefficient monomials with exponents 0,1,2. These supplement the algebraic telescoping proof; they do not prove the completed general theorem by finite testing. |
| Counterexample and boundary calculations | PASS: F01's two-variable signed commutator is nonzero but exact; the mixed-degree three-variable Check is exact; F02's localized skew bimodule gives the stated contradiction. |
| Lean elaboration and examples | NOT RUN: this package has no `Suggested.lean`; the new framed carriers and homotopy are README targets, and no Lean file is authorized for editing. No elaboration result is claimed. |
| Whitespace and permitted paths | PASS: `git diff --check` exits 0; changes are confined to the three permitted package files and this required report. |

## Adversarial mathematics pass

Each target row covers its definition or theorem, public laws and Checks. The table records concrete substitutions and mathematical reasoning, not independent acceptance or a Lean proof. Completion hypotheses are retained where used; the product homotopy itself does not need them. Analytic compactness, DVR ramification, Haar measures and Tate twists do not enter these algebraic targets.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions | n=0,1,2; q=1; zero ring; two coordinates | [0]=0, [2]=1+q; ordered d¹(a,b)=D₁b−D₂a; q-fixed and q↦q^p maps remain distinct | None |
| 1.1 Truncation sets/ghosts | ∅, {1}, {2}, Div(6) | {2} fails divisor closure; w₆=x₁⁶+2x₂³+3x₃²+6x₆ | None |
| 1.2 Ghost criterion | ℤ, ℚ, 𝔽₂; n=1,2 | Over 𝔽₂, (0,1) has zero ghosts; injectivity needs the stated torsion condition | None |
| 1.3 Big Witt ring | Zero ring, ∅, zero-product ℤ, τ(1)+τ(1) | Coordinates (2,−1) for the sum over ℤ; zero-product input has componentwise addition | None |
| 1.4 F,V,τ | n=1,2; coprime 2,3; τ(−1) | F₂V₂=2; τ(−1)=−τ(1)+V₂τ(1) at level 2 | None |
| 1.5 p-typical comparison | a=0,1,2; p=2,3 | Div(p⁰) has length 1; p=3,a=2 ghost is x₀⁹+3x₁³+9x₂ | None |
| 1.6 Étale big Witt | Identity; ∅; S={1}; coprime 2,3 | Recovers identity/zero cases; finite truncation retains finite presentation | None |
| 1.7 Koszul bridge | r=0,1,2; M=0; noncommuting matrix units | d² detects the nonzero commutator; the stated commutation hypothesis is necessary | None |
| 1.8 Arithmetic fracture | N=1,2; M=0,ℤ,ℤ[1/2] | For N=1 localization is identity; 2-completion alone loses ℤ[1/2] | None |
| 2.1 Arithmetic Λ-rings | ℤ; toric ℤ[T]; identity Adams on 𝔽₂ | ψ₂(2)=2, ψ₂(T)=T²; a coaction cannot have the proposed characteristic-2 identity data | None |
| 2.2 Prime sets/free objects | Empty prime set; {2}; empty generators | Identity comonad, infinite 2-typical object and initial ring ℤ have the intended boundaries | None |
| 2.3 Perfection | ℤ; toric ℤ[T]; perfect A | Rational nonnegative exponents appear in the toric colimit; original ψ₂ misses T | None |
| 2.4 Perfect coverage | Zero ring; ℤ[T]; dual numbers with ψ_n(ε)=nε | Toric ψ₂ is free on 1,T; dual-number ψ₂ is nonflat modulo 2 | None |
| 2.5 Relative perfection | R=A for nonperfect A; ℤ[T]/ℤ; n=1 | Base linearization is invertible; polynomial linearization misses T; right-factor action is essential | None |
| 3.1 Absolute q-FV | R=0,ℤ; m=1,2 | FV₂=2 and VF₂=1+q distinguish the relations | None |
| 3.2 Initial absolute ring | m=1,2; R=0,ℤ; q=1 | Q₁=R; Q₂(ℤ)=ℤ[q]/(q²−1); specialization need not be ordinary Witt | None |
| 3.3 Absolute ghosts | m=1,2; q=−1 and q=1 | First ghost kills 1+q; level reduction sends it to 2 | None |
| 3.4 V-resolution | m=1,4,6 | Signed maps (−V₃,V₂) then (V₂,V₃) compose to zero; no negative-index level at m=1 | None |
| 3.5 Absolute torsion/localization | ℤ,𝔽₂; m=1,2 | V₂(1) over 𝔽₂ is nonzero with zero ghosts; torsion hypotheses remain necessary | None |
| 3.6 Absolute completion | m=1,2; R=ℤ; p=2,3 | At m=1 q^n−1 acts by zero; discrete completion and bounded torsion keep distinct hypotheses | None |
| 3.7 Witt injection/exactness | R=0,𝔽₂; m=1,2 | V₂(1) survives the injection despite zero ghosts; m=1 recovers the input exact sequence | None |
| 4.1 Λ comparisons | ℤ, toric ℤ[T]; m=1,2 | c₂ image ℤ[T²,q]+(1+q)ℤ[T,q] misses T; perfect-base claim retains its hypothesis | None |
| 4.2 Relative q-FV | R=A,0; toric scalar T; m=2 | Relative F fixes T rather than sending it to T² | None |
| 4.3 Relative initial ring | R=A,0; A=ℤ[T],R=A[X],m=2 | Q₂(A/A)=A[q]/(q²−1); V₂(TX) and V₂(X)T require the defining scalar relation | None |
| 4.4 Relative ghosts | d=m=1,2; toric A=R | a⊗1=1⊗ψ_m(a); for T,m=2 both evaluate to T² | None |
| 4.5 Relative base change | Identity; zero base; polynomial algebra | Λ-compatibility, rather than flatness, supplies balancing | None |
| 4.6 Perfect-cover comparisons | R=A; toric ℤ[T]/ℤ; torsion R over ℤ | Isomorphism for the base; c₂ misses T in the non-relatively-perfect case | None |
| 5.1 Relative étale | Identity; m=1; Laurent localization | Original étale map is recovered; ordinary tensor agrees with derived by flatness | None |
| 5.2 Étale ghost pushout | m=d=1; R=A; nonflat quotient | The arbitrary quotient is outside the étale theorem | None |
| 5.3 Relative completion | A=ℤ; R=A; m=1 | Agrees with absolute comparisons; complete descent keeps perfect coverage | None |
| 5.4 Finite type | r=0,1; m=2; infinitely many variables | Rank m in rank zero; 1,T generate at m=2; infinite variables carry no Noetherian claim | None |
| 6.1 Completed étale Frobenius | R=A; split ℤ×ℤ; p invertible; ℤ[T]/ℤ | Invertible-p completions vanish; smooth polynomial Frobenius is not an equivalence | None |
| 6.2 Cyclotomic overlap | (p,d)=(2,1),(3,1),(2,2); R=0,A | Equal radicals suffice; at p=3 the ideals themselves differ | None |
| 6.3 Completed ghosts | m=p,d=1; A=R=ℤ | Teichmüller value is r^p; at p=2 q stays 1+h, not 1+2h+h² | None |
| 7.1 Differential V systems | Rank zero/one; characteristic 2; ideals (T),(T,dT) | Odd square zero is extra at 2; (T) alone fails differential stability | None |
| 7.2 Initial differential system | m=1; R=A,0,A[T] | Ordinary exterior de Rham at level 1; positive degrees vanish for R=A | None |
| 7.3 Differential FV systems | m=1,2,3; R=ℤ[T] | F₂(dτ₂T)=T dT but dF₂(τ₂T)=2T dT; the characteristic-3 discrepancy also survives | None |
| 7.4 Prime V differential | p=2,3; x=0; first ghost | γ₂(V₂x)=V₂(x²) has no division by 2; first ghost kills both sides | None |
| 7.5 Differential Frobenius | p=m=2; τ₂(T)²; m=1 | θ₂(τ₂(T)²)=2T³dT by the semilinear rule; no prime step at m=1 | None |
| 7.6 Differential ghosts | m=1,2; degree 0/1 | gh₂(V₂T)=2T, gh₂(V₂dT)=4dT; the degree matters | None |
| 7.7 Differential base change | Identity; m=1; Laurent localization; skew square-zero bimodule | Localization derivative is −T⁻²dT; skew bimodule cannot support the presumed scalar-extension multiplication | F02 |
| 8.2 Coordinate γ | r=0,1; T²; polynomial q versus series q | q is a unit in A[[h]]; divisibility and regularity precede cancellation | None |
| 8.3 Jackson derivatives | n=0,2,3; characteristic 2; T⁻¹ | D(T²)=(1+q)T; D(T⁻¹)=−q⁻¹T⁻²; no denominator at n=0 | None |
| 8.4 Framed complexes | r=0,1,2; q=1; dT·T | dT·T=qT dT; H□/h has zero differential, C□/h has de Rham differential | Consumer reference only |
| 8.5 Framed Frobenius | p=2,3; r=0,1; coordinate T | H sends dT to T^(p−1)dT; C needs the extra [p]_q; φ(h)=q^p−1 | None |
| 9.2 Frobenius decomposition | r=0,1; α=0,1; p=2 | At α=1 one-form basis is T dT,dT; zero exponents never require T⁻¹ | None |
| 9.3 Two-term cohomology | p=2,α=1,e=0,1; α=0; two factors | H⁰=(h+2)S and H¹=S/(h) for e=0; ordinary tensor uses integral triangular change of basis | None |
| 9.4 Framed Bocksteins | r=0; m=1,2; T² | β₁(T)=dT; β₂(T²)=T dT≠0; regularity comes from the first nonzero coefficient m | None |
| 9.4a Product homotopy | r=0,1,2,3; closed forms of degrees 1,2; q=1; all exterior signs | H(dX,ω)=−XYdX; H(dX∧dY,ZdX+XdZ)=XZ dX∧dY; signed commutators are boundaries | F01: added |
| 9.5 Cohomology q-FV system | m=1,2; r=0; closed two-variable ω | Strict coefficientwise invariance fails; product homotopy proves graded commutativity; torsion-freeness gives odd alternation | F01 |
| 9.6 Simultaneous induction | α=0,1; p=2,3; polynomial/frame cases | Base is ordinary de Rham; T dT modulo 2 lifts via F₂(dτ₂T); quotient also kills dV | None |
| 9.7 Smooth comparison | m=1,2,6; p=2,3; R=0; toric base scalar | At p=2,m=6 twists are ψ₂ and ψ₆; intermediate tensor is over C_α to avoid extra Tor | F03: PD gap split |
| 10.1 Smooth integer torsion | R=A; m=1; ℤ[x]/(x²) | Singular example has nonzero 2-torsion x dx and is excluded by smoothness | None |
| 10.2 Difference torsion/completion | m=1,2; R=A; polynomial then étale | At m=1 bound 1 suffices; (q−1)(q+1)=0 is compatible with integer torsion-freeness | None |
| Cyclotomic request | m=1; equal factors; p=2,3; p|d | Prime-generator formula excludes m=1; equal factors excluded; radical identity handles p|d | F03 |
| Ordinary de Rham request | r=0; characteristic 2; nonperfect characteristic-p base; skew DGA | Exterior alternation and the relative Cartier twist are retained; skew DGA excluded | F02/F03 |
| Completion request | Zero complex; ℤ[q] in all integer degrees with d=0; p-torsion; unbounded h-torsion | First two satisfy the contract; latter examples violate explicit conditions; degree bounds need not be uniform | F03 |
| Prismatic request | α=0,1; p=2; Laurent frame | Empty décalage product at α=0; φ on C uses [p]_q; framing need not be finite as a map | F03 |
| PD-presentation request | R=A; polynomial R; maps of presentations | Rank-zero de Rham comparison is the base; presentation compatibility is a separate input | F03: split |
| Bockstein request | f=g=h; f=h²,g=h; nonregular f | For d(t)=h e, V(t)=h t has differential h²e, giving Fβ_(h²)V(t)=e=β_h(t); regularity is used for lifts | F03 |
| Differential quotient request | J=0,P,(T),(T,dT) in exterior de Rham | Zero, whole and (T,dT) ideals give DG quotients; (T) fails d-stability | F03 |

## Maintainer consequences

The added headline is `QWitt.framedProductHomotopy`; its public laws are `QWitt.framedProductHomotopy_formula`, `QWitt.framedProductHomotopy_coordinate` and `QWitt.framedProductHomotopy_quotient`. Its three Check names and `QWitt.differential_baseChange_skewExcluded` are new plan identifiers, not Lean declarations. No previously cited name changed. `QWitt.differential_etaleDifferential` now records the local specialization; its generic class is requested from DerivedDeRhamCohomology.

PrismaticCohomology remains the owner of both prismatic and PD-presentation inputs. The new `gap:pd-presentation` separates their requests without inventing a supplier target or implementation. DerivedModuleAlgebra and DGAInfinity still need their declared Part II extensions. No files outside the authorized set were edited, and no commit, push, issue or pull-request write was made.
