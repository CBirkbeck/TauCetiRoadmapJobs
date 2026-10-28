<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/993#issuecomment-6399509171 -->
Review (claude) of 15f8fb2

Verdict: accepted
Conditional on the announced gaps: `all-coefficient-places-zeta`, `newform-central-analytic-interface`, `elliptic-quadratic-analytic-identities`, `isogeny-corank-all-primes`, `pointed-cubic-model-comparison`, `kato-rational-duality`, `central-jstar-control`, `central-finite-conditions-and-descent`, `central-modular-local-dimensions`, `theta-induction-arbitrary-cm-curve`, `cube-sum-full-cm`, `smith-unconditional-positive-corank`, `cm-three-selmer-unconditional`

1. **F01** (P3) The full-range zeta gap asks for the admissible range too, and cites a section with no restriction

   **Location.** `packages/CMRankZeroConverse/README.md` line 101: "for every normalized cuspidal newform of weight k≥2, every prime p and every coefficient place λ|p, export the actual E-linear zeta morphism … without an admissibility restriction"; the same sentence in `packages/CMRankZeroConverse/design/plan.json` line 1830 with section "4.6, 5.1 and 5.3"; line 97: "Sections 4.4 and 4.6 supply … in their stated admissible range".

   **Claim.** The gap's `needs` is the missing piece of KatoEulerSystems §§4.6, 5.1 and 5.3, and §4.6 is restricted to admissible pairs.

   **Witness.** KatoEulerSystems README at board head 0590194: line 176 defines admissible pairs (every CM form; non-CM forms with a one-dimensional fixed space); line 1460 "Throughout 5.1–5.4 `(f,λ)` is admissible"; line 1394, in §4.6, "These hold at every p, including two". So §§5.1 and 5.3 already export the morphism, the conjugation relation and the interpolation for every admissible pair, and §4.6 (twist commutes with specialization) has no admissibility restriction at all.

   **Repair.** In both copies of the `needs` sentence (README line 101, plan.json line 1830) write: "for every normalized cuspidal newform of weight k≥2, every prime p and every coefficient place λ|p at which (f,λ) is not admissible in the sense of its Conventions, extend §§5.1 and 5.3: the actual E-linear zeta morphism of Kato Theorem 12.5(1), its relation z(cγ)=−σ₋₁z(γ) and critical interpolation on F-rational vectors, compatibly with rational lattice change, Tate twisting and central specialization." In plan.json set the section to "5.1 and 5.3". On line 97 write "Section 4.4 supplies … in its stated admissible range; §4.6 supplies twist/specialization compatibility for every pair."

   **Tested.** On the two instances of the round-3 finding: the weight-two theta newform of y²=x³−x at λ|2 is CM, hence admissible, and is covered by §§5.1, 5.3 directly, with no gap; a non-CM form with a nontrivial inner twist at a λ over a ramified place of Momose's algebra is inadmissible and is exactly what the narrowed gap requests. Nothing in Layers 2–3 changes: lines 317, 327, 355 and 363 already apply the gap only "outside the supplier's stated range".

One finding, P3. All five round-3 findings are repaired (F01 through the alternative repair the round-3 review offered). The repairs introduced no new defect. Every blocking pattern of the brief was tested on the changed passages, the fifteen sampled targets and the nine Lean declarations; the values are in the tables below.

## Verified sound

### Repair check, round-3 findings (5 of 5 repaired)

| Id | Repaired passage (abridged) | Status |
| --- | --- | --- |
| F01 (P2) | README line 21: "Layers 2–3 retain every coefficient pair (f,λ). The full-range zeta morphism, twist compatibility and interpolation are required by gap:all-coefficient-places-zeta wherever the stated range of KatoEulerSystems does not provide them"; line 101 states the contract; plan.json lines 1829–1833 declare slug, supplier KatoEulerSystems, section "4.6, 5.1 and 5.3"; §§2.1–2.3, 3.1–3.2 and the Layer 2–3 Dependencies cite "§5.1 in its stated range and gap:all-coefficient-places-zeta for the full range". | Repaired, by the second repair the round-3 review offered (declare a gap). The repair report's label "not actionable in this package" describes the reason it chose that route, not a refusal; the gap is declared where the intake reads it. Its wording is R01. |
| F02 (P3) | Line 321: "ModularIwasawaMainConjectures §0.7 KMC_rational, the rational Kato equality"; lines 105–107 add the "From TauCetiRoadmap.ModularIwasawaMainConjectures" contract (§§0.6–0.7, A=Λ[1/p], p=2 lengths away from two, KMC.changeLattice); line 9 names it in Scope; lines 343, 359, 363, 379 use it. | Repaired. MIMC head #1499 lines 441–455 define KMC, KMC_rational ("the equality of ideals in Λ[1/p]") and KMC.changeLattice; the p=2 clause matches Kato lines 4165–4168. |
| F03 (P3) | Line 15: "`squareclassHeight` restates ArithmeticStatisticsPartI §0.5's squareclassHeight for every number field K; this local copy is needed only to state the headline theorems"; line 524: "For every number field K, define `squareclassHeight` … This restates ArithmeticStatisticsPartI §0.5's squareclassHeight on the same carrier"; Lean docstring lines 92–93. | Repaired. ASPartI #1171 line 1035 gives the same product over odd-valuation primes on Tau Ceti's SquareClassGroup F for every number field, proposed declaration `squareclassHeight`. |
| F04 (P3) | Line 589: "For any field K with a specified ℚ-algebra structure, hence of characteristic zero, and a Weierstrass curve W/K define pointed descent to ℚ by `descendsToRat` … the coset and counting theorems of §§6.4–6.6 apply it with K imaginary quadratic." | Repaired; equals the elaborated type `{K} → [Field K] → [Algebra ℚ K] → WeierstrassCurve K → Prop`. |
| F05 (P3) | Line 13: "EllipticCurves Layers 1, 5 and 7 own general isogenies, pointed-twist classification and, under gap:isogeny-corank-all-primes, all-prime isogeny invariance of the classical p∞ Selmer corank"; line 439 the same qualification in Layer 4 Dependencies. | Repaired. EllipticCurves Layer 7 on main (line 1262; Cassels stretch at 1288–1302) does not state the corank theorem. |

Each repaired pattern was searched for in the rest of the package: no other unqualified attribution of a gap's content to its supplier; no other local copy of a supplier definition without the restatement sentence; no prose generality narrower than a Lean signature (all nine compared, table below); no hypothesis stated without naming its owning proposition.

### Adversarial table (changed passages, sampled targets, headlines)

| Statement | Instances tried | Values computed (statement side / test side) | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions line 21, full range at every (f,λ) | CM form at λ\|2; non-CM form with inner twist at a ramified λ of Momose's algebra | KatoEulerSystems 0590194 line 176: CM ⇒ admissible, so §§5.1, 5.3 apply; the inner-twist pair is excluded there (line 1460) and falls to the gap | Correct use of supplier plus gap | R01 (wording of the gap only) |
| §0.2 central sign ε=(−1)^(k/2−1) with ℕ-arithmetic | k=0,1,2,3,4,6,7 | k/2−1 in ℕ: 0,0,0,0,1,2,2 (truncated), so ε=1,1,1,1,−1,1,1; ε²=1 always; ε(−1)^h at k=2,4,6: (1)(−1), (−1)(1), (1)(−1) = −1,−1,−1; at k=0: (1)(1)=1 | Relation holds exactly on even k≥2, as stated | none |
| §0.2 projector P_ε(v)=(v+εc v)/2 | c=diag(1,−1), v=(1,−1), ε=+1 and −1; swap involution on (1,0) over ℤ₂ | P₊(1,−1)=((1,−1)+(1,1))/2=(1,0); P₋(1,−1)=((1,−1)−(1,1))/2=(0,−1); sum=(1,−1)=v; swap: ((1,0)+(0,1))/2=(1/2,1/2)∉ℤ₂² | Idempotent eigen-projectors; no integral dyadic splitting, as the API says | none |
| §0.2 sign against Kato 12.5(1) | r=h, χ trivial | Kato line 4066: ±=(−1)^(k−r−1)χ(−1); at r=k/2: (−1)^(h−1)=(−1)^(k/2−1)=ε; BT line 235: ±=(−1)^(k/2−1) | Same sign in both sources | none |
| §0.4 evaluation ev_h(σ_c)=c^(−h) | (p,h,c)=(3,1,4); σ₋₁ at h=1,2; p itself | 1/4 (BT line 240: σ_c↦c^(−k/2)); (−1)^(−1)=−1, (−1)^(−2)=+1; ev(p)=p≠0 so p∉𝔮 | Matches BT; kernel is a height-one prime with residue field E | none |
| §0.4 at p=2 | Δ={±1}; σ₋₁±1 at h=1,2 | h=1: σ₋₁+1↦0 (in 𝔮), σ₋₁−1↦−2≠0; h=2: σ₋₁−1↦0, σ₋₁+1↦2 | The selected finite-character component switches with h | none |
| §1.1 H⁰(ℚ,M_f(r))=0 | irreducible rank two; 1⊕χ_cyc; the zero twist r=0 and r=5 | A fixed vector spans a stable line: contradicts absolute irreducibility (AGR 4.8, head #1007 line 1972); 1⊕χ_cyc has h⁰=1; twisting preserves irreducibility | Kato line 4819 states the same vanishing | none |
| §1.2 route, first Poitou–Tate on W′ | h_f(W)=0; local h²(W′)=0; local (h¹,h_f¹)=(2,1) | Kato (14.9.3) (lines 4771–4774) for T⊂W′: Selmer term is S(ℚ,T*(1))^∨ with T*(1)⊂W, rationally 0; H²_glob(W′)↪H²(ℚ_p,W′)=0; quotient H¹_glob/H_f¹ ≅ H¹(ℚ_p)/H_f¹ of dim 2−1=1 | Global H²(W′)=0 and a one-dimensional quotient | none |
| §1.2 route, dual Selmer then W | h⁰(W′)=0, h²(W′)=0, dim W′^(c=−1)=1 | Euler (14.9.5), line 4787: 0−h¹+0=−1 ⇒ h¹(W′)=1; h_f¹(W′)=1−1=0; second (14.9.3) for T⊂W: Selmer term S(ℚ,T*(1)) with T*(1)⊂W′, zero; local H²(W)=0 ⇒ H²_glob(W)=0 | Both uses necessary; BT line 232–234 skips the first (source gap, below) | none |
| §1.2 j_* Euler characteristic | localization sequence for j:Spec ℤ[1/pN]→Spec ℤ[1/p] | difference of χ(ℤ[1/p],j_*V) and χ(ℤ[1/pN],V) is Σ_(ℓ\|N) χ(𝔽_ℓ, H¹(I_ℓ,V)) and h⁰=h¹ over a finite field, so 0 | Euler identity is the same for the j_* complex | none |
| §1.3 dim H¹_global(W)=1 | odd rank-two W; the zero representation; sign +1 in the Euler identity | 0−h¹+0=−1 ⇒ h¹=1; zero rep: 0=0; with +1: h¹=−1<0 impossible | Sound, Kato line 4787 | none |
| §2.1 control | R→R with differential π over a DVR; then H²=0 | H²=R/π, Tor₁(R/π,R/π)=R/π of length 1 in degree one; with H²_𝔮=0 the Tor vanishes and H¹_𝔮/𝔮≅H¹_global | Degree-one correction retained until §1.2 kills H² | none |
| §2.2 class depends on P_ε(γ) | z(cγ)=−σ₋₁z(γ), ev(σ₋₁)=(−1)^h | z(cγ)≡−(−1)^h z(γ)=(−1)^(h−1)z(γ)=εz(γ); z(P_εγ)=(z(γ)+ε·εz(γ))/2=z(γ); z(P₋εγ)=(z(γ)−z(γ))/2=0 | API bullets "sends cγ to −(−1)ʰ…" and "depends only on Pε(γ)" agree with each other and with Kato line 4070 | none |
| §2.2 scalar Check (new) | z(γ)≠0; 2γ; γ/2 | 2z(γ)≠z(γ) in characteristic 0; z(γ/2)=z(γ)/2 | Linearity excludes the normalized-away map | none |
| §2.3 basis from KMC_rational | H²_𝔮=0; quotient R/π; zero projection; ε-line one-dimensional | char(H²_𝔮)=(1); equality ⇒ length(H¹/Z)_𝔮=0 ⇒ Z_𝔮=H¹_𝔮; H¹_𝔮 free of rank one so Z_𝔮 is generated by any z(γ₀) with P_ε(γ₀)≠0 (z(γ)=λz(γ₀) when P_ε(γ)=λP_ε(γ₀)); reduction mod 𝔮 is the control map of §2.1 onto a one-dimensional space | z is a basis; R/π (length 1, ideal (π)) is excluded by equality; mere divisibility (π)⊂(1) would not exclude it | none |
| §2.3 KMC_rational at p=2 | (O/2O)[1/2]; MIMC §0.7 | (O/2O)[1/2]=0; MIMC #1499 lines 443–445: at p=2 KMC is Kato's length equality away from primes containing 2 and coincides with KMC_Q | Hypothesis named exactly as the supplier defines it | none |
| §3.1 reciprocity | k=2,4,6 at r=h; Euler polynomial zero; F-basis γ₁,γ₂ | exponents k−r−1 = 0,1,2 with signs +,−,+; L^(p)=P_p·L: P_p=0 gives product 0, so a nonzero product forces L≠0 without division; E-linearity gives a basis vector with nonzero exp*∘loc∘z | Matches Kato line 4068 and KatoEulerSystems §5.3 (head line 1533–1548) | none |
| §3.2 Check (new) | z↦2z over A, p odd and p=2 | 2∈A× in both cases: Z(f) and all lengths unchanged; period value b↦2b≠b | KMC_rational does not pin the normalized map; the gap is needed | none |
| §3.3 CM all-prime converse | ℚ(i) at 2; ℚ(√−2) at 2; ℚ(ζ₃) at 3; ℚ(√−7) at 7 | (ζ₈+ζ₈³)²=2ζ₈²+… = i−2−i·… = −2 (computed: ζ₈²=i, ζ₈⁴=−1, ζ₈⁶=−i, so sum = i+2(−1)+(−i)=−2); quadratic subfields of ℚ(μ_(p^∞)): p odd gives ℚ(√p*) with p*=(−1)^((p−1)/2)p, imaginary iff p≡3 mod 4; p=2 gives ℚ(i),ℚ(√−2),ℚ(√2) | Line 97's list of contained fields is exactly right; Kato 15.14 (line 5731) covers them; MIMCPartII design CZ.5 line 161 cites 15.14 for the same cases | none |
| §4.1 typed comparison | A/K with CM order; L containing both embeddings | K⊗L=L×L so V_pA⊗L=η⊕η̄; det=χ_cyc ⇒ η̄=η^∨(1); M_(f_η)(1)⊗L=Ind η̄ and M_(f_η̄)(1)⊗L=Ind η; Shapiro: H_f¹(K,η̄)⊕H_f¹(K,η)=H_f¹(K,V_pA⊗L) | BT line 256 writes ⊗K and V(f) without the twist (source misprint, below); the README's typed display is the correct one | none |
| §4.1 Check on the twist | omit (1) | Ind η^∨ has determinant χ_K·(ηη^c)^(−1)… ; comparing Ind η^∨ with Ind η̄=Ind η^∨(1): determinants differ by χ_cyc² | Check value correct | none |
| §4.3 corank doubles | coranks 0,1; the ℤ₂² swap lattice; self-twist | Sel(A/K)=Sel(A/ℚ)⊕Sel(A^(D)/ℚ) rationally; [√D]∘φ: σ([√D]φ)=(−[√D])(φ[−1])=[√D]φ is ℚ-rational, so A^(D) is ℚ-isogenous to A; 0=2·0, 2=2·1; swap lattice: images (1,1),(1,−1), index 2 | Rational doubling; integral splitting fails; isogeny corank is the declared gap | none |
| §4.4 analytic order doubles | (s−1)^r u(s), r=0,1,2 | L(A/K)=L(A)L(A^(D))=L(A)² (equal local factors under the ℚ-isogeny); orders 0,2,4; u(1)²≠0 | `analyticOrderNatAt_mul` (Order.lean 528) needs both orders finite: F entire with first coefficient 1 is nonzero, so finite | none |
| §5.3 exact half | residues of positive squarefree n | 0,4 mod 8 impossible (4\|n); odd squarefree density 4/π² split 1/π² over 1,3,5,7; even squarefree 2m density 2/π² split 1/π² over 2,6; allowed 1,2,3: 3/π² of 6/π² = 1/2; root number +1 exactly there (BT line 97) | Exact limit 1/2 | none |
| §5.4 discriminant weights | n odd ≡1 (4): d=n,−4n; n odd ≡3 (4): d=−n,4n; n even: d=±4n | cutoffs n and 4n, or 4n twice: weights 1+1/4=5/4 (odd classes), 1/4+1/4=1/2 (even classes); total 4·5/4+2·1/2=6; allowed 5/4+1/2+5/4=3; ratio 1/2 | Matches README line 499 and line 503 | none |
| `congruentNumber_half_discriminants` filter | d=1,−3,−4,−7,−8,8,12; d=0,4,9 | Int.emod: (−3)%4=1, (−7)%4=1; −4=4·(−1), (−1)%4=3; −8=4·(−2), (−2)%4=2; 8=4·2; 12=4·3; Squarefree 1 true; 4 needs m=1, 1%4=1 rejected; 9 not squarefree; 0 excluded | Exactly the fundamental discriminants, both signs, d=1 included | none |
| `congruentTwist` model | n=2 (elaborated); n=−3 | a₄=−4, Δ=4096 proved by `simp`/`norm_num` in the scratch file; congruentTwist(−3)=congruentTwist 3 proved by `simp` | Model API Checks hold at the pin | none |
| twist by 4m vs m | d=8 | congruentTwist 8: a₄=−64; (X,Y)↦(4X,8Y) on Y²=X³−64X gives 64Y²=64X³−256X ⇒ Y²=X³−4X = congruentTwist 2 | Same pointed curve | none |
| `ellipticLNonvanishingAtOne` model independence | y²=x³−x and y²=x³−16x | LFunction.lean line 44: `localPolynomial` uses `W.minimal R`; both models have the same minimal model at every prime, so the same `LSeries` | Predicate is an isomorphism invariant, as the API says | none |
| §6.1 hypotheses of the Lean headline | K=ℚ(ζ₃),ℚ(√−2),ℚ(i); End_K(A)≠ℤ | O_K/(3): 𝔽₃[e]/e² (ramified), 𝔽₃×𝔽₃ (T²+2≡(T−1)(T+1)), 𝔽₉ (inert): (3) not prime in the first two, prime in the third; End_K(A)⊗ℚ embeds in K through the invariant differential in characteristic 0, so End≠ℤ means an order of K | Equals BT Proposition 1.3 (line 58–60) and BKLOS Theorem 2.7 (line 196–198) hypotheses | none |
| `squareclassHeight` | ℚ: [2],[1/2],[8]; ℚ(i): [5],[20],[3],[2],[i] | valuations 1,−1,3 odd ⇒ H=2,2,2; H([5])=5·5=25 (split), H([20])=25 (extra even valuations), H([3])=9 (inert), H([2])=1 ((1+i)² has even valuation), H([i])=1; 2=−i(1+i)² so [2]=[−i]=[i] since −1=i² | Equals ASPartI line 1035 and BKLOS line 80–84; height-one set not a singleton | none |
| `cmTwists_nonvanishing_lowerHalf` denominator | X≤1; X→∞ | H≥1 so {H<X}=∅ for X≤1, 0≤0 holds; #{H<X}=c_K X+o(X), c_K>0 (ASPartI line 1951) so "eventually (1/2−ε)N ≤ N_nv" is liminf ≥ 1/2 | Headline equals the displayed proposition | none |
| §6.2 forward map | symbolic | G(6nz, 9n(x−y), x+y)·(x+y)³ = 27n²[(x+y)(3(x−y)²+(x+y)²)] − 216n³z³ = 27n²·4(x³+y³) − 216n³z³ = 108n²F | Identity verified by expansion | none |
| §6.2 inverse map and composite | symbolic; [1:−1:0] | (9nZ+Y)³+(9nZ−Y)³−54nX³ = 1458n³Z³+54nZY²−54nX³ = 54n·G; forward∘inverse = [18nX:18nY:18nZ]; origin ↦ [0:18n:0] | Both identities and the pointed origin hold for n≠0; at n=0 the scalar is 0 | none |
| §6.2 discriminant | n=1,3 | −432·(27n²)² = −314928n⁴: −314928, −25509168; 2⁴·3⁹=16·19683=314928 | Matches API | none |
| `descendsToRat` | Y²=X³−X over ℚ(i); Y²=X³+X+(1+i) | C=1 witnesses descent; j=1728·4/(4+27(1+i)²)=6912/(4+54i)∉ℚ since Im≠0, Δ=−16(4+54i)≠0 | Discriminating | none |
| §6.4 cosets | j≠0,1728; j=0 with t³∈ℚ×K×⁶; j=1728 with t²∈ℚ×K×⁴; ℚ(√−2), t=√−2 | one rational twist class; [t]³=[t]=1 in the exponent-two group K×/ℚ×K×²; (t/u²)²=q∈ℚ ⇒ t/u²∈ℚ× or ℚ×√D; Y²=X³−X twisted by √−2 is Y²=X³+2X (a₄=−(4√−2)²/16·… scaled: 32↦2 by u=2), and a²=2b² has no rational solution so √−2∉ℚ×K×² | At most two cosets, second one needed at 1728 only | none |
| §6.5 descent count | coset t₀[n], n squarefree, ℓ∤ exceptional set | ℓ split: two primes of norm ℓ, odd valuation at each, factor ℓ²; ℓ inert: one prime of norm ℓ², factor ℓ²; so H≥c·n_out² and H<X ⇒ n_out<√(X/c): O(√X) choices times finitely many exceptional-prime and sign choices; two cosets | O(√X) against c_K X | none |
| `cmTwists_nondescending_nonvanishing_lowerHalf` | total cX, loss C√X, limits 1/2 and 3/4; empty descent set | ratio ≥ 1/2 − (C/c)/√X + o(1) → 1/2; 3/4 stays 3/4; empty set loses nothing | Lower half preserved; no exact density claimed | none |
| §6.6 restricted denominator | non-descending denominator | (cX − C√X)/(cX) → 1, positive eventually | Second bound follows | none |

Hypothesis scope in Lean: both CM headlines carry `[NumberField K] [IsTotallyComplex K]`, `finrank ℚ K = 2`, `¬(Ideal.span {3}).IsPrime`, `[A.IsElliptic]`, the non-surjectivity of `Int.castRingHom` into `TauCeti.Isogeny.Hom A.toAffine A.toAffine` (whose `Ring` instance at Hom/Ring.lean line 174 requires ellipticity and multiplies by composition) and `0 < ε`; the three congruent-number limits have no free binders; `squareclassHeight` keeps `[NumberField K]`, `descendsToRat` keeps `[Algebra ℚ K]`. Nothing is quantified over data unrelated to the construction.

### Declared gaps (13)

All thirteen slugs, suppliers and `needs` sentences are identical between README and `design/plan.json` (checked by a mechanical diff of the two lists). Every supplier is earlier in the merge order (ArithmeticGaloisDuality 53, SelmerIwasawaCohomology 64, ArithmeticStatisticsPartVII 162, ComplexMultiplicationAndExplicitReciprocity 185, EllipticCurveModularity 188, KatoEulerSystems 247; ModularForms, EllipticCurves and AlgebraicCurves on main; CMRankZeroConverse is at 281). The twelve gaps of round 3 were checked there against the suppliers with computed boundary values and are unchanged; the new gap is R01. ArithmeticStatisticsPartVII #1178 line 1556 still assumes "C over K for an ideal-kernel degree-three isogeny" in "Cm twists have corank zero at least half", so gap:cm-three-selmer-unconditional is still not provided; its §5.9 target "P infinity selmer corank distribution in twist families" (line 1170) and its Smith-law conditionality are as cited.

### Mechanical checks

- **Elaboration.** `lake env lean` on `packages/CMRankZeroConverse/Suggested.lean` from the content checkout (lake-manifest pins Mathlib 6b7abb3, Tau Ceti a91d3aa; all four imported Tau Ceti object files present, no build needed): exit 0 in 9.1 s wall, exactly five warnings "declaration uses `sorry`" at lines 55, 67, 78, 106, 132.
- **Binder audit.** A scratch copy with `#check @name` for all nine declarations elaborated; every printed type is listed in the scratch log and matches the README statement (generality table above). No section binder was dropped.
- **One-tactic probe.** The same scratch copy replaced each `sorry` by `first | (simp; done) | rfl | infer_instance | trivial | decide | (norm_num; done) | (simp_all; done) | (aesop; done)`: all five theorems fail with unsolved goals (40 attempts, 0 closed). No padding; the four definitions have real bodies on native carriers and exist only to state the headlines.
- **Form.** One `import Mathlib` plus the four Tau Ceti modules actually used; no `set_option`, `lemma`, `#eval`, sorry'd data, LaTeX delimiters, process words, pull-request numbers or machine paths (grepped). All nine Lean names occur in the README and every backticked own name of the README is declared. Nine definitions, each with an API list and at least three Checks (33 `**Checks.**` blocks); every layer ends with `### Examples` and `### Dependencies` (7 and 7).
- **Dependency check.** Output, verbatim: `depcheck: 52 roadmaps, 594 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Headline theorems.** The README's end theorems are the CM newform converse (§3.3), the CM elliptic converses (§§4.2, 4.5), the three congruent-number density theorems (§§5.2–5.4), CM twist nonvanishing (§6.1) and non-descending nonvanishing (§6.6). The five statable ones are stated; §§3.2, 3.3, 4.2 and 4.5 are named in the module docstring with the missing carriers (modular Galois realizations, the Bloch–Kato Selmer carrier, the zeta morphism with its Iwasawa complex, the classical p∞ Kummer Selmer carrier). Tau Ceti at the pin has only the finite two-descent carriers `selmerGroup₂`/`selmerGroupA` (round 3 verified; unchanged pin), so the docstring is right that these are not statable, and no stand-in is used.

### Library declarations opened at the pins

All 39 cited lines hold the named declaration: Mathlib `Weierstrass.lean` 76, 86, 131, 230, 366, 388; `EllipticCurve/LFunction.lean` 44 (`localPolynomial` via `W.minimal R`), 79, 84; `ModularForms/LFunction.lean` 134, 190; `Analytic/Order.lean` 523, 528; `Analytic/Uniqueness.lean` 234; `DedekindDomain/Factorization.lean` 309 (`count`, zero ideal ↦ 0), 596; `Ideal/Norm/AbsNorm.lean` 258; `NumberField/Basic.lean` 101; `Cyclotomic/Basic.lean` 652; `NumberField/Cyclotomic/Basic.lean` 56; `NumberField/Cyclotomic/Ideal.lean` 83, 106, 124. Tau Ceti `SquareClassGroup/Basic.lean` 45 (`Additive Kˣ ⧸ (Subgroup.square Kˣ).toAddSubgroup`), 66; `QuadraticTwist/Basic.lean` 169 (a₄ scales by (t²−4n)², so (0,−a) is the twist by 4a), 411, 739; `ShortWeierstrass.lean` 109, 168; `NormalForms.lean` 131, 140; `Isogeny/Hom/Basic.lean` 106; `Isogeny/Hom/Ring.lean` 174; `Newforms/Newform.lean` 104; `CompletedGroupAlgebra/Basic.lean` 145; `AnalyticInvariants.lean` 72, 80, 107; `LFunction/EulerProduct.lean` 217; `LFunction/FunctionalEquation.lean` 324; `Conjugate.lean` 298.

### Cross-roadmap citations resolved (this round)

- **KatoEulerSystems** (board head 0590194, read through the index's `gh api` route): §§4.1 (line 1110), 4.4 (1311), 4.6 (1383), 5.1 (1463, `z^Ka(ιγ) = −σ_(−1) z^Ka(γ)`), 5.3 (1533, sign `(−1)^(k−r−1)χ(−1)`, power `(2πi)^(k−r−1)`, dual form f*), 7.2 (1974); admissible pairs at line 176.
- **ModularIwasawaMainConjectures** (#1499): §0.6 (line 397) and §0.7 (441) with KMC, KMC_rational, KMC.changeLattice; §5.4 (1701) states only the ordinary Skinner–Urban, Fouquet–Wan (p∤N) and BCS converses, so §3.2 here (every p, hypothesis KMC_rational) is not a restatement.
- **ModularIwasawaMainConjecturesPartII** (board design, `packages/ModularIwasawaMainConjecturesPartII/design/README.md`): CZ.4 rational-equivariant-main-conjecture (line 152), CZ.5 cm-contained-descent (173) and cm-h2-torsion (175), CZ.6 cm-kato-main-conjecture (195) and cm-kato-normalization-dictionary (197, "exported to CMRankZeroConverse").
- **ArithmeticStatisticsPartI** (#1171): §0.1 (183; "Piecewise rescaling of a height" 379), §0.2 (459), §0.5 (1031; height 1035; Northcott 1099), §0.6 (1181), §0.7 (1299), §0.15 (1919; "Positive squareclass denominator" 1951).
- **ArithmeticStatisticsPartVII** (#1178): §5.9 (982; target at 1170), §5.10 (1288), §5.11 (1522; corank-zero target at 1556).
- **SelmerIwasawaCohomology** (#869): §§2.4, 2.10–2.12a, 2.19–2.20, 3.0, 3.1, 3.7, 3.10, 3.13–3.16, 4.9, 4.26, 4.29 (lines 431–2503).
- **ArithmeticGaloisDuality** (#858): R02.4.3 (3325), R02.4.4 (3394), D7.3 (4911), D7.5 (5405), D7.6 (5847), D7.7 (6051).
- **PadicHodgeRegulators** (#1498): §0.1 (403), §§1.1–1.8 (429–572; §1.4 kernel of the dual exponential is H¹_g, §1.5 the two dimension formulas).
- **AutomorphicGaloisRepresentations** (#1007): §§1.5 (1096), 3.15 (1823), 4.4–4.8 (1909–1972), 6.4 (2510), 7.2 (2919).
- **ComplexMultiplicationAndExplicitReciprocity** (#1254): §§1.1 (342; `idealLatticeCurve.endomorphismRing` 366, `idealLatticeCurve.automorphism_factors` 358), 1.2 (392), 4.1 (729), 4.2 (763; `ellipticCMLFactorization` 767 for A/K, `cmInductionComparison` 771 for A/ℚ).
- **GL2AutomorphicRepresentationsAndTransfer** (#931): R17.4.16 (2199, `quadraticInduction`). **EllipticCurveModularity** (#1018): R29.6.
- **On main:** ModularForms "Layer 7: L-functions" (line 708); EllipticCurves Layers 1 (423), 5 (1154), 7 (1262); AlgebraicCurves Layer 10 (918; point–place dictionary (iii) at 942).
- **Consumers:** RankZeroOneBSDPartII design imports `CMRankZeroConverse:C.0/p-converse-property` (its README lines 9, 281, 289, 299); RankOneConverse's design is rank-one only. No supplier cites this roadmap.

The resolver's two leads (KatoEulerSystems, ModularIwasawaMainConjecturesPartII) are board packages, not missing roadmaps. Ownership by object: `roadmaps grep` for "Burungale", "Goldfeld", "cube sum" and "descend to" finds no roadmap stating the all-prime CM rank-zero converse, the even Goldfeld half-density or the descent-coset bound; ModularIwasawaMainConjectures' Burungale citations are Burungale–Castella–Skinner (ordinary base change), GrossZagierAndArithmeticHeights' are the rank-one converse. No `Suggested.lean` of any readable roadmap declares a fully qualified name of this file.

### Sources: the seeded sample

Every sampled target was read at its locator; theorem numbers, pages and hypotheses support the statements as written.

| Target | Locators read |
| --- | --- |
| 0.2 | BT line 235 (sign); Kato Theorem 12.5(1) lines 4053–4071, p. 221 |
| 0.4 | BT lines 240–244; Kato §14.13 lines 4850–4870, p. 242 |
| 1.1 | Kato Proposition 14.11 lines 4814–4819, p. 241 |
| 1.2 | BT lines 231–234; Kato (14.9.1)–(14.9.4) lines 4745–4782, Proposition 14.12 lines 4832–4849, pp. 239–242 |
| 1.3 | BT lines 238–239; Kato (14.9.5) lines 4785–4787, p. 240 |
| 2.3 | BT Theorem 2.6 lines 208–218 (p. 5), lines 240–244 (p. 6) |
| 3.3 | BT Theorem 3.1 lines 224–228, Remark 3.2 line 251; Kato 15.14 line 5731, Proposition 15.17 lines 5762–5772, pp. 264–265 |
| 4.1 | BT lines 253–259 |
| 4.3, 4.4 | BT lines 260–261 |
| 5.3 | BT lines 12–13, 50–52, 97 |
| 5.4 | BT lines 47–52; ASPartI line 379 |
| 6.1 | BT lines 58–60, 273–276; BKLOS lines 80–98 (height, p. 2), 196–198 (Theorem 2.7, p. 5), 654–661 (§9.2, p. 14), 831–880 (Theorem 11.2 and the proof of Theorem 2.7, pp. 18–19) |
| 6.4, 6.6 | BT Remark 3.6 lines 277–282, p. 7 |

Also read: Kato §8.2 line 2490–2495 (H^q(R,·) means j_* cohomology), §14.8 lines 4721–4731, Conjecture 12.10 lines 4165–4168 (pdf page 109, printed p. 224, so "pp. 223–224" is right). The manifest flags no locator as unverified; all three entries are `certified`; no source was fetched and no manifest entry added.

## Not verifiable

- **Kato OCR.** Lines 4062–4068 (the period map and L-value in Theorem 12.5(1)) and 4865 (σ_c ↦ c^r in §14.13) are garbled; the sign and the central-prime convention were fixed from BT lines 235 and 240 and from KatoEulerSystems §5.3, which agree with each other.
- **BT published numbering.** The Annals version was not opened; the package cites arXiv v2 consistently.
- **Ownership against open pull requests** was checked only against the heads the brief exposes through `roadmaps grep`/`show` and the board packages index.

## Source issues

- **Gap** in BT at proof of Theorem 3.1, display (3.1), p. 6: the source says Selmer vanishing for V(f)(k/2) gives H²(ℤ[1/p],T(k/2))⊗ℚ=0 directly from (14.9.3); it should first derive the vanishing of the dual Selmer group of V(f*)(k/2), which is what (14.9.3) for T(k/2) needs when f*≠f; affects the proof.
- **Misprint** in BT at proof of Theorem 1.1, p. 6: the source says the Pontryagin dual of the p∞-Selmer group over K, tensored with K, is the sum of the Selmer groups of V(f) and V(f̄); it should tensor with a p-adic coefficient field and use the central twists V(f)(1), V(f̄)(1); affects the proof.
- **Gap** in BT at Theorem 3.5, p. 7: the source says BKLOS Theorem 2.7 gives 3∞-Selmer corank zero for at least half of the twists; that theorem states Mordell–Weil rank zero (BKLOS line 196–198), and the Selmer form needs the even-3-Selmer argument of BKLOS §9.2 with the isogeny passage of §11; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "15f8fb246e794b62f9499ab75cb62584e4c62eaa", "job": "REV-PKG-CMRankZeroConverse~4", "model": "fable", "worker": "chris-i"} -->
