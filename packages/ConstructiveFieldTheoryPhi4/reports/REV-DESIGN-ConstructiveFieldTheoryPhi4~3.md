# Review of ConstructiveFieldTheoryPhi4 (design, round 3)

**Verdict:** needs changes

The twelve previous findings are repaired. Five further findings remain: one P1 and four P3. The blocking defect is in the plan's general integration-by-parts formula; its README counterpart is correct. This is a repairable design. No design or manifest entry was changed.

## Previous findings, checked first

All locations in this table are in `packages/ConstructiveFieldTheoryPhi4/design/README.md` unless otherwise specified. The corresponding plan entries were also read. None of the previous findings was marked not actionable; none is re-raised.

| Previous finding | Repaired passage and assessment |
|---|---|
| R01: Griffiths–Simon generality | **Repaired.** Lines 238–245: “The growth condition is on ρ, not on the approximating sequence”; “One sequence must serve any prescribed finite collection of such systems simultaneously”. The full limit-growth class and its finite-volume transfer theorem are now owned. The theorem includes choosing approximants; it does not claim that every weak approximation works. |
| R02: current normalizers | **Repaired.** Lines 322–328: “defined as a probability measure only for Z_D > 0”; positivity is equivalent to even source parity in every positive-coupling component. Unnormalized switching still includes zero normalizers. Line 344 propagates the restriction into the proof route. |
| R03: reachability moments | **Repaired.** Lines 630 and 651: “every coordinate square is integrable under its Gibbs law”; “0 ≤ Σ_{n,m} … < ∞”. Line 35 calls this a second moment unless evenness is assumed and excludes infinite moments. The Cauchy example is explicitly excluded at line 664. |
| R04: continuum kernel ownership | **Repaired.** Lines 75–77 import RelativisticQuantumFieldTheory §7.1; line 684 says “Using the analytic Green-kernel facts of RelativisticQuantumFieldTheory §7.1”. Line 689 includes this supplier. Its present head supplies precisely these analytic facts. The probability law and lattice limit remain here. |
| R05: summit ownership | **Repaired.** Line 711: “they are not theorem targets or acceptance statements of this roadmap”. Lines 715 and 725 assign both statements and proofs to ConstructiveFieldTheoryPhi4PartII. The plan has eight owned layers and a separate `downstream_goals` list. There is no reverse supplier edge. |
| R06: stale pins | **Repaired.** Lines 41 and 61 give Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`; these match the manifest and both library HEADs. Refreshed declaration locations were opened. |
| R07: zeroth correlation | **Repaired.** Line 412: “correlations of positive total degree vanish and the zeroth correlation is 1”. The plan's 4.1 Check agrees. The new n = 0 pairing Check at line 353 also gives 1 = 1. |
| R08: fixed reflection vertices | **Repaired.** Line 503 distinguishes edge reflections from the vertex expression “E[|E(f \| spins on the fixed vertices)|²]”. At f = φ₀ the corrected value is 1, versus the unconditional value 0. The PDF confirms the conditional proof in Proposition 2.14. |
| R09: Gaussian zero mode | **Repaired.** Line 514: “pin φ₀ = 0 and integrate over the other coordinates”. The shift is h − h₀. The two-vertex integral is √π, whereas the unpinned integral is infinite. |
| R10: involutions | **Repaired.** Line 647: “The two identities cannot be separated when g² = id”. The half-turn gives 1 on both sides; the quarter-turn still gives corrected value 0 and incorrect value 1. |
| R11: PDE deferral | **Repaired.** Line 18 cites “PDE, Scope and ownership: the stochastic programme assigned to PDE, Part II”. Main's PDE lines 101–110 contain that assignment. It remains a deferral, not a supplier. |
| R12: infinite-volume FKG dependency | **Repaired.** Line 424 explicitly adds “3.3 (finite-volume FKG and uniform-integrability passage for continuous polynomially bounded cylinder functions)”. Plan target 4.2 includes `target:3.3`. |

The changed passages and their consumers were re-examined, including the full-class transfer, current parity criterion, zero-block convention, covariance mass order and retained downstream statements. Sweeps for the repaired patterns found no recurrence of the previous defects. They did expose a separate lost analytic-domain qualification in the plan, included in R01 below.

## R01 (P1) — Restore the plan's general integration-by-parts contract

**Location.** `packages/ConstructiveFieldTheoryPhi4/design/plan.json:912`, target 3.7, and its hypotheses at lines 913–915: “and <d_x F> = <F (4 lambda phi_x^3 - 2b phi_x - sum_y J_xy phi_y)>”. Compare the correct restricted sum and function hypotheses in `packages/ConstructiveFieldTheoryPhi4/design/README.md:372`.

**Claim.** The general identity in the plan includes the ignored diagonal of J. It also omits the README's continuously differentiable, polynomial-growth hypotheses on F and its derivative.

**Witness.** One site, λ = 1, b = 0, J_xx = 1, F(φ) = φ: the Gibbs law is ρ_{1,0}; the left side is 1, but the plan's right side is 1 − Γ(3/4)/Γ(1/4) = 0.66201088.

**Exact repair.** In target 3.7's general identity replace `sum_y` by `sum_{y != x}` (or use J⁰ explicitly), and copy the README's domain into the statement and hypotheses: F is continuously differentiable, with F and its coordinate derivative polynomially bounded. Add the one-site nonzero-diagonal computation as a negative-control Check in the plan and README. Do not instead require J to have zero diagonal: arbitrary diagonals are deliberately permitted and ignored by the model.

**Repair test.** The restricted sum is empty, so both sides are 1, independently of J_xx. The missing derivative condition is substantive too: with the same single-site law and J = 0, take F(x) = x + sin(exp(x⁴)). It is smooth and polynomially bounded, but F′ is not integrable. After cancellation with the density, its oscillatory derivative has absolute integral comparable to ∫₁^∞ |cos t|/t dt = ∞. The real integral on the left is therefore 0 at the pin (`MeasureTheory.integral_undef`, `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean:204`), whereas the right side is 4E[x⁴] + 4E[x³ sin(exp(x⁴))] = 1 + 0 = 1. The restored derivative-growth hypothesis excludes this example. This is a defect in the plan contract, not in the README theorem or Sokal's intended integration-by-parts argument.

## R02 (P3) — The plan's susceptibility Check loses its domain

**Location.** `packages/ConstructiveFieldTheoryPhi4/design/plan.json:1133`, target 4.3, `high_temperature`: “gives chi <= 1/(1 - 2dJ)”. The README includes the missing condition at `packages/ConstructiveFieldTheoryPhi4/design/README.md:449`.

**Claim.** The plan Check asserts the finite susceptibility estimate without 2dJ < 1.

**Witness.** For the one-dimensional Ising chain at J = 1, χ = exp(2) = 7.389056, while 1/(1 − 2dJ) = −1. At J = 1/2 the denominator is zero.

**Exact repair.** State the estimate only for 0 ≤ 2dJ < 1. State the critical-point consequence separately for J > 0, applying the estimate to βJ with 2dβJ < 1; at J = 0 retain the separately stated β_c = ∞. Add J = 1 as the negative control for the finite estimate.

**Repair test.** At d = 1, J = 1/4 the corrected estimate is exp(1/2) = 1.648721 ≤ 2. The J = 1 and J = 1/2 instances are excluded from that estimate, while their critical-point conclusion remains valid. This is a Check defect; the README already states the correct theorem domain.

## R03 (P3) — Specify the volume limit in the independent-spin Check

**Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:644` and `packages/ConstructiveFieldTheoryPhi4/design/plan.json:1648`: “⟨T_{f,L}²⟩ … → 2^{−d} ∫ f²”. Section 7.1 permits R = L and an arbitrary function f; this Check specifies neither a test-function class nor a growing-volume condition.

**Claim.** Normalization by the block size alone gives the full-space white-noise limit.

**Witness.** Take d = 1, J = 0, Ising spins, R = L and f(x) = max(0, 1 − |x − 3|). Every sampled value is zero, but (1/2)∫ℝ f² = 1/3.

**Exact repair.** Specify f ∈ C_c(ℝ^d), L → ∞ and V = V_{R(L)} eventually containing every lattice sample of supp f, with R(L) ≥ L. Alternatively state the iterated volume-first limit of §7.2 explicitly. Include R = L with this translated tent as a negative control: it gives the truncated, not full-space, integral.

**Repair test.** With R = L the variance is identically 0. With R = 4L, the tent's sampled squared sum is (2L² + 1)/(3L), so its normalized variance is (2L² + 1)/(3L(2L + 1)) → 1/3. Choosing R/L → ∞ gives the same result. The normalization and reachability definition need no change.

## R04 (P3) — Correct the Griffiths equation numbers in Sokal

**Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:281` and `packages/ConstructiveFieldTheoryPhi4/design/plan.json:638`: “Sokal (2.20)–(2.21)”.

**Claim.** These are the two Griffiths inequalities.

**Witness.** `sokal-1982 line 414`, printed p.327, read directly in the cached PDF: (2.19) is Griffiths I, (2.20) Griffiths II, and (2.21) defines the multi-index monomial.

**Exact repair.** Replace the range by “(2.19)–(2.20), p.327” in both design files. If the monomial definition is also being cited, identify (2.21) separately. The manifest's recorded range can be extended to start at (2.19) by the fix worker; this review did not rewrite that entry.

**Repair test.** On two Ising sites with J = (log 3)/2, (2.19) gives 1/2 ≥ 0 and (2.20), with A = B the two-site monomial, gives 3/4 ≥ 0. These are precisely the advertised two inequalities, rather than the definition in (2.21).

## R05 (P3) — Remove the malformed publication page range

**Location.** `packages/ConstructiveFieldTheoryPhi4/sources.toml:9`, the existing `aizenman-duminilcopin-2021` entry: “pp. 163-23”.

**Claim.** This is the publication's page interval.

**Witness.** The purported final page 23 precedes the initial page 163. The README instead cites the explicitly recorded arXiv v4, whose source locators remain usable.

**Exact repair.** Remove the malformed page-range suffix from the venue field, retaining the journal, volume, issue, DOI and explicit arXiv-version metadata. A verified publisher page range may be supplied instead; do not invent it from the preprint's pagination.

**Repair test.** The venue then makes no false interval claim, and all locators checked below continue to refer to arXiv v4. This review preserves the author's manifest entry as required.

## Verified sound

**Coverage and principles.** Read all 747 README lines, all 36 owned plan entries and both downstream goals, the 13-source manifest, the previous review and repair report, the supplied package index, open-roadmap index and overlap report. There are eight owned layers, 34 numbered README target subsections/Needs lines, eight Examples sections and eight Dependencies sections. The plan has 121 Checks, at least three per owned entry, and no dangling `target:` prerequisite. Every definition has a prose API and Checks. All explicit Needs lines and supplier contracts were examined. The deficiencies found are the five above.

The scope is a general library: arbitrary finite sets and signed couplings for existence; ferromagnetic couplings where correlation inequalities require them; separate Gaussian stability; arbitrary covariance index sets; and all stated massive/massless dimensions. No computational algorithm, copied source passage, sorry'd data, Lean option, or route-specific restriction was found. There is no existing ConstructiveFieldTheoryPhi4 roadmap on main to re-plan. The nonnegative-weight correction is justified by an actual counterexample to the source's signed formulation, rather than by convenience. The restored full limit-growth class does not replace its transfer theorem with a stronger hypothesis on given approximants.

The layer order is mathematical: 0→1→2→3→4 for the lattice construction, the torus branch 0–1→5, independent probability Layer 6, then their combination in Layer 7. It does not reproduce the sources' order: Aizenman–Duminil-Copin starts with continuum fields and puts its GS extension after infrared estimates, while this design puts their necessary finite-volume inputs first. Layers 5 and 6 are explicitly independent of earlier unrelated branches. No source-chapter layer title or statement that the roadmap follows a source was found. No forbidden supplier, upward edge, cycle, duplicated summit proof, or undeclared supplier gap was found.

**Adversarial table.** Values were computed directly from the formulas, including finite spin enumeration. For compactness put j = (log 3)/2, so tanh j = 1/2. The table includes all fifteen sampled targets, all owned headline families, every changed mathematical interface and every target of a finding. The unchanged numerical rows of the previous review were used only where they contain values; its blanket assurances were not used. The present pass additionally checked the plan's actual formulas and domains, which produced R01–R02.

| Statement | Instances tried | Computed sides or discriminating values | Result / change |
|---|---|---|---|
| Conventions: lattice, Hamiltonian | d = 1,R = 0,1; two Ising sites at j | Box sizes 1,3; Z = 2/√3 = 1.154701; correlation 1/2, versus 4/5 if the bond is counted twice | Ordered sum with 1/2 gives the intended unordered bond. |
| §0.1 admissibility, evenness and closures | δ₂; scaled δ₁; Gaussian; empty product | Quadratic-exponential integrals exp(4c), exp(4c), ∞ at Gaussian c = 1/2; empty product 1. δ₂ mean 2, not 0 | Admissibility and symmetry are distinct; scaling/product/tilt denominators positive. |
| §0.1 growth comparison | Density exp(−x² log(1+x²)) | c x²−x²log(1+x²) → −∞; x^α−x²log(1+x²) → +∞ for α>2 | Admissible but outside stronger growth class. |
| §§0.2,0.2.1 measures and scaling | λ = 1,b = 0; λ = 1,b = 2,s = 2; γ_{−1/2} | Eφ² = 0.33798912; Eφ⁴ = 1/4; new parameters (1/16,1/2), maxima ±2; Gaussian variance 1 | Gamma, density sign and Jacobian conventions agree. |
| §1.1 existence, decoupling, transport | Empty V; independent Ising pair; N(0,1) pair at J = 1 | Z = 1,1,∞; independent cross moment 0 before and after relabeling | Stability is essential; no ferromagnetic restriction on existence. |
| §1.1 signed three-site model | Triangle at J = ±j | Z = (exp(3J)+3exp(−J))/4; pair moments 2/3 and −2/7 | Signed case included, positivity only in its stated regime. |
| §1.2 integrability and symmetries | δ₂; equal-bond chain; unequal bonds 0,j; one biased spin | Exp moment exp(2h+4c); equal edge moments 1/2 = 1/2; unequal 0 versus 1/2; biased mean 1/2 | Automorphism and evenness hypotheses discriminate. |
| §1.3 derivative | Ising pair at 0,j; diagonal direction | Derivatives 1 and 3/4 = 1−(1/2)²; diagonal derivative 0 | Symmetric off-diagonal direction has no extra 1/2. |
| §1.4 continuity | Escaping mass at ±k; J = 0 | Z ≥ exp(k²−2k)/4 → ∞, versus Z(δ₀)=1; at J=0 all Z=1 | Uniform exponential-square control is necessary for interacting transfer. |
| §1.5 Gaussian stability/covariance | b=−1,J=±1,2,−3 | Precision eigenvalues (1,3),(3,1),(0,4),(5,−1); stable covariances have diagonal 2/3 and off-diagonal ±1/3 | Both signs, singular boundary and wrong-sign control checked. |
| §1.5 Green limit | d=1, μ=1 and μ↓0 | G₁(0)=1/√5; G_μ(0)∼1/(2μ) | Low-dimensional massless exclusion retained. |
| §2.1 block representation | q=(1/2,1/2),K=(log2)/2; one block weight s=2 | Three probabilities 1/3; two-block covariance 4 tanh(4J) | Internal and external coupling coefficients agree. |
| §2.1 signed-block control | q=(1,−1),K=j | ε=1/4; fourth moment 4 > 3(second moment)²=3 | Source's arbitrary signs cannot support Lebowitz transfer. |
| §2.2 definition and closure | δ₀; Gaussian; φ⁴; scaling by 2 | Growth moments 1,∞,finite; 2^(5/2)|x|^(5/2)−|x|³→−∞ | Full class with growth on the limit; scaling may lower exponent. |
| §2.2 approximants and transfer | Shrinking independent blocks; constant δ₀; constant Ising on one/two sites | Variance 1/log²N→0, but log growth lower bound (1−N)log2+N^(α/2)/log^αN→∞; constant approximants give growth 1; Ising moments 1 and tanh J | Transfer chooses approximants; it is not a conclusion about every weak sequence. |
| §2.3 φ⁴ approximation | c=(12λ)^(−1/4), m=φN^(−1/4)/c | N(g_N−1)m²/2=bφ²; Nm⁴/12=λφ⁴; g_N>0 for negative b once N>4b²c⁴ | Quartic coefficient, sign and eventual ferromagnetism match. |
| §3.1 Griffiths and duplication | Ising at ±j; independent signs, m=n=2 | Two-point ±1/2; covariance 3/4; (x+y)²(x−y)²=0 for each sign pair | Hypotheses and parity proof correct; locator R04. |
| §3.2 monotonicity | Chain j,j versus disconnected endpoints; biased spins | Endpoint 1/4 ≥ 0; biased one-site mean −1/3 becomes −3/(5+4exp(−2J)) < −1/3 for J>0 | Evenness and volume/coupling direction checked. |
| §3.3 FKG | Bernoulli {0,1}, J=log3; J=0; reversed function | Covariance 1/18 ≥ 0; at independence 0; Ising F=σ_x,G=−σ_y gives −1/2 ≤ 0 | Finite-lattice extension has a real non-even application. |
| §3.4 current weights and switching | One edge j; sources both endpoints; A=B=endpoints | Z_empty=2/√3, Z_endpoints=1/√3; switching sides 1/3 = 4/3−1 | Weight factorials and normalized Gibbs convention agree. |
| §3.4 positivity/parity | J=0; singleton; sources in separate components; empty graph | Nonempty normalizers 0; empty normalizer 1; with J>0 and two endpoints normalized mass 1 | Repaired probability domain exact; unnormalized zero case 0=0. |
| §3.5 Lebowitz/Gaussian | Ising; ρ_{1,0}; sparse sign ε=1/4; n=0 | 1≤3; 1/4≤0.34270994; nonmember 1/4>3/16; empty pairing 1=1 | Full-class statement passes controls; Sokal's printed outer product is not copied. |
| §3.5 Simon–Lieb/repeated positions | Chain at j, Λ={0}; tuple (x,x,y,y) | 1/4≤j/2=0.274653; 1≤1+2(1/2)²=3/2 | Finite-region factor, bond normalization and repetitions correct. |
| §3.6 reflection | Four-site chain at j; reversed dominance with only cross bonds | 1/2≥1/4; 1≥1/8; wrong-dominance example 0<1/2 | Coupling dominance is necessary; fixed vertices cause no sign change. |
| §3.7 IBP and bound, README | One site λ=1,b=0,J=0,F=x | 4Eφ⁴=1=EF′; M=1/2≥0.33798912 | README's formula and moment bound correct. |
| §3.7 IBP, plan | Same law, J_xx=1,F=x; J=0,F=x+sin(exp(x⁴)) | First: 1≠0.66201088. Second: real-integral left 0≠right 1 | R01; restore omitted diagonal exclusion and function domain. |
| §3.7 Newman | Ising a=2; sparse ε=1/4 | cosh2=3.762196≤exp2=7.389056; sparse 1.690549>exp(1/2)=1.648721 | Growth estimate separates the class from even admissible laws. |
| §4.1 monotone correlations | Ising chain at j, distance2; δ₀ degree0/2 | Both exhaustions give 1/4; δ₀ values 1 and 0 | Repaired empty-product convention agrees with Wick. |
| §4.2 law and inherited FKG | Chain at j; independent Ising; one coordinate | P(same neighbor)=3/4; distinct-coordinate covariance0; same-coordinate covariance1 | Moment determinacy and added finite FKG edge fit the passage. |
| §4.3 susceptibility and threshold | Chain at j; δ₀; J=0 | χ=(1+1/2)/(1−1/2)=3; δ₀ χ=0; independent χ=Eφ²; chain β_c=∞ | Sum includes origin; zero model handled. |
| §4.3 high-temperature Check | d=1,J=1/4,1/2,1 | χ=1.648721,2.718282,7.389056; displayed bounds2, zero-denominator junk0,−1 | R02; only first lies in 2dJ<1. |
| §4.4 axis/reflection consequences | d=1, chain at j; d=2 small t | S(0),S(1),S(2)=1,1/2,1/4; leading terms t,2t²,t² at (1,0),(1,1),(2,0) | Both norm-bound directions agree. |
| §5.1 torus/Fourier | d=1,L=1,j; L=2,j | Small-torus correlation tanh(2j)=4/5; Ŝ(0)=9/5, Ŝ(π)=1/5; four-cycle neighbor10/17 versus open1/2 | Doubled L=1 bond and periodic carrier checked. |
| §5.1 Parseval | L=1, φ=(1,−1) | Sum of directed squared differences8; (1/2)[E(π)·|φ̂(π)|²]=8 | Fourier symbol E(π)=4 and volume divisor match. |
| §5.2 reflection/chessboard | Product Ising, vertex f=φ₀; edge reflection; two-site indicator/constant | Vertex form1=conditional square, unconditional0; edge form0 for mean-zero f; chessboard1/4=1/4 | Fixed-vertex repair correct; sign reversal J<0 gives a negative eigenvalue. |
| §5.3 domination | Two-site torus J=1; constant h; pinned Gaussian | Z″(0)=−4+28exp(−4)=−3.487162; constant shift ratio1; pinned Z(u)=√π for u=0,1, unpinned∞ | Repaired equality example removes zero mode. |
| §5.4 infrared/sum rule | L=1,d=1,J=3/8; Gaussian mass gap→0 | EŜ=1.459404≤8/3 but >2/3; Gaussian EŜ→1/J; sum rule((1+t)+(1−t))/2=1 | README constant correct despite printed source constant. |
| §5.5 order | d=3,J=1; d=1,2 | Lower bound1−I₃≈0.7473; radial infrared integral ∫r^(d−3)dr diverges in d≤2 | Dimension restriction and normalization correct. |
| §6.1 random fields | Integral functional at f with integral1 and at −f; absolute-value model | Linear values1,−1; wrong model1,1; zero-field values0,0 | Pointwise-in-tests a.s. linearity is the defined notion. |
| §6.2 Schwinger kernels/decay | h=exp(−x²), x=−y=r; h=1; white noise | exp(−2r²)=decay bound; constant1 fails decay; disjoint-support covariance0 but same-test covariance∫f²>0 | Function kernel excludes white noise; decay alone does not force centering. |
| §6.3 PSD realization | [[1,r],[r,1]],r=1,2; K=0; Brownian times0,1 | Difference variance0,−2; zero process variance0; Brownian variances0,1 | Singular PSD allowed, non-PSD excluded; centering explicit. |
| §6.3 bilinear specialization | h=af+bg | Var(X_h−aX_f−bX_g)=C(h−af−bg,h−af−bg)=0 | Gives the per-relation a.s. linearity of §6.1, not an asserted continuous sample path. |
| §6.4 Wick iff | Gaussian variance1; fair sign; noncentered mean1; n=0 | Fourth moments3 versus1, Wick RHS3; noncentered first moment1 versus0; M₀=1 | Both directions and centering tested; exp/cosh series gives exp(a²v/2). |
| §7.1 normalization | Independent N spins: Ising, Gaussian v, δ₀, Cauchy | Σ=N,Nv,0,∞; normalized block moments1,1,0,undefined | Finite-moment repair preserves all intended classes. |
| §7.1 non-even case | Bernoulli {0,1}, N=3 | Block second moment3, mean normalized sum√3/2, variance1/4 | Normalized second moment1 is not variance1. |
| §7.1 action | Quarter-turn and half-turn, specified indicator tests | Quarter-turn corrected0=0 versus wrong1; half-turn1=1 | Previous action and involution repairs survive. |
| §7.1 independent-spin limit | Tent centered3; R=L versus R=4L | First variance0 for every L versus claimed1/3; second(2L²+1)/(3L(2L+1))→1/3 | R03: eventual inclusion of support is needed. |
| §7.2 reachability | Independent Ising volume-first; δ₀; Cauchy; telegraph c=1 | White-noise covariance2^(−d)∫fg; zero law; Cauchy Z=1,Σ=∞; telegraph κ=2+2exp(−2)>0 | Order of limits and finite-second-moment domain checked. |
| §7.3 limiting structure | Biased Bernoulli; rare spikes p=N⁻²,a²=1/p | Biased mean→2^(−d)∫f, variance→0; spike probability O(1/N), lattice variance→2^(−d)∫f² but limit half as large | Symmetry needs evenness; lower semicontinuity need not be equality. |
| §7.4 covariance and mass order | d=1,m=1,2; f=1_Q, g=−f | C₁=1.13533528, C₂=0.37728945; cross terms−1.13533528<−0.37728945 | Quadratic-form order, not pairwise order; block denominator positive. |
| §7.4 dimensions and kernels | d=1,m↓0; d=4,m=0 | C_m(1_Q,1_Q)∼2/m; ∫_{ball ε}1/(4π²|x|²)=ε²/4 | Massless d=1 excluded; d=4 local singularity integrable. |
| §7.4.1 lattice reachability | b_n=−d−m²/(2L²), J=1 | Precision m²/L²+E(p); L²E(q/L)→|q|²; p=2πξ/L gives4π²|ξ|²+m² | Covariance scaling and block normalization agree. |
| Downstream 8.1–8.2 | d=1 telegraph; d=4 GFF; Gaussian single-site | Telegraph S₂=exp(−distance)/κ→0 with nonconstant bounded observables; GFF kernel decays; Gaussian growth integral∞ | Controls distinguish dimension and class; proofs owned only by Part II. |

For the zero-normalizer claim in the conventions, a stable Gibbs law has a strictly positive density relative to the product law. Thus Σ=0 for a nonempty block implies a sum of independent identically distributed spins is almost surely zero under the product law. Its characteristic function has modulus one everywhere, forcing each spin to be a constant; the sum forces that constant to be zero. Infinite second moments are not put through a real-integral fallback.

For the GFF limit, the stated Fourier lower bound controls low frequencies and Parseval controls high-frequency tails: outside |q|≤A the covariance tail is at most a constant times A⁻² times the bounded sampled L² norms. On bounded q-regions the Riemann sums converge, with |q|⁻² integrable at zero exactly for d≥3 in the massless case. This supplies the compact-region dominated-convergence argument plus uniform tail control on C_c; no unproved uniform pointwise Fourier decay of arbitrary continuous tests is needed. The same treatment of the indicator is valid. Strict positivity of its covariance follows from its nonzero Fourier transform near zero.

**Sources: the fifteen seeded targets.** All were checked at their locators. Page numbers below are for the recorded version. The six cached PDFs/extractions were read; rendering selected cached pages recovered formulas missing from the extracted text. The seven settled uncertified sources were not requested again. No further source or new manifest key was needed. No additional locator is explicitly flagged unverified in the design; the previous review's unreadable-formula qualifications were revisited as described here.

| Target | Locator read | Support, hypotheses and limits |
|---|---|---|
| 1.2 | `aizenman-duminilcopin-2021 line 230`, (1.17), p.5; `sokal-1982 line 405`, (2.18) and item (b), p.327 | Source Gibbs and symmetry statements are for Ising/φ⁴. The arbitrary-admissible extension follows from the explicitly owned exponential domination and change of variables, not from a source theorem at that broader generality. Rendered p.327 confirms the lattice/spin symmetries. |
| 1.3 | `peled-spinka-2017 line 519`, derivative display after Theorem 2.3, p.13 | Covariance derivative and off-diagonal bond convention verified for O(1)/O(2). General polynomially bounded measurable F and admissible scalar measures require the named dominated-differentiation input and §1.2's bounds; these suffice. |
| 1.4 | `aizenman-duminilcopin-2021 line 1984` and line 2020, §7, pp.44–45 | These passages invoke continuity, but do not state this exact uniform-square-exponential theorem. The owned proof route supplies finite-product weak convergence and uniform integrability. The separate full-class transfer is no longer falsely inferred from this theorem without its hypotheses. |
| 2.2 | `aizenman-duminilcopin-2021 line 374`, Definition 2.1(2), and line 384, (2.2), pp.8–9; lines 1982–1985 and 2019–2022 | Growth is on the limit. The corrected nonnegative-weight class matches the transfer's required signs. The simultaneous finite-volume approximation theorem is explicitly additional work here; the source's continuity assertion is context, not a numbered theorem with this exact signature. The bad-approximant Check is consistent with that distinction. |
| 3.2 | `peled-spinka-2017 line 519`–532, p.13; `sokal-1982 line 400`, p.327 | Coupling and volume monotonicity found. Sources have more specialized spins; general even admissible scalar measures use the roadmap's duplication argument and derivative theorem. |
| 3.3 | `sokal-1982 line 423`, (2.25), p.327, read in the PDF | Increasing-function covariance is nonnegative in Sokal's φ⁴ setting. The roadmap's non-even admissible version is an extension through log-supermodularity and finite-chain FKG; the pinned finite FKG does not itself state the continuous-spin theorem. |
| 3.5 | `aizenman-duminilcopin-2021 line 520`, (3.11), p.12; line 1314, Lemma 5.7, and line 1342, footnote 5, p.30; `sokal-1982 line 419`, (2.23)–(2.24), p.327 | The four-point current identity and Simon–Lieb inequality, including the finite-Λ factor, are supported. The higher Gaussian inequality is derived by switching and induction. Rendered Sokal (2.24) has an outer-product misprint; the README correctly uses a sum. Source §7's spin-balanced transfer is not a separately numbered theorem asserting all these signatures. |
| 4.2 | `sokal-1982 line 405`, (2.18) and item (b), p.327; `duminilcopin-2017-lectures line 549`, Corollary 1.9, p.14 | Infinite-volume existence/symmetry and free-boundary Potts/Ising limits found. The uniform-exponential-moment generalization is owned here, with finite-dimensional tightness, determinacy and countable extension explicitly named. It does not assert DLR uniqueness. |
| 5.1 | `aizenman-duminilcopin-2021 line 1058`, (5.5)–(5.8), p.24; `peled-spinka-2017 line 1283`, p.27 | The 2L torus, Fourier modes and nonnegative spectral second moments agree. Choosing the other half-open dual fundamental domain is equivalent. The special L=1 double-bond convention is explicit and independently checked, not silently borrowed from a simple graph convention. |
| 5.3 | `peled-spinka-2017 line 1563`, (43)–(48), pp.32–33; `simon-2020-twelve-tales line 1529`, (5.19)–(5.21), pp.36–37 | The reflection/chessboard proof applies to the finite tilted scalar measure with bounded Gaussian pair interaction. Pinning/quotienting the Lebesgue zero mode is explicit at PS line 1640. Rendered pages confirm sign/endpoint misprints in the sources listed below; the roadmap's direct expansion has the correct factors. |
| 6.3 | `aizenman-duminilcopin-2021 line 77`, p.2; Glimm–Jaffe Ch.6 and Simon 1974 Ch.I, settled uncertified | ADC describes Gaussian fields through covariance, not an arbitrary-index realization theorem. The general construction is owned here and uses the actual PSD finite Gaussian restrictions and StochasticCalculus §1.1. The introductory source alone is not certified as proving that construction. |
| 6.4 | `aizenman-duminilcopin-2021 line 81`, (1.7), p.2; StandardDistributions §5.3 | Pairing formula verified. The converse additionally derives an exponential moment by the cosh series and invokes the pinned determinacy theorem. Centering, repeated positions and the empty product are explicit. |
| 7.1 | `aizenman-duminilcopin-2021 line 157`, (1.14)–(1.15), p.4 | The block second-moment square root is the source normalization. Its source classes have finite moments; the design now states this domain when extending them. The standalone Check's absent volume condition is R03, not a defect in the source definition. |
| 7.2 | `aizenman-duminilcopin-2021 line 167`, Definition 1.1 and footnote 2, p.4 | Finite collections of C_c tests, volume-first then scale limits and subsequences are present. The roadmap's arbitrary-class moment qualification is explicit. Its coordinate-law field is the stated carrier; it does not claim the additional distribution-valued regularity discussed in the footnote. |
| 7.4 | `sokal-1982 line 620`, §2.3, pp.334–337, and line 710, Lemma 2.2, p.337; `frohlich-1982 line 266`, preprint p.13; `simon-2020-twelve-tales line 954`, (3.8), pp.23–24; RQFT §7.1 | Rendered Fröhlich p.13 gives (−βΔ+m²)⁻¹ and mass m/√β. Sokal's actual Lemma 2.2 assumes a uniform Schwartz-seminorm covariance bound and takes a subsequence; it is not the exact C_c block-normalized all-dimension Gaussian reachability theorem. That theorem is explicitly derived by the roadmap's Fourier route, checked above. The imported continuum kernel supplies its analytic facts. |

Other repaired-source passages read: ADC Definitions 3.1–3.2, Lemma 3.3 and (3.7)–(3.9), pp.10–12; Theorem 1.2, p.5, and Theorem 7.1/Proposition 7.2, p.45; PS Propositions 2.14–2.16, pp.28–30, and (49)–(52), pp.34–35; Simon's block discussion, p.25; Sokal (2.27), p.328, and (3.1)–(3.5), p.342. ADC's quantitative estimates retain β≤β_c and L≤ξ; they belong to Part II. They are not smuggled into the base's proof prerequisites.

**Recovered source evidence.** Rendered Sokal pp.327–328, 337 and 342, Fröhlich preprint pp.5 and 13, PS pp.28–29 and 32, and Simon pp.36–37. Thus the previously unreadable FKG, Lebowitz/Gaussian, Newman, covariance-bound and integration-by-parts displays were directly inspected this round. PS's reflection forms do contain the complex conjugates; their omission was extraction loss, not a printed-source error. Fröhlich's p.5 triviality statement includes distinct separated points and vanishing magnetization; it is not an unrestricted assertion about every lattice parameter. None of these rendered pages was copied into the repository or report.

**Supplier and ownership audit.** The read-only content main is `fd02c5bd5024d04522fb036abe0ea558d416625e`. Read StochasticCalculus, StandardDistributions and PDE on main for form and ownership, and resolved every cross-roadmap citation at its proper main/head. The citation resolver reports no unknown cross-roadmap citation or Lean name. Its warning that it did not check pinned Lake packages is not a verification claim: the local pin inspection below supplies that check.

| Citation / possible overlap | File and present resolution |
|---|---|
| StochasticCalculus §1.1 | `TauCetiRoadmap/StochasticCalculus/README.md:879`, especially lines 888–891 on main: arbitrary-index standard-Borel extension and product-law uniqueness. This is imported, not reconstructed. The Brownian/Chentsov targets do not own arbitrary PSD-kernel realization. |
| StandardDistributions §5.3 | `TauCetiRoadmap/StandardDistributions/README.md:577`, mixed moments at line 605 on main: centered Gaussian Wick–Isserlis, with PSD covariance. This roadmap adds the random-field characterization, not a second finite-vector moment theorem. |
| RelativisticQuantumFieldTheory §7.1 | Open #1772, `TauCetiRoadmap/RelativisticQuantumFieldTheory/README.md:4475`, analytic contract at line 4477: heat-integral kernel, Fourier agreement, exterior bounds, radial massless formula. The repair consumes those facts and owns only the C_c probability-law adapter and lattice scaling limit here. No reverse requirement was found. |
| PDE deferral | `TauCetiRoadmap/PDE/README.md:101`, on main: the stochastic quantization/Gibbs programme belongs to PDE, Part II. No PDE Part II input is needed here. |
| OperatorAlgebraDynamics D9 | `TauCetiRoadmap/OperatorAlgebraDynamics/README.md:3851`, on main: quantum spin algebras, KMS states and thermodynamic limits. This differs from classical real-spin measures and current configurations. |
| Closest open #2111 | `TauCetiRoadmap/MathematicalStatisticsFoundations/README.md:36`, Scope, and §3.3: finite-sample inference and natural exponential-family log-partition theory. No ownership of lattice Gibbs laws, random currents or arbitrary-index Gaussian realization. Its generic exponential-family derivatives are different from the model-specific expectation derivative here. |
| Closest open #417 | `TauCetiRoadmap/PointProcesses/README.md:59`, Scope and boundaries: locally finite random measures, point configurations and Palm theory. Its covariance measures are not the random-field covariance carrier here. It is not used as a supplier. |
| Closest open #950 | `TauCetiRoadmap/OptimalTransport/README.md:16`, Scope and ownership: transport costs/couplings/Wasserstein and entropy theory; its Brownian reference law is not a lattice field or generic covariance process. |
| Closest open #1421 | `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:5`, Scope and ownership: arithmetic probability and ergodic interfaces. No competing lattice/current/field construction. |
| Board package heads | Read the indexed #123 AnalyticNumberTheory, #164 LogicAndDefinabilityInNumberTheory and #345 LawrenceVenkateshMethod copies at their recorded heads. The first's Gibbs references concern arithmetic KMS states; the latter two concern logic/arithmetic geometry. None owns the classical field objects here. The third has a design README, not a package README. |

Object searches used the supplied roadmap grep/show service across main/open heads, the board package index and the pinned libraries: Gibbs/Ising measures, Griffiths–Simon blocks, random currents, Gaussian processes/covariance kernels, Schwinger functions, FKG and reflection positivity. No second owner of this design's remaining lattice or arbitrary-kernel realization objects was found. The existing owners of finite products, weak convergence, Gaussian finite laws, moment determinacy, extension and continuum kernels are imported. The supplied overlaps report has no conflicting edit, dropped cited identifier or open-revision-only identifier. All five closest entries were read. The base keeps 8.1–8.2 as downstream identifiers and does not silently delete their content.

**Dependency check, exact output.**

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 231 roadmaps, 2074 edges, 0 problem(s)
```

Exit status 0; no UPWARD or CYCLE line. No merge-order edit was made. All encoded `target:` edges were also checked for dangling references, and the repaired §4.2 FKG edge is present. The new R01 is a mathematical contract error, not something the dependency gate can detect. No supplier gap is declared or needed for these repairs.

**Pinned declarations opened.** Both library HEADs agree with the design's refreshed baselines and `lake-manifest.json`. The following inventory lists actual source locations opened, not search hits alone. These paths are relative to the named pinned library roots.

| Native declaration(s) | File and line |
|---|---|
| `MeasureTheory.Measure.IsNegInvariant` | `Mathlib/MeasureTheory/Group/Measure.lean:310` |
| `ProbabilityTheory.integrableExpSet` | `Mathlib/Probability/Moments/IntegrableExpMul.lean:112` |
| `MeasureTheory.Measure.pi` | `Mathlib/MeasureTheory/Constructions/Pi.lean:211` |
| `MeasureTheory.Measure.withDensity` | `Mathlib/MeasureTheory/Measure/WithDensity.lean:39` |
| `MeasureTheory.Measure.map` | `Mathlib/MeasureTheory/Measure/Map.lean:96` |
| `MeasureTheory.Measure.infinitePi` | `Mathlib/Probability/ProductMeasure.lean:354` |
| `MeasureTheory.IsProjectiveMeasureFamily`, `IsProjectiveLimit`, `IsProjectiveLimit.unique` | `Mathlib/MeasureTheory/Constructions/Projective.lean:45`, :115, :150 |
| `ProbabilityTheory.map_eq_iff_forall_finset_map_restrict_eq` | `Mathlib/Probability/Process/FiniteDimensionalLaws.lean:61` |
| `ProbabilityTheory.IsGaussianProcess` | `Mathlib/Probability/Distributions/Gaussian/IsGaussianProcess/Def.lean:30` |
| `ProbabilityTheory.HasGaussianLaw` | `Mathlib/Probability/Distributions/Gaussian/HasGaussianLaw/Def.lean:33` |
| `ProbabilityTheory.IsGaussian` | `Mathlib/Probability/Distributions/Gaussian/Basic.lean:45` |
| `ProbabilityTheory.multivariateGaussian`, `charFun_multivariateGaussian`, `measurePreserving_restrict₂_multivariateGaussian` | `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166`, :233, :241 |
| `ProbabilityTheory.BrownianReal.projectiveFamily` | `Mathlib/Probability/BrownianMotion/GaussianProjectiveFamily.lean:81` |
| `MeasureTheory.Measure.ext_of_charFun` | `Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean:257` |
| `MeasureTheory.ProbabilityMeasure.tendsto_iff_tendsto_charFun` | `Mathlib/MeasureTheory/Measure/LevyConvergence.lean:214` |
| `ProbabilityTheory.tendstoInDistribution_iff_tendstoInDistribution_inner` | `Mathlib/Probability/CramerWold.lean:39` |
| `MeasureTheory.ProbabilityMeasure`, `ProbabilityMeasure.tendsto_iff_forall_integral_tendsto` | `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean:103`, :367 |
| `isCompact_closure_of_isTightMeasureSet` | `Mathlib/MeasureTheory/Measure/Prokhorov.lean:530` |
| `fkg` | `Mathlib/Combinatorics/SetFamily/FourFunctions.lean:370` |
| `CompactlySupportedContinuousMap` | `Mathlib/Topology/ContinuousMap/CompactlySupported.lean:41` |
| `EuclideanSpace` | `Mathlib/Analysis/InnerProductSpace/PiL2.lean:114` |
| `Real.fourier_eq`, expanded exponential normalization | `Mathlib/Analysis/Fourier/FourierTransform.lean:434`, :437 |
| `ZMod.dft` | `Mathlib/Analysis/Fourier/ZMod.lean:87` |
| `ae_eq_zero_of_integral_contDiff_smul_eq_zero` | `Mathlib/Analysis/Distribution/AEEqOfIntegralContDiff.lean:186` |
| `integral_gaussian`, `Real.Gamma` | `Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean:210`; `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:402` |
| `hasDerivAt_integral_of_dominated_loc_of_deriv_le` | `Mathlib/Analysis/Calculus/ParametricIntegral.lean:569` |
| `ProbabilityTheory.gaussianReal` | `Mathlib/Probability/Distributions/Gaussian/Real.lean:220` |
| `TauCeti.Measure.exists_isProjectiveLimit_of_countable` | `TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:165` |
| `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp` | `TauCeti/Probability/Moments/Determinacy.lean:246` |
| `TauCeti.Probability.centralMoment_id_two_mul_gaussianReal` | `TauCeti/Probability/Distributions/Gaussian/Moments.lean:147` |
| `MeasureTheory.integral_undef` | `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean:204` |

Native-definition limits were checked: `IsNegInvariant` has only μ.neg = μ, no moment hypothesis; projectivity states restriction-pushforward equality, not existence; `IsGaussianProcess` requires Gaussian finite restrictions but not centering; C_c bundles continuity and compact support, not distribution-valued sample paths. `multivariateGaussian` uses a matrix square root and falls back to a Dirac law for non-PSD matrices; the characteristic-function and restriction theorems actually require PSD. `withDensity` takes an extended-nonnegative density; `Measure.map` has a fallback when a.e. measurability fails. The roadmap's finite-dimensional polynomial maps and product coordinate maps are measurable. `infinitePi` requires probability marginals for the intended product law.

The extension theorem requires countable indices and standard-Borel coordinates; Layer 4 has both. The arbitrary-index supplier is used in Layer 6. Determinacy needs a positive exponential moment for each finite real measure; this is assumed in §4.2 and derived in §6.4. The finite FKG theorem requires a finite distributive lattice, nonnegative functions and log-supermodular weights; shifting bounded functions and approximation are extra work explicitly owned here. The differentiation theorem requires a local integrable derivative bound and measurability, provided by admissibility in §1.3. `integral_gaussian` itself has junk values when its real parameter is nonpositive, so it is not used to assert probability normalization there. The Brownian family documentation at line 24 explicitly distinguishes its projective family from an unimplemented general extension theorem.

**Headlines, Lean and the port-review checklist.** The owned headlines in the Summary are:

- finite-volume Gibbs existence, moments, symmetries, parameter continuity and Gaussian covariance (§§1.1–1.5);
- φ⁴ Ising-block approximation and full-class finite-volume transfer (§§2.2–2.3);
- Griffiths/FKG, current switching, Lebowitz/Gaussian/Simon–Lieb, reflection and uniform moment inequalities (Layer 3);
- the free-boundary law and its correlation structure (Layer 4);
- reflection positivity, Gaussian domination, infrared bounds and Ising long-range order (Layer 5);
- prescribed-covariance Gaussian realization and Wick characterization (Layer 6);
- structure of reachable fields and massive/massless GFF reachability (Layer 7).

Marginal triviality is now expressly a Part II headline. This design contains no `Suggested.lean`: there are zero sorried theorems, definitions or examples to probe, zero declaration binders to compare, and no module docstring to audit. **Elaboration: not available (this lane does not elaborate; say so in the report).** No Lean command was run, and no passing elaboration or “sorry only” warning result is claimed. This is not a package acceptance. The import/namespace/docstring, one-tactic padding and mechanical `#check @name` requirements will apply to the actual package file. Native real measures, finite real products, Gaussian laws, C_c and Gaussian-process predicates make the finite-volume and covariance headlines candidates for genuine simple definitions, not reasons to substitute arbitrary predicates or trivial Checks. This review does not certify absent signatures.

Every backticked library identifier in the README was resolved at the pins. The roadmap's code-spanned formulas, such as G_m, are mathematical notation; no unprovided new Lean declaration is advertised as existing. JSON target names are design metadata, not acceptance declarations. The README has the required Summary, ownership, conventions, supplier contracts, build explanation, layers, downstream consumers and references. The source manifest parses with thirteen distinct keys: six certified and seven settled uncertified. No source is absent from it. Apart from R05's venue typo, no new manifest repair was found. No pull-request number, job identifier, absolute machine path, HTML anchor or copied source passage was found in the design. The repository-relative pin file locators are legitimate supplier references.

**Deliverable validation.** JSON and TOML parse; the verdict has five findings and one blocker, matching the numbered report. The report is below the 60,000-character limit, uses repository-relative paths and contains no machine paths. `git diff --check` passes. Only the requested verdict and round-three report are changed in the board; the design, source manifest, content checkout, libraries and merge order remain untouched.

## Not verifiable

- `griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992` and `simon-1974`: full texts remain settled uncertified, with the access reasons already recorded in their manifest entries. Their exact book/primary-proof contents were not certified and were not requested again.
- The exact simultaneous full-GS-class approximation theorem in §2.2 is not stated as such in the readable ADC passages. Those passages invoke continuity; the strengthened explicit construction is work this roadmap now owns. Neither the sample calculations nor this review are a proof of that theorem. Its inaccessible primary foundations are part of the preceding source limitation, not a new supplier gap.
- The exact block-normalized C_c reachability theorem in §7.4 is not literally a theorem in the readable cited passages. Its owned Fourier derivation and supplier compatibility were checked. The rendered Sokal lemma is a different Schwartz-space/subsequence result and was not treated as a substitute proof.
- Lean elaboration, executed one-tactic probes and mechanical binder inspection are unavailable in this design lane, and no acceptance file exists. A future package must meet those checks independently.

The earlier missing-display limitations for the rendered pages listed above are resolved. No unsettled source request was added.

## Source issues

- **Error** in aizenman-duminilcopin-2021 at (5.9), preprint p.24: the source says the infrared constant is 1/(2|J|β) with |J| the coupling row sum; it should be 1/(βJ) for per-bond nearest-neighbour J and the stated symbol; affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at Definition 2.1(1), preprint p.8, and §7.1 sampling weights, p.45: the source says block coefficients may have arbitrary signs while their products later define sampling probabilities; it should require a common sign, chosen nonnegative, for this ferromagnetic transfer; affects a stated result.
- **Misprint** in peled-spinka-2017 at (44)–(45), p.32: the source says the Gibbs weight is exp(−βd|Λ|)W and Z(0)=exp(βd|Λ|)Z_spin; it should use exp(+βd|Λ|)W and Z(0)=exp(−βd|Λ|)Z_spin; affects a stated result.
- **Misprint** in sokal-1982 at (2.24), p.327: the source says to multiply the pair-products over all pairings; it should sum the pair-products over pairings; affects a stated result.
- **Misprint** in sokal-1982 at the infrared display following (2.31), p.328: the source says its equation number is (2.23), already used for the Lebowitz inequality; it should be (2.32) in the displayed sequence; affects nothing.
- **Misprint** in simon-2020-twelve-tales at (5.19), preprint p.36: the source says the edge displacement contains −h_α−h_β, with β not the edge endpoint γ; it should contain the endpoint difference −h_α+h_γ; affects a stated result.
- **Misprint** in simon-2020-twelve-tales at (5.22), preprint p.37: the source says Gaussian domination yields a sum of squared edge pairings; it should square the sum of edge pairings when differentiating the exponential; affects the proof.

For the newly recovered source slips, explicit controls are: PS's aligned spins on a four-cycle at β=1 give W=1 and Gibbs weight exp(4), not exp(−4); Sokal's repeated single-site φ⁴ example gives fourth moment 1/4, sum-of-pairings 0.34270994 and erroneous product 0.00149079. The source issues are not copied into the roadmap's formulas. The equation-number finding R04 is a roadmap locator error, distinct from the source's misnumbered infrared display.
