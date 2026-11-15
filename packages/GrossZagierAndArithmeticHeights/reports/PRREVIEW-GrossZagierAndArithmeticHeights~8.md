# Review of GrossZagierAndArithmeticHeights (pull request #1487 at 7aec75d)

**Verdict:** needs changes

Incremental re-review of the 34 lines changed since d4722a0, and of the pull request's title and description.

## R01 (P2) — 9.12 cites an elliptic-only section for the Jacobian J₀(N)

**Location:** `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:5505` — “AJ_F(Δ)(ω_f) = log_(ω_f)(Δ) by SelmerIwasawaCohomology §4.26 for the semistable Jacobian J₀(N)”.

**Claim:** SelmerIwasawaCohomology §4.26 states its tangent, exponential and Kummer comparison for elliptic curves only; J₀(N) is not elliptic in general, so the step is attributed to a supplier that does not state it. The sentence replaced the Bloch–Kato citation removed for the previous R02.

**Witness:** SelmerIwasawaCohomology §4.26 at its open head: “For every finite `K/ℚ_p` and elliptic curve `E/K`”. N = p = 37: X₀(37) has genus 2. README :5317, :5340 and :5665 themselves reserve §4.26 for the elliptic case.

**Repair:** Write “… = log_(ω_f)(Δ) by PadicHodgeRegulators §1.9 (⟨log_BK κ(P), ω⟩ = log_ω(P), with no reduction assumption) for the Jacobian J₀(N)”, and add “PadicHodgeRegulators §1.9” to the `*Needs:*` line of 9.12 (:5511). Tested on J₀(37): §1.9 takes any abelian variety over a finite extension of ℚ_p and its fourth bullet is the identity used; PadicHodgeRegulators precedes this roadmap in the merge order (338 before 352).

## R02 (P3) — The motivic–unitary shift is now cited at AL.3.3, which does not state it

**Location:** `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:5035`, :5085, :5187 — “`AutomorphicLFunctionsAndLocalFactors:AL.3.3`, `AutomorphicLFunctionsAndLocalFactors:AL.3.6`”, replacing `AL.3/motivic-unitary-shift` and `AL.3/rs-global-functional-equation`.

**Claim:** AL.3.6 carries the global functional equation (AL.3.6.2), but AL.3.3 (“Induction, functional equations and test realization”) has no motivic–unitary statement; the supplier states that shift as AL.4.2.4. The locator the previous review proposed for this slug was wrong.

**Witness:** AutomorphicLFunctionsAndLocalFactors at its open head: heading “AL.4.2.4 The motivic versus unitary Rankin–Selberg centre” (motivic s ↔ unitary s − (w₀+w₁)/2); the word “motivic” does not occur in AL.3.3.1–AL.3.3.8.

**Repair:** In the three lines replace `AutomorphicLFunctionsAndLocalFactors:AL.3.3` by `AutomorphicLFunctionsAndLocalFactors:AL.4.2.4`. Tested: w₀ = 1, w₁ = 0 gives shift 1/2, so motivic s = 1 is unitary s = 1/2, which is §0.3; AL.3.6.2 already lists the local equation AL.3.3.2 in its own needs.

## Previous findings

- R01 — partly repaired: all ten slugs are gone; AL.0.2, AL.0.5, AL.4.2, A1.3, “§4.26 (Elliptic tangent, exponential and descent comparison)” and “§2.6 (Deuring–Eichler supersingular comparison)” resolve; `AL.3.3` does not carry the motivic–unitary shift (R02 above).
- R02 — repaired: the Bloch–Kato and Matev entries are removed from References and from 9.2; the replacement citation in 9.12 is wrong (R01 above).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| 9.12 (changed; R01) | a_p = ±1 at p = 5; N = 37 | (1 ∓ 1/5)² = 16/25, 36/25, both of valuation −2, nonzero; genus of X₀(37) is 2, so §4.26 (elliptic) does not apply, PadicHodgeRegulators §1.9 does | statement sound; citation wrong |
| 8.11, 8.15 `*Needs:*` (changed; R02) | weight-two form, finite-order χ | AL.4.2.4 shift (1+0)/2 = 1/2: motivic 1 ↔ unitary 1/2 = §0.3; AL.3.3 states no shift; AL.3.6.2 is the global functional equation | AL.3.6 right, AL.3.3 wrong |
| 0.7 (changed: AL.4.2) | real place; split place | ε(1) = 1, ε(sgn) = i, ε_ℂ(1) = 1: λ = i, λ² = −1 = η(−1); split: λ = 1 = η(−1) | sound; AL.4.2.1 is the transport of parameter comparisons |
| 6.2 supplier row (changed: AL.0.5) | AL.0.5.3 at t = 0 with K_(1/2)(x) = √(π/2x)·e^(−x) | integral = √π·Γ(s)/(4πm)^(s+1/2); formula √π·Γ(s+1)Γ(s)/(Γ(s+1)(4πm)^(s+1/2)) is the same | sound |
| 9.2 (changed: “also Matev” removed) | G = 𝔾_a × 𝔾_m, V the diagonal | connected subgroups have Lie algebra 0, an axis or everything, none of positive dimension inside V; so log_G(γ) ∉ V⊗ℂ_p unless zero; statement is fuchs-pham lines 77–80 | sound |
| 7.46a outline (changed: §2.6 name) | X₀(1) at q = 11 | supersingular j ∈ {0, 1728}: 2 points; class number of a maximal order in B_(11,∞) is 2 (mass 1/3 + 1/2 = 10/12) | sound |
| 0a.5 `*Needs:*` (changed: A1.3) | false elliptic surface, [2] | A1.3: ω_A locally free of rank g = 2; idempotent factor rank 1; ω ↦ 2ω as before | sound |
| 9.5 (changed: §4.26 name) | Tate curve, z ↦ q_E·z | log_p(q z) − (ord(z)+ord(q))·log_p(q)/ord(q) = log_p(z) − ord(z)·log_p(q)/ord(q) | sound; §4.26 cited for elliptic quotients only |

The rows for untouched statements stand as in the previous review, of `d4722a0`.

- Source locators checked against the text: 1 (Fuchs–Pham Theorem 2.2, fuchs-pham lines 77–80; its hypotheses and conclusion are those of 9.2). No target of the seeded sample falls in a changed passage.
- Cross-roadmap citations resolved at the open heads: 9 (AutomorphicLFunctionsAndLocalFactors AL.0.2, AL.0.5, AL.3.3, AL.3.6, AL.4.2; AbelianSchemesAndArithmeticModuli A1.3; SelmerIwasawaCohomology §4.26; SerreWeightAndLevelOptimisation §2.6; PadicHodgeRegulators §1.9). AL.0.2 resolves through that roadmap's “Identifiers owned elsewhere” list to AnalyticNumberTheoryPartII §5.3g, on main.
- The pull request's title and description were read against this head (summary block and prose): the formulas, layers, consumers (HeegnerPointEulerSystems; ModularIwasawaMainConjectures §§3.5, 3.7, 3.10), the Iwasawa-algebra statement (9.21), the three files and the validation counts agree with the head; the change since d4722a0 adds or drops no supplier, section or declaration. Nothing to correct.
- Gate at 7aec75d: every counter 0, OK. Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` (unchanged since d4722a0): one warning, `Suggested.lean:43:8: declaration uses sorry`; the signature in the worker's `#check` output equals README §0.2.
- No file changed outside the folder.
- Overlap check: no id dropped, no second copy, no other open pull request changes this roadmap; the scopes of the closest roadmaps were not read again (the diff changes no owned object); they stand as in the previous review.
- Source independence: changed passages only; 1 passage compared with 1 source (fuchs-pham), nothing shared beyond the statement's forced wording; largest share gz86, 156 of 486 linked locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- `yzz-book` and `yzz-draft` (waived), `argos` and `blr` (uncertified): not read; no changed passage cites them.
- The description's sentence on review and red-team rounds on the job board: not checkable from the files of this review.

## Source issues

- none

## For the human reviewers

- Not tested: `yzz-book` and `yzz-draft` are waived in the manifest, so the 31 locators into the Yuan–Zhang–Zhang book (`TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md`, e.g. :5033) were never compared with its text.
