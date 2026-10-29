<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2145#issuecomment-6486229829 -->
Red team round 2 pass a (codex) of 9f8ce66

Verdict: needs_changes

1. **F01** (P2) Joint localization omits its symbol-family hypothesis

   **Location:** `packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:609`: “Then `ℓ(Op_h(a)) = O(h^{−M} …)`”.

   **Claim:** The displayed estimates apply to a without a specified symbol class or uniform seminorm bounds.

   **Witness:** Take G = H = {1}, π = σ = ℂ, ℓ = identity and a(h) = exp(1/h). Every a(h) is Schwartz on the zero-dimensional dual; ℓ(Op_h(a)) = exp(1/h), exceeding every h⁻ᴹ.

   **Exact repair text:** “Fix 0 ≤ δ < 1/2 and a bounded family a ∈ S^{−∞}_δ. Let π and σ be h-dependent irreducible unitary representations, and let ℓ factor through an H × H-equivariant, h-uniformly continuous map Ψ^{−∞}(π) → Ψ^{−∞}(σ), followed by trace. For every N there is M, with constants controlled by finitely many symbol seminorms and the uniform continuity bound, such that |ℓ(Op_h(a))| ≤ C_N h^{−M}⟨hλ_π⟩^{−N}⟨hλ_σ⟩^{−N}. If every point of supp a is separated from one of the two infinitesimal characters by at least h^ε in the fixed invariant coordinates, for some ε<1/2, then for every N the bound improves to C_N h^N⟨hλ_π⟩^{−N}⟨hλ_σ⟩^{−N}.”

   The repaired assumption excludes exp(1/h); a(h) = 1 gives 1 = O(1). NV21 Lemma 10.4, printed p. 81, explicitly imposes a ∈ S^{−∞}_δ (nv21 line 3691).

2. **F02** (P2) The repaired branching coefficient extends beyond the supplied period forms

   **Location:** `packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:1437`: “if it vanishes identically, put `L(Π, Σ) = 0`, and then `P_Σ = 0` as well”. Also §7.6, line 1247: “possibly 0”.

   **Claim:** The factorization and zero-detection assertion cover every automorphic summand, including nontempered σ or σ′.

   **Witness:** NV21 §25.4, p. 169 (nv21 lines 7681–7690), defines the canonical local-integral coefficient only for tempered local data. Its §20, p. 143, requires an auxiliary nontempered intertwiner to be nonzero whenever one exists.

   **Exact repair text:** “Define P_Σ for every summand. Define the canonically normalized L(Π,Σ) and the factorization by the integral relative characters when σ and σ′ are tempered. For nontempered σ choose a continuous H-intertwiner ℓ_σ, nonzero whenever Hom_H(π,σ) ≠ 0, and define H_σ(v₁⊗v̄₂) = ⟨ℓ_σ(v₁),ℓ_σ(v₂)⟩; this is an auxiliary normalization, not the tempered integral. Keep nontempered contributions in the Parseval and truncation arguments as P_Σ, and derive their bounds from the actual restriction map.” Replace the unqualified “possibly 0” in §7.6 by “zero exactly when the intertwining space is zero”.

   The algebraic negative control is a nonzero period functional P and the currently permitted zero auxiliary intertwiner: P ≠ 0 while H_σ = 0, so P = L·0 is impossible. The repair prevents that choice. It preserves §9.5, which already sums only tempered σ and σ′. The auxiliary-variable correction of a-F12 is valid; its new all-summands zero-detection argument is not supplied by the tempered contracts.

3. **F03** (P2) Freeness does not separate a compact support from its translate

   **Location:** `packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:1137`: “a compact stable support and its translate by s are separated when s is away from 1”.

   **Claim:** Stable properness and trivial stabilizers imply disjointness of the two whole supports, permitting §1.12 directly.

   **Witness:** In GL₂ ⊃ GL₁ take ξ with (b,c) = (1,1), and s = 2. A compact stable support containing ξ and s·ξ = (2,1/2) intersects its s-translate at (2,1/2), although stabilizers are trivial.

   **Exact repair text:** “First partition a into polynomially many pieces supported on balls of radius h^δ̃, with max(δ, 1/2−η/2) < δ̃ < 1/2. Apply the displacement estimate to each ball and a slightly larger cutoff envelope. In the moderate range each translated envelope is disjoint from its own input support; near covariance and the disjoint-support calculus then apply piecewise. Choose the negligible power before summing the polynomially many pieces.” Cite NV21 Lemma 19.8, pp. 133–134, and add §1.4 to Needs.

   In the witness, a ball of radius o(1) about (1,1) is separated from its 2-translate, whose centre is (2,1/2); the two-centre union is not. NV21 partitions first (nv21 lines 6074–6087).

4. **F04** (P2) The unitary period-form citation omits the split case

   **Location:** `packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:850`: “GanGrossPrasadUnitaryGroups … §3.3 (local period form)”; also lines 179 and 1437.

   **Claim:** §3.3 supplies the local period form and its nonvanishing criterion for every quadratic étale unitary pair.

   **Witness:** `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:630–634` explicitly requires a quadratic field extension. Its §5.1a, line 1009, supplies the split Whittaker integral identity; §5.2, line 1049, exports nonzero iff the local model is nonzero.

   **Exact repair text:** “Consume GanGrossPrasadUnitaryGroups §3.3 for nonsplit local pairs and §5.1a (split adjacent Whittaker identity), equivalently the nonvanishing clause of §5.2 after multiplying back its nonzero normalizing factor, for split local pairs. For the rank-zero smaller space the integral is directly Haar mass times the Hilbert pairing.” Add those sections to the supplier contract, §4.5 Needs and §9.1's factorization inputs.

   For GL₂(F) ⊃ GL₁(F), E = F × F violates §3.3's field-extension hypothesis. The repaired route gives the raw diagonal integral ab|λ(W)|² > 0 for a nonzero Whittaker test, with a,b > 0, as §5.1a requires. No new gap is needed.

5. **F05** (P2) Layer 7 Chevalley restriction is cited beyond its semisimple scope

   **Location:** `packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:69`, and §2.1 Needs at line 539: “LieHighestWeight Layer 7 … Chevalley restriction”.

   **Claim:** This citation supplies the adjoint/coadjoint quotient of every reductive Lie algebra, including its centre, used in §§2.1, 5.3 and 5.5.

   **Witness:** `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:1072–1074` restricts its HC and Lie–Chevalley isomorphisms to Killing-semisimple algebras. For gl₁ the Killing form is zero; the required quotient is A¹, with ring k[t], not a point.

   **Exact repair text:** “For the reductive invariant quotient, its central affine factors and Chevalley restriction, consume FormalConnectionsOpers F4.3. For reductive Harish-Chandra infinitesimal characters consume AutomorphicFormsOnReductiveGroups §2.2. LieHighestWeight Layer 7 supplies PBW symmetrization at its stated generality and the Killing-semisimple restriction theorem.” Apply this distinction in Scope, the contracts, and the Needs lines of §§2.1, 5.3 and 5.5.

   FormalConnectionsOpers F4.3 at lines 617–640 explicitly retains central affine factors and characteristic-zero descent. Thus gl₁ retains the coordinate t and has the identity quotient map; no semisimple hypothesis is silently imposed.

6. **F06** (P3) Several definition Checks merely repeat the definition

   **Location:** `packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:1183–1186`: “has `k_h(σ) = 0`”, “has weight 0”, “has weight 2”. Also §3.4, lines 691–693.

   **Claim:** The definition of the spectral weight has three discriminating Checks. Its current bullets only substitute the clauses defining k_h; they do not compute orbit distinction or spectral parameters. The constant-sequence Check for §3.4 is likewise a general topology axiom.

   **Witness:** Replacing the coadjoint orbit O_π in the definition by any arbitrary set leaves all three §7.1 Checks unchanged. They therefore cannot detect an incorrect orbit construction or the missing rescaling h.

   **Exact repair text:** “For SO(3) ⊃ SO(2), use spin l≥1 with h_l=(3/4)/(l+1/2), so every scaled orbit and its limit have radius 3/4. At l=1 and h=1/2, at weights m = 0, 1, 2 the restriction coordinates are 0, 1/2, 1. The first two fibres are circles of radii 3/4 and √5/4; the third is empty. Choose k supported in (−3/4,3/4) with k(0)=1 and k(1/2)=2. The weights are 1, 2, 0; replacing hλ by λ incorrectly makes the m=1 weight zero.” Add a separate noncompact boundary Check using the fixed generic SL₂(ℝ) limit and exclusion of complementary-series parameters from a compact regular spectral window. For §3.4 replace the constant-sequence bullet by the SU(2) shrinking-sphere calculation, mass h(2l+1) → 0, contrasted with the torus point mass δ_{hm} → δ₀ of mass 1.

   Keep these in README, with three separately evaluated cases per definition; add no Lean examples. The displayed SO(3) values distinguish geometry, support and rescaling.

7. **F07** (P3) The repaired source Check drops a denominator

   **Location:** `packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:1274`: “The printed example `f_n = α^{−n} + α^{−n+2} + … + α^n` … `f_n(1) = n + 1 > 2`”.

   **Claim:** This is the polynomial printed after NV21 Lemma 24.10, and its value at 1 violates the bound.

   **Witness:** The published page 166 divides the sum by n (nv21 lines 7571–7575, confirmed visually in the PDF). Thus f_n(1)=(n+1)/n≤2, not n+1. For q=5, α=2,n=4 instead gives 341/64>2.

   **Exact repair text:** “The printed polynomial is f_n(α)=n⁻¹Σ_{j=0}^n α^{−n+2j}. On the unit circle its absolute value is at most (n+1)/n≤2. It nevertheless fails the whole-unitary-locus bound: over ℚ₅ the complementary parameter α=2 and n=4 give f₄(2)=341/64>2; for any fixed α>1 in the complementary interval it grows exponentially divided by n. Odd n also gives f_n(α)<−1 on the negative complementary interval. Use the Stone–Weierstrass proof instead.”

   **Repair test:** At α=1,n=4 the correct value is 5/4, satisfying the bound. At α=2,n=4, (1/16+1/4+1+4+16)/4=341/64, refuting the claimed global bound. This corrects the round-one b-F04 repair; the source example remains defective for the stated reason.

## Verification of the previous reviews

The identifiers below are those of the two round-one reports, not new findings. Locations without a filename are in `packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md`. All 29 findings were compared with this head. No repair was marked “not actionable in this package” in the repair report.

| Earlier finding | Status and repaired passage | Recomputed witness |
|---|---|---|
| a-F01, smoothing identity | Repaired, §0.6: “On the trivial representation … the identity is smoothing”. | Trivial representation: Δ=I, ΔᴺIΔᴺ=I, norm 1. Regular representation of ℝ: multiplier (1+t²)²ᴺ is unbounded. |
| a-F02, relative-character conjugation | Repaired, §4.5: “tr σ̄(f_T)”, and Conventions: “⟨u, σ(s)u⟩”. | Circle characters m=n=1: integrand eⁱθe⁻ⁱθ=1, integral 1; the former integrand e²ⁱθ integrates to 0. The same contragredient occurs in §§4.6 and 7.3. |
| a-F03, invariance | Repaired, §4.5: conjugation invariance replaces separate invariance. | On the same weight-one space, H(π(s)T)=eⁱθH(T), while H(π(s)Tπ(s)⁻¹)=H(T)=1. |
| a-F04, localized weight | Repaired, §1.4: normalized derivatives contain no additional ⟨ω⟩⁻ʳ factor. | A translated unit bump has inverse-transform L¹ norm c>0 independent of centre R; an extra R⁻² would force c≤CR⁻². |
| a-F05, positivity in summability | Repaired, §4.2: “T = Op(b)* Op(b)”. | Scalar Op(b)=−c has trace −c; T has trace c²≥0 and can dominate a positive inverse power. |
| a-F06, K-invariant Laplacian | Repaired, §4.1: “Ad(K)-invariant inner product”. | In the three-dimensional rotation representation an orthonormal invariant basis gives scalar Casimir 2I; doubling one generator gives a nonscalar diagonal correction, preventing commutation with all K. |
| a-F07, inverse exponent | Repaired, §3.9: “Δ_h^{N/2} Op_h(⟨ξ⟩^{−N})”. | N=2, ht=1: 2·(1/2)=1. The former Δ_hᴺ gave 4·(1/2)=2. |
| a-F08, missing unrestricted surjectivity | Repaired, `Suggested.lean:234,248`: `jointFibre_nonempty_orthogonal`, `jointFibre_nonempty_unitary`, without coprimality binders. | GL₂: y=z=0 permits x=0; gcd(X²,X)=X≠1, so the old stable-only statement did not cover it. |
| a-F09, duplicate character gap | Repaired, contract at line 85 consumes “EndoscopicTransferAndUnitaryTraceComparison §2.3(a)–(b)”. | Its §2.3 supplies trace-class convolution and locally integrable characters. The old gap slug is absent from both gap lists. |
| a-F10, spinor gaps duplicate pinned results | Repaired, line 109 restricts the requested local theorem to “anisotropic … finite extension F_v of ℚ_p”. | Positive real form: image {1}; indefinite real form: both signs; these are the pinned theorems, not requested again. The anisotropic binary p-adic norm subgroup has index 2. |
| a-F11, automorphic multiplicity | Repaired, §9.1: “a Σ is a summand of this decomposition”. | Two orthogonal copies with projection norms squared 1,1 contribute 2. Counting the full isotypic projection twice would contribute 4. Summand indexing persists in §§9.2–9.5. |
| a-F12, zero auxiliary test fails to define L | Partly repaired, §9.1: “for all T and S′”. This fixes the original defect; the new extension to all nontempered summands is S02. | Auxiliary weight-zero projector gives H_{weight 1}=0 and the equation 0=L·0; varying S′ to the weight-one projector gives H=1 and determines L. Allowing its entire nontempered form to be zero reintroduces an undetected nonzero period. |
| a-F13, nondiscriminating Checks | Repaired at Conventions, §§1.2, 1.6, 3.6 and Examples. | Shifted Gaussian at 1/4 gives −i exp(−π/16), opposite transform +i exp(−π/16); Heisenberg first correction is ξ_Z/2; transverse Gaussian derivative at 1 is −2/e; sphere shell A>r has mass 0; torus shrinking point has mass 1, versus shrinking SU₂ mass tending to 0. S06 concerns other Checks. |
| a-F14, source versions | Repaired, source manifest and module docstring consistently cite Acta Math. 226 (2021). | Published Theorem 26.4 is the limit-state theorem, matched against the cached published text; the former preprint numbering is not used as a second key. |
| a-F15, ambient versus quotient distance | Repaired, §§2.7, 4.6: “distances … in the fixed generator coordinates”. | q(x)=x² and x=hᵟ give ambient distance hᵟ but invariant difference h²ᵟ<hᵟ. Taking x=h^(δ/2) gives invariant difference hᵟ. S01 is an independent missing symbol assumption. |
| a-F16, archimedean admissibility misuse | Repaired, §4.3 separates archimedean Sobolev estimates from the p-adic finite-level argument. | U⊂K compact open gives dim(K·v)≤[K:U]<∞; for positive-dimensional K, [K:{1}]=∞ and that estimate is not used archimedeanly. |
| a-F17, GIT prerequisite | Repaired, two exact GIT gaps at lines 89,91 and matching plan entries. | G_m with weights (1,−1): bc=1 has a closed free orbit; (1,0) has the cocharacter limit (0,0), hence is unstable. Ownership is explicitly assigned. |
| a-F18, open flag orbit | Repaired, §5.3: “H has an open orbit with trivial stabilizer on the flag variety of G × H”. | GL₂⊃GL₁ acts on P¹ with free open orbit having both coordinates nonzero; a Borel of SL₂ on P¹ instead has a positive-dimensional stabilizer. The required free action is now a target, not an implicit hypothesis. |
| a-F19, fibral forms prerequisite | Repaired, §5.4 explicitly builds the determinant comparison from the cotangent exact sequence. | For projection A²→A¹, 0→k·dy→k·dx⊕k·dy→k·dx→0 gives the relative line and the corresponding wedge comparison; singular projection x↦x² at 0 is excluded by submersivity. |
| a-F20, single adelic component | Repaired, line 1302: “the finite disjoint union … no such choice is made here”. | Three components of mass 1 have total mass 3; replacing the union by one component would give 1. All three are retained in X. |
| a-F21, quotient differential ownership | Repaired, §3.5 Needs cites “FormalConnectionsOpers F4.3”. | For sl₂, q=a²+bc: dq at (1,0,0)=(2,0,0), at (0,1,0)=(0,0,1), both rank 1; at 0 rank 0. F4.3 supplies the regular-element statement. |
| a-F22, Ω(0) | Repaired, §1.3 distinguishes Ω=exp(z) from the remainder “e^z − 1 − z”. | Ω(0)=0 and Ω(iε)=−ε²/2+O(ε³), versus the incorrect constant term 1. |
| a-F23, four false Checks | Repaired, §§1.9, 7.7, 8.5, 8.6. | Truncated signed Hilbert kernels have bounded Fourier multipliers and L¹ norms growing like their logarithmic cutoff; all-positive telescoping pieces have L¹ norm at most 2‖ψ^∨‖₁, so do not witness L¹ growth. A scalar normalizer c=1 causes no change. Spin(1,1)(ℝ) has two components and is excluded from the semisimple assertion. The real regular-nilpotent GL₃ centralizer has a≠0, with identity component a>0. |
| a-F24, mixed-symbol axes | Repaired, §1.6: two nonconstant transverse factors. | exp(−ξ₁²)exp(−ξ₂²) at (0,R) tends to 0; replacing the second factor by 1 gives 1 and loses joint Schwartz decay. |
| a-F25, omitted-headline inventory | Repaired, `Suggested.lean:42–46` explicitly names the three Layer 4 headline results and missing carriers. | The file has 7 substantive theorem statements, not scalar surrogates for the absent tempered dual and Plancherel measure. |
| b-F01, GIT ownership | Repaired by the same two matching declared gaps as a-F17. | On the stable bc=1 fibre, G_m acts freely and transitively; neither theorem is silently attributed to an existing supplier section. |
| b-F02, undefined positivity contract | Repaired, line 199 writes the basis sum, integral, inner-product convention and positive/nonzero assertions. | H=U(1), π=σ of weight 1, rank-one projector gives H=1≥0; weight mismatch gives 0. |
| b-F03, bad locators | Repaired: §§9.1 and 9.3 cite NV21 §§28.1–28.2 and §§29.2–29.3; spinor contract separates local-image §2F from compactness §2G. | Published (28.1)–(28.6) are the period decomposition; (29.1) is the truncated sum. OrthogonalSpinGroups §2F lists local images, §2G the real compactness application. |
| b-F04, false central polynomial example | Partly repaired, §7.7: “The Stone–Weierstrass construction of the proof is what is used.” Its claimed transcription of the printed example is wrong: see S07. | The source has a denominator n: f_n(1)=(n+1)/n≤2. At q=5, α=2,n=4, f_n=341/64>2; this is a valid complementary-series counterexample. |

## Computed statement audit

These are adversarial instances, not proofs of the general theorems. “Retain” means that the displayed instance does not refute the statement; source and dependency limitations are recorded separately. The full audit covered all 75 numbered README targets, the additional bold definitions and conventions, and every Lean declaration. This shortened report retains 19 representative README rows and the declaration/context table. Characteristic p, the zero ring, inseparability and nonsmooth group schemes are outside the explicitly stated characteristic-zero field/Lie-group context; they are not silently admitted test inputs. Empty index types, zero-dimensional Lie algebras, the zero Hilbert space, h→0, disconnected real groups, and unstable fibres are admitted and are tested below. h=0 itself is excluded. The orthogonal tests use algebraically closed characteristic-zero coefficients, so i and square roots exist.

### Sampled README computations

| Target | Instances and values computed on both sides | Result / change |
|---|---|---|
| 0.1 Fourier and density | Indicator [0,1] at η=1/2: forward 2i/π, inverse-sign −2i/π. SU₂ at radius π: j=4/π²; at 0 removable value 1. Zero algebra: both transforms c↦c. | Retain signs, density division and zero-dimensional convention. |
| 0.5 Cutoff and quantization | Zero algebra: χ=1 and b=2 give Op(b)v=2v. χ(0)=1/2 gives half of I for the distributional constant symbol. On ℝ, character t=2π reads b(1), not b(−1). χ≡1 on positive-dimensional E fails compact support. | Retain actual bodies and distributional/Bochner distinction. |
| 1.2 BCH coefficients | Heisenberg a=ξ_X,b=ξ_Y: C₁(a,b)=ξ_Z/2, C₁(b,a)=−ξ_Z/2, difference ξ_Z. For a=ξ_X²,b=ξ_Y², C₂=ξ_Z²/2≠0. Abelian C_j=0 for j>0. | Retain factor 1/2, homogeneity and formal associativity. |
| 1.9 Uniform boundedness | Dimension 0, b=2, ‖v‖=1: LHS 2 and zeroth seminorm M≥2. V=0 gives 0≤0. Hilbert-kernel family: operator norms O(1), L¹ norms ≍K. δ=.5 gives gain 1, excluded. | Lean headline retained; no one-tactic reduction. |
| 1.10 Polynomials | Character t=1: linear symbol i, quadratic 2. Heisenberg: Op(⟨ξ⟩⁴)=Δ²−dπ(Z)², differing by +1 when dπ(Z)=i. Abelian difference 0. | Retain lower-order correction. |
| 2.7 Joint localization | q=x², x=hᵟ gives quotient difference h²ᵟ, not hᵟ. Trivial group with a(h)=exp(1/h) gives exp(1/h), exceeding every h⁻ᴹ. | Earlier distance fix retained; S01 adds the missing symbol-family assumption. |
| 3.4 Multiorbit topology | Torus δ_n on any fixed compact test is eventually 0. δ_{hm} has mass 1 and tends to δ₀; SU₂ shrinking sphere has mass h(2l+1)→0. | S06 replaces a tautological Check. |
| 3.7 Trace expansion | Fixed character, d=0: trace≈a(iht). Spin l with h=(l+1/2)⁻¹ gives h·dimπ=2, the unit-sphere mass. An inhomogeneous D₁=∂+1 gives h∂a+a instead of h(∂a+a). | Retain homogeneous D_j. |
| 4.5 Relative characters | U(1) weights m,n: ∫e^{i(m−n)θ}=1 if m=n and 0 otherwise. Compact irreducible dimension 2: H(T)=tr(T)/2, Plancherel atom 2 restores tr(T). | Conjugation repaired; split supplier needs S04. |
| 5.2 Stability | GL₂, x=[[a,b],[c,d]]: charpoly_x(a)=−bc. bc=1 gives closed hyperbola and stabilizer {1}; b=1,c=0 gives nonclosed orbit with limit b=0. SO₃: stable iff b²+c²≠0; (b,c)=(1,i) is nonzero but unstable. SO₁ and SO₂ boundary groups trivial, relevant gcd=1. | Both iff directions pass; characteristic zero is material. |
| 5.3 Torsors and surjectivity | GL₂ stable fibre bc=s≠0: unique h=b′/b maps (b,c) to (b′,c′). Unstable s=0 fibre is two axes, still nonempty. SO₂ adjoint quotient distinguishes aJ and −aJ by Pfaffian although characteristic polynomials agree. | Retain invariant polynomials rather than charpoly-only quotient; S05 supplier correction. |
| 5.6 Fibre/Haar compatibility | GL₂⊃GL₁ stable bc=s: b is nonzero and c=s/b, yielding invariant differential db/b. Under b↦tb, d(tb)/(tb)=db/b. On SO₂⊃SO₁ a fibre is a point, mass 1. | Haar normalization survives; no assertion that every real fibre is inhabited. |
| 6.3 Other elements | Stable GL₂ support containing (1,1),(2,1/2), with s=2, intersects its translate. Tail model ∫_X^∞t^(−3/2)log(t)dt=2X^(−1/2)log X+4X^(−1/2). | S03 requires partition before separation; polynomial-tail contracts retained. |
| 7.1 Spectral weights | Spin 1,h=1/2: sphere radius 3/4, restrictions at m=0,1,2 are 0,1/2,1; fibre radii 3/4,√5/4,empty. k values 1,2,0 give weights 1,2,0. | S06 replaces clause-substitution Checks. |
| 7.7 Central approximation | The README’s unnormalized sum at 1 is n+1, but the source’s normalized sum is (n+1)/n. At α=2,n=4 the source value is 341/64>2. | S07 corrects the source transcription and counterexample. |
| 8.5 Connectedness | SL₂(ℝ): one component despite π₁=ℤ. PGL₂(ℝ): two components and not algebraically simply connected. Split torus ℝ× has two components but is not semisimple. | Earlier binary-spin counterexample excluded correctly. |
| 8.7 Component comparison | Definite real SO has spinor image {+1}; indefinite SO has {±1}. Anisotropic binary p-adic image has square-class index 2. Three equal-mass components give total three times one component. | Retain binary obstruction and global sign correction. |
| 9.1 Period functional | Two orthogonal copies give 1+1=2, not 2+2=4. Auxiliary weight mismatch gives 0=L·0 for every L; variable matching projector gives factor 1. Nontempered form artificially 0 cannot detect a nonzero restriction. | Original repairs retained; S02 fixes new overclaim, S04 fixes split supplier. |
| 9.5 End asymptotic | k=0 or k′=0 gives 0 on both sides. Rescaling k by c multiplies sum and integral by c. τ(H)=τ(G)=2 gives ratio 1; arbitrary compatible Haar scaling requires the displayed ratio. | No scalar stand-in in Lean; inherits repairs S02–S04 in proof inputs. |

### Every Lean declaration and its retained context

All binders below occur in the declaration itself. There are no inherited `variable` blocks or `include` assumptions to disappear. “Field context” below means k a field with `IsAlgClosed k`, `CharZero k`, and finite decidable ι; these assumptions are explicit in each of the six algebraic theorems. Every occurrence of `ggpBlock` has size ι⊕Unit, and both factors use the same embedding. The matrix inverse in the invariant predicate is tested only with invertible Γ in the theorem statements.

| Declaration; README section; Lean line | Variable/instance context | Computed instance and result |
|---|---|---|
| IsQuantizationCutoff; 0.5; 84 | Real inner-product E; arbitrary U⊂E and real χ. No finite-dimensional hypothesis needed to define the predicate. | E=0,U=univ: χ=1 satisfies all clauses; χ=1/2 fails eventual equality. Positive-dimensional constant 1 fails compact support. Retain. |
| quantize; 0.5; 94 | Finite-dimensional real inner-product Borel E; smooth Lie group G modeled on E, T₂; complete complex Hilbert V; native ContRepresentation π; χ,b,v. | E=0,χ=1,b=2 gives 2v. b=0 gives 0. On the additive line, Schwartz b with inactive cutoff is evaluated at t/(2π). Retain; integrability/strong continuity are not claimed by this unrestricted definition. |
| exists_norm_quantize_le; 1.9; 110 | Same E,G; Borel G and existence of left/right Haar; 0≤δ<1/2; then ∃U,∀χ,∃C,N,∀Hilbert V:Type u,∀π unitary and strongly continuous,∀0<h≤1,∀Schwartz b,M satisfying derivative bounds,∀v. | C,N precede V,π,h,b,M. In dimension 0,b=2,unit v: 2≤CM with M≥2. M<0 cannot satisfy the j=0 bound even when b=0. V=0 gives 0≤0. Retain; no accidental dependence of constants on π. |
| IsZariskiClosedMatrixSet; 5.2; 129 | Field k, arbitrary index n, set of square matrices; an ideal in MvPolynomial(n×n)k. | Ideals 0,1,(X) give univ,∅,{0}; the entry-function map is bijective. Retain; finite-dimensionality is supplied by consumers. |
| ggpBlock; 5.2; 137 | Field k, decidable ι; no Fintype needed to build blocks. | [2]↦diag(2,1); ι empty gives [1]. Retain. |
| ggpSpectralPolynomial; 5.2; 144 | Field k, finite decidable n; arbitrary x; odd branch divides by monic X. | n=0:1; n=1,x=0:1; n=3,x=0:X²; n=2,aJ:X²+a². Retain; no division by a scalar zero or natural-number subtraction. |
| InvariantlyEquivalent; 5.3; 153 | Field k, finite decidable n; A,Γ sets, x,y matrices. | Γ trivial forces entrywise equality; GL₂ invariant nilpotent and zero are equivalent; SO₂ aJ and −aJ are not for a≠0. Retain. |
| isStable_iff_isCoprime_orthogonal; 5.2; 166 | Field context; x skew of size ι⊕Unit; subgroup SO(ι) defined using transpose. | ι empty: orbit {0}, stabilizer singleton, spectral pair (1,1), both true. ι of size 2: b²+c²=1 gives closed free orbit and gcd1; b=c=0 gives infinite stabilizer and common polynomial factor; (1,i) gives nonclosed orbit and common factor. Both directions survive. |
| isStable_iff_isCoprime_unitary; 5.2; 179 | Field context; any x of size ι⊕Unit; GL(ι) orbit and finite stabilizer. | ι empty: singleton orbit and charpoly pair (X−a,1). For size 1, bc=1 gives hyperbola and gcd1; bc=0 gives nonclosed orbit or infinite stabilizer and common root a. Both directions survive. |
| stableFibre_isTorsor_orthogonal; 5.3; 195 | Field context; y,z skew; coprime spectral polynomials; explicit F and unique SO element. | SO₂⊃SO₁: Pfaffian fixes x=y, acting group singleton. SO₃⊃SO₂: b²+c²=s≠0, with isotropic coordinates u=b+ic,v=b−ic giving uv=s; unique torus multiplier u′/u. Stabilizer is 1. Retain. |
| stableFibre_isTorsor_unitary; 5.3; 216 | Field context; y,z arbitrary; coprime charpolys; explicit F and unique GL element. | GL₂⊃GL₁: given upper-left a and charpoly P, bc=−P(a)≠0. Unique h=b′/b, second equation c′=h⁻¹c. F nonempty by b=1,c=−P(a). Retain. |
| jointFibre_nonempty_orthogonal; 5.3; 234 | Field context; y,z skew; no coprimality. | SO₃: fixing a and quadratic coefficient q requires b²+c²=q−a², solved by c=0 and a square root, including q=a². SO₂: Pfaffian fixes y itself. Retain unrestricted surjectivity. |
| jointFibre_nonempty_unitary; 5.3; 248 | Field context; y,z arbitrary; no coprimality. | GL₂: choose x=[[a,1],[−P(a),tr(y)−a]]. Its trace and determinant equal those of y; when P(a)=0, c=0 is still valid. Empty ι chooses x=y. Retain unrestricted surjectivity. |

The seven theorem declarations are substantive general results. None follows merely by unfolding these six definitions, computing a boundary value, or applying a single pinned theorem found by object search. The definitions are used by those headlines. No padding deletion is requested.

## Dependencies, ownership and source audit

The requested dependency command completed without an UPWARD, CYCLE or moved line:

```text
depcheck: 188 roadmaps, 1242 edges, 0 problem(s)
```

The read-only git comparison with origin/main shows changes only inside this package (11 files, including its design, manifest and earlier reports). No git write, Lean invocation, build, repository repair or external post was made in this pass. Object searches used `roadmaps grep`, the supplied open checkouts, main and Completed, the board packages and the pinned libraries. No duplicate fully qualified name for the seven headlines was found. The generic symplectic, Lie-theoretic, Schatten and GIT objects remain owned by their suppliers; this package owns their representation-specific microlocal calculus, GGP fibre calculations and quantitative automorphic applications.

The following table records the citation groups checked, with scope exceptions stated explicitly. Relative `TauCetiRoadmap/…` paths refer to the supplied main or open-head copy, not a web version. The Part II unitary-dual supplier currently has its targets in the board's design, explicitly earlier in the merge order; that limited availability is recorded below rather than treating the announced supplier as absent.

| Supplier citation group | Resolution and scope check |
|---|---|
| LieGroups Layers 0,1,3,5,7,9 | `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md`: exponential/local logarithm, adjoint action, enveloping differential operators, real forms and real reductive decompositions. The package builds the BCH symbol coefficients, not a second exponential map. |
| LieHighestWeight Layers 3,5,6,7 | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md`: PBW, Casimir, dimension and symmetrization targets exist. Layer 7 restriction is semisimple; S05 corrects the reductive use. |
| CompactGroups Layers 0,5,6 | `TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md`: compact Haar, Peter–Weyl and characters; the K-type use preserves compactness. |
| NilpotentOrbits N1.1,N2.1,N2.3 | `TauCetiRoadmap/NilpotentOrbits/README.md:129,160`: quotient, general triples, comparison with the regular nilpotent orbit. N2.3 itself consumes the finite F4.3 theorem; this is not an independent replacement for it. |
| FormalConnectionsOpers F4.3 | `TauCetiRoadmap/FormalConnectionsOpers/README.md:617–640`: finite reductive invariant/slice exports, central factors included. Supports the repaired regular-point differential input and the S05 redirection. |
| HamiltonianReduction R1–R3 | `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md:127`: KKS convention and homogeneous orbit structure; SO₃ sphere area 4πr and SU₂ torus period 4π agree with the package's division by 2π. |
| ConvexityToric T4 | `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:156`: Liouville density ωⁿ/n!, before the package's (2π)⁻ⁿ normalization. |
| OperatorIdeals Parts B–C | `TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md:282`: symmetric/Schatten ideals. The additional all-commutators condition defining T_p is genuinely additional. |
| DifferentialGeometry Layer 5 | Densities and change of variables, not the algebraic determinant-line comparison now explicitly targeted in §5.4. |
| GeometricMeasureTheory G2 | Coarea supplier used on the smooth submersive stable charts; no singular-fibre coarea assertion is imported. |
| NoncompactQuantumSymmetry M0 | `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:663–691`: positive Nelson operator, power cores, Sobolev and elliptic regularity adapters explicitly present. |
| SmoothBanachRepresentations SB2,SB3,SB6 | SB2 supplies the stronger smooth-vector Fréchet topology; SB3 the derived action and integration by parts; SB6 Dixmier–Malliavin. No ambient norm topology substitutes for the smooth topology. |
| UnboundedOperators UO-A01–A03,UO-E01 | Spectral-integral domains, adjoint/product laws and cores are explicit. Powers of Δ use the positive lower bound 1; no negative power at a zero eigenvalue is needed. |
| PseudodifferentialOperators P3,P5 | Kernel theorem and ordinary almost orthogonality are present. Strong convergence of countable sums is separately declared as a gap; norm convergence is not imported. |
| AutomorphicFormsOnReductiveGroups §§0.3,2.1–2.4,2.7 | Height integrability, Harish-Chandra modules/infinitesimal characters, classification and smooth globalizations exist. Uniform unitary exponents and minimal K-types are separate gap contracts. |
| EndoscopicTransferAndUnitaryTraceComparison §2.3(a)–(b) | Locally integrable distribution characters and trace-class convolution are explicitly present. The deleted Harish-Chandra gap was duplicative. |
| AutomorphicSpectralTheory §§0.9,0.13,0.14,4.5,4.7 | Trace/cyclicity, LF and Schwartz interfaces, finite multiplicity and compact quotient spectral specialization exist. The six local/uniform extensions remain gaps, not falsely claimed exports. |
| SmoothRepresentationsOfLocalGroups SR.0.3–0.4,1.1,1.4,2.2–2.3,3.1–3.3,3a.2 | Invariants/duals, Hecke idempotents, normalized induction, Jacquet lifting, Bernstein and tempered support, uniform admissibility are explicitly present at their cited sections. |
| SmoothRepresentationsOfLocalGroupsPartII SRU.0.6,2.6,2.7 | `packages/SmoothRepresentationsOfLocalGroupsPartII/design/README.md:252,801,821` contains the unitary dual and the reductive p-adic admissibility/smooth dictionary with the claimed hypotheses. The roadmap is earlier in ORDER.txt. The roadmap index currently returns no main/open-PR package for it. |
| ReductiveGroupsPartII RG2.3.6,2.4.2,2.4.4 | Moy–Prasad filtrations, Iwahori factorization and Cartan/Iwasawa targets exist. Positive-depth subgroups and the special-vertex setting supply the good levels, including residue characteristics 2 and 3. |
| AdelicAlgebraicGroups §§2.2,2.4,3.4,3.5,4.2 | Quotient/Tamagawa measures, compact anisotropic quotients and finite class sets, algebraic heights and simply connected strong approximation. The package now keeps all classes rather than assuming class number 1. |
| GeometryOfNumbersAndQuadraticArithmetic §4.2 | Ratner 4.2.5, ergodic decomposition and Borel density are supplied. The proof first passes to real lattice quotients modulo the centre; it does not apply the connected-semisimple statement directly to an adelic group. |
| GanGrossPrasadUnitaryGroups §§2.6,2.7,3.3,4.2 | Multiplicity one, integrability and factorization targets exist. §3.3 is nonsplit; split §5.1a/§5.2 is the missing citation identified in S04. Orthogonal extensions are explicitly declared gaps. |
| OrthogonalSpinGroups Layers 1–3 | Local images are §2F; real compactness is §2G. Pinned isotropic and real-image theorems remove those cases from the gap. The anisotropic finite-extension and global-image extensions remain declared. |

The 22 gap slugs match exactly between `design/plan.json` and README supplier contracts: no README-only or plan-only slug, and no `supplier: none`. Their explicit hypotheses and interfaces are checked below. Their future proofs are not being certified.

| Gap slug(s) | Precision/minimality test |
|---|---|
| cotlar-stein-strong | Coordinate projections have row bounds 1, strong sum I and tail norm 1: the requested topology is exactly the missing stronger interface, not operator-norm convergence. |
| local-plancherel | Fixes Haar and f(1)=∫trπ(f); compact test f=1 has only the trivial contribution 1. |
| padic-plancherel-density | Restricts to a fixed inducing component and unitary compact torus modulo finite stabilizer; F× example is S¹, not C×. |
| tempered-xi-bounds | Explicit K-finite vectors, dimensions, norms and tempered irreducibility; at identity, unit vectors give 1≤√(dim Ku dim Kv). |
| kernel-spectral-expansion | Smooth two-variable kernels, fixed quotient/level, absolute convergence with derivatives; a rank-one kernel has one term. |
| polynomial-eigenvalue-count | Counts irreducible constituents with multiplicity at fixed level; repeated multiplicity 2 counts twice. |
| orbit-restriction-sobolev | Closed subgroup orbit, fixed Sobolev norm and L² target; identity subgroup orbit gives point evaluation, which requires positive Sobolev order in positive dimension. |
| unitary-exponent-bound; vogan-minimal-ktype | Group-dependent constants, all irreducible unitary representations; the “1+” term includes trivial infinitesimal/Casimir parameters. |
| orthogonal-multiplicity-one; orthogonal-xi-integrability | Explicit characteristic-zero local fields and correct smooth/archimedean categories; norm integrals and logarithmic weights are stated separately from multiplicity. |
| orthogonal-local-period-form; orthogonal-period-factorization | Contragredient factor is explicit; matching compact character integrates to 1, mismatch to 0. Global factorization requires nonzero period and local multiplicity one. |
| induced-multiplicity-one; distinction-upper-semicontinuity | Full normalized induction is distinguished from each constituent; the reducible quadratic SL₂ induction can have two constituents but at most one distinguished one. |
| relative-character-positivity | Actual integral and basis sum are written; a matching rank-one compact test has value 1. This is no longer an undefined free predicate. |
| local-spinor-images; global-spinor-image | Local gap is only anisotropic finite p-adic extensions in dimensions ≤4; binary image has index 2. Global gap requires dimension ≥3 and all places. Existing real/isotropic results are not requested again. |
| unitary-xi-polynomial-tail; orthogonal-xi-polynomial-tail | Explicit faithful algebraic norm and positive exponent; GL₂⊃GL₁ tail X⁻¹/²log X admits every exponent below 1/2. Log weights alone do not give it. |
| hilbert-mumford-linear; free-stable-quotient-bundle | Algebraically closed characteristic zero, reductive action, finite stabilizers versus trivial stabilizers distinguished; bc=1 is a principal G_m torsor and (1,0) has a cocharacter limit. No unowned supplier remains. |

At the pins, `ContRepresentation` is only a homomorphism to continuous linear operators (`Mathlib/RepresentationTheory/Continuous/Basic.lean:54–58`), with no topology on G and no continuity of orbit maps. `TauCeti.ContRepresentation.IsUnitary` is preservation of inner products (`TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean:48`), also not strong continuity. Both missing analytic conditions are explicitly accounted for in the Lean headline. `mulInvariantExp` has completeness, C³, manifold and Hausdorff requirements (`TauCeti/Geometry/Lie/Exponential/Basic.lean:55`); the finite-dimensional E and smooth Lie-group hypotheses supply them. Fourier signs were compared with `Real.fourier_eq` at `Mathlib/Analysis/Fourier/FourierTransform.lean:433` and `SchwartzMap.fourierTransformCLM` at `Mathlib/Analysis/Distribution/SchwartzSpace/Fourier.lean:51`.

The cotangent repairs were checked against `KaehlerDifferential.exact_mapBaseChange_map`, `Algebra.H1Cotangent.exact_δ_mapBaseChange` and `Algebra.IsStandardSmooth.subsingleton_h1Cotangent` in the pinned files named in the contract: none already constructs the requested determinant-line comparison. The orthogonal matrix definition uses the trivial star, so transpose, not complex conjugate transpose, is the relevant operation. The spinor-image declarations at `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Isotropic.lean:56` and `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Real/SpinorNorm.lean:103,127,153` have the stated nondegeneracy/sign hypotheses. The last theorem is explicitly surjectivity on SO, not merely O.

The headline inventory is: star/rescaled calculus; uniform order-zero boundedness; orbit continuity, Rossmann character and uniform trace expansion; uniform Plancherel–Sobolev summability and relative disintegration; disjoint-spectrum stability, stable torsors and unrestricted joint-fibre surjectivity; volume compatibility/orbital disintegration; stable relative-character expansion; positive inverse branching/cuspidal allowability; limit states/disintegration/equidistribution; smoothly weighted period asymptotic. The seven native statements cover boundedness and both matrix cases of the three algebraic headlines. The other headlines are individually named in the module docstring with the missing representation, orbit-measure, smooth-operator, trace, tempered-dual, Bernstein or automorphic carriers. Searches found native Schwartz/tempered distributions, but those are not tempered representations or their Plancherel measure. No missing headline was replaced by algebra on arbitrary scalar functions.

## Verified sound

Read counts: all 1,541 README lines and all 256 Lean lines; 75 numbered README targets, the additional bold definitions/conventions, and 13 Lean declarations (6 real definitions, 7 admitted headline theorems). All 29 earlier findings are individually accounted for: 27 repaired, 2 partly repaired. The full audit recorded 75 target rows, 12 additional README rows and 13 declaration/context rows, including more than 60 distinct computations from the README Checks. This shortened report retains 19 sampled target rows and all 13 declaration/context rows; the previous-finding table also retains its recomputed witnesses. These instance tests do not independently prove the analytic theorems.

Citation counts: 24 supplier citation groups were resolved as tabulated; 22 gap contracts were matched to the plan and checked for named ownership and scope. The dependency check found zero problems. Twenty-six principal source locators were directly compared with their statements: the 25 NV21 loci below and Rallis–Schiffmann Theorem 17.1. Additional proof-level passages were checked for the corrections in Source issues. The five settled inaccessible primary works are not included in that count.

| NV21 principal locator | Printed page(s); extraction anchor |
|---|---|
| Theorem 6.1 | 43–44; nv21 line 1772 |
| Theorem 6.3 | 44–45; nv21 line 1819 |
| Proposition 8.7 | 61–62; nv21 line 2674 |
| Lemma 10.4 | 81–82; nv21 line 3688 |
| Theorem 11.1 | 83–84; nv21 line 3800 |
| Lemma 12.1 | 87; nv21 line 3978; its operator expression includes a square of Op_h(b) |
| Theorem 12.2 | 88–90; nv21 line 3998 |
| Theorem 14.2 | 97; nv21 line 4386 |
| Theorem 14.5 | 99; nv21 line 4477 |
| Lemma 14.6 | 99; nv21 line 4486 |
| Lemma 14.8 | 100–101; nv21 line 4535 |
| Theorem 17.2 | 117–118; nv21 line 5318 |
| Lemma 17.4 | 120; nv21 line 5396 |
| Theorem 19.3 | 123–125; nv21 line 5624 |
| Lemma 19.8 | 133–134; nv21 line 6058 |
| Theorem 22.2 | 146–148; nv21 line 6639 |
| Lemma 22.4 | 148–151; nv21 line 6759 |
| Theorem 24.5 | 160; nv21 line 7269 |
| Lemma 24.10 | 166–167; nv21 line 7563; example also visually checked in published PDF |
| Theorem 26.4 | 176–178; nv21 line 7995 |
| Theorem 26.5 | 178–179; nv21 line 8073 |
| Theorem 27.1 | 181; nv21 line 8177 |
| Theorem 27.7 | 183–186; nv21 line 8330 |
| Theorem 29.1 | 190–193; nv21 line 8664 |
| Theorem 30.1 | 194–200; nv21 line 8840 |

The NV21 cache text was an extraction-failure placeholder. The cached legal published PDF was therefore extracted into review scratch notes, without changing the source cache or copying it into the repository. `nv21 line N` in this report refers to that extraction, `nv21-gs.txt`; theorem numbers and printed pages are the durable locators. The Rallis–Schiffmann source already has the supplied line numbers. The denominator in the page-166 example was checked visually because flattened extracted fractions are easy to misread.

No `set_option`, sorry-backed data, free-Prop surrogate, admitted example, `lemma` declaration, out-of-folder change or computational algorithm was found in the acceptance file/package targets. There is one Mathlib import and two actual pinned Tau Ceti module imports. The seven kept theorems have actual mathematical carriers and needed hypotheses; their truth checks did not produce a new Lean counterexample. This is conditional on the declared supplier gaps and does not certify elaboration.

## Not verifiable

- **Elaborated signatures:** the supplied signature extraction failed because the object file for `TauCeti.Geometry.Lie.Exponential.Basic` was unavailable. No signatures were printed. In accordance with the read-only/no-Lean-build instruction, I did not run Lean or repair the environment. The 13-declaration binder table is a manual source audit, not a successful `#check @name` run. Default elaboration, instance synthesis, universes and import availability as compiled artifacts remain unverified.
- **Five settled primary texts:** `rossmann78` (main theorem and Lemma C, plus the secondary invocation of its continuity lemma), `kostant78` (Theorem 6.7.2), `barbasch-vogan80` (local character expansion), `rangarao72` (local integrability) and `kostant63` (Theorem 5.3) are recorded as uncertified. Their primary proofs and exact original hypotheses were not inspected; NV21's corresponding statements were inspected. No request to fetch these texts again was made.
- **Supplier completion:** the 22 announced gaps are contracts, not proven library results. This report does not certify their future proofs. The earlier unitary-dual Part II supplier is currently inspectable as its board design, with matching numbered targets, but the roadmap index has no main/open-PR package for it; no compiled API or final package from that supplier was available.
- **Exhaustiveness of proof validation:** numerical and algebraic instances cannot certify the analytic uniform estimates, Ratner applications or all source proofs. The 26-locator count above counts direct statement comparisons; it does not represent a new proof of the entire NV21 development. Other sources behind NV21's internal references were not silently treated as independently certified primary proofs.

## Source issues

- **Misprint** in nv21 at §2.5 and proof of Proposition 8.7, printed pp. 28, 62: the source says an unscaled composition equals quantization of the rescaled star product; it should be rescaled on both input operators and the output; affects the proof.
- **Misprint** in nv21 at Lemma 7.6, equation (7.4), printed p. 49: the source says differentiating a monomial retains the intermediate factor ρʲ; it should be ρ^(j−r) after r ζ-derivatives, before the compensating (|x||y|)ʳ factor; affects the proof.
- **Misprint** in nv21 at Lemma 7.10, equation (7.10), printed p. 51: the source says the moment bound lacks the symbol-order weight; it should be multiplied by ⟨ω⟩ᵐ for the weighted localized symbol; affects a stated result.
- **Misprint** in nv21 at Lemma 7.14, printed p. 56: the source says the Taylor coefficient carries (−h)ʲ; it should be hʲ under the stipulated inverse-transform derivative convention; affects a stated result.
- **Misprint** in nv21 at Lemma 8.1(ii), equation (8.3), printed p. 57: the source says the rescaled derivative bound has only h^(−dim g); it should be multiplied by h^(−|α|); affects a stated result.
- **Error** in nv21 at Lemma 8.10, printed pp. 61–62: the source says the countable operator sum converges in operator norm; it should be strong convergence, since orthogonal coordinate projections have tail norm one; affects a stated result.
- **Error** in nv21 at §8.7, printed p. 63: the source says quantizing ⟨ξ⟩²ᴺ gives Δᴺ exactly; it should use the symmetrization preimage of Δᴺ, with lower-degree corrections; affects the proof.
- **Misprint** in nv21 at equations (10.12), (10.14), printed p. 82: the source says G-invariants are evaluated at the smaller representation's infinitesimal character; it should evaluate G-invariants at hλ_π and H-invariants at hλ_σ; affects the proof.
- **Misprint** in nv21 at equation (18.6), printed p. 122: the source says the coefficient function pairs with the ordinary character of σ; it should pair with the contragredient character, matching the conjugated matrix coefficient; affects the proof.
- **Misprint** in nv21 at Appendix A opening integrated-representation formula, printed p. 136: the source says the integrand contains π(f); it should contain π(g); affects nothing.
- **Error** in nv21 at §A.1 explicit choice before Lemma A.1, printed pp. 136–137: the source says a multiple of the unshifted compact Casimir is invertible and supplies all growth conditions; it should use a sufficiently high power of one plus the invariant compact Casimir; affects the proof.
- **Misprint** in nv21 at proof of Lemma A.3(ii), printed p. 139: the source says the trace of Δ_h^(−2N) is comparable to the trace of Op_h(⟨ξ⟩⁻ᴺ)²; it should compare Δ_h^(−N), or retain only the weaker inequality needed for integrability; affects the proof.
- **Error** in nv21 at example following Lemma 24.10, printed p. 166: the source says the Laurent sum divided by n satisfies all three conditions for large n; it should use the Stone–Weierstrass construction, since complementary parameters give exponential growth and odd n gives negative values; affects the proof.
- **Misprint** in nv21 at Theorem 26.5, equation (26.7), printed p. 178: the source says the orbit-to-probability-measures assignment is linear; it should be a continuous equivariant assignment, with linearity on test functions; affects a stated result.
- **Error** in nv21 at proof of Lemma 27.3, printed p. 182: the source says smaller orthogonal local spinor norms are surjective; it should distinguish definite real and anisotropic binary images and supply the global component argument; affects the proof.
- **Misprint** in nv21 at proof of Lemma 27.10, printed p. 185: the source says the homogeneous Lie algebra is contained in the distinguished factor; it should contain that factor, as the immediately preceding intersection computation proves; affects the proof.
- **Error** in rallis-schiffmann at proof of Theorem 17.1, printed p. 83, line 3392: the source says every nonzero orthogonal complement permits a nonzero commuting skew endomorphism; it should separate the one-dimensional orthogonal complement, whose skew Lie algebra is zero; affects the proof; corrected in print at nv21 Lemma 14.8 and Remark 14.9, printed pp. 100–101.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9f8ce66b719ba06e65bbf01e4e03af6c59ccdd2a", "job": "RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
