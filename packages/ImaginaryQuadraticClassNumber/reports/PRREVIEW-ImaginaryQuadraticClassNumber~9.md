# Review of ImaginaryQuadraticClassNumber (pull request #2593 at 11adb83)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every Check and worked example was recomputed and agrees with the theorems of its section, the fourteen Shin locators are correct at theorem and page, the six headline statements elaborate and none closes in one tactic, and the consumed sections of ModularForms, ModularCurvesPartII and ClassFieldTheory exist on main as cited. There is one small correction (a hypothesis of the radicand-form theorem that the others imply) and one format note (old heading anchor still linked from two open roadmaps), neither blocking. Two facts about other roadmaps on main are left for the human reviewers.

## C01 — In the radicand-form theorem the generation hypothesis follows from the other two

In `classNumber_eq_one_iff_negative_squarefree_mem` (`TauCetiRoadmap/ImaginaryQuadraticClassNumber/Suggested.lean`, lines 76–80) the hypothesis `hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤` is implied by `hdeg` and `hmin`: since `ℤ` is integrally closed, `minpoly ℚ θ = X² − d` has degree two, so `ℚ(θ)` has dimension `2 = [K : ℚ]` and is all of `K`. A user of the theorem must therefore prove something the statement does not need.

Nothing is false, and the hypothesis matches the README's definition of a presented field (§1.1, lines 135–136). If the redundancy is deliberate, a clause in the docstring saying that `hgen` is kept to match the presentation of §1.1 would do; otherwise `hgen` could be dropped.

## N01 — Eleven links to the old §3.1 heading anchor in two open roadmaps will land at the top of the README

ArithmeticStatisticsPartVII (README line 2518) and ComplexMultiplicationAndExplicitReciprocity (README lines 131, 428, 480, 552, 592, 614, 618, 622, 644, 673) link to `#h31-modular-functions-and-the-imaginary-quadratic-cm-dictionary`. Convention 9 maps the labels and the description states the anchor change, so nothing is wrong; an inline anchor with the old id before the heading `### 3.1` (line 634) would keep those links working.

## Previous findings

The previous review, of this same head, had no finding and no small correction. Its one format note (the old §3.1 anchor) stands unchanged as N01: the folder has not changed since.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 distinguished embedding depends on the presentation | `ℚ(√−5)`, θ and −θ | `ι_(K,θ)(θ) = i√5`, `ι_(K,−θ)(θ) = −i√5`; identity sends θ to −(−θ), so conjugate | agree | none |
| §1.2 maximal orders, units, ramification | d = −3, −5; p = 2, 3, 11 | `ω² = ω − 1`, `ω³ = −1`; `a² + 3b² = 1` ⇒ b = 0; −5 ≡ 1 mod 3, ≡ 6 mod 11 (squares 1,3,4,5,9) | agree | none |
| §1.3 forms and classes | Δ = −23, −20, −12, −4, −3 | three reduced forms at −23; H(12) = 1 + 1/3; weights 1/2 = 2·1/4, 1/3 = 2·1/6; `2(ℤ + ℤτ)`, τ = (−1 + i√23)/4 | agree | none |
| §1.4 order class numbers | (D, f) = (−4,2), (−3,2), (−3,3), (−3,4), (−11,2), (−7,2) | 2/2 = 1; (2/3)(3/2) = 1; 3/3 = 1; (4/3)(3/2) = 2; 2(3/2) = 3; 2(1/2) = 1 | agree | none |
| §1.4 lattice form `O_f = ℤ + ℤ·fω_D`, `ι_K(O_f) = ℤ + ℤ·fτ_D` | D odd and D = 4d | `(f²D + f√D)/2 − fω_D = f(fD − 1)/2` or `2f²d`, integers; `fτ_D − fω_D = f` | agree | none |
| §2.1 `χ_D` | D = −8, −4, −7, −20 | χ_(−8)(3, 5, 7) = 1, −1, −1; 3 ≡ 7 mod 4; χ_(−4)(3) = −1; χ_(−7)(2) = 1; χ_(−20)(2) = 0 | agree | none |
| §2.2 real class-number formula | D = −3, −4, −7 | L(1) = π/(3√3), π/4, π/√7; at −4: `w·2·(π/4)/(2π) = w/4` | agree | none |
| §2.3 `log` bound and four-factor product | χ_(−4) at levels 4, 12; D = −7, −23; Euler factors a, b ∈ {0, ±1} | 0.785 ≤ 2.386; π/3 = 1.047 ≤ 3.485; 2.48, 6.31; factors `(1 − x²)⁻¹`, `(1 − x²)⁻²` nonnegative | agree | none |
| §2.4 Siegel bound and consequences; `quadratic_LFunction_siegel`, `imaginary_classNumber_lower_bound`, `imaginary_discr_bounded_of_classNumber_le` | q = 1, q = 3, D = −163, B = 0, 1, ε ≥ 1/2 | q = 1 excluded by χ ≠ 1; `c_ε ≤ 0.6046·3^ε`; `C_ε ≤ 163^(ε − 1/2)`; B = 0 vacuous; C_1 ≥ 163; π/√163 = 0.246 least of nine | true | none |
| §3.1 multiplication matrix and kernels | D = −4 (B = 0, C = 1), D = −3 (B = −3, C = 3) | `(sτ + t)τ = (t − Bs)τ − Cs`; i ↦ [[0,−1],[1,0]]; τ − 2 ↦ [[1,−3],[1,−2]], det 1 | agree | none |
| §3.1 ray degrees | D = −4, N = 2 and N ≥ 3; 2 inert; D = −3 | `#(ℤ[i]/2)ˣ = 2`, i ≢ 1: degree 1 against 2; `i ≡ ±1 mod N` impossible; 3/1 = 3; 3/3 = 1 | agree | none |
| §3.1 CM point | D = −3 | τ = ρ + 2, j = 0, `X² − 3X + 3`; `i√3/2` root of `4X² + 3`, discriminant −48 | agree | none |
| §3.2 Siegel functions and `γ₂` | τ = i; N = 2, 3, 6, 8 | orders 1/12, −1/24, −1/24; `g₀¹² = 8.00`, `g₁¹² = 8.01`, `g₂⁴ = −4.000`; cubic `(X − 8)²(X + 64)`; 24/2 = −48/−4 = 12; exponents 12, 12, 12, 48 | agree | none |
| §3.2 eta quotients | g₀, g₁, g₂ | leading terms `2i q^(1/12)`, `−q^(−1/24)`, `−e^(−πi/4) q^(−1/24)`; `e^(−πi/4) = e^(−πi/3)·e^(πi/12)` | agree | none |
| §3.3 level-two norm identities | D = −7, −8 | `(x + 1)(x² + 47x + 4096)`; `g₀¹² = −0.99999`; `(x + 64)(x² + 7168x − 262144)`, discriminant `2²¹·25`; 0.56854·(−112.58) = −64.0 | agree | none |
| §3.3 cubic of `ξ⁴` | `ξ = ζ₈α` | `ξ⁴ = −α⁴`; `α¹² − γ₂α⁴ + 16 = 0` gives `Y³ − γ₂Y − 16 = 0`; ξ real since `q^(1/12) = ζ₈·e^(−π√\|D\|/12)` | agree | none |
| §3.4 bounds and branches | A = e^(−π√31), e^(−π√51) | 0.4656; 2.073; product 0.9653 < 1; level three 0.9309 < 1; D ≡ 21 mod 24: −3, −51, −123, −195; survivors −4, −7, −8, −15, −20, −23, −24 | agree | none |
| §3.5 quartic and fourth-power cubic | six points; `X³ − 2`, `X³ + 2X² + 4X + 2` | y² = 0, 0, 4, 36; power sums p₄ = 0, p₈ = −192, e₂ = 96; `heegnerGamma` = 0, −32, −96, −960, −5280, −640320 | agree | none |
| §3.6 `classNumber_eq_one_iff_discr_mem`, `classNumber_eq_one_iff_negative_squarefree_mem` | d = −1, −4 (θ = 2i), −5 | 1 ∈ heegnerNumbers; −4 not squarefree; five values ≡ 5 mod 8 and prime to 3 | true | C01 |
| §3.6 `pic_eq_one_iff_discr_mem` | f up to 7 at D = −3, −4; f = 2, 3 at other D; −44 | D = −3: 1, 1, 1, 2, 2, 3, 2; D = −4: 1, 1, 2, 2, 2; −44 gives 3 | true | none |
| Convention 6, `root(γ • f) = γ • root f` | `γ • f = f ∘ γ⁻¹` | `(γ • f)(γ(τ, 1)) = f(τ, 1) = 0` and `γ(τ, 1) ∝ (γτ, 1)` | consistent | none |

- Source locators checked in shin2010: 14 (§2 pp. 2–3; Propositions 2.1, 2.3(i), (ii), (vi), 2.5 and the group `W_(N,τ_K)`; Remark 2.2; Lemma 4.1(ii); Theorem 4.6 with (19)–(20); Theorem 4.8; Lemma 5.1; Theorem 5.2 and Table 1), at shin2010 lines 73–95, 101–130, 138–148, 177, 193–251, 707–726, 849–921, 957–976, 1114–1130, 1159–1242. All correct.
- Library declarations opened at the pins: `heegnerGamma` (`NumberTheory/ClassNumberOne/FourthPowerCubic.lean:65`), `tschirnhausPolynomial_X_pow_four_eq_iff` (:110), the twelve triples and six values (`HeegnerQuartic.lean:300–322`), `heegnerNumbers`, `heegnerDiscriminants` (`HeegnerNumbers.lean:70, 87`), `classNumber_eq_one_iff_of_neg_fifty_one_lt_discr` (`SmallDiscriminant.lean:56`), `card_pic_intAddMulOrder_eq_one_iff` (`Orders/Quadratic/ClassNumberOne.lean:210`), `NumberFieldOrder.discr` (`Orders/Discriminant.lean:85`), `norm_siegelFunction_le_of_le_half` (`SiegelFunction/Bounds.lean:103`), `MulChar.ringHomComp` (Mathlib `MulChar/Basic.lean:454`, `@[simps]`). All 300-odd backticked library names of the README resolve to a declaration at the pins.
- Cross-roadmap citations resolved on main: ModularForms §10D (line 1313) and Layer 11 (line 1459), ModularCurvesPartII §1.1 (line 393), ClassFieldTheory Layers 10–13 (lines 1638, 1781, 1834, 1924), ModularCurves Layer 5.3, GlobalNumberFields Layer 11 (line 571), NumberFieldArithmetic, ArithmeticDirichletSeries.
- Dependency check: `depcheck: 200 roadmaps, 2209 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. No path outside the folder changed.
- Lean: `Suggested.lean` elaborates with six `sorry` warnings and nothing else; one import of Mathlib and three Tau Ceti modules, no `set_option`, no sorried data. The elaborated types were compared with the README statements: same generality, all binders explicit.
- One-tactic probe: `simp` closes none of the six statements; no theorem of these names or contents is in the pinned libraries (only the converse direction and the range above −51 are).
- Pull-request text read against the head: 45 Checks counted; the renumbering, the two added suppliers, the dropped converse construction and the unchanged headline statements are all stated; no sentence is contradicted.
- No name of `Suggested.lean` is declared in another roadmap on main or at an open head.

Overlap check: read QuadraticCharactersAndReduction, AnalyticNumberTheoryPartI and MultiquadraticPartII on main, EffectiveClassNumbers at its open head and ComplexMultiplicationAndExplicitReciprocity at its open head. `χ_D`: owned by the pinned Tau Ceti library and consumed by this roadmap and by QuadraticCharactersAndReduction alike. Siegel's ineffective bound, the class-number-one theorem, the CM dictionary of §3.1: owned here, cited by EffectiveClassNumbers and ComplexMultiplicationAndExplicitReciprocity. Effective bounds of Goldfeld's type: EffectiveClassNumbers. Complex uniformization: ModularForms §10D and ModularCurvesPartII §1.1, consumed here.

Source independence: 10 passages compared with 1 source (shin2010: §2, Propositions 2.1, 2.3 and 2.5, Lemma 4.1, Theorems 4.6 and 4.8 with its proof, Lemma 5.1, Theorem 5.2, and two docstrings of `Suggested.lean`), none shared beyond forced formulas; largest share shin2010, 14 of 22 locators; contents compared with shin2010: independent (its §3 is unused, its §§2, 4, 5 are spread over six sections of Layer 3 in the order the dependencies force, and Layers 1 and 2 have no counterpart in it). Davenport, Stark and Cox could not be read.

Research link: Siegel's theorem (1935, via Davenport Chapter 21) and the Heegner–Stark class-number-one theorem (Heegner 1952, Stark 1967 and 1969) proved by Shin's Siegel-function route (2010); consumed by EffectiveClassNumbers and ComplexMultiplicationAndExplicitReciprocity. Rests on the README's References and Downstream consumers and on shin2010 lines 61–66.

## Not verifiable

- davenport1980, Chapters 6 and 21 (§§2.1–2.4): settled as uncertified; not opened.
- stark1969 (§3.3, the small-power inclusion) and Stark 1967: settled as uncertified or no legal open copy; not opened.
- Cox, *Primes of the Form x² + ny²*, Theorems 7.7 and 7.24 (§§1.3–1.4): no legal open copy; the statements cited are the library's and were checked by computation only.

Automatic checks set aside as false positives: none failed; the listing of elaborated signatures reports two declarations that do not exist, read from the words after "theorems" and "class" in docstrings of the Lean file.

## Source issues

- **Misprint** in shin2010 at Proposition 2.5, p. 5: the source lists ±[[−1, −3], [1, −2]], of determinant 5, in the kernel for ℚ(√−3); it should be ±[[1, −3], [1, −2]], the matrix of the unit τ_K − 2; affects nothing.

## For the human reviewers

- AnalyticNumberTheoryPartI on main says the effective forms of this roadmap's §§2.3–2.4 follow from its own exclusion of Landau–Siegel zeros, an open problem; this README states no effective form and relies on none (Scope, line 1127).
- The group isomorphism `ℂ/Λ ≅ E_Λ(ℂ)` is stated by two roadmaps on main, ModularForms §10D (line 1326) and ModularCurvesPartII §1.1 (line 395); this README consumes both (lines 685–691).
- Davenport, Stark 1967/1969 and Cox could not be read, so the wording of §§1.3–1.4 and Layer 2 was not compared with them; shin2010, the source with the largest share, was read in full.
