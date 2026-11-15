# Review of EffectiveDiophantineMethods (pull request #1046 at 1f96c0d)

**Verdict:** needs changes

Full review. The gate passes at this head. Six P3 findings; no P1 or P2.

## R01 (P3) — §3.7 cited as the rank datum of a Jacobian

**Location:** `TauCetiRoadmap/EffectiveDiophantineMethods/README.md` line 4861: "for a subgroup `G = ⟨D₁, …, D_r⟩ ⊆ J(ℚ)`, whose rank datum (§3.7) gives `rank J(ℚ) = r < g`"; also lines 4884, 4911, 4955, 6199, 6219, 6230, 6262.

**Claim:** §3.7 bounds the rank of the Jacobian of a curve of genus at least 2 (over a number field at line 4955) and "distinguishes algebraic from analytic upper bounds" (line 6219).

**Witness:** §3.7 (lines 3277–3295) is the 2-Selmer bound `rank E(ℚ) ≤ s − t` for an elliptic curve over `ℚ`. The rank input of a subgroup datum, and the rule for unproved bounds, are §3.21 (lines 3767–3773).

**Repair:** Line 4861: "whose rank bound `rank J(ℚ) ≤ r` (that of the §3.21 datum: §3.23 in genus two, a stated hypothesis otherwise) gives `rank J(ℚ) = r < g`". Line 4884: "Either the rank bound of the §3.21 datum or the labelled hypothesis `rank J(ℚ) ≤ r`." Line 4955: "(…, §3.21)". Line 6219: "§3.21 keeps a rank bound that rests on an unproved hypothesis out of the datum". In the `*Needs:*` lines 4911 and 6199 delete §3.7 (§3.21 is listed); in 6230 and 6262 replace §3.7 by §3.21.

## R02 (P3) — §3.9 states the definition of §3.8 as an equivalence

**Location:** README line 3350: "`g` is locally soluble at `v` (§3.8) if and only if the smooth projective curve `y² = g(x)` has a `ℚ_v`-point"; line 3326: "Prove: local solubility is equivalent to a `ℚ_v`-point on the smooth projective model".

**Claim:** An equivalence to be proved.

**Witness:** Lines 3300–3301 define it so: "say that `g` is locally soluble at `v` when the smooth projective curve `y² = g(x)` has a `ℚ_v`-point". Both sides are one statement.

**Repair:** Line 3350: "For `g ∈ ℤ[x]` squarefree of degree 4 and a prime `p`, the curve `y² = g(x)` has a `ℚ_p`-point if and only if, on one of the two charts of §3.8, some class `x_k + p^kℤ_p` with `k ≤ ord_p(disc g) + 1` (`+ 2` when `p = 2`) satisfies a point-giving Hensel alternative of §3.8; it has a real point if and only if `a > 0` or `g` has a real root." Line 3326: delete the clause. (On `x⁴ − 1` at `p = 3`: the class `x ≡ 1`, `k = 1`, has `ℓ ≥ 1 = m + k`, `k > m`.)

## R03 (P3) — Checks written as verdicts of a checking procedure on inputs the README does not define

**Location:** README line 1473: "`C=W=1`, `φ=θ=10`, `β=ψ=0`, `X=margin=1`, `A=10`, `inverse=1/10`, `B=2`, `lower=4,D=1` passes the complete homogeneous finite check"; lines 1470–1481 and 4837–4845.

**Claim:** A Check says in prose what is computed.

**Witness:** `Ainv`, `inverse`, `lower`, `margin`, `residues[1,0]`, "fails the inverse check", "rejects the full check", "rejected by primality" name fields and verdicts defined nowhere. Line 1473 has `n = 1`; line 1459 requires `n ≥ 2` for a real datum.

**Repair:** Replace lines 1470–1481 by: "`A = (1)`, `y = 0`, `B = D = L² = 1`: the eligible `x ∈ [−1, 1]` are `±1`, with `‖Ax‖² = 1 ≥ L²`." "`A = (1)`, `y = 1`: `x = 1` has distance 0, so no `L² > 0` is a bound." "`p = 3`, `m = 2`, `r₀ = 5`, `A = (9)`, `y = −5`, `B = 4`, `D = 1`: `‖9x + 5‖² = 16, 25, 196` for `x = −1, 0, 1`, so `L² = 15` is a bound and `X = 3` is strictly separated (`9 < 15`); `X = 4` is not (`16 > 15`), and `b = −4` has `9 ∣ b − 5`." "With the target `+5` the distances are the same, but the excluded congruence is `b ≡ 4 (mod 9)`." Replace lines 4837–4845 by: "Coefficients `≡ (1, 0) (mod 3)` with later valuations `≥ 1`: `m = N = 0`, no zero. `≡ (0, 1)`: `N = 1`. `≡ (1, 1)`: the last index of minimal valuation is 1, so 0 is not the Strassmann index." "Coefficients all `≡ 0 (mod 3^M)` determine neither `m` nor `N`." "The classes 0 and 1 `(mod 3)` do not cover a ball of `ℤ_3`: counts on them bound nothing on the ball." "One zero described twice counts once."

## R04 (P3) — Code spans cut inside "e.g." and "i.e.", two dangling symbols, a damaged sentence and a repeated Check

**Location:** README line 1214: "the nonzero vectors of `Γ, e.g`. `2^(−(n−1)/2)‖c_0‖`"; line 6293: "each method has a separate finite arithmetic conditions and a theorem deriving them".

**Claim:** Each formula is one code span, each symbol is defined and each sentence parses.

**Witness:** Same span at lines 1239, 1303, 1497, 1781. Line 1506: "the checked inequality (iv)"; §1.10 numbers nothing. Line 3829: "`[E(ℚ)/T : L]`", `L` undefined. Line 6324 repeats the Check of line 6319 (`x² = 4`, `{−2, 2}`).

**Repair:** Lines 1214, 1239: "`Γ`, e.g. `…`". Lines 1303, 1497: "`…`, i.e. `…`". Line 1781: "`…`; e.g. `(b_1, b_2) = (1, 2)`". Line 1506: "and the inequality `L² ≥ Σ_{i<n} W_i²X_i² + (ε + Σ_i X_i + μ)²` of §1.10". Line 3829: "`[E(ℚ) : G] = [E(ℚ)/T : G/T] ≤ N`". Line 6293: "each method has its own finite arithmetic conditions and a theorem deriving soundness and completeness from them". Delete line 6324.

## R05 (P3) — A Check of §6.7 fails in characteristic 2

**Location:** README line 6595: "With `D Ω = +ω` (the 2021 convention) and `ω ≠ 0, C(Ω, g, Z)⁻¹ · D(C(Ω, g, Z)) ≠ Λ(ω, η, Z)`."

**Claim:** The inequality holds at the generality of the API bullet it tests ("a derivation `D` of a commutative ring `R`").

**Witness:** `R = 𝔽₂[t]`, `D = d/dt`, `Ω = (t, 0)`, `ω = (1, 0)`, `Z = 0`, `g = η = 0`: `DΩ = ω = −ω`, and both sides are `[[0,0,0],[ω,0,0],[0,0,0]]`.

**Repair:** "With `D Ω = +ω` (the 2021 convention) and `2ω ≠ 0`, …".

## R06 (P3) — Works cited in the text and absent from the References

**Location:** README line 7674: "Bilu–Parent–Rebolledo `[BPR13]` for `ℓ > 7`, `ℓ ≠ 13`"; lines 7605, 7628, 4780, 7200.

**Claim:** Every cited work is in `## References`.

**Witness:** `## References` (lines 8113–8143) has no entry for Bilu–Parent–Rebolledo (`[BPR13]`, also line 7679, is a key defined nowhere), Diamond–Shurman, Silverman's *The Arithmetic of Elliptic Curves*, Stichtenoth or Bruin–Poonen–Stoll.

**Repair:** Add the five entries. Lines 7674 and 7679: "Bilu–Parent–Rebolledo, *Rational points on `X_0^+(p^r)(ℚ)`*, Ann. Inst. Fourier 63 (2013), 957–984" with the number of its main theorem, in place of the key.

## Previous findings

- R01 (scaffold bullets) — repaired: no "Supporting", "is encoded" or "does not construct the actual" bullet remains; line 2131 "ThueBoundParameters: the scalar constants of a ThueConstants datum with their root and threshold inequalities". Checks of the same kind in §§1.10 and 4.16 are R03.
- R02 (duplicate Checks) — repaired at the pairs opened (line 1287 is the only `Γ_1 = ℤ × 3ℤ` bullet; §3.17 has one saturation bullet); a further pair in §6.1 is in R04.
- R03 (code spans) — repaired at every named line (line 88 "`(−π, π]`"; line 4792 "`ω̃ = x dx/y`"); spans of the same kind elsewhere are R04.
- R04 (supplier contracts, Dependencies) — repaired: lines 408–427 state DiophantineApproximationAndTranscendence §§0.1–0.3, 3.6–3.7, 4.1–4.5, NewtonPolygons §§3.4, 4.3 and RestrictedPowerSeries §2.2; the Dependencies of Layers 4–6 list the named suppliers; line 396 "§§L0.10, L0.13 and L0.17".
- R05 (§3.28 reference, §3.19 instance) — repaired: line 4033 "any §3.23 conclusion"; line 4075 "has `I/3I` of `𝔽₃`-dimension at least 3". The same stale §3.7 reference in Layers 4–5 is R01.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §1.3 homogeneous reduction | `(log 2, log 3)`, `C = 10⁸`; de Weger and Tzanakis–de Weger cases | Gauss basis `(−1054, 4513)`, `(22619, 7383)`, `μ = 0.44`; `‖c_0‖² = 21478085`; `L² = 10739042.5 ≥ 10⁷`; true minimum `1.0222·10⁻³` at `(−485, 306)` | correct; deWeger1989 line 2512 (p. 54); tzanakisDeWeger1989 line 479 (p. 114) |
| §1.4 inhomogeneous reduction | `q = 3`, `K_3 = 72`; comparison of constants | `2·72² + 433² = 197857`; `log(10¹²·63877.1/216)/3.303 = 10.09`; `1 + 2qK ≤ (2q + ½)K ⇔ K ≥ 2` | correct; tzanakisDeWeger1989 lines 497, 863–878 (pp. 114, 126) |
| §1.11 soundness | `ψ = 0`, `β ≠ 0`; `β_0 ≡ 0 (mod p^m)`, `b = 0`; `p = 3`, `m = 2`, `β_0 = 5` | `x = 0` excluded when `y = 0`; `Λ′(0) = −β_0` has `ord ≥ m`; `‖9x + 5‖² = 16, 25, 196`; `b = −4`: `9 ∣ −9` | correct; reference "(iv)" R04; Checks R03; 1993 correction lines 47–60 |
| §3.8–3.9 quartic solubility | `x⁴ + p²`, `x⁴ − 1` at 3, `3x⁴ + 3` at 3; even quartic | `disc = 2⁸p⁶`, `−256`; `v₃(3x⁴ + 3)` odd; `disc(d₁u⁴ + cu² + d₂) = 16d₁d₂(c² − 4d₁d₂)²`; monomials of `disc` free of `d, e`: only `c⁶` | alternatives as Cremona lines 941–965 (pp. 81–82), footnote line 880; aitkenLemmermeyer lines 922, 945 (p. 17); opening sentence R02 |
| §3.12 `canonicalHeight_sub_naiveHeight_cremona`, `_silverman` | `y² = x³ + B`; doubling of Silverman's constants | `μ_C = log(432B²)/6`; `2·0.973 = 973/500`, `2·1.07 = 107/50`; Cremona `1.922`, `2.14` | as Cremona lines 698–703 (Proposition 3.5.1, p. 77), footnote line 730 |
| §3.13 height enclosure | `(−1, 0)`, `(2, 3)` on `y² = x³ + 1`; `(3, 5)` on `y² = x³ − 2` | `(1/8 + 5)/4ⁿ = 41/(8·4ⁿ)`; `40/4⁶ = 0.00977 < 10⁻²`; `ĥ(2ⁿP) = 4ⁿĥ(P)` | correct; Cremona line 456 (§3.4, p. 71) |
| §3.26 rank-zero curves | five models; shift to `x(x² + cx + d)` | `(c, d) = (−7, 16), (9, 16), (−1, 1), (3, 1), (−11, 32)`; `d′ = −15, 17, −3, 5, −7`; all listed points on their curves; `(−1, 1)` gives `−3 ≠ 1` on E24 | correct; poonen1995 lines 326, 364, 391, 413; morton1992 lines 114, 848 |
| §4.2 abelian logarithm | finite-index extension `N⁻¹λ(Nx)`; torsion; `C₀(5)` points | `N·x ∈ H` for index `N`; `(0, −1)`, `(−3, 1)` on the sextic (`729 − 1944 + 1782 − 594 + 45 − 18 + 1 = 1`) | correct; mccallumPoonen lines 123–162 (p. 4); KRZB line 860 (p. 19); stoll2013 lines 239–260 |
| §4.8 closure of a subgroup | `G ⊆ Γ` of index `n` prime to `p·#Ã(𝔽_p)`; `Γ` finite | `#(Γ̄/Ḡ)` divides `n` and has only prime factors of `p·#Ã(𝔽_p)`: trivial; `r₀ = 0` | correct; mccallumPoonen lines 168–184, 332–334 |
| §4.16–4.17 verdicts and datum | automatic tail rule; `C₁(3₂)` Weierstrass disc | `n − v_p(n) ≥ ⌈n/2⌉ ≥ m + 1` for `n ≥ 2(m + 1)`; `2(W − S⁻) = S⁺ − S⁻` | correct; Checks R03; rank reference R01; mccallumPoonen lines 364, 416; stoll2008 lines 318, 409 |
| §4.24 `C₁(3₂)` at 3 | series `ξ(t)`; tiny integrals to `t = 6`; point counts | `ξ = 1 − 3t/8 − 31t²/512 + …`; `α ≡ 68 (mod 81)`; `v(a_i) + i = ∞, 2, 3, 2, 6, 6, 7`; `#J(𝔽₃) = 27`, `#J(𝔽₅) = 43`; `#X̃(𝔽₃) = 7`; `gcd(g, g′) = 1 (mod 3)` | correct; poonen1995 lines 578–648 (pp. 16–17) |
| §5.17 triangular generators | `ℤ`, `K = 4ℤ`; `ℤ²`, even sum; `K = Γ` | `[4]`; `j = (2, 1)`, `g = (2, 0), (1, 1)`; `⟨(2, 0), (0, 2)⟩` has index 2 in `K` | correct; bruinStoll2010 (arXiv v2) lines 1302–1328 |
| §6.1 solution sets | `x² = 4`; `H = False`; false `P` | `{2}` fails completeness at `−2`; any verified finite set is a datum; `S = ∅` | correct; wording and duplicate R04; deWeger1989 line 6547 (p. 123); bdmtv2021 line 656 |
| §6.7 gauge matrices | `C⁻¹`, `C⁻¹dC`, shift by `c`; `𝔽₂`, `Z = diag(1, 0)` | lower-left of `C⁻¹` is `ΩᵀZΩ − g`; `dg = ΩᵀZdΩ − η`; `U·C` rows `(c + Ω, 1, 0)`, `(e + cᵀZΩ + g, …)`; `cᵀZΩ = 1` | correct; Check R05; bdmtv2019annals lines 1242–1258 (p. 915) |
| §6.25 matrices `T_1, T_2` | rows at `P1, P3, P5`; base point `P2`; 17 in `ℚ(ζ₇)⁺` | repeated rows; first row 0 at `b`; `3` has order 3 in `(ℤ/7)^×/±1`: inert | as bdmtv2019annals lines 2007–2060 (pp. 931–932) |
| §6.30 split Cartan, `ℓ ≤ 7` | levels 4, 9, 25, 49; `w₄₉` | `(μ, ν₂, ν₃, ν_∞) = (6,0,0,3), (12,0,0,4), (30,2,0,6), (56,0,2,8)`; `g = 0, 0, 0, 1`; `h(−196) = 4`; `0 = 2(2g′ − 2) + 4` | correct; bdmtv2019annals lines 153–155 (p. 888); references R06 |
| `matveev_lower_bound`, `yu_valuation_upper_bound` | unchanged since the previous head | compared there with `matveev`, `yu` of DiophantineApproximationAndTranscendence §§3.6–3.7 | no change |
| `mordellWeil_basis_of_height_and_saturation` | index `n > 1`; `r = 1`, `λ > R⁺/4` | `λ ≤ γ(R/n²)^{1/r}` gives `n ≤ √R(γ/λ)^{r/2}`; `√(R⁺/λ) < 2`, `N = 1` | true as stated |
| `roots_determined_of_truncation` | `G = T`, `H = T + p^N`; `G = T²`, `H = T² − p^N`; `H = T + p^N T²` | distances `p^{−N}`, `p^{−N/2}`; second root has norm `p^N > 1` and is filtered | true as stated |
| `thue_quartic_i`, `_ii` | `|X|, |Y| ≤ 400` | `±(1, 0)`; the eight listed pairs | correct |
| `integralPoints_…`, `triangular_…` | `−3 ≤ x < 3·10⁶`; `m(m+1)(m+2) ≤ 10¹³` | abscissae `−2, −1, 0, 2, 3, 4, 10, 12, 20, 114, 1274`; `n ∈ {3, 15, 20, 44, 608, 22736}` | correct |
| `sUnit_two_to_thirteen` | `z ≤ 4·10⁷` | 545 pairs, 514 within the six bounds, largest `z = 1771561` | correct |
| `thueMahler_cubic` | the 72 tuples; box `0 ≤ x < 3000`, `|y| ≤ 3000` | 72 distinct, each `|F| = 2^a3^b5^c7^d`, coprime, normalised; 70 in the box, none unlisted | correct |

- Source locators checked against the text: 32, in 13 sources (deWeger1989, tzanakisDeWeger1989, the 1993 correction, Cremona Chapter III, aitkenLemmermeyer, poonen1995, morton1992, mccallumPoonen, stoll2013, KRZB, stoll2008, bdmtv2019annals, bdmtv2021); all agree.
- Library declarations: `Suggested.lean` is unchanged since the previous head, where its supplier names were opened at the pins; none was re-opened.
- Cross-roadmap citations resolved on main: DiophantineApproximationAndTranscendence §§0.1–0.3, 3.6–3.7, 4.1–4.5; NewtonPolygons §§3.4, 4.3; RestrictedPowerSeries §2.2. The worker's resolver lists no cross-roadmap citation found nowhere; the 21 Lean names it lists are this roadmap's own declarations.
- Gate (worker, 1f96c0d): every counter 0, `build=0`. `lake env lean` on `Suggested.lean`: twelve `declaration uses sorry` warnings, nothing else. No change outside the folder. The one-tactic probe was not rerun: the file is unchanged since the previous head, where all twelve theorems stayed open.
- Dependency check: `depcheck: 246 roadmaps, 2250 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Pull request text against the head: no sentence contradicted; the eight open suppliers it lists are exactly the cited roadmaps that are not on main and precede this one in the merge order; the folder is new.
- Overlap check: read ComputationalNumberTheory, ArithmeticDynamics, AnabelianGeometryAndNonabelianChabauty, HeightsRationalPointsAndObstructions, HyperellipticCurves, DiophantineApproximationAndTranscendence, ClassicalArithmeticCompletion, EllipticCurves. Affine lattice sets (§§1.7–1.8), saturation and finite-index data (§§3.17–3.22), the `x − T` rank bound (§3.23), bounded-height covers (§0.11): owner this roadmap, cited by ComputationalNumberTheory, HyperellipticCurves and ArithmeticDynamics. Abelian logarithm, Mordell–Weil logarithmic span, chart Strassmann bound: owner AnabelianGeometryAndNonabelianChabauty, cited here. Matveev, Yu, effective Thue–Mahler finiteness: owner DiophantineApproximationAndTranscendence, cited here.
- Source independence: 13 passages compared with 8 sources, none shared (longest common run outside formulas: 7 words with bdmtv2019annals line 1239); largest share bdmtv2019annals, 50 of 421 linked locators (bruinStoll2010 45); contents compared with bdmtv2019annals: §§6.5–6.14 take several sections for each of its §§4.4–5.4, §§6.15–6.17, 6.19, 6.20 and 6.22 come from elsewhere, the model (its §6.3) precedes the ranks (its §6.1), and the order connection, gauge, Hodge filtration, Frobenius, height is forced by the `*Needs:*` of §§6.7, 6.8, 6.12, 6.13: independent.

## Not verifiable

- deWeger1989, Lemma 3.15 (p. 65): the extraction drops the displayed vector `y`; the printed sign that §1.5 corrects was not confirmed.
- bruinStoll2010: the arXiv v2 text was read; the published page numbers of its locators (pp. 280–301) were not checked.
- §6.25, second Check: arXiv v1 of BDMTV was not read; that it used `P4` was not confirmed.
- §4.2, fourth Check (Flynn's parameters and the logarithm `(36, 3) mod 3⁴`): Flynn–Poonen–Schaefer was not read this round.
- silverman1990, siksek1995, finckePohst1985, matveev2000, yu1994, box2021 and the locators outside the sample were not read this round.
- The numerical tables of §§6.19–6.35 other than §6.25's three relations, and the 1492-curve data of §5.29, were not recomputed.

## Source issues

- **Misprint** in poonen1995 at §3, the list of `E24(ℚ)`, p. 9: the source says the fourth point has abscissa −1 and ordinate 1; it should be abscissa 1 and ordinate −1, since the printed point is not on the curve; affects a stated result.
- **Error** in poonen1995 at §4, proof of Proposition 1, p. 15: the source says a 743-adic point with abscissa 2 and ordinate the square root of 33 lies on the curve; it should be abscissa −2, where the sextic takes the value 33; affects the proof; corrected in print at the author's errata list.
- **Misprint** in mccallumPoonen at §6, Remark 6.1, p. 8: the source says the map from the subgroup modulo `p` times itself to a group killed by `ℓ` is injective; it should be the subgroup modulo `ℓ` times itself; affects nothing.

## For the human reviewers

- Reuse: README §6.35 (from line 7787) gives quartic models, primes and ordered point and CM lists per level, citing bdmtv2021 Examples 5.7–5.15; `ED6.thueMahlerSolutionList` (`TauCetiRoadmap/EffectiveDiophantineMethods/Suggested.lean` lines 268–291) says it keeps the order of the table of tzanakisDeWeger1992 §18.
- Reuse: README §3.8 (lines 3306–3314) states as mathematics the conditions of the two lifting subroutines printed as pseudocode in Cremona, Chapter III, pp. 81–82.
- Licence: deWeger1989 (`ir.cwi.nl`), tzanakisDeWeger1989 (`ris.utwente.nl`), bdmtv2019annals (`annals.math.princeton.edu`), mccallumPoonen (`math.mit.edu`) and Cremona's chapter (`johncremona.github.io`) are on hosts the sources service does not classify; they were read as institutional, publisher-open and author copies.
- Licence: README lines 490–491 say the exact-algebraic interface "follows the design of" a blog post; README lines 3243 and 8123 cite a raw data file of the `JohnCremona/ecdata` repository, whose licence was not read.
