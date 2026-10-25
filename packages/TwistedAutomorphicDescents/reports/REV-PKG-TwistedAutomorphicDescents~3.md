<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1535#issuecomment-6401857835 -->
Review (claude) of 8b40b31

Verdict: accepted
Conditional on the announced gaps: `hermitian-witt-complements`, `rational-nilpotent-orbits`, `classical-dominance`, `rational-fourier-support`, `bessel-restriction-growth`, `twisted-jacquet-filtration`, `spherical-whittaker-normalization`, `all-place-signed-factors`, `type-poles-and-cross-factor`, `isobaric-eisenstein-continuation`, `quasisplit-residual-packets-membership`, `residual-irreducibility`, `all-member-residual-support`, `coherent-packets-comparison`, `generic-discrete-member-cuspidality`, `standard-base-change-uniqueness`

1. **F01** (P3) Three Needs lines omit an earlier section their statement or route uses

   **Location:** packages/TwistedAutomorphicDescents/README.md:917 and 928 (§5.9: "A bilinear functional against π detects a π∨ constituent in this module, by the output transport of §4.1"; Needs lists only §4.2; §5.3; §1.1); line 858 and 860 (§5.5 route: "Expand every proper constant term using §1.3"; Needs lacks §1.3); line 1098 and 1100 (§7.2 route: "By the recovery transport of §4.1" and "Multiplicity-free decomposition and outer stability", with §4.1, §1.4 and §5.6 absent from its Needs).

   **Claim:** every Needs line lists what the statement and the indicated route need, item by item.

   **Witness:** the three quoted sentences use §4.1, §1.3, §4.1/§1.4/§5.6 respectively; the three Needs lines at 928, 860 and 1100 do not name them. All are earlier sections, so no direction defect arises; the mechanical scan below finds no forward or self edge.

   **Exact repair:** append "§4.1 (output transport)" to the §5.9 Needs line, "§1.3 (tower calculation)" to the §5.5 Needs line, and "§4.1 (recovery transport); §1.4 (multiplicity-free decomposition); §5.6 (outer stability)" to the §7.2 Needs line. Tested: after the additions every internal edge still points to an earlier section (the scan's ordering test is key(ref) < key(section) for all 149 edges).

Accepted conditional on the sixteen declared supplier gaps (listed under the declared-gap audit below). One non-blocking finding.

## Verified sound

### Previous findings, checked individually

Locations are in packages/TwistedAutomorphicDescents/README.md; quoted fragments are the package's repaired wording.

| Finding (round 2) | Status | Repaired passage and verification |
|---|---|---|
| F01 (P1): unitary L-ratio incompatible with the bilinear integral | Repaired | Line 556: "ℒ_v(s;τ,π,σ)=L_v(s+1/2,τ×φ_π)/(L_v(s+1,τ×φ_σ∨)L_v(2s+1,τ,ρ))". Recomputed independently (rows "3.3 numerator", "3.4 spherical", "3.3/4.1 cross roots" below): the direct split U(1,1)⊃U₁ torus integral of the spherical section gives Σ_(n≥0)X^n+Σ_(n≥1)Y^n with X=χ₁β(ϖ)T, Y=χ₂β⁻¹(ϖ)T, which is L(s+1/2,τ×(β,β⁻¹))/L(2s+1,χ₁χ₂); the split U₃ Gindikin–Karpelevich roots of Ind(χ₁|·|^s,μ,χ₂⁻¹|·|^(−s)) are χ₁μ⁻¹, μχ₂ (coroots diag(x,x⁻¹,1), diag(1,x,x⁻¹)), the weights of τ×(μ,μ⁻¹)∨. The transports in §4.1 (lines 636–640) were re-derived: paper's (4.9) tests through the inner product (4.8) (JZ2020 line 1145, line 1148), so its "π has parameter φ_τ" (JZ2020 line 2150; Theorem 5.3, line 2071) is the package's self-pair τ≅φ_(π′)∨ for the bilinear test representation π′=π∨. Propagation checked at lines 581, 597, 681, 717, 731, 746–757, 885–899, 972, 1025–1035, 1065–1083, 1088–1098. |
| F02 (P1): internal supply cycles 0.2⇄0.3 and 2.4→2.6→2.5→2.4 | Repaired | Line 154: the orthogonal Bessel datum is now defined in §0.1 ("define also an orthogonal Bessel datum of index ℓ on V"); line 184: §0.2 needs §0.1; line 206: §0.3 needs §0.1; §0.2. Line 456: §2.4 "stops at that surviving open-cell integral; its identification with an inner Bessel period is §2.6"; line 497: §2.6 needs §2.4; §2.5; §0.6. Line 283 defines P_O, Q_O in §1.1; line 585: §3.4 needs §3.3; §3.1 only. A script over all 51 Needs lines (supplier-qualified citations and gap slugs stripped first) found 149 internal edges, 0 forward, 0 self. |
| F03 (P3): "p^1 and p are different partitions" | Repaired | Line 964: "The two partitions need not differ. They coincide exactly in the odd-SO H_W branch at a=2, which forces m=1, d=2, j=0 and k₀=1 and gives p=p^1=[3,1,1]". Script over a=2..29, m≤11, three branches: coincidences only in the odd-SO branch at a=2; with H_W odd SO the pair constraint d=m+2j+1 even and a=d=2 forces (m,j)=(1,0). Part counts otherwise 2 or 3 against a+1 or a+2. |
| F04 (P3): "[3,1] regular for U₄" | Repaired | Line 1111: "For U_(2n) the regular partition [2n] is not a Bessel partition, and the maximal Bessel partition [2n−1,1] is subregular"; line 1121: ranks (3,2,1,0) against (2,1,0,0), recomputed. New comparison target (Whittaker to [2n−1,1] coefficient with a U₁ character projection) is stated with its route (middle hyperbolic plane expansion). |
| F05 (P3): Corollary 4.4 page | Repaired | Line 493: "Corollaries 4.4 and 4.6, pp.776,779 … JZ2020 line 1627, line 1769". Page marker at line 1594 opens printed p.776 (page N of the extraction is printed page 738+N); Corollary 4.4 at line 1627, Corollary 4.6 at line 1769 on p.779. |

Round-1 items named in the brief: the printed numerator is now reported correctly — line 556 says "Both published displays (4.47) and (5.13) print the unmarked arguments τ×π and τ×σ", and JZ2020 line 1826 and line 2130 both print L(s+1/2,τ×π) with no conjugation; the eleven unowned gaps are now sixteen contracts with named suppliers: plan.json `gaps` has 16 entries, zero with supplier none, and the README's 16 `gap:` slugs and 16 "must provide (gap:…)" contracts coincide with them (script comparison, both differences empty).

The repair report's frozen-plan note (plan.json unchanged apart from `gaps` at the design stage) is correct and nothing is re-raised.

### Principles and policy

General library: every rational inner form, split and nonsplit unitary, all characteristic-zero places including residue characteristics 2 and 3 (line 7); no good-prime restriction (q≥2 only excludes q=1, line 33). No re-planned roadmap: classical GRS descent is imported from ModularityAndLanglandsExtensions §5.4 and only the rational comparison is a target (lines 15, 994, 1111). No copied passage, no algorithm, no LaTeX delimiters, no process words, no path (grep clean). Suggested.lean: one `import Mathlib`, one module docstring, the namespace, zero declarations, no `sorry`, no `set_option`, no `lemma`. Sources manifest: eight keys, GRS2011 settled uncertified, no duplicate work, no local path.

### Seeded source verification

All fifteen seeded targets were opened at their locators in the cached legal extractions (JZ2020 printed pages; Zhang2022 PDF pages, OCR). Nothing was unreadable.

| Target | Locator opened | Result |
|---|---|---|
| 0.2 Bessel partition | JZ2020 (2.9), p.755, line 694 | Parts [(2ℓ+1)1^(d−2ℓ−1)] agree; the source bounds ℓ by the F-rank only, the package adds 2ℓ+1≤d (line 173). Supported. |
| 0.6 Ambient datum | JZ2020 Prop. 2.6, p.759, line 867; (5.7)–(5.9), p.785, lines 2047–2056 | Existence of (p_ℓ,O_ℓ) with H_m≅H^(O_ℓ) and a relevant pure inner form; the package adds compatibility with the prescribed W⊂V as its own obligation (line 255). m⁻=2a+m−2κ−1 at line 2056 matches line 247. |
| 1.3 First-occurrence cuspidality | JZ2020 Prop. 2.2, p.756, lines 715–725 | ℓ₀∈{0,…,r}, vanishing above ℓ₀, constant terms along all parabolics zero; realization dependence stated at lines 726–728. Supported; the GRS Theorem 7.3 template is cited at line 713. |
| 3.1 Local Bessel zeta integral | JZ2020 (4.37), line 1621; (4.40)–(4.41), p.777, lines 1646–1669; (4.45), p.779, line 1774 | Integral over R^η_(ℓ,β−1)(F_v)\G(F_v) of the local functional against J_(s,v); inverse character ψ⁻¹ at line 1623. Matches line 520. |
| 3.2 Euler product | JZ2020 Thm 4.5, p.777, lines 1670–1680; Cor. 4.4, line 1627; Cor. 4.6, line 1769 | Factorizable data and nonzero inner period for (π,σ′) required; zero inner period gives Z≡0. Matches line 542. |
| 3.3 Standard local L-ratio | JZ2020 (4.8)–(4.9), p.766, lines 1145–1155; (4.47), p.780, line 1826; (5.13), p.787, line 2130; ρ at lines 1828–1834 | Unmarked arguments confirmed; ρ=∧², Sym², As⊗ξ^m agrees with line 556. The zeta integral (4.9) is written through the inner product (4.8) (line 1155). Supported as the package states it. |
| 4.1 Dictionary | JZ2020 (4.7), line 1132; (4.8), line 1145; (5.6), p.785, line 2037; Thm 5.3, p.786, line 2067; Prop. 5.4 proof, p.788, line 2150; §5.5, p.791, lines 2284–2293 | (4.7) bilinear, (5.6) and Thm 5.3 Hermitian, §5.5 passes to the conjugate σ̄′ (line 2288). The package's three transports reproduce every printed self-pair statement once the test representation is conjugated. |
| 4.3 Maximal pole | JZ2020 pp.783–784, lines 1986–1998 | Distinct conjugate-self-dual τ_i give L(2s,τ_i×τ_j^ι) regular nonzero at 1/2, order r for the type factor, order exactly r iff the cross factor is nonzero at 1/2. Matches line 681 with the cross label fixed by §4.1. |
| 4.4 Bad-place product | JZ2020 (4.49), p.781, lines 1877–1888; §5.3, lines 2094–2100 | Z=Z_S·L^S with S the ramified and archimedean places; matches line 695. |
| 5.4 Vanishing above critical index | JZ2020 Prop. 6.2, p.793, lines 2386–2391 | Vanishing for a−ℓ₀−1<κ≤a+r_m and all rational orbits; one unramified place suffices (lines 2392–2395). Matches line 840. |
| 5.7 Critical unramified parameter | JZ2020 Lemma 6.5, pp.797–799, lines 2563–2573, 2612–2631, 2666–2688 | Same Satake parameter as τ_v. Index misprint at line 2619 and the truncated list (6.6) at line 2687 are recorded under source issues; the package's k₀=a/2+r_W (line 885) is forced by 2a+m−2k₀−1=a. |
| 6.2 Weak Fourier support | JZ2020 pp.804, lines 2960–2979 (p, p^1, Conjecture 6.8) | Existential in σ and its realization; the hypothesis set includes L(1/2,φ×φ′)≠0 (line 2996 context). Matches line 972; the unitary label caveat is the package's own convention statement. |
| 6.4 Central value to period | JZ2020 Thm 6.10, p.805, lines 2991–3008 | Hypotheses L(1/2,φ×φ′)≠0 and Conjecture 6.8 for (φ,(φ′)^w); conclusion a cuspidal pair in the coherent packets with nonzero period. The package applies the support proposition to (φ∨,φ′) and derives the equal central hypothesis (row below). Supported up to the recorded label gap. |
| 7.3 Regular recovery | JZ2020 §7.2, p.809, lines 3189–3216; (6.8), p.801, line 2794 | Quasi-split generic π, descent D(τ;∅)=F(E_τ), Corollary 7.2 under Conjecture 3.1. The package's even-unitary U₁ datum is its own correction (recorded source error in round 2). |
| 7.5 Subregular recovery | JZ2020 §7.3, pp.809–810, lines 3217–3249 | Case list (SO₂ₙ [2n−3,3] with split SO₃ via Theorem 11.2; SO₂ₙ₊₁ [2n−1,1,1]; U₂ₙ [2n−1,1]; U₂ₙ₊₁ [2n,1]) and Corollary 7.4 agree with lines 1127 and 1143. |

Also read: Zhang2022 Theorem 1.1 and Remarks 1.2–1.3, PDF pp.2–3, lines 80–113 (unramified assumptions: E_v unramified or split, quasi-split, spherical, conductor O_v; ρ=Asai even unitary, Asai⊗ω odd unitary); JZ2020 Theorem 7.1 at line 3118; AutomorphicSpectralTheory §2.8 (its line 1693) for the normalizer convention quoted at README line 114.

### Computed adversarial pass

t=s−1/2; T=q^(−s−1/2). Rows cover the sampled targets, every headline and every passage the round-3 repair changed.

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| Conventions: base change φ_β=(β,β⁻¹) at a split place | β(ϖ)=i; x=(x₁,x₂), x/c(x)=(x₁/x₂,x₂/x₁) | β(x₁/x₂)=β(x₁)β(x₂)⁻¹ → (i,−i); β⁻¹ → (−i,i)=c(i,−i) | Line 41 retained |
| Conventions: Levi determinant | (g,h)=(t,·) on U(1,1), t∈E^× | det on e,f is t·c(t)⁻¹=t/c(t); on U₁⊂U(1,1) det=u | Line 27 retained; used below |
| Conventions: modulus and L-value | GL₂, |a|=4; q=2, eigenvalues ±1, s=1 | δ_B^(1/2)=2; (1−T)(1+T)=3/4, L=4/3 | Retained |
| §0.1 orthogonal datum existence | (d,r)=(4,2),(5,2),(3,0),(2,1) | valid ℓ: {0,1},{0,1,2},{0},{0}; q(e₂+e₋₂)=2q(e₂,e₋₂)=2 | Criterion ℓ≤r and 2ℓ+1≤d; a nondegenerate middle space of dimension ≥1 has an anisotropic vector since 2 is invertible; retained |
| §0.2 partition | (5,1),(3,0),(4,2) | [3,1,1] sum 5 length 3; [1³]; leading part 5>4 invalid | Retained |
| §1.1 periods | ℓ=0, U₁ volume 1, χ²≠1 | Q(χ,χ)=∫|χ|²=1; P(χ,χ)=∫χ²=0; P(χ,χ∨)=1; second vector ×i: P×i, Q×(−i) | Retained |
| §1.3 cuspidality degenerate | split SO₂ (no proper parabolic) | constant-term conditions vacuous; ∫₁^∞dt/t=∞ | Hilbert carrier stays a separate contract; retained |
| §2.4 surviving cell | a=1, r_W=0, ℓ=0,1 | 0≤α≤β≤1, 1≤ℓ+β−α≤1: ℓ=0 → (0,1); ℓ=1 → (0,0),(1,1); β=max(a−ℓ,0)=1,0; C₂ character integral (1−1)/2=0 | Line 465 retained; vanishing does not use §2.6 |
| §2.6 inner indices | (a,ℓ)=(3,2),(2,2) | β−1=0; ℓ−a=0 | Retained |
| §3.3 numerator, twist test | split U(1,1), q=2, s=1/2, T=1/2; η(ϖ)=i | trivial data: (1−T)⁻²/(1−T²)⁻¹=4/(4/3)=3; twisted τ=(i,−i), φ_π=(−i,i): weights i(−i)=1, (−i)(i)=1 → 3; dual reading weights −1,−1: (4/9)/(4/3)=1/3 | Numerator τ×φ_π; integrand invariance: Ind(τη′⊗ση)=Ind(τ⊗σ)⊗η∘det_(U(X)), det=u on U₁, compensated by π⊗η⁻¹ |
| §3.3 Asai invariance | η′(x)=η(x/c(x)) on x∈A_F^× | x/c(x)=1 ⇒ η′|_(A_F^×)=1 ⇒ As(τη′)=As(τ) | Retained |
| §3.3/§4.1 cross roots | GL₃ torus (χ₁|·|^s, μ, χ₂⁻¹|·|^(−s)); coroots diag(x,x⁻¹,1), diag(1,x,x⁻¹), diag(x,1,x⁻¹) | roots χ₁μ⁻¹|·|^s, μχ₂|·|^s, χ₁χ₂|·|^(2s); (2,3,5) → 2/5, 15; undualized 10, 3/5; (i,−i,i) → weights 1,1, factor 4 vs 4/9 at T=1/2 | Cross factor τ×φ_σ∨ with φ_σ=(μ,μ⁻¹); retained |
| §3.4 spherical integral | U(1,1)⊃U₁, κ=2, p odd, t(y)=[[(1+y)/2,(1−y)/κ],[(1−y)κ/4,(1+y)/2]], det y | v(y)>0: |d|=1,|a|=|y| → X^n; v(y)<0: |d|=|y|,|a|=1 → Y^n; v(y)=0: 1 (since (1−y)+(1+y)=2 is a unit) | Σ_(n≥0)X^n+Σ_(n≥1)Y^n=(1−XY)/((1−X)(1−Y)); q=3 trivial: (8/9)/(4/9)=2; dual twisted: (9/16)/(9/8)=1/2 |
| §3.5 shifted arguments | α=1/3, β=1/4; α=β=1/2 | 5/12, 11/12, 4/3; boundary 0 | Retained |
| §3.6 nonzero section | b=2, 0 | W(1)=1/2 → 1; b=0 no reciprocal | Retained |
| §4.1 U(1,1) residue example | τ=φ_ξ, ξ(ϖ_w)=i | residue ξ∘det (τ(t)=ξ(t/c(t)) is the Borel quotient character at s=1/2); descent ξ; ∫_[U₁]ξπ′≠0 iff π′=ξ⁻¹; τ×φ_(ξ⁻¹)=(ξξ⁻¹,ξ⁻¹ξ)=(1,1) pole; τ×φ_ξ∨=(ξ²,ξ⁻²) no pole unless ξ²=1 | Self-pair τ≅φ_(π′)∨; output constituent ξ=π′∨ of parameter τ; retained |
| §4.1 recovery transport | f∈C_π, g∈C_σ | conj Q_ψ(f,g)=∫conj(B_ψ f)g=∫B_(ψ⁻¹)(conj f)g=P_(ψ⁻¹)(conj f,g) | Retained; used in §7.2 |
| §4.1 test weights | φ_(π′)=z=i, T=1/2 | τ=z⁻¹: weight 1, factor 2; τ=z: weight −1, factor 2/3 | Retained |
| §4.2 Laurent coefficient | A/t²+B/t+C, r=2; A=0 | coefficient A; 0 even if B≠0 | Retained |
| §4.3 criterion | type t⁻² with cross 3 or t | order 2 coefficient 3; order 1 coefficient 0 | Retained; cross label from §4.1 |
| §4.4 normalized product | Z=1/t, ℒ=2/t; empty S | germ quotient 1/2; empty product 1 | Retained |
| §4.5 holomorphy | r=2, Z=6t⁻²+3t⁻¹, ℒ=2t⁻²; φ_π=χ, χ²≠1 | 3+(3/2)t, value 3; τ=χ⁻¹ weight 1 (pole), τ=χ weight χ² (no pole) | Retained |
| §4.6 reciprocity | c=2, Z_S*(1/2)=3, leading ℒ 5 | 30; any factor 0 kills it; reverse direction: numerator order r and finite nonzero denominator at s=1/2 (3/2, 2 arguments) force pole order r of E, hence R≠0 | Retained; R≠0 is a hypothesis of the iff and an output of the reverse construction, as line 739 says |
| §4.7 functional equation step | τ=φ_π∨, cross L(1/2,φ_π∨×φ_σ∨) | (φ_π×φ_σ)∨ at the center: L(1/2,Π∨)=ε(1/2,Π)⁻¹L(1/2,Π), ε≠0 | Bilinear conclusion L(1/2,φ_π×φ_σ)≠0 reached; retained |
| §4.7 Hermitian/bilinear distinction | conjugate-self-dual χ, μ | χ∨μ∨=c(χμ), same L; χμ∨=χ·c(μ) equals χμ only if μ²=1 and c(χμ) only if χ²=1 | Line 757 retained; no identification of L(1/2,χμ) with L(1/2,χμ⁻¹) |
| §5.1 parameter | a=6, H_W=SO₃; ν₂ vs ν₁⊕ν₁ | ambient 15, standard 12+2=14; SL₂ weights (z,z⁻¹) vs (1,1) | Retained |
| §5.2 exponents | λ=−1/2, 0 with dt/t | ∫₁^∞t^(2λ)dt/t=1, ∞ | Retained |
| §5.3 critical index | (d,m,j,a)=(5,2,1,4),(6,1,2,6); a=1,j=2 | k₀=2,[5,1⁵] size 10, stabilizer 5; k₀=3,[7,1⁶] size 13, stabilizer 6; truncated k₀=0 gives m+1≠m+5 | Retained |
| §5.4 coinvariant | trivial action, ψ(n)=−1 | v=−v ⇒ v=0 over ℂ; char 2 no conclusion | Retained |
| §5.7 index and weights | d=a=6, m=1, r_W=0; μ=(2,3); U(1,1) τ_w=(i,−i) | 2a+m−2k₀−1=6 iff k₀=3 (k₀=2 gives 8); (1−2T)(1−3T)=1−5T+6T²; descent ξ has (ξ_w,ξ_w⁻¹)=(i,−i)=τ_w, opposite normalization gives τ_w∨ | Retained |
| §5.8 orbit sums | fixed class; two classes; zero image | summands 1; 2; 0, multiplicities 1 | Retained |
| §6.1 partitions | all three branches, a=2..29, m≤11; (4,2),(6,1),(2,1) | all sums 2a+m; coincidence only odd-SO a=2; [5,5]/[5,1⁵]; [7,5,1]/[7,1⁶]; [3,1,1]/[3,1,1] | F03 repair verified |
| §6.2 hypothesis | τ attached to φ, σ of parameter φ′ | cross value L(1/2,τ×φ_σ∨)=L(1/2,φ×φ′∨); orthogonal φ′∨≅φ′ | Retained |
| §6.4 hypothesis transport | (φ,φ′)↦(φ∨,φ′) | L(1/2,φ∨×φ′∨)=L(1/2,c(φ×φ′))=L(1/2,φ×φ′); constituent π₀ parameter φ∨, π=π₀∨ parameter φ; Q(f,p)≠0 ⇒ P(R,π)≠0 ⇒ (forward §4.6) P(π,σ)≠0 | Retained; characters as on line 1035 |
| §6.5 torus | ℂ/ℝ norm-one; split R× | |z|=1 compact; ∫₁^∞dt/t=∞ | Retained |
| §7.1 datum label | unitary π, τ=φ_π vs τ=φ_π∨ | constituents have parameter φ_τ (§5.7); τ=φ_π∨ yields π∨ of parameter c(φ_π) | Line 1083 retained |
| §7.2 chain | Q_ψ(f,g)≠0 | P_(ψ⁻¹)(conj f,g)≠0; reverse §4.6 for (π∨,σ) with τ=φ_π (self-pair φ_(π∨)∨=φ_π); module contains (π∨)∨=π; π₁⊂D ⇒ P_(ψ⁻¹)(π₁∨,σ)≠0 ⇒ Hom_R(π₁⊗σ∨,ψ)≠0; local pair (φ_π,φ_σ∨) | Retained; single-label hypothesis needed (two labels at one place break identification) |
| §7.3 partitions | U₄, U₃, U₂, SO₄, SO₅ | [4] ranks (3,2,1,0), [3,1] ranks (2,1,0,0); ambient 2·4+1=9; U₃ [3] with W=0; U₂ ℓ=0; SO₄ [4] excluded (even part multiplicity 1); SO₅ [5], N=4 | F04 repair verified |
| §7.4 subregular list | SO₆ [3,3]; U₅ [4,1]; SO₃ n=1 | Bessel [3,1³] stabilizer 3; Bessel [3,1,1] smaller 2; [1³], smaller 2 | Retained; split-SO₃ and unitary collapse remain explicit targets |
| §7.5 dominance | SO₈ [5,3] vs [4,4]; U₅ [4,1] vs [3,2], [5] | prefixes (5,8)≥(4,8); (4,5)≥(3,5); [5]≥[4,1] | Retained |
| Normalizer convention (line 114) | SO₃ q=2, trivial τ, s=1/2; coroot of the short root has α∨(u)=u² | M=ζ(1)/ζ(2)=2/(4/3)=3/2; β=2/3; N=1 | Agrees with AutomorphicSpectralTheory §2.8's Check |

Additional domain checks: positive characteristic, degenerate forms and q=1 are excluded by the standing hypotheses rather than assigned junk values; zero-dimensional W and SO₁ are admitted where the geometry permits and excluded from residual theorems by a=N>j≥0.

### Headlines, statability, padding

The 23 headline theorems named in the Suggested.lean docstring (lines 10–54) match the README's end theorems (§§1.3, 1.4 ×2, 3.4, 3.5, 3.6, 4.3, 4.5, 4.6, 4.7, 5.2, 5.4–5.8, 6.3–6.5, 7.2–7.5). Each needs adelic cuspidal realizations, rational Bessel Fourier maps, classical-group Eisenstein families or Arthur packets. At the pins (Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039) no such carrier exists: Tau Ceti's automorphic material is classical modular forms (TauCeti/NumberTheory/ModularForms/*), and "Eisenstein" occurs only for Eisenstein polynomials; Mathlib's `Representation.IntertwiningMap` (Mathlib/RepresentationTheory/Intertwining.lean:36) and `MeromorphicOn` (Mathlib/Analysis/Meromorphic/Basic.lean:494) carry no admissibility or Eisenstein structure. So the empty acceptance test with the docstring naming every missing carrier is the correct form; no stand-in is present. Padding probe: no declarations, nothing to probe. `#check` inventory: no own declarations, nothing to compare.

Elaboration: `lake env lean` on packages/TwistedAutomorphicDescents/Suggested.lean from the content checkout exited 0 with no output (3.5 s); no object file had to be built.

### Libraries at the pins

Opened: `TauCeti.RegularFormClass.wittDecomposition` (TauCeti/LinearAlgebra/QuadraticForm/Witt/Decomposition.lean:262), `QuadraticMap.IsometryEquiv.exists_extension` (Witt/Extension.lean:50), `TauCeti.equivalent_of_equivalent_prod` (Witt/Cancellation.lean:196, `[FiniteDimensional K V₀]` on the cancelled summand), `TauCeti.QuadraticMap.specialOrthogonalGroup` (OrthogonalGroup/Basic.lean:373, with the membership `f ∈ orthogonalGroup Q ∧ LinearEquiv.det f = 1` at 381), `TauCeti.QuadraticMap.det_reflection` (OrthogonalGroup/Basic.lean:887, `[Module.Free R M] [Module.Finite R M]`), `Nat.Partition` (Mathlib/Combinatorics/Enumerative/Partition/Basic.lean:52). The README's statements of their hypotheses (lines 53–59) match.

### Ownership, supplier citations, merge direction

Searches over main and all 367 open heads with the roadmap service: "twisted (automorphic )?descent" matches on main only unrelated sentences (AdicSpacesPartIV line 5129, SchubertGeometry line 83); "Bessel period" only GanGrossPrasadUnitaryGroups; "Bessel–Eisenstein" nothing; "cuspidal automorphic module" and "Jiang–Zhang" only the cited suppliers AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory, ModularityAndLanglandsExtensions. The board index lists 19 packages (AnalyticNumberTheory … VectorBundlesAndIsocrystalsPartII); none concerns relative descent. GanGrossPrasadUnitaryGroups lists this roadmap as a consumer (its line 1406) and cites none of the changed sections. This roadmap is the owner of the orthogonal relevant pair, the orthogonal local uniqueness target and the rational residue/Fourier comparison.

Supplier sections resolved at the current heads: AutomorphicSpectralTheory §0.15 (line 359), §2.4 (1601), §2.4a (1620), §2.8 (1693), §2.9 (1714), §2.13 (1758), §2.14 (1769), §§4.1–4.4 (2311–2364); GanGrossPrasadUnitaryGroups §§1.1–1.3 (210–315), §§2.1–2.6 (355–509), §3.9 (787), §3.10 (807), §3.11 (837), §§4.1–4.4 (867–941), §7.1 (1301); ModularityAndLanglandsExtensions §3.3 (1884), §3.4 (1914), §3.8 (2008), §3.12 (2118), §3.15 (2187), §3.16 (2206), §3.17 (2225), §3.18 (2246), §3.23 (2375), §3.25 (2413), §5.4 (3454); AutomorphicLFunctionsAndLocalFactors AL.3 (1951) with whittaker-model (1957), rs-global-poles (2238) and the other anchors; SmoothRepresentationsOfLocalGroups SR.0.1–SR.0.4 (559–801), SR.2.1–SR.2.3 (1834–2123), geometric-lemma (2093), SR.3.1–SR.3.3 (2488–2769); EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 (4172–4220); GeometryOfNumbersAndQuadraticArithmetic §2.9 (1195; its carrier is stated for any commutative field with involution, as the README says); ReductiveGroups Layer 7b (main, line 732); ReductiveGroupsPartII RG2.4 (5510); LieHighestWeightPartII N0/nilpotent-orbit and N2/classical-partitions (board design, lines 75 and 349). The README's quotation of the §2.8 convention (line 114) is the supplier's displayed `β_v` and `N_v=β_v M_v`, and its SO₃ Check reproduces the supplier's Check.

The required check, run from the content checkout, exited 0 and printed exactly:

~~~text
depcheck: 56 roadmaps, 641 edges, 0 problem(s)
~~~

No UPWARD, CYCLE or moved line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere (main 5fabda7, 367 heads).

### Declared-gap audit

All sixteen contracts have a named supplier, the same slug in plan.json `gaps` and in the README, and a `needs` sentence with hypotheses: hermitian-witt-complements (ReductiveGroupsPartII RG2.4), rational-nilpotent-orbits and classical-dominance (LieHighestWeightPartII N0, N2), rational-fourier-support and bessel-restriction-growth (AutomorphicFormsOnReductiveGroups 4.1–4.2), twisted-jacquet-filtration and spherical-whittaker-normalization (SmoothRepresentationsOfLocalGroups SR.2.2, SR.4.1–SR.4.4), all-place-signed-factors and type-poles-and-cross-factor (AutomorphicLFunctionsAndLocalFactors AL.4, AL.3–AL.4), isobaric-eisenstein-continuation (AutomorphicSpectralTheory 2.4, 2.4a, 2.14), quasisplit-residual-packets-membership, residual-irreducibility, all-member-residual-support, coherent-packets-comparison, generic-discrete-member-cuspidality, standard-base-change-uniqueness (ModularityAndLanglandsExtensions 3.8–3.25 ranges). Minimality was spot-checked against the suppliers opened above: SR.2.2 has the ordinary geometric lemma, not the character-twisted quotient; GNQA §2.9 has field Hermitian carriers but no Witt extension with prescribed complements; AST §2.8 is stated for cuspidal-generic σ, so the noncuspidal smaller datum is genuinely missing. None asks for what is supplied. The acceptance is conditional on these sixteen.

## Not verifiable

- GRS2011 (Theorems 5.1, 5.4, 5.6, 7.3) is the manifest's settled uncertified book; cited by locator only, through JZ2020 lines 713, 2399, 2439, 2560. Not requested again.
- The overline on the conjugated argument of JZ2020 (4.8) is lost in the text extraction; line 1148 names the conjugation, so which argument carries it was taken from the standard reading and from §5.5's use (line 2288). The package's statement (line 638) depends only on one argument being conjugated.
- Ownership against open pull requests was checked through the roadmap service's index of 367 heads, not by opening each sibling checkout.

## Source issues

- **Gap** in JZ2020 at (4.47), (5.13) and the proof of Proposition 5.4, printed pp.780, 787–788: the source says the unitary tensor arguments τ×π, τ×σ without marking which dual the Hermitian pairing (4.8)–(4.9) introduces; it should fix base change, duals and test vectors in one diagram; affects the proof.
- **Gap** in JZ2020 at §5.5, printed p.791 (line 2293): the source says nonvanishing of L(1/2,τ×σ∨) gives nonvanishing of L(1/2,τ×σ); it should justify this for conjugate-self-dual unitary data, where χ·c(μ) and χμ differ; affects the proof.
- **Misprint** in JZ2020 at Lemma 6.5, printed p.798 (line 2619): the source says vanishing above a/2+r_m with the nonzero module at a/2+r_m−1 for split odd orthogonal H_m and split output; it should be a/2+r_m, forced by the output dimension; affects the proof.
- **Misprint** in JZ2020 at (6.6), printed p.799 (line 2687): the source says the even-unitary critical character list ends at μ_([a/2]−1); it should end at μ_([a/2]), keeping the standard degree; affects the proof.
- **Gap** in Zhang2022 at Remark 1.2, PDF p.3 (line 107): the source says the split general-linear case of Theorem 1.1 still needs justification; it should supply that split comparison before the uniform formula is used; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8b40b31", "job": "REV-PKG-TwistedAutomorphicDescents~3", "model": "fable", "worker": "fable-rev124"} -->
