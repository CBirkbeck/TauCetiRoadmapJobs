# Review of ZerosOfLFunctions (pull request #1913 at 2371fdb)

**Verdict:** accepted

:robot: AI-assisted review (Claude Fable 5.2). This is an incremental re-review of the 12 README lines that changed since `ee070bf`. `Suggested.lean` and every file outside the folder are unchanged. The one finding of the previous review is repaired, the change introduces no new problem, and the gate passes. There are no findings. The folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: the `roadmap-summary` block now says "The Weil explicit formulas … become end theorems, beside ζ cases of 5.6a and 6.4d; every other stated theorem is unchanged", and of 8.5 and 8.7 "the stated carriers unchanged".

## Verified sound

### Gate, dependency check, elaboration

- **Gate, re-run at `2371fdb`:** `gate ZerosOfLFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
  - The worker's run, which includes the targeted build, also reports `build=0`.
- **Dependency check:** `depcheck: 236 roadmaps, 2135 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'` lists nothing.
- **Elaboration:** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits `0` with exactly 23 ``declaration uses `sorry` `` warnings and nothing else.
- **Signatures and padding:** `git diff ee070bf HEAD` leaves `Suggested.lean` unchanged, so the `#check @…` comparison and the one-tactic probe of the previous report (0 of 23 theorems close) carry over. The worker's elaborated signatures report no lost section binder.

### The pull-request description (R01 of the previous review)

The generated `roadmap-summary` block was compared sentence by sentence with the head and with the hand-written paragraph below it.
- New end theorems: it names only the two Weil formulas, "beside ζ cases of 5.6a and 6.4d". That matches the four theorems `Suggested.lean` adds over main (`dedekindZeta_weilExplicitFormula`, `heckeLFunction_weilExplicitFormula`, `riemannZeta_zeros_summable_ordinate`, `neg_re_logDeriv_riemannZeta_le`).
- Effective counts: it says 8.5 and 8.7 identify the counts with `TauCeti.primeCount`, "the stated carriers unchanged", and lists the offset logarithmic integral and the degree-only error width under what the roadmap keeps. That matches the unchanged `primeIdealCount_effective`, `primeCounting_progression_effective` and `rayClassPrimeCount_effective`.
- The block and the hand-written paragraph no longer contradict each other. The `merge-order` block names no prerequisite, which agrees with the overlap facts below.

### The changed contract passages

The diff adds four Mathlib names to "Exact supplier contracts". All four, with the two neighbours of `convex_univ`, elaborate in one `#check` file at the pinned Mathlib, and each gloss matches the pinned signature.

| Name | At the pin | The gloss against the signature | Used at |
| --- | --- | --- | --- |
| `convex_univ` | `Analysis/Convex/Basic.lean:89` | `Convex 𝕜 Set.univ` | 5.4, README line 1553 |
| `completedRiemannZeta₀_one_sub` | `NumberTheory/LSeries/RiemannZeta.lean:100` | `completedRiemannZeta₀ (1 - s) = completedRiemannZeta₀ s`, as glossed | 0.2 Check, line 629 |
| `Complex.Gamma_mul_Gamma_one_sub` | `Analysis/SpecialFunctions/Gamma/Beta.lean:398` | `Gamma z * Gamma (1 - z) = π / sin (π * z)`, for every `z : ℂ`, as glossed | 1.3a Check, line 788 |
| `Polynomial.rootMultiplicity_zero` | `Algebra/Polynomial/Div.lean:528` | `rootMultiplicity x 0 = 0` for every `x`, as glossed | 3.4 Check, line 1201 |

- The 5.4 route "`Convex.contractibleSpace convex_univ` and `SimplyConnectedSpace.ofContractible`" was elaborated: with `Set.univ_nonempty` for the nonemptiness argument of `Convex.contractibleSpace` (`Analysis/Convex/Contractible.lean:36`), it produces `SimplyConnectedSpace ↥(Set.univ : Set ℂ)` with no error.
- The re-wrapped bullet (lines 207–213) keeps every name it had: `Convex.contractibleSpace`, `SimplyConnectedSpace.ofContractible`, `Complex.log_exp`, `Complex.exp_log`, `Complex.exp_eq_exp_iff_exists_int`, `is_const_of_deriv_eq_zero`, `IsOpen.is_const_of_deriv_eq_zero`, `Convex.isPreconnected`, `IsPreconnected.image`.
- The three Check-only names that the previous report remarked on are now in the contract, filed "for the Checks of 0.2, 1.3a and 3.4". Each is used in exactly the section named.

### The seeded sample, where it meets the change

| Target | What the change touches | Checked | Result |
| --- | --- | --- | --- |
| 1.1 A holomorphic branch of log Γ | the contract bullet that 1.1's *Needs:* line draws on is re-wrapped | every 1.1 *Needs:* name (lines 727–734) is still in the bullet | sound |
| 0.1, 0.3 | the new bullet serves the neighbouring 0.2 Check only | the 0.2 Check recomputed (row 0.2 below) | sound |
| 2.4, 3.1, 4.1, 4.3, 5.1, 5.3, 5.6a, 6.3, 6.5, 7.3, 8.1, 8.8 | not changed | carried from the previous reports | no new check needed |

No locator changed, and the README flags none as unverified.

### Adversarial table

**New rows, for the passages the change touches.** Values in double precision; the complex `Γ` by the recurrence and Stirling's series.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.3a Check (reflection on `Re s = 1/2`) | `t = 0, 1, 2` | `‖Γ(½+it)‖² = 3.1415927, 0.2710150, 0.0117334`; `π/cosh(πt) = 3.1415927, 0.2710150, 0.0117334`; `‖Γ(z)Γ(1−z) − π/sin(πz)‖ ≤ 2·10⁻¹¹` | true; equality with `π` only at `t = 0` | none |
| 1.3a Check (second clause) | `Γ(3/2)`, `Γ(3)`, `Γ(½)` | `0.8862269 = √π/2 < 1`; `2.0000000 > 1`; `√π = 1.7724539 > 1` | true | none |
| 0.2 Check (symmetry) | `s ↦ 1 − s` | `(1−s)(−s) = s(s−1)`, and `Λ₀(1−s) = Λ₀(s)` by the pinned lemma, so `F(1−s) = F(s)`; carried values `F(3) = F(−2) = 1.1478798`. For `s Λ(s)`: residue of `Λ` at `1` is `+1`, so a pole remains | true | none |
| 3.4 Check (`P = 0`) | `continuedL χ₋₄ · P` at `2` | `P = 1`: order `0`; `P = X − 2`: `0 + 1 = 1`; `P = 0`: order `⊤` against `rootMultiplicity 2 0 = 0`, so `⊤ ≠ 0 + 0` | true; the exclusion of `P = 0` is needed | none |
| 5.4 (simple connectivity of `Set.univ`) | `E = ℂ` over `ℝ` | `convex_univ : Convex ℝ univ`, `univ` nonempty, so `ContractibleSpace ↥univ`, so `SimplyConnectedSpace ↥univ`; elaborated | true | none |

**Carried rows.** These statements are untouched; the values are those of the previous report (review of `ee070bf`) and, through it, of the review of `820a878`.

| Statement | Values carried | Result |
| --- | --- | --- |
| 0.1/0.3 `OrderLE`, finite order | `log‖1/Γ(−n−½)‖ = 15.147, 364.901, 5914.438` (`n = 10, 100, 1000`); `f = z` with `A' = −½`: `999000.5` at `r = 10⁶`, unbounded | true |
| 0.2 `zetaEntireCompletion` | `F(2) = π/3 = 1.0471976`; `F(0.3+2i) = F(0.7−2i) = 0.906897 − 0.016873i` | true |
| 1.1 `logGamma` | `log 2 = 0.6931472` at `3`; `Γ(−½) = −3.544908 ≠ 0` | true |
| 1.2 Stirling | `‖R‖‖s‖ = 1/12`; at `δ = π − 2.5`: `0.01666 ≤ 0.1676` | true |
| 1.3, 1.3a | `‖Γ(½+i)‖ = 0.52059 ≤ 1.77245`; `‖2^{1+i}‖ = 2`, `‖3^{½−2i}‖ = 1.732051` | true |
| 1.5 | remainder `0.693147`, `−2.063618/−2.063668` | `O(1)` |
| 1.6 `continuedL` | `ζ(0) = −½`; `χ(−1) = −1` | true |
| 2.1/2.5, 2.4 | conductors `7/2`, `12`, `48`, `16`; `Δ`: `90` at the analytic centre | true |
| 3.2–3.4, `dirichletLFunction_convexity` | `‖ζ(½+it)‖/(t+3)^{1/4} = 0.8452, 0.1773`; `1/s · s²` at `0`: `−1 + 2 = 1` | bounded; true |
| 4.1, 4.5, 7.4 `riemannVonMangoldt` | `N(14) = 0`, `N(15) = 1`, `N(100) = 29` vs `28.1273` | true |
| 4.2 Checks | `divisor Λ ∅ 1 = 0` vs `−1`; residues `−1`, `+1`; `Λ(3) = 0.1913133`, `Λ(5) = 0.0787971`, `Λ(7) = 0.0609765`; `6Λ(3) = 1.1478798` | true |
| 4.4 `dual_completed`, `dirichletData_dual` | `L(2+i, χ̄) = 0.9181802 − 0.1004383i = conj L(2−i, χ)`, quartic `χ` mod 5 | true |
| 5.1, 5.3, 5.5 `zetaEntireCompletion_hadamard`, `hadamard_of_orderLE_one` | `n(1000) = 1001`; `cos 1`: `0.5403026` vs `0.5403023`; `B = −0.0230957090` | true |
| 5.6a `riemannZeta_zeros_summable_ordinate` | first pair `0.0099606` | true |
| 6.2, `dedekindZeta_zeroFreeRegion`, `riemannZeta_zeroFreeRegion`, `heckeLFunction_zeroFreeRegion`, `dirichletLFunction_zeroFreeRegion` | cap `log 3/2 = 0.5493`; imprimitive mod 6 enters at `c ≥ 2.890`, `3.811` | true |
| 6.4a `gammaLogDerivBound`, `finite_zero_sum_le_logDeriv`, `completed_orderLE_one` | `C_Γ = 1.5723649`; `0.038959 ≤ 2.354577`; `0.263, 0.343, 0.379` → ½ | true |
| `neg_re_logDeriv_riemannZeta_le` | `24.43 ≈ 1/(4\|t\|) − γ` at `t = 0.01`; `−1.2962 ≤ −1.6667 + 2.649C` | true |
| 7.5 `riemannVonMangoldt_dedekindZeta`, `_heckeLFunction`, `_dirichlet` | `N± = 58` vs `56.2547`; `27.692 ≤ 28.419` | true |
| 8.3 `chebyshevPsi_explicitFormula` | `ψ(100) = 94.04531` vs `95.04034`; `−log(1−½) = 0.6931` | true |
| 8.4/8.6 `dedekindZeta_weilExplicitFormula`, `riemannZeta_weilExplicitFormula`, `heckeLFunction_weilExplicitFormula` | `½ log\|d_K\|` gives `(log\|d_K\|)φ(1)`; `ℚ`, `(4)∞`: `absNorm finitePart = 4`, `infinitePart.card = 1`, conductor term `log 4 = 1.386294` | matches the Lean |
| 8.5 `primeIdealCount_effective` | `π(10⁶) − Li = −128.5` vs `24308.7` | true |
| 8.7 `rayClassPrimeCount_effective`, `primeCounting_progression_effective` | `4` vs `Li(20)/2 = 4.4301` | true |
| 8.8 `frobeniusPrimeCount_effective_abelian` | `ℚ(i)/ℚ`: `½` per class | true |
| 8.9 `Li`, `isLittleO_integral_inv_log_sq` | `Li(10) = 5.120436`; ratios `0.23960, 0.08631, 0.05376` at `x = 10³, 10⁶, 10⁹`; both sides `10.251644` at `x = 100` | true |

### Duplication, ownership, overlaps, suppliers

- The change adds citations of pinned Mathlib declarations only. It defines nothing, restates nothing and moves no ownership. No cross-roadmap citation is added or changed.
- The overlap facts, computed from main and 438 open heads, list no other open pull request changing this roadmap, no cited id that an open pull request drops, no id that only an open revision defines and no id this pull request drops. The closest roadmaps in vocabulary (ExplicitZetaBounds, ExplicitNumberFields, AnalyticNumberTheoryPartIII, ExplicitPrimeCounting) are untouched by a change that adds four Mathlib names.
- The citation tool's 13 unresolved Lean names (the six `Grossencharacter.heckeMellin*` names at README lines 552–555, the `Complex.Hadamard.*`, `Complex.weierstrassFactor` and `Kadiri.*` names at lines 2997–3000) are all in untouched text. The first six are declared by the L-functions roadmap on main; the rest are names of external formalizations listed in the README's closing section. They were passed by earlier reviews and nothing in this change touches them.

## Not verifiable

Nothing new: no changed passage cites a source. The items of the previous reports stand:
- Davenport (`davenport2000`, uncertified): 0.3, 5.2, 5.3, 8.3, 8.5;
- Titchmarsh (no open copy): 4.5, 7.3, 7.4, 7.6;
- Iwaniec–Kowalski (paywalled);
- Lagarias–Montgomery–Odlyzko (`lagarias1979`, uncertified);
- Lang XVII §3 (`lang1994`, uncertified).

Their statements were computed instead (carried rows).

## Source issues

- none
