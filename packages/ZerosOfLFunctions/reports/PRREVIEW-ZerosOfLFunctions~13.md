# Review of ZerosOfLFunctions (pull request #1913 at 237426a)

**Verdict:** needs changes

This is an incremental re-review of the 89 README lines changed since `c8a8c6b`. `Suggested.lean` is unchanged (its diff is 0 lines). The repairs of the 4.3 trailing form and of the 1.3a, 5.6 and 8.3 locators are correct. Five of the previous findings are not repaired or only partly repaired, and the new 4.3 route adds one small gap in its *Needs:* line.

## R01 (P2) — Headline theorems that can be stated at the pinned Tau Ceti are still absent, and the docstring still says they cannot be stated (previous R01, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean`, lines 28–40:

- "neither library has its continuation to `ℂ`, its completion, or the L-function of a Hecke character";
- "the Tau Ceti revision this file is built against supplies none of them".

**Claim.** The file says the general-`K` forms of the end theorems 6.2–6.4, 7.5, 8.7 and 8.8 cannot be stated at the pins, so it states only their `K = ℚ` instances.

**Witness.** Tau Ceti `2fd255d9` declares all the carriers these statements need:

- `heckeLFunctionC` (`LFunctions/Hecke/Basic.lean:74`);
- `PrimitiveRayClassCharacter` (`Hecke/Primitive.lean:91`);
- `RayClassGroup` (`Global/RayClass/Basic.lean:130`);
- `artinSymbol` (`ArtinSymbol.lean:57`);
- `frobeniusPrimeCount` (`PrimeCounting/VonMangoldt.lean:177`).

The four statements below elaborate against them at this head.

**Repair.**

1. Add the four imports and the four statements below to `Suggested.lean`, under Layer comments, and write each in the README at 6.4, 7.5, 8.7 and 8.8.
   - The trivial character `(1 : PrimitiveRayClassCharacter K)` is the `ζ_K` case.
   - The open strip `Ioo 0 1` gives the same count as the closed strip, by 6.5.
2. Rewrite the docstring's "Not statable" paragraph so that it names only what the pin still lacks:
   - the completions (`completedDedekindZeta`, `completedHeckeLFunction`, `heckeData`);
   - with them, the exceptional-zero terms of 8.5–8.8.
3. Correct lines 42–44. `AnalyticLFunctionData` is at the pin (`LFunctions/Data/Basic.lean:82`). The Layer 0–2, 4, 7.1–7.3 and 9 statements are left out because they are lemmas, not because a carrier is missing.

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

**Test.** I ran a scratch copy of `Suggested.lean` with these imports and statements appended, through `lake env lean`.

- It gave 17 "declaration uses `sorry`" warnings: the file's 13 and these 4.
- Its only error was the deliberate `#check @TauCeti.Contour.IsPiecewiseC1On` probe of R03.
- At `ψ = 1` the pole at `1` has order `−1`, which is not positive, so it is not counted as a zero.

## R02 (P3) — The supplier contracts list pinned Tau Ceti declarations as roadmap contracts, and the repair left one lemma under two names (previous R02, partly repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- line 263, under "From TauCetiRoadmap.LFunctions": "`AnalyticLFunctionData.hasFunctionalEquation_eventuallyEq`";
- lines 639 and 645 (1.6): the same name;
- lines 551, 560, 1139 and 1146 (1.4a, 5.6a): the pin name `HasFunctionalEquation.eventuallyEq`;
- lines 64, 215 and 235: "roadmap contracts".

**Claim.** The README presents these LFunctions objects as roadmap contracts that are not declarations of the Tau Ceti pin. It now also cites the same germ functional equation under two different names.

**Witness.**

- The pin declares `HasFunctionalEquation.eventuallyEq` (`LFunctions/Data/Basic.lean:269`). The name `hasFunctionalEquation_eventuallyEq` exists only in LFunctions' `Suggested.lean`, line 202, on main.
- The "From Tau Ceti" section (lines 196–210) lists neither this declaration nor `norm_rootNumber`, although 1.4a now cites both as Tau Ceti.

**Repair.**

1. Under "From Tau Ceti", list the pinned LFunctions Layer 0 declarations with their file `NumberTheory/LFunctions/Data/Basic.lean`:
   - `AnalyticLFunctionData`, `degree`, `gammaFactor`, `dual`;
   - `HasDirichletAgreement`, `HasMeromorphicContinuation`, `HasFunctionalEquation` with their pin fields;
   - `HasFunctionalEquation.eventuallyEq`, `HasDirichletAgreement.dual`, `HasMeromorphicContinuation.dual`;
   - `gammaFactor_dual`, `dual_completed`.

   List the other pinned suppliers the previous R02 named in the same way (ArithmeticDirichletSeries, GlobalNumberFields, Chebotarev, `heckeLFunctionC` and the other Hecke declarations).
2. Rename every occurrence to the pin's name. The README name is on the left, the pin's on the right:

   | README name | Pin name |
   | --- | --- |
   | `hasFunctionalEquation_eventuallyEq` (lines 263, 639, 645) | `HasFunctionalEquation.eventuallyEq` |
   | `regular_away` (lines 118, 260, 632, 1382) | `analyticAt` |
   | `exact_pole_order` (lines 260, 353) | `meromorphicOrderAt_eq` |
   | `completes` (lines 259, 633, 871) | `completed_eq` |
   | `eq_away` | `completed_eq` |
   | `polarOrder_reflect` | `polarOrder_one_sub_conj` |
   | `dual_gammaFactor` | `gammaFactor_dual` |
   | `dualCompleted` | `dual_completed` |
   | `dual_hasDirichletAgreement` | `HasDirichletAgreement.dual` |
   | `dual_hasMeromorphicContinuation` | `HasMeromorphicContinuation.dual` |
   | `reflectedPoint s` | `1 − conj s` |

3. Delete these phrases:
   - "these are roadmap contracts, including when absent from the library pin" (line 64);
   - "rather than declarations of the Tau Ceti pin" (line 215);
   - "These are roadmap contracts" (line 235).

**Test.** The changes are done when both of these hold:

- a grep of the README for `hasFunctionalEquation_eventuallyEq|regular_away|exact_pole_order|reflectedPoint` finds nothing;
- `roadmaps resolve` no longer reports the six `AnalyticLFunctionData.*` leads (README lines 257–265).

Every pin name in the table elaborated in my scratch `#check` file.

## R03 (P3) — `TauCeti.Contour.IsPiecewiseC1On` does not exist at the pin (previous R03, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- line 200: "contour integration (`Analysis/Contour/`): `TauCeti.Contour.IsPiecewiseC1On`";
- line 1352;
- line 1359, the *Needs:* line of 7.1.

**Claim.** The README says the pin declares the piecewise-`C¹` predicate under this name, in the contour folder.

**Witness.** In my scratch file at this head, `#check @TauCeti.Contour.IsPiecewiseC1On` gives "Unknown identifier". `#check @TauCeti.IsPiecewiseC1On` elaborates; it is declared in `Analysis/Calculus/ContDiff/PiecewiseC1On.lean:91`.

**Repair.** Replace the three occurrences with `TauCeti.IsPiecewiseC1On`, and give its file `Analysis/Calculus/ContDiff/PiecewiseC1On.lean` in the contract.

**Test.** The `#check` of the renamed predicate elaborates with type `(ℝ → E) → ℝ → ℝ → Prop`.

## R04 (P3) — The Trudgian theorems cited for 7.5 have a published gap; cite the corrected statements (previous R04, not repaired)

**Location.**

- `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 1446–1447: "(Trudgian, Theorem 1, for `χ` nonprincipal, with absolute constants; Theorem 2 is the Dedekind case; Davenport §16)";
- the README's References, lines 1902–1906;
- `Suggested.lean`, line 177.

**Claim.** Trudgian's Theorems 1 and 2 are cited as the source of the conductor-uniform counts with absolute constants. For the Dedekind case of 7.5 they are the only source cited.

**Witness.**

- Bennett–Martin–O'Bryant–Rechnitzer, arXiv:2005.02989v1, p. 2, report that Trudgian wrongly argued one parameter inequality redundant. This leaves his proofs of Theorems 1 and 2 incomplete.
- Hasanalizade–Shen–Wong, arXiv:2102.04663v3, p. 1, agree for Theorem 2.

**Repair.** Cite the corrected statements and keep Trudgian as the earlier one. Add both papers to the References with their arXiv ids.

- For the Dirichlet count: Bennett et al., Math. Comp. 90 (2021), Corollary 1.2. For `q > 1` and `T ≥ 5/7`, the error is at most `min{0.247 log qT + 6.894, 0.298 log qT + 4.358}`.
- For the Dedekind count: Hasanalizade–Shen–Wong, Math. Comp. 91 (2022), Theorem 1.1, for `T ≥ 1`.

**Test.** The README statements, with existential constants, stay as they are. At `q = 1` and `T = 100`, the main term `56.255` against `N±(100) = 58` is within `C log 100`.

## R05 (P3) — The *Needs:* lines of the rewritten 4.3 and 8.3 routes leave out inputs the new text uses

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- line 939: "by the maximum principle, on the whole ball";
- line 942: "*Needs:* Mathlib `AnalyticOnNhd.sum_divisor_le`, `meromorphicTrailingCoeffAt`.";
- line 1523: "The formula is assembled here from 8.1 and 8.2";
- line 1531: "*Needs:* 8.2; …".

**Claim.** Each *Needs:* line lists what its target's route uses.

**Witness.** The new 4.3 route uses two Mathlib inputs that neither its *Needs:* line nor "From Mathlib" lists:

- the maximum principle `Complex.norm_le_of_forall_mem_frontier_norm_le` (`Mathlib/Analysis/Complex/AbsMax.lean:404`);
- the factorization `f = (z − c)^m g` with `g c ≠ 0`, which is `AnalyticAt.analyticOrderAt_eq_natCast` (`Mathlib/Analysis/Analytic/Order.lean:92`).

Separately, 8.3's *Needs:* line leaves out 8.1.

**Repair.**

- Add both names to 4.3's *Needs:* line and to "From Mathlib".
- Add 8.1 to 8.3's *Needs:* line.

**Test.** Run the route on `f = z/10`, `c = 0`, `r = 1`, `R = 2`, `M = 1`:

- `analyticOrderAt_eq_natCast` gives `m = 1` and `g = 1/10`;
- here `M > 0` is given, so the maximum principle is not needed;
- the scaled function `2g = 1/5` has the bound `1`, so it has at most `log 5/log 2 = 2.32` zeros;
- the total bound `3.32` is at least the true count `1`.

## R06 (P3) — The pull request's title, description and merge order are stale, and no order is stated against #1907 (previous R07, not repaired)

**Location.** The pull request's title and description (data):

- the title: "effective statements under the exclusion of Landau–Siegel zeros";
- the description: "Merge order: after AnalyticNumberTheoryPartI (#1126) lands, since the strengthened statements refer to its §0.34."

**Claim.** The pull request restates the roadmap in exception-free form, and it depends on AnalyticNumberTheoryPartI.

**Witness.**

- README line 1221 still defines *IsExceptionalZero*, and lines 1857–1860 make AnalyticNumberTheoryPartI a consumer.
- `ORDER.txt` puts this roadmap at line 48 and AnalyticNumberTheoryPartI at line 49.
- `roadmaps overlaps` reports #1907 conflicting in both files.

**Repair.**

1. Retitle the pull request.
2. Rewrite the description to describe this head:
   - targets 1.3a, 1.4a, 5.6a and 6.4d;
   - the two `ζ` lemmas in `Suggested.lean`;
   - Provenance;
   - the pin-name and locator repairs.
3. Delete the "after AnalyticNumberTheoryPartI" paragraph.
4. State that whichever of #1913 and #1907 merges second is rebased on the other.

**Test.** The new text agrees with README lines 1221 and 1857–1860, and with `ORDER.txt` lines 48–49.

## Previous findings

- R01 — not repaired: `Suggested.lean` is unchanged since `c8a8c6b`. Lines 28–40 still say "the Tau Ceti revision this file is built against supplies none of them". It is carried as R01.
- R02 — partly repaired: 1.4a (lines 550–562) and 5.6a (lines 1139–1147) now cite `TauCeti.LFunctions.AnalyticLFunctionData.HasFunctionalEquation.eventuallyEq`. Lines 64, 118, 215, 235, 257–265, 639 and 645 are unchanged. It is carried as R02.
- R03 — not repaired: lines 200, 1352 and 1359 still read `TauCeti.Contour.IsPiecewiseC1On`. It is carried as R03.
- R04 — not repaired: line 1446 still reads "Trudgian, Theorem 1, for `χ` nonprincipal, with absolute constants; Theorem 2 is the Dedekind case". It is carried as R04.
- R05 — repaired: lines 935–939 apply "the first form with bound `1` to `(R^m/M) g`", with `M > 0` justified and no lower bound on `M`. The route is correct (table below). Its *Needs:* line is R05 of this report.
- R06 — repaired. The new locators are:
  - "(DLMF 5.6.6)" at line 486;
  - Davenport §12, §§15–16 and Kadiri §2.1.2 at lines 1117–1120;
  - for 8.3, at lines 1523–1528, "assembled here from 8.1 and 8.2", with both trivial-zero sums written out.

  All of them check out (below).
- R07 — not repaired: the title and description quoted above are unchanged. It is carried as R06.

## Verified sound

**Gate and dependency check.**

- My run of `gate … ZerosOfLFunctions --base origin/main` printed every check at 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, and exited 0.
- The worker's gate, which includes `build=0`, also passes.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'` is empty.
- The dependency check printed the following, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 239 roadmaps, 2354 edges, 0 problem(s)
```

In `ORDER.txt`, LFunctions is at line 27, this roadmap at 48 and AnalyticNumberTheoryPartI at 49.

**Elaboration.**

- `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 with exactly 13 "declaration uses `sorry`" warnings and nothing else.
- A scratch file with `#check @name` for all 16 declarations elaborates. The printed types are identical to `signatures.md` and to the previous review's: `Suggested.lean` has a 0-line diff, and there is no `variable` block, so no binder is lost. I changed nothing.
- The one-tactic probe of the previous review still holds, since the file is unchanged: none of the 13 statements closes, so there is no padding.

**Pinned declarations the changed passages cite, by `#check` at Mathlib `1b1ccf4b` / Tau Ceti `2fd255d9`.**

- `HasFunctionalEquation.eventuallyEq` (`Data/Basic.lean:269`) elaborates to `d.completed =ᶠ[𝓝[≠] s] fun z ↦ d.rootNumber * d.dual.completed (1 − z)`. It needs only `HasFunctionalEquation`, as 1.4a and 5.6a use it.
- `HasFunctionalEquation.norm_rootNumber` (`:194`) and `HasMeromorphicContinuation.analyticAt` (`:187`) both elaborate.
- `logDeriv_congr_nhdsNE` (`Mathlib/Analysis/Calculus/LogDeriv.lean:48`) carries punctured-germ equality to `logDeriv`. It is in 1.4a's *Needs:* line.
- `AnalyticOnNhd.sum_divisor_le` (`JensenFormula.lean:389`) has hypotheses `0 < |r|`, `|r| < |R|`, `1 ≤ M`, `AnalyticOnNhd` on `closedBall c |R|` and `f c ≠ 0`. Its conclusion is `∑ᶠ u, divisor f (closedBall c |r|) u ≤ log (M/‖f c‖)/log (R/r)`. This is exactly the first form, and the scaled application in 4.3 meets `1 ≤ 1`.
- For 8.1, which 8.3 and 8.6 now cite: `truncatedPerron_LSeries` (`Perron/Formula.lean:130`), `norm_truncatedPerron_LSeries_sub_sum_le` (`:229`) and `truncatedPerronKernel_one` (`Perron/Basic.lean:204`).
- For 8.5: `idealSummatory_mul_eq_sub_integral_mul` (`AbelSummation.lean:390`) and `TauCeti.Real.logIntegral` (`LogIntegral.lean:141`).

**Cross-roadmap citations in the changed passages, resolved on main `2083308`.**

- LFunctions Layer 0 (README line 346, "completed L-function data").
- LFunctions Layer 3 `completedDedekindZeta_one_sub` (`Suggested.lean` line 1046).
- LFunctions Layer 8 `dedekindZeta_logDeriv_eq` (line 2820).
- LFunctions Layers 3 and 5, the Euler products.

The internal targets that 8.5 and 8.6 now name all exist: 4.5, 6.2–6.5, 8.1–8.4.

**Sources: the seeded sample where it meets the change.**

| Target | Locator checked | Result |
| --- | --- | --- |
| 1.3a | DLMF §5.6(ii), equation 5.6.6, `|Γ(x + iy)| ≤ |Γ(x)|`, fetched from `https://dlmf.nist.gov/5.6` (lines 264–266 of the extraction) | DLMF states it with `|Γ(x)|` and no sign condition; the README states `≤ Real.Gamma (Re s)` for `0 < Re s`, and its third Check shows why `0 < Re s` is needed. Supported |
| 5.6 (2nd clause) | Kadiri §2.1.2, p. 5 (`kadiri2012` lines 230–237) | `−Re ζ'_K/ζ_K = −∑ Re 1/(s − ρ) + ½ log d_K + Re 1/s + Re 1/(s − 1) + Re γ'_K/γ_K`, which Kadiri recalls from her [9]: the real-part formula the clause produces. Supported |
| 5.6 (`K = ℚ`) | Davenport §12 and §§15–16 | Paywalled. The statement is checked below: `Re B = −0.02310` for `ζ`. Davenport proves the identity for every primitive `χ`; the README restricts this clause to real coefficients and proves the non-real case in 6.4d |
| 4.5 (now cited by 8.5 and 8.6) | Titchmarsh Theorem 9.2 | Paywalled. 4.5's `N(T + 1) − N(T) = O(log 𝔮)` gives `∑_{|γ| ≤ T} m_ρ/‖ρ‖ = O(log² T)` by partial summation, as 8.5 uses |
| 8.1 (now cited by 8.3) | Arithmetic Dirichlet Series §6.4, at the pin (above) | Resolved |
| 8.3, 8.5, 8.6 at `ℚ` | Davenport §§17, 18, 19–20 | Paywalled. The section titles in the References match the cited content, and the formulas are recomputed below |

The other sample targets (1.5, 1.6, 3.1, 3.2, 3.4, 4.1, 4.4, 5.3, 6.2, 6.5, 7.4, 7.5) are untouched by the diff. They were checked in the previous review: 6.2 against `kadiri2012` lines 79–85, 3.2 against `PhragmenLindelof.vertical_strip`, 6.5 against LFunctions on main, and 7.5 is R04. The README flags no locator as unverified.

**Adversarial table.** Rows marked "r12" are carried from the previous report (PRREVIEW-ZerosOfLFunctions~12) for statements the diff leaves untouched. The other rows are the changed statements, recomputed here.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.3a, now with its locator | `½ + i`; `3/2 + i`; `Re s = −½` | `‖Γ(½+i)‖² = π/cosh π = 0.271015 ≤ π`; `‖Γ(3/2+i)‖ = 0.58204 ≤ Γ(3/2) = 0.88623 ≤ 1`; `Real.Gamma(−½) = −3.5449 < 0`, so the README's unsigned form needs `0 < Re s` while DLMF's `|Γ(x)|` does not | sound | none |
| 1.4a general records (new route via `HasFunctionalEquation.eventuallyEq`) | `ζ` record, `ε = 1`, self-dual, at `s = 2` | `logDeriv Λ(2) = −½ log π + ½ψ(1) + ζ'/ζ(2) = −0.572365 − 0.288608 − 0.569961 = −1.430934`; `logDeriv Λ(−1) = −0.572365 + ½ψ(−½) + (12 log A − 1) = −0.572365 + 0.018245 + 1.985054 = 1.430934`; so `logDeriv Λ(2) = −logDeriv Λ(1 − 2)`, and the version without the minus sign fails by `2.8619` | sound | none |
| 4.3 trailing form (new scaling route) | `z/10`, `R = 2`, `M = 1`; `z³`, `r = ¼`, `R = ½`, `M = ⅛`; `f = 0` | `1 + (log 10 − log 2)/log 2 = 3.3219 ≥ 1`; at `M = ⅛ < 1`, `3 + (log ⅛ + 3 log 2)/log 2 = 3.0000 = 3`, which is sharp and shows no lower bound on `M` is needed; `f = 0` has order `⊤`, which "finite central order" excludes, and that is where `M > 0` comes from | sound | *Needs:* (R05) |
| 4.3 new Check `z/10` | scaled `(R/M)g` | `2 · (1/10) = 1/5`; bound `log 5/log 2 = 2.3219`, true count `0`; the unscaled `g` has sphere bound `½ < 1` | sound | none |
| 4.3 first form | `1 − z/2`, `r = 1`, `R = 3/2`, `M = 2` (r12) | count `0 ≤ 1.7095` | sound | none |
| 5.6 (new locators) | `ζ`; `f·e^{cs}` | `Re B = −γ/2 − 1 + ½ log 4π = −0.02310 = −∑ Re 1/ρ`; `e^{cs}` shifts `b` by `c` and moves no zero, so the reality hypothesis is needed (r12) | sound | none |
| 5.6a route (renamed input) | zeros of `riemannZeta` against those of `Λ`; the pin's germ equation | Trivial zeros give summand `1` and diverge (r12); `eventuallyEq` yields `Λ ≠ 0` near `s` with `Re s < 0` from `Re(1 − s) > 1` | sound | none |
| 8.3, general `K` (new assembly text) | residue sums | Even `m = 2j`: `∑ (r₁+r₂) x^{−2j}/(2j) = −((r₁+r₂)/2) log(1 − x^{−2})`; odd `m`: `∑ r₂ x^{−m}/m = r₂ artanh(1/x) = (r₂/2) log((x+1)/(x−1))` | sound | 8.1 in *Needs:* (R05) |
| 8.3 Check `K = ℚ` | `c_ℚ` | `ζ'(0)/ζ(0) = (−½ log 2π)/(−½) = log 2π`, so `c_ℚ = −1.8379`; trivial term `−½ log(1 − x^{−2})`, which is Davenport's formula | sound | none |
| 8.3 Check `ℚ(√5)` | `L(0, χ₅)`; residue | `L(0, χ₅) = −∑ χ₅(a)(a/5 − ½) = 0`, a simple zero, so the order is `1 = r₁ + r₂ − 1`; `(−1/s + c_K)(1 + s log x)/s` has residue `c_K − log x` | sound | none |
| 8.3 Check `ℚ(i)` | `ζ_K(0)`; `x = 2, 3` | `L(0, χ₋₄) = ½`, `ζ_K(0) = −¼ = −hR/w`; `−½ log(1 − x^{−2}) + ½ log((x+1)/(x−1))` is `0.693147 = log 2` at `x = 2` and `0.405465 = log 1.5` at `x = 3`, matching `−log(1 − 1/x)` | sound | none |
| 8.5 (new assembly text) | `x = e^{100}`, `T = exp(√log x) = e^{10}` | `2 ≤ T ≤ x` holds; the region gives `x^β ≤ x exp(−c log x/log(T + 3)) = x exp(−c · 10.000) = x exp(−c√log x)`; `∑ m_ρ/‖ρ‖ = O(log² T) = O(log x)`, absorbed by shrinking `c`; truncation `x log x log(xT)/T = x log² x e^{−√log x}·O(1) = o(x e^{−c√log x})` for `c < 1` | sound | none |
| 8.6 (new locator text) | `K = ℚ`, odd `χ` | Trivial zeros at `−1, −3, …` give `½ log((x+1)/(x−1))`, and `ψ_{ℚ(i)} = ψ + ψ(·, χ₋₄)` reproduces the `ℚ(i)` Check; Davenport §§19–20 cover `ψ(x, χ)` and progressions | sound | none |
| `OrderLE` (r12) | `1/Γ` along `−n−½`; `exp z²` | `log‖1/Γ(−n−½)‖/n` is `1.44`, `3.63`, `5.91` at `n = 10, 100, 1000`; `exp(r²)/exp(r^{1.5}) → ∞` | sound | none |
| `zetaEntireCompletion` (r12) | `s = 0, 1, 2` | `1`, `1`, `1.04720 = 2·π/6` | sound | none |
| 1.1, 1.2, 1.3 (r12) | `δ = π/4`; §5.11(ii) at `n = 1` | log-Gamma at `3` is `log 2 = 0.6931`; remainder `≤ 1/(12 sin²(δ/2)|z|)` | sound | none |
| 1.4a `ζ` symmetric form (r12) | `s = 2`; `s = −2`; `ψ(i)` | both sides `1.41509`; junk `0` gives `−0.1648` against `0.5541`; `Im ψ(i) = 2.0767` | sound | none |
| 1.5 (r12) | `gammaR = {μ}`, `gammaC = {ν}` | rates `π|t|/4`, `π|t|/2`; total `πn/4` | sound | none |
| 3.1, 3.4 (r12) | `R = 0`; `δ = 0.1` | `E₁(1) = 0.2194`; exponents `0.6`, `0.3`, `0` | sound | none |
| `dirichletLFunction_convexity` (r12) | `q = 1`; `χ₋₄`, `t = 0` | `1.46035 ≤ C·3^{¼+ε}`; `0.66769 ≤ C·12^{¼+ε}` | sound | none |
| `hadamard_of_orderLE_one`, `zetaEntireCompletion_hadamard` (r12) | `1 − s`; `cos z`; `1/Γ(z+1)`; `s = 0` | `(a, b) = (0, −1)`; `b = γ = 0.5772`; `1 = exp A` | sound | none |
| 5.2 (r12) | `z = −½` | `‖E₁ − 1‖ = 0.0902 ≤ ⅛` | sound | none |
| `riemannZeta_zeros_summable_ordinate` (r12) | `ρ₁` | `2/(1 + 14.1347²) = 0.009961` | sound | none |
| `riemannZeta_zeroFreeRegion`, `dirichletLFunction_zeroFreeRegion` (r12) | `σ < 1`; principal character mod 2 | `ζ(σ) < 0`; cap `0.693 > 0`; zeros at `±9.06i` enter only if `c ≥ 3.18` | sound | none |
| `neg_re_logDeriv_riemannZeta_le`, 6.4d (r12) | `t = 0.01`; `δ = u = 1` | `Re 1/(δ+2it) = 25.0` against `C log 0.01 < 0`; `0.5 = 1/(2|u|)` | sound | none |
| 6.5, 7.3 (r12) | odd `χ` mod 4 at `1`; `T → 0⁺` | `0.5`, order `0`; `S → −1` | sound | none |
| `riemannVonMangoldt`, `riemannVonMangoldt_dirichlet` (r12) | `T = 2, 14, 100`; `q = 1` | `−0.683`, `−0.443`, `28.127` against `N = 0, 0, 29`; `56.255` against `58` | sound | R04 (locator) |
| 7.5 confinement, 7.6 (r12) | `ζ(s)(1 + 5·2^{−s} + 2·4^{−s})` | zeros at `σ = 2.19, −1.19` | sound | none |
| `chebyshevPsi_explicitFormula` (r12) | `x = 20, T = 10` | `19.2657` against `18.1634`, a difference `1.102 ≤ C·17.95` | sound | none |
| `riemannZeta_weilExplicitFormula`, 8.4 (r12) | `φ = 0`; `φ` supported in `(0.4, 0.6)` | both sides `0`; prime side `Λ(2)φ(½)/2`; `log|d_K| φ(1)` | sound | none |
| `primeIdealCount_effective`, `primeCounting_progression_effective`, 8.7 (r12) | `K = ℚ`; `q = 4, a = 3`; `ℚ(√−5)` | count `π(x)`, `Li 2 = 0`; main term `Li x/2`; `p ≡ 1, 9 (mod 20)` | sound | none |
| R01 statements | `ψ = 1`; elaborated at this head | pole order `−1` is not positive; `s = 0 ∉ Ioo 0 1`; 4 `sorry` warnings and no error; `heckeLFunctionC` is the canonical continuation (junk `0` only if none exists, and one does) | can be stated | R01 |

**Duplication and ownership.** The diff adds no new object: only locators, route text and Checks. No ownership question arises from the change.

- `roadmaps overlaps` reports only #1907 (R06). No cited id is dropped, and none is defined only by an open revision.
- The closest roadmaps (#1954, #1126, #1944, #2008, #1945) are later in the merge order and cite this roadmap, as the previous review found.

**Remarks on untouched text (no change requested).**

- The manifest's `dlmf5` entry records only the §5.11 page. The README now also cites 5.6.6 on the §5.6 page, which I fetched from the legal (institutional) DLMF site. The manifest is outside the pull request.
- 5.6's second clause is narrower than Davenport §12. That is intended: the non-real case is proved in 6.4d (lines 1271–1276).

## Not verifiable

- **Paywalled sources.** These are cited by locator only, and I did not read them. Their statements were checked mathematically in the table:
  - Davenport §§12, 15–20 (5.6, 8.3, 8.5 and 8.6 at `ℚ`);
  - Titchmarsh Theorem 9.2 (4.5);
  - Lang XVII §3;
  - Iwaniec–Kowalski §5.
- The published versions of Bennett et al. (Math. Comp. 90, 2021) and Hasanalizade–Shen–Wong (Math. Comp. 91, 2022) are paywalled. I read arXiv v1 and v3. The numbers Corollary 1.2 and Theorem 1.1 are taken from those versions.
- `kadiri2012` is arXiv v1. I did not check that its §2.1.2 numbering matches the IJNT version.

## Source issues

- **Gap** in trudgian2015 at Theorems 1–2 and §3.1 (pp. 1, 6): the source says one parameter inequality in the Backlund-trick step is implied by the others, so it need not be checked; it should be: every parameter inequality checked, as in the corrected proofs; affects a stated result; corrected in print at Bennett–Martin–O'Bryant–Rechnitzer, Math. Comp. 90 (2021), Theorem 1.1 and Corollary 1.2 (Theorem 1), and Hasanalizade–Shen–Wong, Math. Comp. 91 (2022), Theorem 1.1 (Theorem 2).
