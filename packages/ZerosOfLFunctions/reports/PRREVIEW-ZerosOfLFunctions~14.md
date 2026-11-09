# Review of ZerosOfLFunctions (pull request #1913 at d683eab)

**Verdict:** needs changes

This is an incremental re-review of the 34 README lines changed since `237426a`. `Suggested.lean` has a 0-line diff. The *Needs:* lines of 1.4a, 4.3, 5.6a, 8.3 and 8.6 now list their route inputs, and previous R05 is repaired. One parenthetical in the new 4.3 line credits a step to the wrong lemma (R05 below). Previous R01–R04 and R06 are untouched by the diff and are carried.

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

**Test.** I made a scratch copy of `Suggested.lean` at this head with these imports and statements added, and ran it through `lake env lean`. It gave 17 "declaration uses `sorry`" warnings (the file's 13 and these 4) and no error. At `ψ = 1` the pole at `1` has order `−1`, which is not positive, so it is not counted as a zero.

## R02 (P3) — The supplier contracts list LFunctions objects under names the Tau Ceti pin does not have, and cite one lemma under two names (previous R02, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- lines 262–270, under "From TauCetiRoadmap.LFunctions", e.g. "`AnalyticLFunctionData.hasFunctionalEquation_eventuallyEq`";
- lines 118, 358, 638, 645–646, 651 and 1392: the same names in the body;
- lines 64, 220 and 240: "roadmap contracts".

**Claim.** These LFunctions Layer 0 objects are roadmap contracts that are not declarations of the pin. Meanwhile 1.4a and 5.6a cite the same germ equation by its pin name.

**Witness.** The pin declares `HasFunctionalEquation.eventuallyEq` (`LFunctions/Data/Basic.lean:269`). Its `HasMeromorphicContinuation` fields (`:183–187`) are `meromorphic`, `meromorphicOrderAt_eq` and `analyticAt`. `roadmaps resolve` finds `regular_away`, `reflectedPoint`, `dualCompleted` and `hasFunctionalEquation_eventuallyEq` nowhere.

**Repair.**

1. Under "From Tau Ceti", list the pinned LFunctions Layer 0 declarations with their file `NumberTheory/LFunctions/Data/Basic.lean`:
   - `AnalyticLFunctionData`, `degree`, `gammaFactor`, `dual`;
   - `HasDirichletAgreement`, `HasMeromorphicContinuation` and `HasFunctionalEquation` with their pin fields;
   - `HasFunctionalEquation.eventuallyEq`, `HasDirichletAgreement.dual`, `HasMeromorphicContinuation.dual`, `gammaFactor_dual`, `dual_completed`.
2. Rename every occurrence to the pin's name:

   | README name | Pin name (`Data/Basic.lean`) |
   | --- | --- |
   | `hasFunctionalEquation_eventuallyEq` (lines 268, 645, 651) | `HasFunctionalEquation.eventuallyEq` (`:269`) |
   | `regular_away` (lines 118, 265, 638, 1392) | `analyticAt` (`:187`) |
   | `exact_pole_order` (lines 265, 358) | `meromorphicOrderAt_eq` (`:185`) |
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
   - "rather than declarations of the Tau Ceti pin" (line 220);
   - "These are roadmap contracts" (line 240).

**Test.** A grep of the README for `hasFunctionalEquation_eventuallyEq|regular_away|exact_pole_order|reflectedPoint` finds nothing, and `roadmaps resolve` no longer reports the six `AnalyticLFunctionData.*` leads.

## R03 (P3) — `TauCeti.Contour.IsPiecewiseC1On` does not exist at the pin (previous R03, not repaired)

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:

- line 205: "contour integration (`Analysis/Contour/`): `TauCeti.Contour.IsPiecewiseC1On`";
- line 1362, the first API bullet of 7.1;
- line 1369, the *Needs:* line of 7.1.

**Claim.** The pin declares the piecewise-`C¹` predicate under this name, in the contour folder.

**Witness.** In my scratch file at this head, `#check @TauCeti.Contour.IsPiecewiseC1On` gives "Unknown identifier". `#check @TauCeti.IsPiecewiseC1On` elaborates; it is declared in `Analysis/Calculus/ContDiff/PiecewiseC1On.lean:91`.

**Repair.** Replace the three occurrences with `TauCeti.IsPiecewiseC1On`, and give its file `Analysis/Calculus/ContDiff/PiecewiseC1On.lean` in the contract.

**Test.** The `#check` of the renamed predicate elaborates with type `(ℝ → E) → ℝ → ℝ → Prop`.

## R04 (P3) — The Trudgian theorems cited for 7.5 have a published gap; cite the corrected statements (previous R04, not repaired)

**Location.**

- `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 1456–1457: "(Trudgian, Theorem 1, for `χ` nonprincipal, with absolute constants; Theorem 2 is the Dedekind case; Davenport §16)";
- the References, lines 1912–1916;
- `Suggested.lean`, line 177.

**Claim.** Trudgian's Theorems 1 and 2 are the source of the conductor-uniform counts with absolute constants. They are the only source cited for the Dedekind case.

**Witness.** `bennett2021` lines 73–76: Trudgian wrongly argued one parameter inequality redundant, leaving his Theorems 1 and 2 unproved. `hasanalizade2022` lines 84–85 fix the same error for the Dedekind count.

**Repair.** Cite the corrected statements and keep Trudgian as the earlier one. Add both papers to the References with their arXiv ids; the manifest already has the keys `bennett2021` and `hasanalizade2022`.

- For the Dirichlet count: Bennett–Martin–O'Bryant–Rechnitzer, Math. Comp. 90 (2021), Corollary 1.2 (`bennett2021` lines 83–84), for `q > 1` and `T ≥ 5/7`.
- For the Dedekind count: Hasanalizade–Shen–Wong, Math. Comp. 91 (2022), Theorem 1.1 (`hasanalizade2022` lines 52–54), for `T ≥ 1`.

**Test.** The README statements, with existential constants, stay as they are. At `q = 1` and `T = 100`, the main term `56.255` against `N±(100) = 58` is within `C log 100`.

## R05 (P3) — 4.3's new *Needs:* line credits `g c = a` to a lemma that does not prove it

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 948–950: "`AnalyticAt.analyticOrderAt_eq_natCast` (the factorization `f = (z − c)^m g` with `g c ≠ 0`, which makes `g` analytic at `c` with `g c = a`)".

**Claim.** The factorization lemma gives the extension value `g c = meromorphicTrailingCoeffAt f c`, which the route needs in order to extend `f/(z − c)^m` by `a` at `c`.

**Witness.** At the pin, `AnalyticAt.analyticOrderAt_eq_natCast` (`Mathlib/Analysis/Analytic/Order.lean:92`) gives only some `g` with `AnalyticAt`, `g c ≠ 0` and the local factorization. It never mentions `meromorphicTrailingCoeffAt`. The identification is `AnalyticAt.meromorphicTrailingCoeffAt_of_ne_zero_of_eq_nhdsNE` (`Mathlib/Analysis/Meromorphic/TrailingCoefficient.lean:92`).

**Repair.**

1. In 4.3's *Needs:* line, end the parenthetical at "with `g c ≠ 0`".
2. Add "`AnalyticAt.meromorphicTrailingCoeffAt_of_ne_zero_of_eq_nhdsNE` (`g c = a`)" to that line.
3. Add the same name to the 4.3 clause of "From Mathlib" (lines 165–169).

**Test.** In a scratch file, this statement elaborates with no error:

- take `f` analytic at `c` with `analyticOrderAt f c = m`;
- `obtain` the factor `g` from `analyticOrderAt_eq_natCast`;
- `meromorphicTrailingCoeffAt_of_ne_zero_of_eq_nhdsNE (n := m)` then gives `g c = meromorphicTrailingCoeffAt f c`.

At `f = z/10` and `c = 0` this gives `m = 1` and `g = a = 1/10`, the Check at line 958.

## R06 (P3) — The pull request's title, description and stated merge order are stale, and no order is stated against #1907 (previous R06, not repaired)

**Location.** The pull request's title and description (data):

- the title: "effective statements under the exclusion of Landau–Siegel zeros";
- the description: "Merge order: after AnalyticNumberTheoryPartI (#1126) lands, since the strengthened statements refer to its §0.34."

**Claim.** The pull request restates the roadmap in exception-free form, and it depends on AnalyticNumberTheoryPartI.

**Witness.** README line 1231 still defines *IsExceptionalZero*, and lines 1867–1871 make AnalyticNumberTheoryPartI a consumer. `ORDER.txt` puts this roadmap at line 48 and AnalyticNumberTheoryPartI at line 50. `roadmaps overlaps` reports #1907 conflicting in both files.

**Repair.**

1. Retitle the pull request.
2. Rewrite the description so that it describes this head:
   - targets 1.3a, 1.4a, 5.6a and 6.4d;
   - the two `ζ` lemmas in `Suggested.lean`;
   - the provenance table;
   - the pin-name and locator repairs.
3. Delete the "after AnalyticNumberTheoryPartI" paragraph.
4. State that whichever of #1913 and #1907 merges second is rebased on the other.

**Test.** The new text agrees with README lines 1231 and 1867–1871, and with `ORDER.txt` lines 48–50.

## Previous findings

- R01 — not repaired: `Suggested.lean` has a 0-line diff. Lines 28–40 still say "the Tau Ceti revision this file is built against supplies none of them". It is carried as R01.
- R02 — not repaired: lines 64, 118, 220, 240, 262–270, 358, 638, 645–646 and 651 are unchanged. Line 268 still reads "`AnalyticLFunctionData.hasFunctionalEquation_eventuallyEq`". It is carried as R02.
- R03 — not repaired: lines 205, 1362 and 1369 still read `TauCeti.Contour.IsPiecewiseC1On`. It is carried as R03.
- R04 — not repaired: line 1456 still reads "(Trudgian, Theorem 1, for `χ` nonprincipal, with absolute constants; Theorem 2 is the Dedekind case". It is carried as R04.
- R05 — repaired:
  - 4.3's *Needs:* line (lines 948–951) and "From Mathlib" (lines 165–169) now list `AnalyticAt.analyticOrderAt_eq_natCast`, `Complex.norm_le_of_forall_mem_frontier_norm_le` and `frontier_ball`;
  - 8.3's *Needs:* line reads "8.1, 8.2; …".

  The new parenthetical credits `g c = a` to the wrong lemma: R05 of this report.
- R06 — not repaired: the title and description quoted above are unchanged. It is carried as R06.

## Verified sound

**Gate and dependency check.**

- My run of `gate … ZerosOfLFunctions --base origin/main` printed every check at 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, and exited 0. The worker's gate, which includes `build=0`, also passes.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'` is empty.
- The dependency check printed the following, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 240 roadmaps, 2356 edges, 0 problem(s)
```

- In `ORDER.txt`, LFunctions is at line 27, this roadmap at 48 and AnalyticNumberTheoryPartI at 50.

**Elaboration.**

- `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 with exactly 13 "declaration uses `sorry`" warnings and nothing else.
- A scratch file with `#check @name` for all 16 declarations elaborates. All 16 printed types are those of `signatures.md`. The file has no `variable` block, so no binder is lost. I changed nothing.
- The one-tactic probe from earlier rounds still holds, since the file is unchanged: none of the 13 statements closes in one tactic, so there is no padding.
- The manifest pins are unchanged from the previous review: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.

**Pinned declarations the changed lines cite.** I checked each with `#check` at the pins, and read its source line.

- 1.4a:
  - `Complex.Gammaℝ_eq_zero_iff` (`Gamma/Deligne.lean:76`): `Gammaℝ s = 0 ↔ ∃ n : ℕ, s = −2n`;
  - `differentiableAt_riemannZeta` (`RiemannZeta.lean:139`, needs `s ≠ 1`);
  - `Complex.differentiable_Gammaℝ_inv` (`Deligne.lean:112`);
  - `logDeriv_congr_nhds` (`LogDeriv.lean:42`) and `logDeriv_congr_nhdsNE` (`:48`);
  - `logDeriv_mul` (`:83`, needs `f x ≠ 0`, `g x ≠ 0` and both differentiable);
  - `logDeriv_comp` (`:142`).
- 5.6a: `Summable.of_nonneg_of_le` (`InfiniteSum/ENNReal.lean:547`), with hypotheses `0 ≤ g`, `g ≤ f` and `Summable f`.
- 4.3:
  - `AnalyticAt.analyticOrderAt_eq_natCast` (`Analytic/Order.lean:92`);
  - `Complex.norm_le_of_forall_mem_frontier_norm_le` (`Complex/AbsMax.lean:404`, needs `IsBounded U` and `DiffContOnCl ℂ f U`);
  - `frontier_ball` (`RCLike/Real.lean:72`, needs `r ≠ 0`);
  - `AnalyticOnNhd.sum_divisor_le` (`JensenFormula.lean:389`, needs `1 ≤ M` and `f c ≠ 0`).
- The 1.4a route is correct as written:
  - the hypotheses `s ≠ 0, 1`, `ζ(s) ≠ 0` and `ζ(1 − s) ≠ 0` keep `s` and `1 − s` off the zeros of `Gammaℝ`, so `logDeriv_mul` applies on both sides;
  - `logDeriv_comp` with `deriv (1 − ·) = −1` turns `completedRiemannZeta_one_sub` into `logDeriv Λ(s) = −logDeriv Λ(1 − s)`.

**Cross-roadmap citations in the changed lines, resolved on main `b0fe353`.**

- Arithmetic Dirichlet Series §2.3 "Von Mangoldt transform", §6.3 "Truncated Perron" and §6.4 "Arithmetic Perron" (README lines 182, 267 and 275). §6.4 names ZerosOfLFunctions as its consumer.
- Their pinned declarations: `truncatedPerron_LSeries` (`Perron/Formula.lean:130`), `norm_truncatedPerron_LSeries_sub_sum_le` (`:229`), `truncatedPerronKernel_one` (`Perron/Basic.lean:204`) and `perronFormula` (`Perron/Ideal.lean:161`).
- LFunctions Layer 3 `completedDedekindZeta_one_sub` (`Suggested.lean` line 1046) and Layer 8 `dedekindZeta_logDeriv_eq` (line 2820).
- Tau Ceti `HasFunctionalEquation.eventuallyEq` (`Data/Basic.lean:269`) and `HasFunctionalEquation.norm_rootNumber` (`:194`).
- The internal targets named by the changed *Needs:* lines all exist: 1.4, 1.5, 3.1, 4.2, 4.5, 5.3, 6.3–6.5 and 8.1–8.5.

**Sources: the seeded sample where it meets the change.**

| Target | Locator checked | Result |
| --- | --- | --- |
| 1.4a | No external locator; the route is through Mathlib declarations | All 11 route inputs elaborate (above); the symmetric form is recomputed in the table below |
| 1.3a | Its "From Mathlib" clause gained no 1.3a input; DLMF 5.6.6 was checked in the previous review | Unchanged, supported |
| 8.1 (now in the *Needs:* lines of 8.3 and 8.6) | Arithmetic Dirichlet Series §§6.3–6.4 on main, with the four pinned declarations above | Resolved; the endpoint value `π⁻¹ arctan(T/c)` matches `truncatedPerronKernel_one` |
| 8.2 | Davenport §17 | Paywalled; residues recomputed (row r3 below) |
| 8.6 | Davenport §§19–20 | Paywalled; the `K = ℚ`, odd-`χ` trivial-zero term is recomputed below |
| 7.5 (R04) | `bennett2021` lines 70–84; `hasanalizade2022` lines 52–54 and 78–89 | The published gap and the corrected statements are confirmed |

The other sample targets are untouched by the diff and were checked in earlier rounds: 3.4, 4.6, 5.3, 6.2, 6.5, 7.1, 7.2, 8.7, 8.8 and 8.9. Their rows are carried below. The README flags no locator as unverified.

**Adversarial table.** Rows marked "r13" are carried from PRREVIEW-ZerosOfLFunctions~13 for statements the diff leaves untouched. Rows marked "r3" or "r7" are carried from those reports for sample targets that r13 did not tabulate. The first six rows cover the changed lines, recomputed here.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.4a symmetric form, route via `Gammaℝ_eq_zero_iff`, `logDeriv_mul`, `logDeriv_comp` | `s = 2`; `s = −2`; `s = 0, 1` | At `s = 2`: `ζ'/ζ(2) + ζ'/ζ(−1) = −0.569961 + 1.985054 = 1.415093`, and `−logDeriv Γℝ(2) − logDeriv Γℝ(−1) = 0.860973 + 0.554120 = 1.415093`. `logDeriv Λ(2) = −1.430934 = −logDeriv Λ(−1)`. `Γℝ(−2) = 0` (junk at the pole), so `riemannZeta_def_of_ne_zero` would give `ζ(−2) = Λ(−2)/0 = 0`; the hypothesis `ζ(s) ≠ 0` excludes it. `s = 0, 1` are excluded explicitly | sound | none |
| 4.3 trailing form, new *Needs:* | `z/10`, `r = 1`, `R = 2`, `M = 1`; `z³`, `r = ¼`, `R = ½`, `M = ⅛`; `M = 0` | `m = 1`, `g = a = 1/10`, bound `1 + (log 10 − log 2)/log 2 = 3.3219 ≥ 1`. For `z³`: `3 + (log ⅛ − 3 log ½)/log 2 = 3.0000`, against a true count `3`. At `M = 0`, `f = 0` on `sphere c R = frontier (ball c R)`, so the maximum principle gives `f = 0` on the closed ball and order `⊤` | sound; `g c = a` comes from the trailing-coefficient lemma (Lean probe) | R05 |
| 5.6a comparison, `Summable.of_nonneg_of_le` | `ρ = 0`; `ρ = 1`; `ρ = ½ + 14.134725i`; `ρ = 2` | `‖ρ − 2‖²` against `4(1 + (Im ρ)²)`: `4 ≤ 4` (equality, so the constant `4` is sharp), `1 ≤ 4`, `202.04 ≤ 803.16`. At `ρ = 2`, `m₂ = 0`, so the junk `‖0‖⁻²` is multiplied by `0` | sound | none |
| 8.3 *Needs:* now with 8.1 | `K = ℚ` | The error term "truncation error of 8.1" is now backed by 8.1; `c_ℚ = −log 2π = −1.837877` | sound | none |
| 8.6 *Needs:* now 8.1–8.5 | `K = ℚ`, odd `χ`, `x = 3` | The route "from 8.1–8.2 for `χ`" matches the line. Trivial zeros at `−1, −3, …` give `½ log((x+1)/(x−1)) = ½ log 2 = 0.346574` | sound | none |
| "From Mathlib", 11 new names | `#check` at the pin | All 11 elaborate under the README's qualified names; `Complex.norm_le_of_forall_mem_frontier_norm_le` and `Complex.Gammaℝ_eq_zero_iff` are in namespace `Complex` | sound | none |
| 1.3a (r13) | `½ + i`; `3/2 + i`; `Re s = −½` | `‖Γ(½+i)‖² = 0.271015 ≤ π`; `0.58204 ≤ Γ(3/2) = 0.88623`; `Real.Gamma(−½) = −3.5449 < 0` | sound | none |
| 1.4a general records (r13) | `ζ` record at `s = 2` | `logDeriv Λ(2) = −1.430934 = −logDeriv Λ(−1)`; without the minus sign it fails by `2.8619` | sound | none |
| 4.3 first form (r13) | `1 − z/2`, `r = 1`, `R = 3/2`, `M = 2` | count `0 ≤ 1.7095` | sound | none |
| 4.6 Nevanlinna comparison (r7) | `z`, `1/z`, `z²` | `n(r) = 1`, `logCounting = log r`; `0` against the signed `−log r`; `2`, `2 log r` | sound | none |
| 5.6 (r13) | `ζ`; `f·e^{cs}` | `Re B = −0.02310 = −∑ Re 1/ρ`; `e^{cs}` shifts `b` by `c` | sound | none |
| 5.6a route (r13) | zeros of `riemannZeta` against those of `Λ` | the trivial zeros give summand `1` and diverge | sound | none |
| 7.1 (r3) | unit square at `½ + i/2` and `2`; width `0` | windings `1` and `0`, clockwise `−1`; the retraced segment has winding `0` | sound | R03 (name) |
| 7.2 (r3) | `z`, `z − 2`, `1/z` on `[−1, 1]²` | normalized integrals `1`, `0`, `−1` | sound | none |
| 8.1 (r3) | `x = c = T = 1` | `arctan(1)/π = 0.25` | sound | none |
| 8.2 (r3) | `ζ` at `1`; zero `ρ`; origin, unit rank `r` | `+x`; `−x^ρ/ρ`; `c_K − r log x` | sound | none |
| 8.3 Checks (r13) | `ℚ`; `ℚ(√5)`; `ℚ(i)` at `x = 2, 3` | `c_ℚ = −1.8379`; `L(0, χ₅) = 0`; `0.693147 = log 2`, `0.405465 = log 1.5` | sound | none |
| 8.5 (r13) | `x = e^{100}`, `T = e^{10}` | `x^β ≤ x exp(−c · 10)`; `∑ m_ρ/‖ρ‖ = O(log x)` | sound | none |
| 8.8 (r3) | `C₄ → C₂`; abelian against `S₃` | fibre density `1/2`; commutators force an abelian image | sound | R01 (Lean) |
| 8.9 (r7) | `x = 2`; `x = 10⁶` | `Li 2 = 0`; `Li(10⁶) − x/log x = 6244`, against `x/log² x + 2x/log³ x = 5997` | sound | none |
| `OrderLE`, `zetaEntireCompletion` (r13) | `1/Γ` along `−n−½`; `s = 0, 1, 2` | `1.44, 3.63, 5.91`; values `1, 1, 1.04720` | sound | none |
| 1.1–1.3, 1.5 (r13) | `δ = π/4`; `gammaR = {μ}` | log-Gamma at `3` is `0.6931`; rates `π|t|/4`, `π|t|/2` | sound | none |
| 3.1, 3.4, `dirichletLFunction_convexity` (r13) | `R = 0`; `q = 1`; `χ₋₄`, `t = 0` | `E₁(1) = 0.2194`; `1.46035 ≤ C·3^{¼+ε}`; `0.66769 ≤ C·12^{¼+ε}` | sound | none |
| `hadamard_of_orderLE_one`, `zetaEntireCompletion_hadamard`, 5.3 (r13) | `1 − s`; `cos z`; `s = 0` | `(a, b) = (0, −1)`; `b = 0.5772`; `1 = exp A` | sound | none |
| `riemannZeta_zeros_summable_ordinate` (r13) | `ρ₁` | `2/(1 + 14.1347²) = 0.009961` | sound | none |
| `riemannZeta_zeroFreeRegion`, `dirichletLFunction_zeroFreeRegion`, 6.2 (r13) | `σ < 1`; principal character mod 2 | `ζ(σ) < 0`; cap `0.693 > 0`; zeros at `±9.06i` enter only if `c ≥ 3.18` | sound | R01 (general `K`) |
| `neg_re_logDeriv_riemannZeta_le`, 6.4d (r13) | `t = 0.01`; `δ = u = 1` | `25.0` against `C log 0.01 < 0`; `0.5 = 1/(2|u|)` | sound | none |
| 6.5, 7.3 (r13) | odd `χ` mod 4 at `1`; `T → 0⁺` | `0.5`, order `0`; `S → −1` | sound | none |
| `riemannVonMangoldt`, `riemannVonMangoldt_dirichlet`, 7.5 (r13) | `T = 2, 14, 100`; `q = 1` | `−0.683`, `−0.443`, `28.127` against `N = 0, 0, 29`; `56.255` against `58` | sound | R04 (locator) |
| `chebyshevPsi_explicitFormula` (r13) | `x = 20`, `T = 10` | `19.2657` against `18.1634`, a difference `1.102 ≤ C·17.95` | sound | none |
| `riemannZeta_weilExplicitFormula`, 8.4 (r13) | `φ = 0`; `φ` supported in `(0.4, 0.6)` | both sides `0`; prime side `Λ(2)φ(½)/2` | sound | none |
| `primeIdealCount_effective`, `primeCounting_progression_effective`, 8.7 (r13) | `K = ℚ`; `q = 4, a = 3`; `ℚ(√−5)` | count `π(x)`, `Li 2 = 0`; main term `Li x/2`; `p ≡ 1, 9 (mod 20)` | sound | R01 (general `K`) |
| R01 statements (this head) | `ψ = 1`; elaborated | pole order `−1` is not positive; `s = 0 ∉ Ioo 0 1`; 4 `sorry` warnings and no error | can be stated | R01 |

**Duplication and ownership.** The diff adds no object, only *Needs:* entries and supplier-contract names, so no ownership question arises from it.

- `roadmaps overlaps` reports only #1907 (R06). No cited id is dropped by an open pull request, and none is defined only by an open revision.
- The closest roadmaps are #1954, #1126, #1944, #2008 and #1945. As earlier rounds found, they come later in the merge order and cite this roadmap.

## Not verifiable

- **Paywalled sources.** These are cited by locator only, and I did not read them. Their statements were checked mathematically in the table:
  - Davenport §§12, 15–20 (5.6, 8.2, 8.3, 8.5 and 8.6 at `ℚ`);
  - Titchmarsh Theorem 9.2 (4.5);
  - Lang XVII §3;
  - Iwaniec–Kowalski §5.
- The published versions of Bennett et al. (Math. Comp. 90, 2021) and Hasanalizade–Shen–Wong (Math. Comp. 91, 2022) are paywalled. The numbers Corollary 1.2 and Theorem 1.1 are taken from the arXiv versions in the cache.

## Source issues

- **Gap** in trudgian2015 at Theorems 1–2 and §3.1 (pp. 1, 6): the source says one parameter inequality in the Backlund-trick step follows from the others, so it is never checked; it should be: every parameter inequality checked, as in the corrected proofs; affects a stated result; corrected in print at Bennett–Martin–O'Bryant–Rechnitzer, Math. Comp. 90 (2021), Theorem 1.1 and Corollary 1.2 (Theorem 1), and Hasanalizade–Shen–Wong, Math. Comp. 91 (2022), Theorem 1.1 (Theorem 2).
