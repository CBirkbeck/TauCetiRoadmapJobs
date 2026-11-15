# Review of EffectiveDiophantineMethods (pull request #1046 at db8e845)

**Verdict:** needs changes

Full review. The gate passes at this head. One P2 (supplier contracts that claim more than the cited sections state) and five P3 findings.

## R01 (P2) — Supplier contracts credit ModularCurvesPartII with statements its cited sections do not make

**Location:** `TauCetiRoadmap/EffectiveDiophantineMethods/README.md` lines 400–406: "From ModularCurvesPartII §§9.7–9.8: … supply the … geometric identification of the listed cusp and CM fibres. … For `S4(13)` certify the actual modular j-map and its three `non-CM projective-S4` fibres"; also lines 362–363, 385–398.

**Claim:** The cited sections provide what each paragraph lists.

**Witness:** ModularCurvesPartII at its open head: §9.7 is the criterion for `j∉{0,1728}` (one Check, at `j=1728`); `S₄` occurs once, a degree Check in §9.6; §17.2 is `(T_p)_*=F+⟨p⟩_*V` for `p∤N` only. README line 7824 already lists "the `j/CM` dictionary" as an input.

**Repair:** Replace lines 385–406 by: "From ModularCurvesPartII §17.2 use the Eichler–Shimura relation `(T_p)_* = F + ⟨p⟩_* V` on the special fibre at a prime `p ∤ N`. From §9.6 use the coarse curve `X_H` for the Cartan levels and for the subgroup of `GL₂(𝔽₁₃)` with projective image `S₄`; from §9.8 `X₀⁺(N)` with its quotient map, and that `j` does not descend to it; from §9.7 the rational-point criterion for `j ∉ {0, 1728}`." Add to "Explicit application inputs": "For §§6.29–6.35 the identification of each printed plane quartic with its coarse curve, the cusp and CM fibres (including those over `j = 0` and 1728), the three non-CM fibres of the `S₄` curve, and the compatibility of the Hecke correspondences with the cusps and Abel–Jacobi maps at the primes used are hypotheses of the applications." Line 362: end the sentence at "for `j∉{0,1728}`". Lines 256–261 and 408–411 have the same imperative form ("construct", "Prove", "Provide"): state what is consumed.

## R02 (P3) — Two supplier edges that no target consumes

**Location:** README lines 5324–5325 (Layer 4 Dependencies): "FiniteFlatGroupsAndIntegralPadicHodgeTheory `R07.1`; DeligneWeightsAndPurity Layer `DWP.1; TauCetiRoadmap.JacobianChallenge` D–F"; lines 256–261: "From DeligneWeightsAndPurity §§1.1–1.4: …".

**Claim:** Every layer dependency is used by a target of the layer.

**Witness:** Of the 180 `*Needs:*` lines none names either roadmap; FiniteFlatGroupsAndIntegralPadicHodgeTheory occurs once in the README (line 5324) and has no contract paragraph. The Weil bounds of §6.12 are taken from ColemanIntegration §L1.8 (line 6840).

**Repair:** Delete both from lines 5324–5325 and delete the paragraph at lines 256–261; or add each to the `*Needs:*` line of the target that uses it and give FiniteFlatGroupsAndIntegralPadicHodgeTheory a contract paragraph.

## R03 (P3) — §5.22 cites a survey paragraph for an inequality whose statement is elsewhere

**Location:** README line 6017: "([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §4.3, published p.282.)", the only locator of §5.22.

**Claim:** The locator supports "If `√w* < √μ` and `dB + δ < (√μ − √w*)²`, then `𝓘 = W`".

**Witness:** bruinStoll2010 (arXiv text) lines 629–691 describe the second sieving stage and refer to Bugeaud–Mignotte–Siksek–Stoll–Tengely for the bound; the inequality `h ≥ (μ₃m(L) − μ₂)² + μ₁` is their Lemma 12.1 (bmsst2008 line 886).

**Repair:** Add to §5.22 and to the References: Y. Bugeaud, M. Mignotte, S. Siksek, M. Stoll, Sz. Tengely, Integral points on hyperelliptic curves, `arXiv:0801.4459v4`, §12, Lemma 12.1, p. 17 (published Algebra & Number Theory 2 (2008), 859–885). Keep Bruin–Stoll for the Check on the sizes `10^100`, `10^1800`, `10^600`.

## R04 (P3) — Proof paragraphs open with a prefix glued to a capitalised sentence

**Location:** README line 3978: "For the proof, For each curve, §3.11 with the exact local tests at the primes"; line 559: "For the proof, Represent real intervals by Mathlib's NonemptyInterval"; line 7824: "The conditions proves the four-point completeness".

**Claim:** The prose is grammatical.

**Witness:** "For the proof, " is followed by a capital letter in 96 sections; "For the proof, For" at lines 998, 1219, 1258, 2224, 2889, 3978, 6288, 7510.

**Repair:** Delete the prefix "For the proof, " wherever a full sentence follows (line 3978 then reads "For each curve, §3.11 …"), or write "Proof route: …" once per section. Line 7824: "The theorem proves the four-point completeness from these finite inputs".

## R05 (P3) — Code spans cut through formulas and through prose

**Location:** README line 533: "and when `v < N s` the residue of `c·p^(−v)`"; line 529: "`max`(`width R`, width `I`)"; line 3046: "`#range(W.μ)=`(`if p=2` then 2 else `1`)`·#ker(`"; lines 6940, 6963, 6971: "`use∞`", "`valuation∞`", "`d_i(η)=−⌊log_p` i⌋".

**Claim:** Each formula is one code span.

**Witness:** Line 533 as written says nothing about `s`; line 5325 "`DWP.1; TauCetiRoadmap.JacobianChallenge`" joins two roadmaps in one span; line 36 "§§3.6–3.7 and `4.1–4.5`, supplies"; line 551 "Z belongs to the box".

**Repair:** Line 533: "and, when `v < N`, `s` is the residue of `c·p^(−v)` in `[1, p^(N−v))` prime to `p`". Line 529: "`max(width R, width I)`". Line 3046: "`#range(W.μ) = (if p = 2 then 2 else 1)·#ker([2] : W.Point → W.Point)`". Line 6940: "are given the valuation `∞`"; 6963: "have valuation `∞`"; 6971: "`d_i(η) = −⌊log_p i⌋`". Line 5325: "DeligneWeightsAndPurity Layer `DWP.1`; JacobianChallenge Layers D–F" (subject to R02). Line 36: "§§3.6–3.7 and 4.1–4.5 supply". Line 551: "`z` belongs to the box".

## R06 (P3) — Implementation vocabulary and editorial directions inside targets

**Location:** README line 4927: "the finite-index helper preserves the points field of the supplied mathematical record"; lines 6944–6946: "retain a separate helper … This is Proposition 4.6, not Proposition 4.1"; line 6963: "Use the published coefficient bound rather than the earlier preprint branch".

**Claim:** Targets are stated as mathematics, timelessly.

**Witness:** "helper" at lines 1919, 2548, 3223, 3598, 4908, 4927, 6944; "(Cremona's pseudocode)" line 3970; "corrected `W.μ`" line 3046; "do not use the preprint's erroneous" line 6971; "(scan with OCR layer)" line 8177.

**Repair:** Delete the bullets at lines 4908 and 4927 (lines 4909 and 4925 already state the facts). Lines 1919, 2548, 3223, 3598: replace "helper" by the statement it names ("the weighted variant", "the uniqueness statement for unramified primes", "the inclusion statement", "the coordinate enumerations below"). §6.15: delete "retain a separate helper … iterated integral", "This is Proposition 4.6, not Proposition 4.1; the latter evaluates `G(P)`", "Use the published coefficient bound rather than the earlier preprint branch", and write the last Check as "With `c1 ≠ 0` the constant enters the bound once: `φ(i) = −2⌊log_p i⌋` for `i ≥ i0`, by (4.21); the arXiv v4 text prints `φ(i) = −2⌊log_p i⌋ + c1` on p. 24." Line 3970: "(Cremona, §3.6, p. 84)". Line 3046: "the pinned `W.A`, `W.M` and `W.μ`". Line 8177: drop "(scan with OCR layer)".

## Previous findings

- R01 (`ED.k` labels) — repaired: no `ED.k` remains; line 532 "canonical record is the normalized ball record `(N, v, s)`".
- R02 (own names) — repaired: line 1401 "a distance witness for `(A, y)`"; line 570 "The degenerate enclosure `[q, q]` of a rational `q` has width 0"; none of the five names remains.
- R03 (headings) — repaired: "### 2.14", "### 2.15", "### 6.6"–"### 6.9", "### 6.24"–"### 6.26" are headings; line 132 "§§5.1–5.6 and §§5.8–5.29, with no §5.7".
- R04 (second statements) — repaired where named (no "must return", "Unit-test", "The Lean statement … has the following form", "over completed Cp"); the remaining implementation sentences are R06.
- R05 (locators) — repaired: line 3990 "§3, pp. 9–12" with "Morton (1992) … §1, equation (5) … p. 345, and §3, Lemma 6, p. 363" (morton1992 lines 114, 848); line 908 keeps only Tzanakis–de Weger §4; line 5095 "Lemmas 3.3–3.4, pp. 221–222".
- R06 (damaged sentences) — repaired at the named lines: line 329 "used only on the image `κ(J(Q)) ⊗ Q_p` of the Kummer map and not on all of `H¹_f(G_T, V)`"; line 356 "Frobenius lift `φ`"; no doubled roadmap names; the damage of another kind is R04 and R05.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.1 enclosures | `(5,1)`, `(0,2)` at `p=3`; `[141/100,142/100]` | `5 ≡ 2 (3)`: record `(1,0,2)`; `c=0`: `(2,2,0)`; `19881 < 20000 < 20164`; `1/100 ≤ 1/64`, `> 1/128` | correct |
| §0.7 zero test | `(1−√2)^10`; `p=7`, `a=3` | `3363² − 2·2378² = 1`; `|σ|² = 2.21·10⁻⁸ > 2·4⁻¹⁴ = 7.45·10⁻⁹`; `10² ≡ 2 (49)`, `θ−3 ≡ 7 (49)`, `v=1` | correct |
| §1.9 residual enumeration | `θ=(1,√2)`, `C=100`, `K_0=6` | `R = 9+36 = 45`; all `|x_1| ≤ 8` tried, shortest `A(−7,5)=(−7,5)`, `74 > 45`; `x=(3,−2)`: `17.2 > 1` | correct; deWeger1989 line 2554 |
| §2.9 Thue sets | `X³−2`; `(X−1)³`; `m=8` | `F(1,0)=1`, `F(−1,−1)=1`, `F(2,0)=8`; `(t+1,t)` infinite family | correct; tzanakisDeWeger1989 line 153 |
| §2.21 Thue–Mahler sets | `(3,1,2)`; `(5^k,0,3k)`; norm identity | `27−2 = 5²`; `gcd = 5^k`; `N(f₀X−Yθ) = f₀^{n−1}F(X,Y)`; `gcd(f₀X,Y)=1 ⇔` both conditions | correct; tzanakisDeWeger1992 lines 41–47, 125–127 |
| §3.1 local index | `x³−x` over `ℚ₃`, `ℚ₂`, `ℝ`; `x³+1` over `ℝ` | `4·1 = 4`; `4·2 = 8`; `#E(ℝ)[2] = 4`, index 2; `#E(ℝ)[2] = 2`, index 1 | correct; fps1995 line 646 |
| §3.10 2-isogeny descent | `(c,d)=(−1,1)`; `y²=x³−68x` | `d₁=−1`: `−u⁴−u²−1 < 0`, `n₂=1`; `d′=−3`: points `(1,2)`, `(1,2)`, `(0,1)` for `d₁=−1, 3, −3`, `n₂′=4`; `−68 ≡ −17` | correct; cremona1997ch3 lines 1043–1053, 1087–1099 |
| §4.4 tiny integrals | McCallum–Poonen Example 3; (d) at `p=3`, `p=2` | series `1−3x+11x²−56x³`; `−2499/2 ≡ 87 = 2·3+3⁴ (3⁵)`; `ord_p(j+2) ≤ j` for `p ≥ 3`, fails at `p=2`, `j=0` | correct; mccallumPoonen lines 459–469 |
| §4.8 closure | `Γ` finite; index prime to `p·#Ã(𝔽_p)` | `r₀ = 0`; `n` invertible on the pro-p kernel and on the finite quotient, so `nΓ̄ = Γ̄ ⊆ Ḡ` | correct; mccallumPoonen lines 168, 182, 332 |
| §4.9 annihilator | `C₀(5)`, `C₁(3₂)` at 3; `M=(1,0)ᵀ` | `∫x dx/y ≡ 72 (243)`; `−72/87 ≡ 69 (81)`; `−75/174 ≡ 68 (81)`, `≡ −1 (3)`; `Mᵀc=0 ⇔ c=(0,t)` | correct |
| §4.14 bad reduction | smooth model; `X₀^dyn(6)` at 2 | one component: `#X̃(𝔽_p)+2g−2`; `g=4`, `2 ≤ 8`, so (3) does not apply | as Theorem A.5 (mccallumPoonen lines 643–662) |
| §5.22 integral points | toy instance; `W=∅`; supplier bound | `(10−2)² = 64 > 30`; `W=∅` forces `𝓘=∅`; supplier §4.4 at `n=2`, `b=1`: `(4N)^{2^12 N⁴}e^{50N⁴ĥ}`, `deg f ≥ 3` | correct; locator R03 |
| §6.15 coefficient bounds | double integral; `p=17`; threshold | coefficient of `t^{m+1}`: `≥ −⌊log_p m⌋ − ⌊log_p(m+1)⌋`; loss 2 at `n=17`; `−ℓ ≤ ⌊b/2⌋ ⇔ −2ℓ ≤ b` | as bdmtv2021 lines 1312–1332; wording R06 |
| §6.32 `X_ns(13)` | 13 discriminants | `(D/13) = −1` at residues 6, 5, 2, 7, 11, 11, 6; `+1` at 10, 9, 1, 10, 12, 9; `6+7 = 13` | correct; bdmtv2019annals line 157 |
| §6.34 `X_S4(13)` (R01) | four points in the quartic | `(1:3:−2)`: `12−27+81+2−96+198−270+12+108+36−8−48 = 0`; the others kill every monomial | consistent |
| §6.35 `X₀⁺(N)` | nine quartics, 68 points | all vanish; sizes 10, 9, 8, 8, 7, 7, 8, 6, 5; `(D/N)=1` exactly for the listed `D` at each `N` | as bdmtv2021 lines 1602–1648 |
| `matveev_lower_bound` | `D > [K:ℚ]`; `B=0`; `κ` | `d²log(ed) ≤ D²(1+L)`; `B=0` gives `Λ=0`, excluded; `2.7182818286 > e`; max over `κ=1,2` | follows from the supplier's `matveev` |
| `yu_valuation_upper_bound` | `f<d`; `e>1`; `v ≤ 0` | `p^f−1 ≤ p^d−1`; `(log p)^{n+1} ≥ logLower^{n+1}`; `ord/e ≤ ord`; right side `> 0` as `log(3d) > 0` | follows from the supplier's `yu` |
| `canonicalHeight_sub_naiveHeight_cremona` | `P=O`; constants | `0 ∈ [−h(j)/12−μ−1.922, μ+2.14]` since `μ ≥ 0` for `|Δ| ≥ 1`; `961/500`, `107/50` | as cremona1997ch3 lines 698–703 |
| `canonicalHeight_sub_naiveHeight_silverman` | `K=ℚ`; doubling | `2·0.973 = 973/500`, `2·1.07 = 107/50`; both heights divided by `[K:ℚ]`; weaker than Cremona's `1.922` at `K=ℚ` | consistent |
| `mordellWeil_basis_of_height_and_saturation` | index `n>1`; pairing normalisation | `λ ≤ γ(det/n²)^{1/r}` gives `n ≤ N`; `p∣n` gives `Q∉G`, `pQ∈G`; pinned `neronTatePairing_self`: `⟨P,P⟩=ĥ(P)` | true as stated |
| `roots_determined_of_truncation` | ball with `k<D` zeros; `k=D`; `D=0` | sup norm `ρ^k∏r_j > ρ^D ≥ ε` when `k<D`; `k=D` by symmetry; both multisets empty at `D=0` | true as stated |
| `thue_quartic_i`, `_ii` | `|X|,|Y| ≤ 400` | `±(1,0)`; the eight listed pairs | correct |
| `integralPoints_…`, `triangular_…` | `−3 ≤ x < 3·10⁶`; `n < 2·10⁶` | abscissae `−2,−1,0,2,3,4,10,12,20,114,1274`; `n ∈ {3,15,20,44,608,22736}` | correct |
| `sUnit_two_to_thirteen` | `z ≤ 10⁸` | 545 pairs, 514 within the six bounds, largest `z = 11⁶ = 1771561` | correct |
| `thueMahler_cubic` | the 72 tuples; box `0 ≤ x < 4000`, `|y| ≤ 4000` | 72 distinct, each `|F| = 2^a3^b5^c7^d`, coprime, normalised; 71 in the box, none unlisted | correct |

- Source locators checked against the text: 37, in 16 sources (deWeger1989, doyleKrumm, tzanakisDeWeger1989, tzanakisDeWeger1992, fps1995, cremona1997ch3, mccallumPoonen, bruinStoll2010, bmsst2008, bdmtv2019annals, bdmtv2021, morton1992, stoll2013, siksek2013, box2021, stoll2008); 36 agree, one is R03.
- Library declarations opened at the pins: Tau Ceti `PowerSeries.evalAt` (`TauCeti/RingTheory/PowerSeries/EvalAt.lean` line 96), `neronTatePairing` and `neronTatePairing_self` (`TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean` lines 368, 383), `regulator` (`…/MordellWeil/Regulator/Basic.lean` line 96), `range_formalPointHomAdicCompletion` (`…/FormalGroup/Point/Range.lean` line 158); Mathlib `Polynomial.homogenize` (`Mathlib/Algebra/Polynomial/Homogenize.lean` line 40), `absLogHeight₁` (`Mathlib/NumberTheory/Height/NumberField.lean` line 145), `analyticOrderAt` (`Mathlib/Analysis/Analytic/Order.lean` line 49).
- Cross-roadmap citations resolved at main or the open heads: DiophantineApproximationAndTranscendence §§0.1–0.3, 3.6, 3.7, 4.1–4.5 with `matveev`, `yu`, `baker_superelliptic`; ModularCurvesPartII §§9.5–9.8, 11.8, 13.1–13.4, 16.1–16.7, 17.2; DeligneWeightsAndPurity §§1.1–1.4; AbelianSchemesAndArithmeticModuli A3.9, A6.14, A6.15; NeronModelsAndSemistableAbelianVarieties §3.8; PadicDifferentialEquationsAndRigidCohomology §RD.7.18; HeightsRationalPointsAndObstructions §§0.19, 0.24, 1.15a–1.19; ColemanIntegration §§L0.2–L0.17, L1.3–L1.20; RealAlgebraicGeometry and IntegralLattices (completed). All section ids exist; what three of them state is R01.
- Gate (worker, db8e845): every counter 0, `build=0`. `lake env lean` on `Suggested.lean`: twelve `declaration uses sorry` warnings, nothing else. One-tactic probe (`simp`, `rfl`, `norm_num`, `omega`, `trivial`, `infer_instance`, `simp_all`, each required to close the goal) on a scratch copy: all twelve theorems stay open. Elaborated signatures compared with §§2.3, 2.5, 3.12, 3.22, 6.16, 6.36–6.39: same generality, no lost binder. No change outside the folder.
- Dependency check: `depcheck: 245 roadmaps, 2240 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Pull request text read against the head: no sentence contradicted; the folder is new (8502 insertions), as the description says.
- Overlap check: read ComputationalNumberTheory, ArithmeticDynamics, AnabelianGeometryAndNonabelianChabauty, HeightsRationalPointsAndObstructions, HyperellipticCurves, DiophantineApproximationAndTranscendence, ClassicalArithmeticCompletion, EllipticCurves. The `x − T` descent rank bound of §3.23, selected-root data, affine lattice sets, saturation and the point lists of §§3.26–3.28: owner this roadmap, cited by HyperellipticCurves (its §5.2), ComputationalNumberTheory and ArithmeticDynamics. Mordell–Weil logarithmic span, residue-chart Strassmann bound, classical Chabauty finiteness: owner AnabelianGeometryAndNonabelianChabauty, cited here. Matveev, Yu and the superelliptic bound: owner DiophantineApproximationAndTranscendence, cited here. ArithmeticDynamics declares three gaps against this roadmap (rational points of models of `X₁(13)`, `X₁(16)`, `X₁(18)`) that this README does not state.
- Source independence: 12 passages compared with 10 sources, none shared (longest common run outside formulas: 9 words with mccallumPoonen line 647, a theorem hypothesis); largest share bdmtv2019annals, 49 of 387 locators; contents compared with bdmtv2019annals: §§6.5–6.9, 6.10–6.14 and 6.18–6.29 run beside its §§4, 5 and 6 but not one to one (five sections against its §§4.4–4.5, thirteen against its §§6.1–6.6 with the model before the ranks; §§6.1–6.4 and 6.15–6.17 stand between), the order forced by the `*Needs:*` of §§6.11–6.13: independent.

## Not verifiable

- matveev2000 (Corollary 2.3) and yu1994 (p. 242): not read; §§2.2–2.5 were compared with `matveev` and `yu` of DiophantineApproximationAndTranscendence on main.
- bdmtv2021, published version, pp. 1135–1136 (§6.15): the DOI resolved to the arXiv v4 text only; the statement that the published page corrects `φ` was not checked.
- bruinStoll2010: the arXiv text was read; the published page numbers of its 44 locators were not checked.
- tzanakisDeWeger1992 and deWeger1989: the extracted texts drop displayed formulas (conditions (1)–(2) at lines 41–47; (3.24)–(3.25) at lines 2554–2558); pages and surrounding text were confirmed.
- silverman1990, poonen1995, siksek1995, siksek2009sym, caraianiNewton and the locators outside the sample were not read this round.
- The numerical tables of §§6.18–6.31 (Hecke, Frobenius and height matrices, disc expansions) were not recomputed.

## Source issues

- **Misprint** in bdmtv2021 at §4.4, the sentence before Proposition 4.6, p. 24 (arXiv v4): the source says the transport bound equals minus twice the floor of the base-p logarithm plus the splitting constant; it should be without that constant, as its (4.21) gives; affects nothing.

## For the human reviewers

- Reuse: README §6.35 (lines 7855–7884) gives the nine quartic models with their point lists and CM discriminants in the order of the tables of bdmtv2021 Examples 5.7–5.15; `ED6.thueMahlerSolutionList` (`TauCetiRoadmap/EffectiveDiophantineMethods/Suggested.lean` lines 271–291) keeps the order of the table of tzanakisDeWeger1992 §18.
- Licence: deWeger1989 (`ir.cwi.nl`), tzanakisDeWeger1989 (`ris.utwente.nl`), bdmtv2019annals (`annals.math.princeton.edu`), mccallumPoonen and cremona1997ch3 (authors' pages) are on hosts the sources service does not classify; they were read as institutional, publisher-open and author copies.
- Licence: README lines 463–469 say the exact-algebraic interface "follows the design of" a blog post and that a supplier follows `hex-lll-mathlib`'s interface at a fixed commit; no Lean text of either was found in `Suggested.lean`.
- Licence: the References cite a raw data file of the `JohnCremona/ecdata` repository (README line 8176) for the curve 571a1; its licence was not read.
