# ComputationalNumberTheory repair report

Finding numbers retain the reviews' identifiers; the italic attribution distinguishes repeated numbers. The NumberFieldArithmetic findings overlap and are settled together. These are repair verdicts, not independent acceptance.

## F01 (P1) — applied

*Review r2a F01.*

An unnamed complete-DVR input → `henselFactor_completeDVR` in §1.26a and Lean, plus the finite-factor version and three Checks. The polygon theorem consumes it; §1.26 remains the finite-quotient specialization. Completeness and separatedness are explicit. Evidence: MilneANT line 5346, line 5365 and line 5389; Mathlib `RingTheory/Henselian.lean:49` does not supply factor lifting.

## F02 (P1) — applied

*Review r2a F02.*

Unspecified AKS estimates → §1.13a's substitution automorphisms, compatibility laws, evaluation-image upper/lower bounds and growth contradiction, with every common and additional hypothesis stated. `aks_correct` consumes their names. The proposed bounds agree with Shoup line 21783, line 21819 and line 21864. The prime-power example n=2, r=31 shows why the upper bound needs its exclusion.

## F03 (P1) — applied

*Review r2a F03.*

A cusp basis used as an implicit full modular basis → `exists_integralModularBasis`, in §3.3a and Lean, with distinct bounded pivots and integral coordinates. The congruence theorem consumes it. Checks include weights zero, two, odd weights and twelve. Evidence: Stein line 1096, line 1134 and line 1162; the constant-term-one monomial avoids Eisenstein denominator problems.

## F04 (P1) — applied differently

*Review r2a F04.*

An unnamed Turing upper count → §4.21a's completed-function normalization, horizontal argument, contour/difference/integrated counts, explicit Turing bound and completeness comparison. Conductor one retains both poles, Gamma poles use removable continuation, and boundary zeros require an outer zero-free height. Evidence: Platt line 227, line 271 and line 321; Mathlib `LFunction_eq_completed_div_gammaFactor`; Tau Ceti `argumentPrinciple_starConvex`.

## F05 (P1) — applied

*Review r2a F05; overlapping r2b F05 (P3).*

A local-degree input without its global bridge → NumberFieldArithmetic §§5.3/5.5, naming `semilocalEquiv`, factor/place and factor/completion equivalences, and both invariant comparisons. Scope, supplier contract and Layer 2 dependencies now link `Completed/NumberFieldArithmetic/README.md`. Evidence: that README §§5.3 and 5.5. No completion decomposition is reconstructed here.

## F06 (P2) — applied

*Review r2a F06.*

Number-field-only monotonicity → characteristic-zero-field `IsPMaximal` and `isPMaximal_mono`. Prime/finite-generation assumptions on the radical membership adapter → arbitrary natural p and arbitrary subalgebra of a number field. Arithmetic maximality theorems retain their hypotheses. The monotonicity proof only transports membership; ideal radical membership needs neither deleted condition. Elaborated types confirm both changes.

## F07 (P2) — applied

*Review r2a F07.*

A README-only eight-scalar milestone → real-bodied `ctExplicitFormula`, proved shared-value identity and length-one/two example, rational boundary target, and `exists_ctEnclosure` for all eight intervals with equal slots 1 and 4. Evidence: CL line 11665 through line 11673 and CT line 1543 through line 1560. All derivatives, shifts and tail signs match the displayed formulas.

## F08 (P2) — applied

*Review r2a F08.*

Existence of an unspecified presentation change → existence with `P.b=X+2` and `P.c=X+1`. The named theorem now constructs that pair and proves all three divisibilities without an admitted theorem. In characteristic three the two substituted quadratics equal the displayed target polynomials and the composite is X+3=X. The characteristic-seven inverse-direction control remains.

## F09 (P3) — applied differently

*Review r2a F09.*

Duplicate vacuity Check → rejection of the nonempty n=9 identity range. Added the requested square, Hensel, real/dyadic span and analytic controls. Hensel's six assertions and the digamma control are proved; substantial comparisons remain named theorem targets, never admitted examples. The dyadic target states order two and strict inequality with eight. Binomial even/odd sums are both 256≡4 modulo nine.

## F10 (P3) — applied

*Review r2a F10.*

Arb attributed algebraic-root arithmetic → native relative-algebraic-closure contracts and finite-root separation. Added `algebraicRootCertificate_exists` in §0.9a and Lean; arithmetic and complete root isolation consume it. Arb's manifest attribution now concerns enclosure semantics only. Evidence: Arb line 779 and line 800; Mathlib `FieldTheory/AlgebraicClosure.lean:39`, `:54`, and `Polynomial.finite_setOfPred_isRoot`.

## F11 (P3) — applied

*Review r2a F11.*

Literal expanded arithmetic derived from an admitted theorem → `multiplicityLift` and `multiplicityBlockGram`, used by the headline and directly evaluated in two proved examples. README adds their APIs and singleton/zero-block Checks. For blocks (2,3), five ones give 30−64=−34; an empty block gives zero against reduced value −1. Positivity stays explicit. Evidence: CT line 755 and direct expansion.

## F12 (P3) — not actionable in this package: publication export is controlled outside this package

*Review r2a F12.*

The finding concerns which board changes the worker exports, not package mathematics. Editing this package cannot configure that publication boundary. `merge-order/ORDER.txt` remains intact, as required. The maintainer must export only `packages/ComputationalNumberTheory/` into the roadmap repository and exclude board merge-order metadata. The required dependency check reports zero problems.

## F01 (P2) — applied

*Review r2b F01.*

Two field-dependent boundary signatures without prime facts → explicit `[Fact (Nat.Prime 7)]` on `PresentationChange.scaling_seven_impossible` and `[Fact (Nat.Prime 5)]` on `FiniteFieldFactorCertificate.five_split`. Both use native `ZMod` field instances and now elaborate. Their mathematical assertions and README Checks are unchanged.

## F02 (P2) — applied

*Review r2b F02.*

The bundled point-count control lacked the field instance for `ZMod 5` → explicit `[Fact (Nat.Prime 5)]`. Pinned Tau Ceti `AlgebraicGeometry/EllipticCurve/PointCount.lean` requires `[Field F]`; the final signature elaborates against that module. Counts remain 4, 6 and 3, including the singular model and characteristic-two control.

## F03 (P3) — applied

*Review r2b F03.*

Six rejected proof terms → corrected zero-subtraction elimination, explicit strong-liar witness, list-product nonvanishing, subgroup membership proofs, rational reciprocal normalization and complex-box unfolding. Removed the reported unnecessary tactics and unused section instance. The old multiplicity proof is replaced under r2a F11. Full-file elaboration succeeds with only intentional target-admission warnings.

## F04 (P3) — applied

*Review r2b F04.*

Six Tau Ceti imports → the two defining modules actually referenced: `PointCount` and `MordellWeil.XSubT`. Native Mathlib objects require no Tau Ceti wrapper import. Both compiled modules are present; full-file elaboration succeeds with the reduced imports. README supplier contracts remain broader because the full roadmap consumes more than its representative Lean signatures.

## F06 (P3) — applied

*Review r2b F06.*

Two elementary admitted boundaries → proofs: `pRadicalLattice_zero` simplifies the native radical/map adapter, and `LocalExpansionCertificate.uniformizer_inverse` supplies exponent −1, digit one and zero error explicitly. The definitions and theorem types are unchanged. Final elaboration verifies both terms.

## Adversarial mathematics pass

Each row covers the stated targets, their displayed APIs, and their associated named boundary targets. This includes the README-only targets. Existing targets were checked without expanding their scope. “Retained” means the instances and proof argument support the statement; it does not mean its admitted Lean proof has been completed. Source theorem statements, not large datasets, support the finite classifications and Platt conclusions.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §0.8 `AlgebraicRootCertificate`, value, membership and uniqueness | X; X²; X²−1 in one rectangle | Distinct-root uniqueness admits repetition but excludes two values. | Native attribution |
| §0.9 rational presentation and arithmetic | 0; 1/2; 1/3; 5/6 | The selected linear root is the rational cast. | Corrected decoding proof |
| §0.9a `algebraicRootCertificate_exists` | Rational roots; repeated zero; a nonreal root | Finite distinct roots admit rational separation. | Added |
| §§0.10–0.12 arithmetic certificates | Zero sum/product; inverse of one; inverse of zero | Field closure plus separation works; inversion needs nonzero input. | Explicit existence input |
| §0.13 `algebraicEqual` and its laws | Equal rational expressions; unequal halves/thirds; overlapping boxes | Decoded equality, not rectangle overlap, is decisive. | Native attribution |
| §0.14 `PadicApproximation` and denotation | Zero ball at N; v=−1 at p=3; mantissa divisible by p | Precision and valuation differ; 1/3 is the stated centre. | Retained |
| §0.15 Rabin soundness/completeness | Linear polynomial; irreducible quadratic over F₂; split quadratic over F₅; X⁴+1 | Frobenius divisibility alone is insufficient; positive degree and all prime divisors matter. | Prime fact repaired where needed |
| §0.16 finite-field presentations, maps, inverse and minimal polynomial | Base field; degree two; reducible input; infinite-dimensional K | Positive finrank equation forces finite dimension and the full generated field. | Retained |
| §0.17 presentation changes | Identity; (X+2,X+1) over F₃; (2X,2X) over F₇ | Correct inverse direction; the latter composite is 4X. | Specified pair proved |
| §1.1 raw Pratt trees | Leaf 2; node 3; malformed node 1 | Raw syntax has no primality implication. | Retained |
| §§1.2–1.4 Pratt validity, soundness and completeness | 2,3,5; node 9; repeated children | Lucas hypotheses are exactly supplied by valid children and the full product. | Retained |
| §§1.5–1.6 tree size and quadratic existence bound | Sizes 1 and 7; repeated twos; an odd prime child | Repetition is charged; every nontrivial odd child is at most half the parent. | Retained |
| §1.7 strong-liar predicate | (7,3); n=1; (2047,2) | Prime passes; one fails; composite pseudoprime passes. | Direct witness proof |
| §1.8 prime strong-liar theorem | p=3; bases 1,p−1; p=2 | Oddness excludes the even prime; the squaring chain gives the alternatives. | Retained |
| §§1.9–1.10 liar and independent-tuple bounds | n=9,15,25; k=0,1 | Counts 2,2,4 satisfy the bound; the empty tuple gives equality 1=1. | Retained |
| §1.11 `aksOrder`, `aksLen`, parameter and minimality | n=0,1,2,9; r=2 for nine | Sentinels and least moduli agree; order one fails the strict threshold. | Retained |
| §1.12 AKS identities | Characteristic five; empty range at nine; n=9,r=2,ℓ=1 | The last remainders are 4X+4 and X+1. | Rejecting Check added |
| §1.13 AKS acceptance | 1; 2; perfect power 9 | Size, non-power and parameter alternatives have independent roles. | Retained |
| §1.13a substitutions and compatibility | k=1; composed substitutions; Frobenius p | Exponents multiply, congruence modulo r identifies maps, and D(k) is multiplicative. | Named inputs |
| §1.13a AKS upper bound | n=2,p=2,r=31; non-prime-power n | S has size 32 in the prime-power control, exceeding the alleged bound 16 without the exclusion. | Hypothesis explicit |
| §1.13a AKS lower/growth bounds | ℓ=0; failed identity at nine; t between the order and r | Proper subsets give 2^min(t,ℓ)−1; both strict numerical guards are needed. | Named inputs |
| §1.14 `aks_correct` | 2; odd primes; 9; final composite branch | Least r gives p>r; the named bounds contradict each other. | Dependencies closed |
| §§1.15–1.16 Pocklington | n=17,F=8; F=2; repeated q; a=0 | Full q-primary order divides p−1; F²>n is essential, while coprime cofactor is unnecessary. | Retained |
| §§1.17–1.18 Pocklington certificate and soundness | Three twos; empty list; one two | Only the first data certify 17. | Retained |
| §§1.19–1.21 integer factor presentations | ±1; 12; −12; zero | Empty products handle units; valid prime products cannot vanish. | Retained |
| §§1.22–1.24 finite-field factors | Unit; split quadratic; repeated linear factor; zero | Leading scalar and multiplicities are retained; normalized factors ignore scalar units. | Prime fact repaired |
| §1.25 coefficient transport | Identity; translated presentation; repeated factors | A field equivalence preserves products and irreducibility. | Retained |
| §1.26 finite Hensel | k=1; X²−2 modulo 49; X² modulo 4 | 10²≡2 mod49; two distinct noncoprime lifts exist mod4. | Six assertions proved |
| §1.26a complete-DVR Hensel | Constant factor 1; F₂[[t]]; ℤ₂; arbitrary residue field | Bounded coefficients converge; equal characteristic works; repeated residue factors invalidate the coprime hypothesis. | General target added |
| §§1.27–1.28 rational factors | Constants; (X−1)²; 2X²+3X+1; zero; X⁴+1 | Nonmonic scalar and repetition persist; irreducible reduction is unnecessary. | Product proof corrected |
| §2.1 order bases and coordinate API | Basis [1]; rank zero; basis [1/2] | The last two fail the unit or multiplication equations. | Retained |
| §2.2 multiplier ring | Zero lattice; ℤ in ℚ; multiplier 1/2 | Zero has full-field multipliers; the integral lattice excludes 1/2. | Retained |
| §2.3 p-maximality and monotonicity | p=1; ℤ in ℚ; overorders; ℚ(X) | Denominator clearing is monotone without finite-dimensionality. | General field signature |
| §2.4 Frobenius nilradical | Zero algebra; dimension one; k=0 | A nilpotent multiplication map has exponent at most dimension; the zero algebra is harmless. | Retained |
| §2.5 radical adapter and API | p=0; R=⊤; p=3 in ℤ | Zero radical is zero; nonzero p is a unit in the field; 3 is in and 1 out of the integer radical. | General adapter, zero proved |
| §2.6 multiplier criterion | Maximal order; nonmaximal order; zero lattice excluded | Finite spanning order and primality are required for the arithmetic equivalence. | Hypotheses retained |
| §§2.7–2.8 integral bases and extension | ℚ; rank zero; half-integral basis; an already maximal order | Integral closure contains every finite order; basis equality is not asserted. | Retained |
| §2.9 prime-ideal factors | ℚ at 2; p=1; zero ideal/exponent | Empty data represent the unit ideal only; prime input requires factors. | Retained |
| §2.16 φ-expansion | Zero; φ=X; φ=X−1 with f=X² | Coefficients are respectively zero, ordinary scalar coefficients, and 1,2,1. | Retained |
| §2.17 coefficient valuation | Zero; 3X+9; X² | Values are ∞,1,0; zero coefficients are excluded from the minimum. | Retained |
| §2.18 Newton side | X²−3; zero; attempted slope −1 | Endpoints give −1/2; positivity and hd≤u exclude false natural-subtraction witnesses. | Retained |
| §2.19 residual polynomial | X²−3; (X−3)²; zero | Residuals are Y−1, (Y−1)², zero; exact division precedes reduction. | Retained |
| §2.19a polygon product/factor/residual laws | Unit factor; two slopes from (X−3)(X−9); φ²; repeated residual | Concatenation and −∞ factors retain their multiplicities; first-order repeated residuals give no irreducibility claim. | Complete-DVR input named |
| §2.20 Ore irreducibility | Single side X²−3; repeated residual; s=0 | Both the full primary reduction and irreducible residual are necessary. | Retained |
| §2.21 local expansion | Zero; π⁻¹; one with zero centre | Inverse has exponent −1 and digit 1; the false zero centre violates the norm bound. | Inverse boundary proved |
| §2.22 square criteria | 17,5 in ℚ₂; 6 in ℚ₅; π²=2 ramified case | Modulo 8 distinguishes 17 and 5; (1+π)²=3+2π fixes the uniformizer convention. | Named bundled controls |
| §2.23 p-adic roots | X²−2 at p=7 and p=2; a linear factor | Degree-one completion factors count roots; ramification excludes the dyadic root. | Global bridge imported |
| §§3.1–3.2 integral modular/cusp lattices | 0; E₄; E₄/2; Δ; Δ/2 | Constant and first coefficients discriminate integrality; weight-zero cusp lattice is zero. | Retained |
| §3.3 Miller basis | Weights 0,2,12 | Empty, empty, singleton Δ; leading coefficients give integral coordinates. | Retained |
| §3.3a full modular basis | Weights 0,2; odd weights; 12 | Constant one is required at zero; E₄³−720Δ and Δ have pivot matrix identity at twelve. | Added |
| §3.4 congruence Sturm | Constant form; pΔ; coefficient at the cutoff | Integral pivot coordinates propagate divisibility; complex equality alone does not. | Full basis consumed |
| §3.5 modular data comparison | Cutoff zero; equal arrays; zero versus Δ | Coefficient binding and the actual cusp width are indispensable. | Retained |
| §§3.6–3.7 Hecke recurrence/matrix | Weight two; T₂Δ=−24Δ; empty determinant | Operator uniqueness follows from q-expansions; column convention gives determinant one at rank zero. | Retained |
| §§3.8–3.9 weight 26 | Coefficient at 107; reduction mod107 | The displayed integer reduces to −1 and is ordinary. | Retained |
| §3.10 weight 38 determinant | Matrix [[3,17],[25,10]] mod79 | Determinant −395=−5·79 is zero. | Retained |
| §§3.11–3.13 nonordinary pairs | Weight two; primes 59,79; companion relation k+k'=p+3 | Empty determinant excludes zero dimension; the table and gcd filter have distinct roles. | Retained |
| §§3.14–3.16 companions | (107,26); exponent 81; weights 52/100 at151 | 25+81=106; gcds at151 are 3, so those pairs fail the BCG coprimality condition. | Retained |
| §3.17 point counts and trace | Cubics over F₃,F₅,F₂; singular cubic | Counts 4,9,6,3; character formula requires odd characteristic. | Prime instance repaired |
| §§3.18–3.19 local image/span/completeness | Real split cubic; empty list; one dyadic generator | Real signs generate order 2; dyadic generator has order 2, below full order 8. | Actual span targets |
| §3.20 complete local images exist | Real one/two components; dyadic place; identity class | Nonzero square classes are open, rational abscissae are dense, and the quotient is finite. | Retained supplier gap |
| §3.21 good odd local image | Splitting types (3),(1,2),(1,1,1); p=2 excluded | Norm-kernel orders 1,2,4 agree with 1+r; unramified unit norm is an input. | Retained |
| §3.22 saturation | 6ℤ; ⊤; ℤ×0 inside ℤ×ℤ/2 | Prime-to-index criterion agrees; omitted ambient torsion defeats the intersection-only condition. | Membership proof repaired |
| §3.23 both divisibility criteria | Empty list in ℤ/3 at2; empty list in ℤ/2 at2; g=2 in ℤ | Quotient generation permits prime-to-p torsion; A[p] must still be included. | Retained |
| §3.24 exact divisibility | Infinity; nonzero affine P; p-torsion Q | Infinity is divisible; the affine polynomial is nonzero monic degree p² and Q must actually map to P. | Retained |
| §§3.25–3.26 sieve and finite criterion | Reduced order prime to p; g=2Q; g=(Q,2Q); torsion-only group | Kernels only give necessary conditions; divisibility and independence are both tested. | Retained |
| §§4.1–4.2 signed interval product | [−2,3][−4,5]; zero; [−1,1]² | Endpoints −12,15; zero annihilates; lower endpoint −1. | Retained proved examples |
| §§4.3–4.4 interval inverse | Positive/negative intervals; singleton zero | Endpoints reverse; zero is rejected. | Rational proof repaired |
| §§4.5–4.6 dyadic hull and width | 1/3 at2; −1/3 at0; grid endpoints | Floor/ceiling give [1/4,1/2], [−1,0]; each endpoint moves by less than one grid step. | Retained |
| §4.7 complex boxes | Singleton 0; singleton i; positive real lower bound | Correct component inequalities; boxes need not avoid branch cuts. | Singleton proof repaired |
| §§4.8–4.9 integer recovery | [3/4,5/4]; [0,1]; {1/2}; unknown nonintegral input | Outputs 1,none,none; an independent integrality hypothesis is necessary. | Retained |
| §4.10 p-adic normalization | c=0; 5 mod3; 9 mod3² | Canonical zero branch uses valuation N, not the native valuation-at-zero default. | Retained |
| §4.11 p-adic sum | 1+O(9), 2+O(27); zero balls | Cancellation raises centre valuation without raising absolute precision. | Retained |
| §4.12 p-adic product | O(9)O(81); 3+O(81) times 1/3+O(9) | Precisions are 6 and 3; all mixed error terms are bounded. | Retained |
| §4.13 p-adic reciprocal | Zero ball; unit; 3+O(81) | Zero is rejected; N−2v gives precision 2 in the last example. | Retained |
| §4.14 kernel | 0,1,−1 | r(0)=2/π²; strict positivity; the function is not even. | Unnecessary tactic removed |
| §§4.15–4.16 geometric/alternating tails | N=0; b=0; small positive α | Full sums are included and 1−exp(−α)>0; first omitted magnitude controls alternating error. | Retained |
| §4.17 eight scalars; `ctExplicitFormula_fourier`, `ctExplicitFormula_G_imag` | ℓ=0,1,2; arbitrary w; chain-rule factors in φ' | The two named equalities unfold directly for every real ℓ; analytic arguments require ℓ>0. | Missing named equalities proved |
| §4.17a digamma/trigamma bounds | z=1; N=1,2; z=0 excluded; α(N+1)=1 | Digamma tail vanishes; trigamma partial sums 1,5/4 have the stated errors; denominators are positive. | Boundary targets, digamma proved |
| §4.18 CT enclosures | ℓ=1,P=5; ℓ=2,P=4; shared slots | Widths 1/50 and 1/25 meet 1/32 and 1/16; equal scalars can use equal intervals. | Headline added |
| §4.19 complete root isolation | Nonzero constant; (X−1)²; X²+1 | Distinct root counts 0,1,2 permit disjoint rectangles. | Existence input named |
| §4.19a Euler–Maclaurin remainder | s=2,m=1; s=0; nonprincipal s=1; principal pole | The exponent/denominator guard is positive; the removable expression has limit −log(N+t). | Retained |
| §4.20 Dirichlet boxes | ζ(2); ζ(0); ζ(1) excluded | Rational bounds enclose π²/6 and −1/2; continuation is not a divergent raw series. | Retained |
| §4.20a cusp Mellin tails | f=0; k=12,s=6; k=18,s=9; N=0/3 | Signs i^k give addition/cancellation; the two denominator guards control the tails. | Retained |
| §4.21 cusp boxes | 0; Δ at12; −Δ at12 | The two signs occupy opposite nonzero rectangles. | Retained |
| §4.21a completion and argument counts | q=1; Gamma poles/trivial zeros; conjugate pair; zero-free band | Meromorphic continuation removes Gamma singularities; conductor one contributes two poles; both characters enter the symmetric count. | Exact contracts added |
| §4.21a Turing/completeness | M=0,U<1; overlapping intervals; a double zero; boundary height | Integer counts close only with a certified upper bound; multiplicity and boundary contributions cannot disappear. | Exact contracts added |
| §§4.22–4.24 finite zero/nonvanishing results | Odd/even modulus; q=1; height zero; q=0 excluded | Modulus parity fixes height; central nonvanishing is separate; the real-zero corollary uses both inputs. | Counting dependencies closed |
| §4.25 entrywise Gram bound | n=0; nonnegative x; mixed-sign x=(1,−1) | Nonnegative products preserve entry inequalities; mixed signs can reverse them. | Retained |
| §§4.26–4.27 ellipsoid and finiteness | Unit disk; hexagonal form; centre1/2; n=0; zero matrix | Counts 5,7; shifted set {0,1}; zero matrix admits infinitely many points. | Retained |
| §4.28 Loewner bound | Equal matrices; PSD difference; mixed signs | Difference form is nonnegative without an orthant restriction. | Retained |
| §§4.29–4.30 negative witnesses | Negative interval; straddling interval; n=0 | Upper endpoints certify only the first; nonzero vector excludes rank zero. | Retained |
| §4.31 effective cover | Zero vector; negative coordinate; boundary; enlarged radius | The filter retains the exact rational boundary and may retain extra covered points. | Retained |
| §§4.32–4.33 Gram validity | Empty family; one negative row; zero-vector row | Member validity is true,true,false respectively; exhaustiveness is separate. | Retained |
| §4.34 multiplicity definitions, entry/block-sum/transpose APIs and lift | n=0; singleton blocks; (2,3); block size zero; nonsymmetric K | Direct sums give −34; zero block gives 0 versus −1; transposition swaps K indices; positive-size blocks sum to t_i. | Three missing API declarations proved; independent definition examples retained |
| Layer 5 family interpretation | Empty family; missing parameter; one invalid row | Validity alone cannot assert coverage or exhaustiveness. | Retained |
| Standing conventions | Zero polynomial; ramified uniformizer; two inverse substitutions; two blocks; two Fourier lengths | Infinity, 4π, map direction, column normalization and Fourier scaling all have explicit witnesses. | Mirrored controls strengthened |

## Check outcomes

- Import objects were already present for both used Tau Ceti modules, so no prerequisite build was needed. No build, update or cache-fetch command was run.
- Required elaboration of `packages/ComputationalNumberTheory/Suggested.lean`, rerun after the gate repair from the supplied content checkout: exit 0, with 138 intentional “declaration uses `sorry`” warnings and no errors or other diagnostics. The file has 1839 lines; every proved example elaborates.
- An additional elaborated-type probe checked seventeen changed signatures. It exited 0. It retains `CharZero` rather than `NumberField` for monotonicity, arbitrary p and no finite-generation assumption for radical membership, adic completeness for general Hensel, all local-field/elliptic instances, positive block sizes, the prime fact for the bundled point-count control, and the positive block-size hypothesis on `multiplicityLift_block_sum`.
- Required dependency check, rerun after the gate repair, exited 0. Its complete output is:

```text
depcheck: 9 roadmaps, 72 edges, 0 problem(s)
```

- No UPWARD or CYCLE line occurs. No merge-order file or dependency tooling was edited.
- The reported elaboration failures are addressed by r2b F01–F04 and F06.
- Previous gate failure `readme-ids-missing=3` named `multiplicityBlockGram_transpose`, `multiplicityLift_apply` and `multiplicityLift_block_sum`. Added exactly these three Lean declarations with proofs: transposition acts on K, lift evaluation unfolds, and positive-size blocks sum to the original coordinate. Each has its existing README API entry. Full-file elaboration verifies every proof; declaration-name comparison finds no missing README name. The sound repairs in the saved attempt were retained.
- Static checks: one `import Mathlib` and two used Tau Ceti imports; 47 proved examples, none containing `sorry`; no admitted data definition, `set_option`, private machine path or missing README name. Source TOML parses with 26 unique keys. `git diff --check` exits 0. The existing design gap is unchanged.
- No new source was needed: all added source locators use the supplied cached legal texts. The 26 source keys remain unique. Mattuck remains settled as uncertified; no missing-reference request was opened.

## Maintainer consequences

- Publication must export the package folder only; the board merge-order insertion remains board metadata.
- No existing target name was deleted or renamed. `IsPMaximal` and `isPMaximal_mono` have broader ambient-field hypotheses; `mem_pRadicalLattice` drops two unnecessary arguments. Consumers passing those arguments must adjust.
- `PresentationChange.translate_three` now returns a pair with both specified polynomial fields, rather than `Nonempty` alone. `multiplicityGram_lift` uses the two real-bodied definitions; unfolding recovers its former formula.
- Three boundary declarations now explicitly require their native prime facts. The requested mathematical comparisons are unchanged.
- Added named owned prerequisites supply complete-DVR Hensel, AKS cardinality estimates, the full integral modular basis and the Turing comparison. NumberFieldArithmetic's global bridge and Tau Ceti's argument principle remain supplier-owned.
- The existing `gap:local-two-quotient` contract and its design entry remain unchanged. No new supplier gap, scope change or merge-order decision is required by these repairs.
- Full eigenform classifications and the large Platt zero datasets remain mathematical roadmap targets; this repair does not claim to have recomputed them. A fresh independent review is still required.
