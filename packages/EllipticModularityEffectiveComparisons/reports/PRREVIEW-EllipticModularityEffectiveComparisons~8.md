# Review of EllipticModularityEffectiveComparisons (pull request #1810 at 1c8a2cc)

**Verdict:** rejected

This is an incremental re-review of the 38 lines changed since `aa5fb55` (19 insertions, 19 deletions, all in `README.md`; `Suggested.lean` is byte-identical). The change re-points 18 source locators from page breaks and headers to the cited lines and replaces the §4.18 locator by a supplier citation. Every re-pointed locator was read at its lines and is correct, so the previous review's R02 and R03 are repaired. The gate passes, the dependency check reports 0 problems, and elaboration gives exactly the 14 `sorry` warnings of the previous review. The one finding is the one carried from every review since r1: the folder plans again what EllipticCurveModularityPartII, open and earlier in the merge order, already plans. The repair report for this head answered it again without a change.

## R01 (P1) — Re-plans EllipticCurveModularityPartII, an open roadmap earlier in the merge order

Re-raised: H01 (GATE-EllipticModularityEffectiveComparisons~7; also GATE~6 and GATE~5).

**Location.** `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md`, Layers 0–5, and `Suggested.lean` lines 49–269. README line 1696 concedes it: "cites EllipticCurveModularityPartII, which plans the same results under its own layer numbering, as their supplier".

**Claim.** Every layer and every Lean headline here has a counterpart in EllipticCurveModularityPartII: Martin's formula and sharp bound; the removed-prime bound; Kraus's thresholds, congruences and realizations; the Mazur–Kenku classifications and the two irreducibility bounds; the Cartan results and Lemos's theorem; the `GeometricTorsion` carrier; and `gap:modular-rank-zero` restates its §6.0e.

**Witness.** EllipticCurveModularityPartII is still open, now at head 9bc95b1f (it moved since the previous review), and still earlier in the board's order (272 against 282). Its README line 7 reads "this Part II owns the six comparison layers below". Its `martin_bound` (`Suggested.lean` line 99) and `GeometricTorsion` (line 177) match this folder's lines 84–86 and 149–150, and its §6.0e heading is at README line 694.

**Why the settled reason fails.** GATE~7 answers: "The duplication still holds at the current heads. The review itself states that no repair inside this folder exists." That is a reason the finding is unrepairable from a repair job, not a reason it is wrong, and "edits cannot repair it" is exactly the definition of the `rejected` verdict. The binding rule remains: what another roadmap plans is imported, never planned again, and an object two roadmaps own is settled with one owner earlier in the order. The citation facts at the current heads (`roadmaps grep --fixed --readme-only`, README hits per roadmap):

| Roadmap | cites EllipticCurveModularityPartII | cites this folder |
| --- | --- | --- |
| ErdosProgressionPowers (#1336) | 17 | 0 |
| FaltingsFinitenessAndIsogenyTheoremsPartII (#1738) | 10 | 0 |
| RankOneConverse (#1805) | 8 | 0 |
| EllipticCurvePeriodsAndModularParametrizations (#1715) | 6 | 0 |
| KatoEulerSystems (#1804) | 5 | 0 |
| AdelicImagesAndModularCurves (#1727) | 1 | 0 |
| nine further roadmaps | 1–2 each | 0 |

Three roadmaps name this folder (ModularSymbolsPadicLFunctions line 2695, FaltingsFinitenessAndIsogenyTheorems line 2928, ImaginaryQuadraticClassNumber line 199), each in a list of consumers of their own results, none as the supplier of a comparison theorem.

**Repair.** None inside this folder. A human chooses one of the two options of the previous review: close #1810 (the consumers and the merge order already point at the sibling), or close #1491 and keep this folder, re-pointing the six consumers to the counterparts listed at README line 1696 and giving owners to the sibling's §1.8 majorants, §6.0f minimal period subvariety and §6.0e rank-zero theorem.

**Tested on the instance.** The duplication test is the table above: the sibling is cited as owner 17, 10, 8, 6, 5 and 1 times by the six consumers, this folder 0 times, and the sibling's definitions at `Suggested.lean` lines 99 and 177 are the same bodies as this folder's.

## Previous findings

- R01 — not repaired: GATE~7 answered "The duplication still holds at the current heads" and committed no change to Layers 0–5 or the Lean; the sibling is open at 9bc95b1f. Raised again above.
- R02 — repaired: §1.1 now reads "(bennett-siksek-2020, proof of Lemma 2.2, p.359, bennett-siksek-2020 lines 198–203, where the nonvanishing of α is used to bound ℓ by the norm but is not stated; this subsection supplies it.)" Lines 198–203 are the congruence, the norm divisibility and the bound, as the finding described.
- R03 — repaired: §4.18 now cites "(EllipticCurves Layer 1, the quotient by a finite Galois-stable subgroup; Layer 2, the structure of E[N] over a separably closed field.)" and §4.21 "(bennett-siksek-2020, proof of Lemma 3.5, p.363, bennett-siksek-2020 lines 334–335.)". EllipticCurves on main has "The structure of `E[N]`" over a separably closed field at README line 649; lines 334–335 of the source state exactly the §4.21 conclusion.

## Verified sound

**Gate, dependency check and elaboration.**
- The worker's gate at this head reports every check at 0, build included, and `OK`.
- Dependency check (`--movable`, board order, content checkout):

      depcheck: 237 roadmaps, 2341 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean` at the manifest pins exits 0 with exactly 14 "declaration uses `sorry`" warnings, at lines 79, 84, 93, 104, 118, 135, 182, 188, 194, 201, 238, 246, 256 and 265, the same as the previous review; the file is byte-identical to `aa5fb55` (`git diff --stat` shows README only). The previous review's `#check @name` pass over the 24 declarations and its one-tactic probe therefore stand; the worker's `signatures.md` again lists 24 declarations with 0 dropped binders.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**The 19 changed locators, each read at its lines in the cache** (page markers checked against the printed page named):
- §0.4: martin-2003 lines 452–479 define λ=μ∗μ with λ(p)=−2, λ(p²)=1, λ(p^α)=0 for α≥3 (line 454), state (16), and identify the five convolved terms (463–479); printed p.9.
- §0.7: line 773 is Corollary 18, 12g₀⁺(N,2)≤φ(N)+7·2^ω(N)+12, on p.15 (marker at 771).
- §0.14: line 823 is Lemma 22 (p.15); lines 834–835 close its proof with the direct calculation for N<1548 (p.16, marker at 824). The README's "pp.15–16" and "lines 823 and 834–835" are exact.
- §1.1: lines 198–203 (p.359): p∤M₀, λ∣(p+1∓c_p), ℓ∣Norm, ℓ≤(√p+1)^(2[K:ℚ]). The nonvanishing is indeed not stated.
- §1.3: lines 202–203 give the bound by 2√p in every real embedding and the norm bound.
- §1.5: lines 204–207 give [K:ℚ]≤g₀⁺(M₀) and Martin's (4).
- §1.6: lines 184–197 are Theorem 3, Lemma 2.1(ii) and Lemma 2.2 (pp.358–359; page-5 marker at 176).
- §3.3: kraus-1997 lines 321–337 (p.1145, page-7 marker at 301): l∤N(ρ_p); g₀⁺≥1 gives I/6<F, so l≠p.
- §3.4: lines 342–363 (p.1145): K totally real of degree ≤g₀⁺, |σ(a_l)|≤2√l, |a_l(E)|≤2√l, a_l≠a_l(E) and ≠±(l+1) since a_l∉ℤ, hence the norm bound (√l+1)^(2g₀⁺).
- §3.5: lines 307–373 are the whole proof of Théorème 3 (p.1145).
- §3.9: lines 1146–1173 (p.1160, page-22 marker at 1144) are the six local filters (i)–(vi), F and G at level M, and the congruence through index I(M)/6. The §8.1 statement and setup are on p.1159, so "pp.1159–1160" is right for the section.
- §3.12: lines 397–408 (p.1146, marker at 384): (10) l≤I(M)/6 and p>G give l≠p.
- §3.18: lines 200–212 (p.1143, marker at 198): conditions (a)–(c) and, for p≥11, (c) ⇔ semistable at p with p∣ord_p(Δ_min).
- §4.16: banwait-najman-padurariu lines 228–274 (pp.5–6, marker at 256): Mazur's strategy, Lemma 2.1 (composite minimal levels supported on {2,3,5,7,13}, list at Mazur p.131), Mazur's X₀(p)(ℚ), Lemma 2.2.
- §4.21: bennett-siksek-2020 lines 334–335 (p.363, marker at 329).
- §4.22: lines 294–295 (p.362, marker at 292) are the proof of Lemma 3.3 (stated at 287–289 on p.361): full 2-torsion and ℓ≥7 give irreducibility by Mazur.
- §5.11: darmon-merel lines 640–666 (author-version pp.20–21, footer "20" at line 654): e, e_A, I_e, A_e, and L(f,1)=2πi∫₀^{i∞}f(τ)dτ=⟨f,e_A⟩≠0 for f in S_{I_e}.
- §5.22: lemos-2017 lines 249–260 (p.7, marker at 247): t∈ℤ divides the constant term, and the five sets S_r∩ℤ.

**Seeded sample.** Of the fifteen seeded targets, §0.14 and §4.18 fall in the changed passages and are checked above and in the table. The other thirteen (0.13, 0.15, 1.2, 3.2, 4.2, 4.3, 4.4, 4.14, 5.10, 5.16, 5.20, 5.24, 5.25a) are untouched text that the previous reviews passed and were not re-read, as an incremental re-review prescribes.

**Cross-roadmap citations the changed passages mention, resolved now.**
- EllipticCurves on main: Layer 1 (line 423) and "The structure of `E[N]`" over a separably closed field (line 649), cited by §4.18.
- ArithmeticGaloisRepresentations (open, at its head via `roadmaps show`): §§6.1–6.4 at lines 3945, 4141, 4184 and 4287, cited by §4.18's `*Needs:*` line.
- SerreWeightAndLevelOptimisation §6.1 (§§1.6, 3.18) and the gap slugs `gap:optimized-elliptic-weight-two` (§3.5) and `gap:weight-two-local-reduction` (§3.18) are unchanged from the previous review, which resolved them at lines 1368–1418 of that roadmap's head and against `design/plan.json`.
- The worker's `citations.md` lists no cross-roadmap citation and no Lean name found nowhere; `overlaps.md` lists no open pull request changing this roadmap and no dropped id in either direction.

**Ownership against open work.** Checked against the sibling checkouts the brief lists and `roadmaps grep` over every open head: the only second owner is EllipticCurveModularityPartII (R01). Nothing in the changed lines adds an object.

**Adversarial pass.** Rows for the changed statements carry values computed in this review; rows for untouched statements are carried from the previous report (PRREVIEW~7), whose values were not recomputed.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.4 λ₀=μ∗μ (changed locator) | p^a for p=2,3, a=0..3 | λ₀: 1, −2, 1, 0 at 1, 2, 4, 8 and at 1, 3, 9, 27; source line 454 gives −2, 1, 0 | sound | none |
| §0.7 Corollary 18 (changed locator) | N=11, 35, 86, 129, 1542, 1546, 1547 | 12·martinValue = 12, 36, 48, 84, 516, 768, 1140 against φ+7·2^ω+12 = 36, 64, 82, 124, 580, 812, 1220 | sound | none |
| §0.14 Lemma 22 (changed locator) | N=86, 129, 258, 1542, 1546 (gcd(N,6)>1, a prime factor >41, N<1548) | 12·martinValue = 48, 84, 84, 516, 768 ≤ N; at 1548 itself the source's N/12−(N/1548−1) bound is 129 and 12·martinValue(1548)=204≤1548 | sound | none |
| §1.1 α≠0 (changed locator) | p=2, c=2√2; p=1, c=2 | α=3−2√2≈0.17; α=0 at the excluded p=1 (PRREVIEW~7) | sound | none |
| §1.3 norm bound (changed locator) | c=100−70√2, p=2, s=1 | Norm(3−c)=−391, bound (√2+1)⁴≈33.97, so the hypothesis |σ(c)|≤2√2 fails for σ(c)≈198.995, as it must (PRREVIEW~7) | sound | none |
| §1.5 real power (changed locator) | d=2, p=2, L=23 (12g(23)=24=L+1) | (√2+1)⁴≈33.97 = (√2+1)^(24/6); d=1, L=11: (√2+1)²≈5.83 = (√2+1)^(12/6) | sound | none |
| §1.6 exponent bound (changed locator) | M₀=11, p=2 and p=3 | (√2+1)²≈5.83 forces ℓ∈{3,5}; (√3+1)²≈7.46 forces ℓ∈{3,5,7} | sound | none |
| §3.3 B<F (changed locator) | N=11 | I=12, B=2, g=1, F=(√2+1)²≈5.83>2; N=23: I=24, B=4, g=2, F=(√4+1)⁴=81>4 | sound | none |
| §3.4 norm of a_q−b (changed locator) | level 23, q=2, b=−2 (11a) | a₂=(−1±√5)/2, b−a₂=(−3∓√5)/2, norm (9−5)/4=1≤(√2+1)⁴ | sound | none |
| §3.5 K_f=ℚ above F (changed locator) | N=11, ℓ=7 | F(11)≈5.83<7; the unique newform 11a has K_f=ℚ | sound | none |
| §3.9 filtered congruence (changed locator) | N=11, M=44, q=2 (i=0) and q=11 (i=1) | V₂=1−a₂R₂+2R₄ and V′₂=1 (row (i)); V₁₁=1, V′₁₁=1−(12−a₁₁)R₁₁ (row (v)), as at lines 1149 and 1153 | sound | none |
| §3.12 B<G (changed locator) | N=11 | I(44)=72, B=12, G=(√12+1)²≈19.93>12 | sound | none |
| §3.18 adapter (changed locator) | ℓ=11, E semistable at 11 with 11∣v₁₁(Δ) | source line 210–212: (c) ⇔ that condition for p≥11; at ℓ=5,7 the README keeps the reduction alternative | sound | none |
| §4.16 composite exclusion (changed locator) | d=26, 35, 50 | 2·13, 5·7, 2·5² are supported on {2,3,5,7,13} (line 251); proper divisors 2, 13; 5, 7; 2, 5, 10, 25 all have genus 0, and X₀(26), X₀(35), X₀(50) have genus 2, 3, 2 | sound | none |
| §4.18 2ℓ-isogeny (new citation) | ℓ=3, 11 | ⟨P⟩⊕L≅ℤ/6, ℤ/22, cyclic and Galois-stable; EllipticCurves line 649 gives E[N]≅(ℤ/N)² over a separably closed field with char∤N, line 423 the quotient | sound | none |
| §4.21 (changed locator) | ℓ=7, 11 | 22∉{1..19,21,25,27,37,43,67,163}; 14∈ it, so the cutoff is 11 (PRREVIEW~7) | sound | none |
| §4.22 (changed locator) | ℓ=3, 5, 7 | 20, 28 absent; order-3 point (4,36) on y²=x(x+5)(x+32) at ℓ=3 (PRREVIEW~7) | sound | none |
| §5.11 periods (changed locator) | f with L(f,1)=L | source: L(f,1)=2πi∫₀^{i∞}f dτ, so ∫₀^{i∞}f dτ=−iL/(2π); the README's oriented path (i∞ to 0) gives iL/(2π), and 2πi·iL/(2π)=−L, the stated oriented period | sound | none |
| §5.22 integral j-sets (changed locator) | r=2,3,5,7,13 | signed divisors 26, 14, 8, 6, 4; distinct j 25, 13, 8, 6, 4; J₁₃={−39091613782464, 576, 2101248, 2045023375454208} (PRREVIEW~7), matching line 260 (−2⁶·3²·4079³, 2⁶·3², 2¹²·3³·19, 2¹²·3³·19·991³) | sound | none |
| `martin_dimension_formula` (§0.5) | N=1,2,11,23,30,35,37,64 | martinValue 0,0,1,2,1,3,2,1 = newspace dimensions (PRREVIEW~7) | sound | none |
| `martin_sharp_bound` (§0.16) | 1≤N≤4000 | no 12·martinValue(N)>N+1; equality set {35}∪{primes ≡11 mod 12} (PRREVIEW~7) | sound | none |
| §0.1 Checks | (2,2),(3,2),(2,3) | (1/4,0,−1,1,0), (5/9,1,1,−1,0), (3/8,0,1,0,0) (PRREVIEW~7) | sound | none |
| §0.8 | p=2..13 | 12·martinValue = 0,0,0,0,12,0 vs p+1 (PRREVIEW~7) | sound | none |
| `newform_integral_of_small_primes` (§3.1) | N=11, 23 | 11a integral; level 23 has a₂∉ℤ (PRREVIEW~7) | sound | none |
| `integral_ideal_sturm` (§3.7a) | N=4,k=2,J=4ℤ; N=1,k=0 | 12n≤12 tests n≤1, a₁=1∉4ℤ; Sturm's 5/6 would test only a₀ (PRREVIEW~7) | sound | none |
| `kraus_prime_power_congruence` (§3.10) | N=11,P=2ℤ,m=2 | good {3,5,7}, bad {11}; a₃−4=−5∉4ℤ (PRREVIEW~7) | sound | none |
| §3.7, §3.8, §3.13 | as in PRREVIEW~7 | Kraus rows (i),(iii),(v),(vi); σ₁(3)=4, σ₁(9)=13; G(11)≈19.93, gaps ≤10.58 and ≤13.29 (PRREVIEW~7) | sound | none |
| `four_divisible_isogeny_realization` (§3.16) | y²=x(x²+3x+1); y²=x(x²+2) | quotient has four rational 2-torsion points; #E(𝔽₅)=2 fails the hypothesis (PRREVIEW~7) | sound | none |
| `GeometricTorsion`, `torsionRepresentation`, `CyclicIsogenyDegree` (§4.0) | n=2 on x³−x+1, x³−2x; degree 0; [2] | S₃ irreducible; ℚ(√2) reducible; `degree_pos` excludes 0; [2] has kernel (ℤ/2)² (PRREVIEW~7) | sound | none |
| `prime_cyclic_isogeny_degrees` (§4.7) | r=23,29,37 | cusps only; two j-values at 37 (PRREVIEW~7) | sound | none |
| §4.2, §4.4, §4.5, §§4.10/4.12, §4.19 | as in PRREVIEW~7 | 1+3¹²=531442 differences; q=5 prime set; {2,3,5,11,17}; genus 3 and 7; cyclic kernel of order 4 (PRREVIEW~7) | sound | none |
| §5.0 predicates, `split_normalizer_exclusion` (§5.7), `proper_image_nonsplit` (§5.8), `cyclic_isogeny_integral_j` (§5.18), `lemos_uniform_surjectivity` (§5.28) | as in PRREVIEW~7 | order-4 automorphism; 200∤240 at p=11; p>11, p≠13; (41−1)/4=10>5; j=1728 nonsplit at 11; 11a1 excluded (PRREVIEW~7) | sound | none |
| §5.3a, §5.10, §5.16, §5.24, §5.4a, Conventions, §1.3 example | as in PRREVIEW~7 | 9 702 250 000 000; |N_ns B⁺|=13200; 35φ(P)=0; involution g↦ψ₀(det g)g; H₋₅₁≡(X−8)² mod 17; #E=5, a₂=−2 (PRREVIEW~7) | sound | none |
| Sibling vs here (R01) | definition and theorem pairs | bodies identical at sibling `Suggested.lean` lines 99 and 177 (moved from 96–98 and 174–175 at the previous head) | duplicate | R01 |

**Declared gaps.** The README's eight slugs equal `design/plan.json`'s, unchanged since the previous review; the changed lines touch only the citations of `gap:optimized-elliptic-weight-two` (§3.5) and `gap:weight-two-local-reduction` (§3.18), both still stated under `## Exact supplier contracts` with their suppliers.

## Not verifiable

- kenku-1982 (§4.16, pp.199–201) is settled as uncertified; banwait-najman-padurariu lines 228–274 and mazur-1978 lines 97–105 were read in its place.
- Martin's direct calculation for N<1548 (line 834–835) was rerun only at the five sampled levels above and at the full range 1≤N≤4000 of the previous review.

## Source issues

- **Gap** in bennett-siksek-2020 at proof of Lemma 2.2, printed page 359: the source says ℓ divides Norm(p+1∓c_p) and then bounds ℓ by that norm; it should note the norm is nonzero, since |σ(c_p)|≤2√p<p+1 in every embedding; affects nothing.
