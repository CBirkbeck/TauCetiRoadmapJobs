# Combined repair report

Review a means RT-QSeriesPartitionsAndMockModularForms_r1a; review b means RT-QSeriesPartitionsAndMockModularForms_r1b. Their original finding identifiers and severities are retained below. The overlapping F02 findings are settled once. All ten distinct findings are addressed; no finding requires an external decision.

## F01 (P2) — applied

Review a. Missing finite Bailey headline → `baileyLemma_transform` on arbitrary commutative rings, with the original pair domain, unit parameters and both additional denominator-unit hypotheses explicitly bound. The two transformed sequences match README §2.7. Evidence: Andrews1986 line 93, (2.3)–(2.6); finite triangular substitution requires no normalization or inverse of a.

## F02 (P3) — applied

Both reviews. Ten admitted Checks → explicit proofs, with their assertions incorporated into the existing example blocks. Formal examples inspect nonconstant coefficients; the Bailey example rejects α=β=δ₁ at a=1,q=1/2 because β₁ would be 8/3. Pinned partition-zero/one laws, finite coefficient formulas and real derivative APIs supply the elementary steps. No example uses an admitted Check.

## F03 (P2) — applied

Review a. Unqualified extraction ownership → ClassicalArithmeticCompletion §2.10 contract, `qSeriesDecimation_eq_cartier`, shifted comparison for a<t, and `etaDecimationOmega_eq_cartier` after embedding integral coefficients in ℚ. Evidence: `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:2956`, `coeff_cartier` and `cartier_ofPowerSeries`. General semiring and integral work stays here. Added a=t and t=0 negative controls; the zero-index conventions differ.

## F04 (P1) — applied

Review a. Unnamed modular-equation inputs → `etaDecimation_modularEquation_five` and `etaDecimation_modularEquation_seven`, stated before module stability in README §4.8a and on native eta in Lean. Quotients retain Im(τ)>0. Added three cusp Checks and the Newton-coefficient valuation proof requirement. Evidence: Watson1938 line 417, (3.2), and Watson1938 line 1127, (5.2), with their derivations in §§2 and 4.

## F05 (P2) — applied

Review a. Replanned real smoothing laws → pinned erf/erfc supplier contract and named normalization adapters; complex extension and additional tail estimates remain here. At Tau Ceti pin a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, `TauCeti/Analysis/SpecialFunctions/Erf.lean:51`, :64, :92, :140 and :186 give the definition, zero, derivative and range facts. Substitution proves E(x)=erf(√πx), β(t)=erfc(√(πt)), including t=0.

## F06 (P2) — applied

Review a. Independent eta-transformation development → import from ModularForms, Worked examples, target η²⁴=Δ; retain the normalized multiplier, cocycle and lifted character. Evidence: `TauCetiRoadmap/ModularForms/README.md:1381` expressly owns eta’s product and SL₂(ℤ) transformation. README §5.2 now proves the adapter from that input, with the same S,T and lift-sign Checks.

## F07 (P1) — applied differently

Review a. Late rank input and unnamed omega bridge → §10.1a, before completion, with explicit Needs and native-carrier signatures. Added `thirdOrderOmega_bilateral` and its paired-tail Check. Strengthened the rank domain to q≠0 and actual pole exclusions; distinguished meromorphic continuation from rank-count convergence. Zagier2009 line 937 supplies rank; BringmannOno2006 line 270 supplies only omega’s definition, with the bridge explicitly an author’s derivation.

## F01 (P3) — applied

Review b. Layer-8 differential expressions used in Layer 6 → definitions and their four example blocks in Layer 5 / README §5.3. Modular covariance and Laplacian theory stay in §8.2, which names the earlier input. Evidence: direct differentiation gives ∂bar y=i/2, ξ₀y=1 and ξ₀(iy)=−i; BruinierFunke2003 line 375 fixes the convention.

## F03 (P3) — applied differently

Review b. Infinite-endpoint locator → legally fetched Warnaar2001, arXiv v1 (1.3)–(1.4), lines 45–65, and (1.6), lines 92–108. The roadmap polynomials are e_(n+1) and d_(n+2), giving exactly both displayed identities and recurrences. The proposed Andrews retrieval returned an error page and was rejected as evidence. The verified replacement is recorded in `packages/QSeriesPartitionsAndMockModularForms/sources.toml`.

## F04 (P3) — applied

Review b. Outer negative index j reused as a product index → inner index i in README §1.3. The coefficient remains Q₋ₙ, with n positive. Evidence: Gasper1995 line 478 gives the reciprocal-factor quotient; the retained n=1 evaluations are −1 and 0. No Lean declaration or mathematical domain changes.

## Adversarial mathematics pass

Rows cover the definitions and their associated public laws in each indicated subsection. These are boundary, finite-identity and normalization tests, not proofs of the universal theorem targets. Exact finite computations are identified explicitly; the other entries are direct substitutions or source/domain comparisons.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §1.1 finite product, recurrence, map, concatenation | n=0,1,2; q=0,1; zero ring | P₂=1−a−aq+a²q; nonempty zero-base product is 1−a; subsingleton values agree | Explicit Check proofs and combined examples |
| §1.2 integer products and mixed-sign concatenation | indices −1,0,1; a=q=2 over ℚ | Negative factor vanishes at a=q; excluded by unit domain | None |
| §1.3 quotient continuation and step law | Q₋₁([3];[1];2), Q₋₁([3];[2];2); a=q | Values −1,0; numerator pole remains excluded | Dummy index corrected |
| §1.4 formal products, stabilization, map and units | degrees 0,1,2; a=0,1; 𝔽₂ | Full coefficients 1−a,−a(1−a),−a(1−a); positive tail over 𝔽₂ begins 1+X+X² | Explicit coefficient proofs and stronger examples |
| §1.5 concatenation and inverse-base formula | n=0,1,2; unit a,q | At n=2 factor is a²q; no inverse of zero permitted | None |
| §1.6 analytic limits and prefix/tail comparison | q=0; a=1; a=q⁻¹ | Full limit may vanish; zero tail prevents quotient cancellation | None |
| §2.1 unilateral coefficients, ratio, parameter cancellation | empty lists; a=1; denominator parameter 1 | Initial coefficient 1, first empty-list coefficient −1/(1−q); forbidden later denominator is not evaluated after termination | None |
| §2.2 bilateral coefficients, shifts and split | j=−1; b=q; z=0 | Negative term (q−b)/((q−a)z); stopped tail zero; z=0 excluded | None |
| §2.3 convergence and inverse-base domains | q=2,a=−1/2 or 1/2; zero parameter; negative indices −1,−2 | Radius 4 versus terminating 1−z/2; negative-tail ratio needs n+1 | None |
| §2.4 binomial, both Euler limits, formal realization | q=0; a=0; q=1/2 | Binomial (1−az)/(1−z); entire Euler limit 1+z at q=0 | None |
| §2.5 1ψ1 and regular bilateral term | j=0,−1; b=0,q; a=b | Values 1 and −2/3 in the stated rational witness; a=b gives empty annulus | None |
| §2.6 Bailey pair and its linear API | zero pair; unit pair at a=q=0; δ₁ non-example | β₁ denominator uses n+r; δ₁ would require 8/3 instead of 1 | Proved first relation and discriminating example |
| §2.7 finite Bailey transformation | n=0,…,5 at (a,q,ρ₁,ρ₂)=(1/3,1/2,3,4),(0,0,2,3),(0,1/3,2,5) | 18 exact rational transformed-pair equalities | New Lean headline with all unit hypotheses |
| §2.7 analytic Bailey limits | zero pair; unit pair; a=0; ρ₁=aq≠0 | Unit limit gives inverse Euler product; forbidden parameter kills an additional denominator | No change to limits |
| §3.1 Gaussian polynomial and evaluation API | G(0,−1), G(0,0), G(2,1), Q=±1 | 0,1,1+Q; quotient at Q=−1 cannot replace polynomial definition | None |
| §3.2 both finite Schur identities and recurrences | n=0,…,16; both polynomials | 34 exact integral-polynomial equalities; n=2 gives 1+Q,1+Q² | Correct finite-source locator and index dictionary |
| §3.3 Rogers–Ramanujan predicates, counts and limits | empty partition; (4),(3,1),(2,2); coefficients through degree 4 | Gap-two and residue predicates differ; repetitions rejected; both constant terms 1 | None |
| §3.4 quintuple product and theta addition | z=1; first q powers; z=0 | 2−2q−2q²; forbidden zero z rejected | None |
| §3.5 ordinary partition adapter and scalar change | n=0,1,2,4; arbitrary semiring, including zero ring | Counts 1,1,2,5 cast to K; inverse Euler formula only asserted over rings | None |
| §4.1 rank/crank, conjugation and series coefficients | empty; (1); (3,2,1,1); (3,3),(2,2,2) | Empty 0; singleton crank −1; strict-filter witness −1; conjugate ranks 1,−1 | Proved empty Check and extended examples |
| §4.2 vector partitions and swap/product laws | empty triple; size 1; swapped unrestricted components | V₀=1; V₁=z+z⁻¹−1; swap negates statistic | None |
| §4.3 Durfee rank series and corrected crank series | z=−1; n=0,1 | Rank specializes to f; adding (1−z)X yields crank coefficient z⁻¹ | None |
| §4.4 residue counts and character filter | t=1,2; n=1; constant-zero statistic; characteristic dividing t | Rank/crank in distinct classes; multiplied filter survives without division by t | Proved filterOne/filterTwo and combined examples |
| §4.4a complete dissections and theta addition | q=0; size 1; sizes 4,5,6 | Theta-addition constant identity has the stated a/b sign; vector size-one correction retained | None |
| §4.5 equidistribution and first congruences | crank at sizes 4,5,6; rank class 1 modulo 11 at size 6 | Independently enumerated: every crank class has size 1; rank class has size 2 | None |
| §4.6 bounded inverse and reduction | M=0,1,2,3,13,65,343 | No representative at 0,2,3; δ(1)=0, δ(13)=6, δ(65)=19, δ(343)=243 | None |
| §4.7 semiring extraction and Cartier adapters | t=0,1,2; X,X²; a=t | U₂X=0,U₂X²=X; U₀1 has coefficient 1 in every degree; shifted Laurent extraction at a=t sends 1 to X⁻¹ | Proved nonmultiplicativity; both comparison-domain negative controls |
| §4.8 alternating eta extraction and offsets | ℓ=5,7,11; first two stages | Leading shifts and Euler factors alternate; no analytic multiplier is needed | None |
| §4.8a degree-five/seven modular equations | t=e(τ/ℓ); first correction; both series through degree 160 in v=t^(1/6),t^(1/4) | Exact integer-series residuals vanish; first cancellations are 5t^(11/6),7t^(11/4) | Named native-eta targets, nonzero-denominator hypotheses and three Checks |
| §4.8a module basis, stability and transport | first two seven-steps; eleven base step; Laurent embedding | Ω₇(B⁻¹)/7 has b₇ coefficient 7, insufficient for O₇; comparison with rational Cartier preserves integral submodules | Named equation inputs and integral/field comparison |
| §4.9 prime-power congruences | r=1,3; ℓ=7 | Independent partition recurrence gives p(243)≡245 mod 343 and 0 mod 49 | None |
| §5.1 odd theta and derivative/product comparison | two central half-integer terms; z=0,1/2 at τ=i | Pair has factor i and opposite exponentials; derivative sign −2πη³ | None |
| §5.2 eta multiplier, cocycle and lifted character | T,S,−I; τ=i; lift sign | ν(T)=exp(πi/12), ν(S)=exp(−πi/4), ν(−I)=−i; S factor at i is 1 | Import transformation from existing owner |
| §5.3 complex E, real normalization and tail | x=0; x and −x; first two Taylor terms | E(x)=2x−(2π/3)x³+…; β(0)=erfc(0)=1; scaling erf removes its √π denominator | Import real API and retain complex/tail targets |
| §5.3 Wirtinger and xi expressions | constants, identity, y,iy,log y; k=0,1 | ∂bar y=i/2, ∂bar id=0; ξ₀y=ξ₁log y=1; ξ₀(iy)=−i | Definitions/examples moved earlier; constant proof supplied |
| §5.4 Mordell integral and unique difference solution | z=±1/2,τ=i; z=0 | Evenness and shifts give value 1 at half points; positive integral at 0 | None |
| §5.5 R, derivative and elliptic/modular defects | u=0 pair; shift u+1; y=0 | Central pair even; unit shift negates; boundary y=0 outside domain | None |
| §5.6 μ, residue and Appell–Lerch comparison | u→0; unit shift; u=0 | Residue −1/(2πiϑ(v)); unit shift negates; pole not a value | None |
| §5.7 μHat, joint shifts and normalization | S-defect; simultaneous τ shift; μ/ϑ factors | h/(2i)+(i/2)h=0; diagonal shift fixes completion; Zagier factor i retained | None |
| §6.1 unary theta, corrections, derivatives and periods | a=b=0; a=1/6; scaling d=1,3 | Zero-characteristic cancellation; leading coefficient 1/6; scaled xi factor −√(2d) | Earlier xi expression explicitly consumed |
| §6.2 period identities and crossing terms | a=b=0; a=1/2 | Central period uses g(1/2,1/2); endpoint is outside unshifted formula | None |
| §6.3 rational characteristic laws and cusp/xi adapters | unit β shift; order 2; zero characteristic | Unit shift negates; order-two pair pole-free; zero characteristic inadmissible | Explicit §5.3 dependency |
| §7.1 negative cones and isotropic boundary | hyperbolic plane; rank one [−2]; opposite component | Two prescribed hyperbolic boundary vectors admissible; no nonzero rank-one isotropic vector | None |
| §7.2 ordered kernel and adapters | equal data; hyperbolic (1/2,±1/2) | Equal kernel zero; boundary values 2 and 0; order reversal negates | None |
| §7.3 positive majorants, summability and boundary limits | dependent negative rays; two hyperbolic boundary rays | Q⁺ denominator excluded for dependent rays; Q⁺=0 at boundary does not meet negative-vector hypothesis | None |
| §7.4 characteristic S/T laws and Weil comparison | odd diag(1,−1); hyperbolic determinant; inadmissible b | Half-diagonal shift (1,1)/2 retained; hyperbolic S prefactor τ | None |
| §7.5 finite correction factorization | A=[−2], c=1,2, a=1/4,b=0 | Leading minus from Q(c)<0; c=2 requires two cosets at scale 8 | None |
| §8.1 automorphy, restriction and cusp carriers | zero; constant 1 at k=0 and odd k; Γ₀(2), cusp S | Constant weight-zero noncuspidal; odd full-group constant fails −I; no evaluation of ρ(S) outside Γ | None |
| §8.2 Laplacian, covariance and factorization | yˢ,y²,log y; k=0,1,1/2 | −s(s+k−1)yˢ; Δ₀y²=−2y²; unitary additive shift 3/16 | Earlier ∂bar/xi expressions consumed |
| §8.3 harmonic spaces and analytic regularity | zero,1,y² at k=0 | First two harmonic; y² fails despite polynomial growth; analytic regularity remains a supplier gap | None |
| §8.4 scalar Fourier kernel and basis | k=0,1; w<0 | H₀(w)=exp(w); k=1 needs log y; negative-frequency integral real and nonzero | None |
| §8.4a general parabolic modes and normalization | M=1,i,2; unipotent 2×2 block | Frequencies 0,1/4,−i log 2/(2π); Jordan holomorphic vector (τ,1); height-one primitive vanishes at y=1 | None |
| §8.5 Weil Fourier parts, xi coefficients and central action | rank zero; L=⟨2⟩; conjugate(q⁻¹) at k=0 | Exponent 1/4 and central −i for ⟨2⟩; rank-zero weight-1/2 full-group space zero; polar shadow 4πq⁻¹ | None |
| §8.6 Weil surjectivity and exact sequences | zero shadow; trivial discriminant; scalar i | Compatible scalar case retained; final complex term must be conjugated | None; vector-bundle gap retained |
| §8.7 specified mock correction and Eichler primitive | g₀=1,i; k=0,1; y=1 | Corrections y versus y−1, then log y; shadow conjugates scalars | None |
| §9.1 theta components and decomposition adapter | m=1,l=0,1; m=0 | Leading powers 1 and q^(1/4); zero index excluded | None |
| §9.2 meromorphic Jacobi data and holomorphic comparison | zero; theta; nonzero constant | Zero divisor empty; theta satisfies elliptic law; constant fails positive-index τ shift | None |
| §9.3 mixed residues, bound independence and covariance | (1+v+conj v)/v²; conj(v)/v; 1/v | Residues 1,0,1; antiholomorphic degree must be zero | None |
| §9.4 completed polar kernel and indefinite comparison | λ=0 pole; l=0,m at u=0; mixed boundary cone | Residue −1/(2πi); correction values 1,0; boundary construction necessary | None |
| §9.5 meromorphic decomposition and coefficient S/T laws | pole-free theta; double pole; k=1 | Kronecker-delta coefficients; first derivative for double pole; coefficient weight 1/2 | None |
| §10.1 actual third-order series and rank specialization | q=0; coefficients 0,…,3 | Independently recovered f=1+q−2q²+3q³, ω=1+2q+3q²+4q³ | None |
| §10.1a rank/f bilateral bridge | z=−1; n=0,±m; q→0 | Paired expression 1+4Σ_(m≥1)(−1)^m q^(m(3m+1)/2)/(1+q^m); exact series agreement through degree 160 | Moved before completion and added native signature |
| §10.1a omega bilateral bridge | n=m,−m−1; q→0; coefficients through degree 160 | Paired kernel (1+q^(2m+1))/(1−q^(2m+1)); exact agreement with Euler product times ω | Added target, domain and pairing Check |
| §10.2 third-order completion, S/T, shadow and related functions | S₃²; leading half-argument terms; first unary correction | S₃²=I; last entries exchange under T; first correction −2C and shadow +2√6g | Named bilateral proof inputs |
| §10.3 fifth/seventh series and χ relations | q=0; first φ₁ term | Constants as stated; φ₁(−q)/q→−1, so χ₁(0)=1 | None |
| §10.3a unilateral-to-Hecke identities | constant terms; f₀ through q²; corrected φ₁ and ψ₀ factors | φ₁ starts q; 1+2ψ₀ starts 1+2q; q coefficient of Euler product times f₀ is zero | None |
| §10.4 cone identifications | A₁ versus A₀,A₂ initial terms; cone norms | A₁ starts q; others start 1; named Hecke bridges precede cone use | None |
| §§10.5–10.6 fifth vectors, shadows and transformations | opposite corrections; half-argument T shift; sine-square relation | G₅,₁+G₅,₂=0; components exchange; sin²(π/5)+sin²(2π/5)=5/4 fixes S² | None |
| §§10.7–10.8 seventh vector, shadow and transformations | ordered leading exponents; cone norms; T residues | Exponents −1/168,47/168,143/168; last phase −25/168; Q(c)=−21/2 | None |
| §11.2 root completions, shadow, level and cancellation | α=1/2,1/3; ξ=1 | First matches third-order correction; order-three individual poles require cancellation; ξ=1 has weight −1/2 | Earlier bilateral reference updated |
| §11.3 residue-deviation completion and shadow | t=1,2; nonreal ζ_t | Empty sum zero; t=2 deviations ±f/2; shadow filter conjugates coefficients | None |

## Checks and maintainer notes

- **Identifier repair:** the `qSeriesDecimation` docstring now names the README-only `qSeriesDecimation_eq_cartier` target, retaining its field and positive-modulus hypotheses and ClassicalArithmeticCompletion §2.10 dependency. The supplier's Suggested.lean has no Cartier declaration, so no unavailable operator is forced into a signature. The worker's exact identifier scanner on the package files exits 0 with `readme-ids-missing=0`. The full gate on the board root exits 1 with `missing-files=2`: it expects the content layout `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/`, rather than `packages/QSeriesPartitionsAndMockModularForms/`.
- **Suggested.lean elaboration:** not available, as specified in the job brief; not run. The explicit Check proofs and new signatures have not been certified by a Lean elaboration in this repair. No Lean process was started.
- **Dependency direction:** exit code 0, with the exact output below. No UPWARD or CYCLE line occurred.

```text
depcheck: 7 roadmaps, 45 edges, 0 problem(s)
```

- **Exact finite mathematics checks:** passed all 18 Bailey instances, 34 Schur identities, both modular-equation expansions through degree 160 in their normalized cusp variables, and both paired bilateral expansions through degree 160. Small crank/rank enumerations and the p(243) congruence check passed. These finite witnesses are not universal proofs.
- **Static consistency:** 16 real-bodied definitions, 60 theorems and 28 proved example blocks; all 76 named declarations occur in README code spans. The ten elementary Check declarations have explicit proofs without `sorry`. At most two example blocks remain for each kept definition. One `import Mathlib`, the used native-conjugation module, no `set_option`, no admitted data, and no admitted examples. The final file has fewer than 5000 lines.
- **Sources:** the manifest parses with 19 unique works and all required bibliographic fields. Warnaar2001 is the sole added work. Its actual preprint numbering and the e/d index shifts were read directly. No missing-reference request remains; waived and uncertified inherited entries remain settled.
- **Supplier contracts:** the three existing gap slugs and needs sentences still agree with `packages/QSeriesPartitionsAndMockModularForms/design/plan.json`. That file and `packages/QSeriesPartitionsAndMockModularForms/metadata.toml` are unchanged. The supplied sibling roadmaps were searched for the objects involved; no new supplier edge to them was introduced. Main-roadmap Cartier and eta ownership and the pinned erf API are now explicit.
- **Compatibility:** no Lean name was deleted or renamed. `rankSeries_bilateral_hasSum` and `rankSeries_at_one` move from README §11.1 to §10.1a; their internal consumers now cite that section. `wirtingerBar`, `maassXi` and `xiConstant` move to Layer 5. Added Lean names are `baileyLemma_transform`, `etaDecimation_modularEquation_five`, `etaDecimation_modularEquation_seven`, `rankSeries_bilateral_hasSum` and `thirdOrderOmega_bilateral`. The general coefficient rings and all-cusp completion scope are retained.
- **File hygiene:** `git diff --check` passed. Only the three permitted deliverables and this requested report are changed. No tooling, merge order, other package, pull-request text or issue was edited. No commit or push was made.
