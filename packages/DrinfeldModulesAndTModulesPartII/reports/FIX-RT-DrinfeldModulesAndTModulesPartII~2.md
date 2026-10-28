# FIX-RT-DrinfeldModulesAndTModulesPartII~2

Two reviews were merged: review r2a (findings F01 to F03, the first three sections below) and review r2b (findings F01 and F02, the last two). None of the findings overlap, so each is settled separately below.

## F01 (P3) — applied

§3.10 Checks. Old: “For s_1 = (1, 2) and s_2 = (3), I = {∅, (1)}” and “… I = {∅, (1), (1, 1)}, the prefix (1) being shared”, with the polynomial labels left implicit. New: both Checks now say that every polynomial coordinate is 1 (the Chang–Chen–Mishiba case). A negative control is added: at q = 3 the pairs ((1,1,1);(1,1,1)) and ((1,2);(θ,1)) satisfy the termwise bound (‖θ‖ = 3 < 3^(3/2)) and give |I| = 4, because prefixes merge as pairs. The other §3.10 Checks already state their Q (the single-pair Check carries a general Q; the (1, q − 1) Check says Q = 1).

## F02 (P1) — applied differently

The witness holds. At IKLNDP-NOTE line 1836, the proof for w = 3q − 2 removes (q − 1, q, q − 1) using the fact that ζ_A(2q − 1) and ζ_A(q, q − 1) are not colinear. The Note cites its reference [21] for this (IKLNDP-NOTE line 2154, Le–Ngo Dac), and no target here owned it. Instead of adding a new section, the repair extends the existing §4.7 two-row system from 2 ≤ k ≤ q − 1 to 2 ≤ k ≤ q. The case k = q is exactly the system for (2q − 1) and (q, q − 1), since H_q = H_(q−1) = 1 and H_(2q−1) = θ^q − t.
- §3.1: H_(q+k−1) now holds for 1 < k ≤ q (statement, API bullet, proof route; two parts of degree q would need 2q > n − 1). New Check: at q = 3, α_5 = t³ − θ and H_5 = θ³ − t.
- §4.7: heading changed to “q < w ≤ 2q − 1”. For k = q the only solution is zero. Consequence: for q > 2, ζ_A(2q − 1) and ζ_A(q, q − 1) are K-independent. Proof route added and computed (see the table). New q = 3, w = 5 Check. *Needs* gains §0.5 and §3.5 for the consequence. Locators: IKLNDP-NOTE line 1836 and LND-ZETALIKE Theorem 1.3 (LND-ZETALIKE line 157; i = q, j = 1 violates i ≤ j).
- §5.13: the route now removes (q − 1, q, q − 1) using §2.13 and the k = q case of §4.7. “Corollary 5.1” is now identified as the k = q − 1 case of §4.7. *Needs* gains §2.13.
- The reviewer's derivation was not copied. It was recomputed independently (row form, twist, coefficients); it agrees.
- New manifest entry LND-ZETALIKE, fetched through the sources service from HAL hal-03093398 (open-repository, certified). It is also added to the README References.

## F03 (P3) — applied

§0.11 Checks. Two bullets added:
- c ≠ d: c(4) = 5 against d(4) = 6 at q = 3; c(3) = 1 against d(3) = 2 at q = 2; c(5) = 13 against d(5) = 14 at q = 4.
- t ≠ s: t(5) = 140 against s(5) = 130 at q = 3; t(5) = 756 against s(5) = 750 at q = 4.

All values were recomputed from the recurrences (table below).

## F01 (P3) — applied

§2.5 Check. Old: “ζ_A(q + 1) as a combination of ζ_A(q, 1) (type 1) and indices (1, t) …”. New: the full relation ζ_A(q+1) = −ζ_A(q,1) − ζ_A(2,q−1) − D_1(ζ_A(1,q−1,1) + ζ_A(1,1,q−1) + ζ_A(1,q)). It explains that (2, q−1) comes from Δ^([q−1])_(q,1) = 1, gives the q = 3, d = 0 residual and the q = 2 collapse to ζ_A(3) = D_1ζ_A(1,2), which agrees with §2.9. The pattern was also checked: the Checks in §§2.3, 2.4, 2.9 and 2.10 that involve (q + 1) or C₍₁₎ are consistent.

## F02 (P3) — applied

`Suggested.lean` line 3: “/-!+# Drinfeld modules …” became “/-!” followed by the title line “# Drinfeld modules and t-modules, Part II: target signatures”. No other text changed.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §3.1 H_(q+k−1), k = q | q = 3, n = 5; general q | expansion coefficient 1 + (q−1)γ_1/D_1, Γ_(2q−1) = D_1 (2q−2 = 1·q + (q−2)); α = D_1 − γ_1 = t^q − θ; H = θ^q − t; q = 3: α_5 = θ³−θ+2θ³−2t³ = t³ − θ; deg_θ 3 ≤ 6 | holds; the two-γ_1 term needs degree 2q > 2q−2 |
| §4.7 k = q system | q = 3 (w = 5), q = 4 (w = 7), general q > 2 | degree bound ⌊q(2q−1)/(q−1)⌋ = 2q+1 (q = 3: 7; q = 4: 9); twisted row: θ^(2q+1) coefficient −a, θ^(2q) −b, θ^(2q−1) −c, left side has none of these (2q−1 ≠ q); residual (f+a_1)θ^q − ft^q − a_1t ⇒ f(t^q−t) = 0 ⇒ f = a_1 = a_2 = 0 | only the zero solution; non-Eulerian, as (q−1) ∤ 2q−1 for q > 2 |
| §4.7 k = q, q = 2 | excluded | q = 2: 2q−1 = 3 = q+1, bound 6 gives quotient degree 3 | hypothesis q > 2 is needed and stated |
| §4.7 consequence | q = 3: ζ_A(5), ζ_A(3,2) | I = {∅, (3)}; (LW): 1 and Γ_3ζ_A(3)/π̃³ ≠ 0 (§0.5); Γ_5 = D_1, Γ_3 = Γ_2 = 1 | independent; agrees with LND-ZETALIKE Thm 1.3 (i = 3, j = 1, i > j) |
| §4.7 contrast with §2.13 | q = 3, d = 0 | S_0(5) + D_1S_1(1,4) = 1 + D_1/ℓ_1 = 0 | ζ_A(5) ∝ ζ_A(1,4) but not ∝ ζ_A(3,2): consistent |
| §4.7 existing k = q−1 Check | q = 3, w = 4 | a_1 = t³−t, δ_1 = (t−θ)⁶ still a solution | unchanged |
| §5.13 removal of (q−1,q,q−1) | q = 3, w = 7 | prefix (2), suffixes (5), (1,4), (3,2); (q−1) ∤ 5 forces sum 0; §2.13 merges the first two | coefficient of ζ_A(3,2) forced to 0 |
| §2.5 Check | q = 3, d = 0; q = 2 | 1 + 0 + 0 + D_1ℓ_1⁻¹ = 1 − 1 = 0; q = 2: ζ(3) + 2ζ(2,1) + D_1(2ζ(1,1,1) + ζ(1,2)) = ζ(3) + D_1ζ(1,2) | holds; Δ^([1])_(2,1) = 1, Δ^([2])_(2,1) = 0 at q = 2 |
| §2.5 Δ at q > 2 | j = q−1 | (−1)^(q−1)binom(q−2,q−1) + binom(q−2,0) = 0 + 1 = 1; j = 2q−2 ≥ q+1 is outside the range | single extra term (2, q−1) |
| §0.11 c | q = 2, 3, 4 | q = 2: c ≡ 1; q = 3: 1,1,2,3,5; q = 4: 1,1,2,4,7,13 | 1, 5, 13 against d = 2, 6, 14 |
| §0.11 t, s | q = 3, 4, w = 5 | q = 3: t = 2,6,16,48,140, s(5) = 2(46+16)+6 = 130; q = 4: t(4) = 3·63 = 189, t(5) = 3·252 = 756, s(5) = 3·249+3 = 750 | distinct |
| §3.10 negative control | q = 3 | bound 3^(3/2) ≈ 5.196 > ‖θ‖ = 3; prefixes ((1);(1)) ≠ ((1);(θ)) | |I| = 4, and 3 when Q_(2,1) = 1 |

## Checks run

- `lake env lean packages/DrinfeldModulesAndTModulesPartII/Suggested.lean`: 0 errors, 18 `declaration uses sorry` warnings (the 18 theorems), no other output.
- `#check @name` for all 34 declarations in one scratch file: all elaborate. Only the module docstring changed, so every type is identical to the signatures record and no binder was lost.
- Dependency check (complete output): `depcheck: 56 roadmaps, 643 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.

## Notes for the maintainer

- No Lean name was added, renamed or deleted, and no supplier gap changed. `design/plan.json` and `metadata.toml` are untouched.
- `sources.toml` has one new entry, LND-ZETALIKE (HAL hal-03093398v2, Math. Z. 301 (2022)). When the sources service ran, it also reordered keys inside existing entries; their content is unchanged.
- Ownership: the weight-(2q − 1) separation is a function-field MZV fact. It belongs in this roadmap's §4.7, next to the two-row system it extends. No other roadmap states function-field MZV objects; this was checked in the earlier rounds and is unchanged.
- No suspicious instructions were found in the reviews.
