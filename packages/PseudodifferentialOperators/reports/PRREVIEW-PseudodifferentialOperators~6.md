# Review of PseudodifferentialOperators (pull request #952 at fff2f1c)

**Verdict:** needs changes

## R01 (P2) — Bundle Besov spaces at p=1 and p=∞ have no coordinate-transition input

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:1109`–1111, “construct bundle Besov spaces and their partition comparisons for the full range 1≤p,q≤∞ by localization”, and the API bullet at :1127, “Bounded coordinate/frame transitions give complete bundle spaces”.

**Claim:** The repaired passage promises bundle B^s_(p,q) for every 1≤p,q≤∞, with bounded coordinate and frame transitions and localization-independent norms. The only Euclidean transition estimates in §5.3 are the H^(s,p) multiplication and pullback bounds at :1188–1200, stated for 1<p<∞; through the real interpolation identity they give Besov transitions only for 1<p<∞. §5.4 (:1235–1241) supplies the (p,q)=(∞,∞) Zygmund case by dyadic kernel estimates. For p=1 with any q, and for p=∞ with q<∞, no target, supplier section or locator provides boundedness of pullback by a chart diffeomorphism or of multiplication by a smooth matrix on B^s_(p,q)(ℝⁿ), and the Needs line at :1171–1176 names only “finite-dimensional chart retractions for bundle Besov comparisons”, which presuppose exactly those bounds. The bundle little Besov subspace at p=1 (:1112–1117, “for finite p … using every localized component for bundles”) and its localization independence inherit the same gap.

**Witness:** Bergh–Löfström proves the W^N_p=H^N_p identification and every Mihlin-based estimate only for 1<p<∞ (`bl line 4166`–4168 and 4180–4181, Theorem 6.2.3, pp. 141–142); the Besov results cited in §5.3 (Lemma 6.2.1, Theorems 6.2.4, 6.4.3, 6.4.5) say nothing about diffeomorphisms or variable coefficients. The roadmap's own shear example at :1263–1266 shows pullback bounds are not automatic. Under the dilation φ(x)=2x on ℝ, the annular blocks of u∘φ are the blocks of u shifted by one index with L¹ norm halved, so the B^s_(1,q) norm scales by 2^(s−1): bounded, not isometric, and not supplied by any stated estimate.

**Exact repair (one of two):** (a) Add to §5.3, before the bundle construction, the Euclidean target: for every real s and 1≤p,q≤∞, multiplication by a smooth matrix with all derivatives bounded and pullback by a diffeomorphism φ with φ and φ⁻¹ having bounded derivatives of every positive order are bounded on B^s_(p,q)(ℝⁿ;F). Prove it by the §5.4 method: P2–P4 localized kernels, L¹ kernel bounds (which give every p with one constant, exactly as in the new convolution estimates), finite overlap and ℓ^q summation; for s>0 the modulus-of-continuity characterization of Bergh–Löfström Theorem 6.2.5 (p. 144) with the chain rule is an alternative route. Add it to the Needs line and let the little Besov independence claim cite it. (b) Otherwise restrict the bundle Besov construction and the bundle little Besov subspace to 1<p<∞ (with the (∞,∞) case from §5.4), keeping the Euclidean identity at the full range.

**Repair test:** with (a), the dilation instance above gives ‖u∘φ‖₁=1/2 for the p=1 Check's u, and annular weighted blocks multiplied by 2^(s−1); the stated bound covers it with constant 2^(|s|+1). With (b), the full-range claim at :1110–1111 and the p=1 bundle little space no longer assert anything the roadmap does not prove.

## R02 (P3) — Locator of Theorem 5.6.1

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:1105`, “(Bergh–Löfström, Theorem 5.6.1, pp. 121–122)”.

**Claim and witness:** the theorem is printed on p. 122 and its proof runs to p. 123 (`bl line 3598`–3615, page header 122 immediately precedes the statement).

**Repair:** write “pp. 122–123”.

## Previous findings

- R01 — repaired: README:1081–1084 states the Euclidean identity for 1≤p≤∞, 1≤q≤∞, 0<θ<1 and distinct s₀,s₁ with equivalent norms; :1091–1103 give the Lemma 6.2.1/Theorem 6.2.4 route; :1144–1152 add the p=∞ and p=1 Checks. The accompanying extension of bundle Besov spaces to the full range introduces this report's R01.

## Verified sound

:robot: AI review, incremental re-review of 48 changed lines since 88ffdf3. Only `README.md` changed (39 insertions, 9 deletions, all in §5.3 and the opening sentence of the integer-order paragraph that follows it); `Suggested.lean` and `metadata.toml` are byte-for-byte the files the previous review read. Head confirmed as fff2f1c7b9c0d85edceb7ef2891348e7128cd587, clean worktree, no change outside the roadmap folder. The changed passage, everything it cites (Bergh–Löfström §6.2, §6.4 and §5.6, PDE Lane B.9, Mathlib's Bessel potential space) and everything that depends on it (the API bullets and Checks of §5.3, the Needs line, the bundle Besov and little Besov statements, the §5.4 Zygmund construction, the integer-order identification) were reviewed in full. Unchanged passages carry the previous report's checks by citation.

**Gate and Lean checks.** The worker's gate at this head passes every scanner, the dependency check and the targeted build. My rerun of the gate passes every scanner and the dependency check. Direct elaboration with `lake env lean` of `Suggested.lean` exits 0 with exactly the eight `declaration uses sorry` warnings at :62, :75, :90, :101, :184, :214, :225, :241 and no other output. Because the Lean file is unchanged, the previous report's `#check @name` comparison of 22 signatures and its eight one-tactic padding probes stand; nothing was added that could be padding or a stand-in. The prescribed dependency command prints

```text
depcheck: 208 roadmaps, 1461 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. The new Needs line adds no supplier edge: PDE Lane B.9 and Lane B multiplier estimates were already consumed.

**Sources reopened for this increment.** Bergh–Löfström was read from the author's Chalmers copy recorded by the sources service (source id `bl`, pdftotext extraction; printed page = extraction page − 8).

| Changed assertion | Locator and verification |
|---|---|
| Euclidean identity for 1≤p≤∞, 1≤q≤∞, s₀≠s₁ | `bl line 4441`–4462, Theorem 6.4.5(4), printed pp. 152–153: no restriction on p or q beyond Definition 6.2.2 (`bl line 4145`–4152, 1≤p,q≤∞); the proof says (4) is contained in Theorem 6.2.4. |
| Localized convolution estimates, constants independent of j and p | `bl line 4125`–4129, Lemma 6.2.1, p. 140: (1) for k≥1, (3) for the low block, 1≤p≤∞, constants independent of p and k. The README's route (L¹ kernel bounds, L¹ and L∞ operator bounds, Riesz–Thorin) is a valid proof of the same inequalities; the source instead uses its multiplier-norm lemmas 6.1.2 and 6.1.5. |
| Two embeddings and deduction of the identity | `bl line 4199`–4223, Theorem 6.2.4, pp. 142–143: (9) B^s_(p1)⊂H^s_p⊂B^s_(p∞) for s∈ℝ, 1≤p≤∞; (10) the identity for s₀≠s₁; the proof uses Lemma 6.2.1 on both sides exactly as the README describes, plus convergence of the dyadic sum in H^(s₀)_p+H^(s₁)_p. |
| Weighted-sequence K-method formula with q=∞ | `bl line 3601`–3609, Theorem 5.6.1, p. 122: s₀≠s₁, all q≤∞, including the c₀ replacement when q₀<q₁=∞. The page locator is off by one (R02). |
| Retraction onto weighted sequence spaces | `bl line 4398`–4400, Theorem 6.4.3, p. 151: Besov retract for 1≤p,q≤∞; the Bessel retract only for 1<p<∞, consistent with the roadmap's interior-p bundle Bessel transitions. |
| Riesz–Thorin supplier | main `TauCetiRoadmap/PDE/README.md:273`–275, Lane B item 9: Marcinkiewicz and Riesz–Thorin, noted as absent from Mathlib. |
| “J^s is the Bessel multiplier (1+‖ζ‖²)^(s/2) in Mathlib's Fourier variable” | pinned `Mathlib/Analysis/FunctionalSpaces/BesselPotentialSpace.lean:14`, :45–47, :205: the carrier is defined through 𝓕⁻ (1+‖ξ‖²)^(s/2) 𝓕 u with Mathlib's 2π-phase transform, for p≥1 including ∞; agrees with README:1549's weight 〈ξ/(2π)〉^t in angular frequency. |
| Kernel of J^(−2) on ℝ | computed: ∫ π exp(−2π|x|) exp(−2πixζ) dx = 1/(1+ζ²) (checked at ζ=0, 1/2, 1, 2: 1, 0.8, 0.5, 0.2) and ∫ π exp(−2π|x|) dx = 1. |

**Ownership and duplication.** Neither pinned library contains a Besov, little Besov or Zygmund carrier (grep of Mathlib and Tau Ceti for “Besov”: no file). The roadmap service's search finds Besov material only in the open PDE revision (a revision of an existing roadmap, not a supplier) and in the open IncompressibleFlows pull request, whose files this brief does not supply; see Not verifiable. No new cross-roadmap citation was added; the previous report's resolution of SmoothBundlesConnections, PDE, ComplexKahlerGeometry K5a and the other suppliers stands unchanged.

**Computed adversarial pass.** New rows record fresh computations for every changed statement and for the statements that depend on it; the remaining rows are carried from the previous report, each marked. “Pass” describes the displayed instance, not a proof of the general theorem.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Euclidean identity at p=∞ (new Check) | ℝ, u=1, (s₀,s₁)=(0,2), θ=1/2, q=∞ and q=2 | ‖1‖_∞=1, ‖J²1‖_∞=‖(1−Δ/4π²)1‖_∞=1; J^(−2) has kernel π exp(−2π\|x\|), mass 1, so ‖u₁‖_∞≤‖J²u₁‖_∞ and K(t,1)=min(1,t); q=∞ norm sup t^(−1/2)min(1,t)=1; q=2 norm (∫₀¹1dt+∫₁^∞t^(−2)dt)^(1/2)=√2; Besov blocks (1,0,0,…), norm 1 for every q | Pass; equality of spaces with equivalent, not equal, norms | None |
| Euclidean identity at p=1 (new Check) | ℝ, g=π^(−1/2)exp(−x²), u=J^(−2)g, θ=1/2, q=∞ | ∫g=1, kernel nonnegative with mass 1, so ‖u‖₁=1, ‖J²u‖₁=‖g‖₁=1 (numerically 1.0001 on a coarse grid); J^(−2) contractive on L¹ gives K(t,u)≥min(1,t)‖u‖₁ and the trivial decompositions give ≤, so K=min(1,t); norm 1; u=0 gives 0 | Pass | None |
| Localized convolution estimate ‖J^sΔ_ju‖_p≤C_s2^(js)‖Δ_ju‖_p | ℝ, p=∞, Δ_ju=exp(2πi2ʲx) (Fourier point mass at 2ʲ), s=2, j=1,2,3 | Left side (1+4ʲ)=5, 17, 65; right side C₂·4, 16, 64; ratios 1.25, 1.0625, 1.0156 → C₂≥1.25, and (1+4^(−j))^(s/2) is bounded, so a finite C_s exists; the rescaled kernel argument gives the same constant for every p | Pass | None |
| Reverse block estimate via −s | same u, s=−2 then s=2 | ‖J^(−2)Δ₁u‖_∞=1/5 ≤ C_(−2)·4^(−1) needs C_(−2)≥0.8; then 2^(js)‖Δ_ju‖_p ≤ C_(−s)‖Δ_jJ^su‖_p reads 4 ≤ 0.8·5=4 | Pass; both directions consistent | None |
| L¹/L∞ operator bounds and Riesz–Thorin with one constant | K=π exp(−2π\|x\|) | Tonelli gives ‖K∗f‖₁≤‖K‖₁‖f‖₁=‖f‖₁; the integral norm bound gives ‖K∗f‖_∞≤‖f‖_∞; Riesz–Thorin gives ‖K∗‖_(p→p)≤1^(1−θ)1^θ=1 for every p; on f=1 the output is 1, so the bound is attained at p=∞ | Pass; constant independent of p | None |
| Embeddings B^s_(p,1)⊂H^(s,p)⊂B^s_(p,∞) at p=∞ | u=1 at s=0; δ₀ at s=−1 and s=−2 with annular blocks of sup norm c2ʲ | u=1: all three norms 1. δ₀, s=−1: weighted blocks c (bounded) so δ₀∈B^(−1)_(∞,∞), while J^(−1)δ₀ has a logarithmic singularity at 0 and is not in L∞, so δ₀∉H^(−1,∞): the second inclusion is strict. δ₀, s=−2: Σc2^(−j)<∞ so δ₀∈B^(−2)_(∞,1), and J^(−2)δ₀=π exp(−2π\|x\|) has sup norm π, so δ₀∈H^(−2,∞) | Pass; both inclusions hold and are strict in the instances | None |
| Weighted-sequence K-method formula (Theorem 5.6.1) at q=∞ | weights 1 and 2ᵏ, one unit coefficient at position k, θ=1/2 | K(t)=min(1,t2ᵏ); sup t^(−1/2)K=2^(k/2), the weight 2^(kθ(s₁−s₀)) predicted by the formula; at k=4 both sides are 4 | Pass | None |
| Interpolated order | s₀=0, s₁=2, θ=1/4 | s_θ=1/2, not 3/2 | Pass | None |
| q indices in the sandwich | N unit weighted coefficients, p=2 | ℓ¹ norm N, ℓ∞ norm 1, Hilbert norm √N; 1≤√N≤N | Pass | None |
| Bundle Besov transitions at p=1,∞ | ℝ, dilation φ(x)=2x on the p=1 Check's u; shear (x,y)↦(x,y+x³) from §5.4 | ‖u∘φ‖₁=1/2; annular block j of u∘φ is block j−1 of u composed with φ, weighted norm multiplied by 2^(s−1) (s=0: 1/2; s=2: 2); shear: L² isometry, unbounded on H¹ | Fails: bound true but no target or source supplies it for p∈{1,∞}: R01 | Add the Euclidean Besov transition target or restrict to 1<p<∞ |
| Bundle little Besov at p=1 | same dilation on the little space | weighted tail 2^(js)‖Δ_ju‖₁→0 is preserved by the index shift and factor 2^(s−1) | Pass conditionally on R01's transition bound | None beyond R01 |
| Integer identification restricted to 1<p<∞ | ℝ, p=∞, f=\|x\|·χ with χ=1 near 0 | f∈W^(1,∞) with ‖f′‖_∞=1; Hf′=(1/π)log\|x²/((x−1)(x+1))\| near 0 takes the values −0.35 at x=1/2 and −2.93 at x=1/100 and is unbounded, and J¹−\|D\| is bounded on L∞, so f∉H^(1,∞) | Negative control; the restriction to 1<p<∞ is necessary | None (the clause “when p<∞” is now redundant) |
| Needs line split | items of the Euclidean identity versus the bundle transitions | Euclidean identity uses real interpolation, dyadic partitions, L¹ kernel bounds, Tonelli, integral norm bound, Riesz–Thorin: each is a target here or PDE Lane B.9; interior-p bundle transitions use complex interpolation and Lane B multipliers: both present | Pass except the endpoint bundle transitions (R01) | R01 |

**Rows carried from the previous report** (statements the diff leaves untouched; values as computed there):

| Statement | Instances tried | Values computed on each side | Result and provenance |
|---|---|---|---|
| §4.2 coordinate transformation and compatible full-symbol patching | y=exp(x), principal ξ², input f=x | Pulled-back operator (−∂²+∂)f=1; direct x quantization gives 0; difference is ∂ | Pass; equal principal symbols do not imply smoothing; carried from r5 |
| Finite-rank frame transformation | Constant frame exchange S=[[0,1],[1,0]], symbol A=diag(1,2) | S⁻¹AS=diag(2,1); at v=(1,0) transformed output (2,0), not (1,0) | Pass; carried from r5 |
| Classical principal-symbol kernel and order drop | P=D²+D, Q=D², m=2 | Both leading symbols ξ²; P−Q=D has order 1 and leading value 2 at ξ=2 | Pass; carried from r5 |
| Surjective lift by frequency cutoff | Degree-2 a=ξ²; cutoff zero for norm≤1, one for norm≥2 | Lifted symbol at ξ=0 is 0, at ξ=3 is 9; degree-2 term is ξ², lower homogeneous terms 0 | Pass; carried from r5 |
| Linear quantization and continuous parameter seminorms | a=ξ, b=2ξ; a_t=(1+t)ξ on circle | Q(a+b)=3D=Q(a)+Q(b); each coefficient seminorm of Q(a_t)−Q(a_s) is abs(t−s) times that of D | Pass; carried from r5 |
| Lift with prescribed initial operator | P₀=D+2Id; a_t=(1+t)ξ; mode k=2 | Lift eigenvalue 4+2t; at t=0 it is 4, matching P₀, whereas Q(a₀) alone gives 2 | Pass; carried from r5 |
| Global class by chart compression | Identity kernel δ(x−y), chart cutoff φ=ψ=χ | χIdχ is multiplication by χ²; at χ=1/2 coefficient is 1/4; off diagonal kernel is 0 | Pass; carried from r5 |
| Full-symbol recovery via Fourier point mass | a=1+ξ, exponential exp(2ix) | (Id+D)exp(2ix)=3exp(2ix); recovered value 3 equals a(x,2) | Pass; carried from r5 |
| Displacement Fourier sign | δ₀−iδ₀′, ξ=2 | Fδ=1, Fδ′=2i; 1−i(2i)=3; reversed displacement gives −1 | Pass; carried from r5 |
| Output support iff x-support of full symbol | χ supported in K; Id tested on nonzero bump outside K; zero symbol with K empty | χf outside K=0; Id f outside K=f≠0; zero symbol/kernel/output all 0 | Pass both directions; carried from r5 |
| Proper-support truncation versus exact recovery | Full smoothing kernel exp(−(x−y)²), cutoff ρ(x−y)=1 near 0 | Kernel difference (1−ρ(z))exp(−z²) is smooth and nonzero where ρ=0; hence symbol difference is smoothing, not identically 0 | Pass; carried from r5 |
| Square partitions and principal lift | χ₁=χ₂=1/√2 | χ₁²+χ₂²=1; unsquared sum=√2 | Pass; carried from r5 |
| Finite-q smooth density | Weighted coefficients 2⁻ʲ | Tail ℓ^q norm after N is 2^(−N−1)/(1−2^(−q))^(1/q)→0; for q=2,N=0 equals 1/√3 | Pass; carried from r5 |
| Failure of full q=∞ smooth density | u=Σ₂⁻ʲ exp(i2ʲx), s=1,p=2 | All weighted blocks 1; every partial-sum error 1; smooth v has weighted blocks→0, so distance≥1 | Pass as negative control; carried from r5 |
| Little Besov vanishing-tail definition | Weighted sequences 1, 2⁻ʲ and 0 | Limits 1,0,0 respectively; first excluded, other two admitted | Pass; carried from r5 |
| Little Besov approximation error | Coefficients 2⁻²ʲ, s=1, truncation after N | Weighted supremum tail 2^(−N−1)→0; N=0 gives 1/2 | Pass; carried from r5 |
| Finite trigonometric polynomials and zero | Single frequency 2ᴶ and zero | Blocks vanish above J+1; weighted tails eventually 0 in both cases | Pass; carried from r5 |
| Little subspace closed and complete | c⁰ model; weighted tail of limit within ε of a c⁰ sequence | limsup tail≤ε for every ε>0, hence 0; truncated 2⁻ʲ sequences have sup-error 2^(−N−1) | Pass; carried from r5 |
| Isometric inclusion for chosen norm | Weighted sequence 2⁻ʲ, j≥1 | Little inherited norm=1/2=full ℓ∞ norm; unit weighted sequence would have norm 1 but is excluded | Pass; carried from r5 |
| Bessel density and bilinear duality restriction retained | p=2, u=exp(ix) on normalized circle, orders ±s | Bessel norms 2^(s/2),2^(−s/2), product 1; pairing with exp(−ix) is 1 | Pass; carried from r5 |
| Compactness and corrected (5.2) page | Circle multipliers (1+k²)^(−1/2) and 1 | First eigenvalues→0, tail norm after abs(k)≤N is (1+(N+1)²)^(−1/2); identity tail norm 1 | Pass; carried from r5 |
| Averaging in closure and actual classical class | Trivial group; reflection conjugating multiplication by x; Id | Averages T, (x−x)/2=0 and (1+1)/2=1; constant principal symbol 1 preserved | Pass; carried from r5 |
| Classical coefficient seminorm control under averaging | Two-element group, coefficients f(x), f(−x), remainder bounds C₁,C₂ | kth derivative of average is (f^(k)(x)+(−1)^k f^(k)(−x))/2; remainder norm bound (C₁+C₂)/2 | Pass; carried from r5 |
| Downstream homogeneous path use | P_t=(1+t)D+2Id, t∈[0,1], unit covector ξ=±1 | abs(σ₁P_t)=1+t≥1; seminorm difference abs(t−s); initial correction does not change ellipticity | Pass; carried from r5 |
| Angular versus Mathlib Fourier normalization | n=1, ξ=2πζ | (2π)⁻¹dξ=dζ; both integrands have exp(2πixζ)a(x,2πζ)𝓕u(ζ) | Pass; none.; carried from r5 (from r4) |
| D=−i∂ and geometric/Fourier symbols | exp(ixξ), ξ=2 | ∂u=2iu, Du=2u; geometric symbol 2, Fourier symbol 2i | Pass; none.; carried from r5 (from r4) |
| Formal-adjoint symbol parity | ∂, order 1 | Geometric symbol of ∂* is −ξ; (−1)¹ξ=−ξ. Fourier symbol −iξ=conj(iξ) | Pass; none.; carried from r5 (from r4) |
| Bilinear distribution pairing | Constant scalar i multiplying a real test φ | Both native and Lean pairings are i∫φu; a conjugate-test pairing would give −i on test iφ | Pass; keep distinct from Hermitian pairings.; carried from r5 (from r4) |
| smoothVanishingIdeal | At 0 on ℝ, f=x and g=1 | f(0)=0, g(0)=1; f∈I₀, g∉I₀ | Pass; none.; carried from r5 (from r4) |
| Ideal-square iff zero value and derivative | f=x² and g=x at 0 | x²=x·x∈I₀², (f(0),f′(0))=(0,0); g′(0)=1 and g∉I₀² | Both directions discriminate; none.; carried from r5 (from r4) |
| Global, finite algebraic ideal square | Discrete zero-dimensional M | Indicator e of M\{x} satisfies e²=e; every f∈Iₓ equals ef, so Iₓ²=Iₓ and differential=0 | Pass; no infinite-sum ideal product used.; carried from r5 (from r4) |
| Empty/zero-dimensional geometry | Empty M; one point | Empty M has no x to instantiate; one point has I=0, cotangent=0 and derivations=0 | Pass; none.; carried from r5 (from r4) |
| Cotangent equivalence and its prescribed map | ℝ at 0, class of 3x+x² | Both class-to-differential and target covector evaluate v as 3v; a rescaled map would give 6v at scale 2 | Pass; prescribed equation excludes rescaling.; carried from r5 (from r4) |
| Smooth section module/scalar towers | Trivial line, f=x, s=2, x=3 | (f·s)(3)=6; with constant scalar 5, both tower orders give 30 | Pass; native section carrier retained.; carried from r5 (from r4) |
| Restriction and point evaluation of section multiplication | Same section restricted to (2,4) | Restrict(fs)(3)=6=f(3)restrict(s)(3) | Pass; none.; carried from r5 (from r4) |
| First-jet carrier | s=1+2x and t=1+2x+x² at 0 | Both jets are (1,2); second derivatives are 0 and 2 | Pass; first jet does not encode second derivative.; carried from r5 (from r4) |
| Jet exact sequence/connection splitting | Trivial line with ∇=d+a dx | j¹s=(1,2); splitting derivative component is 2+a, projection remains 1; at a=2 gives 4 | Pass; splitting depends on connection.; carried from r5 (from r4) |
| First-jet product rule | f=x, s=1+2x at 0 | d(fs)=1; f ds+s df=0·2+1·1=1 | Pass; omitting the zero-order term gives 0.; carried from r5 (from r4) |
| derivationVectorField evaluation | D=∂, f=x², x=3 | (Df)(3)=6; field value 1 acts on df₃ as 6 | Pass; none.; carried from r5 (from r4) |
| Smoothness of algebraic derivation field | D=x∂ on ℝ | Field x↦x is smooth; at 0 and 2 coefficients are 0 and 2 | Pass; field not merely pointwise arbitrary.; carried from r5 (from r4) |
| Derivation equivalence and linearity | D=∂, scalar 5 | e(5D)=5e(D); applying to x² at 3 gives 30 on both sides | Pass; zero/rescaled arbitrary correspondences excluded.; carried from r5 (from r4) |
| Complex derivation dictionary | Xu=10, Yv=6, Yu=5, Xv=8 | δ(u+iv)=(10−6)+i(5+8)=4+13i | Pass; minus sign in real component necessary.; carried from r5 (from r4) |
| Complex structure on real pair | (X,Y)=(1,2) | J(X,Y)=(−2,1); J²(X,Y)=(−1,−2)=−(X,Y) | Pass; none.; carried from r5 (from r4) |
| Derivation Lie bracket and Leibniz law | X=x∂, Y=∂ | [X,Y]=−∂; applied to x gives −1; reversing bracket gives 1 | Pass; convention fixed.; carried from r5 (from r4) |
| Differential operators via iterated commutators | P=∂², multiplication by x | [P,x]=2∂, [[P,x],x]=2Id, third commutator=0 | Pass; exact order detected.; carried from r5 (from r4) |
| Differential jet evaluation/local coefficients | P=∂+3, f=x² at 2 | Pf=4+12=16; first jet (4,4) gives 4+3·4=16 | Pass; not determined by derivative alone.; carried from r5 (from r4) |
| Density transpose/formal adjoint | P=x∂ with dx | P*=−x∂−1; on constant 1 gives −1, whereas −x∂ gives 0 | Pass; divergence term retained.; carried from r5 (from r4) |
| Principal symbol composition | ∂ followed by ∂ | Fourier symbols (iξ)(iξ)=−ξ²; ∂² has symbol −ξ² | Pass; none.; carried from r5 (from r4) |
| Matrix leading commutator | A=e₁₂, B=e₂₁, order zero | AB=diag(1,0), BA=diag(0,1); commutator=diag(1,−1) | Pass; no scalar order drop for arbitrary matrices.; carried from r5 (from r4) |
| Laplace-type scale and Dirac-square convention | −c∂², ξ=2, c=1 or 2 | Principal values 4 and 8; (i∂)²=−∂² gives 4 | Pass; positive scalar normalization retained.; carried from r5 (from r4) |
| Bochner connection versus density adjoint | Circle weight exp(sin x)dx, scalar weighted Laplacian | Drift at 0 is −∂; Bochner coefficient is 1/2, so metric-compatibility defect at 0 is 1, not 0 | Pass; canonical-density hypothesis matters.; carried from r5 (from r4) |
| Peetre finite order locally | Disjoint circles, P on component j equals ∂ʲ | Compact set meets finitely many components, order max j; over all components orders 1,2,3,… are unbounded | Pass; no global uniform order claimed.; carried from r5 (from r4) |
| Peetre's locality condition | Translation Tf(x)=f(x+1) | Bump supported near 1 has Tf(0)≠0 while 0∉supp f | Negative control; hypothesis excludes translation.; carried from r5 (from r4) |
| CoordinateSpace/coordinateDeriv | n=1, f=x³, lists [],[0],[0,0] at x=2 | Values 8,12,12; n=0 admits only the empty index list | Pass; no out-of-range Fin index.; carried from r5 (from r4) |
| mixedDeriv ordering | a(x,ξ)=x²ξ³, one x and one ξ derivative | ∂x∂ξa=6xξ²; at (2,3) both orders give 108 | Pass; smoothness justifies permutation.; carried from r5 (from r4) |
| Local symbol estimates | a=ξ, m=1 | At ξ=2, 2≤√5; first ξ derivative=1 and weight exponent (1−1)/2=0 gives 1 | Pass; no order-zero bound as ξ→∞.; carried from r5 (from r4) |
| Local versus uniform symbol | a=x, K=[−R,R] | Compact x-bound R; all-x supremum ∞ | Pass; IsUniform is substantive.; carried from r5 (from r4) |
| Compact spatial support | a=χ(x) with compact support; a=1 | Outside suppχ values 0; a=1 stays 1 outside every compact set on ℝ | Pass; not mere proper kernel support.; carried from r5 (from r4) |
| HomogeneousSymbol scaling | ξ², m=2, t=2, ξ=1 | a(2)=4=2²a(1); degree-1 alternative gives 2 | Pass; none.; carried from r5 (from r4) |
| Positive-only homogeneity | \ | ξ\ | , degree 1, ξ=±2; carried from r5 |
| Assigned value at zero | Degree-zero symbol a(ξ)=1 for ξ≠0, a(0)=0 | Values 1 away from zero and 0 at zero; smooth away, not continuous across zero | Pass; no false global smoothness.; carried from r5 (from r4) |
| FrequencyCutoff bounds and denominators | Standard smooth transition h(t)/(h(t)+h(1−t)) | At t=0,1/2,1 gives 0,1/2,1; denominator positive everywhere because one argument is positive | Pass; no 0/0.; carried from r5 (from r4) |
| FrequencyCutoff wrong models | Step function; smooth overshoot | Step jumps 0→1 and fails smoothness; value 3/2 fails upper bound 1 | Pass; both laws discriminate.; carried from r5 (from r4) |
| ClassicalSymbol remainder equality | a=ξ²+1, terms ξ²,0,1 | N=0 remainder=ξ²+1; after N=3 remainder=(1−χ)(ξ²+1), zero at large ξ | Pass; N=0 and zero covector retained.; carried from r5 (from r4) |
| Classical versus arbitrary order drop | a=⟨ξ⟩^(1/2)+1, proposed degree 1/2 classical leading term | Constant remainder behaves as 1, not O(⟨ξ⟩^(−1/2)); ratio grows as ⟨ξ⟩^(1/2) | Negative control; not every symbol is classical.; carried from r5 (from r4) |
| exists_asymptoticSum, repeated orders | Orders 0,0,−1,…; first two symbols 1,2, then 0 | Choose b=3: remainders at N=0,1,2 are 3,2,0 with orders 0,0,−1 | Pass; antitone need not be strictly decreasing.; carried from r5 (from r4) |
| Borel sum is not pointwise series convergence | aⱼ=(−1)ʲ⟨ξ⟩⁻ʲ, b=1/(1+⟨ξ⟩⁻¹) | At ξ=0: b=1/2; remainders 1/2,−1/2,1/2; raw partial sums 0,1,0,1,… | Pass; asymptotic remainder order, not convergence, is claimed.; carried from r5 (from r4) |
| Compact parameter Borel bounds | Constant family of the preceding symbols | Same seminorms for every parameter; ξ=0 remainders remain ±1/2 | Pass; no parameter-dependent arbitrary cutoff.; carried from r5 (from r4) |
| Oscillatory quantization of identity | u=exp(−x²), a=1, x=0 | Op(1)u(0)=u(0)=1 by Fourier inversion | Pass; normalization excludes zero map.; carried from r5 (from r4) |
| quantizeSchwartzValue of derivative/zero | a=ξ, x=1; a=0 | −iu′(1)=2i/e; zero symbol gives integral 0 | Pass; total integral is used where convergence is proved.; carried from r5 (from r4) |
| Kernel correspondence | Identity versus smooth kernel 1 | Identity kernel is δ(x−y), output u; kernel 1 gives constant ∫u | Pass; not every operator has a smooth kernel.; carried from r5 (from r4) |
| Proper support and smoothing | K(x,y)=exp(−(x−y)²) on ℝ² | K(0,1)=e⁻¹ and support=ℝ²; preimage of compact {0} under first projection is {0}×ℝ, noncompact | Pass; smoothing does not imply proper support.; carried from r5 (from r4) |
| Amplitude reduction | a(x,y,ξ)=y with local cutoffs | δ(x−y)y evaluates to x; reduced operator is multiplication by x | Pass; diagonal leading term correct.; carried from r5 (from r4) |
| Composition convention | a=ξ, b=x | ξ#x=xξ−i; x#ξ=xξ; [D,x]=−i | Pass; sign fixed.; carried from r5 (from r4) |
| Adjoint lower-order correction | P=exp(ix)D, input exp(2ix) | P*exp(2ix)=exp(ix); using conjugate leading symbol alone gives 2exp(ix) | Pass; coefficient derivative necessary.; carried from r5 (from r4) |
| Ordered matrix commutator formula | p₁=p₂=ξ(A+sin x B), A=e₁₂,B=e₂₁ | Actual [P,P]=0; ordered first correction cancels to 0; reordered scalar bracket at (0,1) gives diag(−i,i) | Pass in roadmap; source error recorded.; carried from r5 (from r4) |
| schwartzToSobolev native comparison | u=0; arbitrary Schwartz u | Distribution component is u, hence at u=0 evaluates every φ to 0 | Pass; real definition, not a free witness.; carried from r5 (from r4) |
| exists_quantizeSobolev | χ multiplication, s=m=0 | ‖χu‖₂≤‖χ‖∞‖u‖₂; if χ=0 both sides 0 | Pass; compact local coefficients suffice.; carried from r5 (from r4) |
| exists_quantizeUniformOrderZero | a=1, nonzero fiber; zero fiber | Identity operator norm 1; on the zero space norm 0 and both pairings 0 | Pass; degenerate fiber harmless.; carried from r5 (from r4) |
| Necessity of uniform control for global L² | a=x, unit L² bumps supported in [k,k+1] | ‖Op(a)uₖ‖₂≥k while ‖uₖ‖₂=1 | Pass; no global bound for merely local order zero.; carried from r5 (from r4) |
| Weak space versus zero-boundary closure | Constant 1 on [0,1] | Weak derivative 0; traces (1,1), so in W¹,p but not W¹,p₀ | Pass; native zero-extension result not overused.; carried from r5 (from r4) |
| Critical W^(n,1) endpoint | uε(x)=φ(x/ε) | ‖∂ⁿuε‖₁=‖∂ⁿφ‖₁, ‖uε‖∞=‖φ‖∞≠0; support shrinks | Pass; continuous embedding does not give compactness at the endpoint.; carried from r5 (from r4) |
| p=∞ smooth density exclusion | u=\ | x\ | in a chart; carried from r5 |
| Banach couple sum/intersection | A₀=A₁=ℂ, u=1 | Sum quotient norm inf(\ | a\; carried from r5 |
| Complex interpolation endpoint weights | Endpoint norms \ | z\ | and 2\; carried from r5 |
| Strip decay condition and quotient norm | Equal endpoints, Fε(z)=exp(ε(z−θ)²) | Fε(θ)=1; boundary maxima→1 as ε→0; constant function has no decay | Pass; infimum gives norm 1 without an inadmissible minimizer.; carried from r5 (from r4) |
| Interpolation exponent/order | p₀=2,p₁=4,θ=1/2; s₀=0,s₁=2,θ=1/4 | 1/p=3/8 so p=8/3; s=1/2, not 3/2 | Pass; none.; carried from r5 (from r4) |
| Bundle coordinate-transition norms | Shear (x,y)↦(x+ky,y), det=1 | L² norm unchanged; derivative coefficients acquire k and higher-order norms depend on k | Pass; volume control alone is insufficient.; carried from r5 (from r4) |
| Morrey exponent and integer margin | n=3,k=2,p=2; n=2,k=2,p=2 | Margins 1/2 and 1; second case permits β<1, not an asserted C¹ endpoint | Pass; strict endpoint qualification retained.; carried from r5 (from r4) |
| Full Hölder norm | Constant 1 | Sup norm 1, Hölder seminorm 0; full norm 1 | Pass; seminorm alone is not a norm.; carried from r5 (from r4) |
| Little Hölder closure | u=\ | x\ | ^α near 0; carried from r5 |
| Hölder exponent discrimination | β=α+1/2 or α−1/2, h=1/16 | Quotients \ | h\; carried from r5 |
| Zygmund distributions | δ₀ on ℝ, dyadic block constant c | ‖Δⱼδ₀‖∞=c2ʲ; s=−1 weighted value c, s=0 grows c2ʲ | Pass; distribution carrier necessary.; carried from r5 (from r4) |
| Ehrling lower-order term | Nonzero constant section, ε=1/2 | 1≤1/2+Cε requires Cε≥1/2; omitting lower-order term says 1≤1/2 | Pass; none.; carried from r5 (from r4) |
| Smoothing local regularization | δ₀ and Gaussian kernel | Output exp(−x²), value at 0 is 1 and all derivatives exist | Pass; smoothness is substantive.; carried from r5 (from r4) |
| Ellipticity at nonzero covectors | Principal ξ² at ξ=2; zero map on ℂ | Value 4 has inverse 1/4; zero map has kernel ℂ | Pass; inverse hypothesis substantive.; carried from r5 (from r4) |
| Zero-dimensional ellipticity | n=0; unequal fiber dimensions allowed | There is no ξ≠0; inverse identities are quantified over the empty set, homogeneous coefficient at 0 is 0 | Pass; no invalid rank-equality inference.; carried from r5 (from r4) |
| exists_inversePrincipalSymbol | ξ=2 and t=2 for order 2 | Both products 4·1/4=1; b(4)=1/16=2⁻²b(2); at ξ=0 assigned b=0 with no inverse equation | Pass; two sides and zero exclusion checked.; carried from r5 (from r4) |
| Two-sided parametrix | Circle L=1−∂², modes k=0,1,2 | L multiplier 1,2,5; inverse 1,1/2,1/5; products all 1 | Pass; none.; carried from r5 (from r4) |
| Smoothing defect for noninvertible elliptic operator | Circle Δ, constant mode | Green multiplier 0 at k=0; ΔG=0=Id−Π there, not Id=1 | Pass; kernel projection retained.; carried from r5 (from r4) |
| Elliptic a priori estimate | u=1 on circle | Δu=0 but ‖u‖₂=√(2π); a lower-order norm is necessary | Pass; no false coercivity.; carried from r5 (from r4) |
| Solvability/cokernel orthogonality | Δu=1 on circle | ∫Δu=0 whereas ∫1=2π | Pass; orthogonality obstruction is exact.; carried from r5 (from r4) |
| Overdetermined ellipticity distinction | d on scalar functions, ξ=(1,0) in ℝ² | Symbol z↦(iz,0) injective rank 1, not onto ℂ²; in ℝ¹ nonzero ξ gives an isomorphism | Pass; injective symbol not conflated with two-sided ellipticity.; carried from r5 (from r4) |
| Nonlinear bootstrap before Schauder | n=4, initial exponent 3 | 1/12=1/3−1/4; 1/6=1/12+1/12; W¹,⁶ gives margin 1−4/6=1/3 | Pass; prior positive regularity is produced.; carried from r5 (from r4) |
| Elliptic powers/strict positivity | L=1−∂², k=0,1,2 | Eigenvalues 1,2,5; L⁻¹ᐟ² gives 1,1/√2,1/√5; L⁰ gives 1,1,1 | Pass; no zero-eigenvalue division.; carried from r5 (from r4) |
| Sobolev domains of powers | Mode k of L | L^(s/2) multiplies by (1+k²)^(s/2); its graph weight matches H^s | Pass on model; general source comparison uncertified.; carried from r5 (from r4) |
| Strong parameter resolvent scaling | (ξ²−λ)⁻¹, (ξ,λ)↦(2ξ,4λ) | New value is 1/4 old value; at ξ=0, λ=−1,−2 values are 1 and 1/2 | Pass; combined homogeneity does not allow ξ-only simplification.; carried from r5 (from r4) |
| Weak rescaling requires derivative control | b(r,ξ)=r/(1+rξ²), r≥0 | ∂rb(0,ξ)=1; ∂r²b(0,ξ)=−2ξ² | Pass as model; Grubb–Hansen's exact symbol indices remain unverified.; carried from r5 (from r4) |
| Shifted product Laplacian | L₁ eigenvalue 2, L₂ eigenvalue 5 | L₁⊗1+1⊗L₂−1 has value 6, not 7 | Pass; shift counted once.; carried from r5 (from r4) |
| Change of order/principal normalization | Scalar symbol 2ξ, ξ≠0 | New symbol (2ξ)/\ | 2ξ\; carried from r5 |
| Product-symbol block sign | A=[[3,−4],[4,3]] | A*A=25Id with off-diagonal 0; replacing −4 by +4 gives off-diagonal 24 | Pass; sign excludes wrong product.; carried from r5 (from r4) |
| Oddness versus self-adjointness | Q=[[0,2],[0,0]], γ=diag(1,−1) | γQ+Qγ=0 but Q*=[[0,0],[2,0]]≠Q | Pass; roadmap does not infer self-adjointness from grading.; carried from r5 (from r4) |
| Angular product cutoff ellipticity | Unit direction on either factor axis | One active square contribution is 1; normalized estimate is ≥1/2, not 0 | Pass; no lost axis.; carried from r5 (from r4) |
| Cutoff ordering and adjunction | ε=1/4,R=4 at modes (2,16),(3,16) | Arguments 16/65<1/4 and 144/265>1/2 give cutoff values 0 and 1; shifted actions give 0 versus 2 | Pass; cannot commute cutoff through a factor blindly.; carried from r5 (from r4) |
| Product homotopy compact tail | Spectral λ>R² with R=4 | λ⁻¹ᐟ²<1/4; finite eigenspace cutoff leaves operator norm ≤1/R→0 | Pass; spectral tail supplies compactness.; carried from r5 (from r4) |
| Product index kernel decomposition | Factor kernel/cokernel dimensions (2,1),(3,2) | Even dimension 2·3+1·2=8; odd 2·2+1·3=7; 8−7=1=(2−1)(3−2) | Pass; both grading pieces needed.; carried from r5 (from r4) |
| Equivariant/trivial/zero index | Trivial group; identity; zero Hilbert factor | Representation dimensions reduce to previous product; identity has 0−0=0; zero factor gives 0 on both sides | Pass; no nonzero-rank assumption used.; carried from r5 (from r4) |
| Elliptic-complex symbol exactness | Circle de Rham symbol at ξ=1 and ξ=0 | At 1 map is multiplication by i, exact; at 0 map is 0, exactness not required | Pass; excludes zero section.; carried from r5 (from r4) |
| Hodge/Green decomposition | Circle modes k=0,1,2 | Green values 0,1,1/4; ΔG values 0,1,1 equal Id−Π | Pass; harmonic zero mode retained.; carried from r5 (from r4) |
| Even/odd Laplacian types | D:ℂ→ℂ², D(z)=(z,0) | D*D=1 on ℂ; DD*=diag(1,0) on ℂ² | Pass in roadmap; source's repeated D*D is a misprint.; carried from r5 (from r4) |
| Quotient metric and degree | Cyclic rotations of circle, order d | Cover length 2π; quotient length 2π/d; local length element unchanged | Pass; free-action hypothesis essential.; carried from r5 (from r4) |
| Normalized pullback | d=4, constant 1 | J=1/2 times pullback; cover squared norm (1/4)2π=π/2 equals quotient squared norm | Pass; factor 1/d would give π/8.; carried from r5 (from r4) |
| Scalar realization/weak energy identity | exp(ikx), k=0,1,2 | Δ eigenvalues 0,1,4; q(u,u)/‖u‖²=0,1,4 | Pass; previous Friedrichs prerequisite unnecessary.; carried from r5 (from r4) |
| Smooth-core completion versus H² operator domain | Fourier coefficients on circle | H¹ weight 1+k²; H² weight (1+k²)²; at k=2 these are 5 and 25 | Pass; form and operator domains are distinct.; carried from r5 (from r4) |
| Reducing invariant domain and quotient modes | Rotation group order d | Invariants have k=dj; averaging other k gives 0; Δ values k²=d²j² match quotient | Pass; averaging preserves H².; carried from r5 (from r4) |
| Trivial subgroup control | H={1} | d=1, J=identity, norm factor 1 and spectrum unchanged | Pass; none.; carried from r5 (from r4) |
| Left inverse-pullback action | Noncommuting q=(12), r=(23) on delta functions over S₃ | q·(r·δe)=δqr=δ(123); reversing inverse convention gives δ(132) | Pass; group-action direction fixed.; carried from r5 (from r4) |
| Almost conjugacy and permutation characters | Conjugate order-two subgroups of S₃ | Characters on identity, transposition, 3-cycle are 3,1,0 for both | Pass; not tested only on abelian groups.; carried from r5 (from r4) |
| Transplantation of eigenspaces/resolvents | Unitary intertwiner on eigenspace λ, λ=4 | Both resolvents at −1 multiply by 1/(4+1)=1/5; form value 4‖u‖² is preserved | Pass; bounded intertwiner plus domain transport used.; carried from r5 (from r4) |
| Wavefront definition | Smooth 1; δ₀ | Smooth localized Fourier transform rapidly decays, WF empty; δ Fourier value 1 in every direction, WF all nonzero covectors over 0 | Pass; zero covector excluded.; carried from r5 (from r4) |
| Conormal direction control | δ(x) on ℝ² | Singular covectors are (ξ,0), ξ≠0; no pure nonzero y covector | Pass; direction is not just singular support.; carried from r5 (from r4) |
| Microlocal elliptic regularity | Identity on δ; smoothing on δ | WF(Idδ)=WFδ; Gaussian smoothing has empty WF | Pass; characteristic exception needed only for nonelliptic operator.; carried from r5 (from r4) |
| Pullback noncharacteristic condition | Projection (x,y)↦x | Transpose sends η to (η,0), zero only when η=0; normal set empty | Pass; δ pulls back to δ(x).; carried from r5 (from r4) |
| Forbidden pullback/product | Diagonal map and opposite conormals | Transpose sends (η,−η) to 0; δ₀·δ₀ has matching opposite covectors | Negative control; hypotheses exclude undefined operation.; carried from r5 (from r4) |
| Tensor product zero-factor terms | δ₀⊗1 | WF contains (ξ,0), ξ≠0; naïve product WFδ×WF1 would be empty | Pass; enlarged cone retains zero factors.; carried from r5 (from r4) |
| Proper pushforward/critical points | Compact smooth density of integral 1 mapped constantly to 0 | Input WF empty; output δ₀ has all nonzero covectors; df=0 creates the required zero-preimage term | Pass; fixed support cone includes it.; carried from r5 (from r4) |
| Pushforward identity/nonproper control | Identity; noncompact constant density to point | Identity pairing unchanged; latter fiber has infinite volume and noncompact support | Pass; properness on support is substantive.; carried from r5 (from r4) |
| Fixed target cone in pushforward continuity | Same constant map, fixed C; u=0 versus a mass-1 bump | Individual output WFs empty versus all nonzero at 0; fixed C gives the same admissible full cone for both | Pass in roadmap; source issue recorded.; carried from r5 (from r4) |
| Equivariant Fredholm local constancy | Z₂ on ℂ² by diag(1,−1), Tₜ=diag(1+t,2−t), 0≤t≤1 | Both eigenvalues stay ≥1; kernel/cokernel multiplicities in both characters stay 0. Crossing a zero eigenvalue leaves the invertible neighborhood | Pass; a common Fredholm ball, not independently chosen radii per irreducible, is used.; carried from r5 (from r4) |
| Factor versus product graph domains | Fourier modes (0,k) on the two-torus | First derivative multiplier 0; product H¹ weight 1+k². Coefficients 1/k give finite L² sum but divergent H¹ sum | Pass; an amplified factor domain is larger than product H¹.; carried from r5 (from r4) |
| Product graded square | Dₚ=[[0,3],[3,0]], γ=diag(1,−1), Dq=[[0,4],[4,0]] | Dₚγ+γDₚ=0, so cross terms vanish; (Dₚ⊗1+γ⊗Dq)²=(9+16)Id=25Id | Pass; required anticommutation is explicit.; carried from r5 (from r4) |

## Not verifiable

- Ownership against the open IncompressibleFlows pull request, whose README defines Euclidean Besov spaces (service grep hit at its `README.md:495`), was not checked: this brief does not supply its files. The brief's supplier list also excludes it, so it cannot be a supplier here; if both roadmaps build the same Euclidean Besov carrier, one must cite the other once that pull request's placement is known.
- The unchanged source limits of the previous report stand (hormander, adams_fournier, brezis, shubin, grubb, grubb_hansen, seeley, pde_discussion uncertified or unread); none bears on the changed passage.
- Ownership against unsupplied open ContactGeometry and RelativisticQuantumFieldTheory files remains unchecked, as before.

## Source issues

- none

The register entries of the previous report (Melrose, Taylor, Brezis–Dupaigne–Hörmander, Bérard, Atiyah–Singer) concern unchanged passages and stand; the Bergh–Löfström pages reread here (Lemma 6.2.1, Definition 6.2.2, Theorems 6.2.3–6.2.5, 6.4.3, 6.4.5 and 5.6.1) contain no error affecting the roadmap.
