# Review of SchrodingerOperatorsAndSpectralTypes (design, round 2)

**Verdict:** needs changes

Eight findings: two P1, four P2, two P3; six blocking. This is a design review, not a package elaboration. The design and manifest were not changed.

## Previous findings, checked first

Locations in this table are in `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md`. The repair report's assertions were checked against the actual texts, not treated as instructions. All twelve original findings are discharged; the new findings below concern additional defects, including proof routes surrounding repaired passages.

| Previous finding | Status | Present passage and verification |
|---|---|---|
| F01 | repaired | Lines 542–549: “`W_±(H₂, H₁) := Ω_±(H₂, H₁) P_ac(H₁)`”. The partial-isometry, adjoint and conjugacy statements now concern W. For `diag(1,2)`, V=0, Ω=I but W=0; for M_x, V=0, both are I. Plan 1.9 agrees. R03 below concerns the proof route, not this repair. |
| F02 | repaired | Lines 878–883: “If `X ≠ ∅`” and “for every `k < dim L²(X)`”. Empty X has empty spectrum; N points give min–max values 0 for k<N and +∞ afterward, whereas VariationalMethods' real-valued expression is 0 afterward. The identification now excludes those indices. |
| F03 | repaired | Lines 790–793: “`(−∞, 1/8]`, to `1` on `[7/8, ∞)` and with `\|φ'\| ≤ 2`”. A smoothed ramp has average slope 4/3<2; composition gives gradient ≤4/k. The impossible old thresholds are a negative Check. |
| F04 | repaired | Lines 883–884: “every `λ_k` is finite and `λ_k → ∞`”; lines 891–895 distinguish the finite N-point list from the extended-value tail. The tail is +∞, not a counterexample to extended convergence. |
| F05 | repaired | Lines 462–466: “`Q(B) ⊆ Q(A)` and `q_A(ψ) ≤ q_B(ψ)`”. Neumann ≤ Dirichlet gives 0≤π² at n=1; reversing the domain inclusion fails. Plan 1.6a carries the same order. |
| F06 | repaired | Lines 706–709: “**initial operator**” and “its closure … is the **minimal operator**”. This matches bms02 line 152. The interval initial domain, graph closure H²₀ and maximal H² domain remain distinct. Plan identifiers use initialLaplacian consistently. |
| F07 | repaired by resolution; no edit needed | Lines 340–342 retain “UO-C03's example on `ℓ²(ℝ) ⊕ L²(ℝ)`”. UnboundedOperators #1027, `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:554`, expressly contains that example. Including all coordinate eigenvectors forces B=ℝ, which also retains the continuous summand. The repair report's dispute is correct. |
| F08 | repaired | Lines 919–921 cite “lp80 line 251–256, equations (2.8)–(2.10)” for the transformed equation and separately line 279–290 for the zero Fourier coefficient. Differentiation gives `∂ᵧ²(√y f(log y)) = y^(−3/2)(f''−f/4)`. |
| F09 | repaired by resolution and clarification | Lines 408–409 specify “its nondegenerate `C₀(ℝ)` case”. On main, `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md:727` places that case inside SA-B85; SA-B86 begins at line 753 and concerns essentially bounded symbols. The original request to cite SA-B86 was mistaken. |
| F10 | repaired by resolution; no edit needed | Line 729 retains “its closure has domain `H²₀(0,1)` (UnboundedOperators UO-E05)”. The head of #1027, `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:1029`, explicitly states that graph closure and its zero derivative traces. |
| F11 | repaired | Line 315 uses “`g = 3·1_{{2}}`”; the backslash-brace escape is gone. The computed measure is 9δ₂. |
| F12 | repaired | Lines 815–817 say “bms02 assumes `M` connected” and give the countable component decomposition. Lines 848–849 restrict the hm23 citation to the finite-area surface case and identify the general kernel argument as this roadmap's route. |

## R01 (P1) — Density-bound monotonicity is false for the admitted constants

**Location:** `packages/SchrodingerOperatorsAndSpectralTypes/design/plan.json:518,535–537`, target 1.8a: “m real”; “Constant m implies constant m' for m <= m'.” The definition in `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md:512` also lacks nonnegativity.

**Claim:** Increasing a real density-bound constant preserves `h ≤ m²`.

**Witness:** For H=M_x and x=1_[0,1], h=1 on [0,1]. Take m=−1 and m'=0: −1≤0 and 1≤(−1)², but 1≤0² is false.

**Exact repair:** Keep the definition for arbitrary real m if desired, but state the general monotonicity hypothesis as `m² ≤ (m')²`; derive the ordered corollary under `0 ≤ m ≤ m'`. Put these hypotheses in both plan and README API. State the truncation limit as m→+∞. Add the negative pair above as a Check. For m=1,m'=2 the repaired ordered corollary computes 1≤1≤4; m=−1,m'=0 fails its hypotheses. This preserves the full source estimate, which depends only on m².

## R02 (P1) — The perturbation factorisation uses the opposite resolvent sign

**Location:** `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md:643–645`: “`A + V − μ = (1 + V R_A(μ))(A − μ)`”. The supplier contract at lines 205–206 uses `(z − A)⁻¹`.

**Claim:** The displayed factorisation holds with the supplied resolvent convention.

**Witness:** On ℂ take A=2,V=1,γ=2,a=1,b=0,μ=0. Then d=2>1 and R_A(0)=−1/2. The left side is 3; the displayed right side is 1.

**Exact repair:** Write `A+V−μ = (1−V R_A(μ))(A−μ)`, or explicitly introduce `(A−μ)⁻¹=−R_A(μ)` and use a plus sign with that inverse. The norm bound is unchanged. Add the scalar sign Check to §2.3 and its plan tests. The repaired right side is `(1+1/2)·2=3`. Use SA-E11 to convert the resulting spectral support bound into a form bound, rather than invoking §2.1 with semiboundedness of A+V already assumed. The convention is explicit on main in `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md:43–47,1211–1212`.

## R03 (P2) — The Kato–Rosenblum route omits the norm of the weak limit

**Location:** `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md:552–557`: “strong convergence follows from weak convergence together with `‖W(t)x‖ = ‖x‖`”.

**Claim:** Weak limit points, intertwining and norm preservation of the approximating unitaries justify strong convergence; the cited Kato argument supplies the Cauchy estimate without an additional input.

**Witness:** Set H₁=M_x,H₂=2M_x on L²(ℝ). W(t)=M_(exp(itx)) tends weakly to 0 and preserves norm 1 on 1_[0,1], but its distance from its weak limit stays 1.

**Exact repair:** Replace the unjustified weak-to-strong step by a named norm-retention/Cauchy-estimate subtarget with its precise trace-class hypotheses and proof inputs. One concrete complete route is Kato's: explicitly plan the finite-rank existence/completeness input, derive the uniform estimate (2.11), and pass to trace-class perturbations by trace-norm approximation before using density. Locate the finite-rank input in a legal source and give it an owner; it is not supplied merely by citing kato57. Alternatively, if retaining the proposed Pearson route, make its exact general trace-class intertwining theorem a named target, with rs3 Theorem XI.7 marked uncertified, and remove the claimed elementary implication. In either route, weak-to-strong convergence requires `‖W∞x‖=‖x‖`; the witness has 0≠1 and is excluded by this additional proved conclusion. Do not narrow the Kato–Rosenblum theorem.

The source makes the missing distinction explicit: kato57 line 64–67 assumes the finite-rank theorem before deriving its inequalities; line 123–127 then passes to trace class. Rosenblum57 line 80–95 assumes norm preservation of the **limit**. Neither says constant approximating norms alone suffice. The counterexample diagnoses the inference, not the true trace-class theorem: its V is not trace class.

## R04 (P2) — Bounded potentials do not preserve the smooth eigenbasis description

**Location:** `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md:904–905`: “the same eigenvalue description as 3.8 without the kernel clause”. Section 3.8, lines 877–879, includes a smooth eigenbasis and a list starting at zero.

**Claim:** All the compact Laplacian spectral description except its kernel statement transfers to arbitrary real L∞ potentials.

**Witness:** On the circle with V=1_[0,π), smooth eigenfunctions satisfy f(0)=f'(0)=0 by matching second and third derivatives across the jump, hence vanish. With V=1 the spectrum starts at 1.

**Exact repair:** Replace the cross-reference by the exact conclusions: compact resolvent; discrete real spectrum with finite multiplicities; an orthonormal eigenbasis in H²; the correctly indexed min–max description and finite-dimensional termination; infinitely many finite eigenvalues tending to infinity when X is nonempty and positive-dimensional. Assert smooth eigenfunctions only when V is smooth. Retain the lower bound ess inf V, not a zero starting eigenvalue. Synchronize plan 3.9, which presently promises only compact resolvent. For the step potential H² eigenfunctions remain available without a smoothness claim; for V=1 the circle eigenvalues are 1,2,2,5,5,… .

## R05 (P2) — The general free Laplacian has two owners at the open heads

**Location:** `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md:79–82,984–1005` (ownership paragraph and §4.2); plan targets 4.2a–4.2b. The ownership paragraph says “which QuantumFoundations §8.2 also plans”.

**Claim:** Declaring the construction moved here resolves its ownership.

**Witness:** QuantumFoundations #1771, `TauCetiRoadmap/QuantumFoundations/README.md:891–904`, still defines the same Fourier multiplier on H²(ℝⁿ), proves both cores and absolutely continuous spectrum [0,∞), and does not import this roadmap.

**Exact repair:** Resolve the actual dependency, not only the narrative. The repair confined to this design is to consume QuantumFoundations §8.2 at m=1/2, delete the duplicated construction/core/spectrum targets, and retain only genuinely new comparisons or consequences. Update scope, suppliers, plan prerequisites and the purported downstream relationship accordingly; rerun the gate. QuantumFoundations is earlier in the supplied order (line 211), while this candidate is checked after SobolevMapsBetweenManifolds (line 402). If ownership is instead to remain here, acceptance needs a coordinated change to the other owner and an order supporting that direction; this review does not authorize edits there. At m=1/2 both symbols are exactly 4π²‖ξ‖², both domains are H², and the d=1 Gaussian has the same spectral measure. There is no distinct mathematical object to justify two constructions.

## R06 (P3) — Two sampled locators support narrower assertions

**Location:** `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md:363–365` (§1.3, teschl line 4420–4427 and SA-E06); lines 1030–1031 (§4.4, Theorem 10.2). Corresponding plan locators are 1.3 and 4.4a–4.4b.

**Claim:** Those locators directly support arbitrary reducing-subspace compression and the theorem for every bounded real potential.

**Witness:** Teschl line 4420–4427 defines the three type spectra, not arbitrary compression. SA-E06 states projection/resolvent commutation. Teschl line 9578–9584 requires the bounded part to vanish at infinity; V=1 does not.

**Exact repair:** For §1.3 cite Teschl Lemma 2.24, p.80 (line 3282–3304), and Corollary 4.6, p.116 (line 4944–4946), for reduction, and label compression-PVM identification as the local deduction from SA-C14–SA-C19, the resolvent inverse laws and SA-E44. Do not attribute the restricted resolvent formula to SA-E06. For §4.4 cite Theorem 6.4, p.135, and Theorem 7.8/Lemma 7.9, pp.168–169, for bounded perturbations and core transfer; reserve Theorem 10.2, p.222, for the decaying-potential clause. Preserve the full bounded-potential theorem. Tests: diag(1,2,3) compressed to span(e₁,e₃) has spectrum {1,3}; V=1 has spectrum [1,∞) and is covered by bounded perturbation, not the decaying-potential theorem.

## R07 (P2) — The cusp Weyl sequence allows a zero cutoff

**Location:** `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md:922–925`: “a fixed `ψ ∈ C_c^∞((1, 2))`” followed by division by `‖u_n‖`.

**Claim:** The specified data yield normalized approximate eigenvectors.

**Witness:** The permitted ψ=0 gives u_n=0, norm 0 and residual 0. Its Lean total quotient is 0/0=0, but no term can be normalized to the unit norm required by UO-C02.

**Exact repair:** Require ψ≠0, prove `‖u_n‖²=wn‖ψ‖²₂>0`, and define the normalized vectors explicitly before invoking Weyl's criterion. Add ψ=0 as a negative-control Check. For a nonzero bump and w,n>0, division is legitimate and the residual/norm ratio is at most `2|t|‖ψ'‖/(n‖ψ‖)+‖ψ''‖/(n²‖ψ‖)→0`. Along n=2^j their supports are disjoint, so the normalized sequence is orthonormal and weakly null.

## R08 (P3) — Some definition APIs and Checks remain only in the plan

**Location:** `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md:510–536,915–935,1010–1026` (§§1.8, 3.10, 4.3); compare plan targets 1.8a, 3.10a, 4.3a.

**Claim:** The README carries each definition's API and at least three discriminating Checks.

**Witness:** Plan 4.3a lists closure under sums/scalars and bounded-support inclusion; 3.10a lists cusp truncation. Their README sections omit those API lists. The third §1.8 Check concerns trace-class square roots, not density-bounded vectors.

**Exact repair:** Add the vanishing-at-infinity laws and cusp-truncation law as prose API bullets with hypotheses. Add plan 1.8a's pure-point negative control to the README: for H=0 on ℂ the only density-bounded vector is 0, because membership in H_ac is required, although the Radon–Nikodym derivative of every atomic vector measure is zero. Include R01's corrected monotonicity API. For a cusp of width 1, truncating height 1 to height 2 changes area 1 to 1/2; for vanishing potentials, tails bounded by ε/2 add to a tail bounded by ε. These discriminate the proposed laws and definitions without adding Lean padding.

## Verified sound

The review covered all 44 plan targets, including their hypotheses, prerequisites, API clauses and tests, and all 27 numbered README sections (9+3+10+5). There are 18 definition targets; all 18 have an API and at least three plan tests. The README omissions are R08. Local prerequisite references exist and point backward. No declared supplier gaps exist. The pins in plan.json match lake-manifest.json: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

The previous review's computed rows were used for unchanged, unsampled details. Every repair, every seeded target and the new witnesses were recomputed. Inapplicable algebraic stress cases (DVRs, residue characteristic, nonreduced schemes) were not substituted for the actual analytic boundary cases: zero Hilbert spaces, empty/zero-dimensional manifolds, nonseparable spaces, discontinuous potentials, actual operator/form domains, nonzero normalizers and resolvent/Fourier signs.

The following table records computed values; an “unchanged” entry does not mean that an unrelated proof-route or locator defect was ignored.

| Statement | Instances tried | Values computed on both sides | Result | Change |
|---|---|---|---|---|
| Conventions: Lebesgue orientation | μ=2Leb restricted to [0,1] | density part=2Leb; reversed reference gives 4Leb; singular part=0 | Correct orientation | none |
| Conventions: Fourier and Laplacian signs | Gaussian; ‖x‖²; y^(1/2+it) | F(−ψ'')=4π²ξ²ψ; geometric Δ‖x‖²=−2d vs library +2d; Δy^s=(1/4+t²)y^s | Correct signs except resolvent factorisation below | R02 |
| 1.1 vector-measure laws | diag(1,2), f=(1,i), g=3·1_{2}; f=h=e₁ for A=0 | μ_f=δ₁+δ₂; projected measure δ₁; weighted measure 9δ₂; μ_(f+h)=4δ₀ versus μ_f+μ_h=2δ₀ | Orthogonality and square modulus necessary | none |
| 1.2 all three components | M_x⊕(1/2), vector (1,1); Cantor multiplier | total Leb|[0,1]+δ_(1/2); ac=Leb, pp=δ, sc=0; Cantor model sc=c, ac=pp=0 | Correct; no separability required by local decomposition argument | none |
| 1.2 nonseparable Borel-value distinction | coordinate multiplier on ℓ²(ℝ)⊕L²(ℝ) | pp-projection has blocks (I,0); a Borel projection retaining every coordinate must have B=ℝ and blocks (I,I) | Supplier's counterexample verified | F07 discharged |
| 1.3 compression | diag(1,2,3), U=span(e₁,e₃), U=0, U=H | spectra {1,3}, ∅, {1,2,3}; ambient measure of e₁+e₃ and compressed measure both δ₁+δ₃ | Mathematics correct; locator repaired as R06 | R06 |
| 1.4 definitions and local-mass equivalences | M_x on [0,1]; rational diagonal; their sum; A=2 on ℂ | ac [0,1] / ∅ / [0,1]; pp ∅ / [0,1] / [0,1]; for A=2 atomic mass in every neighborhood is 1, other parts 0 | Overlap allowed; isolated ac point impossible because singleton mass=0 | none |
| 1.4 essential closure, maximal vectors | ℚ, (0,1), [0,1]∪{2}; diag(1,2); zero H | essential closures ∅,[0,1],[0,1]; vector (1,1) gives δ₁+δ₂, (1,0) gives δ₁ and misses δ₂; zero vector controls all zero measures on H=0 | Correct; separability needed only for general maximal-vector existence | none |
| 1.5 interval criterion | two spectral bands; a=b=0; fat Cantor K | bands [0,1]∪[2,3], mass of (1,2)=0; degenerate interval RHS vacuous but {0} not in empty ac spectrum; K^ess⊆K has empty interior | a<b is load-bearing | none |
| 1.6 min–max and counting | diag(1,3,5); M_x on [0,1]; zero H | μ=(1,3,5,+∞,…); at λ=4 rank projection=2=count{μ_n<4}; multiplier μ_n=0; zero H μ_n=+∞ | Extended values correct | none |
| 1.6 form order | diag(1,3)≤diag(2,4); Neumann/Dirichlet interval | μ pairs (1,2),(3,4); Q(D)⊂Q(N), μ₁(N)=0≤π²=μ₁(D); reverse would assert π²≤0 | Domain inclusion repaired | F05 discharged |
| 1.7 waves and chain | equal operators; scalar 0 versus 1; M_x versus M_x+c | Ω=I,D=H; exp(it) has no limit off 0, D=0; exp(itc) likewise; product error bounded by sum of two converging norm errors | Correct unrestricted-wave object | none |
| 1.8 density definition and truncation | x=1_[0,1], m=−1,0,1; x=|λ|^(−1/4)1_[−1,1] | density=1; predicates true,false,true; m=−1≤0 refutes monotonicity; unbounded-density tail beyond m² has squared norm 4/m² for m≥1 | Estimate valid; planned monotonicity false | R01, R08 |
| 1.8 Rosenblum estimate | x=m1_[0,1], unit φ supported there, C=φ⟨φ,·⟩ | time integral=2πm²∫|φ|²=2πm²; RHS=2πm²·1 | Sharp normalization | none |
| 1.8 square root | V=diag((−1)^(n+1)/n²), n≥1 | singular values 1/n²; square root entries 1/n; HS energy=sum 1/n²=π²/6=nuclear gauge | Correct | none |
| 1.9 repaired theorem | V=0 on diag(1,2), on M_x; H₁=diag(1/n²), V=−H₁ | Ω=I but W=0; Ω=W=I; third D=0,W=0, ac parts both 0 | Correct compression, adjoint and domain-aware conjugacy | F01 discharged |
| 1.9 weak-to-strong inference | H₁=M_x,H₂=2M_x,x=1_[0,1] | weak limit 0; ⟨x,W(t)x⟩=(exp(it)−1)/(it)→0; ‖W(t)x‖=1; ‖W(t)x−0‖=1 | Missing norm-retention input | R03 |
| 2.1 bottom | scalar 2, γ=1 or 3; H₀+c; zero H | γ=1: form/spectral/projection conditions all true; γ=3: all false, P((−∞,3))=I; inf spectrum c=Rayleigh inf c; zero H empty spectrum excluded | Correct | none |
| 2.2 bounded perturbation | A=diag(0,1), V=diag(1,−1); V=cI | bottom 0∈[−1,1]; shifted bottom λ₀+c; graph norm comparison factor 1+‖V‖ both directions | Correct | none |
| 2.3 bound/core and resolvent | a=1,b=1/2,γ=0; A=2,V=1,μ=0; V=−H₀ | lower bound −2; erroneous product 1 versus 3, repaired product 3; b=1 example zero on H² not closed | Bound/core true, displayed identity false | R02 |
| 3.1 complex Green identity | circle u=v=exp(inθ), n=1; replace v by iv | both sides 2π; replacing v by iv multiplies both by −i, yielding −2πi; no conjugation gives 0 | Hermitian convention correct | none |
| 3.2 initial versus minimal | interval; countable discrete X | graph closure H²₀ imposes u=u'=0 at endpoints; maximal domain H² contains 1 and e^x; discrete initial operator 0 on finite support, closure 0 on ℓ² | Correct terminology and domains | F06,F10 discharged |
| 3.3 maximal domain | exp(−|x|); χ/|x| in ℝ³; interval constant | Δu=−u+2δ₀; Δ(χ/r)=4πδ₀ plus smooth term; Δ1=0 | First two not in maximal domain, third is | none |
| 3.4 Sobolev/form/Friedrichs | interval 1; Dirichlet/Neumann; u and iu | ‖1‖₂=1, derivative norm 0, violating Dirichlet Poincaré; spectra n²π² starting n=1 versus n=0; a(iu,iu)=a(u,u), a(u,iv)=i a(u,v) | Boundary and conjugation distinctions correct | none |
| 3.5 cutoffs | repaired step; interval; disjoint circles | ramp average 4/3<2; composite gradient ≤4/k; incomplete interval would force 1≤2/k; circle-union cutoff gradient=0 | Complete/disconnected construction works | F03 discharged |
| 3.6 complete-manifold theorem | cutoff energy; interval; ℝ⁴ minus point; discrete X | energy ≤2‖Δu‖‖u‖+64‖u‖²/k²; deficiency solution estimate tends to 0; interval has e^x in ker(Δ_max+1); puncture singularity gives ∫₀¹dr/r=∞; discrete closure is bounded zero | Completeness sufficient, not necessary; component reduction valid | F12 discharged |
| 3.7 spectral vocabulary | circle, ℝ, point, S¹⊔ℝ | λ=(0,1,1,4,4,…); ℝ has λ₁⁺=λ₁=0 and kernel 0; point λ₁⁺=λ₁=+∞; mixed union kernel ℂ⊕0 | Correct; infinite-component count uses Hilbert dimension | none |
| 3.8 compact case | ∅; N points; S²; two circles | ∅ spectrum ∅ and μ₁=+∞; N points λ_k=0 then +∞ but supplier min–max junk 0; S² values 0,2,2,2,6,…; two-circle zero multiplicity 2 | Repaired range and nonemptiness conditions verified | F02,F04 discharged |
| 3.9 bounded potentials | circle V=1; V=1_[0,π) | shifted eigenvalues 1,2,2,5,5,…; step potential Rayleigh(1)=1/2; a smooth eigenfunction must satisfy jump equations f(0)=f'(0)=0 and hence vanish | Self-adjointness/core/lower bound hold; broad spectral transfer fails | R04 |
| 3.10 cusp definition | width w,height a; power y^s; truncated height | area w/a; squared norm proportional to ∫_a^∞y^(2Re(s)−2)dy, finite iff Re(s)<1/2; w=1,a=1→2 gives area 1→1/2 | Correct; add truncation API | R08 |
| 3.10 cusp threshold | ψ≠0; ψ=0; t=0 or 1 | norm²=wn‖ψ‖²; residual/norm ≤2|t|‖ψ'‖/(n‖ψ‖)+‖ψ''‖/(n²‖ψ‖); thresholds 1/4,5/4; ψ=0 gives denominator 0 | Weyl route works only with nonzero cutoff | R07 |
| 4.1 four H² descriptions | Gaussian; interval indicator | Gaussian ‖u‖²=1/√2, ‖u''‖²=3π²/√2, ‖ξ²Fu‖²=3/(16π²√2); indicator u''=δ'_(−1)−δ'_1, ξ²Fu not L² | Four conditions and factor 4π² agree | none |
| 4.1 norm comparisons | Gaussian; general multiplier weight | N²=(1/√2)(1+1/(2π)+3/(16π²)); triangle gives N≤‖u‖+(4π²)⁻¹‖Δu‖; 1≤1+r² and 4π²r²≤4π²(1+r²) give reverse constant 1+4π² | Correct equivalent norms, not claimed equal | none |
| 4.2 free spectrum/core | d=1 Gaussian; d=0; QuantumFoundations m=1/2 | density exp(−λ/(2π))/(2π√λ), mass 1/√2; d=0 spectrum/pp={0}, ac=∅; both roadmap symbols 4π²‖ξ‖² | Mathematics correct; same object already owned | R05 |
| 4.3 local compactness | compact support, decaying V, constant 1, thin spikes | cutoff error ≤‖V−V_R‖∞+‖V‖∞/(1+4π²R²)→0; V=1 resolvent spectrum [0,1] not compact-operator spectrum; thin spikes have tail ess sup 1 despite sum lengths π²/6 | Correct essential-sup decay, both product orders via adjoint | R08 API only |
| 4.4 bounded Schrödinger | constant c; −1_[−1,1]; positive compact bump | spectrum [c,∞); k≈0.739085, κ≈0.673612, E≈−0.453753 from k tan k=κ and k²+κ²=1; positive bump spectrum [0,∞) | Correct; source scope and imported free object need correction | R05,R06 |
| 4.5 trigonometric potentials | conjugate pair; imaginary pair; arbitrary frequencies; Q=0 | V=cos x+cos(√2x), bound 2 and inf −2; imaginary pair 2i cos x; wrong frequencies (exp(ix)+exp(2ix))/2; Q=0 real constant V₀ | Reality, linear frequency law and finite bound correct | none |

Two source-level scalar checks also distinguish typographical errors from adopted conventions. In teschl line 5716, A=0, B=1, λ=1 gives left side 1+i and the printed same-sign resolvent product −1+i; using the opposite resolvent argument gives 1+i. In teschl line 2964–2966, q=0 and γ=0 on ℂ give representing vector 0: the printed subtraction produces A=−I, whereas q_A=q requires A=0. These errors are recorded under Source issues; the latter is not copied into the roadmap’s supplied form representation.

The annulus argument in §1.4 applies directly to atomless ac/sc measures; for the pp version the atom at λ is handled first (one eigenvector already has the required mass), and otherwise disjoint annuli work. No atomlessness was used to reject the pp statement. Orthogonal normalized summands with square-summable nonzero coefficients give a single vector with positive mass in every required interval.

The scalar lower bound in §2.3 itself survives the sign correction: for λ≥γ, `λ−a−b|λ|≥γ−a−b|γ|≥γ−max(a/(1−b),a+b|γ|)`; the resolvent norm estimate is invariant under changing the resolvent's sign. In §3.6 the compact-support integration steps extend from smooth tests by the stated local Sobolev density/regularity inputs. Empty manifolds and zero Hilbert spaces do not invalidate the operator equalities.

**Sources and seeded sample.** All nineteen cited works occur under one manifest key each: seven certified and twelve settled uncertified. No new source was needed or fetched. The cached version, not a guessed published numbering, was used for the arXiv texts. All fifteen sampled targets were checked as follows.

| Sample | Text opened and locator | Assessment |
|---|---|---|
| 1.2 | teschl line 4388–4419, Lemma 3.19, pp.105–106 | Supports the type split in the book's separable setting; the README's arbitrary-H extension uses UO-C03 plus scalar uniqueness and is justified. The Borel-value claim is correctly qualified. |
| 1.3 | teschl line 4420–4427, p.106; additionally line 3282–3304, p.80, and line 4944–4946, p.116 | Original locator is not the arbitrary-compression result: R06. |
| 1.8 | kato57 line 92–111, Lemma 2.1, p.262; rosenblum57 §§3–4 and line 80–95, pp.999–1002 | Estimate and 2π factor verified; countable range basis is justified by Hilbert–Schmidt compactness even for nonseparable H. R01 concerns an added API law. |
| 2.1 | teschl line 5044–5055, Theorem 4.10, p.119 | n=1 gives the Rayleigh formula with the README's nonzero/semibounded hypotheses. |
| 3.1 | pinned real Laplace–Beltrami/Green declarations below; grigoryan09 Ch.4 uncertified | Complexification and either compact-support case checked directly. Unread textbook not certified. |
| 3.3 | bms02 line 151–157, §2.1, p.4; line 179–182, Theorem 2.3, p.5 | Maximal distributional domain and adjoint match; V=0 satisfies the local integrability hypotheses in every dimension. |
| 3.4 | teschl line 2914–2917, Theorem 2.12, p.70; line 2960–2966, Theorem 2.13, pp.71–72 | Abstract Friedrichs/representation statements support the construction; manifold identification is proved locally. Equation (2.60) has the shift issue recorded below; UO-D06 uses the correct graph law. |
| 3.6 | bms02 line 128–129 and 245–256, Corollary 2.10/Remark 2.12, pp.4,7 | Connectedness and D=d specialization verified; explicit component argument supplies disconnected case. Other cited texts remain uncertified. |
| 3.7 | hm23 line 39–47 and 104–105, arXiv v3 pp.2–3 | Finite-area hyperbolic vocabulary only; general kernel result has a separate route. No inference of a general theorem from that narrower introduction. |
| 3.9 | teschl line 5704–5711, Theorem 6.4, p.135 | Bounded perturbation/core consequence supported; no smooth eigenbasis for L∞ coefficients: R04. |
| 3.10 | lp80 line 251–256, (2.8)–(2.10), p.266; line 279–290, p.267; teschl line 6277–6281, Lemma 6.17, p.145 | Transformation and Weyl criterion verified. This roadmap derives the general cusp inclusion rather than importing the survey's whole surface theory. R07 fixes normalization. |
| 4.1 | teschl line 7086–7092, (7.22)–(7.24), p.167; native Sobolev/Fourier declarations below | Multiplier domain supported, with angular-frequency to Mathlib 2π conversion. Weak derivative comparison supplied by PDE §1.3, not claimed to be in those few source lines. |
| 4.3 | teschl line 7213–7228, Lemma 7.11, p.170 | Compactness and Hilbert–Schmidt cutoff proof verified in all d≥1; essential-sup formulation passes to a.e. representatives. |
| 4.4 | teschl line 9578–9589, Theorem 10.2, p.222 | Supports decaying bounded potentials, not every L∞ potential; R06 supplies the precise broader proof citation. |
| 4.5 | kps26 line 20–50, arXiv v3 pp.1–2, (1.1)–(1.6), Theorem 1.1 | Finite frequency sum and its bound checked directly. The high-energy theorem retains d≥2,l>d and its full-measure frequency condition, and is not a target. The OCR omits a conjugation bar; the design's conjugate-symmetry condition is mathematically correct. |

No unverified author locator was silently promoted to verified. The twelve settled uncertified works are listed below. Headline locators 1.4–1.7 and 1.9 were also compared with the previous computed review and the supplied cached texts. The generalization from separable source Hilbert spaces in Layer 1 is supported by the local PVM/measure arguments, not by pretending that the source stated it.

**Pinned declarations and duplication by object.** Direct reading was necessary: the resolver explicitly said its host did not check pinned Lake declarations. The actual supplied library trees were present and read. Selected exact declarations opened, with repository-relative paths at the pins:

| Pinned file | Declarations/meaning checked |
|---|---|
| `Mathlib/Analysis/InnerProductSpace/LinearPMap.lean:163` | `LinearPMap.mem_adjoint_domain_of_exists`; nondense adjoint action at 172; `IsFormalAdjoint.le_adjoint` at 194; `adjoint_isClosed` at 332 requires dense domain. |
| `Mathlib/Topology/Algebra/Module/LinearPMap.lean:66` | `IsClosable`; `closure` at 93 returns f when not closable; existence of closed extension at 132; `HasCore` at 141. Thus genuine closability/density cannot be omitted. |
| `Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean:122` | `singularPart_add_rnDeriv` has singular part plus reference-measure density; `mutuallySingular_singularPart` at 106; uniqueness `eq_singularPart` at 404 and `eq_withDensity_rnDeriv` at 522. |
| `Mathlib/Analysis/Distribution/Sobolev.lean:153` | `TemperedDistribution.MemSobolev` is existence of an Lp Bessel potential; Fourier characterization at 222; `MemSobolev.laplacian` at 348. |
| `Mathlib/Analysis/Distribution/FourierMultiplier.lean:107` | Schwartz multiplier −(2π)²‖ξ‖²; tempered-distribution version at 208. |
| `Mathlib/Analysis/Fourier/LpSpace.lean:51` | `MeasureTheory.Lp.fourierTransformₗᵢ` is a complex linear isometric equivalence on volume L². |
| `Mathlib/Analysis/Normed/Operator/Compact/Basic.lean:271` | `IsCompactOperator.comp_clm`; norm-limit compactness `isCompactOperator_of_tendsto` at 459 with the completeness/separation hypotheses. |
| `Mathlib/Analysis/InnerProductSpace/Laplacian.lean:138` | `InnerProductSpace.instLaplacian` uses the trace of the second derivative, hence the positive div-grad sign. |
| `TauCeti/Analysis/Sobolev/W1p/Basic.lean:372` | `W1p` is the real weak value-gradient submodule over a Haar measure; completeness follows at 376. It is not a complex manifold Sobolev carrier. |
| `TauCeti/Analysis/Sobolev/Wkp/Basic.lean:145` | `Wkp` recursively adjoins weak derivatives, with order zero equal to real Lp. Complexification and manifold chart comparisons remain separate inputs. |
| `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic.lean:51` | `HyperbolicMetric` bundles a smooth metric, completeness for its own distance and curvature −1. These are stronger data than an arbitrary smooth metric or a local cusp chart. |
| `TauCeti/Analysis/InnerProductSpace/ProjValMeasure/Basic.lean:91` | Native `ProjValMeasure` has finite diagonal measures tied to projection matrix elements, identity on the whole space and intersection multiplicativity. `proj_mul_comm` at 200, `norm_sq_proj_apply` at 275, `diag_univ` at 299. |
| `TauCeti/Analysis/InnerProductSpace/ProjValMeasure/Integral.lean:218` | `ProjValMeasure.integral`, the bounded integral; not an unbounded spectral integral or a PVM of an arbitrary self-adjoint partial operator. |
| `TauCeti/Analysis/Normed/Operator/LinearPMap/RelativeBound.lean:56` | `IsRelativelyBounded` includes domain inclusion and ambient coefficient a/relative coefficient b in the stated order. |
| `TauCeti/Analysis/InnerProductSpace/LinearPMap/KatoRellich.lean:118` | `IsSelfAdjoint.add_of_isRelativelyBounded`, complete Hilbert space, self-adjoint A, formally symmetric V, relative bound b<1. SelfAdjoint.lean:105 supplies `IsSelfAdjoint.isFormalAdjoint`. |
| `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82` | `TauCeti.riemannianVolume`; local finiteness at line 179 and open positivity in `VolumeDensity/Support.lean:36`. Smooth Riemannian standing assumptions satisfy these contracts. |
| `TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean` | Real `divergence` and `laplaceBeltrami`; Euclidean comparison at 760 and norm-square sign at 784. |
| `TauCeti/Geometry/Manifold/Riemannian/DivergenceTheorem.lean:312` | `integral_mul_laplaceBeltrami`, C¹ compactly supported first factor and C² second factor; symmetry at 337. Complex Green is the real/imaginary extension. |
| `TauCeti/Analysis/OperatorIdeal/Nuclear/Basic.lean:53` | `nuclearENorm` is the extended sum of singular values; finite nuclear gauge implies compactness at 153. |
| `TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/Basic.lean:89` | `hilbertSchmidtEnergy` is the extended sum of squared column norms; adjoint invariance at 141 and basis independence at 150. |
| `TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/Columns.lean:257` | `ContinuousLinearMap.isCompactOperator_of_hilbertSchmidtEnergy_ne_top`; the local-compactness route's Hilbert–Schmidt-to-compact input is available at the pin. |
| `TauCeti/Analysis/InnerProductSpace/LinearPMap/CompactResolvent.lean:69` | `IsSelfAdjoint.hasCompactResolvent_iff_isCompactOperator_resolvent` requires a nonreal z; the opposite-sign inverse variant at 78 confirms the sign convention. |

Object searches covered PVM diagonal restriction/density, closed forms, spectral types, self-adjoint cores, relative bounds, Fourier multipliers, Laplace–Beltrami operators and Hilbert–Schmidt/trace-class operators. They did not identify pinned versions of this roadmap's general Kato–Rosenblum or complete-manifold theorem. Existing adjoints, PVM carriers, bounded integrals, Sobolev carriers and Kato–Rellich self-adjointness are cited rather than proposed as new carriers. The free-Laplacian duplication is R05. The generic normal-operator Rosenblum theorem in `TauCetiRoadmap/OperatorTheory/SpectralSubspacePerturbation/README.md:257` is a Sylvester intertwining theorem, not §1.8's time-integral estimate.

**Cross-roadmap contracts resolved now.** Main examples read for shape were PDE and SmoothBundlesConnections, with the SelfAdjointSpectralTheory subdivision as a third comparison. No dependence was taken on additions only present in a revision of an existing main roadmap.

| Supplier | Present location and resolution |
|---|---|
| OperatorTheory/SelfAdjointSpectralTheory, main | `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md`: SA-B44–B45 at 420–425; SA-B85 at 676–752; SA-C12–C19 at 818–834; C25–C28 at 852–859; C39 at 888; C44 and C52–C54 at 903–930; C86 at 1001; D02–D22 in Part D; E01–E13 at 1202–1231; E26–E30 in generated-group subsection; E44–E47 at 1316–1331. IDs exist; R02/R06 correct their use. |
| UnboundedOperators #1027, new folder | `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md`: UO-A01/A02/A06/A07 in §§1.1,1.2,1.6,1.7; C01–C03 in §§3.1–3.3 (lines 525,535,552 onward); D06 §4.7 at 702 onward; E01 §5.1; E04 §5.4 at 983 onward; E05 at 1027–1029 and E06 at 1033–1035. General type decomposition and spectral/form/perturbation inputs exist. |
| HilbertModules, main | `TauCetiRoadmap/HilbertModules/README.md:705–760`, H6: closed adjoint, closure-adjoint equality and scalar deficiency decomposition all present on main. The open revision is unnecessary for these inputs. |
| VariationalMethods #1028, new folder | `TauCetiRoadmap/VariationalMethods/README.md:782–806`, §4.4, explicitly has zero junk values outside the dimension range; §§5.1–5.2 give represented operator and eigen-expansion. The repaired comparison uses valid indices. |
| ComplexKahlerGeometry, main | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1440,1513–1523,1651–1670,1948–2045,2092–2145`: K5a test/distribution carriers, local Sobolev scale, explicit L²_loc→H¹_loc regularization, full elliptic gain, compact H² realization, and componentwise compact transport are present. The smooth-coefficient restriction matters in R04. |
| PseudodifferentialOperators, main | `TauCetiRoadmap/PseudodifferentialOperators/README.md:164,404–415`, P1.0 gives differential operators, density transpose and formal adjoint. |
| SmoothBundlesConnections, main | `TauCetiRoadmap/SmoothBundlesConnections/README.md:605–685`, B2.2 gives bundle L², local-finite-measure smooth density and open-positive-measure injectivity. |
| DifferentialGeometry, main | `TauCetiRoadmap/DifferentialGeometry/README.md:2850–2988`, 12.2–12.5: gradient, div-grad sign, volume and Green identities. |
| RiemannianGeometry, main | `TauCetiRoadmap/RiemannianGeometry/README.md:3708–3719`, R7.8 item 8: connected-manifold Lipschitz smoothing with gradient ≤Lip(f)+ε. The componentwise cutoff route respects connectedness. |
| HopfRinow, completed main | `Completed/HopfRinow/README.md:51–61`: connectedness is explicit; (b) compactness of closed bounded sets is equivalent to completeness. Applied per component. |
| PDE, main | `TauCetiRoadmap/PDE/README.md:720–795,2309–2361`, A2 compact-support Sobolev approximation, A3 real weak/Bessel comparison with equivalent norms, F26 heat-generator domain and core. Real/imaginary parts supply the complex comparison. |
| OperatorIdeals, main | `TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md:349–378`, OI-B29–B41 nuclear and HS gauges. The compactness corollary used here is also pinned in Columns.lean:257. |
| FuchsianOrbifolds, main | `TauCetiRoadmap/FuchsianOrbifolds/README.md:563–589`, Layer 3 gives positive-width cusp data, horodiscs and q-coordinates; used only in the cusp examples. |

The board package index was read before any absence conclusion. Searches used the available board packages and `roadmaps grep` over the open heads and main. The closest heads from `scratch/overlaps.md` were examined: UnboundedOperators, SelfAdjointSpectralTheory (its revision not used as a supplier), CongruenceSpectralGap, VariationalMethods and QuantumFoundations. CongruenceSpectralGap #1504, `TauCetiRoadmap/CongruenceSpectralGap/README.md:170–184`, constructs the specific congruence orbifold operator and its cover comparison; this does not supply a theorem on every complete Riemannian manifold. VariationalMethods owns compact form pairs, not the essential-spectrum min–max theorem. UnboundedOperators owns the general type decomposition, which the measure identification here consumes. QuantumFoundations shares the exact general free object: R05. The supplied overlap facts report no dropped cited IDs, revision-only IDs, competing head changing this roadmap, or reverse dropped-ID requirement. Running `roadmaps overlaps` by this unported design's name returned that it is not on main or an open roadmap pull request; the supplied head-based overlap file was therefore used for those facts.

**Supplier order.** The requested gate was run against the candidate, current order and supplied content. Exact output:

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after SobolevMapsBetweenManifolds (the intake inserts it when its design is accepted)
note: supplier UnboundedOperators of SchrodingerOperatorsAndSpectralTypes is not in the merge order; it must be inserted before SchrodingerOperatorsAndSpectralTypes
note: supplier VariationalMethods of SchrodingerOperatorsAndSpectralTypes is not in the merge order; it must be inserted before SchrodingerOperatorsAndSpectralTypes
depcheck: 233 roadmaps, 2098 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The two insertion notes are not findings. All Needs lines and supplier contracts were read; Checks referring to later layers were not treated as proof prerequisites. The Kato/Pearson proof input is the unresolved ownership/route issue in R03, not a declared supplier gap. The resolver found no cross-roadmap citation or name nowhere, but that does not verify the mathematical scope of an existing ID.

**Principles, shape and acceptance-test audit.** No route-specific arithmetic restriction, computational algorithm, copied source passage, sorry'd data or set_option was found. This is a new general scalar noncompact/spectral-type roadmap; it does not replace an existing roadmap wholesale. The explicit free-Laplacian overlap needs the ownership correction in R05. Headings, layer Examples/Dependencies, hypotheses and source keys are present. The omissions from definition APIs/Checks are R08, not a plan test-count failure. No machine paths, pull-request numbers, dates or hand-off instructions were found in the roadmap text. Sources were treated as data throughout.

Headline inventory from the summary: type-projection/Lebesgue identification (§1.2); spectral-type/local-mass and interval criteria (§§1.4–1.5); min–max (§1.6); wave operators/Kato–Rosenblum (§§1.7–1.9); perturbation lower bounds/cores (§§2.2–2.3); complete-manifold essential self-adjointness and domain/form comparison (§3.6); compact and bounded-potential spectral consequences (§§3.8–3.9); cusp threshold (§3.10); the H²/free-Laplacian/bounded-potential chain (§§4.1–4.4). The quasi-periodic high-energy and random-cover theorems are explicitly examples, not promised headlines.

There is no Suggested.lean in this design. Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run. Padding probes, import/header checks, #check binder comparisons and matching of own backticked names to a Lean file therefore have no present declarations to test, rather than being reported as passed builds. At package stage, native LinearPMap, Lp, Fourier and differential operators make concrete lower-bound/core and Euclidean statements possible with real simple definitions. Native real PVMs also permit measure-side headlines on a supplied PVM; absence of the canonical P_A construction alone does not justify omitting every measure-side headline. Any unavailable spectral/form/geometric carrier must be identified theorem by theorem in the future module docstring, without stand-ins. No missing Suggested.lean finding is raised at this design stage.

## Not verifiable

- Elaboration and one-tactic probes: not available in this lane; no acceptance-test file exists in the design. No claim that sorry is the only compiler warning is made.
- Twelve manifest entries remain settled uncertified, cited only by their existing locators: strichartz83 Theorem 2.4/§2; chernoff73 Theorem 2.2/§3; kato76 Ch.V §4.1 and Ch.X §4.4; cfks87 Ch.1; gaffney54 pp.140–145; rs1 §VII.2; rs2 Ch.IX, §X.1–X.2 and Theorem X.12; rs3 §XI.3 and Theorems XI.7–XI.8; grigoryan09 Ch.3–4,11; chavel84 Ch.I; iwaniec02 Ch.4,7,11; lp76 Ch.1,8. They were not requested again. In particular Pearson's detailed proof was not read; R03 is based on the visible logical gap and the readable Kato/Rosenblum proofs.
- Published-version pagination/numbering for the three arXiv texts was not separately certified. The explicitly recorded versions were read. The kps26 extraction loses conjugation bars; reality was checked from the design's finite sum and the source's real-potential premise, not by interpreting the lost OCR bar as a source error.
- Ownership searches covered main, the accessible board packages and the indexed open heads. Full mathematical ownership review of every one of the 434 open pull requests was not performed; the closest heads and direct object matches were opened. No unprovided checkout was sought independently.

## Source issues

- **Misprint** in teschl at Theorem 6.4, (6.3), printed page 135: the source says the maximum uses b/(a−1) in its relative-coefficient-first notation; it should be b/(1−a) for the displayed resolvent-derived bound; affects a stated result.
- **Misprint** in teschl at Theorem 6.4, proof factorisation, printed page 135: the source says I+B R_A(±iλ) multiplies A±iλ with R_A(z)=(A−z)⁻¹; it should be I+B R_A(∓iλ) for that factor; affects the proof.
- **Misprint** in teschl at Theorem 2.13, (2.60), printed page 72: the source says subtract (1−γ)ψ from the representing vector for the unshifted sesquilinear form s; it should be the representing vector itself, or use the shifted form before subtracting; affects a stated result.
