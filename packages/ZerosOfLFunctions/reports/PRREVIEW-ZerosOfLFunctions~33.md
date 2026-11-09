# Review of ZerosOfLFunctions (pull request #1913 at a8d2e95)

**Verdict:** needs changes

This is an incremental re-review of the 34 lines of `TauCetiRoadmap/ZerosOfLFunctions/README.md` that changed since `3996b81`. `Suggested.lean` is unchanged. Four of the five previous findings are repaired. One finding remains, P3: no order is stated against #1907, carried from the previous R02. The gate passes, and the changed mathematics is correct.

## R01 (P3) — No order is stated against #1907, the other open pull request on this roadmap (previous R02, not repaired)

**Location.** The pull-request description: "Merge order: no pending supplier." It does not mention #1907.

**Claim.** The description implies this pull request can merge independently of other work on the roadmap.

**Witness.** `git merge-tree --write-tree a8d2e95 123254c` reports `CONFLICT (content)` in `TauCetiRoadmap/ZerosOfLFunctions/README.md` and `Suggested.lean`. #1907 is still at `123254c`.
- #1907 declares five theorems this head lacks: `completed_orderLE_one`, `gammaLogDerivBound`, `finite_zero_sum_le_logDeriv`, `dedekindZeta_zeroFreeRegion` and `riemannVonMangoldt_dedekindZeta`.
- It lacks two that this head declares: `riemannZeta_zeros_summable_ordinate` and `neg_re_logDeriv_riemannZeta_le`.

**Repair.** Add one sentence to the description saying which of #1913 and #1907 lands first and that the other rebases on it. The rebased one says which of the seven declarations above it keeps or drops. This head already covers the Dedekind cases through `heckeLFunction_zeroFreeRegion` and `riemannVonMangoldt_heckeLFunction` at the trivial character. Test: the description names #1907 and an order.

## Previous findings

- R01 — repaired: README lines 449–451 now read "consumed by the names that roadmap's `Suggested.lean` declares in the layer cited". All 50 names are declared in `TauCetiRoadmap/LFunctions/Suggested.lean` on main, in the layer cited. The previous search covered only the supplier's README.
- R02 — not repaired: the description still reads "Merge order: no pending supplier.", and #1907 at `123254c` still conflicts in both files. Carried as R01.
- R03 — repaired: 3.4 (line 1123) now reads "Phragmén–Lindelöf between the two edges of 3.3, the convexity bound of Iwaniec–Kowalski §5.2 (for `ζ`, Titchmarsh §5.1)". 4.4 (lines 1275–1277) now gives Davenport §15 and §16 for `K = ℚ` and says the general statement is proved here.
- R04 — repaired: the 6.2 Check (lines 1599–1605) now puts `0` in the region at the primitive source's conductor `q(1, 0) = 3`, which is the region of 6.3. It gives `c ≥ log 6` for the modulus coordinate of 6.4.
- R05 — repaired: the 1.6 Check (lines 878–884) is now a computed separation. With `χ(2) = i`, an equation written against `d` forces `ε L(s, χ̄) = ε′ L(s, χ)`, and the coefficient at `2` then gives `−i = i`.

## Verified sound

**Gate, build and dependency check.**
- The gate, re-run on `a8d2e95`, reports every check at 0 and `OK`. The worker's gate on this head also reports `build=0`.
- `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 in 7.6 s with 17 warnings, all "declaration uses `sorry`".
- The dependency check reports `depcheck: 236 roadmaps, 2264 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.
- Nothing outside the folder changed: `git diff --stat origin/main...HEAD` outside the folder is empty.
- `git diff 3996b81 HEAD -- Suggested.lean` is empty, so the 20 elaborated signatures are unchanged. `signatures.md` reports 0 dropped binders.
- The padding probe, the headline list and the library near-match review of the previous report carry over unchanged.

**R01: the L-functions contract, resolved on main (`3090489`).** In `TauCetiRoadmap/LFunctions/Suggested.lean`, every name in README lines 456–483, and those at line 365, is declared in the layer the README cites:
- Layers 2–3 (lines 927–1066 and 1175–1278): `partialZeta`, `partialZeta_eq_lSeries`, `sum_partialZeta`, the Dedekind names, `dedekindZetaData_hasContinuation`/`_hasFunctionalEquation`, and the `mellinKernel` family.
- Layer 4 (lines 1462 and 1476).
- Layer 5 (lines 1587–1680): `heckeLFunctionC_eq`, `partialZeta_eq_sum_heckeLFunctionC`, `heckeData`, `heckeRootNumber`, `norm_heckeRootNumber`, `completedHeckeLFunction_one_sub` (with `hχ : χ.character ≠ 1`, against `PrimitiveRayClassCharacter.inv`) and `_eventuallyEq` (no triviality hypothesis), as the README says.
- Layer 6 (lines 2390–2550): the `Grossencharacter` names inside `namespace Grossencharacter` (lines 2092–2542). `completedHeckeLFunction_eq_mellin` sits outside that namespace and is cited without the prefix.
- Layer 7 (lines 2680–2688): `heckeLFunction_ne_zero_of_one_le_re` (`hχ1 : χ.character ≠ 1`), `three_four_one_nonneg` and `meromorphicOrderAt_dedekindZetaC_one_add` (`t ≠ 0`).
- Layer 8 (lines 2820 and 2828).

The supplier README's own consumer note (`LFunctions/README.md` lines 1671–1690) promises "exact declarations".

A sweep of every backticked name on README lines that mention "L-functions Layer" (20 names) left five leads. All five exist at the pins:
- Mathlib `PhragmenLindelof.vertical_strip` (`PhragmenLindelof.lean:275`), `completedRiemannZeta_one_sub` (`RiemannZeta.lean:106`), `mellinInv_mellin_eq` (`MellinInversion.lean:92`) and `MeromorphicOn.divisor_def` (`Divisor.lean:61`);
- `HasFunctionalEquation.polarOrder_one_sub_conj`, a structure field (Tau Ceti `Data/RiemannZeta.lean:138`).

**R05: the dual, at the pin.** `TauCeti/NumberTheory/LFunctions/Data/Basic.lean:119–129` defines `AnalyticLFunctionData.dual` with `coeff n := conj (d.coeff n)`, `gammaR := d.gammaR.map conj` and `rootNumber := conj d.rootNumber`. So the shift `1` of an odd character is self-dual, and the coefficient at `2` becomes `−i`, as the Check uses.

**R04: the 6.2 Check against 2.1, 6.3 and the Lean statement.** The pieces agree:
- 2.1's Check gives `analyticConductorAt ζ s = ‖s‖ + 3`, so `q(1, 0) = 3`.
- 6.3 (line 1612) uses `1 − c/log q(χ, 0) ≤ β`, and its third bullet compares with the presented function through 6.4b.
- `dirichletLFunction_zeroFreeRegion` (`Suggested.lean:190`) carries `c ≤ Real.log 3 / 2` and the coordinate `q * (|ρ.im| + 3)`, which is `6` at `q = 2`, `ρ = 0`.

**R03: the new locators against the References and the Lean docstring.**
- The References list Iwaniec–Kowalski §5.2 (convexity), Titchmarsh §5.1 and Davenport §§15–16.
- `dirichletLFunction_convexity` (`Suggested.lean:94–98`) cites the same two convexity locators as 3.3 and 3.4.
- The 4.4 wording follows the pattern the previous review accepted at 4.5 ("Titchmarsh, Theorem 9.2, is the `K = ℚ` case").

**Seeded sample.** Two of the sampled targets fall in the changed passages:
- 1.6 (its Check, above).
- 6.3, whose region the new 6.2 Check uses (above).

The other sampled targets (0.1, 1.2, 1.3a, 2.1, 2.5, 3.5, 4.6, 5.4, 6.5, 7.3, 8.2, 8.6, 8.9) are untouched. Their checks are the previous report's (DLMF 5.5.3, 5.6.6, 5.11.1, 5.11.2, 5.11.9 and §5.11(ii); `kadiri2012` lines 65–85 and 230–237).

**Ownership.** The change adds no object, so no new ownership question arises. Against open pull requests, the overlap tool (index of 2026-11-09T20:46:00Z) reports:
- no id that this README cites and an open pull request drops;
- no id that only an open revision defines;
- no id that this pull request drops.

The closest open roadmaps in vocabulary (ExplicitZetaBounds, ExplicitNumberFields, AnalyticNumberTheoryPartIII, Chebotarev, ExplicitPrimeCounting) were read for ownership by the previous review. The change touches nothing they cite.

**Adversarial table.** The new rows below were recomputed this round, by hand and in plain Python. The carried rows cite the round-32 report on `3996b81` for statements the diff leaves untouched.

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| 1.6 Check 4 (new): FE against `d.dual`, not `d` | quartic `χ` mod `5`, `χ(2) = i`; control `χ₋₄` | `χ(4) = χ(2)² = −1` (odd); `χ(3) = −i`; dual coefficient at `2` is `−i`, shift `conj 1 = 1`; `n = 1` gives `ε = ε′`, `n = 2` gives `−iε = iε`, so `ε = 0`, against `‖ε‖ = 1`; control `χ₋₄` has `d.dual = d`, so a real character could not separate | holds; separates the wrong model |
| 3.4 strip bound (new locator) | `δ = 0.1`, `0.5`; `σ = 1+δ, −δ, ½`; `δ → 0` | exponent `0`, then `0.6`/`1.0` (that is `½ + δ`), then `0.30`/`0.50` (that is `¼ + δ/2`); the limit `(1 − σ)/2` is the IK convexity exponent | holds |
| 4.4 local count (new `K = ℚ` locators) | `T = 14, 21, 25`; disc ⊂ strip; trivial zeros | `Im` range `[T−1, T+1]`; zeros `14.1347`, `21.0220`, `25.0109`, at distances `0.135`, `0.022`, `0.011` from `½ + iT`; `log T = 2.639` against `log(T+3) = 2.833`; trivial zeros at `Im = 0` lie outside, since `T ≥ 2`; `1.5 + 1 = 2.5 ≤ 3` | holds |
| 6.2 Check 2 (new) | principal mod `2`; primitive source `ζ`; cap | `L(0) = (1 − 1)·(−½) = 0`; `ord Λ_ζ(0) = −1`; `q(1,0) = 3`, and `c = log 3` gives the region edge `0`; at `q = 2`, `c = log 3` gives `0.387`; `0` enters at `c ≥ log 6 = 1.792`; cap `(log 3/2)/log 3 = ½` | holds |
| L-functions contract (R01) | 50 names on main | declared 50/50 in `LFunctions/Suggested.lean` at the layers cited; `hχ : χ.character ≠ 1` on `completedHeckeLFunction_one_sub` and `differentiable_completedHeckeLFunction`, matching the README's parentheses | holds |
| 0.2 `zetaEntireCompletion` | round 32 | `s(s−1)Λ₀ + 1`; value `1` at `0` and `1` | holds (carried) |
| 1.4, 1.4a digamma, `ζ'/ζ` FE | round 32 | `−2.4151`; `1.41509` on both sides at `s = 2` | holds (carried) |
| 1.6 `invGammaFactor`, `continuedL` | round 32 | `ζ(0) = −½` against the quotient `0`; `‖1/Gammaℝ(−2n−1)‖ = π^{−n−3/2}Γ(n+3/2)` | holds (carried) |
| 2.1–2.5 conductors | round 32 | `7/2`; `48`; `16`; `90` against `15.75` | holds (carried) |
| 3.1, 3.5 | round 32 | `E₁(1) = 0.2194`; `3.67680` against `3.87` at `m = 10` | holds (carried) |
| 4.1, 4.6 | round 32 | the `toNat` junk `0`; `1.674 ≥ 1.386` | holds (carried) |
| 5.2, 5.6, 5.6a | round 32 | `0.0902 ≤ 0.125`; `B = −0.0230957`; `0.00996` | holds (carried) |
| 6.1, 6.4, 6.4d, 6.5 | round 32 | `2(1+cos θ)² ≥ 0`; `0.6934`; `log 18 = 2.890`; `log 45.19 = 3.811`; `0.2310`; `L(1, χ₋₄)` completion `½` | holds (carried) |
| 7.1–7.5 | round 32 | winding numbers `1` and `0`; `S → −1` as `T → 0⁺`; `N(100) = 29`; `N± = 58` against `56.25` | holds (carried) |
| 8.3–8.9 | round 32 | `−log 2π = −1.8379`; `−0.347i` against `+0.347i`; `4` against `4.4301`; `3.6629` | holds (carried) |
| `hadamard_of_orderLE_one`, `zetaEntireCompletion_hadamard` | round 32 | `(a,b) = (0,1)` for `exp`; the factor `s/0 = 0` gives `1` | holds (carried) |
| `dirichletLFunction_convexity`, `riemannZeta_zeroFreeRegion`, `dirichletLFunction_zeroFreeRegion` | `q = 1`; principal mod `2` | exponent `¼ + δ/2`; region `≥ 0.6934` inside `ζ`'s | holds |

**Headline theorems.** These are unchanged and stated in `Suggested.lean`:
- `heckeLFunction_zeroFreeRegion`, `riemannVonMangoldt_heckeLFunction`, `primeIdealCount_effective`, `rayClassPrimeCount_effective`, `frobeniusPrimeCount_effective_abelian` and `hadamard_of_orderLE_one`;
- the `K = ℚ` forms `riemannZeta_zeroFreeRegion`, `dirichletLFunction_zeroFreeRegion`, `riemannVonMangoldt`, `riemannVonMangoldt_dirichlet`, `chebyshevPsi_explicitFormula` and `riemannZeta_weilExplicitFormula`;
- `dirichletLFunction_convexity`, `riemannZeta_zeros_summable_ordinate` and `neg_re_logDeriv_riemannZeta_le`.

The module docstring names what cannot be stated at the pins: the completed Dedekind and Hecke functions, and the exceptional-zero terms.

## Not verifiable

- Iwaniec–Kowalski, *Analytic Number Theory*, §5.2 (the new 3.4 locator) and Titchmarsh §5.1. Both are paywalled books. Neither has an entry in the roadmap's `sources.toml`, so they could not be fetched under a manifest key. They were checked only for consistency: the exponent `(1 − σ)/2 + ε` at `δ → 0` and `¼ + ε` at `σ = ½`. The worker may want to record both as uncertified, with 3.3, 3.4 and 4.5 in `cited_for`.
- Davenport §15 (`N(T + 1) − N(T) = O(log T)`) and §16 (`O(log q(|T| + 2))` for primitive `χ`), the new 4.4 locators. `davenport2000` is recorded as uncertified and its `cited_for` does not list 4.4. These were checked only for consistency with 4.4 at `K = ℚ`.
- Carried from round 32: Lang XVII §3 (8.4), Lagarias–Montgomery–Odlyzko Lemma 2.3 (6.4, checked only through `kadiri2012` lines 65–73), and Lagarias–Odlyzko 1977 Theorems 1.3 and 9.2.

## Source issues

- none
