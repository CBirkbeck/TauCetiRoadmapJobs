<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12987#issuecomment-6789959791 -->
Review (codex) of e082073

Verdict: needs_changes

1. **F01** (P2) The trace congruence lacks its integral domain and hypotheses

   **Location:** packages/PadicFamiliesPartII/README.md:676–686, §4.6. The paragraph introduces “the relevant finite étale cover of the special strata” and asserts a congruence modulo `p^{min_w(k_w−l_w)}`.

   **Claim:** This congruence supplies the ordinary comparison. However, J and the ambient complement Jᶜ are undefined here, and neither i, Tr nor T̃_w has a stated source and target. Most importantly, the only geometric domain mentioned is the special fibre. The p-adically informative congruence used in the proof is on complete, separated, ℤ_p-flat modules of sections on formal completions. Its reduction to the special fibre cannot replace it. The empty-complement Check also leaves the minimum in the displayed expression undefined. “For n large” unnecessarily weakens the source's n≥1 assertion.

   **Witness:** BCGP21 lines 5414–5446, printed pp. 111–112, introduce the flat formal completions before Lemma 4.6.16. On an F₃-module, `0 ≡ 3·1 mod 9` is `0=0`; on ℤ₃ it is false.

   **Exact repair:** Expand §4.6 to specify the following interface, using the source's notation or explicitly defined equivalents.

   - Fix J⊆I, with Jᶜ the complement in all places above p. Define the spherical stratum with p-rank one at J and ordinary rank two at Jᶜ, and its mixed-level cover selecting the multiplicative lines at Jᶜ. Its degree is (p+1)^|Jᶜ|. State the weight hypotheses of BCGP21 §4.6.8, p. 109: l_v≥3 on Iᶜ; k_v≥3 and l_v≥2 on I; additionally l_v≥p+1 and k_v≥2p+3 on J.
   - Define the formal completions of the ordinary-at-Jᶜ open models along these strata, as in BCGP21 lines 5417–5421. Specify their ideal of definition, generated locally by p and the partial Hasse equations at J, with their coefficient twists. Let Aκ and Bκ be the cuspidal section modules on the spherical and mixed-level completions. State completeness, separatedness and ℤ_p-flatness, and their reductions to the stratum section modules.
   - Type i:Aκ→Bκ as pullback and Tr:Bκ→Aκ as finite étale trace. Define T̃_w on Aκ through the finite-flat quotient correspondence of BCGP21 lines 5316–5331, with its normalized coefficient pullback and trace; this is not just a new notation for an arbitrary endomorphism.
   - State Lemma 4.6.16 for every n≥1 as an identity modulo p^rAκ, where r=min_{w∈Jᶜ}(k_w−l_w), for nonempty Jᶜ. Give the empty-complement case separately as the identity, without forming a minimum of the empty set. Then state the ordinary comparison with its uniform large-weight quantifiers and use the already retained one-exponent-at-a-time Hasse dévissage.
   - Add the defining API and discriminating Checks for this interface, including the flat-module versus special-fibre test above, the cover/normalization counts, and the empty-complement identity. Update its Needs line with the actual model and coefficient suppliers used by the constructions.

   **Repair tested:** At p=3 and one complementary place, the cover degree is 4 and the leading factor is 3. The complete flat lattice distinguishes 0 from 3 modulo 9, permitting the source's p-divisibility argument; the special-fibre lattice cannot. With two places the counts are 16 and 9. With no complementary places, both composites are the identity and no minimum is evaluated. This is a missing interface and hypothesis finding, not a claim that Lemma 4.6.16 is false.

2. **F02** (P1) The explanation incorrectly calls VB⁰ contravariant

   **Location:** packages/PadicFamiliesPartII/README.md:1030, §7.1b: “Because `HCS_{w,λ}` and `VB⁰` are exact and contravariant”.

   **Claim:** The sentence attributes contravariance to both functors. HCS is exact contravariant; VB⁰ is exact covariant on the stated category killed by the unipotent Lie algebra. The composite is contravariant. The subsequent formulas correctly use this composite, so the defect is confined to the explanation. P1 records the literally false variance assertion under the stated severity rubric; its repair does not require changing the formulas.

   **Witness:** BCGP25 lines 3431–3437 preserve all arrows under VB⁰; Theorem 4.5.20(5), lines 3579–3581, states its exactness. Dualizing E→E² gives (E²)∨→E∨, `(a,b)↦a`; VB⁰ preserves that direction.

   **Exact repair:** Replace the quoted clause by: “Because HCS is exact contravariant and VB⁰ is exact covariant on these sheaves, their composite is exact contravariant”. Keep the already corrected termwise complex, H^{−i} formula and shift statements.

   **Repair tested:** For V[1], one reversal puts F(V) in degree 1. A second reversal would put it in degree −1. The corrected wording yields the existing H¹=F(V) Check and the spectral-sequence indexing in §7.5. This does not reopen the substantive F01 repair.

Two findings: one P1 and one P2. The four previous findings are repaired in substance. The source sample exposes an additional incomplete integral interface in §4.6; the newly added explanation in §7.1b also needs a wording correction. No authored package file was changed in this review.

### Verification of the previous findings

| Previous finding | Repaired passage in packages/PadicFamiliesPartII/README.md | Verification and status |
| --- | --- | --- |
| F01, contravariant cohomological indexing | §7.1b, line 1030: “its i-th cohomology sheaf is `VB⁰(HCS_{w,λ}(H^{−i}(M)))`”; line 1042: bounds `[−b, ℓ(w) − a]` and `[ℓ(w) − b, d − a]` | **Repaired.** For M=V[1], the coefficient realization has H¹=F(V), not F(H¹M)=0. Degree-zero hypotheses, reversed differentials, shifts and truncation bounds now agree. R02 concerns only the new attribution of contravariance to VB⁰. |
| F02, characters for general Q | §§7.1–7.1a: “λ ∈ X*(M_Q)_E”, inflated through the Levi abelianization | **Repaired.** For GL₂ and Q=G, ε₁ takes value 1 on diag(1,−1), so cannot be a character of G; det takes value 0. For Q=B, ε₁ is allowed. BCGP25 line 2502 and lines 2537–2566 support the restriction. The same check was made on §8.3's η. |
| F03, ownership of completed enveloping algebras | Scope, line 11: “the Arens–Michael envelope … are LocallyAnalyticDistributionsPartII §2.5”; parabolic categories and integrable LB representations are imported in the same paragraph | **Repaired.** Opened packages/LocallyAnalyticDistributionsPartII/README.md:248 and packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:717, :760. These own the generic envelope, LB category and parabolic category. The retained λ-algebraic realization and localization are distinct constructions. |
| F04, untyped boundary trace maps | §§5.3–5.4, lines 747–773: `γ₁ : F_{w,*}L → L⊗A^{p−1}`, `δ_D : A → A^{p²}`, and `γ₂ : F_{w,*}(L⊗A^{p−1}) → L` | **Repaired.** The composite is γ₂∘F_*γ₁. At p=3 the intermediate twist is A², the inverse δ twist is A⁻⁸ and the Frobenius-square degree is 81. Function-field trace is zero, whereas the specified dualizing trace sends x²y²dx∧dy to dx∧dy. BCGP21 lines 6188–6216 and 6375–6419 support the repaired types. |

The repair-pattern search covered all uses of contravariant functors, general-parabolic characters, completed enveloping algebras, and constructed trace maps. It found R01 and R02 below; no recurrence of F02 or F03 was found. None of the previous findings was marked not actionable.

## Verified sound

### Coverage and principles

Read all 64 numbered targets in the nine layers, their standing hypotheses, APIs, Checks, Needs lines, examples, dependencies, scope, contracts and references. The 65 Checks blocks include the conventions; every numbered target has at least three listed Checks and a Needs line. The repaired passages were reviewed afresh. For unchanged material, only the preceding review's rows with numerical values were reused; targets that had merely been summarized there were read and tested in this round. R01 records the remaining incomplete defining interface rather than treating a three-Check count as sufficient.

The package extends PadicFamilies and imports the general higher Hida/Coleman theory. No replacement plan for either supplier, route-specific shortcut, computational algorithm, sorry'd data or set_option was found. The separate PEL, split Hilbert and all-prime genus-two hypotheses remain explicit; the Hilbert p>2 hypothesis is not propagated into Layer 9. Canonical and cuspidal coefficients, derived and ordinary fibres, and p-adic versus special-fibre assertions were checked separately. The layers are organized by their mathematical dependencies: continuation needs degree dynamics; doubling uses mixed-level operators; comparisons use analytic families; the final modules use the cohomological filtration and balance. No unforced source-chapter organization was found.

The house shape was compared with TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md and TauCetiRoadmap/SchemeAndStackFoundations/README.md on main. All nine layers have Examples and Dependencies. No job identifiers, pull-request references, machine paths, HTML anchors, algorithmic instructions or other process residue were found in the authored roadmap or Lean docstring. Mathematical labels in backticks were distinguished from claimed Lean identifiers; no undeclared own Lean name was found.

### Seeded source sample

All six manifest works are present in the legal source cache. No manifest entry was changed. There were no author-flagged unverified locators requiring an additional fetch. The following checks used the source text, not only the previous review. Printed pages below refer to the cached version identified in sources.toml.

| Sampled target | Source and exact text locator | Hypotheses and conclusion checked |
| --- | --- | --- |
| 1.1 Morita degrees | BPS §1.5, p. 11, lines 483–518; §3.1, pp. 15–16, lines 686–715 | Degree is that of the Morita-reduced finite-flat subgroup; normalization v(p)=1, bounds and rigid generic-fibre domains are retained. |
| 1.3 Monotonicity and rigidity | BPS Propositions 3.1.1–3.1.3, pp. 15–16, lines 686–715 | Nondecrease; equality produces the integral-degree/BT₁ splitting condition, not arbitrary equality at fractional degrees. |
| 1.4 Uniform progress | BPS Proposition 3.2.1 and Corollary 3.2.2, pp. 16–17, lines 726–745 | Closed bands avoiding integers, uniform positive increment and iteration; no compactness of a half-open band is assumed. |
| 3.5 Klingen Euler characteristic | P20 Theorem 15.2.1, p. 107, lines 4867–4888; proof p. 109, lines 5001–5008 | Absolute irreducibility, localized Hecke family and singular multiplicity balance. Componentwise Euler zero is not individual torsion. |
| 4.1 Mixed loci/Igusa | BCGP21 §4.1, pp. 73–74; warning lines 3742–3746; §4.3.4, pp. 96–97, lines 4673–4703 | Selected multiplicative flags, not p-rank alone; partial torus and affine étale transitions are retained. Construction requested in a declared supplier gap. |
| 4.4 Fixed-weight amplitude | BCGP21 Theorem 4.2.1, p. 77, lines 3752–3762 | Sufficiently large weights, uniformity in tame level, amplitude [0,|I|], endpoint H⁰/H¹ assertions and the stronger l≥3 comparison. |
| 4.6 Trace/Hasse dévissage | BCGP21 §4.6.8 and Proposition 4.6.9, p. 109, lines 5283–5305; Lemmas 4.6.16–17, pp. 112–113, lines 5432–5515; Proposition 4.6.19, pp. 113–114, lines 5520–5575 | Degree and leading factor correct; flat lift and map domains omitted: R01. Source's simultaneous-powers argument requires the retained correction. |
| 5.5 Quadratic relation | BCGP21 Lemma 5.8.1, p. 133, lines 6432–6450 | Weight-two normalized operators satisfy the quadratic relation and companion equivariance. |
| 5.7 No regular simultaneous eigenvector | BCGP21 Theorem 5.8.4, p. 134, lines 6487–6516 | Scalar weight two, both eigenvalues nonzero, actual boundary restriction and Hasse division. Generalized eigenspaces are treated later, not silently substituted here. |
| 6.4 Relative BGG | BCGP21 Propositions 6.4.1–2 and Corollary 6.4.3, pp. 153–154, lines 7373–7421; AIP15 Proposition 7.2.3, p. 34, lines 1511–1521, and p. 35, lines 1533–1540 | Germs of radii, dominant weights and the layer's character component; bounds −3/0; positive reflected twist and gap≥3 for H¹. Printed intertwining direction is corrected with an explicit witness. |
| 7.1a Higher Coleman sheaves | BCGP25 §3.4.7, p. 54, line 2502; Propositions 3.4.12–13, p. 55, lines 2525–2568; Definition 3.4.17 and Propositions 3.4.18–19, p. 56, lines 2583–2599 | λ a Levi character for general Q; exact contravariance; fibre, twisting and central inverse sign. |
| 7.4 Completed-to-coherent comparison | BCGP25 Theorem 4.7.1, p. 99, lines 4431–4456 | The actual completed tower and derived analytic localization; CE compatibility and VB_red, not an arbitrary complex with a stipulated comparison. |
| 8.2 Repeated Sen block | BCGP25 §4.10.8, pp. 107–108, lines 4794–4809 | Repeated scalar, two-step block, square-zero nilpotent part and its induced map; semisimplicity is not assumed from repeated eigenvalues. |
| 9.1 Four modules | BCGP25 §7.3, p. 163, lines 7478–7490 | Integral base ℤ_p followed by coefficient extension; cusp degrees 0,1 and canonical degrees 2,3. Inversion transports the supplier's negative-character convention. |
| 9.5 Integral duality | BCGP25 Theorem 7.3.1(4), p. 164, lines 7516–7518; proof lines 7528–7533 | Complementary Weyl lengths, opposite weight and cusp/canonical interchange; pairing is integral after the stated convention transport. |

### Computed adversarial table

These are separating tests, not substitutes for the cited general proofs. “Pass” means the stated hypotheses and conventions survive the displayed test. Rows inherited from the earlier computed pass have been reevaluated where repairs affect them. R01 and R02 are the only requested package changes.

| Statement | Instances tried | Values computed on both sides / negative control | Result; change |
| --- | --- | --- | --- |
| Conventions | C=ℤ[0]; p=3, rescale 9 by p⁻³; cyclotomic dual | H⁻¹(C[1])=ℤ, H⁰=0; 9/27=1/3 has slope −1=2−3; Sen values +1 and −1 | Pass. |
| 1.1 | Morita multiplicity 2, reduced height 1; multiplicative and étale | Reduced degrees 1 and 0; unreduced multiplicative degree 2, not 1. Fractional example at p=3 has degree 1/4 | Pass; reduction matters. |
| 1.2 | Type C a=1,2 and d=1; type A a=b=d=1 | Exponents a(a+1)/2 are 1,3; dab=1. At p=3 normalization is 1/3,1/27,1/3 | Pass; inverse normalization changes slopes. |
| 1.3 | Generic isomorphism ℤ/p→μ_p over a base containing ζ_p; equality case | Degree 0≤1 strictly; 1=1 at identical multiplicative subgroup. Fractional 1/4 is not an integral equality degree | Pass. |
| 1.4 | Band [1/2,3/4], increment 1/8; already at target | 3·1/8=3/8>1/4, so three steps leave the band; target already reached requires N=0 | Pass. |
| 2.1, 2.5, 2.8 headline | n=3,c=4,s=0,ε=1/8; boundary c=3 | Norm exponent 3−4·7/8=−1/2<0; boundary exponent 3ε=3/8>0. Siegel (6,6) bound 3, (3,3) bound 0 | Pass; strictness retained. |
| 2.2 | Scalar U=3, eigenvalue 3, two steps; zero eigenvalue | α⁻²U²=1; α=0 has no inverse and is excluded by the finite-slope block | Pass. |
| 2.3 | Zero, one, two bad complements; one-dimensional base | Counts 0,1,2 distinguish filtration strata; a finite correspondence over X has dimension 1, whereas X² has dimension 2 | Pass; no joint finite étale map to X² is asserted. |
| 2.4 | Paths of lengths 1,2 | Two labels G,B; four paths GG,GB,BG,BB. First-good groups are GG/GB, BG, with BB remaining bad | Pass. |
| 2.6, 2.7 | Bad action 3 on ℚ₃, good seed 1 | Sums 1,4,13; differences have norms 1/3,1/9; limit −1/2. With fixed lattice loss L, accuracy N−L tends to infinity | Pass. |
| 2.9 headline specialization | Elliptic weight 4 | Bound k−1=3; slope 3 is excluded, slope 0 admitted | Pass; not a replacement for general PEL classicality. |
| 3.1 | p=2; r=3 and r=2 | Four geometric counts 2+4+8+16=30; coefficient factors 1 and p respectively | Pass against normalization. |
| 3.2 | p=2,3 thresholds; square-zero thickening | p(p+1)=6,12; ε≠0 but ε²=0 in k[ε]/ε², so vanishing at reduced points alone would not give scheme-theoretic divisibility | Pass; source's integral divisibility is used. |
| 3.3 deep result | Two-affine special-fibre cover; r=2,3 | Čech degrees 0,1, hence Hⁱ=0 for i>1; r=2 gives endpoint comparison, r=3 full comparison | Pass; no unjustified global integral bound. |
| 3.4 | q=1 formal Satake test, T₀=1,T₁=T₂=4; ℓ=2 | Polynomial (1−X)⁴=1−4X+6X²−4X³+X⁴; raw factors 1/8,1/64 | Pass; q=1 is a polynomial test, not a residue field. |
| 3.5 headline | [Λ→⁰Λ], p=5 and p=2 | Euler rank 1−1=0, while both cohomology ranks are 1; four tame components at p=5; 1/2 unavailable integrally at p=2 | Pass; neither torsion nor an invalid averaging idempotent follows. |
| 4.1 | d=2, |I|=0,1,2 | Torus ranks 4,3,2; a p-rank-one point with a nonmultiplicative selected line fails the flag condition | Pass; locus is more than a rank inequality. |
| 4.2 | Scalar weight (2,2); non-scalar (4,2); C₃ in characteristic 3 | Scalar representation rank 1 versus Sym² rank 3; group algebra invariant norm is nonzero but its augmentation is 3=0 | Pass; no false general line coefficient or averaging. |
| 4.3 | Two commuting scalar factors | p⁻²p⁻¹=p⁻³=p⁻¹p⁻² | Pass for product normalization; geometric commutation uses the correspondences. |
| 4.4 | |I|=0,1,2; l=2 versus 3 | Amplitudes [0,0],[0,1],[0,2]; endpoint comparison at 2 versus quasi-isomorphism at 3 | Pass. |
| 4.5, 4.7 headline | [Λ→ᵀΛ], Λ=ℤ_p[[T]], specialize T=0 | Derived fibre H⁰=H¹=ℤ_p; underived H⁰ before specialization is 0. Empty I amplitude [0,0] | Pass; derived fibres essential. |
| 4.6 | p=3, one/two/no complementary places; flat versus mod-p | Cover degrees 4/16/1, leading factors 3/9/1. 0≡3 mod9 false on ℤ₃, true after reduction to F₃. Empty minimum undefined | R01; add formal integral domains and separate empty case. |
| 4.6 dévissage | k[x,y]/(x²,y²) | Basis 1,x,y,xy gives length 4; simultaneous recursion gives (2−1)²+1=2 | Pass for retained one-exponent route. |
| 5.1 | l_w=1,2,3 | Normalizing exponents min(l+1,3)=2,3,3; formulas pU_Iw+Z, U_Iw+Z, U_Iw+pZ agree at l=2 | Pass. |
| 5.2 | p=3 Frobenius | Ambient degree 27, rank-one divisor degree 9; second iterate degree 81 | Pass. |
| 5.3 repaired definition | p=3,5; two-variable Frobenius; v(Norm)=1 | γ₁ targets LA²,LA⁴; Cartier trace x²y²dx∧dy↦dx∧dy, xy dx∧dy↦0, function trace 0; normalization valuation 3−3=0 | Pass; wrong trace and omitted normalization excluded. |
| 5.4 repaired definition | p=3,5 | δ has exponents 8,24, inverse −8,−24. Composite degrees 9²=81,25²=625. Pushforward δ exponents 24,120 give −26=−2−24 and −124=−4−120 | Pass; wrong direction cannot type the composite. |
| 5.5 | α=2,β=3, T=5,U₂=6 | α²−Tα+U₂=4−10+6=0 | Pass. |
| 5.6, 5.8 headline | T=5,U₂=6,U_Iw=2,Z=3; (1,1) | C(1,1)=(11,−1); Δ=4; ΔC=8=2·4. Bare E²→E, (x,y)↦x+3y has kernel E(−3,1) | Pass; headline injection uses the actual geometric target, not the bare map. |
| 5.7 | αβ=1, nonzero f on divisor; β=0; p=3,5 | U₂f|D=f|D≠0 versus γ₂γ₁f|D=0; β=0 gives 0 on both sides and is excluded. Hasse quotient exponents 3−p=0,−2 | Pass; repaired trace types supply the route. |
| 5.9 | Roots 2,3 in residue characteristic 5; repeated root | Difference −1 invertible; both roots units. Repeated-root difference 0 has no inverse | Pass. |
| 6.1 | Scalar weight (2,2); p=3 modified lattice | Analytic weight 0; valuation inclusions pO⊂p^(1/2)O⊂O are 1≥1/2≥0 | Pass. |
| 6.2 | |I|=0,1,2 | Cube cell counts 1; (2,1); (4,4,1), lengths 0,1,2. Four-open full Čech complex would have length 3 | Pass; cube model supplies the bound. |
| 6.3 | e_n↦3ⁿe_n on c₀(ℚ₃); identity | Tail norms 3⁻ᴺ→0 versus 1. Kernel exponents 1+2+3=6 balance p⁻⁶ | Pass; radius improvement retained. |
| 6.4 | m=4, θe=f, Ue=e, Uf=3⁻⁴f | θUe=f=3⁴Uθe; target slope −4, twisted slope 0; reflected bound −3+4=1, not −7 | Pass; corrected direction agrees with AIP15. |
| 6.5 | P(X)=(X+1)², U=−1 | Q=−X−2, UQ(U)=1; omitting the linear coefficient gives 0 | Pass. |
| 6.6, 6.7 headline | [E→ᵗE], t=0,1; comparison defects a,b≥0 | Dimensions (1,1) and (0,0), both Euler 0. χ(source)−χ(target)=−a−b=0 forces a=b=0 | Pass; no individual-rank constancy claim. |
| 7.1 imported envelope | 𝔤=0, abelian E·x, quotient E[x]/(x−a) | Envelope E; norm of xⁿ=rⁿ; completed evaluation quotient E | Pass; matches earlier owner's object. |
| 7.1 and 7.1a repaired Q-domain | GL₂, Q=G, λ=ε₁ or det; Q=B | ε₁([e₁₂,e₂₁])=1 versus scalar commutator 0; det value 0. Borel ε₁(diag(p,1))=p | Pass; illegal general-Q character excluded. |
| 7.1a twist and centre | ν=(1,1), z=I; zero/finite-dimensional coefficient | ν(z)=2, horizontal action −2; ε₁ twist multiplies by p. Zero fibre 0; rank-d finite coefficient fibre dimension d | Pass; no arbitrary sign or invisible twist. |
| 7.1b repaired degree formula | V[1], V[−1], zero; a=−1,b=0,w=1 on modular curve | H¹F(V[1])=F(V), F(H¹V[1])=0; H⁻¹F(V[−1])=F(V); zero maps to 0; cusp interval [0,1] | Pass for formulas; R02 corrects which functor reverses arrows. |
| 7.1b and 7.5 indexing | gl₂ Verma with root pairing −1; pairing 2 control | e v_k=−k²v_(k−1): H₀=0,H₁=𝔲⊗Ev₀ in degree −1. At pairing 2, e v₃=0 and [v₂] survives H₀ | Pass; retained nonintegral/nonpositive hypothesis matters. |
| 7.2 | GL₂ standard module, diag(2,1); trivial coefficient | Homology characters 1,4 versus cohomology 2,1/2. Trivial CE homology dimensions 1,1 in degrees 0,−1 | Pass; homology is not exchanged for cohomology. |
| 7.3 | Rank-two coefficient W and zero | Hom(W∨,E) has dimension 2; zero gives dimension 0; connecting morphism of a split short exact sequence is 0 | Pass for variance and additivity. |
| 7.4 | Trivial GL₂ CE coefficient | CE homology in degrees 0,−1 becomes localization in degrees 0,1; both have rank 1. Dropping the derived contribution loses one rank | Pass; VB_red comparison retained. |
| 7.5, 7.6 | p+q=1; genus two (p,q)=(0,3),(1,2) | Pairs (0,1),(1,0); coherent degrees 0,1 from 2p+q−3 | Pass with repaired reversal. |
| 7.7 | Boundary Levi contribution χ₁⊕χ₂⊕ρ₂ | Spin dimensions 1+1+2=4, a proper decomposition; irreducible residual four-dimensional localization kills such contribution | Pass; boundary theorem has its actual non-Eisenstein hypothesis. |
| 7.8 headline | λ=(1,1;2), then central coordinate −2 | Scalars −2,−2,−3,−3 sum −10; then 0,0,−1,−1 sum −2 | Pass; filtration retained despite coincident eigenvalues. |
| 8.1, 8.2 | Singular κ=(1,1); N=[[0,1],[0,0]] | Serre dual (2,2), degrees 2/3 dual to 1/0; N²=0 but rank N=1, versus rank 0 for semisimple repeated block | Pass; square-zero does not imply zero. |
| 8.3 repaired η; constrained localization | η=(0,−1;1), λ=(1,1;w), w even; f=1/(1+x) | Levi root pairings 0 and −1; λ−η=(1,2;w−1), parity 3≡w−1. ((x+1)∂+1)f=0 | Pass; character and constrained-fibre restrictions retained. |
| 8.4 deep comparison | c=3 over ℚ₃, rank-one N; c=0 | ker(cN)=ker N=Ee₁, image Ee₁; c=0 kernel dimension 2 instead of 1 | Pass; scalar nonzero required. |
| 8.5, 8.6 headline | Four pieces each ≤n; semisimple/Jordan ordinary block | Sum 4n forces each n; nilpotent rank 0 versus 1 distinguishes the two blocks | Pass in the source's ordered ordinary setting, not a claim about arbitrary Hodge–Tate representations. |
| 9.1 | Order-three character at p=7; complementary support degrees | χ(t)=ζ, χ⁻¹(t)=ζ²≠ζ, inversion twice χ; cusp 0,1 versus canonical 2,3 | Pass. |
| 9.2 headline | Arbitrary amplitude-[0,1] complex [E→⁰E] | H⁰ and H¹ both dimension 1; amplitude alone does not give concentration. Actual localized support vanishing removes the unwanted degree | Pass; no arbitrary-complex stand-in. |
| 9.3, 9.4 headline specializations | ν=(0,−2), four Weyl representatives | Weights (5,3),(5,1),(2,−2),(0,−2), support degrees 0,1,2,3; χχ⁻¹=1 | Pass; dominance and twist kept. |
| 9.5 headline duality | Length pairs 0/3,1/2; κ=(5,3) | 0+3=1+2=3; dual weight (3−3,3−5)=(0,−2) | Pass; cusp/canonical and inversion agree. |
| 9.6 headline group-ring projectivity | Regular F₃[C₃] | Invariants and coinvariants dimensions 1,1; norm [1]↦1+g+g² nonzero; augmentation of norm 3=0 | Pass; no division by group order. |
| 9.7 headline central character | p=2,r=7; p=3,r=7 or 11 | (7−1)/2=3 odd; r=7≡1 mod3 fails odd-prime restriction; (11−1)/2=5 prime to3 | Pass; cases separated. |

### Pinned library and headline audit

Opened the following definitions at the pins rather than using a newer library. Line numbers denote the declaration or its defining body.

| Pinned file and line | Declaration / what it actually supplies |
| --- | --- |
| Mathlib/Algebra/Module/LinearMap/End.lean:33 | Module.End: linear endomorphisms; no topology or finiteness condition. |
| Mathlib/LinearAlgebra/Prod.lean:95, :199 | LinearMap.prod and LinearMap.coprod: native linear maps for a product/sum, sufficient for the elementary companion formula. |
| Mathlib/LinearAlgebra/Eigenspace/Basic.lean:72 | Module.End.genEigenspace: kernels of powers and their supremum; not a geometric finite-slope projector. |
| Mathlib/Algebra/Polynomial/AlgebraMap.lean:259 | Polynomial.aeval: polynomial evaluation in an algebra. |
| Mathlib/Algebra/Module/Projective.lean:71 | Module.Projective: splitting property; it does not itself assert finite generation. |
| Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87 | DerivedCategory: generic abelian-category derived carrier, not the required Shimura complexes. |
| Mathlib/RingTheory/Artinian/Module.lean:307 | LinearMap.eventually_isCompl_ker_pow_range_pow: Fitting decomposition under Artinian and Noetherian hypotheses. |
| TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195, hypotheses :140–146 | TauCeti.VermaModule is the quotient by vermaIdeal; finite-dimensional characteristic-zero IsKilling setting with a splitting Cartan. It does not supply reductive-centre BGG localization. |

Object searches at both pins for Igusa, Shimura, Klingen, higher Coleman, Arens–Michael and Iwahori found no missing native geometric headline carriers. Finite Coxeter/Iwahori terminology and bibliographic Shimura references are not such carriers. Generic derived categories, scalar endomorphisms and Verma modules cannot replace the spaces or functors in these headline statements.

| README headline | Suggested.lean disposition, checked against the pins |
| --- | --- |
| PEL small-slope classicality, §§2.8–2.9 | Named in docstring; missing PEL moduli, rigid spaces with ω^κ and normalized U correspondences. |
| Klingen Euler characteristic, §3.5, and deep amplitude §3.3 | Named; missing Siegel integral geometry, coherent coefficient complexes and Klingen family. |
| Hilbert derived ordinary control, §4.7 | Named; missing mixed Hilbert–Siegel moduli, partial Igusa torsors and coefficients. |
| Weight-two doubling injection, §5.8 | Named; missing actual geometric source and target. The abstract companion identity cannot express injectivity. |
| One-place rational comparison, §6.7 | Named; missing analytic coefficient and Hida complexes. |
| Four-piece filtration, §7.8, with §§7.4–7.7 | Named; missing derived completed tower, localization and higher Coleman functors. |
| De Rham ordinary classicality, §8.6, with §8.4 | Named; missing Sen action on this completed tower and supported coherent comparison. |
| Four projective Hida modules, §§9.2–9.7 | Named; missing the universal supported Iwasawa complexes and their geometry. |

Suggested.lean contains zero declarations: zero sorried theorems, zero definitions, zero instances. Thus the requested one-tactic probe and `#check @name` comparison have empty domains, not an untested sample. The elementary companion operator identity is correctly absent rather than padding. No headline is forced through an arbitrary Prop field or an unrelated module.

Ran `lake env lean` on the absolute package Suggested.lean path from the pinned content checkout: exit 0, no output, no warnings. The only import is `import Mathlib`; no TauCeti module build was needed. No Lean override or unapproved build command was used.

### Supplier resolution, ownership and order

Read the board package index before resolving the three leads in citations.md. HigherHidaAndColemanTheory §9.6, LocallyAnalyticDistributionsPartII §2.5 and LocallyAnalyticRepresentationsOfLocalGroups §4.2 all exist in earlier board packages; they are not missing suppliers. The generic BGG normalization discrepancy is explicitly a declared gap, not silently treated as supplied.

Every supplier citation and Needs line was resolved against main, the supplied open-head index, or the board packages. The compact register below records the sections actually opened; it is not a list inferred from names alone. Main files use TauCetiRoadmap paths; open-head references were read with the roadmap service. All cited section ranges were expanded when checking them.

| Supplier | Resolved sections / ownership check |
| --- | --- |
| HigherHidaAndColemanTheory | §§1.1–1.2,2.3,3.7,4.5–4.6,4.8–4.9,5.1–5.6,5.8,6.1–6.3,6.6,8.3,8.5,9.1,9.4–9.8; general theory imported. Klingen normalization covered by named gap. |
| PadicFamilies | §§0a.22,0a.25,2a.15–2a.16; projectors and compact complex slope charts. |
| PELModuli | §§M0.21,M0.27,M1.13,M2.8–M2.10,M4.5–M4.6,M5.1,M5.4; specialized complement, Hilbert–Siegel and isogeny inputs declared as gaps. |
| HodgeTateAndCanonicalSubgroups | §§0.6–0.8,0.14–0.16,0.28,3.6,5.1,5.5,5.8; mixed partial Igusa/frame specialization remains a gap. |
| AdicSpacesPartIII | §§R2.10,R3.4,R3.6,R3.7; bounded-section gluing is separately contracted. |
| ShimuraCompactifications | §§4.1,4.3,4.10,6.12,6.16–6.17,7.16,7.19–7.22,7.25–7.26; specialized regularity, cube cover and tame stabilizers are contracted. |
| AutomorphicBundles | §§3.3,5.3–5.4,11.16,12.1,12.11,12.15; coefficient functors, traces, normalized correspondences. |
| AutomorphicBundlesPartII | §§5.1–5.2; relative vanishing under the formal chart criterion is imported, not requested again in the Hasse gap. |
| SchemeAndStackFoundations | §§2.19–2.20; generic duality exists, specialized non-finite-flat lci fundamental class contracted. |
| SmoothRepresentationsOfLocalGroups; IntegralHeckeAndGaloisDeterminants | §§SR.1.4,SR.4.5; §§2.3,3a.2: Satake/Hecke normalizations and spin polynomial. |
| AutomorphicFormsOnReductiveGroups; EndoscopicTransferAndUnitaryTraceComparison | §§6.4–6.6; §11.1: classifications/transfer; singular balance and weight-two stability remain precise extra contracts. |
| CompletedCohomologyPartII | §§2.2,6.7,7.1,7.8,F.4; derived tower and boundary implication. Specific genus-two vanishing is left to the consumer and stays here. |
| PerfectoidShimuraVarieties | §§3.6,6.3; Hodge–Tate geometry imported, solid VB/Sen compatibility contracted. |
| PadicHodgeTheory; FiniteFlatGroupsAndIntegralPadicHodgeTheory | §4.4; §R07.P7.2: arithmetic Sen operator and cyclotomic value +1, consistently transported from Hodge–Tate sign −1. |
| ArithmeticGaloisRepresentations; AutomorphicGaloisRepresentations | §§5.11,7.6; §1.1: multiplicity input and existing Eichler–Shimura framework; genus-two extension is an explicit gap. |
| PadicMeasuresIwasawaAlgebras; DeformationAndDerivedPatchingAlgebra | §§1.1,1.7; §§5.9,7.1,7.3: Iwasawa algebra, derived residue/amplitude and Sylow projectivity. |
| LieHighestWeight | Layer 3, TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:405 onward; native enveloping/Verma/irreducible framework. Reductive extension is cited separately. |
| LocallyAnalyticRepresentationsOfLocalGroups | §§3.5,3.10,4.1,4.2,4.6: λ-smooth targets, LB representations, reductive highest weights, parabolic categories, Kostant homology. |
| LocallyAnalyticDistributions; LocallyAnalyticDistributionsPartII; PadicLocalLanglandsForGL2Qp | §§0.0,0.3,4.16; §2.5; §0.1: analytic categories and compact blocks; specific envelope; general Fréchet–Stein framework. |

The object audit used `roadmaps grep` at the indexed heads and on main, direct pinned-library searches and the board packages. The closest open scopes were read, not merely scored: GSp4NonregularModularityLifting (#1817), AutomorphicBundlesPartII (#1823), OverconvergentAutomorphicForms (#1422), AlgebraicModularFormsAndSerreWeightsPartII (#1822), PerfectoidShimuraVarieties (#1085). In particular TauCetiRoadmap/GSp4NonregularModularityLifting/README.md §10.2, around lines 1391–1419 at #1817, imports this roadmap's F8 modules before applying them; it does not construct a second owner. Its scope imports E6/S7/F8. The retained former-numbering table resolves those citations. Generic coefficient and overconvergent-form theories remain with their earlier suppliers; the integral singular, Hilbert mixed-level and BGG-coefficient comparisons are the variants owned here.

The supplied overlaps report has no conflicting head changing this roadmap, no dropped cited id, and no cited id belonging only to an unacknowledged open revision. No additional overlap finding was established. No fully qualified declaration collision is possible in the empty Suggested.lean.

All 15 gap slugs match design/plan.json and the README contracts, with named suppliers: pel-iwahori-complements; hilbert-siegel-models; kodaira-spencer-isogeny; hilbert-siegel-partial-igusa; hilbert-siegel-frame-torsor; bounded-section-gluing; partial-hasse-regularity; mixed-cube-cover; tame-boundary-stabilizers; lci-fundamental-class; gsp4-singular-balance; gsp4-weight-two-stability; solid-vb-sen; gsp4-eichler-shimura; klingen-bgg-normalization. Their hypotheses and intended maps are concrete. The multiple compatibility clauses specify the API of each missing construction, rather than unrelated work. No supplier is `none`; no existing generic theorem is requested again in place of the specialized missing input. Acceptance after repair would remain conditional on these contracts. R01 concerns this roadmap's own trace construction, not absence of a declared supplier contract.

Prescribed dependency check, exit 0:

```text
depcheck: 236 roadmaps, 2158 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The input order was not edited.

## Not verifiable

- No sampled source was unavailable: all 15 sampled targets and the repaired source passages were readable in the legal cache. No new reference request or waiver is needed.
- The declared supplier gaps are contracts, not completed implementations. Their future proofs were not certified; their precision, ownership, scope and declaration sites were checked.
- The geometric headline theorems cannot currently be stated on their actual carriers at the pins. The successful elaboration checks the deliberately empty acceptance file's syntax/imports, not their truth. The source and numerical checks above provide the mathematical review evidence.
- Ownership was checked against the supplied main/open-head index and board packages, not against unlisted or future branches. Numerical witnesses do not constitute formal proofs of the general geometric results.

## Source issues

The following records source defects encountered in the sampled or repaired passages, independently of the two package findings. Earlier errata outside this round's source sample remain recorded in the previous review; no claim of a fresh reading of every such passage is made here.

- **Misprint** in BCGP21 at the paragraph after Proposition 5.7.4, printed page 130: the source labels the positive-power map A→F²*A as δ⁻¹; it should label it δ, whose inverse has exponent 1−p²; affects nothing.
- **Misprint** in BCGP25 at Definition 4.6.35 and the following paragraph, printed page 88: the source gives F(HⁱM) for cohomology of the exact contravariant realization; it should give F(H⁻ⁱM) with reversed cochain degrees; affects a stated result.
- **Misprint** in BCGP21 at §6.4, printed page 154: the source's intertwining identity raises the standard slope; it should read θU_source=p^mU_targetθ, agreeing with its subsequent positive twist; affects a stated result.
- **Misprint** in P20 at Proposition 15.2.4.1, printed page 109: the source requires a positive first singular coordinate; it should require a negative coordinate since k=−λ₁−1≥0; affects a stated result.
- **Gap** in BCGP21 at Proposition 4.6.19, printed pages 113–114: the source uses simultaneous powers in a several-parameter short exact sequence; it should vary one exponent at a time; two parameters at exponent two give lengths four versus two; affects the proof.
- **Misprint** in BCGP25 at Remark 4.10.7, printed page 107: the source gives the degree-zero piece weight (1,1;−w); it should give (2,2;−w), matching Serre duality and the following subsection; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e082073b801d89e38b208416c4795a9200cd913a", "job": "REV-PKG-PadicFamiliesPartII~4", "model": "gpt-6-astra", "worker": "chris-8"} -->
