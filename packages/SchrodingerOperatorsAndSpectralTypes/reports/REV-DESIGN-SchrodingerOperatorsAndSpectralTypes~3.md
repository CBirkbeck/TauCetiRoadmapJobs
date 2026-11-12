# Review of SchrodingerOperatorsAndSpectralTypes (design, round 3)

**Verdict:** needs changes

Six findings: two P1, two P2 and two P3; four blocking. This is a design review. The README, plan and sources manifest were not changed. No finding from the last repair report was marked not actionable, and no settled finding is re-raised.

## Previous findings, checked first

Locations below refer to `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md`. All eight original defects were repaired; the pass over the changed passages found the additional route issue R06.

| Previous finding | Status | Repaired passage and verification |
|---|---|---|
| R01 | repaired | Lines 538–547: “If `x` is density-bounded with constant `m` and `m² ≤ m'²`”. Plan 1.8a agrees. Density 1 admits m=−1 and 1, excludes 0; ordered monotonicity now requires nonnegative constants. The truncation tail is 4/m². |
| R02 | repaired | Line 731: “`A + V − μ = (1 − V R_A(μ))(A − μ)`”. For A=2,V=1,μ=0 both sides are 3. Lines 732–734 use spectral support to obtain the lower bound without presupposing it. Plan 2.1b/2.3 agree. |
| R03 | repaired | Lines 585–590: “suppose there is a trace-class `C`” with the displayed form identity, followed by the strong-limit target. Pearson is now a named target, plan 1.9a. Its statement matches yafaev04 line 193–194; Kato–Rosenblum follows by applying it in both directions. The old weak-to-strong inference is explicitly rejected. |
| R04 | repaired | Lines 1002–1009: “each in `dom Δ_X = H²(X)`” and “if `V` is moreover smooth”. Plan 3.9 agrees. On the circle V=1 shifts the list to 1,2,2,5,5; the step potential has H² eigenfunctions but no nonzero smooth eigenfunction. R06 concerns the newly written resolvent proof, not these corrected conclusions. |
| R05 | repaired | Lines 80–84: “Layer 4 uses it at `m = 1/2` … and adds only its form domain and essential spectrum”. Plan 4.2 replaces the two construction targets; QuantumFoundations is a supplier, not a consumer. Its open head still owns the free operator and cores. Both symbols are 4π²‖ξ‖². |
| R06 | repaired | Lines 379–386: “the identification … is deduced here”; §1.3 cites Lemma 2.24/Corollary 4.6. Lines 1195–1205 separate Theorem 6.4/core transfer from Theorem 10.2's decay hypothesis. Compression of diag(1,2,3) to span(e₁,e₃) has spectrum {1,3}; V=1 gives [1,∞). |
| R07 | repaired | Lines 1056–1062: “a **nonzero** `ψ`” and “`‖u_n‖² = w n ‖ψ‖²₂ > 0`”. Plan 3.10b agrees. Residual/norm is bounded by 2|t|‖ψ′‖/(n‖ψ‖)+‖ψ″‖/(n²‖ψ‖). R01 concerns the separately required Weyl-criterion contract. |
| R08 | repaired | Lines 538–548, 1046–1051 and 1165–1170 now state density-bound, cusp and vanishing-potential APIs. Lines 570–573 supply the atomic negative control: density derivative 0 does not put a nonzero vector of H=ℂ,A=0 in H_ac. Cusp area changes 1→1/2 under height 1→2; tail bounds add. |

## R01 (P1) — Weyl's criterion is consumed without a stated supplier target

**Location:** `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md:219,1064–1065`: “Weyl's criterion (UO-C02; teschl line 6277–6281)”; plan 3.10b has the same supplier prerequisite.

**Claim:** UO-C02 supplies the singular-sequence criterion used to turn the cusp sequence into an essential-spectrum point.

**Witness:** UnboundedOperators #1027, `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:535–543`, invokes singular Weyl sequences in its Fredholm argument but states only the two definitions, their equivalence, unitary invariance and finite-rank windows. Its API does not state the criterion.

**Exact repair:** Declare a precise supplier gap owned by UnboundedOperators, section UO-C02, and use its slug in the README and plan: for self-adjoint A and real λ, λ∈σ_ess(A) iff there are u_n∈dom A with ‖u_n‖=1, u_n⇀0 and ‖(A−λ)u_n‖→0. The orthonormal version may be included as the equivalent version of this same criterion. Alternatively explicitly derive the needed direction here from UO-C02's finite-rank-window characterization and name that local target; do not cite a source as if it were a supplied theorem. Update the scope/contract and §3.7/§3.10 uses together.

Test: A=0 on ℂ with u_n=1 has residual 0 but weak limit 1 and σ_ess=∅; A=0 on ℓ² with u_n=e_n has norm 1, weak limit 0, residual 0 and σ_ess={0}. The repaired hypotheses distinguish them. The cusp's disjoint normalized sequence satisfies precisely the second pattern. This is an absent contract, not a claim that the classical theorem is false.

## R02 (P1) — Bare-PVM recovery skips the resolvent identity needed by uniqueness

**Location:** `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md:100–102`: “for a bare real projection-valued measure `P` … whose spectral measure is `P` (SA-E44).”

**Claim:** UO-A01–A02 and SA-E44 already identify P with the spectral measure of id[P].

**Witness:** UnboundedOperators #1027, `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:261`, proves the resolvent comparison for a given operator's spectral measure. Main `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md:1316` requires a resolvent formula before SA-E44 applies. Neither states it for arbitrary P.

**Exact repair:** Retain the generality and declare the missing supplier contract at UnboundedOperators UO-A02, with matching gap slug in README and plan: for every real PVM P and Im z≠0, the bounded integral B_z=∫(z−s)⁻¹dP maps H into dom(id[P]) and is a two-sided inverse of z−id[P] on the actual domains. Then cite SA-E44 for the resulting P_{id[P]}=P. A local named comparison target with these same hypotheses and proof obligations is also possible, provided its ownership is explicit rather than claimed as supplied.

The proof can use UO-A01's second-moment domain, bounded spectral-integral laws and truncation: |s/(z−s)|≤1+|z|/|Im z| gives domain inclusion; the two inverse identities follow on truncations and by graph closure. Test P concentrated at 2 on ℂ, z=i: B_z=(i−2)⁻¹ and (i−2)B_z=1. For the coordinate PVM on ℓ²(ℕ), B_i has entries (i−n)⁻¹ and Σn²|x_n/(i−n)|²≤Σ|x_n|², which tests the unbounded-domain step missing from the citation. There is no declared gap for this in the reviewed plan.

## R03 (P2) — Relative compactness changes resolvent point without its adapter

**Location:** `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md:1201`: “`V` is relatively compact for `H₀` (4.3)”; plan 4.3b/4.4b.

**Claim:** Compactness of M_V(H₀+1)⁻¹ directly meets UO-E04's definition.

**Witness:** UnboundedOperators #1027, `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:985`, defines A-compactness using V(A−i)⁻¹. Section 4.3 proves compactness at −1 only; its text and prerequisites contain no change-of-point adapter.

**Exact repair:** Add the explicit consequence to §4.3/plan 4.3b, with the inverse signs written out:

`M_V(H₀−i)⁻¹ = M_V(H₀+1)⁻¹ [I+(1+i)(H₀−i)⁻¹]`.

The right factor is bounded; dom H₀⊆dom M_V because V is bounded. Cite `LinearPMap.resolvent_sub_resolvent` at `TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:280` and `IsCompactOperator.comp_clm` at `Mathlib/Analysis/Normed/Operator/Compact/Basic.lean:271` in the needs/contracts. No new general relative-compactness theory is required.

Test the multiplier at spectral values s=0 and 1: the two sides are respectively i and (1+i)/2. The right factor's modulus is (s+1)/√(s²+1)≤√2 for s≥0. Thus the existing compact operator really does meet UO-E04 after this explicit bridge.

## R04 (P2) — The potential ownership boundary overstates UO-E06

**Location:** `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md:85–87`: “unbounded or singular potentials (`L^p`, Kato class, Coulomb: UnboundedOperators UO-E06 and the physical-model roadmaps)”; also §4.4.

**Claim:** UO-E06 is the supplier/owner for those general potential classes, while §4.4 does not identify its existing three-dimensional perturbation specialization.

**Witness:** UnboundedOperators #1027, `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:1033–1035`, treats real L²+L∞ potentials on ℝ³ and sends Coulomb applications to a physical-model consumer. It does not state an arbitrary-Lᵖ or Kato-class theorem.

**Exact repair:** State the actual boundary: UO-E06 owns the real L²+L∞ theory in dimension three; general Lᵖ and Kato-class theory are outside this roadmap, without falsely assigning them to that target. Name QuantumFoundations §9.5 if a concrete Coulomb-model owner is wanted. Add in §4.4 and its plan that the d=3 self-adjointness and C_c∞ core clauses specialize UO-E06; this roadmap's bounded-potential theorem extends those clauses to all d≥1. Keep the all-dimensional result and its Schwartz-core comparison.

Test: for d=3,V=cos x₁, choose V₂=0,V∞=V in UO-E06, reproducing the same domain H² and C_c∞ core. For d=4 the UO-E06 hypotheses do not apply, whereas this roadmap's bounded theorem does. Thus the ownership clause distinguishes an existing specialization from the genuine extension. The maintainer's assigned ownership of the all-dimensional bounded theorem is retained.

## R05 (P3) — Synchronize the exact contracts with the actual restriction and spectral inputs

**Location:** `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md:58–60,203–210`: “self-adjoint restrictions” attributed to UO-C03, and the contract ending at “SA-E26–SA-E29”.

**Claim:** The exact-contract list correctly describes all inputs used in Layer 1.

**Witness:** UO-C03 explicitly lists restriction self-adjointness in its finite-control case. README lines 521 and 559–560 use SA-E30 and SA-C86, absent from its contract; main SelfAdjointSpectralTheory states them at lines 1267 and 1001. The plan includes both.

**Exact repair:** Add SA-E30 and SA-C86 to the README contract. Attribute the arbitrary-H restriction self-adjointness to §1.3/SA-C19, or directly to pinned `LinearPMap.IsReducing.isSelfAdjoint_restrict`, `TauCeti/Analysis/InnerProductSpace/LinearPMap/Reducing.lean:144`, after UO-C03 supplies reduction. Keep UO-C03 as owner of the three subspaces, projections and decomposition. This is an attribution correction, not a missing mathematical foundation: the required general theorem exists locally and at the pin.

Test: on ℓ²(ℝ)⊕L²(ℝ), the pp projection has blocks (I,0) and is not a single P_A(B); the general reducing-subspace theorem still applies. A finite-control-only citation would miss that instance. SA-E30 gives commuting projections for both atomic and continuous models; SA-C86 applies to diag(1,−1/4,1/9,…) with square-root energy π²/6.

## R06 (P3) — The compact resolvent in the repaired proof is normal, not self-adjoint

**Location:** `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md:1018–1019`: “the eigenbasis is that of the compact self-adjoint resolvent (SA-C86).”

**Claim:** The immediately constructed inverse at is is self-adjoint.

**Witness:** On a one-point manifold with V=0 and s=1, (Δ_X+V−i)⁻¹=iI, whose adjoint is −iI. It is compact and normal, but not self-adjoint.

**Exact repair:** Say compact **normal** resolvent and use SA-C86 in its actual compact-normal form, with resolvent normality from the adjoint and commuting-resolvent identities. Alternatively cite pinned `IsSelfAdjoint.exists_hilbertBasis_forall_apply_eq_smul_of_hasCompactResolvent` at `TauCeti/Analysis/InnerProductSpace/LinearPMap/Eigenbasis.lean:113` directly. On the witness iI is normal, and its eigenbasis is the basis for Δ_X+V=0; the intended conclusion remains correct. No new Lean statement is needed for this correction.

## Verified sound

Reviewed all 44 plan targets (17 definition targets), all 27 numbered mathematical subsections, all needs lines, conventions, API bullets and Checks. Local target prerequisites exist and point backward. Each definition target has at least three plan Checks; the prior README API omissions are repaired. The unchanged, unsampled parts were carried forward only where round 2 supplied computed adversarial rows, and were checked for the repaired patterns. Every changed mathematical passage, sampled target and headline was examined again. In particular, the source's separability is not silently imposed on the arbitrary-H targets, and the disconnected manifold arguments work componentwise.

The scope is a new general library extension, not a replacement of an existing roadmap. No route-specific arithmetic restriction, computational algorithm, copied source passage, process identifier, machine path or forbidden Lean command occurs in the design. The four layer titles describe their mathematics; abstract spectral theory and perturbation feed the two geometric/Euclidean applications. Their order is not copied from a source's chapter sequence. PDE, ComplexKahlerGeometry and SelfAdjointSpectralTheory on main were read for house shape.

**Adversarial table.** Entries give actual values, including the sampled targets, headline theorems and every finding's affected object. Here Δ_X is the nonnegative geometric operator; the bare Euclidean Δ in the free-Hamiltonian contract is explicitly Mathlib's opposite sign (README line 235). This distinction was checked against the Gaussian and norm-square examples.

| Statement | Instances tried | Values computed on both sides | Result / change |
|---|---|---|---|
| PVM convention/recovery | P at 2; coordinate PVM at n | at z=i, (i−2)/(i−2)=1; n²/(1+n²)≤1 bounds the domain moment | Correct prospective adapter; missing contract R02 |
| Lebesgue orientation | μ=2Leb on [0,1] | Leb.withDensity(2)=2Leb; μ.withDensity(2)=4Leb | Correct |
| 1.1 restriction/calculus | A=diag(1,2), f=(1,i), g=3·1_{2} | μ_f=δ₁+δ₂; restriction=δ₁; μ_g(A)f=9δ₂, not 3δ₂ | Correct |
| 1.1 orthogonality/transport | A=0,f=h=e₁; swap basis of diag(1,2) | μ_(f+h)=4δ₀ versus sum 2δ₀; after swap μ_Uf=δ₁+δ₂ unchanged | Hypothesis and unitary direction correct |
| 1.2 type identities | M_x⊕(1/2), f=(1,1); Cantor multiplier | total Leb[0,1]+δ_(1/2); ac=Leb, pp=δ, sc=0; Cantor sc=c, ac=pp=0 | Correct |
| 1.2/1.3 nonseparable reduction | coordinate operator on ℓ²(ℝ)⊕L²(ℝ) | pp projection=(I,0); any P(B) keeping all coordinates has B=ℝ and blocks (I,I) | No Borel-value assumption; attribution R05 |
| 1.3 compression | diag(1,2,3), U=span(e₁,e₃),0,H | spectra {1,3},∅,{1,2,3}; μ_(e₁+e₃)=δ₁+δ₃ on both carriers; resolvent diag((i−1)⁻¹,(i−3)⁻¹) | Correct |
| 1.4 spectra/local mass | M_x on [0,1]; rational diagonal; direct sum | ac=[0,1],∅,[0,1]; pp=∅,[0,1],[0,1]; λ=1/2 has positive local ac mass in every interval in first model | Correct in both directions; overlap permitted |
| 1.4 essential closure/maximal vectors | ℚ,(0,1),[0,1]∪{2}; diag(1,2) | essential closures ∅,[0,1],[0,1]; (1,1) gives δ₁+δ₂, (1,0) misses δ₂ | Correct |
| 1.5 interval criterion | bands [0,1]∪[2,3]; a=b=0; fat Cantor K | mass(1,2)=0; at a=b RHS vacuous but {0}⊄∅; K^ess has no interval | a<b and full-interval density are necessary |
| 1.6 min–max/counting | diag(1,3,5), M_x on [0,1], H=0 | μ=(1,3,5,∞,…), rank P((−∞,4))=2=count; multiplier μ_n=0; zero-space μ_n=∞ | Extended convention correct |
| 1.6 form order | Neumann/Dirichlet on (0,1) | Q_D⊂Q_N; μ_n(N)=(n−1)²π²≤n²π²=μ_n(D); reversed n=1 inequality π²≤0 fails | Correct domain direction |
| 1.7 wave limits | H₁=H₂; scalars 0,1; M_x,M_x+c | Ω=I,D=H; for nonzero scalar difference phases at multiples of 2π/c and (2k+1)π/c are 1 and −1, so D=0 | Correct |
| 1.8 density constants/scalars | x=1_[0,1], m=−1,0,1,2; c=3i | density 1; predicate true,false,true,true; μ_cx density 9=(|c|·1)² | Repaired monotonicity correct |
| 1.8 truncation/atomic control | x=|λ|^(−1/4)1_[−1,1]; H=0 on ℂ | removed squared norm 4/m²: 4 at m=1,1 at m=2; atomic RN=0 but time integral ∞, claimed bound 0 without H_ac | Correct definition and limit |
| 1.8 Rosenblum/square root | rank-one C, x=m1_[0,1]; V_n=(−1)^(n+1)/n² | time integral=2πm²=bound; square-root HS energy=Σ1/n²=π²/6=nuclear gauge | 2π and trace normalization correct |
| 1.9 Pearson | J=I,C=0,H₁=H₂=M_x; J=0 | W=I; W=0; Duhamel derivative i⟨ψ_u,Cφ_u⟩=0 | Statement matches source; no unjustified isometry |
| 1.9 Kato–Rosenblum | V=0, finite diagonal/M_x; H₁=diag(1/n²),V=−H₁ | finite diagonal Ω=I,W=0; M_x Ω=W=I; last ac parts=0,W=0 | Compression and completeness correct |
| 1.9 failed weak-limit inference | H₁=M_x,H₂=2M_x,x=1_[0,1] | pairing (e^(it)−1)/(it)→0; norm=1; distance to limit 0 remains 1 | Correctly excluded, not used in repaired route |
| 2.1 bottom/equivalence | A=2,γ=1,3; M_x; H=0 | γ=1: three true; γ=3: three false,P((−∞,3))=I; λ₀=2; M_x three false; zero-space three true | Semibounded/nonzero clauses correctly placed |
| 2.2 bounded perturbation | diag(0,1)+diag(1,−1); V=cI | bottom remains 0∈[−1,1]; constant perturbation shifts bottom exactly by c | Correct |
| 2.3 sign/bound/core | A=2,V=1,μ=0; a=1,b=1/2,γ=0; b=1,V=−A | factor (1+1/2)2=3; lower bound −max(2,1)=−2; b=1 cancels action on proper H² domain, nonclosed | Sign, denominator and b<1 correct |
| 3.1 complex Laplacian | |x|²; u=v=e^(iθ); v=iu | Δ_X|x|²=−2d; both Green integrals 2π; replacing first slot by iu gives −2πi on both sides | Sign/conjugation correct |
| 3.2 initial/minimal | interval; countable discrete X | interval initial graph closure H²₀, maximal H²; (Δ_max+1)e^x=0; discrete initial zero on finite support, closure zero on ℓ² | Correct domains |
| 3.3 maximal domain | e^(−|x|); χ/r on ℝ³; interval 1 | Δ_Xu=−u+2δ₀; Δ_X(χ/r)=4πδ₀+smooth; Δ_X1=0 | First two excluded; last included |
| 3.4 energy/Friedrichs | interval constant; sin(πx); multiply by i | constant norm²=1,energy=0,not H¹₀; sin has quotient π²; a(iu,iu)=a(u,u),a(u,iv)=ia(u,v) | Dirichlet/Neumann and Hermitian distinctions correct |
| 3.5 Gaffney cutoffs | smoothed clamp; incomplete interval; disjoint circles | derivative ≤2·2/k=4/k; interval would require 1≤2/k; circle cutoffs gradient 0 | Correct completeness use and countable-component construction |
| 3.6 complete-manifold theorem | cutoff energy; punctured ℝ⁴; interval | energy ≤2‖Δu‖‖u‖+64‖u‖²/k²; deficiency norm bounded by 32‖u‖²/k²→0; puncture integral ∫₀¹dr/r=∞; interval deficiency e^x≠0 | Correct hypotheses and local regularity route |
| 3.7 kernel/eigenvalues | S¹,ℝ,point,S¹⊔ℝ | kernel dimensions 1,0,1,1; circle λ=0,1,1,4,4; ℝ λ₁⁺=0; point λ₁⁺=∞ | Correct with Hilbert dimension for infinite component sums |
| 3.8 compact identification | ∅; N points; S²; two circles | ∅ spectrum ∅; N-point μ=0 for n≤N then ∞ versus supplier junk 0; S² list 0,2,2,2,6; two-circle zero multiplicity 2 | Range and nonempty hypotheses correct |
| 3.9 bounded compact potential | circle V=1, step V; N=2,V=(3,−1) | list 1,2,2,5,5; step Rayleigh(1)=1/2 and smooth solution forces u(0)=u′(0)=0; two-point list −1,3,∞ | Repaired regularity/min–max statements correct |
| 3.9 resolvent proof | point,V=0,s=1 | inverse i, adjoint −i, product with adjoint 1 either order | Normal, not self-adjoint: R06 |
| 3.10 cusp geometry | w=1,a=1→2; y^s | areas 1→1/2; squared norm ∫_a∞y^(2Re s−2)dy finite iff Re s<1/2 | Correct |
| 3.10 cusp sequence | ψ≠0,t=0,1,n=2^j | norm²=wn‖ψ‖²; residual ratio ≤2|t|‖ψ′‖/(n‖ψ‖)+‖ψ″‖/(n²‖ψ‖); energies 1/4,5/4; supports r∈(4,6),(8,12) disjoint | Sequence correct; supplied criterion missing R01 |
| 3.10 Weyl negative control | 0 on ℂ with constant unit sequence; 0 on ℓ² with e_n | residual 0 both; weak limits 1 versus 0; essential spectra ∅ versus {0} | Weak-null requirement indispensable: R01 |
| 4.1 four H² descriptions | Gaussian; 1_[−1,1] | Gaussian ‖u‖²=1/√2,‖u″‖²=3π²/√2,‖ξ²Fu‖²=3/(16π²√2); indicator u″=δ′_(−1)−δ′_1 and ξ²Fu∉L² | Four conditions agree; 4π² factor correct |
| 4.1 norm bounds | Gaussian; multiplier radius r | N²=(1+1/(2π)+3/(16π²))/√2; 1≤1+r² and 4π²r²≤4π²(1+r²) | Both stated inequalities hold |
| 4.2 form/essential spectrum | d=1 Gaussian; d=0 | q=π/√2, mass=1/√2, quotient π; density e^(−λ/(2π))/(2π√λ) integrates to 1/√2; d=0 ac=ess=∅,pp={0} | Correct d≥1 and supplier normalization |
| 4.3 local compactness/decay | cutoff potentials; constant; thin spikes | approximation error ≤‖V−V_R‖∞+‖V‖∞/(1+4π²R²)→0; constant resolvent spectrum [0,1]; spikes tail ess sup=1 but L¹ norm Σn⁻²=π²/6 | Correct essential-sup notion and both product orders |
| 4.3 algebra/radius | V=1_B1+(1+r²)^−1/2; bounded W | ε=0.9 permits R=1 since tail≤1/√2<0.9; ‖W‖∞=3 and V tail≤ε/4 give product≤3ε/4 | New API correct |
| 4.3→4.4 change of point | s=0,1 in multiplier | Q_i=i,(1+i)/2; Q_−1[I+(1+i)Q_i] gives same two values | Required explicit adapter R03 |
| 4.4 Schrödinger | V=c; square well; positive compact bump; d=3/4 | σ=[c,∞); k≈0.739085,κ≈0.673612,E≈−0.453753; positive bump σ=σ_ess=[0,∞); UO-E06 covers d=3 only | Theorems correct; ownership boundary R04 |
| 4.5 trigonometric potentials | conjugate pairs; imaginary pairs; Q=0 | cos x+cos√2x has inf −2; imaginary pair gives 2i cos x; Q=0 gives real V₀ and lower bound −|V₀| | Correct finite sum, no Diophantine assumption smuggled in |

For §1.4's pure-point single-vector assertion, an atom at λ supplies the vector directly; otherwise disjoint spectral annuli supply it as in the ac/sc proof. For infinite countable sums the chosen summands can be normalized before using square-summable weights. Neither finite-dimensionality nor separability is assumed in the general statements. Scalar rings, DVRs and scheme nilpotents are inapplicable to these fixed complex-Hilbert/real-manifold carriers; the relevant stress cases above include zero spaces, empty and zero-dimensional manifolds, nonseparability, actual unbounded domains and nonzero normalizers.

**Sources and sample.** The manifest contains 21 distinct works, eight certified and thirteen settled uncertified. All cited keys are present. No new work was needed or fetched; no source entry was altered. The arXiv version notes identify the versions read rather than claiming their published numbering was checked. There are no additional unresolved author-flagged locators outside those settled texts.

| Seeded target | Text/locator opened | Assessment |
|---|---|---|
| 1.1 | teschl line 4399–4411, proof of Lemma 3.19, p.106; line 4426–4427 | Weighted vector measures and orthogonal sum match. The general PVM laws and transport are local deductions from the named bounded calculus/uniqueness inputs, not an assertion that this proof treats nonseparable H. |
| 1.3 | teschl line 3282–3304, Lemma 2.24, p.80; line 4945–4946, Corollary 4.6, p.116 | Reduction is supported. Compression-PVM identification is now explicitly proved locally. |
| 1.6 | teschl line 5044–5057, Theorem 4.10/Corollary 4.11, p.119; line 5063–5069, Theorem 4.12(i), p.119 | Min–max/form-domain version verified. Counting equality is a corollary of the eigenvalue description; Theorem 4.12 itself gives the dimension estimate. Extended empty values and form-domain inclusion are explicit local extensions. |
| 2.1 | teschl line 5044–5055, Theorem 4.10, p.119; SA-D22/E08/E11 | n=1 yields Rayleigh infimum; zero/nonsemibounded cases of the equivalence handled separately. |
| 2.3 | teschl line 5683–5720, Lemma 6.3/Theorem 6.4, pp.134–135 | Relative-coefficient lettering and opposite resolvent sign accounted for; corrected denominator not copied blindly from source. |
| 3.1 | Pinned Laplacian/Green declarations below; grigoryan09 Ch.4 | Complexification checked directly; textbook remains uncertified. The other compact-support alternative follows by a cutoff equal to 1 near the supported factor. |
| 3.2 | bms02 line 151–157, §2.1, p.4 | Initial versus minimal versus maximal terminology matches; density supplied by B2.2. |
| 3.4 | teschl line 2914–2917, Theorem 2.12, p.70; line 2960–2966, Theorem 2.13, pp.71–72 | Supports abstract extension/representation. Manifold-domain equality follows from the local form/test argument. Source shift error below is not adopted. grigoryan09 remains uncertified. |
| 3.5 | RiemannianGeometry R7.8 item 8; HopfRinow (b) | Quantitative smoothing and compact balls suffice for the explicit construction. gaffney54 and grigoryan09 unavailable as settled uncertified texts. |
| 3.8 | ComplexKahlerGeometry K5a/ComponentwiseCompact; VariationalMethods 4.4,5.1–5.2 | Compact realization and finite-index min–max comparison resolved. chavel84 Ch.I remains uncertified. |
| 3.10 | lp80 line 251–256, (2.8)–(2.10), p.266; line 279–290, p.267; teschl line 6277–6281, Lemma 6.17, p.145 | Log-height transform and zero Fourier mode support the explicit cusp construction. Weyl theorem text is readable, but source access does not repair the missing supplier contract R01. |
| 4.1 | teschl line 7086–7092, (7.22)–(7.24), p.167; pinned Sobolev/Fourier multiplier | Multiplier domain verified; weak derivative comparison comes from PDE §1.3; Mathlib normalization supplies 4π². |
| 4.2 | teschl line 7137–7143, (7.26), p.168; QuantumFoundations §8.2 | Form H¹ and gradient energy match. Essential spectrum follows from supplied [0,∞) spectrum and absence of isolated points. |
| 4.3 | teschl line 7213–7228, Lemma 7.11, p.170 | Both product orders and L²-kernel cutoff proof verified. Essential-sup decay has the expected representative-invariant formulation. |
| 4.4 | teschl line 5704–5711, Theorem 6.4, p.135; line 7095–7136, Theorem 7.8/Lemma 7.9, p.168; line 9578–9589, Theorem 10.2, p.222 | Every bounded real V is covered by perturbation/core transfer; Theorem 10.2 is used only with decay. R03 is the remaining interface. |

Additional repaired/headline source checks: yafaev04 line 116–122 (Definition 1.3,p.3), line 136–140 (Theorem 1.4,p.4), line 191–206 (Theorem 1.8/Lemma 1.9,p.5); bms02 line 128–129 and 245–256 (connectedness, Corollary 2.10/Remark 2.12,pp.4,7). Pearson's form hypothesis gives J(dom H₁)⊆dom H₂ by the adjoint characterization, so it really states the operator difference required by Theorem 1.8. The full Pearson proof is not present in the notes and is not certified here; it is now a named theorem to prove, not an alleged elementary weak-limit inference. Unchanged Kato/Rosenblum, hm23 and kps26 checks retain round 2's computed evidence.

**Pinned libraries and duplication.** Plan pins match the supplied lake manifest: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Every cited library identifier was located at these pins, with declarations and applicable hypotheses read. Representative grouped evidence follows; these are library-relative paths.

| Pinned location | What was opened and checked |
|---|---|
| `Mathlib/Analysis/InnerProductSpace/LinearPMap.lean:73` | IsFormalAdjoint is the domain pairing; adjoint at 151 uses zero action without density; mem_adjoint_domain_of_exists at 163, adjoint_apply_of_not_dense at 172, le_adjoint at 194, adjoint_isClosed at 332. Density is explicit in the roadmap. |
| `Mathlib/Topology/Algebra/Module/LinearPMap.lean:66` | IsClosable; closure at 93 returns the original map when not closable; closed-extension criterion at 132; HasCore at 141 includes S≤domain and closure equality. |
| `Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean:65` | HaveLebesgueDecomposition is decomposition, not absolute continuity. singularPart/rnDeriv at 73/80 have junk zero fallback; finite vector measures satisfy the needed instance. singularPart_add_rnDeriv at 122 has the right orientation; uniqueness at 404/522 and mutual singularity at 106. |
| `Mathlib/Analysis/Distribution/Sobolev.lean:153` | MemSobolev uses a Bessel-potential Lp representative. Fourier characterization at 222 uses (1+‖ξ‖²)^(s/2); laplacian at 348 lowers order by two. |
| `Mathlib/Analysis/Distribution/FourierMultiplier.lean:107` | Schwartz and distribution versions (208) have multiplier −(2π)²‖ξ‖² for the library Δ. |
| `Mathlib/Analysis/Fourier/LpSpace.lean:51` | Lp.fourierTransformₗᵢ is a complex linear isometric equivalence on finite-dimensional real Euclidean source and complete complex target. |
| `Mathlib/Analysis/Normed/Operator/Compact/Basic.lean:271` | comp_clm; norm-limit theorem at 459 requires complete separated target and a nontrivial convergence filter. Hilbert spaces satisfy these. |
| `TauCeti/Analysis/InnerProductSpace/ProjValMeasure/Basic.lean:91` | Native PVM contains finite diagonal measures, matrix-element law, identity and intersection product. norm_sq_proj_apply at 275, diag_univ at 299, proj_mul_comm at 200. No second carrier is planned. |
| `TauCeti/Analysis/InnerProductSpace/ProjValMeasure/Integral.lean:218` | Bounded Borel integral is a star-algebra homomorphism; diagonal pairing at 279; norm-square law at 305. It is not a ready-made bare-PVM unbounded resolvent theorem. |
| `TauCeti/Analysis/Normed/Operator/LinearPMap/RelativeBound.lean:56` | Includes dom A≤dom V and ‖Vx‖≤a‖x‖+b‖Ax‖. KatoRellich theorem at `TauCeti/Analysis/InnerProductSpace/LinearPMap/KatoRellich.lean:118` gives self-adjointness, not the new lower-bound/core clauses. |
| `TauCeti/Analysis/InnerProductSpace/LinearPMap/Reducing.lean:59` | Reduction includes domain preservation and invariance of U and U⊥; self-adjoint reduced restriction at 144 needs complete ambient and subspace. Closed U supplies the latter. |
| `TauCeti/Analysis/InnerProductSpace/LinearPMap/CompactResolvent.lean:69` | Compact-resolvent equivalence at nonreal z; opposite-sign version at 78. This verifies the nonreal parameter used in §3.9, not a claim that that inverse is self-adjoint. |
| `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82` | Riemannian volume, local finiteness at 179; open positivity at `VolumeDensity/Support.lean:36` needs the Borel/Lindelöf manifold assumptions. It does not require nonemptiness of X. |
| `TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean:238` | laplaceBeltrami=divergence(mgradient); Euclidean comparison at 760 and norm-square value +2d at 784. The design's geometric operator negates it. |
| `TauCeti/Geometry/Manifold/Riemannian/DivergenceTheorem.lean:312` | Real Green identity for C¹ compactly supported first factor, C² second factor, with negative gradient pairing. Complex expansion produces §3.1. |
| `TauCeti/Analysis/Sobolev/Wkp/Basic.lean:145` | Real-valued higher weak Sobolev carrier; `W1p/Basic.lean:372` gives order one. Complex comparison needs both real and imaginary parts as stated. |
| `TauCeti/Analysis/OperatorIdeal/Nuclear/Basic.lean:53` | nuclearENorm sums approximation numbers in ENNReal; finite gauge implies compactness at 153. `TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/Basic.lean:89` is squared column-norm sum; compactness follows from `HilbertSchmidt/Columns.lean:257`. |

Object searches used the pinned analysis trees, main roadmaps, board package index and `roadmaps grep`, including spectral measures/types, unbounded domains and resolvents, closed forms, Fourier multipliers, Laplace–Beltrami operators, trace-class perturbations, Pearson and Gaffney. No other readable owner of the general Pearson/Kato–Rosenblum or noncompact scalar-manifold theorem was identified. The ordinary operator-algebra Rosenblum/Sylvester theorem is a different object. The generic carriers, adjoints, bounded integrals, self-adjointness perturbation theorem and weak Sobolev spaces remain imported. Local geometric identifications and the stronger spectral-type assertions are not duplicates of the abstract carrier definitions.

**Cross-roadmap resolution and overlap.** The board-package index was read before any absence conclusion. The supplied overlap file reports no conflicting head, dropped cited ID, revision-only ID or reverse numbering requirement. The closest readable heads were checked. SelfAdjointSpectralTheory #1854 has a “Former SA numbering” map at `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md:762`, including C86, E30 and E44; its renumbering therefore preserves these citations. Main, not that revision, supplies this design. No dependency on revision-only content was introduced.

| Supplier | Resolved repository-relative location and boundary |
|---|---|
| SelfAdjointSpectralTheory, main | `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md:420` B44–45; 676–752 B85, including nondegenerate C₀(ℝ); 818–834 C12–19; 852–859 C25–28; 888 C39; 903–930 C44/C52–54; 1001 C86; 1113 D22; 1202–1231 E01–13; 1260–1268 E26–30; 1316–1331 E44–47. R02/R05 describe the remaining citation defects. |
| UnboundedOperators #1027 | `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:241` A01, 259 A02, 305 A06, §1.7 A07; 523 C01, 533 C02, 552 C03; §4.7 D06; §5.1 E01, 983 E04, 1027 E05, 1033 E06. Reducing subspaces, forms and essential spectrum exist; R01/R02/R03/R04 qualify what can be consumed. |
| QuantumFoundations #1771 | `TauCetiRoadmap/QuantumFoundations/README.md:890` §8.2: free Hamiltonian, both cores, spectral density and spectrum. It supplies the free object at m=1/2; this design adds the H¹ form identification and essential-spectrum consequence. |
| VariationalMethods #1028 | `TauCetiRoadmap/VariationalMethods/README.md:782` §4.4, 839 §5.1, 882 §5.2: compact pairs, min–max and represented-domain expansions. Out-of-range values are 0 there; this design restricts the identification to valid indices. |
| HilbertModules, main | `TauCetiRoadmap/HilbertModules/README.md:705` H6, especially 714–716 and 752–760: closure-adjoint equality and scalar deficiency spaces. No open revision required. |
| ComplexKahlerGeometry, main | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1513` tests/distributions; 1651–1671 local Sobolev scale; 1948–2045 smooth Laplace-type regularity and compact H² realization; 2092 ComponentwiseCompact. Supplies compact geometry, not the general complete noncompact operator. |
| PseudodifferentialOperators, main | `TauCetiRoadmap/PseudodifferentialOperators/README.md:404` P1.0 density transpose/formal adjoint and restriction compatibility. |
| SmoothBundlesConnections, main | `TauCetiRoadmap/SmoothBundlesConnections/README.md:605` B2.2; 652–660 finite-rank bundle L², locally finite density, open-positive injectivity and separability. |
| DifferentialGeometry, main | `TauCetiRoadmap/DifferentialGeometry/README.md:2850` §§12.2–12.5: gradient, divergence, sign, volume and Green identities. |
| RiemannianGeometry / HopfRinow, main | `TauCetiRoadmap/RiemannianGeometry/README.md:3708` R7.8 item 8 supplies quantitative smoothing on a connected component; `Completed/HopfRinow/README.md:51` gives completeness/compact-ball equivalence under connectedness. |
| PDE, main | `TauCetiRoadmap/PDE/README.md:720` A2 density, §1.3 A3 weak/Bessel comparison with equivalent norms, 2331 F26 generator domain/core. The complex comparison uses real and imaginary parts. |
| OperatorIdeals, main | `TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md:349` OI-B29–B41 nuclear and HS gauges. HS⇒compact is also pinned at Columns.lean:257. |
| FuchsianOrbifolds, main | `TauCetiRoadmap/FuchsianOrbifolds/README.md:563` Layer 3 supplies positive-width cusp/horodisc coordinates for examples. No orbifold is substituted for the arbitrary manifold carrier. |

CongruenceSpectralGap #1504, `TauCetiRoadmap/CongruenceSpectralGap/README.md:170`, constructs the congruence quotient realization, finite-cover invariants and its comparison with AutomorphicSpectralTheory. It does not own the all-manifold theorem. The maintainer's ownership decisions for arbitrary closed-subspace compression (§1.3), named type spectra and all-dimensional bounded potentials are respected. The “Downstream consumers” list describes possible uses; those earlier roadmaps do not presently cite this new roadmap. No existing reverse edge was inferred from that list alone. Ownership against unindexed open-file contents was not checked.

**Maintainer notes disposition.** Each was checked at the supplied current main/head, not at a remembered line number.

1. General potential attribution to UO-E06: holds; R04, including the missing d=3 specialization clause in §4.4.
2. Arbitrary-H restriction self-adjointness attributed to UO-C03: the attribution issue holds; R05. A missing-prerequisite interpretation is refuted by §1.3, main SA-C19 and pinned Reducing.lean:144.
3. Weyl criterion not a stated UO-C02 target: holds; R01. Its mention inside the Fredholm route is not the consumed iff statement.
4. Resolvent-point bridge absent: holds; R03, with an explicit sign-tested repair using the pinned identity.
5. Bare-PVM recovery missing its inverse calculation: holds; R02. SA-E44 alone is a conditional uniqueness theorem.
6. SA-E30/SA-C86 omitted from README contract but in plan: holds; R05. Both IDs exist on main; no gap is needed for them.

**Supplier-order gate.** Exact output of the prescribed command:

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after QuantumFoundations (the intake inserts it when its design is accepted)
note: supplier UnboundedOperators of SchrodingerOperatorsAndSpectralTypes is not in the merge order; it must be inserted before SchrodingerOperatorsAndSpectralTypes
note: supplier VariationalMethods of SchrodingerOperatorsAndSpectralTypes is not in the merge order; it must be inserted before SchrodingerOperatorsAndSpectralTypes
depcheck: 229 roadmaps, 2065 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The two insertion notes are not defects. `roadmaps resolve` found no missing roadmap citation or Lean name, but explicitly did not check pinned Lake packages on its host; the native declarations were therefore read locally as recorded above. A resolver finding an ID does not establish its mathematical contract, as R01 and R02 illustrate.

**Headline acceptance inventory.** The summary promises: vector-measure/type identification and local mass/interval characterizations; min–max below essential spectrum; abstract wave reduction/intertwining, Pearson and Kato–Rosenblum; perturbation lower bounds and cores; initial/maximal/Friedrichs Laplacian comparisons, complete-manifold essential self-adjointness and H¹ form identification; kernel/min–max/compact spectral description and bounded manifold potentials; cusp threshold; four H² characterizations; free H¹ form/essential spectrum; all-dimensional bounded Schrödinger domain/core/lower/essential-spectrum theorem and trigonometric specialization. The plan has corresponding targets. The high-energy quasi-periodic and random-cover spectral-gap theorems are expressly motivation/examples, not claimed headline deliverables.

This design contains no `Suggested.lean`. Consequently there are zero sorried theorem declarations to probe and no declaration binders to compare with `#check`; imports, sorry'd data, `set_option`, padding and missing module-docstring declarations are package-stage checks, not simulated by inventing a Lean file here. No absent statable signature is reported as a design defect. All own backticks in this README are mathematical notation; there is no purported new Lean API catalogue to reconcile with a nonexistent file.

## Not verifiable

- Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run; no passing elaboration, binder audit or “sorry is the only warning” result is claimed.
- Settled uncertified texts were not requested again: `strichartz83` Theorem 2.4/§2; `chernoff73` Theorem 2.2/§3; `kato76` Ch.V §4.1 and Ch.X §4.4; `cfks87` Ch.1; `gaffney54` pp.140–145; `rs1` §VII.2; `rs2` Ch.IX/§X.1–2/Theorem X.12; `rs3` Theorems XI.7–XI.8; `grigoryan09` Ch.4/11; `chavel84` Ch.I; `iwaniec02` Ch.4/7/11; `lp76` Ch.1/8; `pearson78` main theorem. Their legal text is not available in this lane; their manifest status is settled. The Pearson proof in particular is not supplied by the readable Yafaev statement.
- Published-version numbering for the bms02, hm23 and kps26 arXiv copies was not independently certified; the versioned texts and their manifest notes remain the locator authority.
- Open pull-request contents outside the supplied/readable roadmap index were not examined. No assertion of universal absence is based on those inaccessible contents.

## Source issues

- **Misprint** in teschl at Theorem 6.4, equation (6.3), printed page 135: the source says the resolvent-derived bound uses b/(a−1); it should be b/(1−a) in its relative-coefficient-first notation; affects a stated result.
- **Misprint** in teschl at Theorem 6.4, proof factorization, printed page 135: the source says the same signed argument is used in R_A(±iλ) and A±iλ; it should be the opposite resolvent argument with R_A(z)=(A−z)⁻¹; affects the proof.
- **Misprint** in teschl at Theorem 2.13, equation (2.60), printed page 72: the source says subtract (1−γ)ψ from the unshifted form's representing vector; it should be that vector itself, or first use the shifted form; affects a stated result.
- **Misprint** in teschl at the remark following Theorem 10.2, printed page 222: the source says D(V)⊆D(H₀) justifies local square integrability of V; it should be D(H₀)⊆D(V), allowing compact smooth tests in the multiplication domain; affects nothing.
