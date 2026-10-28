<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1266#issuecomment-6400657912 -->
Red team round 1 pass b (claude) of 5607256

Verdict: needs changes

1. **F01** (P1) "Part II" of a base roadmap that exists nowhere

   Location: `packages/ExponentialSumsAndCircleMethodPartII/README.md:1` ("# Roadmap: exponential sums and the circle method, part II"), `Suggested.lean:4` and `:29` (namespace), the folder name, `design/plan.json` `roadmapId`.

   Claim: the roadmap is an extension ("Part II") of an existing roadmap, whose introduction says where the base roadmap stops.

   Witness: no roadmap `ExponentialSumsAndCircleMethod` exists on main (`TauCetiRoadmap/`, `Completed/`), in any of the 365 open roadmap pull requests (`roadmaps list`, `roadmaps grep --fixed 'ExponentialSums'` hits only `MetaplecticAutomorphicForms`'s unrelated `finiteExponentialSums`), or among the board's packages. `design/plan.json` (baseline.audit) names "ExponentialSumsAndCircleMethod:ES.0–5" as the parent and its `restructure` entries route through it; the round-2 repair report (F10) removed every citation of it from the README but kept the name because "renaming is outside the editable scope". The README's Summary names no base roadmap and says nowhere where one stops. Other board packages (ErdosProgressionPowers, the GeometryOfNumbersAndQuadraticArithmeticPartII design) cite the same nonexistent `ExponentialSumsAndCircleMethod:ES.0`, so the gap is system-wide, not a local slip.

   Repair (maintainer decision; a repair worker cannot rename): either (a) rename the roadmap to `ExponentialSumsAndCircleMethod`: folder, `README.md:1` → "# Roadmap: exponential sums and the circle method", `Suggested.lean:4` → "# Exponential sums and the circle method: target signatures", `Suggested.lean:29`/`:145` → `namespace TauCetiRoadmap.ExponentialSumsAndCircleMethod` / `end …`, `plan.json` `roadmapId`, and the merge-order line; or (b) if a base roadmap is to be opened (the two citing packages need its ES.0), open it first and add to the Summary one sentence naming it and the section where it stops. Re-raised: F10 (round 2). Its reason is a scope limit on the repair worker, not a refutation: the roadmap's identity still asserts a base that does not exist anywhere the brief lets a reviewer look.

2. **F02** (P2) gap:ecf-character-fourier re-requests the additive-character sheaf that CongruenceSpectralGap §4.2b already owns

   Location: `README.md:53` (the gap), `README.md:314, 328, 467, 504, 544, 576, 897` (*Needs:* lines citing it), `design/plan.json` gaps[1].

   Claim: EtaleCohomologyFoundations must "construct L_ψ on 𝔸¹ with its additive tensor law … compatibly with base change and finite coefficient extension".

   Witness: CongruenceSpectralGap at its open head (#1504, a new-roadmap pull request listed in the brief; merge order line 105, before this roadmap's line 125) §4.2b, bold target *Global additive-character sheaf* (its `README.md:646–657`): for every finite field F, ℓ≠p, a coefficient number field E containing the character values with ℓ-adic place λ, it constructs the lisse rank-one E_λ-sheaf L_ψ on 𝔸¹/F by descent from the Lang torsor, proves that base extension to F′ gives the sheaf of ψ∘Tr_{F′/F}, and proves the additive tensor law a*L_ψ⊗b*L_ψ≅(a+b)*L_ψ for regular phases a,b:X→𝔸¹ with associativity and symmetry; its scope line 20 says this part owns the global additive-character sheaf. The gap therefore asks a second roadmap to build an object an earlier roadmap already states, with the same laws (two owners for one object). What CongruenceSpectralGap does not state is the cancellation: RΓ_c(𝔸¹,L_ψ(λx))=0 for λ≠0 and the 𝔾_a-equivariant translation vanishing of BS20 Lemma 3.2 (BS20 line 772).

   Repair: (1) add under "## Exact supplier contracts" the subsection "### From TauCetiRoadmap.CongruenceSpectralGap" with: "Consume §4.2b, *Global additive-character sheaf*, for L_ψ on 𝔸¹ over every finite field of characteristic p, its base-extension law ψ∘Tr, the additive tensor law for regular phases, and purity of weight zero; finite coefficient extension from E_λ to a finite E/ℚ_ℓ containing μ_p is EtaleDualityAndPerverseSheaves §3.4." (2) Replace `README.md:53` by: "What EtaleCohomologyFoundations must provide (gap:ecf-character-fourier): For a finite field of characteristic p, ℓ≠p, finite E/ℚ_ℓ containing μ_p, a nontrivial ψ:𝔽_p→E× and the sheaf L_ψ of CongruenceSpectralGap §4.2b, prove RΓ_c(𝔸¹_{F̄},L_ψ(λx))=0 for every λ≠0, and, for a separated finite-type X with a 𝔾_a-action a and a regular φ:X→𝔸¹ satisfying φ(a(x,λ))=φ(x)+u(x)λ for a unit u, prove RΓ_c(X_{F̄},φ*L_ψ)=0." (3) Put the same `needs` sentence in `plan.json` gaps[1]. (4) Add "CongruenceSpectralGap §4.2b" to the *Needs:* lines of §§3.5, 3.6, 5.1, 5.3, 5.6, 5.8, 8.2 and to the Layer 3, 5 and 8 Dependencies.

3. **F03** (P3) gap:ecf-one-variable-fourier is phrased through an unowned ℓ-adic Fourier transform

   Location: `README.md:55`; `design/plan.json` gaps[4].

   Claim: the supplier must "identify the restriction to 𝔾_m of the normalized ℓ-adic Fourier transform of g_*E with the degree-one sheaf of Rpr_h!L_ψ(hg(a))".

   Witness: no roadmap on main, at an open head, or on the board constructs an ℓ-adic (Deligne–Laumon) Fourier transform (`roadmaps grep -i 'adic Fourier|Fourier–Deligne|Laumon'` returns only citation lists in ClassicalAdicEtaleCohomology and p-adic Fourier theory in LocallyAnalyticDistributions); the only thing §5.8's route uses (`README.md:574`) is lissity of the h-sheaf on 𝔾_m and the absence of a geometrically constant quotient (BS20 line 1161–1168).

   Repair: replace the `needs` sentence (README and plan.json) by: "For g∈𝔽_q[a] with 1≤deg g<p and the preceding character data, prove that on 𝔾_m (coordinate h) the complex Rpr_h!L_ψ(h·g(a)) is concentrated in degree 1, that its degree-one sheaf is lisse of rank deg g−1, and that this sheaf has no geometrically constant quotient, so its H_c²(𝔾_m,−) vanishes."

4. **F04** (P3) §6.5 low-rank coincidence list omits orthogonal dimension 4

   Location: `README.md:745` ("the low-rank coincidences involve orthogonal dimensions 3 or 5").

   Claim: the only orthogonal Lie algebras sharing a nonzero simple quotient with a symplectic one are so₃ and so₅.

   Witness: so₄≅sl₂×sl₂ has the simple quotient sl₂≅sp₂. Harmless for the route (N₁≥6, in fact ≥21, is proved two sentences earlier), but the sentence is false as written.

   Repair: "the low-rank coincidences involve orthogonal dimensions 3, 4 or 5 (so₃≅sp₂, so₄≅sp₂×sp₂, so₅≅sp₄)".

Scope of this pass: the whole of `packages/ExponentialSumsAndCircleMethodPartII/README.md` (1643 lines, 89 numbered subsections, 14 layers) and `Suggested.lean` (145 lines, 7 definitions, 2 admitted headline theorems), `sources.toml`, `design/plan.json` (gaps list), the three prior reports, every cited supplier section on main or at its open head, every cited Mathlib and Tau Ceti declaration at the pins, and the four cached sources at the cited lines. No Lean was elaborated (the board checkout carries no Lake project): "not built"; the signature comparison below is by reading.

## Adversarial mathematics pass

Conventions used in the computations: b indexed 1..L (Lean `Fin L` zero-based, `b r` = b_{r+1}); H_m(b) is (L−m)×(m+1) with entries b_{i+j−1}; Δ_yG(a)=G(a)−G(a+y); Q=#K.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Lean `mappingPolynomial`/`mappingEquation`/`mappingIdeal` (§3.1) | f=Y₁, d=1, x=(1); f=0; f=1; d=3 | T+a₀ → ideal (a₀,1)=(1), empty; f=0 → ideal (0), whole 𝔸^{dn}; f=1 → unit ideal; d=3 tuple xT³+a₂T²+a₁T+a₀ | agrees with §3.1 Checks; leading coefficient f₀(x) kept in the ideal (Lean spans every coefficient) |
| Lean `residuePhase` vs §3.4 | f=Y₁³−Y₂³+1, d=1, x=(1,1), lower (a,c) | f(g)=(3a−3c)T²+(3a²−3c²)T+(a³−c³+1); Σ_{r=0}^{2} b_r·coeff_r = b₁(a³−c³+1)+3b₂(a²−c²)+3b₃(a−c) | matches §3.4 Check and BS20 line 288–300 (coefficient of T^{−1} in αf(g)) |
| Lean `hankelMatrix` vs BS20 Def 2.3 | L=9,m=4,b₅=1; L=3,m=0; L=6,m=2,b₄=1; L=6,m=2,b₃=1; L=3,m=1,b=(1,2,4) | ranks 5 (5×5 anti-identity, det +1), 0 only if b=0, 3, 3, 1 | zero-based entry b(i+j) = b_{i+j+1}; `m < rank` is exactly b∉A_m; §4.1/§4.3/§4.7 Checks hold |
| §4.3 threshold and BS20 Lemma 2.4(3) | L=9: m=4 vs m=5 | rank H₄(b₅=1)=5>4, so A₄≠𝔸⁹; H₅ has 4 rows ≤5 | Lemma 2.4(3) as printed (m≥kd/2) is correct; the floor is only in the proof of Prop 2.6 (see Source issues) |
| §4.4 Padé at the extremes | α=0; m=L | h₂=1,h₁=0; h₂=T^L, h₁=Σb_rT^{L−r} is exact | both directions hold at the boundary |
| §4.7 dim A_m≤2m | m′≤m | m′+m′+(m−m′)=m+m′≤2m | consistent |
| Lean `iteratedPhaseDifference` sign | r=1; G=a², k=2; G=a³, k=3 | r=1: G(a)−G(a+y₀); Δ_yG=−2ay−y²; Δ_uΔ_vG=6auv+3u²v+3uv² | a-linear part (−1)^{k−1}Σ a_jΨ_j: −2ay and +6auv as in §8.7 Check |
| §8.1 V_k(G) | G=a₁², k=2 and k=3; k=1 constant/linear | k=2: y₁=0, dim N−1; k=3: Δ_zΔ_yG=2yz constant, dim 2N; k=1: point / empty | Checks hold; k retained after degree drop |
| §8.6 bound | constant G; G=a², N=1, k=2; k=3 retained; k=1 | 2N; [0+1]/1=1; [2+2]/2=2; k=1 gives 2(dd+N)=2N or −∞ | matches §8.6 Checks and the Layer-8 Example (cd=1 for a Gauss-sum sheaf) |
| §8.7 polar forms | k=3, f₀=Y³; char 3 | Ψ=6uv, Ψ(u,u)=6u²=2!·3u²; V_Ψ two lines: dim 1=(k−2)n, degree 2=(k−1)^n; char 3: Ψ=0 | Checks hold; p>k essential |
| §8.7 dimension bound dim V_Ψ≤(k−2)n | diagonal Δ, smooth Z | V_Ψ∩Δ={u:(k−1)!∂f₀(u)=0}={0}; §0.1 gives dim C≤(k−1)n−n | sound (every component of the cone contains 0) |
| §8.7 cumulative degree ≤(k−1)^n | n equations of degree k−1 | SSF §5.12 inequality applied componentwise n times | owned by SSF §5.12 (Fulton 8.4.6), confirmed on main |
| §8.8 N(α) and the Lean count | k=3,n=1,d=2, α=T^{−4}; brute force over 𝔽₅, 𝔽₇ | polarCount = 225 = 5²·9, 637 = 7²·13; formula Q²(2Q−1) | identification #V_k(G_b)(𝔽_Q)=N(α) confirmed; §8.8 Check holds |
| §8.8 shrinking equality | α=0 | N=Q^{dn(k−1)}, N_s=Q^{(d−s)n(k−1)} | equality, Check holds |
| §8.8 use of gap:symmetric-lattice-shrinking | block i, a=d, c=d+(i−1)s | a−c≤0 so max(⌊(a−c)/2⌋,0)=0 each time; factor Q^{ns} per block | N≤Q^{(k−1)ns}N_s as stated (BS20 line 2076–2082) |
| Lean `minor_arc_polar_count` (§8.9) | k=3,n=1,d=2,m=2, α=T^{−4}, Q=5,7; α=T^{−3} | H₂ rank 3>2; counts 225≤250, 637≤686; α=T^{−3}: 65≤250, 133≤686 (formula 3Q²−2Q) | bound holds with constant 2=(k−1)^n and exponent 3=dn(k−1)−n⌊m/(k−1)⌋ |
| same, k=3,n=1,d=3,m=4, α=T^{−5} | analytic count | conditions a₂c₂=0, a₁c₂+a₂c₁=0, a₀c₂+a₁c₁+a₂c₀=0 give 4Q³−3Q² ≤ 2Q⁴ | holds (Q=5: 425≤1250) |
| same, hypothesis necessity | b=0 over 𝔽₅ (rank 0); p=k=3 with α=T^{−4} | 625>250; 81>54 | rank exclusion and p>k are essential (§8.9 Checks hold) |
| same, x-independence | x=0 and x=3 over 𝔽₅, α=T^{−4} | 225 and 225 | the arbitrary-x form of the Lean statement is right |
| same, junk subtraction | m≤kd/2, k≥3 | h=⌊m/(k−1)⌋≤kd/(2(k−1))≤d, so n·h≤dn(k−1) | natural exponent never truncates |
| same, n=0 | Fin 0 | totalDegree f=0≠k; statement vacuous; polarCount=1≤1 anyway | no junk value |
| §8.9 route step |r|≤q^m ⇒ b∈A_m | h=d−s, deg r≤(h−1)(k−1) | (k−1)h≤m gives −d−(k−1)s≤−kd+m; reduced a/r has m′≤deg r<m, error ≤T^{−L−1+m−m′} | Padé form of §4.4 reached; m′=0 case: first L−m coefficients vanish, first Hankel column zero, rank≤m |
| §8.10 dimension detection | 𝔸^e; Spec 𝔽_{q²}; 𝔽_q[ε]/ε²; ∅ | q^{re}; 0/2 alternating; 1; 0 | Checks hold; the subsequence r=2j is what rules out c<0 |
| §9.4 stratum cutoff B(m) | k=3,d=4,n=24: m=4,5 | B(4)=188, B(5)=192; printed cutoff 188; conservative 192 | README value confirmed; max over m of B(m) is attained at m=(k−1)t+(k−2) when that stratum exists |
| §9.3 strata at odd L | L=9; L=12 | m from d to ⌈9/2⌉−1=4; to 5 | ceiling needed (A₄≠𝔸⁹) |
| §9.4 last stratum, odd L | L=9 | dim A₅=9 ≤ 2⌈9/2⌉=10 | the ambient-dimension argument covers it |
| §10.2 range and §10.8 condition | k=3,d=2,n=40; tδ=k−1 | t=1, δ=3, i>−4; equality gives i>0, degree 0 excluded | consistent |
| §10.4/§10.5 bands | n=40, m=1,2; i=−1 | m=1: s=2−n=−38; bands [−37,−37], [−75,−74]; −1 in none | H_c^{147}(Mor)=0 inside the comparison range |
| §10.6 | r≥2 differential | needs m≥r(n−3)+2 (BS20 line 229–232) | agrees |
| §10.7 criterion | disjoint line and point, D=1 | top group rank 1, component of dim 0<D | lower bound on every component is needed (Check holds) |
| §10.8 at i=0 | n≥4 | no E₁ term of total degree 1 (needs 1−r≤−r(n−2), impossible) | E_∞^{0,0}=E₁^{0,0}, H_c^{2D} one-dimensional |
| Lean `mapping_geometrically_irreducible` | K=K̄; hd vs hrange | d<k−1 ⇒ (d/(k−1):ℕ)=0 ⇒ hrange false | `hd` is implied by `hrange`; harmless (P3 note, not a finding) |
| same, conclusion encoding | V(I)=∅; V(I) reducible | √I=(1) not prime; √I not prime | prime radical ⇔ nonempty irreducible over K̄; Krull dim of the quotient = dim V(I) |
| §10.9 example | f=Y₁^{k−1}Y₂+Y₂^k+ΣY_j^k+1, x=(1,0,…) ; n=2 | critical point only 0, f(0)=1: X, Z smooth; g₂=0 locus dim ≥ d+d(n−2)−k(d−1)−1 = D−d+k−1; n=2: 1=0 | matches BS20 line 242–255; n≥3 needed |
| §6.3 twist and §4.7 rank | Fermat cubic over 𝔽₂₅ (brute force) | #Z(𝔽₂₅)=801=q²+7q+1; primitive trace 150=6·25; b₃(cubic threefold)=10; 6+10=16=2⁴=Milnor number | no extra twist; EDC §4.7 formula gives 6 and 21 at (3,3),(4,3) |
| §6.5 rank formula | (k,n₁)=(3,3),(4,3),(3,5) | 6, 21, 22 | agrees with EDC §4.7 ((d−1)^{m+2}+(−1)^m(d−1))/d at m=n₁−1 |
| §5.13 sign | m=2, n even/odd; n=4,5 | Λ²V / Sym²V; transposition −1 / +1 | Conventions witness holds |
| §5.14/§7.2 degree bookkeeping | a=m+s | configuration degree a+m(n−1)−2nd = s+mn−2nd | agrees with BS20 Prop 2.5(2) |
| §7.5 normalization | (m,s)=(0,0); n=40,k=3,d=2 | twist L−nd=−D; E(−74) | holds |
| §2.1/§2.2 prime adapters | p=5,ℓ=19; ℓ=2,p=13; p=7,ℓ=2 | 19≡−1 (5), order 2; 13≡5 (8), ord₁₃2=12; ord₇2=3 odd | Checks hold; `Nat.forall_exists_prime_gt_and_modEq` needs q≠0 and coprime a, both satisfied |
| §3.5 Check | k=3,p=5,ℓ=2 | ord₅2=4, [ℚ₂(μ₅):ℚ₂]=4 | holds |
| §5.8 Checks | g=a; g=0; g=a^p−a, h=1 | fibre acyclic; H_c⁴(𝔾_m×𝔸¹)=E(−2); H_c²=E(−1) | hold |
| §5.12 Check | n=2 plane cubic | H_c⁰=0, H_c²=E(−1), H_c¹ survives | holds |
| §11.4–11.5 phase | r=1/4, s=0,3/8,1; s=3r/2 | σ=1,−1,1; h=1/2 | degree +1 lift, midpoint −1 |
| §11.7–11.11 escaping loop | F_s(T)=(T^dσ(s,r(T)),ζT^dσ,1,0,…), ζ³=−1 | Σ cubes = T^{3d}σ³(1+ζ³)+1=1; |a_s|=|T|^d; v=1/a_s; ratio σ^{−1} winds −1 | a based loop in Hco with endWind −1; endWind well defined via the tube lemma on compact families |
| §11.12/§13.2 | X={Σ_{j≤40}x_j³=1}, d=2 | X≃∨S³⁹ (μ=2⁴⁰), π₁Ω²X=π₃X=0; π₁(Hco,g)↠ℤ; H¹(Hco,ℚ)≠0 vs H_c^{147}(Mor)=0 | the compact-open reading of BS20 Lemma 7.2 and of Conjecture 7.1 at j=1 fails |
| §12.2 | |w−1|<1/2, t,χ∈[0,1] | |1+(1−tχ)(w−1)|>1/2 | holds |
| §12.3 | X=S², constant β; non-null β in S¹ | Map_*(S²,S²) has π₀=ℤ=π₀Ω²S²; no extension exists | holds; the fibre identification needs the chosen extension |
| §13.3 | n=3 | Ω²(∨S²) has π₀=ℤ^μ | n≥4 needed, as stated |
| §0.1/§0.2 | two planes in 𝔸³; S={0,1}, line ∪ (0,1) | 1=2+2−3; 3≤2·2, top-degree-only gives 2 | hold; LR14v2 Lemma 2.6's affine equality is not used (inequality suffices) |
| §1.1 | 𝔽₂[T], h=2; h=0 | S={0,1,T,T+1}, 4 and 16 points; only 0 | holds; BV15's inclusive q^N is h=N+1 |

## Verified sound

- Declarations read: 9 of 9 (`mappingPolynomial`, `mappingEquation`, `mappingIdeal`, `residuePhase`, `hankelMatrix`, `iteratedPhaseDifference`, `polarCount`, `minor_arc_polar_count`, `mapping_geometrically_irreducible`). Every binder is explicit in the declaration's own signature; the file has no `variable` block, so no section hypothesis can be lost; no `lemma`, `set_option`, `#eval`, `True` placeholder, sorry'd data or example. Elaboration was not run in this pass ("not built"); the README's generality equals the Lean's for both headlines (finite field with p>k and Jacobian smoothness of f_k over the closure; algebraically closed field of characteristic 0 or >k with both Jacobian conditions, x≠0, f_k(x)=0, n>2^k(k−1), tδ>k−1). README and Lean names agree 9/9; every backticked library name resolves at the pins.
- Headlines and padding: the two headlines the README reaches that are statable at the pins (§8.9 and §10.8) are stated; the four headline families the docstring declares not statable (§0.2/§1.1 cumulative-degree bounds, the Fourier/first-page/parity/Weyl/comparison theorems, the end-winding obstruction, conditional degeneration) indeed lack a carrier at the pins: Mathlib `6b7abb3c…` has no degree of an affine algebraic set, no bounded constructible adic category, and no topology on `Projectivization` (checked by grep), so the prescribed-germ mapping space cannot be built without a long ad hoc encoding. The seven definitions are all used by the two headlines; nothing in the file is padding.
- Targets read: all 89 subsections; headline theorems listed from the README: conservative comparison (§10.2), conservative irreducibility (§10.8), uniform polar count (§8.9), first page and parity (§§7.4–7.5), compact-open obstruction (§§11.11–11.12, §13.2), conditional degeneration (§13.3).
- Locators verified: 37 — BS20 Theorem 1.1, Corollary 1.2, Conjecture 1.3, Corollary 1.4, Remark 1.5, Lemma 2.1, Remark 2.2, Definition 2.3, Lemma 2.4(1)–(5) with proof, Propositions 2.5–2.6, Theorem 2.7, the spreading-out paragraph, Lemma 2.8, Corollary 2.9, Lemmas 3.2, 3.7, 3.11, 4.2, 4.3, Definition 5.1, Lemmas 5.3–5.4, Proposition 5.5, Lemma 5.6, Propositions 5.7–5.8, the proof of Proposition 2.6, Lemma 6.1, Proposition 6.2, Lemma 6.4, (7.1), Conjecture 7.1, Lemma 7.2 (BS20 lines 64–120, 190–255, 284–300, 360–400, 440–552, 553–643, 644–703, 772–800, 1141–1175, 1221–1247, 1353–1372, 1389–1398, 1531–1560, 1592–1665, 1745–1830, 1835–1887, 1950–2030, 2060–2130, 2130–2194); LR14v2 lines 124, 144, 231 (and Lemma 2.6, line 226); BV15 line 530; STACKS lines 4237 (More on Morphisms), 2964 and 3202 (Homology). Each supports the claim at the cited target, with the two BS20 corrections and the LR14v2 correction recorded under Source issues; the README's attributions ("original to this roadmap", "conservative repair") are accurate.
- Checks tested: 52 Checks and Examples recomputed (table above); none false, vacuous or a restatement; every definition has at least three Checks (§§3.1, 3.4, 3.5, 4.1, 4.6, 5.3, 5.7, 5.13, 6.1, 8.1, 8.2, 8.7, 8.8, 9.5, 10.10, 11.1, 11.2, 11.4, 12.1, 12.4, 13.1).
- Sibling citations checked (section number and title or bold target at the current copy): SchemeAndStackFoundations §§0.2, 0.3, 0.7, 0.8, 0.9, 5.12 (main; §5.12 is the Fulton 8.4.6 inequality the cumulative-degree bounds need); EtaleCohomologyFoundations F.0.1, F.0.2, 0.6, 0.7, F.1, F.2.4–F.2.7, F.3, F.4.1–F.4.6, F.5, F.6 (main; no character sheaf or Fourier transform there, so the two ECF gaps do not duplicate ECF); EtaleDualityAndPerverseSheaves §§0.6, 3.2–3.8, 4.1, 4.3, 4.6, 4.7 (#1040; §4.7's hypersurface formula reproduces the ranks 6 and 21); InverseGaloisAndArithmeticFundamentalGroups IG.5.1 *Ordered and unordered configurations* (unit-difference scheme, finite étale S_n-torsor, n=0,1 trivial), IG.5.7's bold target *Finite-cover criteria for full monodromy image* (smooth surjection with geometrically connected fibres; dense open in a connected normal target), IG.0.T4 (#850); DeligneWeightsAndPurity §§8.1, 8.8 (#929); LefschetzPencilsAndVanishingCycles §§5.1, 5.8, 5.10 (#873); AlgebraicTopology Stages 4, 6, 8 and DGFloer Layer 1 item 1, Layer 2 items 2–3 (main; the compact-Hausdorff closed-cofibration restriction fibration and Map_*(S^k,X)≅Ω^kX are there); ClassicalArithmeticCompletion §6.44 (main); AlgebraicTopologyPartII AT2.2–AT2.5 with the six bold targets named by the gaps, and GeometryOfNumbersAndQuadraticArithmeticPartII *FunctionFieldLatticesAndShrinking* FL.4 *Shrinking* (board designs, both in the merge order). The citation resolver's single lead (AlgebraicTopologyPartII) is the settled design-stage supplier of six declared gaps.
- Declared gaps: all 12 slugs in `plan.json` match the 12 README contracts; suppliers named and earlier in the order; FunctionFieldArithmetic (#1474) and GeometryOfNumbersAndQuadraticArithmetic (#851) contain no polynomial-box, polar-count or function-field shrinking statement, so §§1.1, 8.8–8.9 are owned here and gap:symmetric-lattice-shrinking is minimal. gap:sf-fibre-strata asks for the stratification equality SSF §§0.7–0.8 do not state (they give semicontinuity, the dominant-integral fibre formula and property-constructibility). gap:edc-top-components asks for singular M, outside EDC §0.6's smooth duality. gap:lpv-universal-monodromy and the six AT2 gaps are precise and minimal.
- Pinned declarations: all 14 Mathlib and 2 Tau Ceti citations open at the cited file and line at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, with the hypotheses the README states (`Nat.forall_exists_prime_gt_and_modEq` needs `q ≠ 0` and `a.Coprime q`; `legendreSym.quadratic_reciprocity` needs `p ≠ 2`, `q ≠ 2`, `p ≠ q` with `Fact` primality; `nonempty_inter_closedPoints` needs a Jacobson space and a nonempty locally closed set; `Circle.fundamentalGroupMulEquiv_expLoop` sends the exponential loop to `ofAdd 1`).
- Policy: the pull request changes only the package folder (`git diff --stat origin/main...HEAD`: README, Suggested.lean, design/plan.json, metadata.toml, sources.toml, reports); no pull-request numbers, no `lemma`, no `set_option`, no computational algorithm; every target has a locator; sources are cited by locator only.
- Dependency gate output: `depcheck: 54 roadmaps, 603 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line). Every *Needs:* edge points to this roadmap, a declared gap, an earlier roadmap in the order, main, or a pin; no forward reference inside the roadmap was found (Layer 8 uses §0.3 and §1.1; Layer 10 uses §§7.5, 9.4, 3.6; Layer 13 uses §§10.2–10.5, 11.11, 12.4–12.5).

## Not verifiable

- Lean elaboration: not built (no Lake project in the board checkout; the brief permits no Lean command here). The round-3 repair report records an exit-0 elaboration with two `sorry` warnings and a `#check` pass; I did not reproduce it.
- The étale-cohomological proof routes of §§5.8, 5.10, 6.2–6.6, 7.1–7.4, 8.6, 9.2 were checked for agreement with BS20's statements and on the instances above, not re-proved; in particular the "no geometrically constant quotient" input of §5.8 is BS20's citation of Katz (BS20 line 1165–1167), a text not in the cache.
- The AlgebraicTopologyPartII and GeometryOfNumbersAndQuadraticArithmeticPartII suppliers exist only as accepted board designs; their six and one contracted statements were matched by title, not by proof.
- BS20 Lemma 6.4's proof (Lee's lattice lemma, BS20 line 2063–2075) was read for its statement only.
- Ownership against open pull requests was checked through the brief's index of 365 heads (`roadmaps grep`/`show`) and the listed sibling checkouts; pull requests outside that index were not sought.

## Source issues

- **Error** in BS20 at proof of Proposition 2.6, printed p. 934 (BS20 line 1859–1887): the sufficient condition for the stratum A_{m+1}∖A_m is stated as i > stalk cutoff + 4(m+1) and then replaced by stalk cutoff + 4(k−1)⌊m/(k−1)⌋ + 4, which is smaller, so the replacement weakens the condition instead of strengthening it; the argument only proves vanishing for i > 2dn + 4(k−1) − 4⌊d/(k−1)⌋(n/2^k−k+1) (k=3, d=4, n=24: the m=5 stratum needs 192 while the printed cutoff is 188); affects a stated result (Proposition 2.6, hence the ranges in Theorems 1.1 and 2.7(3), Corollaries 1.2, 1.4 and 2.9).
- **Misprint** in BS20 at proof of Proposition 2.6, printed p. 934 (BS20 line 1845): the last stratum index m₀ is written ⌊kd/2⌋−1, which omits A_{⌈kd/2⌉}∖A_{⌊kd/2⌋} when kd is odd (kd=9, b₅=1: rank H₄=5, so A₄≠𝔸⁹), whereas Lemma 2.4(3) needs m ≥ kd/2; it should be ⌈kd/2⌉−1; affects the proof (the omitted stratum obeys the same bound by its ambient dimension kd ≤ 2⌈kd/2⌉).
- **Error** in BS20 at Lemma 7.2, printed pp. 940–941 (BS20 line 2174–2194): the space Hom_{d,P}(C,X) defined by the pointwise germ condition (7.1) with the compact-open topology is not homotopy equivalent to Ω²X; the "canonical deformation" in a neighbourhood of ∞ needs a neighbourhood uniform over a compact family, which (7.1) does not give; the loop F_s(T)=(T^dσ(s,1/(4(1+|T|))), ζT^dσ, 1, 0, …) on the Fermat cubic in C^40 has end winding −1, so π₁ surjects onto ℤ while Ω²X is simply connected; it should either specify a topology with uniform germ control or add that hypothesis to the lemma; affects a stated result (Lemma 7.2, and the meaning of Conjecture 7.1 and Theorem 7.7).
- **Error** in LR14v2 at Lemma 2.6, v2 p. 5 (LR14v2 line 226–228): for an affine nondegenerate X and a hyperplane H meeting it, the lemma asserts deg(X∩H)=deg X, which fails for the parabola y=x² and H:x=0 (one reduced point, degree 1 versus 2); the cited Hartshorne I.7.6(d) is projective; it should be deg(X∩H) ≤ deg X; affects the proof of Proposition 2.3 in the affine case, not its statement (the inequality suffices).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5607256", "job": "RT-ExponentialSumsAndCircleMethodPartII~1b", "model": "fable", "worker": "fable-rt54"} -->
