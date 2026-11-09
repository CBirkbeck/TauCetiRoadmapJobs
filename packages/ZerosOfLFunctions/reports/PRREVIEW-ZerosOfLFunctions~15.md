# Review of ZerosOfLFunctions (pull request #1913 at 9d45d17)

**Verdict:** needs changes

This is an incremental re-review of the 14 README lines changed since `d683eab`. `Suggested.lean` has a 0-line diff. The change repairs previous R05: 4.3's *Needs:* line and the 4.3 clause of "From Mathlib" now credit `g c = a` to `AnalyticAt.meromorphicTrailingCoeffAt_of_ne_zero_of_eq_nhdsNE`, and a Lean probe confirms the step. The repair introduces no new problem. Previous R01–R04 and R06 are untouched by the diff and are carried below as R01–R05. No repair report marks any of them "not actionable".

## R01 (P2) — Headline theorems that can be stated at the pinned Tau Ceti are absent, and the docstring says they cannot be stated (previous R01, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean`, lines 28–40: "neither library has its continuation to `ℂ`, its completion, or the L-function of a Hecke character" and "the Tau Ceti revision this file is built against supplies none of them".

**Claim.** The general-`K` forms of the end theorems 6.2–6.4, 7.5, 8.7 and 8.8 cannot be stated at the pins, so only their `K = ℚ` instances are stated.

**Witness.** Tau Ceti `2fd255d9` declares `heckeLFunctionC` (`LFunctions/Hecke/Basic.lean:74`), `PrimitiveRayClassCharacter` (`Hecke/Primitive.lean:91`), `RayClassGroup` (`Global/RayClass/Basic.lean:130`), `artinSymbol` (`ArtinSymbol.lean:57`) and `frobeniusPrimeCount` (`PrimeCounting/VonMangoldt.lean:177`). The four statements below elaborate at this head.

**Repair.**

1. Add the four imports and the four statements below to `Suggested.lean`, under Layer comments, and name each in the README at 6.4, 7.5, 8.7 and 8.8. The trivial character `(1 : PrimitiveRayClassCharacter K)` is the `ζ_K` case. The open strip `Ioo 0 1` gives the same count as the closed strip, by 6.5.
2. Rewrite the docstring's "Not statable" paragraph so that it names only what the pin still lacks: the completions (`completedDedekindZeta`, `completedHeckeLFunction`, `heckeData`), and with them the exceptional-zero terms of 8.5–8.8.
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

**Test.** I made a scratch copy of `Suggested.lean` at this head with these four imports and statements added, and ran it through `lake env lean`. It gave 17 "declaration uses `sorry`" warnings (the file's 13 and these 4) and no error in them. At `ψ = 1` the pole at `1` has order `−1`, which is not positive, so it is not counted as a zero.

## R02 (P3) — The supplier contracts list LFunctions objects under names the Tau Ceti pin does not have, and cite one lemma under two names (previous R02, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`. The diff added one line before line 170, so the numbers are one higher than in the previous report.

- lines 263–271, under "From TauCetiRoadmap.LFunctions", e.g. "`AnalyticLFunctionData.hasFunctionalEquation_eventuallyEq`";
- lines 118, 359, 639, 646–647, 652 and 1394: the same names in the body;
- lines 64, 221 and 241: "roadmap contracts".

**Claim.** These LFunctions Layer 0 objects are roadmap contracts that are not declarations of the pin. Meanwhile 1.4a and 5.6a cite the same germ equation by its pin name.

**Witness.** The pin declares `HasFunctionalEquation.eventuallyEq` (`LFunctions/Data/Basic.lean:269`). The `HasMeromorphicContinuation` fields (`:183–187`) are `meromorphic`, `meromorphicOrderAt_eq` and `analyticAt`. `roadmaps resolve` finds `regular_away`, `reflectedPoint`, `dualCompleted` and `hasFunctionalEquation_eventuallyEq` nowhere.

**Repair.**

1. Under "From Tau Ceti", list the pinned LFunctions Layer 0 declarations with their file `NumberTheory/LFunctions/Data/Basic.lean`:
   - `AnalyticLFunctionData`, `degree`, `gammaFactor`, `dual`;
   - `HasDirichletAgreement`, `HasMeromorphicContinuation` and `HasFunctionalEquation` with their pin fields;
   - `HasFunctionalEquation.eventuallyEq`, `HasDirichletAgreement.dual`, `HasMeromorphicContinuation.dual`, `gammaFactor_dual`, `dual_completed`.
2. Rename every occurrence to the pin's name:

   | README name | Pin name (`Data/Basic.lean`) |
   | --- | --- |
   | `hasFunctionalEquation_eventuallyEq` (lines 269, 646, 652) | `HasFunctionalEquation.eventuallyEq` (`:269`) |
   | `regular_away` (lines 118, 266, 639, 1394) | `analyticAt` (`:187`) |
   | `exact_pole_order` (lines 266, 359) | `meromorphicOrderAt_eq` (`:185`) |
   | `completes` | `completed_eq` (`:177`) |
   | `eq_away` | `completed_eq` (`:196`) |
   | `polarOrder_reflect` | `polarOrder_one_sub_conj` (`:195`) |
   | `dual_gammaFactor` | `gammaFactor_dual` (`:168`) |
   | `dualCompleted` | `dual_completed` (`:147`) |
   | `dual_hasDirichletAgreement` | `HasDirichletAgreement.dual` (`:202`) |
   | `dual_hasMeromorphicContinuation` | `HasMeromorphicContinuation.dual` (`:217`) |
   | `reflectedPoint s` | `1 − conj s` |

3. Delete these three phrases:
   - "these are roadmap contracts, including when absent from the library pin" (line 64);
   - "rather than declarations of the Tau Ceti pin" (line 221);
   - "These are roadmap contracts" (line 241).

**Test.** A grep of the README for `hasFunctionalEquation_eventuallyEq|regular_away|exact_pole_order|reflectedPoint` finds nothing, and `roadmaps resolve` no longer reports the six `AnalyticLFunctionData.*` leads.

## R03 (P3) — `TauCeti.Contour.IsPiecewiseC1On` does not exist at the pin (previous R03, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- line 206: "contour integration (`Analysis/Contour/`): `TauCeti.Contour.IsPiecewiseC1On`";
- line 1364, the first API bullet of 7.1;
- line 1371, the *Needs:* line of 7.1.

**Claim.** The pin declares the piecewise-`C¹` predicate under this name, in the contour folder.

**Witness.** In a scratch file at this head that imports `TauCeti.Analysis.Calculus.ContDiff.PiecewiseC1On`, `#check @TauCeti.Contour.IsPiecewiseC1On` gives "Unknown identifier". `#check @TauCeti.IsPiecewiseC1On` elaborates; it is declared in `Analysis/Calculus/ContDiff/PiecewiseC1On.lean:91`, in namespace `TauCeti`.

**Repair.** Replace the three occurrences with `TauCeti.IsPiecewiseC1On`, and give its file `Analysis/Calculus/ContDiff/PiecewiseC1On.lean` in the contract.

**Test.** The `#check` of the renamed predicate elaborates with type `(ℝ → E) → ℝ → ℝ → Prop`.

## R04 (P3) — The Trudgian theorems cited for 7.5 have a published gap; cite the corrected statements (previous R04, not repaired)

**Location.**

- `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 1458–1459: "(Trudgian, Theorem 1, for `χ` nonprincipal, with absolute constants; Theorem 2 is the Dedekind case; Davenport §16)";
- the References, lines 1914–1918;
- `Suggested.lean`, line 177.

**Claim.** Trudgian's Theorems 1 and 2 are the source of the conductor-uniform counts with absolute constants. They are the only source cited for the Dedekind case.

**Witness.** `bennett2021` lines 73–76: Trudgian wrongly argued one parameter inequality redundant, leaving his Theorems 1 and 2 unproved. `hasanalizade2022` lines 83–85 repair the same error for the Dedekind count.

**Repair.** Cite the corrected statements and keep Trudgian as the earlier one. Add both papers to the References with their arXiv ids; the manifest already has the keys `bennett2021` and `hasanalizade2022`.

- For the Dirichlet count: Bennett–Martin–O'Bryant–Rechnitzer, Math. Comp. 90 (2021), Corollary 1.2 (`bennett2021` lines 83–84), for `q > 1` and `T ≥ 5/7`.
- For the Dedekind count: Hasanalizade–Shen–Wong, Math. Comp. 91 (2022), Theorem 1.1 (`hasanalizade2022` lines 52–54), for `T ≥ 1`.

**Test.** The README statements, with existential constants, stay as they are. At `q = 1` and `T = 100`, the main term `56.255` against `N±(100) = 58` is within `C log 100`.

## R05 (P3) — The pull request's title, description and stated merge order are stale, and no order is stated against #1907 (previous R06, not repaired)

**Location.** The pull request's title and description (data):

- the title: "effective statements under the exclusion of Landau–Siegel zeros";
- the description: "Merge order: after AnalyticNumberTheoryPartI (#1126) lands, since the strengthened statements refer to its §0.34."

**Claim.** The pull request restates the roadmap in exception-free form, and it depends on AnalyticNumberTheoryPartI.

**Witness.** README line 1233 still defines *IsExceptionalZero*, and the Downstream consumers section (line 1861 on) makes AnalyticNumberTheoryPartI a consumer. `ORDER.txt` puts this roadmap at line 48 and AnalyticNumberTheoryPartI at line 50. `roadmaps overlaps` reports #1907 conflicting in both files.

**Repair.**

1. Retitle the pull request.
2. Rewrite the description so that it describes this head:
   - targets 1.3a, 1.4a, 5.6a and 6.4d;
   - the two `ζ` lemmas in `Suggested.lean`;
   - the provenance table;
   - the pin-name and locator repairs.
3. Delete the "after AnalyticNumberTheoryPartI" paragraph.
4. State that whichever of #1913 and #1907 merges second is rebased on the other.

**Test.** The new text agrees with README line 1233, the Downstream consumers section, and `ORDER.txt` lines 48–50.

## Previous findings

- R01 — not repaired: `Suggested.lean` has a 0-line diff since `d683eab`. Lines 28–40 still say "the Tau Ceti revision this file is built against supplies none of them". It is carried as R01.
- R02 — not repaired: lines 64, 118, 221, 241, 263–271, 359, 639, 646–647, 652 and 1394 are unchanged apart from the one-line shift. Line 269 still reads "`AnalyticLFunctionData.hasFunctionalEquation_eventuallyEq`". It is carried as R02.
- R03 — not repaired: lines 206, 1364 and 1371 still read `TauCeti.Contour.IsPiecewiseC1On`. It is carried as R03.
- R04 — not repaired: line 1458 still reads "(Trudgian, Theorem 1, for `χ` nonprincipal, with absolute constants; Theorem 2 is the Dedekind case". It is carried as R04.
- R05 — repaired: 4.3's *Needs:* line (lines 949–953) now reads "`AnalyticAt.analyticOrderAt_eq_natCast` (… near `c`, with `g` analytic at `c` and `g c ≠ 0`), `AnalyticAt.meromorphicTrailingCoeffAt_of_ne_zero_of_eq_nhdsNE` (`g c = a`)". The "From Mathlib" clause (lines 165–170) adds the same name. The repair introduced no new problem.
- R06 — not repaired: the title and description quoted above are unchanged. It is carried as R05.

## Verified sound

**Gate and dependency check.**

- My run of `gate … ZerosOfLFunctions --base origin/main` printed every check at 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, and exited 0. The worker's gate, which includes `build=0`, also passes.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'` is empty.
- The dependency check printed the following and exited 0, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 239 roadmaps, 2322 edges, 0 problem(s)
```

- In `ORDER.txt`, LFunctions is at line 27, this roadmap at 48 and AnalyticNumberTheoryPartI at 50.

**Elaboration.**

- `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 with exactly 13 "declaration uses `sorry`" warnings and nothing else.
- The file is unchanged since `d683eab`. `lake-manifest.json` is unchanged too, so the pins are still Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`.
- The 16 elaborated types in `signatures.md` are those the previous review compared with the README. The file has no `variable` block, so no binder is lost. I changed nothing.
- The one-tactic probe from earlier rounds still holds for the unchanged file: none of the 13 statements closes in one tactic, so there is no padding.

**The changed passages: 4.3's *Needs:* line and the 4.3 clause of "From Mathlib".**

I checked each name with `#check` at the pin and read its source line:

- `AnalyticAt.meromorphicTrailingCoeffAt_of_ne_zero_of_eq_nhdsNE` (`Meromorphic/TrailingCoefficient.lean:92`). For `n : ℤ`, `AnalyticAt 𝕜 g x`, `g x ≠ 0` and `f =ᶠ[𝓝[≠] x] (z − x)^n • g z`, it gives `meromorphicTrailingCoeffAt f x = g x`. That is the `g c = a` the line credits to it.
- `AnalyticAt.analyticOrderAt_eq_natCast` (`Analytic/Order.lean:92`). For `f` analytic at `z₀`, `analyticOrderAt f z₀ = n` is equivalent to having some `g` with `AnalyticAt`, `g z₀ ≠ 0` and `f z = (z − z₀)^n • g z` eventually in `𝓝 z₀`. This is the new parenthetical "near `c`, with `g` analytic at `c` and `g c ≠ 0`", word for word.
- `Complex.norm_le_of_forall_mem_frontier_norm_le` (`Complex/AbsMax.lean:404`) needs `IsBounded U` and `DiffContOnCl ℂ f U`.
- `frontier_ball` (`Normed/Module/RCLike/Real.lean:72`) needs `r ≠ 0`.
- `AnalyticOnNhd.sum_divisor_le` (`Complex/JensenFormula.lean:389`) needs `1 ≤ M` and `f c ≠ 0`.

I also ran a Lean probe in a scratch file. It elaborates with no error, only an unused-`simp`-argument lint.

- From `analyticOrderAt f c = m` it takes the factor `g`.
- It passes from `𝓝` to `𝓝[≠]` with `nhdsWithin_le_nhds` and from `ℕ` to `ℤ` exponents with `zpow_natCast`.
- It applies the trailing-coefficient lemma to get `g c = meromorphicTrailingCoeffAt f c`.
- A second example proves `meromorphicTrailingCoeffAt (z ↦ z/10) 0 = 1/10`, the value the Check at line 960 uses.

The two route inputs therefore compose as the line says. No other passage cites the changed text in a way the change affects. 4.4 (line 981), 5.1 (lines 1044–1048), 5.2 (line 1075) and 5.3–5.6 (line 1181) cite 4.3's statements, and those statements are unchanged.

**Sources: the seeded sample where it meets the change.** The change touches only 4.3, which has no external locator: its route is entirely through Mathlib declarations, all checked above.

The 15 sampled targets are 1.1, 1.2, 1.3, 1.5, 3.2, 3.5, 4.1, 4.2, 4.5, 5.2, 5.6, 5.6a, 6.2, 7.4 and 7.5. All are untouched by the diff. Their locators were checked in earlier rounds, and the rows below carry those checks.

For R04, I re-read `bennett2021` lines 70–85 and `hasanalizade2022` lines 50–55 and 82–87. They still confirm the published gap and the corrected statements. The README flags no locator as unverified.

**Adversarial table.** Rows marked "r14" are carried from PRREVIEW-ZerosOfLFunctions~14 for statements this diff leaves untouched. Rows marked "r13", "r7" or "r3" were carried into r14 from those reports. The first three rows cover the changed lines and are recomputed here.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 4.3 trailing form, new *Needs:* (`g c = a` via the trailing-coefficient lemma) | `z/10`, `c = 0`, `r = 1`, `R = 2`, `M = 1`; `z³`, `r = ¼`, `R = ½`, `M = ⅛`; `z²(1 + z)`, `r = ¼`, `R = ½`, `M = 3/8` | `z/10`: `m = 1`, `g = a = 1/10` (Lean probe), bound `1 + (log 10 − log 2)/log 2 = 3.3219 ≥ 1`. `z³`: `3 + (log ⅛ − 3 log ½)/log 2 = 3.0000`, against a true count of `3`. `z²(1 + z)`: `m = 2`, `a = g(0) = 1`, `2 + (−0.98083 + 1.38629)/0.69315 = 2.585`, against a true count of `2` (the zero `−1` lies outside) | sound | none (R05 repaired) |
| 4.3, the factorization's `ℕ` exponent and `𝓝` filter against the lemma's `ℤ` exponent and `𝓝[≠]` filter | Lean probe | `(z − c)^m = (z − c)^(m : ℤ)` by `zpow_natCast`, and `𝓝[≠] c ≤ 𝓝 c`. The composite elaborates | sound | none |
| "From Mathlib", 4.3 clause (one new name) | `#check` at the pin | `AnalyticAt.meromorphicTrailingCoeffAt_of_ne_zero_of_eq_nhdsNE` elaborates under the README's qualified name. The wrong reading `a = f c` gives `0` for `z/10`, which the lemma's `g c ≠ 0` excludes | sound | none |
| 4.3 first form, `M = 0` (r14) | `f = 0` on `sphere c R` | maximum principle gives `f = 0` on the closed ball, order `⊤` | sound | none |
| 1.4a symmetric form (r14) | `s = 2`; `s = −2`; `s = 0, 1` | `1.415093 = 1.415093`; `logDeriv Λ(2) = −1.430934 = −logDeriv Λ(−1)`; `Γℝ(−2) = 0` excluded by `ζ(s) ≠ 0` | sound | none |
| 5.6a comparison (r14) | `ρ = 0, 1, ½ + 14.134725i, 2` | `4 ≤ 4`, `1 ≤ 4`, `202.04 ≤ 803.16`; at `ρ = 2`, `m₂ = 0` | sound | none |
| 8.3 *Needs:* with 8.1 (r14) | `K = ℚ` | `c_ℚ = −log 2π = −1.837877` | sound | none |
| 8.6 *Needs:* 8.1–8.5 (r14) | `K = ℚ`, odd `χ`, `x = 3` | trivial-zero term `½ log 2 = 0.346574` | sound | none |
| 1.3a (r13) | `½ + i`; `3/2 + i`; `Re s = −½` | `0.271015 ≤ π`; `0.58204 ≤ 0.88623`; `Real.Gamma(−½) = −3.5449 < 0` | sound | none |
| 1.4a general records (r13) | `ζ` record at `s = 2` | `−1.430934 = −logDeriv Λ(−1)`; without the minus sign it fails by `2.8619` | sound | none |
| 4.3 first form (r13) | `1 − z/2`, `r = 1`, `R = 3/2`, `M = 2` | count `0 ≤ 1.7095` | sound | none |
| 4.1 counts (r13) | `z(z − 1)`; `z/(z − 1)`; `f = 0` | `2`; zero count `1` against *divisorCount* `0`; `0` | sound | none |
| 4.6 Nevanlinna comparison (r7) | `z`, `1/z`, `z²` | `n(r) = 1`, `log r`; `0` against `−log r`; `2`, `2 log r` | sound | none |
| 5.6 (r13) | `ζ`; `f·e^{cs}` | `Re B = −0.02310 = −∑ Re 1/ρ`; `e^{cs}` shifts `b` by `c` | sound | none |
| 5.6a route (r13) | zeros of `riemannZeta` against those of `Λ` | trivial zeros give summand `1` and diverge | sound | none |
| 7.1 (r3) | unit square at `½ + i/2` and at `2`; width `0` | windings `1` and `0`; clockwise `−1`; retraced `0` | sound | R03 (name) |
| 7.2 (r3) | `z`, `z − 2`, `1/z` on `[−1, 1]²` | `1`, `0`, `−1` | sound | none |
| 8.1 (r3) | `x = c = T = 1` | `arctan(1)/π = 0.25` | sound | none |
| 8.2 (r3) | `ζ` at `1`; zero `ρ`; origin, unit rank `r` | `+x`; `−x^ρ/ρ`; `c_K − r log x` | sound | none |
| 8.3 Checks (r13) | `ℚ`; `ℚ(√5)`; `ℚ(i)`, `x = 2, 3` | `−1.8379`; `L(0, χ₅) = 0`; `log 2`, `log 1.5` | sound | none |
| 8.5 (r13) | `x = e^{100}`, `T = e^{10}` | `x^β ≤ x exp(−10c)`; `∑ m_ρ/‖ρ‖ = O(log x)` | sound | none |
| 8.8 (r3) | `C₄ → C₂`; abelian against `S₃` | fibre density `1/2`; commutators force an abelian image | sound | R01 (Lean) |
| 8.9 (r7) | `x = 2`; `x = 10⁶` | `Li 2 = 0`; `6244` against `5997` | sound | none |
| `OrderLE`, `zetaEntireCompletion` (r13) | `1/Γ` along `−n − ½`; `s = 0, 1, 2` | `1.44, 3.63, 5.91`; values `1, 1, 1.04720` | sound | none |
| 1.1–1.3, 1.5 (r13) | `δ = π/4`; `gammaR = {μ}` | log-Gamma at `3` is `0.6931`; rates `π|t|/4`, `π|t|/2` | sound | none |
| 3.1, 3.2, 3.4, 3.5, `dirichletLFunction_convexity` (r13) | `R = 0`; `q = 1`; `χ₋₄`, `t = 0` | `E₁(1) = 0.2194`; `1.46035 ≤ C·3^{¼+ε}`; `0.66769 ≤ C·12^{¼+ε}` | sound | none |
| `hadamard_of_orderLE_one`, `zetaEntireCompletion_hadamard`, 5.2, 5.3 (r13) | `1 − s`; `cos z`; `s = 0` | `(a, b) = (0, −1)`; `b = 0.5772`; `1 = exp A` | sound | none |
| `riemannZeta_zeros_summable_ordinate` (r13) | `ρ₁` | `2/(1 + 14.1347²) = 0.009961` | sound | none |
| `riemannZeta_zeroFreeRegion`, `dirichletLFunction_zeroFreeRegion`, 6.2 (r13) | `σ < 1`; principal character mod 2 | `ζ(σ) < 0`; cap `0.693 > 0`; zeros at `±9.06i` enter only if `c ≥ 3.18` | sound | R01 (general `K`) |
| `neg_re_logDeriv_riemannZeta_le`, 6.4d (r13) | `t = 0.01`; `δ = u = 1` | `25.0` against `C log 0.01 < 0`; `0.5 = 1/(2|u|)` | sound | none |
| 6.5, 7.3 (r13) | odd `χ` mod 4 at `1`; `T → 0⁺` | `0.5`, order `0`; `S → −1` | sound | none |
| `riemannVonMangoldt`, `riemannVonMangoldt_dirichlet`, 7.4, 7.5 (r13) | `T = 2, 14, 100`; `q = 1` | `−0.683`, `−0.443`, `28.127` against `N = 0, 0, 29`; `56.255` against `58` | sound | R04 (locator) |
| `chebyshevPsi_explicitFormula` (r13) | `x = 20`, `T = 10` | `19.2657` against `18.1634`, difference `1.102 ≤ C·17.95` | sound | none |
| `riemannZeta_weilExplicitFormula`, 8.4 (r13) | `φ = 0`; `φ` supported in `(0.4, 0.6)` | both sides `0`; prime side `Λ(2)φ(½)/2` | sound | none |
| `primeIdealCount_effective`, `primeCounting_progression_effective`, 8.7 (r13) | `K = ℚ`; `q = 4, a = 3`; `ℚ(√−5)` | `π(x)`, `Li 2 = 0`; `Li x/2`; `p ≡ 1, 9 (mod 20)` | sound | R01 (general `K`) |
| R01 statements (this head) | `ψ = 1`; elaborated | pole order `−1` is not positive; `s = 0 ∉ Ioo 0 1`; 17 `sorry` warnings (13 + 4) and no error in them | can be stated | R01 |

**Duplication and ownership.** The diff adds no object, only a supplier name to a *Needs:* line and a contract clause, so no ownership question arises from it.

- `roadmaps overlaps` reports only #1907 (R05). No cited id is dropped by an open pull request, and none is defined only by an open revision.
- The closest roadmaps are #1954, #1126, #1944, #2008 and #1945. As earlier rounds found, they come later in the merge order and cite this roadmap.
- The 20 leads of `citations.md` fall into three groups, all untouched by this diff:
  - the R02 names;
  - the provenance-table names (README lines 1887–1890), which are pinned to an external commit;
  - the LFunctions Layer 6 names (lines 300–303). These are declared in LFunctions `Suggested.lean` on main, e.g. `heckeMellinTotal` at line 2390 and `heckeMellinTotal_sub_const_isBigO` at line 2432.

## Not verifiable

- **Paywalled sources.** These are cited by locator only, and I did not read them. Their statements were checked mathematically in the table:
  - Davenport §§11–20;
  - Titchmarsh Theorem 9.2 (4.5);
  - Lang XVII §3;
  - Iwaniec–Kowalski §5.
- The published versions of Bennett et al. (Math. Comp. 90, 2021) and Hasanalizade–Shen–Wong (Math. Comp. 91, 2022) are paywalled. The numbers Corollary 1.2 and Theorem 1.1 are taken from the arXiv versions in the cache.
- Ownership against open pull requests was checked through `roadmaps overlaps` and in earlier rounds. The diff adds no object, so I did not repeat the full search.

## Source issues

- **Gap** in trudgian2015 at Theorems 1–2 and §3.1 (pp. 1, 6): the source says one parameter inequality in the Backlund-trick step follows from the others, so it is never checked; it should be: every parameter inequality checked, as in the corrected proofs; affects a stated result; corrected in print at Bennett–Martin–O'Bryant–Rechnitzer, Math. Comp. 90 (2021), Theorem 1.1 and Corollary 1.2 (Theorem 1), and Hasanalizade–Shen–Wong, Math. Comp. 91 (2022), Theorem 1.1 (Theorem 2).
