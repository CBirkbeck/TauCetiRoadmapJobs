# Review of ZerosOfLFunctions (pull request #1913 at 3996b81)

**Verdict:** needs changes

This is an incremental re-review of the 129 lines that changed in `TauCetiRoadmap/ZerosOfLFunctions/` since `70b1054`. The changes are:

- the divisor convention;
- the Mathlib and Tau Ceti supplier lists;
- §4.2 and its new Checks;
- §6.4: the sentence on `K = ℚ`, the new paragraph "At `K = ℚ`, every Dirichlet character", its *Needs:* line and its three Checks;
- the Layer 6 Examples;
- two docstrings in `Suggested.lean`.

No file outside the folder changed. Every changed passage checks out. One previous finding is not repaired: it concerns the pull request's description, not the folder.

## R01 (P3) — No stated order against #1907, the other open pull request on this roadmap (carried from the previous review's R03)

**Location.** The pull request's description, which is outside the folder. It is unchanged since the previous review, and its last line still reads "Merge order: no pending supplier." It names no other pull request.

**Claim.** Two open pull requests change `TauCetiRoadmap/ZerosOfLFunctions/`, and their heads still conflict. One has to be rebased on the other before either merges, and the description has to say which.

**Witness.**
- `git merge-tree --write-tree 3996b81 123254c` reports `CONFLICT (content)` in `TauCetiRoadmap/ZerosOfLFunctions/README.md` and in `Suggested.lean`. #1907 is still at `123254c` in the index of 2026-11-09T19:11:44Z.
- #1907 declares `dedekindZeta_zeroFreeRegion`, `completed_orderLE_one`, `gammaLogDerivBound`, `finite_zero_sum_le_logDeriv` and `riemannVonMangoldt_dedekindZeta`, none of which is declared here.
- #1907 lacks `riemannZeta_zeros_summable_ordinate` and `neg_re_logDeriv_riemannZeta_le`, which this head declares.

**Repair.** Add one sentence to the description saying which of #1913 and #1907 is rebased on the other. The rebased one then reconciles the seven declarations listed above.

**Test.** After the rebase, `git merge-tree` of the two heads reports no conflict, and `roadmaps overlaps ZerosOfLFunctions` lists none.

No repair report marks this finding `not actionable in this package`. The package's `reports/` folder holds only review and gate reports.

## Previous findings

- R01 — repaired: §4.2 (README lines 1207–1211) now claims `−polarOrder` only "at the points of `U ∩ polarOrder.support`", with "Off `U` it is `0` (`MeromorphicOn.divisor_def`)". It adds "in particular `divisor Λ univ = −polarOrder` on `polarOrder.support`", and the `U = ∅` witness is now a Check.
- R02 — repaired: README line 1699 opens a new paragraph: "`dirichletLFunction_zeroFreeRegion` is stated on Mathlib's `DirichletCharacter.LFunction χ` for every character `χ` modulo `q ≥ 1`, primitive or not, in the coordinate `q (|Im ρ| + 3)` … with `0 < c ≤ log 3/2`". The three transfer facts follow it.
- R03 — not repaired: the description still ends "Merge order: no pending supplier." and names neither #1907 nor a rebase order. Carried forward as R01 above.

## Verified sound

**Gate, build and dependency check.**
- Gate re-run at `3996b81`: every check is `0`, the result is `OK`, exit 0. The worker's gate at this head also has `build=0`.
- `lake env lean` on `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean`: exit 0 in 29 s. The only warnings are the 17 `declaration uses 'sorry'`, one per theorem.
- Dependency check output: `depcheck: 236 roadmaps, 2264 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The previous head gave 2263 edges. Every supplier this roadmap names is on main.
- `git diff --stat origin/main...HEAD` outside the folder: empty.

**`Suggested.lean`.**
- The diff changes only two docstrings: the module docstring and that of `dirichletLFunction_zeroFreeRegion`. No statement, binder or import changed.
- The elaborated type of `dirichletLFunction_zeroFreeRegion` (`signatures.md`) was compared with the new README paragraph, and they agree:
  - `∃ c, 0 < c ∧ c ≤ Real.log 3 / 2`;
  - `∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q)`;
  - the coordinate `↑q * (|ρ.im| + 3)`;
  - the conclusions `ρ.im = 0 ∧ χ ^ 2 = 1 ∧ order = 1`, plus uniqueness.

  The README's generality now equals the signature's.
- The docstring of `heckeLFunction_zeroFreeRegion` (line 156) is consistent with the new docstring: "at `K = ℚ` it is the region of `dirichletLFunction_zeroFreeRegion` for primitive characters".
- Padding: the touched statement is unchanged, so the previous one-tactic probe stands (all 17 theorems fail it). The headline list is unchanged.

**Library declarations opened at the pins** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`). Twelve `#check @` lines in one scratch file all resolve.

Mathlib:
- `MeromorphicOn.divisor_def` (`Mathlib/Analysis/Meromorphic/Divisor.lean:61`): `if MeromorphicOn f U ∧ z ∈ U then (meromorphicOrderAt f z).untop₀ else 0`.
- `DirichletCharacter.changeLevel` (`NumberTheory/DirichletCharacter/Basic.lean:65`) is a `→*`.
- `changeLevel_eq_one_iff` (`:88`, with `[NeZero m]`).
- `primitiveCharacter` (`:306`, level `χ.conductor`).
- `changeLevel_primitiveCharacter` (`:309`).
- `primitiveCharacter_isPrimitive` (`:313`).
- `DirichletCharacter.LFunction_changeLevel` (`NumberTheory/LSeries/DirichletContinuation.lean:149`). Its hypothesis is `χ ≠ 1 ∨ s ≠ 1`, with `[NeZero M] [NeZero N]`, and its product runs over `N.primeFactors`. The README's "for `s ≠ 1`" is a correct special case. At `s = 1` the orders still agree, because they read punctured germs.

Tau Ceti:
- `TauCeti.GlobalNumberFields.ratDirichletEquiv` (`NumberTheory/NumberField/Global/RayClass/Character/Dirichlet.lean:75`): a `≃*` from the ray-class characters of `ratModulus n hn = (n)·∞` to the Dirichlet characters.
- `onIdeals_ratDirichletEquiv_symm` (`:103`, the value at the absolute norm).
- `RayClassCharacter.absNorm_conductor_finitePart` (`:208`).
- `TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane` (`Analysis/Meromorphic/Continuation.lean:40`, `f =ᶠ[𝓝[≠] z] g` for every `z`).
- `meromorphicContinuation_eqOn` (`:88`, given an existence hypothesis).
- `eq_of_meromorphic_of_eqOn_halfPlane` (`:52`).
- `HasMeromorphicContinuation` (`NumberTheory/LFunctions/Data/Basic.lean:183–187`, with fields `meromorphic`, `meromorphicOrderAt_eq` and `analyticAt`). These fields are exactly what the repaired §4.2 needs:
  - global meromorphy gives `MeromorphicOn Λ U` for every `U`;
  - `meromorphicOrderAt_eq` gives the order `−polarOrder p` at a pole;
  - `analyticAt` gives order `≥ 0` off the support.
- `riemannZetaData` (`Data/RiemannZeta.lean:50–57`: `completed := completedRiemannZeta`, `polarOrder := single 0 1 + single 1 1`).
- `PrimitiveRayClassCharacter` (`Hecke/Primitive.lean:91`).

**Lean probes** in the scratch file. All of the following elaborate:
- `MeromorphicOn.divisor completedRiemannZeta ∅ 1 = 0` by `simp`;
- `changeLevel h (χ ^ 2) = (changeLevel h χ) ^ 2` by `map_pow`;
- `χ ^ 2 = 1 ↔ χ.primitiveCharacter ^ 2 = 1`, by `changeLevel_primitiveCharacter`, `map_pow` and `changeLevel_eq_one_iff`. This is the reality transfer of §6.4;
- `NumberField.discr ℚ = 1` by `simp`.

**Cross-roadmap citations and ownership.**
- The diff adds no cross-roadmap citation.
- `citations.md` lists the same 13 "found nowhere" names as the previous round, all in untouched text: 6 are L-functions names declared on main and 7 are PrimeNumberTheoremAnd names under Provenance.
- `overlaps.md` lists no dropped id and no id that only an open revision defines.
- A grep of both pins finds no zero-free region, so `dirichletLFunction_zeroFreeRegion` and its transfer to imprimitive characters are owned here. `NumberTheory/DirichletCharacter/LFunction/Bounds.lean` in Tau Ceti has only bounds on the L-function itself.
- Ownership against the other open pull requests was not re-checked beyond the overlap scan, because the diff adds no new object.

**Sources.** None of the seeded targets (0.3, 0.4, 1.2, 1.6, 2.1, 4.3, 4.4, 5.2, 5.3, 6.3, 7.4, 8.2, 8.5, 8.7, 8.8) lies in a changed passage, and the changed passages add no external locator. Their new claims rest on pinned declarations, opened above. The previous review's source checks stand for the unchanged text.

**Adversarial table.** The changed statements come first, with values computed this round in Python and Lean. The rows marked "r30" are carried from the previous report (`PRREVIEW-ZerosOfLFunctions~30`) for statements the diff leaves untouched.

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: divisor `0` outside `U` | `completedRiemannZeta`, `U = ∅`, `z = 1` | `divisor … ∅ 1 = 0` (Lean, `simp`); `divisor_def` branch `z ∈ U` false | holds | — |
| 4.2 (i), nonnegative off support, every `U` | ζ record at a point `z ∉ U`; at `½ + 14.1347i` with `U = univ`; at `2` | `0 ≥ 0`; `divisor = 1 ≥ 0`; analytic with `Λ(2) = π/6 ≠ 0`, so `0` | holds | — |
| 4.2 (ii), `−polarOrder` on `U ∩ support` | ζ record at `p = 1`: `U = univ`, `U = ∅`; at `p = 0` | `−1 = −polarOrder 1`; `U = ∅` claims nothing (value `0`); `−1 = −polarOrder 0` | holds (R01 of r30 repaired) | — |
| 4.2 Check at `−2` | `Λ(−2)` | `Λ(−2) = Λ(3) = π^{−3/2} Γ(3/2) ζ(3) = 0.191313 ≠ 0`; `polarOrder(−2) = 0`; divisor `0` | holds | — |
| 4.2 Check, entire completion at `1` | `zetaEntireCompletion 1` | `1·0·Λ₀(1) + 1 = 1 ≠ 0`; `−1 + polarOrder 1 = −1 + 1 = 0` | holds | — |
| 6.4 at `K = ℚ`, primitive `χ` | `n = 1`, `d_ℚ`, conductor | `NumberField.discr ℚ = 1` (Lean); `1 · q · (|t| + 3) = q(|t| + 3)`; `absNorm 𝔣.finitePart = conductor χ = q` (`absNorm_conductor_finitePart`) | holds | — |
| 6.4 transfer (1): factors vanish only on `Re s = 0` | `1 + 2^{−s}` at `iπ/log 2`; `1 − 2^{−s}` at `2πi/log 2` | `|value| = 3.2·10⁻¹⁶`, `6.4·10⁻¹⁶` (zeros on `Re s = 0`); a factor with `χ*(p) = 0` is `1` | holds | — |
| 6.4 transfer (2): the cap | `q ≥ 1`, `|t| + 3 ≥ 3` | `c/log(q(|t|+3)) ≤ 0.549306/1.098612 = 0.5` | holds | — |
| 6.4 transfer (3): nesting at `q* ∣ q` | `(q, q*) = (6,3), (6,1), (12,4), (2,1)` at `t = 0, 10, 1000` | `1 − c/log(q(t+3)) ≥ 1 − c/log(q*(t+3))` in all 12 cases | holds | — |
| 6.4 reality and uniqueness transfer | `χ² = 1 ↔ χ*² = 1` | elaborated in Lean (`map_pow`, `changeLevel_eq_one_iff`); two zeros at `q` are two zeros at `q*` by (1)–(3) | holds | — |
| 6.4 Check: principal mod 2 | region and extra zeros | `1 − (log 3/2)/log 6 = 0.693426`; zeros `2πik/log 2` on `Re 0` | holds | — |
| 6.4 Check: principal mod 6 | double zero at `0` | `ζ(0) = −½ ≠ 0`, so order 2; it enters the region iff `c ≥ log 18 = 2.890372 > 0.549306`; capped bound at `t = 0`: `0.809953 > 0` | holds | — |
| 6.4 Check: χ₃ induced mod 6 | factor `1 + 2^{−s}` | `χ₃(2) = −1`, `χ₃(3) = 0`; `π/log 2 = 4.532360`; `6(4.53236 + 3) = 45.19416`, `log = 3.810968`; capped bound at that height `0.855862 > 0` | holds | — |
| `dirichletLFunction_zeroFreeRegion` (docstring changed) | README vs signature; χ₀ mod 2 | both are `∀ q [NeZero q] χ`, coordinate `q(|Im ρ|+3)`, `c ≤ log 3/2`; χ₀ mod 2 is covered by the transfer from ζ, region `Re ≥ 0.6934` | holds (R02 of r30 repaired) | — |
| `OrderLE` (0.1) — r30 | `exp z²` at `A = 1`; `1/Γ`; `1` at `A = −1` | `exp(r²)/exp(r^{3/2}) → ∞`; `log‖1/Γ(−n−½)‖ = n log n + O(n)`; `1 ≤ e·exp(‖s‖^{A'})` | holds | — |
| `zeroCount` (4.1) — r30 | `z/(z−1)` on `closedBall 0 2`; `1/z` on `{0}`; `f = 0` | count `1`, divisorCount `0`; `(−1).toNat = 0`; divisor `0` | holds | — |
| `zetaEntireCompletion` (0.2) — r30 | `s = 0, 1`; generic `s` | `0 + 1 = 1` at both; `s(s−1)Λ₀ + 1 = s(s−1)Λ` | holds | — |
| 0.4 strip growth — r30 | pole at `1+5i`; `exp(−s²)` | unbounded at `t = 5`; `e^{t²}` beats `C(1+|t|)^A` | holds | — |
| 1.1 `logGamma` — r30 | first `Im LnΓ = π` on rays `π/2, π/4, 1/10` | `5.5386, 4.1513, 12.6264` (README `5.539, 4.151, 12.626`) | holds | — |
| 1.4 / 1.5 — r30 | `logDeriv Gammaℂ 1`; `−logDeriv Gammaℝ 3` | `−2.4151`; `0.5541` | holds | — |
| 1.4a — r30 | `s = 2`; `s = −2` | `1.41509` both sides; `−0.1648` vs `0.5541` | holds | — |
| 2.1 conductors — r30 | ζ at `½`; `ℚ(i)`; odd χ mod 4 | `3.5`; `48`; `16` | holds | — |
| 2.2 / 2.3 / 2.4 — r30 | ζ on `[−5,5]`; `Δ`, `k = 12` | `|t|+3 ≤ ‖σ+it‖+3 ≤ (8/3)(|t|+3)`; `90`; `15.75` | holds | — |
| 3.1 / 3.5 — r30 | `E₁(1)`; `|Λ(2m+2i)|`, `m = 10, 20` | `0.2194 ≤ 1`; `3.67680`, `13519751.806` | holds | — |
| 4.3 Jensen — r30 | `z/10`, `r = 1`, `R = 2`, `M = 1` | `3.32 ≥ 1`; trailing form `2 ≥ 1` | holds | — |
| 5.2 `E₁` — r30 | `z = −½`; `z = 1` | `0.0902 ≤ 0.125`; `E₁'(1) = −e` | holds | — |
| `hadamard_of_orderLE_one` (5.3) — r30 | `1 − s`; `exp(cs)` | `exp(−s)E₁(s)`, `b = −1`; empty product, `b = c` | holds | — |
| `zetaEntireCompletion_hadamard`, 5.6 — r30 | `B`; `exp s · ξ̃` | `B = −0.0230957`; no unimodular `κ` | holds | — |
| `riemannZeta_zeros_summable_ordinate` — r30 | first pair; `1/Γ(s+½)` | `0.00996`; real zeros make it diverge | holds | — |
| 6.3 — r30 | ζ; cap at `n = 1` | empty; `β ≥ ½` | holds | — |
| `heckeLFunction_zeroFreeRegion` — r30 | nesting factor; LMO region | `1.2619 < 1.27`; contained for `c < 1/R₄` | holds | — |
| `riemannZeta_zeroFreeRegion` — r30 | `γ = 0`; `−2` | `Re ≥ 1 − c/log 3`; excludes `−2` for `c < 3 log 3` | holds | — |
| `neg_re_logDeriv_riemannZeta_le` — r30 | `δ ≥ 1`; `t → 0` | `≤ 0.570`; `1/(4|t|)` vs `log|t| → −∞` | holds | — |
| 7.4 `riemannVonMangoldt` — r30 | `T = 2`; `T = 100` | `0` vs `−0.6827`; `29` vs `28.127` | holds | — |
| `riemannVonMangoldt_dirichlet` / `_heckeLFunction` — r30 | `q = 1`; `ℚ(i)` | `2N(T)`; `(T/π)log(4(T/2πe)²)` | holds | — |
| `chebyshevPsi_explicitFormula`, 8.2–8.3 — r30 | `c_ℚ`; `ℚ(i)`, `x = 2` | `−1.8379`; `0.6931` | holds | — |
| `riemannZeta_weilExplicitFormula` — r30 | shift `(2) → (−1)`; `φ = 0` | prime part `−∑Λ(n)(φ(n)+φ(1/n)/n)`; `0 = 0` | holds | — |
| `primeIdealCount_effective` (8.5) — r30 | `ℚ`, `x = 10⁶` | `ψ−ϑ = 1102.42 ≤ 137682.4`; `Π = 78597.11` vs `π = 78498` | holds | — |
| 8.6 — r30 | quartic χ mod 5 | `−(i log 2)/2` vs `+(i log 2)/2` | holds | — |
| `rayClassPrimeCount_effective` (8.7) — r30 | `ℚ`, `(4)∞`, `x = 9` | `log 15` vs `log 5`; `log 21` vs `log 63` | holds | — |
| `primeCounting_progression_effective` — r30 | `q = 4`, `a = 3` / `a = 2` | `4` vs `4.4301`; unit hypothesis needed | holds | — |
| `frobeniusPrimeCount_effective_abelian` (8.8) — r30 | `K = L = ℚ`; fibre identity | `π(x) − Li x`; `x^β/(β#G)` | holds | — |
| 8.9 / `dirichletLFunction_convexity` — r30 | `Li 10`; `q = 1, t = 0` | `5.1204`, `3.6629`; `1.4604 ≤ C·3^{¼+ε}` | holds | — |

**Remarks on untouched text** (no change requested):
- The new convention sentence "a value of the divisor is claimed only at points of `U`" sits beside unchanged targets that already restrict to `R ⊆ U` or `U = univ`. These are 4.1 and 9.x at README lines 1180, 1834 and 2454–2485. None of them is made wrong.
- The 6.4 route through `meromorphicContinuation_eqOn` needs an existing continuation. At `K = ℚ`, Mathlib's `DirichletCharacter.LFunction` supplies one, and for general `K`, L-functions Layer 5 (already in the *Needs:* line) does.

## Not verifiable

The changed passages add no external locator, so nothing new is unverifiable. The previous review's entries stand for the unchanged text:
- Davenport, Titchmarsh, Iwaniec–Kowalski, Lang and Lagarias–Montgomery–Odlyzko are settled as uncertified or are paywalled.
- Lagarias–Odlyzko 1977: no legal copy was found.
- DLMF 5.5.3 and 5.6.6 are outside the cached §5.11 text.
- PrimeNumberTheoremAnd: only one file was opened.

## Source issues

- none
