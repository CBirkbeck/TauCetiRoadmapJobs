<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13085#issuecomment-6901811789 -->
Review (claude) of 87668b3

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Two "source corrections" attribute to the sources inequalities they do not print

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:1992 "LL2 Lemma 2.57: the inequalities r > 2 in the hypothesis and a_(n−1) > 3 in the conclusion are to be read as r ≥ 2 and a_(n−1) ≥ 3"; README.md:1999 "YZZ09 §4.1, proof of Theorem 1.3: the Betti-vanishing argument is stated for n > 3 and the pull-back argument for n ≤ 2, which leaves n = 3 unaddressed".

   **Claim:** LL2 Lemma 2.57 and the proof of YZZ09 Theorem 1.3 are misprinted or incomplete and are corrected here.

   **Witness:** The cached PDF of LL2, p. 34, prints "r ⩾ 2" and "a_(n−1) ⩾ 3" (and p. 37 "a_(n−1) ⩾ 3"); the cached PDF of YZZ09, p. 1158, prints "n ⩾ 3", and p. 1159 "dim V′ ⩾ 5". The text extractions of LL1, LL2 and YZZ09 render the glyph ⩾ as ">": they contain 41, 71 and 5 signs ⩽ and no ≥ at all (LL2 lines 1753, 1759; YZZ09 lines 590, 599).

   **Exact repair:** Delete both bullets from "Source corrections" (the second sentence of the bullet at :1992, "The two-lattice case occurs with a = 3 (§6.7)", is not a correction either and goes with it). Nothing else changes: §6.7 already states r ≥ 2 and a ≥ 3, which is LL2 Lemma 2.57 as printed, and §12.6a(b) states p ≥ 3, which is YZZ09 as printed. Tested on the two instances: with the bullets deleted, §6.7 at r = 2, a = 3 (its own Check) and §12.6a(b) at p = 3 agree with the printed statements, and no sentence of the README refers to either bullet (searched "2.57" and "YZZ09 §4.1").

   The same artefact was looked for in every other README statement that cites LL1, LL2 or YZZ09 with a strict inequality: §6.3 "t(A) > 1" is printed as a strict inequality (LL2 PDF p. 17, Lemma 2.24(3)–(4)); §5.4 "d ≥ 0" and §6.1 "s ≥ 0" are already non-strict. No other instance.

2. **F02** (P2) Smooth transfer is attributed to a supplier contract that excludes it

   **Location:** README.md:136 "the local smooth transfer with partial Fourier compatibility, in the GL_n(F₀)-group and augmented Lie-algebra formulations, that EndoscopicTransferAndUnitaryTraceComparisonPartII requests from it under the contract it calls jr-local-comparison"; the same attribution at :11 and in the gap sentence at :138.

   **Claim:** EndoscopicTransferAndUnitaryTraceComparisonPartII requests Jacquet–Rallis smooth transfer from the base roadmap, and this roadmap only asks for its passage to Zhang's formulation.

   **Witness:** At that roadmap's open head, README:54 lists the contract's content (invariant quotients, matching, twisted orbital distributions, factors, transfer relations "as relations between test functions"), and README:56 says the existence of smooth transfer and its Fourier compatibility "are not inputs of any target here". Zhang uses existence at the places of S (Z line 3606, §13.2, footnote 9, p. 63).

   **Exact repair:**

   1. README:11, replace "the regular matching, twisted orbital distributions and smooth transfer in those formulations are requested by that roadmap from EndoscopicTransferAndUnitaryTraceComparison, and only the passage to Zhang's formulations on S_n is requested from EndoscopicTransferAndUnitaryTraceComparison below" by "the regular matching and twisted orbital distributions in those formulations are requested by that roadmap from EndoscopicTransferAndUnitaryTraceComparison, with transfer treated there as a relation between named test functions; the existence of smooth transfer, which Zhang's comparison uses at the places of S (Z §13.2, footnote 9, p. 63), and the passage to Zhang's formulations on S_n are requested from EndoscopicTransferAndUnitaryTraceComparison below".
   2. README:136, replace the sentence "Consume also … jr-local-comparison." by "Consume also the Jacquet–Rallis regular matching across pure forms and the η(det)-twisted orbital distributions, in the GL_n(F₀)-group and augmented Lie-algebra formulations, that EndoscopicTransferAndUnitaryTraceComparisonPartII requests from it under the contract it calls jr-local-comparison. That contract takes transfer as a relation between named test functions and does not include the existence of smooth transfer; existence is part of gap:jr-afl-local-inputs."
   3. README:138 and the `needs` of the same slug in design/plan.json (identical text in both): replace "and from the matching, η-twisted orbital distributions and smooth transfer that that roadmap requests" by "and from the matching and η-twisted orbital distributions that that roadmap requests", and replace "smooth transfer compatible with the partial Fourier transform" by "the existence of smooth transfer for every Schwartz function in both of Zhang's formulations (Z Definitions 2.1–2.2, p. 10), compatible with the partial Fourier transform".

   Tested on the instance: with these edits every use of transfer in §§9.3, 14.1 and 14.3 (unit functions outside S, arbitrary matching functions at S) is covered by the gap itself, and no sentence relies on a request the other roadmap does not make.

3. **F03** (P3) Two Checks say the supersingular locus is empty at split places

   **Location:** README.md:1348 (§10.3) "At a split place the supersingular locus is empty and the statement is vacuous."; README.md:1454 (§11.5) "At a good split place there is no supersingular locus to uniformize."

   **Claim:** At a place split in F there is no supersingular (basic) locus.

   **Witness:** F₀ = ℚ, n = 2, p split: A = E × E with E supersingular and O_F acting through F ⊂ M₂(ℚ) has signature (1,1) and is supersingular. For every n ≥ 2 the basic locus (the height-n, one-dimensional summand connected) is nonempty. What is empty is the cycle (Z Theorem 9.2(ii)).

   **Exact repair:**

   - §10.3: "At a place split in F the statement is not asserted and is not needed for full-rank T: n independent special homomorphisms give an isogeny A₀ⁿ → A, and in characteristic p the summands of A₀ⁿ[p^∞] at the two places above p have dimensions n and 0, while those of A have dimensions n−1 and 1; so Z(T) has empty fibre there. The basic locus itself is not empty (for n = 2 it is the supersingular locus)."
   - §11.5: "At a good split place nothing is uniformized: the supports of the CM cycle and of the special divisors do not meet the special fibre there (§12.10), although the basic locus is nonempty."

   Tested on the witness: n = 2, T nonsingular of size 2: dimensions (2,0) against (1,1), so the fibre of Z(T) is empty while the supersingular point exists; both repaired Checks hold, the original ones fail.

4. **F04** (P3) Locator slips in three sampled targets

   **Location and witness:**

   - README.md:1344 (§10.3) "(LZ §13.3, pp. 81–82; LL1 §8, (8.3), pp. 37–38)": LZ §13.3 (LZ lines 3544–3559) is on p. 81 only and defines the semi-global cycles; the uniformization is LZ §13.1, (13.1.0.1), LZ lines 3514–3528, pp. 80–81, and LL1 states its own at (8.2), LL1 line 1715, p. 37. The same "§13.3, pp. 81–82" is in §10.1 (:1303).
   - README.md:695 (§5.2): the complexes C(x) and C(0) are defined in LL2 §2.4, (2.14), p. 24 (LL2 lines 1193–1208), which none of the four locators of the paragraph covers.
   - README.md:1600 (§12.6a, route) "(Bor99 Lemma 4.4 and Theorem 4.5, pp. 8–9)": both are on p. 9 (Bor99 lines 437, 444); Lemma 4.3 is the one on p. 8.

   **Exact repair:** §10.3: "(LZ §13.1, (13.1.0.1), pp. 80–81, with the semi-global cycles of §13.3, p. 81; LL1 §8, (8.2)–(8.3), pp. 37–38)". §10.1: "§13.3, p. 81". §5.2: add "§2.4, (2.14), p. 24" before "Lemmas 2.36–2.37". §12.6a: "(Bor99 Lemma 4.4 and Theorem 4.5, p. 9)". Update the `locator` of LZ, LL1 and LL2 in sources.toml to include the added items.

5. **F05** (P3) A Check of §12.1 fails when the Chern class of ω is zero

   **Location:** README.md:1486 (§12.1) "For φ(0) ≠ 0, omitting the constant term changes the series by −φ(0)c₁(ω)·W₀⁽ⁿ⁾, which is not modular on its own."

   **Claim:** The dropped term is never modular.

   **Witness:** n = 1: CH¹(M) = 0 (§12.7 says so), the term is 0. n = 2, F₀ = ℚ, V isotropic: M_ℂ is a union of open modular curves, a power of Δ trivializes a power of ω, so c₁(ω) = 0 in CH¹(M)_ℚ and the term is 0, which is modular.

   **Exact repair:** "For φ(0) ≠ 0 and c₁(ω) ≠ 0 in CH¹(M)_ℚ (for instance on a compact M of positive dimension, where ω is ample), omitting the constant term changes the series by −φ(0)c₁(ω)·W₀⁽ⁿ⁾, a nonzero series with only a constant coefficient, which is not a holomorphic form of positive weight n. When c₁(ω) = 0 in CH¹(M)_ℚ (n = 1, or n = 2 with V isotropic over ℚ) the term is zero." This is the qualification the third Check of §12.6a already carries. Tested on the two instances: the term is 0 in both, and the repaired Check asserts nothing false there.

Five findings: two blocking (P2) and three P3. The seven findings of round 7 are all repaired. The new findings are in text no repair touched. R01 comes from reading two "source corrections" against the cached PDF pages instead of the text extraction; R02 from resolving a supplier's contract at its current head; R03–R05 from this round's seeded targets (§§5.2, 10.3, 12.1, 12.6a).

## Verified sound

### The seven findings of round 7

| Finding | Repaired passage (README) | Status and what I checked |
|---|---|---|
| F01 contract with EndoscopicTransferAndUnitaryTraceComparison | :136 "they are the model for, and do not contain, the η-twisted GL_(n−1)(F₀)-orbital integrals on S_n, whose finiteness is proved in §9.3"; §9.3 "Prove first that the integral is a finite sum" | Repaired. Supplier headings at its head: §2.1 README:689, §2.4 :765, §2.13 :999. Z lines 223–225 (§1.2, pp. 4–5) state that semisimplicity is closedness of the orbit in the analytic topology, which is what the Baire step uses. Values in the table. The attribution in the same paragraph is R02, a different sentence. |
| F02 two forward *Needs* | §2.3 "there are finitely many type-three vertex lattices Λ_i and rationals m_i with χ(N_n, ᴸZ(L♭)_V ⊗ᴸ O_(Z(x))) = Σ_i m_i·χ(…)"; §7.3 "Krämer stratum deformation", §7.4 "Krämer vertex strata" | Repaired. My scan of all 107 *Needs* lines: no target needs a target at or after its own position. Internal references to the exchanged ids (§§7.2, 7.5, 7.8, 8.1, 8.7, Source corrections) point to the right one. |
| F03 definition of N_Λ | §7.3 "define N_Λ as the closed subfunctor of Z(Λ) which is Z(Λ) itself when m = 0 and, when m ≥ 1, consists of the points at which, for every x ∈ Λ, the image under x of the Lie algebra …" | Repaired; the two new Checks (m = 0, and Exc_(Λ₀) against a type-two Λ) are consistent with §7.4. |
| F04 Dependencies against *Needs* | Layer 13 "Layers 3–4, 8, 10 and 12 (§12.3)"; Layer 7 "Layers 0–1"; Layer 14 "Layers 0, 9 and 12" | Repaired. Computed for all 15 layers: the internal layers declared equal the internal layers used ([0],[0,1],[0,1,2],[0,3],[0],[5],[0,1],[7],[0,1,2],[0,4,6],[9,10],[9,10,11],[3,4,8,10,12],[0,9,12] for Layers 1–14). Every supplier of a *Needs* line is in its layer's Dependencies. |
| F05 §4.3 "integral" | :614 "for every full-rank L ⊂ W_n" with the Check at val −2 | Repaired; 0 = 0 at val −2, q + 2 at val 2, 1 at val 0. |
| F06 §13.5 hypothesis on φ | :1779 "for v₀-admissible φ (§10.1) and positive definite T ∈ Herm_n(O_(F,(p)))" | Repaired; LZ lines 3633–3636 (Theorem 13.6.1, p. 83) and 3545 (§13.3). |
| F07 locators | §3.1 "LZ §3.2, (3.2.0.1)–(3.2.0.2) and Definition 3.2.1, p. 16"; §8.7 "pp. 75–76"; §12.9 "Remark 9.1 and (9.7)"; §0.4 "LZ §2.7 recalls (p. 12)" | Repaired; LZ lines 471–490 for §0.4. |

The repaired patterns were searched in the rest of the package: a supplier described as stating what it does not (found: R02); a forward *Needs* (none); a definition given only by pointer (none in the sampled targets); a statement narrower than its source (none: §§0.7, 9.6, 12.6a and 13.5 are at their sources' generality or state why they are narrower); locators (R04).

### Seeded source sample (15 targets, all opened)

| Target | Passage opened | Result |
|---|---|---|
| 0.4 | LZ lines 451–490 (§§2.5–2.7, p. 12), 495–498 (p. 13) | Agrees: V(Λ) ⊂ V(Λ′) iff Λ ⊃ Λ′; intersections by Λ + Λ′; (2.7.0.1). |
| 0.7 | LZ lines 320–321 (§1.7, p. 8), 537–541 (Corollary 2.8.2), 555–560 (Lemma 2.9.2), 567–580 (Lemma 2.10.1, pp. 14–15) | Agrees. LZ's Lemma 2.9.2 is under its standing nondegeneracy, which the README makes explicit. |
| 5.2 | LL2 lines 1255–1285 (Lemmas 2.36–2.37, Definition 2.38, pp. 25–26), 1321–1322 (Lemma 2.41), 1193–1208 ((2.14), p. 24), 1339–1348 (Lemma 2.42) | Agrees: ω = L_X⁻¹, C(0) = [ω → O_N] with zero differential, conjugate action on L_X. Missing locator: R04. |
| 5.6 | LL2 lines 534–558 (Definition 2.11, Lemma 2.12, p. 12), 1534–1539 (Remark 2.52, p. 30), 1713–1720 (Lemma 2.56, p. 34) | Agrees; the reflection is as the README states it. |
| 6.7 | LL2 lines 1753–1809 (Lemma 2.57, pp. 34–35), 1811–1829 (Lemma 2.58, p. 36), 1861–1895 (proof of Theorem 2.7, p. 37), and the PDF pages 34 and 37 | Statement agrees with the printed lemma. The "correction" is R01. |
| 7.7 | K lines 609–620 (Proposition 2.12, (2.12)–(2.15), p. 15) | Agrees, including Int(I_n) = δ_odd(n) and the complementary rank in the second term. |
| 9.3 | Z lines 223–229 (§1.2, pp. 4–5), 546–563 ((2.12)–(2.14), p. 10), 574–581 ((2.16)–(2.17)), 612–624 (measures, Conjecture 2.3, p. 11), 779–790 and 812–824 (Conjectures 3.2, 3.8, p. 14) | Agrees formula by formula. |
| 9.6 | Z lines 1363–1372 (Proposition 5.2), 1421–1427 (Lemma 5.4), 1462–1500 (Theorem 5.5 and proof) | Agrees; the bound q ≥ m is the README's own, justified by the scalar count. |
| 10.3 | LZ lines 3514–3559 (pp. 80–81), 3638–3649 (proof of Theorem 13.6.1); LL1 lines 1711–1757 ((8.2)–(8.3), pp. 37–38) | Statement agrees. Locator: R04. First Check: R03. |
| 11.3 | Z lines 2011–2046 ((7.11)–(7.12), Lemma 7.13, Remark 7.14, Lemma 7.15, p. 36), 1952–1971 | Agrees. |
| 11.4 | Z lines 2047–2062 (§7.6, (7.13)–(7.15), pp. 36–37) | Agrees: regular immersion of codimension n − 1, class in F₁K′₀. |
| 12.1 | Z lines 2179–2202 (§8.1, (8.1)–(8.2), Theorem 8.1, p. 39) | Agrees. Second Check: R05. |
| 12.6a | YZZ09 lines 79 (p. 1148), 170 (Theorem 1.3, p. 1150), 541 (Proposition 3.1, p. 1157), 583–604 (§4.1, pp. 1158–1159) and the PDF pages 1158–1159; KM90 line 212 (Theorem 2, p. 126); VZ84 lines 1063–1069 (Theorem 8.1, p. 88, for simple G); Bor99 lines 70, 266, 357–376, 412, 437, 444; Bor98 lines 1297 (Theorem 6.2, p. 24), 2589 (Theorem 13.3, p. 48) | Agrees. The "correction" of YZZ09 is R01; one page: R04. |
| 13.5 | LZ lines 3615–3649 (§13.5, Theorem 13.6.1, pp. 83–84), 3729–3747 (Theorem 14.5.1, Corollary 14.5.2, p. 86) | Agrees with every hypothesis. |
| 13.10 | K lines 4122–4185 (§10.3, Theorems 10.1–10.2, pp. 79–80) | Agrees: Diff(T) = {v} nonsplit, not above 2; total formula under split dyadic places and two nonsingular split places. |

No locator was flagged by the author as unverified.

### Adversarial table (sampled targets, headlines, repaired passages, findings)

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §0.4 | Λ ⊂ Λ′ vertex lattices; type 1 and 3 | V(Λ′) ⊂ V(Λ) and dimensions 0 ≤ 1; Z(Λ)_red = ∪_(Λ⊂Λ′) V(Λ′) = V(Λ) | Consistent |
| §0.7 control | V₃ = H ⊥ ⟨a⟩, L = ⟨e, a⟩, Λ_j = ⟨ϖ^(−j)e, ϖ^(j+1)f, a⟩ | det of V₃ is −ϖ (odd valuation); h(ϖ^(−j)e, ϖ^(j+1)f) = ϖ, Gram = ϖ·(H ⊥ 1), Λ_j^∨ = ϖ⁻¹Λ_j, type 3, e = ϖ^j·(ϖ^(−j)e) ∈ Λ_j | Infinitely many curves; holds |
| §0.7 finiteness | nondegenerate W of rank n−1, λ = w + c | h(w, L) ⊂ O_F; val h(c,c) ≥ min(0, val h(w,w)); ϖM^∨ ⊂ Λ ⊂ M | Finite; holds |
| §0.9 / §3.5 headline | a = 1, 3, −3 | D = 1 − X, 1 − X + X² − X³, 0; −D′(1) = 1, 2, 0 | Retain |
| §1.3 | n = 2, val 2 | D = (1 − X) + X²; D(−q) = 1 + q + q²; vol⁻¹·D((−q)⁻¹) = q²(1 + q⁻¹ + q⁻²), equal | Agree |
| §2.4 | x ∈ Λ, type 3 | f = −q²(1+q) + (q³+1) = 1 − q²; f̂ = −(1+q)/q + (q³+1)/q = q² − 1 | Eigenvalue −1 |
| §4.3 / §4.5 headline | rank one, a = 2, 0, −2 | ∂Den_Λ = q + 2, 1, 0; (q+1)·Int_Y = (q+2) − 1, 1 − 1, 0 | Retain |
| §5.2 | type-four curve ℙ¹ | χ([O] − [ω]) = 1 − (1 + (q−1)) = 1 − q = −q(1+q) + (q²+1), the value of §6.5 on Λ; conormal of N(x) is ω, so deg O(N(x)) = 1 − q | Consistent |
| §5.5 / §6.8 headline | (b₁, b₂) = (0,0), (0,1), (1,1) | 2, 4, 2(q+3) | Retain |
| §5.6 | diag(1,1), x₁ = e₁, x₂ = e₁ + e₂ | h(x₁, x₂) = 1, h(x₁, −x₂) = −1: not an isometry; on e₁, e₂ the reflection has determinant −1 | Holds |
| §6.7 (R01) | invariants (1,1,3), x₀ of norm β | h(u⁻¹e, u⁻¹e) = −β, so u⁻¹e ± x₀ isotropic; h(e, u⁻¹e ± x₀) = −βu; e + (−u/2)·y kills βu² since β(s + s̄) = −β at s = −1/2; invariants (1,1,2,2); −β₁β₂ a non-square, so V nonsplit | a = 3 occurs, as LL2 prints |
| §7.7 | n = 3, ℓ = 1, r = 2; ℓ = 1 general | 1·(1 − 0) = 1; δ_odd(r+1) − δ_odd(r) = (−1)^r, K (2.14); Int(I_n) = δ_odd(n) = ∂Pden(I_n) of §8.2 | Retain; §8.7 headline base case agrees |
| §9.3 finiteness (F01) | ℚ₃: γ = swap; γ = ((−2,1),(−3,2)); γ = 1 | conjugates ((0,t⁻¹),(t,0)) and ((−2,t⁻¹),(−3t,2)): shells v(t) = 0 and v(t) ∈ {0,−1}; Orb = 1 and 1 − 3^s; γ = 1: Σ_k (−1)^k 3^(−ks) diverges | Holds |
| §9.3 conjugation law | a = 3, γ = swap | det(e, γe) = −1 = det γ, ω = 1; at a⁻¹γa the shell is v(t) = −1, raw −3^s, ω = η̃(1/3) = −1; ∂Orb: 0 and log 3 = 0 − log(1/3)·1 | Holds |
| §9.3 scalar action | ξ ∈ F^1 | exponent n(n−1)/2 − n⌊n/2⌋ of a unit; η̃ = 1 | Holds |
| §9.6 | m = 1; q ≥ m | Int = (a+1)/2 on each shell; q + 1 > m residues | Retain |
| §9.8 | F₀ unramified quadratic over ℚ₃, γ = ((−4,1),(−15,4)) | γ² = 1; shells v(t) = 0, −1; 1 − 9^s; ∂Orb = −log 9 | Agree |
| §10.3 (R03) | n = 2, F₀ = ℚ, p split | supersingular A = E × E exists; summand dimensions (2,0) against (1,1): Z(T) empty | Replace the Check |
| §11.1 | F = ℚ(i), α = T − i | ᾱ(0) = i; i⁻¹·T·(T⁻¹ + i) = T − i | Conjugate self-reciprocal |
| §11.4 | arithmetic dimension n | codimension n − 1 in an n-dimensional correspondence: F₁ | Agrees with Z (7.15) |
| §12.1 (R05) | n = 1; n = 2 isotropic over ℚ | c₁(ω) = 0 in CH¹(M)_ℚ in both | Qualify the Check |
| §12.6a(b) | 𝔰𝔬(3,2), 𝔰𝔬(4,2), 𝔰𝔬(2,2) | nonzero noncompact roots on x ≠ 0: at least 4, 4, and 2 (at x₀ = x₁); dim(𝔲 ∩ 𝔭) ≥ 2, ≥ 2, = 1 | Bound p ≥ 3 sharp |
| §12.6a(e)–(f) | weights and parity | Ψ homogeneous of degree −c(0,0)/2 is a section of L^(c(0,0)/2); Ψ² has the two-ray divisor; k − σ/2 = 2 at (1 + p/2, p − 2) and 0 at (1 − p/2, 2 − p); Σ_(m≥0) Z′(m, c(−m)) = c(0,0)c₁(L) − c(0,0)c₁(L) = 0 | Consistent with §12.5 |
| §12.6a Checks | x² − 3y² − 3z²; x² + y² − 3z² − 3w²; (1,1,1,1,0) | descent mod 3 gives anisotropy in both; 1 + 1 + 1 − 3 = 0 | Hold |
| §12.9 headline | F₀ ≠ ℚ; n = 2 | no arithmetic modularity asserted (§12.7) | Retain |
| §13.5 / §13.8 headline | hypotheses of LZ 13.6.1, 14.5.1 | p > 2, v₀-admissible φ, T ∈ Herm_n(O_(F,(p)))_(>0); inert T | Agree |
| §13.10 headline | asd place, q = 3 | Int_Y = ∂Den_Λ/(q+1) − Den/(q+1): correction c₀ = −1/4 | Retain |
| §14.5 headline | n = 3, 4; p = n | semi-Lie dimension 2 is a base case; n = 4 first global step; q + 1 = n + 1 residues at q = n | Retain; the q = n step is the stated target §9.5(b) |
| gap sentence (R02) | supplier's contract at its head | existence of smooth transfer: excluded there; used by Z at S | Reword three passages |

### Library, Lean and headlines

- Pins (the content repository's manifest): Mathlib 1b1ccf4b, Tau Ceti 2fd255d9. Opened: `IsNonarchimedeanLocalField` (Mathlib/NumberTheory/LocalField/Basic.lean:46), `Polynomial.eval` (Mathlib/Algebra/Polynomial/Eval/Defs.lean:248), `Polynomial.derivative` (Mathlib/Algebra/Polynomial/Derivative.lean:47), `TauCeti.FormalScheme.Spf.carrier` (TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:73), `TauCeti.FormalScheme.Spf.structureSheaf` (TauCeti/AlgebraicGeometry/FormalScheme/Spf/StructureSheaf.lean, module docstring line 63). The pinned Tau Ceti has four files under AlgebraicGeometry/FormalScheme/Spf (affine formal spectra only); no file of the pinned Mathlib mentions formal schemes. The README's statements about the pins stand.
- `lake env lean` on packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean, run from the content checkout: exit 0, no output. The file has one `import Mathlib`, one module docstring, an empty namespace and no declaration: the one-tactic probe and the `#check @name` comparison have no input; there is no padding, no sorry'd data and no `set_option`.
- Headline theorems (Summary and "Acceptance file"): §§3.5, 4.5, 6.8, 8.7, 13.8, 13.10, 12.9, 14.5. Each is named in the module docstring with the carrier it lacks (Rapoport–Zink formal schemes and hermitian densities; integral models, arithmetic degrees and Siegel Eisenstein derivatives; arithmetic Chow groups; orbital integrals on S_n). None is statable at the pins and no stand-in is stated.
- Backticked names: the README has 25 distinct code spans; two are display formulas, one a file name, six are pinned library names (the five above and `Polynomial`), and sixteen are supplier names, all found at the suppliers' heads (GeometryOfNumbersAndQuadraticArithmetic README:706, 728, 915, 935, 939; MetaplecticAutomorphicForms README:405, 523, 641, 649, 1556, 1592, 1624; AutomorphicFormsOnReductiveGroups README:693; EtaleCohomologyFoundations README:771 and :967). This roadmap declares no name of its own. The resolver, run again on the README, lists nothing.

### Suppliers, order, gaps, overlap

- Every cited section was resolved now by heading: 42 sections of PELModuliPartII (board package), and 102 sections of the 24 other suppliers at main or at their open heads (20 of SchemeKTheoryOperationsPartII, 10 each of MetaplecticAutomorphicForms and ShimuraVarieties, and the rest of the contracts). None is missing. Statements read against what this roadmap assumes: EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5 and its contracts (README:54–56, 708–726): R02.
- Dependency check, exact output: `depcheck: 239 roadmaps, 2266 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. This roadmap is line 350 of the merge order; its suppliers are at lines 37–344 or on main.
- The four declared gaps have the same slug and an identical `needs` sentence in design/plan.json and in the README (compared mechanically), each with a named earlier supplier. Three are precise and minimal; the fourth is precise but leans on a request another roadmap does not make (R02).
- Ownership by object: searched the open heads and main for the Kudla–Rapoport identities, the arithmetic Siegel–Weil formula and the arithmetic fundamental lemma; the hits are this roadmap's suppliers citing the same papers (SchemeKTheoryOperationsPartII, MetaplecticAutomorphicForms, GeometryOfNumbersAndQuadraticArithmetic, ArakelovGeometryAndAbelianHeights, MotivesAndAlgebraicCycles §7.19 with the identity as a premise) and FunctionFieldArithmetic, whose carrier is a function field. No other roadmap states these theorems. No other roadmap cites an id of this one except SchemeKTheoryOperationsPartII README:802, which names sections of its own.
- Overlap inventory: no other open pull request changes this roadmap, no cited id is dropped, none exists only in an open revision.

Overlap check: read ComplexMultiplicationAndExplicitReciprocityPartII, MetaplecticAutomorphicForms, GrossZagierAndArithmeticHeights, EndoscopicTransferAndUnitaryTraceComparisonPartII, EndoscopicTransferAndUnitaryTraceComparison (the open list; the two other lists are empty); one object is close, the Borcherds product: its generic-fibre form on GSpin and unitary Shimura varieties over ℚ with the relation in CH¹ is owned here (§§12.5, 12.6a(e)), and the integral-model divisor at maximal level is ComplexMultiplicationAndExplicitReciprocityPartII §4.2a (its README:684), a different statement; Zhang's S_n formulation of the Jacquet–Rallis side is owned here (§9.3), the group and Lie-algebra formulations by EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5. Nothing else is shared.

### Shape, policy, sources

- README shape: summary, scope, conventions, contracts, build paragraph, 15 layers each ending with Examples and Dependencies, 107 targets with 107 *Needs* lines, API lists, and at least three Checks on each of the 107 targets (counted: minimum 3). Pattern scan of README and Lean file for process words, pull-request numbers, machine paths, HTML and LaTeX delimiters: no hit. Layer titles are mathematical; no sentence says the roadmap follows a source.
- Manifest: 24 works (22 certified, 2 uncertified); every work of References has an entry and conversely. No source was fetched and the manifest was not changed.
- Wording: 21 README passages were set beside their sources (the 15 sampled targets, and §6.8 against LL2 p. 37, §6.3 against LL2 Lemma 2.24, §10.1 against LZ §13.3, §13.10 route against K's proof of Theorem 10.1, §12.6a route against YZZ09 §4.1, the Suggested.lean docstring against the introductions of LZ and K). None reproduces a sentence or follows one clause by clause; what is shared is formulas and lists of hypotheses.
- Arrangement: LZ has the largest share. Its contents (§2 cycles, §3 densities, §4 horizontal, §5 vertical, §§6–7 Fourier, §8 proof, §§9–10 almost self-dual, §§11–15 global) against the layers: Layer 1 is §4 with §5.4, Layer 2 is §5.3 with §6, Layer 3 merges §§3, 7 and 8, Layer 13 comes after eight layers from other sources and mixes LZ §§12–15 with K §10. No one-to-one run; the order of Layers 0–4 is forced by the *Needs* of §3.5 (§§0.8–0.9, 1.4, 2.5, 3.3–3.4), of §2.3 (§§1.1, 1.4) and of §4.3 (§3.5).

Source independence: 21 passages compared with 6 sources (LZ, LL1, LL2, K, Z, YZZ09), none shared; largest share LZ, 64 of 265 locators; contents compared with LZ: independent.

## Not verifiable

- Lusztig76 and McGraw03 are settled as uncertified; §§2.1, 5.4 and 12.6a(f)(ii) were not read in the originals.
- PELModuliPartII exists only as a board package whose own review asked for changes (among them its exotic irreducible components, which §§5.1 and 5.4 here consume through its §3.7); its sections resolve today and may move.
- The text extractions of LL1, LL2 and YZZ09 lose the sign ⩾. I read the PDF pages for the statements this review relies on (LL2 pp. 17, 34, 37; YZZ09 pp. 1158–1159); other inequalities taken from these three texts in earlier rounds were not re-read on the page. BHKRY and Howard19 extract with no inequality signs at all and were not sampled this round.
- The entries of "Source corrections" other than the two of R01 were not re-derived this round; LRZ, MZ, BHKRY, ES, GS19, Liu11a, Mih16, Zha12, Ter13a, Ter13b and KR11 were not reopened, and for them I rely on the computed rows of the earlier rounds.
- The published paginations of LZ, K and LL1 were not opened; locators were checked in the versions the README names.
- The declared supplier gaps are contracts; only their precision, ownership and minimality were checked.

## Source issues

- **Misprint** in LZ at Definition 2.9.1, p. 14: the source says the closed formal subscheme cut out by the torsion ideal is the maximal vertical one; it should be the maximal horizontal one, as the next paragraph uses it; affects nothing.
- **Misprint** in LL2 at Lemma 2.56, proof, p. 34: the source says the reflection takes the first n−1 basis vectors to 1; it should fix each of them and negate the last; affects nothing.
- **Misprint** in LL1 at §8, pp. 37–38: the source says the tuple and the matrix have size m and then indexes the tensor factors and diagonal entries up to r; it should use one letter for both; affects nothing.

The two entries of R01 are not source issues: LL2 Lemma 2.57 and YZZ09 §4.1 are correct as printed.

## For the human reviewers

- **Licence.** McGraw03 (Math. Ann. 326) is cited for its main theorem without a theorem number and no legal copy was read (packages/GrossZagierAndArithmeticHeightsPartII/sources.toml, `uncertified`).
- **Licence.** YZZ09 is read from a university archive host and LL1, LL2, Zha12 from author pages (README.md, References); the manifest records them as certified.
- **Not tested.** Two targets, §8.6 (README.md:1125) and the q = n step of §9.5(b) (:1242), ask for proofs the cited sources do not contain; the headline §8.7 and the case p = n of §14.5 depend on them.
- **Not tested.** The cached texts of LL1, LL2 and YZZ09 print ">" where the PDFs print "⩾" (for example LL2 line 1753 against its PDF p. 34); statements taken from these extractions need the PDF page.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "87668b3f8560440905bfd7aa5688b2615a2f81e0", "job": "REV-PKG-GrossZagierAndArithmeticHeightsPartII~8", "model": "fable", "worker": "chris-x79"} -->
