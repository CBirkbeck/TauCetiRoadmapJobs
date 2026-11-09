# Review of ZerosOfLFunctions (pull request #1913 at f6187a0)

**Verdict:** needs changes

This is an incremental re-review of the 65 lines of the README changed since 9d45d17. `Suggested.lean`, the pins and every file outside the folder are unchanged. The head repairs three findings of the previous report: R01, R06 and R07. It leaves five unrepaired: R02, R03, R04, R05 and R08, carried below as R01–R05. The repairs introduce no new problem. There is no repair report, so no finding is settled as "not actionable".

## R01 (P2) — Headline theorems that can be stated at the pinned Tau Ceti are absent, and the docstring says they cannot be (previous R02, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean`, lines 28–44, which say "neither library has its continuation to `ℂ`, its completion, or the L-function of a Hecke character" and "the Tau Ceti revision this file is built against supplies none of them".

**Claim.** The file claims that the general-`K` forms of 6.2–6.4, 7.5, 8.7 and 8.8 cannot be stated at the pins, and states only their `K = ℚ` instances.

**Witness.** Tau Ceti `2fd255d9` declares:

- `heckeLFunctionC` (`NumberTheory/LFunctions/Hecke/Basic.lean:74`);
- `PrimitiveRayClassCharacter` (`Hecke/Primitive.lean:91`);
- `RayClassGroup` (`NumberField/Global/RayClass/Basic.lean:130`);
- `frobeniusPrimeCount` (`Chebotarev/PrimeCounting/VonMangoldt.lean:177`).

The open head of #1907 states these headlines in its `Suggested.lean`, lines 142–367.

**Repair.** Take one of two routes.

1. **Rebase on #1907.** Keep its statements `dedekindZeta_zeroFreeRegion`, `heckeLFunction_zeroFreeRegion`, `riemannVonMangoldt_dedekindZeta`, `riemannVonMangoldt_heckeLFunction`, `rayClassPrimeCount_effective` and `frobeniusPrimeCount_effective_abelian`, and keep its docstring paragraph. Do not write a second version.
2. **Merge this pull request first.** Then make three changes:
   - Add the statements below under Layer comments, and name each one in the README at 6.4, 7.5, 8.7 and 8.8.
   - Replace lines 28–40 with a paragraph that names only what the pin lacks: `completedDedekindZeta`, `completedHeckeLFunction`, and the exceptional-zero terms of 8.5–8.8 that depend on them.
   - Correct lines 42–44. `AnalyticLFunctionData` is at the pin (`Data/Basic.lean:82`), so the statements of Layers 0–2, 4, 7.1–7.3 and 9 are left out because they are lemmas, not because a carrier is missing.

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

**Test.** The previous round elaborated these four statements at this pin: 4 `sorry` warnings and no error. `lake-manifest.json` is unchanged since 9d45d17. Three checks:

- At `ψ = 1`, the pole at `1` has order `−1`, which is not positive, so it is not counted.
- For `ℚ(√5)`, the trivial zero at `0` lies outside `Ioo 0 1`.
- At `K = ℚ` and `T = 100`, the count is `58` against the main term `56.255`.

## R02 (P3) — The supplier contracts cite pinned objects under the LFunctions roadmap's names (previous R03, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- lines 265–273 (for example "`AnalyticLFunctionData.hasFunctionalEquation_eventuallyEq`");
- lines 118, 362, 642, 649–650, 655 and 1405 (`regular_away`, `exact_pole_order`, `reflectedPoint`);
- lines 293, 300, 1278, 1295 and 1325 (`PrimitiveRayClassCharacter.inv`);
- lines 64, 223 and 243 ("roadmap contracts").

**Claim.** The README says these are roadmap contracts that the Tau Ceti pin does not declare.

**Witness.** The pin declares these objects under other names: `HasFunctionalEquation.eventuallyEq` (`Data/Basic.lean:269`), `HasMeromorphicContinuation.analyticAt` (`:187`), `meromorphicOrderAt_eq` (`:185`), `completed_eq` (`:177`), and the `InvolutiveInv` instance for `PrimitiveRayClassCharacter` (`Hecke/Primitive.lean:192`). Lines 560, 1153 and 1160 already cite the pin name.

**Repair.**

1. Rename to the pin names, as the previous report's table lists:

   | README name | Pin name |
   | --- | --- |
   | `hasFunctionalEquation_eventuallyEq` | `HasFunctionalEquation.eventuallyEq` |
   | `regular_away` | `analyticAt` |
   | `exact_pole_order` | `meromorphicOrderAt_eq` |
   | `completes` | `completed_eq` |
   | `polarOrder_reflect` | `polarOrder_one_sub_conj` |
   | `dual_gammaFactor` | `gammaFactor_dual` |
   | `dualCompleted` | `dual_completed` |
   | `dual_hasDirichletAgreement` | `HasDirichletAgreement.dual` |
   | `dual_hasMeromorphicContinuation` | `HasMeromorphicContinuation.dual` |
   | `reflectedPoint s` | `1 − conj s` |
   | `PrimitiveRayClassCharacter.inv χ` | `χ⁻¹` |

2. Under "From Tau Ceti", list the pinned LFunctions files.
3. Delete the three "roadmap contracts" phrases at lines 64, 223 and 243.

**Test.** `#check` of each pin name elaborated in the previous round. Lines 185 and 187 of `Data/Basic.lean` show `meromorphicOrderAt_eq` and `analyticAt` at this pin. After the repair, a grep for `hasFunctionalEquation_eventuallyEq|regular_away|exact_pole_order|reflectedPoint|PrimitiveRayClassCharacter.inv` finds nothing.

## R03 (P3) — `TauCeti.Contour.IsPiecewiseC1On` does not exist at the pin (previous R04, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 208, 1375 and 1382, for example "contour integration (`Analysis/Contour/`): `TauCeti.Contour.IsPiecewiseC1On`".

**Claim.** The README says the pin declares the piecewise-`C¹` predicate under this name.

**Witness.** The pin declares `def IsPiecewiseC1On` inside `namespace TauCeti` (`Analysis/Calculus/ContDiff/PiecewiseC1On.lean:78`, `:91`). No declaration named `TauCeti.Contour.IsPiecewiseC1On` exists.

**Repair.** Replace the three occurrences with `TauCeti.IsPiecewiseC1On`, and give its file in the "From Tau Ceti" contract.

**Test.** `TauCeti.Contour.argumentPrinciple_nullHomologous` takes `IsPiecewiseC1On γ a b` in exactly this sense, so 7.2 composes with the renamed 7.1.

## R04 (P3) — The Trudgian theorems cited for 7.5 have a published gap (previous R05, not repaired)

**Location.**

- `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 1479–1480: "(Trudgian, Theorem 1, for `χ` nonprincipal, with absolute constants; Theorem 2 is the Dedekind case; Davenport §16)";
- the References, lines 1937–1941;
- `Suggested.lean`, line 177.

**Claim.** The README cites Trudgian's Theorems 1 and 2 as proved sources for the conductor-uniform counts.

**Witness.** `bennett2021` lines 73–76: Trudgian wrongly treated one parameter inequality as redundant, which leaves Theorems 1 and 2 incomplete. `hasanalizade2022` lines 40–41 and 83–85 repair the Dedekind case.

**Repair.**

1. Cite Bennett–Martin–O'Bryant–Rechnitzer, Corollary 1.2 (`bennett2021` lines 83–84; conductor `q > 1`, `T ≥ 5/7`) for the Dirichlet count.
2. Cite Hasanalizade–Shen–Wong, Corollary 1.2 (`hasanalizade2022` lines 63–65; `T ≥ 1`) for the Dedekind count.
3. Keep Trudgian as the earlier statement, and add both papers to the References with their arXiv ids.

**Test.** The README's form (an existential constant, `T ≥ 2`) follows from each corollary, since `n log T ≥ n log 2` absorbs `D₂ n + D₃`.

## R05 (P3) — The pull request's title, description and stated merge order are stale, with no order stated against #1907 (previous R08, not repaired)

**Location.** The pull request's title, "effective statements under the exclusion of Landau–Siegel zeros", and its description, "Merge order: after AnalyticNumberTheoryPartI (#1126) lands, since the strengthened statements refer to its §0.34."

**Claim.** The description says the pull request restates the roadmap in exception-free form and depends on AnalyticNumberTheoryPartI.

**Witness.**

- README lines 1895–1896 now keep "the exceptional-zero alternative of 6.3–6.4", and lines 83–86 exclude the nonexistence of exceptional zeros.
- `ORDER.txt` lists this roadmap at line 48 and AnalyticNumberTheoryPartI at line 50.
- `overlaps.md` reports that #1907 conflicts in both files.

**Repair.**

1. Retitle the pull request without the exclusion of Landau–Siegel zeros.
2. Describe this head.
3. Delete the "after AnalyticNumberTheoryPartI" sentence.
4. State which of this pull request and #1907 is rebased on the other before either merges.

**Test.** The new text then agrees with README lines 83–86 and 1895–1896, with `ORDER.txt` lines 48–50, and with R01.

## Previous findings

- R01 — repaired: lines 1895–1896 now read "AnalyticNumberTheoryPartI consumes Layers 0–8 as stated for a general field, the exceptional-zero alternative of 6.3–6.4 included."
- R02 — not repaired: `Suggested.lean` lines 38–40 still read "the Tau Ceti revision this file is built against supplies none of them". Carried as R01.
- R03 — not repaired: line 271 still reads "`AnalyticLFunctionData.hasFunctionalEquation_eventuallyEq`". Carried as R02.
- R04 — not repaired: lines 208, 1375 and 1382 still read `TauCeti.Contour.IsPiecewiseC1On`. Carried as R03.
- R05 — not repaired: line 1479 still reads "(Trudgian, Theorem 1, for `χ` nonprincipal, with absolute constants". Carried as R04.
- R06 — repaired: lines 1261–1270 cite Lagarias–Montgomery–Odlyzko, Lemma 2.3, via Kadiri §1 (1.5)–(1.6). They prove containment for `0 < c < 1/R₄` and assign reality and simplicity to (4c) and (4f). The References add the paper (lines 1948–1951).
- R07 — repaired: the *Needs:* lines of 7.4 (1467–1470), 7.5 (1492) and 8.4 (1609–1610) now name 5.6a, the Mathlib confinement lemmas, 1.4a and `completedDedekindZeta_one_sub`. Line 330 now says that Layer 9 needs 7.2 for its bridge.
- R08 — not repaired: the title still reads "effective statements under the exclusion of Landau–Siegel zeros". Carried as R05.

## Verified sound

**Gate and dependency check.**

- My run of `gate … ZerosOfLFunctions --base origin/main` printed every check at 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, and exited 0. The worker's gate, which includes `build=0`, also passes.
- `git diff --stat origin/main...HEAD` outside the folder is empty. `lake-manifest.json` and `lean-toolchain` are unchanged since 9d45d17 (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`).
- The dependency check exited 0, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 239 roadmaps, 2325 edges, 0 problem(s)
```

**Elaboration.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 with exactly 13 "declaration uses `sorry`" warnings. The file is unchanged since 9d45d17, so these carry over from the previous report:

- the comparison of the 16 elaborated types in `signatures.md` (no `variable` block, so no binder is lost);
- the one-tactic probe (no statement closes, so none is padding).

**Changed passages, against the pins.** A scratch file `#check`s the newly cited Mathlib names, and all elaborate:

- `Complex.Gammaℝ_ne_zero_of_re_pos` (`Analysis/SpecialFunctions/Gamma/Deligne.lean:69`, needs `0 < re s`);
- `differentiableAt_completedZeta` (`NumberTheory/LSeries/RiemannZeta.lean:94`, needs `s ≠ 0` and `s ≠ 1`);
- `completedRiemannZeta_one_sub` (`:106`);
- `riemannZeta_def_of_ne_zero` (`:154`, `ζ = Λ/Γℝ` for `s ≠ 0`);
- `riemannZeta_ne_zero_of_one_le_re` (`NumberTheory/LSeries/Nonvanishing.lean:417`);
- `mellinInv_mellin_eq`;
- `Summable.of_nonneg_of_le`.

Two `example`s in the same file prove that `completedRiemannZeta s ≠ 0` for `1 ≤ re s` and for `re s ≤ 0` from those lemmas. Both elaborate with no error, which confirms the direct confinement route of 7.4.

**Changed passages, against the README and its suppliers.**

- 5.6a's first clause (line 1142) is closed-strip confinement for the two families. Its *Needs:* line (5.3, 3.1, 1.5, 4.2, Layer 0) names no Layer 7 target, so 7.4 and 7.5 citing it makes no cycle.
- 1.4a (lines 557–563) supplies `Λ_K'/Λ_K(s) = −Λ_K'/Λ_K(1 − s)` for 8.4.
- `completedDedekindZeta_one_sub` is LFunctions `Suggested.lean:1046` on main `39d3d60`, stated in its README at line 827, inside Layer 3 (lines 730–859). It is in this README's LFunctions contract at line 285.
- Layer 9 Dependencies (line 1885) agree with the build paragraph (line 330).
- The Layer 7 and Layer 8 Dependencies cover every layer id in their *Needs:* lines.
- No sentence of the README implies a uniform lower bound for `1 − β`. A grep for `Landau|Siegel|0.34` finds only lines 83 and 86 (the scope exclusions) and line 1628.
- The consumer AnalyticNumberTheoryPartI still declares its own §0.34 (its README line 19, at #1126). That is for its own review; this README no longer describes it.

**Sources: the seeded sample, where it falls in changed passages.**

- **6.4.** `kadiri2012` lines 65–73 (§1, p. 2) report Lagarias–Montgomery–Odlyzko, Lemma 2.3: at most one zero in box (1.5), and region (1.6) over the whole strip, with `A(χ) = d_K N f(χ)` and `R₄` independent of `K`. Kadiri's reference [8] (lines 992–993) is Invent. Math. 54, pp. 271–296. This matches the README's References and the manifest's DOI `10.1007/BF01390234`.
- **5.6a.** It has no external locator. Its route input `HasFunctionalEquation.eventuallyEq` is at `Data/Basic.lean:269`.
- The other sampled targets (1.6, 3.1, 3.2, 3.5, 4.3, 5.1, 5.3, 5.4, 7.1, 7.2, 8.1, 8.3, 8.5) are untouched, and the previous report's checks of them stand.
- The README flags no locator as unverified.

**Overlaps and ownership.** `overlaps.md` shows that no id this README cites is dropped by an open pull request, and none is defined only by an open revision. The diff renames no heading. #1907 still conflicts (R01, R05). The change adds no owned object.

**Remarks on text that needs no change.**

- In 7.4's direct route, `Complex.Gammaℝ_ne_zero_of_re_pos` is not needed. `ζ = Λ/Γℝ` with `ζ ≠ 0` already forces `Λ ≠ 0`, and the Lean `example` above does not use it. Listing it is harmless.
- Line 1516 cites "2.2", an implicit label: Layer 2 has no numbered subsections, and 2.2 is its second bullet, the two-sided comparison. The use matches 6.4d and 7.5.
- The manifest entry `trudgian2015` gives the venue "no. 294, pp. 2047-2058". `bennett2021` lines 1149–1150 and `hasanalizade2022` line 786 give no. 293, 1439–1450, as README line 1938 does.

**Adversarial table.** Rows marked (r16) are carried from PRREVIEW-ZerosOfLFunctions~16 for statements the diff leaves untouched, with that report's values. The rows below the divider were computed this round, with a scratch Python script (Lanczos Γ, Euler–Maclaurin ζ) and the Lean scratch file.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 *logGamma* (r16) | `s = 3`; ray `arg s = π/2` | *logGamma* `3 = 0.693147`; phase of `Γ(10i)` `= 12.24 > 3π` | sound | none |
| 1.3a (r16) | `t = 0, 1, 3` | `‖Γ(½ + it)‖² = 3.141593, 0.271015, 0.000507 = π/cosh πt` | sound | none |
| 1.4a symmetric form (r16) | `s = 2`; `s = −2` | both sides `1.415093`; `−0.164823` vs `0.554120` (junk `0`s) | sound | R02 (names) |
| 3.1 (r16) | `E₁(1)`; `zetaEntireCompletion(20)` | `0.219384 ≤ e⁻¹`; `log 1472.47 = 7.29 ≤ 64.9C` | sound | none |
| 3.3 (r16) | `δ = 0.1, 0.5`, `t = 50…400` | offsets `−1.1027`, `−1.8379`, constant in `t` | sound | none |
| 3.4 (r16) | `σ = −δ, ½, 1 + δ` | exponents `½ + δ`, `¼ + δ/2`, `0` | sound | none |
| 3.5 (r16) | `‖Λ(2m + 2i)‖`, `m = 10, 20` | `3.6768`; `1.35197·10⁷` | sound | none |
| 4.3 (r16) | `z/10`, `r = 1`, `R = 2`; `z³`, `M = ⅛` | `3.3219 ≥ 1`; `3 = 3` | sound | none |
| 4.4 (r16) | `‖ζ(2 + iT)‖`, `T = 2, 10, 30` | `0.90994, 1.2006, 0.86859 ≥ 0.60793` | sound | none |
| 4.5 (r16) | `N(14)`, `N(15)`, `N±(100)` | `0`, `1`, `58` | sound | none |
| 5.2 (r16) | `z = −½` | `‖E₁ − 1‖ = 0.0902 ≤ 0.125` | sound | none |
| 5.6 (r16) | `ξ`; `e^(cs) f` | `B = −0.0230957 = −∑ Re 1/ρ`; `b` shifts by `c` | sound | none |
| 6.1 (r16) | `θ = 0, 2π/3, π` | `8, 0.5, 0 = 2(1 + cos θ)²` | sound | none |
| 6.2 cap (r16) | principal `χ` mod 2 | `c ≤ 0.549306`, `c/log 3 ≤ ½` | sound | none |
| 6.4 (4c), (4d) (r16) | `−ζ'/ζ(1.1)`, `−ζ'/ζ(1.01)` | `9.441`, `99.425` vs `1/u − γ = 9.423`, `99.423` | sound | none |
| 6.5 (r16) | odd `χ` mod 4 at `1` | `½`, order `0` | sound | none |
| 7.1 (r16) | unit square, both orientations | windings `1`, `0`, `−1` | sound | R03 (name) |
| 7.2 (r16) | `z − 2` on `[−1, 1]²` | integral `0`, `ord₂ = 1`, so the sum is over `S ∩ R` | sound | none |
| 7.5, `riemannVonMangoldt_dirichlet` (r16) | `q = 1`, `T = 100`; `χ₋₄`, `T = 10` | `58` vs `56.255`; `2` vs `2.709` | sound | R04 (locator) |
| 7.6 (r16) | `N(100)` | `0.0630` vs `0.0611`, tending to `0.1592` | sound | none |
| 8.1 (r16) | `T = c = 1`; `T = 100`, `c = 2` | `0.25`; `0.49363` | sound | none |
| 8.3 (r16) | `ℚ`; `x = 20`, `T = 10` | `c_ℚ = −1.837877`; `ψ(20) = 19.2655` vs `18.1634` | sound | none |
| 8.4, `riemannZeta_weilExplicitFormula` (r16) | `φ = 0`; signed divisor | `0 = 0`; off by `φ̃(0) + φ̃(1) > 0` | sound | none |
| 8.6 (r16) | quartic `χ` mod 5 | `−(i log 2)/2` | sound | none |
| 8.7 (r16) | `ℚ`, `(3)∞` | main term `⅓` | sound | none |
| 8.9 (r16) | `Li 2`; `li 2` | `0`; `1.04516` | sound | none |
| `dirichletLFunction_convexity` (r16) | `q = 1`, `χ₋₄`, at `½` | `1.460354`; `0.667691` | sound | none |
| `hadamard_of_orderLE_one` (r16) | `1 − s`; `f = s` | `(a, b) = (0, −1)`; `f 0 ≠ 0` needed | sound | none |
| `zetaEntireCompletion_hadamard` (r16) | `s = 0, 1` | value `1`; `B = −0.0230957` | sound | none |
| `riemannZeta_zeros_summable_ordinate` (r16) | `ρ₁`, `ρ̄₁` | `2/(1 + 14.134725²) = 0.009961` | sound | none |
| `riemannZeta_zeroFreeRegion` (r16) | `s = 1` | `ζ(1) = −0.9769 ≠ 0` | sound | none |
| `dirichletLFunction_zeroFreeRegion` (r16) | principal mod 2 | region `Re ≥ 0.693` excludes `L(0) = 0` | sound | none |
| `neg_re_logDeriv_riemannZeta_le` (r16) | `δ = 2|t|`, `t → 0` | `1/(4|t|)` vs `log|t| → −∞` | sound | none |
| `riemannVonMangoldt` (r16) | `T = 2, 14, 100` | `0, 0, 29` vs `−0.683, −0.443, 28.127` | sound | none |
| `primeIdealCount_effective` (r16) | `ℚ`, `x = 10⁶` | `78498` vs `78626.5`; `128.5 ≤ 24310` | sound | R01 |
| `primeCounting_progression_effective` (r16) | `q = 4`, `a = 3`, `x = 100` | `13` vs `14.540` | sound | none |
| R01's four statements (r16, pin unchanged) | `ψ = 1`; `ℚ(√5)` at `0` | order `−1` not counted; trivial zero outside `Ioo 0 1`; 4 `sorry`, no error | can be stated | R01 |
| — computed this round — | | | | |
| 6.4, LMO containment (lines 1261–1268) | `ℚ`, `χ = 1`, `γ = 0`; the same at `γ = 14.13`; `χ₋₄`, `γ = 0`; `ℚ(i)`, `γ = 0`; the same at `γ = 10`; `ℚ(√5)`, `γ = 0`; cubic field of discriminant `−23`, `γ = 3` | `log 𝔮(iγ)` against `log A + n log(|γ| + 2)`: `1.0986 ≥ 0.6931`, `2.8408 ≥ 2.7807`, `2.7726 ≥ 2.0794`, `3.8712 ≥ 2.7726`, `6.5200 ≥ 6.3561`, `3.8067 ≥ 2.9957`, `8.5375 ≥ 7.9638`. With `R₄ = 1` and `c = 0.99`, the region widths `0.9011, 0.3485, 0.3571, 0.2557, 0.1518, 0.2601, 0.1160` are below the LMO widths `1.4427, 0.3596, 0.4809, 0.3607, 0.1573, 0.3338, 0.1256` | sound | none |
| 6.4, real-shift step (negative control) | shift `μ = 5i` (not of finite order), `γ = −5` | factor `‖iγ + μ‖ + 3 = 3 < |γ| + 2 = 7`, so the finite-order hypothesis is used, and the README states it | sound | none |
| 6.4, Kadiri (1.5)–(1.6) | `γ = 0` | width of (1.6) is `1/(R₄(log A + n log 2)) < 1/(R₄ log A)`, so near the axis (1.6) lies inside box (1.5). "At most one zero" in (1.6) follows; a literal "no zeros" would exclude every exceptional zero | README sound | Source issues |
| 7.4, direct confinement (lines 1456–1463) | `Λ` at `1.5` and `−0.5`; at `2` and `−1`; at `1 + 14.134725i` and `14.134725i`; at `2 + 10i` and `−1 + 10i`; Lean | `1.356616 = 1.356616`; `0.523599 = 0.523599 = π/6`; moduli `6.9622·10⁻⁶` both; `8.3154·10⁻⁴` both. Both `example`s elaborate | sound | remark |
| 7.5, confinement sentence (line 1489) | record `ζ(s)(1 + 5·2^(−s) + 2·4^(−s))` | `2u² + 5u + 1 = 0` gives `u = −0.2192, −2.2808`, so `Re s = 2.1895, −1.1895 ∉ [0, 1]`. 5.6a excludes these zeros only for the two families | sound | none |
| 8.4 *Needs:*, reflection via 1.4a (lines 1609–1610) | `K = ℚ`: `s = 2` and `−1`; `s = 0.3 + 5i` and `0.7 − 5i` | `Λ'/Λ(2) = −1.430934`, `Λ'/Λ(−1) = 1.430934`; `Λ'/Λ(0.3 + 5i) = 0.004935 + 0.636737i = −Λ'/Λ(0.7 − 5i)` | sound | none |
| Build paragraph (line 330) against Layer 9 Dependencies (line 1885) | the Layer 9 bridge | both name Layers 0 and 4 and 7.2 | consistent | none |
| Downstream consumers (lines 1895–1896) | real primitive `χ` | no line implies `(1 − β) log q ≥ c`; 6.3 keeps one `β ∈ [1 − c/log q, 1)` | sound | none |
| Layer 7 and 8 Dependencies (lines 1516–1519, 1811–1813) | *Needs:* of 7.1–7.6 and 8.1–8.9 | 5.6a, 2.2 and 1.4a are added; depcheck finds 2325 edges and 0 problems | sound | none |

## Not verifiable

- **Lagarias–Montgomery–Odlyzko 1979, Lemma 2.3.** The text is paywalled; the manifest records `lagarias1979` as `uncertified` with DOI `10.1007/BF01390234`. Its content is taken from `kadiri2012` lines 65–73. Whether the lemma states (1.6) with "at most one zero" or with "no other zero" is unchecked; both readings support the README.
- **Carried from the previous report.** These texts are paywalled and cited by locator only:
  - Davenport §§11–21;
  - Titchmarsh §§5.1, 9.2–9.4;
  - Iwaniec–Kowalski §§5.1–5.2;
  - Lang XVII §3;
  - Lagarias–Odlyzko 1977;
  - the published versions of `bennett2021` and `hasanalizade2022`.

## Source issues

- **Misprint** in kadiri2012 at §1, display (1.6), p. 2: the source says Lagarias–Montgomery–Odlyzko show that the Hecke L-function has no zeros in the whole-strip region (1.6); it should be no zeros there other than the possible single zero allowed by (1.5); affects nothing.
- **Gap** in trudgian2015 at Theorems 1–2 and §3.1 (pp. 1, 6): the source says one parameter inequality in the Backlund-trick step follows from the others, so it is never checked; it should be every parameter inequality checked, as in the corrected proofs; affects a stated result; corrected in print at Bennett–Martin–O'Bryant–Rechnitzer, Math. Comp. 90 (2021), Corollary 1.2, and Hasanalizade–Shen–Wong, Math. Comp. 91 (2022), Corollary 1.2.
- **Misprint** in kadiri2012 at References, item [9], p. 19: the source dates Lagarias–Odlyzko's "Effective versions of the Chebotarev density theorem" to 1997; it should be 1977; affects nothing.
