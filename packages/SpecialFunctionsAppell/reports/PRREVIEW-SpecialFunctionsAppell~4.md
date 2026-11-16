# Review of SpecialFunctionsAppell (pull request #2166 at 6bb6712)

**Verdict:** needs changes

## R01 (P2) — 5.1: the contiguous relations of 1.6 cannot bring `𝐅₂` into the region of its Euler integral

**Location:** `TauCetiRoadmap/SpecialFunctionsAppell/README.md` line 708: "**existence** (`exists_isAppellContinuation_F2`) by the contiguous relations of 1.6"; the relations are lines 377–378.

**Claim:** Both relations of `𝐅₂` in 1.6 have a term in which `γ − β` does not grow, so no finite expansion by them ends in `Re γ > Re β > 0` when `Re(γ − β) ≤ 0`. The route to existence, and with it everything 5.1 derives "as in 3.1–3.2", lacks an input.

**Witness:** `β = 1`, `γ = ½`. The relation in `γ` sends `(β, γ)` to `(β, γ + 1)` and `(β + 1, γ + 1)`; the relation in `β` to `(β + 1, γ)` and `(β + 1, γ + 1)`. One branch always keeps `Re(γ − β) ≤ −½`.

**Repair:** Add to 1.6, for all parameters on `appellSimplex`, the relation in which every term raises `γ − β`, and its analogue in `(γ′, β′, y)`:

```text
𝐅₂(α; β, β′; γ, γ′) = γ 𝐅₂(α; β, β′; γ + 1, γ′) + α β x 𝐅₂(α + 1; β + 1, β′; γ + 2, γ′)
```

(coefficient of `xᵐyⁿ`: `γ + m` times that of `𝐅₂(…; γ + 1, γ′)`; at `α = 0.3`, `β = 1`, `β′ = 0.7`, `γ = 0.5`, `γ′ = 1.25` and the point of 1.1 both sides are `0.66395 75399 51… + 0.06269 19795 28… i`). In 5.1 say that the construction raises `γ − β` and `γ′ − β′` with it and then `β`, `β′` with the second relation. Say the same where the other two layers rely on it: in 3.1 the step that raises `γ − α` in every term is the operator relation `𝐅₁(γ − 1) = (γ − 1 + ϑₓ + ϑᵧ) 𝐅₁(γ)` with 1.4, not the displayed relation in `γ` (whose second term keeps `γ − α`); in 4.1 it is the displayed relation in `γ` after the symmetries `α ↔ β`, `α′ ↔ β′` of 1.3, `(γ − α − α′) 𝐅₃(γ + 1) + α 𝐅₃(α + 1; γ + 1) + α′ 𝐅₃(α′ + 1; γ + 1)`.

## R02 (P3) — 6.4: `analyticOnNhd_appellF4Fibre` omits the convergence the README attaches to it, and two theorems drop `γ′ ∉ {0, −1, …}`

**Location:** `TauCetiRoadmap/SpecialFunctionsAppell/README.md` lines 925–929: "Targets, for `γ, γ′ ∉ {0, −1, −2, …}` … the fibre sum converges absolutely and is analytic in `(x, y)` (`analyticOnNhd_appellF4Fibre`)"; `Suggested.lean` lines 536–546.

**Claim:** The Lean theorem states analyticity only, and it and `exists_isOpen_analyticOnNhd_appellF4Fibre` carry `hc` but no hypothesis on `c'`; the README (lines 73–74) says each named headline has every conclusion attached to it.

**Witness:** Elaborated type of `analyticOnNhd_appellF4Fibre`: `∀ (a b : ℂ) {c c' : ℂ}, (∀ k : ℕ, c ≠ -↑k) → AnalyticOnNhd ℂ … {p | -p.2 ∈ slitPlane ∧ √‖p.1‖ + 1 < √‖p.2‖}`. At `c' = 0` both theorems are about the zero function.

**Repair:** Add `(hc' : ∀ k : ℕ, c' ≠ -k)` to both theorems, and state the first as

```lean
theorem analyticOnNhd_appellF4Fibre (a b : ℂ) {c c' : ℂ} (hc : ∀ k : ℕ, c ≠ -k)
    (hc' : ∀ k : ℕ, c' ≠ -k) :
    (∀ p ∈ {p : ℂ × ℂ | -p.2 ∈ slitPlane ∧ √‖p.1‖ + 1 < √‖p.2‖},
      Summable fun m : ℕ => ‖poch(a, m) * poch(b, m) / (poch(c, m) * m !) * p.1 ^ m *
        gaussHypergeometric (a + m) (b + m) c' p.2‖) ∧
    AnalyticOnNhd ℂ (fun p : ℂ × ℂ => appellF4Fibre a b c c' p.1 p.2)
      {p | -p.2 ∈ slitPlane ∧ √‖p.1‖ + 1 < √‖p.2‖} := sorry
```

(a copy of the file with both changes elaborates with 59 `sorry` warnings and nothing else).

## R03 (P3) — SpecialFunctionsHypergeometric 1.1 is consumed but is not in the supplier contract

**Location:** `TauCetiRoadmap/SpecialFunctionsAppell/README.md` line 900: "a product of two Euler integrals of SpecialFunctionsHypergeometric 1.1"; line 910 (`*Needs:*` … 1.1–1.2); line 1004 ("1.1–1.4").

**Claim:** Scope and ownership (line 90) and the supplier contract (line 196) list 1.2–1.4, 4.2 and 5.1 as everything consumed; 6.3 and the Dependencies of Layer 6 use 1.1 as well.

**Witness:** Line 90: "whose results 1.2–1.4, 4.2 and 5.1 it consumes"; line 196: "Its 1.2–1.4: Euler's integral (DLMF 15.6.1), …". SpecialFunctionsHypergeometric 1.1 on main is "Euler's integral" (holomorphy of `E`, agreement with the series).

**Repair:** In lines 90 and 196 write "1.1–1.4" and add to the contract "Its 1.1: Euler's integral `E` for `0 < Re b < Re c`, its holomorphy and its agreement with the series on the disk, for 6.3"; the same in the description's dependency list.

## R04 (P3) — The description says every numbered formula is stated in regularized form

**Location:** pull request description: "It states every Lean-named headline of the README, among them every numbered formula of DLMF §§16.13–16.16 in regularized form".

**Claim:** 16.16.10 is stated in the classical form only, and 16.14.5–16.14.6 have no regularized form.

**Witness:** `appellF4Fibre_connection_infty` (`Suggested.lean` lines 549–556) is about `appellF4Fibre` and `appellF4`, with `hc`, `hc'`, `hab`; `hornG2`, `hornG3` are defined with `pochZ` for non-integer parameters.

**Repair:** "… among them every numbered formula of DLMF §§16.13–16.16: in regularized form, except 16.16.10, stated in the classical form for the fibre sum, and Horn's 16.14.5–16.14.6, stated for non-integer parameters".

## Previous findings

- R01 of the previous review (the description placed the large-parameter asymptotics in §16.15): repaired. The description now has "the large-parameter asymptotics;" and, separately, "the Mellin–Barnes integrals, … the inverse Laplace transforms, and the expansions for large `x` or `y` other than the connection formula of 6.4;".
- R02 of the previous review (symmetries said to be stated in `Suggested.lean`): repaired. The description now has "… are stated for `𝐅₁` or `𝐅₄` only, and the symmetries of 1.3 in the README only;", and the module docstring (lines 13–15) says the same.

## Verified sound

Series values are double sums by term ratios to total degree 150–300 in double precision; integrals by tanh–sinh quadrature; the Gauss fibres at large `y` by Pfaff's transformation in exact rational arithmetic.

| Statement | Instances | Values (left; right) | Result |
|---|---|---|---|
| 1.2 convergence | `F₂`, all parameters 1, `x = y = t` | terms `C(m+n, m) t^{m+n}`; sum `∑ₖ (2t)ᵏ`, finite iff `t < ½` | agrees; domain of 16.13.2 sharp |
| 1.6 contiguous relations | coefficient of `xᵐyⁿ`, `k = m + n` | `(γ−α)(α)ₖ + (α+k)(α)ₖ = (γ+k)(α)ₖ`; `(α+1)ₖ − k(α+1)ₖ₋₁ = (α)ₖ`; `𝐅₃`: `γ−β−β′+β+m+β′+n = γ+k` | all six and the three operator relations hold; operator relation at 1.1: `0.28222 90123 516 + 0.03217 60057 465 i` |
| 1.7 coupled series | point of 1.1 | `∑_{m+n=k} xᵐyⁿ k!/(m!n!) = (x+y)ᵏ`; `F(0.3, 0.45; 1.6; −0.05+0.25i) = 0.99411 67602 852 + 0.02014 20493 213 i` | agrees |
| 1.1 Checks | point of 1.1 | `F₁ = 0.98534 81954 425 + 0.02596 17300 553 i`; `F₃ = 0.96168 31418 789 + 0.03844 07217 530 i`; product `0.98650 59953 003 + 0.02603 34196 171 i` | agree |
| 3.1 Euler integral, branch | `(2 ± i, −3)`, quadrature | `0.84255 51403 4 ± 0.12591 00090 7 i`; at the point of 1.1 integral = series to 14 digits | agrees; conjugate pair |
| 3.3 system of `F₁` | point of 1.1 | `∂ₓF₁ = 0.08948 64331 172 + 0.01180 75608 174 i`; first equation `−8·10⁻¹⁷`; third `−3·10⁻¹⁷`; `β, β′` exchanged `0.05026 74726 732 + 0.00661 20775 860 i` | agrees; signs as 16.14.1 |
| 3.4 transformations (16.16.8) | point of 1.1 | three sides and the intermediate identity: `0.98534 81954 425 + 0.02596 17300 553 i` each; `Y/(Y−1) = (y−x)/(1−x)` for `Y = (x−y)/(1−y)` | agrees |
| 3.5 (16.16.1) | point of 1.1, `γ = β + β′` | `0.97998 88891 556 + 0.03563 40282 590 i` both sides | agrees |
| 4.1 integral over `Δ` | `(2 + i, −3)`; point of 1.1 | `0.69879 34625 + 0.17627 92407 i`; integral = series `0.96168 31418 789 + 0.03844 07217 530 i` | agrees with 16.15.3 |
| 4.2, 5.2, 6.1 systems | DLMF 16.14.2–16.14.4 beside the displays and the Lean | every coefficient and sign equal | agree |
| 4.3 (16.16.4, 16.16.5) | point of 1.1 | `0.89054 88561 402 + 0.07020 68341 136 i`; `0.81579 75249 439 + 0.10017 75069 759 i` | agree |
| 5.1 double integral | `(0.5 + 0.5i, −0.8)`, quadrature | `0.92623 81376 + 0.03619 85091 i` | agrees |
| 5.3, 5.4 | point of 1.1 | 16.16.9 `0.97539 09108 742 + 0.02959 42420 818 i`; 16.16.2 `0.94433 64431 224 + 0.04247 13862 935 i`; 16.16.3 `0.85292 70229 482 + 0.07865 82409 829 i`; `γ = γ′ = α` `0.91461 37292 184 + 0.12609 69866 502 i` | agree |
| 5.4 at the poles | `β′ = 0, −1` in 16.16.2; `α = 0, −1` in 16.16.3 | `(β′)ₙ/Γ(β′+n) = 1/Γ(β′)` and `(α)_{m+n}/Γ(α+n) = (α+n)ₘ/Γ(α)`: both sides `0` | regularized forms hold at poles |
| 6.2 expansion and cases | `x = 0.1+0.05i`, `y = −0.1+0.05i` | `0.99900 88426 085 + 0.00959 66916 471 i`; 16.16.6 `0.92311 26866 096 + 0.04292 54853 675 i`; 16.16.5_5 `0.98044 70812 481 + 0.01783 68312 094 i`; domain `0.66833` | agree |
| 6.2 coefficient identity | exact rationals, `M, N ≤ 6`, `(γ, γ′) = (8/5, 5/4)`, `(−1, 5/4)`, `(−2, −3)` | two sides equal as fractions in all 147 cases | holds, also at poles |
| 6.3 Euler integral of `F₄` | `x = 0.15+0.05i`, `y = −0.1+0.12i` | series `1.00621 43714 857 + 0.03076 28754 950 i`; quadrature `1.00621 43714 857 + 0.03076 28754 950 i`; exponents sum to `(1−ux)^{−β}(1−vy)^{−α}(1−R)^{−δ}` | agrees with 16.15.4 |
| 6.4 connection formula | `(0.3, −6+i)`; `(−0.5, −9−2i)` | fibre sum `0.63974 60136 565 + 0.02306 13488 454 i`, right side the same; `0.58084 02439 711 − 0.02930 82269 601 i` both | agrees; `(x/y, 1/y) ∈ appellF4Domain` iff `√‖x‖ + 1 < √‖y‖` |
| 6.4 maximum-modulus step | `d = dist(β₀ − α, ℤ) < ¼`, circle `‖β − β₀‖ = ½` | distance to nearest integer `≥ ½ − d`, to any other `≥ (1 − d) − ½` | both `> ¼` |
| 7.1 `G₂`, `G₃` | README points; `α′ = 0`; `x = 0` | `1.28956 88302 38 − 0.34417 52507 33 i`; `0.86214 41053 566 − 0.03245 47033 320 i`; `0.90520 28618 48` against `0.88863 92498 58`; `0.93072 62972 36` | agree; exchange of `n − m`, `m − n` detected |
| 7.2 systems | recurrences at `m, n ≤ 5` | `G₂`: residual `4·10⁻¹⁵`; `G₃` in `x` and in `y`: relative `10⁻¹³` | hold; the Lean `L₁`, `L₂`, `M₁`, `M₂` are the printed operators |
| R01 | `𝐅₂` at `β = 1`, `γ = ½` | listed relation in `γ`: both sides `0.66395 75399 51 + 0.06269 19795 28 i` (true, but one term keeps `γ − β`); proposed relation: the same value | proposed relation holds |
| Junk values | `𝐅₁(1; 1, β′; −1; x, 0)`; `𝐅₁(1; 0, 1; 1; 0, −2)` | `∑ m(m−1)xᵐ = 2x²/(1−x)³`; `𝐅(1, 1; 1; −2) = 1/3`, expansion `∑ (−2)ⁿ` | agree |

- Source locators checked against the text: 26, all DLMF (16.13.1–4, 16.14.1–6 with §16.14(ii), 16.15.1–4 with its note on Burchnall–Chaundy (68), 16.16.1–10 with 16.16.5_5, and the closing paragraphs of §§16.13, 16.15, 16.16); all agree.
- Library declarations: the 26 `#check` lines elaborate at the pins; opened `TauCeti/Analysis/Analytic/Binomial.lean:46`, `Mathlib/Analysis/Complex/Convex.lean:45`, `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:124` and `:481`. No Appell or Horn function at either pin.
- Cross-roadmap citations resolved on main (7): SpecialFunctionsHypergeometric Conventions, 1.1, 1.2, 1.3, 1.4, 4.2 (15.4.24), 5.1 (15.8.1; 15.8.2 for all parameters on `−z ∈ slitPlane`). The four copied definitions have the bodies of its `Suggested.lean`.
- Gate at this head: every scanner 0, `OK`. Dependency check: `depcheck: 253 roadmaps, 2396 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the folder is changed.
- `lake env lean` on `TauCetiRoadmap/SpecialFunctionsAppell/Suggested.lean`: 59 `sorry` warnings and nothing else. Elaborated types of all 59 theorems read against the README; none lost a binder; the only differences are those of R02.
- One-tactic probe on a copy (`simp`, `simp` with the definitions unfolded, `rfl`, `first | infer_instance | fun_prop | tauto`): none of the 59 theorems closes.
- Headlines: the systems, Euler integrals, existence and uniqueness of the principal branches, transformations, reductions, the Burchnall–Chaundy expansion and the connection formula are all stated; none is forced through a stand-in.
- Ownership against the open pull requests and main was checked by object (`Appell`, `Lauricella`, `Horn`, two-variable hypergeometric series): no second owner.

Overlap check: read SpecialFunctionsGeneralizedHypergeometric (open), SpecialFunctionsHypergeometric (main), EllipticIntegrals (main); nothing shared.

Source independence: 31 passages compared with 1 source (DLMF: 26 locators and 5 passages of prose), none shared beyond the formulas; largest share Matsumoto, 25 of 58 locators, whose text and table of contents could not be read; contents compared with DLMF §§16.13–16.16 (definitions, equations, integrals, transformations): independent, the layers are by function.

## Not verifiable

- Matsumoto (Encyclopedia of Special Functions II, Ch. 3), all 25 locators: the publisher's page is paywalled and no open copy was found (publisher page, arXiv, the editors' pages).
- Aomoto–Kita §3.1 (4 locators) and Iwasaki–Kimura–Shimomura–Yoshida §3.9.1 (2 locators): paywalled, cited by locator alone.
- Srinivasa Rao–Lakshminarayanan Ch. 7 (3 locators): the publisher's page is paywalled.
- 3.3, "the third equation follows from the first two when `α + 1 − γ ≠ 0`, but not in general", with Matsumoto's example: the source could not be read and the claim was not recomputed.
- 6.4, the growth table at `y = 5 + 0.1i`, `m = 10, 20, 40, 80`: not recomputed.
- The description's account of the author's local reviews: no record in the repository.

## Source issues

- none

## For the human reviewers

- **Not tested.** Matsumoto's chapter carries 25 of the 58 source locators and could not be read: the wording and the arrangement were compared with DLMF only.
- **Licence.** `TauCetiRoadmap/SpecialFunctionsAppell/README.md` "Prior formalization" names `lean-DLMF` (Apache-2.0, as stated there) as source material for Layers 1–7; `Suggested.lean` was not compared with that repository.
- **Licence.** DLMF was read on `dlmf.nist.gov`, a host the sources service places in no licence class; it was fetched as an institutional open copy.
