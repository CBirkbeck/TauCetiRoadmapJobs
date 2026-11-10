# Review of ZerosOfLFunctions (pull request #1913 at 6355596)

**Verdict:** needs changes

:robot: AI-assisted review (Claude Opus 5.5). This is an incremental re-review of the 130 lines that changed in `TauCetiRoadmap/ZerosOfLFunctions/` since `5cfa90f`: the scope bullets, README 8.4, the module docstring and the new theorem `dedekindZeta_weilExplicitFormula`. All three previous findings are repaired. The new docstring introduces one blocking finding, and the change leaves one contract gap. The gate passes.

## R01 (P2) — The Weil formula for a nontrivial Hecke character can be stated at the pins, but the docstring says it cannot

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` lines 57–61, in the module docstring's "Not stated here" list: "the Weil formula of 8.6 for a nontrivial character: its archimedean term is the logarithmic derivative of the gamma factor of the L-functions roadmap's Hecke record `heckeData χ` (Layer 5), whose gamma shifts are not at the pins".

**Claim.** The docstring treats this formula as a headline that cannot be stated, and the reason it gives is false at the pin.

- `heckeData` (LFunctions `Suggested.lean` line 1632 on main) takes its real gamma shifts from `(HeckeCharacter.ofRayClassCharacter χ.conductor χ.character).infinityType.realParity`. Both of these declarations are in Tau Ceti.
- Tau Ceti also proves that the shift is `1` exactly at the real places of the conductor.

So the gamma factor `Γℝ(s+1)^{#𝔣_∞} Γℝ(s)^{r₁−#𝔣_∞} Γℂ(s)^{r₂}` can be written directly from `ψ.conductor.infinitePart`, just as `riemannVonMangoldt_heckeLFunction` already uses `ψ.conductor.finitePart`.

README 8.6 states this formula ("8.2–8.4 hold with …"). Nothing in the roadmap uses it: 8.7 uses the truncated 8.3 instance. This is the same situation that the previous R01 repaired for the trivial character. A headline that can be stated at the pins and is missing is P2.

**Witness.** The pinned Tau Ceti declarations:

- `TauCeti.GlobalNumberFields.HeckeCharacter.mem_conductor_infinitePart_iff` (`NumberTheory/NumberField/Global/HeckeCharacter/RealParity.lean:79`): `w ∈ conductor.infinitePart ↔ realParity w = 1`;
- `HeckeCharacter.ofRayClassCharacter` (`HeckeCharacter/Basic.lean:98`);
- `Modulus.infinitePart` (`RayClass/Modulus.lean:104`).

The statement below elaborates with only the `sorry` warning.

**Repair.** Add this theorem after `dedekindZeta_weilExplicitFormula`. I elaborated it in a scratch module whose imports are already in the file, so it needs no new import.

```lean
/-- **Layer 8.6, the Weil explicit formula for a nontrivial primitive ray-class character.** For
`ψ ≠ 1` of conductor `𝔣` and `φ` as in 8.4, with `m_ρ` the multiplicity of `ρ` as a zero of
`L(ψ, s)` in `0 < Re ρ < 1`, the family `ρ ↦ m_ρ φ̃(ρ)` is summable and
`∑_ρ m_ρ φ̃(ρ) = log(|d_K| 𝔑𝔣) φ(1) + A_ψ(φ) − ∑_𝔞 Λ_K(𝔞)(ψ(𝔞) φ(𝔑𝔞) + conj ψ(𝔞) φ(1/𝔑𝔞)/𝔑𝔞)`,
where `A_ψ` is the archimedean term of 8.4 for `γ_ψ = Γℝ(s+1)^{#𝔣_∞} Γℝ(s)^{r₁−#𝔣_∞} Γℂ(s)^{r₂}`;
the gamma shift is `1` exactly at the real places of `𝔣`. -/
theorem heckeLFunction_weilExplicitFormula (K : Type*) [Field K] [NumberField K]
    (ψ : TauCeti.LFunctions.PrimitiveRayClassCharacter K) (hψ : ψ ≠ 1) (φ : ℝ → ℂ)
    (hφ : ContDiff ℝ ∞ φ) (hsupp : HasCompactSupport φ) (hpos : tsupport φ ⊆ Ioi 0) :
    Summable (fun ρ : ℂ ↦ (Ioo (0 : ℝ) 1 ×ℂ univ).indicator (fun ρ ↦
        ((MeromorphicOn.divisor (TauCeti.LFunctions.heckeLFunctionC ψ.character) univ ρ).toNat :
          ℂ) * mellin φ ρ) ρ) ∧
      ∑' ρ : ℂ, (Ioo (0 : ℝ) 1 ×ℂ univ).indicator (fun ρ ↦
        ((MeromorphicOn.divisor (TauCeti.LFunctions.heckeLFunctionC ψ.character) univ ρ).toNat :
          ℂ) * mellin φ ρ) ρ =
        (Real.log (|(NumberField.discr K : ℝ)| *
            (Ideal.absNorm ψ.conductor.finitePart : ℝ)) : ℂ) * φ 1 +
          (2 * π : ℂ)⁻¹ * (∫ t : ℝ,
            ((ψ.conductor.infinitePart.card : ℂ) * logDeriv Gammaℝ (3 + t * I) +
              ((NumberField.InfinitePlace.nrRealPlaces K - ψ.conductor.infinitePart.card : ℕ) :
                ℂ) * logDeriv Gammaℝ (2 + t * I) +
              (NumberField.InfinitePlace.nrComplexPlaces K : ℂ) * logDeriv Gammaℂ (2 + t * I)) *
            (mellin φ (2 + t * I) + mellin φ (1 - (2 + t * I)))) -
          ∑' 𝔞 : (Ideal (NumberField.RingOfIntegers K))⁰,
            TauCeti.IdealArithmeticFunction.vonMangoldt (K := K) 𝔞 *
              (ψ.character.toMultiplicativeIdealWeight (𝔞 : Ideal (NumberField.RingOfIntegers K)) *
                  φ (Ideal.absNorm (𝔞 : Ideal (NumberField.RingOfIntegers K))) +
                (starRingEnd ℂ) (ψ.character.toMultiplicativeIdealWeight
                    (𝔞 : Ideal (NumberField.RingOfIntegers K))) *
                  φ ((Ideal.absNorm (𝔞 : Ideal (NumberField.RingOfIntegers K)) : ℝ))⁻¹ /
                    (Ideal.absNorm (𝔞 : Ideal (NumberField.RingOfIntegers K)) : ℂ)) :=
  sorry
```

I re-derived the statement:

- `Λ(ψ, s) = (|d_K|𝔑𝔣)^{s/2} γ_ψ(s) L(ψ, s)` is entire for `ψ ≠ 1`, and `Λ(ψ, s) = W Λ(ψ̄, 1 − s)`. So `Λ'/Λ(ψ, s) = −Λ'/Λ(ψ̄, 1 − s)`.
- `ψ̄` has the same conductor and the same shifts.
- Shifting the line `Re s = 2` to `Re s = −1` and reflecting gives `∑ m_ρ φ̃(ρ) = (2πi)⁻¹ ∫_{(2)} (Λ'/Λ(ψ, s) φ̃(s) + Λ'/Λ(ψ̄, s) φ̃(1 − s)) ds`. There are no pole terms.
- On the open strip, `γ_ψ` has neither zeros nor poles: those of `Γℝ(s + 1)` lie at `s = −1, −3, …`. All zeros of `Λ(ψ, ·)` lie in the open strip by the Euler product, the functional equation and 6.5.
- `r₁ − #𝔣_∞` never truncates, because `infinitePart` is a finset of real places.

Instances are in the adversarial table below.

Then make these changes:

- In the docstring, delete the "Not stated here" bullet and add "the Weil formula for a nontrivial primitive ray-class character (8.6)" to the Layer 8 item of "Stated here".
- In README 8.6, add one sentence saying that for nontrivial `ψ` the Weil formula is `heckeLFunction_weilExplicitFormula`, and that `a_j = 1` exactly at the real places of `𝔣` (Tau Ceti `TauCeti.GlobalNumberFields.HeckeCharacter.mem_conductor_infinitePart_iff`).
- Add that declaration and `TauCeti.GlobalNumberFields.Modulus` (field `infinitePart`) to the *Needs:* line of 8.6 and to "From Tau Ceti". `toMultiplicativeIdealWeight` is already contracted there "for 6.1 and 8.6".

The name `heckeLFunction_weilExplicitFormula` occurs in no roadmap on main and in no open pull request.

## R02 (P3) — The Mathlib contract omits three declarations that the new 8.4 statement uses

**Location.** `README.md` lines 2197–2198, the *Needs:* line of 8.4: "Mathlib `mellin`, `mellinInv_mellin_eq`, `NumberField.discr`, `NumberField.InfinitePlace.nrRealPlaces`, `NumberField.InfinitePlace.nrComplexPlaces`". The subsection "From Mathlib" of `## Exact supplier contracts` (lines 188–244) names none of the last three.

**Claim.** The contract section lists, by name, every declaration the roadmap consumes from each supplier. It lists `mellin`, `mellinInv_mellin_eq`, `Chebyshev.psi` and `ArithmeticFunction.vonMangoldt`. The change makes `dedekindZeta_weilExplicitFormula` consume `nrRealPlaces` and `nrComplexPlaces` for the first time. `NumberField.discr` also appears in the statements of 6.4 and 7.5, and the contract does not record it either.

**Witness.** Searching `README.md` lines 186–244 for `discr` or `InfinitePlace` finds nothing. `Suggested.lean` uses `NumberField.discr` at lines 168, 248 and 308, and the two place counts at lines 310–311.

**Repair.** Add to "From Mathlib": "- `NumberField.discr`, `NumberField.InfinitePlace.nrRealPlaces`, `NumberField.InfinitePlace.nrComplexPlaces` (the discriminant `d_K` and the numbers `r₁`, `r₂` of real and complex places, for 6.4, 7.5 and 8.4);".

## Previous findings

- R01 — repaired: `Suggested.lean:298` declares `dedekindZeta_weilExplicitFormula`. Ignoring whitespace, it is identical to the proposed text. README 8.4 (line 2185) states it for every `K`, with `riemannZeta_weilExplicitFormula` as its `K = ℚ` instance. The docstring lists 8.4 under "Stated here".
- R02 — repaired: the description's merge-order block now reads "`ZerosOfLFunctions`: **this pull request** → #1907", and says that each later pull request is rebased onto the earlier ones. The README stays free of pull-request numbers.
- R03 — repaired: the scope (lines 92–122) names an owner for each item. These are ImaginaryQuadraticClassNumber H2.4; AnalyticNumberTheoryPartI §§0.1, 0.6, 0.9, 0.15, 0.18, 0.23, 0.32, 0.34, 2.18a, 2.31e, 2.39 and 2.49; and SpecialFunctionsEiLiErfIncompleteGamma §8.4. §0.34 is named only for "the conductor-uniform bound for `1 − β`", which is what it states.

## Verified sound

**Gate.** I re-ran the gate at `6355596`. Every counter is 0 and the result is OK. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`, and nothing outside the folder changes.

**Dependency check.** Output: `depcheck: 236 roadmaps, 2270 edges, 0 problem(s)`. No UPWARD or CYCLE line. The new scope mentions name roadmaps on main as owners of deferred items. They are not supplier edges. AnalyticNumberTheoryPartI (merge order 50) and SpecialFunctionsEiLiErfIncompleteGamma both consume this roadmap.

**Elaboration.** `lake env lean` on `Suggested.lean` gives 18 `sorry` warnings and nothing else. The new import `TauCeti.NumberTheory.ArithmeticDirichletSeries.VonMangoldt` is used, by `IdealArithmeticFunction.vonMangoldt`. The elaborated type of `dedekindZeta_weilExplicitFormula` matches README 8.4:

- `ContDiff ℝ (↑⊤)`, that is `∞` and not `ω`;
- the `Ioo 0 1 ×ℂ univ` indicator;
- `(nonZeroDivisors (Ideal (𝓞 K)))` for the nonzero ideals;
- `φ (↑N)⁻¹ / ↑N` parses as `φ(1/N)/N`.

The file still has no `variable` block, so no binder can be lost.

**Padding probe.** I replaced the new theorem's `sorry` by `first | simp | rfl | norm_num | infer_instance | (constructor <;> simp)`. It fails with unsolved goals, so the theorem is not padding.

**Scope citations resolved on main (`f8836c4`).**

| Cited | Where | What it states | Matches the bullet |
| --- | --- | --- | --- |
| ImaginaryQuadraticClassNumber H2.4 | README line 73 | ineffective `L(1,χ) ≥ c_ε q^{−ε}` for primitive real `χ` | yes |
| AnalyticNumberTheoryPartI §0.34 | line 883 | `(1−β) log q ≥ c_LS` for primitive real `χ` | yes ("states") |
| §0.9 | line 288 | effective `L(1,χ) ≥ c/log q` | yes |
| §0.1 | line 167 | exceptional predicate empty at width `c_LS` | yes (6.3–6.4 over ℚ) |
| §0.18 | line 578 | character `ψ` estimate with no exceptional term | yes (8.6 over ℚ) |
| §0.32 | line 849 | effective Siegel–Walfisz | yes (8.7–8.8 over ℚ) |
| §2.39 | line 1997 | Heilbronn: Galois `K`, simple real zero, quadratic subfield | yes |
| §2.31e | line 1887 | proof uses Stark Lemma 8 without normality | yes |
| §0.6 | line 247 | bounded-height Landau–Page, exception-free | yes |
| §0.15, §0.23 | lines 530, 644 | `E_p` and their products; finite-order Hadamard | yes |
| §2.18a, §2.49 | lines 1676, 2166 | Artin L-functions with Brauer continuation; effective Chebotarev for Galois `L/F` | yes |
| SpecialFunctionsEiLiErfIncompleteGamma §8.4 | line 1053 | DLMF 6.12.2 and "the expansion of `li(x)` follows"; consumes 1.2–1.3 here (lines 347–352) | yes |

AnalyticNumberTheoryPartI line 90 cites "ZerosOfLFunctions 8.2–8.8" as a supplier, which supports "built on Layers 6 and 8 here". README 8.9 (line 2548) is the two-term case `Li x − x/log x ∼ x/log² x`, as the new scope bullet says. The mathematics of the Heilbronn bullet holds: `ζ_F = ζ · L(χ_F)` and `ζ` has no zero in `(0, 1)`, so `ζ_F(β) = 0` exactly when `L(β, χ_F) = 0`.

**Library declarations opened at the pins.**

| Declaration | File:line (Tau Ceti) | What I checked |
| --- | --- | --- |
| `heckeLFunctionC` | `NumberTheory/LFunctions/Hecke/Basic.lean:74` | canonical continuation; `MeromorphicNFOn univ` (line 84), so its divisor is not the junk value |
| `PrimitiveRayClassCharacter`, `conductor_one`, `character_one` | `Hecke/Primitive.lean:91, 179, 183` | the trivial character has conductor one and character `1`, so its `heckeLFunctionC` is `ζ_K` |
| `IdealArithmeticFunction.vonMangoldt` | `ArithmeticDirichletSeries/VonMangoldt.lean:82` | value `log N(P)` on `P^k`, not `log p` |
| `Modulus` (`infinitePart`) and `Dvd` | `RayClass/Modulus.lean:98–104, 124` | infinite part is a finset of real places; divisibility is componentwise |
| `RayClassCharacter.toMultiplicativeIdealWeight` | `RayClass/Character/Weight.lean:42` | `0` off the ideals prime to the modulus |
| `HeckeCharacter.mem_conductor_infinitePart_iff`, `ofRayClassCharacter`, `ContinuousInfinityType.realParity` | `HeckeCharacter/RealParity.lean:79`, `HeckeCharacter/Basic.lean:98`, `InfinityType/Basic.lean:51` | R01 |

**Overlaps.** No id this roadmap cites is dropped by an open pull request, and this pull request drops no id that other roadmaps cite. The only other open pull request that changes this roadmap is #1907; the description orders this pull request first. `dedekindZeta_weilExplicitFormula` does not occur in #1907, nor in any other roadmap. ExplicitPrimeCounting cites §8.4 through `riemannZeta_weilExplicitFormula`, which is kept.

**Adversarial table.** New rows for the changed statements come first, with values I computed this round. The rows marked (r39) carry forward the previous report for statements this diff leaves untouched.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `dedekindZeta_weilExplicitFormula` / README 8.4 for every `K` | contour shift redone; `K = ℚ`; Gaussian test `φ(y) = exp(−log² y)`, `φ̃(s) = √π e^{s²/4}`; `φ` supported in `(1.5, 2.5)` with `φ(2) = 1` | shift gives `∑ m_ρ φ̃(ρ) = φ̃(0) + φ̃(1) + (2πi)⁻¹∫_{(2)} Λ'/Λ (φ̃(s) + φ̃(1−s))`; at ℚ, `log\|d\| = 0`, `r₁ = 1`, `r₂ = 0`, so it reduces to the ℚ form; `(2π)⁻¹∫ φ̃(2+it) dt = 1.0000000` and `(2π)⁻¹∫ φ̃(−1−it) dt = 1.0000000`, both `= φ(1)`; the Mellin transform of `φ(1/y)/y` at `0.3+0.7i` is `1.719524 − 0.429920i`, equal to `φ̃(0.7−0.7i)`; prime side `−log 2 = −0.69315` over ℚ and over ℚ(i) (ideal `(1+i)`), `0` over ℚ(√5) (2 inert, norm 4) | sound | none |
| open-strip reading of `m_ρ` (README 8.4, docstring) | ℚ(√5) at `0`; `it`, `t ≠ 0`; `s = 1` | `ord₀ ζ_K = r₁+r₂−1 = 1`, `ord₀ Λ_K = 1 − 2 = −1`; `ζ_K(it) ≠ 0`, since `Λ_K(it) = Λ_K(1−it) ≠ 0` and `Γℝ(it)² ∉ {0, ∞}`; pole, so `toNat = 0` | sound | none |
| Check ℚ(i) | `\|d\| = 4` | `log 4 = 1.386294`, half `0.693147`; `r₁ = 0`, `r₂ = 1` | sound | none |
| Check ℚ(√5) | closed strip against open strip | closed strip adds `1 · φ̃(0)`, with `φ̃(0) = ∫ φ(y)/y dy > 0` for `φ ≥ 0`, `φ ≠ 0` | sound | none |
| Docstring: the 8.6 Weil formula is not statable because the gamma shifts are not at the pins | Tau Ceti `realParity`, `mem_conductor_infinitePart_iff` | statement elaborates (sorry only) | false | R01 |
| Proposed `heckeLFunction_weilExplicitFormula` | `K = ℚ`, `χ₋₄`; quartic `χ` mod 5 with `φ` supported in `(0.4, 0.6)`, `φ(1/2) = 1`; `ψ = 1`; `r₁ − #𝔣_∞` | shifts `{1}`, term `log 4 · φ(1) = 1.3863 φ(1)`, the odd Dirichlet factor `Γℝ(s+1)`; `χ(−1) = χ(2)² = −1`, so odd; prime sum `−(i log 2)/2`, contribution `+0.346574i`; for `ψ = 1` the RHS would lack `φ̃(0)+φ̃(1)`, hence `hψ`; no ℕ truncation | true | R01 repair |
| Docstring: 8.5 is assembled from 8.3, and 8.7 from 8.6 | *Needs:* lines | 8.5 needs `8.3, 6.2, 6.3, 4.5`; 8.7 needs `8.5, 8.6, …` | sound | none |
| 1.2 Stirling on `S_δ` (r39) | crossings of `Im logGamma = π` | 3.142, 3.141, 3.1414 | sound | none |
| 1.3 vertical strips (r39) | `σ ∈ [a,b]` | error `O(1/\|t\|)` | sound | none |
| 1.3a `‖Γ(s)‖ ≤ Γ(Re s)` (r39) | `Re s = ½, 3/2, 3, −½` | `π/cosh πt ≤ π`; `Γ(−½) < 0` (so `0 < Re s` is needed) | sound | none |
| 1.4a symmetric `ζ'/ζ` (r39) | `s = ±2` | 1.41509 on both sides; −0.16482 against 0.55412 (so `ζ(s) ≠ 0` is needed) | sound | none |
| 2.1–2.4 conductors (r39) | `ζ`; `Δ` | `(8/3)(\|t\|+3)`; 90 and 15.75 | sound | none |
| 3.1, 3.4, 3.5 (r39) | `E₁(1)`; exponents; `‖Λ(2m+2i)‖` | 0.2194; `½+δ`, `¼+δ/2`, 0; 3.67680 and 13519751.81 | sound | none |
| 4.3–4.6 (r39) | Jensen; `ζ` at `T = 0, √15`; `N(100)`; Nevanlinna | 2.32; 2.19 and 1.14788; 29 against 28.13; `1.386 ≤ 1.674` | sound | none |
| 5.1, 5.2, 5.5, 5.6a (r39) | Jensen at `2r`; `E₁(−½)`; `ξ`; first zero pair | `0.0902 ≤ 0.125`; `b = −0.0230957`; 0.00996 | sound | none |
| 6.2/6.4 and 6.4(4d) (r39) | moduli 2, 6; `σ = 1.1` | 0.6934, 2.890, 3.811; 9.44104 and 13.8581 | sound | none |
| 7.5 extra-zero record (r39) | `1 + 5·2^{−s} + 2·4^{−s}` | roots at `Re s = 2.189` and `−1.189` | sound | none |
| 8.3, 8.5, 8.6, 8.7 (r39) | ℚ(√5); `x = 10⁶`; quartic mod 5; `(3)∞` | order 1; difference 99.11; `−(i log 2)/2`; `1/2` | sound | none |
| 8.9 `Li` (r39) | `x = 10, 10⁴` | 5.12044; 159.356 against 117.882 | sound | none (owner of the full expansion now named) |
| `OrderLE`, `zeroCount`, `zetaEntireCompletion` (r39) | `exp z²`, `1/Γ`; `z/(z−1)`; `s = 0, 1` | `exp(r²−r^{3/2}) → ∞`; count 1; value 1 at both points | sound | none |
| `dirichletLFunction_convexity`, `hadamard_of_orderLE_one`, `zetaEntireCompletion_hadamard` (r39) | `q = 1`; `exp`; `ρ = 0` | `ζ(½) = −1.4604`; `b = 1`; `E₁(0) = 1` | true | none |
| `heckeLFunction_zeroFreeRegion`, `riemannZeta_zeroFreeRegion`, `dirichletLFunction_zeroFreeRegion`, `neg_re_logDeriv_riemannZeta_le` (r39) | `K = ℚ`; `c ≥ 3 log 3`; cap; `t → 0` | `1 − c/log(\|t\|+3)`; reaches `−2`; `0.549 < 2.890`; `1/(4\|t\|)` | true | none |
| `riemannVonMangoldt`, `_heckeLFunction`, `_dirichlet`, `chebyshevPsi_explicitFormula` (r39) | `q = 1`; `T = 2`; `T ≤ x` | twice the one-sided count; `log²(xT) ≤ 4 log² x` | true | none |
| `primeIdealCount_effective`, `rayClassPrimeCount_effective`, `primeCounting_progression_effective`, `frobeniusPrimeCount_effective_abelian` (r39) | ℚ; `a = 2` mod 4; ℚ(i)/ℚ | `π(x)`; 1 against `Li x/2`; 1/2 | true | none |

**Remark on untouched text** (not a finding): the Summary's list of end theorems (README lines 11–15) does not name the Weil formula, which the title and `Suggested.lean` treat as a headline.

## Not verifiable

- Lang, *Algebraic Number Theory*, XVII §3, Theorem 3.1 (`lang1994`, uncertified): this is the locator of 8.4 and of the new theorem's docstring. I re-derived the formula instead (adversarial table).
- AnalyticNumberTheoryPartI §0.34 rests on its reference [109], an October 2026 release that I did not read. This roadmap names §0.34 only as the owner of a deferred item and has no *Needs:* edge to it, so nothing here depends on that source.
- The seeded sample (1.2, 1.5, 1.6, 2.2, 3.3, 3.5, 4.2, 4.6, 5.1, 5.6, 5.6a, 6.2, 7.1, 7.3, 7.4) falls entirely outside the changed passages, so no source was reopened this round. The previous report's source checks stand.
- Ownership against open pull requests was checked only for #1907, by name search for the two Weil-formula declarations, and for the closest roadmaps listed in the overlaps file.

## Source issues

- none
