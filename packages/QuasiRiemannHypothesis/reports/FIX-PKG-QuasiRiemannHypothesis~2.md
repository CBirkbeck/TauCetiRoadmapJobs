# FIX-PKG-QuasiRiemannHypothesis~2

One review (`REV-PKG-QuasiRiemannHypothesis`), four findings, all P3. I checked each one against
the README, the pinned Mathlib and `openai2026quasiRH`, and each is correct. Only
`packages/QuasiRiemannHypothesis/README.md` changed. `Suggested.lean`, `metadata.toml`,
`sources.toml` and `design/plan.json` (`"gaps": []`) are unchanged.

## F01 (P3) — applied

Verified: the pinned `Mathlib/NumberTheory/NumberField/Ideal/Asymptotics.lean` opens
`namespace NumberField.Ideal` (line 33) and states the theorem at line 152. The lower-case form
comes from that file's own docstring (line 20) and is not a constant. All five places (the
supplier list in Scope, the Mathlib contract, the §3.5 statement, the §3.5 *Needs*, the Layer 3
Dependencies) changed `NumberField.ideal.tendsto_norm_le_div_atTop` →
`NumberField.Ideal.tendsto_norm_le_div_atTop`. No other occurrence exists in the package.
`#check @NumberField.Ideal.tendsto_norm_le_div_atTop` elaborates at the pin, with limit
`2^r₁ (2π)^r₂ R h/(w √|d_K|)`.

## F02 (P3) — applied differently

I confirmed all four runs against `openai2026quasiRH` lines 486, 701, 1082 and 3469. Three of the
rewordings follow the review's suggestion; the §9.1 one does not.
- §2.4: "a moving good prime" → "The family, the bound `6^(|S|+1)` and the common modulus are
  determined by `S` and the chosen generators alone; a numerator divisible by a good prime … lies
  outside the family."
- §4.6: "valid on noncoprime … bicharacter there" → `R(a, b) = τ(a, b)` is read off the classes
  modulo `4` (§4.4) with no coprimality condition, so the expansion holds for every primary pair.
  The *Needs* line becomes §§4.4–4.5.
- §9.1: the review suggested "evaluated at `cn³`, not at `c` and `n` separately". That is
  misleading, because `ᾱ` and the zero-extended `Ψ` are completely multiplicative, so the two
  readings agree. The bullet now states `ᾱ(cn³)Ψ(cn³) = ᾱ(c)Ψ(c)(ᾱ(n)Ψ(n))³` even when `c` and
  `n` share a prime, and that this gives `T = L₀D`.
- §10.5: "allowance … not renewed" → "the successive estimates share this single margin `T₁/2`".

The same pattern occurred twice more, and I repaired both:
- the undefined "moving primes" in §9.2 → "the primes of `P`";
- "the allowance" in the §10.5 Check → "the margin `T₁/2`".

## F03 (P3) — applied

§10.1 locator: "(`openai2026quasiRH` (6.1) and the corrected row, pp. 45–46" → "(`openai2026quasiRH`
(6.1) and the display defining `T_(m,v,η)` before it, pp. 45–46". Verified: the display is at
`openai2026quasiRH` lines 2025–2027 (p. 45) and (6.1) at line 2037 (p. 46). "Corrected" appears
nowhere else in the README.

## F04 (P3) — applied

I checked every layer the build paragraph describes against its *Needs* lines, and fixed each
dependency claim that disagreed:
- Layer 7 needs "Layers 1 (§1.2), 3 and 5"; Layer 9 needs "Layers 2, 3, 4, 6 and 8".
- Layer 4 uses Layer 2 (§§2.3, 2.5) as well as Layer 3.
- Layer 5 uses Layer 1 (§§1.1–1.2).
- The old "each needs only Layers 2–4 and LFunctions Layer 5" was wrong for Layer 8. Layer 8 cites
  no §3 and does not use LFunctions Layer 5; it uses BianchiModularForms, MaassForms,
  AutomorphicFormsOnReductiveGroups and AutomorphicSpectralTheory. The paragraph now gives Layers
  6 and 8 separately, and adds ThetaSeries Layer 1 for Layer 6.
- Layer 11 draws on Layers 1, 5 and 10.

Same pattern elsewhere: §7.2 *Needs* LFunctions Layer 7, but Layer 7's Dependencies listed only
LFunctions Layer 5. That list now reads "LFunctions Layers 5 and 7". No order changes.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Mathlib ideal-count limit (F01) | `ℚ(ω)`; `ℚ`; `ℚ(i)` | `2π·1·1/(6√3) = π/(3√3) ≈ 0.6046`, count at `H = 3` is `2` against `1.814`; `2·1·1/(2·1) = 1` (`⌊s⌋ + 1` ideals incl. `0`); `2π/(4·2) = π/4` | agrees with §3.5 and its Checks | name only |
| §2.4 scope remark | `S = {λ, 2}`, numerators `1`, `−1`, `p = 1 + 3ω` | `1`, `−1` in the family (`u = ±1`, `v = 0`); `p` has `v_p = 1`, `p ∉ S`, so it is outside; `χ_A(π^6) = 1` for good `A` | holds | reworded |
| §4.6 expansion on noncoprime pairs | `(p, p)`, `p = 1 + 3ω`; `(1 + 3ω, −2 + 3ω)`; `(1, b)` | class of `λ` both: `τ(λ, λ) = (−1)^(0+0+1) = −1 = R(p, p) = γ_3(p)² = i²`; coprime pair `−1 = χ_b(a)/χ_a(b)`; `τ(1, b) = 1` | holds on every primary pair | reworded, *Needs* §§4.4–4.5 |
| §9.1 multiplicativity | `c = n = p`; `c` divisible by a prime of the modulus; `t = s − 1/2` | `α(p⁴) = α(p)·α(p)³`; both sides `0`; `q_c^(−1/2−t) q_n^(−1−3t) = q_c^(−s) q_n^(−3s+1/2)` | Mellin identity with `T = L₀D` | reworded |
| §9.1 `cn³` form | `A = p², p³, p⁴` | valuations `2, 0, 1` mod `3`: no; `1·p³`; `p·p³` | agrees with its Checks | none |
| §9.2 "primes of `P`" | `P = ∅`; `P = {p}` active, inactive | `ζ_t = −(i/81) ᾱ(c_t)² φ̂(h₀) κ̄_F`; factor `ω_(p,j_p) χ_p(σ_p)^(−2)` resp. `1 − q_p⁻¹` | active primes lie in `P` (`r_t = ∏ p`) | reworded |
| §10.5 margin | `n_v = 3`, `(1, −3, 0)`; `n_v = 1`, `a = 1` | `T₁/12 + 3·T₁/24 = 5T₁/24 < T₁/2`; without the factor `T₁/6 + T₁/2 = 2T₁/3 > T₁/2`; `|v| ≤ T₁/4 < T₁/2` | `(3i + 1)T₁ + T₁/2 < (3i + 2)T₁` | reworded |
| §10.1 locator | source pages | display p. 45 (line 2025), (6.1) p. 46 (line 2037) | correct | reworded |
| build paragraph | each layer's *Needs* lines | Layer 4: §§2.3, 2.5, 3.5; Layer 5: §§1.1, 1.2; Layer 6: §§3.2, 3.5, Layers 2, 4; Layer 8: §§2.3, 2.5, 4.1–4.3, no §3; Layer 7: §§1.2, 3.2, 5.1–5.3; Layer 9: §§2.4, 2.5, 3.2–3.5, 4.1–4.5, 6.2, 8.1, 8.7; Layer 11: §§1.1, 5.4, 10.7 | agrees with every Dependencies list | rewritten |

## Checks

- **Elaboration** (`lake env lean packages/QuasiRiemannHypothesis/Suggested.lean` from the
  content checkout; `TauCeti.NumberTheory.LFunctions.Hecke.Basic` object file present): exit 0, 10
  warnings, all "declaration uses `sorry`" (lines 79, 93, 102, 109, 121, 131, 143, 155, 169,
  177), no error.
- **Signatures**: I elaborated a scratch copy with `#check @name` for all 11 declarations and for
  `NumberField.Ideal.tendsto_norm_le_div_atTop`. Each type matches its README statement (§§1.1,
  5.5, 10.7, 11.1–11.3) with no lost binder. Nothing in the Lean file changed.
- **Dependency check** output: `depcheck: 261 roadmaps, 2606 edges, 0 problem(s)`. There is no
  UPWARD, CYCLE or `moved:` line. The suppliers named in the rewritten paragraph (ThetaSeries,
  BianchiModularForms, MaassForms, AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory,
  LFunctions Layer 7) were already cited in the layers.
- **Citations** (`roadmaps resolve`): no cross-roadmap citation or Lean name found nowhere. The
  worker's lead `SieveApplications.leastNonresidue` is a name defined by SieveMethodsAndPrimePatterns
  §2.9 (as the review confirmed), not a pinned declaration; no change.
- **Ownership**: no new target or construction was added, so no ownership question arises.

## For the maintainer

- No Lean name, section number or target id changed, so no other roadmap's citations are
  affected.
- The review's source-issue note (a misprint `min(1, r₊)/Y` in `openai2026quasiRH` Lemma 6.2's
  proof) needs no change: §10.2 already uses `min(1, 1/r₊)/Y`.
- The review's "For the human reviewers" items (unrefereed sources, licence of the OpenAI texts,
  the not-yet-existing QuasiRiemannHypothesisPartII) are for humans and were left as they are.
