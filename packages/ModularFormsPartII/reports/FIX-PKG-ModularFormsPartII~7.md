# FIX-PKG-ModularFormsPartII~7

This round repairs the four findings of `REV-PKG-ModularFormsPartII~6`: one P2 and three P3. Each was checked against the cited sources (CDT25 in the sources cache), the roadmap's own text, the sibling roadmaps (SpecialFunctionsTheta at the head of its open pull request, NoncongruenceModularForms, FuchsianOrbifolds, ConformalMapping and BelyiMaps on main), the package's `design/README.md`, and the pinned Mathlib and Tau Ceti. Every value quoted below was computed. All four findings are right and all four are applied.

Files changed:

- `packages/ModularFormsPartII/README.md`
- `packages/ModularFormsPartII/Suggested.lean` (one docstring; no signature changed)

`metadata.toml`, `sources.toml` and `design/plan.json` are unchanged. No supplier gap was needed, because SpecialFunctionsTheta already states everything this roadmap now imports from it. No source was fetched and no `needs-references.toml` was written. The review contains no instruction aimed at the worker and nothing suspicious.

## REV-PKG-ModularFormsPartII~6/F01 (P2) — applied

λ, its laws, the `Γ(2)`-region bijection and `F(1/2, 1/2; 1; λ) = θ₃²` are now imported from SpecialFunctionsTheta §§2.2, 4.1, 5.1–5.3 (Scope bullet; supplier contract with nome check). §2.1's theta formulas, laws and omission of 0 and 1 become one target, "the η quotient is that λ on `ℍ`"; `Γ(2)`-invariance stays here. §§2.2, 2.6, 2.7 cite it.

**Verification.** SpecialFunctionsTheta is an open pull request by another author that adds a new roadmap folder, so it may be consumed. Its `## Scope and ownership` says it owns "the modular function λ" and the two auxiliary results (the behaviour of `λ(it)` and the bijection of F). §4.1 has 20.7.5, §5.1 has the laws and `λ ∉ {0, 1}`, and §5.3 has the bijection, the boundary and cusp values and 20.11.5. It does not state a covering map, a deck group or the η-quotient form, so those stay here. It uses the same nome, `q = e^{iπτ}`. At `τ = 0.3 + 0.8i` our η quotient is `0.7660029 + 0.4097863i`, and its §5.1 Check gives `0.76600 28750 45… + 0.40978 63252 79… i`.

**One deviation from the suggested repair.** The review says that after the change the triple product is "needed only for the product formula". That is not right. The η product gives `x = q ∏ (1 − q^(2n−1))⁸ (1 + q^(2n))¹⁶`. Reaching the stated form `q ∏ ((1 + q^(2n))/(1 + q^(2n−1)))⁸` needs Euler's identity, which is Tau Ceti `TauCeti.tprod_one_add_pow_mul_tprod_one_sub_pow_odd` (`Analysis/SpecialFunctions/QPochhammer.lean:230`). It does not need the triple product. So §2.1 now cites Euler's identity, and GeometryOfNumbersAndQuadraticArithmetic §4.3 leaves §2.1 and the Layer 2 Dependencies. It stays in the Scope and the contract because §8.3 still uses it.

**Pattern repaired elsewhere.**

- Summary, Scope's owned list, "How to read the build" and the Layer 2 introduction now say that λ is SpecialFunctionsTheta's, presented here as an η quotient.
- §2.2's route no longer re-proves the bijection with Schwarz reflection. It takes the bijection from SpecialFunctionsTheta §5.3. The two boundary sides come from §5.1 together with the laws (`λ(1 + it) = u/(u − 1)`, and the semicircle is the S-image of `Re τ = −1`). The fundamental set comes from Poincaré's polygon theorem (FuchsianOrbifolds Layer 2 item 3, added to the Scope and the contract). ConformalMapping L4 is now used nowhere, so it is removed from the Scope bullet, the contract heading and paragraph, §2.2's Needs and the Layer 2 Dependencies.
- §2.1's `Γ(2)`-invariance now has its own route: generation by `−I`, `T²` and `[[1, 0], [2, 1]]`, by a Euclidean reduction of the first column.
- The Mathlib contract drops `jacobiTheta₂_functional_equation`, which is now unused. It records `θ₂` and `θ₄` through `jacobiTheta₂`.
- §2.6 gained a domain. The adversarial pass showed that `K₀(x(τ)) = θ₃(τ)²` holds near `∞` only. At `τ₀ = (8 + 2i)/17 = [[1, 0], [2, 1]]·2i`, `K₀(λ(τ₀)/16) = 1.0074837` but `θ₃(τ₀)² = 1.0074837 + 4.0299349i`. This is now a Layer 2 Example.
- `Suggested.lean`: the docstring of `modularLambda` now names SpecialFunctionsTheta §5.1. Its definition and every signature are unchanged. The fully qualified names differ (`TauCetiRoadmap.ModularFormsPartII.modularLambda` here, `TauCeti.modularLambda` there).

## REV-PKG-ModularFormsPartII~6/F02 (P3) — applied

`## Scope and ownership` gains a table with the header "Former numbering | Section", one row per moved id:

| Former | Section |
|---|---|
| W2.3 | §2.4 |
| W2.4 | §2.3 |
| W6.5 | §6.6 |
| W6.6 | §6.7 |
| W6.7 | §6.8 |
| W6.8 | §6.9 |
| W7.4 | QSeriesPartitionsAndMockModularForms §8.4a |

A sentence before the table states that any `Wk.n` not listed is §k.n.

**Verification.** NoncongruenceModularForms on main cites "W6.3–W6.5 (integral, rational and number-field unbounded denominators for weak forms)" (its README lines 161, 304, 1579, 1588, 1799). The package's `design/README.md` has `### W6.5. Algebraic-integer Fourier coefficients` at line 1024, which is §6.6 here; §6.5 is now Galois conjugation. I compared every other design heading (W1.1–W9.3) with the README: only the seven ids in the table moved. W1.2, W1.3, W1.5, W1.6, W1.8, W6.3 and W6.4, which NoncongruenceModularForms also cites, are unchanged.

## REV-PKG-ModularFormsPartII~6/F03 (P3) — applied

§2.7: "Theorem 5.1.4, pp.667–668" becomes "Theorem 5.1.4, p.668".

**Verification.** In CDT25, line 2346 opens extraction page 42, which is journal p.668 (offset 626). The theorem with (5.1.5)–(5.1.6) is at lines 2382–2397. Page 667 (line 2299 on) mentions it only at line 2305. No other occurrence of this citation carries a page: README §6.1 and the docstring of `boundedDenominatorSpan_eq_congruenceSpan` cite "Theorems 5.1.4 and 6.0.1" without one.

## REV-PKG-ModularFormsPartII~6/F04 (P3) — applied

§7.3 Check: "the classical forms on `SL₂(ℤ)` with that character" becomes the following. With `ρ(−I) = 1`, the definition gives the holomorphic f with `f ∣[k] γ = ρ(γ)f` that are §1.1 weak forms on `ker ρ`, with poles at `∞` allowed. `Δ⁻¹` (`ρ = 1`, `k = −12`) qualifies, and the character of `η²` is excluded.

**Verification.** `|Δ⁻¹(τ)| = e^{2π Im τ}/|∏(1 − Qⁿ)|²⁴ ≤ A e^{2π Im τ}` for `Im τ ≥ C`, so §7.3's growth clause holds with `B = 2π`. Both directions of the corrected statement hold, because `|f(τ + 1)| = |f(τ)|` for a finite-order character, so strip bounds are uniform bounds. The character of `η²` has `χ(S)² = −1` (§1.3), so `χ(−I) = −1`. Other occurrences: the Lean docstring of `IsVectorValuedForm` already says "moderate growth in vertical strips" and is correct; nothing else claims holomorphy at the cusps.

## Adversarial pass on the new and changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §2.1 product formula (route via Euler) | `q`-series to `q⁶`; Euler at `q = 0.5` | `x = q − 8q² + 44q³ − 192q⁴ + 718q⁵ − 2400q⁶`; `2.3842310 · 0.4194224 = 1.0000000` | True | Needs: Euler's identity replaces the triple product |
| §2.1 η quotient = SpecialFunctionsTheta λ on `ℍ` | `τ = i, 2i, 0.3+0.8i, 1.3+0.8i, 0.5+0.3i, 1+i, (1+i)/2` | η vs `(θ₂/θ₃)⁴`: `0.5/0.5`; `0.0294373/0.0294373`; `0.7660029+0.4097863i` both; `−0.0508248−1.8402518i` both; `0.5996914−0.9163804i` both (outside F); `−1/−1`; `2/2` | True on `ℍ`; for `Im τ ≤ 0` both are junk values, which is why "on `ℍ`" is stated | Target added; Check at `0.3+0.8i` |
| Nome convention (witness) | Same-τ vs `2τ` reading | Wrong reading gives `λ(0.6+1.6i) = −0.0278242+0.1029613i ≠ 0.7660029+0.4097863i` | Pins `q = exp(πiτ)` | Check added |
| `1 − λ = (θ₄/θ₃)⁴`, quartic | `τ = 0.3+0.8i` | `0.2339971−0.4097863i` both; `θ₃⁴ − θ₂⁴ − θ₄⁴ = −3·10⁻¹⁶` | True | Imported |
| Laws `λ(τ+1)`, `λ(−1/τ)` | `τ = 0.3+0.8i` | `λ(τ+1) = −0.0508248−1.8402518i = λ/(λ−1)`; `λ(−1/τ) = 0.2339971−0.4097863i = 1−λ` | True | Imported |
| `Γ(2)`-invariance and generation | `γ = [[3, 2], [4, 3]]`; `[[1,0],[2,1]]` at `0.3+0.8i` | Columns `(3,4) → (3,−2) → (−1,−2) → (−1,0)`; `|a| = |c|` is impossible (a odd, c even); `λ(τ/(2τ+1)) = 0.7660029+0.4097863i = λ(τ)` | True | Route added in §2.1 |
| §2.2 fundamental set D and boundary | Sides of `F̄`; cycle at `±1`; index | `λ(1+i) = −1 ∈ (−∞,0)`; `λ((1+i)/2) = 2 ∈ (1,∞)`; S maps `−1+it` to `(1+it)/(1+t²)` with `|w−1/2| = 1/2`; cycle transformation `[[1,0],[2,1]]T⁻² = [[1,−2],[2,−3]]`, trace −2, parabolic; area `2π` against `π/3` gives index 6 `= |SL₂(𝔽₂)|` | True; only one side of each pair is in D | Sketch rewritten; Example added |
| §2.6 `K₀(x(τ)) = θ₃²` | `τ = 2i`; `τ₀ = (8+2i)/17`; coefficients | `1.0074837 = 1.0074837`; at `τ₀`: `1.0074837` vs `1.0074837+4.0299349i = (1+4i)θ₃(2i)²`; `(1/2)_n²/(n!)²`: `1/4 = 4/16`, `9/64 = 36/256`; recurrence `(n+1)²a_{n+1} = 4(2n+1)²a_n` is the ODE coefficientwise | True near `∞` only; a statement on `{|λ| < 1}` is false | Domain stated; Example added |
| §2.7 `λ′(i) = ic`, `c > 0` | Numerical derivative | `λ′(i) = 1.0942198i`; `4c = 4.3768792 = Γ(1/4)⁴/(4π²) = 4.3768792` | True; `λ′(i) ≠ 0` needs §2.2, now said | Sketch cites SpecialFunctionsTheta §§5.1–5.2 |
| SpecialFunctionsTheta contract: theta-constant products | `τ = 0.3+0.8i` | Products against series: `θ₂` `1.0338379+0.2550498i`, `θ₃` `1.0951546+0.1310143i`, `θ₄` `0.9047061−0.1311156i`, equal to 15 digits | True | Contract added |
| Mathlib contract `θ₂`, `θ₄` via `jacobiTheta₂` | Series identity | `Σ e^{πin τ + πin²τ}·q^{1/4} = Σ q^{(n+1/2)²}`; `Σ e^{πin} q^{n²} = Σ (−1)ⁿ q^{n²} = θ₃(τ+1)` | True | Wording added |
| §7.3 Check, n = 1 | `Δ⁻¹`, `k = −12`; `Δ`; odd k; `η²`; `η⁴` | Growth `B = 2π`; included; `F = 0`; `χ(−I) = −1` excluded; `ν_η⁴(−I) = 1` included | Corrected Check true in both directions | Reworded |
| Former-numbering table | Every `Wk.n` of `design/README.md` | 7 moved ids; W3.1–3.8 equal §§3.1–3.8 (§3.0 is new, with no former id); W7.5–7.14 and W8–W9 unchanged | Consistent | Table added |

## Checks

**Elaboration.** `lake env lean packages/ModularFormsPartII/Suggested.lean`, run from the content checkout, exits 0. All 13 warnings are `declaration uses sorry` (lines 75, 97, 145, 164, 171, 181, 195, 211, 242, 257, 285, 309, 324). There were no errors and no `lake build` was needed: the object file of `TauCeti.NumberTheory.ModularForms.QExpansion.Laurent` exists.

**Signatures.** A scratch file holding `Suggested.lean` plus `#check @…` for all 22 declarations elaborates, and all 22 types print. The file has no `variable` or `include`, so no binder can be lost. The only Lean change is the docstring of `modularLambda`. Its type is still `ℂ → ℂ`, and every type matches the elaborated signatures supplied with this job and its README statement.

**Dependency direction.**

```text
depcheck: 245 roadmaps, 2238 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. SpecialFunctionsTheta is in neither the merge order nor main, so the check does not count its edge (the total is unchanged).

**Citations.** `roadmaps resolve packages/ModularFormsPartII/README.md` lists no cross-roadmap citation and no Lean name found nowhere. Lean names outside TauCetiRoadmap were not checked by the tool. I checked the new one by hand: `TauCeti.tprod_one_add_pow_mul_tprod_one_sub_pow_odd` is at `TauCeti/Analysis/SpecialFunctions/QPochhammer.lean:230` at the pin.

**Ownership.** `roadmaps grep` was run over main and the open heads for the modular λ function, `modularLambda`, `(θ₂/θ₃)⁴`, `λ = k²`, `λ(−1/τ)` and the η-quotient. The only other owner of λ is SpecialFunctionsTheta. PeriodsAndSpecialValues uses λ only as an elliptic-integral parameter. Nobody else states the η-quotient presentation, the covering or the integral series form, so they stay here.

## For the maintainer

- **New supplier.** SpecialFunctionsTheta is another author's open pull request adding a new roadmap. It is not in `merge-order/ORDER.txt`. It must merge before ModularFormsPartII, or, if it is closed, the λ statements return to §2.1. The review's human-reviewer section asks who owns λ. This repair applies the rule that existing work is imported. Main's ConformalMapping and BelyiMaps assign only the covering `ℍ/Γ(2) ≅ ℂ ∖ {0, 1}` to the ModularForms family, and that stays here.
- **Suppliers no longer used.** ConformalMapping L4 is no longer a supplier. GeometryOfNumbersAndQuadraticArithmetic §4.3 is no longer used by Layer 2, but is kept for §8.3.
- **Names and ids.** No Lean name changed and no section id was dropped. The new table maps the `Wk.n` ids that NoncongruenceModularForms (main) cites. Its "W6.3–W6.5" now resolves to §§6.3, 6.4 and 6.6.
