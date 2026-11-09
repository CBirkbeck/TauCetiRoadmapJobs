# Review of ZerosOfLFunctions (pull request #1913 at f6187a0)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ZerosOfLFunctions/` at `f6187a0`. The previous review (PRREVIEW-ZerosOfLFunctions~17) read the same head. Nothing in the folder has changed since then, and nothing outside it either.

- **Previous findings.** None of the five previous findings is repaired. They are carried below as R02–R05 and R08.
- **New findings.** The full pass adds three: R01, R06 and R07.
- **Settled findings.** There is no repair report, so no finding is settled as "not actionable".

Paths: `TauCeti/…` is a file of the Tau Ceti pin `2fd255d9`. `LFunctions/…` and the other bare roadmap names are files of that roadmap on main `34f48ff`.

## R01 (P1) — 6.4(4b) bounds the Euler correction by the conductor, not by the presentation modulus

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`, line 1275: "`‖logDeriv eulerCorrection s‖ ≤ 2 log 𝔑𝔣` for `Re s > 1`". In 6.4, 𝔣 is the conductor of the primitive χ (line 1258).

**Claim.** The deleted Euler factors of an imprimitive presentation have a logarithmic derivative bounded by `2 log 𝔑𝔣`.

**Witness.** `eulerCorrection χ 𝔫` runs over `𝔫.support \ 𝔪.support`, the primes of the presentation modulus that do not divide the conductor (`LFunctions/Suggested.lean:1576–1578`). Take `K = ℚ`, the trivial character (𝔣 = 1) presented at `𝔫 = (2)`. Then `logDeriv (1 − 2^{−s})` at `s = 2` is `(log 2)/3 = 0.2310`, which exceeds `2 log 1 = 0`.

**Repair.** Replace `2 log 𝔑𝔣` by `log 𝔑𝔫`, with 𝔫 named as the presentation modulus. The bound holds because each factor gives `log N𝔭 · N𝔭^{−σ}/(1 − N𝔭^{−σ}) ≤ log N𝔭` for `σ > 1`. This also matches 8.7, line 1720: "the deleted factors move the logarithmic derivative by `O(log 𝔑𝔪)`".

**Test.** On the instance above, `log 𝔑𝔫 = log 2 = 0.6931`. The left side is `0.6931` as `s → 1⁺`, `0.3791` at `s = 3/2` and `0.0990` at `s = 3`, all within the bound.

## R02 (P2) — Headline theorems that can be stated at the pinned Tau Ceti are absent, and the docstring says they cannot be (previous R01, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean`, lines 28–44:

- "neither library has its continuation to `ℂ`, its completion, or the L-function of a Hecke character";
- "the Tau Ceti revision this file is built against supplies none of them";
- "the L-functions roadmap's analytic records, which are not at the pins".

**Claim.** The general-`K` end theorems of the Summary (6.2–6.4, 7.5, 8.7, 8.8) cannot be stated at the pins.

**Witness.** The pin declares all the carriers these statements need:

- `heckeLFunctionC` (`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74`);
- `PrimitiveRayClassCharacter` (`Hecke/Primitive.lean:91`);
- `RayClassGroup` (`NumberField/Global/RayClass/Basic.lean:130`);
- `NumberField.artinSymbol` (`NumberField/ArtinSymbol.lean:57`);
- `frobeniusPrimeCount` (`Chebotarev/PrimeCounting/VonMangoldt.lean:177`);
- `AnalyticLFunctionData` (`LFunctions/Data/Basic.lean:82`).

The open head of #1907 states these headlines.

**Repair.** Choose one of two routes.

1. **Rebase on #1907** and keep its statements, without a second version.
2. **Otherwise**, make three changes:
   - Add `TauCeti.*` imports and the three statements below, plus `riemannVonMangoldt_heckeLFunction` in the form of the previous report.
   - Name each one in the README at 6.4, 7.5, 8.7 and 8.8.
   - Rewrite lines 28–44 so that they name only what the pin lacks: `completedDedekindZeta`, `completedHeckeLFunction`, and the exceptional-zero terms defined from them.

```lean
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

**Test.** This round I elaborated these three statements at this pin. The scratch file imports:

- `TauCeti.NumberTheory.LFunctions.Hecke.{Basic,Primitive}`;
- `TauCeti.NumberTheory.Chebotarev.PrimeCounting.VonMangoldt`;
- `TauCeti.NumberTheory.NumberField.Global.RayClass.Basic`;
- `TauCeti.Analysis.SpecialFunctions.LogIntegral`.

The result is 3 `sorry` warnings, no error, and exit 0. Two checks on the zero-free statement:

- At `ψ = 1`, the pole at `1` has order `−1`, so it is not counted as a zero.
- For the trivial character, the zeros on `Re s ≤ 0` lie outside the region once `c < log 3`.

## R03 (P3) — The supplier contracts cite pinned objects under the L-functions roadmap's names, and call pinned declarations "roadmap contracts" (previous R02, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- lines 265–273 (`dualCompleted`, `reflectedPoint`, `exact_pole_order`, `regular_away`, `eq_away`, `hasFunctionalEquation_eventuallyEq`);
- lines 118, 362, 642–643, 649–650, 655, 881 and 1405;
- lines 293, 300, 1278, 1295 and 1325 (`PrimitiveRayClassCharacter.inv`);
- line 64 ("these are roadmap contracts, including when absent from the library pin");
- line 223 ("rather than declarations of the Tau Ceti pin");
- line 243.

**Claim.** These objects are roadmap contracts, not declarations at the pin.

**Witness.** The pin declares them under other names:

- `HasMeromorphicContinuation.analyticAt` (`LFunctions/Data/Basic.lean:187`);
- `meromorphicOrderAt_eq` (`:185`);
- `HasDirichletAgreement.completed_eq` (`:177`);
- `HasFunctionalEquation.eventuallyEq` (`:269`), which lines 560 and 1160 already cite;
- the `InvolutiveInv` instance for `PrimitiveRayClassCharacter` (`Hecke/Primitive.lean:192`).

Every Arithmetic Dirichlet Series name is also a declaration at the pin, for example `perronFormula` (`ArithmeticDirichletSeries/Perron/Ideal.lean:161`).

**Repair.**

1. Rename to the pin names (previous report's table): `regular_away` → `analyticAt`, `exact_pole_order` → `meromorphicOrderAt_eq`, `completes` → `completed_eq`, `polarOrder_reflect` → `polarOrder_one_sub_conj`, `eq_away` → `completed_eq`, `dualCompleted` → `dual_completed`, `dual_gammaFactor` → `gammaFactor_dual`, `dual_has…` → `HasDirichletAgreement.dual` and `HasMeromorphicContinuation.dual`, `reflectedPoint s` → `1 − conj s`, `PrimitiveRayClassCharacter.inv χ` → `χ⁻¹`.
2. Under "From Tau Ceti", list the pinned files the README consumes:
   - `LFunctions/Data/{Basic,Normalization,RiemannZeta}.lean`, `LFunctions/Dirichlet/Basic.lean`, `LFunctions/Hecke/{Basic,Primitive}.lean`;
   - `ArithmeticDirichletSeries/{AbelSummation,VonMangoldt}.lean`, `Perron/{Basic,Formula,Ideal}.lean`, `Prime/Boundary.lean`;
   - `Analysis/SpecialFunctions/LogIntegral.lean`;
   - `NumberField/Global/RayClass/{Basic,Modulus,Finite,MainTerm}.lean`;
   - `NumberField/ArtinSymbol.lean`;
   - `Chebotarev/PrimeCounting/{VonMangoldt,FrobeniusPrimeCount}.lean`;
   - `ClassFieldTheory/Global/AdmissibleModulus/Reciprocity.lean`.
3. Delete the phrases at lines 64, 223 and 243.

**Test.** `#check` of each pin name elaborates in this round's scratch file. After the repair, a grep for `regular_away|exact_pole_order|hasFunctionalEquation_eventuallyEq|reflectedPoint|roadmap contracts` finds nothing.

## R04 (P3) — `TauCeti.Contour.IsPiecewiseC1On` does not exist at the pin (previous R03, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 208, 1375 and 1382, for example "`TauCeti.Contour.IsPiecewiseC1On (rectBoundary R) 0 4`".

**Claim.** The pin declares the piecewise-`C¹` predicate in the `Contour` namespace.

**Witness.** This round, `#check @TauCeti.Contour.IsPiecewiseC1On` fails with "Unknown identifier", while `#check @TauCeti.IsPiecewiseC1On` succeeds (`TauCeti/Analysis/Calculus/ContDiff/PiecewiseC1On.lean:91`, inside `namespace TauCeti`).

**Repair.** Write `TauCeti.IsPiecewiseC1On` at the three places, and give its file in "From Tau Ceti".

**Test.** `TauCeti.Contour.argumentPrinciple_nullHomologous` takes `TauCeti.IsPiecewiseC1On γ a b` (elaborated signature), so 7.1 composes with 7.2.

## R05 (P3) — The Trudgian theorems cited for 7.5 have a published gap (previous R04, not repaired)

**Location.**

- `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 1479–1480: "(Trudgian, Theorem 1, for `χ` nonprincipal, with absolute constants; Theorem 2 is the Dedekind case; Davenport §16)";
- the References, lines 1937–1941;
- `Suggested.lean`, line 177.

**Claim.** Trudgian's Theorems 1 and 2 are cited as proved sources for the conductor-uniform counts.

**Witness.** `bennett2021` lines 73–76: Trudgian wrongly treated one parameter inequality as redundant, which leaves his Theorems 1 and 2 incomplete. `hasanalizade2022` lines 40–41 repeat this for the Dedekind case.

**Repair.**

1. Cite Bennett–Martin–O'Bryant–Rechnitzer, Corollary 1.2 (`bennett2021` lines 83–84; conductor `q > 1`, `T ≥ 5/7`) for the Dirichlet count.
2. Cite Hasanalizade–Shen–Wong, Corollary 1.2 (`hasanalizade2022` lines 63–65; `T ≥ 1`) for the Dedekind count.
3. Keep Trudgian as the earlier statement, and add both papers to the References.

**Test.** Both corollaries imply the README's existential form for `T ≥ 2`, since `n log T ≥ n log 2` absorbs the constants `D₂ n + D₃`.

## R06 (P3) — 6.1 cites the Dedekind logarithmic derivative for the three presented Hecke series

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 1196–1203. The text reads "each logarithmic derivative is `∑_𝔞 Λ_K(𝔞) ψ(𝔞) 𝔑𝔞^{−s}`", and the *Needs:* line reads "L-functions Layers 5, 7, 8 … `dedekindZeta_logDeriv_eq`".

**Claim.** The cited supplier gives the character-weighted identity for `heckeLFunctionC ψ` presented at `𝔣`.

**Witness.** `dedekindZeta_logDeriv_eq` states the identity for `dedekindZeta K` only, over all ideals (`LFunctions/Suggested.lean:2822`). The pin supplies the character case as `TauCeti.MultiplicativeIdealWeight.hasSum_logDeriv_eulerFactor` (`ArithmeticDirichletSeries/EulerProduct/Logarithm/LogDeriv.lean:158`) and `vonMangoldtTransform_apply_prime_pow` (`VonMangoldt.lean:236`), which is Arithmetic Dirichlet Series §2.3.

**Repair.** Add "Arithmetic Dirichlet Series §2.3 (`TauCeti.MultiplicativeIdealWeight.hasSum_logDeriv_eulerFactor`, `TauCeti.MultiplicativeIdealWeight.vonMangoldtTransform_apply_prime_pow`)" in three places:

- the *Needs:* lines of 6.1 and 8.6, the latter because `ψ_K(x, χ)` is the coefficient of `−L'/L(χ)`;
- the Arithmetic Dirichlet Series contract (lines 225–226);
- the Layer 6 Dependencies.

Keep `dedekindZeta_logDeriv_eq` for 8.3.

**Test.** The identity is needed at the trivial character presented at `𝔣 = (3)∞`, where `L₁` is `(1 − 3^{−s}) ζ(s)`, not `ζ`. `dedekindZeta_logDeriv_eq` misses the term `log 3 · 3^{−s}/(1 − 3^{−s})`. The `MultiplicativeIdealWeight` lemma covers it.

## R07 (P3) — The newform analytic conductor is located in the wrong place and compared in the wrong coordinate

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- lines 33–35: "the newform analytic conductor that the modular forms roadmap displays in its Layer 7 is the specialization proved in 2.4";
- lines 699–702: "`analyticConductorAt d s = N (‖s + (k − 1)/2‖ + 3)(‖s + (k + 1)/2‖ + 3)`, the modular forms roadmap's displayed quantity".

**Claim.** The ModularForms roadmap displays this quantity in its Layer 7, and 2.4 identifies with it as written.

**Witness.**

- ModularForms Layer 7 (`ModularForms/README.md:785`, "sharp L-series convergence") never mentions a conductor. The object is the pinned `HeckeRing.GL2.Newform.analyticConductorAt` (`TauCeti/NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean:125`), which ModularForms cites at line 243.
- The pinned function takes the arithmetic `s`, and `analyticConductorAt_eq` (`:133`) gives `N(‖s‖ + 3)(‖s + 1‖ + 3)`.

**Repair.**

1. Cite the pinned declaration and its file in "From Tau Ceti".
2. Fix the Scope locator.
3. State 2.4 as `analyticConductorAt d s = HeckeRing.GL2.Newform.analyticConductorAt f (s + (k − 1)/2)`, with a Check at `k = 12`, `N = 1`, `s = 1/2`.

**Test.** For `k = 12`, `N = 1` and analytic `s = 1/2`:

- the README value is `(6 + 3)(7 + 3) = 90`;
- the pinned function at `1/2` gives `3.5 · 4.5 = 15.75`;
- the pinned function at the shifted point `6` gives `9 · 10 = 90`.

## R08 (P3) — The pull request's title, description and stated merge order are stale, with no order stated against #1907 (previous R05, not repaired)

**Location.** The pull request's title, "effective statements under the exclusion of Landau–Siegel zeros", and its description: "Merge order: after AnalyticNumberTheoryPartI (#1126) lands, since the strengthened statements refer to its §0.34."

**Claim.** The pull request restates the roadmap in exception-free form and depends on AnalyticNumberTheoryPartI.

**Witness.**

- README lines 82–84 exclude Siegel's theorem and every uniform lower bound for `1 − β`, and lines 1895–1896 keep the exceptional-zero alternative.
- `ORDER.txt` lists this roadmap at line 48 and its consumer AnalyticNumberTheoryPartI at line 50.
- `overlaps.md` reports that #1907 conflicts in both files.

**Repair.**

1. Retitle the pull request, and describe this head.
2. Delete the "after AnalyticNumberTheoryPartI" sentence.
3. State which of #1913 and #1907 is rebased on the other before either merges.

**Test.** The new description then agrees with README lines 82–84 and 1895–1896, with `ORDER.txt` lines 48–50, and with R02.

## Previous findings (PRREVIEW-ZerosOfLFunctions~17)

- **R01 — not repaired.** `Suggested.lean` line 40 still reads "the Tau Ceti revision this file is built against supplies none of them". Carried as R02.
- **R02 — not repaired.** README line 271 still reads "`AnalyticLFunctionData.hasFunctionalEquation_eventuallyEq`", and line 223 still reads "rather than declarations of the Tau Ceti pin". Carried as R03.
- **R03 — not repaired.** Line 1382 still reads "Tau Ceti `TauCeti.Contour.IsPiecewiseC1On`". Carried as R04.
- **R04 — not repaired.** Line 1479 still reads "(Trudgian, Theorem 1, for `χ` nonprincipal". Carried as R05.
- **R05 — not repaired.** The title is unchanged. Carried as R08.

## Verified sound

**Gate and dependency check.**

- My gate run printed every check at 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, and exited 0. The worker's gate, which includes `build=0`, also passes.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check printed one line and exited 0, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 239 roadmaps, 2322 edges, 0 problem(s)
```

**Elaboration.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 with exactly 13 "declaration uses `sorry`" warnings (lines 80–241).

**Signatures.** A scratch copy with `#check @name` for all 16 declarations gives types identical to `signatures.md`, and each matches its README statement. The file has no `variable` block, so no binder is lost. Nothing was changed.

**Padding.** In a scratch copy I replaced every `sorry` with `first | (simp; done) | rfl | infer_instance | (norm_num; done)`. All 13 theorems fail with "unsolved goals", so none is padding. The ζ instances of 5.6a and 6.4d are lemmas behind the headlines, not restated definitions or Checks.

**Library declarations at the pins.**

- **Mathlib.** All 95 Mathlib names the README cites elaborate in one scratch file (exit 0). I compared the exact statements with the README's descriptions for:
  - `AnalyticOnNhd.sum_divisor_le` (`0 < |r| < |R|`, `1 ≤ M`, finsum of the divisor on `closedBall c |r|`; matches 4.3);
  - `ValueDistribution.log_counting_zero_sub_logCounting_top` and `Function.locallyFinsuppWithin.logCounting_divisor_eq_circleAverage_sub_const` (match 4.6);
  - `logDeriv_riemannZeta_one_sub` (`s ∉ ℤ`, `ζ s ≠ 0`, the `tan` form; matches 1.4a);
  - `PhragmenLindelof.vertical_strip` (growth `O(exp(B exp(c|Im z|)))`, `c < π/(b − a)`; matches 3.2);
  - `Summable.multipliableLocallyUniformlyOn_one_add`, `tprod_one_add_ne_zero_of_summable` and `logDeriv_tprod_eq_tsum` (5.3, 5.5);
  - `AnalyticAt.analyticOrderAt_eq_natCast`, `AnalyticAt.meromorphicTrailingCoeffAt_of_ne_zero_of_eq_nhdsNE` and `MeromorphicOn.meromorphicOrderAt_ne_top_of_isPreconnected` (4.3, 7.2);
  - `LocallyFiniteSupport.finite_inter_support_of_isCompact` (4.1).
- **Tau Ceti `2fd255d9`.** A scratch file importing 18 built modules checks the README's fully qualified names. All of them elaborate except `TauCeti.Contour.IsPiecewiseC1On` (R04). The two Chebotarev names it did not import are at `Chebotarev/PrimeCounting/FrobeniusPrimeCount.lean:91, :108`. Two signatures match the README's descriptions:
  - `argumentPrinciple_nullHomologous` (`Analysis/Contour/Argument/Cycle.lean:110`) matches the description at lines 211–214 and 7.2;
  - `windingNumber_comp_eq_integral_logDeriv` (`LogDerivFTC.lean:227`) matches 7.3.
- **Arithmetic Dirichlet Series.** `truncatedPerronKernel_one` (`ArithmeticDirichletSeries/Perron/Basic.lean:204`) is `π⁻¹ arctan(T/c)`, as 8.1 says. `NormalizationTranslation.gammaR_eq` (`LFunctions/Data/Normalization.lean:135`) adds `weight/2`, as Layer 2 says.

**Cross-roadmap citations, resolved on main `34f48ff`.**

- **LFunctions.** All 67 names in the supplier contract exist in `LFunctions/Suggested.lean`, in the layers cited: Layers 2–3 to line 1046; Layers 5–6 at lines 1535–2550; Layer 7 at lines 2680–2688; Layer 8 at lines 2820–2828.
- **Global Number Fields.** Layers 2, 3 (main-term identity at line 396) and 9.
- **Number Field Arithmetic.** §2.3 (line 647).
- **Chebotarev.** Layers 2, 11, 13 and 14, and its section "The boundary with Zeros of L-functions" (line 695), which hands the error terms here.
- **Class Field Theory.** Layer 12 (line 1756).
- **Relative links.** All 8 relative README links resolve.
- **Pinned names.** `roadmaps resolve` listed 20 names as found nowhere in the pins. They fall into three groups:
  - seven are LFunctions roadmap names for objects that the pin declares under other names (R03);
  - six are `Grossencharacter.*` names of LFunctions Layer 6, which is not yet at the pin, and they resolve at `LFunctions/Suggested.lean:2390–2468`;
  - seven are PrimeNumberTheoremAnd names from the Provenance table, checked below.

**Sources: the seeded sample.**

- **3.5.** `dlmf5` line 492 (5.11.9, uniform for bounded `x`) and lines 104–108 (5.11.1 in the sector) support it. The remainder bound at lines 563–569 supports the `O(1/|t|)` of 1.3.
- **6.2.** `kadiri2012` lines 79–85 (Theorem 1.1, p. 2: zero-free for `|Im s| ≥ 1`; at most one real simple zero for `|Im s| ≤ 1`; `d_K` large) support it as written.
- **5.6.** `kadiri2012` lines 230–237 (§2.1.2, p. 5: the real-part formula with `½ log d_K` and `Re 1/s + Re 1/(s − 1)`) support it.
- **7.5.** `trudgian2015` lines 16–27 (Theorems 1–2, p. 1: `0 < β < 1`, `|γ| ≤ T`, the main terms as quoted) support it, subject to R05.
- **3.1, 4.3, 4.6, 5.2, 7.2, 8.9.** Their locators are pinned declarations, checked above.
- **Provenance rows.** I read all nine rows at commit `127b50e`, and none of the files uses `sorry`:
  - 1.4a: `Kadiri.kadiri_thm_3_1_q1_functional_eq` has the four hypotheses and the rearranged symmetric form.
  - 5.2: `Complex.weierstrassFactor m z = (1 − z) exp(partialLogSum m z)`.
  - 5.3: `differentiable_divisorCanonicalProduct_univ` and `divisor_hadamardDenom_eq` take the genus-`m` summability hypothesis.
  - 5.5: `hadamard_factorization_of_order` takes `EntireOfOrderAtMost ρ f` (`‖f‖ ≤ exp(C(1 + ‖z‖)^{ρ+ε})`), which is equivalent to `OrderLE` for `ρ ≥ 0`.
  - 5.6a: `summable_riemannXi_divisorZeroIndex₀_norm_inv_sq`.
  - 6.2: `ZeroInequality` is for `|t| ≥ 2`.
  - 6.4d: `ShiftTwoBound` and `ShiftOneBound` take `δ ∈ Ioo 0 1` and `|t| ≥ 2`.
  - 7.2: `rectangleIntegral_logDeriv_eq_sum_meromorphicOrderAt` is stated for `RectangleIntegral'`, with no zero of the divisor on the border.
  - 8.5: `StrongPNT` is the `ψ` form.
- **Unverified flags.** The README flags no locator as unverified.

**Ownership.**

- **#1126 (AnalyticNumberTheoryPartI).** It owns Hadamard factorization beyond order one, and cites 5.2–5.6 for order one (its README lines 12, 88 and 631).
- **#1954 (ExplicitZetaBounds), #1945 (ExplicitPrimeCounting), #1944 (ExplicitNumberFields).** They own explicit-constant versions and cite this roadmap 46, 38 and 33 times.
- **#2008 (AnalyticNumberTheoryPartIII).** It cites this roadmap 20 times.
- **Dropped ids.** Every id these roadmaps cite exists here. This pull request drops no heading (it adds 1.3a, 1.4a, 5.6a and Provenance).
- **Double owners.** None found.

**Adversarial table.** Values were computed this round with a scratch Python script (Lanczos Γ, Euler–Maclaurin ζ) and the Lean scratch files.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `OrderLE` (Layer 0) | `exp z` at `A = 1/2`; constant `1` at `A < 0` | `exp r/exp(r^{3/4}) → ∞`; `1 = O(exp ‖s‖^{A'})` | sound | none |
| `zetaEntireCompletion` | `s ≈ 0`, `1`; `0.3 + 2i` against `0.7 − 2i` | `1.000000`, `1.000000`; `0.906897 − 0.016873i` on both sides | sound | none |
| `zeroCount` | `z/(z − 1)` on `closedBall 0 2`; `f = 0` | `1` (divisor count `0`); `0` | sound | none |
| 1.3a | `‖Γ(½ + i)‖²` | `0.2710150 = π/cosh π` | sound | none |
| 1.4a symmetric form | `s = 2`; `s = −2` | `1.4150927` on both sides; junk `−0.164823` against `0.554120` | sound | R03 (names) |
| 1.4a conjugation | `Im ψ(i)` | `2.0766740 = ½ + (π/2) coth π` | sound | none |
| 3.1 | `E₁(1)`; `zetaEntireCompletion(20)` | `0.219384 < e⁻¹ = 0.367879`; `1472.476` | sound | none |
| 3.3–3.4 exponent | `δ = 0.1`, `σ = −δ, ½, 1 + δ` | `0.6`, `0.3`, `0` | sound | none |
| 3.5 | `‖Λ(2m + 2i)‖`, `m = 10, 20` | `3.676797`; `13519751.81` | sound | none |
| 4.3 | `z/10`, `r = 1`, `R = 2`; `1 − z/2`, `R = 3/2` | `log 5/log 2 = 2.3219`, trailing `3.3219 ≥ 1`; `1.7095 ≥ 0` | sound | none |
| 4.6 | `z`, `1/z` at `r = 1`, `R = 2` | difference `log 2 = 0.6931`; signed `−0.6931 < 0 = n(1) log 2` | sound | none |
| 5.2 | `E₁(−½)` | `‖E₁ − 1‖ = 0.090204 ≤ 0.125` | sound | none |
| 5.3 | `1 − z`; `exp` | single factor `E₁`; empty product `1` | sound | none |
| 5.6 | `ξ`; `e^{cs} f` | Davenport §12 at `ℚ` (not verifiable); `b` shifts by `c` | sound | none |
| 6.1 | `θ = 0, 2π/3, π` | `8`, `0.5`, `0 = 2(1 + cos θ)²` | sound | R06 (Needs) |
| 6.2 | principal character modulo 2 at `0`; `ζ` first zero | `1 − 2⁰ = 0`, so `c/log 3 < 1` is needed; `1 − c/log 17.13 ≤ ½` needs `c ≥ 1.42` | sound | none |
| 6.4, LMO containment | `ℚ(i)`, `γ = 10` | `log 𝔮 = 6.5200 ≥ log A + n log(|γ| + 2) = 6.3561` | sound | none |
| 6.4(4b) | trivial `χ` presented at `(2)`, `s = 2` | `(log 2)/3 = 0.2310 > 2 log 𝔑𝔣 = 0` | **false** | R01 |
| 6.4d (`neg_re_logDeriv_riemannZeta_le`) | `t = 14.1347`, `β = ½`, `δ = 0.01, 0.1, 1` | first sides `0.5388`, `0.5043`, `0.2425`; second `−1.5852`, `−1.2962`, `−0.3454`; `C ≥ 0.2034` suffices | sound | none |
| 6.4d threshold | `t = 0.01`, `δ = 2t` | `24.4265` against `1/(4t) = 25` | sound | none |
| 6.4(4c)–(4d) | `−ζ'/ζ(1.1)`, `−ζ'/ζ(1.01)` | `9.4410`, `99.4248` against `1/u − γ = 9.4228`, `99.4228` | sound | none |
| 6.5 | odd `χ` modulo 4 at `1` | `2 · π⁻¹ · π/4 = 0.5`, order `0` | sound | none |
| 2.4 newform | `k = 12`, `N = 1`, `s = ½` | README `90`; pinned at `½` `15.75`; pinned at `6` `90` | coordinate | R07 |
| 7.1 | `#check` | `TauCeti.Contour.IsPiecewiseC1On` unknown | name | R04 |
| 7.2 | `z − 2` on `[−1, 1]²`, `S = {2}` | integral `0`, `ord₂ = 1`: sum over `S ∩ R` | sound | none |
| 7.5 (`riemannVonMangoldt_dirichlet`) | `q = 1`, `T = 100` | `N± = 58` against `56.2547` | sound | R05 |
| 7.6 | `N(100)/(100 log 100)` | `0.06297`; main term `0.06108`; limit `0.15915` | sound | none |
| `riemannVonMangoldt` | `T = 2`, `100` | `0` against `−0.68269`; `29` against `28.1273` | sound | none |
| 8.3 (`chebyshevPsi_explicitFormula`) | `x = 20`, `T = 10` (no zero below `14.13`); `x = T = 2` | `ψ(20) = 19.2657` against `18.1634`; `0.6931` against `0.3059` | sound | none |
| 8.4 (`riemannZeta_weilExplicitFormula`) | sign check by contour shift | `+φ̃(0) + φ̃(1)`, `(2π)⁻¹∫ Γℝ'/Γℝ(2 + it)(φ̃(2 + it) + φ̃(−1 − it))`, `−∑ Λ(n)(φ(n) + φ(1/n)/n)` | sound | none |
| 8.5 (`primeIdealCount_effective`) | `ℚ`, `x = 10⁶` | `78498` against `Li = 78626.50` | sound | R02 |
| 8.6 | quartic `χ` modulo 5, `χ(2) = i` | `φ̌` term `log 2 · (−i) · ½ = −0.3466i` | sound | R06 (Needs) |
| 8.7 (`primeCounting_progression_effective`) | `q = 4`, `a = 3`, `x = 100` | `13` against `Li(100)/2 = 14.5405` | sound | R02 |
| 8.9 | `x = 10`; `x = 10⁶` | `Li(10) = 5.120436 =` the right side; `(Li − x/log x)/(x/log² x) = 1.192` | sound | none |
| `dirichletLFunction_zeroFreeRegion` | `q = 2`, principal `χ` | the region lies in `Re s ≥ ½` by the cap, excluding the zero at `0` | sound | none |
| `hadamard_of_orderLE_one` | `1 − s`; `f(0) ≠ 0` | `(a, b) = (0, −1)`; the factor at `ρ = 0` is `E₁(0) = 1` | sound | none |
| `riemannZeta_zeros_summable_ordinate` | `ρ₁`, `ρ̄₁` | `2/(1 + 14.134725²) = 0.009961` | sound | none |
| `dirichletLFunction_convexity` | `q = 1`, `t = 0` | `‖ζ(½)‖ = 1.460354 ≤ C · 3^{1/4+ε}` | sound | none |

## Not verifiable

- **Paywalled texts.** These are not in the manifest and are cited by locator only, so the locators were not checked against the text:
  - Davenport, *Multiplicative Number Theory*, §§11–20 (5.3, 5.5, 5.6, 6.2–6.4, 8.3, 8.6);
  - Titchmarsh §5.1 and Theorem 9.4, "printed p. 214" (3.4, 7.4, 7.6);
  - Iwaniec–Kowalski §§5.1–5.2 (3.4);
  - Lang XVII §3 (8.4);
  - Lagarias–Odlyzko 1977.

  The section titles cited agree with the published tables of contents I know of.
- **Lagarias–Montgomery–Odlyzko 1979, Lemma 2.3.** The manifest records it as `uncertified` (DOI `10.1007/BF01390234`). Its content is taken from `kadiri2012` lines 65–73.
- **DLMF 5.5.3 and 5.6.6.** The cached `dlmf5` covers §5.11 only. They are cited in Layer 0 and 1.3a, outside the sample.
- **The `ZeroWindow` definition in PrimeNumberTheoremAnd.** It falls outside the fetched portions, so the "within 3/4" wording of the 6.4d Provenance row is unchecked.

## Source issues

- **Gap** in trudgian2015 at Theorems 1–2 and §3.1 (pp. 1, 6): the source says one parameter inequality in the Backlund-trick step follows from the others; it should be every inequality checked, as in the corrected proofs; affects a stated result; corrected in print at Bennett–Martin–O'Bryant–Rechnitzer, Math. Comp. 90 (2021), Corollary 1.2, and Hasanalizade–Shen–Wong, Math. Comp. 91 (2022), Corollary 1.2.
- **Misprint** in kadiri2012 at §1, display (1.6), p. 2: the source says Lagarias–Montgomery–Odlyzko show that the Hecke L-function has no zeros in the whole-strip region (1.6); it should be no zeros other than the possible single exceptional zero of (1.5); affects nothing.
- **Misprint** in kadiri2012 at References, item [9], p. 19: the source dates Lagarias–Odlyzko's "Effective versions of the Chebotarev density theorem" to 1997; it should be 1977; affects nothing.
