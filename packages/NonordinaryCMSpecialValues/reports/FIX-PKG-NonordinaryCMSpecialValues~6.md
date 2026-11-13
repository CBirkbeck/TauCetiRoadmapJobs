# FIX-PKG-NonordinaryCMSpecialValues~6

Findings of the review `REV-PKG-NonordinaryCMSpecialValues~5` (three findings: one P1, one P2, one P3). Files edited: `packages/NonordinaryCMSpecialValues/README.md` and `packages/NonordinaryCMSpecialValues/sources.toml` (one locator). `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged: no Lean statement depends on §§0.1, 1.1, 2.2–2.7.

## F01 (P1) — applied

Verified. Kato defines `α_n` and `ν_n` for every `n ≥ 0`, but states the norm relation `N_p(θ_{n+1}) = θ_n` and the Kummer system `(θ_n(ξ_n))_n` only for `n ≥ 1` (KATO04 lines 5488–5491 and 5523, printed pp.258–259). The README's system started at `n = 0`. When `f_0 = O_K`, `α_0` is the image of `p^m ∈ g = p^m O_K`, so `α_0 = 0 ∈ E[a]`. Then `{}_aθ_E(0) = 0`, because the function vanishes to order `N(a) − 1` at the origin, and `0` has no Kummer class. In general `α_n` has annihilator `p^n f_0`, and `α_n ∈ E[a]` exactly when `a ⊂ p^n f_0`. Since `a` is prime to `pf`, that happens only when `n = 0` and `f_0 = O_K`. The reviewer's witness was recomputed and holds.

Changed (old → new): §2.5 system `(θ_n(ξ_n))_{n ≥ 0}` → tail `n ≥ m` at levels `K(p^n f_0)`: units `(_az_{p^n f_0})⁻¹`, norm-compatible by §2.2, cofinal in `K(p^∞f)`, lower layers by corestriction; evaluation at `α_m` and `p^{−mr}` unchanged. Same pattern: §2.3 tail `n ≥ n_f`; §2.2 levels stated; §2.6 index; §2.7 undefined "admissible" made precise. New Checks: §2.5 unit-ideal witness, §2.3 `Q(i)` initial levels.

## F02 (P2) — applied

Verified. ROHRLICH-NOTES line 1618, (2.41), gives an archimedean root number of `i^{−|m|}`. Lines 1844–1846, (2.56)–(2.57), printed p.38, fix Rohrlich's character as negative at infinity and positive at the finite places. AL.1.3.5 case (iv), at the AutomorphicLFunctionsAndLocalFactors head, uses `ψ = e(z + z̄)` and gives `ε = i^{max(a,b)}`, which is `i` for `φ_∞(z) = z⁻¹`. The README called Rohrlich's factors "standard", although its Conventions fix AL.1's character as the standard one.

Changed (old → new): §1.1 "in the standard additive character the archimedean factor is `−i` …" → those factors labelled Rohrlich's normalisation, then transported by `φ_v(−1)` (`φ_∞(−1) = −1`, `φ_q(−1) = (−1)^{δ_q}`) to AL.1's `+i` and `(−i)^{δ_q}(2/q)∏(q/r)`, product still `(2/D)`. The conversion-only Check is replaced by `D = 7` and `D = 15` computations. Rohrlich locator gains §7.1, (2.56)–(2.57).

Pattern search: §§1.2–1.4 use only factors that do not depend on the sign of `ψ`. These are the Gauss-sum pairing `ν_λ(−1) = 1`, the unramified factor `ω(ϖ^ν)`, and Fröhlich–Queyrut with `χ` trivial on `Q_p×`. No other passage states a factor in a fixed additive character. The headline formula `W(φ) = (2/D)` and the parity theorem are unchanged.

## F03 (P3) — applied

Verified: `κ_K` is quadratic, so `κ_K(7)⁻¹·7 = −7`, not `+7`. In the §0.1 Check, old: "The wrong sign `+7` is the law of the inverse quadratic character". New: "Omitting the quadratic character gives the wrong value `φ((7)) = 7`, which fails; inverting the quadratic character changes nothing, since `κ_K(7)⁻¹ = κ_K(7) = −1`." A search found no other passage that inverts a quadratic character.

## Checks run

- **Elaboration.** `lake env lean packages/NonordinaryCMSpecialValues/Suggested.lean`, run from the content checkout, exited 0. The output was exactly three warnings, "declaration uses `sorry`", at lines 130, 140 and 166 (`rohrlichCount_eq_zero`, `rohrlichCount_lt`, `centralValue_parity_dichotomy`). Both `TauCeti.*` object files were present, so no targeted build was needed.
- **Signatures.** I wrote a scratch copy with `#check @name` for all ten declarations and elaborated it once (exit 0). I compared each elaborated type with its README statement:
  - The six definitions keep `[Field K] [NumberField K]`, plus `[IsCMField K]` where the README needs it.
  - `rohrlichCount_eq_zero` and `rohrlichCount_lt` keep their algebraicity, nonzero-direction, `c < 1/2`, `1/2 < d < 3/5` and `5d/2 − 1 < s < 1/2` hypotheses.
  - `centralValue_parity_dichotomy` keeps `IsCMField`, `IsQuadraticExtension ℚ K`, `Fact p.Prime`, `p ≠ 2`, `v = (p)`, equivariance, unramifiedness of `φ` and `ν` at `v`, finite odd order, anticyclotomy and the uniformizer hypothesis.
  - No binder was lost, and nothing changed (the Lean file was not edited).
- **Dependency direction.** The prescribed gate output was `depcheck: 206 roadmaps, 1906 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` reports one lead: "LubinTateFormalModulesAndQuasiCanonicalLifts §2.1: no roadmap … on main or in an open pull request". This is a false positive. The board package `packages/LubinTateFormalModulesAndQuasiCanonicalLifts` exists, has `### 2.1 Finite-height torsion` at line 605, and is earlier in `ORDER.txt`. No citation was added or changed by this round.
- **Gate failures.** None were listed for this round.
- **Sources.** No new source was needed, and `needs-references.toml` was not created. Every locator used was read in the cached texts: KATO04 lines 5288–5290, 5478–5527; ROHRLICH-NOTES lines 1606–1728, 1840–1850.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| §0.1 Check, sign at 7 | `Q(i)`, inert 7; models: correct, κ omitted, κ inverted | `κ(7)·7 = −7`; omitted `1·7 = 7`; inverted `(−1)⁻¹·7 = −7` | Only omission gives `+7`; wording fixed |
| §1.1, Rohrlich factors | D = 7, 11, 23, 15, 231 | 7: `(−i)(i) = 1`; 11: `(−i)(i·(−1)) = −1`; 23: `(−i)(i) = 1`; 15: `(−i)(i)(1) = 1`; 231 (t = 3): `(−i)·i³·(2/231)·(−1)³ = 1` | Equal to `(2/D)` = 1, −1, 1, 1, 1 |
| §1.1, AL.1 factors | Same D | 7: `(i)(−i) = 1`; 11: `(i)((−i)(−1)) = −1`; 23: `(i)(−i) = 1`; 15: `(i)(−i)(1) = 1`; 231: `i·(−i)³·1·(−1) = (−1)(−1) = 1` | Equal to `(2/D)`; the transport is consistent |
| §1.1, `∏_v φ_v(−1) = 1` | D = 7, 11, 15 | `(−1)(−1)`; `(−1)(−1)`; `(−1)·(−1/3)(−1/5) = (−1)(−1)(1)` | All equal 1 |
| §1.1 Check, mixed conventions | D = 7 | `(i, i)`, product `−1 = −(2/7)` | Mixing is detected |
| §1.1, unramified places | `v ∤ D` (including 2), both conventions | AL (i), `ν = 0`: `ε = 1`; Rohrlich (2.43), unit `γ`: `1` | Factor 1 |
| §2.3, `n_f` | `Q(i)`, `f = O_K`; p = 7, 2; `Q(√−3)`, p = 2 | p = 7: units distinct mod 7, `n_f = 1`. p = 2: `2 ∈ 2Z[i]`, so `±1` collide mod 2; differences `2, 2i, 1±i` lie outside `4Z[i]`, so `n_f = 2`; `[K(4):K] = 8/4 = 2`, `K(2) = K`. `Q(√−3)`: `±1` collide mod 2, distinct mod 4 | Tail starts at `n_f ≥ 1` |
| §2.3, units in `O[1/p]×` | p = 7, `f = O_K` (one divisor); p = 5 split, `f = O_K` (two divisors); `f_0 ≠ O_K` | `7^n`: `𝔭`-unit for `𝔭 ∤ 7`. `5^n = (2+i)^n(2−i)^n`: unit. `p^n f_0`, n ≥ 1: two divisors, unit | Holds for n ≥ 1; fails at n = 0 when f is a single prime power not above p |
| §2.5, annihilator of `α_n` | p = 7, `f_0 = (8)`, m = 1, n = 0; `f_0 = O_K`, n = 0, 1, 2 | `{x : 7x ∈ 56Z[i]} = 8Z[i]`; `α_0 = 0`; `α_1 = 1 mod 7Z[i]`, annihilator (7); `α_2 = 1/7`, annihilator (49) | Annihilator `p^n f_0` in every case |
| §2.5, `α_n ∈ E[a]` | `a = (5)`; n = 0, 1, 2; `f_0 = O_K` or `(8)` | `E[5] ∩ E[7^n] = 0` for n ≥ 1; `E[5] ∩ E[8] = 0`; for n = 0 and `f_0 = O_K`, `α_0 = 0 ∈ E[5]` with order of vanishing `25 − 1 = 24` | Only (n = 0, `f_0 = O_K`) fails; the tail `n ≥ m ≥ 1` avoids it |
| §2.5, function norm | general n ≥ 0 | `N_p(θ_{n+1})(z) = ∏_{pu = z − pν_{n+1}} {}_aθ_E(u) = θ_n(z)`, using `pν_{n+1} = ν_n` and `p` prime to `a` | Holds as functions for every n; the value-level relation is used only for n ≥ m |
| §2.5, cofinality | `f = (7)`, `f_0 = O_K`, k = 1 | `K(7^n) ⊂ K(7^n·7) ⊂ K(7^{n+1})`; degrees `[K(7):K] = 12`, `[K(49):K] = 588`, ratio 49 | Towers agree |
| §2.5, scalar | m = 1, r = 1, 3 | `p^{−mr}` = 1/7, 1/343; `ξ^{⊗(−r)} = p^{−mr}β^{⊗(−r)}` | Unchanged |
| §2.2, levels | `Q(i)`, f = (3), p = 7, n = 0 | The pair of modulus 3 exists (units distinct mod 3), but Kato's relation is stated only for n ≥ 1 | Parenthetical cites KATO04 lines 5288–5290; no claim made at n = 0 |
| §2.7, moduli | `Q(√−7)`, `f = (√−7)`; any `φ` of type `(1,0)` | `2 ∉ (√−7)`, so `±1` are distinct mod `f`. In general a unit `ε ≡ 1 mod f` has `ε = φ((ε)) = 1`, so units inject modulo every `a ⊂ f` | Every such level has a canonical pair; the clause fixes the corestriction method and excludes nothing |

## For the maintainer

- No section, layer, heading or Lean name changed, so no citing roadmap breaks.
- ModularIwasawaMainConjecturesPartII consumes §§2.1–2.6 from here. In §§2.3 and 2.5 the Kummer systems are now explicitly tails (`n ≥ n_f`, `n ≥ m`), with lower layers reached by corestriction. That roadmap should evaluate theta functions only on such tails if it restates them.
- The local root-number factors of §1.1 are now given in both conventions. A consumer that uses the local factors (not only `W(φ) = (2/D)`) should use the AL.1 values `+i` and `(−i)^{δ_q}(2/q)∏(q/r)`.
- No construction was added, so ownership is unchanged. AL.1.3.5 case (iv) was checked at the open head of AutomorphicLFunctionsAndLocalFactors through the roadmaps service. Ownership against open pull requests was not re-checked beyond that, since no new object was introduced.
- The review text contained no instructions directed at the worker; nothing suspicious to quote.
