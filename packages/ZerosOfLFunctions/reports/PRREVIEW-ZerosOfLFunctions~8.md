# Review of ZerosOfLFunctions (pull request #1907 at 8d25d6d)

**Verdict:** needs changes

One blocking finding (P2) and eleven P3 findings. The gate passes and so does my own elaboration. The blocking finding is about `Suggested.lean`: at the current pins it can state the roadmap's general end theorems, but it does not. Its docstring says they are not statable because the carriers are missing, and five of those carriers (and the L-function records) are in fact pinned in Tau Ceti.

## R01 (P2) — Statable end theorems are missing from `Suggested.lean`; its "not statable" list is false at the pins

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean:33–39`: "neither library has its continuation to `ℂ`, its completion, or the L-function of a Hecke character … Mathlib has no ray class group, no Artin symbol and no Frobenius-class prime count, and the Tau Ceti revision … supplies none of them". Also lines 47–49: "the L-functions roadmap's analytic records, which are not at the pins".

**Claim.** The README Summary (README:11–15) names these end theorems:
- the de la Vallée Poussin region for `ζ_K` and for primitive ray-class L-functions (6.2, 6.4);
- the uniform Riemann–von Mangoldt formula for both families (7.5);
- the effective prime count in a ray class (8.7);
- effective abelian Chebotarev (8.8).

According to the docstring, these cannot be stated at the pins. So 6.2, 6.4, 7.5 and 8.7 are stated only at `K = ℚ`, and 8.8 is not stated at all.

**Witness.** The Tau Ceti pin (`2fd255d9`) declares all the needed carriers:
- `TauCeti.LFunctions.heckeLFunctionC` (`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74`);
- `PrimitiveRayClassCharacter` (`Hecke/Primitive.lean:91`);
- `TauCeti.meromorphicContinuation` (`Analysis/Meromorphic/Continuation.lean:72`);
- `GlobalNumberFields.RayClassGroup` (`RayClass/Basic.lean:130`);
- `NumberField.Chebotarev.frobeniusPrimeCount` (`Chebotarev/PrimeCounting/VonMangoldt.lean:177`);
- `AnalyticLFunctionData` (`LFunctions/Data/Basic.lean:82`).

**Repair.** State the general forms and delete the false sentences from the docstring. The following statements elaborate against the pins with only `sorry` warnings. I tested them in a scratch copy with `import Mathlib` plus `TauCeti.NumberTheory.LFunctions.Hecke.{Basic,Primitive}`, `…NumberField.Global.RayClass.{Basic,Finite}`, `…Chebotarev.PrimeCounting.VonMangoldt`, `TauCeti.Analysis.Meromorphic.Continuation` and `TauCeti.Analysis.SpecialFunctions.LogIntegral`, and with `open … TauCeti TauCeti.GlobalNumberFields TauCeti.LFunctions`.

For 6.4, add the "at most one" clause in the same way `dirichletLFunction_zeroFreeRegion` has it. `heckeLFunctionC` is the canonical continuation (`0` if none exists), so these statements cannot be discharged without the continuation; they are not stand-ins. Each new name must also appear, backticked, in its README section.

```lean
theorem dedekindZeta_zeroFreeRegion (n : ℕ) :
    ∃ c : ℝ, 0 < c ∧ ∀ (K : Type) [Field K] [NumberField K], Module.finrank ℚ K = n →
      ∀ ρ₁ ρ₂ : ℂ,
        1 - c / Real.log (|(discr K : ℝ)| * (|ρ₁.im| + 3)) ≤ ρ₁.re →
        1 - c / Real.log (|(discr K : ℝ)| * (|ρ₂.im| + 3)) ≤ ρ₂.re →
        0 < meromorphicOrderAt (meromorphicContinuation 1 (dedekindZeta K)) ρ₁ →
        0 < meromorphicOrderAt (meromorphicContinuation 1 (dedekindZeta K)) ρ₂ →
        ρ₁ = ρ₂ ∧ ρ₁.im = 0 ∧
          meromorphicOrderAt (meromorphicContinuation 1 (dedekindZeta K)) ρ₁ = 1 := sorry

theorem heckeLFunction_zeroFreeRegion (n : ℕ) :
    ∃ c : ℝ, 0 < c ∧ ∀ (K : Type) [Field K] [NumberField K], Module.finrank ℚ K = n →
      ∀ ψ : PrimitiveRayClassCharacter K, ∀ ρ : ℂ,
        1 - c / Real.log (|(discr K : ℝ)| * (Ideal.absNorm ψ.conductor.finitePart : ℝ) *
          (|ρ.im| + 3)) ≤ ρ.re →
        0 < meromorphicOrderAt (heckeLFunctionC ψ.character) ρ →
        ρ.im = 0 ∧ ψ.character ^ 2 = 1 ∧
          meromorphicOrderAt (heckeLFunctionC ψ.character) ρ = 1 := sorry

theorem riemannVonMangoldt_dedekindZeta (n : ℕ) :
    ∃ C : ℝ, ∀ (K : Type) [Field K] [NumberField K], Module.finrank ℚ K = n →
      ∀ T : ℝ, 2 ≤ T →
      |(zeroCount (meromorphicContinuation 1 (dedekindZeta K)) univ
            (Ioo (0 : ℝ) 1 ×ℂ Icc (-T) T) : ℝ) -
          T / Real.pi * Real.log (|(discr K : ℝ)| * (T / (2 * Real.pi * Real.exp 1)) ^ n)| ≤
        C * Real.log (|(discr K : ℝ)| * T ^ n) := sorry

theorem rayClassPrimeCount_effective (K : Type) [Field K] [NumberField K] (𝔪 : Modulus K)
    (c : RayClassGroup 𝔪) :
    ∃ c₀ : ℝ, 0 < c₀ ∧
      (fun x : ℝ ↦ (Set.ncard {I : integralIdealsPrimeTo 𝔪 |
            (I : Ideal (𝓞 K)).IsPrime ∧ (Ideal.absNorm (I : Ideal (𝓞 K)) : ℝ) ≤ x ∧
              idealClass 𝔪 I = c} : ℝ) -
          Real.logIntegral x / Nat.card (RayClassGroup 𝔪))
        =O[atTop] fun x ↦ x * Real.exp (-c₀ * Real.sqrt (Real.log x)) := sorry

theorem frobeniusPrimeCount_effective_abelian (K L : Type) [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L] [IsAbelianGalois K L]
    (C : ConjClasses (L ≃ₐ[K] L)) :
    ∃ c₀ : ℝ, 0 < c₀ ∧
      (fun x : ℝ ↦ (NumberField.Chebotarev.frobeniusPrimeCount K L C x : ℝ) -
          (Nat.card C.carrier : ℝ) / Nat.card (L ≃ₐ[K] L) * Real.logIntegral x)
        =O[atTop] fun x ↦ x * Real.exp (-c₀ * Real.sqrt (Real.log x)) := sorry
```

The Hecke case of 7.5 elaborates in the same way: use `zeroCount (heckeLFunctionC ψ.character) univ (Ioo 0 1 ×ℂ Icc (-T) T)`, with `|d_K| · N𝔣` in place of `|d_K|`.

The open strip leaves out the trivial zero at `0`, which sits on the strip's edge when `r₁ + r₂ > 1`. Inside `0 < Re s < 1`, the zeros of the continued function are exactly those of the completion. For fixed `K` and `𝔪` (and fixed `L/K`), the exceptional terms are absorbed, as the docstring already notes.

What is still not statable is the completion of `ζ_K` and of a Hecke L-function: L-functions Layers 3 and 5 are not at the pin. The docstring should name that, and nothing else, as the reason 8.3–8.4 for `ζ_K` stay README targets.

## R02 (P3) — Supplier contracts name declarations that are not at the pin, and describe pinned ones as absent

**Location.** README:270–278:
- "fields `coeff_one`, `degree_pos`, `completes` … `meromorphic`, `exact_pole_order`, `regular_away` … `polarOrder_reflect`, `eq_away`";
- also lines 118 (`HasMeromorphicContinuation.regular_away`), 567, 1359;
- line 226: "rather than declarations of the Tau Ceti pin";
- lines 64 and 246: "roadmap contracts, including when absent from the library pin".

**Claim.** Layers 0–5 consume the L-functions record under these names. The Arithmetic Dirichlet Series, Global Number Fields, Number Field Arithmetic, Chebotarev and Class Field Theory contracts are described as not being declarations of the pin.

**Witness.** The pinned record is `TauCeti.LFunctions.AnalyticLFunctionData` (`TauCeti/NumberTheory/LFunctions/Data/Basic.lean:174–197`). Its fields are:
- `HasDirichletAgreement`: `completed_eq`;
- `HasMeromorphicContinuation`: `meromorphicOrderAt_eq`, `analyticAt`;
- `HasFunctionalEquation`: `polarOrder_one_sub_conj`, `completed_eq`.

The README's 6.4a consumes `dirichletData`, which has this type. `regular_away`, `reflectedPoint` and `dualCompleted` occur nowhere at the pin.

**Repair.**

1. List Layer 0 under **From Tau Ceti** (`NumberTheory/LFunctions/Data/Basic.lean`, `Data/Normalization.lean`, `Data/RiemannZeta.lean`) with the pinned names:
   - `HasDirichletAgreement` (`coeff_one`, `degree_pos`, `completed_eq`);
   - `HasMeromorphicContinuation` (`meromorphic`, `meromorphicOrderAt_eq`, `analyticAt`);
   - `HasFunctionalEquation` (`norm_rootNumber`, `polarOrder_one_sub_conj`, `completed_eq`);
   - `HasFunctionalEquation.eventuallyEq`, `HasDirichletAgreement.dual`, `HasMeromorphicContinuation.dual`, `gammaFactor_dual`, `dual_completed`, `riemannZetaData`, `ArithmeticLFunctionData`, `NormalizationTranslation`.
2. Write `HasMeromorphicContinuation.analyticAt` at lines 118, 567 and 1359, and `1 − conj s` in place of `reflectedPoint s`.
3. Move the following contracts to **From Tau Ceti**, each with its file:
   - `TauCeti.Real.logIntegral` (`Analysis/SpecialFunctions/LogIntegral.lean:141`);
   - `idealSummatory_mul_eq_sub_integral_mul` (`ArithmeticDirichletSeries/AbelSummation.lean:390`);
   - `truncatedPerron_LSeries` (`Perron/Formula.lean:130`), `truncatedPerronKernel_one` (`Perron/Basic.lean:204`);
   - `RayClassGroup`, `idealClass` (`RayClass/Basic.lean:130, 182`);
   - `integralIdealsPrimeTo` (`RayClass/Modulus.lean:544`);
   - `NumberField.artinSymbol` (`NumberField/ArtinSymbol.lean:57`);
   - the Chebotarev counts (`Chebotarev/PrimeCounting/VonMangoldt.lean:165–177`);
   - `TauCeti.ClassFieldTheory.rayClassArtinMap` (`ClassFieldTheory/Global/AdmissibleModulus/Reciprocity.lean:128`, which assumes `[IsAbelianGalois K L]`).
4. Delete the two "absent from the pin" phrases. Every name above resolved with `#check` at the pin.

## R03 (P3) — Section 6.4a's `*Needs:*` line contradicts its claim that no Hecke construction is needed

**Location.** README:1175: "No general Hecke construction is a prerequisite of this route". README:1273: "*Needs:* 1.4; 1.6; 5.5; 5.6; 6.4d; 6.5".

**Claim.** The direct Dirichlet route does not depend on the Hecke family.

**Witness.**
- 5.6 is stated "for `Λ₀ = entireCompletion d` of one of the two families" (README:1030) and needs 3.1. 3.1 in turn needs L-functions Layer 6 `Grossencharacter.heckeMellinTotal`.
- 6.4d needs `completedHeckeLFunction_one_sub` and `heckeData` (README:1162–1165).
- 6.5 is stated for `Λ_K` or `Λ(χ,·)` through `heckeLFunction_ne_zero_of_one_le_re`.

None of these is about `dirichletData`.

**Repair.** List what the route actually uses:
- 1.4;
- 5.5 applied with `completed_orderLE_one`;
- the record's own real-part cancellation (from `dirichletData_hasFunctionalEquation` and the reality of real `χ`);
- Mathlib `DirichletCharacter.LFunction_ne_zero_of_one_le_re` for the edge;
- the Tau Ceti `dirichletData_*` lemmas;
- the Mathlib names already listed.

Drop 5.6, 6.4d and 6.5, or state their Dirichlet instances inside 6.4a. Then the independence sentence holds as written.

## R04 (P3) — The Riemann–von Mangoldt locator cites a proof reported incomplete

**Location.** README:1423–1424: "(Trudgian, Theorem 1, for `χ` nonprincipal, with absolute constants; Theorem 2 is the Dedekind case …)". Also `Suggested.lean:159` and References README:1825–1829.

**Claim.** Trudgian's Theorems 1–2 establish the uniform counts (`trudgian2015` lines 19–29).

**Witness.** In `bennett2021` (Bennett–Martin–O'Bryant–Rechnitzer, arXiv 2005.02989v1), lines 73–76 say that Trudgian's proof is incomplete: one parameter inequality is wrongly treated as redundant. The same gap recurs in his Theorem 2. Their Corollary 1.2 (lines 83–84) proves the Dirichlet bound for conductor `q > 1` and `T ≥ 5/7`.

**Repair.**
- For the Dirichlet case, cite `bennett2021` Corollary 1.2 (published in Math. Comp., 2021) together with Davenport §16, in the README and in the `riemannVonMangoldt_dirichlet` docstring.
- For the Dedekind case, cite Trudgian's Theorem 2 for the shape of the main term only, note the reported gap, and give 7.5's own route (7.4 with 4.4–4.5) as the proof.
- Add `bennett2021` to the References.

The statements are qualitative (`O(log qT)`), so no statement changes.

## R05 (P3) — The 6.4a block of `Suggested.lean`: two declarations that are not headlines, placed out of README order

**Location.** `Suggested.lean:259–272` (`one_zero_le_logDeriv`), `287–296` (`bounded_level_zero_free`), and the heading at line 231, "## Layer 6, §6.4a", which sits after Layer 8.

**Claim.** Both declarations are headline theorems.

**Witness.**
- `one_zero_le_logDeriv` is `finite_zero_sum_le_logDeriv` with `S = {β}`. It has the same hypotheses and the same right side, and its left side follows because `m_β = analyticOrderNatAt L β ≥ 1` (`L` is entire and nonzero at `2`).
- `bounded_level_zero_free` follows from `DirichletCharacter.LFunction_apply_one_ne_zero` (`Mathlib/NumberTheory/LSeries/Nonvanishing.lean:412`), continuity, and finiteness of the family. Its own docstring disclaims effectiveness.

**Repair.**
- Delete both from `Suggested.lean`. The README keeps them as 6.4a targets, written in italics instead of backticks, since a backticked own name claims a Lean declaration.
- Move the remaining 6.4a declarations (`completed_orderLE_one`, `gammaLogDerivBound`, `finite_zero_sum_le_logDeriv`) to a `/-! ## Layer 6: zero-free regions -/` section placed before Layer 7.

## R06 (P3) — Two library names that do not exist at the pin

**Location.**
- README:711, 718, 824: `Complex.PhragmenLindelof.vertical_strip`;
- README:1329, 1336: `TauCeti.Contour.IsPiecewiseC1On`.

**Claim.** These are pinned declarations.

**Witness.** At the pin, `#check` returns "Unknown constant" for both. The real names are:
- `PhragmenLindelof.vertical_strip`, at the root namespace (`Mathlib/Analysis/Complex/PhragmenLindelof.lean:54, 275`);
- `TauCeti.IsPiecewiseC1On` (`TauCeti/Analysis/Calculus/ContDiff/PiecewiseC1On.lean:78, 91`).

The contract lines 170 and 202 already spell them correctly.

**Repair.** Write `PhragmenLindelof.vertical_strip` at lines 711, 718 and 824, and `TauCeti.IsPiecewiseC1On` at lines 1329 and 1336.

## R07 (P3) — Section 1.4 rebuilds digamma monotonicity that the pinned log-Γ convexity already gives

**Location.** README:500–503: "`x ↦ (Complex.digamma (x : ℂ)).re` is strictly increasing on `Ioi 0`, since its derivative is the positive convergent series … the convergence and the termwise differentiation are part of the target".

**Claim.** The ψ′ series, with its convergence and termwise differentiation, is part of this target.

**Witness.**
- Mathlib pins `Real.convexOn_log_Gamma : ConvexOn ℝ (Ioi 0) (log ∘ Gamma)` (`Mathlib/Analysis/SpecialFunctions/Gamma/BohrMollerup.lean:111`) and `ConvexOn.monotoneOn_deriv` (`Mathlib/Analysis/Convex/Deriv.lean:684`).
- `C_Γ` (README:1203–1206) uses only `ψ(1/2) ≤ ψ(x/2) ≤ ψ(3/2)` on `[1, 3]`, which is plain monotonicity.

**Repair.**
- Cite the two pinned lemmas, and add the adapter identifying `(Complex.digamma x).re` with `deriv (Real.log ∘ Real.Gamma) x` for `x > 0`.
- State the target as "monotone" (strictness is not used).
- Keep the ψ′ series (DLMF 5.15.1) only as an alternative route, not as part of the target.

## R08 (P3) — The convexity targets 3.3 and 3.4 have no locator in the README

**Location.**
- README:722–728 (3.3, the edge bounds and the gamma-quotient estimate);
- README:767–783 (3.4, the strip bound and central-line convexity).

**Claim.** Each theorem carries a locator.

**Witness.** Neither subsection cites a source. Titchmarsh §5.1 and Iwaniec–Kowalski §5.2 appear only in the docstring of `dirichletLFunction_convexity` (`Suggested.lean:83–84`) and in the References.

**Repair.** Add "(Iwaniec–Kowalski §5.2; Titchmarsh §5.1 at `ζ`)" to 3.4. Add "(DLMF 5.11.9, as in 1.5)" to the gamma-quotient sub-target of 3.3, whose exponent I recomputed: `(1 + 2δ)/2` per `Gammaℝ` factor.

## R09 (P3) — Section 8.7 and `primeCounting_progression_effective` differ in quantifier order

**Location.**
- README:1618 "For fixed `K` and `𝔪` there is `c₀ > 0`" and 1636–1637 "At `K = ℚ` and `𝔪 = (q)∞` this is `primeCounting_progression_effective`";
- `Suggested.lean:224`, `∃ c : ℝ, 0 < c ∧ ∀ q a : ℕ, …`.

**Claim.** The Lean declaration is the `K = ℚ` case of 8.7.

**Witness.** The Lean declaration chooses `c` before `q`. 8.7 lets `c₀` depend on `𝔪`, so the Lean statement is strictly stronger. It is still true: the conductor-uniform region of 6.4 gives an absolute width, and for fixed `q` the term `x^β` is `o(x exp(−c√log x))`.

**Repair.** Say in 8.7 that `c₀` depends only on `[K:ℚ]` (on nothing at `K = ℚ`). Note that the implied constant and the exceptional term depend on `K` and `𝔪`, with the route 6.4 + 8.6 as stated.

## R10 (P3) — Section 4.2 states the divisor equality without restricting to `U`

**Location.** README:856–857: "`divisor Λ U` is nonnegative off `polarOrder.support` and equals `−polarOrder` on it".

**Claim.** It equals `−polarOrder` at every pole.

**Witness.** `MeromorphicOn.divisor f U` is `0` off `U`. With `U = ∅`, take the ζ record at `1`: the divisor is `0`, while `−polarOrder 1 = −1`.

**Repair.** Write "equals `−polarOrder` at the points of `U ∩ polarOrder.support`". At `U = univ`, as used in the second clause, the equality is the stated one.

## R11 (P3) — A numerical bound in 6.4a excludes its own endpoint value

**Location.** README:1207: "the gamma term itself is negative, between `−1.5542` and `−0.5542`".

**Claim.** `logDeriv Gammaℝ s ∈ [−1.5542, −0.5542]` on `[1, 3]`.

**Witness.** `ψ(3/2)/2 − (log π)/2 = 0.018245 − 0.572365 = −0.554120 > −0.5542`, so the value at `s = 3` is outside the stated interval. The Check at README:1217 itself gives `≈ 0.55412`.

**Repair.** Write "between `−1.5542` and `−0.5541`"; the computed values are `−1.554120` at `1` and `−0.554120` at `3`.

## R12 (P3) — Another open pull request on the same files, with no stated order

**Location.** The description of this pull request, which does not mention the other one.

**Claim.** None is stated; the overlap tool reports a conflict.

**Witness.** #1913 (ZerosOfLFunctions: effective statements under the exclusion of Landau–Siegel zeros) conflicts with this head in `README.md` and `Suggested.lean`. At its head it rewrites the same Mathlib contract lines 170–176, adds 1.3a, 1.4a and 5.6a around this head's 1.4, and adds Lean declarations.

**Repair.** State in this pull request's description which of #1907 and #1913 is rebased on the other before either merges. Do not restate in one what the other already changes.

## Verified sound

**Gate and build.**
- The worker's gate at `8d25d6d` passes every counter, including the targeted build.
- My own `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` gives exactly 15 warnings, all `declaration uses 'sorry'`, and no errors.
- Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (from `lake-manifest.json`).
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'` is empty.
- There is no `set_option`, no sorry'd data, no `lemma`, no extra import (the single Tau Ceti module `TauCeti.NumberTheory.LFunctions.Dirichlet.Basic` exists at the pin), and no process words or pull-request numbers in the README.

**Dependency check.** Output: `depcheck: 239 roadmaps, 2351 edges, 0 problem(s)`. ZerosOfLFunctions is at line 48 of the merge order, after LFunctions (27). Analytic Number Theory Part I (49) appears only as a downstream consumer (README:1176, 1249, 1809), never in a `*Needs:*` line.

**Signatures.** I compared all 20 elaborated signatures with their README statements; no section binder is lost. The `variable {q} [NeZero q]` binders reach the three 6.4a theorems, whose types mention `q`. `gammaLogDerivBound : ℝ` picks up no binder.

**One-tactic probe.** I replaced every `sorry` by `first | (simp; done) | rfl | infer_instance | (norm_num; done) | positivity`. All 15 of 15 fail. The padding in R05 was found by reading, not by the probe.

**Library names.** I ran `#check` at the pins on the 220 identifier-shaped names the README backticks. Every fully qualified Mathlib or Tau Ceti name (about 80) resolves except the two in R06, and the unqualified supplier names resolve once qualified (for example `TauCeti.LFunctions.heckeLFunctionC_eq_primitive` and `TauCeti.GlobalNumberFields.rayClassIdealMainTerm_eq`). The roadmap-contract names of the L-functions roadmap (Layers 3, 5–8) resolve in `TauCetiRoadmap/LFunctions/Suggested.lean` on main, apart from those covered by R02. The Tau Ceti contour names resolve at the files the README gives:
- `argumentPrinciple_nullHomologous` (`Argument/Cycle.lean:110`), whose hypotheses I compared with 7.2;
- `windingNumber` (`Winding/Number/Basic.lean:76`);
- `exists_continuousOn_arg_lift_with_partition` (`Argument/Lift.lean:427`);
- `windingNumber_comp_eq_integral_logDeriv` (`LogDerivFTC.lean:227`).

The `dirichletData_*` lemmas cited in the contracts are at `LFunctions/Dirichlet/Basic.lean:66–178`, and their stated values match the definition at line 38.

**Cross-roadmap citations.**
- ModularForms Layer 7 (main, lines 708 and 750–760) defines the newform conductor `N(|s_an+(k−1)/2|+3)(|s_an+(k+1)/2|+3)`, which equals 2.4.
- Completed ContourIntegration, ArithmeticDirichletSeries, GlobalNumberFields, NumberFieldArithmetic and Chebotarev are on main; ClassFieldTheory is on main.
- Analytic Number Theory Part I (#1126 head) has §0.30 (line 774) and §0.34b (line 892); both consume ZerosOfLFunctions 6.4 and supply nothing back.

**Ownership and duplication.**
- I grepped both pins for Hadamard factorization, finite order, complex Stirling, zero-free regions, Riemann–von Mangoldt and explicit formulas: none exists. Digamma monotonicity is covered by R07.
- `roadmaps grep` over 466 open pull requests finds no second owner of the 6.4a objects, of Hadamard at order one, or of the zero-free regions. ExplicitZetaBounds (#1954), ExplicitNumberFields (#1944) and Analytic Number Theory Part I (#1126) consume ZerosOfLFunctions sections by name.
- `overlaps.md`: no dropped or revision-only ids. The one other open pull request on this roadmap is #1913 (R12).

**Sources (seeded sample).**
- `dlmf5`:
  - lines 104–108 (5.11.1 on `|ph z| ≤ π−δ`) and 563–569 (§5.11(ii): remainder at most `sec²(½ph z)` times the first neglected term, which gives the `δ`-dependent `O(1/‖s‖)` of 1.2);
  - lines 158–160 (5.11.2);
  - lines 490–524 (5.11.9, uniformly for bounded `x`), which supports 1.3, 1.5 and 3.5.
- The DLMF sections fetched for this review:
  - 5.4.13 `ψ(1/2) = −γ − 2 ln 2` (§5.4 text line 428);
  - 5.4.15 (line 490);
  - 5.5.2 `ψ(z+1) = ψ(z) + 1/z` (§5.5 line 100);
  - 5.5.3 reflection (line 141);
  - 5.15.1 `ψ′(z) = ∑ (k+z)⁻²` (§5.15 line 64).
- `trudgian2015` lines 16–29: Theorems 1–2, counting `0 < β < 1` and `|γ| ≤ T`, for primitive nonprincipal `χ`. These support 7.5's statement but not its proof (R04).
- `kadiri2012` lines 79–85: Theorem 1.1 has both regions, and the exceptional zero is simple and real. Lines 230–237 (§2.1.2) give the explicit formula with `½ log d_K`, `Re 1/s + Re 1/(s−1)` and the gamma term, as 6.4d cites. The README's References give Math. Comp. 84 (2015) 1439–1450 for Trudgian, which matches the AMS listing. The board manifest's venue for `trudgian2015` ("no. 294, pp. 2047–2058") is wrong; that file is outside this pull request.
- The locators of 1.1, 4.2, 4.6, 5.2, 6.5, 7.2, 8.1 and 8.9 are pinned declarations or derivations. I checked each in the table below.

**Adversarial table** (values computed; "✓" means both sides agree).

| Statement | Instance | Left / claimed | Right / computed | Result |
|---|---|---|---|---|
| 1.1 branch normalization | `logGamma δ 3`, `Γ(3)=2` | `log 2` | `0.693147` (`log 2 + 2πi` for a shifted branch) | ✓ |
| 1.1 `Complex.log ∘ Γ` is not a branch | `arg Γ(it)` from 5.11.1 | `Im[(it−½)(log t+iπ/2) − it]` | `t log t − t − π/4`; at `t = 10` this is `12.2405` and passes `3π` | ✓ |
| 1.1 `S_δ` simply connected | image under `log` | `(0,∞) × (−(π−δ), π−δ)` | convex; poles have `|arg| = π` | ✓ |
| 1.2 Stirling, remainder | `z = 10` | `lnΓ(10) − main = 12.801827 − 12.793497` | `0.0083306 ≤ 1/120 = 0.0083333` (§5.11(ii)) | ✓ |
| 1.3 vertical strips | `σ = ½`, `t = 10`, `|Γ|² = π/cosh πt` | `½ log π − ½ log cosh 10π = −14.78902` | `−5π + ½ log 2π = −14.78902` | ✓ |
| 1.4 `logDeriv Gammaℝ` | `Gammaℝ s = π^(−s/2)Γ(s/2)` | `−½ log π + ½ψ(s/2)` | as stated | ✓ |
| 1.5 record gamma factor | `gammaR={0}`, `σ = ½` | `log|Gammaℝ| = −¼log π + log|Γ(¼+it/2)|` | `−πt/4 − ¼ log t + O(1)`; coefficient `(σ−1)/2 = −¼` | ✓ |
| 1.5 Check `gammaR={0,1}` | `Gammaℝ(s)Gammaℝ(s+1) = Gammaℂ(s)` | divisor `−1` at each `−m` | rate `π·2/4 = π/2` | ✓ |
| 1.6 Check `ζ(0)` | raw quotient vs continued | `0` (division by `Gammaℝ 0 = 0`) | `riemannZeta_zero = −1/2` | ✓ |
| 0 entire completion of ζ | `s(s−1)Λ₀ + 1` at `0, 1` | `1, 1` | pole terms `−(s−1)+s = 1` | ✓ |
| 0 `1/Γ` is not of exponential type | `s = −n−½` | `‖1/Γ‖ = Γ(n+3/2)/π` | `log ≈ n log n`, beats `Cn` | ✓ |
| 3.1 tail integral | `R=0, c=α=1` | `E₁(1) = 0.2194` | `≤ Γ(1) = 1` | ✓ |
| 3.1 Check `exp(sin πs)` | `σ = ½` | `log‖g‖ = Re cos(iπt)` | `cosh πt`; edges have norm `1` | ✓ |
| 3.3 gamma quotient | `s = −δ+it`, one `Gammaℝ` | `((δ+Re μ) − (−δ+Re μ−1))/2` | `(1+2δ)/2`; total `(n/2)(1+2δ)` | ✓ |
| 3.4 interpolated exponent | `σ = −δ, ½, 1+δ` | `(½+δ)(1+δ−σ)/(1+2δ)` | `½+δ`, `¼+δ/2`, `0` | ✓ |
| 3.5 Check | `Λ(20+2i)`, `Λ(40+2i)` | `π^(−m)|Γ(m+i)|` | `3.67680`, `13519751.81` (recomputed) | ✓ |
| 4.1 Check | `z/(z−1)` on `closedBall 0 2` | `zeroCount = 1` | `divisorCount = 0` | ✓ |
| 4.2 divisor | ζ record, `U = ∅`, `p = 1` | `−polarOrder 1 = −1` | `divisor = 0` | R10 |
| 4.3 trailing form | `f = z`, `r = ¼`, `R = ½`, `M = 1` | count `1` | bound `1 + log 2/log 2 = 2`; naive form gives `0` | ✓ |
| 4.6 Nevanlinna | `f = z`, `f = 1/z`, `r=1`, `R=2` | `n(1) log 2 = 0.693` | `N(2)−N(1) = log 2`; signed form `−log 2` | ✓ |
| 4.5 Check | ζ, `T = 100` | `N = 29` | `N± = 58` | ✓ |
| 5.2 `E₁` | `z = −½`; `z = 1` | `|E₁ − 1| = 0.090204` | `≤ ½·¼ = 0.125`; `E₁′(1) = −e` | ✓ |
| 5.5 example | `f = 1 − s` | `exp(−s)(1−s)e^s` | `1 − s` (`a=0`, `b=−1`) | ✓ |
| 6.2 Check `χ₀` mod 2 | `L(0) = (1−1)ζ(0)` | `0` | excluded by cap: `1 − (log3/2)/log 6 = 0.693 > 0` | ✓ |
| 6.4a identity | MV normalization `(q/π)^((s+κ)/2)Γ` | `∑Re 1/(σ−ρ)` | `Re L′/L + ½log q + logDeriv Gammaℝ(σ+κ)` (needs `Re B = −∑Re 1/ρ`) | ✓ |
| 6.4a `C_Γ` | definition | `(1.963510 + 0.036490 + 1.144730)/2` | `1.572365 = 1 + ½log π` | ✓ |
| 6.4a bound on `[1,3]` | `s = 1, 3` | `|−1.554120|`, `|−0.554120|` | `≤ 1.572365`; `ψ(1)` variant `0.879218` fails | ✓ / R11 |
| 6.4a sign Check | `ρ = ½+14i`, `σ = 2` | `1.5/198.25` | `0.0075662 > 0` | ✓ |
| 6.4a radius Check | `Q = 4` | `L(1,χ₋₃)`, `L(1,χ₋₄)` | `0.604600`, `0.785398` | ✓ |
| 6.5 Check | `χ₋₄` at `1` | `2·(1/π)·(π/4)` | `0.5`, order `0` | ✓ |
| 7.2 negative control | `f = z−2`, `S = {2}`, `R = [−1,1]²` | integral `0` | `ord₂ = 1` (only the `S ∩ R` sum is true) | ✓ |
| 7.3 Check | `ζ(2+it)` | `Re ≥ 2 − ζ(2)` | `0.355 > 0` | ✓ |
| 7.5 generic record | `ζ(s)(1+5·2^(−s)+2·4^(−s))` | zeros of `1+5x+2x²` | `Re s = 2.18953`, `−1.18953`; `2^s P` is invariant under `s ↦ 1−s` | ✓ |
| 8.1 kernel | `truncatedPerronKernel_one` at the pin | `π⁻¹ arctan(T/c)` | `T=c=1`: `0.25 ≠ ½` | ✓ |
| 8.2/8.3 residues | `K = ℚ` | `c_ℚ = −ζ′(0)/ζ(0)` | `−log 2π = −1.837877`; even trivial zeros give `−½log(1−x⁻²)` | ✓ |
| 8.3 general | `r₁+r₂` / `r₂` orders | `∑ x^(−m)/m` | `−½log(1−x⁻²)`, `½log((x+1)/(x−1))` | ✓ |
| 8.4 Weil | shift `(2) → (−1)`, `Λ′/Λ(s) = −Λ′/Λ(1−s)` | `∑m_ρφ̃(ρ) − φ̃(0) − φ̃(1)` | `(2πi)⁻¹∫_(2)(Λ′/Λ)(φ̃(s)+φ̃(1−s))`; primes give `φ(n)+φ(1/n)/n` | ✓ |
| 8.4 Check | archimedean constant | `−½log π·(φ(1)+φ̌(1))` | `−(log π)φ(1)` | ✓ |
| 8.6 Check | quartic `χ` mod 5, `χ(2)=i` | `log2·conj(i)·½` | `−(i log 2)/2` | ✓ |
| 8.7 Check | `𝔪 = (3)∞` | `(½)(1−⅓)` | `⅓` = density of `n ≡ 1 (3)` | ✓ |
| 8.9 | `Li` by parts at `x = 2` | `2/log2 − 2/log2 + 0` | `0` (`li 2 = 1.045164`) | ✓ |
| `dirichletLFunction_convexity` | `q = 1`, `t = 0` | `|ζ(½)| = 1.460354` | `≤ C·3^(¼+ε)` | ✓ |
| `hadamard_of_orderLE_one` | `f = s` (hypothesis `f 0 ≠ 0` removed) | factor at `ρ = 0` is `1` (Lean junk) | would force `s = exp(a+bs)`, false; hypothesis needed | ✓ |
| `zetaEntireCompletion_hadamard` | value at `0` | `1 ≠ 0` | order 1 (3.1) | ✓ |
| `riemannZeta_zeroFreeRegion` | trivial zero `−2` | inside only if `c ≥ 3log 3` | excluded for small `c` | ✓ |
| `dirichletLFunction_zeroFreeRegion` | principal `χ` at `1` | order `−1` | premise `0 < order` false | ✓ |
| `riemannVonMangoldt` | `T = 100` | `N = 29` | main term `28.1273`; difference `0.873` | ✓ |
| `riemannVonMangoldt_dirichlet` | `q = 1`, `T = 100` | `N± = 58` | `56.2547`; difference `1.745 ≤ C·4.605` | ✓ |
| `chebyshevPsi_explicitFormula` | `|γ| = T` vs `< T`, `T ≤ x` | `O(log T)` zeros of size `x/T` | absorbed in `x log²x/T` | ✓ |
| `riemannZeta_weilExplicitFormula` | `φ = 0`; signed divisor | `0 = 0` | signed form off by `φ̃(0)+φ̃(1) > 0` | ✓ |
| `primeIdealCount_effective` | `K = ℚ`, `x = 100` | `25` | `Li(100) = 29.081` | ✓ |
| `primeCounting_progression_effective` | `q = 4`, `a = 3`, `x = 100` | `13` | `Li(100)/2 = 14.540` | ✓ / R09 |
| `completed_orderLE_one` | `χ₋₄`, `s = 1` | `2^1·Λ` | `0.5`; `q^(s/2)` has order 1 | ✓ |
| `finite_zero_sum_le_logDeriv` | `χ₋₄`, `S = {½+6.0209i}`, `σ = 2` | `1.5/(2.25+36.25) = 0.0390` | right side `≥ −0.6 + 0.693 + 1.572` | ✓ |
| `one_zero_le_logDeriv` | `S = {β}` in the finite-sum form | `m_β/(σ−β) ≥ 1/(σ−β)` | same right side | R05 |
| `bounded_level_zero_free` | `Q = 0, 1` | empty family | `δ = 1` | ✓ / R05 |
| R01 statements | scratch elaboration at the pins | 6 declarations | 6 `sorry` warnings, 0 errors | R01 |

**Notes needing no change.**
- In the 6.4a inequalities, `hq : 3 ≤ q` follows from `χ ≠ 1` (moduli 1 and 2 carry only the principal character).
- `hreal` is not needed for the identity once `Re B(χ) = −∑ Re 1/ρ` is known for every primitive `χ`, but the stated route and the consumer use it.
- For the families, the cancellation of 5.6 also uses the functional equation, not reality alone. `e^s` is real and has `b = 1` with no zeros, but it is outside the families.

## Not verifiable

- Montgomery–Vaughan, *Multiplicative Number Theory I* (sampled 6.4a: Theorem 10.16 p. 351, Corollary 10.18 (10.37)–(10.38) pp. 352–353). The sources service found no legal copy (the Cambridge landing page has no licence class). I checked the mathematics instead (the 6.4a identity row).
- Lang, *Algebraic Number Theory*, GTM 110 (sampled 8.4: XVII §3, Theorem 3.1). DOI 10.1007/978-1-4612-0853-2 is paywalled (the service reports it as uncertified). I checked the formula by the contour shift in the table.
- Davenport, GTM 74 (§§11–20, sampled 8.2 via §17); Titchmarsh, 2nd ed. (§§5.1, 9.2–9.4); Iwaniec–Kowalski (§§5.1–5.2, (5.7)); Lagarias–Odlyzko (1977). These are paywalled publisher texts with no open copy; they are cited by locator only.

## Source issues

- **Gap** in trudgian2015 at Theorems 1 and 2, proofs §§4–5, arXiv v4 pp. 7–11 (`trudgian2015` lines 291–514). The source treats one of the parameter inequalities in its argument as redundant. That inequality must actually be verified (`bennett2021` lines 73–76), otherwise the stated constants are unproved. This affects a stated result (the explicit constants of Theorems 1–2). Corrected in print, for the Dirichlet case, at `bennett2021` Corollary 1.2.
