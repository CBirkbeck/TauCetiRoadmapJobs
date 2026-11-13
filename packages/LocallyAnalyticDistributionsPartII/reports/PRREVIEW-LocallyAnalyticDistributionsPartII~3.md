# Review of LocallyAnalyticDistributionsPartII (pull request #2283 at 0411614)

**Verdict:** needs changes

## R01 (P2) — the ambient field convention excludes promised coefficients

**Location:** `TauCetiRoadmap/LocallyAnalyticDistributionsPartII/README.md:32`: “ℚ_p ⊆ L ⊆ K ⊆ ℂ_p”.
**Claim:** Requiring K to embed in ℂ_p restricts §§3.2–3.6 and 4.13 below their stated scope of arbitrary complete discretely valued extensions of ℚ_p.
**Witness:** Let C be a strict Cohen ring with residue field 𝔽₃(t), K = Frac(C). Then v(3) = 1, but no valued embedding K → ℂ₃ exists: 𝔽₃(t) cannot embed in ℂ₃'s residue field 𝔽̄₃.
**Repair:** Replace the first field sentence by “p is prime; K is any complete discretely valued extension of ℚ_p, with the extended absolute value normalised by |p| = p⁻¹. When L is used, ℚ_p ⊆ L ⊆ K and L/ℚ_p is finite.” Keep §1.4's broader exception. Add the Cohen-ring example to §3.6: K′ = K, e = 1, and its coefficient comparison is the identity. AW14 line 635 explicitly includes arbitrary complete mixed-characteristic discrete valuation fields.

## R02 (P2) — the general envelope is restricted to algebraic Lie algebras

**Location:** `TauCetiRoadmap/LocallyAnalyticDistributionsPartII/README.md:310`: “g the Lie algebra of a linear algebraic group over o_E”.
**Claim:** The envelope, its Fréchet–Stein presentation and completion theory unnecessarily exclude finite-dimensional E-Lie algebras that are not algebraic, although the cited source constructs them generally.
**Witness:** SCHM13 lines 196–226, §3.2, pp. 5–6, take an arbitrary finite-dimensional Lie algebra and prove Propositions 3.2.1 and 3.2.3 without an algebraic-group hypothesis.
**Repair:** Start §2.5 with “Let E/ℚ_p be finite and g any finite-dimensional E-Lie algebra. Choose a bracket-stable o_E-lattice g₀ and an o_E-basis.” State the algebraic-group hypothesis separately for the germ and congruence-subgroup comparisons. Keep the general envelope, rational-radius stages and exact completion at this generality. Add the nonalgebraic solvable example [x,y] = y, [x,z] = √10·z, [y,z] = 0 over ℚ₃: its integral structure constants give the same submultiplicative norms and completed lattices.

## R03 (P3) — the proposed Banach negative control is not Banach

**Location:** `TauCetiRoadmap/LocallyAnalyticDistributionsPartII/README.md:212`: “The infinite direct sum of countably many copies of K … a definition that allowed arbitrary Banach A_n-modules in a coherent sheaf would admit it.”
**Claim:** This does not distinguish the proposed wrong definition: the countably infinite algebraic direct sum cannot carry a Banach-space norm over K.
**Witness:** For K = ℚ₃, Σ_{i=0}^N 3ⁱe_i has successive tail norms 3⁻⁽ᴺ⁺¹⁾ but no finite-support limit. More generally, Baire's theorem excludes a Banach space of countably infinite Hamel dimension.
**Repair:** Replace that sentence by “The Banach space c₀(ℕ,K), with the supremum norm, is not coadmissible over A = K because it is not finite-dimensional. Allowing arbitrary Banach stages would admit the constant system M_n = c₀(ℕ,K) with identity transitions.” Over ℚ₃ the displayed Cauchy sequence now converges to (3ⁱ), while the independent vectors e_i still exclude finite generation.

## R04 (P3) — the completed-enveloping locator omits the corollary's page

**Location:** `TauCetiRoadmap/LocallyAnalyticDistributionsPartII/README.md:255`: “§3.7 Definition, Lemma and Corollary, pp. 14–16”.
**Claim:** The cited §3.7 Corollary is outside that page interval.
**Witness:** AW13 line 763 starts printed p. 17; lines 767–769 state the §3.7 Corollary identifying Gr(Âₙ,K) with gr(A)/πgr(A).
**Repair:** Change “pp. 14–16” to “pp. 14–17” in this citation; retain the separate §10.4, p. 70 locator.

## Deferred findings

- D01 — stands.

## Previous findings

- R01 — not repaired: deferred (D01). The passage “Construct the general Fréchet–Stein and coadmissible-system interface” remains in `TauCetiRoadmap/RelativeFarguesFontainePartII/README.md:1763` at #1825.

## Verified sound

| Statement | Instances tried | Computed value | Comparison value | Result / change |
| --- | --- | --- | --- | --- |
| Convention 1; §§3.2–3.6 coefficients | C a Cohen ring of 𝔽₃(t) | v(3) = 1; residue transcendence degree 1 | Any valued subfield of ℂ₃ has residue algebraic over 𝔽₃ | R01 |
| Convention 2; §0.1 valuation | G = ℤ₃, x = 3ⁿ, n = 0,1,2 | ω(x) = 1,2,3 | ω(3x) = 2,3,4 | Agrees |
| §0.1 saturation | ℤ₃ with ω(x) = 2 + v₃(x) | ω(1) = 2 > 3/2 | 1 has no cube root in additive ℤ₃ | Wrong valuation excluded |
| §0.1 lattice and powerfulness | G₁ at p = 3 | [3e,3f] = 9h | 3L_G contains 9h; [e,f] = h after rescaling | Agrees |
| §0.1 lower powers | n = 0,1,2 | L_G, 3L_G, 9L_G | Log(G), Log(G³), Log(G⁹) | Agrees |
| §0.1 functoriality and analytic coordinates | G = ℤ₃; multiplication by 3 | Log(3x) = 3x; derivative 3 | Lie map multiplication by 3 | Agrees |
| §0.1 zero rank | G = 1 | L_G = 0; g_R = 0 | rank 0; empty ordered basis | Agrees |
| §0.2 firstCongruenceSL2 | p = 3,5; reduction | index 3(9−1) = 24; 5(25−1) = 120 | #SL₂(𝔽₃) = 24; #SL₂(𝔽₅) = 120 | Agrees; FU24 line 123 |
| §0.2 firstCongruenceProduct | m = 0,1,2; p = 3 | dimensions 0,3,6; indices 1,24,576 | product dimensions 3m; indices 24ᵐ | Agrees |
| §0.2 odd-prime hypothesis | p = 2 | −I reduces to I; (−I)² = I | nonidentity torsion in first kernel | Uniformity assertion excludes p = 2 |
| §0.3 Lie lattice | p = 3; e,f,h | [h,e] = 2e; [h,f] = −2f; [e,f] = h | [3e,3f] = 9h in 3sl₂ | Agrees; FU24 Lemma 5.6, p. 19 |
| §0.3 exponential generators | exp(3e), exp(3f) | I+3e, I+3f; determinants 1 | logarithms 3e,3f; Lie rank 3 with 3h | Agrees |
| Convention 3; §1.1 differentiation | f(t) = t²+3t | positive derivative at 0 = 3 | negative derivative = −3 | Sign distinguished |
| §1.1 PBW pairing | x² against t² and t³ | 2 and 0 | 2!δ₂₂ = 2; 2!δ₂₃ = 0 | Agrees |
| §1.1 convolution and conjugation | SL₂; e,f,h | ẽ∗f̃−f̃∗ẽ = h̃ | differentiated bracket h | Agrees |
| §1.1 Dirac multiplication | S₃; g = (12), h = (23) | δ_g∗δ_h = δ_(123) | reverse order gives δ_(132) | Noncommutative order distinguished |
| §1.1 distributions versus measures | log(1+T), degrees 3ʲ | coefficient norms 3ʲ, unbounded | weighted norms 3ʲr^(3ʲ) → 0 for r < 1 | Distribution, not bounded measure |
| §1.2 left/right cosets | S₃, H = ⟨(12)⟩ | H(23) = H(123); proposed left span dimension 4 | inverse representatives give dimension 6 = #S₃ | Agrees |
| §1.2 normal crossed product | C₄ over C₂, representative g | δ_g² = δ_(g²) in coefficient algebra | cocycle g², not 1 | Twisting retained |
| §1.3 centrality | connected torus | Ad(g)x = x | δ_gx̃δ_g⁻¹ = x̃ | Agrees; ST02 Proposition 3.7, p. 16 |
| §1.3 connectedness | O₂, reflection s | Ad(s)x = −x | centrality would require x = −x | Disconnected counterexample excluded |
| §1.4 coherent systems | A_n = K, M_n = K² | Γ(M_n) = K²; K⊗_K K² = K² | stage maps identity; higher limits 0 | Agrees |
| §1.4 finite-generation Check | M = ⊕ℕ ℚ₃ | partial sums Σ_{i≤N}3ⁱe_i Cauchy, no limit | c₀ contains limit (3ⁱ), remains infinite-dimensional | R03 |
| §1.4 flat transitions | A = K[ε]/ε² → K | K⊗_A(Aε → A) sends 1 to 0 | source K ≠ 0; tensor map not injective | Wrong presentation excluded |
| §1.4 zero stages and base change | disc; a = √3 | M₁ = 0, M₂ = K; radius ratio 3⁻¹/3⁻¹ᐟ² = 3⁻¹ᐟ² | A₁⊗_(A₂)M₂ = 0 | Agrees |
| §1.4 boundary support | disc; a = 1 | T−1 unit at every radius < 1 | A/(T−1) = 0 | Agrees |
| §1.4 kernels, quotients, strictness | K² → K, (x,y) ↦ x | kernel K; image K; cokernel 0 | finite-dimensional closed subspaces | Agrees |
| §1.4 closed ideals/change of algebra | A = K×K, I = 0×K; B = K | A/I = K; B-module dimension d | A-module finite iff d finite | Both directions agree |
| §1.5 radius completion | p = 3, r = 3⁻¹ᐟ³; a_(3j) = 3⁻ʲ | weighted terms all 1 | completion requires limit 0 | Bounded wrong carrier excluded |
| §1.5 multiplicative norm | abelian rank 1, T³/3 | norm 3r³; at r = 3⁻¹ᐟ³, value 1 | norm(T)³/norm(3) = 1 | Agrees |
| §1.5 graded domain and opposite | G = ℤ₃; T and inversion | leading symbol T; inverse coordinate −T+T²−… | linear coefficient −1 has norm 1 | Norm and opposite comparison agree |
| §2.1 rank-zero and rank-one completion | h = 0 or R·x abelian | K or K⟨x⟩ | null PBW coefficients; polynomial subalgebra dense | Agrees |
| §2.1 PBW and noetherian grading | h = sl₂(R), degree 2 | six ordered quadratic monomials | dim Sym²(R³) = 6 | Agrees; locator R04 |
| §2.1 lattice dependence | Σ3ʲxʲ | coefficients 3ʲ → 0 in x basis | coefficients all 1 in (3x) basis | Only first completion contains series |
| §2.1 universal extension | x ↦ 3 in B = ℤ₃ | Σ3ʲxʲ ↦ Σ9ʲ = −1/8 | (1−3x)⁻¹ ↦ (1−9)⁻¹ = −1/8 | Agrees |
| §2.1 coefficient deformation | π² = 3; n = 1 | 3h = π²h | deformation index en = 2, not 1 | Agrees |
| §2.2 closure of U | G = ℤ₃, r = 3⁻¹ᐟ³ | norm(log(1+T)) = 1 | δ₁ outside closure; δ₃ = exp(3log(1+T)) inside | Closure distinguished |
| §2.2 small radius | r = 1/3 | norm(log(1+T)) = 1/3 | exponential converges; U_r = D_r | Agrees |
| §2.3 Frommer maximum | p = 3, r = 3⁻¹ᐟ³; powers 1,3,9 | values 3⁻¹ᐟ³,1,1/3 | maximum at exponent 3; ℓ = 3 | Agrees; KOH07 lines 665–699 |
| §2.3 compatible subgroup | dimensions d = 2, j = 1; ℓ₁ = ℓ₂ = 3 | D(G) rank 9; supported-H part rank 3 over U(g) | D(H) rank 3 over U(h), different coefficient algebra | Transverse derivatives retained |
| §2.4 special radii | p = 3, n = 1,2 | norm(log g) = 1,3 | 3^(n−1) = 1,3 | Agrees |
| §2.4 crossed-product rank | G₁, p = 3, n = 1 | 27 PBW residue monomials | [G₁:G₁³] = 3³ = 27 | Agrees |
| §2.4 exponential range | n = 1 | norm(3log g) = 1/3 | 1/3 < 3⁻¹ᐟ² | Exponential converges |
| §2.5 generality | [x,y]=y, [x,z]=αz, α=√10 in ℚ₃ | norm(1)=norm(α)=1; ad(x) eigenvalues 0,1,α | α irrational over ℚ; torus weights cannot have this ratio in rank 1 | R02 |
| §2.5 submultiplicativity | preceding integral basis, r ≥ 1 | norm([x,z]) = r | norm(x)norm(z) = r² ≥ r | General lattice works |
| §2.5 envelope versus one completion | g = E·x | entire coefficients obey norm(a_n)rⁿ → 0 for every r | exp(x) has radius p⁻¹ᐟ⁽ᵖ⁻¹⁾ < 1 | exp excluded |
| §2.5 cofinal rational stages | E = ℚ₃, j = 0,1,2 | radii 1,3,9; lattices g₀,3g₀,9g₀ | norm(3ʲx) at radius 3ʲ equals 1 | Agrees |
| §2.5 irrational-radius control | p = 3; r = 2 | log₃2 irrational | finite extensions have radii 3^(a/e) | Unsupported stage excluded from presentation |
| §2.5 germs and factorials | x² on T² | pairing 2 | coefficient-functional normalization would give 1 | Correct normalization |
| §2.5 completion of modules | E[x]/(x−a); g = 0 | completed quotient E for every a; envelope E at rank 0 | evaluation and identity completion | Agrees |
| §2.5 left-module transitions | A = M₂(K), left column module K² | A⊗_A K² ≅ K² | K²⊗_A A requires an additional right action | Sidedness correct |
| §3.1 trivial microlocal set | T = {1}; ℤ_(3) | completion ℤ₃ | identity graded localization, completed topology | Agrees |
| §3.1 nontrivial microlocalization | ℤ₃[[b]], invert gr(3) | b/3 becomes norm-1 variable | ℚ₃⟨b/3⟩ | Agrees |
| §3.1 regularity and strictness | Laurent x, degree(x)=degree(x⁻¹)=1 | deg(x·x⁻¹)=0 < 2 | after inverting gr(x), degree(x⁻¹)=−1 | Nonregular filtration cannot preserve strictness |
| §3.1 torsion kernel | k[x,y]/xy, invert x | y maps to 0; xy = 0 | x-torsion detected | Agrees |
| §3.1 flatness and zero module | identity on M₂(ℚ₃); M = 0 | extension sends injections to themselves; Q⊗0 = 0 | kernel 0; identity functor | Noncommutative/zero controls agree |
| §3.2 ordered series filtration | 3+b² in ℤ₃[[b]] | degree min(1,2) = 1; symbol gr(3) | coefficient valuation plus group degree | Agrees |
| §3.2 noncommutative graded ring | [3e,3f] = 9h | degree-two bracket contributes t²h | U(t·sl₂(k)[t]) retains bracket | Commutative-polynomial replacement excluded |
| §3.2 infinite coefficient extension | R = W(𝔽̄₃) | coefficients with infinitely many linearly independent residues | an algebraic tensor sum spans finitely many coefficient directions | Completed, not algebraic, comparison required |
| §3.3 exact Ore set | G = 1, R = ℤ₃ | 1,3 ∈ S₀; 2 ∉ S₀ | leading coefficients 1,1,2 | Exact-symbol convention agrees |
| §3.3 ramification control | π² = 3 | 0 = 3−3 ∈ 3+m² | Ore nonzerodivisor set must omit 0 | Unramified hypothesis necessary |
| §3.4 microlocal comparison | rank 1, g = exp(3u) | b ↦ 3u + 9u²/2 + … | gr(b) ↦ gr(3)u | Scaling agrees; AW13 lines 3235–3250 |
| §3.4 flatness and torsion | R[[G]]/(3) | localized module 0 | 3 becomes a unit | Agrees |
| §3.4 zero group | G = 1 | Q_gr(3)(R) = K | Û(0)_K = K | Identity comparison |
| §3.5 isometric Banach comparison | p = 3, b/3 | image u + 3u²/2 + … has norm 1 | norm(b)/norm(3) = 1 | Agrees; AW14 lines 638–666 |
| §3.5 convergence condition | coefficients a_j = 3⁻ʲ | weighted coefficients all 1 | not null, hence outside both completed carriers | Corrects source's bounded carrier |
| §3.6 ramified extension | K = ℚ₃(√3), K′ = ℚ₃ | R = R′ ⊕ πR′; e = 2 | base change rank 2 | Agrees; AW14 §5.2, pp. 14–15 |
| §3.6 independence | two coefficient comparisons | both send every r·g to r·exp(log g) | equality on dense R[G] | Same continuous map |
| §3.6 p versus π scaling | π² = 3 | norm(b/3) = 1 | norm(b/π) = 3⁻¹ᐟ² | Wrong microlocal normalization distinguished |
| §3.7 module localization | M = K or 0, trivial action | localized modules K or 0 | b acts by 0 in each | Agrees |
| §3.7 Artin torsion | ℚ₃[C₃] | dimension 3 before localization; 1 after | trivial summand 1; cyclotomic summand 2 killed | Distinct from distribution extension |
| §3.8 semisimplicity headline | G₁, M = Sym²(ℚ₃²) ⊕ ℚ₃ | dimensions 3+1; invariant complement dimensions 1 and 3 | direct sum of two simple summands | Agrees; AW13 lines 3704–3717 |
| §3.8 semisimplicity zero case | M = 0; m = 0 | only zero submodule; scalar algebra ℚ₃ when m=0 | complements 0; vector-space semisimplicity | Agrees |
| §3.8 semisimple-group hypothesis | G = ℤ₃; generator I+E₁₂ | invariant line Ke₁ has no invariant complement | Jordan extension is nonsplit | Outside semisimple congruence hypothesis |
| §3.8 full Lie-module equivalence | PGL₃ at p = 3; q=diag(1,1,−2)/3 | determinant(q)=−2/27, nonintegral | determinant of lattice-preserving operator integral | Simply connected hypothesis retained |
| §3.8 shrinking and Artin/Lie distinction | same q; cyclotomic C₃-module | 3q integral; Artin dimension 2 | deep congruence fixes Artin module; Sym² remains nontrivial | Agrees |
| §3.9 stable-lattice representation | standard SL₂ module | exp(3e) acts by [[1,3],[0,1]] | exponential of 3E₁₂ is I+3E₁₂ | Agrees; AW13 §9.2, p. 61 |
| §3.9 lattice independence and endomorphisms | lattices W₀ and 3W₀ | same K-action; commuting with e,f,h gives scalar matrices | End = K, dimension 1 | Agrees |
| §3.10 isotypic comparison headline | M = W⊕K, W = Sym² | M_W = W, dimension 3 | localized W-quotient dimension 3 | Agrees |
| §3.10 Artin exclusion | nontrivial cyclotomic C₃-module, W = K | trivial quotient 0 | localized module 0 | Both sides 0 |
| Convention 6; §4.1 Casimir | k = 0,1,2 | Δ scalars 0,3/2,4 | k(k+2)/2 = 0,3/2,4 | Agrees |
| §4.1 Killing normalization | κ(h,h)=8; κ(e,f)=4 | Ω = h²/8+(ef+fe)/4 | Δ/4 | Factor 4 pinned |
| §4.1 scalar extension of centre | g = 0, K = ℚ₃(√3) | K⊗_K K has K-dimension 1 | K⊗_(ℚ₃)K has K-dimension 2 | Quotient over Z_K essential |
| §4.1 closed ideal | central character Δ ↦ 0 | Δ in kernel, 1 outside | quotient retains nonzero normal form 1 | No unit-ideal substitution |
| §4.2 induced-character criterion | p = 3, λ = 1 | 1+2λ=3; odd valuation, no square root in ℚ₃ | λ₀=−9 has valuation 2 | Integrality is insufficient |
| §4.2 both directions | λ = 0 or 4 | square roots 1 or 3; highest weights 0 or 2 | a(a+2)/2 = 0 or 4 | Criterion agrees |
| §4.2 antipode, reductive centre | torus, χ(t)=t | derived left action scalar −1 | dχ(x)=1; dχ(Sx)=−1 | Antipode essential |
| §4.2 higher central degree | sl₃, cubic central polynomial, stated weight | values −6 and 6 under S | odd degree changes sign | Casimir-only convention insufficient |
| §4.3 strong-dual headline | torus; f(g)=g | x·f=−f; pairing (x̃+δ₁,f)=2 | pairing (x̃−δ₁,f)=0 | λ∘S, not λ, eigenspace |
| §4.4 quotient chart | g=[[4,3],[3,5/2]] at p=3 | determinant 1; lower coordinate 3/4 | big-cell decomposition lower·torus·upper | Agrees; FU24 §5, p. 17 |
| §4.4 nowhere-zero eigenfunction | same g; χ(t)=t | f₀(g)=4, inverse value 1/4 | trivial character gives 1 | Unit and character distinguished |
| §4.4 atlas and compactness | SL₂(ℤ₃)/B; torus | two affine charts cover ℙ¹(ℚ₃); torus quotient one point | compact quotient, finite clopen refinement | Agrees |
| §4.4 nonnormal subgroup | stated SL₂ matrices at p=3 | conjugate lower-left entry −27 | TN requires lower-left entry 0 | Quotient is a space, not a group |
| §4.5 eigenfunction density | χ=1; f₀=1 | f₀·locally constant = locally constant | dense in C(G/TN,K) | Agrees |
| §4.5 injectivity into D_λ | δ₁, trivial character | δ₁(1)=1 | zero distribution evaluates to 0 | Unit survives specialization |
| §4.6 specialization and inverse limits | G=1, λ identity on K | D_λ=K; every stage K | lim K = K | Agrees |
| §4.7 nonintegral negative control | p=3, r=3⁻²ᐟ³, λ=1/3 | norm(Δ) ≤ 3²ᐟ³ < 3 = norm(λ) | Δ−λ unit; quotient 0 | Integral hypothesis necessary |
| §4.7 small-radius domain | m=1, λ=0 | graded relation H²/2+2EF | rank-three quadratic, irreducible over 𝔽₃ | Domain criterion agrees |
| §4.7 large-radius filtration | p=3, n=1 | relation q³=0; q≠0 in primary graded quotient | graded quotient has nilpotents | Weaker-filtration separatedness remains explicit hypothesis |
| §4.8 logarithmic scaling | r=1/3 and r=3⁻²ᐟ³ | weights ρ=1 and 3¹ᐟ³ | norm(log g/p)=pr | Agrees |
| §4.8 bounded division | Δ−λ=0 | h² ↦ 2λ+2h−4ef | norm ≤ ρ² for ρ≥1 and λ integral | Bounded normal form |
| §4.9 crossed-product Ext | R=ℚ, T=ℚ[u]/(u²−2), f(u)=1 | α(f)=u/2; β(u/2)(u)=1 | cocycle-free value 1/2 | Correct inverse |
| §4.9 grade comparison | M=T; M=0 | Hom_T(T,T) and Hom_ℚ(T,ℚ) dimensions 2; zero Ext for M=0 | grades 0 and ∞ respectively | Agrees |
| §4.10 normal form | p=3, n=1, λ=0 | h² ↦ 2h−4ef; weighted norm ≤9 | basis has h-exponents 0,1 | Agrees; FU24 proof 5.1, p. 21 |
| §4.10 injection | coefficient of eⁱfʲhᶜ, c≤1 | same coefficient under weight-3 → weight-1 inclusion | zero image forces each coefficient 0 | Injectivity agrees |
| §4.11 direct route | g=exp(3e), n=1, δ=g−1 | δ(1+g+g²)=exp(9e)−1 ≠0 | norm(9e) in U_r = 1/3 | Nonzero intersection; domain hypothesis retained |
| §4.12 integral weight lifting | p=3, λ=1, a=−1+√3 | a(a+2)/2=(3−1)/2=1 | extension degree 2 ≤2¹; a integral | Agrees; AW14 §§4.5–4.6, pp. 10–11 |
| §4.12 scalar-linear domain | R=ℤ₃[√3] | a(√3h)=√3(−1+√3)=3−√3 | R-linear extension of a(h) | Domain R⊗t₀ retained |
| §4.12 degenerate roots | λ=−1/2; m=0 | root 0, weight −1; empty extension ℚ_p | a(a+2)/2=−1/2; degree 1 | Agrees |
| §4.13 faithful Verma headline | highest weight a; v,fv | Δv=a(a+2)v/2; Δfv=a(a+2)fv/2 | identical central scalar | Agrees; AW14 §§4.6,5.4, pp. 11,16 |
| §4.13 algebraic quotient distinction | a=k=0,1,2 | e f^(k+1)v=0; quotient dimensions 1,2,3 | completed Verma remains infinite-dimensional | Finite quotient not faithful |
| §4.13 completion distinction | Σ3ʲfʲv | coefficients tend to 0 | infinitely many nonzero coefficients | Completed, not algebraic, Verma |
| §4.13 ramified index | π²=3, n=1, λ(3h)=1 | norm(3h) at π-level <1; 1−3h unit acts by 0 | at π²-level norm=1; evaluation at 1 exists | Index en=2 required |
| §4.14 Fu injectivity headline | p=3, λ=1 | integral lift a=−1+√3; Casimir scalar 1 | faithful Verma annihilator in K[[G₁]] is 0 | General integral route applies |
| §4.14 descent and empty product | finite K/ℚ₃; m=0 | K⊗ kernel=0 implies kernel=0; scalar map identity | faithful scalar extension; empty centre parameter | Agrees |
| §5.1 degree filtration | n=0,1,2 | graded dimensions 1,4,9 | (n+1)²=1,4,9 | Agrees |
| §5.1 Zariski-density hypothesis | G={±I} | x−w restricts to 0 | x−w nonzero in coordinate ring SL₂ | Nonopen subgroup excluded |
| §5.2 Peter–Weyl headline | m=1; k=0,1,2 | dimensions End(W_k)=1,4,9 | dimensions W_k⊗W_k*=1,4,9 | Agrees; FU24 lines 1094–1115 |
| §5.2 surjective action | standard representation at p=3 | (exp(3e)−I)/3=E₁₂; similarly E₂₁; product E₁₁ | matrix units span M₂(K), dimension 4 | Full endomorphism algebra reached |
| §5.2 products and empty tensor | k=(1,2); m=0 | dim W=6, End=36; empty W=K, End=K | (2·3)²=36; empty product 1 | Agrees |
| §5.2 multiplicity | regular quotient End(W), dim W=3 | Hom_A(End(W),W) dimension 3 | three column copies of W | Agrees |
| §5.2 right-unipotent convention | x=g₁₁; upper/lower n(a) | x(gn_upper)=x(g); x(gn_lower)=x(g)+ag₁₂ | upper gives invariance | Source misprint corrected |
| Lean semisimplicity signature | p prime, p≠2, finite M, scalar tower | all four hypotheses present after #check | README §3.8's specialization to G₁ᵐ | No binder loss |
| Lean Peter–Weyl signature | finite K/ℚ_p; k : Fin m → ℕ | Φ(1⊗g)=tensor of symmetric-power actions; Φ surjective | kernel is action annihilator; quotient End(W_k) | Headline, not arbitrary action |
| Lean padding probes | each of two sorried theorems | simp, rfl, infer_instance, exact? all fail | 0 of 8 probes close a theorem | No padding detected |

- Source sample: all 15 seeded targets read at their locators; 0 README locators marked unverified; R04 corrects the sampled page interval.
- Headline inventory: semisimplicity and Peter–Weyl are stated; Fu injectivity, microlocalisation/D₁/ₚ, faithful affinoid Verma modules, Frommer/crossed products/normal forms, isotypic comparison, specialised duality and the envelope are named in the docstring with missing carriers.
- Pinned carrier witnesses: 7, including PBW basis/equivalence (`TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basis.lean:95`, `Injective.lean:213`), Casimir (`Casimir.lean:125`), compact-module fields (`TauCeti/Topology/Algebra/Module/Compact.lean:294`), completed group algebra (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`) and symmetric-power action (`TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:57`); no missing carrier is supplied by the current-algebra completion (`TauCeti/Algebra/Lie/Current/Completion.lean:133`).
- Near-match exclusions: `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:42` is over ℤ; `Mathlib/RepresentationTheory/Maschke.lean:165` uses a finite group algebra; `Mathlib/Algebra/Algebra/Subalgebra/Centralizer.lean:157` and `:170` supply the cited centre comparisons, not either headline.
- Supplier audit: all 9 direct roadmap suppliers and their cited sections resolved; `depcheck: 239 roadmaps, 2174 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: every supplied check passes, including targeted build, statement hygiene, imports, stray files and outside-folder scope; direct `lake env lean` elaboration succeeds with only 2 sorry warnings.
- Signatures/probes: all 4 declarations checked with `#check @name`, 0 lost hypotheses; 2 theorems tested with 4 tactics each, 0 closures.
- Pull-request text: new folder, 909 insertions, 67 added headings, 4 added declarations, 9 named suppliers; no removed headings/declarations or outside-folder changes; description and `roadmap-summary` agree with the head.

Overlap check: read LocallyAnalyticRepresentationsOfLocalGroups, LieHighestWeight (main and #1797), LocallyAnalyticDistributions, CompletedCohomologyPartII and PadicFamiliesPartII. Compact distribution algebras belong to PadicLocalLanglandsForGL2Qp §0.1; commutative analytic calculus to LocallyAnalyticDistributions §§0.0–0.3; classical highest-weight theory to the pins and LieHighestWeight; noncompact distributions and representation-theoretic induction to LocallyAnalyticRepresentationsOfLocalGroups; locally analytic vectors to CompletedCohomologyPartII; completed envelopes and compact central-specialisation theory to this roadmap, consumed by PadicFamiliesPartII. The general Fréchet–Stein interface is recorded separately as D01. No second copy, conflicting head, dropped cited id or undeclared revision dependency was found.

Source independence: 21 passages compared with 9 readable sources, with no copied prose, tables or example lists found; largest share FU24, 44 of 143 named source citations in Layers 0–5. Contents compared with FU24 lines 18–26: independent; its §4 is split across lattice, Banach and microlocal layers, using AW13, ST02 and ST03. The *Needs* edges §0.1 → §1.5 → §§2.2–2.4 and §§2.1,3.1–3.3 → §3.4 force those orders; Layer 5 uses §3.9 independently of the central-quotient route.

## Not verifiable

- SCH11: settled uncertified; cited printed Corollary 31.7 and Theorem 32.1 could not be checked against a supplied legal text.
- DDMS99, FROM03, MR01 and DG70: settled waived texts, unavailable in the supplied legal cache; accessible AW13 and KOH07 corroborate the lattice and Frommer inputs, but do not certify the original printed locators.

## Source issues

- **Error** in FU24 at equation (16), p. 13, line 664: the source says bounded weighted coefficients describe the Banach completion; it should be weighted coefficients tending to zero; affects a stated result.
- **Gap** in FU24 at Theorem 4.2, p. 14: the source says every real radius gives a noetherian Banach algebra; it should be restricted to radii in p^ℚ unless an additional proof is supplied; affects a stated result.
- **Error** in FU24 at equation (17), p. 14: the source says the displayed microlocal set works for ramified R; it should be formed over unramified R and then extended by coefficients; affects a stated result.
- **Error** in FU24 at Theorem 5.7, p. 20: the source says the central quotient is a domain for every character; it should be restricted at least to integral Casimir values, since larger values can give the zero quotient; affects a stated result.
- **Gap** in FU24 at proof of Theorem 5.7, p. 20: the source says the weaker-norm graded calculation proves the quotient is a domain; it should be accompanied by separatedness of the induced quotient filtration; affects the proof.
- **Error** in FU24 at Remark 5.8, pp. 20–21: the source says integrality is equivalent to being induced; it should be 1+2λ(Δ) square in ℤ_p; affects a stated result.
- **Error** in AW14 at §5.2, proof of the Lemma, p. 14, line 645: the source says bounded weighted coefficients describe D₁/ₚ; it should be weighted coefficients tending to zero; affects a stated result.
- **Misprint** in BCGP25 at Definition 2.2.31, p. 24: the source says a left-module transition tensors the module before the Banach algebra; it should be the Banach algebra tensored with the left module; affects a stated result.
- **Misprint** in FU24 at §6, p. 22, line 1096: the source says the right-invariance subgroup is both lower and upper triangular; it should be the upper triangular unipotent subgroup; affects nothing.
- **Error** in FU24 at §5 and Theorem 5.2, p. 16: the source says left-translation induction and specialised duality use the same central character without an antipode; it should be dχ∘HC∘S for induction and the λ∘S eigenspace for duality; affects a stated result.
- **Misprint** in AB07 at §5.4, proof of the Lemma, p. 17, line 626: the source says the inverse Frobenius map extracts an untwisted inverse-index coefficient; it should be β(t)(x)=pr₁(tx), including the crossed-product cocycle; affects the proof.
- **Error** in AW14 at §5.4, Theorem, p. 16, with §4.5, p. 10: the source says the character of pⁿt defines the π-deformation-index-n Verma module; it should be deformation index en, where e=v_π(p); affects a stated result.
- **Gap** in SCHM13 at the remark following Proposition 3.2.3, p. 6, line 230: the source says every single-radius completion is noetherian and flat; it should be justified beyond p^ℚ, or restricted to p^ℚ using the cited finite-extension argument; affects a stated result.
- **Gap** in BCGP25 at Definition 2.2.31, p. 24: the source says successive numerical radii give noetherian flat stages; it should be justified at irrational log_p radii, or use the cofinal radii |π_E|⁻ʲ; affects a stated result.
- **Misprint** in AW13 at proof of Theorem 11.1(b), p. 80, lines 3718–3724: the source says restriction is Hom_KG(U₀,−), and interchanges unit and counit names; it should be restriction along KG→U₀, with unit V→RLV and counit LRW→W; affects the proof.
- **Misprint** in AW14 at §5.2, proof of the Lemma, p. 15, line 671: the source says locally L-analytic distributions surject onto underlying ℚ_p-analytic distributions; it should be the reverse surjection D₁/ₚ(G₀,K)→D₁/ₚ(G,K); affects the proof.
- **Error** in SCHM13 at proof of Proposition 3.2.1, p. 6, line 213: the source says every chosen PBW basis gives submultiplicative norms for all r>1; it should be scaled to integral structure constants, or the radii should start sufficiently large; affects the proof.
- **Error** in AW13 at proof of Theorem 10.4, p. 70, line 3239: the source says exp(u) converges for all u∈L_G, including p=2; it should be restricted to odd p or use a deeper lattice: (2x)ⁿ/n! fails to tend to zero; affects the proof.

## For the human reviewers

- BCGP25 is an arXiv preprint (`TauCetiRoadmap/LocallyAnalyticDistributionsPartII/README.md:792`); FROM03 is an unpublished, waived primary text. The envelope and Frommer assertions also cite refereed SCHM13, ST02 and KOH07.
- The legal-text exceptions SCH11, DDMS99, FROM03, MR01 and DG70 retain their settled uncertified/waived status; their original wording and printed locators were not independently certified.
