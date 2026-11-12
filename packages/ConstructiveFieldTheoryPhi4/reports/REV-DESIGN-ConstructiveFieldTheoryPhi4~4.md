<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13733#issuecomment-6796597234 -->
Review (codex) of eb93042

Verdict: needs_changes

1. **F01** (P2) Restrict the claimed Griffiths–Simon nonmembers to the actual parameter range

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:252`, repeated at line 271, and `packages/ConstructiveFieldTheoryPhi4/design/plan.json:564`: “with ε < 1/3 is even and admissible but is not in the class”. Line 271 also excludes the mixed-sign block measures of §2.1 without retaining their coupling restriction.

   **Claim.** The sparse symmetric measure is outside the class for every probability parameter ε<1/3, and mixed-sign block weights by themselves exclude membership.

   **Witness.** At ε=0 the measure is δ₀: its second and fourth moments are both 0, and its exponential α-moment is 1. README line 241 correctly puts δ₀ in the class by a constant block sequence.

   **Additional witness.** In §2.1 take q=(1,−1), K=0. The probabilities at −2,0,2 are 1/4,1/2,1/4, exactly the nonnegative block q=(1,1), K=0. Mixed-sign representation therefore does not imply nonmembership.

   **Exact repair.** Require **0<ε<1/3** in the sparse-law Check, Examples and plan. In the Examples sentence restrict the mixed-sign example to the specific q=(1,−1) law with **K>(log 2)/2**, as in the preceding Check, instead of excluding all such representations. Add ε=0 and K=0 as positive boundary controls.

   **Repair test.** At ε=1/4 the corrected exclusion is witnessed by 1/4>3/16. At ε=0 the measure is included and 0=0. At K=0 the signed and nonnegative blocks have identical laws; at K=(log 3)/2 the signed block has ε=1/4 and fourth moment 4>3, so the restricted exclusion remains valid. At ε=1/3 the fourth-moment test gives equality 1/3=1/3 and supplies no exclusion; make no membership claim from that test alone.

2. **F02** (P2) Add measurability to the dominated-integrability API

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:92`: “hence every polynomial and every function bounded by `C e^{cφ²}`”.

   **Claim.** An absolute exponential bound alone makes an arbitrary real function integrable under an admissible measure. No standing convention restricts all such functions to measurable ones; §1.3 explicitly supplies measurability for its own F.

   **Witness.** Let ρ be uniform on [0,1] and A a non-Lebesgue-measurable Vitali subset of [0,1]. The function 1_A satisfies |1_A|≤1, but is not ρ-a.e. measurable and therefore is not integrable. Bounded support makes ρ admissible.

   **Pinned evidence.** `Mathlib/MeasureTheory/Function/L1Space/Integrable.lean:58` defines integrability as a.e. strong measurability together with finite norm integral. `MeasureTheory.Integrable.mono'` at line 104 separately requires a.e. strong measurability; domination does not provide it.

   **Exact repair.** State that every **ρ-a.e. measurable real function F satisfying |F(φ)|≤C exp(cφ²) ρ-a.e., for some C≥0 and c∈ℝ**, is integrable. Retain the unrestricted polynomial consequence, since polynomials are continuous. Add a Check distinguishing a measurable bounded indicator from a nonmeasurable bounded function. The plan currently asserts only polynomial integrability in this API, so it has no contrary unrestricted claim to repair.

   **Repair test.** Under uniform ρ, F=1_[0,1/2] has integral 1/2 and the bound C=1,c=0; the repaired theorem includes it. The Vitali indicator has the same numerical bound 1 but fails the new measurability hypothesis. For a general admissible ρ, the stated bound and the pinned `Integrable.mono'` prove the corrected assertion directly.

3. **F03** (P3) Make the Hamiltonian's pair-counting prose agree with its formula

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:25`: “`H_{V,J}(φ) = −½ Σ_{x≠y} J_{xy} φ_x φ_y`, the sum over unordered pairs”. The warning about “ordered pairs” recurs at README line 155 and `packages/ConstructiveFieldTheoryPhi4/design/plan.json:270`.

   **Claim.** The displayed half-sum is described as unordered, and ordering alone is said to double the coupling. The mathematical formulas elsewhere consistently use the half-sum over ordered pairs.

   **Witness.** On two sites at j=(log 3)/2, half the ordered sum gives correlation tanh j=1/2. Half the unordered sum gives tanh(j/2)=2−√3≈0.267949. The ordered sum without 1/2 gives tanh(2j)=4/5.

   **Exact repair.** Write both equal forms: the Hamiltonian is minus the unordered-pair sum, equivalently minus one half the ordered off-diagonal sum. Change both warnings and the plan Check to say that **omitting the factor 1/2 from the ordered sum** gives the doubled coupling. Keep the actual Hamiltonian formula, current weights and subsequent theorems unchanged.

   **Repair test.** Both equal conventions then give H(1,1)=−j, Z=cosh j=2/√3 and correlation 1/2. The negative control without the half gives H(1,1)=−2j and correlation 4/5. This is classified as a prose/convention defect because the displayed formula and all downstream calculations already agree.

All five findings from round 3 are repaired. This review finds two missing-hypothesis defects (P2) and one convention-wording defect (P3). The design remains repairable; no change of scope or ownership is required. The design and source manifest were left unchanged.

## Previous findings, checked first

Locations in this table are relative to `packages/ConstructiveFieldTheoryPhi4/`. The repair report marks all five actionable and applied; none is re-raised.

| Previous finding | Passage read and result |
|---|---|
| R01: general integration by parts | **Repaired.** `design/README.md:372`: “for every continuously differentiable F” and “the diagonal entry `J_{xx}` enters neither side”. `design/plan.json:912` now uses `sum_{y != x}` and bounds both F and its coordinate derivative. With one site, λ=1, b=0, J_xx=1, F=x, both sides are 1; the discarded formula gives 0.66201088. The new nonintegrable-derivative Check at README line 378 is valid. |
| R02: susceptibility estimate | **Repaired.** `design/README.md:451`: “0 ≤ 2dJ < 1”; `design/plan.json`, target 4.3, separates the estimate from the conclusion for every J>0. At d=1,J=1/4, 1.648721≤2; at J=1, 7.389056≤−1 is explicitly rejected. |
| R03: white-noise volume limit | **Repaired.** `design/README.md:647`: “f ∈ C_c(ℝ^d)” and “V_{R(L)} eventually contains every x ∈ ℤ^d with x/L ∈ supp f”. Plan 7.1 agrees. For the tent centered at 3, R=L gives 0; R=4L gives (2L²+1)/(3L(2L+1))→1/3. |
| R04: Griffiths locator | **Repaired.** `design/README.md:281`: “Sokal (2.19)–(2.20), p. 327”; the plan locator agrees. Rendered p.327 at `sokal-1982 line 414` shows exactly those two inequalities; (2.21) is the monomial notation. The manifest now includes (2.18)–(2.30). |
| R05: malformed publication pages | **Repaired.** `sources.toml:9`: “Annals of Mathematics 194 (2021), no. 1”. The reversed page interval is gone; DOI, arXiv v4 and source identity are preserved. No unsupported replacement page interval was added. |

The changed statements and new Checks were recomputed, and their patterns were searched throughout both design files: off-diagonal sums, derivative-growth assumptions, positive denominators, volume exhaustion, and equation ranges. The new R02 below is a separate measurability omission in the earlier integrability API; it does not undo the repaired C¹ integration-by-parts theorem.

## Verified sound

**Coverage.** Read all 751 README lines, the statements, hypotheses, APIs, prerequisites and Checks of all 36 owned plan entries, both downstream goals, the 13-entry source manifest, the previous review and repair report, the package index and overlap report. The plan has eight owned layers and 125 Checks, at least three per owned entry. The README has 34 owned numbered subsections/Needs lines, eight Examples sections and eight Dependencies sections. No dangling `target:` prerequisite was found. There are no declared supplier gaps and no maintainer notes to adjudicate.

The numerical rows of the previous review were reused only for unchanged assertions with computed evidence. All changed passages and all fifteen targets in this round's sample were reviewed again. In particular the prior positive-parameter sparse-law row did not cover ε=0; the new endpoint test is R01. The prior integrability rows covered measurable functions only; they did not justify the unrestricted prose in R02.

**Principles and organization.** The scope builds general finite scalar-spin systems, arbitrary signed symmetric couplings for existence, ferromagnetic systems for the inequalities, arbitrary-index covariance processes, and the stated massive/massless Gaussian scaling limits. No shortcut selecting convenient parameters, computational algorithm, copied source passage, re-planning of an existing ConstructiveFieldTheoryPhi4 roadmap, or reverse supply edge was found. The corrected nonnegative-weight convention has a mathematical counterexample for mixed signs and is not a convenience restriction. Part II owns both marginal-triviality statements and their proofs, including the additional infinite-volume/current estimates; the base ends at Layer 7.

The dependency order is mathematical: single-site measures → finite-volume laws → block approximation → inequalities → thermodynamic limits; torus analysis branches from Layers 0–1; random-field probability is independent; reachability combines the needed branches. No source-chapter heading or claim to follow a source's arrangement occurs. ADC's continuum-first exposition and later GS transfer are not the roadmap's order. Main's StochasticCalculus, StandardDistributions and PDE were read for house shape and ownership. Apart from the findings, the design has the requested headings, prose APIs, Checks, dependencies and locators. No job id, pull-request number, machine path, HTML anchor, Lean option or sorry'd data appears in the design. Mathematical code spans are notation, not advertised missing Lean declarations.

**Adversarial table.** Put j=(log 3)/2. Finite Ising values were recomputed by summing the 2^N configurations; Gamma and elementary values were independently evaluated. Extended integrals are distinguished from Lean's real-integral fallback. This compact table covers the sample, all headline families and every finding; unchanged rows not displayed retain the previous review's explicit computed evidence, rather than its blanket assertions.

| Statement | Instances tried | Computed values on the two sides / discriminator | Result and change |
|---|---|---|---|
| Conventions, §1.1 pair counting | Two Ising sites, j; ordered, half-unordered, doubled | H(1,1)=−j,−j/2,−2j; correlations 1/2,2−√3,4/5; intended Z=2/√3 | Formula sound; prose R03. |
| §0.1 admissibility/evenness | δ₂; standard normal; empty product; superquadratic-tail density | ∫exp(cφ²)dδ₂=exp(4c), mean 2; normal moment at c=1/2 is ∞; empty product=1; c x²−x²log(1+x²)→−∞ but x^α−x²log(1+x²)→+∞ for α>2 | Admissibility, evenness and stronger growth are distinct. |
| §0.1 dominated functions | Uniform [0,1], ordinary and Vitali indicators | Both bounded by 1; first integral=1/2, second a.e.-measurability=false and Integrable=false | R02; boundedness cannot imply measurability. |
| §0.1 closures | δ₁ scaled by 2; quadratic tilt of δ₂; independent pair | Scaled exponential moment exp(4c); tilt denominator exp(4a+2h)>0, normalized mass 1; product exp(8c)=exp(4c)² | Scaling, tilt and finite product formulas agree. |
| §0.2 measures/scaling/moments | λ=1,b=0; λ=1,b=2,s=2; γ_−1/2 | Second/fourth moments 0.33798912,1/4; scaled parameters (1/16,1/2), maxima ±2; Gaussian variance 1 | Sign, normalization, Jacobian and Gaussian exclusion checked. |
| §§1.1–1.4 existence, symmetries, derivative, continuity | Empty V; normal pair J=1; unequal Ising bonds 0,j; escaping mass | Z=1 versus ∞; edge correlations 0 versus 1/2; derivative at j=3/4=1−(1/2)², diagonal derivative 0; escaping Z≥exp(k²−2k)/4→∞ versus Z(δ₀)=1 | Stability, automorphism and uniform-tail hypotheses discriminate. |
| §1.5 Gaussian lattice field | b=−1, J=1,−1,2,−3; d=1,μ=1 | Precision eigenvalues (1,3),(3,1),(0,4),(5,−1); stable diagonal 2/3 and off-diagonal ±1/3; G₁(0)=1/√5 | Both coupling signs and singular boundary checked. |
| §§2.1–2.2 membership/nonmembership | Sparse ε=0,1/4,1/3; mixed q=(1,−1),K=0,j | M₄ and 3M₂²: 0=0,1/4>3/16,1/3=1/3; K=0 probabilities (1/4,1/2,1/4), same as q=(1,1); K=j gives 4>3 | R01; fix both exclusion ranges. |
| §2.2 class/transfer | δ₀; Gaussian; shrinking independent blocks | Growth moment 1 versus ∞ for α>2; shrinking-block variance 1/log²N→0 while exponential moment ≥2^(1−N)exp(N^(α/2)/log^αN)→∞ | Growth is on limit; transfer must choose good approximants. |
| §2.2 finite-system transfer control | Constant scaled Ising blocks s=0,1, two sites | Second moment s²; pair moment s²tanh(Js²), giving 0 or 1/2 at J=j; zeroth moment always 1 | Simultaneous-system contract consistent; not a proof for every GS limit. |
| §2.3 φ⁴ approximation | c=(12λ)^−1/4, S/N=φN^−1/4/c | N(g_N−1)(S/N)²/2=bφ²; N(S/N)⁴/12=λφ⁴; g_N>0 when N>4b²c⁴ for b<0 | Critical scaling and quartic sign correct. |
| §3.1 Griffiths/Ginibre | Ising ±j; biased one-site law; m=n=2 | Pair moments ±1/2; pair-product covariance 3/4; biased mean −1/3; (x+y)²(x−y)²=0 for independent signs | Both sign hypotheses and duplication parity checked. |
| §3.2 monotonicity | Chain with bonds j,j; uncoupled endpoints; biased spin | Endpoint moment 1/4≥0; biased mean −1/3 becomes −9/19 at j | Coupling/volume directions right; evenness needed. |
| §3.3 FKG | Two Bernoulli {0,1} sites, J=log3; independent signs; opposite monotonicity | Covariance (3−1)/(3+3)²=1/18; independence gives 0; σ_x and −σ_y at j give −1/2 | Non-even scalar extension is substantive; monotonicity needed. |
| §3.4 current weights/switching | One edge j; A=B={x,y}; J=0; singleton source | Z_∅=2/√3, Z_xy=1/√3; switching 1/3=4/3−1; at J=0 nonempty normalizer=0, empty=1; singleton=0 | Factorials, parity and probability domains correct. |
| §3.5 Gaussian/Lebowitz/Simon–Lieb | φ⁴ λ=1,b=0; sparse ε=1/4; Ising chain j; n=0; repeated x,x,y,y | 1/4≤0.34270994; sparse 1/4>3/16; chain 1/4≤j/2=0.274653; empty pairing 1=1; repeats 1≤3/2 | Class restriction, region factor and empty/repeated cases correct. |
| §3.6 reflection | Four-site chain j; only crossing bonds | 1/2≥1/4 and 1≥1/8; wrong dominance gives 0<1/2 | Reflection coupling condition essential. |
| §3.7 repaired IBP | One site λ=1,b=0,J_xx=1,F=x | E F′=1=4Eφ⁴; including diagonal instead gives 0.66201088 | Previous R01 repaired. |
| §3.7 derivative domain and moment bound | F=x+sin(exp(x⁴)); same one-site law | RHS=4(1/4)+0=1; absolute derivative integral contains ∫₁∞|cos t|/t=∞; second moment 0.33798912≤M=1/2 | New derivative-growth control valid. |
| §3.7 Newman | Ising a=2; sparse ε=1/4 | cosh2=3.762196≤exp2=7.389056; sparse 1.690549>exp(1/2)=1.648721 | Tail bound excludes the intended nonmember. |
| §§4.1–4.2 free state | Chain j, distance 2; δ₀ degrees 0,2; one independent coordinate | Correlation 1/4 for both exhaustions; δ₀ values 1,0; chain transition P(same)=3/4; FKG one-site 1≥0, different sites 0≥0 | Limit, symmetry and inherited FKG interfaces consistent. |
| §4.3 repaired susceptibility | d=1,J=1/4,1/2,1; zero model | χ=1.648721,2.718282,7.389056; bounds 2,zero denominator,−1; zero model χ=0,β_c=∞ | Estimate used only in 2dJ<1; threshold consequence separately correct. |
| §4.4 axis bounds | d=1 chain j; d=2 small t | S(0),S(1),S(2)=1,1/2,1/4; leading terms t,2t²,t² for (1,0),(1,1),(2,0) | Both norm-bound directions agree. |
| §5.1 torus and Fourier | d=1,L=1,j; L=2,j; φ=(1,−1) | Small-torus correlation 4/5, Ŝ(0)=9/5,Ŝ(π)=1/5; four-cycle neighbor 10/17 versus chain 1/2; Parseval 8=(1/2)·4·4 | Doubled small-torus bond and Fourier normalization correct. |
| §§5.2–5.3 positivity/domination | Product Ising vertex reflection f=φ₀; pinned Gaussian J=1; Ising small torus | Vertex form 1 versus unconditional square 0; pinned Z(u)=√π at u=0,1; unpinned ∞; Z″(0)=−4+28e^−4=−3.487162 | Conditional form and zero-mode repair retained. |
| §5.4 infrared/sum rule | d=1,L=1,J=3/8; Gaussian gap→0 | EŜ=1.459404≤8/3, but >2/3; Gaussian EŜ→1/J; ((1+t)+(1−t))/2=1 | Correct roadmap constant, incorrect ADC constant distinguished. |
| §5.5 long-range order | d=3,J=1; d=1,2 | Lower bound 1−I₃≈0.7473; ∫₀¹r^(d−3)dr is finite for d≥3 and divergent for d≤2 | Volume factor and dimension threshold agree. |
| §6.1 random fields | Linear integral functional with ∫f=1; absolute-value model | T_f=1,T_−f=−1; wrong model 1,1; zero field 0,0 | Per-relation a.s. linearity defines the intended coordinate-law object. |
| §6.2 Schwinger kernels | h=e^−x² at x=−y=r; h=1; white noise | Kernel e^−2r² equals decay bound; constant 1 fails decay; white-noise cross moment 0 on disjoint supports, ∫f²>0 on equal tests | Null-set convention, centering distinction and function-kernel restriction checked. |
| §6.3 covariance realization | K=[[1,r],[r,1]],r=1,2; zero kernel; bilinear relation h=af+bg | Variance of X₁−X₂ is 0 or −2; zero kernel gives 0; Var(X_h−aX_f−bX_g)=C(0,0)=0 | Singular PSD allowed; non-PSD excluded; linearity is per relation as in §6.1. |
| §6.4 Wick iff | Centered normal variance 1; fair sign; shifted normal mean 1; n=0 | Fourth moments 3 and 1 versus Wick RHS 3; shifted first moment 1 versus 0; M₀=1; cosh series exp(a²v/2) | Both directions, centering and moment determinacy checked. |
| §7.1 repaired white-noise Check | Tent centered 3; L=1,2,5,50; R=L or 4L | R=L variance 0; R=4L squared sums 1,1.5,3.4,33.34; normalized 1/3,.3,.30909,.330099→1/3 | Support inclusion repair works. |
| §§7.1–7.2 normalization/reachability | N independent Ising, Gaussian(v), zero, Cauchy spins; quarter-turn | Block second moments N,Nv,0,∞; normalized block values 1,1,0,undefined; quarter-turn corrected 0=0 versus wrong 1 | Infinite moments excluded; zero normalization and action convention correct. |
| §7.2 examples | Volume-first independent Ising; telegraph c=1 | White-noise covariance 2^−d∫fg; zero class only 0; telegraph covariance e^−|u−v|, κ=2+2e^−2>0 | Order of limits and non-Gaussian low-dimensional control consistent. |
| §7.3 limit structure | Biased Bernoulli; rare spikes p=N^−2,a²=1/p | Biased limit mean 2^−d∫f, variance 0; spike probability O(1/N), prelimit variance 2^−d∫f² versus limit 2^−d−1∫f² | Symmetry requires evenness; second-moment inequality can be strict. |
| §7.4 GFF/covariance order | d=1,m=1,2; f=1_Q,g=−f; d=4,m=0 | C₁=1.13533528,C₂=.37728945; cross terms reverse order; C_m∼2/m as m↓0; ∫_{ball ε}G₀=ε²/4 in d=4 | Positive normalization, quadratic-form order and dimensional restrictions checked. |
| §7.4 lattice scaling | b_n=−d−m²/(2L²),J=1 | Precision E(p)+m²/L²; L²E(q/L)→|q|²; p=2πξ/L gives 4π²|ξ|²+m² | Lattice/continuum constants agree. |
| Downstream §§8.1–8.2 | Telegraph d=1; GFF d=4; Gaussian single-site | Telegraph S₂=e^−distance/κ→0 but nonconstant bounded field is non-Gaussian; GFF singularity integrable; Gaussian exp(|φ|^α) moment=∞ | Dimension/class controls consistent; targets remain Part II's. |

For the GFF proof route, compact q-regions use Riemann-sum convergence; the low-frequency singularity is bounded by |q|^−2, integrable for d≥3. Outside radius A, the lower bound on L²E(q/L) and Parseval give an O(A^−2) bound times the bounded sampled L² norms. This is sufficient without assuming pointwise decay of Fourier transforms of arbitrary C_c tests. At 1_Q, the same estimate applies and its Fourier transform is nonzero near zero, giving positive denominator. The zero-block claim also survives: the Gibbs density is strictly positive relative to the product law, and a nonempty independent sum with integrable squares has zero second moment only when each identically distributed summand is the constant zero.

**Seeded source verification.** Four readable cached texts were inspected in this round: ADC, Peled–Spinka, Sokal and Simon. Sokal's missing equation images were recovered by rendering the cached PDF, including printed pp.327–328 and 342–343; Peled–Spinka p.35 and ADC p.24 were also rendered. All citations below refer to the versions in the manifest, not an assumed published/preprint numbering equivalence. No additional explicitly unverified locator occurs in the design; the seven settled uncertified works remain settled.

| Sampled target | Exact source location read | Support and qualification |
|---|---|---|
| 0.1 | `aizenman-duminilcopin-2021 line 384`, (2.2), preprint p.9 | Source requires an α>2 exponential moment. Roadmap's weaker admissibility is explicitly its own definition, with a separating density. R02 is in its added API, not in the source. |
| 0.2 | `aizenman-duminilcopin-2021 line 145`, (1.12), p.4; line 222, (1.16)–(1.17), p.5; line 257, (1.20), p.6; `simon-2020-twelve-tales line 1021`, p.25 | Quartic sign, Ising spin support and hard limit agree. The roadmap normalizes the source's a-priori measure to a probability and derives Gamma/scaling formulas; Gaussian b<0 is essential. |
| 2.2 | `aizenman-duminilcopin-2021 line 363`, Definition 2.1, pp.8–9; line 384; lines 1982–1985 and 2019–2022, pp.44–45 | Growth is on the limit. Source's signed coefficients are not safe for the transfer, as the signed-block computation shows. Exact simultaneous full-class transfer is an explicitly owned strengthening of the source's continuity discussion; see limitations below. |
| 3.1 | `peled-spinka-2017 line 334`, Theorem 2.1, p.11; line 515, Theorem 2.3, and line 535, Lemma 2.4, p.13; `sokal-1982 line 414`, (2.19)–(2.20), printed p.327 | PS states Ising positivity and O(1)/O(2) pair correlations; its Lemma 2.4 is not literally the scalar arbitrary-even-law statement. The latter is supplied here by the written parity argument. Sokal confirms the φ⁴ multi-index version and corrected numbers. |
| 3.2 | `peled-spinka-2017 line 519`, derivative and graph comparison, p.13; `sokal-1982 line 400`, printed p.327 | Source gives the covariance derivative and monotone volume route. General even admissible measures follow from the owned §1.3 and §3.1; arbitrary non-even laws are not claimed. |
| 3.3 | `sokal-1982 line 423`, (2.25), printed p.327, rendered | Increasing-function covariance inequality appears in the φ⁴ setting. The roadmap owns its arbitrary-admissible, non-even extension using native finite-lattice FKG and approximation. It is not presented as an already existing measure-on-ℝ^V theorem. |
| 3.4 | `aizenman-duminilcopin-2021 line 421`, Definitions 3.1–3.2 and (3.2)–(3.5), pp.10–11; line 474, Lemma 3.3; lines 500–507, (3.7)–(3.9) | Sources, factorial weights, switching direction and event agree. Source partition function uses counting measure and differs by 2^|V|; roadmap uses probability marginals and adjusts Z correctly. Nonnegative extended F avoids signed summability problems; probability corollary explicitly requires positive normalizer. |
| 3.5 | `sokal-1982 line 419`, (2.23)–(2.24), p.327, rendered; `aizenman-duminilcopin-2021 line 520`, (3.11), p.12; line 1314, Lemma 5.7, and line 1342, footnote 5, p.30; lines 1996–2002, p.45 | Lebowitz sign and finite-region Simon–Lieb improvement are supported. Gaussian pairing sum corrects Sokal's product typo. General finite-graph and GS transfer are the roadmap's stated current/block route, with its hypotheses retained. Inaccessible original Aizenman/FFS texts are not certified. |
| 3.7 | `sokal-1982 line 846`, §3.1, (3.1)–(3.5), printed p.342, rendered; line 862, (3.8), p.343; line 434, (2.27), p.328 | Derivative of density gives the stated off-diagonal sum. Sokal's λ₀/4! convention corresponds to λ₀=24λ, and its quadratic B₀ to −2b. Polynomial derivative growth supplies the boundary/integrability condition. The explicit maximum-site bound is correctly derived here. |
| 5.1 | `aizenman-duminilcopin-2021 line 1058`, (5.5)–(5.8), p.24; `peled-spinka-2017 line 1283`, p.27 | Torus, dual modes and normalized Fourier second moment agree up to the equivalent choice of half-open frequency cell. The roadmap explicitly fixes the L=1 multibond convention. Its gradient-square identity avoids ADC's erroneous Hamiltonian display (5.6). |
| 5.4 | `aizenman-duminilcopin-2021 line 1087`, (5.9), and line 1091, (5.10), p.24; `peled-spinka-2017 line 1686`, (49)–(50), p.34, and line 1741, (52), p.35, rendered | Correct bound is 1/J for the stated E and per-bond coupling; source ADC constant fails the explicit Ising test. Sum rule has 1/volume. Non-even extension uses translation invariance to kill the linear term. |
| 5.5 | `peled-spinka-2017 line 1207`, Theorem 2.13, p.26, and line 1766, (53), p.36 | n=1 gives exactly 1−I_d/J; finite infrared integral requires d≥3. General admissible-spin difference bound follows from §5.4 rather than the source's fixed-length hypothesis. |
| 6.1 | `aizenman-duminilcopin-2021 line 56`, (1.4), p.2; lines 183–187, footnote 2, p.4 | C₀ means continuous compact support here. Coordinate-law realization is deliberately weaker than distribution-valued sample paths; arbitrary-index extension is supplied by StochasticCalculus §1.1. |
| 6.4 | `aizenman-duminilcopin-2021 line 81`, (1.7), p.2 | Pairings and covariance kernel agree. The roadmap makes centering and all moments explicit; converse is supplied by exponential determinacy and finite projections, not by an unstated assertion that all moment sequences determine laws. |
| 7.2 | `aizenman-duminilcopin-2021 line 167`, Definition 1.1, and lines 183–187, p.4 | Volume-first then scale limit, finite collections of C_c tests and subsequences agree. General single-site class, stable-law conditions, finite second moments and zero normalization are explicit extensions owned here. |

**Supplier and ownership audit.** Local content main is `83bb79f59e4ae60a7b6d89bd15c3cbda1204eaf0`. The source/head resolver used main `83bb79f` and the supplied index of 429 open pull requests. It reports no unknown roadmap citation or Lean identifier; its warning that it did not inspect pinned Lake packages was not treated as verification. The pin inspection below was done separately.

| Citation or possible owner | Resolution read this round |
|---|---|
| StochasticCalculus §1.1 | `TauCetiRoadmap/StochasticCalculus/README.md:879`, especially line 888: arbitrary-index standard-Borel product-law existence/uniqueness is present on main. Its Brownian/Chentsov theory does not own arbitrary covariance-kernel realization. |
| StandardDistributions §5.3 | `TauCetiRoadmap/StandardDistributions/README.md:577`, mixed moments at line 605 on main: centered PSD Wick–Isserlis, including integrability. Imported; this design adds the random-field characterization. |
| RelativisticQuantumFieldTheory §7.1 | Open #1772, `TauCetiRoadmap/RelativisticQuantumFieldTheory/README.md:4477`: heat kernel, Fourier multiplier, exterior exponential bounds, and massless radial fundamental solutions are present. The d=1 kernel is exp(−m|x|)/(2m) in both roadmaps. No reverse requirement on this design was found. |
| PDE deferral | `TauCetiRoadmap/PDE/README.md:101`: stochastic quantization with Wick renormalization and its Gibbs measure is assigned to PDE, Part II. No prerequisite from it is consumed here. |
| OperatorAlgebraDynamics D9 | `TauCetiRoadmap/OperatorAlgebraDynamics/README.md:3851` on main: quantum matrix-spin algebras, KMS states and thermodynamic limits. Not ownership of classical scalar Gibbs measures or random currents. |
| RandomMatrices | `TauCetiRoadmap/RandomMatrices/README.md:558`, §2.5: finite-dimensional Gaussian integration by parts/Wick and replacement. These are not the arbitrary-index process or random-field iff here; the common finite Wick input is already imported from StandardDistributions. |
| Open #2111 MathematicalStatisticsFoundations | `TauCetiRoadmap/MathematicalStatisticsFoundations/README.md:36`, Scope: finite-sample inference and natural exponential families. Generic log-partition derivatives do not duplicate the finite-lattice observable theorem with its admissibility proof. |
| Open #417 PointProcesses | `TauCetiRoadmap/PointProcesses/README.md:59`, Scope: locally finite random measures, Palm kernels and point configurations, explicitly excluding infinite-volume Gibbs processes. Not the present C_c-linear field or Gaussian process; not a supplier. |
| Open #950 OptimalTransport | `TauCetiRoadmap/OptimalTransport/README.md:16`, Scope, explicitly read at #950 as well as main: transport, Wasserstein, entropy and Brownian reference laws. No arbitrary-kernel process or scalar lattice ownership. |
| Open #1421 ProbabilisticAndMetricNumberTheory | `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:5`, Scope: arithmetic probability and ergodic interfaces, with generic distribution results imported. No competing lattice-field object. |
| Indexed board packages | Read #123 at 310e834, `packages/AnalyticNumberTheory/README.md:5`; #164 at 8d875d1, `packages/LogicAndDefinabilityInNumberTheory/README.md:5`; #345 at 9ee7ac3, `packages/LawrenceVenkateshMethod/design/README.md:3`. Arithmetic navigation, logic and arithmetic period maps supply no competing construction. |

Object searches used the required `roadmaps grep`/`show` tools across main/open heads for Gaussian processes, covariance kernels, Schwinger functions, Ising/Gibbs measures, currents, Griffiths–Simon and reflection positivity. Library searches covered the same objects, Gaussian mixed moments, product/projective limits and FKG. The graph-parameter reflection positivity in Completed/DenseGraphLimits has a different carrier. No second owner of the retained lattice/current constructions or generic covariance realization was found. The supplied overlap facts list no conflicting edits, dropped cited identifiers or identifiers available only from a revision. The five closest scopes were read; no new overlap finding arose. The existing §8.1–§8.2 identifiers remain present as downstream goals.

**Dependency check, exact output:**

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 229 roadmaps, 2058 edges, 0 problem(s)
```

Exit status 0, no UPWARD or CYCLE. Every Needs line and all three supplier contracts were read; no unowned prerequisite or supplier drift was found. No merge-order change was made.

**Pinned declarations opened.** The README pins agree with both library HEADs and `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. All explicit pinned file locators were opened, not merely name-searched.

| Declarations / object | Pinned file and line |
|---|---|
| `MeasureTheory.Measure.IsNegInvariant`; `ProbabilityTheory.integrableExpSet` | `Mathlib/MeasureTheory/Group/Measure.lean:310`; `Mathlib/Probability/Moments/IntegrableExpMul.lean:112` |
| `Measure.pi`, `Measure.withDensity`, `Measure.map`, `Measure.infinitePi` in their stated namespaces | `Mathlib/MeasureTheory/Constructions/Pi.lean:211`; `Mathlib/MeasureTheory/Measure/WithDensity.lean:39`; `Mathlib/MeasureTheory/Measure/Map.lean:96`; `Mathlib/Probability/ProductMeasure.lean:354` |
| `IsProjectiveMeasureFamily`, `IsProjectiveLimit`, `IsProjectiveLimit.unique` | `Mathlib/MeasureTheory/Constructions/Projective.lean:45`, :115, :150 |
| `ProbabilityTheory.map_eq_iff_forall_finset_map_restrict_eq` | `Mathlib/Probability/Process/FiniteDimensionalLaws.lean:61` |
| `ProbabilityTheory.IsGaussianProcess`, `HasGaussianLaw`, `IsGaussian` | `Mathlib/Probability/Distributions/Gaussian/IsGaussianProcess/Def.lean:30`; `Mathlib/Probability/Distributions/Gaussian/HasGaussianLaw/Def.lean:33`; `Mathlib/Probability/Distributions/Gaussian/Basic.lean:45` |
| `multivariateGaussian`, `charFun_multivariateGaussian`, `measurePreserving_restrict₂_multivariateGaussian` | `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166`, :233, :241 |
| `ProbabilityTheory.BrownianReal.projectiveFamily` and absence of general extension | `Mathlib/Probability/BrownianMotion/GaussianProjectiveFamily.lean:81`, documentation at :24; object search found Tau Ceti's countable theorem, not a native arbitrary-index theorem |
| `MeasureTheory.Measure.ext_of_charFun`; `ProbabilityMeasure.tendsto_iff_tendsto_charFun`; Cramér–Wold | `Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean:257`; `Mathlib/MeasureTheory/Measure/LevyConvergence.lean:214`; `Mathlib/Probability/CramerWold.lean:39` |
| `MeasureTheory.ProbabilityMeasure`, its bounded-continuous test convergence, tightness compactness | `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean:103`, :367; `Mathlib/MeasureTheory/Measure/Prokhorov.lean:530` |
| `fkg` | `Mathlib/Combinatorics/SetFamily/FourFunctions.lean:370` |
| `CompactlySupportedContinuousMap`; `EuclideanSpace` | `Mathlib/Topology/ContinuousMap/CompactlySupported.lean:41`; `Mathlib/Analysis/InnerProductSpace/PiL2.lean:114` |
| `Real.fourier_eq`, expanded 2π normalization; `ZMod.dft` | `Mathlib/Analysis/Fourier/FourierTransform.lean:434`, :437; `Mathlib/Analysis/Fourier/ZMod.lean:87` |
| `ae_eq_zero_of_integral_contDiff_smul_eq_zero` | `Mathlib/Analysis/Distribution/AEEqOfIntegralContDiff.lean:186` |
| `integral_gaussian`; `Real.Gamma`; `ProbabilityTheory.gaussianReal` | `Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean:210`; `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:402`; `Mathlib/Probability/Distributions/Gaussian/Real.lean:220` |
| `hasDerivAt_integral_of_dominated_loc_of_deriv_le` | `Mathlib/Analysis/Calculus/ParametricIntegral.lean:569` |
| `TauCeti.Measure.exists_isProjectiveLimit_of_countable` | `TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:165` |
| `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp` | `TauCeti/Probability/Moments/Determinacy.lean:246` |
| `TauCeti.Probability.centralMoment_id_two_mul_gaussianReal` | `TauCeti/Probability/Distributions/Gaussian/Moments.lean:147` |
| `MeasureTheory.Integrable`, `Integrable.mono'` | `Mathlib/MeasureTheory/Function/L1Space/Integrable.lean:58`, :104; missing measurability gives R02 |
| Existing Gaussian mixed-moment work | `TauCeti/Probability/Distributions/Gaussian/MixedMoments.lean:44`, :135, :162: affine-product integrability and fourth mixed moment. This does not supply the full arbitrary-order Wick characterization stated here. |

Native-definition limits were also checked: negation invariance has no moment hypothesis; projectivity is consistency, not existence; Gaussian-process predicates do not imply centering; C_c bundles continuity/compact support, not distribution-valued paths. Finite Gaussian laws have a Dirac fallback for non-PSD input, so the covariance characteristic-function and restriction theorems require PSD. The countable extension needs standard-Borel coordinates; ℝ^{ℤ^d} meets that domain. Determinacy needs a positive exponential moment. Finite FKG requires a finite distributive lattice, nonnegative functions and log-supermodularity; passing to scalar measures is new work here. `integral_gaussian` at nonpositive real parameters is a junk-value equality, not probability normalization. R02 is exactly the missing native measurability condition exposed by this inspection.

**Headlines and the package checklist.** The Summary's owned headline families are finite-volume Gibbs existence/structure/continuity and Gaussian covariance (§§1.1–1.5); φ⁴ block approximation and GS transfer (Layer 2); Griffiths/FKG, switching, Lebowitz/Gaussian/Simon–Lieb, reflection and uniform moments (Layer 3); the free-boundary law (Layer 4); reflection positivity, domination, infrared bounds and Ising long-range order (Layer 5); covariance realization and Wick characterization (Layer 6); and reachable-field structure/GFF reachability (Layer 7). Marginal triviality belongs to Part II, not this acceptance test.

There is no `Suggested.lean` in this design package. Consequently there are zero sorried theorems for one-tactic probing, zero section binders for mechanical `#check @name`, and no module docstring/import/namespace to inspect. **Elaboration: not available (this lane does not elaborate; say so in the report).** No Lean command ran and no passing elaboration or “sorry only” warning result is claimed. This is a design review, not certification of a future package's missing signatures. Native measures, finite products, C_c and Gaussian-process predicates permit substantial headline statements with simple definitions; the package must state those and justify any genuinely unstatable remainder. It must not replace them with Checks or arbitrary predicates. No backticked identifier in this README advertises an undeclared new Lean name; the local formulas are mathematical notation and JSON names are planning metadata.

The manifest parses with 13 distinct works: six certified entries and seven settled uncertified entries. All cited works are recorded. No new source key, missing-reference request or manifest mutation was necessary. The report and JSON have three findings and two blockers, use repository-relative paths, and fit the comment limit.

## Not verifiable

- `griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992` and `simon-1974`: full texts remain settled uncertified for the access reasons in the manifest. Their exact contents were not guessed or requested again. Available corroborating sources and the owned proof routes were examined as above.
- The exact simultaneous full-GS finite-volume approximation theorem of §2.2 is not stated in the readable ADC passages. Those invoke continuity, whereas this design owns a precise stronger approximation/tail-control result. The finite examples do not prove it; primary-source certification remains limited by the preceding access restrictions.
- The exact block-normalized C_c GFF reachability theorem is the roadmap's Fourier derivation, not a literal theorem certified from the cited Sokal lemma. The covariance scaling and analytic supplier were checked; the inaccessible book does not provide certified additional evidence here.
- Lean elaboration, executed padding probes and mechanical binder inspection are unavailable in this design lane, and no Lean acceptance file exists. These checks remain required at package stage.

## Source issues

These are source errors encountered while checking the design, not additional roadmap findings. Previously reported source issues are repeated here only where this round inspected the relevant text or image.

- **Error** in aizenman-duminilcopin-2021 at Definition 2.1(1), preprint p.8, and §7.1 sampling weights, p.45: the source says arbitrary signed block coefficients support its ferromagnetic transfer; it should require nonnegative coefficients for that transfer; affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at (5.9), preprint p.24: the source says the infrared constant is 1/(2|J|β) with |J| the coupling row sum; it should be 1/(βJ) for per-bond nearest-neighbour J and its displayed symbol; affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at (5.6), preprint p.24: the source says the pair Hamiltonian equals the Laplacian-symbol quadratic sum; it should include the J/2 factor and subtract dJ times the spin-square sum; affects a stated result.
- **Misprint** in peled-spinka-2017 at the Fourier-correlation display after (52), preprint p.35: the source says the Fourier correlation equals the sum of unnormalized squared-mode expectations; it should divide that sum by the torus volume; affects a stated result.
- **Misprint** in sokal-1982 at (2.24), printed p.327: the source says to multiply the pair-products over all pairings; it should sum them over pairings; affects a stated result.
- **Misprint** in sokal-1982 at the infrared display after (2.31), printed p.328: the source says its equation number is (2.23); it should be (2.32) in this sequence; affects nothing.

Explicit controls for the two additional Fourier source issues: a constant Ising configuration on the four-cycle at J=1 has pair energy −4 but Laplacian-mode energy 0. For the four-cycle at j=(log 3)/2, Ŝ(0)=45/17 while E|σ̂(0)|²=180/17; dividing by four restores the identity. The roadmap uses the correct gradient identity and normalized Fourier second moment, so neither source slip was imported.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "eb930422dcb2fc24937924fe6cc0cf700b153647", "job": "REV-DESIGN-ConstructiveFieldTheoryPhi4~4", "model": "gpt-6-astra", "worker": "chris-6"} -->
