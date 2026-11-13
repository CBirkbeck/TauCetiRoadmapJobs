# Review of SpecialFunctionsTheta (pull request #2252 at 7dbb8e2)

**Verdict:** needs changes

## R01 (P2) — The analytic triple product already has an owner on main

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/README.md:117–122`: "that section assigns the analytic identity `J(w; q) = …` to the GeometryOfNumbersAndQuadraticArithmetic roadmap (§4.3). … 2.1 proves it here from 1.5, so that neither roadmap consumes the other."

**Claim:** ClassicalArithmeticCompletion 4.40 on main states and proves the analytic identity itself and assigns it to no one. The README's attribution is false, and 2.1 plans that identity a second time.

**Witness:** `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:8251` (main 7342e8f): "also give the analytic specialization for complex q,z with 0<|q|<1 and z≠0"; line 8265 proves it. That README never names GeometryOfNumbersAndQuadraticArithmetic.

**Repair:** Replace the bullet with "- Jacobi's triple product, formal and analytic: ClassicalArithmeticCompletion 4.40, whose analytic specialization is `(w; q)_∞ (q/w; q)_∞ (q; q)_∞ = ∑_{k∈ℤ} (−1)^k q^{k(k−1)/2} w^k` for `0 < |q| < 1`, `w ≠ 0`." In 2.1, state 20.5.9 as that identity at `q ↦ q²`, `w = −q p²` (so `(−qp²; q²)_∞ = ∏_{n≥1}(1 + q^{2n−1}p²)` and the series becomes `∑ q^{k²} p^{2k}`), with "*Needs:* ClassicalArithmeticCompletion 4.40". Delete the proof from 1.5 (1.5 stays for Layer 4). Add a "From ClassicalArithmeticCompletion" subsection to Exact supplier contracts. The substitution was checked numerically: at `(z, τ) = (1.7 − 0.4i, −0.8 + 0.6i)` the product is `0.4556654 + 1.6984464i`, equal to `θ₃(πz|τ)`.

## R02 (P2) — θ₁'s zeros, `θ₁′(0) = 2η³`, `τ + 1` law and `S` law are also owned by QSeriesPartitionsAndMockModularForms §5.1

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/README.md:419–439, 319, 579–584`, and `Suggested.lean` `jacobiThetaOne_eq_zero_iff`, `deriv_jacobiThetaOne_zero_eq_eta`, `jacobiThetaOne_add_one`, `jacobiThetaOne_neg_inv`.

**Claim:** The same four facts about one object have two owners. QSeriesPartitionsAndMockModularForms is earlier in the merge order (line 250 against 408).

**Witness:** `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md:805–812` at #1391 defines `ϑ = i·exp(πiτ/4+πiz)·jacobiTheta₂(z+(τ+1)/2,τ)`, which is `−θ₁(πz|τ)` by this roadmap's definition. It owns the zero set Λτ, `ϑ′(0) = −2πη³`, the `τ+1` law and the `S` law.

**Repair:** Settle a single owner, using one of two options.
- Option 1: cite QSeriesPartitionsAndMockModularForms §5.1 for these four facts, using `θ₁(πz|τ) = −ϑ(z;τ)`, and keep the θ₁ statements of 1.3, 2.2, 2.3 and 4.3 as corollaries.
- Option 2: this roadmap has only main suppliers, so it can precede QSeries in the merge order. Keep the facts here, and add to Scope and ownership: "QSeriesPartitionsAndMockModularForms §5.1 states these for `ϑ(z;τ) = −θ₁(πz|τ)` and cites 1.3, 2.2, 2.3 and 4.3." State that order in the merge-order paragraph.

## R03 (P2) — 20.9.2 on the imaginary axis is also owned by ThetaInvariantsOfEuclideanLattices 1.7–1.8

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/README.md:643–665`: 5.2, "`K(k) = (π/2) θ₃²(0|it)`", the AGM step of the Layer 4 Examples, and "`θ₃(0|i) = … = π^{1/4}/Γ(¾)`". Also `Suggested.lean` `legendreK_thetaModulus`.

**Claim:** One theorem, with the same route (the AGM step, `legendreK_eq_pi_div_two_mul_agm` and `tendsto_jacobiTheta_comap_im_atTop`), has two owners.

**Witness:** `TauCetiRoadmap/ThetaInvariantsOfEuclideanLattices/README.md:347–350` at #2038: "Prove `legendreK_eq_pi_div_two_mul_jacobiTheta_sq` … `K(√(1 − (b/a)⁴)) = ½π a²`" (DLMF 20.9.2 at `τ = it`). Lines 361–363 own the duplication identities, and its 1.8 owns `log(π^{1/4}/Γ(3/4))`.

**Repair:** Settle a single owner, as in R02. Either cite ThetaInvariantsOfEuclideanLattices 1.7 in 5.2 and keep `K′ = tK` and the complex forms here, or keep 5.2 here and add to Scope and ownership: "ThetaInvariantsOfEuclideanLattices 1.7–1.8 cites 5.2 and the Layer 4 Examples." State the corresponding merge order.

## R04 (P2) — Statable headline theorems are missing from `Suggested.lean`, and one is replaced by a weaker stand-in

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/Suggested.lean:21–23`: "The complex-`τ` form of `K` (README 5.3) uses the principal Gauss function …, which the pinned Tau Ceti does not have; its rectangular case is stated instead".

**Claim:** The complex-τ form of 20.9.2 can be stated at the pins through Tau Ceti's `Complex.carlsonRF`, since `K(k) = R_F(0, 1 − k², 1)` (DLMF 19.25.1). Watson's expansion (4.4), the mapping theorem for λ (5.3) and the Laplace transforms (6.2) are also statable but absent. `ordinaryHypergeometric_modularLambda` is a weakened substitute.

**Witness:** At `τ = 0.3 + 0.8i` and at `τ = 2.3 + 0.8i`, `R_F(0, 1 − λ(τ), 1) = (π/2)θ₃²(0|τ) = 1.8569936 + 0.4507587i`. At `τ = 0.9 + 0.2i ∉ F + 2n` the two values are `0.046934` and `−0.046934 + 0.023467i`. The four statements below elaborate, with `sorry` as the only warning.

**Repair:** Delete `ordinaryHypergeometric_modularLambda` and the docstring clause "its rectangular case is stated instead". Add the following four theorems, each tested in a scratch copy:

```lean
theorem hasSum_watson {z τ : ℂ} (hτ : 0 < τ.im) (hz : jacobiThetaTwo z τ ≠ 0) :
    HasSum (fun n : ℤ ↦ 2 * (-1) ^ n * cexp (π * I * τ * n ^ 2) * cexp (2 * I * n * z) /
        (cexp (-(π * I * τ * n)) * cexp (-(I * z)) + cexp (π * I * τ * n) * cexp (I * z)))
      (jacobiThetaTwo 0 τ * jacobiThetaThree z τ * jacobiThetaFour z τ / jacobiThetaTwo z τ) := by
  sorry

theorem bijOn_modularLambda :
    Set.BijOn modularLambda
      {τ : ℂ | 0 < τ.im ∧ |τ.re| < 1 ∧ 1 / 2 < ‖τ - 1 / 2‖ ∧ 1 / 2 < ‖τ + 1 / 2‖}
      {w : ℂ | w ∈ slitPlane ∧ 1 - w ∈ slitPlane} := by
  sorry

theorem carlsonRF_modularLambda {τ : ℂ} (n : ℤ) (hτ : 0 < τ.im) (hre : |τ.re - 2 * n| < 1)
    (h₁ : 1 / 2 < ‖τ - 2 * n - 1 / 2‖) (h₂ : 1 / 2 < ‖τ - 2 * n + 1 / 2‖) :
    carlsonRF 0 (1 - modularLambda τ) 1 = π / 2 * jacobiThetaThree 0 τ ^ 2 := by
  sorry

theorem integral_exp_mul_jacobiThetaFour {s β : ℂ} {ℓ : ℝ} (hs : 0 < s.re) (hℓ : 0 < ℓ)
    (hβ : |β.re| + |β.im| ≤ ℓ) :
    IntegrableOn (fun t : ℝ ↦ cexp (-s * t) * jacobiThetaFour (β * π / (2 * ℓ)) (I * π * t / ℓ ^ 2))
        (Ioi 0) ∧
      ∫ t in Ioi (0 : ℝ), cexp (-s * t) * jacobiThetaFour (β * π / (2 * ℓ)) (I * π * t / ℓ ^ 2) =
        ℓ / s ^ (1 / 2 : ℂ) * Complex.cosh (β * s ^ (1 / 2 : ℂ)) / Complex.sinh (ℓ * s ^ (1 / 2 : ℂ)) := by
  sorry
```

Name `carlsonRF_modularLambda` in README 5.3 as the Carlson form of 20.9.2 on `F + 2n`.

## R05 (P2) — The written-out `F` lacks `0 < Im τ`

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/README.md:178–180`: "The fundamental region of `Γ(2)` is `F = {τ | |Re τ| < 1, |τ − ½| > ½, |τ + ½| > ½}`, written out, not named".

**Claim:** The set as written includes the mirror image of F in the lower half-plane. On that part, 5.3's identity, the bijection and the cut avoidance are false, because every θ there takes the junk value `0`.

**Witness:** `τ = 0.3 − 0.8i` meets all three conditions. There `θ₃(0|τ) = 0` and `λ(τ) = 0/0 = 0`, so `F(½, ½; 1; λ(τ)) = 1 ≠ 0 = θ₃²(0|τ)`, and λ is constant on the lower part of the set.

**Repair:** Write "`F = {τ | 0 < τ.im, |Re τ| < 1, |τ − ½| > ½, |τ + ½| > ½}`".

## R06 (P3) — Gate failure `tex` (15 hits): code spans broken across lines

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/README.md:301–302, 586–587, 602–603, 743–746`, for example "`θ₁^{(2n)}(0|τ) = θ₂^{(2n+1)}(0|τ) = θ₃^{(2n+1)}(0|τ) =`" followed by a line break.

**Claim:** A code span that continues onto the next line leaves `^{…}`, `_{…}` and `e^{…}` outside a span on each scanned line, so the `tex` rule fails.

**Witness:** The gate's `tex (15)` hits are on lines 301, 302, 587, 603, 743 and 745. Re-running the gate at 7dbb8e2 gives `tex=15 … FAIL`.

**Repair:** Close each code span on the line where it opens: break before or after a span, never inside one. Alternatively, move these four formulas into ```` ```text ```` blocks.

## R07 (P3) — Gate failure `prnum` (2 hits) and process narrative

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/README.md:246`: "**Open pull request.** Mathlib PR #42118 adds `hasDerivAt_jacobiTheta₂_snd`". Line 338: "of Mathlib PR #42118". Lines 263–265: "computed independently … by mpmath's `jtheta`."

**Claim:** The README contains pull-request numbers and an account of how the values were produced.

**Witness:** The gate's `prnum (2)` hits are lines 246 and 338. `hasDerivAt_jacobiTheta₂_snd` does not exist in the pinned Mathlib (grep of `Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean`).

**Repair:** Replace the line-246 bullet with "- **Derivative in `τ`.** 1.4 derives the derivative of `jacobiTheta₂` in `τ` from `hasFDerivAt_jacobiTheta₂` and `jacobiTheta₂_fderiv`." At line 338, write "(`hasFDerivAt_jacobiTheta₂`)". Delete the sentence "Every decimal value … `jtheta`."

## R08 (P3) — Padding: `I_mul_jacobiThetaOne_eq_thetaBasis`

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/Suggested.lean:111–113`, `I * jacobiThetaOne z τ = thetaBasis 1 0 1 1 z τ`.

**Claim:** This unfolds two of the file's own definitions and repeats README 1.5's first Check.

**Witness:** In a scratch copy, `unfold jacobiThetaOne thetaBasis thetaMultiplier; ring_nf; simp [Complex.I_sq]` closes it with no error.

**Repair:** Delete it from `Suggested.lean`. The README keeps the statement.

## R09 (P3) — Locators that do not contain the statement, or are missing

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/README.md:630` ("§20.9(ii), the elliptic modular function: … `λ(τ + 1) = λ(τ)/(λ(τ) − 1)` and `λ(−1/τ) = 1 − λ(τ)`"), line 655 (nome, "§20.9(ii)"), line 439, line 502 ("20.6.1 and 20.6.6–20.6.9: `δ_{2j}(τ)` = …") and 1.5. Also `Suggested.lean:194, 197`.

**Claim:**
- DLMF §20.9(ii) only names λ. The transformation laws, the nome formula and `θ₁′(0) = 2η³` are elsewhere in DLMF.
- 20.6.1 is DLMF's disc condition, not a definition of the coefficients.
- 1.5 has no locator.

**Witness:** DLMF 23.18.1 gives `λ(𝒜τ)` for the six cosets, and 23.18.3 gives invariance under Γ(2). DLMF 23.15.1 is `q = exp(−πK′/K)`, 23.15.6 is `λ = θ₂⁴/θ₃⁴`, and 23.15.9 is `η = (½θ₁′(0,q))^{1/3}`.

**Repair:**
- Line 630: "(DLMF 23.15.6; 23.18.1 for `τ ↦ τ + 1`, `τ ↦ −1/τ`; 23.18.3 for `τ ↦ τ + 2`)".
- `Suggested.lean:197`: "(DLMF 23.18.1)".
- Line 655: "(DLMF 23.15.1)".
- Line 439: add "(DLMF 23.15.9)".
- Line 502: "20.6.6–20.6.9".
- Line 507: add "DLMF 20.6.1's disc is the right one for θ₁ only".
- 1.5: give the theorem and page of a source proving the N-dimensionality, for example in Mumford, *Tata Lectures on Theta I*, Ch. I.

## R10 (P3) — Definitions with fewer than three Checks

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/README.md:638–641` (5.1: two Checks), 512–515 (3.3: one), 775–778 (7.1: two), 780–784 (7.2: none) and 787–794 (7.3: none).

**Claim:** Each definition needs at least three discriminating Checks.

**Witness:**
- `k(2i) = 0.1715728752538 = 3 − 2√2`.
- `δ₆(i) = 0`, and `δ₄(i) = 3.15120` against `Γ(¼)⁸/(960π²) = 3.1512120`.
- `f(−½, −¼) = 0.2887880951 = ∏(1 − 2⁻ⁿ)`.
- `φ_{4,1}(π/2|i) = 1.1803405990`.

**Repair:** Add these Checks.
- 5.1:
  - "`k(2i) = 3 − 2√2 = 0.17157 28752 53…`".
  - "The wrong model `λ = k` gives `λ(i) = 2^{−1/2}`, not `½`".
- 3.3:
  - "`δ₆(i) = 0` (from `τ ↦ −1/τ`), `δ₄(i) = Γ(¼)⁸/(960π²) = 3.15121 20021…`".
  - "At `τ = i`, `α_{2j}(i)/(2·4^j) → 1`, so the θ₂ series diverges at `z = 0.7`".
- 7.1:
  - "`(m, n) = (1, 1)`: `mn` is odd, the left side is `1` and the right side `e^{−πi/4}`".
  - "`G(1, 4) = 2e^{−πi/4}`".
- 7.2:
  - "`f(a, 0) = 1 + a`".
  - "`f(q, q) = θ₃(0|τ)`, `1.08643 48112 13…` at `τ = i`".
  - "`f(−½, −¼) = ∏_{n≥1}(1 − 2^{−n}) = 0.28878 80950 86…`".
- 7.3:
  - "`φ_{m,n}(0|τ) = 1` for `m, n ∈ {2, 3, 4}`".
  - "`φ_{4,1}(π/2|i) = θ₃²(0|i) = 1.18034 05990 16…` (by 20.4.6)".
  - "`φ_{3,4}(π/2|i) = k′(i) = 2^{−1/2}`".

## R11 (P3) — Shape: missing `### Examples`, and `*Needs:*` lines that cover a whole layer

**Location:** Layer 6 (`README.md:726–757`) and Layer 7 (`README.md:759–800`) have no `### Examples`. Subsections 3.1–3.3, 4.1–4.3, 5.1–5.3, 6.1, 7.1 and 7.2 have no `*Needs:*` line. Line 711, the *Needs:* of 5.4, lists SpecialFunctionsHypergeometric, which only 5.3 uses.

**Claim:** One `*Needs:*` line covers several targets with different needs. Line 796 (7.3) lists Tau Ceti `GaussSum.lean`, which only 7.1 uses.

**Witness:** In the README, `### Examples` appears only under Layers 1–5 (lines 376, 452, 531, 613, 660, 716). There are 13 `*Needs:*` lines for 25 subsections.

**Repair:** Add `### Examples` to Layer 6 ("20.10.3 at `s = 1` gives `ln 2`") and to Layer 7 ("20.11.4 at `z = 0` gives `θ₃(0|τ) = f(q, q)`"). Give each subsection its own `*Needs:*` line, for example:
- 5.3: "*Needs:* 1.3, 4.3, 5.1–5.2; SpecialFunctionsHypergeometric Conventions, 1.3, 1.4; Tau Ceti `legendreK_eq_ordinaryHypergeometric`".
- 5.4: "*Needs:* 2.2–2.3, 5.2; Tau Ceti `Complex.carlsonRF`, `ofReal_legendreK_eq_carlsonRF`".
- 7.1: "*Needs:* 4.3; Tau Ceti `GaussSum.lean`".
- 7.2: "*Needs:* 1.1, 2.1".
- 7.3: "*Needs:* 2.2–2.3".

## R12 (P3) — `combinedTheta` is backticked as this roadmap's name but not declared

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/README.md:150` ("`TauCeti.combinedTheta m n z τ` for Carlson's `φ_{m,n}`") and line 789 ("`combinedTheta m n z τ = cₙ θₘ(z|τ)/(cₘ θₙ(z|τ))`").

**Claim:** A backticked name of this roadmap's own is a claim that `Suggested.lean` declares it.

**Witness:** `#check @` of all 35 declarations of `Suggested.lean` lists no `combinedTheta`.

**Repair:** At both places, write "Carlson's combined theta function `φ_{m,n}(z|τ) = cₙ θₘ(z|τ)/(cₘ θₙ(z|τ))`" with no Lean name. Delete the line-150 bullet.

## R13 (P3) — The M-test is claimed as missing from the libraries

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/README.md:104–110`: "auxiliary results, which the layers need and which neither Mathlib nor Tau Ceti provides: … Weierstrass's `M`-test form of locally uniform convergence".

**Claim:** The pinned Mathlib has the M-test for products and for series. Only its instances are new.

**Witness:** `Summable.hasProdLocallyUniformlyOn_one_add` (`Mathlib/Analysis/Normed/Module/MultipliableUniformlyOn.lean:130`) and `tendstoUniformlyOn_tsum` (`Mathlib/Analysis/Normed/Group/FunctionSeries.lean:32`).

**Repair:** Change the row to "| The instances, for the products and series of Layers 2–3, of Mathlib's `Summable.hasProdLocallyUniformlyOn_one_add` and `tendstoUniformlyOn_tsum` | 2.2, 3.1 |". Add both lemmas to "From Mathlib".

## R14 (P3) — Layer 7 is named after the source's section

**Location:** `TauCetiRoadmap/SpecialFunctionsTheta/README.md:759`: "## Layer 7: generalizations". Also Scope item 7, "**Generalizations** (DLMF §20.11 except 20.11.5)".

**Claim:** The layer takes DLMF §20.11's heading, "Generalizations and Analogs", and groups three unrelated targets by the source's arrangement.

**Witness:** DLMF §20.11 is titled "Generalizations and Analogs". The layer holds Gauss sums (from 4.3), Ramanujan's `f` (from 2.1) and the combined theta functions (from 2.2–2.3).

**Repair:** Rename the layer and the Scope item to "Gauss sums, Ramanujan's theta function and the combined theta functions".

## R15 (P3) — Pull request description: the triple-product sentence contradicts main

**Location:** Description: "ClassicalArithmeticCompletion 4.40 owns the formal identity, and assigns the analytic identity J(w; q) = ∑(−1)^k q^{k(k−1)/2} w^k to GeometryOfNumbersAndQuadraticArithmetic §4.3 (#851)."

**Claim:** On main, 4.40 owns the analytic identity itself.

**Witness:** `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:8251, 8265` on main state and prove the analytic specialization and name no other roadmap (R01).

**Repair:** "ClassicalArithmeticCompletion 4.40 owns the triple product, formally and in its analytic specialization; 2.1 derives 20.5.9 from it by `q ↦ q²`, `w = −qp²`." Also name ClassicalArithmeticCompletion among the consumed roadmaps.

## R16 (P3) — Pull request description: two "only" claims are false

**Location:** Description: "20.9.3: it holds only for z near 0, or in the open period rectangle when τ = it." and "20.9.2 and 20.11.5 for complex τ: they hold on the translates F + 2n … and fail outside them."

**Claim:** Both identities also hold outside the stated regions.

**Witness:**
- At `τ = 0.8i`, `z = 0.3 + 1.3195i` (outside the rectangle), both sides of 20.9.3 are `0.8178016 + 0.0517053i`.
- At `τ = 1 + 0.5i` (on `Re τ = 1`, in no `F + 2n`), `θ₃²(0|τ) = F(½, ½; 1; λ(τ)) = 0.3457138`.

**Repair:** "20.9.3 is false without a condition on z; it holds near z = 0, and in the open period rectangle when τ = it." and "20.9.2 and 20.11.5 for complex τ hold on F + 2n and fail, for example, at τ = 0.5 + 0.3i."

## Verified sound

| Statement | Instances | Computed left | Computed right | Result |
|---|---|---|---|---|
| 1.1 defs vs 20.2.1/20.2.3 | `(0.3+0.2i, 0.4+0.9i)` | θ₁ def `0.2276357286+0.2726321850i`; θ₃ def `1.0587106558+0.0919132090i` | series: same 10 digits | holds; README values agree |
| 1.1 Check `θ₁(1\|i)` | `τ=i` | `0.7670770951` | README `0.76707 70950 99` | agrees |
| 1.1 `q^{1/4}` Check | `τ=−1+i`, `z=0.3+0.1i` | series with `e^{iπτ/4}`: `0.2519915−0.1290429i` | θ₁: same; principal root gives `iθ₁` | discriminating |
| `jacobiThetaOne_add_lattice` (20.2.6) | `(2,−1)`, `(0.2+0.1i, 0.3+0.7i)`; `Im τ≤0` | `−1.9012459−0.2218338i`; `0` | `−1.9012459−0.2218338i`; `0` | holds; 20.2.6–9, 5 `(m,n)`×4 `j`: max rel err `1.3e−14` |
| `jacobiThetaThree_add_one`, `_One_add_one` | `(0.3+0.2i, 0.7+0.5i)`; `Im τ≤0` | `1.1403858−0.3532242i`; θ₁: `−0.2158876+0.4652626i` | same; `e^{iπ/4}θ₁` same; both `0` below | holds; principal `q^{1/4}` ratio `e^{−iπ/4}` (jump `−i`) |
| `jacobiThetaOne_conj` | `(0.3+0.2i, 0.4+0.9i)`; `Im τ≤0` | `0.2276357−0.2726322i` | `conj θ₁`: same; `0 = conj 0` | holds |
| `hasDerivAt_jacobiThetaOne_snd` (20.13.1) | `(0.3+0.2i, 0.4+0.9i)`, `j=1..4` | `∂τθ₁ = −0.2160661+0.2005973i` | `−(iπ/4)∂z²θ₁`: same; residuals ≤ `5.2e−11` | holds |
| 1.5 basis, `exists_eq_sum_thetaBasis` | `(N,r,a,b)=(3,1,1,0),(3,2,0,1),(2,1,1,1)` | `f(z+πτ) = −851.97988+336.05366i` | `(−1)^b q^{−N}e^{−2iNz}f(z)`: same | relations hold; `N=0` excluded by `hN` |
| `I_mul_jacobiThetaOne_eq_thetaBasis` | `(0.2+0.1i, 0.3+0.8i)` | `iθ₁ = −0.1489794+0.1863574i` | `Θ^{1,1}_{1,0}`: same | true; padding (R08) |
| 1.5 product rule | `θ₁(z±w)`, `w=0.4−0.2i` | `g(z+πτ) = 53.631639−11.339613i` | `q^{−2}e^{−4iz}g(z)`: same | in `V^{0,0}_2` |
| `hasProd_jacobiThetaThree` (20.5.9) | `(0.3+0.2i,0.4+0.9i)`, `(1.7−0.4i,−0.8+0.6i)`, `(0.5,0.1+0.5i)` | `1.1513853−0.1220441i`, `0.4556654+1.6984464i`, `0.6057451−0.1249250i` | `θ₃(πz\|τ)`: same | holds |
| 2.1 proof steps | `τ=−0.2+0.3i` | `P(π/4\|τ) = 1.0373019+0.0271021i` | `P(π/2\|4τ)`, `θ₃(π/4\|τ)`, `θ₄(0\|4τ)`: same | each step holds |
| 2.2 zeros, `jacobiThetaOne_eq_zero_iff` | `τ=0.4+0.9i` | `\|θ₂(π/2+πτ)\| = 7e−15`, `\|θ₃(π/2+πτ/2)\| = 1e−16` | `0` | holds |
| 2.2 constants | `τ=i` | `θ₃(0) = 1.0864348112`, `θ₂(0) = θ₄(0) = 0.9135791382` | `π^{1/4}/Γ(¾) = 1.0864348112`; `2^{−1/4}θ₃ = 0.9135791382` | agree |
| `deriv_jacobiThetaOne_zero`, `_eq_eta` | `τ=i`, `0.4+0.9i`, `−1.3+0.2i` | `θ₁′(0\|−1.3+0.2i) = 2.4880689−1.1936279i` | `θ₂θ₃θ₄` and `2η³`: same; `η(i) = 0.7682254223` | holds |
| 20.5.5 | `(0.3+0.2i, 0.4+0.9i)` | product `0.2276357+0.2726322i` | θ₁: same | holds |
| 3.1, 20.5.10 and 20.5.12 | `z=0.3+0.5i`, `τ=0.4+0.9i` | `logDeriv − cot = −0.0176787−0.0039842i`; θ₃: `0.1111724−0.2497206i` | both series: same | holds in the strips |
| `tendsto_jacobiThetaFour_doubleProd` | `(π/2, i)`, `N=5,10,20` | paired `1.0864348112` | `θ₄(π/2\|i) = 1.0864348112`; symmetric range `1.0864348112i = e^{iz}θ₄` | holds; Check agrees |
| same | `(0.3+0.2i, 0.4+0.9i)` | paired `0.9412581−0.0919483i`; symmetric `0.7584646+0.1558202i` | `θ₄`, `e^{iz}θ₄`: same | holds |
| `hasSum_iteratedDeriv_three_…` (20.4.8–12) | `τ=i`, `0.4+0.9i`, `−0.3+0.5i` | `θ₁‴/θ₁′ = −1.4228416−0.9033437i` at the third | series: same; at `i`, `−0.9549296586 = −3/π` | holds; 20.4.9–12 residuals ≤ `7e−16` |
| 3.3 radius (20.6.3) | `τ=i`, `j=4..16` | `α_{2j}/(2·4^j) → 1.0000000` | terms at `z=0.7`: `3.7, 27, 268, 2965` | README radius right; DLMF's wrong |
| `jacobiThetaThree_zero_pow_four` (20.7.5) | `τ=i` and 3 others | `θ₃⁴(0\|i) = 1.3932039297` | `2θ₂⁴ = 1.3932039297`; max err `2.2e−14` | holds |
| 4.1: 20.7.1, 20.7.6, 20.7.10 | `z=0.3+0.2i`, `w=−0.5+0.1i` | residuals `0`, `1.1e−15`, `6.7e−16` | `0` | holds |
| 4.2: 20.7.11–14, 17, 22, 24 | same | 20.7.11 `1.0056638−0.0041150i` (both quotients) | `θ₄(0\|2τ)`: same; others agree to `1e−15` | holds |
| `jacobiThetaOne_neg_inv` (20.7.30–33) | `(0.3+0.2i, 1.7+0.6i)`; 50 random | 20.7.30 `0.1394309+0.6024770i` | `−ie^{iτ′z²/π}θ₁(zτ′\|τ′)`: same; max rel err `2.1e−15` | holds |
| `…_div_eq_eta` (20.7.34) | `τ=−2.19+1.29i`; 300 random | quotients `−0.1871575−0.3110652i` | η form: same; printed principal form `+0.1871575+0.3110652i` | η form 0/300 fail; principal 142/300 |
| 4.4, 20.8.1 | `(0.3+0.2i, 0.4+0.9i)`, `(1.1−0.4i, −0.6+0.7i)` | `1.0265387728+0.0506833610i`, `1.2305723−0.9373641i` | quotient: same | holds; R04 statement |
| `modularLambda_neg_inv` | `τ=0.3+0.8i`, `−1.7+0.4i` | `0.2339971−0.4097863i`, `−0.0865695+0.0671407i` | `1−λ`: same; `λ(τ+2) = λ(τ)` | holds |
| 5.1 Checks | `τ=i`, `0.3+0.8i`, `1.3+0.8i` | `λ(i) = 0.5`; `0.7660029+0.4097863i` | `λ(1.3+0.8i) = −0.0508248−1.8402518i = λ/(λ−1)` | agree |
| `existsUnique_thetaModulus_eq` | `t=0.2,0.5,1,2,4` | `k = 0.9999988, 0.9851714, 0.7071068` | `0.1715729, 0.0074697`: strictly decreasing | consistent |
| `legendreK_thetaModulus` (20.9.2) | `t=0.7, 1, 2.3` | `K(k) = 2.3460485103` at `0.7` | `(π/2)θ₃² = 2.3460485103`; `K(k′) = 1.6422339572 = tK` | holds |
| 5.2 nome, closed form | `t=0.7`; `t=1` | `e^{−0.7π} = 0.1109012784` | `exp(−πK′/K) = 0.1109012784`; `K(2^{−½}) = 1.8540746773 = Γ(¼)²/(4√π)` | holds |
| 5.3, 20.11.5 | `τ=i`, `0.3+0.8i`, `2.3+0.8i` | `F(½,½;1;½) = 1.1803405990`; `1.1821988+0.2869619i` | `θ₃²`: same | holds on `F+2n` |
| 5.3 failure point | `τ=0.5+0.3i` | `θ₃² = 0.4863546+1.6313784i` | `F = 0.9788270−0.2918128i` | fails; README Check right |
| 5.3 boundary (R16) | `τ=1+0.5i`, `1+1.3i`, `−1+0.8i`, `3+0.7i` | `θ₃²(0\|1+0.5i) = 0.3457138` | `F(½,½;1;λ) = 0.3457138`; `λ = −32.9706` | holds off `F+2n` |
| 5.3 mapping boundary | `Re τ=±1`; semicircles | `λ(1+it)` real `< 0` | on `\|τ∓½\|=½`: real `> 1` (e.g. `1.0522`, `8.8418`) | as stated |
| `F` written out (R05) | `τ=0.3−0.8i` | `θ₃(0\|τ) = 0`, `λ = 0` | `F(½,½;1;0) = 1` | counterexample |
| complex K via `R_F` (R04) | `τ=0.3+0.8i`, `2.3+0.8i`, `−0.7+0.5i` | `R_F(0,1−λ,1) = 1.8569936+0.4507587i` | `(π/2)θ₃²`: same | statable headline |
| `carlsonRF_jacobiTheta` (20.9.3) | `t=0.8,0.3,2`; 360-point grid each | max `\|R_F − zθ₁′/θ₁\| = 1.4e−14` | all arguments off the cut | holds in the rectangle |
| 20.9.3 Checks | `τ=0.8i`, `z=1`; `z=1.6` | `R_F = 1.1662878551`; `1.5020718561` | `1.1662878551`; `1.5589818517` | agree; printed form false |
| 20.9.3, general τ | `τ=−0.9+0.4i`, `z=0.05+0.02i`, `0.2−0.1i`, `0.5+0.1i` | `R_F = 1.0003029−0.0008071i` | `zθ₁′/θ₁`: same, all three | holds near `0` |
| 20.9.4, 20.9.5 | `t=0.6, 1, 1.7` | `R_F(0,θ₃⁴,θ₄⁴) = 1.5707963` | `π/2`; `exp(−πR_F/R_F) = e^{−πt}` (`0.1518358` at `0.6`) | holds |
| `mellin_jacobiThetaThree_sub_one` (20.10.2) | `s=2`; 20.10.1 `s=3`; 20.10.3 `s=1` | quadrature `0.52350`, `1.33919`, `0.69305` (cutoff `10⁻⁴`) | `π/6 = 0.52360`, `1.3391930861`, `ln 2 = 0.69315` | holds |
| 6.2, 20.10.4–5 | `(s,ℓ,β) = (2,1.4,0.3)` | termwise θ₁: `0.1172651334`; θ₃, θ₄: `0.3041667621` | closed forms `0.1172651330`, `0.3041667623` | holds; Checks agree |
| `thetaGaussSum_reciprocity` (20.11.2) | all `m,n ≤ 12`, `mn` even | failures: `0` (including `(2,4)`, `(4,6)`) | `(1,3)`, `mn` odd: `0.5774` vs `0.7071−0.7071i` | holds without coprimality |
| 7.1 Check | `G(2,N)`, `N=3,5,8` | `G(2,3) = −1.7320508i` | conjugate of Tau Ceti's sum: same | holds |
| 7.2, 20.11.4 | `(0.3+0.2i, 0.4+0.9i)` | `f(qe^{2iz}, qe^{−2iz}) = 1.0587106558+0.0919132090i` | θ₃: same | holds |
| 7.3, 20.11.9 | `(m,n)=(2,3)`, `(0.3+0.2i,0.4+0.9i)` | `φ_{2,3} = 0.9587095−0.0370145i` | the four other forms: same | holds |

- **Sources checked.** DLMF release 1.2.8 (2026-09-15), read at the locator: 20.2.1–20.2.14 and §20.2(i), (ii), (iv); 20.4.1–20.4.12; 20.5.1–20.5.17 and §20.5(ii), (iii); 20.6.1–20.6.10; 20.7.1–20.7.34 and §20.7(viii); 20.8.1; 20.9.1–20.9.5 and §20.9(ii); 20.10.1–20.10.5; 20.11.1–20.11.9; 20.13.1; 23.15.1, 23.15.6, 23.15.9; 23.17.1; 23.18.1, 23.18.3. All 15 sampled targets match DLMF, except where corrected (20.6, 20.7.34, 20.9.3) and the locators of R09.
- **Library declarations opened.**
  - Mathlib: `TwoVariable.lean:46, 252, 255, 260, 262, 274, 293, 333, 337, 377, 385, 391, 400, 405, 466`; `DedekindEta.lean:57, 114, 166`; `ArithmeticGeometricMean.lean:165, 293`; `Liouville.lean:117`; `Uniqueness.lean:224`; `AddCircle.lean:297, 493`; `OrdinaryHypergeometric.lean:81`; `Convex.lean:45`; `MultipliableUniformlyOn.lean:130`; `FunctionSeries.lean:32`; `HurwitzZetaEven.lean:530`; `MellinEqDirichlet.lean:122`.
  - Tau Ceti: `Legendre.lean:95, 338, 352`; `Gauss.lean:60`; `Hypergeometric.lean:134`; `Carlson/Legendre.lean:288`; `Lemniscate.lean:148`; `Carlson/Basic.lean:91, 231`; `QPochhammer.lean:95, 106, 129, 135, 230, 332`; `OneVariable.lean:129`; `GaussSum.lean:227`.
  - All exist as cited. `hasDerivAt_jacobiTheta₂_snd` is absent at the pin.
- **Cross-roadmap citations resolved.**
  - On main: SpecialFunctionsHypergeometric Conventions (`Complex.gaussHypergeometric`, the principal branch on `1 − z ∈ slitPlane`), 1.3 and 1.4; ThetaSeries line 34; EllipticIntegrals line 59; ModularForms line 25. All as cited.
  - ClassicalArithmeticCompletion 4.40 does not say what the README attributes to it (R01).
  - GeometryOfNumbersAndQuadraticArithmetic §4.3 at #851 exists, and also claims the analytic triple product.
- **Gate and dependency check.** The gate at 7dbb8e2 FAILs on `tex=15` and `prnum=2`; all other checks are 0. The dependency check printed `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`.
- **Elaboration.** `lake env lean Suggested.lean` gives 25 warnings, all "declaration uses `sorry`", and nothing else. `#check @` of all 35 declarations in one scratch file shows no lost binder, with every cast in ℂ (`↑n − 1/2`, `↑a / 2`, `↑k ^ 2 * ↑m / ↑n`). Each type matches its README statement. The four R04 statements elaborate with 29 `sorry` warnings and no error.
- **One-tactic probes.** `rfl`, `simp`/`norm_num` with the definitions declared so far, and `simp` with `jacobiTheta₂_add_left/add_left'/add_right/conj/neg_left` and AC lemmas: 0 of 25 theorems close. `I_mul_jacobiThetaOne_eq_thetaBasis` closes in three tactics (R08).
- **Overlap check.** Read SpecialFunctionsAppell, SpecialFunctionsGamma, SpecialFunctionsLegendre, SpecialFunctionsGeneralizedHypergeometric, ThetaInvariantsOfEuclideanLattices, EllipticIntegrals, SpecialFunctionsHypergeometric and SpecialFunctionsParabolicCylinder, plus ClassicalArithmeticCompletion, QSeriesPartitionsAndMockModularForms and GeometryOfNumbersAndQuadraticArithmetic.
  - Real `K`, the AGM and Carlson's real integrals: EllipticIntegrals and Tau Ceti (cited).
  - Principal `F`: SpecialFunctionsHypergeometric (cited).
  - Analytic triple product: ClassicalArithmeticCompletion 4.40 (R01).
  - θ₁ zeros, `θ₁′(0)` and the `τ+1`/`S` laws: unsettled, QSeriesPartitionsAndMockModularForms §5.1 (R02).
  - 20.9.2 at `τ = it`: unsettled, ThetaInvariantsOfEuclideanLattices 1.7 (R03).
  - The other roadmaps share nothing with this one.

## Not verifiable

- Whittaker–Watson (1927), §21.3, the route of 2.1: not read, as no copy was fetched. R01 replaces the route.
- Mumford, *Tata Lectures on Theta I*, Ch. I (the theory behind 1.5): publisher text, not read. 1.5 cites no locator (R09).
- Lawden (1989), Borwein–Borwein (1987), Berndt (1991): listed in References with no locator. Not read.
- arXiv:2607.01544 and Eberl–Li–Paulson (ITP 2026, LIPIcs 382), the prior-formalization pointers: not checked.
- The `lean-DLMF` provenance table: the repository was not opened.

## Source issues

- **Error** in DLMF at 20.7.34 (§20.7(ix), web release 1.2.8): the source gives the constant as `i^{−1/4}` times a square root of `θ₂(0,q²)θ₄(0,q²)/2`, without a branch; with the principal root the sign is wrong on part of the half-plane. It should be the holomorphic root `e^{−iπ/8}η(τ)η(4τ)/η(2τ)`. Affects a stated result.
- **Error** in DLMF at 20.6.1 (§20.6): the source asserts the disc `|πz| < min|z_{m,n}|` for all of 20.6.2–20.6.5. For 20.6.3–20.6.5 the radius should be the distance to the nearest zero of `θⱼ(π·|τ)`; at `τ = i` the θ₂ series diverges for `½ < |z| < 1`. Affects a stated result.
- **Gap** in DLMF at 20.9.3 (§20.9(i)): the source states the `R_F` identity with no condition on `z`, and it fails at `τ = 0.8i`, `z = 1.6`. It should be restricted to a neighbourhood of `0`, or to the open period rectangle when `τ` is purely imaginary. Affects a stated result.
- **Gap** in DLMF at 20.9.2 and 20.11.5 (§20.9(i), §20.11(iii)): the source states them for complex τ with no domain, and with principal branches they fail at `τ = 0.5 + 0.3i`. They should be stated on the translates `F + 2n` of the Γ(2) region (they also hold on the lines `Re τ` odd). Affects a stated result.
