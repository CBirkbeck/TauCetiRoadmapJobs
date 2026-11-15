# FIX-PKG-ModularFormsPartII~11

Review settled: `REV-PKG-ModularFormsPartII~10` (three findings, all P3). Only `packages/ModularFormsPartII/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged: no Lean name, gap or source was added or removed.

## F01 (P3) — applied differently

Verified. ModularForms (main) §8.0 (arithmetic cusp forms on `Γ₁(N)` for `k ≥ 1` over a characteristic-zero field, their comparison with the analytic space matching `UpperHalfPlane.qExpansion 1`, and the descent criterion in its API) and §8.1 (`L ⊗_ℚ S_k^arith(N, ℚ) ≅ S_k^arith(N, L)`) supply the step. No supplier in §8.6 was cited for it.

What changed (§8.6 proof sketch, README :955): "Its K-coefficient space is the scalar extension of the rational structure … stable under conjugation" → M is taken to be a multiple of h; `g(τ) = f(Mτ)` lies on `Γ₀(M²) ∩ Γ₁(M) ⊇ Γ₁(M²)`; `g = Σ c_i b_i` with rational `b_i` (ModularForms §§8.0–8.1); one denominator for each `b_i` (§2.9); at an infinite place, `Σ σ(c_i) b_i`. `*Needs:*` (:957), Dependencies (:976), Scope (:11) and the ModularForms contract (:84) now cite §§8.0–8.1.

Why this is "applied differently":
- §8.2 is not cited. Its statement, `existsUniqueGaloisConjugate`, is about newforms. Stability of the whole cusp space under `Aut(ℂ)` follows in one line from the rational basis of §8.1: `(Σ c_i b_i)^σ = Σ σ(c_i) b_i`.
- The suggested text silently needed `h ∣ M`, so that the coefficients in `exp(2πiτ/M)` lie in `ι(K)`. This is now stated, using the period change of §8.5.
- The conjugation is written as `A⁻¹γA`. "Conjugation by diag(M, 1)" would read as `AγA⁻¹` under this roadmap's Conventions, which is the opposite direction.

## F02 (P3) — applied

Verified. BelyiMaps (main) §11.1 says that the Galois conjugate of an algebraic Belyi pair over `ℚ̄` has the same degree, genus and ramification partitions. §6.5 used this without citing it.

What changed (§6.5 proof sketch, :632): the following sentence was added. P is irreducible over `ℚ̄(j)` with coefficients in `K₀[j]`, and defines a Belyi pair with `t = j/1728`. σ acts through its restriction to `ℚ̄`. Conjugation preserves the degree and the partitions (BelyiMaps §11.1), and so does constant extension from `ℚ̄` to `ℂ` (BelyiMaps §9.1C). `*Needs:*` (:634), Dependencies (:682), Scope (:20) and the BelyiMaps contract (:88) were updated.

§9.1C is added beyond the suggested repair. The step passes from the `ℚ̄`-pair to the complex cover, and §9.1C is where BelyiMaps proves that constant extension preserves degree and ramification.

## F03 (P3) — applied

Verified at the Tau Ceti pin `2fd255d`, `TauCeti/NumberTheory/ModularForms/DedekindEta.lean`: `eta_two_mul` (:56) and `eta_div_two` (:75), both for `0 < τ.im`. `#check` output was compared with the README statement.

What changed:
- New Tau Ceti contract bullet (:78).
- §2.1 (:282): "by separating even and odd factors … Euler's identity" → the two lemmas give `x = q ∏(1 − q^(2n+1))⁸ ∏(1 + q^(2n))¹⁶` (prefactor `exp(8πiτ·(1/8)) = q`), and Euler's identity finishes the product.
- `*Needs:*` (:284) and Dependencies (:363) updated.

**The same pattern elsewhere.** §6.8 (:660) derived `λ(1 − λ)/16 = q ∏_{m odd}(1 + q^m)^(−24)` from the theta quotients alone, but the derivation also uses SpecialFunctionsTheta §4.2 and Euler's identity, which it did not name. The sketch now names both, as do its `*Needs:*` (:662) and the Layer 6 Dependencies (:682).

Other η expansions checked and left alone:
- `η(τ/2)²` in §6.2.
- `η⁻⁸` in §6.7.
- `(η(τ)/η(3τ))¹²` in §3.

Each of these is Mathlib's definition of `ModularForm.eta`, already cited.

## Adversarial pass on the changed text

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §2.1 product via the η lemmas | series to `q¹¹`; exponents | `q∏(1−q^(2n+1))⁸∏(1+q^(2n))¹⁶ = q − 8q² + 44q³ − 192q⁴ + 718q⁵ − 2400q⁶ + 7352q⁷ − 20992q⁸ + 56549q⁹ − 145008q¹⁰ + 356388q¹¹`, identical to `q∏((1+q^(2n))/(1+q^(2n−1)))⁸`; `8(−1/24 + 2/12) = 1` | True |
| §6.8 product | series | `∏((1−q^(2n−1))/(1+q^(2n−1)))⁸ = 1 − 16q + 128q² − 704q³ + 3072q⁴ − 11488q⁵` equals `1 − 16x`; `x(1 − λ) = q − 24q² + 300q³ − 2624q⁴ + 18126q⁵ − 105504q⁶` equals `q∏_{m odd}(1+q^m)^(−24)` | True |
| §6.5 conjugation step | `f = √2 j`; `f = λ`; `f = λ + √2` | `P = Y − √2j`, degree 1, partitions (1),(1),(1), conjugate `Y + √2j`; for λ: degree 6, partitions (3,3) over `j = 0`, (2,2,2) over 1728 and ∞, `2g − 2 = −12 + 3 + 4 + 3 = −2`, so g = 0; for `λ + √2`: `P(Y) = P_λ(Y − √2)`, conjugate root `λ − √2`, same partitions, `Γ^σ = Γ(2)` | True; indices divide 3 and 2 |
| §8.6 level change | `M = 2`, `γ = [[3, 2], [4, 3]]`; `M = 1` | `A⁻¹γA = [[3, 1], [8, 3]] ∈ Γ₀(4) ∩ Γ₁(2) ⊇ Γ₁(4)`; `M = 1` gives `g = f` on `SL₂(ℤ)` | True |
| §8.6 rational span and bounds | `F = √2Δ`, `K = ℚ(√2)`, `h = 1`; `h = 2`, `M = 2`; odd k; `k ≤ 0` | `g = √2·Δ`, `b₁ = Δ`, `D = 1`, so the finite places are bounded; other embedding gives `−√2Δ`, with `|φ(a_m)| = √2|τ(m)| ≤ √2 d(m) m^(11/2)`. For `h = 2`, `g = √2Δ(2τ)` on `Γ₀(4)` with `√2τ(m)` at index 2m. `ρ(−I) = 1` gives `F = (−1)^k F`, so F = 0 for odd k. No nonzero cusp forms for `k ≤ 0` | True; all inside `k ≥ 1` of ModularForms §8.0 |

## Checks

- **Elaboration.** Ran `lake env lean packages/ModularFormsPartII/Suggested.lean` from the content checkout. Exit 0, with 13 warnings, all `declaration uses sorry` (lines 75, 97, 145, 164, 171, 181, 195, 211, 242, 257, 285, 309, 324), and no error.
- **Signatures.** I put `#check @name` for all 22 declarations in one scratch file and elaborated it once. All 22 print without error. Every elaborated type agrees with its README statement, and nothing changed: the file has no section `variable`.
- **Pinned lemmas.** A separate scratch `#check` of `TauCeti.ModularForm.eta_two_mul`, `TauCeti.ModularForm.eta_div_two` and `TauCeti.tprod_one_add_pow_mul_tprod_one_sub_pow_odd` matches the new contract text.
- **Dependency check:**

```text
depcheck: 237 roadmaps, 2248 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line. The new citations (ModularForms §§8.0–8.1, BelyiMaps §§9.1C and 11.1, SpecialFunctionsTheta §4.2) point to roadmaps on main or to suppliers this roadmap already cites.
- **Citation resolver.** `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- **Style.** No LaTeX delimiters, process words or machine paths in the README.
- **Ownership.** No new target, construction or gap was added, so there was nothing new to check against open pull requests. The overlap list for this roadmap is empty.

## Notes for the maintainer

- No name that other roadmaps cite was changed, and no section number moved.
- The only new consumer edges point to roadmaps already on main (ModularForms, BelyiMaps). The one new edge into an open pull request, SpecialFunctionsTheta §4.2 in §6.8, is a supplier §2.1 already depends on.
- BelyiMaps §11.1 notes that Tau Ceti does not yet prove that conjugation preserves genus and ramification partitions. §6.5 relies on that roadmap target, not on a pinned declaration.
