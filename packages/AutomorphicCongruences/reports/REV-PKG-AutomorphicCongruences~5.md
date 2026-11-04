<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/129#issuecomment-6402563925 -->
Review (claude) of 44e4c9e

Verdict: needs changes

1. **F01** (P2) §5.3 states Wan's Theorem 86 below its printed hypotheses (p > 5, κ0 > 2)

   **Location.** packages/AutomorphicCongruences/README.md:1725–1728, §5.3: "Let f_(κ0) be the ordinary member of the parallel Hilbert family f of even parallel weight κ0" … "Assume p≥5 unramified in F" … "(1) … (NV1) holds at every v | p; (2) … (NV2) holds at every v | p (Wan-2015 Theorem 86, p. 70)". Also §5.10:1883 "p≥5", "κ0≥2", and its Check at 1893 "a version requiring κ_0 > 2 or p > 5 would not reach elliptic curves".

   **Claim.** (NV1) and (NV2) at every v | p for the weight-κ0 member of the family, for every even κ0 (weight two included) and every p ≥ 5, by Wan-2015 Theorem 86.

   **Witness.** Wan-2015 line 3550: Theorem 86 begins "Assume that p > 5"; line 3542: f_(κ0) has parallel weight κ0 > 2; the same two hypotheses are printed in Theorem 3 (lines 112, 116) and Theorem 101 (lines 4411, 4415). The only prime restriction used in the printed proof is the stabilizer-order argument, which excludes p = 3 alone (lines 3563–3565). BCS line 336 states Theorem 3.2.1 (Wan) for p > 3 and a weight-two form, and BCS lines 220–222 read Wan's restriction as "p > 3 only for a comparison of … periods (Thm. 86)". So p = 5 is supported by a published reading plus the printed proof and Theorem 8's own p = 5 exclusion (Wan-2015 lines 237–239, already in gap:fujiwara-minimal), but the target's "source is" lines carry neither locator. The weight-two case of Theorem 86 is supported by nothing cited: Wan uses f_(κ0) with κ0 > 2, and BCS reach weight two through Wan's Theorem 3, whose hypothesis is only that some member of the family has even parallel weight κ0 > 2; the family through a weight-two form has such members, so the §5.10 Check's reason ("would not reach elliptic curves") is not right. (NV1)/(NV2) at the weight-two member itself rests on Hung2017 Theorem B, which is uncertified.

   **Exact repair.** (a) In §5.3 require κ0 > 2 for the member f_(κ0) at which (NV1), (NV2) and (3) are stated, as Wan does; (b) in §5.10 keep "an ordinary specialization of even parallel weight κ0 ≥ 2" but say that §5.3 is applied at a member of weight κ0 > 2 of the same family (same tame level and trivial character), which exists by the control and density statements of PadicFamilies §§5.8–5.9 (and gap:hilbert-hida-odd-degree), and rewrite the Check at 1893 accordingly ("κ0 = 2 is reached through a weight κ0 > 2 member; p = 5 is admitted because …"); (c) in the "source is" lines of §5.3 and §5.10 add "Wan-2015 prints p > 5 and κ0 > 2; the p = 5 case: BCS Theorem 3.2.1 (arXiv v2 p. 7) and §1.5 (p. 5), which uses only the stabilizer argument of the proof of Theorem 86 (p ≠ 3) and Theorem 8's p = 5 exclusion". Tested on the refuting instance: at p = 5, d = 2, the stabilizer argument gives [F(ζ_5):F] = 4 ≠ 2, so no element of order 5 exists and the pairing is perfect, while at p = 3, [F(ζ_3):F] = 2 and the argument fails; at κ0 = 2 the §5.3 statement now cites a theorem that contains its case. If instead the author wants weight two in §5.3, cite Hung2017 Theorem B by its locator for that case and state its hypotheses separately; a Wan-2015 citation cannot carry it.

2. **F02** (P3) §5.3's anticyclotomic specialization β is declared on the wrong source ring

   **Location.** packages/AutomorphicCongruences/README.md:1725, §5.3: "Let β : Λ_(M,A) → Λ⁻_(M,A) be the anticyclotomic specialization … Define the integral anticyclotomic function L^(Σ,−)_(f,M,ξ) = β(L^Σ_(f,M,ξ)) ∈ Λ⁻_(M,A)".

   **Claim.** β is a ring map on Λ_(M,A) = A[[Γ_M]] and L^(Σ,−) is its value on L^Σ_(f,M,ξ).

   **Witness.** L^Σ_(f,M,ξ) lies in I_M = I[[Γ_M]] (Wan-2015 Theorem 82(ii), line 3420), not in A[[Γ_M]]; Wan's own text has the same gloss (lines 3525–3534) and supplies the missing weight point φ_0 at line 3543. With I = A[[W]] and L^Σ = W·T, β as declared is undefined on W; after the weight specialization W ↦ w(κ0) it is w(κ0)·β(T).

   **Exact repair.** Define β on I[[Γ_M]] as the composite of the weight specialization φ_(κ0): I → A (the point of f_(κ0)) with the ring map A[[Γ_M]] → A[[Γ⁻_M]] that sends the cyclotomic variable to the point of the central critical value; keep the Frac(A) extension. State that the integral function needs the Gorenstein instance of §5.2 (Theorem 82(ii)), as Wan's Definition 85 says ("when we have the Gorenstein property", line 3538).

3. **F03** (P3) §2.16 cites KLZ17 by journal pages while the manifest text is arXiv v6

   **Location.** packages/AutomorphicCongruences/README.md:1057, §2.16: "KLZ17, Theorem 10.2.2, p.94, with the congruence-ideal target of Notation 7.7.1, p.71"; also §2.15:1024 "Definition 8.1.1, p.72, and Proposition 8.1.7, p.75".

   **Claim.** Page locators into KLZ17.

   **Witness.** sources.toml records KLZ17 as arXiv:1503.02888v6 (version_note "arXiv v6", 67 pages). In that text Theorem 10.2.2 is at KLZ17 line 3096, on page 52 (marker at line 3074), and Notation 7.7.1 at line 2340, on page 39 (marker at line 2316); pages 94 and 71 are the Cambridge J. Math. pagination, which the References entry does not name as the one used.

   **Exact repair.** Either cite the arXiv v6 pages (Theorem 10.2.2 p. 52; Notation 7.7.1 p. 39; and the §2.15 pages recomputed from the same text) or add to the KLZ17 References bullet "page locators use the journal pagination (1–122)" and to sources.toml a `version_note` saying so. The theorem numbers agree between the two versions and need no change.

4. **F04** (P3) §2.19 cites a Loeffler–Zerbes paper that the manifest and References lacked

   **Location.** packages/AutomorphicCongruences/README.md:1103 and 1116, §2.19: "after Loeffler–Zerbes, Iwasawa theory and p-adic L-functions over ℤ_p²-extensions, §3.2, with the convention change noted by FW".

   **Claim.** A named work with a section locator is a cited source.

   **Witness.** sources.toml (39 entries at head 44e4c9e) had no entry for it and the README's References list none; the previous reviewer's fetch did not reach this branch. I fetched it through the sources service, which added the entry `LZ14` (arXiv:1108.5954v3, status certified, cited_for 2.19) to sources.toml. LZ14 line 420–432 (§3.2, Definition 3.4, pp. 10–11) is the Yager module with the inverse-basis sum x^σ[σ⁻¹] and the direct action y(x^g) = [g]y(x), so the README's "convention change noted by FW" (FW line 2602) is right.

   **Exact repair.** Cite it as "LZ14 §3.2 (Definition 3.4 and Proposition 3.6, pp. 10–11)" at both places and add the References bullet under the key LZ14 (David Loeffler and Sarah Livia Zerbes, Iwasawa theory and p-adic L-functions over ℤ_p²-extensions, Int. J. Number Theory 10 (2014); arXiv:1108.5954v3). The manifest entry is already present; do not add a second key.

5. **F05** (P3) a downstream consumer that resolves nowhere

   **Location.** packages/AutomorphicCongruences/README.md:28 and 2297: "RankOneConverse imports the ordinary Wan congruence input of §2.22".

   **Claim.** A roadmap of that name consumes §2.22.

   **Witness.** No folder TauCetiRoadmap/RankOneConverse on main (8a349f3), no open roadmap pull request with that folder (`roadmaps show 'RankOneConverse'`: "no roadmap … on main or in an open roadmap pull request"), no README on main or at any open head mentions the name, and it is not in the board index; it appears only as a bare name in the merge-order file (line 252). The other two consumers resolve (HeegnerPointEulerSystems #1423 at 0df33db; ModularIwasawaMainConjectures #1499 at ce652ac).

   **Exact repair.** Drop the RankOneConverse bullet and the clause in the scope paragraph, or replace the name by the roadmap that actually consumes §2.22 once it is readable; consumers are not suppliers, so nothing else changes.

Reviewed at head 44e4c9e (packages/AutomorphicCongruences/README.md, Suggested.lean, metadata.toml, sources.toml, design/plan.json), against Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 (the pins of lake-manifest.json, which agree with the README's stated pins), the roadmap repository's main at 8a349f3, the board index, and the open pull requests through the roadmap service. Five findings, one blocking (P2). The round-4 findings are all repaired (table below); the blocking finding is a hypothesis of a cited theorem that the round-5 rewrite of §5.3 drops, which the repair report itself flagged as a lead.

## Verified sound

### Round-4 findings, checked at head 44e4c9e

| Finding | Repaired passage (README line) | Verdict and witness |
|---|---|---|
| F01 (P2) M⁺ split in SU Prop. 13.4.1(ii) | 600: "every prime dividing M^+ split in K, every prime dividing M^- inert in K, M^- squarefree with an odd number of prime factors"; C_D = {c_D(β_i,x): 1 ≤ i ≤ h_K, x_p ∈ Q(ℤ_p)}, β_i = diag(1,q_i) | Repaired. SU lines 9442–9445 state exactly these level conditions; SU line 9439 gives C_D with i = 1,…,h_K and x ∈ G(𝔸_f) ∩ Q(ℤ_p); SU line 8127 is (11.9.3.c) β_i = (1, q_i). New level Check recomputed: −7 ≡ 4 = 2² (mod 11) split; −7 ≡ 2 (mod 3) nonsquare, inert; −7 ≡ 6 (mod 13), squares mod 13 are {1,3,4,9,10,12}, inert; −7 ≡ 22 = 14² (mod 29), split. M = 39 rejected, M = 87 accepted; gcd(39·87, 7) = 1. Same pattern: §5.10:1883 now has n = n⁺n⁻ split/inert (Wan-2015 lines 117–119); §1.5 and §1.10 already carried it. |
| F02 (P1) Yager sum and action | 1103: "u⋆f = e_(u⁻¹)f … S = {f : f^u = u⋆f} … y(x^u) = u⋆y(x)"; new 𝔽₂₇ Check at 1111 | Repaired. FW lines 2605–2607: the multiplication action is by the group-like element u⁻¹, the Galois action is on coefficients; (4.2.2) at line 2596–2599 uses the ordinary basis [σ]. Recomputed in 𝔽₃[a]/(a³−a−1): τ(a) = a³ = a+1, τ²(a) = a+2, τ³(a) = a. y(a) = (a, a+1, a+2); coefficient conjugate (a+1, a+2, a); e_(τ²)·y(a) = (a+1)e_1 + (a+2)e_τ + a e_(τ²) = (a+1, a+2, a): equal. Inverse pairing: (a, a+2, a+1), conjugate (a+1, a, a+2), e_(τ²)-translate (a+2, a+1, a): unequal. General identity: y(x^u) = Σ x^(σu) e_σ = e_(u⁻¹) Σ x^σ′ e_σ′ with σ′ = σu (abelian U). Twist invariance u(ρ(d)x) = ρ(e_u d^u)x = ρ(e_u e_(u⁻¹) d)x holds for d ∈ S. |
| F03 (P1) ℓ_f called idempotent | 1704–1708: §5.2 retitled; "ℓ_f² = η_f ℓ_f, and ℓ_f acts on the f-line by multiplication by η_f; ℓ_f is idempotent only when η_f is a unit"; ℤ₅ Check at 1717; §5.4:1760 "(not an idempotent: ℓ_f² = η_f ℓ_f)"; §5.11:1902 "congruence-line generator"; §0.8 anchor 358 | Repaired. Wan-2015 lines 3347–3350: ℓ_f is a generator of T ∩ (0 ⊕ F_R), ℓ_f = η_f 1_f. Recomputed: ℓ² = η² e = η ℓ; ℓ² = ℓ forces η = 1. In T = ℤ₅[x]/(x(x−5)) with x ↦ (0,5): x(x−5) ↦ (0·(−5), 5·0) = 0, image {(a,b): a ≡ b mod 5}, T ∩ ℚ₅(1,0) = ℤ₅(5,0), ℓ = (5,0), ℓ² = (25,0) = 5ℓ ≠ ℓ; T/5 = 𝔽₅[x]/(x²) is local, T is a complete intersection, hence Gorenstein. No "Gorenstein idempotent", "integral projector", "period/projector" or stale "#52-integral-projector" anchor remains (grep: 0 hits). |
| F04 (P2) NV1/NV2 objects and quantifiers | 1725–1740: β, L^(Σ,−), L̃^(Σ,−), the v-restriction, (NV1), (NV2) at v, targets (1)–(3), new Checks; §5.9:1866–1868 cites §5.3(2)–(3) | Repaired, with R01 and R02 on the new text. Wan-2015 lines 3525–3541: β, the extension to F_A ⊗ Λ, the v-restriction γ⁻_(v′,i) = 1 for v′ ≠ v, (NV1) "not identically 0", (NV2) "not divisible by ϖ_A in A[[Γ⁻_v]]"; lines 3550–3558: (1)–(2) give (NV1) for every v | p, with Theorem 8 (NV2) for every v | p; lines 3584–3592: Lemma 87's inequality against the nonsplit removed Euler factors. Recomputed Check: X restricts to 0 at v₂; X+Y restricts to Y and X; ϖ(X+Y) to ϖY, ϖX (valuation 1). Level test: d = 2, n⁻ = 1 has 0 ≡ 2 (mod 2) factors; an inert n⁺ gives one inert factor, excluded by the split condition. |

### Coverage and the computed adversarial pass

The README has 92 numbered targets in nine layers; all `*Needs:*` lines were read. New computations cover every passage the round-5 repair changed or added (§§0.8, 1.7, 2.19, 5.2, 5.3, 5.4, 5.9, 5.10, 5.11), the fifteen sampled targets, and the headline theorems; for headlines outside the sample I recomputed the values of the earlier round's rows before reusing them. The table is limited to those statements; it tests hypotheses, directions, normalizations and definitions, not the unknown automorphic Selmer groups.

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §0.2(i) Euler factor of a removed unramified place | Rank-one T, ℓ = 11, p = 5, frob eigenvalue α = 1; α = 2 | Element 1 − ℓ⁻¹αγ at augmentation: 1 − 1/11 = 10/11, v₅ = 1 (non-unit of ℤ₅[[T]]); 1 − 2/11 = 9/11, v₅ = 0 (unit) | Containment Ch^Σ ⊇ Ch^(Σ∖S)·det can be strict exactly when the factor is a non-unit; SU lines 959–969 hypotheses (A noetherian normal, v ∤ p, T unramified at v) retained. No change. |
| §0.2(ii)–(iii) Σ-comparison | Σ′ = ∅ ⊂ Σ = {ℓ}; surjectivity dropped | With surjectivity the dual sequence is exact and Ch^Σ = Ch^∅·(P_ℓ); without it only ⊇, and SU line 1016 derives surjectivity from Prop. 3.2.8 plus GV00 | Hypotheses of SU Prop. 3.2.18 (lines 1004–1008) all present in the README's hypothesis paragraph. No change. |
| §0.7 length bounds | N = R/ϖ², N′ = ϖN; ord_P J = 2 with N′ = 0; ord_P Ch(ψν) = 1 with ord_P J = 1 or 2 | length(N/N′) = 1 vs length(N) = 2; bound ≥ 2 not ≥ 1; Prop. 4.5.8 needs 2 > 1 (gives ≥ 1 only), fails for 1 > 1 | Matches SU lines 2282–2299 (Prop. 4.5.6(i)–(ii), Cor. 4.5.7, Prop. 4.5.8); Wan-2015 line 4343 (Prop. 98) is the n = 2 totally real case (its printed ">" is the extraction of "⩾", as in Lemma 99 line 4350–4352). No change. |
| §1.7(ii) level | K = ℚ(√−7), p = 11, M⁻ = 3, M⁺ ∈ {13, 29} | Legendre symbols as in the F01 row; 13 inert, 29 split | 39 rejected, 87 accepted; (i) carries no level condition (SU line 9440). No change. |
| §2.2 weight cone | (t⁺,t⁻) = (0,4), (0,3), (−2,2), (−2,6) | 0 ≥ −4+4 = 0 ✓; 0 ≥ 1 ✗; −2 ≥ 2 ✗; −2 ≥ −2 ✓ | Cone 0 ≥ t⁺ ≥ −t⁻+4 as CLW line 969; cusp surjectivity needs t⁻ ≥ A(t⁺) = −t⁺+4+2t_E(p−1)(max l_j +1) (CLW line 1424), strictly stronger when t_E ≥ 1. No change. |
| §2.4 raw versus normalized triple product | Unramified prime 2, Satake parameters (i,−i) for all three, pairings 1 | ζ₂(2) = 4/3; L₂(1/2,Π,r) = ((1+1/2)⁴)⁻¹ = 16/81 (eight products ±i, four each); L₂(1,Ad) = (8/9)³ = 512/729 with Ad parameters {−1,1,−1}; J₂ = (16/9)(16/81)/(512/729) = 1/2; omitted Euler factor = 2 | Both sides unchanged under enlarging Σ; mixed convention would change the right side by 32/9 or 2. CLW line 5758–5777 ((7.11.9)) prints partial ζ, L outside Σ ∪ {∞,p,ℓ,ℓ′} with raw integrals over local pairings. No change. |
| §2.4 pairings | Global pairings (1,0,1), (1,2,1); one local pairing 0 | Products 0 and 2; normalized quotient undefined when a denominator is 0 | Cleared identity is primary. No change. |
| §2.5 sign of the final line | m = ord_P(L·L) = 2 | Proof gives E ⊂ P² locally, hence ord_P E ≥ 2; printed "ord_P(E) ≤ m" (CLW line 6212) would allow 1 | Theorem statement (line 6147) correct; proof's last sign a misprint, as the README says. Addendum line 351–364 (Thm 5.0.1) re-proves it with a family chosen per P. No change. |
| §2.16 congruence-ideal target | I_f = Λ; I_f = ϖ⁻¹Λ | Image tw(L_p(f,g)) may carry ϖ⁻¹ in the second case; dropping I_f would assert a lattice off by ϖ | CW lines 656–662: targets I_f ⊗ I[[Γ_K]] and I_g ⊗̂ I[[Γ_K]], pseudo-null cokernel, images the two Rankin–Selberg functions; KLZ17 line 3096–3107 is the reciprocity law with the factor c² − c^(−(k+k′−2j))ε_f(c)⁻¹ε_g(c)⁻¹ that the README tells the implementer to track. Which of loc_p, loc_p̄ feeds Col^((1)) cannot be read from the extraction (overlines lost). No change. |
| §3.5 essential vectors | Unramified principal series of GL₂(ℚ_ℓ), m = 0, 1 | K₁(ℓ^m)-invariants have rank m+1: 1, 2 | Rank one only at the conductor exponent, so FW Prop. 6.9 (line 4597–4615) is applied at the common conductor under unchanged monodromy (line 4544–4546). NAK-v2 line 1034 (Cor. 2.5) gives the BM factor π^m_(Σ0); line 854 (Thm 2.2) the contragredient π̃^m_(Σ0); line 2831 ((47)) prints π̃ again (source issue below); the README tracks the factor by its intrinsic property. No change. |
| §4.2 étale point | α ∈ Λ local, x_Iw(α) a unit; α = X₁ with x(X₁) = 0 | Unit image ⇒ α ∉ m_Λ ⇒ unit; nonunit X₁ maps to 0, consistent | FW line 4198–4230 (Prop. 5.7): hypotheses (étale at x, every ψ above x satisfies Conj. 3.24) retained. No change. |
| §4.5 scalar exclusion | k = 2, p odd; Γ₀ with −I | 2a ≡ k−1 = 1 (mod p−1) impossible since p−1 even; (−1)^k = 1 forces k even | FW line 4016–4028 (Thm 5.1, p ≥ 3, ℓ ∥ N) and 4031–4033 (automatic exclusion); Thm 1.7 (line 321–331) is the µ-nontrivial form. No change. |
| §5.2 generator | T = ℤ₅[x]/(x(x−5)) | ℓ = (5,0), η = 5, ℓ² = (25,0) = 5ℓ; e² = e only in ℚ₅² | Wan-2015 line 3349. No change. |
| §5.3 (NV1)/(NV2) per place | X, X+Y, ϖ(X+Y) ∈ A[[X,Y]] | Restrictions (0, X); (Y, X); (ϖY, ϖX) | Separates global-nonzero, (NV1) and (NV2). R01 (hypotheses p > 5, κ0 > 2 of Wan line 3542, 3550) and R02 (domain of β). |
| §5.3 stabilizer argument | p = 5 and p = 3, d = 2, p unramified in F | [F(ζ_p):F] = p−1 = 4 or 2; an order-p element needs a quadratic F(γ) ⊃ ζ_p, so only p = 3 | Wan line 3563–3565: p = 5 admitted by the printed proof, p = 3 excluded. Feeds R01's repair. |
| §5.4 normalization | Raw coefficient 2, scalar 3; β = diag(1,0), diag(1,1) | Coefficient of G_D = 6 (not 18 or 2); det = 0 gives divisibility, det = 1 none | Wan line 2392 prints G_D = W′(f)⁻¹L_D^(2)|µ(x)|_F^(−κ)E_D exactly as the API bullet; Thm 88 (line 3597–3611) gives c_D(β,x) ∈ Λ_D and the det β = 0 divisibility; Thm 27 (line 890–893) the boundary sequence. No change. |
| §5.9 pulled-back primes | Σ with no nonsplit prime away from p; X^Σ non-torsion | RHS of Lemma 87 is ord_P(1) = 0 so ord_P L^Σ = 0; char := 0 gives 0 ⊆ (L^Σ) | Wan line 3584–3592 and 4430–4432. No change. |
| §5.10 hypotheses | p = 5, κ0 = 2; n⁻ = 1 with d = 2 and inert n⁺ | Wan prints p > 5 (line 112, 4411) and κ0 > 2 (line 116, 4415); BCS line 336 states p > 3, weight two; parity 0 ≡ 2 (mod 2) but inert part has one factor | Level repaired (F01 pattern); boundary cases need the BCS locator and the κ0 > 2 member: R01. |
| §5.11 majorant | f with φ(f) = 0 | No cancellation; conclusion empty | Consistent with SU Cor. 3.2.9(ii) (line 903–905). No change. |
| §6.5 µ of a two-variable series | L(S,T) with ϖ ∤ L(S,0); L = T | µ(L) = 0; L = T has µ = 0 with L(S,0) = 0 | Nonzero specialization needed; µ(f²) = 2µ(f). BCS-v2 line 428–433 (Prop. 4.2.2: p > 2, (disc), (Heeg), (spl), (irr_K); Hsieh Thm B and CGS23 Prop. 1.4.5). No change. |
| §7.1 integral twists | χ² = 1; p = 5 versus p = 2 | 1/2 ∈ ℤ₅, ± projectors integral; at 2 not | BCS line 459: T_g ⊗ η_F ≅ T_(g^F) is asserted there; the README makes it a target through the pinned point equivariance. No change. |
| §7.3 direction of specialization | A = ℤ_p[[T⁺,T⁻]], X = A/(p,T⁻); X = A/(T⁺−p); X = A/(T⁻) | π⁺(Ch) = Λ_ℚ versus Ch(X/I⁻X) = (p); (T⁺−p) both sides; (0) both sides | Only π⁺(char X) ⊇ char(X/I⁻X), as SU line 916–920 (Prop. 3.2.11, UFD) and Cor. 3.2.9(ii). No change. |
| §§1.10–1.11 SU headlines | Ch = (π³), L = π²; 11a1 at p = 7 and p = 5 | 3 ≥ 2 gives (π³) ⊆ (π²); a₇(11a1) = −2, v₁₁(Δ) = 5; 11a1 has rational 5-torsion | Earlier rows recomputed and reused. No change. |
| §§2.7–2.8 CLW headlines | O[[S,T]] localized over O[[S]]; p = 3, tame conductor 7 | S and p invert, T does not; v₃(φ(7)) = 1 puts the first conductor in case (D) of §0.9 | Reused with values. No change. |
| §§2.14, 2.20–2.22 FW/Wan headlines | Steinberg prime 11, k = 2; [A →ˣ A] with x ↦ 0; scalar −1 over 𝔽₅ | Local sign −1 not +1; H⁰ = 0 before, H⁰ = H¹ = E after; invariant dimensions 0 versus 1 | Reused with values. No change. |
| §4.3 universal family | Free coefficient extension of rank 2, scalar π | det over Λ = π², not π | Reused. No change. |
| §6.6, §§7.9–7.10 BCS headlines | µ = 0 versus µ = 1; E: y² = x³ − 4x + 7 at p = 5 | 0 ≤ length automatic, 1 ≤ 0 fails; #E(𝔽₃) = 7 (x³−x+1 has values 1,1,1 at x = 0,1,2), #E(𝔽₅) = 4 (values 2,4,2,2,0 at x = 0..4), a₅ = 2 ≠ 0 mod 5 | Recomputed and reused. No change. |

Standing-hypothesis check: the arithmetic rings are nonzero normal domains or p-adic integer rings throughout; the zero ring, equal-characteristic coefficients and p = 2 are excluded where the statements need them (§7.2 Check at p = 2; §4.5 p ≥ 3). The group rings in §2.19 are over the abelian U; no S₃/Q₈ instance applies. Natural-number subtraction does not occur in any statement.

### Seeded source verification

Every sampled target has a readable controlling text at its locator, except for the pagination caveats below. Numbering is for the versions read: SU author copy; FW v3; CLW v1 and the six-page addendum; NAK v2; BCS arXiv v2; CW v1; KLZ17 arXiv v6; Wan-2015 published.

| Target | Locator opened | Result |
|---|---|---|
| 0.2 | SU lines 959–969 (Lemma 3.2.15, Cor. 3.2.16, p. 26), 989–1003 (Lemma 3.2.17, pp. 26–27), 1004–1020 (Prop. 3.2.18, p. 27) | Statements (i)–(iii), the Euler polynomial det(1 − X frob⁻¹ | (T ⊗ F_A)^(I_ℓ)) and all hypotheses match. |
| 0.7 | SU lines 2172–2299 (Props 4.4.4–4.4.5, 4.5.4, §4.5.5, Prop. 4.5.6, Cor. 4.5.7, Prop. 4.5.8, pp. 58–61); Wan-2015 lines 4325–4345 (setup (7)–(10), Prop. 98, pp. 85–86) | Residual disjointness, polarization compatibility (4.5.5.a), A₀ noetherian normal, the three length bounds and the n = 2 totally real form match. |
| 2.2 | CLW lines 961–1001 (Thm 2.9.1, pp. 13–14), 1425 (Thm 3.0.7, p. 19), 1756–1766 (Prop. 4.4.1, p. 24), 2107–2111 (Thm 4.6.1, p. 29) | Freeness, the weight cone, the [1/p] embedding, cusp surjectivity for t⁻ ≥ A, and the fundamental exact sequence with ⊗ ℤ_p[[T_so(ℤ_p)]] match. |
| 2.4 | CLW lines 5756–5780 ((7.11.9), p. 72); CLW-addendum lines 221–240 (Thm 4.0.1, pp. 4–5) | Raw arrangement confirmed; two families with the same eigensystem and constant-term divisibility in Ô^ur[[Γ_K]] ⊗ ℚ. Ichino2008 is waived: cited by locator only. |
| 2.5 | CLW lines 6143–6214 (Thm 8.1.1 and proof, pp. 77–78); addendum lines 351–364 (Thm 5.0.1, p. 6) | Hypothesis P ∩ Ô^ur = (0), the bound ord_P(L·L) ≤ ord_P(E), and the misprinted last sign confirmed. |
| 2.16 | CW lines 656–698 (Thm 3.6 and proof, pp. 15–16); KLZ17 lines 2340–2347 (Notation 7.7.1, arXiv p. 39), 3096–3107 (Thm 10.2.2, arXiv p. 52) | Maps, targets, images and the KLZ smoothing factor match; journal page numbers: R03. |
| 3.5 | NAK lines 850–854 (Thm 2.2, p. 20), 1029–1034 (Cor. 2.5, p. 25), 2831 ((47), p. 63); FW lines 4528–4615 (Props 6.7–6.9, pp. 77–78) | Factorizations, the minimal-lift hypothesis and the rank-one invariants at the common conductor match. |
| 4.2 | FW lines 4198–4230 (Prop. 5.7 and proof, pp. 71–72) | Statement and route (αΛ, étale fibre, unit specialization) match. |
| 4.5 | FW lines 4016–4028 (Thm 5.1, p. 68), 4031–4033 (remark, p. 69), 4044–4075 (Cors 5.3–5.4, p. 69), 321–331 (Thm 1.7, p. 7) | Hypotheses 1–3, ℓ ∥ N, the automatic scalar exclusion and both corollaries match. |
| 5.4 | Wan-2015 lines 3394–3425 (Thm 82, pp. 66–67), 3597–3616 (Thm 88, Remark 89, p. 71), 890–893 (Thm 27, p. 23), 2392–2394 (G_D before Cor. 71, p. 54) | Integral coefficients, the det β = 0 ideal, the Ẽ_D version with 1_f, the boundary sequence and the normalization formula match. |
| 5.9 | Wan-2015 lines 3584–3594 (Lemma 87, p. 71), 4427–4440 (proof of Thm 101, pp. 88–89) | Pulled-back primes, the non-torsion convention and the Poitou–Tate route match. |
| 5.10 | Wan-2015 lines 112–130 (Thm 3, pp. 3–4), 4411–4426 (Thm 101, pp. 88–89); BCS lines 336–365 (Thm 3.2.1, p. 7), 220–222 (§1.5, p. 5) | Level, (Δ), residual and Theorem 8 hypotheses and the fractional-ideal conclusion match; p > 5 and κ0 > 2 are printed: R01. |
| 6.5 | BCS lines 428–433 (Prop. 4.2.2, p. 9) | Hypotheses and the two-step proof match. |
| 7.1 | BCS lines 441–469 (Lemma 5.1.1, pp. 9–10), 531–550 (proof of Thm 1.1.2, p. 10); SU §§3.1.1–3.1.5 (line 729, Lemma 3.1.5) | Four twists on their lattices and T_g ⊗ η_F ≅ T_(g^F) match; the README's "p. 12"/"p. 10" are the published pages (manifest holds arXiv v2 only). |
| 7.3 | SU lines 869–896 (Prop. 3.2.8, p. 23), 900–908 (Cor. 3.2.9, p. 24), 916–925 (Prop. 3.2.11, p. 24); BCS lines 535–543 | Control hypotheses, the divisibility direction and the UFD requirement match. |

Repair-source checks in addition: SU lines 9433–9455 and 8127; FW lines 2591–2640; Wan-2015 lines 3335–3370, 3520–3600, 232–245 (Theorem 8), 4540–4560 (the only other "p > 5" use, in the proof of Theorem 103, where it is attributed to Gorensteinness for the base change); LZ14 lines 420–446.

### Headline and Lean audit

The fourteen endpoint targets (§§1.10–1.11, 2.7–2.8, 2.14, 2.20–2.22, 4.3, 4.5, 5.10, 6.6, 7.9–7.10) are named in the module docstring of packages/AutomorphicCongruences/Suggested.lean with the carrier each lacks. At the pins there is no Selmer group over an Iwasawa tower (Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean:161 is the S-unit Selmer group; TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104 the 2-descent group), no characteristic ideal of an Iwasawa module, no p-adic L-function and no Hida family (grep for `charIdeal`, `characteristicIdeal`, `padicLFunction`, `HidaFamily`, `Yager` over both pinned sources: no declaration); `completedGroupAlgebra` (TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145) and `ContCohomology.H1` exist but do not supply the Selmer conditions. So no statable headline is absent and nothing is forced through a stand-in. The file is 44 lines: `import Mathlib` only, one module docstring, the namespace `TauCetiRoadmap.AutomorphicCongruences`, no declarations; grep for `set_option`, `lemma`, `#eval`, `#print`, `sorry`: 0 hits. The `#check @name` signature audit and the one-tactic padding probe therefore have zero instances.

`lake env lean` on packages/AutomorphicCongruences/Suggested.lean, run from the pinned content checkout: exit 0, no output, 8.7 s wall; no TauCeti module needed a build; no Lean process left running.

### Pins, ownership, gaps and supplier direction

The dependency command with the supplied order and `--movable` returned:

```text
depcheck: 56 roadmaps, 662 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

Gaps: the sixteen `What <Supplier> must provide (gap:<slug>)` contracts in the README and the sixteen `gaps` entries of design/plan.json were compared by script: same slugs, same suppliers, byte-identical `needs` sentences; every slug is used in at least one `*Needs:*` line and none is used undeclared. No gap has supplier `none`; the precision/minimality table of the previous round was reread against the current supplier sections and stands (nothing in the round-5 diff touches a gap).

Citations: the resolver's single lead, KatoEulerSystems §0.1, is a board package (#163). At its current head 0ff66a0 (the index moved since the previous round) every cited section exists: §0.1 (line 437), §§2.1–2.3 (710, 778, 821), §§4.1–4.4 (1192, 1271, 1344, 1393), §5.1 (1566), §5.3 (1653), §5.4 (1684), §6.6 (2029), §7.2 (2135), §7.4 (2219). Not drift. The repair introduced no new cross-roadmap citation and changed no Lean name.

Ownership by object: `roadmaps grep` over main and the open heads for "Yager" finds only Rubin–Yager main-conjecture mentions in NoncommutativeAndEquivariantIwasawa (README lines 2046, 2057), not the Yager module; "(NV2)" and "congruence-line generator" occur nowhere else. The consumers HeegnerPointEulerSystems (#1423) and ModularIwasawaMainConjectures (#1499) resolve; RankOneConverse does not (R05). Ownership against the open pull requests named in the brief was checked through the roadmap service for these objects only.

Style: no LaTeX delimiters, no pull-request numbers, no process words, no `lemma` outside prose mentions of named lemmas ("Shapiro's lemma", "interpolation lemma 12.2.7"), no machine path in README, Suggested.lean or sources.toml (grep: 0). sources.toml now has 40 entries (39 of the author's, byte-identical, plus LZ14 added by the service); no `[[missing]]` table was created.

## Not verifiable

- Hung2017 (uncertified) and the waived Ichino2008, Ikeda1994, Harris1984, Rubin2000, BST19: cited by locator; their contents are not claimed verified. The weight-two case of (NV1)/(NV2) in R01 rests on Hung2017 and therefore cannot be certified here.
- BCS published pagination ("p. 12", "p. 10" in §§7.1, 7.3) and CGS23 v2 numbering: the manifest holds BCS arXiv v2 and CGS23 as recorded; the statements were verified at the arXiv lines given above, the published page numbers were not.
- CW Theorem 3.6: the extraction loses the overlines on p and p̄, so which localization feeds Col^((1),†) could not be read; the README's assignment was not checked against the text.
- The pinned APIs do not express any headline carrier, so the clean elaboration certifies the file's form, not any endpoint.

## Source issues

- **Misprint** in NAK at (47), §4.1, p. 63 (line 2831): the source says the Borel–Moore homology factor is the smooth contragredient π̃^m_(Σ₀); it should be the untilde factor π^m_(Σ₀) of Corollary 2.5 (p. 25, line 1034), or Corollary 2.5 should carry the tilde; affects nothing.
- **Misprint** in Wan-2015 at Lemma 87, p. 71 (line 3584): the source says "a height-one prime of L^Σ_(f,K,1)"; it should be a height-one prime of I[[Γ_K]] pulled back from I[[Γ⁺_K]]; affects nothing.
- **Misprint** in Wan-2015 at Definition 85, p. 69 (line 3541): the source says (NV2) concerns L^(Σ,−)_(f,K,ξ) without the v-subscript, though the condition is in A[[Γ⁻_v]]; it should be the v-restriction, as Theorem 86 uses it; affects a stated result.
- **Misprint** in CLW at the end of the proof of Theorem 8.1.1, p. 78 (line 6212): the source says ord_P(E_(π,ξ)) ≤ m; it should be ≥ m, as the theorem statement has; affects the proof.
- **Misprint** in BCS at §1.5, p. 5 (lines 220–222): the source says the divisibility of Wan-2015 assumes p > 3; Wan-2015 prints p > 5 in Theorems 3, 86 and 101, and only the proof of Theorem 86 reduces the restriction to p ≠ 3; affects a stated result (Theorem 3.2.1's prime range rests on the proof, not the printed statement).

## Operator note

On R05: the consumer `RankOneConverse` is an open jobs-board package (pull request #1780, `[Package] RankOneConverse: submission`, under review); it is absent from Tau Ceti main and from the roadmap pull requests, so the finding stands only as "cite it as a board package, not as a roadmap on main or in a roadmap pull request".

<!-- tauceti-roadmap-review {"agent": "claude", "head": "44e4c9e", "job": "REV-PKG-AutomorphicCongruences~5", "model": "fable", "worker": "fable-rev136"} -->
