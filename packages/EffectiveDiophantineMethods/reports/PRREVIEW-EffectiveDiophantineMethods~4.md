# Review of EffectiveDiophantineMethods (pull request #1046 at c3224c8)

**Verdict:** needs changes

Full review. The gate passes at this head; one finding is blocking (R01) and seven are P3. Two of them (R02, R03) come from the new Tau Ceti pin, which now has series evaluation and Strassmann's theorem.

## R01 (P2) — §§4.8, 4.9, 4.11 and 4.12 plan again what AnabelianGeometryAndNonabelianChabauty §§5.6, 5.10 and 5.11 own

**Location:** `TauCetiRoadmap/EffectiveDiophantineMethods/README.md` line 4524 (§4.8): "the p-adic Lie subgroup `Γ̄` has dimension `r₀ := … dim_{ℚ_p} ℚ_p·log_A(Γ)`, and `r₀ ≤ min(r, g)`"; line 4556: "*Needs:* §4.2; Mathlib `Submodule.span`; HeightsRationalPointsAndObstructions Layer 1."

**Claim:** These targets are this roadmap's own; no supplier states them.

**Witness:** #1021 `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md` line 7575 (§5.10: closure Lie algebra = logarithm span, `dim W ≤ r`, annihilator of dimension `g − dim W`), line 7599 (§5.11: rank `< g` gives finiteness), line 7438 (§5.6); line 9019 names this roadmap as their consumer. This README cites only §5.8, §§2.0–2.7, §§6.1–6.8.

**Repair:** Cite, and keep only what differs. In "Scope and ownership" add: "AnabelianGeometryAndNonabelianChabauty §5.10 owns the Mordell–Weil logarithmic span, its dimension bound and its annihilator at a place of good reduction, §5.6 the Strassmann bound on a residue chart, §5.11 classical Chabauty finiteness. §4.8 here keeps the case of an arbitrary prime and an arbitrary finitely generated `Γ ⊆ A(ℚ)` and the finite-index clause (c); §4.9 keeps (b)–(e); §4.11 keeps the index bounds (b)–(e); §4.12 keeps the bound `Σ N_p(I_x̃)` and the bad-reduction case." In §4.8 (a)–(b), §4.9 (a), §4.11 (a) and the first sentence of §4.12 replace the proof by the citation, and add `AnabelianGeometryAndNonabelianChabauty §5.10` to the `*Needs:*` of §§4.8, 4.9, `§5.6` to §4.11, `§§5.10–5.11` to §4.12.

## R02 (P3) — `ED6.seriesValue` restates Tau Ceti's `PowerSeries.evalAt`

**Location:** `TauCetiRoadmap/EffectiveDiophantineMethods/Suggested.lean` lines 188–190: "`def seriesValue {K : Type*} [NormedField K] (f : PowerSeries K) (x : K) : K := ∑' i : ℕ, f.coeff i * x ^ i`".

**Claim:** The definition is needed to make §6.16 statable at the pins.

**Witness:** Tau Ceti at the pin, `TauCeti/RingTheory/PowerSeries/EvalAt.lean` line 96: `evalAt (f : R⟦X⟧) (b : A) : A := ∑' n, coeff n f • b ^ n`. `example … : f.evalAt x = ∑' i, f.coeff i * x ^ i := by simp [PowerSeries.evalAt_def]` elaborates.

**Repair:** Delete `ED6.seriesValue`; add `import TauCeti.RingTheory.PowerSeries.EvalAt`; in `roots_determined_of_truncation` write `analyticOrderAt (fun z : C => G.evalAt z) z` at both places (no `G.map` is needed: `C` is a `ℚ_[p]`-algebra). Tested: the theorem elaborates in that form with `sorry` the only warning. In the README drop `ED6.seriesValue` from §6.16 (lines 7048–7050) and "convergent-series evaluation" from line 471, and name `PowerSeries.evalAt` under "From Mathlib and Tau Ceti"; in the module docstring drop "series evaluation" (line 24).

## R03 (P3) — Strassmann's theorem is cited from a roadmap section although the pin proves it

**Location:** README lines 5324–5325 (§4.26): "RestrictedPowerSeries §2.4 supplies Strassmann's theorem, including arbitrary radius and complete isometric extensions."; line 5345: "*Needs:* RestrictedPowerSeries §2.4 (Strassmann) and §2 (evaluation)".

**Claim:** The supplier of the theorem is a roadmap section.

**Witness:** Tau Ceti at the pin, `TauCeti/RingTheory/PowerSeries/Weierstrass/Strassmann.lean` line 65: `TauCeti.PowerSeries.IsDistinguished.encard_setOf_evalAt_eq_zero_le : IsDistinguished c s f → 0 < c → f.IsRestricted c → {x : L | ‖x‖ ≤ c ∧ f.evalAt x = 0}.encard ≤ s`.

**Repair:** In "Scope and ownership" (after the Weierstrass preparation sentence, line 47) add "Strassmann's bound at any radius and in any complete normed extension is `TauCeti.PowerSeries.IsDistinguished.encard_setOf_evalAt_eq_zero_le` in `TauCeti/RingTheory/PowerSeries/Weierstrass/Strassmann.lean`." In §4.26 write "Tau Ceti `TauCeti.PowerSeries.IsDistinguished.encard_setOf_evalAt_eq_zero_le` supplies Strassmann's theorem …" and put that declaration in the `*Needs:*` of §4.26 in place of "RestrictedPowerSeries §2.4 (Strassmann)".

## R04 (P3) — §§3.10–3.11 use `α`, `n₁`, `n₂`, `n₁′`, `n₂′`, `S^{(φ′)}` without defining them; §3.10's `*Needs:*` omits its supplier

**Location:** README line 3435 (§3.11): "With the notation of two-isogeny-descent-map write `n_i = 2^{e_i}, n_i′ = 2^{e_i′}`. Then `rank E(ℚ) = rank E′(ℚ) = e₁ + e₁′ − 2`."; line 3431 (§3.10): "*Needs:* Mathlib `WeierstrassCurve.Affine.Point`; Mathlib `WeierstrassCurve.Affine.Point.add_some`; §3.8."

**Claim:** §3.10 fixes the notation that §3.11's theorem and both sections' Checks use.

**Witness:** §3.10 (lines 3404–3416) defines none of the six symbols; the first occurrences of `n₁` and `n₂` in the README are lines 3444 and 3395. §3.10 line 3404 uses "HeightsRationalPointsAndObstructions §1.19", absent from its `*Needs:*`.

**Repair:** Add to §3.10: "For a squarefree integer `d₁ ∣ d` write `H(d₁, c, d/d₁) : v² = d₁u⁴ + cu² + d/d₁`. `α : E(ℚ) → ℚ^×/ℚ^{×2}` is the supplier's Kummer map (`(x, y) ↦ x` for `x ≠ 0`, `(0,0) ↦ d`, `O ↦ 1`), with kernel `φ′(E′(ℚ))`; `n₁ := #α(E(ℚ))`. `S^{(φ′)}` is the set of classes `d₁` for which `H(d₁, c, d/d₁)` has a point over `ℝ` and over every `ℚ_p`, and `n₂ := #S^{(φ′)}`. `α′, n₁′, S^{(φ)}, n₂′` are the same for `E′` with `(c′, d′) = (−2c, c² − 4d)`." Checked on the Check of line 3420 (`c = −1, d = 1`): `d₁ = −1` is insoluble over `ℝ`, so `n₂ = 1`; `d′ = −3` gives `n₂′ = 4`, rank `0 + 2 − 2 = 0`. Add "HeightsRationalPointsAndObstructions §1.19; §3.9" to line 3431.

## R05 (P3) — Target slugs used as cross-references

**Location:** README line 3841: "(rank-upper-bound or two-isogeny-rank-bound)"; line 3589: "(explicit-height-difference-bound)"; line 7917: "transfer along the isogeny from xs13-rank-three and xs13-endomorphism-algebra".

**Claim:** Every term is standard or defined where it first appears, and targets are cited by section.

**Witness:** 58 distinct hyphenated slugs occur 188 times and are the title of no heading: for instance `torsion-by-reduction` (8), `two-isogeny-rank-bound` (6), `jacobian-reduction-data` (6), `curve-sieve-soundness` (6), `padic-candidate-comparison` (5), `xs13-plane-model` (7).

**Repair:** Replace each slug by its section: two-isogeny-descent-map → §3.10, two-isogeny-rank-bound → §3.11, rank-upper-bound → §3.7, explicit-height-difference-bound → §3.12, canonical-height-enclosure → §3.13, regulator-lower-bound → §3.14, height-lower-bound-by-search → §3.15, index-bound → §3.16, torsion-by-reduction → §3.20, finite-index-subgroup-datum → §3.21, padic-candidate-comparison → §6.2, qc-disc-datum → §6.3, explicit-setup → §6.5, height-series-valuation-bound → §6.15, xs13-plane-model → §6.18, xs13-endomorphism-algebra → §6.19, xs13-rank-three → §6.21, and likewise for the rest.

## R06 (P3) — Code spans cut through prose, and words run into numbers

**Location:** README line 1155: "`‖v‖² ≥ 2^(−(n−1))‖c_0‖² (de` Weger Lemma `3.4`, LLL Proposition `1.11). (b`) Let …"; line 1295: "The uncorrected1992 Appendix A3 constants … use the1993 Baker–Wüstholz route, or start `at1.511×10^50`".

**Claim:** Mathematics is in code spans and prose is outside them.

**Witness:** 266 code spans on 226 lines have unbalanced parentheses because the span boundary falls inside a sentence (lines 181, 189, 240, 313, 316, 331, 1155–1158, 1627, …); at least 79 tokens glue a word to a number or relation ("exactly0" 1767, "becomes1" 1772, "`is≥ceil(…)`" 1791, "Corollary2.3" 1655, "precision7" 1819).

**Repair:** Close each span at the end of the formula and reopen it at the next one ("`‖v‖² ≥ 2^(−(n−1))‖c_0‖²` (de Weger Lemma 3.4, LLL Proposition 1.11). (b) Let …"); restore the missing spaces ("The uncorrected 1992 Appendix A3 constants … the 1993 Baker–Wüstholz route, or start at `1.511×10^50`"). The same sentence in the "Work under the following conditions" paragraphs of §§2.2, 2.3, 2.4, 2.5, 2.7 and 2.29 needs its separators back: line 1627 reads "Corollary `2.3` is stated under `(2.4) [K : ℚ] ≤ D` is enough: … monotone in `D λ_j ≠ 0` for every j".

## R07 (P3) — Statement paragraphs written twice, one copy contradicting the other in §4.24

**Location:** README line 5255 (§4.24, second statement): "its numerical values (`α`, the disc Strassmann indices) are computed in this roadmap from the tiny-integral expansions"; line 5240 (first statement): "These numerical coefficients are input hypotheses, not outputs of a table-generation algorithm."

**Claim:** Each target is stated once.

**Witness:** Lines 5200 (§4.23), 5255 (§4.24) and 5308 (§4.25) repeat the opening statement of their section with a `Hypotheses:` field label; line 4738 repeats §4.13 (b) of line 4727; line 4544 repeats the last sentence of line 4524.

**Repair:** Delete lines 4544, 4738, 5200, 5255 and 5308 (the paragraphs beginning "Inequality `r₀ < r` can occur", "(b) If `p > 2g`", "Let `X = C₀(5)`", "Let `X = C₁(3₂)`", "Let `X = X₀^dyn(6)`"). The first statement of §4.24 is the one to keep: the values `α ≡ 68 (mod 3⁴)` and `v(a_i) + i = ∞, 2, 3, 2, 6, 6, 7` are recomputed in the table below.

## R08 (P3) — Extraction residue in four locators, and one page

**Location:** README lines 1885–1886: "§6.3, p. 119 (text layer lines 8008–8048) … Lemma 3.17, p. 67 (text layer lines 4585–4671)"; line 1944: "(text layer lines 8440–8442)"; lines 1730–1731: "(bound read on the page image; the text layer drops the displayed formulas)"; line 3501: "(PDF chapter page16)"; line 5315: "§3 Lemma 4, p.8".

**Claim:** A locator is a theorem, section and printed page of the cited version.

**Witness:** Line numbers of a private text extraction locate nothing in the source (in the CWI scan's text Lemma 3.17 is at deWeger1989 line 3077). stoll2008 line 268: Lemma 4 is stated on p. 7, two lines above the page break.

**Repair:** Delete the five parentheticals; keep "§6.3, p. 119", "§3.13, Lemma 3.17, p. 67", "§6.5, pp. 124–125", "§0.1, p. 242" (once, not twice, in line 1730–1732), "Proposition 3.5.1, p. 77, footnote 3"; write "§3 Lemma 4, pp. 7–8".

## Previous findings

- R01 (`letI`) — repaired: `Suggested.lean` line 158 reads "`(W : WeierstrassCurve.Affine ℚ) [W.IsElliptic]`", the instance `moduleFinite_point_of_numberField` (Tau Ceti `MordellWeil/FinitelyGenerated.lean` line 152) is found, and README lines 151 and 3865 name it.
- R02 (three own names) — repaired: `thueForm`, `thueSolutions`, `thueSmallSolutions` occur 0 times; lines 1954 and 1968 write `F(x, y)` and `Sol(g, m)`.
- R03 (§6.23a) — repaired: line 7401 "### 6.23a First chart of `X_s(13)`: the model and differential basis" is a section of its own; line 7445 "it builds on the Tate classes of §6.22 and the model of §6.23a, and §§6.27–6.29 consume it".
- R04 (description) — repaired: the labelled Checks are gone (0 hits for the 22 labels), and the description reads "start from Matveev's archimedean bound, Yu's p-adic bound or both" and "followed by author-side red-team passes and review repairs".

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §1.1 approximation lattice | `W₁ = 1, φ = (3, 7)`; `θ = (log 2, log 3), C = 10⁸` | `det = 7`; `(1,3) ∈ Γ`, `(0,1) ∉ Γ`; `10⁸ log 2 = 69314718.06`, `10⁸ log 3 = 109861228.87 → 109861229` | correct |
| §1.3 Check (uses §1.1) | Gauss-reduced basis | `69314718·(−1054) + 109861229·665 = 4513`; `1054² + 4513² = 21478085`; `L² = 10739042 ≥ 10⁷` | correct |
| §1.5 p-adic lattice | `p = 3, m = 1, β₁ = 0, β₀ = 1`; `n = 1`; `m = 0` | `Λ′(0,1) = 0`, `(0,1) + (0,−1) ∈ ℤ × 3ℤ`; with `y = (0, +1)`: `b₂ ≡ 2`; `Γ_{m+1} ⊆ Γ_m` | correct |
| §2.7 discrete-logarithm data | `p = 5, g = 6, 26`; `p = 2, g = 5`; `p = 6, g = 19`; `ℓ = (0, 5, 0)` | orders `25, 5` mod 125; `5⁴ ≡ 17, 5⁸ ≡ 1` mod 32; `19² ≡ 1` mod 36; coset `5 ∣ b₁` | correct |
| §2.29 S-unit set | `S = ∅, {2}, {2, 3}` | `∅`; three solutions; positive coprime `x ≤ y`: `1+1, 1+2, 1+3, 1+8` | correct |
| §3.7 rank bound | `y² = x³ − x` | `s = 2, t = 2`, rank `≤ 0`; source: rank `t, t−1, t−2` (cremona1997 line 790) | correct |
| §3.10 descent map (R04) | `c = −1, d = 1`; `y² = x³ − 68x` | `n₂ = 1` (`d₁ = −1` fails over `ℝ`), `n₂′ = 4`; `−68 ≡ −17` mod squares | Checks right once the symbols are defined |
| §3.12 Cremona, Silverman (headlines) | `K = ℚ`; doubling of Silverman's constants | `2·0.973 = 973/500`, `2·1.07 = 107/50`, `2μ = h(Δ)/6 + h∞(j)/6 + h∞(b₂/12) + log 2*`; pinned heights relative (`logHeight₁_eq`) | agrees with both sources |
| §3.16 index bound | `r = 1`; `r = 2, R ≤ 9, λ ≥ 1` | `(4/π)Γ(3/2)² = 1`; `n² ≤ 9·4/3 = 12`, `n ≤ 3` | correct |
| §3.22 `mordellWeil_basis_of_height_and_saturation` | index `n > 1` | a prime `p ∣ n` has `p ≤ N` and an element of order `p` in `E(ℚ)/G`, against `hsat`; `T` all torsion by `hT` | true as stated |
| §3.25 Fermigier data | factorisations | `d = 2¹⁵3⁴5²7²·17·23·29·41·103·113·127·809` and `d′ = c² − 4d` as printed; 17 primes; `8 + 7 − 2 = 13` | correct |
| §4.13 Coleman bound | McCallum–Poonen Example 1, `p = 7` | `#X̃(𝔽₇) = 5 + 2 + 0 + 1 = 8`; bound 10; `3·2·1·2·3 = 6²`, `10·9·8·5·4 = 120²` | correct |
| §4.22 relative symmetric Chabauty | against box2021 line 286, caraianiNewton line 5096 | hypotheses `p > 2` when the residue degree is 1, nonzero constant coefficient; `p = 43`, order 7 | as in the sources |
| §4.24 Poonen's curve | `g` at `−2, −1, 0, 1, 2`; tiny integrals at `t = 6` to 70 terms | `33, 1, 1, 9, 73`; `#J(𝔽₃) = 27`, `#J(𝔽₅) = 43`; `α ≡ 68 (mod 81)`; `v(a_i) + i = 2, 3, 2, 6, 6, 7` for `i = 1..6`; `N₃ = 3` | correct |
| §4.25 Stoll's curve | against stoll2008 lines 140, 379–381, 409, 496 | bad primes `2, 8029187`; `D₁, D₂, D₃` as printed; Theorems 6, 7 as restated | correct, one page (R08) |
| §4.8, §4.12 (R01) | compared with the supplier at #1021 | same dimension bound, annihilator dimension and finiteness; this roadmap adds arbitrary `p`, finite index, `Σ N_p` | overlap |
| §6.1 exact solution sets | `x² = 4` over `ℤ`; `H = False` | `{−2, 2}`; `{2}` fails completeness; every sound list is a datum under `False` | correct |
| §6.16 `roots_determined_of_truncation` | `G = T^D`, `H = T^D − ε`; a ball of radius `ε^{1/d}`; `D = 0` | roots of `H` at distance `ε^{1/D} ≤ ε^{1/d}`; on a sphere of radius `r > ε^{1/d}`: `|G| ≥ r^D > ε ≥ |G − H|`, equal counts | true as stated |
| §6.19 endomorphisms | cubic `t³ + 2t² − t − 1`; `χ₁₃`; `x = (1, −1, 0)` | discriminant 49; no root mod 17; `χ₁₃(3) = 1, χ₁₃(2) = −1`; `a₆ = a₂a₃ = −α − 1`; `Tr(x x†) = −2` | correct |
| §6.20 analytic rank | weight 2, `w₁₆₉ = +1` | root number `−1`; source: `L′ > 0.6`, error `< 10⁻¹⁰⁰` (bdmtv2019annals lines 1816–1818) | correct |
| §6.34 `X_S4(13)` | four points in the quartic | `(1:3:−2)`: `12 − 27 + 81 + 2 − 96 + 198 − 270 + 12 + 108 + 36 − 8 − 48 = 0`; others 0; `j`-values as bdmtv2021 lines 1391–1393 | correct |
| §2.3 `matveev_lower_bound` | `n = 1`; `n = 2, A = (0.7, 1.1), s = 1.415`; `D′ ≤ D` | `Ĉ(1) = 1.1009·10⁶`; `Ĉ(2)·0.77 = 7.826·10⁸`; `(en/2)/2 ≥ 1` for `n ≥ 2`; monotone in `D` | follows from the supplier's `matveev` |
| §2.5 `yu_valuation_upper_bound` | `f_𝔭 ≤ d₀ ≤ d`; `v ≤ 0`; norm on `L` | `p^f − 1 ≤ p^d − 1`; right side `> 0`; `‖p‖ = 1/p` by `NormedAlgebra`; `v_p = ord_𝔭/e ≤ ord_𝔭` | follows from the supplier's `yu` |
| §6.36 `thue_quartic_i`, `thue_quartic_ii` | box `|X|, |Y| ≤ 400`; field data | `±(1,0)`; the eight pairs; `φ = 2/ϑ`; char. poly of `ϑ²/2`: `T⁴ − 12T³ + 38T² − 20T + 1`; three inverses; regulator `22.32` | correct |
| §6.37 integral points, triangular numbers | `−3 ≤ x < 3·10⁶`; `m` up to `8v + 1 ≤ 10¹⁷` | the 11 abscissae; `n ∈ {3, 15, 20, 44, 608, 22736}`; disc 229; `N(ψ−1) = 2`; `f(29) = 229·106`, `f′(29) = 229·11` | correct |
| §6.38 `sUnit_two_to_thirteen` | all smooth `z ≤ 10¹¹` | 545 solutions, 514 within the six bounds; largest `91 + 1771470 = 11⁶`; maximal orders `15, 11, 7, 6, 6, 4` | correct |
| §6.39 `thueMahler_cubic` | 72 tuples; box `0 ≤ x ≤ 4000, |y| ≤ 4000` | 72 distinct, all satisfy `F = ±2^a3^b5^c7^d`, coprime, normalised; box gives the other 71 and nothing else; disc `5²·44621`; `N(ε₁) = N(ε₂) = −1`; `5` splits (ω mod 5 has roots 1, 2, 4) | correct |

- Source locators checked against the text: 52, in 14 sources (deWeger1989, tzanakisDeWeger1989, tzanakisDeWeger1992, yu1994, cremona1997, silverman1990, siksek1995, mccallumPoonen, box2021, caraianiNewton, poonen1995, stoll2008, bdmtv2019annals, bdmtv2021); 51 agree, one is R08.
- Library declarations opened at the pins: Mathlib `NumberField.absLogHeight₁` (`Mathlib/NumberTheory/Height/NumberField.lean` line 145), `logHeight₁_eq` (line 119), `Point.naiveHeight` (`Mathlib/NumberTheory/Height/EllipticCurve.lean` line 37); Tau Ceti `neronTatePairing` (`CanonicalHeight/Basic.lean` line 368), `regulator` (`MordellWeil/Regulator/Basic.lean` line 96), `fg_point_of_numberField` and its instance (`MordellWeil/FinitelyGenerated.lean` lines 145, 152), `PowerSeries.evalAt` (R02), Strassmann (R03).
- Cross-roadmap citations resolved: DiophantineApproximationAndTranscendence §§0.2, 3.6, 3.7, 4.1, 4.3, 4.5 with `matveev`, `yu`, `yu_rat`, `yuOneFactorBound`, `yuValuationAdapter`, `sUnits_rat_mulEquiv` (main); RestrictedPowerSeries §2.4, NewtonPolygons §§3.4, 4.3 (main); GeometryOfNumbersAndQuadraticArithmetic §5.1 with its three names; ModularCurvesPartII §§9.5–9.8, 11.8, 13.1–13.4, 16.1–16.7, 17.2; HeightsRationalPointsAndObstructions §§0.19, 0.24, 1.15a–1.19; AbelianSchemesAndArithmeticModuli `Polarization.rosati`, `rosatiPositivity`, `rationalNSAmpleCone`; DeligneWeightsAndPurity §§1.1–1.4; NeronModelsAndSemistableAbelianVarieties §3.8; ColemanIntegration §L0.2. None missing.
- Gate (worker, c3224c8): every counter 0, `build=0`. Elaboration of `Suggested.lean`: twelve `declaration uses sorry` warnings, nothing else. One-tactic probe (`simp`, `rfl`, `omega`, `norm_num`, `infer_instance`, `simp_all`) on a scratch copy: all twelve theorems stay open. No change outside the folder. The description's sentences agree with the head.
- Dependency check: `depcheck: 245 roadmaps, 2240 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Overlap check: read ComputationalNumberTheory, ArithmeticDynamics, AnabelianGeometryAndNonabelianChabauty, HeightsRationalPointsAndObstructions, ArithmeticStatisticsPartVI, DiophantineApproximationAndTranscendence, ClassicalArithmeticCompletion, EllipticCurves (its hits for descent, heights and Chabauty only). Mordell–Weil logarithmic span, residue-chart Strassmann bound and classical Chabauty finiteness: owner AnabelianGeometryAndNonabelianChabauty (R01). Selected-root data, p-adic records, local images, saturation, affine ellipsoids: owner this roadmap, ComputationalNumberTheory cites it (its lines 127–139). Matveev's and Yu's theorems: owner DiophantineApproximationAndTranscendence §§3.6–3.7, cited here. ArithmeticDynamics (its lines 258–264) declares gaps against this roadmap for the rational points of models of `X₁(16)` and `X₁(13)`, which this head does not state.
- Source independence: 21 passages compared with 14 sources, none shared (longest common runs outside formulas: 13 words with mccallumPoonen, 12 with bruinStoll2010, both standing hypotheses); largest share bdmtv2019annals, 49 of 390 locators; contents compared with bdmtv2019annals: §§6.5–6.14 and 6.18–6.28 run beside its §§4–6 but not one to one (§6.18 ↔ its 6.3 precedes §§6.19–6.21 ↔ its 6.1; §§6.1–6.4, 6.15–6.17 have other sources), the order being forced by the `*Needs:*` of §§6.11, 6.13 and 6.22: independent.

## Not verifiable

- matveev2000 (Corollary 2.3, p. 1219): the host timed out three times; §§2.2–2.3 were compared with `matveev` in DiophantineApproximationAndTranscendence on main (`Suggested.lean` line 665) instead.
- yu1994 p. 242: the text omits the displayed bound (lines 46–62); the constants were compared with `yu` in DiophantineApproximationAndTranscendence (`Suggested.lean` line 692).
- deWeger1989 Lemma 3.15: the scan's text is too damaged at lines 2971–2987 to confirm the printed sign of `y` that §1.5 says it corrects.
- bruinStoll2010: only the arXiv text was read; the 44 locators into the version of record were not checked.
- siksek2009sym: the extraction holds 1562 words; Theorem 3.2 was not read.
- The numerical tables of §§6.18–6.35 (Hecke and Frobenius matrices, height matrices, disc expansions) were not recomputed.

## Source issues

- **Misprint** in bdmtv2021 at Lemma 4.7, p. 25 (arXiv v4): the source says the largest index whose shifted valuation equals n is below m; it should be that every index whose shifted valuation is below n is below m; affects a stated result.
- **Error** in poonen1995 at §4, proof of Proposition 1, p. 13: the source says the descent uses a point with abscissa 2 and ordinate the square root of 33; it should be abscissa −2, since the sextic takes the value 73 at 2; affects the proof; corrected in print at the author's errata list (poonenErrata lines 18–23).

## For the human reviewers

- Reuse: the 72 tuples of README §6.39 (lines 8172–8185) and of `ED6.thueMahlerSolutionList` are listed "in the order of Tzanakis–de Weger's table" (tzanakisDeWeger1992, pp. 278–279); the set is the theorem, the order is the source's.
- Licence: deWeger1989 was read from `ir.cwi.nl`, tzanakisDeWeger1989 from `ris.utwente.nl` and bdmtv2019annals from `annals.math.princeton.edu`; the sources service classifies none of the three hosts, and they were read as institutional repositories and a publisher's open copy.
