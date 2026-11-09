# Review of ZerosOfLFunctions (pull request #1913 at 288e45d)

**Verdict:** needs changes

This is an incremental re-review of the 92 lines that changed since `f6187a0`. Only `README.md` changed: `Suggested.lean` is byte-identical, and nothing outside the folder changed.

- **Repaired.** Three of the eight previous findings: R01 (the 6.4b bound), R06 (the 6.1 identity and its suppliers) and R07 (the newform conductor).
- **Not repaired.** The other five, carried below as R01–R04 and R06.
- **New.** The 2.4 repair added a Tau Ceti dependency to 2.4 but not to the Layer 2 Dependencies (R05).
- **Settled findings.** There is no repair report, so no finding is settled as "not actionable".

Paths: `TauCeti/…` is a file of the Tau Ceti pin `2fd255d9`. Other roadmap paths are on main.

## R01 (P2) — Headline theorems that can be stated at the pin are absent, and the docstring says they cannot be (previous R02, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean`:

- lines 34–35: "neither library has its continuation to `ℂ`, its completion, or the L-function of a Hecke character";
- lines 39–40: "the Tau Ceti revision this file is built against supplies none of them".

**Claim.** The Hecke region of 6.4, the ray-class count of 8.7 and the abelian count of 8.8 cannot be stated at the pins.

**Witness.** The pin declares:

- `TauCeti.LFunctions.heckeLFunctionC` (`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74`);
- `RayClassGroup` (`NumberField/Global/RayClass/Basic.lean:130`);
- `NumberField.Chebotarev.frobeniusPrimeCount` (`Chebotarev/PrimeCounting/VonMangoldt.lean:177`).

This round, all three statements below elaborate at this pin with only `sorry` warnings.

**Repair.** Choose one of two routes.

1. **Rebase on #1907** and keep its statements.
2. **Otherwise**, make three changes:
   - Add the imports `TauCeti.NumberTheory.LFunctions.Hecke.{Basic,Primitive}`, `TauCeti.NumberTheory.Chebotarev.PrimeCounting.VonMangoldt`, `TauCeti.NumberTheory.NumberField.Global.RayClass.Basic` and `TauCeti.Analysis.SpecialFunctions.LogIntegral`, then state the three theorems below.
   - Name each one in the README at 6.4, 8.7 and 8.8.
   - Rewrite lines 28–44 so that they name only what the pin lacks: `completedDedekindZeta`, `completedHeckeLFunction`, and the exceptional-zero terms built from them.

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

**Test.** All three were elaborated this round in scratch files that open `TauCeti TauCeti.GlobalNumberFields TauCeti.LFunctions NumberField Filter Asymptotics`. The result is `sorry` warnings only, with no error. Two checks on the zero-free statement:

- At the trivial character, the pole at `1` has order `−1`, so it is not counted as a zero.
- The trivial zeros of `ζ_K` on `Re s ≤ 0` lie outside the region once `c < log 3`.

## R02 (P3) — The supplier contracts still cite pinned objects under names the pin does not have (previous R03, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 281–287: "`AnalyticLFunctionData.dualCompleted`, `AnalyticLFunctionData.reflectedPoint`, … (fields `meromorphic`, `exact_pole_order`, `regular_away`) … `AnalyticLFunctionData.hasFunctionalEquation_eventuallyEq`". The same names occur at lines 119, 309, 316, 378, 658, 665–666, 671, 1328, 1345 and 1375. The phrases "roadmap contracts" and "rather than declarations of the Tau Ceti pin" occur at lines 65, 239 and 259.

**Claim.** These are the consumed declarations.

**Witness.**

- This round, `#check` fails with "Unknown constant" on `TauCeti.LFunctions.AnalyticLFunctionData.dualCompleted` and on `…reflectedPoint`.
- `TauCeti.LFunctions.AnalyticLFunctionData.HasFunctionalEquation.eventuallyEq` (`TauCeti/NumberTheory/LFunctions/Data/Basic.lean:269`) elaborates.

**Repair.**

1. Rename to the pin names:
   - `regular_away` → `analyticAt`;
   - `exact_pole_order` → `meromorphicOrderAt_eq`;
   - `completes` and `eq_away` → `completed_eq`;
   - `polarOrder_reflect` → `polarOrder_one_sub_conj`;
   - `dualCompleted` → `dual_completed`;
   - `dual_gammaFactor` → `gammaFactor_dual`;
   - `dual_has…` → `HasDirichletAgreement.dual` and `HasMeromorphicContinuation.dual`;
   - `hasFunctionalEquation_eventuallyEq` → `HasFunctionalEquation.eventuallyEq`;
   - `reflectedPoint s` → `1 − conj s`;
   - `PrimitiveRayClassCharacter.inv χ` → `χ⁻¹`.
2. Delete the phrases at lines 65, 239 and 259.

The new "From Tau Ceti" bullets (lines 220–234) already show the intended form.

**Test.** After the repair, a grep for `regular_away|exact_pole_order|hasFunctionalEquation_eventuallyEq|reflectedPoint|dualCompleted|roadmap contracts` finds nothing.

## R03 (P3) — `TauCeti.Contour.IsPiecewiseC1On` does not exist at the pin (previous R04, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 209, 1426 and 1433. Line 1433 reads "*Needs:* Tau Ceti `TauCeti.Contour.IsPiecewiseC1On`".

**Claim.** The pin declares the piecewise-`C¹` predicate in the `Contour` namespace.

**Witness.**

- The only definition is `TauCeti.IsPiecewiseC1On`, at `TauCeti/Analysis/Calculus/ContDiff/PiecewiseC1On.lean:91`, inside `namespace TauCeti`.
- `#check @TauCeti.IsPiecewiseC1On` elaborates this round.
- The string `Contour.IsPiecewiseC1On` occurs nowhere in the pin.

**Repair.** Write `TauCeti.IsPiecewiseC1On` at the three places, and give `Analysis/Calculus/ContDiff/PiecewiseC1On.lean` under "From Tau Ceti".

**Test.** `TauCeti.Contour.argumentPrinciple_nullHomologous` takes `hγ : IsPiecewiseC1On γ a b` (`Analysis/Contour/Argument/Cycle.lean:110`, binder at line 114), so 7.1 then composes with 7.2.

## R04 (P3) — The Trudgian theorems cited for 7.5 have a published gap (previous R05, not repaired)

**Location.**

- `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 1530–1531: "(Trudgian, Theorem 1, for `χ` nonprincipal, with absolute constants; Theorem 2 is the Dedekind case; Davenport §16)";
- the References, lines 1993–1997;
- `Suggested.lean`, line 177.

**Claim.** Trudgian's Theorems 1 and 2 are proved sources for the conductor-uniform counts.

**Witness.**

- `bennett2021` lines 73–76: Trudgian wrongly argued that one parameter inequality was redundant, which leaves his proofs of Theorems 1 and 2 incomplete.
- `hasanalizade2022` lines 40–41 repeat this.

**Repair.**

1. Cite Bennett–Martin–O'Bryant–Rechnitzer, Corollary 1.2 (`bennett2021` lines 83–84; conductor `q > 1`, `T ≥ 5/7`) for the Dirichlet count.
2. Cite Hasanalizade–Shen–Wong, Corollary 1.2 (`hasanalizade2022` lines 63–65; `T ≥ 1`) for the Dedekind count.
3. Add both papers to the References, and keep Trudgian as the earlier statement.

**Test.** Both corollaries imply the README's existential form for `T ≥ 2`. At `q = 1` the statement is the `ζ` case of 7.4.

## R05 (P3) — The Layer 2 Dependencies omit the Tau Ceti newform declarations that 2.4 now uses (new, introduced by the 2.4 repair)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`, line 754: "L-functions Layers 0, 3, 5; Layer 1.6 for the translation of *continuedL*."

**Claim.** Layer 2 depends only on these.

**Witness.** The 2.4 *Needs:* line (lines 727–729) cites Tau Ceti `HeckeRing.GL2.Newform.analyticConductorAt` and `HeckeRing.GL2.Newform.analyticConductorAt_eq` (`NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean`). The Layer 2 Dependencies paragraph does not mention either.

**Repair.** Append this sentence to line 754: "Tau Ceti `HeckeRing.GL2.Newform.analyticConductorAt` and `HeckeRing.GL2.Newform.analyticConductorAt_eq` (`NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean`), for 2.4." Line 1411 already does the same for Layer 6 with Arithmetic Dirichlet Series §2.3.

**Test.** After the repair, every supplier named in a Layer 2 *Needs:* line occurs in the Layer 2 Dependencies.

## R06 (P3) — The pull request's title, description and stated merge order are stale, with no order stated against #1907 (previous R08, not repaired)

**Location.** The pull request's title, "effective statements under the exclusion of Landau–Siegel zeros", and its description: "Merge order: after AnalyticNumberTheoryPartI (#1126) lands, since the strengthened statements refer to its §0.34."

**Claim.** The pull request restates the roadmap in exception-free form and depends on AnalyticNumberTheoryPartI.

**Witness.**

- README lines 83–84 exclude "the nonexistence of exceptional zeros; Siegel's theorem".
- `ORDER.txt` lists ZerosOfLFunctions at line 48 and AnalyticNumberTheoryPartI at line 50.
- `overlaps.md` reports that #1907 conflicts in `README.md` and `Suggested.lean`.

**Repair.**

1. Retitle the pull request, and describe this head.
2. Delete the "after AnalyticNumberTheoryPartI" sentence.
3. State which of #1913 and #1907 is rebased on the other before either merges.

**Test.** The new description then agrees with README lines 83–84 and with `ORDER.txt` lines 48–50.

## Previous findings (PRREVIEW-ZerosOfLFunctions~18)

- R01 — repaired: line 1318 "`‖logDeriv eulerCorrection s‖ ≤ log 𝔑𝔫`, where `𝔑𝔫` is the absolute norm of the finite part of the presentation modulus". Line 1776 (8.7) now reads "`log 𝔑𝔪`, the bound of 6.4b at the presentation modulus `𝔪`".
- R02 — not repaired: `Suggested.lean` line 40 still reads "this file is built against supplies none of them". Carried as R01.
- R03 — not repaired: line 281 still reads "`AnalyticLFunctionData.dualCompleted`, `AnalyticLFunctionData.reflectedPoint`". Carried as R02.
- R04 — not repaired: line 1433 still reads "Tau Ceti `TauCeti.Contour.IsPiecewiseC1On`". Carried as R03.
- R05 — not repaired: line 1530 still reads "(Trudgian, Theorem 1, for `χ` nonprincipal". Carried as R04.
- R06 — repaired: 6.1 *Needs:* (line 1236) reads "Arithmetic Dirichlet Series §2.3, at the pin `TauCeti.MultiplicativeIdealWeight.logDeriv_LSeries_eq_neg_tsum_vonMangoldtTransform`". 8.6 (line 1702), "From Tau Ceti" and the Layer 6 Dependencies (line 1411) match, and 8.3 keeps `dedekindZeta_logDeriv_eq` (line 1620).
- R07 — repaired: 2.4 (lines 715–722) equates the record's conductor with "`HeckeRing.GL2.Newform.analyticConductorAt f (s + (k − 1)/2)`". The Scope locator (lines 33–36) and the `k = 12` Check (line 740) are fixed.
- R08 — not repaired: the title and description are unchanged. Carried as R06.

## Verified sound

**Gate and dependency check.**

- My gate run printed every check at 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, and exited 0. The worker's gate, which includes `build=0`, also passes.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check printed one line and exited 0, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 240 roadmaps, 2322 edges, 0 problem(s)
```

**Elaboration.**

- `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 with exactly 13 "declaration uses `sorry`" warnings (lines 80–241).
- `Suggested.lean` is unchanged since `f6187a0`. So the previous round's `#check @name` comparison of all 16 declarations with `signatures.md` and the README still holds: no binder is lost, and there is no `variable` block. The one-tactic padding probe also still holds: none of the 13 theorems closes.

**The changed passages.**

- **6.1.**
  - The sign is now right: `−logDeriv L_ψ` is the von Mangoldt series. The pinned theorem gives `logDeriv L = −∑' idealTerm …` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Logarithm/VonMangoldtCoeff.lean:142`, elaborated).
  - The coefficient matches: `vonMangoldtTransform_apply_prime_pow` (`ArithmeticDirichletSeries/VonMangoldt.lean:236`) gives `χ P ^ n * log N(P)`, as the README says.
  - The abscissa lemma `idealAbscissaOfAbsConv_lt_re_of_bounded` (`ArithmeticDirichletSeries/Estimates.lean:541`) takes `‖f I‖ ≤ C` and `1 < Re s`.
  - The weight is `RayClassCharacter.toMultiplicativeIdealWeight` (`NumberField/Global/RayClass/Character/Weight.lean:42`). It is zero off the ideals prime to the modulus, which gives the README's "indicator … when `ψ = 1`". It is the weight that defines `heckeLFunctionC` (`LFunctions/Hecke/Basic.lean:74`), by `val_toUnitaryIdealWeight` (`Weight.lean:187`).
  - Arithmetic Dirichlet Series §2.3 on main is the von Mangoldt transform and its coefficient identity (`Completed/ArithmeticDirichletSeries/README.md:182`). Its `Suggested.lean:589` states this theorem in Layer 2.
- **6.4(4b).**
  - The pin defines `eulerCorrection` (`LFunctions/Hecke/Primitive.lean:236`) as the product over `𝔫.support \ 𝔪.support` of `1 − χ(𝔭) N𝔭^{−s}`.
  - `heckeLFunctionC_eq_primitive` (`Hecke/Basic.lean:130`) has the shape the README describes, through `PrimitiveRayClassCharacter.of` (`Primitive.lean:135`).
  - `eulerCorrection_self` (`Primitive.lean:257`) gives the degenerate case.
  - The bound `log 𝔑𝔭/(𝔑𝔭^σ − 1) < log 𝔑𝔭` holds because `𝔑𝔭^σ > 2`. Summing over the distinct primes dividing `𝔫` gives at most `log 𝔑𝔫`.
- **2.4.**
  - The pinned `HeckeRing.GL2.Newform.analyticConductorAt` (`ModularForms/Newforms/AnalyticInvariants.lean:125`) takes the arithmetic `s`, and `analyticConductorAt_eq` (`:133`) is `N(‖s‖ + 3)(‖s + 1‖ + 3)`.
  - Both were read at the pin but not elaborated, because this module has no object file in the checkout. The Check values were computed in Lean on the definition's body: `90` and `63/4`.
  - The README's form matches the Conventions (line 143), where `Gammaℂ(s + ν)` contributes the shifts `ν` and `ν + 1`. With the normalization translation at `w = k − 1`, the third Check of Layer 2 is consistent.
  - ModularForms cites the pinned function under "From Tau Ceti" (`TauCetiRoadmap/ModularForms/README.md:243`), as the new Scope bullet says. The relative link resolves.
- **8.6 and 8.7.** I checked the new *Needs:* line of 8.6 and the changed 8.7 sentence against the same pinned declarations. The 8.7 bound is the 6.4b bound with `𝔫 = 𝔪`.

**Ownership.**

- `roadmaps grep` finds `Newform.analyticConductorAt` only here and in ModularForms, as a consumer.
- It finds `logDeriv_LSeries_eq_neg_tsum_vonMangoldtTransform` only in Arithmetic Dirichlet Series and here.
- The change adds no owned object. No id is dropped (`overlaps.md`), and there is no second owner.

**Library declarations opened this round.** 14 in all: the 12 cited above, `TauCeti.IsPiecewiseC1On` and `HasFunctionalEquation.eventuallyEq`. Each was checked at the file and line given, and 11 of them were also elaborated with `#check`.

**Adversarial table.** The rows for statements this change leaves untouched are carried from PRREVIEW-ZerosOfLFunctions~18; their values were computed there. The rows marked "this round" were computed now, with Python scripts (prime sums to `2 · 10⁵` and `3 · 10⁵`, `L(2, χ₄)` summed to `2 · 10⁶`) and the Lean scratch files.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 2.4 (this round) | `k = 12`, `N = 1`, analytic `s = ½` | README side `(6 + 3)(7 + 3) = 90`; pinned body at `6` is `9 · 10 = 90` (Lean `norm_num`) | sound | none |
| 2.4 Check, unshifted (this round) | the same newform, pinned at `½` | `3.5 · 4.5 = 15.75 = 63/4` (Lean) `≠ 90`, so the Check discriminates | sound | none |
| 2.4, complex point and wrong sign (this round) | `k = 4`, `s = 0.3 + 2i` | both sides `36.65356`; the shift `s − 3/2` gives `26.71509` | sound | none |
| 2.4, degenerate weight (this round) | `k = 1` | shift `0`, both sides `N(‖s‖ + 3)(‖s + 1‖ + 3)`, matching the identity translation at `w = 0` | sound | none |
| 2.4 Dependencies (this round) | grep of Layer 2 | newform names at lines 727–729, absent from line 754 | gap | R05 |
| 6.1 sign and presentation (this round) | `ℚ`, trivial character at `(3)∞`, `σ = 2` | `−ζ'/ζ(2) = 0.569956`; `∑_{3∤n} Λ(n) n⁻² = 0.432629`; difference `0.137327 = log 3/8` | sound | none |
| 6.1 termwise (this round) | `θ = 0, 2π/3, π, 1.9` | `8`, `0.5`, `0`, `0.915874`, each `= 2(1 + cos θ)²` | sound | none |
| 6.1 and 8.6 identity sign (this round) | `χ₄` modulo 4, `s = 2` | `∑ Λ(n)χ₄(n) n⁻² = −0.0890653`; from `L(2, χ₄) = 0.915966` and the summed `L'`, `−L'/L = −0.0890653` | sound | none |
| 8.6 coefficient (this round) | `χ₄` at `9` and at `2` | `χ(3)² log 3 = 1.098612 = Λ(9)χ(9)`; `χ(2) = 0`, so `2` is excluded | sound | none |
| 6.4(4b), presentation at `(2)` (this round) | trivial `χ` over `ℚ` | `log 2/(2^s − 1)`: `0.693147` (`s → 1⁺`), `0.379095` (`3/2`), `0.231049` (`2`), `0.099021` (`3`), all `≤ log 2`; a source-conductor bound gives `0` | sound | none |
| 6.4(4b), several primes (this round) | trivial at `(30)`, `s = 1.01, 2, 1.01 + 5i` | `1.618351`, `0.435436`, `0.212789`, all `≤ log 30 = 3.401197` | sound | none |
| 6.4(4b), degenerate (this round) | `𝔫 = 𝔣` | `eulerCorrection_self` gives `1`, so `0 ≤ log 𝔑𝔣` | sound | none |
| 6.4(4b), "no bound in the source conductor" (this round) | trivial at `∏_{p ≤ X} p`, `σ → 1⁺` | `∑ log p/(p − 1) = 1.969`, `4.115`, `6.364` for `X = 10, 100, 1000`: unbounded at source conductor `1` | sound | none |
| 8.7 changed sentence (this round) | trivial at `(3)`, `s = 1.01` | `0.540352 ≤ log 3 = 1.098612` | sound | none |
| `OrderLE` (~18) | `exp z` at `A = ½`; constant at `A < 0` | `exp r/exp(r^{3/4}) → ∞`; `1 = O(exp ‖s‖^{A'})` | sound | none |
| `zetaEntireCompletion` (~18) | `s ≈ 0, 1`; `0.3 + 2i` against `0.7 − 2i` | `1.000000`, `1.000000`; `0.906897 − 0.016873i` on both sides | sound | none |
| `zeroCount` (~18) | `z/(z − 1)` on `closedBall 0 2`; `f = 0` | `1` (divisor count `0`); `0` | sound | none |
| 1.3a (~18) | `‖Γ(½ + i)‖²` | `0.2710150 = π/cosh π` | sound | none |
| 1.4a (~18) | `s = 2`, `s = −2`; `Im ψ(i)` | `1.4150927` on both sides; junk `−0.164823` against `0.554120`; `2.0766740` | sound | R02 (names) |
| 3.1, 3.3–3.5 (~18) | `E₁(1)`; `δ = 0.1`; `‖Λ(2m + 2i)‖`, `m = 10, 20` | `0.219384 < 0.367879`; exponents `0.6`, `0.3`, `0`; `3.676797`, `13519751.81` | sound | none |
| 4.3, 4.6 (~18) | `z/10`, `r = 1`, `R = 2`; `z`, `1/z` | `2.3219`, trailing `3.3219 ≥ 1`; difference `0.6931` | sound | none |
| 5.2, 5.3, 5.6 (~18) | `E₁(−½)`; `1 − z`; `e^{cs} f` | `0.090204 ≤ 0.125`; single factor; `b` shifts by `c` | sound | none |
| 6.2 (~18) | principal character modulo 2 at `0`; first zero of `ζ` | `c/log 3 < 1` needed; `c ≥ 1.42` | sound | none |
| 6.4, LMO containment (~18) | `ℚ(i)`, `γ = 10` | `6.5200 ≥ 6.3561` | sound | none |
| 6.4d and its threshold (~18) | `t = 14.1347`, `β = ½`; `t = 0.01` | `C ≥ 0.2034` suffices; `24.4265` against `25` | sound | none |
| 6.4(4c)–(4d) (~18) | `−ζ'/ζ(1.1)`, `−ζ'/ζ(1.01)` | `9.4410`, `99.4248` against `9.4228`, `99.4228` | sound | none |
| 6.5 (~18) | odd `χ` modulo 4 at `1` | `0.5`, order `0` | sound | none |
| 7.1 (~18, repeated this round) | `#check` | `TauCeti.Contour.IsPiecewiseC1On` absent; `TauCeti.IsPiecewiseC1On` present | name | R03 |
| 7.2 (~18) | `z − 2` on `[−1, 1]²` | integral `0`, sum over `S ∩ R` | sound | none |
| 7.5 `riemannVonMangoldt_dirichlet` (~18) | `q = 1`, `T = 100` | `58` against `56.2547` | sound | R04 |
| 7.6, `riemannVonMangoldt` (~18) | `T = 2`, `100` | `0` against `−0.68269`; `29` against `28.1273`; ratio `0.06297` | sound | none |
| 8.3, 8.4 (~18) | `x = 20`, `T = 10`; contour-shift signs | `19.2657` against `18.1634`; signs as stated | sound | none |
| 8.5, 8.7 (`primeIdealCount_effective`, `primeCounting_progression_effective`) (~18) | `ℚ`, `x = 10⁶`; `q = 4`, `a = 3`, `x = 100` | `78498` against `78626.50`; `13` against `14.5405` | sound | R01 |
| 8.6 Check (~18) | quartic `χ` modulo 5 | `φ̌` term `−0.3466i` | sound | none |
| 8.9 (~18) | `x = 10`, `10⁶` | `Li(10) = 5.120436`; ratio `1.192` | sound | none |
| Lean headlines (~18) | `dirichletLFunction_zeroFreeRegion`, `hadamard_of_orderLE_one`, `riemannZeta_zeros_summable_ordinate`, `dirichletLFunction_convexity` | cap excludes `0`; `(a, b) = (0, −1)`; `0.009961`; `1.460354 ≤ C · 3^{1/4+ε}` | sound | none |

**Sources.**

- **Seeded sample.** The sample falls in the change at 6.1, 6.4 and 8.7. None of the three changed passages adds or moves a source locator; their new claims rest on the pinned declarations above. The other sampled targets are untouched, and were verified in PRREVIEW-ZerosOfLFunctions~18.
- **Unverified flags.** The README flags no locator as unverified.
- **R04 witness.** I re-read `bennett2021` lines 70–85 and `hasanalizade2022` lines 38–41 and 60–66 for R04.

## Not verifiable

- `HeckeRing.GL2.Newform.analyticConductorAt` and `analyticConductorAt_eq` were not elaborated, because their module has no object file in this checkout. I read them at the pin, and the arithmetic was checked in Lean on the definition's body.
- The paywalled texts and the uncertified Lagarias–Montgomery–Odlyzko 1979 are as in PRREVIEW-ZerosOfLFunctions~18. The change cites no new one.

## Source issues

- **Gap** in trudgian2015 at Theorems 1–2 and §3.1 (pp. 1, 6): the source says one parameter inequality in the Backlund-trick step follows from the others; it should be every inequality verified, as in the corrected proofs; affects a stated result; corrected in print at Bennett–Martin–O'Bryant–Rechnitzer, Math. Comp. 90 (2021), Corollary 1.2, and Hasanalizade–Shen–Wong, Math. Comp. 91 (2022), Corollary 1.2.
