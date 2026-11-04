<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1129#issuecomment-6402685512 -->
Review (claude) of 6536723

Verdict: accepted
Conditional on the announced gaps: `flat-nonproper-intersection`, `arithmetic-interpolation`, `controlled-polarization-embeddings`, `abelian-tropical-measures`, `moriwaki-silverman-tate-nef`

1. **F01** (P3) "quarter-size copies" in the new §5.12 paragraph names the wrong scale

   **Location:** `packages/HeightsRationalPointsAndObstructionsPartII/README.md:1021`, §5.12: "of a small ellipsoid whose quarter-size copies are pairwise disjoint".

   **Claim:** The covering in David–Philippon's proof of Théorème 1.3 uses translates of an ellipsoid whose pairwise-disjoint copies are one quarter the size of the covering ellipsoid.

   **Witness:** david-philippon-2002 line 2506 (p. 690): the disjoint copies are x′ᵢ + E(a₀/4), where E(t) is the sublevel ellipsoid ĥ ≤ t. Quartering the height parameter halves every linear dimension (ĥ is quadratic), so the disjoint copies are half-size, not quarter-size; the volume ratio used at line 2518 is (2√(a/a₀) + 1)ʳ, which is the half-radius count.

   **Exact repair:** Replace "whose quarter-size copies are pairwise disjoint" by "whose copies with height parameter a₀/4, that is half the linear size, are pairwise disjoint". Tested on r = 1, a = 2 and f = 2²⁸ (the source's lower bound on its constant f, with a₀ = 1/f): the number of half-size translates is at most 2√(af) + 1 ≈ 46,342 ≤ (5af)^{1/2} ≈ 51,810 (line 2533 through line 2540), so the displayed bound Q(5aQ)^{r/2} is unaffected; only the description changes.

One finding, non-blocking. The three round-4 findings are repaired at the current head and were re-verified against the texts; the repaired passages passed the adversarial pass; the dependency gate, the elaboration of `Suggested.lean`, the signature check and the one-tactic probe are clean. Acceptance is conditional on the five declared supplier gaps listed in `review.json`.

## Verified sound

### Round-4 findings, checked before the new pass

The round-5 repair report marked all three findings applied; none was marked "not actionable in this package". No settled refusal is re-raised.

| Round-4 item | Status | Repaired passage and independent test |
|---|---|---|
| F01 (P2), pointwise David–Philippon bound | Repaired | README line 1021 now states the count: "put `Q = (2^(16g) h₀(A)^(2/g) D)^((4g²)^(dim X))`. (a) At most Q points of X°(ℚ̄) have ĥ < 1/Q. (b) For every real a > 1 … at most `Q (5aQ)^(r/2)` points of Γ ∩ X°(ℚ̄) have ĥ ≤ a." Read at david-philippon-2002 line 115 (Théorème 1.2: at most q(X) points of X° with ĥ < 1/q(X)), line 122 (Théorème 1.3: a > 1, at most q(X)(5a·q(X))^{r/2} points of Γ ∩ X° with ĥ ≤ a), line 129 (Théorème 1.4: q(X) ≤ (2^{16g} h₀(A)^{2/g} deg X)^{(4g²)^{dim X}} with h₀(A) = d·max{1, h(A)}, d = [k:ℚ]), all on printed p. 641; ĥ = ĥ_{M⊗16} at line 56 and h(A) the projective height of the origin in the M^{⊗16} embedding at line 93. Monotonicity: {ĥ < 1/Q} ⊆ {ĥ < 1/q} gives count ≤ q ≤ Q; q(5aq)^{r/2} ≤ Q(5aQ)^{r/2}. The proof description was read at line 2493 through line 2533 (pp. 689–690): Théorème 5.3 is applied to τ_{−x′}(X) of the same degree, with the translates x′ᵢ + E(a₀) and disjoint x′ᵢ + E(a₀/4). The route (line 1025) keeps the ≤ Q exceptional points inside the count. Weierstrass control recomputed: g = 2, D = 16·2 = 32, (4g²)¹ = 16, Q = (2³²·h₀·32)¹⁶ = 2^{(32+5)·16} h₀¹⁶ = 2⁵⁹² h₀¹⁶; six height-zero points wᵢ − w, 6 ≤ Q. The sources entry and `sources.toml` line 220 carry the new locators. R01 is a wording residue of this repair. |
| F02 (P2), Moriwaki comparison beyond the supplier's big hypothesis | Repaired | README line 109 states the gap: "What ArakelovGeometryAndAbelianHeightsPartII must provide (gap:moriwaki-silverman-tate-nef): Extend §6.4(1) from big to arbitrary Moriwaki polarizations: … H̄ᵢ are nef but not necessarily big … |ĥ^B(P) − h^B(P)| ≤ C·max{1, h^B_S̄(π(P))} … keeping the big hypothesis on the specialization limit §6.4(2)". `design/plan.json` `gaps` now has five entries; a character comparison shows every slug's `needs` identical to the README sentence and the supplier/section pairs (SchemeAndStackFoundations §§5.2, 5.5–5.6, 5.12; HeightsRationalPointsAndObstructions §5.9b; ArakelovGeometryAndAbelianHeights §§5.7–5.8; TropicalAndBerkovichArithmetic §§6.2–6.4, 7.0; ArakelovGeometryAndAbelianHeightsPartII §6.4). §8.5 (line 1421) now separates the height machine without Northcott (§§6.1–6.3) from the comparison (§6.4(1) with the gap); the Needs line (1428) and the Layer 8 Dependencies (1451) carry the gap. Supplier read: `packages/ArakelovGeometryAndAbelianHeightsPartII/design/README.md` §6.1 (polarization with nef smooth hermitian H̄ᵢ; big means all H̄ᵢ nef and big), §6.2 (Northcott (4) is the only part needing big B), §6.4 (both parts under "big polarization"). Source read: gh-2019 line 2596 (§A.2 takes any polarization), line 2603 (Theorem A.3), line 2609–2613 (proof uses the Moriwaki Silverman–Tate of reference 54, Wazir 2006), line 2564 (Northcott needs big). Trivial-polarization control: with H̄₁ the trivially metrized trivial bundle on ℙ¹_ℤ, ĉ₁(H̄₁) = 0, every Moriwaki height is O(1), and the statement is O(1) ≤ c(1 + O(1)); the supplier's own non-example (§6.1, `moriwakiHeight_not_big_nonexample`) says the same. |
| F03 (P3), locators pointing at headings | Repaired | §0.4 (line 207): ggk-2026 line 1496 is the Euclidean norm and ball-packing sentence, header p. 221; dgh-2021 line 1601 is the packing sentence, header p. 34. §1.7 (line 351): ggk-2026 line 646 is Lemma 3.5 with (3.9), header p. 203. §5.1 (line 820): dgh-2021 line 1600 is the Euclidean norm on Γ ⊗ ℝ, p. 34. §5.2 (line 845): ggk-2026 line 1480 defines c_NT and line 1482 h₁, p. 221. §5.3 (line 868): dgh-2021 line 1536 is "Bounding c_NT" with (8.4) at line 1540, line 1541 "Bounding h₁", p. 32; ggk-2026 line 1484 the comparison before (7.3). §5.12 (line 1019): dgh-2021 line 1644 and line 1662 are the two uses of the p. 643 estimate in the proof of Theorem 1.1, header p. 35; line 1696 is Remark 8.3, p. 36. §6.9 keeps dgh-2021 line 1473 (Proposition 8.1 itself, p. 31). All ten replacement lines were opened; each carries the statement cited beside it. |

### Principles, scope and form

Held the package to the binding principles: no route-specific restriction (the Conventions keep p = 2 and p = 3 and use prime-to-p torsion only for §9.17's étale multisection, with GGK and Yuan statements retained at their full generality); the parent HeightsRationalPointsAndObstructions is cited, not re-planned (its §§0.10–0.12, 0.16–0.35, 1.7–1.11, 5.1–5.19 were all located at its open head, listing below); every supplier is earlier in the merge order or on main; no copied passage; no algorithm; no sorry'd data; no `set_option`. Greps for LaTeX delimiters, process words, pull-request numbers, local paths, target-numbering tables and field lists found nothing (the word "current" in §1.4 describes the induction state, not process). The README has 108 numbered targets, each with a `*Needs:*` line; 13 layers, each ending in `### Examples` and `### Dependencies`; 20 definition blocks ("The defining object has the following API"), with Checks counts 6, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 5, 4, 3, 3, 3, 3, 3, 3 (all at least three). `metadata.toml` is `topic = "math.NT"`. The manifest has 17 entries, two settled uncertified, no local path.

### Seeded source verification

All fifteen sampled targets were read in the cached legal extractions; theorem number, printed page (checked against the page headers in the extraction), hypotheses and the statement as restated were compared. Page keys: ggk-2026 printed = extraction page + 187 (page 3 carries header 190); dgh-2021 and gh-2019 headers are printed pages; xy-2022 and yuan-2026 printed = PDF page; dky-2020 printed = page + 948 (page 2 carries 950).

| Target | Passage checked | Outcome |
|---|---|---|
| §1.1 restricted Hilbert schemes | ggk-2026 line 425 through line 442, §3.1, (3.1), p. 198 | Finite polynomial set Ξ, disjoint union H_{r,d}(A) projective, universal family in A × H; the geometrically integral reduced open locus and the fibrewise point description agree. |
| §1.5 generic finiteness | ggk-2026 line 600, Lemma 3.3 and proof, p. 202 | m₀(S) with ι^{[m]} generically finite on X_S^{[m]} for m ≥ m₀; proof through (3.8), Lemma 3.2 and flatness-openness, as restated. |
| §1.7 generation locus | ggk-2026 line 646, Lemma 3.5, (3.9), p. 203 | S_gen = finite stabilizer and generation; both conjuncts present. |
| §1.8 closure components | ggk-2026 line 646 through line 662, Lemma 3.5 and proof, p. 203 | Components of the closure of S_gen with reduced structure satisfy (i)–(iii); (ii) by semicontinuity, (iii) by spreading the identity component. |
| §2.4 top self-intersection | dgh-2021 line 767, Proposition 4.2 and proof, p. 17 | Smooth point with positive top Betti power; κ independent of N; F^{·d} ≥ κN^{2d}; proof via Cθα − θω ≥ 0 and [N]^*ω = N²ω, as restated. |
| §5.12 Rémond's single bound and the new count | dgh-2021 line 1644, line 1662 (p. 35), line 1696 (p. 36); david-philippon-2002 line 115, 122, 129 (p. 641), line 183 (p. 643), line 2493 (pp. 689–690) | Endpoint exponent (r+1)g^{5(dim X+1)²} and base 2³⁴h₀(A)deg X at line 189; Theorems 1.2–1.4 and the proof as in F01 above. |
| §6.3 Ueno locus specializes | ggk-2026 line 1604 through line 1608, proof of Lemma 7.3, p. 224 | "Good model" with 𝔛ᵥ° the specialization of X° and deg_L X = deg 𝔛ᵥ by flatness; the roadmap routes the good model through the parent's bounded directions (§§5.4a–b, 5.13c), which exist at the parent's head. |
| §6.4 ℚ̄ to arbitrary F | ggk-2026 line 1580 through line 1623, Lemma 7.3, pp. 223–224 | Finitely generated Γ, End(A) extended, Masser's dense set Θ, injective specialization, c(g, deg X)^{1+ρ}. |
| §7.4 special subvarieties | xy-2022 line 85 through line 95, (1.5), p. 3; line 586, (3.3), p. 15 | Trace (closed immersion in characteristic 0, purely inseparable isogeny onto its image in characteristic p), torsion subvariety a + C, special = tr(Y ⊗ K̄) + T. |
| §9.1 defined over a subfield up to isogeny | xy-2022 line 474, §3.1, p. 13 | Definition as restated. |
| §9.2 isogeny descends | xy-2022 line 485 through line 495, Lemma 3.3, p. 13 | Spread the isogeny over a k-variety S and specialize at b ∈ S(k); k algebraically closed used exactly there. |
| §9.9 lowering transcendence degree | xy-2022 line 462, Proposition 3.1, p. 12 | trdeg ≥ 2, two intermediate fields algebraically closed in K of transcendence degree 1, independent of X. |
| §10.3 integral small-points bound | yuan-2026 line 2745, Theorem 4.10, p. 81; non-isotrivial at line 2762, p. 82 | S flat integral quasi-projective over ℤ, nef L̄ potentially big on X/S, open U, constants, every function field K/k and non-isotrivial y; the factoring-through-Spec k′ definition. |
| §11.2 isotriviality via level | yuan-2026 line 2495, Lemma 4.8, p. 74; line 2525 through line 2531, p. 75 | (a)⇔(b)⇔(c) with the shift (2g−2)α − dω; the moduli criterion through Pic^d_{𝒞/M_{g,N}}(k) and closed points. |
| §12.4 unbounded torsion orders | dky-2020 line 2079, Proposition 9.2, p. 997 | Curve in L₂ over ℚ̄, Weierstrass P, a point of order ≥ N in j_P(X) ∩ J(X)_tors; the proof lifts a common x-coordinate through the degree-four isogeny. Published numbering, absent from the arXiv version, as the manifest records. |

Also read, beyond the sample, for the headline and repaired passages: ggk-2026 line 69 (Theorem 1.1, p. 190), line 121 (Theorem 1.1′, p. 191), line 150 and line 165 (Theorems 1.2–1.3, p. 192); kuhne-2021 line 119 (Theorem 1), line 242 (Theorem 2 over ℂ), line 269 (Theorem 3), line 322 and line 330 (Theorem 4 and the #C(K) ≤ c₁₀(g)^{1+ρ} remark); gh-2019 line 68 (Theorem 1.1), line 151 (Theorem 1.4), line 512 (Proposition 3.1), line 2688 (Proposition B.1); yuan-2026 line 141 (Theorem 1.1), line 2175 (Theorem 4.2(1)–(2)), line 3335 (Theorem 4.17, thresholds dim S, dim S+1, dim S+g, dim S+1, dim S+g), line 3406 (Proposition 4.18, m ≥ dim S + 1, bigness over k), line 3417 (Theorem 4.19, thresholds one higher); xy-2022 line 101 (Theorem 1.1), line 841 through line 857 ((a)–(d)), line 908 (Lemma 5.3), line 972 through line 1022 (Proposition 5.4 and its proof), line 1023 (§5.3); dky-2020 line 41 (Theorem 1.1), line 53 (Stoll's 34-point example), line 192 (Theorem 1.10); yamaki-2018 line 236 (Theorem 1.5: equivalence for A, 𝔪, 𝔪/t); masser-1989 line 45 and line 53 (Main Theorem w ≤ Ch^κ, Scholium 1 w(V(δ,h)) ≥ exp(ch) with δ = deg V, p. 414); masser-1996 line 127 (Theorem, w ≤ C max{d,h}^λ, p. 459); remond-2000-vojta line 187 and line 223 (Théorèmes 1.1–1.2, pp. 105–106).

### Computed adversarial table

Rows cover the sampled targets, the headline families, the three Lean declarations and every passage the round-5 repairs changed. Each row records the instance and the value on each side.

| Statement | Instances tried | Computed values on both sides | Result / change |
|---|---|---|---|
| §5.12(a) count below 1/Q (new) | Genus-two C − w, Weierstrass w, L = M¹⁶; X a point | D = 16·(Θ·C) = 16·2 = 32; (4g²)^{dim X} = 16; Q = (2³²·h₀·32)¹⁶ = 2⁵⁹²h₀¹⁶; six points wᵢ − w of height 0 < 1/Q, 6 ≤ 2⁵⁹²h₀¹⁶. Point: X° = X, Q = 2^{16g}h₀^{2/g} ≥ 1 ≥ 1 point | Holds; a positive lower bound on all of X° is false (six zeros). No change. |
| §5.12(a) monotone replacement q ↦ Q | q(X) ≤ Q | {ĥ < 1/Q} ⊆ {ĥ < 1/q}; count ≤ q ≤ Q | Restatement valid. |
| §5.12(b) rank-r count (new) | r = 0, a = 2; r = 2, a = 2; r = 1, a = 1/(10Q) | r = 0: Q(10Q)⁰ = Q, independent of a. r = 2: Q·(10Q)¹; the exponent r would give Q·(10Q)². r = 1, a = 1/(10Q): formula would read Q/√2 < Q, below the ≤ Q torsion points (a) allows | The hypothesis a > 1 is needed and is stated; exponent r/2 is the source's. No change. |
| §5.12(b) derivation description (new) | r = 1, a = 2, f = 2²⁸, a₀ = 1/f | DP line 2506: disjoint copies x′ᵢ + E(a₀/4), half the linear size; line 2518 ratio (2√(a/a₀) + 1)ʳ ≈ 46,342 ≤ (5af)^{1/2} ≈ 51,810 | "quarter-size" names the height parameter, not the size: R01. |
| §5.12 route cutoff (new) | a at least the §5.8 threshold | Points with ĥ > a are the large points (§5.8, count ≤ c₆^{r+1}); points with ĥ ≤ a counted by (b); the ≤ Q points below 1/Q are inside (b) | Consistent; no gap between the two ranges. |
| §5.12 endpoint | r = 0, dim X = 1, g = 2 | Exponent (0+1)·2^{5·4} = 2²⁰; base 2³⁴h₀(A)·D | Matches DP line 189. |
| §8.5 with a non-big polarization (new) | k₀ = ℚ(t), B = (ℙ¹_ℤ; trivial H̄₁ with trivial metric) | ĉ₁(H̄₁) = 0, so h^B_{S̄,M} = O(1) and ĥ^B = O(1); O(1) ≤ c(1 + O(1)) after enlarging c; supplier §6.4 requires H̄₁ big (volume 0 here) | Statement true, supplier inapplicable: the gap is needed, not a weakening of §8.5. |
| §8.5 number-field case | d = 0 | Moriwaki height = [k₀:ℚ]·absolute Weil height (supplier §6.1); statement becomes GH Theorem 1.4 | Reduces to §8.3. |
| gap:moriwaki-silverman-tate-nef | Constant family with trivial B; big B | 0 ≤ C; for big B it is supplier §6.4(1) | Precise (hypotheses listed), minimal (nothing earlier provides the nef case: supplier §6.2(4) and §6.4 are the only big-dependent statements), declared in both places. |
| §8.6 keeps bigness | Curve minimum a = 1 | e₁ ≥ ĥ(X) ≥ e₁/2 = 1/2; unbounded base height needed for the limit | Big B retained only in §8.6, as the repair says. |
| §0.4 packing (locator change) | ρ = 0; S = [−r, r], R = r; S = ∅ | 1 ≤ 1; 1 ≤ (1+2)¹ = 3; 0 | Bound, not equality; r > 0 needed. |
| §5.1 Néron–Tate space (locator change) | E: y² = x³ − 2, Γ = ℤ·(3,5); Γ = A_tors; division hull of ℤP | dim 1 = rank 1; 0; dim 1 without finite generation | Finite rank, not finite generation. |
| §5.2 very ample power (locator change) | O_E(2·0), O_E(3·0) | h⁰ = 2 (degree-two map), h⁰ = 3 (plane cubic) | Exponent two excluded. |
| §5.3 bounds (locator change) | DGH (8.4) | c_NT = c·max{1, h_{A_g,M}(τ(s))} | Linear in the moduli height. |
| §1.1 Hilbert data | E ⊂ ℙ² by O(3·0); r = dim A; E × E diagonal | Hilbert polynomial 3n; the only member of dimension g and degree deg A is A (one reduced point); diagonal degree 3 + 3 = 6, translates (x+a, x+b) depend on b − a: one-dimensional family | Agrees with the Checks. |
| §1.5 | S a point | X_S^{[m]} = X^m maps isomorphically; m₀ = 1 | Base case. |
| §§1.7–1.8 | X = E × {0} ⊂ E²; genus-two Abel curve | Stabilizer dimension 1 and ⟨X−X⟩ = E×{0} ≠ E²: not in S_gen; Abel curve: stabilizer finite, ⟨X−X⟩ = J (C + C = J for g = 2) | Both conjuncts discriminate. The route's closedness argument: image of the proper sum map is closed, its complement open, the smooth structure map open, so the non-generation locus is open. |
| §2.4 | E ⊂ ℙ², S a point, N; constant torsion section over a curve | F·X̄_N = deg O(1,1)|graph of [N] = 3 + 3N² ≥ 3N²; torsion section: F·X̄_N = deg S̄, constant in N | κ = 3 works; degenerate X has no κ. |
| §3.6 and Lean `uniform_maninMumford_curves` | D = [Q], c = −a(Q); g = 1; translate by every c | a(Q) + c = 0 torsion, +a(Q) would give 2a(Q); g = 1: all of E, encard = ⊤ > B, excluded by 2 ≤ g; B quantified before F and c | Signature carries IsAlgClosed, CharZero, Smooth, IsProper, GeometricallyIntegral, Krull dimension 1, IsAlbanese, J.dim = g. |
| §6.8 and Lean `uniform_mordellLang_curves` | ρ = 0, s = ∅; Γ = division hull of one point | closure ∅ = {1}; p^n = 1 with n > 0: torsion allowed, bound B^{1+0} = B; division hull: rank 1, bound B² | Rank bound without finite generation; n > 0 excludes p⁰. |
| §6.12 and Lean `uniform_rationalPoints_curves` | F = ℚ and ℚ(i), same g; X(F) = ∅ | Same B (∃ B precedes ∀ F); no x₀ exists, statement vacuous, count 0 | Degree-free bound as Kühne's remark at line 330. |
| §6.3 | Genus-two curve; Legendre P = (2, μ), μ² = 2(2−λ) at λ = 2 | Ueno locus empty in every fibre (a genus-two curve contains no elliptic coset); at λ = 2, P = (2,0) has order 2 while generically μ ≠ 0 | Good model needed only for the Ueno locus; §6.2's non-injective specialization witnessed. |
| §6.4 | F = ℚ̄; finitely generated Γ of rank ρ | Identity; c(g, deg X)^{1+ρ} with rk Γᵥ ≤ ρ | Masser's density gives the point. |
| §7.4 | Constant E₀ over k(t), P ∈ E₀(k) of infinite order; translate by non-torsion mod trace | {P} special via Y = {P} ⊆ T, ĥ(P) = 0; translate not special | Trace term necessary. |
| §§9.1–9.2 | Legendre over k(t); E and its twist by −1 over ℝ | j(t) = 2⁸(t²−t+1)³/(t²(t−1)²) has poles: not potentially good, so not constant up to isogeny; over ℂ isomorphic, over ℝ no nonzero isogeny commutes with the twisted conjugation | k algebraically closed needed in §9.2. |
| §9.9 | S = ℙ², fields k(y/x), k(z/x) | Intersection k; each of transcendence degree 1 in K of degree 2 | Two independent pencils. |
| §9.15–9.17 (route checked against xy line 996) | Elliptic subgroup X; genus-two Abel curve | r = 1, e = 0; dim X₁ = 1 < dim X₂ = 2, r = 2 | Prime-to-p multisection only, matching the source's proof. |
| §10.3 | Isotrivial y; k = 𝔽₂, 𝔽₃ | deĝ(M̄|_y) = 0 and constant heights 0: no bound possible; any field k allowed at line 2749 | Non-isotriviality necessary. |
| §11.2 | g = 2, α = O(x), x generic over k(C₀); characteristic 2 | Shift 2α − ω; x ↦ 2[x] − [ω] = Abel map followed by [2], finite, non-constant; [2] inseparable but finite | Pair and shifted pair both non-isotrivial. |
| §11.7 | α = y ∈ C(K̄) over a number field | Drop ĥ((2g−2)α − ω) ≥ 0: the new gap principle with c₁ max{h_Fal, 1} | Specializes to §4.9. |
| §12.4 | Order of the lift | ord(w) ≥ ord((π×π)Φ(w)) ≥ N since ker Φ is finite | Matches dky line 2089. |
| §3.5 non-generating extension | X not generating A, P₀ small | Y = X − P₀ generates B = ⟨X−X⟩, deg_L B bounded in g, d (GGK Lemma 2.5); ĥ(P − P₀) ≤ 2ĥ(P) + 2ĥ(P₀) ≤ 4c₃; a point of X° in a component Z of P₀ + Y′ lies in Z° since every coset in Z lies in X | Induction on dim X sound; translation preserves L-degree (t_a^*L ≡ L). |

### Ownership and resolved suppliers

The board checkout is at commit 6536723 (the round-5 fix); the content checkout is main at a4e4540; the pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. `roadmaps grep` over main and the 367 indexed open heads: the three fully qualified Lean names occur nowhere else; "David–Philippon" occurs only in ArakelovGeometryAndAbelianHeights §5.8 (Masser's matrix lemma, not a small-point count); no roadmap pairs "Moriwaki" with "Silverman" outside this package and its supplier. The quantitative count of §5.12 and the nef-polarization extension therefore have no earlier owner; the parent's §5.17f (successive minima) and §5.18 (qualitative Bogomolov) were read at its head and state no constants. Ownership against open pull requests outside the index was not checked.

Every cross-roadmap citation was resolved at the current head named by the service (pull-request number in parentheses is where the copy lives, not a citation):

| Supplier | Where read | Sections found |
|---|---|---|
| HeightsRationalPointsAndObstructions (1017) | lines 223–500, 615–737, 2169–2870 | §§0.10–0.12, 0.16–0.35, 1.7–1.11, 5.1–5.20 including 5.4a–c, 5.9a–f, 5.13b–c, 5.15, 5.17a–g, 5.18, 5.19; §5.9b defines the Fubini–Study cycle height with [1:2] of height ½ log 5 |
| SchemeAndStackFoundations (main) | lines 551, 798, 5528, 5643, 5706, 6567–6921, 7336 | §§0.3, 0.8, 4.11, 4.13, 4.14, 5.1–5.6, 5.12 |
| AlgebraicModuliForArithmeticGeometry (853) | lines 686, 819, 994 | §§1.5, 1.6, 2.1 |
| PELModuli (966) | lines 3471–3542, 3979, 4011 | M5.1–M5.3, M6.9–M6.10 |
| AbelianSchemesAndArithmeticModuli (849) | lines 723–926, 984–1274, 1324–1696, 2732–3717 | Layers A1, A2 (A2.3, A2.7, A2.8, A2.9, A2.10), A3, A6 (A6.5) |
| AbelianSchemesAndArithmeticModuliPartII (1405) | lines 986–1132, 1227, 1509, 1657–1708, 1888–1933, 2017–2090 | B0.1–B0.2, B1.1–B1.5, B2.3, B2.13, B2.21–B2.23, B3.7–B3.9, B4.2–B4.6; B2.3 is the fixed-A family statement, distinct from the uniform curve theorems here |
| ComplexComparisonPartII (848) | lines 2328–3019 | Layer C5, §C5.4 |
| ArakelovGeometryAndAbelianHeights (1000) | lines 840, 1027, 1149–1204, 1504–1581, 1694 | §§2.7, 3.4, 4.2–4.4, 5.5–5.8, 6.3 |
| ArakelovGeometryAndAbelianHeightsPartII (board design) | §§6.1–6.4 read in full | §6.1 polarization and bigness, §6.2 height machine, §6.3 Néron–Tate, §6.4 Silverman–Tate and specialization under big B |
| StableReductionPartII (board design) | lines 19476, 19661, 19739, 19939, 21480, 21635, 21784, 22456, 23132, 23206 | MC.4, MC.6, MC.7 and all seven named targets |
| JacobianChallengePartII (1225) | lines 140–169, 204–258, 295–407, 451–614, 800–934, 1065–1078 | §§0.2–0.4, 1.1–1.4, 2.1–2.7, 3.2–3.13, 5.1–5.6, 7.1–7.2 |
| JacobianChallenge (main) | line 448 | Layer F |
| NeronModelsAndSemistableAbelianVarieties (852) | lines 663–930, 1645–1815, 2840–2902 | §§1.1–1.10, 3.10–3.14, 5.1–5.2 |
| TropicalAndBerkovichArithmetic (1494) | lines 2095, 2121, 2146, 2308 | §§6.2–6.4, 7.0 |
| InverseGaloisAndArithmeticFundamentalGroups (850) | lines 1505–2352 | Layer IG.2 |
| AlgebraicCurves (main) | lines 918, 1014 | Layers 10–11 with the 84(g−1) bound |
| ArithmeticDynamics (1335) | lines 9481–9611, 10096, 10349–10392 | §§6.57–6.64, 6.93, 6.110–6.112; §6.64 states the Lattès height as twice the Néron–Tate height, as the contract says |

The resolver's single lead (ArakelovGeometryAndAbelianHeightsPartII §3.1 found nowhere indexed) is a board design, listed in the merge order before this roadmap, with the section present: not a defect.

### Pinned declarations opened

| File and line at the pin | Interface checked |
|---|---|
| `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84` | `IsAlbanese x₀ a` is a Prop structure: `x₀ ≫ a` is the identity and every pointed morphism to an abelian variety factors uniquely through a homomorphism; nothing about X being a curve. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`, 118, 144, 281 | `AbelianVariety K` bundles the group object; `dim` is `topologicalKrullDim` valued in `WithBot ℕ∞` (the Lean's `J.dim = ↑g` coerces); commutativity instance; `baseChange`. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:61` | `IsIsogeny` = finite surjective; no separability. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:24`, 285, 378; `Limit.lean:77` | x-coordinate naive height; `canonicalHeight_nsmul` n²; `neronTatePairing_apply` halved; limit characterization. |
| `Mathlib/CategoryTheory/Monoidal/Cartesian/Grp.lean:58` | `Hom.group` on `X ⟶ G` with inverse by composition with ι. |
| `Mathlib/Topology/MetricSpace/CoveringNumbers.lean:74`, 288, 351; `Cover.lean:47` | `coveringNumber` as the infimum over covers C ⊆ A; `IsCover` uses `edist x y ≤ ε` (closed balls); `maximalSeparatedSet` empty when the packing number is ⊤; `coveringNumber_le_packingNumber`. |
| `Mathlib/Topology/MetricSpace/MetricSeparated.lean:43`; `Pseudo/Defs.lean:418` | Strict separation ε < edist; closed ball by dist ≤ ε. |
| `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:500`; `Mathlib/Analysis/InnerProductSpace/PiL2.lean:111` | `addHaar_closedBall` with 0 ≤ r; `EuclideanSpace` = `PiLp 2`. |
| `Mathlib/NumberTheory/Height/Projectivization.lean:51` | `logHeight` lifted from the admissible-family height. |
| `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`; `Mathlib/RingTheory/AlgebraicIndependent/Basic.lean:45`; `Mathlib/FieldTheory/IntermediateField/Basic.lean:52`; `Mathlib/LinearAlgebra/Span/Defs.lean:46`; `Mathlib/LinearAlgebra/Matrix/Echelon/Basic.lean:87` | `finrank` = `Cardinal.toNat`; `trdeg` cardinal-valued; `IntermediateField`; `span`; `IsReducedRowEchelon`. The Echelon directory has `IsLeadingEntry.unique` and pivot uniqueness but no uniqueness of the reduced form, as §9.4 says. |

### Declared gaps and dependency check

The five gaps (`flat-nonproper-intersection`, `arithmetic-interpolation`, `controlled-polarization-embeddings`, `abelian-tropical-measures`, `moriwaki-silverman-tate-nef`) have the same slug, supplier, section and `needs` sentence in `design/plan.json` and in the README's supplier contracts (programmatic comparison, all five identical). Each names a supplier, each `needs` carries its hypotheses, and none asks for what Mathlib, Tau Ceti or an earlier roadmap provides: the first four were examined in round 4 with computed boundaries and are unchanged; the fifth is examined in the table above.

The prescribed dependency check was run from the board checkout with this roadmap's name, the merge order and `--movable`. Exit 0; exact output:

```text
depcheck: 56 roadmaps, 646 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every `*Needs:*` line and Dependencies list cites a supplier on main or earlier in the merge order.

### Headline coverage, elaboration, signatures and padding

Headlines listed from the README: the level-case height inequality and its adelic comparison (§§2.7–2.8); family equidistribution, uniform Bogomolov and Manin–Mumford (§§3.2, 3.5–3.6); the new gap principle (§§4.8–4.9); Rémond's Vojta and Mumford inequalities and counting (§§5.4–5.5, 5.10, 5.12); the uniform count off the Ueno locus, uniform Mordell–Lang and rational points (§§6.5, 6.7–6.8, 6.12); Gao–Habegger and its constant extension (§§8.4, 8.6); Yamaki's reduction and the full geometric Bogomolov theorem (§§9.12, 9.19); potential-bigness small-point bounds, five-map non-degeneracy and relative Bogomolov (§§10.1, 10.3–10.5, 10.7–10.8); Yuan's global-field theorem (§11.7); the bielliptic results (§§12.2–12.4). The three statable at the pins (§§3.6, 6.8, 6.12 on native curves, the Albanese property and the point group) are stated; the module docstring names each other family with the carrier it lacks, and the bielliptic Manin–Mumford case as the genus-two instance of the first theorem. No statable headline is absent and none is forced through a stand-in.

`lake env lean` on `packages/HeightsRationalPointsAndObstructionsPartII/Suggested.lean` from the content checkout: exit 0 in 7 s, exactly three warnings, "declaration uses `sorry`" at lines 57, 75 and 96. The `TauCeti.AlgebraicGeometry.AbelianVariety.Albanese` object file was present; no build was needed. Imports: `import Mathlib` and that one `TauCeti.*` module. No `lemma`, `set_option`, `#print`, `#eval`, `True` placeholder or sorry'd data.

Signatures: a scratch copy with `#check @` for each of the three theorems elaborated; each type keeps `[Field F] [IsAlgClosed F] [CharZero F]` (or `[NumberField F]`), `[Smooth X.hom] [IsProper X.hom] [GeometricallyIntegral X.hom]`, `topologicalKrullDim X.left = 1`, `IsAlbanese x₀ a`, `J.dim = ↑g`, and the translation/rank data, with `∃ B` before `∀ F`; nothing was lost, and nothing changed since round 4 (the Lean file is byte-identical to the previous head).

Padding: a scratch copy replaced each `sorry` by `first | (simp; done) | (rfl; done) | (infer_instance; done) | (exact?; done) | sorry`; all three declarations still report "declaration uses `sorry`" and no `exact?` suggestion was emitted, so none closes in one tactic. None restates a definition, mirrors a Check or computes a value.

## Not verifiable

- **remond-2000-decompte** and **david-philippon-2007**: settled uncertified; cited by locator with GGK's restatements, as before. No request made.
- **remond-2000-vojta, explicit constants of §5.4's route** (c₁ = c₂ = max(deg X, (6m)^{2m})^{m^{3m²}}, c₃): the Numdam extraction at line 187 through line 232 drops every displayed formula, so Théorème 1.1's hypotheses and Théorème 1.2's values could not be read; only the statement's shape (narrow cone, growing norms, some xᵢ in Z_X) was checked. The roadmap cites GGK Theorem A.1 beside it, which was read.
- **Wazir 2006** (gh-2019 reference 54, the Moriwaki Silverman–Tate used in Theorem A.3's proof): not in the manifest and not needed to settle the gap, whose supplier side is the board design read above; its own polarization hypothesis was not checked.
- Ownership against open pull requests outside the service's index of 367 was not checked.

## Source issues

- **Misprint** in david-philippon-2002 at §1 (definition of X°), printed p. 640, line 72–74: the source says X° removes translates of abelian subvarieties of dimension greater than one; it should be dimension at least one (positive-dimensional), as the minima μ°ⱼ and Théorème 1.2 require; affects nothing.
- **Misprint** in ggk-2026 at Theorem 1.3, printed p. 192, line 166: the source says the two constants are c₃ = c₃(g, d) and c₃ = c₃(g, d); it should name the second c₄ = c₄(g, d), the one appearing in (1.4); affects nothing.
- **Misprint** in yuan-2026 at Theorem 1.1, printed p. 5, line 153–156: the source says the pair (C_K̄, α) is non-isotrivial when it is not the base change from k to K of a pair over k; it should say from the algebraic closure of k (equivalently a pair over k̄), as §4.3.2 line 2467 and Theorem 4.10's definition at line 2762 use: a constant curve over k̄ not descending to k, with constant α, has infinitely many height-zero points; affects a stated result in its literal reading only, and the roadmap uses the corrected form.
- **Gap** in xy-2022 at Proposition 5.4, printed p. 25, line 972: the source says every torsion point t off the jump locus gives height-zero fibre components; its proof at line 996 only treats torsion multisections of order prime to the characteristic (needed for the étale multisection); affects the proof, not the main theorem, since prime-to-p torsion off the jump locus is dense, which is what §5.3 uses and what the roadmap's §9.17 states.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6536723", "job": "REV-PKG-HeightsRationalPointsAndObstructionsPartII~5", "model": "fable", "worker": "fable-rev138"} -->
