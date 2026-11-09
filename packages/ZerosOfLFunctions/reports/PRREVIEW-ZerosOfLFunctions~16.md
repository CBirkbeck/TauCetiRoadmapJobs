# Review of ZerosOfLFunctions (pull request #1913 at 9d45d17)

**Verdict:** needs changes

This is a full review of the head the previous review read: the folder has a 0-line diff since 9d45d17. None of the previous findings is repaired; they are carried as R02, R03, R04, R05 and R08, with corrected witnesses where this round found more. R01, R06 and R07 are new. No repair report marks any finding "not actionable".

## R01 (P2) — The Downstream-consumers paragraph says a consumer proves, from Layers 0–8, that Landau–Siegel zeros do not exist

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 1869–1873: "AnalyticNumberTheoryPartI takes Layers 0–8 … and proves from them the exclusion of Landau–Siegel zeros (its §0.34) and the exception-free forms over `ℚ` …: the region for Dirichlet L-functions without exception …".

**Claim.** A later roadmap derives from this roadmap's layers that no real primitive Dirichlet character has an exceptional zero. Its §0.34, as its README states it, gives an absolute effective `c_LS` with `(1 − β) log q ≥ c_LS` for every real zero `β` (`AnalyticNumberTheoryPartI/README.md` at #1126, line 19).

**Witness.** That bound is the open Landau–Siegel conjecture. The strongest proved uniform bound is Siegel's `1 − β ≫_ε q^(−ε)`, whose constant is ineffective (Davenport §21). This README's own lines 82–84 exclude "the nonexistence of exceptional zeros".

**Repair.** Replace lines 1869–1873 with one sentence: "AnalyticNumberTheoryPartI consumes Layers 0–8 as stated for a general field, the exceptional-zero alternative of 6.3–6.4 included." Do not describe what that roadmap proves from them. Whether its §0.34 can stand is for that roadmap's own review. This README must not endorse it.

**Test.** After the repair, no sentence of the README implies `(1 − β) log q ≥ c` for every real primitive `χ`. That agrees with lines 82–84, with 6.3 (which allows one exceptional `β ≥ 1/2` per real character) and with `dirichletLFunction_zeroFreeRegion`, whose first clause keeps the real simple exception.

## R02 (P2) — Headline theorems that can be stated at the pinned Tau Ceti are absent, and the docstring says they cannot be (previous R01, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean`, lines 28–44, for example "neither library has its continuation to `ℂ`, its completion, or the L-function of a Hecke character" and "the Tau Ceti revision this file is built against supplies none of them".

**Claim.** The general-`K` forms of the end theorems 6.2–6.4, 7.5, 8.7 and 8.8 cannot be stated at the pins, so only their `K = ℚ` instances are stated.

**Witness.** Tau Ceti `2fd255d9` has:

- `TauCeti.LFunctions.heckeLFunctionC`, the canonical continuation to `ℂ` (`NumberTheory/LFunctions/Hecke/Basic.lean:74`);
- `PrimitiveRayClassCharacter` (`Hecke/Primitive.lean:91`);
- `RayClassGroup` (`Global/RayClass/Basic.lean:130`);
- `frobeniusPrimeCount` (`Chebotarev/PrimeCounting/VonMangoldt.lean:177`).

#1907 states these headlines.

**Repair.**

1. #1907 already rewrites this `Suggested.lean`. It states `dedekindZeta_zeroFreeRegion`, `heckeLFunction_zeroFreeRegion`, `riemannVonMangoldt_dedekindZeta`, `riemannVonMangoldt_heckeLFunction`, `rayClassPrimeCount_effective` and `frobeniusPrimeCount_effective_abelian`, and its docstring names only the completions as missing.
2. Rebase this pull request on #1907 and keep those statements and that paragraph. Do not write a second version (R08 states the order).
3. If this pull request is to merge first instead, do three things:
   - add the four statements below under Layer comments, and name each in the README at 6.4, 7.5, 8.7 and 8.8;
   - replace lines 28–40 with a paragraph naming only what the pin lacks: `completedDedekindZeta`, `completedHeckeLFunction`, and with them the exceptional-zero terms of 8.5–8.8;
   - correct lines 42–44: `AnalyticLFunctionData` is at the pin (`NumberTheory/LFunctions/Data/Basic.lean:82`), so the Layer 0–2, 4, 7.1–7.3 and 9 statements are left out because they are lemmas, not because a carrier is missing.

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

**Test.** I elaborated a scratch file at this head with these imports and statements: 4 "declaration uses `sorry`" warnings and no error. Three checks on the statements themselves:

- At `ψ = 1` the pole at `1` has order `−1`, which is not positive, so it is not counted.
- For `K = ℚ(√5)`, `ζ_K` has a trivial zero of order `r₁ + r₂ − 1 = 1` at `s = 0`. `Ioo 0 1` excludes it, so the count is that of the completion (6.5 rules out zeros on `Re s = 0, 1`).
- At `K = ℚ` and `T = 100` the count is `58`, against the main term `56.255`.

## R03 (P3) — The supplier contracts cite pinned objects under the LFunctions roadmap's names, cite one lemma under two names, and deny that the pin has them (previous R02, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- lines 263–271 (e.g. "`AnalyticLFunctionData.hasFunctionalEquation_eventuallyEq`");
- lines 118, 359, 639, 640, 646–647, 652, 878 and 1394 (`regular_away`, `exact_pole_order`, `completes`, `reflectedPoint`);
- lines 291, 298, 1267, 1284 and 1314 (`PrimitiveRayClassCharacter.inv`);
- lines 64, 221 and 241 ("roadmap contracts", "rather than declarations of the Tau Ceti pin").

**Claim.** These are roadmap contracts that the Tau Ceti pin does not declare.

**Witness.** The names come from LFunctions `Suggested.lean` on main, lines 154–202. The pin implements those objects under other names: `HasMeromorphicContinuation.analyticAt` (`Data/Basic.lean:187`) and `HasFunctionalEquation.eventuallyEq` (`:269`). Line 557 cites the pin name, line 646 the roadmap name, for one lemma.

This corrects the previous report, which said these names occur nowhere. They occur on main. The finding stands because the brief cites what exists at the pin by its pin name and file.

**Repair.**

1. Under "From Tau Ceti", list with their files the pinned objects this README consumes:
   - `Data/Basic.lean` (`AnalyticLFunctionData`, `degree`, `gammaFactor`, `dual`, the three predicates and the lemmas in the table below);
   - `Data/RiemannZeta.lean` (`riemannZetaData`);
   - `Data/Normalization.lean` (`NormalizationTranslation`);
   - `Dirichlet/Basic.lean` (`dirichletData`);
   - `Hecke/Basic.lean` (`heckeLFunctionC`, `heckeLFunctionC_induced`, `heckeLFunctionC_eq_primitive`);
   - `Hecke/Primitive.lean` (`PrimitiveRayClassCharacter`, `PrimitiveRayClassCharacter.of` at `:135`, its `InvolutiveInv` instance at `:192`, `RayClassCharacter.eulerCorrection` at `:236`).

   Do the same for the Arithmetic Dirichlet Series, Global Number Fields, Chebotarev and Class Field Theory declarations the pin has:
   - `ArithmeticDirichletSeries/Perron/Basic.lean:204` (`truncatedPerronKernel_one`);
   - `Perron/Formula.lean:130` and `:229`;
   - `Perron/Ideal.lean:161` (`perronFormula`);
   - `Analysis/SpecialFunctions/LogIntegral.lean`;
   - `Global/RayClass/Basic.lean:130` and `:182`;
   - `Chebotarev/PrimeCounting/VonMangoldt.lean:165` and `:177`;
   - `ClassFieldTheory/Global/AdmissibleModulus/Reciprocity.lean:128`.

   The objects the pin lacks (`dedekindZetaC`, `completedDedekindZeta`, `heckeData`, `completedHeckeLFunction`, the Mellin kernels, `three_four_one_nonneg` …) stay under "From TauCetiRoadmap.LFunctions".
2. Rename every occurrence to the pin's name:

   | README name | Pin name (`Data/Basic.lean`, unless stated) |
   | --- | --- |
   | `hasFunctionalEquation_eventuallyEq` (lines 269, 646, 652) | `HasFunctionalEquation.eventuallyEq` (`:269`) |
   | `regular_away` (lines 118, 266, 639, 1394) | `analyticAt` (`:187`) |
   | `exact_pole_order` (lines 266, 359) | `meromorphicOrderAt_eq` (`:185`) |
   | `completes` (lines 265, 640, 878) | `completed_eq` (`:177`) |
   | `polarOrder_reflect` | `polarOrder_one_sub_conj` (`:195`) |
   | `eq_away` | `completed_eq` (`:196`) |
   | `dual_gammaFactor` | `gammaFactor_dual` (`:168`) |
   | `dualCompleted` | `dual_completed` (`:147`) |
   | `dual_hasDirichletAgreement` | `HasDirichletAgreement.dual` (`:202`) |
   | `dual_hasMeromorphicContinuation` | `HasMeromorphicContinuation.dual` (`:217`) |
   | `reflectedPoint s` (lines 263, 269, 647) | `1 − conj s` |
   | `PrimitiveRayClassCharacter.inv χ` | `χ⁻¹` (`Hecke/Primitive.lean:192`) |

3. Delete these three phrases:
   - "these are roadmap contracts, including when absent from the library pin" (line 64);
   - "rather than declarations of the Tau Ceti pin" (line 221);
   - "These are roadmap contracts" (line 241).

**Test.** I ran `#check` on each pin name in the table (after `lake build TauCeti.NumberTheory.LFunctions.Data.Normalization`, whose object file was missing), and an `example` checking `(ψ⁻¹).character = ψ.character⁻¹` by `PrimitiveRayClassCharacter.character_inv`: all elaborate. For example, `HasFunctionalEquation.eventuallyEq` has type `d.completed =ᶠ[𝓝[≠] s] fun z ↦ d.rootNumber * d.dual.completed (1 − z)`. After the repair, a grep of the README for `hasFunctionalEquation_eventuallyEq|regular_away|exact_pole_order|reflectedPoint|PrimitiveRayClassCharacter.inv` finds nothing.

## R04 (P3) — `TauCeti.Contour.IsPiecewiseC1On` does not exist at the pin (previous R03, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- line 206: "contour integration (`Analysis/Contour/`): `TauCeti.Contour.IsPiecewiseC1On`";
- line 1364, the first API bullet of 7.1;
- line 1371, the *Needs:* line of 7.1.

**Claim.** The pin declares the piecewise-`C¹` predicate under this name, in the contour folder.

**Witness.** The predicate is `TauCeti.IsPiecewiseC1On` (`Analysis/Calculus/ContDiff/PiecewiseC1On.lean:91`). `#check @TauCeti.IsPiecewiseC1On` gives `{E} → [NormedAddCommGroup E] → [NormedSpace ℝ E] → (ℝ → E) → ℝ → ℝ → Prop`. No declaration named `TauCeti.Contour.IsPiecewiseC1On` exists.

**Repair.** Replace the three occurrences with `TauCeti.IsPiecewiseC1On`, and give its file in the "From Tau Ceti" contract.

**Test.** `TauCeti.Contour.argumentPrinciple_nullHomologous` elaborates with hypothesis `IsPiecewiseC1On γ a b` in exactly this sense, so 7.2 composes with the renamed 7.1.

## R05 (P3) — The Trudgian theorems cited for 7.5 have a published gap; cite the corrected statements (previous R04, not repaired)

**Location.**

- `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 1458–1459: "(Trudgian, Theorem 1, for `χ` nonprincipal, with absolute constants; Theorem 2 is the Dedekind case; Davenport §16)";
- the References, lines 1914–1918;
- `Suggested.lean`, line 177.

**Claim.** Trudgian's Theorems 1 and 2 are proved sources for the conductor-uniform counts.

**Witness.** `bennett2021` lines 73–76: Trudgian wrongly treated one parameter inequality as redundant, leaving Theorems 1 and 2 unproved. `hasanalizade2022` lines 40–41 and 84–85 report and repair the Dedekind case.

**Repair.** Cite the corrected statements and keep Trudgian as the earlier one. Add both papers to the References with their arXiv ids; the manifest already has both keys.

- **Dirichlet count.** Bennett–Martin–O'Bryant–Rechnitzer, Corollary 1.2 (`bennett2021` lines 83–84), for conductor `q > 1` and `T ≥ 5/7`.
- **Dedekind count.** Hasanalizade–Shen–Wong, Corollary 1.2 (`hasanalizade2022` lines 63–65), for `T ≥ 1`. It has exactly Trudgian's Theorem 2 shape, `D₁(log d_K + n_K log T) + D₂ n_K + D₃`.

**Test.** The README statement (existential constant, `T ≥ 2`) follows from each corollary, since `T ≥ 2` gives `n log T ≥ n log 2`, which absorbs `D₂ n + D₃`. At `q = 1` and `T = 100`, the main term `56.255` against `N±(100) = 58` is within `C log 100`.

## R06 (P3) — 6.4 says no source proves the Hecke region at this generality; its own source names one

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 1258–1259: "No source proves the statement at this generality; it is assembled from six targets."

**Claim.** No source states the at-most-one-exception region for primitive ray-class L-functions over every field of degree `n`.

**Witness.** `kadiri2012` lines 65–73 report Lagarias–Montgomery–Odlyzko (Invent. Math. 54, 1979), Lemma 2.3: for every `K` and every Hecke character, at most one zero in a region of width `1/(R₄ log A(χ))`, `R₄` independent of `K`, extended to the whole strip.

**Repair.**

1. Replace the sentence with a locator: "(Lagarias–Montgomery–Odlyzko, Invent. Math. 54 (1979), Lemma 2.3, with a constant independent of `K`)".
2. Record it `uncertified` if the text cannot be read.
3. Add the paper to the References.
4. Keep (4a)–(4f) as the route.
5. If the lemma does not state that the exceptional zero is real, simple and occurs only for a real character, say that those clauses are (4c) and (4f).

**Test.** A constant independent of `K` is in particular one depending on `n` alone, so the cited lemma implies the region and one-exception clauses of 6.4 as stated. At `K = ℚ` they reduce to `dirichletLFunction_zeroFreeRegion` (Davenport §14).

## R07 (P3) — Four dependency lines omit inputs their routes use

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- **7.4.** Line 1449, "*Needs:* 7.2, 7.3, 1.5, 3.4, 4.2, 4.5, 6.5.", while its route (line 1445) uses "confinement of the zeros to the critical strip".
- **7.5.** Line 1470, whose Hecke case "is the argument of 7.4" (line 1460).
- **8.4.** Line 1584, "*Needs:* 8.2, 4.5, 1.4; …", while its route (line 1577) reflects by `Λ_K'/Λ_K(s) = −Λ_K'/Λ_K(1 − s)`. 1.4a supplies that reflection (lines 559–560: "used in 8.4").
- **How to read the build.** Lines 327–328: "Layer 9 needs only Layers 0 and 4". Its bridge needs 7.2 (lines 1805, 1859).

**Claim.** The *Needs:* lines list every route input.

**Witness.** 7.4 applies 7.2 on `Icc (−1) 2 ×ℂ Icc 0 T`. Matching `N(T)` requires no zeros with `Re ρ ∈ [−1, 0) ∪ (1, 2]`. 6.5 gives only `Re ρ ≠ 0, 1`; confinement is 5.6a's first clause.

**Repair.**

- Add 5.6a to the *Needs:* lines of 7.4 and 7.5. For 7.4, also add Mathlib `riemannZeta_ne_zero_of_one_le_re` and `completedRiemannZeta_one_sub`, which give confinement at `ℚ`.
- Add 1.4a and L-functions Layer 3 `completedDedekindZeta_one_sub` to the *Needs:* line of 8.4.
- Change lines 327–328 to "Layer 9 needs Layers 0 and 4, and 7.2 for its bridge to the contour integral".

**Test.** Each input that the routes of 7.4, 7.5 and 8.4 name then appears in their *Needs:* lines. For `ζ`, `zetaEntireCompletion` has no zero on `[−1, 2]` (it is `2ξ`, positive on the real axis) and none with `Re ρ > 1` or `Re ρ < 0`, so the rectangle count is `N(T)`.

## R08 (P3) — The pull request's title, description and stated merge order are stale, and no order is stated against #1907 (previous R05, not repaired)

**Location.** The pull request's title and description (data):

- the title: "effective statements under the exclusion of Landau–Siegel zeros";
- the description: "Merge order: after AnalyticNumberTheoryPartI (#1126) lands, since the strengthened statements refer to its §0.34."

**Claim.** The pull request restates the roadmap in exception-free form, and it depends on AnalyticNumberTheoryPartI.

**Witness.**

- README line 1233 defines *IsExceptionalZero*, and lines 82–84 exclude the nonexistence of exceptional zeros.
- `ORDER.txt` lists this roadmap at line 48 and AnalyticNumberTheoryPartI at line 50.
- `roadmaps overlaps` reports #1907 conflicting in both files.

**Repair.**

1. Retitle the pull request, without the exclusion of Landau–Siegel zeros (R01).
2. Rewrite the description so that it describes this head: targets 1.3a, 1.4a, 5.6a and 6.4d, the two `ζ` lemmas in `Suggested.lean`, and the provenance table.
3. Delete the "after AnalyticNumberTheoryPartI" sentence; it would invert the supply order.
4. State that this pull request is rebased on #1907 before either merges (R02).

**Test.** The new text agrees with README lines 82–84 and 1233, with `ORDER.txt` lines 48–50, and with the R02 repair.

## Previous findings (PRREVIEW-ZerosOfLFunctions~15 at the same head)

- **R01 — not repaired.** `Suggested.lean` lines 28–40 still say "the Tau Ceti revision this file is built against supplies none of them". Carried as R02, with the repair now pointing to #1907, which states the headlines.
- **R02 — not repaired.** Line 269 still reads "`AnalyticLFunctionData.hasFunctionalEquation_eventuallyEq`". Carried as R03, with the witness corrected (the names are LFunctions roadmap names on main) and the Layer 5 and pin-file items added.
- **R03 — not repaired.** Lines 206, 1364 and 1371 still read `TauCeti.Contour.IsPiecewiseC1On`. Carried as R04.
- **R04 — not repaired.** Line 1458 still reads "(Trudgian, Theorem 1, for `χ` nonprincipal, with absolute constants". Carried as R05, now citing Hasanalizade–Shen–Wong's Corollary 1.2, which has Trudgian's shape.
- **R05 — not repaired.** The title and the merge-order sentence quoted in R08 are unchanged. Carried as R08.

## Verified sound

**Gate and dependency check.**

- My run of `gate … ZerosOfLFunctions --base origin/main` printed every check at 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, and exited 0. The worker's gate, which includes `build=0`, also passes.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'` is empty.
- The dependency check printed the following and exited 0, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 239 roadmaps, 2324 edges, 0 problem(s)
```

- `ORDER.txt` lists LFunctions at line 27, this roadmap at 48, AnalyticNumberTheoryPartI at 50, and ExplicitZetaBounds, ExplicitPrimeCounting, ExplicitNumberFields and AnalyticNumberTheoryPartIII at lines 266–272.

**Elaboration.**

- `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 with exactly 13 "declaration uses `sorry`" warnings.
- I compared the 16 elaborated types of `signatures.md` with their README statements. The file has no `variable` block, so no binder is dropped. `riemannZeta_weilExplicitFormula` elaborates with `ContDiff ℝ (↑⊤) φ`, the smooth class and not the analytic `⊤`.
- One-tactic probe on a scratch copy: each `sorry` was replaced by `first | (rfl; done) | (simp; done) | (norm_num; done) | (infer_instance; done) | (positivity; done)`. All 13 statements still fail, so none is padding. No statement restates a definition, mirrors a Check or computes a small value.

**Library declarations checked by `#check` at the pins.**

- **Mathlib.** 89 names the README cites, from `AnalyticOnNhd.sum_divisor_le` through `WeakFEPair.Λ₀`, elaborate in one scratch file with no error. The hypotheses the README relies on:
  - `AnalyticOnNhd.sum_divisor_le`: `0 < |r| < |R|`, `1 ≤ M`, analytic on `closedBall c |R|`, `f c ≠ 0`; the count is `∑ᶠ` of the divisor on `closedBall c |r|` (4.3).
  - `Complex.exists_continuousOn_eqOn_exp_comp`: `IsSimplyConnected U`, `IsOpen U`, continuity, `0 ∉ g '' U` (1.1).
  - `PhragmenLindelof.vertical_strip`: growth `O(exp(B exp(c|Im z|)))` with `c < π/(b − a)`, equal edge bounds (3.2).
  - `DirichletCharacter.completedLFunction` is `gammaFactor · LFunction` without `q^(s/2)`, and equals `completedRiemannZeta` modulo 1 (`completedLFunction_modOne_eq`). The zeros counted in `riemannVonMangoldt_dirichlet` are therefore the nontrivial zeros.
  - `riemannZeta_one` (`Harmonic/ZetaAsymp.lean:420`) gives `ζ(1) = (γ − log 4π)/2 ≠ 0`, so the hypothesis `s ≠ 1` of `riemannZeta_zeroFreeRegion` is unused but harmless.
- **Tau Ceti.** 17 names elaborate: the eight contour declarations of 7.1–7.3 (`windingNumber : (ℝ → ℂ) → ℝ → ℝ → ℂ → ℂ`; `isNullHomologous_iff`, which is winding number `0` off `Ω`), `HasFunctionalEquation.eventuallyEq`, `norm_rootNumber`, `HasMeromorphicContinuation.analyticAt`, `Real.logIntegral`, `heckeLFunctionC`, `PrimitiveRayClassCharacter`, `RayClassGroup`, `frobeniusPrimeCount` and `frobeniusPsi`.
  - `heckeLFunctionC` is `meromorphicContinuation 1 (LSeries …)` (`Hecke/Basic.lean:74–75`).
  - The Perron declarations of 8.1: `truncatedPerron_LSeries` needs `0 < x`, `0 < c`, `0 ≤ T` and summability (`Perron/Formula.lean:130`); `norm_truncatedPerron_LSeries_sub_sum_le` needs `0 < T` and `x ≠ n` on the support (`:229`); `truncatedPerronKernel_one` gives `π⁻¹ arctan(T/c)` for `c ≠ 0` (`Perron/Basic.lean:204`). 8.1's hypotheses `x > 0`, `c > 0`, `T ≥ 1`, "x off the norms" lie within these.

**Cross-roadmap citations resolved on main.**

- **LFunctions.** All 64 Layer 0–8 names of the supplier contract occur in `TauCetiRoadmap/LFunctions/Suggested.lean` at the layers cited. Examples: `three_four_one_nonneg` at line 2685 (Layer 7, from 2676), `dedekindZeta_idealVonMangoldt_nonneg` at 2828 (Layer 8), `heckeMellinTotal_sub_const_isBigO` at 2432 and `grossencharacterFEPair` at 2468 (Layers 5–6), `meromorphicOrderAt_dedekindZetaC_one` at 977 (Layers 2–3).
- **Arithmetic Dirichlet Series.** §§2.3, 6.1–6.4 are the numbered paragraphs of its Layers 2 and 6 (README lines 180–190, 258–278). Its `Suggested.lean` has `truncatedPerronKernel_one`, `truncatedPerron_LSeries`, `norm_truncatedPerron_LSeries_sub_sum_le`, `perronFormula`, `idealSummatory_mul_eq_sub_integral_mul`, `logIntegral_isEquivalent_div_log` and `TauCeti.Real.logIntegral`.
- **Global Number Fields.** Layer 2, Layer 3E (README line 393) and Layer 9.
- **Number Field Arithmetic.** §2.3 `artinSymbol` (line 123).
- **Chebotarev.** Layers 11, 13 and 14 (lines 425, 593, 612; `frobeniusPrimeCount` in its export list at line 690).
- **Class Field Theory.** Layer 12 (line 1724; `rayClassArtinMap_idealClass` in its table at line 593).

`roadmaps resolve` finds no unresolved cross-roadmap citation. Its 20 Lean-name leads are the R03 names (in LFunctions `Suggested.lean` on main), the Provenance names (external), and LFunctions Layer 6 names (on main).

**Ownership and overlaps.**

- `roadmaps overlaps`: no cited id is dropped by an open pull request and none is defined only by an open revision. Comparing the heading lists of main and this head, no id is dropped. #1907 conflicts in both files (R02, R08).
- AnalyticNumberTheoryPartI (#1126, README lines 9–11, 77–90) consumes ZerosOfLFunctions 0.1–8.8 as supplier and owns only entire-function theory beyond order-one products, so it is not a second owner. ExplicitZetaBounds, ExplicitNumberFields, ExplicitPrimeCounting and AnalyticNumberTheoryPartIII cite this roadmap 46, 33, 38 and 20 times as a supplier. The ownership passages I read (e.g. ExplicitZetaBounds README lines 3835–3841, which owns its explicit zero-gap records) claim no object this roadmap owns.
- No declaration of this `Suggested.lean` reuses a fully qualified name of another roadmap.

**Provenance table, read at PrimeNumberTheoremAnd 127b50e3.**

- `StrongPNT.lean`: line 1854 (`ShiftTwoBound`, `δ ∈ Ioo 0 1`, `|t| ≥ 2`), 1949 (`ShiftOneBound`), 2144 (`ZeroWindowFinite`, `|t| ≥ 2`), 2218 (`ZeroInequality`, `|t| ≥ 2`) and 2899 (`StrongPNT`, `ψ − id = O(x exp(−c √log x))`).
- `IEANTN/Kadiri.lean` line 732: `kadiri_thm_3_1_q1_functional_eq`, with the four hypotheses `s ≠ 1`, `s ≠ 0`, `ζ(s) ≠ 0`, `ζ(1 − s) ≠ 0` and the rearranged symmetric form.
- The rows for 1.4a, 6.2, 6.4d and 8.5 match.

**Sources: the seeded sample.**

- **6.2.** `kadiri2012` lines 79–85: Theorem 1.1 gives regions for `|Im s| ≥ 1` and `|Im s| ≤ 1` for `d_K` sufficiently large, with at most one zero, real and simple. This matches 6.2's parenthesis.
- **5.6 and 6.4d.** `kadiri2012` lines 230–237 (§2.1.2): `−Re ζ_K'/ζ_K(s) = −∑ Re 1/(s − ρ) + ½ log d_K + Re 1/s + Re 1/(s − 1) + Re γ_K'/γ_K(s)`. The signs agree with 6.4d's trivial-character bound, the `t = 0` form and the off-axis bounds.
- **7.5.** `trudgian2015` lines 19–29: Theorem 1 covers `T ≥ 1` and primitive nonprincipal `χ`, with error `0.317 log kT + 6.401`; Theorem 2 has main term `(T/π) log(d_K (T/2πe)^{n_K})`. The README paraphrase is exact; the gap is R05.
- **No external locator; checked against the pinned declarations above.** 1.1, 3.1, 4.3, 4.4, 6.1, 7.1 and 8.1.
- **Davenport, Titchmarsh, Iwaniec–Kowalski, Lang.** Locators for 3.3, 5.6, 6.4, 7.6, 8.3 and 8.4: see Not verifiable. Their mathematics is computed in the table.
- The README flags no locator as unverified.

**Adversarial table.** I computed every value in this round. The numerical values come from a scratch Python script (Lanczos complex Γ, a direct Dirichlet series for `ζ(2 + iT)`) and from closed forms.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 *logGamma* branch | `δ = π/4`; the point `3`; the ray `arg s = π/2` | `2 ∈ S_δ`. `log S_δ = {u > 0, |v| < 3π/4}` is convex. Poles of Γ have norm ≤ 1 or arg `π`. *logGamma* at `3` is `log 2 = 0.693147`. Phase of `Γ(10i)` is `10 log 10 − 10 − π/4 = 12.24 > 3π`, so the principal log jumps (that ray lies in `S_δ` only for `δ < π/2`) | sound | none |
| 1.3a | `t = 0, 1, 3`; `Γ(3/2)`; `Re s = −½` | `‖Γ(½ + it)‖² = 3.141593, 0.271015, 0.000507 = π/cosh πt`. `Γ(3/2) = 0.886227 ≤ 1`. `Γ(−½) = −3.5449 < 0` | sound | none |
| 1.4a symmetric form | `s = 2`; `s = −2`; `ψ(i)` | `ζ'/ζ(2) + ζ'/ζ(−1) = −0.569961 + 1.985053 = 1.415093`. `−ψℝ(2) − ψℝ(−1) = 0.860973 + 0.554120 = 1.415093 = γ + log 2π − 1`. At `−2`: `−0.164823` against `0.554120` (junk `0`s). `Im ψ(i) = 2.076675` | sound | R03 (names) |
| 3.1 integral bound | `R = 0`, `c = α = 1`; `R = 1`; `zetaEntireCompletion(20)`; `exp(sin πs)` | `E₁(1) = 0.219384 ≤ e⁻¹ ≤ Γ(1) = 1`. `e⁻¹ ≤ Γ(2)`. `20·19·π⁻¹⁰·9!·ζ(20) = 1472.47`, `log = 7.29 ≤ 64.9C`. `log‖g(½ + 2i)‖ = cosh 2π = 267.7` with edge norms `1` | sound | none |
| 3.3 edges, `ζ` | `δ = 0.1, 0.5`; `t = 50, 200, 400` | `log‖Γℝ(1 + δ − it)/Γℝ(−δ + it)‖ − ½(1 + 2δ) log t = −1.1027` (all `t`, `δ = 0.1`) and `−1.8379` (`δ = 0.5`): constant, so exponent `(n/2)(1 + 2δ)` | sound | none |
| 3.4 exponent | `σ = −δ, ½, 1 + δ` | `(½ + δ)(1 + δ − σ)/(1 + 2δ) = ½ + δ, ¼ + δ/2, 0` | sound | none |
| 3.5 checks | `‖Λ(2m + 2i)‖`, `m = 10, 20` | `3.6768` and `1.35197·10⁷` against `π⁻ᵐ(m − 1)!` | sound | none |
| 4.3 trailing form | `z/10`, `r = 1`, `R = 2`, `M = 1`; `z`, `r = ¼`, `R = ½`; `z³`, `M = ⅛`; `1 − z/2` | `1 + log 5/log 2 = 3.3219 ≥ 1`. `2 ≥ 1`, while the first form with `‖a‖` gives `0 < 1`. `3 + 0 = 3.0000 = 3`. `log 2/log 1.5 = 1.7095 ≥ 0` | sound | none |
| 4.4 local count | `K = ℚ`, `T = 2, 10, 30`; geometry | `‖ζ(2 + iT)‖ = 0.90994, 1.2006, 0.86859 ≥ 1/ζ(2) = 0.60793`. `3/2 + 1 ≤ 3`, so the disc lies inside the Jensen disc. `sphere(2 + 2i, 4)` meets height `0` at `2 ± 2√3`, at distance ≥ `4 − √5 = 1.76` from the pole | sound | none |
| 4.5 | `N(14)`, `N(15)`, `N±(100)` | `0`, `1`, `58 = 2·29`. Unit rectangles of the strip have half-diagonal `√2/2` | sound | none |
| 5.2 `E₁` | `z = −½`; `z = 1` | `‖E₁ − 1‖ = 1 − 1.5e^(−½) = 0.0902 ≤ 0.125`. `E₁'(1) = −e` | sound | none |
| 5.6 | `ξ`; `e^(cs) f`; `s = 2`, `ρ₁` | `B = −γ/2 − 1 + ½ log 4π = −0.0230957 = −∑ Re 1/ρ`. The `e^(cs)` factor shifts `b` by `c`, so the hypothesis is needed. `Re 1/(2 − ρ₁) = 1.5/202.04 = 0.00742 > 0` | sound | none |
| 6.1 3-4-1 | `θ = 0, 2π/3, π` | `3 + 4cos θ + cos 2θ = 8, 0.5, 0 = 2(1 + cos θ)²` | sound | none |
| 6.2 cap | principal `χ` mod 2; `n = 1` | `c ≤ 0.549306`, so `c/log 3 ≤ ½`. `L(0) = (1 − 1)ζ(0) = 0` would enter at `c = log 3`. Kadiri lines 79–85 match | sound | none |
| 6.4 (4c), (4d) | quartic `χ` mod 5; `K = ℚ`, `σ = 1 + u`; `ℚ(i)`; `δ = u = 1` | `χ²` is the Legendre symbol `≠ 1`. `−ζ'/ζ(1.1) = 9.441`, `−ζ'/ζ(1.01) = 99.425` against `1/u − γ = 9.423, 99.423`, so the nontrivial-`χ` bound fails at `χ = 1`, as stated. *analyticConductorAt* at `0` is `3⁰·12·4 = 48`. `Re 1/(1 + i) = 0.5 = 1/(2·1)` | sound | R06 (locator) |
| 6.4 (4b) | `𝔣 = (2)` over `ℚ`, trivial `χ` | `‖logDeriv(1 − 2^(−s))‖` at `1.01` is `0.6835 ≤ 2 log 2` (presentation modulus) | sound | none |
| 6.5 | odd `χ` mod 4 at `1` | `2·(1/π)·(π/4) = ½`, order `0` | sound | none |
| 7.1 | unit square; `t = 1`; clockwise | windings `1` at `½ + ½i`, `0` at `2`, `−1` clockwise. `rectBoundary R 1 = σ₂ + it₁` | sound | R04 (name) |
| 7.2 | `z − 2`, `S = {2}`, `[−1, 1]²` | integral `0`, `ord₂ = 1`, so the full-`S` sum is false and `S ∩ R` is right | sound | none |
| 7.4 route | `zetaEntireCompletion` on `Icc (−1) 2 ×ℂ Icc 0 T` | counts `Re ∈ [−1, 2]`. 6.5 covers only `Re = 0, 1`. Confinement is needed (5.6a, or Mathlib at `ℚ`) | gap in *Needs:* | R07 |
| 7.5, `riemannVonMangoldt_dirichlet` | `q = 1`, `T = 100`; `χ₋₄`, `T = 10`; `ℚ(i)`, `T = 10`; generic record | `58` against `56.255`. `2` (`γ₁ = 6.0209`, `γ₂ = 10.2438`) against `2.709`. `1.005 = −1.704 + 2.709`. `2u² + 5u + 1 = 0` gives `u = −0.2192, −2.2808`, so `Re s = 2.19, −1.19` | sound | R05 (locator) |
| 7.6 | averaged identity; `N(100)` | `∫₀ᵀ(N(t + 1) − N(t))dt = ∫_T^{T+1} N − ∫₀¹ N`, and `∫₀¹ N = 0` for `ζ`. `29/(100 log 100) = 0.0630` against `(1/2π)(1 − 2.8379/log 100) = 0.0611`, tending to `0.1592` | sound | none |
| 8.1 | `T = c = 1`; `T = 100`, `c = 2` | `π⁻¹ arctan 1 = 0.25`. `π⁻¹ arctan 50 = 0.49363 → ½` | sound | none |
| 8.3, `chebyshevPsi_explicitFormula` | `ℚ`; `ℚ(√5)`; `ℚ(i)`, `x = 2`; `x = 20`, `T = 10` | `c_ℚ = −log 2π = −1.837877`. `L(0, χ₅) = 0`, so order `1 = r₁ + r₂ − 1`. `ζ(0)L(0, χ₋₄) = −¼` and trivial terms `log 2 = 0.693147 = ψ_K(2)`. `ψ(20) = 19.2655` against `18.1634`, difference `1.102 ≤ 17.95C` | sound | none |
| 8.4, `riemannZeta_weilExplicitFormula` | `φ = 0`; `φ̌`; signed divisor | `0 = 0`. Mellin of `φ(1/y)/y` is `φ̃(1 − s)`, so the prime side is `φ(n) + φ(1/n)/n`. Constant `−(log π)/2·2φ(1)`. Signed divisor is off by `φ̃(0) + φ̃(1) > 0` | sound | R07 (8.4 *Needs:*) |
| 8.6 check | quartic `χ` mod 5, `supp φ ⊆ (0.4, 0.6)` | only `n = 2` (`1/n ∈ (0.4, 0.6)`): `log 2·(−i)·½ = −(i log 2)/2` | sound | none |
| 8.7 checks | `ℚ`, `(3)∞`; `ℚ(√−5)` | `#Cl = 2`, main term `(½)(1 − ⅓) = ⅓` for all integers. `p ≡ 1, 9 (mod 20)` principal | sound | none |
| 8.9 | `Li 2`; `li 2` | `0`; `1.04516` | sound | none |
| `dirichletLFunction_convexity` | `q = 1`, `t = 0`; `χ₋₄`, `t = 0` | `‖ζ(½)‖ = 1.460354 ≤ C·3^(¼ + ε)`. `L(½, χ₋₄) = 0.667691 ≤ C·12^(¼ + ε)` | sound | none |
| `hadamard_of_orderLE_one` | `1 − s`; `cos`; `f = s` | `(a, b) = (0, −1)`; `(0, 0)`. With `f = s` the `ρ = 0` factor is `(1 − s/0)·e^(s/0) = 1` (Lean `/0`), so `f 0 ≠ 0` is needed | sound | none |
| `zetaEntireCompletion` and `_hadamard` | `s = 0, 1` | `0·(−1)·Λ₀(0) + 1 = 1`; `A = 0`, `B = −0.0230957` | sound | none |
| `riemannZeta_zeros_summable_ordinate` | `ρ₁`, `ρ̄₁`; trivial zeros | `2/(1 + 14.134725²) = 0.009961`. Each trivial zero would add `1` | sound | none |
| `riemannZeta_zeroFreeRegion` | `s = 1`; `σ ∈ (0, 1)` | `ζ(1) = (γ − log 4π)/2 = −0.9769 ≠ 0` (hypothesis unused, harmless). `ζ(σ) < 0` | sound | none |
| `dirichletLFunction_zeroFreeRegion` | principal mod 2, `t = 0` | region `Re ≥ 1 − c/log 6 ≥ 0.693`, so `L(0) = 0` is outside | sound | none |
| `neg_re_logDeriv_riemannZeta_le` | `δ → ∞`; `t₀ ≤ 1` | left side `→ 0`, right side `→ C log|t| ≥ C log t₀ > 0`. At `t₀ ≤ 1`, `log|t|` can be `≤ 0`, so the threshold is needed | sound | none |
| `riemannVonMangoldt` | `T = 2, 14, 100` | `N = 0, 0, 29` against `−0.683, −0.443, 28.127` | sound | none |
| `primeIdealCount_effective` at `ℚ` | `x = 10⁶` | `π = 78498` against `Li = 78626.5`. `|−128.5| ≤ 10⁶·e^(−√13.82) = 24310` | sound | R02 (general `K` present) |
| `primeCounting_progression_effective` | `q = 4`, `a = 3`, `x = 100`; `q = 1`, `a = 0` | `13` against `Li(100)/2 = 14.540`. `Nat.Coprime 0 1` holds, giving `π(x) − Li(x)` | sound | none |
| R02's four statements | `ψ = 1`; `ℚ(√5)` at `0`; elaboration | pole order `−1` is not positive. The trivial zero at `0` is outside `Ioo 0 1`. 4 `sorry` warnings, no error | can be stated | R02 |
| Downstream consumers, lines 1869–1873 | real primitive `χ` | the claimed `(1 − β) log q ≥ c_LS` is the open Landau–Siegel conjecture. 6.3 allows `β ∈ [1 − c/log q, 1)`. Siegel gives only ineffective `q^(−ε)` | false claim | R01 |
| 6.4 locator | `kadiri2012` lines 65–73 | LMO Lemma 2.3: one exception, `R₄` independent of `K` | source exists | R06 |
| Layer 9 build paragraph | bridge target | "needs only Layers 0 and 4" against "Layer 7.2 for the bridge" (line 1859) | inconsistent | R07 |

## Not verifiable

- **Paywalled sources, cited by locator only.** I did not read these; their mathematics is computed in the table:
  - Davenport, *Multiplicative Number Theory* §§11–21 (5.5, 5.6, 6.2–6.4, 7.5, 8.3, 8.5–8.7);
  - Titchmarsh §5.1 (3.3), §§9.2–9.4, Theorems 9.2–9.4 and the "printed p. 214" of 7.6;
  - Iwaniec–Kowalski §5.1 (5.7) and §5.2 (3.3, 3.4): whether the convexity bound sits in §5.1 or §5.2 is unchecked;
  - Lang, *Algebraic Number Theory* XVII §3, Theorem 3.1 (8.4);
  - Lagarias–Odlyzko 1977.
- **Lagarias–Montgomery–Odlyzko 1979, Lemma 2.3 (R06).** `sources fetch` without a manifest reported that DOI prefix 10.1007 is paywalled and that the arXiv search returned HTTP 429. The lemma's content is taken from `kadiri2012` lines 65–73, so which clauses it states is unchecked.
- **Published versions of `bennett2021` (Math. Comp. 90) and `hasanalizade2022` (Math. Comp. 91).** These are paywalled. The numbering Corollary 1.2 is from the arXiv versions in the cache.

## Source issues

- **Gap** in trudgian2015 at Theorems 1–2 and §3.1 (pp. 1, 6): the source says one parameter inequality in the Backlund-trick step follows from the others, so it is never checked; it should be: every parameter inequality checked, as in the corrected proofs; affects a stated result; corrected in print at Bennett–Martin–O'Bryant–Rechnitzer, Math. Comp. 90 (2021), Theorem 1.1 and Corollary 1.2 (Theorem 1), and Hasanalizade–Shen–Wong, Math. Comp. 91 (2022), Theorem 1.1 and Corollary 1.2 (Theorem 2).
- **Misprint** in kadiri2012 at References, item [9], p. 19: the source dates Lagarias–Odlyzko's "Effective versions of the Chebotarev density theorem" (Academic Press, ed. Fröhlich) to 1997; it should be 1977; affects nothing.
