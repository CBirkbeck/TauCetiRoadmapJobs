# Review of EffectiveDiophantineMethods (pull request #1046 at 4a3e37f)

**Verdict:** needs changes

Full review. The gate passes at this head and nothing is blocking: six P3 findings, all in the README's form and locators.

## R01 (P3) — The labels `ED.0` … `ED.6` are used about ninety times and defined nowhere

**Location:** `TauCetiRoadmap/EffectiveDiophantineMethods/README.md` line 533: "its canonical record is the `ED.0` normalized p-adic ball data `(N, v, s)`"; line 253: "(in `ED.4`, the Jacobian of a smooth projective curve over `ℚ`)"; line 358: "explicit ED consumer hypotheses".

**Claim:** Every term is the literature's or is defined where it first appears.

**Witness:** `ED.0` 28 times, `ED.1` 19, `ED.2` 19, `ED.3` 9, `ED.4` 6, `ED.5` 2, `ED.6` 1; no sentence says what `ED.k` is. Lines 577–578 call the same record "`ED.0` exact algebraic/ball data record".

**Repair:** Replace each label by the layer or section it stands for: "the canonical record `(N, v, s)` of §0.1"; "`ED.2` rational logarithm/error bounds" → "the logarithm enclosures of §2.1"; "`ED.3` data" → "the data of §3.21"; "`ED.4` data" → "the datum of §4.17"; "`ED.1` congruence lattice" → "the lattice of §1.5"; "in `ED.4`" → "in Layer 4"; "ED consumer hypotheses" → "hypotheses of Layer 6".

## R02 (P3) — Backticked names of this roadmap that `Suggested.lean` does not declare

**Location:** README line 1413: "For a nonsingular integer matrix `A` and rational target `y`, `ED1.DistanceWitness` means a rational lower bound"; line 573: "`RealEnclosure.ofRat q` has width 0"; line 649: "`RealRootIsolation.refine` denotes a chosen witness"; line 4202: "the four listed in `datum_C05_three`".

**Claim:** A backticked name of the roadmap's own is declared in `Suggested.lean`; the description says "README identifiers absent from Lean, Check labels, round labels and empty Lean sections are all zero".

**Witness:** `Suggested.lean` has no namespace `ED1` and none of `DistanceWitness`, `RealEnclosure`, `RealRootIsolation`, `datum_C05_three`; its 20 declarations are in `ED2`, `ED3`, `ED6`.

**Repair:** Write them as prose: "a distance witness for `(A, y)` is a rational lower bound …"; "the degenerate enclosure `[q, q]` of a rational `q` has width 0"; "the refinement of an isolation denotes a chosen witness"; "the four residue discs of §4.23". Line 567 likewise (`a.N=e.precision`, `a.denotation`; see R04). The description's sentence then holds.

## R03 (P3) — Nine targets are bold run-in paragraphs, cited as sections that have no heading

**Location:** README line 2224: "**2.14 The exponents are logarithmic in `|Y|` and `Λ` decays exponentially.**"; line 133: "§§6.17–6.21, §6.23a, §6.22, §6.23, then §§6.24–6.39".

**Claim:** Every target is a `### k.n` subsection.

**Witness:** §§2.14, 2.15 (lines 2224, 2249), 6.6–6.9 (6630, 6661, 6701, 6738) and 6.24–6.26 (7483, 7534, 7575) have no `###` heading and are cited about sixty times (e.g. lines 2101, 6744, 7573); the headings run 2.13 → 2.16, 6.5 → 6.10, 6.23 → 6.27, and 5.6 → 5.8.

**Repair:** Turn the nine bold lines into headings, "### 2.14 The exponents are logarithmic in `|Y|` and `Λ` decays exponentially" and so on (each already has its own Checks, locators and `*Needs:*`). Renumber §§5.8–5.29 down by one with their citations, or say in "Build order" that no §5.7 exists.

## R04 (P3) — A second statement, in implementation language, follows the proof in many sections

**Location:** README line 567 (§0.1): "For e : PadicEnclosure p x, return a : `ED.0` normalized p-adic ball data p with `a.N=e.precision` … The `(5,1)` at `p=3` test must return `(1,0,2)`"; line 6905 (§6.12): "prove that the unique Frobenius-compatible unipotent splitting `S=s0⁻¹sφ` has `α=(I−F)⁻¹f(x0)`".

**Claim:** Each target is stated once, as mathematics.

**Witness:** Line 6905 restates lines 6884–6893 of the same section; the opening "Put `A=Γ(Y,O_Y)`, `K=Q(X)=Frac(A)`" recurs at 6868, 6905, 6938, 6973. 45 sections have a paragraph between the proof and the Checks (§§0.1, 0.2, 0.6, 0.7, 0.9, 2.23, 3.5, 4.17, 6.3, 6.4, 6.11–6.14, 6.16, 6.18–6.29, …).

**Repair:** Delete the paragraphs at lines 567, 6539, 6868, 6905, 6938, 6973 and the paragraph "The Lean statement `ED6.roots_determined_of_truncation` has the following form" of §6.16 (it says "over completed Cp"; line 7050 and the Lean say any complete algebraically closed extension); move a hypothesis that occurs only there into the statement. In §3.12 move the number-field statement (line 3509) above "Work under the following conditions" and drop "Unit-test `b₂=0`, `K=Q` …". Do the same in the remaining sections of the list.

## R05 (P3) — Four locators

**Location:** README lines 4019–4022 (§3.26): "§1, p. 4 (arXiv:math/9512217v1); … §3, pp. 10–11"; line 919 (§0.8): "§3.13, Lemma 3.17(i), printed p. 67"; line 5136 (§4.21): "Lemmas 3.3–3.4 p.222".

**Claim:** Each claim has a locator into a text that contains it.

**Witness:** poonen1995 line 317: `E24` is on p. 9; "11X" occurs in neither poonen1995 nor fps1995, so Morton's `Y² = 4X³ − 11X² + 8X` has no source. deWeger1989 lines 3077–3104: Lemma 3.17(i) concerns the sublattices `Γ*_μ`. siksek2009sym line 857: Lemma 3.3 is on p. 221.

**Repair:** §3.26: "§3, pp. 9–11", and add the locator of the paper that gives Morton's curve and its six points (add it to the References), or remove that curve. §0.8: drop the de Weger locator (the Tzanakis–de Weger §4, p. 227 one supports the paragraph on primes and embeddings) or cite it only for "§3.13, p. 66" on p-adic approximations. §4.21: "Lemmas 3.3–3.4, pp. 221–222".

## R06 (P3) — Sentences damaged by substitution

**Location:** README line 329: "using only `κ(J(Q)) ⊗ Q_p` (using the full tensor product)"; line 356: "plane-curve Frobenius lift `𝔽_p` on the weak completion … with `𝔽_p^*ω_i = Σ_j F_ij ω_j + df_i`"; lines 8241–8242: "ModularCurvesPartII ModularCurvesPartII §§9.5–9.8,ModularCurvesPartII §9.7".

**Claim:** The supplier contracts say what is consumed.

**Witness:** Line 329 asserts both readings; line 6530 has "with the corrected use of `κ(J(Q))⊗Q_p` that only `κ(J(Q)) ⊗ Q_p` is used". `𝔽_p` names a finite field at line 264. Line 6900: "(ColemanIntegration ColemanIntegration §L1.20)". Lines 3830, 3869: "(p-saturated)", "(p-saturated: finite index and p-saturated `⇒ p ∤` index)".

**Repair:** Line 329: "using only the image `κ(J(Q)) ⊗ Q_p`, not all of `H¹_f`"; line 6530 the same. Line 356: "Frobenius lift `φ` … with `φ^*ω_i = Σ_j F_ij ω_j + df_i`". Lines 8240–8242: "ModularCurvesPartII §§9.5–9.8, 11.8, 16.1–16.7, 17.2". Line 6900: "(ColemanIntegration §L1.20)". Lines 3830, 3869: "(§3.17)".

## Previous findings

- R01 (Chabauty owners) — repaired: lines 58–65 "AnabelianGeometryAndNonabelianChabauty §5.10 owns the Mordell–Weil logarithmic span … §5.6 the Strassmann bound on a residue chart, and §5.11 classical Chabauty finiteness"; §§4.8, 4.9, 4.11, 4.12 cite them (lines 4541, 4583, 4667, 4714) and their `*Needs:*` (4707, 4738).
- R02 (`seriesValue`) — repaired: `Suggested.lean` line 5 imports `TauCeti.RingTheory.PowerSeries.EvalAt`, lines 199 and 204 use `G.evalAt w`; `seriesValue` occurs nowhere.
- R03 (Strassmann) — repaired: line 5330 "Tau Ceti `TauCeti.PowerSeries.IsDistinguished.encard_setOf_evalAt_eq_zero_le` supplies Strassmann's theorem at any radius"; scope line 49.
- R04 (§3.10 notation) — repaired: lines 3418–3423 define `H(d₁, c, d/d₁)`, `α`, `n₁`, `S^{(φ′)}`, `n₂` and the primed objects; `*Needs:*` has "HeightsRationalPointsAndObstructions §1.19 … §3.9".
- R05 (slugs) — repaired but for "(p-saturated)" at lines 3830 and 3869 (R06).
- R06 (code spans) — repaired: 8 spans with unbalanced brackets remain, all half-open intervals; no word glued to a number.
- R07 (double statements) — repaired where named (§§4.8, 4.13, 4.23–4.25 state once); the same pattern elsewhere is R04.
- R08 (extraction residue) — repaired: no "text layer", "page image" or "PDF chapter"; line 5321 "§3 Lemma 4, pp. 7–8".

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.8 valuation data | `p = 7`, `X² − 2`, `a = 3`; product rule; `ℚ(√3)` at 3 | `θ ≡ 10 (49), 108 (343)`; `(7,2)`: `v = 1`; `(98,3)`: `v = 2`; precision `min(v+N′, N+v′) > v+v′`; `e = 2`, no embedding | correct; one locator (R05) |
| §0.9 precision rules | `B(3,4)·B(9,5)`; `B(9,5)⁻¹`, `x = 252`; `B(0,4)·B(9,5)`; pivot `s = 2` | `min(4+2, 5+1) = 6`; `ord₃(1/252 − 1/9) = 5 − 4 = 1`; `min(4+2, 5+4) = 6`; `9 − 2 = 7` | correct |
| §1.3 homogeneous reduction | `θ = (log 2, log 3)`, `C = 10⁸`; de Weger and Tzanakis–de Weger special cases | `69314718·(−1054) + 109861229·665 = 4513`; `L² = 10739042.5 ≥ 10⁷`; `485 log 2 − 306 log 3 = 1.02·10⁻³`; `μ > 0 ⇔ b₁² > (q²+q−1)2^{q−1}K₃²` | correct; deWeger1989 line 2512, tzanakisDeWeger1989 line 479 |
| §2.28 Thue–Mahler lists | against the §6.39 instance | box `0 ≤ x < 3000, |y| ≤ 3000`: 70 solutions, all in the list, none missing | consistent |
| §3.12 Cremona, Silverman (headlines) | `y² = x³ + B`; doubling | `μ_C = log(432B²)/6`; Cremona `1.922`, `2.14` (cremona1997ch3 lines 701–703, 730); Silverman `0.973`, `1.07` (silverman1990 line 100), `2·0.973 = 973/500` | as in both sources |
| §3.13 height enclosure | `(2,3)` on `y² = x³ + 1`; widths | order 6, `ĥ = 0`, `h = log 2`; `1/8 + 2 + 3 = 41/8`; `40/4⁶ = 0.0098 < 10⁻²` | correct |
| §3.16 index bound | `r = 1`; `R ≤ 9`, `λ ≥ 1`, `r = 2` | `(4/π)Γ(3/2)² = 1`; `n² ≤ 9·4/3 = 12`, `n ≤ 3` | correct |
| §3.21 finite-index datum | `r = 0`, `G = A_tors`; all `p ≤ N`, index `≤ N` | `G = A`; a prime factor of the index is `≤ N`, excluded | correct |
| §3.22 `mordellWeil_basis_of_height_and_saturation` | index `n > 1` | `λ ≤ γ(det/n²)^{1/r}` gives `n ≤ N`; `p ∣ n` gives `Q ∉ G`, `pQ ∈ G`, against `hsat`; `det > 0` so no absolute value | true as stated |
| §3.26 rank-zero curves | five models; listed points | `(c,d)`: `(−7,16)`, `(9,16)`, `(−1,1)`, `(3,1)`, `(−11,32)`; `d′ = −15, 17, −3, 5, −7`; all listed points on the curves; `(−1,1) ∉ E24` | correct; locators R05 |
| §4.11 zero bounds | `m < p−2`; `p = 2`; Checks 1, 2 | `i − v_p(i) > m+1` for `i > m+1`; `p = 2` forces `m = 0`, `i − v₂(i) ≥ 2`; minima at `i = 2` and `i = 3` | correct |
| §4.14 bad reduction | good-reduction case; mccallumPoonen lines 601, 621, 643–651 | `Σ n_C ≤ H·𝒳_s = K·𝒳_s = 2g − 2`; smooth model gives §4.13 | as in Theorem A.5 |
| §4.20 symmetric-square datum | `2P` versus `P + P₀`; `p = 2` | two distinct divisors; `a₁/2` needs `p` odd; box2021 lines 205–222 | correct |
| §4.21 symmetric Chabauty | box2021 lines 224–225; siksek2009sym line 669 | hypotheses `p > 2`, `p ≠ 3` when the residue degree is 1, rank 2; `k < 2` gives nothing | as in the sources |
| §4.23 `C₀(5)` at 3 | verdicts | `1 + 1 + 2 + 2 = 6 = #X̃(𝔽₃) + 2g − 2`; `v(a_i)+i = ∞, 2, 2, 5, 4`, `N₃ = 2` | consistent with §4.11 (c) |
| §5.22 integral points | toy instance; `W = ∅` | `(10 − 2)² = 64 > 30`; bound `(4N)^{2^{12}N⁴}e^{50N⁴h}` is the supplier's §4.4 at `n = 2`, `b = 1` | correct |
| §5.28 sieve soundness | `ℤ/2`, local images `{0}`, `{1}` | candidate set nonempty with no point: no conclusion, as stated | correct |
| §6.12 Frobenius splitting | `G S = S·diag(1, F, p)` with `G` of (45) | `α = (I−F)⁻¹f`, `βᵀ = gᵀ(F−p)⁻¹`, `γ = (gᵀα + h)/(1−p)`; `f(b₀) = h(b₀) = 0` (bdmtv2019annals lines 1571, 1590) | correct; source misprint below |
| §2.3 `matveev_lower_bound` | `κ = 1, 2`; `[K:ℚ] ≤ D` | `n³s ≥ n^{3.5}`, `1 + L ≥ log(eD)`, `27182818286/10¹⁰ > e`; `d₀h ≤ Dh ≤ A` | follows from the supplier's `matveev` (line 665) |
| §2.5 `yu_valuation_upper_bound` | `K₀ = ℚ(α) ⊆ K`; `e > 1` | `p^f − 1 ≤ p^d − 1`; `1/logLower^{n+1} ≥ (log p)^{−(n+1)}`; `ord_𝔭/e ≤ ord_𝔭`; `‖log‖ ≤ 10h ≤ 10d₀h` | follows from the supplier's `yu` (line 692) |
| §6.16 `roots_determined_of_truncation` | `G = T^d`, `H = T^d − p^N`; a cluster of `k < D` zeros; `k = D = d` | roots of `H` at distance `p^{−N/d}`; ball norm `ρ^k∏r_j > ε` when `k < D`; equality case forces all roots into the one ball | true as stated |
| §6.36 `thue_quartic_i`, `_ii` | `|X|, |Y| ≤ 300` | `±(1,0)`; the eight listed pairs | correct |
| §6.37 integral points, triangular numbers | `−3 ≤ x < 2·10⁶`; `m < 3·10⁶` | abscissae `−2, −1, 0, 2, 3, 4, 10, 12, 20, 114, 1274`; `n ∈ {3, 15, 20, 44, 608, 22736}` | correct |
| §6.38 `sUnit_two_to_thirteen` | 13-smooth `z ≤ 10⁹` | 545 solutions, 514 within the six bounds, largest `z = 11⁶ = 1771561` | correct |
| §6.39 `thueMahler_cubic` | the 72 tuples | 72 distinct, each `|F| = 2^a3^b5^c7^d`, coprime, normalised | correct |

- Source locators checked against the text: 24, in 12 sources (deWeger1989, tzanakisDeWeger1989, tzanakisDeWeger1992, cremona1997ch3, silverman1990, poonen1995, mccallumPoonen, box2021, siksek2009sym, bdmtv2019annals, bruinStoll2010, yu1994); 20 agree, four are R05.
- Library declarations opened at the pins: Mathlib `hensels_lemma` and the private `soln_dist_to_a` (`Mathlib/NumberTheory/Padics/Hensel.lean` lines 460, 428), `mulHeight₁_eq_max` (`Mathlib/NumberTheory/Height/NumberField.lean` line 532), `Point.naiveHeight_eq_logHeight₁` (`Mathlib/NumberTheory/Height/EllipticCurve.lean` line 43); every other dotted name of the README (611 distinct) was found by its last component in the pinned Mathlib or Tau Ceti, apart from this roadmap's own (R02) and `Polarization.rosati`, which is a supplier roadmap's.
- Cross-roadmap citations resolved at main or the open heads: AnabelianGeometryAndNonabelianChabauty §§2.0–2.7, 5.6, 5.8, 5.10, 5.11, 6.1–6.8; HeightsRationalPointsAndObstructions §§0.19, 0.24, 1.15a–1.19; ColemanIntegration §§L0.2, L0.10, L0.13, L0.17, L1.5, L1.6, L1.8, L1.9, L1.14, L1.15, L1.19, L1.20; GeometryOfNumbersAndQuadraticArithmetic §5.1 with `IsLLLReduced`, `lll_short_vector_factor`; DiophantineApproximationAndTranscendence §§3.6–3.7, 4.1–4.5 with `matveev`, `yu`, `baker_superelliptic`. None missing.
- Gate (worker, 4a3e37f): every counter 0, `build=0`. `lake env lean` on `Suggested.lean`: twelve `declaration uses sorry` warnings, nothing else. One-tactic probe (`simp`, `rfl`, `omega`, `norm_num`, `simp_all`, `infer_instance`, `trivial`) on a scratch copy: all twelve theorems stay open. The elaborated signatures were compared with §§2.3, 2.5, 3.12, 3.22, 6.16, 6.36–6.39: same generality, no lost binder. No change outside the folder.
- Dependency check: `depcheck: 245 roadmaps, 2240 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Definitions (enclosures, data, lattices, sieve data) have three or more Checks; the sections with one or two Checks are theorems. Every section has a locator; every target has one `*Needs:*` line (§6.19 two, §6.30 three, one per part).
- Overlap check: read ComputationalNumberTheory, ArithmeticDynamics, AnabelianGeometryAndNonabelianChabauty, HeightsRationalPointsAndObstructions, ArithmeticStatisticsPartVI, DiophantineApproximationAndTranscendence, ClassicalArithmeticCompletion, EllipticCurves. Mordell–Weil logarithmic span, residue-chart Strassmann bound, classical Chabauty finiteness: owner AnabelianGeometryAndNonabelianChabauty, cited here. Matveev's and Yu's theorems, the superelliptic bound: owner DiophantineApproximationAndTranscendence, cited here. Selected-root data, affine lattice sets, saturation, the point lists of §§3.26–3.28: owner this roadmap, cited by ComputationalNumberTheory (its lines 116–139) and ArithmeticDynamics (its lines 246–256). ArithmeticDynamics also declares gaps against this roadmap for the rational points of models of `X₁(16)` and `X₁(13)` (its lines 262–264) and cites a name `boundedHeightPoints` for §0.11 that this README does not use.
- Source independence: 14 passages compared with 12 sources, none shared (longest common runs outside formulas: 11 words with box2021 line 225 and 9 with mccallumPoonen line 647, both theorem conclusions); largest share bdmtv2019annals, 49 of 387 locators; contents compared with bdmtv2019annals: §§6.5–6.9, 6.10–6.14 and 6.18–6.29 run beside its §§4, 5 and 6 but not one to one (§§6.1–6.4 and 6.15–6.17 have other sources and stand between them), the order being forced by the `*Needs:*` of §§6.11, 6.12 and 6.13: independent.

## Not verifiable

- matveev2000 (Corollary 2.3): not read; §§2.2–2.3 were compared with `matveev` of DiophantineApproximationAndTranscendence on main.
- yu1994 p. 242: the text lacks the displayed bound (lines 46–62); §§2.4–2.5 were compared with `yu` of the same roadmap.
- deWeger1989: the scan's text drops displayed formulas ((3.21) at line 2516, the statement of Lemma 3.17 at lines 3077–3104); pages and subjects were confirmed, not the formulas.
- bruinStoll2010: the arXiv v2 text was read (§4.3 at line 629); the published page numbers of its 44 locators were not checked.
- bdmtv2021, caraianiNewton, fps1995, stoll2008, siksek1995, siksek2013: locators outside the sample were not read this round.
- The numerical tables of §§6.18–6.35 (Hecke, Frobenius and height matrices, disc expansions) were not recomputed.

## Source issues

- **Misprint** in poonen1995 at §3, p. 9 (arXiv v1): the source says the fourth point of the curve of conductor 24 has abscissa −1 and ordinate 1; it should be abscissa 1 and ordinate −1; affects a stated result.
- **Misprint** in bdmtv2019annals at §5.3.2, p. 923: the source says the two transport matrices carry integrals from x to its Teichmüller point and from the Teichmüller point of b to b; it should be the reverse limits, so that the entry is the integral from b to x; affects a stated result.

## For the human reviewers

- Reuse: the 72 tuples of README §6.39 and of `ED6.thueMahlerSolutionList` (`TauCetiRoadmap/EffectiveDiophantineMethods/Suggested.lean` lines 271–291) are listed "in its order", the order of the table of tzanakisDeWeger1992 §18; the set is the theorem, the order is the source's.
- Licence: deWeger1989 (`ir.cwi.nl`), tzanakisDeWeger1989 (`ris.utwente.nl`), bdmtv2019annals (`annals.math.princeton.edu`), siksek2009sym (`msp.org`), silverman1990 (`www.ams.org`), cremona1997ch3 and mccallumPoonen (authors' pages) are on hosts the sources service does not classify; they were read as institutional, publisher-open and author copies.
- Licence: README lines 464–470 say the exact-algebraic interface "follows the design of" a blog post and that a supplier follows `hex-lll-mathlib`'s interface at a fixed commit; no Lean text of either was found in `Suggested.lean`.
