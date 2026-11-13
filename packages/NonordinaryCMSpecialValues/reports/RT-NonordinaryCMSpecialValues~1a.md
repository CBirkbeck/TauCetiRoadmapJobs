<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13089#issuecomment-6857795540 -->
Red team round 1 pass a (codex) of 9301218

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) Conjugation need not preserve each eigenline in a multiple eigenspace

   **Location:** packages/NonordinaryCMSpecialValues/README.md:629, “For a Shintani eigenfunction `ϑ`, `ϑ† = γϑ` with `|γ| = 1`.”

   **Claim:** Every eigenvector of the full Shintani space is a scalar multiple of its conjugate.

   **Witness:** README:593 and FINIS06 line 483 allow multiplicity greater than one. In a two-dimensional conjugation-stable eigenspace choose independent real vectors u,v. Then (u+iv)†=u−iv; proportionality would require γ=1 and γ=−1 simultaneously.

   **Exact repair text:** “For a nonzero primitive Shintani eigenfunction `ϑ ∈ V^{prim}_{d,C}`, multiplicity one and conjugation stability give `ϑ† = γϑ` for a unique `γ` with `|γ| = 1`. No such assertion is made for arbitrary vectors in a nonprimitive eigenspace of higher multiplicity.” Restrict the associated nonvanishing Check at line 635 to this primitive eigenspace. The repaired statement excludes the two-dimensional witness and retains the one-dimensional eigenspaces used in (13).

2. **F02** (P2) The definition of the local pairing invariant precedes its prerequisites

   **Location:** packages/NonordinaryCMSpecialValues/README.md:540, “`b_ℓ(χ_ℓ, w) ∈ Q` ... by Finis's equation (14).”

   **Claim:** Section 4.1 constructs this invariant using only local epsilon factors and Hecke characters; §4.3 then depends on §4.1.

   **Witness:** FINIS06 lines 898–902 define b as minus the minimum valuation of D^(1/4)b_ar on integral local theta eigenspaces. Those spaces and the pairing first appear in README §§4.2–4.3 (lines 559, 624, 638).

   **Exact repair text:** In §4.1 replace the b-definition and its vanishing assertion with “The pairing invariant `b_ℓ` is constructed in §4.3 after the integral local theta eigenspaces.” In §4.3, after the definition of integral theta functions and before (13)–(15), add the definition (14), its independence of the lattice, and its unramified/minimal-conductor vanishing theorem, with FINIS06 pp.788–789. Split the Needs lines accordingly: local signs and μ precede theta spaces, which precede integral pairings, which precede b and the valuation identity. For an unramified inert local character the pairing minimum is 0 and b=−0=0, preserving §5.2's application.


3. **F03** (P1) The canonical CM pair need not have good reduction over its ray field

   **Location:** packages/NonordinaryCMSpecialValues/README.md:379, “The curve `E` has good reduction at every finite place of `K′`”.

   **Claim:** The inclusion `g ⊂ f` makes the canonical CM curve over `K(g)` everywhere good, permitting use of its p-divisible Néron model without a further extension.

   **Witness:** README:384 gives K=Q(i), g=(7), ray degree 12 and rational E[7]. Good inert CM reduction forces nonzero 7-torsion parameters to have v₇=1/48, impossible in (1/12)Z.

   **Counterexample details:** At the prime above 7 the ray extension is totally ramified of degree 12 (class number one and four global units). If E had good reduction there, its inert CM p-divisible group would be connected of relative height one. Its formal O_(Q₄₉)-action contains the 48 Teichmüller units. Averaging a coordinate over that tame group makes their action linear. Thus [7](X) has no terms of degrees 2 through 48 and has a unit coefficient in degree 49; its nonzero 7-torsion has valuation 1/48. Every E[7] point is rational over K(7), since α is rational and generates E[7] over Z[i]/7. This contradicts the local value group. This also fits Kato’s character setting: take r=4 and the conductor-one character (α)↦α⁴ on Q(i), with f=(7). Its fourth tensor can be unramified while the underlying curve has nontrivial inertia. The hypothesis g⊂f does not imply the asserted unramified Tate action. KATO04 lines 5492–5494 make the same unsupported inference.

   **Exact repair text:** “The canonical curve has potentially good reduction. Choose a finite extension `K″/K(g)` giving good reduction at the places above p (NeronModelsAndSemistableAbelianVarieties §5.1a). Apply the height-one reciprocity law to the base-changed groups and classes, then descend the rational identity by corestriction and the de Rham trace, dividing by `[K″:K(g)]`. Prove that this descent preserves the displayed basis and derivative normalization.” Replace the everywhere-good assertion with this construction. In the split-prime Check justify good reduction separately for its chosen curve before forming the two components. Keep the general-prime target; do not assume away these canonical pairs. In the witness any good-reduction extension must enlarge the value group enough to contain 1/48; K(7) itself cannot be used.

4. **F04** (P2) The integral realization has no fixed geometric lattice

   **Location:** packages/NonordinaryCMSpecialValues/README.md:46 and :413, “`γ` generates `T_φ^∨` integrally”.

   **Claim:** The period-normalized Betti vector generates the dual of the rank-one R-realization named in the conventions, and the rational elliptic class has its asserted integral lift.

   **Witness:** Replace a geometric realization T₀ by p⁻¹T₀ in its rational line. It is still a rank-one R-realization with the same character, but its dual is pT₀∨. A generator γ of T₀∨ does not belong to pT₀∨.

   **Exact repair text:** “Fix the integral realization by the comparison `T_φ|_{G_H} ≃ T_pE ⊗_{O_Φ} R` on the covariant Tate lattice, and use its dual comparison to identify the Betti lattice. Prove that `γ = per_φ(ω)/Ω` generates this dual lattice, including the prime-to-p comparison with the canonical CM pair. The lattice and its comparison are part of the period datum; the claim is not for an arbitrary stable lattice in the rational realization.” Make this comparison a named prerequisite before §2.7, with BKO21 pp.951–952 (lines 404–416) and a proof route. In the witness p⁻¹T₀ with the unchanged comparison is excluded; transporting the comparison transports γ and the integral class as well. The present projected smoothing argument alone does not establish this full lattice comparison.

5. **F05** (P3) The negative-exponent count Check forgets the empty prime set

   **Location:** packages/NonordinaryCMSpecialValues/README.md:819, “the box contains only `(0, 0)`, excluded by the nonvanishing condition”.

   **Claim:** For c<0 and q>1 the count is zero.

   **Witness:** P=∅, q=2, c=−1 gives t=1/2. The box is {(0,0)} and the universal condition over P is true, so rohrlichCount=1, not 0. If q is required to be P-supported this instance is instead excluded, making that Check vacuous.

   **Exact repair text:** “For nonempty P, c<0 and q>1, t=q^c<1 and M=0 because the unique box point (0,0) fails a nonvanishing condition. For P=∅, M(q,t)=(2⌊t⌋+1)² when t≥0; the eventual theorems remain true vacuously with Q=2, since no integer q≥2 is supported on P.” This gives respectively 0 and 1 on the two instances without changing either Lean theorem.

6. **F06** (P1) The cited CM factorization and induction have smaller scope

   **Location:** packages/NonordinaryCMSpecialValues/README.md:69, “all-prime factorisation `L(E/H, s)` through `ψ` and `ψ̄`”.

   **Claim:** ComplexMultiplicationAndExplicitReciprocity §4.2 supplies the all-prime factorization for the curve over the Hilbert class field H. README:834 also uses its induction target for arbitrary η=φρ.

   **Witness:** Supplier README:670 requires A/K, K the CM field. For K=Q(√−23), h_K=3 and the canonical j-invariant has degree 3 over K; E/H cannot instantiate A/K.

   **Additional scope check:** The same supplier’s CM induction target (README:674) assumes a rational CM elliptic curve A/Q. An arbitrary type-(1,0) character twisted by an order-25 anticyclotomic character is not an instance of that rational-curve target. GL2AutomorphicRepresentationsAndTransfer R17.4.16 gives general automorphic induction; its R16.2.13 and R16.6.1 supply the missing holomorphic-weight and classical-newform comparisons, with R16.5.3 fixing the variable shift.

   **Exact repair text:** Replace that contract by “For E/H use ComplexMultiplicationAndExplicitReciprocity §4.1, the algebraic Hecke character and its one-dimensional Tate components at good primes. Section 3.4 uses these good-prime comparisons.” Delete the unused all-prime E/H attribution and its §3.4 Needs edge. If an all-prime E/H factorization is retained as a consumed interface, declare `gap:cm-elliptic-factorization-over-extension` in both the README and plan.json, supplier ComplexMultiplicationAndExplicitReciprocity §4.2, needs: “For a number field k containing the imaginary quadratic CM field K and a CM elliptic curve A/k with all endomorphisms defined over k, factor every local Euler polynomial into the two attached Hecke-character factors, including inertia invariants at bad primes.” At §6.3 replace the CM §4.2 citation by “Apply GL2AutomorphicRepresentationsAndTransfer R17.4.16 to the unitary normalization of η; R16.2.13 identifies its infinite component as D₂, R16.6.1 gives the primitive weight-two newform, and R16.5.3 converts the unitary variable s to the classical variable s+1/2.” Add these sections to the contract and Needs line. The good-prime comparison applies to the degree-three H/K witness, and the general induction route applies to its finite-order twists without requiring a rational CM curve.

7. **F07** (P3) Two Checks cannot discriminate the stated error

   **Location:** packages/NonordinaryCMSpecialValues/README.md:186 and :859: the ramified-factor Check and the fixed-order “almost always nonzero” Check.

   **Claim:** The first distinguishes factor 1 from the extended-by-zero expression; the second tests almost-all nonvanishing on characters of order 5.

   **Witness:** (1−0)⁻¹=1, so the first two models agree. There are exactly four characters of order 5 in the Z₅-family; an all-but-finitely-many assertion on those four holds even when all four values vanish.

   **Exact repair text:** For the first Check: “At a genuinely ramified prime both the native factor and the correctly extended-by-zero formula give 1. To test conductor cancellation, twist a character ramified at (7) over Q(i) back to the character of y²=x³−x: the resulting unramified factor at s=1 is 7/8; retaining the old ramified modulus would give 1.” For the second: “In the family over Q(√−7) at p=5, conductors c=2k, k≥1, give sign +1; there are infinitely many such characters and only finitely many of their values vanish. Conductors c=2k+1, k≥1, give sign −1 and value 0.” This tests an infinite correct-parity set, rather than the four-element order-5 stratum.

## Verified sound

Read all 894 README lines and all 184 Lean lines. The inventory is 43 numbered README subsections, with the additional constructions inside §§4.2–4.3 separated below, and 11 actual Lean declarations: seven definitions, one local instance and three theorems. The supplied signature extraction's twelve entries include two prose fragments and omit the local instance; its ten mathematical declaration signatures retain their required binders. This review compared those supplied signatures with the file; it did not run Lean. All 49 Checks blocks were read. The computed tests below cover those blocks, including the three defective Checks in R05/R07. They are boundary and normalization tests, not proofs of the proposed theorems.

The three Lean theorems are substantial acceptance targets, not one-tactic padding. All seven definitions serve those targets. The local prime instance supplies the type-class argument to the native p-adic carriers. There is no sorry'd data, free proposition standing for a missing construction, `set_option`, `lemma`, or extra Mathlib import. The changed-file listing contains only this package. No computational algorithm was added as a roadmap target.

The headline inventory is: root-number formulas and forced zeros (§§1.1–1.4); Kato reciprocity and the integral BKO class (§§2.5–2.8); torsion disjointness, semilocal comparison and CM Lubin–Tate comparison (§§3.2–3.5); the theta/valuation route to Finis's theorem (§§4.2–4.6); almost-all unit values and a nontrivial witness (§§5.4–5.5); the two lattice estimates, Galois-average limit, nonvanishing and parity dichotomy (§§6.1–6.5). The statable endpoints are the two count estimates and the parity dichotomy. The module docstring names the unavailable groups and their missing carriers. The existential sign in the parity theorem is not a free substitute for the conclusion: both infinite conductor-parity families determine it, using the almost-all clause.

### Lean inventory and computed adversarial cases

In this table, C means `{K : Type u} [Field K] [NumberField K]`; CM adds `[IsCMField K]`. No completeness or finiteness instance is silently assumed on K. The native number-field carrier excludes zero rings, positive characteristic, inseparable field extensions and infinite-degree fields. A test outside a theorem's hypotheses is identified as excluded, rather than counted as a theorem instance.

| Declaration and context | Instances and computed values | Result / change |
|---|---|---|
| `conductorModulus`, Layer 0, C, χ | χ=1: finite conductor O, infinite part ∅. For the Q(i) curve character: finite conductor (1+i)³, infinite part ∅. Zero ideal excluded by `finiteConductor_ne_bot`. | Real body agrees with native conductor; no change. |
| `IsAnticyclotomic`, Layer 0, CM, χ | Trivial χ: 1=1⁻¹. Order-five ring-class χ with χ(a)=ζ₅: χ(ā)=ζ₅⁻¹. Cyclotomic χ with χ(a)=ζ₅: χ(ā)=ζ₅≠ζ₅⁻¹. | Distinguishes cyclotomic from anticyclotomic; no change. |
| `IsEquivariantTypeOneZero`, Layer 0, CM, ι,φ | x=9≡1 mod 8: φ((9))=9, inverse gives 1/9, norm gives 81. At norm-five prime: −1+2i has conjugate −1−2i and product 5. At inert 7: −7=κ(7)·7. | Both clauses matter; no change to body. |
| `IsPAnticyclotomic`, Layer 0, CM, p,v,χ | Trivial order 1=p⁰, conductor 0. The raw predicate at p=0 or1 admits only order1; the theorem requires a prime. K=Q(√−7), p=5: orders 5,25 have exponents 2,3. K=Q(√−31), p=3: class-group order 3 has exponent 0. | Definition does not impose the false order/conductor equality; no change. |
| `eulerFactor`, Layer 0, C,η,ϖ,v,s | Q(i), inert 7, s=1: (1+7/49)⁻¹=7/8. Ramified character: factor 1. Wrong input ϖ=1 at an unramified prime would give (1−1/49)⁻¹=49/48. | Headline's `hϖ` excludes the wrong input; repair the Check, R07. |
| `HasCentralValue`, Layer 0, C,η,ϖ,z | Entire extensions F,G agreeing on Re(s)>3/2 have F(1)−G(1)=0. Arbitrary assignments 0 and 1 at 1 give difference 1 but fail entire continuation. Trivial character's Dedekind zeta has a pole at 1 and fails this predicate. | Weight-one headline excludes that last character; no change. |
| `factPrime`, Layer 6, p:Nat.Primes | p=2 and 3 supply true primality facts; 1 has no such subtype inhabitant. | Necessary instance; no dropped hypothesis. |
| `rohrlichCount`, Layer 6, finite P,α,β,q,t | P={5}, α=5,β=0,t=1: M(5,1)=6, M(25,1)=0. P=∅,t=1/2: 1. t<0: 0. P nonempty,q=0: divisibility forces the form 0 and nonvanishing excludes it, count 0. | Total-function junk values understood; R05. |
| `rohrlichCount_eq_zero`, Layer 6, algebraic directions, each nonzero, c<1/2 | Rational direction (1,0), q=5ⁿ: for q>1 and c<1, 0<abs(v)≤q^c<q contradicts q-divisibility, so M=0. P=∅: Q=2 excludes all supported q. At c=0, α=5: q=5 gives 6 but q≥25 gives 0. | Eventual quantifier is essential and correctly placed. |
| `rohrlichCount_lt`, Layer 6, same direction hypotheses, 1/2<d<3/5,5d/2−1<s<1/2 | d=11/20,s=7/16: lower endpoint 3/8<7/16<1/2. Rational (1,0), supported q large: M=0<q^(7/16). d=3/5 would require 1/2<s<1/2, impossible. | Strict endpoints agree with source proof; no change. |
| `centralValue_parity_dichotomy`, Layer 6, C+CM+quadratic, prime p≠2, (p)=v, hφ,hφv,hν,hνodd,hνac,hνv,hϖ | Q(√−7),p=5,ν=1: conductors 0,2,3,4 give signs +,+,−,+. c=3 gives value 0; correct parity allows a finite exception set. p=3 inert is included; p=2 excluded; split p cannot satisfy `(p)=v`. Reversing ε makes infinitely many true zeros fall in the proposed almost-nonzero set. | Statement does not assert every correct-parity value is nonzero; no binder loss or counterexample found. |

### README statement and convention ledger

Every numbered target is represented; additional rows separate the constructions and identities in the long theta sections. Symbolic input values below test the algebra of a formula, and are not claims that a character with arbitrarily prescribed valuations exists. N/A cases such as nonabelian S₃ or Q₈ characters cannot instantiate the explicitly abelian rank-one CM class-field setting.

| Statement / location | Instances and values computed on both sides | Result / change |
|---|---|---|
| Fields and embeddings, line 36 | Q(i): degree 2, discriminant −4. Q(√−7),p=5: local degree 2, residue cardinality 25. p=2,3 admitted only in the stated general Kato branch. | Scope restrictions recorded. |
| Character convention, line 38 | Principal x=9: ideal φ=9, idelic infinite value 1/9; their product 1. At x=i the divided conjugate has infinite value i, the undivided orientation gives −i. | Direct/inverse convention discriminated. |
| L-function convention, line 40 | Norm49, coefficient−7: central denominator 1+1/7. Unitary coefficient−1 at s=1/2 gives 1+49^(−1/2)=8/7. | Centres 1 and 1/2 agree after normalization. |
| Indices, line 42 | Exact order 1,5,25: conductor exponents 0,2,3, not 1,1,2. | Trivial and class-group cases retained. |
| Towers and periods, line 44 | p=5,n=0,1: local degrees24,600. π-basis versus p-basis at levels1,2: signs−1,+1. Ω→2Ω scales scalar by1/2. | No identity Φ₀=Φ; no ordinary period assumed. |
| Duals/twists, line 46 | φ((7))=−7; inverse−1/7; twist49 gives−7. ν(g)=ζ₂₅ versus inverseζ₂₅⁻¹. | Rational conventions sound; integral lattice R04. |
| §0.1 | −7=κ(7)7; 9≠1/9≠81; valuations of (1+i)ⁿ are n, giving distinct congruence cosets. | No false finite-index inference. |
| §0.2 | Ring-class 5-part at moduli5,25,125 is1,5,25. Unramified order3 over discriminant−31 has c=0. One split-prime ramification gives exponent pair(1,0), not conjugation invariant. | Both family definitions discriminate. |
| §0.3 | Primitive factor7/8; deletion8/7 with v₇=−1; ramified factor1=(1−0)⁻¹; arbitrary non-entire assignments allow0 and1. | R07; other controls agree. |
| §0.4 | ω→2ω gives A/2, v_p unchanged for p≥5; ω→pω gives v_p(A)−1 and is excluded. Nonprincipal ideal (2,1+√−5) has class of order2, not a scalar multiple of O_K. | Period-lattice restriction essential; R04 for integral comparison. |
| §0.5 | −7 mod23=16=4² and23 mod5=3; −7 mod11=4 but11 mod5=1; −7 mod13=6 not square. | Split and congruence conditions independently tested. |
| §0.6 | r=1: degree l, conductor l². r=0: degree1, conductor1. [g] evaluates ζ_l, not ζ_l⁻¹. | Native group-algebra convention agrees. |
| §1.1 | (2/7)=(2/23)=1; (2/11)=(2/19)=−1. Local factors(−i,i) and(i,−i) both multiply1; mixed(i,i) gives−1. D=15 product(−i)i·1=1. | Whole additive-character change, not one place. |
| §1.2 | ν=1 ratio1. Odd-order ν on conjugation-fixed conductor has value satisfying x²=1 and odd order, hence x=1. Order-two x=−1 instead gives ratio−1. | Oddness excludes the countermodel. |
| §1.3 | c=0,2,3 gives multiplier1,1,−1. Order3 unramified class character has c=0, multiplier1. | Conductor, not order, governs sign. |
| §1.4 | W=−1 gives L(1)=−L(1), hence2L(1)=0 and L(1)=0 over C. W=1 gives L(1)=L(1), no nonvanishing. | No converse inferred. |
| §2.1 | Norm5 divisor degree5−5=0. a=(5),[5]: pushforward25[0]−25[0]=0 versus original nonzero divisor. [2] permutes E[5], preserving25[0]−E[5]. | Kernel coprimality correction is necessary. |
| §2.2 | Q(i),f=3: ray degree8/4=2; f=2: ±1 coincide. λ=4 sends3/4 to3 and1 to4≡1; inverse sends3/4 to3/16, not0. Logarithm sums are−12log3 for units,+12log3 for theta values. | Direction and inverse-unit normalization agree. |
| §2.3 | Smoothing scalar N(a)−σ_a=0 if σ_a=N(a); cannot divide integrally. 1/p lies in Q_p but not Z_p. Q(i),f=1: initial admissible levels n₇=1,n₂=2. | No initial theta value or automatic integrality. |
| §2.4 | r=2,x=9: pullback81 cancels ψ((9))=81, giving1. r=1 Hodge dimensions2,1,0 in degrees0,1,2. At7 cohomology−1/7, twist−7. At r=2,x=6: local factor36/36=1, wrong factor6/36=1/6. | Covariant/contravariant and semilinear action tested. |
| §2.5 | Q(i),g=56: ξ₁=8,α₁=1,ν₁=7; ξ₁−ν₁=1 versus ξ₁+ν₁=15. g=7: α₀=0, theta value0, no Kummer class; ray degrees12,588. Factor p^(−m)/(r−1)! at p7,m1,r1,2,3 is1/7,1/7,1/14. | Translation and tail corrections agree; reduction claim false, R03. |
| §2.5 connected/étale components | Q(i),p5: #E(F₅)=8, trace−2≠0 mod5. At i≡2, 2+i=4 unit,2−i=0; dimensions0,1 and heights1,1. | Étale component is not a formal group. |
| §2.6 | Inert p deletion1+1/p; split5 product((6+2i)/5)((6−2i)/5)=8/5 versus wrong4/5. At a=(5), logarithmic derivative24/z, second derivative−24/z². | Local algebra/sign calculation agrees; full KATO99 normalization uncertified. |
| §2.7 | α≡2 modp givesα(ᾱ−1)≡2, unit; α≡1 gives0. T→p⁻¹T gives dualpT∨, excluding original γ. Ω→−Ω negates both γ and class. | R04; projected smoothing alone insufficient. |
| §2.8 | χ=1, p5: deleted factor6/5; χ(σ)=ζ₂₅ changes toζ₂₅⁻¹ under inversion. Nontrivial auxiliary ν has auxiliary factors1·1=1. | Formula's weights and Euler factors agree. |
| §2.9 | Rank-one trivial twist: x⊗1↦x. Scalar basis change u=−1 multiplies both sides−1. At finite level where T/p^k is trivial, inverse twist followed by twist multiplies1. Rank-zero supplier extension has0≅0. | Declared character-twist gap covers construction, not a missing-owner finding. |
| §2.10 | ω,Ω→2ω,2Ω: γ fixed; (A/2)(2ω)=Aω. Ω→−Ω alone: γ,z,A all negated. | Excludes p-scaling of a Néron differential. |
| §3.1 | n=0 degree p²−1, p5 gives24. Order-l auxiliary layer degree l, conductor l². | No assumption that Φ₀=Φ or degrees coprime. |
| §3.2 | p47,l23: p²−1=2208=23·96; gcd(2208,23)=23. Totally ramified/unramified intersection has degree1 nevertheless. r=0 second degree1. | Ramification proves what coprime degrees cannot. |
| §3.3 | h=2 augmentation(x,y)↦x+y; (1,1) gives2, single-place1. Character weightζ_l versusζ_l⁻¹. Prime (p) principal in order prime to conductor has trivial class, Frobenius1. | Semilocal trace and direct evaluation retained. |
| §3.4 | Q(i),p7: q-Frobenius−7, trace−14, determinant49, polynomial1+14T+49T²=(1+7T)². Positive7 gives trace14. | Mathematical specialization sound; supplier scope R06. |
| §3.5 | p5,n0: degree24; cyclotomic degree4 divides24. n1: degree600, cyclotomic degree20 divides600. Sign s=−1 gives trace−10. | Correct Honda parameter and tower indices. |
| §4.1 | v_ℓ(ζ_ℓ−1)=1/(ℓ−1); prime-to-ℓ nontrivial roots give0. At z=i, φ̄/N gives i versus φ/N gives−i. Inert conductor0,1 root factors1,−1. | b-definition order R02. |
| §4.2 theta space and semicharacter | K=Q(√−7), r=1,25,a=O: dimensions7,175. r25,a=(5)⁻¹:7. Norms1,2,4 give ψ=−1,1,1 and1=−(−1)·1; trivial ψ would demand1=−1. | Semicharacter and positive orientation matter. |
| §4.2 trace and primitive space | Index25: trace of included h is25h; inner products25 versus1. Adjoint trace/25 gives1. Dimensions175−7=168; d5 has no ideal of norm5, dimension35 unchanged. | Source's adjoint normalization corrected here. |
| §4.2 compatible components and spectrum | h=1 gives even functions on one lattice; h=3 gives three class components. d25 full spectrum includes t25 lower conductor, primitive spectrum excludes it. | Full and primitive cannot be interchanged, R01. |
| §4.2 Shintani operators | Split2: raw composite2; gamma factors(1/2)² give1/2=λ((2)). Principal z=9 gives F*(z)=1/9 and F*(z)⁻¹=9. | Both normalization and inverse factorization agree. |
| §4.2 functional l | h=1: l=θ(0); h=3: l=x+y+z, e.g.(1,1,1) gives3 not1. Scaling l by5 multiplies squared norm ratio25. | Coefficients1 exclude arbitrary rescaling. |
| §4.2 Yang formula | w=2,h=1,D=7: w²√D/(4πh)=√7/π. Ramified correction(1−0/q)⁻¹=1. Zero θ would give0/0, excluded by the nonzero eigenfunction condition. | Finis formulation readable; original Yang constant OCR limited. |
| §4.3 dagger and pairings | Dagger-real independent u,v: (u+iv)†=u−iv, no proportionality. Bilinear b(iu,v)=ib(u,v), Hermitian first-variable scaling gives−i. | R01; restrict proportionality to multiplicity one. |
| §4.3 arithmetic/integral theta functions | Normalized θ:5θ integral but not normalized; valuations of l and b′ increase1,2. If dD is ℓ-unit then G⊂T_int⊂(dD)⁻¹G=G. At D7,ℓ7 onlyG⊂T_int⊂7⁻¹G. | Integral lattice and normalization distinguish scalar multiples. |
| §4.3 arithmetic Yang and valuation identities | v(W)=v(D)=0,v(b′)=3/4,v(product)=1: correct1/4, wrong product7/4. Combining discriminants−1/2+1/4=−1/4; multiplication byD^(1/4) cancels. Wrong numerator gives extra valuation1 when v(D)=1. | Algebra forces displayed denominators. |
| §4.3 Gauss/local pairing factors | Splitℓ11,D7,11∤d: W=1,v(W)=0,b=0. Unramified inertℓ5: W=1,b=0. Replacing W by11 would add1. | Defines the factor rather than arbitrary scalar; R02 order remains. |
| §4.4 | E itself has stabilizerE and dense p-power torsion. A torsion point has stabilizer0. Diagonal inE²: (P,P)+(Q,Q)=(P+Q,P+Q); graph[2] gives(P,2P). | These instances agree; full Boxall generality waived, not certified. |
| §4.5 | K=Q(√−7): w=2, v_5(w)=0, so integral unit l givesv_5(l/w)=0. K=Q(√−3): w=6,v_3(w)=1; dividing by w can lower valuation1. ℓ=p explicitly excluded. | Exceptional denominator and distinct-prime hypotheses retained. |
| §4.6 | With all inert μ=0 and b=0, equality givesv=0; for theta evaluation valuationa≥0 identity givesv=2a≥0. Sign−1 gives L=0 and is outside equality domain. | No “positive sign implies unit” converse. |
| §5.1 | Inert norm25 coefficient−5: divided coefficient−1/5; at s0 denominator6/5 equals original at s1. Opposite twist coefficient−125 at s−1 gives3126. | Correct norm twist and central shift. |
| §5.2 | Canonical conductor supported on ramified primes: inert ramification set∅, sum0; at p unramified b=0. Auxiliary split-l twisting changes neither0. | Finis correction terms vanish for stated family. |
| §5.3 | Nontrivial ν ramified at both l-primes: invariants dimensions0,0, factors1,1. Additional p5 deletion6/5. ν=1 instead has two genuine degree-one factors. | Nontriviality hypothesis essential. |
| §5.4 | v_p(D)=0 since p inert; v_p(D^(1/4))=0. Finis givesv_p(A)=0, whereas the p-deleted value has valuation−1. | Unit concerns f-deleted value, not p-deleted value. |
| §5.5 | Infinite conductors l²,l³,… are distinct; deleting N exceptions and the trivial character leaves infinitely many, hence at least1 nontrivial unit witness. | Existence does not name ν=1. |
| §5.6 | d prime to p and unit u: derivative dX^(d−1) at root is unit, so roots of X^d−u are unramified. For d=p and u=1+p, translation gives Eisenstein ((Y+1)^p−(1+p)), ramification degreep. | Class-number coprimality is used. |
| §5.7 | F totally ramified degree24,U unramified degreee: compositum and tensor dimension24e. For U=F and a∉Φ, a⊗1−1⊗a≠0 maps0. | Both directions of kernel equivalence require injectivity. |
| §6.1 | P={5},α5,β0,c0: counts6 at q5 and0 at q25. P∅,q2,c−1: count1. d11/20,s7/16:3/8<7/16<1/2. | R05; theorem quantifiers sound. |
| §6.2 | K=Q(√−7), support{5,7}: κ(5)=−1,κ(7)=0; limit2L(1,κ)(6/5)=(12/5)L(1,κ), not2L(1,κ). | Support Euler correction retained; not effective. |
| §6.3 | σ fixesK and ζ₂₅↦ζ₂₅²: order remains25,c3; both central values0. Identityσ gives same value. Complex conjugation sendsi to−i and is not inAut(C/Q(i)). | Algebraic normalized coordinates, not arbitrary periods. |
| §6.4 | Orderpⁿ,n>0: c=n+1; n1 sign multiplier+1,n2 multiplier−1. Trivial hasc0 multiplier+1, not−1. | Almost-all quantifier restricted to correct sign. |
| §6.5 | Q(√−7),p5: c2k gives+1 and c2k+1 gives−1; order-five stratum has only4 characters. p3 inert allowed,p2 excluded. | R07 replaces finite-stratum test by infinite family. |

### Suppliers, ownership and pinned APIs

Checked 18 supplier-roadmap groups, resolving the named sections against main/completed text or the available current head. The table groups repeated citations to the same supplier; it does not count repetitions as independent checks.

| Supplier | Contract checked | Outcome |
|---|---|---|
| ComplexMultiplicationAndExplicitReciprocity | §§1.2,2.2,3.2,4.1–4.3; period/torsion dictionary, canonical character and curve, Tate components | R06 for the all-prime base-field scope. The type `(1,0)` ideal / `(−1,0)` idelic conventions agree. |
| AutomorphicLFunctionsAndLocalFactors | AL.1 local factors and Gauss sums, AL.5.1.1 and AL.5.3.2 | AL.1.5.2 and AL.1.6.2 have explicit mappings to AnalyticNumberTheoryPartI §2.3a; not dropped citations. FQ is a declared gap. At a pair of places, factors i and −i multiply 1. |
| LubinTateFormalModulesAndQuasiCanonicalLifts | §§2.1–2.4,4.3–4.4 in its board package | Supplied comparison uses q-Frobenius `[sp]`; s=−1 gives π=−p. The isolated resolver miss is not proof of a missing contract. No open-head copy of this supplier was available in the supplied index. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.1.8–1.9,1.12–1.14 | Mixed-characteristic Tate modules, connected–étale decomposition and formal-group equivalence have the needed complete local bases. Height-one étale groups have dimension 0. |
| SelmerIwasawaCohomology | §§0.8–0.11,3.6–3.7 | Finite-S Kummer completion retained. Current §3.7 is cyclotomic; the general character twist is explicitly a gap. For κ(γ)=4 its chosen-basis twist has scalar1/4, consistent with diagonal-action transport. |
| PadicHodgeRegulators | §§1.4,1.7,1.11 | Dual exponential, trace/corestriction and semilocal target; rational trace descent is available for R03. |
| PadicFamilies | §4.0.1 | Owns the normalized integer theta unit. This package extends to CM ideals instead of reconstructing the integer unit. |
| NeronModelsAndSemistableAbelianVarieties | §5.1; §5.1a inspected for repair | NOS requires unramified Tate action. Potential good reduction is weaker; R03 cannot invoke the former without proof. |
| ModularSymbolsPadicLFunctions | §§1.2,4.3 | Algebraic normalized coordinates, not arbitrary complex periods, are transported by coefficient embeddings. |
| GL2AutomorphicRepresentationsAndTransfer | R17.4.16; R16.2.13, R16.5.3, R16.6.1 for the repair | General induction plus archimedean/classical comparisons supply §6.3; R06 adds the missing comparison citations instead of using the rational-CM-curve target. |
| DiophantineApproximationAndTranscendence | §§2.1,2.3 on main | Finite-place subspace theorem/Ridout input, with algebraic directions. |
| GlobalNumberFields | Completed Layers9–11 | Continuous Hecke characters need not be unitary or finite order; infinity types and order/Picard carriers are supplied. |
| ClassFieldTheory | Layer13 on main and pinned ring-class fields | Ray/Hilbert/ring-class fields already owned; this package derives its anticyclotomic quotients. |
| Chebotarev | Completed Layer10 | Nonempty Frobenius class density #C/#G>0 survives finite exclusions; supplies infinitely many auxiliary primes. |
| LocalFieldsRamification | Completed Layers2–3 | Unramified extensions and ramification factorization supply the disjointness argument; degree24 versus auxiliary degree23 does not require coprimality in general. |
| EllipticCurves | Layers1–3 on main | Isogenies, differential, torsion, Weil pairing, Tate module and Frobenius polynomial. |
| ArithmeticDirichletSeries | Completed Layers3,5 | Native Euler products, ideal-count bounds and summation; no re-planned generic analytic carrier. |
| NoncommutativeAndEquivariantIwasawa | §4.3 ownership boundary | Owns the rational CM, ordinary split-prime elliptic-unit/Katz-measure construction. Its hypotheses E/Q,p≥5 ordinary do not supply the general-prime Kato construction here. |

Both gap slugs occur in the README and `design/plan.json`, with named earlier suppliers and matching needs. Neither a local FQ theorem nor the noncyclotomic finite-free character-twist contract was found already supplied at the inspected sections. These gaps are accepted as declared contracts, not findings. The layer-order problem R02 is internal and is not detected by the roadmap-level graph.

Mechanical check output, unmodified:

```text
depcheck: 223 roadmaps, 1983 edges, 0 problem(s)
```

Ownership searches used the roadmap tools on main and current open heads, plus the board packages, by objects including elliptic units, canonical CM pairs, height-one reciprocity, Shintani functions and Rohrlich counts. The nearest scopes read were KatoEulerSystems, AnticyclotomicLocalUnits, ComplexMultiplicationAndExplicitReciprocity, CMRankZeroConverse, ModularIwasawaMainConjectures, LFunctions and GlobalNumberFields. Modular-form Kato systems, signed local-unit projections and CM rank-zero consequences are distinct downstream interfaces. The general CM units/reciprocity overlap with ModularIwasawaMainConjecturesPartII is the settled F10 of the earlier repair report: this earlier owner supplies the later roadmap. Its stated reason remains valid; it is not re-raised. No second copy of this roadmap or colliding fully qualified declaration name was found in the supplied material.

Pinned checks included the following actual declarations, rather than search-result suggestions:

- TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70: `HeckeCharacter` is the continuous multiplicative-character carrier into C-units; it does not impose finite order or unitary values.
- TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean:120,155,200: `idealCharacter`, `idealCharacter_apply_prime`, `idealCharacter_apply_toPrincipalIdeal`; prime evaluation uses a uniformizer with valuation `exp(−1)`, and principal evaluation is the inverse archimedean component.
- TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:155,177,214,222,251: unramifiedness, Artin map, Frobenius comparison, degree and complete-splitting criterion; primes must avoid the order conductor.
- Mathlib/Algebra/MonoidAlgebra/Basic.lean:231,250: `MonoidAlgebra.lift`, `lift_single` evaluate a basis element at the direct character, not its inverse.
- Mathlib/RingTheory/LinearDisjoint.lean:233: `Subalgebra.linearDisjoint_iff_injective`; this does not assert disjointness for arbitrary ramified coefficient fields.
- Mathlib/NumberTheory/LSeries/Nonvanishing.lean:412: `DirichletCharacter.LFunction_apply_one_ne_zero`; its nontrivial Dirichlet-character result does not prove the CM anticyclotomic headline.

The Loogle/LeanSearch leads for elementary norms, algebraicity and Euler products did not match either Rohrlich count theorem or the parity theorem. The existing Dirichlet Euler product is not the required general Hecke-character central-value construction. No declaration qualifies for deletion as a one-library-lemma duplicate.

### Source locators and expression audit

The following 28 locator groups were checked in the legal cached text; “located” includes locating a false source assertion, which is not a certification of its truth. The Yang group is separately partial. The source-line references locate each passage without reproducing it.

| Group | Source and locator read | Comparison / computation |
|---|---|---|
| 1 | BKO21 lines275–327, §3.0.1 pp.950–951 | Canonical/inert setup and split auxiliary prime; p5,l23 passes. |
| 2 | BKO21 lines390–465, §3.0.2 pp.951–953 | Integral character lattice, period and dual-exponential normalization; R04 isolates what must be tied together. |
| 3 | BKO21 lines474–488, Proposition3.3 p.953 | c=n+1 nontrivial conductor parity; (−1)²=1,(−1)³=−1. |
| 4 | BKO21 lines489–513, Theorem3.4 pp.953–954 | Inert correction terms0, normalized unit valuation0. |
| 5 | BKO21 lines819–844, §6.0.1 p.961 | Period-lattice choice and nonzero-character interpolation; signed derivative belongs downstream. |
| 6 | KATO04 lines212–239, Proposition1.3 pp.121–122 | Degree-coprime isogeny norm stated in the integer-unit source. |
| 7 | KATO04 lines5150–5241, §15.3 pp.251–252 | Canonical marked pair, injective unit condition and Artin quotient orientation. |
| 8 | KATO04 lines5242–5259, §15.4 p.252 | Ideal theta function; unrestricted isogeny-norm assertion fails at [5]. |
| 9 | KATO04 lines5262–5340, §§15.5–15.6 pp.253–255 | Inverse theta units and smoothing; sign changes under Kummer inversion. |
| 10 | KATO04 lines5383–5453, §§15.7–15.8 pp.256–257 | Inverse Galois action, finite-idelic local factor and de Rham descent; 81 cancels81. |
| 11 | KATO04 lines5478–5571, Proposition15.9 proof pp.258–260 | Translation/reduction issues and derivative calculation; R03 and source issues below. OCR prevents full formula certification. |
| 12 | FINIS06 lines101–122, Theorem1.1 p.769 | Split versus nonsplit valuation-prime formulas and exceptional denominator; weight-one scope matches. |
| 13 | FINIS06 lines180–295, §2 pp.771–773 | Automorphy, semicharacter, dimensions and trace; normalized adjoint requires index divisor. |
| 14 | FINIS06 lines470–535, Proposition2.2/Corollary2.3 pp.778–779 | Full multiplicities versus primitive multiplicity one, used in R01. |
| 15 | FINIS06 lines558–580, (9), Proposition2.4 p.780 | Class sum coefficient1; Yang constant√7/π for D7,h1,w2. |
| 16 | FINIS06 lines642–691,765–810, Lemmas3.1–3.3 pp.782–785 | Arithmetic/integral translated values and G⊂T_int⊂(dD)⁻¹G. |
| 17 | FINIS06 lines813–940, Proposition3.4, Lemma3.5, Propositions3.6–3.7 pp.786–789 | Bilinear period factor, false unrestricted dagger claim, definition of b and valuation identity. |
| 18 | FINIS06 lines1134–1148, proof of Theorem1.1 p.794 | Combining valuations produces the retained D^(1/4); pairing denominator required. |
| 19 | FINIS06 lines1210–1238,1571–1608, Theorem4.1 p.795 and Lemma4.5 p.803 | Distinct-prime, split-tower theta nonvanishing and torsion-density input located. |
| 20 | ROHRLICH-NOTES lines660–695, Propositions1.5–1.6 pp.14–15 | Odd-discriminant sign and even-discriminant exclusion; D7 versusD11. |
| 21 | ROHRLICH-NOTES lines1650–1730,1828–1850, Lecture2 §§5.1–5.2,7.1 pp.34–38 | Local signs transported at both infinity and ramified places; products1 in both conventions. |
| 22 | ROHRLICH84 lines750–920, §3 Propositions1–2 pp.401–407 | Algebraic directions, q-divisibility and strict exponent intervals, not a uniform bound independent of directions. |
| 23 | JIA24 lines110–163,430–496, Property1 and §2 average | Rational-principal law and support decomposition; omitted conductor Euler factors must be retained. |
| 24 | JIA24 lines870–940, §4 Proposition5 and proof pp.18–20 | Correct modulus qZ_p and bound q^c, not the two printed alternatives. |
| 25 | RUBIN87 lines183–226, Lemma3.1 p.409 | Inert local tower parameter and field degrees; first layer degreep²−1. |
| 26 | GREENBERG83 lines250–342, §1 pp.246–247 | Conductor root-number ratio, not a formula for trivial order index n=0. |
| 27 | AH05 lines128–155, Proposition3.1/Remark3.2 p.4 | n>0 gives sign(−1)^(n+1); n=0 omitted in that formula. |
| 28 | QUEYRUT74 lines78–105, theorem/local formula p.135 | Finite-order FQ specialization located; general quasi-character version remains the declared supplier contract. |
| Partial | YANG97 lines685–707,865–885, Theorems2.6,2.15 pp.43,48 | Theorems located; OCR does not certify all constants in (2.19). Finis's reformulation was the readable comparison. |

Six further wording comparisons, separate from the locator groups: the convention paragraph on duals (README:46 versus BKO21 lines404–416); the period-change proof (README:449 versus BKO21 lines390–416); semilocal augmentation (README:498 versus BKO21 lines447–465); the Finis-specialization argument (README:713 versus BKO21 lines501–508); the scalar/tensor argument (README:782 versus BKO21 lines252–274); the Lean parity docstring (Suggested.lean:154 versus JIA24's introduction and AH05 lines141–152). The mathematical terminology and formulas coincide where forced; no copied sentence, clause-by-clause prose adaptation, table, figure or example list was identified. The six additional comparisons are prose or docstring comparisons, not additional mathematical locator certifications.

Named citation occurrences before the bibliography: FINIS06/Finis38, KATO04/Kato2004 27, BKO21/BKO25, JIA24/Jia10, ROHRLICH-NOTES6, ROHRLICH84 4, GREENBERG83 2, RUBIN87 2, and QUEYRUT74, AH05, YANG97, KATO99, BOXALL92 one each: 119 groups. A parenthetical citation containing several theorem numbers is one group; repeated cache-line annotations are not additional groups.

FINIS06 has the largest share. Its sections run introduction/main theorem, theta/Shintani theory, arithmetic theta functions, nonvanishing. The roadmap's §4.1 uses introductory local invariants, §4.2 combines theta spaces and Yang's formula, §4.3 constructs integral pairings and their valuation identity, §4.4 isolates the torsion-density theorem, §4.5 proves theta nonvanishing, and §4.6 returns to the introductory theorem. The sequence of theta carrier → integral evaluation → reduction/nonvanishing → divisibility is forced by Needs at README:614,653,676,691. It is not a one-to-one run of the source's sections, and the remaining six layers have separate Kato, BKO and Rohrlich/Jia objectives. The internal premature b-definition is R02, not an arrangement-copying finding.

## Not verifiable

- KATO99 Theorem4.3.1 is settled uncertified. Its complete height-one hypotheses and the absolute normalization of the displayed exponential formula cannot be certified from KATO04's citation alone. No renewed source request was made.
- BOXALL92 Theorem1 is settled waived. FINIS06's use was read, but the full general statement in README §4.4 was not checked against the primary article. No renewed source request was made.
- YANG97's OCR does not preserve every constant in (2.19). The readable FINIS06 Proposition2.4 was checked; independent certification of Yang's printed normalization is incomplete.
- KATO04's extracted displayed formulas contain missing symbols. The divisor, translation, local degree and derivative witnesses in this report are independently computed; they do not certify every symbol of the general r reciprocity formula.
- FINIS06's extracted equation(13) has ambiguous fraction placement. The roadmap's denominator was checked against the surrounding derivation and valuation identity. No typography-only misprint is alleged from that extraction.
- No new Lean elaboration or build was run, as required by the read-only brief. Binder conclusions rely on the supplied elaborated signatures and inspection of the real definitions. The extraction's two spurious prose entries are not Lean declarations.
- These computations do not replace proofs of the deep claims. In particular they do not compute explicit exceptional conductor bounds, values of unknown periods, or the finite exceptional sets. The sources also do not supply effective bounds here.

## Source issues

- **Error** in FINIS06 at Lemma3.5(4), printed p.787 (line860): the source says every Shintani eigenvector is proportional to its conjugate; it should be restricted to a conjugation-stable eigenspace of multiplicity one, including the primitive eigenspaces; affects a stated result.
- **Error** in KATO04 at proof of Proposition15.9, printed p.258 (lines5492–5494): the source says the chosen canonical CM curve has good reduction at all finite places from the modulus inclusion; it should be base-changed to obtain good reduction unless unramifiedness of the actual Tate module is independently proved; affects the proof.
- **Error** in KATO04 at (15.4.2), printed p.252 (lines5254–5255): the source says the CM theta unit is preserved by the norm for any CM isogeny; it should be restricted to isogenies whose kernel has annihilator prime to the smoothing ideal; affects a stated result.
- **Misprint** in KATO04 at proof of Proposition15.9, printed p.258 (line5490): the source says translate theta by plus ν_n, with ν_n=ξ_n−α_n; it should be translated by minus ν_n to evaluate at α_n; affects the proof.
- **Misprint** in FINIS06 at definition of the trace operator, printed p.772 (lines239–240): the source says the unnormalized trace is the adjoint of inclusion; it should be the trace divided by the lattice index for the displayed scalar products; affects a stated result.
- **Misprint** in JIA24 at §2 after Property1, v1 p.4 (line155): the source says the rational-principal value is κ(n)/n; it should be κ(n)n in the stated type-(1,0) convention; affects a stated result.
- **Misprint** in JIA24 at (2.43), v1 p.10 (line486): the source says the tail is bounded by an exponential with positive exponent; it should use the negative exponent to obtain exponential decay; affects the proof.
- **Misprint** in JIA24 at §4 definition of M(q,t), v1 p.18 (line875): the source says divisibility is modulo Z_p; it should be modulo qZ_p; affects a stated result.
- **Misprint** in JIA24 at (4.9), v1 p.20 (line936): the source says the archimedean bound is q⁻¹; it should be q^c, from membership in M(q,q^c); affects the proof.
- **Misprint** in YANG97 at (2.28), printed p.47: the source says the intertwining normalization has exponent1/3; it should have exponent1/2; affects the proof; corrected in print at FINIS06 p.779 footnote4 (line554).

Source independence: 35 passage groups compared with 11 sources, including one partially legible Yang group; no prose copying or reused tables identified. Largest share FINIS06, 38 of119 named citation groups. Contents compared with FINIS06: independent organization, with the internal dependency defect R02. KATO99 and BOXALL92 primary texts remained unavailable under their settled statuses.

## For the human reviewers

- KATO99 Theorem4.3.1 is uncertified and BOXALL92 Theorem1 waived. The primary-text checks of height-one reciprocity and torsion density remain incomplete; no new access or licence decision was made.
- YANG97's OCR does not preserve all constants of (2.19); the formula comparison relies on FINIS06 Proposition2.4. This does not affect the contents comparison with FINIS06, whose text was readable.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9301218ac9e99d3458d283288a23948760d9568b", "job": "RT-NonordinaryCMSpecialValues~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
