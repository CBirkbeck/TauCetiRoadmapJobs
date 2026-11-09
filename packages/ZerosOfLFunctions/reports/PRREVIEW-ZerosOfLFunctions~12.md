# Review of ZerosOfLFunctions (pull request #1913 at c8a8c6b)

**Verdict:** needs changes

## R01 (P2) — Headline theorems statable at the pinned Tau Ceti are absent, and the docstring wrongly calls them not statable

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean`, lines 30–40. The two passages read:

- "Tau Ceti continues it only to a neighbourhood of `Re s ≥ 1`; and neither library has its continuation to `ℂ`, its completion, or the L-function of a Hecke character";
- "the Tau Ceti revision this file is built against supplies none of them".

**Claim.** The README Summary names these end theorems:

- the de la Vallée Poussin region for `ζ_K` and for finite-order ray-class L-functions (6.2–6.4);
- the uniform Riemann–von Mangoldt formula for both families (7.5);
- the effective ray-class prime count (8.7);
- the effective abelian Chebotarev count (8.8).

The docstring says none of them can be stated at the pins, so `Suggested.lean` states only their `K = ℚ` instances.

**Witness.** Tau Ceti `2fd255d9` declares `TauCeti.LFunctions.heckeLFunctionC` (`Hecke/Basic.lean:74`, the canonical continuation to `ℂ`), `PrimitiveRayClassCharacter`, `RayClassGroup`, `NumberField.artinSymbol` and `frobeniusPrimeCount`. The four statements below elaborate against them.

The files and lines, all under `TauCeti/NumberTheory/`:

| Declaration | File and line |
| --- | --- |
| `heckeLFunctionC` (`MeromorphicNFOn` on `univ`) | `LFunctions/Hecke/Basic.lean:74` |
| `PrimitiveRayClassCharacter` | `LFunctions/Hecke/Primitive.lean:91` |
| `RayClassGroup` | `NumberField/Global/RayClass/Basic.lean:130` |
| `NumberField.artinSymbol` | `NumberField/ArtinSymbol.lean:57` |
| `frobeniusPrimeCount` | `Chebotarev/PrimeCounting/VonMangoldt.lean:177` |

**Repair.**

1. Add the four imports and the four statements below to `Suggested.lean`.
   - Write them in the README at 6.4, 7.5, 8.7 and 8.8.
   - Put them under Layer comments.
   - The trivial character `(1 : PrimitiveRayClassCharacter K)` (conductor `Modulus.one`) is the `ζ_K` case.
   - The open strip `Ioo 0 1` is Trudgian's `0 < β < 1`, and by 6.5 it gives the same count as the completed function on the closed strip.
2. Rewrite the docstring's "Not statable" paragraph so that it names only what is still missing at the pin: the completions (`completedDedekindZeta`, `completedHeckeLFunction`, `heckeData`), and with them the exceptional-zero terms of 8.5–8.8.
3. Correct the sentence at lines 42–44. `AnalyticLFunctionData` *is* at the pin (`TauCeti/NumberTheory/LFunctions/Data/Basic.lean:82`). The Layer 0–2, 4, 7.1–7.3 and 9 statements are omitted because they are lemmas, not because their carrier is missing.

**Test.** A scratch copy with these lines after `import Mathlib`, run with `lake env lean`, exits 0 with exactly four "declaration uses `sorry`" warnings.

```lean
import TauCeti.NumberTheory.LFunctions.Hecke.Basic
import TauCeti.NumberTheory.Chebotarev.PrimeCounting.VonMangoldt
import TauCeti.NumberTheory.NumberField.Global.RayClass.Finite
import TauCeti.Analysis.SpecialFunctions.LogIntegral
open Filter Asymptotics Set Complex TauCeti TauCeti.GlobalNumberFields TauCeti.LFunctions
open scoped NumberField

theorem heckeLFunction_zeroFreeRegion (n : ℕ) :
    ∃ c : ℝ, 0 < c ∧ ∀ (K : Type) [Field K] [NumberField K], Module.finrank ℚ K = n →
      ∀ ψ : PrimitiveRayClassCharacter K,
        (∀ ρ : ℂ, 1 - c / Real.log (|(NumberField.discr K : ℝ)| *
              (Ideal.absNorm ψ.conductor.finitePart : ℝ) * (|ρ.im| + 3) ^ n) ≤ ρ.re →
            0 < meromorphicOrderAt (heckeLFunctionC ψ.character) ρ →
            ρ.im = 0 ∧ ψ.character ^ 2 = 1 ∧
              meromorphicOrderAt (heckeLFunctionC ψ.character) ρ = 1) ∧
        ∀ ρ₁ ρ₂ : ℂ,
          1 - c / Real.log (|(NumberField.discr K : ℝ)| *
              (Ideal.absNorm ψ.conductor.finitePart : ℝ) * (|ρ₁.im| + 3) ^ n) ≤ ρ₁.re →
          1 - c / Real.log (|(NumberField.discr K : ℝ)| *
              (Ideal.absNorm ψ.conductor.finitePart : ℝ) * (|ρ₂.im| + 3) ^ n) ≤ ρ₂.re →
          0 < meromorphicOrderAt (heckeLFunctionC ψ.character) ρ₁ →
          0 < meromorphicOrderAt (heckeLFunctionC ψ.character) ρ₂ → ρ₁ = ρ₂ := sorry

theorem heckeLFunction_riemannVonMangoldt (n : ℕ) :
    ∃ C : ℝ, ∀ (K : Type) [Field K] [NumberField K], Module.finrank ℚ K = n →
      ∀ ψ : PrimitiveRayClassCharacter K, ∀ T : ℝ, 2 ≤ T →
        |(∑ᶠ ρ ∈ Ioo (0 : ℝ) 1 ×ℂ Icc (-T) T,
              (MeromorphicOn.divisor (heckeLFunctionC ψ.character) univ ρ).toNat : ℕ) -
            T / Real.pi * Real.log (|(NumberField.discr K : ℝ)| *
              (Ideal.absNorm ψ.conductor.finitePart : ℝ) * (T / (2 * Real.pi * Real.exp 1)) ^ n)| ≤
          C * Real.log (|(NumberField.discr K : ℝ)| *
              (Ideal.absNorm ψ.conductor.finitePart : ℝ) * T ^ n) := sorry

theorem rayClassPrimeCount_effective (K : Type*) [Field K] [NumberField K] (𝔪 : Modulus K) :
    ∃ c₀ : ℝ, 0 < c₀ ∧ ∀ cl : RayClassGroup 𝔪,
      (fun x : ℝ ↦ (Set.ncard {P : IsDedekindDomain.HeightOneSpectrum (𝓞 K) |
            ∃ h : P.asIdeal ∈ integralIdealsPrimeTo 𝔪, idealClass 𝔪 ⟨P.asIdeal, h⟩ = cl ∧
              (Ideal.absNorm P.asIdeal : ℝ) ≤ x} : ℝ) -
          TauCeti.Real.logIntegral x / Nat.card (RayClassGroup 𝔪))
        =O[atTop] fun x ↦ x * Real.exp (-c₀ * Real.sqrt (Real.log x)) := sorry

theorem frobeniusPrimeCount_effective_abelian (K L : Type*) [Field K] [NumberField K] [Field L]
    [NumberField L] [Algebra K L] [IsGalois K L]
    (hab : ∀ σ τ : L ≃ₐ[K] L, σ * τ = τ * σ) (C : ConjClasses (L ≃ₐ[K] L)) :
    ∃ c₀ : ℝ, 0 < c₀ ∧
      (fun x : ℝ ↦ (NumberField.Chebotarev.frobeniusPrimeCount K L C x : ℝ) -
          (Nat.card C.carrier : ℝ) / Nat.card (L ≃ₐ[K] L) * TauCeti.Real.logIntegral x)
        =O[atTop] fun x ↦ x * Real.exp (-c₀ * Real.sqrt (Real.log x)) := sorry
```

## R02 (P3) — The supplier contracts present pinned Tau Ceti declarations as roadmap contracts, under names the pin does not use

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- lines 214–215: "The contracts are those of Arithmetic Dirichlet Series and its discharged target signatures, rather than declarations of the Tau Ceti pin";
- line 235: "These are roadmap contracts";
- line 118: "its `HasMeromorphicContinuation.regular_away`";
- lines 254–265, the LFunctions Layer 0 names;
- `Suggested.lean` line 225: "`TauCeti.Real.logIntegral` contract".

**Claim.** The README says these suppliers are not declarations of the Tau Ceti pin.

**Witness.** At the pin: `TauCeti.Real.logIntegral` (`LogIntegral.lean:141`), `idealSummatory_mul_eq_sub_integral_mul` (`AbelSummation.lean:390`), `rayClassArtinMap_idealClass` (`Reciprocity.lean:216`). `HasMeromorphicContinuation` (`LFunctions/Data/Basic.lean:183`) has fields `meromorphic`, `meromorphicOrderAt_eq`, `analyticAt`; no `regular_away`.

**Repair.**

1. Under "From Tau Ceti", cite with their files every supplier declaration that exists at the pin:
   - Arithmetic Dirichlet Series:
     - `IdealArithmeticFunction`, `IdealArithmeticFunction.vonMangoldt`, `EulerProductData`;
     - `abscissaOfAbsConv_normCoeff_one`, `idealSummatory_mul_eq_sub_integral_mul`;
     - `truncatedPerronKernel_one`, `truncatedPerron_LSeries`, `norm_truncatedPerron_LSeries_sub_sum_le`, `perronFormula`;
     - `LSeries.wienerIkehara`, `primeNumberTheoremTransfer`;
     - `TauCeti.Real.logIntegral`, `logIntegral_isEquivalent_div_log`.
   - Global Number Fields: `Modulus`, `RayClassGroup`, `idealClass`, `integralIdealsPrimeTo`, `finite_rayClassGroup`, `rayClassIdealMainTerm_eq`, `RayClassCharacter`.
   - Number Field Arithmetic: `NumberField.artinSymbol`.
   - Chebotarev: `frobeniusPrimeSet`, `frobeniusPsi`, `frobeniusTheta`, `frobeniusVonMangoldtCoeff`, `frobeniusPrimeCount`, `tendsto_frobeniusPrimeCount`, `hasNaturalDensity_frobeniusPrimeSet`.
   - Class Field Theory: `rayClassArtinMap`, `rayClassArtinMap_idealClass`, `rayClassArtinMap_surjective`.
   - LFunctions:
     - `AnalyticLFunctionData`, `degree`, `gammaFactor`, `dual`;
     - the three predicates, `ArithmeticLFunctionData`, `NormalizationTranslation`;
     - `riemannZetaData`, `dirichletData`;
     - `PrimitiveRayClassCharacter`, `heckeLFunctionC`, `heckeLFunctionC_induced`, `heckeLFunctionC_eq_primitive`, `eulerCorrection`, `eulerCorrection_one`, `finiteEulerCorrection`.
2. Use the pin's names. The README name is on the left, the pin's on the right:

   | README name | Pin name |
   | --- | --- |
   | `regular_away` | `analyticAt` |
   | `exact_pole_order` | `meromorphicOrderAt_eq` |
   | `completes` | `completed_eq` (of `HasDirichletAgreement`) |
   | `eq_away` | `completed_eq` (of `HasFunctionalEquation`) |
   | `polarOrder_reflect` | `polarOrder_one_sub_conj` |
   | `hasFunctionalEquation_eventuallyEq` | `HasFunctionalEquation.eventuallyEq` |
   | `dual_hasDirichletAgreement` | `HasDirichletAgreement.dual` |
   | `dual_hasMeromorphicContinuation` | `HasMeromorphicContinuation.dual` |
   | `dual_gammaFactor` | `gammaFactor_dual` |
   | `dualCompleted` | `dual_completed` |
   | `reflectedPoint s` | `1 − conj s` |

3. Keep under "From TauCetiRoadmap.LFunctions" only what the pin lacks:
   - `dedekindZetaC` and the `completedDedekindZeta` family;
   - `heckeData`, `completedHeckeLFunction*`, the Mellin kernels and the `Grossencharacter.*` kernels;
   - `three_four_one_nonneg`, `dedekindZeta_logDeriv_eq`, `heckeLFunction_ne_zero_of_one_le_re`.
4. Delete "rather than declarations of the Tau Ceti pin", "These are roadmap contracts" and "including when absent from the library pin" (line 64).

**Test.** A scratch `#check` file resolves the following at the pin:

- `TauCeti.LFunctions.AnalyticLFunctionData.HasFunctionalEquation.eventuallyEq`;
- `…HasMeromorphicContinuation.analyticAt`;
- `riemannZetaData_hasFunctionalEquation`;
- `TauCeti.Real.logIntegral` and `logIntegral_isEquivalent_div_log`.

## R03 (P3) — `TauCeti.Contour.IsPiecewiseC1On` does not exist at the pin

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- line 200: "contour integration (`Analysis/Contour/`): `TauCeti.Contour.IsPiecewiseC1On`";
- line 1333;
- line 1340, the *Needs* of 7.1.

**Claim.** The pin declares a piecewise-`C¹` predicate under this name, in the contour folder.

**Witness.** `#check @TauCeti.Contour.IsPiecewiseC1On` gives "Unknown identifier". The pin declares `TauCeti.IsPiecewiseC1On` (`TauCeti/Analysis/Calculus/ContDiff/PiecewiseC1On.lean:91`), and `argumentPrinciple_nullHomologous` elaborates with the hypothesis `TauCeti.IsPiecewiseC1On γ a b`.

**Repair.** Replace the three occurrences with `TauCeti.IsPiecewiseC1On`, and give its file `Analysis/Calculus/ContDiff/PiecewiseC1On.lean` in the contract.

**Test.** The `#check` of `TauCeti.Contour.argumentPrinciple_nullHomologous` and `TauCeti.Contour.windingNumber_comp_eq_integral_logDeriv` prints exactly that name.

## R04 (P3) — The cited Trudgian theorems have a published gap; cite the corrected statements

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- lines 1427–1428: "(Trudgian, Theorem 1, for `χ` nonprincipal, with absolute constants; Theorem 2 is the Dedekind case; Davenport §16)";
- lines 1857–1861, the References;
- `Suggested.lean` line 177.

**Claim.** Trudgian's Theorems 1 and 2 are cited as the source of the conductor-uniform counts with absolute constants. For the Dedekind case of 7.5 they are the only source cited.

**Witness.** Bennett–Martin–O'Bryant–Rechnitzer, Math. Comp. 90 (2021), §1 and §5.1: Trudgian wrongly dismissed a parameter inequality as redundant, so his proofs of Theorems 1 and 2 are incomplete. Hasanalizade–Shen–Wong, Math. Comp. 91 (2022), §1, concur for Theorem 2.

**Repair.** Cite the corrected statements and keep Trudgian as the earlier one. Add both papers to the References, with arXiv:2005.02989 and arXiv:2102.04663.

- For the Dirichlet count: Bennett et al., Corollary 1.2. For conductor `q > 1` and `T ≥ 5/7`, `|N(T,χ) − (T/π) log(qT/2πe)| ≤ min{0.247 log qT + 6.894, 0.298 log qT + 4.358}`.
- For the Dedekind count: Hasanalizade–Shen–Wong, Theorem 1.1 (`T ≥ 1`).

**Test.** The README statements, with existential constants, are unchanged. At `q = 1`, `T = 100`, the formula gives `56.25` against `N±(100) = 58`, a difference within `C log 100`.

## R05 (P3) — 4.3's trailing-coefficient form is routed through a lemma whose hypothesis `1 ≤ M` can fail

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 929–931: "the count is at most `m + (log (M/‖a‖) − m log R)/log (R/r)`, by applying the first form to `f(z)/(z − c)^m`".

**Claim.** The trailing-coefficient bound follows by applying the first form to the quotient.

**Witness.** At `f = z/10`, `c = 0`, `r = 1`, `R = 2`, `M = 1`, the quotient `1/10` has sphere bound `1/2`. That violates `hM : 1 ≤ M` of `AnalyticOnNhd.sum_divisor_le` (`JensenFormula.lean:389`). The claimed bound `3.32 ≥ 1` still holds.

**Repair.** Route the trailing form through Jensen's formula `MeromorphicOn.circleAverage_log_norm` (`JensenFormula.lean:307`, already in the supplier list), which has no `1 ≤ M` hypothesis. The steps are:

- `∑_ρ log(R/‖ρ − c‖) ≤ log(M/R^m) − log‖a‖` over the zeros of `g` in `closedBall c R`;
- each zero in `closedBall c r` contributes at least `log(R/r)`.

Alternatively, add the hypothesis `R^m ≤ M`.

**Test.** At `f = z/10`, the zeros of `g` number at most `(log(1/2) − log(1/10))/log 2 = 2.32`, so the total is at most `3.32`; the true count is `1`.

## R06 (P3) — Three sampled targets carry no source locator

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- 1.3a, lines 485–487;
- 5.6, lines 1094–1102 (its three bullets);
- 8.3 for general `K`, lines 1494–1503.

**Claim.** Every target carries a locator.

**Witness.** None of the three paragraphs has a locator. The only nearby locators are DLMF 5.11 (on 1.3) and "Davenport §17", which covers only the `K = ℚ` instance of 8.3.

**Repair.**

- 1.3a: add "(DLMF 5.6.6)". That equation states `|Γ(x + iy)| ≤ |Γ(x)|`; I checked it on the DLMF page for §5.6.
- 5.6:
  - cite Davenport §12 for `Re B = −∑ Re 1/ρ`, and §§15–16 for the count of zeros with `|γ − T| ≤ 1`. The README's References already describe these sections;
  - for the Dedekind and Hecke families, say, as 6.4 does, that the statement is assembled here from 5.5, 3.1 and 4.4.
- 8.3: say that the general-`K` formula, with its `r₁` and `r₂` terms, is assembled from the residues of 8.2, or cite a source that states it.

**Test.** At `K = ℚ` the assembled formula gives `c_ℚ = −log 2π = −1.8379` and the trivial-zero term `−½ log(1 − x^{−2})`, which is `chebyshevPsi_explicitFormula`.

## R07 (P3) — The pull request's title, description and merge order are stale, and no order is stated against #1907 (previous R01, not repaired)

**Location.** The pull request's title and description (data):

- the title: "effective statements under the exclusion of Landau–Siegel zeros";
- the description: "Merge order: after AnalyticNumberTheoryPartI (#1126) lands, since the strengthened statements refer to its §0.34."

**Claim.** The pull request restates the roadmap in exception-free form, and it depends on AnalyticNumberTheoryPartI.

**Witness.** README line 1202 still defines *IsExceptionalZero*, and lines 1812–1816 make AnalyticNumberTheoryPartI a consumer. `ORDER.txt` puts this roadmap at line 48, before it (49). `roadmaps overlaps` reports #1907 conflicting in both files.

**Repair.**

- Retitle the pull request.
- Rewrite the description to describe this head:
  - the pinned-name repairs;
  - targets 1.3a, 1.4a, 5.6a and 6.4d;
  - the two `ζ` lemmas in `Suggested.lean`;
  - Provenance.
- Delete the "after AnalyticNumberTheoryPartI" paragraph.
- State that whichever of #1913 and #1907 merges second is rebased on the other.

**Test.** The new text should agree with README lines 1202 and 1812–1816, and with `ORDER.txt` lines 48–49.

## Previous findings

- **R01 of the previous review (the stale pull-request text): not repaired.**
  - The head is still `c8a8c6b`, the folder diff is empty, and the quoted title and description are unchanged.
  - The title is still "effective statements under the exclusion of Landau–Siegel zeros", and the description still ends "Merge order: after AnalyticNumberTheoryPartI (#1126) lands".
  - This review carries it forward as R07.
- The previous review raised no other open finding. Its R02 had already been repaired at this head.

## Verified sound

**Gate and dependency check.**

- My run of `gate … ZerosOfLFunctions --base origin/main` printed every check at 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, and exited 0.
- The worker's gate (including `build=0`) also passes.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'` is empty.
- The dependency check printed:

```text
depcheck: 239 roadmaps, 2355 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. In `ORDER.txt`, LFunctions is at line 27, this roadmap at 48 and AnalyticNumberTheoryPartI at 49. The other suppliers (ArithmeticDirichletSeries, GlobalNumberFields, NumberFieldArithmetic, Chebotarev, ContourIntegration) are under `Completed/` on main, and ClassFieldTheory is on main.

**Elaboration.**

- `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 with exactly 13 "declaration uses `sorry`" warnings.
- A scratch copy with `#check @name` for all 16 declarations (and `#print` of `OrderLE`, `zeroCount` and `zetaEntireCompletion`) elaborates. Each type matches the worker's `signatures.md` and its README statement. No section binder is lost: the file has no `variable` block, and every hypothesis is in its own signature. Nothing changed.

**One-tactic probe.**

- Each of the 13 `sorry`s was replaced by `first | rfl | (simp; done) | infer_instance | (norm_num; done) | trivial | positivity`.
- All 13 fail, at lines 83, 99, 112, 122, 130, 148, 161, 172, 185, 201, 220, 233 and 245. There is no padding.
- The two non-headline lemmas, `riemannZeta_zeros_summable_ordinate` and `neg_re_logDeriv_riemannZeta_le`, are substantive and are named as such in the docstring.

**Headline theorems.** The README Summary lists these end theorems:

- conductor-uniform convexity (3.4);
- Hadamard at order one (5.5);
- the regions for `ζ_K` and Hecke L-functions (6.2–6.4);
- uniform Riemann–von Mangoldt (7.4–7.5);
- the truncated and Weil formulas (8.3–8.4);
- the prime ideal theorem (8.5);
- the ray-class count (8.7);
- abelian Chebotarev (8.8).

At `K = ℚ` they are all stated, and 8.5 is stated over every `K`. The general-`K` forms of 6.2–6.4, 7.5, 8.7 and 8.8 are statable but absent (R01).

**Source sample.**

| Target | Locator checked | Result |
| --- | --- | --- |
| 1.1 | Via `Complex.exists_continuousOn_eqOn_exp_comp` (`Mathlib/Analysis/Complex/BranchLogRoot.lean:39`: simply connected, open, continuous, `0 ∉ g '' U`) | `S_δ` is homeomorphic through `log` to the half-strip `{u > 0, |v| < π − δ}`; `Γ` is nonvanishing and continuous there. Sound, and no literature locator is needed for this construction |
| 1.2 | dlmf5 lines 104–108 (5.11.1, sector `|ph z| ≤ π − δ`) and 563–569 (§5.11(ii), remainder `≤ sec^{2n}(½ ph z)` times the first neglected term) | Supported as written, with `O(1/‖s‖)` uniform at constant `1/(12 sin²(δ/2))` |
| 1.3 (context for 1.3a) | dlmf5 lines 488–492, 524 (5.11.9, uniform for bounded `x`) | Supported |
| 1.3a | No locator (R06); statement verified, and DLMF 5.6.6 supports it | — |
| 1.4a | Mathlib `logDeriv_riemannZeta_one_sub` (`Mathlib/NumberTheory/LSeries/RiemannZetaLogDeriv.lean:35`: hypotheses `∀ n : ℤ, s ≠ n`, `ζ s ≠ 0`) | The asymmetric form is exactly as quoted; the symmetric form is derived below |
| 3.2 | `PhragmenLindelof.vertical_strip` (`Mathlib/Analysis/Complex/PhragmenLindelof.lean:275`: growth `O(exp(B exp(c|im z|)))`, `c < π/(b − a)`, constant edge bounds) | Matches the README's growth reduction and edge normalization |
| 3.4 | Iwaniec–Kowalski §5.2, Titchmarsh §5.1 | Not verifiable; the exponent algebra is checked below |
| 4.3 | `AnalyticOnNhd.sum_divisor_le` (`JensenFormula.lean:389`: `0 < |r| < |R|`, `1 ≤ M`, analytic on `closedBall c |R|`, `f c ≠ 0`) | The first form matches exactly; the trailing form is R05 |
| 5.6 | No locator (R06) | Statements verified below |
| 6.2 | `kadiri2012` lines 79–85 (Theorem 1.1, p. 2: for `d_K` sufficiently large, no zero for `|Im s| ≥ 1` past `1 − 1/(12.55 log d_K + 9.69 n log|Im s| + 3.03 n + 58.63)`; at most one zero, real and simple, for `|Im s| ≤ 1` past `1 − 1/(12.74 log d_K)`) | Supports the README sentence, which states the large-`d_K` restriction and delegates small fields to 6.4e |
| 6.4 | `kadiri2012` lines 230–237 (§2.1.2, p. 5: `−Re ζ'_K/ζ_K = −∑ Re 1/(s − ρ) + ½ log d_K + Re 1/s + Re 1/(s − 1) + Re γ'_K/γ_K`) | Supports the 4d identity with the `+½ log d_K` sign; 6.4 is otherwise declared "assembled from six targets" |
| 6.5 | LFunctions on main, `Suggested.lean`: `heckeLFunction_ne_zero_of_one_le_re` (line 2680), `meromorphicOrderAt_dedekindZetaC_one_add` (2688), `meromorphicOrderAt_dedekindZetaC_one` (977), `completedHeckeLFunction_one_sub_eventuallyEq` (1670); Mathlib `riemannZeta_ne_zero_of_one_le_re` (`Nonvanishing.lean:417`) | Resolved |
| 7.3 | Titchmarsh §9.3 (in a Check); Tau Ceti `exists_continuousOn_arg_lift_with_partition` (`TauCeti/Analysis/Contour/Argument/Lift.lean:427`) and `windingNumber_comp_eq_integral_logDeriv` (`TauCeti/Analysis/Contour/LogDerivFTC.lean:227`) | The Tau Ceti hypotheses match 7.3 (continuous, avoiding the point; analytic and nonzero on the curve). Titchmarsh is not verifiable |
| 7.6 | Titchmarsh Theorem 9.4, p. 214 | Not verifiable; the averaging identity is checked below |
| 8.3 | Davenport §17 | Not verifiable; the residues are recomputed below; general-`K` locator is R06 |
| 8.4 | Lang XVII §3, Theorem 3.1 | Not verifiable; the formula is rederived below |

The README flags no locator as unverified.

**Other source checks.**

- `trudgian2015` lines 19–27 (Theorems 1–2, `T ≥ 1`) match the References' description; its gap is R04.
- Crossref gives Trudgian's paper as Math. Comp. 84, no. 293, pp. 1439–1450, as the README cites.

**Library declarations opened at the pins.**

- *Mathlib, opened in source:*
  - `AnalyticOnNhd.sum_divisor_le` and `MeromorphicOn.circleAverage_log_norm` (`JensenFormula.lean:389, 307`);
  - `PhragmenLindelof.vertical_strip`, `Complex.exists_continuousOn_eqOn_exp_comp`, `logDeriv_riemannZeta_one_sub`;
  - `DirichletCharacter.completedLFunction` and `completedLFunction_modOne_eq` (`DirichletContinuation.lean:231, 238`; Mathlib's completion is `γ(s)L(s,χ)` without `q^{s/2}`, which does not move zeros);
  - `Complex.digamma_one_sub`, `Complex.digamma_two_mul` (`Digamma.lean:94, 124`).
- *Mathlib, resolved by name:* the other 56 names of "From Mathlib" all resolve. The only unresolved string, `ζ'/ζ`, is prose, not a name.
- *Tau Ceti, resolved by `#check`:*
  - `TauCeti.Contour.windingNumber`, `IsNullHomologous`, `isNullHomologous_iff` (`Winding/Number/Basic.lean:76, 147, 152`);
  - `argumentPrinciple_nullHomologous` (`Argument/Cycle.lean:110`);
  - `residue_logDeriv_eq_meromorphicOrderAt` (`Residue/LogDeriv.lean:63`);
  - the two 7.3 declarations above;
  - `HasFunctionalEquation.eventuallyEq` and `HasMeromorphicContinuation.analyticAt`;
  - `TauCeti.Real.logIntegral` and `logIntegral_isEquivalent_div_log`;
  - every pin declaration listed in R01–R02.

**Cross-roadmap citations, resolved on main (`373d88d`).**

| Roadmap | Cited ids, with their lines |
| --- | --- |
| LFunctions | Layers 0, 3, 5–8 (README lines 346, 730, 929, 1100, 1440, 1566); the 14 "found nowhere" names of `citations.md` are in its `Suggested.lean`, e.g. `regular_away` line 188, `heckeData` 1632, `dedekindZetaData` 1053 |
| ArithmeticDirichletSeries | §2.3 (line 182), §§6.1–6.4 (258–275), Layers 9–10 (337, 357) |
| GlobalNumberFields | Layers 2, 3E and 9 (279, 393, 508) |
| NumberFieldArithmetic | §2.3 (647) |
| Chebotarev | Layers 2, 11, 13 and 14 (175, 425, 593, 612) |
| ClassFieldTheory | Layer 12 (1724) |
| ModularForms | Layer 7 (708) |
| AnalyticNumberTheoryPartI, at its head | §§0.1, 0.6, 0.9, 0.18, 0.32 and 0.34 |

**Overlaps and ownership.**

- `roadmaps overlaps` reports only #1907 (R07).
- No cited id is dropped by an open pull request, and none is defined only by an open revision. This pull request only adds.
- The closest roadmaps in vocabulary are all later in the merge order and cite this roadmap rather than re-owning it:
  - ExplicitZetaBounds (#1954, `ORDER.txt` line 265) defers "the existential shapes of convexity, zero counting, zero-free regions and the explicit formula" here;
  - ExplicitPrimeCounting (#1945, line 267) and ExplicitNumberFields (#1944, line 270);
  - AnalyticNumberTheoryPartIII (#2008, line 271), whose README lines 355–372 consume §§3.4, 4.3, 6.2–6.5, 7.1 and 8.5;
  - AnalyticNumberTheoryPartI (#1126, line 49).
- No object has two owners.

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `OrderLE` (0.1) | `1/Γ` along `−n−½`; `exp z²` at order 1; constant `1` at `A = −1` | `log‖1/Γ(−n−½)‖/n` is `1.44`, `3.63`, `5.91` at `n = 10, 100, 1000`, unbounded, so not exponential type; `exp(r²)/exp(r^{1.5})` tends to ∞; `1 = O(exp ‖s‖^{A'})` for every `A'` | sound | none |
| `zetaEntireCompletion` | `s = 0, 1, 2` | `1`, `1`, `1.04720 = 2·Λ(2) = 2·π/6`; via `Λ₀(2) = π/6 + ½ − 1 = 0.02360`, `2·0.0236 + 1 = 1.0472` | sound | none |
| 1.1 *logGamma* | `δ = π/4`, value at 3 | `Γ > 0` on `[2,3]`, so *logGamma* `3 = log 2 = 0.6931`; a `2πi` shift fails the normalization | sound | none |
| 1.2, 1.3 | §5.11(ii) at `n = 1`; `x ∈ [a,b]`, `y → ∞` | Remainder at most `sec²(ph z/2)/(12|z|) ≤ 1/(12 sin²(δ/2)|z|)`; `−y ph z − x = −π|y|/2 + O(y^{−2})`, giving 1.3's main term | sound | none |
| 1.3a | `½ + i`; `3/2 + i`; `Re s = −½` | `‖Γ‖² = 0.271015 = π/cosh π ≤ π`; `0.58204 ≤ Γ(3/2) = 0.88623`; `Γ(−½) = −3.5449 < 0` | sound | locator (R06) |
| 1.4a | `s = 2`; `s = −2`; `ψ(i)` | Both sides `1.4150927`; at `−2`, junk `0` leaves `ζ'/ζ(3) = −0.1648` against `0.5541`, so `ζ(s) ≠ 0` is needed; `Im ψ(i) = 2.0767` | sound | none |
| 1.5 | `gammaR = {μ}`, `gammaC = {ν}` | `log‖Γℝ(σ+μ+it)‖ = ((σ+Re μ−1)/2) log|t| − π|t|/4`; `log‖Γℂ‖ = (σ+Re ν−½) log|t| − π|t|/2`; total rate `πn/4` | sound | none |
| 3.1 | `R = 0`, `c = α = 1`; `exp(sin πs)` | Tail `E₁(1) = 0.2194 < e^{−1} = 0.3679 < Γ(1) = 1`; `log‖g(½+2i)‖ = cosh 2π = 267.7`, with edges of norm 1 | sound | none |
| 3.4 exponent | `δ = 0.1` at `σ = −δ, ½, 1+δ` | `0.6·1.2/1.2 = 0.6 = ½+δ`; `0.6·0.6/1.2 = 0.3 = ¼+δ/2`; `0` | sound | none |
| `dirichletLFunction_convexity` | `q = 1`, `t = 0`; `χ₋₄`, `t = 0` | `|ζ(½)| = 1.46035 ≤ C·3^{¼+ε}`; `L(½,χ₋₄) = 0.66769 ≤ C·12^{¼+ε}` | sound | none |
| 4.3, first form | `1 − z/2`, `r = 1`, `R = 3/2`, `M = 2` | Count `0 ≤ log 2/log 1.5 = 1.7095` | sound | none |
| 4.3, trailing form | `z` at `R = ½` (README); `z/10` at `R = 2`, `M = 1` | `2 ≥ 1`; the quotient bound `0.5` violates `1 ≤ M`; the Jensen route gives `3.32 ≥ 1` | true; route gap | R05 |
| `hadamard_of_orderLE_one` | `1 − s`; `cos z`; `1/Γ(z+1)`; `exp z²` | `(a, b) = (0, −1)`; pairs `1 − z²/ρ²`, `a = b = 0`; `b = γ = 0.5772`; `exp z²` excluded by `OrderLE _ 1` | sound | none |
| `zetaEntireCompletion_hadamard` | `s = 0` | `1 = exp A`, all factors `E₁(0) = 1` | sound | none |
| 5.2 | `z = −½`; `z = 1` | `‖E₁ − 1‖ = 0.0902 ≤ ½·¼`, while the genus-0 factor gives `½`; `E₁'(1) = −e` | sound | none |
| 5.6 | `ζ`: `Re B`; `f·e^{cs}` | `∑ Re 1/ρ = 1 + γ/2 − ½ log 4π = 0.02310`; `e^{cs}` shifts `b` by `c` without moving any zero, so the reality hypothesis is needed | sound | locator (R06) |
| `riemannZeta_zeros_summable_ordinate` | `ρ₁`; zeros of `riemannZeta` | `2/(1+14.1347²) = 0.009961`; the trivial zeros each give summand `1`, which diverges | sound | none |
| `riemannZeta_zeroFreeRegion` | `σ ∈ [1−c/log 3, 1)`; `s = 1` | `ζ(σ) < 0`; Mathlib's `riemannZeta 1 = −0.9769 ≠ 0`, so the hypothesis `s ≠ 1` is unused but harmless | sound | none |
| `dirichletLFunction_zeroFreeRegion` | principal character mod 2 | Cap gives `1 − 0.5493/log 6 = 0.693 > 0`, excluding `s = 0`; the zeros of `1 − 2^{−s}` at `±9.06i` enter only if `c ≥ 3.18`; imprimitive: the region at `q` lies inside the region at `q* ≤ q` | sound | none |
| `neg_re_logDeriv_riemannZeta_le` | `t = 0.01`, `δ = 2|t|`; `s = 2` | `Re 1/(δ+2it) = 25.0 = 1/(4|t|)` while `C log 0.01 < 0`, so the threshold is needed; `−ζ'/ζ(2) = 0.56996` bounds the `δ ≥ 1` range | sound | none |
| 6.4d, general | `Re 1/(δ+iu)` at `δ = u = 1`; `ℚ(√D)` split primes | `0.5 = 1/(2|u|)`; `−ζ'_K/ζ_K(σ) ≥ 2∑_{n≤B} Λ(n)n^{−σ}`, which exceeds `1/(σ−1) + C` | sound | none |
| 6.5 | odd `χ` mod 4 at `s = 1` | `2·(1/π)·(π/4) = 0.5`, order 0 | sound | none |
| 7.3 *S(T)* | `T → 0⁺`; segment `2 → 2+iT` | `S → −1`, matching `N = θ/π + 1 + S` with `θ(0) = 0`; `Re ζ(2+it) ≥ 2 − ζ(2) = 0.3551` | sound | none |
| `riemannVonMangoldt` | `T = 2, 14, 100` | Main terms `−0.683`, `−0.443`, `28.127` against `N = 0, 0, 29`; `log T = 0.69, 2.64, 4.61` | sound | none |
| `riemannVonMangoldt_dirichlet` | `q = 1`, `T = 100` | `56.255` against `N± = 58 = 2·29`, using `completedLFunction_modOne_eq` | sound | R04 (locator) |
| 7.5 confinement witness | `ζ(s)(1 + 5·2^{−s} + 2·4^{−s})` | Roots `x = −0.2192, −2.2808`, so `σ = 2.19, −1.19`; `2^s + 5 + 2·2^{−s}` is invariant under `s ↦ 1 − s` | sound | none |
| 7.6 | the averaging identity | `∫₀^T(N(t+1)−N(t)) = ∫_T^{T+1}N − ∫₀¹N`; for `ζ`, `∫₀¹N = 0` | sound | none |
| `chebyshevPsi_explicitFormula` | `x = 20, T = 10`; `x = T = 2` | `ψ(20) = 19.2657` against `18.1634`, a difference of `1.102 ≤ C·17.95`; `ψ(2) = 0.6931` against `0.3060`, `0.387 ≤ C·0.480` | sound | none |
| 8.3, general `K` | residues | At `0`: `c_K − (r₁+r₂−1) log x`. At `−m`: `(order) x^{−m}/m`, with orders `r₁+r₂` (`m` even) and `r₂` (`m` odd). These sum to `−((r₁+r₂)/2) log(1−x^{−2}) + (r₂/2) log((x+1)/(x−1))` | sound | locator (R06) |
| `riemannZeta_weilExplicitFormula` | contour derivation; `φ = 0`; `φ` supported in `(0.4, 0.6)` | Residues `−φ̃(0) − φ̃(1)`. Reflection uses `∫_{(−1)} f(s) ds = ∫_{(2)} f(1−w) dw`, and `φ̃(1−s)` is the transform of `φ(1/y)/y`. The gamma term is `(2π)⁻¹∫` at `s = 2+it`. Both sides vanish at `φ = 0`. In the third case the prime side is only `Λ(2)φ(½)/2`. All match the Lean | sound | none |
| 8.4, general `K` | `½ log|d_K|` term; `−½ log π` | `(2πi)⁻¹∫½ log|d_K|(φ̃(s)+φ̃(1−s)) = log|d_K| φ(1)`; the `−½ log π` term gives `−(log π) φ(1)` | sound | none |
| `primeIdealCount_effective` | `K = ℚ` | `HeightOneSpectrum ℤ` corresponds to the primes `(p)`, so the count is `π(x)`; `Li 2 = 0` | sound | none |
| `primeCounting_progression_effective` | `q = 1`; `q = 4`, `a = 3`; `p ∣ q` | All primes, `φ(1) = 1`; main term `Li x/2`; `p ≡ a (mod q)` with `p ∣ q` forces `p ∣ a` | sound | none |
| 8.7 Checks | `ℚ`, `(3)∞`; `ℚ(√−5)` | `#Cl = 2`, main-term coefficient `1/3`; principal split primes are exactly `p ≡ 1, 9 (mod 20)` | sound | none |
| R01 probe statements | `ψ = 1` (the Dedekind case) | The pole at `1` has order `−1`, not positive; `s = 0` is outside `Ioo 0 1`; elaborates with 4 `sorry` warnings | statable | R01 |

## Not verifiable

- **Paywalled sources.** These are cited by locator only, and I did not read them:
  - Davenport, *Multiplicative Number Theory* (§§11–20; sample targets 5.6 and 8.3 at `ℚ`);
  - Titchmarsh (§5.1, §9.3, Theorem 9.4, p. 214; sample targets 3.4, 7.3 and 7.6);
  - Iwaniec–Kowalski §§5.1–5.2 (3.4);
  - Lang, *Algebraic Number Theory*, XVII §3, Theorems 3.1–3.2 (8.4);
  - Lagarias–Odlyzko 1977.

  The statements at these locators were checked mathematically in the table, not against the text.
- `kadiri2012` is arXiv v1. I could not check that its numbering agrees with the IJNT version.
- The roadmap's source manifest gives Trudgian's venue as "no. 294, pp. 2047–2058", copied from the arXiv journal reference. Crossref and the AMS URL give no. 293, pp. 1439–1450, which is what the README cites. The manifest entry is not part of this pull request.
- The Downstream-consumers line saying that AnalyticNumberTheoryPartI's §0.34 proves the exclusion of Landau–Siegel zeros describes that roadmap. Its 2026 sources (its references 109–111) were not read. The claim is not a statement of this roadmap.

## Source issues

- **Gap** in trudgian2015 at Theorems 1–2 and §3.1 (pp. 1, 6): the source says the Backlund-trick step needs no constraint on its parameters beyond those listed, wrongly treating one parameter inequality as redundant (as Bennett–Martin–O'Bryant–Rechnitzer §1, §5.1 report); it should be: every parameter inequality verified, as in the corrected proofs; affects a stated result; corrected in print at Bennett–Martin–O'Bryant–Rechnitzer, Math. Comp. 90 (2021), Theorem 1.1 and Corollary 1.2 (Theorem 1), and Hasanalizade–Shen–Wong, Math. Comp. 91 (2022), Theorem 1.1 (Theorem 2).
