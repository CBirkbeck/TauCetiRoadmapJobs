# Review of ImaginaryQuadraticClassNumber (pull request #2593 at 11adb83)

**Verdict:** accepted

**Summary.** Accepted, with one format note and no finding. Complex uniformisation is now consumed from ModularForms §10D and ModularCurvesPartII §1.1, both on main, and the consumed statements match those sections as written. The new Shin locators are each correct at the cited theorem and page. The former numbering is mapped, and the passages about an effective Siegel bound no longer vouch for it. The format note concerns the old §3.1 heading anchor, which two open roadmaps still link to. One fact about AnalyticNumberTheoryPartI and one about two owners on main are left for the human reviewers.

## N01 — Eleven links to the old §3.1 anchor in two open roadmaps will land at the top of the README

The links point to `#h31-modular-functions-and-the-imaginary-quadratic-cm-dictionary`:
- ArithmeticStatisticsPartVII, README line 2518 (one link);
- ComplexMultiplicationAndExplicitReciprocity, README lines 131, 428, 480, 552, 592, 614, 618, 622, 644 and 673 (ten links).

Convention 9 maps the labels and the description states that the anchors change, so nothing is wrong. Either of two small edits would keep the links working:
- in this README, an inline anchor with the old id placed just before the heading `### 3.1` (line 634);
- in those two roadmaps, updating their links to the new anchor.

## Previous findings

- R01 — repaired: §3.1, lines 685–691: "The uniformization itself is ModularForms §10D, consumed here: … ModularCurvesPartII §1.1, also consumed here, makes the same map a pointed biholomorphism … No part of the uniformization is a target of this roadmap." The Summary, Scope, Needs and supplier contracts were changed to match.
- C01 — repaired: Convention 9 (lines 99–102) maps H1.1–H3.6 and H1–H3 to the new sections, and the description now says the heading anchors change (the remaining links are N01).
- C02 — repaired: Scope, line 1127: "No effective form of the bounds of §2.4 is stated here, and no statement here rests on one." The Summary (line 30) now says only that AnalyticNumberTheoryPartI "takes the same formula from the second layer".
- C03 — repaired: line 701: "(Shin, §2: the group `W_(N,τ_K)`, p. 4, and Proposition 2.5, p. 5)"; References lines 1316–1318 agree.
- C04 — repaired: locators added at lines 651–652, 768–777 and 781 (Shin §2 pp. 2–3, Propositions 2.1, 2.3(i), 2.3(ii), 2.3(vi), Remark 2.2, Lemma 4.1(ii)).
- N01 (previous) — repaired: line 399 now carries "(Davenport, Chapter 6)" at the definition of `χ_D`, and the sentence about no second predicate (line 417) has no locator.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §3.1 consumed §10D: homogeneity `℘_(αΛ)(αu) = α⁻²℘_Λ(u)` | Λ = ℤ[i], u = 0.3+0.1i, α = 2 and α = i | ℘_(2Λ)(2u) = 2.18634−1.35123i = ℘_Λ(u)/4; ℘(iu) = −8.74537+5.40494i = −℘(u) | agree | none |
| §3.1 consumed §10D: isomorphisms are homotheties, unique α | Λ = ℤ[i], α = i, −1 | u ↦ iu gives (x,y) ↦ (−x, iy); α = −1 gives (x,−y); distinct automorphisms of y² = x³ − (g₂/4)x | agree | none |
| ModularForms contract: `E_Λ : y² = x³ − (g₂/4)x − g₃/4` is Tau Ceti's `PeriodPair.weierstrassCurve` | Λ = ℤ[i], u as above | a₄ = −g₂/4, a₆ = −g₃/4 (Uniformization.lean:149–154); g₂ = 189.0725, g₃ ≈ 0; (℘′/2)² = −510.963−826.756i = ℘³ − g₂℘/4 | agree | none |
| ModularCurvesPartII contract: pointed biholomorphism `ℂ/Λ ≅ E_Λ^an` with group law | MCPII §1.1 on main, lines 395–399 | §1.1: `[℘:℘′/2:1]`, lattice ↦ O, descends to pointed biholomorphism, intertwines addition | agree | none |
| ModularForms contract: every curve over ℂ is some `E_Λ`, Λ = ℤ + ℤz | §10D on main, lines 1326–1333 | §10D: Λ = Λ_z, z ∈ ℍ, by j(z) = j(E) and variable change | agree | none |
| §3.2 q-order locator, Shin Prop. 2.3(i), p. 3 | g₀, g₁, g₂ | shin2010 lines 138–139 on p. 3: ord = B₂(⟨r₁⟩)/2; values 1/12, −1/24, −1/24, sum 0 | agree | none |
| §3.2 transformation-law locator, Prop. 2.3(ii), p. 4, "c > 0" | hypothesis as printed | shin2010 lines 142–148, p. 4: γ ∈ SL₂(ℤ) with c > 0; index r ↦ (r₁a+r₂c, r₁b+r₂d) = rγ | agree | none |
| §3.2 exponent, Remark 2.2, p. 3 | N = 2, 3, 6, 8 | 12N/gcd(6,N) = 12, 12, 12, 48; shin2010 lines 121–130 on p. 3 | agree | none |
| §3.2 criterion and integrality, Prop. 2.1 p. 3, Prop. 2.3(vi) p. 4 | locators | shin2010 lines 101–119 (p. 3), line 177 (p. 4) | agree | none |
| §3.2 `γ₂` locator, Lemma 4.1(ii), p. 12 | the three `g_i` | shin2010 lines 707–726 on p. 12: (g_i¹²+16)/g_i⁴ for i = 0, 1, 2; at τ = i: 24/2 = 12 = −48/−4 | agree | none |
| §3.1 reciprocity locator, `W_(N,τ_K)` p. 4, Prop. 2.5 p. 5 | D = −3 kernel matrices | lines 193–199 (p. 4), 206–251 (p. 5); det of printed [[−1,−3],[1,−2]] = 5; [[1,−3],[1,−2]], [[−2,3],[−1,1]] det 1 | agree; source misprint | source issue |
| §3.3 small-power locator, Theorem 4.8, p. 15 | hypotheses | shin2010 lines 957–962: 2 inert, 3 unramified; ζ₈g₀(τ_K) real integer generating K_(2)/H_K; γ₂(τ_K) generates H_K/K | agree with README hypotheses | none |
| §3.1 F_N action locator, §2 pp. 2–3 | diag(1,d) | shin2010 lines 73–95: α = α₁α₂, α₂ acts by σ_d: ζ_N ↦ ζ_N^d on coefficients; [F₂:F₁] = 6 | agree | none |
| Scope: "no statement here rests on" an effective §2.4 bound | §3.4 constants | 2e^(−π√31/12) = 0.46557: explicit Siegel-function estimate, not an L(1,χ) lower bound | true | none |
| Downstream: AnalyticNumberTheoryPartI "§2.2 only" | its line 75 on main | "Nothing from H2.3–H2.4 is consumed" | agree | none |
| Downstream: EffectiveClassNumbers "Goldfeld's type" | its README at open head, lines 5, 212 | Layer 1 "Goldfeld's effective analytic principle", Oesterlé form C·h ≥ m·log d | agree | none |
| Convention 9 mapping | H3.1, H2.4 | headings `### 3.1 Modular functions …`, `### 2.4 Siegel lower bound …` exist; anchors now `#31-…`, `#24-…` | labels resolve; anchors N01 | N01 |

Rows for the statements the diff does not touch (the six `Suggested.lean` headlines and the Checks of §§1.1–3.6) stand as in the previous review, of `2592125`. `Suggested.lean` is byte-identical between `2592125` and this head.

- Source locators checked in shin2010: 11 changed or added. These are §2 pp. 2–3; Propositions 2.1, 2.3(i), 2.3(ii), 2.3(vi) and 2.5; Remark 2.2; the group `W_(N,τ_K)`; Lemma 4.1(ii); Theorem 4.8. The References bullet was also checked. All are correct at theorem and page.
- Library opened at the Tau Ceti pin: `Analysis/SpecialFunctions/Elliptic/Uniformization.lean`, lines 149–154 (`weierstrassCurve`) and lines 112–538 (declaration list). There is no group isomorphism `ℂ/Λ ≅ E(ℂ)` at the pin, so citing §10D is correct.
- Cross-roadmap citations resolved on main:
  - ModularForms §10D (lines 1313–1345);
  - ModularCurvesPartII §1.1 (lines 393–419) and §1.2 (lines 421–443);
  - AnalyticNumberTheoryPartI (lines 19, 73–75, 290, 1568, 3474).
  Neither ModularForms nor ModularCurvesPartII cites this roadmap.
- Consumers of §3.1 were checked for any use of the uniformisation that was dropped as a target: ArithmeticStatisticsPartVII, ComplexMultiplicationAndExplicitReciprocity, GrossZagierAndArithmeticHeights, EllipticCurvePeriodsAndModularParametrizations and EffectiveClassNumbers. All cite §3.1 for the CM dictionary and reciprocity only.
- Automatic checks, rerun on this head: every check passes. The dependency check gives `depcheck: 194 roadmaps, 2160 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. No path outside the folder changed.
- Lean: `lake env lean` on `Suggested.lean` gives exactly six `sorry` warnings and no errors.
- Pull-request text: checked against this head. It states the new supplier ModularCurvesPartII, the dropped converse construction, Convention 9 and the anchor change, and no sentence is contradicted.

Overlap check: read on main ModularForms (§10D), ModularCurvesPartII (§§1.1–1.3) and AnalyticNumberTheoryPartI (scope and supplier contract). Read EffectiveClassNumbers and EllipticPeriods at their open heads. The other closest roadmaps (QuadraticCharactersAndReduction, IntegralLattices, ComplexMultiplicationAndExplicitReciprocity, MultiquadraticPartII) stand as in the previous review: the change touches none of their objects. Ownership of each shared object:
- Complex uniformisation: owned by ModularForms §10D, with the analytic form owned by ModularCurvesPartII §1.1. Both are now consumed here, and EllipticPeriods consumes them too.
- Siegel's ineffective bound: owned here.
- Effective Goldfeld-type bounds: owned by EffectiveClassNumbers.
- The class-number formula: owned here (§2.2) and consumed by AnalyticNumberTheoryPartI.

Source independence: changed passages only. 10 passages were compared: §3.1 (the F_N action and reciprocity), the five §3.2 bullets, the `γ₂` paragraph, the §3.3 small-power sentence, the References entry and the new supplier contracts. They were compared with 1 source (shin2010) and with the two cited roadmaps. The longest shared run is a forced formula phrase of 4 words ("generates K(2) over HK"). The largest share of the literary locators is shin2010, 14 of 23 (Davenport 4, Stark 3, Cox 2). No layer was added, removed or reordered, so the comparison of contents stands as in the previous review: independent.

Research link: The headlines are Siegel's theorem (1935) and the Heegner–Stark class-number-one theorem (Heegner 1952; Stark 1967, 1969), proved by Shin's route (arXiv 1009.2253). Consumers include EffectiveClassNumbers (Goldfeld–Gross–Zagier bounds) and ComplexMultiplicationAndExplicitReciprocity. This rests on the README's References, its Downstream consumers list, and shin2010 lines 61–66.

## Not verifiable

- davenport1980, Chapter 6 (§2.1, line 399, moved locator): settled as uncertified. Not opened.
- stark1969 (§3.3, line 814): settled as uncertified. Not opened.
- Cox, *Primes of the Form x² + ny²*, and Stark 1967: as in the previous review, no legal open copy. Untouched by this change.

## Source issues

- **Misprint** in shin2010 at Proposition 2.5, p. 5 (arXiv v6): the source lists ±[[−1, −3], [1, −2]] in the kernel for ℚ(√−3), a matrix of determinant 5; it should be ±[[1, −3], [1, −2]], the multiplication matrix of the unit τ_K − 2 = (−1 + √−3)/2; affects nothing.

## For the human reviewers

- AnalyticNumberTheoryPartI on main states unconditionally an effective constant c_LS with (1 − β) log q ≥ c_LS for every real zero (line 19, §0.34), which is the open Landau–Siegel problem. Its lines 75 and 3474 say the effective forms of this roadmap's §§2.3–2.4 follow from it. This README no longer describes or relies on that statement (line 1127).
- Two roadmaps on main state the group isomorphism ℂ/Λ ≅ E_Λ(ℂ) given by the Weierstrass point map: ModularForms §10D (lines 1326–1330) and ModularCurvesPartII §§1.1–1.2 (lines 393–425). This README consumes both (lines 685–691).
