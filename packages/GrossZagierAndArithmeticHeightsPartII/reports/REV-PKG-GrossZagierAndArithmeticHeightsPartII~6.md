<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13085#issuecomment-6895919314 -->
Review (claude) of 0567b42

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) The Siegel–Weil constant is inverted: c_K = (−1)^n/vol(K), not (−1)^n·vol(K)

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:1759 (§13.4) “the constant is c_K = (−1)^n·vol(K), independent of T and φ”; :1764 (Check) “For n = 1 the constant is −vol(K) and for n = 2 it is +vol(K)”; :1771 (§13.5) “with c_K = (−1)^n·vol(K)”. §§13.7, 13.8 and 13.10 use the same c_K.

   **Claim:** The constant of the arithmetic Siegel–Weil identities is the product (−1)^n·vol(K).

   **Witness:** Take K′ ⊂ K of index m ≥ 2 and a K-invariant φ. The level map is finite étale of degree m, so Int_T at level K′ is m times Int_T at level K, while E′_T(z, φ) does not depend on the level. Hence c_(K′) = m·c_K. But vol(K′) = vol(K)/m, so the stated product gives c_(K′) = c_K/m. For Int_T ≠ 0 (the rank-one value 1 of §0.9 uniformized by §10.3) the two differ by m².

   The source constant is the quotient. The cached extraction of LZ drops fraction bars: LZ line 3636 reads “(−1)nvol(K)” exactly as LZ line 3628 reads “1[E :F0]” for 1/[E:F₀] and LZ line 3810 reads “12∫” for ½∫. The same quotient is at LZ lines 198, 3737, 3818, 3861 and K line 4167.

   **Exact repair:** In §13.4 and §13.5 write c_K = (−1)^n/vol(K). Replace the second Check of §13.4 by: “For n = 1 the constant is −1/vol(K) and for n = 2 it is +1/vol(K). The constant is inversely proportional to the volume: for K′ ⊂ K of index m and K-invariant φ, the degree on M_(K′) is m times the degree on M_K, the Eisenstein derivative is unchanged, and (−1)^n/vol(K′) = m·(−1)^n/vol(K); the product (−1)^n·vol(K) would divide by m instead.” Tested on the witness: 1/vol(K′) = m/vol(K), so c_(K′) = m·c_K as the degrees require. No other formula of the README was found with a lost fraction bar (checked: §3.1, §4.6, §10.4 division by [E:F₀], §13.6 one half, §13.9 volume ratio and c₀ = −1/(q+1)).

2. **F02** (P2) The §3.5 route asserts supports on V that no target supplies

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:550 (§3.5) “show by §§2.5, 2.7 and 3.4 that Φ_L♭ is Schwartz, supported in {val h(x,x) > 0} with Fourier transform supported in {val h(x,x) ≥ 0}, and conclude Φ_L♭ = 0 by the hermitian uncertainty principle”; the same claim in the Layer 3 introduction at :490.

   **Claim:** §§2.5, 2.7 and 3.4 give the two support conditions of the uncertainty principle for Φ_L♭ on the whole space V_n.

   **Witness:** §3.4 (README:538) itself says the Fourier vanishing of ∂Den_(L♭,V) “is asserted only for normal vectors of negative valuation, not for every vector of negative norm”. With Φ = 1_L♭ ⊗ φ⊥ one has Φ̂ = vol(L♭)·1_(L♭^∨) ⊗ φ̂⊥, and L♭^∨ contains ϖ^(−a₁)e₁ of valuation −a₁ < 0, so Φ̂ is supported in {val ≥ 0} only if φ̂⊥ is already zero. LZ lines 2519–2523 (p. 57) say that this stronger Fourier statement for ∂Den_(L♭,V) was not proved directly and that only a weaker argument on the normal line is used (LZ lines 2584–2598, pp. 58–59).

   **Exact repair:** Replace the last clause of the route by the normal-line argument: “… using the identity in smaller valuation, which confines the support of Φ_L♭ to M = L♭ ⊥ ⟨u⟩ (the comparison of fundamental invariants, LZ Lemma 8.2.2, p. 58); Φ_L♭ is L♭-invariant, so Φ_L♭ = 1_L♭ ⊗ φ⊥ with φ⊥ a Schwartz function on the normal line W = (L♭ ⊗ F)^⊥ supported on ⟨u⟩, and Φ̂_L♭ = vol(L♭)·1_(L♭^∨) ⊗ φ̂⊥. By §2.5 and §3.4, φ̂⊥ vanishes at every w ∈ W of negative valuation. Since φ̂⊥ is invariant under translation by the dual line ⟨u^∨⟩ and val(u^∨) < 0, every w of valuation ≥ 0 has w + u^∨ of negative valuation, so φ̂⊥ = 0 and Φ_L♭ = 0. Equivalently, the hermitian uncertainty principle applies to φ⊥ on the rank-one space W, where supp φ⊥ ⊂ {val > 0} and supp φ̂⊥ ⊂ {val ≥ 0}; it is not applied to Φ_L♭ on V_n.” Change the Layer 3 introduction to “using the hermitian uncertainty principle on the normal line”. Add the Check: “On V_n the transform of 1_L♭ ⊗ φ⊥ is supported on L♭^∨ ⊗ supp φ̂⊥, and L♭^∨ contains vectors of negative valuation whenever L♭ is not self-dual, so the support condition {val ≥ 0} is available only on the normal line.” Tested on the witness: on W the two supports are {val ≥ val(u) > 0} and {val ≥ 0}, both supplied by the confinement to M and by §3.4.

3. **F03** (P3) Two *Needs* lines disagree with their routes

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:1847–1855 (§13.10) “the local identity of that place — §3.5, §4.5 with the Li–Rapoport–Zhang model of §4.2, §6.8 or §8.7” with “*Needs:* §§4.5, 8.7, 10.4, 13.7, 13.9”; :1140 (§8.7) “*Needs:* … MetaplecticAutomorphicForms §3.3a `weil_hermitianUncertainty`”.

   **Claim:** Each *Needs* line lists what the statement and route use.

   **Witness:** §13.10: the admissibility conditions of §13.3 (README:1740) admit self-dual and almost self-dual inert places and unimodular (Krämer) ramified places; no exotic place is admissible and §13.9 defines no exotic correction, so §6.8 cannot be the identity at the Diff place; conversely the self-dual inert coefficient (first Check: “the unramified one of §13.5”) is used but §13.5 is not in *Needs*. §8.7: its route (README:1132) ends by constancy on W_(≥0) ∖ {0} and vanishing on W_(≤0); K lines 3981–4001 (Theorem 9.7, pp. 75–76) contain no uncertainty principle (the word does not occur in K).

   **Exact repair:** In §13.10 delete “§6.8” from the route and write “*Needs:* §§4.2, 4.5, 8.7, 10.4, 13.3, 13.5, 13.7, 13.9”. In §8.7 delete “MetaplecticAutomorphicForms §3.3a `weil_hermitianUncertainty`” from *Needs*, and “MetaplecticAutomorphicForms §3.3a” from the Layer 8 Dependencies (README:1148). The uncertainty principle stays in §§3.5 and 6.8, where LZ and LL2 (LL2 line 1892) use it.

4. **F04** (P3) “Neither pin has formal schemes” overlooks the affine formal spectrum of Tau Ceti

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:42 “Neither pin has formal schemes, Rapoport–Zink spaces, supported K-theory of formal schemes …”; packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean:28 “neither pinned library has formal schemes”.

   **Claim:** The pinned libraries contain nothing of formal schemes.

   **Witness:** Pinned Tau Ceti: `TauCeti.FormalScheme.Spf.carrier` (TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:73) and `TauCeti.FormalScheme.Spf.structureSheaf` (…/Spf/StructureSheaf.lean:262) construct Spf A for an adic ring. There is no type of (locally noetherian) formal schemes, no morphisms, no coherent sheaves on them.

   **Exact repair:** README:42: “The pinned Tau Ceti has the affine formal spectrum of an adic ring (`TauCeti.FormalScheme.Spf.carrier`, `TauCeti.FormalScheme.Spf.structureSheaf`) but no category of locally noetherian formal schemes, no coherent sheaves or supported K-theory on them and no Rapoport–Zink spaces; neither pin has hermitian local densities, …”. Suggested.lean:28: “the pinned Tau Ceti has only the affine formal spectrum `Spf A`, not locally noetherian formal schemes, their coherent sheaves or moduli of p-divisible groups over them”. The not-statable conclusion is unchanged: Spf O_F̆ alone carries no Rapoport–Zink space.

5. **F05** (P3) Three locator slips

   **Location and witness:**

   - README:550 (§3.5) “Theorem 8.2.1 and proof, pp. 58–60”: the theorem is LZ line 2531 (p. 58) and its proof ends at LZ line 2598, the last line of p. 59.
   - README:1296 (§10.1) “LZ §§11.1–11.4, pp. 72–77”: §11.1 begins at LZ line 3191 on p. 73 (p. 72 is the title page of Part 3; LZ contents line 29).
   - README:306 (§1.1) “Lemma B.2(ii) of Zhang's appendix”: no source key and no page; it is Z Appendix B, Lemma B.2(ii), Z line 4330, p. 77.

   **Exact repair:** write “pp. 58–59”, “pp. 73–77” and “(Z Appendix B, Lemma B.2(ii), p. 77)”.

Five findings: two blocking (one P1, one P2) and three P3. The seven findings of the previous round are all repaired. The new findings are in text no repair touched; two of them (R01, R02) are in this round's seeded targets §13.4 and §3.5.

## Verified sound

### The seven findings of the previous round

| Previous finding | Repaired passage (README) | Status and what I computed |
|---|---|---|
| F01 noetherianity needs nondegenerate span | §0.7, :256 “noetherian when L has rank n, and when L has rank n−1 and its rational span L ⊗ F is nondegenerate” | Repaired. Λ_j has h(ϖ^(−j)e, ϖ^(j+1)f) = ϖ, h(a,a) = ϖ: Gram = ϖ·(H ⊥ ⟨1⟩), Λ_j^∨ = ϖ⁻¹Λ_j, type 3, L ⊂ Λ_j for all j; det Gram(L) = 0. LZ line 557 uses the finiteness, LZ line 320 the standing assumption. |
| F02 conjugate self-reciprocal | §11.1, :1380 “α(T) = ᾱ(0)⁻¹·Tⁿ·ᾱ(T⁻¹)”; §11.3, :1412 | Repaired. α = T − i: ᾱ(0) = i, i⁻¹·T·(T⁻¹ + i) = T − i; ordinary reciprocal T + i; α(0)ᾱ(0) = (−i)(i) = 1. Z line 2022 (Lemma 7.13, p. 36), Z line 2035 (Remark 7.14). |
| F03 converse fails for GL₀ | §9.3, :1199 “When the acting rank m = n−1 is at least 1, the converse holds” | Repaired. n = 1: Orb ≡ 1, ∂Orb = 0, one-point orbit. m ≥ 1: a = diag(ϖ,1,…), log\|det a\| = −log q ≠ 0. |
| F04 empty divisor in §5.3 | §5.3, :716 “nonzero exactly when N(x) ≠ ∅”; §5.2, :704 | Repaired. x = u⁻¹e: h(x,x) = −u⁻², F₀-valuation −1, N(x) = ∅, both classes 0. |
| F05 q = 3 does not fix the field | §9.8, :1278 “exactly when p = 3, the residue degree of F₀ over ℚ₃ is one and n = 3” | Repaired. ℚ₃(√3): e = 2, f = 1, q = 3. |
| F06 rational orthogonal branch | §12.6a(e)–(f), :1589–1593 | Repaired (by explicit subtargets). Weights: p = 3 gives input −1/2, output 5/2; central factors exp(πi(k − σ/2)) = exp(0) = 1 for (Λ,−Q) at k = 1 − p/2 and exp(2πi) = 1 for Λ at k = 1 + p/2; relation Σ_(m>0) Z′ = c(0,0)·c₁(L) against Z′(0, c(0)) = −c(0,0)·c₁(L) sums to 0. *Needs* no longer cites §12.5. |
| F07 rational GSpin compactness | §12.6a route, :1593 “compact exactly when U is anisotropic over ℚ” with the Check at :1601 | Repaired. x² = 3(y² + z²) forces 3 \| x, y, z; x² + y² = 3(z² + w²) likewise; (1,1,0), (1,0,1,0) and (1,1,1,1,0) are zeros of the three isotropic forms (1 − 1 = 0, 1 − 1 = 0, 3 − 3 = 0). |

Adversarial pass on the repaired passages: recorded in the table below (rows §0.7, §9.3, §11.1, §12.6a). The repaired patterns were searched in the rest of the package: “reciprocal” (only §§11.1, 11.3), “exactly when Orb”, “nonzero class”, “only for F₀”, “not compact”: no further occurrence.

### Seeded source sample (15 targets, all opened)

| Target | Passage opened | Result |
|---|---|---|
| 0.6 | LZ lines 434–445, Definitions 2.4.1–2.4.2, p. 11; line 537, Corollary 2.8.2, p. 14 | Agrees: class of the derived tensor product in Gr^r, Int = χ for rank n. |
| 1.1 | LZ lines 546–565, §2.9, p. 14; lines 944–983, §§5.1–5.2, pp. 23–24 | Agrees: horizontal part cut out by torsion sections; the vertical class is canonical in Gr^(n−1). Locator of Lemma B.2(ii): R05. |
| 3.5 | LZ line 673, Theorem 3.4.1, p. 17; lines 2497–2598, §§8.1–8.2, pp. 57–59 | Statement agrees. Route: R02; page range: R05. |
| 6.9 | LL2 lines 2176–2202, Corollaries 2.65–2.66, p. 43; line 1898 (F/ℚ_p unramified) | Agrees: isomorphism of spaces, isometry of Hom spaces, N_Φ(x) = N(x^rel). |
| 7.1 | K lines 431–447, Definitions 2.1–2.2, p. 10; lines 497–535, Definitions 2.3–2.4 and Lemma 2.5, pp. 12–13 | Agrees: filtration of rank n−1 (K line 443), Exc_Λ ≅ ℙ^(n−1) Cartier and pairwise disjoint. |
| 7.7 | K lines 606–620, Proposition 2.12, p. 15 | Agrees, including δ_odd(r) for the complementary rank; (2.14) gives (−1)^r for ℓ = 1. |
| 10.1 | LL1 lines 1236–1248, Definition 5.3 and Lemma 5.4, pp. 26–27; line 1402, Definition 6.5, p. 30; Z lines 1782–1794, p. 31; LZ §13.2–13.3, p. 81; §§14.3, 14.5, pp. 85–86 | Agrees: quasi-homomorphisms with Tate label, finite unramified forgetful map. One page slip: R05. |
| 11.3 | Z lines 1952–2045, Lemmas 7.10–7.15, pp. 34–36 | Agrees, with conjugate self-reciprocity and coefficients in O_F[1/d]. |
| 11.4 | Z lines 2047–2062, §7.6, pp. 36–37; line 2385, §9.1, p. 43 | Agrees: the class lies in F₁K′₀ of CM(α, g). |
| 12.1 | Z lines 2179–2200, §8.1, (8.1)–(8.2), Theorem 8.1, p. 39 | Agrees: constant term −φ(0)·c₁(ω), weight-n Whittaker factors. |
| 12.2 | Z lines 2223–2259, §8.2 and Proposition 8.2, p. 40; lines 2579–2598, Theorem 10.1, pp. 46–47 | Agrees: unique fixed negative line, no rational nonzero u orthogonal to it. |
| 12.6b | Liu11a lines 1142–1186, Proposition 3.2, Remark 3.3, Corollary 3.4, pp. 873–874; line 1195, Theorem 3.5; lines 1304–1324, Lemma 3.6 and (3-7), pp. 876–877 | Agrees: the index set K∖K′x, the lift through simple connectedness, the componentwise argument. |
| 13.4 | LZ lines 3633–3649, Theorem 13.6.1, pp. 83–84; lines 3815–3826, Theorem 15.3.1, p. 88 | Constant inverted in the README: R01. |
| 13.8 | LZ lines 3857–3873, Theorem 15.5.1 and Remarks 15.5.2–15.5.3, p. 89 | Hypotheses agree (unramified at all finite places, split above 2, inert-admissible, nonsingular at two split places). Constant: R01. |
| 13.10 | K lines 4161–4185, Theorems 10.1–10.2, pp. 79–80; lines 212–234, (1.7)–(1.10), pp. 5–6 | Hypotheses agree (v nonsplit and not above 2; split dyadic places for the total formula). Route and *Needs*: R03. |

No locator was flagged by the author as unverified.

### Adversarial table (sampled targets, headlines, repaired passages, findings)

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §0.6 Euler convention | C ≅ ℙ¹ in D, O(D)\|_C = O(−1) | χ(O_C) − χ(O_C(1)) = 1 − 2 = −1 = deg O(D)\|_C; stalk lengths infinite | Retain |
| §0.7 (F01) | V₃ = H ⊥ ⟨ϖ⟩, L = ⟨e, a⟩; L = ⟨e⟩ in n = 2 | det Gram = 0, infinitely many type-3 Λ_j ⊃ L; unit line: Z ≅ N₁ flat | Repair holds |
| §0.9 / §3.5 headline | a = 1, 3, −1, −3 | −D′(1) = 1, 2, 0, 0 for D = 1−X, 1−X+X²−X³, 0, 0; Int = 1, 2, 0, 0; (a+1)/2 at −3 would be −1 | Retain |
| §1.1 | n = 2, unit y | Z(y) ≅ N₁ flat, vertical class 0 | Retain |
| §1.3 degree | val 2 line in n = 2, any q | q² + q (Z₂) + 1 (Z₀) = q² + q + 1; D(−q) = (1+q) + q² ; vol⁻¹·D(−1/q) = q²(1 + 1/q + 1/q²) | Agree |
| §2.1 eigenvalues | d = 1 | #Y°₁(F_(q²)) = q² − (q³·1 + (q²−q)(−q)) = 0; Fermat count 1 + q² + q(q²−q) = q³ + 1 | Agree |
| §2.4 Fourier | x ∈ Λ; isotropic and anisotropic residues | f̂ = −(1+q)/q + (q³+1)/q = q² − 1 = −f; −(1+q)/q + 1/q = −1; −(1+q)/q + (q+1)/q = 0 | Eigenvalue −1 |
| §3.1 | n = 1, val 1, q = 3 | W′ = 1·(1 + 1/3)·log 9 = (8/3)·log 3 | Agree |
| §3.5 route (R02) | Φ = 1_L♭ ⊗ φ⊥, L♭ with a₁ ≥ 1 | Φ̂ supported on L♭^∨ ⊗ supp φ̂⊥; ϖ^(−a₁)e₁ ∈ L♭^∨ has valuation −a₁ < 0 | Support on V not available: move to the normal line |
| §4.3 / §4.5 headline | rank one, a = 0, 2 | D_Λ = (1−X)(1+qX) + X²(1−X), −D′(1) = (1+q) + 1 = q + 2; (q+1)·1 = (q+2) − 1; a = 0: 0 = 1 − 1 | Retain |
| §5.5 / §6.8 headline | invariants (1,1), (1,3), (3,3) | Int = 2, 4, 2(q+3); overlattices of (3,3): uM, M and q+1 between, none outside M (reduced form anisotropic): 2·(q+3) | Agree |
| §6.5 | Λ of type 4 | −q(1+q)/q² + (q²+1)/q = q − 1 = −(1 − q); isotropic x̄: −1; anisotropic: 0 | Eigenvalue −1 |
| §6.7 | a = 3 example | norm of u⁻¹e ± x₀: −β + β = 0; h(e, ·) = −βu; Gram of B± = u·unimodular, invariants (2,2) | Agree |
| §6.9 | unit u²/ϖ | v(u²/ϖ) = 1 − 1 = 0: no valuation shift; u⁻² shifts F₀-valuation by 1 | Agree |
| §7.1 | n = 2 | filtration rank n − 1 = 1; Exc_Λ ≅ ℙ¹ | Agree |
| §7.7 | n = 3, ℓ = 1, r = 2; I_n | 1·(δ_odd(3) − δ_odd(2)) = 1 = (−1)²; with δ_odd(ℓ): 0 (wrong); Int(I₂) = 0, Int(I₃) = 1 | Retain |
| §8.4 example | β ≡ ±1 mod π | norm of x + αℓ = (N(β) − 1)/π₀, determinant (N(β) − 1) − N(β) = −1; 2q classes | Agree |
| §8.6 | H₁, l₁ + πl₂ | norm π(ab̄ − āb) = −2π₀; coefficient −π/(−2π²) = 1/(2π) | Agree |
| §9.3 (F03) | ℚ₃: γ = swap, a = diag(3,1); γ = ((−2,1),(−3,2)); n = 1 | families 1 and 3^s, derivative 0 and log 3 = 0 − log(1/3)·1; 1 − 3^s, ∂Orb = −log 3, Int = (v(−3)+1)/2 = 1; n = 1: Orb = 1, ∂Orb = 0 | Repair holds |
| §9.8 | q = 9, γ = ((−4,1),(−15,4)) | γ² = 1, v(−15) = 1, family 1 − 9^s, ∂Orb = −log 9 | Agree |
| §10.1 | T = I₂, a = ((1,b),(0,1)), b̄ = −b | aᵗTā = ((1, −b),(b, 1 − b²)) | Agree with the stated convention |
| §11.1 / §11.3 (F02) | T − i over ℚ(i) | conjugate reciprocal T − i; ordinary T + i; char_ℚ = T² + 1 | Repair holds |
| §11.4 | arithmetic dimension n = 3 | Δ regular of codimension n − 1 = 2 in a (2n−1) = 5-dimensional product: class in F₁ | Agree with Z (7.15) |
| §12.1 | φ(0) = 0, 1 | constant term 0 and −c₁(ω)·W₀ | Retain |
| §12.2 | δ scalar; δ with distinct eigenvalues | scalar fixes every negative line; two negative eigenlines of distinct eigenvalues would be orthogonal, impossible in signature (n−1,1) | Agree |
| §12.5 metric | Q = −x² − y², w = (1, i) | [w,w] = −2 + 2 = 0, [w,w̄] = −4, ‖w‖² = 1/(πe^γ) | Agree |
| §12.6a(b) | 𝔰𝔬(3,2), 𝔰𝔬(2,2) | p = 3: x₀ ≠ 0 gives e₀ and one of e₀ ± e₁; x₀ = 0 gives both e₀ ± e₁ up to sign: ≥ 2; p = 2, x₀ = x₁: 1 | Agree |
| §12.6a(e)–(f) (F06) | p = 3, 1, 2 | weights (−1/2, 5/2); via (c): 3/2 + 1 = 5/2, 2 + 1/2 = 5/2; Ψ² of degree −c(0,0) is a section of L^(c(0,0)); Sing/Obs dual to holomorphic forms, finite-dimensional | Repair holds |
| §12.6b | n = 2, 3; quadratic base | p = 2n − 2 = 2, 4; weight p/2 + 1 = n; [x,x] = 2h(x,x) so Q = h and index ξ, not 2ξ; 𝔰𝔲(m,1), x = e₁: one noncompact positive root | Agree |
| §12.9 headline | [E:F] against [E:F₀] | ratio 2 = [F:F₀] | Retain |
| §13.4 / §13.5 / §13.8 / §13.10 headlines (R01) | K′ ⊂ K of index m | degree ×m, E′ unchanged: c_(K′) = m·c_K; (−1)^n/vol(K′) = m·(−1)^n/vol(K); (−1)^n·vol(K′) = (−1)^n·vol(K)/m | Product false; quotient correct |
| §13.9 | q = 3 | c₀ = −1/4, c₀·log 9 = −(1/2)·log 3 | Agree with K (1.9) |
| §13.10 route (R03) | exotic place | not admissible under §13.3; no correction in §13.9 | Delete §6.8 from the route |
| §14.2 | E♭ | (2∂J + Int_(K−B)) + Int_B = 2∂J + Int_K | Agree |
| §14.5 headline | n = 1, 2, 3, 4; p = n = 3 | semi-Lie dimensions 0, 1, 2, 3; first global step n = 4; q+1 = 4 residues against n+1 = 4 exclusions at p = n = 3 | Retain; the q = n step stays a stated target of §9.5(b) |

### Library, Lean and headlines

- Pins: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9 (TauCetiRoadmap content manifest). Opened: `Polynomial` (Mathlib/Algebra/Polynomial/Basic.lean:69), `Polynomial.eval` (Mathlib/Algebra/Polynomial/Eval/Defs.lean:248), `Polynomial.derivative` (Mathlib/Algebra/Polynomial/Derivative.lean:47), `IsNonarchimedeanLocalField` (Mathlib/NumberTheory/LocalField/Basic.lean:46: a valuative topology, local compactness, nontriviality; no quadratic extension, form or measure), and the Tau Ceti formal spectrum (R04).
- `lake env lean` on packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean from the content checkout: exit 0, no output, no warning. The file has `import Mathlib`, one module docstring and the empty namespace `TauCetiRoadmap.GrossZagierAndArithmeticHeightsPartII`: zero declarations. The one-tactic probe and the `#check @name` comparison therefore have no input; there is no padding, no sorry'd data, no `set_option`.
- Headline theorems (README summary and the section “Acceptance file”): §3.5, §4.5, §6.8, §8.7, §13.8, §13.10, §12.9, §14.5. Each is named in the module docstring with the missing carrier. None is statable: no Rapoport–Zink space, hermitian density, integral Shimura model, arithmetic Chow group, unitary Eisenstein series or Jacquet–Rallis orbital integral exists at the pins (searched by object in both pinned trees). No stand-in is stated.
- Backticked names: this roadmap declares none of its own. The supplier names resolve at their heads: `fourierUnitVanishing` (AutomorphicFormsOnReductiveGroups README:692), `weilIndex`, `weil_generators`, `weil_hermitianUncertainty`, `weil_hermitianNormalizations`, `siegelWeilSection`, `siegelWeil_anisotropic`, `thetaSectionCollection` (MetaplecticAutomorphicForms README:404, 522, 640, 648, 1555, 1591, 1623), `hermitianLocalDensity`, `normalizedSiegelPolynomial`, `choYamauchiWeight`, `IntegralHermitianLattice.ofCarrier`, `HermitianLatticeInvariants.ofDualQuotient` (GeometryOfNumbersAndQuadraticArithmetic README:914, 934, 945, 705, 727), `ClassicalAlgebraic.supportLocalization`, `ClassicalAlgebraic.properSupports` (EtaleCohomologyFoundations on main, also cited at ComplexComparisonPartII README:946, 962). The four resolver leads are these supplier names, not missing declarations.

### Suppliers, order, gaps, overlap

- Section citations resolved now, at the heads the tools give: all 42 cited sections of PELModuliPartII (board package README, one heading each); LubinTateFormalModulesAndQuasiCanonicalLifts §§6.1, 6.2, 6.4, 6.5, 7.1; GrossZagierAndArithmeticHeights §7.2 (README:2945); SchemeKTheoryOperationsPartII, 20 sections; ArakelovGeometryAndAbelianHeights §§1.8–1.10; EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5 and its contract jr-local-comparison (README:54); MetaplecticAutomorphicForms, 11 sections, with §3.3a stating exactly the strict/weak support pair; QSeriesPartitionsAndMockModularForms §§8.3, 8.5, 8.6, the central parity F_h = exp(πi(k − σ/2))·F_(−h) at README:1304; ShimuraVarieties §§0.5, 2.3, 2.7, 2.8, 6.2–6.4, 8.1, 8.5, 8.7. None missing.
- Dependency check, exact output: `depcheck: 245 roadmaps, 2252 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- The four declared gaps have the same slug and the same `needs` sentence in design/plan.json and in the README, each with a named earlier supplier; each asks for something its supplier's cited sections do not state (ramified densities; a nonaffine product; all-codimension star products; Zhang's S_n formulations). They are not findings.
- Overlap inventory: no other open pull request changes this roadmap, no cited id is dropped, none is defined only by an open revision. Ownership by object was searched over the open heads and main (“Kudla–Rapoport”, “arithmetic fundamental lemma”, “arithmetic Siegel–Weil”, “Borcherds product”): the other hits are suppliers citing or supplying inputs, MotivesAndAlgebraicCycles §7.19 (local identity as a premise), and ComplexMultiplicationAndExplicitReciprocityPartII §§4.2–4.5, which owns integral orthogonal special divisors and their support theorems, not the generic-fibre Kudla divisors and Chow-valued modularity of §12.6a.

Overlap check: read ComplexMultiplicationAndExplicitReciprocityPartII, MetaplecticAutomorphicForms, GrossZagierAndArithmeticHeights, EndoscopicTransferAndUnitaryTraceComparisonPartII, EndoscopicTransferAndUnitaryTraceComparison (the open list; the two other lists are empty); nothing shared.

### Shape, policy, sources

- README shape: summary, scope, conventions, supplier contracts, build paragraph, 15 layers each ending with Examples and Dependencies, 107 target subsections and 107 *Needs* lines; every “Define/Construct” target has an API list and at least three Checks. No LaTeX delimiters, pull-request numbers, machine paths, HTML anchors or process words (pattern search; the hits for “current” are Green currents). Layer titles are mathematical; no sentence says the roadmap follows a source.
- Manifest: 24 works, 22 certified and 2 uncertified (Lusztig76, McGraw03); every work in References has an entry. No source was fetched and the manifest was not changed this round.
- Wording: 16 README passages were set beside their sources (the 15 seeded targets and §13.9 against K (1.7)–(1.10)); none reproduces a sentence, the shared material being formulas and hypothesis lists. Arrangement: LZ contents (§2 cycles, §3 densities, §4 horizontal, §5 vertical, §6 geometric Fourier, §7 analytic Fourier, §8 proof, §§9–10 almost self-dual, §§11–15 global) against Layers 0–4 and 13: Layer 3 merges LZ §§3, 7, 8, Layers 1–2 split LZ §5, and Layer 13 follows eight layers drawn from other sources; the order geometry before identity is forced by the *Needs* lines of §3.5 (§§0.8–0.9, 1.4, 2.5, 2.7). No table, figure or list is taken over.

Source independence: 16 passages compared with 6 sources (LZ, Z, K, LL1, LL2, Liu11a), none shared; largest share LZ, about 49 of about 206 locators; contents compared with LZ: independent.

## Not verifiable

- Lusztig76 and McGraw03 are settled as uncertified; their statements (§§2.1, 5.4; §12.6a(f)(ii)) were not read in the originals.
- The published pagination of LZ (J. Amer. Math. Soc.) was not opened; R01 rests on the extraction's consistent loss of fraction bars and on the level-scaling computation, not on a second printed copy.
- The source corrections listed in the README section “Source corrections” other than those touching the seeded targets were not re-derived this round; the previous round's computed rows for §§8.4 and 8.6 were recomputed (table above).
- The declared supplier gaps are contracts; nothing was checked beyond their precision, ownership and minimality.

## Source issues

- none

## For the human reviewers

- **Licence.** McGraw03 (Math. Ann. 326) is cited for its main theorem without a theorem number; no legal copy was read (sources.toml, `uncertified`).
- **Licence.** YZZ09 is read from a copy on a university archive host and LL1, LL2, Zha12 from author pages (packages/GrossZagierAndArithmeticHeightsPartII/README.md, References); the manifest records them as certified.
- **Not tested.** Two targets, §8.6 and the q = n step of §9.5(b), ask for proofs that the cited sources do not contain (README:1120, 1235); the headline of §8.7 and the case p = n of §14.5 depend on them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0567b422f0801289ca05793ab09f0c6ceefb6333", "job": "REV-PKG-GrossZagierAndArithmeticHeightsPartII~6", "model": "fable", "worker": "chris-x81"} -->
