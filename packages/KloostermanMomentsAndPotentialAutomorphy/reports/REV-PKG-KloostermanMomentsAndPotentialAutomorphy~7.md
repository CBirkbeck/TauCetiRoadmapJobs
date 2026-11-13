<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13156#issuecomment-6865196936 -->
Review (codex) of cdfffd9

Verdict: accepted
Conditional on the announced gaps: `higher-thickness-picard-lefschetz`, `irregular-stationary-phase`, `nori-weight-filtration`, `orthogonal-motive-root-number`, `semisimplification-similitude-form`, `toric-polytope-projective-embedding`

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

No findings: zero P1, P2 or P3 repairs. Acceptance is conditional on the six declared supplier gaps listed below. The previous trace-character finding is repaired. All four admitted headline theorems elaborate; the only warnings are their four `sorry` warnings.

## Verified sound

### Previous finding and repair regression

The preceding review and repair report were read first. The preceding review has one finding, F01; none was marked not actionable. The repair was checked against the package and the pinned declarations, not taken on the repair report's authority.

| Finding | Repaired passage | Status and witness |
|---|---|---|
| F01, trace-character tower direction | `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:512`: “Then `traceChar p m′ = traceChar p m ∘ Tr_ι`”; line515: “Restriction along `ι` is a power” | **Repaired.** The relative trace goes from the larger field to the smaller. Over F₄/F₂ at 1, both sides of the composition law are 1 and the restriction law is `1=(−1)²`. Plain restriction would give `1=−1`. |
| F01, contract and dependencies | README line202 names `Algebra.trace_trace`; line203 names `Algebra.trace_algebraMap`; lines561–564 include the finite-field embedding, degree and character-power inputs | **Repaired.** The finite-free hypotheses and scalar tower are available for the stated finite fields and Fₚ-algebra embedding. No additional supplier is needed. |
| F01, Lean documentation | `packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean:58`: “composed with the relative trace through `ι`” | **Repaired.** Same composition and restriction laws as the README; the actual definition remains standard character composed with absolute trace. |

The four added Checks were recomputed, including the nonidentity degree-one embedding and the degree-zero splitting-field trap. The added assertion “trivial exactly when” was tested in both directions. Searched the rest of the package for trace, tower, inclusion and restriction uses: the Artin–Schreier contract and §1.4 use the absolute-trace composition, with no repeated plain-restriction error. The earlier repairs distinguishing middle factors from Euler factors and postponing the exact constant-quotient weight remain correct; the table below retests both.

### Coverage, principles and shape

Read all **59 numbered targets**, their API statements and **212 Checks**, all **59 Needs lines**, all **12 layer dependency paragraphs**, the conventions, supplier contracts, references and all **21 Lean declarations**. Each target has between three and nine Checks; definitions retain their APIs. Every layer has Examples and Dependencies. The shape was compared with `TauCetiRoadmap/TensorProductCombinatorics/README.md:1` and `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md:1` on main. Metadata is `math.NT`.

The preceding report's computed rows were used only for their unchanged instances. Other passages were read afresh; this round's changed passages and seeded targets were checked independently. The report table records the seeded targets, headlines, repair regressions and additional boundary cases, rather than repeating a 59-target ledger.

No route-specific or good-prime shortcut, second plan of an existing roadmap, upward supply, computational algorithm, copied source passage, sorry'd data, placeholder proposition, `set_option`, Lean `lemma`, admitted example or process residue was found. Characteristic two and inseparable covers remain included. The even dyadic factor is existential, not omitted; the higher-thickness comparison is a declared contract. Positive-rank automorphy is distinguished from the zero system. No local paths, PR references, HTML anchors or LaTeX delimiters occur in the mathematical text. Generic constructions are imported from their owners; the total rank-two finite sum is explicitly the elementary adapter needed for the headline statements.

### Seeded source verification

All **15 seeded targets** were read at their locators. The sources are the manifest's versioned FSY v5 and XZ v2; the semisimplification contract was also checked against Serre-orthogonal v3. All four cited works have exactly one manifest entry. There are no additional author-flagged unverified locators requiring a request. Saito-orthogonal remains settled `uncertified`; its original text is the sole source limitation below. No source fetch or manifest change was needed.

| Target and README line | Source locator and lines inspected | Support and hypothesis check |
|---|---|---|
| §1.2, line643 | FSY §1.2, pp.4–5, and §3.2.1, p.24; FSY lines165–210, 989–1033; XZ §1.1.2(i)–(iv), p.3, XZ lines105–130 | Rank at least two, nontrivial character and ℓ≠p; geometric irreducibility, one block at zero and rank-two pairing. XZ's weight-zero normalization is undone before using determinant q. |
| §1.4, line697 | FSY (1.5), p.5, FSY line196; §3.2.1, pp.23–25, FSY lines980–1075 | Positive rank-two symmetric exponent gives the compact H¹ determinant. General-rank exceptional invariant vectors retain the full cohomological complex. |
| §2.2, line800 | FSY §2.1, pp.10–12, FSY lines425–445; (3.9), pp.21–22, FSY lines893–904 | Characteristic-zero cover `z=t^r`, inverse action on the y coordinates, invariant potential and group-scheme descent; rational roots of unity are not assumed. |
| §2.5, line879 | FSY Proposition 2.7, p.12, FSY lines505–533 | Characteristic-zero differential Galois group Sp for even rank and SL for odd rank, for the original and cyclic pullback; irreducibility of the symmetric powers. No characteristic-p table is substituted. |
| §2.6, line901 | XZ §1.1.1, (1.1.1.1)–(1.1.1.6), pp.2–3, XZ lines55–102; §4.1.13, p.42, XZ lines1972–1985 | Nonzero λ, cyclic-module versus horizontal-solution equations, and `d−λdx` versus `d+λdx` distinguished. The latter section really uses the opposite exponential presentation. |
| §3.2, line961 | FSY §2.2, before Proposition 2.13, p.14, FSY lines607–635; §3.1, pp.21–22 | Characteristic-zero averaging over S_k×μ_r, sign exponent r−1, and the selected character of the actual action. The Koszul sign is not suppressed. |
| §4.5, line1312 | FSY Theorem 3.12, pp.23–25, FSY lines980–1075 | ℓ≠p and the finite-field model; degree nk−1 and twist (−1); the p-part of the cover is handled by topological invariance, not treated as étale. |
| §5.5, line1451 | FSY Proposition 4.12 and (4.13), p.30, FSY lines1228–1288 | Positive k; full, compact and middle dimensions kept separate, including the extra subtraction for 4 dividing k. |
| §5.7, line1492 | FSY Proposition 2.21 and proof, pp.16–18, FSY lines735–767; Corollary 4.10, p.29, FSY lines1212–1227; proof of Proposition 4.20, p.33, FSY lines1390–1420 | Primitive part of the length-k block is P_(k−1), with the (−1) twist; variation weight 2k, module weight 2k+1, Fourier type (k+1,k+1). This follows the local-monodromy target. |
| §6.6, line1685 | FSY Theorem 1.8, p.7, FSY lines292–350; proof pp.37–38, FSY lines1600–1647 | Both parities and all positive k; distinct Hodge indices, correct central even omission, and dimension d_k. Full and middle cohomology are not conflated. |
| §7.3, line1821 | FSY proof of Theorem 5.17, (5.18)–(5.21), pp.45–48, FSY lines1975–2065 | Resolution of the balanced singularities, open versus proper cohomology, quadric strata, boundary kernel and exceptional quotient. Odd residual characteristic is retained for the ordinary-quadric calculation. |
| §8.2, line1949 | FSY (1.5), p.5; (5.1)–(5.4), pp.39–40, FSY lines1668–1740 | Every prime, positive k, all four parity/prime degree branches and even boundary factors; both exponents in the dyadic case retained. |
| §8.4, line2024 | FSY Theorem 5.17, pp.45–48, FSY lines1983–2065; local factors, pp.48–49, FSY lines2153–2192 | Odd p≠ℓ, the monodromy block, quotient description of U and further quotient when 4 divides k. No direct-sum splitting is asserted. |
| §10.2, line2232 | FSY §5.2 and Corollary 5.30, pp.52–53, FSY lines2336–2398 | Gamma recipe and real Hodge sign; package correctly inserts the nonzero constant π^(d(d+1)/4) missing from the source's claimed equality. |
| §11.3, line2444 | FSY §5.3.3, last paragraph, p.58, FSY lines2654–2657 | Odd k gives even weight and orthogonal motive, hence sign +1 through the explicitly named Saito contract. Original Saito hypotheses remain uncertified, not silently certified here. |

### Computed adversarial pass

The finite-field rows were recomputed by polynomial arithmetic over F₂ and F₃, exact trace-character counts, the symmetric-trace recurrence, and `n c_n=Σ_(j=1)^n m_j c_(n−j)`. In characteristic three the counts of ζ₃ and ζ₃² agree, so no floating-point character arithmetic was used. The geometric rows compute dimensions, weights, signs, local equations or filtration indices. These tests support the review; they do not constitute proofs of the future theorems.

| Statement | Instances tried | Values computed on each side, including wrong models | Result; change |
|---|---|---|---|
| §0.1 symmetric trace | t=3,d=2,k=2; repeated eigenvalue 1,k=3; zero ring | h₂=9−2=7=4+2+1, versus trace²=9; h₃(2,1)=4=1+1+1+1; zero-ring sides both 0 | Sound; none |
| §0.2 sum and parameter | F₂,a=0,1; F₃,a=1,2; trivial ψ on F₅ | F₂ raw sums −1,1; product-fibre sums 0,1. F₃ sums −1,2, first moment 1−2=−1. Trivial F₅ character gives −16, not −1 | Unit-domain comparison and nontriviality retained |
| Repaired composition law | F₄/F₂ at 1 and ω; F₉/F₃ at 1 | Tr(1)=0 and Tr(ω)=1 give 1=ψ₁(0), −1=ψ₁(1); F₉ gives ζ₃²=ψ₁(2) | F01 repaired |
| Repaired restriction and iff | relative degrees 2 and 3 in p=2,3 | d2,p2 gives 1=(−1)²; d2,p3 gives ζ₃²≠1; d3,p2 gives −1; d3,p3 gives 1 at both prime-field nonzero elements. Trivial precisely for p dividing d | Both directions pass |
| Repaired trace direction and positivity | degree-one Frobenius on F₄; m=1,m′=0; F₄→F₈ | Tr_ι(ω)=ω², while both absolute character values are −1. At m′0 the splitting field has degree1, so LHS ζ_p versus proposed exponent-zero value1. No F₄→F₈ embedding: 3 does not divide 7 | Positivity/embedding hypotheses necessary |
| §§0.3,8.2 integer-polynomial headline | p2,k3; p2,k12 | Moments (3,−17,63,−257), coefficients (1,3,−4,0,0), degree2=(3+1)/2. For k12: moments (−1,−8193,−1,−33554433), coefficients (1,−1,−4096,4096,0), degree3=14/4 rounded down | Both dyadic parities pass |
| Positive-exponent restriction | p2,k0 | Moments (1,3,7,15), coefficients (1,1,2,4,8); rational series (1−T)/(1−2T), not polynomial | k>0 retained |
| §1.2 pairing and local block | rank2,p2,a1 | trace −1, determinant2; polynomial 1+T+2T² has root norm 1/√2. The unipotent block has invariant dimension1, versus2 for the identity | Correct determinant, purity and block |
| §1.4 cohomological sign | p2,k3; rank3,p2,Sym² | Moment3 gives H¹ trace −3=1−4, determinant (1−T)(1+4T). SO₃ has one invariant quadratic in Sym², versus zero for SL₃ | H¹ concentration confined to applicable case |
| §2.2 cover | r3,k2,t2,all y=1 | z8,x2; each potential 2+2+8/4=6, sum12=t·g=2·6. Deck multiplier ζζ⁻¹=1, wrong action ζ²; dz/z=3dt/t | Cover/action/normalization pass |
| §2.3 local structure and residue degree | r2,3; degree-two puncture on P¹_Q | r·1/r=1; dual sign +1,−1. Rank-one irregularity1 at degree-two point gives index 0−2=−2; after splitting −1−1=−2, not −1 | General field hypothesis preserved |
| §§2.4–2.5 symmetric connection and Galois group | r2,3;k2 | Symmetric ranks3,6=binomial(3,2),binomial(4,2), tensor ranks4,9. Sp₂=SL₂; SL₃ has no invariant quadratic, SO₃ would have one | Connection variant and characteristic-zero table pass |
| §2.6 Bessel and Dwork signs | r3,λ1; F*E→E | Cyclic scalar solution starts 1+x, horizontal scalar starts 1−x; required dlog multiplier is π(pt^(p−1)−1)dt, opposite to XZ's printed multiplier | Package distinguishes conventions |
| §3.2 projector | S₂,r2 and r3; nonabelian S₃ | Swap signs −1,+1; relative degrees2,4 and total degrees3,5. Each sign-projector coefficient of e² is signed 6/36=1/6, equal to e | Averaging and Koszul sign pass |
| §3.6 inverse Fourier weights | k2,3 | Exponential fibres (dimension,weight)=(3,2),(4,3); Fourier cohomology=(1,4),(3,4). Primitive weights give 2+1+1=4 and 3+1+0=4 | Distinct objects not conflated |
| §§4.1–4.4 classicality and motive headline | cover k2,3,4; r2,k3; excluded k1 | Fourier ranks1,3,3 minus excess1,0,1 yield middle0,3,2. k3 hypersurface degree2/weight2 becomes weight4/type(2,2) after twist. k1 invariant H⁰ of two points has rank1, but middle Kl₂ rank0 | nk≥2 comparison restriction matters |
| §4.5 finite-field comparison | r=p=2; k3,p2 | Degree-two cover has separable degree1, not2. Hypersurface eigenvalue −2 becomes −4 after twist; weights2→4 and norm2→4 | Inseparable and Tate branches pass |
| §5.2 formal decomposition | k2,3,4 | Exponents k2: −4,0,4; k3: −6,−2,2,6. Irregularity before/after cover (1,2),(2,4); regular descended signs k2 −1,k4 +1 | Even zero exponent handled |
| §5.5 dimensions | k=1,…,8 | Full dimensions 1,1,2,2,3,3,4,4; middle 0,0,1,0,2,2,3,2. Cover full 2,2,4,4,6,6,8,8; middle 1,0,3,2,5,4,7,6 | Four formulas agree with local-block subtraction |
| §5.6 bases | odd k1,k3; even k2 | Determinants −z,9z². Leading operator on u₂−zu₀ gives 2zu₁−2zu₁=0, but differentiating z gives a nonzero full-connection term | Not a claimed horizontal vector |
| §5.7 exact quotient weight | k1,2,3 | P_(k−1) weights0,2,4; twist gives variation2,4,6; module3,5,7; Fourier types(2,2),(3,3),(4,4) | Correct index and downstream order |
| §§6.1–6.3 geometry | k1,2,3; quadratic pole Q/u | Fan rays2,8,26=3^k−1; maximal cones2,8,48=2^k k!; k1 three sections give conic. Exceptional pole orders1 then0; Newton degrees x and z/x both1, deg z2 | Projectivity subject to declared contract |
| §6.6 Hodge headline | k3,5,6,8; full k4 | Middle types (2,2); (2,4),(4,2); (2,5),(5,2); (2,7),(7,2), ranks1,2,2,2=d_k. Full k4 extras (3,3),(5,5), rank2; middle rank0 | No extraneous central even type |
| §7.1 boundary hypotheses | nodal cubic; A=F_p[ε]/ε² | Nodal H¹ rank1 weight0, not weight1. In A[x,y]/(xy), ε≠0 while the geometric fibre is reduced | Singular and nonreduced models distinguished |
| §7.2 thickness | k9,p3,a1,3 | Constants6,18 have valuations1,2; after quadratic base change uniformizer exponents2,4 | Arbitrary-e contract necessary |
| §7.3 even resolution | k4,6; p3 | Balanced points6,20=binomial(4,2),binomial(6,3); exceptional quadric dimensions2,4. k4 open gr²H³_c rank1, smooth proper gr²H³ rank0; k6 positive b2 orbit remains after balanced orbit resolution | Open/proper and horizontal/vertical distinguished |
| §8.1 root-weight headline | p2,k3,k8 | k3 Q=1+4T, root norm1/4=2^−2; eigenvalue pairing16/(−4)=−4. k8 Q=1−16T, norm1/16=2^−4, the even boundary weight | Both permitted branches pass; zero Q excluded by constant term1 |
| §8.2 trivial factors | k8,p3 and p2; k12,p2 | p3 Z=(1−T)(1−81T)(1+81T), degree3=4−1. p2,k8 Z=(1−T)(1−16T), degree2; k12 dyadic exponents a=b=1, degree3 | All degree/factor branches pass |
| §8.4 even local structure | k6,p3; k2,k4 | k6 (dim V,dim U,dim invariants,rank N)=(2,1,1,1), N²0, factor1+27T. k2 all zero; k4 E dimension2 and quotient removes both dimensions | Quotient is essential; not a split sum |
| §§8.5–8.6 Euler versus middle factor | k9,p3; k6,p3 | k9 Z=1+53T+58995T²−59049T³, M=1+54T+59049T²; Θ⁺={3}, extra1−243T. k6 Z=1+26T−27T², M=1 but Euler inverse1+27T | Summary exception thresholds correct |
| Conductors | odd k1,3,5,7,9; even k6,8 | Odd N=1,3,15,105,105; radical-product error gives315 at k9. Even odd parts3,3 | Odd valuation parity retained |
| §9.2 compatible-system headline | k3,5,6 | Hodge jumps {2},{2,4},{2,5}, all distinct; supplier HT weights their negatives; pairing and multiplier signs +,+,− | Sign adapter and regularity pass |
| §10.1 determinants | k1,3,5,7 | Radicands1,−3,−15,105; cyclotomic exponents0,−2,−6,−12. k7 determinant at conjugation1 forces middle Hodge sign−1 | Rank-zero and middle-line sign pass |
| §10.2 gamma | d0,1,2,3; d1,s3 | Standard/paper ratios1,π^½,π^3/2,π³. At d1,s3 standard π⁻¹ versus paper π^−3/2 | Nonzero normalization constant correct |
| §10.4 Euler coefficient adapter | every local series1; n0 | eulerCoeff(0)=1, but LSeries.term(0)=0. L-series and Euler product both1; raw sum at s0 would be2 | Zero term and absolute-summability interface correct |
| §11.1 potential automorphy | k1,3,5,6 | Ranks0,1,2,2; positive-rank Hodge sets above distinct; rank0 gives empty sum | Isobaric conclusion, not unjustified cuspidality |
| §11.2 local transport | F=diag(−27,−81), N(e₂)=e₁ | FNF⁻¹=N/3; ker-N factor1+27T versus full factor(1+27T)(1+81T). Character graded is not pure of one weight | Pure-graded hypothesis prevents losing N |
| §11.3 odd root number | k3; k1 | χ_(−3) Gauss sum ζ₃−ζ₃²=i√3; normalized sign(i√3)/(i√3)=1. Empty rank-zero product1 | Consistent with Saito contract |
| §11.4 odd functional-equation headline | k1; k3 | k1 d0,N1,Λ1, both sides1. k3 weight4 gives reflection5−s, centre5/2 and convergence boundary3 | Actual moment family, no stand-in |
| §11.5 even functional-equation headline | k2,4; k6 | k2,k4 choose r0,P1,ε1,Λ1, both sides1. k6 weight7 gives reflection8−s, centre4, convergence boundary9/2 | Unknown dyadic data quantified before s |

### Pinned library, signatures and padding

The actual pinned sources were opened. The automatic citation resolver explicitly could not inspect native Lake packages, so its result was not used as evidence for these declarations.

| Pinned file and line | Declaration or carrier checked |
|---|---|
| `Mathlib/Algebra/Group/AddChar.lean:72`, :131, :242, :354 | `AddChar`, `map_nsmul_eq_pow`, `compAddMonoidHom`, `sum_eq_ite`; the trivial character is constant one, orthogonality has a finite-group/domain hypothesis. |
| `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83` | `ZMod.stdAddChar` with positive exponential sign. |
| `Mathlib/FieldTheory/Finite/GaloisField.lean:68`, :79, :117, :287 | Splitting-field carrier; degree/cardinality require nonzero exponent; `FiniteField.nonempty_algHom_of_finrank_dvd` supplies the actual algebra embedding. |
| `Mathlib/RingTheory/Trace/Defs.lean:70`, :110, :137 | Trace of left multiplication; trace of an included scalar is degree times that scalar; transitivity composes relative traces with finite-free and scalar-tower hypotheses. |
| `Mathlib/LinearAlgebra/Dimension/Free.lean:76`; `Mathlib/FieldTheory/Finite/Trace.lean:37`, :49 | `Module.finrank_mul_finrank`; nondegenerate finite-field trace and its Frobenius-sum formula after the algebra map. |
| `Mathlib/LinearAlgebra/TensorPower/Symmetric.lean:53` | Symmetric power is the tensor quotient by permutation relations. It supplies no connection or connection cohomology. |
| `TauCeti/LinearAlgebra/SymmetricPower/Basis.lean:192`, :203 | Native finite-free rank and diagonal-basis trace formulas. The latter assumes a basis of eigenvectors; it is not the general rank-two trace/determinant recurrence or any moment headline. The roadmap adds the connection on the native quotient. |
| `Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean:312`; `Mathlib/RingTheory/Polynomial/Chebyshev.lean:263` | `hsymm` and `Chebyshev.U`; the latter has recurrence with coefficient 2X. These are the supplied polynomial notions, not moment-series theorems. |
| `Mathlib/RingTheory/PowerSeries/Basic.lean:57`; `Mathlib/RingTheory/PowerSeries/Exp.lean:50`; `Mathlib/RingTheory/PowerSeries/Substitution.lean:158` | Native series, exponential coefficient 1/n!, substitution. The submitted exponent has zero constant coefficient and all inverted series have constant coefficient one. |
| `Mathlib/Algebra/Polynomial/Roots.lean:56` | Roots are a multiset, empty for the zero polynomial. The factor equation here forces Q(0)=1, so the root statement cannot exploit that empty multiset. |
| `Mathlib/NumberTheory/LSeries/Basic.lean:74`, :164, :178 | `LSeries.term`, `LSeries`, `LSeriesSummable`: the zero-index term is zero. |
| `Mathlib/NumberTheory/EulerProduct/Basic.lean:225`; `Mathlib/Analysis/Normed/Module/FiniteDimension.lean:605`; `Mathlib/Analysis/SpecialFunctions/Pow/Complex.lean:202` | Euler product requires f(0)=0, f(1)=1, coprime multiplicativity and norm summability; finite real dimension gives `summable_norm_iff`; the natural-base complex-power multiplication formula supports the adapter. |
| `Mathlib/Analysis/Meromorphic/NormalForm.lean:632`; `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:287`; `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:46` | `MeromorphicNFOn`, total complex Gamma, and standard `Gammaℝ(s)=π^(−s/2)Γ(s/2)`. The continuation is stated in normal form, including the values at poles. |
| `Mathlib/NumberTheory/LegendreSymbol/Basic.lean:109`; `Mathlib/Data/Nat/PadicValNat.lean:21` | Argument order of `legendreSym`; total valuation defaults at zero and p=1. Prime hypotheses and the odd-positive theta index exclude those defaults from the arithmetic formulas. |
| `Mathlib/NumberTheory/GaussSum.lean:72`; `Mathlib/NumberTheory/JacobiSum/Basic.lean:48` | Gauss and Jacobi sums have different character data and summands; neither duplicates the retained rank-two adapter. |
| `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:291`; `Mathlib/Analysis/Meromorphic/Complex.lean:22` | Primitive Dirichlet functional equation and Gamma meromorphy do not prove a functional equation for the whole moment family. The k=3 special case does not collapse the universally quantified headline. |
| `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72` | Native mixed Hodge structure has the integral/rational/complex models, bounded exhaustive filtrations and pure graded pieces. Finite-dimensional graded polarizability is not a field of this structure; the README adds it. |
| `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110`, :131; `TauCeti/Geometry/Hodge/Tate/Basic.lean:93` | The F and rational W strict-image identities; Tate structure of weight −2m and type (−m,−m). |

Object searches in both pinned libraries found no Kloosterman moment, Nori, exponential mixed Hodge, irregular Hodge or differential-Galois carrier supplying an omitted headline. The native symmetric module and mixed Hodge structure were specifically compared with the constructions in question. The near-match search results were assessed by their statements, not by shared words: polynomial identities, Gauss/Jacobi sums, Gamma meromorphy and primitive Dirichlet functional equations do not prove the four retained headlines by one `exact`.

All **21 declared names** occur in the README, sometimes with arguments inside the code span. Backticked names attributed to this roadmap resolve to its declarations. The **17 definitions** have real elementary bodies and are used by the four headlines. No namespace collision with the available sibling Lean files was found.

| README headline | Treatment in Suggested.lean |
|---|---|
| Integer polynomial, constant term and degree | `momentSeries_eq_intPolynomial`, line111 |
| Root weights, including even boundary weights | `momentSeries_weights`, line92 |
| Odd meromorphic continuation and functional equation | `oddMoment_functionalEquation`, line193 |
| Even continuation and functional equation, including existential dyadic data | `evenMoment_functionalEquation`, line208 |
| Hodge numbers of full and middle cohomology | Named as unavailable in the module docstring: missing connection cohomology, exponential Hodge structures and irregular filtration. |
| Normalized sheaf monodromy and differential Galois groups | Named as unavailable: corresponding geometric sheaf/connection constructions are missing. |
| Classicality, hypersurface comparison and Nori motive | Named as unavailable: exponential pair cohomology and Nori motives are missing. |
| Bad-prime realizations, regular polarized compatible systems and potential automorphy | Named as unavailable: actual geometric Galois realizations and regular algebraic cuspidal automorphic representations are missing. |

No statable headline is missing or replaced by arbitrary data. The polynomial statements quantify over prime p and positive k; the analytic statements have the correct parity, positive even exponent, half-plane and quantifier order for the continuation and dyadic data.

Ran `lake env lean` on the original `packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean` from the pinned content checkout, passing its absolute location as required. **Exit 0**, with exactly four warnings, each “declaration uses `sorry`”, at lines92,111,193,208. The file imports only Mathlib, so no Tau Ceti module build was necessary.

A scratch copy appended `#check @name` for every declaration. All **21 elaborated types** were compared with the README and the supplied signatures: no needed binder disappeared and no signature repair was needed. The same copy tested each of the **four** sorried theorems with `fail_if_success solve | simp`, `fail_if_success rfl`, and `fail_if_success infer_instance`. It elaborated with only the four sorry warnings, so none closed. The relevant exact-single-library-lemma alternatives were excluded by the pinned statement comparisons above. None of the four is a definition restatement, boundary-case theorem or computed Check. **No padding.**

### Ownership, current supplier citations and order

Read the board package index before concluding absence; inspected the supplied overlap facts and the main roadmap tree. There is no second copy on main, dropped cited id, only-open-revision numbering dependency, conflicting head, or lost id requiring a numbering map. Used `roadmaps show` at the available heads and `roadmaps grep` by object, including Kloosterman sheaves, symmetric connections, moment motives and Bessel objects. Roadmaps on main were resolved on main. The resolver reports no unresolved cross-roadmap citation or Lean name; native declarations were checked separately as above.

The following table records the actual supplier files and consumed sections resolved this round. Line numbers exclude the CLI's display header. A section that supplies a general construction is not mistaken for the package's particular calculation.

| Supplier / available head | File and sections resolved | Contract check |
|---|---|---|
| CongruenceSpectralGap #1504 | `TauCetiRoadmap/CongruenceSpectralGap/README.md:647`, §§4.2a–4.2b | Unit-parameter raw sums; all-characteristic sheaf, trace sign, purity, curve index. |
| PadicDifferentialEquationsAndRigidCohomology #1002 | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:12803`, §§RD.6.52a–6.53, 6.94–6.98, 7.20–7.22 including 7.21a | Formal index has residue degrees; moment comparisons retain geometric and filtered premises. Its broader all-prime construction is consumed at odd primes in rank two. |
| ComplexComparisonPartII #848 | `TauCetiRoadmap/ComplexComparisonPartII/README.md:2982`, C5.1, C5.6–C5.7 | Ordinary operators and regular/logarithmic de Rham interfaces. |
| FormalConnectionsOpers #1056 | `TauCetiRoadmap/FormalConnectionsOpers/README.md:707`, F2.2 | Symbols and filtered PBW, on the existing operator sheaf. |
| SpringerResolutionAndCharacteristicCycles #1828 | `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md:832`, §§8.1–8.4, 9.1–9.7 | Coherence, holonomicity, finite length, transfer shifts, duality and intermediate extension over characteristic-zero fields. |
| MixedHodgeModulesAndIrregularHodgeTheory #2279 | `TauCetiRoadmap/MixedHodgeModulesAndIrregularHodgeTheory/README.md:273`, §§2.1–2.5, 4.3, 4.6, 5.1–5.4, 6.1–6.7, 7.1, 7.5–7.7, 8.1–8.5, 8.7–8.8, 9.1–9.6, 10.1–10.8 | Current numbering, Fourier sign, strict bifiltration, classicality, zero-locus comparison, primitive weights and Newton/logarithmic inputs. §9.6 is at line1018. |
| EtaleCohomologyFoundations, main | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:248`, F.0.4, F.2.1–F.2.7, F.4.5, F.5–F.7, F.10.1–F.10.2b | Supports, topological invariance, rational realization, purity and blow-ups; geometric Frobenius multiplies Q_l(1) by q⁻¹. |
| InverseGaloisAndArithmeticFundamentalGroups #850 | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:566`, IG.0.T3 | Rational constructible trace formula for every finite extension. |
| EtaleDualityAndPerverseSheaves #1040 | `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:1659`, §§2.3, 2.8, 3.3 | Intermediate extension and rational coefficient extension. |
| DeligneWeightsAndPurity #929 | `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:808`, §§0.16, 0.18, 7.12, 7.15, 8.14, 8.19, 8.24 | Pairing multiplier, exact weights, middle-image purity; spectral sequence restricted to smooth proper compactification. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4707`, §2.11; §§4.11, 4.13, 4.17 and Layer0 | Artin–Schreier, modifications, strict transforms, regularity, SNC and scheme constructions. |
| ShimuraCompactifications #1053 | `TauCetiRoadmap/ShimuraCompactifications/README.md:750`, §§0.16–0.18 | Toric schemes over arbitrary rings, support criterion and geometrically reduced flat boundary. |
| AnalyticToricGeometryPartII #1647 | `TauCetiRoadmap/AnalyticToricGeometryPartII/README.md:166`, §§0.3, 0.5 | Sections and line bundles; projective embedding is still the declared extra contract. |
| LefschetzPencilsAndVanishingCycles #873 | `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:1491`, §§2.1–2.8, Layer2 examples, §6.6 | Quadratic forms, discriminants, ordinary degenerations and the separate nonordinary characteristic-two concentration theorem. |
| MotivesAndAlgebraicCycles #1313 | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:435`, §2.7, §§5.3–5.9 | Nori pairs, tensor structure, projectors, realizations; the two missing enhancements are declared. |
| ArithmeticGaloisRepresentations #856 | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1170`, §§1.7, 2.5–2.7, 3.3, 5.3, 7.4 | Semisimplification, purity from pure graded, local constants, conductors and polarization. |
| CohomologyComparisons #1064 | `TauCetiRoadmap/CohomologyComparisons/README.md:434`, §§2.13, 3.4–3.5, 4.3–4.4 | Filtered de Rham, proper smooth crystalline and proper semistable comparisons, including agreement of actual maps. |
| PadicHodgeTheory #1062 | `TauCetiRoadmap/PadicHodgeTheory/README.md:665`, §§3.2, 5.1–5.3 | HT sign adapter, supplied potential semistability, weak admissibility and exact potentially semistable WD realization. |
| PotentialModularityAndCompatibleSystems #1075 | `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md:95`, §§1.1, 1.5–1.6, 1.15 | Weak systems, polarization, regularity, purity and archimedean recipe; away-coefficient strictness is not promoted without another input. |
| ModularityAndLanglandsExtensions #1180 | `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:1470`, §§2.42–2.43, 2.49 | Simultaneous potential automorphy, density-one irreducibility discharging the universal premise, strict purity and functional equations. |
| AutomorphicGaloisRepresentationsPartII #1006 | `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:1818`, AG2.5–AG2.6, especially line3226 | Full away-prime compatibility and totally real polarized coefficient-prime descent. The extreme-regular irreducibility premise is supplied explicitly, rather than assumed for these Hodge sets. |

In particular, the coefficient-prime target at `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:3226` retains its extremely-regular-irreducibility premise. The package supplies that premise using ModularityAndLanglandsExtensions §2.43; it does not falsely assert that every moment Hodge multiset is extremely regular. The Deligne spectral sequence is consumed on its smooth proper domain; §7.1 supplies the separate boundary localization needed on singular fibres. The Hodge–Tate sign conversion, Fourier sign and Tate twist agree across the consumed interfaces.

The closest-roadmap scopes were read at the available heads. MHM #2279 expressly leaves these Kloosterman connections, particular polytopes, bases and Jordan blocks to this roadmap (`TauCetiRoadmap/MixedHodgeModulesAndIrregularHodgeTheory/README.md:38`). The Bessel roadmap #2289 consumes this roadmap's §§1.1, 1.3, 2.1, 2.5–2.6 (`TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:79`), and owns the reductive-group construction and companions. The rigid roadmap #1002 owns the rigid objects (`TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:128`); the package discharges the particular geometric comparison hypotheses. LefschetzPencilsAndVanishingCycles #873 owns generic quadratic vanishing cycles and its FSY discriminant example (line2299). The Dwork roadmap #2291 concerns the Dwork pencil and switching motives (`TauCetiRoadmap/PotentialAutomorphyDworkMotivesPartII/README.md:7`). No object is handed back and forth or constructed twice under the same fully qualified name.

Overlap check: read MixedHodgeModulesAndIrregularHodgeTheory, KloostermanSheavesAndBesselIsocrystals, PadicDifferentialEquationsAndRigidCohomology, LefschetzPencilsAndVanishingCycles, PotentialAutomorphyDworkMotivesPartII; the other two closest-roadmap lists are empty. Generic Hodge/exponential machinery belongs to MHM; reductive-group Bessel objects to the Bessel roadmap; rigid objects to the rigid roadmap; generic quadratic vanishing cycles to LefschetzPencilsAndVanishingCycles; Dwork switching motives to the Dwork roadmap; the particular Kloosterman connections and moment calculations belong here.

Ran the prescribed dependency check with the specified name, order, movable and content arguments. Complete output:

```text
depcheck: 240 roadmaps, 2188 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Read every Needs line and supplier contract independently of this coarse graph result. No forbidden supplier or unowned prerequisite was found.

### Declared supplier gaps

All six slugs occur both in `packages/KloostermanMomentsAndPotentialAutomorphy/design/plan.json` and under the appropriate supplier subsection of the README's Exact supplier contracts. Each names an earlier owner and a precise mathematical extension. These are declared contracts, not findings about work absent from a supplier today.

| Slug | Supplier and precise missing extension | Minimality check |
|---|---|---|
| higher-thickness-picard-lefschetz | PadicDifferentialEquationsAndRigidCohomology §RD.7.20: arbitrary e≥1 in Q−uπ^(2e), resolution and compatible injective comparison | Unit-thickness theorem does not cover valuation2, witnessed by k9,p3,a3. |
| irregular-stationary-phase | MixedHodgeModulesAndIrregularHodgeTheory §9.5: the stated irregular formal exponential factors, inverse Fourier singularities and monodromy in the specified sign convention | Regular stationary phase does not supply that formal irregular input. |
| nori-weight-filtration | MotivesAndAlgebraicCycles Layer5: finite exhaustive, strict and realization-compatible weights on the stated compact-support motives and projector images | Native mixed Hodge filtrations and the Nori realization constructions alone do not supply a motivic weight filtration. |
| orthogonal-motive-root-number | MotivesAndAlgebraicCycles §2.7: Saito's even-weight orthogonal-motive sign for the stated geometric summands and kernels | Local epsilon factors and an étale realization do not imply the global +1 theorem. Original source remains uncertified. |
| semisimplification-similitude-form | ArithmeticGaloisRepresentations §7.4: compatible nondegenerate form on semisimplification for a characteristic-zero algebra with anti-involution | Generic semisimplification and a polarization definition do not establish preservation of the form. Serre-orthogonal Theorem4.2.1, lines364–421, supports the contract. |
| toric-polytope-projective-embedding | AnalyticToricGeometryPartII §0.5: full-dimensional regular-normal-fan polytope, character sections giving a closed immersion over every commutative ring, compatible with base change | The cited sections construct line bundles and their sections; the universal projective embedding is the additional theorem. |

No gap has supplier `none`, no vague replacement for a hypothesis was found, and none asks this roadmap to duplicate an already supplied theorem. Acceptance is conditional on these six contracts, with no additional gap.

### Wording, arrangement and reuse

Compared all 15 seeded passages with their source text and six further passages from different parts of the package: §0.1's recurrence API, §0.2's sum definition, §2.1's exponential definition, §3.6's inverse-Fourier argument, §9.2's semisimplification pairing, and the odd-functional-equation Lean docstring. The additional comparisons use FSY lines65–131, 425–445, 735–767 and Serre-orthogonal lines364–421. Necessary formulas and standard names were distinguished from expressive wording. No copied sentence, clause-by-clause paraphrase, translated prose, table, figure or exercise list was found. No evidence of adapting a non-pinned public Lean formalization was found.

Counted named source citations before References, excluding one convention-only FSY mention: **FSY95, XZ6, Serre-orthogonal1, Saito-orthogonal1**, counting repeated locator occurrences. Opened FSY's contents at FSY lines14–51. Its four main sections and appendix do not map one-to-one onto the roadmap's twelve layers. The finite-field branch is brought forward, the generic appendix machinery is supplied elsewhere, the formal/basis calculations and Hodge calculations are separated, and the arithmetic section is split into integral geometry, local representations and comparison-hypothesis discharge.

The common order is mathematically constrained: §3.3 needs §2.4; §4.1 needs §3.6; §5.4 computes the inverse transform; §5.7 needs §5.4 before §6.4 can use its exact weight; §7.4 needs the hypersurface and boundary calculations; §8.3 needs §7.4; §9.2 assembles the local and period data; §10.4 needs the Euler and gamma factors; §11.4 needs potential automorphy and local transport. The finite-field branch and connection branch are independent until §4.5. No layer is named after a source chapter and no passage instructs the reader to follow a source's exposition.

Source independence: 21 passages compared with 3 readable sources, no expressive copying or source-table reuse found; largest share FSY, 95 of 103 named locator occurrences; contents compared with FSY: independent mathematical organization, with the shared order forced by the listed dependencies. Saito's original text was unavailable and was not compared.

## Not verifiable

- **Saito-orthogonal, main theorem**, cited through FSY §5.3.3, p.58: the original article remains settled `uncertified`. FSY's invocation at FSY lines2654–2657 was read, but the complete hypotheses of the original theorem were not independently certified. No new source request is made.
- The six declared supplier extensions are future proof obligations. Their stated interfaces, ownership and nonduplication were checked; their eventual implementations are not certified by this review.

All 15 seeded passages were readable in the cached legal sources. Original and scratch Lean elaborations completed. No Lean process was left running.

## Source issues

These are source errata, not additional package findings. The package corrects the slips it uses or declares the necessary strengthened supplier contract. No published correction was established in this review.

- **Misprint** in FSY at §3.2.1, printed p.23, FSY line 987: the source says the single-sheaf Fourier presentation uses a torus of dimension nk; it should use dimension n before taking tensor powers; affects the proof.
- **Misprint** in FSY at proof of Proposition 4.20, printed p.33, FSY line 1408: the source says the rank-k infinity block uses primitive P_k; it should use P_(k−1), producing weights 0,2,…,2k−2; affects the proof.
- **Misprint** in FSY at the paragraph following (5.4), printed p.40, FSY line 1731: the source says reciprocal eigenvalues pair using the half-weight exponent; it should use α↦p^(k+1)/α; affects a stated result.
- **Misprint** in FSY at §5.1.2, printed p.41, FSY line 1761: the source says the derivative is nonzero on the whole boundary divisor; it should assert nonvanishing on its intersection with the hypersurface, where the derivative is −1/z₁; affects the proof.
- **Error** in FSY at proof of Proposition 5.23, printed p.50, FSY lines 2249–2256: the source says every quadratic point has unit thickness after quadratic base change; it should allow exponent 2e, since k9,p3,a3 has e2; affects the proof.
- **Error** in FSY at Corollary 5.30, printed p.52, FSY lines 2350–2362: the source says its gamma product equals the standard recipe; it should multiply that product by π^(d(d+1)/4) for the asserted equality; affects a stated result.
- **Misprint** in FSY at Example A.3, printed p.63, FSY line 2876: the source says unshifted divisor restriction is perverse degree zero; it should shift restriction by −1, since restricting the constant perverse complex gives ℚ_D[dim D][1]; affects a stated result.
- **Misprint** in FSY at Example A.27, printed p.71, FSY line 3222: the source says the composite pushforward is zero; it should say the geometric map is constant zero and its pushforward is supported at zero; affects the proof.
- **Error** in FSY at Remark 5.41, printed p.59, FSY line 2676: the source says the inertia-invariant Euler determinant equals the full semistable-period determinant; it should retain the monodromy kernel and descent invariants; affects the proof.
- **Error** in XZ at §2.1.5(i), printed p.10, XZ line 489: the source says exp(π(t−t^p)) gives F*E→E for d+πdt; it should use the inverse multiplier for that direction, with logarithmic derivative π(pt^(p−1)−1)dt; affects a stated result.
- **Misprint** in Serre-orthogonal at proof of Theorem 4.2.1, printed p.10, Serre-orthogonal line 393: the source says isotropy means vanishing on every ambient pair; it should mean pairs in the selected submodule; affects nothing.
- **Misprint** in Serre-orthogonal at proof of Theorem 4.2.1, printed p.10, Serre-orthogonal line 394: the source says orthogonal stability follows from (4.2.2); it should cite the original compatibility (4.1.1); affects nothing.
- **Misprint** in Serre-orthogonal at proof of Lemma 4.2.4(ii), printed p.10, Serre-orthogonal line 411: the source says the isotropic subspace has half the dimension of M; it should say half the dimension of M⊥; affects nothing.

## For the human reviewers

- Saito-orthogonal remains `uncertified` in `packages/KloostermanMomentsAndPotentialAutomorphy/sources.toml`. Its original text was unavailable; only FSY's invocation and the explicit supplier contract were checked.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "cdfffd9b058d84dceef7b41b74d255604f5fea1f", "job": "REV-PKG-KloostermanMomentsAndPotentialAutomorphy~7", "model": "gpt-6-astra", "worker": "chris-6"} -->
