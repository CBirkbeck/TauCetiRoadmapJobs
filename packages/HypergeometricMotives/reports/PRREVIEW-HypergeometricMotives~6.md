# Review of HypergeometricMotives (pull request #1716 at ece7e65)

**Verdict:** accepted

Incremental re-review of the 32 lines changed since ade8f64 (the head the previous review read). The change repairs the three P3 findings of that review (two locator defects, one false phrase in the 5.5 proof sketch) and touches nothing else: five README passages, the reference entries for Beukers–Cohen–Mellit and Roberts–Rodriguez-Villegas, and one docstring in `Suggested.lean`. Every repaired locator was opened at its page in the cached preprint, the repaired residue was recomputed, the gate passes with every counter at zero, the dependency check is clean, and `Suggested.lean` elaborates with only `sorry` warnings. No finding remains, new or carried, and no file outside the roadmap folder changed.

## Previous findings

- R01 — repaired: `README.md:1699–1700` now cites "Roberts–Rodriguez-Villegas §2, "Orthogonal vs. symplectic", p. 3, §4, "Motivic Galois groups of HGMs", p. 5, and §5"; `:2592–2595` describes both passages. Both headings exist at those pages (`rrv2022` line 230 on p. 3, line 468 on p. 5), and both state the dichotomy the bullet cites them for: the monodromy form is symmetric in the orthogonal case and antisymmetric in the symplectic case (lines 233–242); the motivic Galois group is `CSp_n` for odd `w` and `CO_n` for even `w` (lines 473–477). No "(4.4)" locator of the preprint remains; the "(4.4)" at `:144` is this roadmap's target 4.4.
- R02 — repaired: `README.md:2577–2579` adds "(numbered statements, equations and page locators here refer to this preprint)" to the arXiv:1505.02900v2 link; `:2344` reads "Theorem 1.5, p. 4" (`bcm2015` line 152, the first line after the p. 4 marker at 151); `:921` and `:1709` read "§9, p. 9" (`rrv2022` lines 882–922 lie between the p. 9 marker at 869 and the p. 10 marker at 969). The 6.3 docstring in `Suggested.lean:988` now says "(arXiv:1505.02900v2, pp. 13–14)" (Proposition 4.3 at `bcm2015` line 617, p. 13, proof running into p. 14). No "pp. 9–10" or "pp. 3–4" remains in the README.
- R03 — repaired: `README.md:1875–1877` reads "the poles of `−T F′/F = ∑_{λ ∈ Λ} λT/(1 − λT)` are the `1/λ` for the distinct `λ ∈ Λ`, each simple with nonzero residue `−m_λ/λ` (`m_λ` the multiplicity of `λ` in `Λ`; `λ ≠ 0` because `|λ| = p^{w/2}`)". The Check at `:1934–1935` adds the Legendre witness, residue `−1/λ = (1 + 2i)/5`. Both are correct (table below). The sum is now explicitly over the multiset, so multiplicities enter the residue as stated; the conclusion `B = ∏_{λ distinct}(1 − λT)` needs only that the residue is nonzero, which `λ ≠ 0` gives.

## Verified sound

**Gate and order.**
- My gate run at `ece7e65` with the build: every counter is `0` (`set_option`, `sorry-data`, `statement-hygiene`, `prnum`, `residue`, `readme-ids-missing`, `depcheck`, `stray-files`, `outside-folder`, `build`, …), result `OK`. The worker's gate at this head agrees.
- Dependency check (`gate --depcheck … --order board/merge-order/ORDER.txt --movable --content …`): `depcheck: 239 roadmaps, 2428 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the roadmap folder is empty.
- `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped by an open pull request, no id is defined only by an open revision. The closest roadmaps in vocabulary (CharacterSumsOverFiniteFields, CurvesOverFiniteFields, HyperellipticCurves, AbelianVarietiesOverFiniteFields, ComputationalNumberTheory) were checked for ownership in the previous review; the diff adds no object, so nothing changed on that side.
- `scratch/citations.md` lists the same six "Lean names found nowhere" as last round: the external provenance names of the README's provenance section (AxiomMath/Weil, weil-conjectures), none claimed for `Suggested.lean`; the diff does not touch them.

**Lean.** The diff changes one docstring (`Suggested.lean:988–990`) and no statement.
- `lake env lean` on `Suggested.lean` at this head: 46 `declaration uses sorry` warnings (one per sorried theorem, lines 181–991), no error and no other warning, in 25 s. The gate's targeted `lake build TauCetiRoadmap.HypergeometricMotives.Suggested` also reports `build=0`.
- The elaborated signatures (`scratch/signatures.md`, 135 declarations) are identical in substance to last round: the ten "dropped binder" leads are `[Field F]`, `[Finite F]` and `[DecidableEq F]` instances that the types of `qm`, `gaussSumPow`, `katzSum`, `hypergeometricSum`, `greeneBinom`, `greeneF`, `gammaVectorSum`, `legendreFamily`, `cubicFamily` and `weightedTorusPoints` do not mention; no mathematical hypothesis is lost. The statement of `weighted_torus_point_count` (`:991–1000`) is unchanged and still carries `hp`, `hq`, `hbal`, `hprim`, `hω`, `hψ`, `ht`, matching the 6.3 prose "primitive balanced positive exponents" with `t ≠ 0`.
- The one-tactic padding probe of the previous review (every `sorry` replaced by `first | (simp; done) | rfl | infer_instance | decide | sorry`, 46 `sorry` warnings remaining) stands, since no statement changed.
- The file keeps the `module` header, `import Mathlib` only, no `set_option`, `theorem` throughout.

**Sources: the seeded sample where it falls in the changed passages.** Of the fifteen sampled targets, only 2.9 ("The Hodge polygon and the special Hodge vector") is touched by the diff (its locator "§9, pp. 9–10" became "§9, p. 9"). `rrv2022` lines 898–909 (p. 9) state the special Hodge vector exactly as `README.md:920–922` does: in the orthogonal (even-weight) case the inertial invariants under `h_1` are already the motive and `h^{w/2,w/2}` drops by `1`; in the symplectic (odd-weight) case the invariants are mixed, the rank-one weight `w − 1` piece is quotiented out, and the two central Hodge numbers drop by `1`. The source's two examples `(10,1,10) → (10,0,10)` and `(1,1,1,1,1,1) → (1,1,0,0,1,1)` agree with the README's rule (table). The other sampled targets (1.2, 1.4, 1.6, 1.10, 2.4, 3.4, 3.5, 4.5, 4.10, 4.11, 4.12, 5.6, 5.11, 6.4) are untouched by the diff and were verified in the previous review.

**Changed locators opened this round** (file ids are the sources cache: `rrv2022` = arXiv:2109.00027v1, `bcm2015` = arXiv:1505.02900v2).

| README line | Locator | Where found | Supports the statement |
|---|---|---|---|
| 1699–1700 | RRV §2 "Orthogonal vs. symplectic", p. 3 | `rrv2022` lines 230–242, between the p. 3 marker (215) and p. 4 (338) | yes: form symmetric / antisymmetric by case |
| 1699–1700 | RRV §4 "Motivic Galois groups of HGMs", p. 5 | lines 468–479, between p. 5 (442) and p. 6 (551) | yes: `CSp_n` odd `w`, `CO_n` even `w`, for transcendental `t`; "almost always" for algebraic `t` |
| 921, 1709 | RRV §9, p. 9 | lines 882–922; §10 begins at 923, p. 10 marker at 969 | yes |
| 2344 | BCM Theorem 1.5, p. 4 | line 152, first line after the p. 4 marker (151); formula lines 156–166 | yes: hypotheses gcd `= 1` and `Mλ ≠ 1`; the README's `P_rs` and the sign `(−1)^{r+s−1} q^{min(r−1,s−1)}` match |
| `Suggested.lean` 988 | BCM Proposition 4.3, pp. 13–14 | line 617 (p. 13 marker 586, p. 14 marker 643) | yes |
| 2592–2595 | reference entry describing p. 3 and p. 5 | as above | yes |

**Adversarial table.** Rows for the changed statements were computed this round; the untouched rows are carried from the previous review (marked r5), whose values I did not recompute.

| Statement | Instances | Values computed (README side / my side) | Result |
|---|---|---|---|
| 5.5 (ii) residue of `−T F′/F` at `1/λ` (changed) | `Λ = {−1 ± 2i}`, `λ = −1 + 2i`; `Λ = {√5, √5, −√5, −√5}`, `λ = √5` | `−1/λ = (1 + 2i)/5`; numerical residue `0.2 + 0.4i` ✓; multiplicity-2 instance: numerical residue `−0.894427`, `−2/λ = −0.894427` ✓; `λ ≠ 0` since `|λ| = √5` | holds |
| 5.5 Check, Legendre series (changed sentence) | `F = 1 + 2T + 5T²` | `1 − TF′/F = 1 − 2T − 6T² + 22T³ − 14T⁴ + ⋯ = (1 − 5T²)/F` (both expansions computed exactly in `ℚ[[T]]`); power sums of `−1 ± 2i`: `−2, −6, 22, −14`; residue at `1/λ` is `(1 + 2i)/5 ≠ 1` | holds |
| 5.5 Check, control `Λ = {(3 ± 4i)/5}` (unchanged sentence) | — | first power sum `6/5 ∉ ℤ` | holds |
| 2.9 special Hodge vector (locator changed) | `(1,1)`, `w = 1`; `(1,2,1)`, `w = 2`; `(1,2,3,2,1)`, `w = 4`; `(2,6,2)`, `w = 2`; `(1,1,1,1)`, `w = 3`; RRV's `(10,1,10)`, `w = 2`; `(1,1,1,1,1,1)`, `w = 5` | `(0,0)` sum `0 = d − 2`; `(1,1,1)` sum `3 = d − 1`; `(1,2,2,2,1)` sum `8 = d − 1`; `(2,5,2)` sum `9 = d − 1`; `(1,0,0,1)` sum `2 = d − 2`; `(10,0,10)` and `(1,1,0,0,1,1)` as in `rrv2022` lines 908–909 | holds |
| 5.0 dichotomy bullet (locator changed) | Legendre `A2.2_B1.1`, `w = 1`; `([1],[2])` i.e. `α = {1/2}`, `β = {0}` | Legendre: `det h_∞ = e(1/2 + 1/2) = 1`, `det h_0 = 1`, so `det h_1 = Q(0) = 1`, the symplectic case, matching odd `w` and `CSp_2`; the `d = 1` datum: `det h_1 = e(−1/2) = −1`, orthogonal, `w = 0`, `Γ` finite (`rrv2022` line 472) | holds |
| 6.3 Theorem 1.5 (locator changed) | `(p, q) = ((3),(1,1,1))`, `r = 1`, `s = 3`, `q = 5` | `P_{1,3}(q) = (q² − 1)/(q − 1) = q + 1 = 6`; sign `(−1)^{3} q^{0} = −1`; `#V̄_λ = 6 − H_5(D | Mλ)` with `M = 27`; formula agrees with `bcm2015` lines 156–166 symbol by symbol | holds |
| 1.2 Checks (r5) | `A2.2_B1.1`; `[4],[2,1]` | `Φ_A(0) = 1`, `Φ_B(0) = 1`, `m_Am_B = 0`; `(X²+1) − (X²−1) = 2` | holds |
| 1.4 `γ`, `M`, Pochhammer (r5) | `[2⁴],[1⁴]`; `[30],[5,3,2,1]`; `[1],[2]` | `γ = (4,−8)`, `M = 256`; `[−15,−10,−6,1,30]`, `M = 2¹⁴3⁹5⁵`; `(1)₁/(1/2)₁ = 2 = 4·1!·1!/2!` | holds |
| 1.8 `rotationNumber_eq_gcd` (r5) | 3186 ordered data of degree ≤ 6 | stabilizer order = gcd in 3186/3186 | holds |
| 1.9 primitive datum (r5) | `[9],[3,3,1,1]`; `[4],[2,1]`; empty | `Φ₃/Φ₁²` → `([3],[1,1])`, degree 2; `([2],[1])`; rotation 0 | holds |
| 1.7 `p`-parts (r5) | `[18,12],[8,3,2,1³]`, `p = 2, 3` | `A' = [4,4,2⁶]`, `B' = [8,2,1⁵]`, `C₂ = [2]`; `A₃ = [9,3]`, `B₃ = [1⁸]` | holds |
| 2.2–2.8 zigzag laws (r5) | 3186 data | parity, `δ = −m` for `1 ∉ A`, symmetry, odd `w` ⇒ even `d`, `w = 0 ⇔` interlace: 0 failures; `(1,2,3,2,1)`, `(2,6,2)`, `(1,2,2,2,1)` with `δ = 2` | holds |
| 2.7 swap reversal (r5) | `α = {1/10,1/5,1/2}`, `β = {3/10,3/5,7/10}` | `(1,2)` → `(2,1)` | holds |
| 3.2 Levelt (r5) | `A2.2_B1.1`; `α = {1/2}`, `β = {0}` | `h_∞ = [[0,−1],[1,−2]]`; `det h₁ = −1` | holds |
| 3.3 determinants vs 5.8 (r5) | orthogonal type | `d + m_A` odd ⇒ `d + m_B` even | holds |
| 3.8 `det_bezout` (r5) | 200 random pairs; `[6,4,4,4,3],[10,2⁶]` | `det Bez = (−1)^{d(d−1)/2} det sylvester` 200/200; `−191102976` vs `Res = +191102976` | holds |
| 4.3 Def 1.1 and `katzExpSum_eq` (r5) | `A2.2_B1.1`, `q = 5`; 9080 cases `d ≤ 2` over `𝔽₅`, `𝔽₇` | `−2` (`t = 2`), `2` (`t = 3`); 0 failures | holds |
| 4.5 independence (r5) | 2 generators × 4 `ψ`, `q = 5` | value set `{−2}` | holds |
| 4.6 shift with sign (r5) | `𝔽₅`, `a = {0}`, `b = {2}`, `t = 2` | lhs `−2.23607` = rhs; printed form `+2.23607` fails | holds |
| 4.7 gamma form (r5) | `A2.2_B4`, `q = 3, 11, 5` | `−2/3`, `−6/11`, `0`; Legendre `q = 5`: `−2` | holds |
| 4.9 `frobeniusSum_integral` (r5) | 14472 cases; `min V` on 672 data | `q^δH ∈ ℤ` 14472/14472; `min V = −δ` 672/672 | holds |
| 4.11 Kummer pullback (r5) | `[9],[3,3,1,1]`, `q = 19`; `[4],[2,1]`, `q = 5, 7, 9, 13` | 0 failures | holds |
| 4.12 `greeneF_eq_katzSum` (r5) | 11568 cases; control `𝔽₇`, `a = (1,3)`, `b = (0,3)` | 0 failures; control ratio `−0.0714 + 0.3712i` | holds |
| 5.0 Checks (r5) | Legendre `t = 2`; `([1],[2])`, `t = 9/8` | 8 points over `𝔽₅`, `a₅ = −2`, `a₂₅ = −6`; chart roots `1/3, 2/3` | holds |
| 5.1 traces (r5) | `A2.2.2.2_B1.1.1.1`, `A2.2_B4`, `A6.4.4.3_B12.2.2.2.1` | `a₃ = 0`, `a₅ = −4`, `a₇ = 0`, `a₁₃ = −84`; `−2`, `−6`; `−6` | holds |
| 5.2 / 5.6 Euler factors (r5) | traces at `3^e, 5^e, 7^e`, `e ≤ 4` | `F₃ = 1 + 6T² + 729T⁴`; `F₅ = 1 + 4T − 130T² + 500T³ + 15625T⁴`; `F₇ = 1 + 238T² + 117649T⁴`; `A6.4.4.3` at 7: `1, 6, −315, −104370, 643468` | holds |
| 5.4 Newton polygon (r5) | `F₃` | slopes `1/2, 1/2, 5/2, 5/2` | holds |
| `local_sign_eq_one_of_odd_weight` (r5) | `{−1 ± 2i}`; `{√5, −√5}`; `{√5, √5, −√5, −√5}`; `∅` | `coeff 2 = 5`; `−5` excluded by `hfix`; `coeff 4 = 25`; `1 = p⁰` | holds |
| `local_functional_equation` (r5) | Legendre at 5, `k = 0, 1` | `5·1 = 1·5·1`; `2·5 = 1·5·2` | holds |
| 5.8 Check (r5) | `A4_B2.1`, `t = −8`, `p = 5` | `F₅ = 1 − T²`, `Disc = −288`, `ε₅ = −1` | holds |
| 5.9 tame exponents (r5) | `A4.2.2_B3.1.1` at 7, six `t` | `c₇ = 1, 3, 1, 3, 4, 1` | holds |
| 5.11 Checks (r5) | `F = 1 + 2T + 5T²`, `ℓ = 2, 3, 5` | orders `1, 8, 4` | holds |
| 5.12 / 5.13 Checks (r5) | `X² + 2X + 5`; `([1],[2])`, `t = 9/8` | `ℚ(i)`, `−4`; `t(t−1) = (3/8)²` | holds |
| 5.7 shifts (r5) | `(1,2,3,2,1)`, `σ = 1, −3`; `(2,6,2)`, `σ = 2` | `μ = {0}`, `ν = {2,1,1,0}`; `h⁺ = 4`, `h⁻ = 2` | holds |
| 6.1 `legendre_point_count` (r5) | 59 cases | 0 failures; `q = 13`, `λ = 2`: 8 points, `H = 6` | holds |
| 6.2 `cubic_point_count`, `cubic_root_count` (r5) | 174 and 98 cases | 0 failures | holds |
| 6.3 `weighted_torus_point_count` (r5; docstring only changed) | `(3),(1,1,1)` at `q = 2, 5, 7`; `(2,1),(1,1,1)` at 7; `(2,2),(3,1)` at 5 | 0 failures; `q = 5`, `λ = 1`: 6 = 6 | holds |

**Cross-roadmap citations.** The diff adds none and changes none; the citations resolved in the previous review (EtaleCohomologyFoundations F.2.1–F.2.5, F.4.5, F.5, F.6; ClassicalArithmeticCompletion 1.19–7.29; ThetaSeries 2H; ModularCurves 4C; NewtonPolygons 0.6, 2.1; LFunctions Layer 0 on main; DeligneWeightsAndPurity 0.1–0.16 and §4.4, DirichletPadicLFunctions 4.1/4.4/4.5, CharacterSumsOverFiniteFields 6.4–6.5, MotivesAndAlgebraicCycles, ArithmeticGaloisRepresentations, ComplexComparisonPartII, ResolutionOfSingularitiesCharacteristicZero, EllipticLegendreCharacterInterfaces at their open heads) are unaffected. The dependency check above confirms every `*Needs:*` edge still resolves downward. The 5.5 route still consumes `DeligneWeightsAndPurity` §4.4 (Fatou) for the integrality of `B`, as the previous review verified at that head.

## Not verifiable

- **Beukers–Heckman 1989** (DOI 10.1007/BF01393900): no legal copy, as in the previous rounds; the diff does not touch any Beukers–Heckman locator, so nothing new depends on it.
- Levelt's thesis and Watkins's Magma notes: untouched by the diff, not looked for again.

## Source issues

- none new this round. The five Beukers–Cohen–Mellit items of the previous review (Theorem 3.4 character factor and quotient direction, its `λ`/`t` misprint, the `[0,1]` versus `(0,1)` minimum in Theorem 4.2, and the missing `λ ≠ 0` in Corollary 1.7, all at arXiv v2 pp. 4, 11–12) stand and are already registered.
