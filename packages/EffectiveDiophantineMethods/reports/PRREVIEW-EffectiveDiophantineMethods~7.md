# Review of EffectiveDiophantineMethods (pull request #1046 at a9bb521)

**Verdict:** needs changes

Full review. The gate passes at this head. Five P3 findings; no P1 or P2.

## R01 (P3) — API and Check bullets that describe an absent scaffold instead of stating mathematics

**Location:** `TauCetiRoadmap/EffectiveDiophantineMethods/README.md` line 5141: "Supporting set/cardinality consequence: for an arbitrary mathematical ChabautyColemanData with Valid and exactly 6 listed points … This does not construct the actual named-curve application or discharge its rank/model/disc hypotheses."

**Claim:** API bullets state facts with hypotheses and conclusion; Checks say what is computed.

**Witness:** Same form at lines 1997, 2070, 2098, 2123, 2411–2414, 2438, 2523, 2763–2766, 2788, 2979, 3224, 4216, 4221, 4240, 4284, 4289, 4311, 4779, 4907, 5194, 5244, 6995, 7084, 7142, 7234, 7356. `Suggested.lean` declares none of these records.

**Repair:** Delete the bullets at lines 2123, 2411–2414, 2763–2766, 3224, 4221, 4240, 4284, 4289, 4311, 4907, 5141, 5194, 5244, 7084, 7142, 7234, 7356 (the neighbouring bullets state the facts). Lines 2438, 2788, 2979: "A valid datum for the actual equation, with the stated field and root hypotheses, has claimed list equal to the solution set." Line 2098: "ThueBoundParameters: the root and threshold inequalities and scalar parameters, with `c4`, `c5` and `μ±` as hypotheses." Line 2523: drop "Supporting third-corollary uniqueness only:". Line 4216: "The extension to `A` of the homomorphism given on the finite-index subgroup of a FormalLogDatum, with its hypotheses on `T`", without "Supporting" and "no … is encoded". Line 4779: "On each residue disc the local parameter and the expansions of `x`, `y` and `x^i dx/y` of (b) are power-series identities over `ℤ_p`." Line 6995: drop "Supporting". Line 1997: "every `μ ∈ M` is nonzero". Line 2070: delete the sentence "ThueBoundParameters is only the supporting partial mathematical record … hypotheses."

## R02 (P3) — Checks repeated within one section

**Location:** README line 1253: "`p = 3, m = 1, β_1 = 0, β_0 = 1: Γ_1 = ℤ × 3ℤ` and `y_1 = (0, −1)`."

**Claim:** Each Check of a section tests something the others do not.

**Witness:** Line 1248 computes the same `Γ_1` and `y_1`. Same pairs: 886/889, 2758/2763, 2759/2764, 2954/2962, 3100/3105, 3220/3228, 3654/3658 (and 3656).

**Repair:** Delete lines 886, 1253, 2763, 2764, 2962, 3100, 3228, 3658 (in each pair the other bullet carries the computed values).

## R03 (P3) — Code spans that cut formulas or swallow prose, and two damaged sentences

**Location:** README line 3057: "Newton-polygon criterion (explicit supplied class/unit/factorization data Ore residual irreducibility, with the prime-ideal factorisation of `p` in the global factor fields)"; line 4792: "`C₀(5)` at `p = 3: ω̃ = x` dx/y has zeros".

**Claim:** Each formula is one code span and each sentence parses.

**Witness:** Line 88 "(`-π,π`]"; 145 "`map_mk', eq_iff_div_mem`"; 180 "`lll_short_vector_factor (§5.1.4)`"; 221 "`ℚ (fg_point_of_numberField)`"; 3054 "A exact local image"; 3613 "Siksek `equation(27)`"; 3658 "neither `2-` nor 3-saturated"; 3713, 4049, 4067 "`degree-0`"; 4793 "`(x − 1)` dx/y".

**Repair:** Line 88: "`(−π, π]`". Line 145: "`QuotientGroup.map`, `QuotientGroup.map_mk'`, `QuotientGroup.eq_iff_div_mem`". Line 180: "`lll_short_vector_factor` (§5.1.4)". Line 221: "over `ℚ` (`fg_point_of_numberField`)". Line 3054: "An exact local image". Lines 3056–3058: "the others proved irreducible by the Newton-polygon and Ore residual criteria, from supplied factorisation data including the prime-ideal factorisation of `p` in the global factor fields". Line 3613: "Siksek, equation (27)". Lines 3713, 4049, 4067: "degree-0". Line 4792: "at `p = 3`: `ω̃ = x dx/y` has zeros … `dx/y` vanishes". Line 4793: "`(x − 1) dx/y`". The phrase "explicit supplied class/unit/factorization data" at lines 2019, 3257, 3986, 7758, 7769: "the supplied class-group, unit and factorisation data".

## R04 (P3) — Suppliers named in `*Needs:*` lines but absent from the contracts and from the layer Dependencies

**Location:** README lines 138–452 (`## Exact supplier contracts`); line 7011: "*Needs:* §4.11; §6.15; §0.8; NewtonPolygons §§3.4 and 4.3; RestrictedPowerSeries §2.2; …"; line 8123 (Layer 6 Dependencies).

**Claim:** Every supplier has a contract paragraph and every layer lists its dependencies.

**Witness:** No contract paragraph names DiophantineApproximationAndTranscendence (71 mentions; `matveev`, `yu`, `yuValuationAdapter`, `baker_superelliptic`), NewtonPolygons or RestrictedPowerSeries. Layer 4 Dependencies omit AnabelianGeometryAndNonabelianChabauty §5.8 (line 4254); Layer 6 omit NewtonPolygons, RestrictedPowerSeries, AbelianSchemesAndArithmeticModuli. Line 3005 cites ColemanIntegration §§L0.10–L0.18; line 1812 uses L0.10, L0.13, L0.17.

**Repair:** Add: "From DiophantineApproximationAndTranscendence §§0.1–0.3 use the absolute and relative height conventions; from §3.6 `matveev`; from §3.7 `yu`, `yu_rat` and `yuValuationAdapter`; from §4.4 `baker_superelliptic`; from §§4.1–4.5 the effective finiteness statements." "From NewtonPolygons §§3.4 and 4.3 use strict-perturbation invariance of the multiplicity count and the exact count of zeros in a closed disc; from RestrictedPowerSeries §2.2 translation of a restricted series." Add to the contracts ModularCurvesPartII §§5.11, 6.1–6.2, 9.4 and NeronModelsAndSemistableAbelianVarieties §§1.7–1.8 with what §§6.30 and 5.11 take from them. Layer 4 Dependencies: add "AnabelianGeometryAndNonabelianChabauty §§5.6, 5.8, 5.10–5.11; HeightsRationalPointsAndObstructions §§1.15a–1.17; AlgebraicCurves Layer 10". Layer 5: add "AlgebraicCurves Layer 10; EllipticCurves Layer 4; JacobianChallenge Layers D–F; StableReduction Layer 5". Layer 6: add "NewtonPolygons §§3.4, 4.3; RestrictedPowerSeries §2.2; AbelianSchemesAndArithmeticModuli A3.9, A6.14, A6.15; AlgebraicCurves Layers 7, 9–10; DiophantineApproximationAndTranscendence §4.5". Line 3005: "§§L0.10, L0.13, L0.17".

## R05 (P3) — A wrong internal reference in §3.28 and a Check of §3.19 outside the theorem's hypothesis

**Location:** README line 4026: "explicit inputs for any §3.7 conclusion"; line 3713: "the `degree-0` subgroup of `⊕ℤP_i` maps onto `(ℤ/3)³` in `∏_{q∈{3,5,7,11,13}} Pic(C/𝔽_q)`".

**Claim:** §3.7 gives the rank bound of §3.28; the Check is an instance of §3.19.

**Witness:** §3.7 is the elliptic 2-descent bound; the proof paragraph and `*Needs:*` of §3.28 use §3.23. §3.19 requires `ℓC_i = 0`; `#J(𝔽₇) = 2·7·11·47` is prime to 3, so `Pic⁰(C/𝔽₇)` is not killed by 3.

**Repair:** Line 4026: "for any §3.23 conclusion". Lines 3713 and 4067–4068: "has image of `𝔽₃`-dimension 3 in `∏_{q∈{3,5,7,11,13}} J(𝔽_q)/3J(𝔽_q)`".

## Previous findings

- R01 (ModularCurvesPartII contracts) — repaired: line 355 "§9.7 supplies the rational-point/Galois-image criterion for `j∉{0,1728}`, and that the fibres of `X_s(13)` over `j = 0` and `j = 1728` contain `ℚ`-points" (the supplier's §9.7 states both at its open head); line 380 states §17.2 for `p ∤ N`; lines 423–427 make the model, cusp, CM and Hecke identifications hypotheses.
- R02 (unused suppliers) — repaired: neither FiniteFlatGroupsAndIntegralPadicHodgeTheory nor DeligneWeightsAndPurity occurs.
- R03 (§5.22 locator) — repaired: line 5996 "§12, Lemma 12.1 and the Remark after it, p. 17 (arXiv v4)" (bmsst2008 line 886).
- R04 (proof openers) — repaired: no "For the proof, " before a capital; line 7924 "For the proof of (i) and (ii), a solution gives".
- R05 (code spans) — repaired at the named lines; spans of the same kind elsewhere are R03.
- R06 (implementation vocabulary) — repaired at the named lines ("helper", "pseudocode", "OCR" absent); the bullets of the same kind elsewhere are R01.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.2 isolating data | `X²−2` on `[1,3/2]`; `X²+1`, disc `(i,1/2)`; `1/√2` | `1 < 1.4142 < 1.5`, `−√2` outside; `|−i−i| = 2 > 1/2`; `2·(1/2) − 1 = 0` | correct; deWeger1989 line 1568 (p. 33) is background only |
| §1.5 p-adic lattice | `p=3,m=1,β₁=0,β₀=1`; `n=1`; `m=0`; `Γ_{m+1}⊆Γ_m` | `A=[[1,0],[0,3]]`, `b=(0,1)`: `Λ′=0`, `b+y=(0,0)`; sign `+1` gives `b₂≡2`; `β^(m+1)−β^(m) ∈ p^mℤ` | correct; tzanakisDeWeger1992 lines 794–812 (Lemma 14, pp. 260–261); deWeger1989 lines 2903, 2982 |
| §2.12 large `|Y|` | minimal `|β^{(i₀)}|`; (ii) with `n ≥ 3` | `|Y||ξ^i−ξ^{i₀}| ≤ 2|β^i|`; `ĉ₁|Y|^{−n} ≤ ¼|Y|^{−2} < 1/(2den²)`; `∛2 = [1;3,1,5,1,1,4,…]` | as tzanakisDeWeger1989 lines 185–217 (pp. 103–104) |
| §2.27 Thue–Mahler data | `(3,1,2)`, `(3,1,1)` for `X³−2`, `p=5` | `27−2 = 25 = 5²`; `25 ≠ 5` | correct; tzanakisDeWeger1992 lines 1047–1059 (p. 271); duplicates R02 |
| §3.2 local image | `x³−x` at `∞`, 2, 3, 5; `ζ₃` in `ℚ₂(ζ₃)` | `f(−1/2)=3/8`, `f(2)=6`; vectors `(+,−,−)`, `(+,+,+)`, `#H_∞ = 2 = 4/2`; `f(1/4) = −15/64`, `−15 ≡ 1 (8)`; `2·4 = 8`; `n₃ = 6` | correct; fps1995 lines 465, 662; wording R03 |
| §3.19 rank lower bound | `G = ℤ^r ⊕ T`; `A[ℓ]=0`; `A_tors=0` | `dim G/ℓG = r + dim T[ℓ]`; `k ≤ r + dim A[ℓ]`; `m − (m−k) = k` | correct; stoll2008 lines 279–306; Check R05 |
| §3.28 `C₁(3₂)` | `g(±2)`; Legendre symbols at 743; torsion | `g(2)=73`, `g(−2)=33`; `73^371 ≡ −1`, `33^371 ≡ 1 (743)`; `gcd(27,43)=1` | correct; poonen1995 lines 480–487, 578–587; errata line 18; reference R05 |
| §3.29 `X₀^dyn(6)` | torsion orders; rank of `G` | `gcd(2·7·11·47, 3·17·23·43) = 1`; `10 − 1 − 6 = 3`; `L‴ ≈ 0.83601` | as stoll2008 lines 268–306, 490–499 |
| §4.15 hyperelliptic charts | even and odd degree at `∞`; `C₀(5)`, `C₁(3₂)` at 3 | `x^i dx/y = −u^{g−1−i}du/v`; orders `g−1−i`, `2(g−1−i)`; `g(1)=9`, `g′(1)=22≡1 (3)`; zero totals `2 = 2g−2` | correct; mccallumPoonen lines 420–436; poonen1995 line 618 |
| §5.10 unique residue fibres | `Γ = 0`, two points, one known | `q_L∘j` not injective, conclusion fails | correct; bruinStoll2010 lines 41–60 |
| §5.14 index prime to `N` | `Γ=ℤ,H=3ℤ,N=2`; `H=2ℤ,N=2`; infinite index | `H∩2ℤ = 6ℤ = 2H`; `3 − 1 ∈ 2ℤ`; `2ℤ/4ℤ → ℤ/2` zero; `gcd(0,N)=N` | correct; bruinStoll2010 lines 741–745 |
| §5.18 one point per coset | `Γ=ℤ,N=3,H′=2`; `ℤ/2×ℤ`, `N=1` | `9 > 8`, coset `{…,−2,1,4,…}` has only 1; `(1,0)−(0,0) ∈ Γ`, both height 0 | correct; bruinStoll2010 lines 570–576 |
| §5.22 integral points | toy instance; `W=∅`; supplier bound | `(10−2)² = 64 > 30`; `∅ + L = ∅`; supplier `baker_superelliptic`, `n=2`: `(4N)^{2^12N⁴}e^{50N⁴h}` bounds `log max(1,|x|)` | correct; bmsst2008 lines 886–920; bruinStoll2010 lines 639–642, 689 |
| §6.12–6.13 local height | block solve of `GS = S·diag(1,F,p)`; `x=b=b₀` | `α=(I−F)⁻¹f`, `βᵀ=gᵀ(F−p)⁻¹`, `γ=(h+gᵀα)/(1−p)`; `f(b₀)=h(b₀)=0` gives `h_p = χ_p(0) = 0` | correct; bdmtv2019annals lines 1697–1702 (p. 924) |
| §6.18 quartic of `X_s(13)` | identity on `{−3..3}³`; seven points; `𝔽₁₇` | `Q(X−Y,X+Y,X+Z) = 16B`; `Q(P_i)=0`; 20 points, no singular one, 17 in `U₁`, `∂Q/∂Y(1:1:1)=0`; `B(0,1,1)=−1`, `B(2,1,1)=−7`; `8·182/12 < 122` | correct; bdmtv2019annals lines 1910–1929 |
| `matveev_lower_bound` | `[K:ℚ] < D`; `B=0`; both `κ` | `1+log D′ ≤ 1+L`; `n³s ≥ n^3.5`; `2.7182818286 > e`; `B=0` forces `Λ=0` | follows from supplier `matveev` (its `Suggested.lean` line 665) |
| `yu_valuation_upper_bound` | `f<d`, `e>1`, non-generating `α` | `p^f−1 ≤ p^d−1`; `ord_𝔭/e ≤ ord_𝔭`; `‖log‖/10 ≥ ‖log‖/(10d₀)`; `hb` follows from `hne` | follows from supplier `yu` (line 692) |
| `canonicalHeight_sub_naiveHeight_cremona`, `_silverman` | doubling of the half-height bounds | `2·0.961 = 961/500`, `2·1.07 = 107/50`, `2·0.973 = 973/500`; `cremonaMu = 2μ(E)` | consistent |
| `mordellWeil_basis_of_height_and_saturation` | index `n > 1`; `r=2` | `λ ≤ γ(det/n²)^{1/r}` gives `n ≤ √R(γ/λ)^{r/2}`; `R≤9, λ≥1, γ²=4/3`: `n² ≤ 12` | true as stated |
| `roots_determined_of_truncation` | ball of radius `ρ=p^{−N/d}` with `m<k` roots; `m=k=d` | `sup_B|G| = ρ^m∏r_j > ρ^d ≥ sup_B|G−H|`, so equal root counts per ball; unit coefficients agree as `p^{−N}<1` | true as stated |
| `thue_quartic_i`, `_ii` | `|X|,|Y| ≤ 300` | `±(1,0)`; the eight listed pairs | correct |
| `integralPoints_…`, `triangular_…` | `−3 ≤ x < 2·10⁶`; `n < 10⁶` | abscissae `−2,−1,0,2,3,4,10,12,20,114,1274`; `n ∈ {3,15,20,44,608}`, `T_22736 = 636·637·638` | correct |
| `sUnit_two_to_thirteen` | `z ≤ 2·10⁸` | 545 pairs, 514 within the six bounds, largest `z = 1771561` | correct |
| `thueMahler_cubic` | 72 tuples; box `0 ≤ x < 6000`, `|y| ≤ 6000` | 72 distinct, each `|F| = 2^a3^b5^c7^d`, coprime, normalised; 71 in the box, none unlisted | correct |

- Source locators checked against the text: 22, in 10 sources (deWeger1989, tzanakisDeWeger1989, tzanakisDeWeger1992, fps1995, stoll2008, poonen1995 with the author's errata, mccallumPoonen, bruinStoll2010, bmsst2008, bdmtv2019annals); all agree.
- Library declarations opened at the pins: Tau Ceti `valuation_log_sub_log` (`TauCeti/NumberTheory/LocalField/Logarithm.lean` line 254), `PowerSeries.evalAt` and `IsRestricted.hasSum_evalAt` (`TauCeti/RingTheory/PowerSeries/EvalAt.lean` lines 96, 432), `exists_isDistinguished` (`…/PowerSeries/GaussNorm.lean` line 402), `μ`, `M`, `normM` (`…/MordellWeil/XSubT.lean` lines 861, 346, 1058), `localRes` (`…/MordellWeil/LocalCondition.lean` line 170), `neronTatePairing`, `regulator`; Mathlib `absLogHeight₁` (`Mathlib/NumberTheory/Height/NumberField.lean` line 145), `natDenominator_le_mulHeight₁` (line 323); the other 38 names of lines 140–187 that were searched are at the pins.
- Cross-roadmap citations resolved at main or the open heads: ModularCurvesPartII §§5.11, 6.1–6.2, 9.4–9.8, 11.8, 13.1–13.4, 16.1–16.7, 17.2; DiophantineApproximationAndTranscendence §§0.1–0.3, 3.6–3.7, 4.1–4.5 with `matveev`, `yu`, `yu_rat`, `yuValuationAdapter`, `baker_superelliptic`; ColemanIntegration §§L0.10, L0.13, L0.17, L1.1, L1.3, L1.8, L1.20; AnabelianGeometryAndNonabelianChabauty §§2.0–2.7, 5.6, 5.8, 5.10–5.11, 6.1–6.8; HeightsRationalPointsAndObstructions §§0.19, 0.24, 1.15a–1.19; GeometryOfNumbersAndQuadraticArithmetic §5.1 (`lllCoefficient`, `IsLLLReduced`, `lll_short_vector_factor`); NeronModelsAndSemistableAbelianVarieties §§1.7–1.8, 3.8; PadicDifferentialEquationsAndRigidCohomology §RD.7.18; AbelianSchemesAndArithmeticModuli A3.9, A6.14, A6.15; NewtonPolygons §§3.4, 4.3; RestrictedPowerSeries §2.2. All exist.
- Gate (worker, a9bb521): every counter 0, `build=0`. `lake env lean` on `Suggested.lean`: twelve `declaration uses sorry` warnings, nothing else. One-tactic probe (`rfl`, `trivial`, `omega`, `simp`, `norm_num`, `infer_instance`, `simp_all`, `aesop`, each required to close the goal) on a scratch copy: all twelve theorems stay open. Signatures compared with §§2.3, 2.5, 3.12, 3.22, 6.16, 6.36–6.39: same generality, no lost binder. No change outside the folder.
- Dependency check: `depcheck: 245 roadmaps, 2240 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Pull request text against the head: no sentence contradicted; the eight open suppliers it lists are exactly the roadmaps not on main that the README cites as suppliers; the folder is new.
- Overlap check: read ComputationalNumberTheory, ArithmeticDynamics, AnabelianGeometryAndNonabelianChabauty, HeightsRationalPointsAndObstructions, HyperellipticCurves, DiophantineApproximationAndTranscendence, ClassicalArithmeticCompletion, EllipticCurves. Affine lattice sets (§§1.7–1.8), saturation and descent data (§§3.5–3.22), the `x − T` rank bound (§3.23) and the point lists of §§3.26–3.29: owner this roadmap, cited by ComputationalNumberTheory, HyperellipticCurves (§5.2) and ArithmeticDynamics. Mordell–Weil logarithmic span, chart Strassmann bound, classical Chabauty finiteness: owner AnabelianGeometryAndNonabelianChabauty, cited here. Matveev, Yu and the superelliptic bound: owner DiophantineApproximationAndTranscendence, cited here. ArithmeticDynamics declares three gaps against this roadmap (rational points of models of `X₁(13)`, `X₁(16)`, `X₁(18)`) that this README does not state; ModularCurvesPartII line 4544 names this roadmap's Layer 6 as "ED.6".
- Source independence: 13 passages compared with 10 sources, none shared (longest common run outside formulas: 7 words with stoll2008 line 272, a theorem statement); largest share bruinStoll2010, 37 of 295 linked locators (bdmtv2019annals 33); contents compared with bruinStoll2010 and bdmtv2019annals: §§5.18–5.26 run beside Bruin–Stoll §§4.2–6 with §§5.20, 5.21, 5.24 from other sources between and its §4.1 last (§5.29); §§6.5–6.14 and 6.18–6.28 run beside BDMTV §§4–6 with the model (its §6.3) before the ranks (its §6.1) and §§6.15–6.17 between; the order is forced by the `*Needs:*` of §§5.19, 5.22, 6.12, 6.13: independent.

## Not verifiable

- deWeger1989, Lemma 3.15 (p. 65): the extraction drops the displayed vector `y`; the sign that §1.5 says is printed was not confirmed.
- tzanakisDeWeger1992, §15 example (p. 263): the table with `m = 1152` is not in the extracted text; the weights `W_j = 1` and dimension six are (line 872).
- bruinStoll2010: the arXiv v2 text was read; the published page numbers of its locators were not checked.
- matveev2000 and yu1994: not read; §§2.2–2.5 and the two Lean statements were compared with `matveev` and `yu` of DiophantineApproximationAndTranscendence on main.
- bdmtv2021, silverman1990, siksek1995, cremona1997ch3, box2021 and the locators outside the sample were not read this round.
- The numerical tables of §§6.19–6.31 and 6.35 (Hecke, Frobenius and height matrices, disc expansions, point lists) were not recomputed.

## Source issues

- **Error** in poonen1995 at §4, proof of Proposition 1, pp. 14–15: the source says a 743-adic point with abscissa 2 and ordinate the square root of 33 lies on the curve; it should be abscissa −2, and the descent then needs the 2-adic information; affects the proof; corrected in print at the author's errata, §2, first item.
- **Misprint** in bdmtv2019annals at §5.3.2, the transport formula, p. 923: the source says the single integrals of the two transport matrices run from the point to its Teichmüller representative on the left and the reverse on the right; it should be the opposite, so that the lower-left block is the integral from the base point to the point; affects a stated result.

## For the human reviewers

- Reuse: README §6.35 (lines 7817–7898) gives the nine quartic models with their point lists and CM discriminants as in bdmtv2021 Examples 5.7–5.15; `ED6.thueMahlerSolutionList` (`TauCetiRoadmap/EffectiveDiophantineMethods/Suggested.lean` lines 271–291) keeps the order of the table of tzanakisDeWeger1992 §18.
- Licence: deWeger1989 (`ir.cwi.nl`), tzanakisDeWeger1989 (`ris.utwente.nl`), bdmtv2019annals (`annals.math.princeton.edu`), mccallumPoonen and the Poonen errata (author's page) are on hosts the sources service does not classify; they were read as institutional, publisher-open and author copies.
- Licence: README lines 446–449 say the exact-algebraic interface "follows the design of" a blog post; no Lean text from it is in `Suggested.lean`.
- Licence: README lines 3235 and 8151 cite a raw data file of the `JohnCremona/ecdata` repository for the curve 571a1; its licence was not read.
