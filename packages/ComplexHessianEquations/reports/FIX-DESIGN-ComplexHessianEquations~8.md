# FIX-DESIGN-ComplexHessianEquations~8

Repair of the two findings of `REV-DESIGN-ComplexHessianEquations~7` (both P3). Both were checked against the sources and both hold. Files changed: `packages/ComplexHessianEquations/design/README.md`, `packages/ComplexHessianEquations/design/plan.json` and `packages/ComplexHessianEquations/sources.toml` (two existing entries gain a locator or a `cited_for` item; no new work, no new key).

## F01 (P3) — applied

Evidence: gpt2023 line 950 fixes `1 ≤ k ≤ n`; README §8.7's `L^{p'}` bound is stated for `k < n` only. The route also omitted how §8.3's entropy hypothesis follows from `‖e^{nF_t}‖_{L^q}` (gpt2023 line 945–947 says "at once").

Change: Hessian estimate → "for a fixed `k` with `1 ≤ k ≤ n`"; route: §8.3, Hölder at `q' = q/(q − 1)`, `Ent_p(F_t) ≤ (p/(en))^p + (p/(en(q − 1)))^p·V⁻¹‖e^{nF_t}‖_{L^q}^q`, `L^{p'}` bound if `k < n`, §7.2 (`ω̂ = a_0ω_X`) if `k = n`. *Needs:* + §§3.4, 7.2. New Checks: `n = k = 2`; entropy bound. Plan 8.7 follows.

## F02 (P3) — applied

Evidence: twwy2015 line 77 is the formula `Δu = n·ω^{n−1} ∧ i∂∂̄u/ω^n`; pss2012 line 875 is `Tr h = n + Δφ`; pss2012 line 229–231 gets openness from the implicit function theorem. The identity itself is demailly2012 Corollary VI.6.5 (line 15190–15191, p. 306): `Δ' = Δ'' = Δ/2` on a Kähler manifold.

Change: §5.1 gains the three locators, demailly2012 first; it is the source of the identity, which the suggested locators only normalize. §5.2 gains "(pss2012 §2.2, line 229–231 …)" after its first statement and "(gilbarg-trudinger2001 Theorem 6.2, consumed as PDE §5.6 (E25))" at the interior estimate. Plan 5.1, 5.2 locators and the manifest follow.

## Pattern searches (other places)

- F01, the range of `k` not stated: every `Γ_k`, `σ_k` and `k`-indexed statement was read (README lines 3–370 and 704–719). Statements whose meaning breaks at an end value: the Maclaurin form inequality of §3.2 (at `k = 0` the exponent `1/k` is undefined) → "for `1 ≤ k ≤ n`"; the form identity → "for `0 ≤ k ≤ n`"; Gårding's mixed inequality → "for `1 ≤ k ≤ n`"; §3.3's Hessian instance → "for `1 ≤ k ≤ n`", with `1 ≤ j ≤ k`. Plan 3.2 and 3.3.2 gain the hypotheses. §§2.1, 2.2, 2.4, 2.5 and 3.2's invariance clause already state their ranges.
- F01, a route silent at a boundary value: §8.5 (`p' ∈ (0, n)`, `[1, n)`, `= n`), §8.3 (`p > n`), §8.6 (`n = 1`), §§6.2–6.5 (`n = 1`, from round 6) all name their end cases. No other found.
- F02, a subsection whose claim names no source id: a script over the 35 `### k.n` subsections, after the repair, finds every one naming a source key.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| §8.7 Hessian estimate, `k < n` | `q > n/k`, conjugate `q' = q/(q − 1)`; `n = 3`, `k = 2`, `q = 1.51` | `q'` decreases in `q`, so `q' < (n/k)/(n/k − 1) = n/(n − k)`; `q' = 2.96 < 3` | Holds |
| §8.7 Hessian estimate, `k = n` | `n = k = 2`, `q = 3/2`; `n = k = 1`, `q = 2` | `q' = 3`, `∫(−φ_t)³ω_X² ≤ C_3`, `E_t ≤ (c_t²/V_t)‖e^{2F_t}‖_{L^{3/2}}C_3^{1/3}`; `q' = 2`, `Γ_1 = (0, ∞)`, `a_0ω_X + i∂∂̄φ_t ≥ ω_{t,φ_t} > 0` | Holds; Check added |
| `a_0` background | `χ = 3ω_X`, `t = 1`, `a_0 = 4` | `ω_t = 4ω_X ≤ a_0ω_X`; `ω_t ≤ (a_0 − 1 + t)ω_X ≤ a_0ω_X` for `t ≤ 1` | Holds |
| Entropy from `L^q`: `Ent_p(F) ≤ (p/(en))^p + (p/(en(q−1)))^p V⁻¹‖e^{nF}‖_{L^q}^q` | pointwise `x^p e^{−δx} ≤ (p/(eδ))^p`, maximum at `x = p/δ`; 20000 random `(n, p, q, F)` with `F ∈ [−30, 30]`; two-valued `F`, `n = 1`, `p = q = 2` | `F = 1/2` and `log(2 − e^{1/2}) ≈ −1.0462` on halves: `Ent_2 ≈ 0.398 ≤ 1.310`; `F = −2` on `9/10` and `log(10 − 9e^{−2}) ≈ 2.1727`: `Ent_2 ≈ 4.633`, against `4.184` without the first term and `4.725` with it; no random violation | Holds; first term needed; Check added |
| §3.2 form identity, `0 ≤ k ≤ n` | `k = 0`; `k = n = 2`, `λ = (λ_1, λ_2)` | `ω^n = (0!n!/n!)·1·ω^n`; `α² = (2!0!/2!)λ_1λ_2ω²` | Holds |
| §3.2 Gårding mixed, `1 ≤ k ≤ n` | `k = 1`; `k = n`, `α = β = ω` | `α ∧ ω^{n−1} = (1/n)σ_1(λ[α])ω^n`, equality; `ω^n ≥ 1·1·1·ω^n`, equality | Holds |
| §3.2 Maclaurin form, `1 ≤ k ≤ n` | `k = 0`; `k = 1`, `λ = (4, 1)`; `k = n` | `1^{1/0}` undefined, excluded; `5/2 ≥ 2`; equality | Holds; range added |
| §3.3 Hessian instance, `1 ≤ j ≤ k` | `k = 1`; `j = 0` | `χ_φ ∧ ω^{n−1} > 0 ⇔ σ_1 > 0`, and `σ_1 = ce^F ⇔ χ_φ ∧ ω^{n−1} = binom(n,1)⁻¹ce^Fω^n`; `j = 0` is `ω^n > 0`, vacuous | Holds |
| §5.1 `Δ_d = 2Δ_∂̄`, `Δ_∂̄ = −Δ_ω` on functions | `u = |z|²` on `ℂ` with the Euclidean metric of `ω = (i/2)dz ∧ dz̄`; `|dz̄|² = 2` | `Δ_ω u = 2`, `Δ_∂̄ u = −2u_{zz̄} = −2`, `Δ_d u = −Δ_{eucl}u = −4 = 2·(−2) = −2Δ_ω u`; `⟨∂̄*∂̄u, u⟩ = 2∫|u_z̄|² = ⟨−2u_{zz̄}, u⟩` | Holds; both sides scale alike under `ω ↦ sω` |
| §5.2 locators | gilbarg-trudinger2001 Theorem 6.2 is the interior Schauder estimate already in the PDE §5.6 (E25) contract | no mathematical change | Holds |

## Checks run

Dependency check (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2231 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

Other checks:

- `plan.json` parses as JSON. Every new prerequisite (`target:3.4.1`, `target:3.4.2`, `target:7.2` in 8.7) points backwards. 8.7 now has four tests.
- `sources.toml` parses and still has 19 entries. `demailly2012` gains the Corollary VI.6.5 locator and `cited_for` "5.1". `gilbarg-trudinger2001` gains `cited_for` "5.2". Both texts were already settled (certified author-page copy; uncertified locator).
- `Suggested.lean`: none exists at the design stage, so no Lean name was added or removed and no `#check` comparison was run.
- No LaTeX delimiters, machine paths or process words were introduced (search done).

## Gate failures

None were listed for this round.

## For the maintainer

- No section, layer or target id was renamed or removed. Other roadmaps' citations of this roadmap are unaffected.
- Ownership: no new construction. The entropy-from-`L^q` inequality is an elementary step inside §8.7's route, not a library object. Ownership against open pull requests was not re-checked this round, because nothing new is owned.
- `demailly2012` is now cited for two results (§§5.1, 7.1). Its licence class (author page) is unchanged; the human reviewers' licence question covers this.
- `needs-references.toml` was not created; every text cited is in the manifest.
