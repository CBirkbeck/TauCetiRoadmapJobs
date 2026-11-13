# Review of SymmetricHyperbolicSystems (pull request #2246 at 6a5cca3)

**Verdict:** needs changes

## R01 (P3) — The description's Layer 7 line still describes an earlier head (previous R02, not repaired)

**Location:** The pull-request description: "7. General A⁰: the smooth square root of positive definite matrices (Mathlib's matrix functional calculus and the inverse function theorem) and normalization."

**Claim:** The head does not prove that the square root is smooth and does not use the inverse function theorem. Smoothness is taken from Tau Ceti, and §7.1 is a target about derivative bounds. The description was not edited with this head.

**Witness:** `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md:789`: "(Tau Ceti `Matrix.contDiffOn_sqrt`, `Matrix.contDiffOn_rpow`)"; line 822: "*Needs:* Tau Ceti's `Matrix.contDiffOn_sqrt` and `Matrix.contDiffOn_rpow`". The README has no occurrence of "inverse function".

**Repair:** Replace the item in the description with: "7. General A⁰: uniform bounds for the derivatives of the square root of a positive definite matrix-valued function and of its inverse (smoothness from Tau Ceti's `Matrix.contDiffOn_sqrt` and `Matrix.contDiffOn_rpow`), and normalization."

## Previous findings

- R01 — repaired: `README.md:399–402` "`le_gronwallBound_of_liminf_deriv_right_le`, applied on `[0,t]` to `G(s) = E(s) − ∫₀ˢ ‖F‖²` with `K = (κ+1)/λ` and `ε = K ∫₀ᵗ ‖F‖²`"; the two-sided lemma is also gone from the Mathlib contracts (line 132).
- R02 — not repaired: the description still reads "the smooth square root of positive definite matrices (Mathlib's matrix functional calculus and the inverse function theorem)" (R01 above).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.3 energy estimate, new Grönwall route | general; `A⁰ = 1`, `Aʲ = 0`, `B = 1`, `F = 0`, `λ = 1`, `κ = 0` | `G' = E' − ‖F(s)‖² ≤ K·E = K·G + K∫₀ˢ‖F‖² ≤ K·G + ε` (uses `K ≥ 1/λ > 0`, `s ≤ t`); witness: `−2E ≤ E` | hypothesis `bound` of the lemma holds | none |
| §2.3 closed form of the bound | `K ≠ 0` branch of `gronwallBound`; witness above | `E₀e^{Kt} + (ε/K)(e^{Kt} − 1) + I = e^{Kt}(E₀ + I)` with `I = ∫₀ᵗ‖F‖²`; witness: `e^{−2t}E₀ ≤ eᵗE₀` | equals README line 366 | none |
| §2.2 Grönwall step, now the one-sided lemma (contract line 132) | `δ = 0`, `ε = 0`, `K = κ/λ`, including `κ = 0` | `gronwallBound 0 K 0 t = 0` in both branches (`K = 0`: `0 + 0·t`); with `E ≥ 0`, `E = 0` | holds; `K = 0` needs no separate case | none |
| §2.1 identity, new remark `uᵀCu = −⟪Ku, u⟫` | `N = n = 1`, `A⁰ = 1`, `A¹ = x`, `B = b`; general | `C = 2b − 1`, `K = 1 − 2b`; in general `uᵀ(2B)u = uᵀ(B + Bᵀ)u` | holds | none |
| §3.2 discrete Sobolev (new comparison sentence only) | `v = δ₀`, `n = 1` | `‖v‖²_h = h`, `‖D₊v‖²_h = 2/h`; `1 ≤ h + 2/h` (minimum `2√2`) | holds | none |
| §4.2 CFL condition (locator changed) | `n = 1`, `A¹ = a`; general `n` | weights `½(1 ± μa) ≥ 0` iff `μ|a| ≤ 1`; `2n` weights with scalar part `(2n)⁻¹` sum to `1` | holds | none |

The diff changes no statement and no line of `Suggested.lean`; rows for untouched statements stand as in the previous review, of `68aa515`.

- Gate at `6a5cca3`, run again: every check `0`, `OK`. `lake env lean` on `Suggested.lean`: 0 errors, 14 `sorry` warnings, nothing else.
- Dependency check: `depcheck: 240 roadmaps, 2174 edges, 0 problem(s)`; no UPWARD or CYCLE line. The README names no roadmap as a supplier. Nothing changed outside the folder.
- Pinned declarations opened: Mathlib `Analysis/ODE/Gronwall.lean:43` (`gronwallBound`, both branches), `:78,83` (`gronwallBound_ε0`, `gronwallBound_ε0_δ0`), `:112` (`le_gronwallBound_of_liminf_deriv_right_le`: `f f' : ℝ → ℝ`, `bound : f' x ≤ K * f x + ε` on `Ico a b`), `:134` (the removed two-sided lemma). The README's line number 112 is right.
- Internal consistency of the 20 new or changed locators: each page cited in the text lies in the range the References entry gives for that source (John §3 (a) pp. 163–170; Lax §4.3 pp. 41–45, §§8.1–8.3 pp. 83–88, §8.7 pp. 103–104; Friedrichs pp. 348, 361, 373–374, 379–382), and each "Cited at" list matches the sections that cite the source (John 11, Lax 6, Friedrichs 4 places).
- Description against the head: every other sentence stands (`Suggested.lean` has the single import of Mathlib; seven layers with the titles listed; pins as stated). Only item 7 is wrong (R01).
- Overlap check: read PDE (on main and its open revision) and QuaternionicAnalysis, the three lists of the overlap data; nothing shared. No id cited is dropped by an open pull request; no other open pull request changes this folder.
- Source independence: changed passages only; 9 changed passages (the locator notes at §1.2, §2.1, §2.2, §2.3, §3.2, Layer 4, §4.2, §5.1, §6.3) could be compared with 0 sources, since no cited text was readable; largest share John 1982, 14 of 34 locators; the diff adds, removes or reorders no layer, so the contents were not compared again.
- Remark (untouched text, no change asked): §6.1 line 713 and §5.1 line 636 say the argument "follows" or is estimated "as in" John 1982, Ch. 5 §3 (b).

## Not verifiable

- Rudin 1976, Theorem 9.21, p. 219 (§1.1): McGraw-Hill textbook; the sources service found no legal copy.
- John 1982, (3.1a) p. 163, (3.5a)–(3.5b) and (3.6)–(3.8) p. 164, (3.9)–(3.12a) p. 165, (3.20a)–(3.21) pp. 167–168, (3.24) and Problem 3, (3.25a)–(3.25d), pp. 169–170 (§1.2, §2.1, §2.3, §3.2, §5.1): Springer, paywalled; recorded by the service as uncertified.
- Lax 2006, Theorems 4.3, 4.5, 4.6 (pp. 41–45), (8.9)–(8.11) and Theorems 8.1, 8.3 with Notes (1)–(2) (pp. 84–87), (8.69)–(8.70) (p. 104) (§2.2, §2.3, §4.1, §4.2, §6.3): AMS Courant Lecture Notes; no open copy found.
- Friedrichs 1954, p. 348, §7 Theorem 7 p. 361, §15 pp. 373–374, §19 (19.18)–(19.20) pp. 381–382 (§1.2, §2.3, Layer 4, §4.2): the publisher's page returned HTTP 403.
- The seeded-sample targets that fall in changed passages (§1.2, §2.1, §2.2, §2.3, §3.2, §6.1, §6.3) carry only these locators as changes; the mathematics of each was recomputed above, the page and equation numbers were not checked against the texts.

## Source issues

- none

## For the human reviewers

- **Not tested.** John 1982 has the largest share of the README's locators (14 of 34) and its text and table of contents could not be read (Springer, paywalled): wording and arrangement were not compared with it in this or the previous reviews.
- **Not tested.** None of the 20 page and equation locators added at this head (John 1982, Lax 2006, Friedrichs 1954, Rudin 1976) could be checked against a text; they are consistent with one another and with the References entries.
