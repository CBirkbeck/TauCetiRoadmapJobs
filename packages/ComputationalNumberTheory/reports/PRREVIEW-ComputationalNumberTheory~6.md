# Review of ComputationalNumberTheory (pull request #1408 at be60f36)

**Verdict:** accepted

Incremental re-review of the 72 changed lines since `12bae67`, the head the previous review read. The change set is exactly the repair of that review's five findings: a real-bodied `Fact (Nat.Prime 107)` instance replaces the concrete instance binder of `weight82_companion_system`; the ExplicitPrimeCounting scope bullet, contract subsection and Lean comment are deleted; the two Tau Ceti names in the contract and in §2.20 are those at the pin `2fd255d9`; the two declared pins and nine Mathlib line locators are those of the branch manifest; three sentences of de-backticked identifiers are prose. Every repair is verified below against the files, the pins and the sources, none introduced a new problem, the gate passes at this head, and the 64 declarations elaborate with `sorry` as the only warning. No finding remains.

## Previous findings

- R01 — repaired: `Suggested.lean:386` `instance instFactPrime107 : Fact (Nat.Prime 107) := ⟨by norm_num⟩`; `theorem weight82_companion_system (T : IntegralHeckeAction 82) (f : integralCuspLattice 26) …` at 392 has no instance binder. Worker's gate at this head: `build=0`; my elaboration: 27 `sorry` warnings, nothing else.
- R02 — repaired: a search of `README.md`, `Suggested.lean` and `metadata.toml` for `ExplicitPrimeCounting`, `6.2a` and `criticalLineUpTo` returns nothing; the Lean comment at 568–572 now ends at `LFunction_ne_zero_of_platt`; no `*Needs:*` line consumed the deleted statement.
- R03 — repaired: `README.md:274–281` cites `TauCeti.algebraicExtensionValuativeRel` and `TauCeti.algebraicExtension_valuativeExtension` (`AlgebraicExtension.Basic`, "under the hypothesis `[Algebra.IsAlgebraic K M]`") and keeps `TauCeti.finiteExtension_isNonarchimedeanLocalField` (`FiniteExtension.Basic`); the §2.20 `*Needs:*` line (1384) names `TauCeti.algebraicExtension_valuativeExtension`; the "revisions from `2fd255d9` on" clause is gone.
- R04 — repaired: `README.md:179` pins Mathlib `1b1ccf4b…`, `:256` Tau Ceti `2fd255d9…`, equal to `lake-manifest.json`; the nine line numbers (873–883, 655, 66, 51, 197, 65 and 151, 115, 266) are verified at the pin below.
- R05 — repaired: `README.md:1418–1419` "Its specialization to `ℤ_[p]` is the same statement with `π = p` and modulus `4p`; the Checks below are its instances at 17 and 5 in ℚ₂ and at 6 in ℚ₅"; `:1852` "The quotient-generating variant assumes only g_i ∈ G …"; `:2402` "For normalized Δ, prove `1/2 < Re L(Delta,12) < 3/2` and `Im L(Delta,12)=0`."

## Verified sound

**Coverage.** Read in full: `changes.md` (the 72-line diff, no file changed outside the folder), the previous report, `gate.md`, `pull-request.md`, `overlaps.md`, `citations.md`, `signatures.md`, `metadata.toml`; the changed passages of `README.md` with their context (scope bullets 108–125, the Tau Ceti contract 256–292, the ExplicitZetaBounds contract 387–399, §2.20 1380–1384, §2.22 1403–1426, §3.14 1685–1712, §3.23 1846–1860, §4.21 Checks 2394–2410, §4.21a 2413–2432) and of `Suggested.lean` (376–405, 556–575). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ComputationalNumberTheory'` is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml` only.

**Principles.** The repairs add one real-bodied instance on a native carrier (a "simple definition a headline needs": `ResidualCuspSpace 107 82` is `AlgebraicClosure (ZMod 107) ⊗[ℤ] integralCuspLattice 82` and needs `Fact (Nat.Prime 107)` for `ZMod 107` to be a field), no sorry'd data, no `set_option`, no new import, no new supplier, no algorithm, no copied passage. The deleted ExplicitPrimeCounting citation removes a supplier edge rather than adding one. The declared gap `gap:local-two-quotient` is untouched by the diff.

**Gate, dependency check, elaboration.** Worker's gate at `be60f36`: every scanner 0, `depcheck=0`, `build=0`, OK. Dependency check rerun on this head with the brief's moved merge order:

```text
depcheck: 238 roadmaps, 2349 edges, 0 problem(s)
```

No UPWARD or CYCLE line. (My plain rerun of the full gate without `--order` prints `UPWARD: ComputationalNumberTheory (#264) -> ExplicitNumberFields (#270)` and `-> ExplicitZetaBounds (#265)`: that is the repository order before the worker moves this roadmap to position 271, after ExplicitNumberFields, as the moved order of this brief already does; the two suppliers were named at the head the previous review read, so the brief's `moved:` clause applies and the worker's gate on the moved order is the authoritative one. It is not a finding.) Elaboration of a scratch copy of `Suggested.lean` with `#check @name` appended for all 64 declarations, `lake env lean` at the branch pins: exit 0, 27 `declaration uses sorry` warnings, 0 errors, 64 `#check` outputs. The changed declaration's elaborated type is

```lean
weight82_companion_system : ∀ (T : IntegralHeckeAction 82) (f : ↥(integralCuspLattice 26)),
  (PowerSeries.coeff 1) (qExpansion 1 ⇑↑f) = 1 →
    ∃ a, (∀ (n : ℕ), (PowerSeries.coeff n) (qExpansion 1 ⇑↑f) = ↑(a n)) ∧
      ∃ v, v ≠ 0 ∧ ∀ (l : ℕ), Nat.Prime l → l ≠ 107 → (residualHecke T l) v = (↑l ^ 81 * ↑(a l)) • v
instFactPrime107 : Fact (Nat.Prime 107)
```

which is §3.14's statement (any integral weight-26 form with first coefficient one; one nonzero residual vector; eigenvalue `ℓ⁸¹ a_ℓ` for every prime `ℓ ≠ 107`); the instance is found by unification, so no binder is lost. The other 63 types are unchanged from the previous report's comparison (`signatures.md` agrees). One-tactic probe on `weight82_companion_system` (`first | rfl | (simp; done) | infer_instance | decide` on a scratch copy): error, so it is not padding; the 26 other sorried theorems were probed in the previous round and are untouched.

**Pinned names and locators (R03, R04).** At Tau Ceti `2fd255d9`: `NumberTheory/LocalField/AlgebraicExtension/Basic.lean:72` `variable (M : Type*) [Field M] [Algebra K M] [Algebra.IsAlgebraic K M]`, `:130` `def algebraicExtensionValuativeRel : ValuativeRel M`, `:147` `theorem algebraicExtension_valuativeExtension`; `NumberTheory/LocalField/FiniteExtension/Basic.lean:40` `[Module.Finite K M]`, `:54` `theorem finiteExtension_isNonarchimedeanLocalField : @IsNonarchimedeanLocalField M _ (algebraicExtensionValuativeRel K M) (algebraicExtensionNormedFieldTopology K M)`, so the finite-extension local-field structure is indeed built on the algebraic-extension valuative relation, as the contract and §2.20 now say; `finiteExtension_valuativeExtension` and `finiteExtensionValuativeRel` occur nowhere in the pinned tree. At Mathlib `1b1ccf4b`: `Algebra/Algebra/Operations.lean` 873 `mem_div_iff_forall_mul_mem`, 876 `mem_div_iff_smul_subset`, 883 `le_div_iff_mul_le`; `LinearAlgebra/TensorProduct/Tower.lean:655 def baseChange`; `LinearAlgebra/TensorProduct/Basis.lean:66 def baseChange`; `RingTheory/Polynomial/Pochhammer.lean:51 ascPochhammer`; `NumberTheory/Bernoulli.lean:197 def bernoulli`; `NumberTheory/ModularForms/LFunction.lean:65 weakFEPair`, `:151 def L`; `NumberTheory/ModularForms/Discriminant.lean:115 discriminant_eq_q_prod`; `NumberTheory/LSeries/DirichletContinuation.lean:266 LFunction_eq_completed_div_gammaFactor`; `FieldTheory/AlgebraicClosure.lean` 39 and 54 unchanged. All nine locators are exact.

**Seeded sample.** Of this round's fifteen targets, two fall in changed passages and were checked at their locators; the other thirteen are untouched text that the previous review passed.
- **2.20** GMN (printed = cache page; the marker `=== page 15 ===` is at line 717): Theorem 1.19 (theorem of the residual polynomial) at line 684 and Corollary 1.20 at line 713, both on printed p.14, the corollary's proof on p.15, as cited "pp.14–15". Corollary 1.20: when the residual factor `ψ_i` has exponent `a_i = 1`, `G_i` is irreducible in `O[x]`, `f(L/K) = m·deg ψ_i` with `m = deg φ`, and `e(L/K) = e`. The target's hypotheses (single finite side, `f mod p = φ̄^n`, irreducible residual polynomial) give `t = 1`, `a_1 = 1`, `G_1 = f`, so its conclusions (irreducible over `ℚ_p`, ramification index `e`, residue degree `deg φ · deg R`) are the corollary's. The `*Needs:*` line names the two Tau Ceti declarations that exist at the pin.
- **2.22** MilneANT: Theorem 7.32 (Newton's lemma) at line 5320 on printed p.120 (the next marker, line 5328, carries the running head "Newton's lemma 121"), hypothesis `|f(a₀)| < |f′(a₀)|²`; for `f = X² − u`, `a₀ = w` a unit with `u ≡ w² (mod 4π)`: `|w² − u| ≤ |4π| < |4| = |2w|²`, as the proof sketch says. Recomputed Checks: `17 ≡ 1 (mod 8)` square in `ℚ₂`, `5 ≢ 1 (mod 8)` not although `5 ≡ 1 (mod 4)`; `6 ≡ 1 (mod 5)` square in `ℚ₅`; in `ℚ₂(√2)`, `(1 + π)² = 1 + 2π + π² = 3 + 2π`. The new sentence's "modulus `4p`" is `4π` at `π = p`.

**Adversarial pass.** Rows for the changed statements are computed here; the rest carry forward from the previous report (`PRREVIEW-ComputationalNumberTheory~5`), whose values I re-read and which the diff leaves untouched.

| Statement | Instances and values | Result |
| --- | --- | --- |
| 3.14 `weight82_companion_system` with the global instance | `Nat.Prime 107` by `norm_num` (107 = 100 + 7, not divisible by 2, 3, 5, 7; `11² = 121 > 107`); `ZMod 107` a field, `AlgebraicClosure (ZMod 107)` exists; eigenvalues `ℓ = 2`: `a₂ = −48 ≡ 59`, `2⁸¹ ≡ 45`, `59·45 = 2655 = 24·107 + 87`, so 87; `ℓ = 3`: `a₃ ≡ 6`, `3⁸¹ ≡ 53`, `6·53 = 318 = 2·107 + 104`, so 104; opposite exponent 25: `2²⁵ ≡ 88`, `59·88 = 5192 = 48·107 + 56`, so 56; `3²⁵ ≡ 105`, `6·105 = 630 = 5·107 + 95`, so 95, as the README states | Statement, instance and both witnesses correct; no binder lost |
| 2.20 `*Needs:*` with `algebraicExtension_valuativeExtension` | `p = 3`, `φ = X`, `f = X² − 3`: side `(0,1)–(2,0)`, `e = 2`, `h = 1`, `d = 1`, residual `Y − 1` irreducible, `ℚ₃(√3)`: `e = 2`, `f = deg φ · deg R = 1`, `e·f = 2 = [L:K]`; `(X − 3)²`: residual `(Y − 1)²`, exponent 2, excluded | Matches Cor 1.20 |
| 2.22 specialization sentence | `π = p`: `4π O = 4p ℤ_p`; `p = 2`: `8ℤ₂`, unit squares mod 8 = `{1}`; odd `p`: `4p ℤ_p = p ℤ_p`, residue a square | Correct |
| 3.23 quotient-generating variant (prose only) | `A = ℤ/3`, `p = 2`, `G = A`, empty list: `G/2G = 0`, variant gives saturation; `A = ℤ/2`, `G = 0`: `A[2] ⊄ G`, fails; `m = 0` in the Lean: `hgen` forces `G = pG` (previous report) | Unchanged mathematics |
| 4.21 Check `1/2 < Re L(Δ,12) < 3/2`, `Im = 0` | Mathlib `L hk f s = Σ aₙ n^{−s}` for `h = 1` (`LFunction.lean` docstring at the pin); partial sums with `τ(1..6) = 1, −24, 252, −1472, 4830, −6048`: `1 − 0.005859 + 0.000474 − 0.0000877 + 0.0000198 − 0.0000028 ≈ 0.99454`; tail `< Σ_{n ≥ 7} 1000 n⁶ · n^{−12} < 1000 · 6⁻⁵/5 ≈ 0.026` under the stated `|τ(n)| ≤ 1000 n⁶`; real coefficients give `Im = 0` | Bounds hold |
| 4.21a locator (line 266) | `LFunction_eq_completed_div_gammaFactor (χ) (s) …` at `DirichletContinuation.lean:266` at the pin, comparing `LFunction` with `completedLFunction / gammaFactor` | Locator exact |
| Tau Ceti contract | finite `M/K`: `[Module.Finite K M]` implies `[Algebra.IsAlgebraic K M]` (Mathlib `Algebra.IsAlgebraic.of_finite`), so the algebraic-extension declarations apply; `finiteExtension_isNonarchimedeanLocalField` is stated on `algebraicExtensionValuativeRel K M` | Contract matches the pin |
| 0.15, 1.1–1.5, 1.7–1.10, 1.11–1.14, 1.16, 1.26, 2.2–2.6, 2.16–2.20, 2.23, 3.1–3.4, 3.6–3.10, 3.13, 3.16, 3.17, 3.18–3.20, 3.23–3.26, 4.1–4.9, 4.11–4.13, 4.14–4.17a, 4.19a, 4.20a, 4.25–4.34, ExplicitZetaBounds and ExplicitNumberFields contracts, 4.21a counts | Carried forward from `PRREVIEW-ComputationalNumberTheory~5`, rows with the same labels (values there: liar sets `{1,8}`, `{1,14}`, `{1,7,18,24}`; `aksParameter 9 = 3`; `T₇₉` determinant `≡ 0 (mod 79)`; `H(1) = 10⁸ ≤ 545 439 823`; Euler–Maclaurin `ζ(0) = −1/2`, `C₁ = 13/6`; Gram value `−34`; etc.) | Untouched by the diff |

**Remarks on untouched text (no change requested).** The Summary's headline list (§§0.15–4.20a) still matches the 27 sorried theorems.

**Cross-roadmap citations in changed passages.** The diff adds none; it deletes the ExplicitPrimeCounting citation. The remaining supplier set (AlgebraicModularFormsAndSerreWeights, EffectiveDiophantineMethods, EllipticLegendreCharacterInterfaces, HeightsRationalPointsAndObstructions, ExplicitZetaBounds, ExplicitNumberFields, and the main-branch roadmaps) is the one the previous report resolved. `overlaps.md` repeats the two PolynomialGaloisGroups Layer 5 leads (#763, #986), which the previous report found to be false positives (the citation targets `Completed/PolynomialGaloisGroups`, byte-identical at both heads); no open pull request changes this roadmap. The three `citations.md` Lean-name leads (`index_relationLattice`, `IsSmithDecomposition`, `validList`) are a ClassicalArithmeticCompletion name, a ClassicalArithmeticCompletion name and this file's own `PrattTree.validList` (`Suggested.lean:93`), as before.

## Not verifiable

- The thirteen seeded targets outside the changed passages (0.8, 0.16, 1.4, 1.10, 1.22, 2.9, 3.4, 3.6, 3.10, 4.8, 4.17a, 4.19a, 4.30) were not re-opened at their locators this round; the previous full review's table covers 1.1–1.5, 1.7–1.10, 3.1–3.10, 4.14–4.17a, 4.19a and 4.25–4.34 with computed values and its sample opened 1.14, 3.2, 3.3, 3.5, 3.10, 4.18 and 4.30 at the text.
- Ownership against open pull requests was not re-searched: the diff states no new object.

## Source issues

- none
