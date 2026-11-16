# Review of CharacterSumsOverFiniteFields (pull request #1712 at e06f143)

**Verdict:** needs changes

Incremental re-review of 51 changed lines since `cbf32cf`, all in `## Provenance` of `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md` (lines 2336–2383). Three findings, all P3, all in the changed lines.

## R01 (P3) — "no counterpart in these three repositories" fails for the additive characters of Layer 0

**Location:** `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md` lines 2336–2337: "**Layers 0–2, 4.5 and 5–7.** Multiplicative characters and their Kummer sheaves, and Gauss, Jacobi and Kloosterman sums, have no counterpart in these three repositories."

**Claim:** The change widened "in the modules above" to the three repositories. Layer 0 also owns additive characters (0.2, 0.6), and weil-conjectures at `55abf46` has both: the bullet's label is contradicted.

**Witness:** `WeilConjectures/Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean` at `55abf46`: `AddChar.compTrace` (`ψ.compAddMonoidHom (Algebra.trace K L).toAddMonoidHom`, the body of `AddChar.liftTrace`), `compTrace_compTrace`, `isPrimitive_compTrace`, `exists_mulShift_eq_of_isPrimitive`.

**Repair:** Replace the bullet by:

> - **Layers 0–2, 4.5 and 5–7.** Multiplicative characters and their Kummer sheaves, and Gauss, Jacobi and Kloosterman sums, have no counterpart in these three repositories. Additive characters do: `WeilConjectures/Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean` (weil-conjectures) defines `ψ ∘ Tr_{L/K}` for a finite extension of fields, the `liftTrace` of 0.6, proves its transitivity in a tower and its primitivity for `ψ ≠ 1` and `L/K` separable, and proves that every additive character of a finite field with values in a field is a shift `ψ.mulShift a` of a given primitive one, the surjectivity in 0.2.

## R02 (P3) — the LeanPool point count identity has a parameter in the extension field

**Location:** `README.md` lines 2344–2346: "its Kloosterman sums carry no multiplicative character, those over a finite field have their parameters in `𝔽_p`".

**Claim:** One sum over `𝔽_{p^n}` in the cited directory has a parameter in `𝔽_{p^n}`; only the sums with a lifting relation and a bound have both parameters in `𝔽_p`.

**Witness:** `Stepanov/CurveTrace.lean` at `f8b9b72`: `extensionKloostermanScalarSum p n (c : GaloisField p n) (m : ZMod p) = ∑_t ψ(m · Tr(t + c/t))`, which is `K_{𝔽_{p^n}}(1; m, m c)` with `c ∈ 𝔽_{p^n}`; `card_quadraticArtinCurve_eq_scalarSums` is stated for such `c ≠ 0`.

**Repair:** Replace the clause by: "its Kloosterman sums carry no multiplicative character, its lifting relation and its bounds over a finite field are for parameters in `𝔽_p`".

## R03 (P3) — the Stepanov estimate of LeanPool is the case `d = 2` of 4.2 under three further hypotheses, not two

**Location:** `README.md` lines 2357–2358: "the case `d = 2` of 4.2, with constants depending on `m` alone, under the two further hypotheses `f(0) ≠ 0` and `m ≥ 4`."

**Claim:** 4.2 at `d = 2` has no condition on the characteristic; the cited theorem also assumes `p` odd.

**Witness:** `Stepanov/Defect.lean` at `f8b9b72`, `stepanov_hyperelliptic_defect_high_field`: `(hpodd : Odd p)`. 4.2 at `d = 2`, `F = 𝔽_4`, `f = X` (not `c · g²`): `N = 4 = Q`, covered by 4.2, not by the cited theorem.

**Repair:** "the case `d = 2` of 4.2 in odd characteristic, with constants depending on `m` alone, under the two further hypotheses `f(0) ≠ 0` and `m ≥ 4`."

## Previous findings

- The previous review, of `cbf32cf`, raised no finding; there is none to account for.

## Verified sound

**The changed passage against the files it cites** (each read at `LeanPool/lean-pool` `f8b9b72`, paths relative to `LeanPool/KloostermanWeil/`).

| Sentence of `## Provenance` | What the cited file shows | Result |
|---|---|---|
| commit `f8b9b72`, Lean `v4.35.0`, Mathlib `56a0058`, 38 files, Apache-2.0 | `lean-toolchain` `v4.35.0`; manifest Mathlib rev `56a00585…`; 38 blobs under the directory; `LICENSE` Apache 2.0 | agrees |
| adapted from `charliedorsey/weil-bounds-toolkit` at `7adcd23` | `LeanPool/projects/kloosterman-weil.yaml`: `commit: 7adcd236…`; upstream licence `Apache-2.0`; each file's docstring names the toolkit | agrees |
| `Stepanov/Algebra.lean`: criterion, root count, vanishing on `X^{j p^e}` | `hasseRootMultiplicityCriterion` (iff, any field, any `h`); `card_mul_le_natDegree_of_uniform_rootMultiplicity` (`h ≠ 0`, `0 < l`); `hasseDeriv_X_mul_prime_pow_eq_zero` (`0 < k < p^n`, `CharP F p`) | agrees |
| `Stepanov/Defect.lean`: the estimate and its hypotheses | `stepanov_hyperelliptic_defect_high_field`: `card F = p^n`, `Odd p`, `f ≠ 0`, `3 < natDegree`, `100(m+1)(sqrt q + 1) < q`, `coeff 0 ≠ 0`, `¬ IsScalarSquare f`; strict `<` with `80(m+1)(sqrt q + 1) + 1` | agrees (R03 on the summary clause) |
| `Stepanov/PowerSumSpectral.lean`: 4.4 with `C ≥ 1`, Newton and Cauchy | `norm_le_radius_of_power_sums_eventually`: `0 < r`, `1 ≤ C`, `∀ n ≥ n₀`, conclusion `‖z i‖ ≤ r`; module docstring names both | agrees |
| `Weil/PrimeFoundation.lean`: symmetry, scaling, degenerate values | `kloostermanSumPrime_comm`; `weilKloostermanPrime_scaling` (`m ≠ 0`, `S(m,n) = S(1, mn)`); `_zero_left`, `_zero_right` `= −1`; `_zero_zero` `= p − 1` | agrees |
| `Carlitz/`: the weight, the three coefficient sums, the generating identity | `etaPoly = ψ(−nextCoeff − t · coeff 1 / coeff 0)`, `0` at `coeff 0 = 0`; `A_one_eq_K`, `A_two_eq_card` (`t ≠ 0`), `A_eq_zero_of_three_le`; `carlitz_generating_identity` (`t ≠ 0`) | agrees |
| `Stepanov/CarlitzRoots.lean`: lifting relation | `carlitzAlpha_add_beta` `= −Kext p 1 t`, `carlitzAlpha_mul_beta` `= p`, `Kext_eq_neg_root_power_sum_pos` (`t ≠ 0`, `n ≠ 0`); `Kext p n t = ∑_{x ≠ 0} ψ(Tr(x + t/x))` | agrees |
| `Stepanov/PrimeWeil.lean`: `|α| = |β| = √p`, `p` odd | `carlitzAlpha_norm_eq_sqrt_prime`, `carlitzBeta_norm_eq_sqrt_prime` (`Odd p`, `c ≠ 0`); no Laurent curve is used | agrees |
| `Stepanov/CurveTrace.lean`, `PointCountBridge.lean`: the curve count | `eval_kloostermanCurvePolynomial = (x^p − x)² − 4c`; `pointCountError_eq_errorAggregate`, `errorAggregate_eq_Kext_sum`: `N − p^n = −1 + ∑_{m ≠ 0} Kext p n (m² c)` | agrees |
| `Weil/PrimeKloosterman.lean`: `|S(m, n; p)| ≤ 2√p`, every `p`, `p = 2` trivially | `weil1948_bound`: `m ≠ 0`, `n ≠ 0`, every prime; `oneParameterPrimeWeil_two` by `norm_sum_le` | agrees |
| `Weil/ChineseRemainderAndCompletion.lean`: factorization with `c̄₂`, `c̄₁` | `kloostermanUnitSum_crt`; `crt_bezout`: `n · L + m · R = 1`, so `L ≡ n⁻¹ (mod m)` multiplies both arguments of the factor modulo `m` | agrees |
| `Weil/Contracts.lean`: `2^{ω(N)} √N`, `N` squarefree, `n` a unit | `squarefreeUnitNumerator_bound`: `Squarefree q`, `IsUnit a`, where `a` multiplies `x⁻¹` in `kloostermanUnitSum q a b` | agrees |
| incomplete sums are in these two files and are *Not owned here* | `centeredReducedIntervalSum_le`, `weightedCenteredReducedIntervalSum_le` and their instances; README line 261 excludes incomplete sums | agrees |
| twisted sums, `q ≠ p`, the angle, 5.2, 5.3 have no counterpart there | the 38 files: no `MulChar` in a statement, no `arccos`, no Salié sum; base field always `ZMod p` | agrees |
| Gauss, Jacobi, Kloosterman sums absent from the three repositories | full-content search at `27cdb20`, `012108f`, `55abf46`: no `jacobiSum`, no Kloosterman sum, `gaussSum` only as index tags of Mathlib's | agrees (R01 on the label) |

**The adversarial table** (the statements the changed text cites; the diff changes no statement).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 5.4 weight `κ` at `χ = 1`, `a = 1`, `b = t` against `etaPoly` | `g = X − c`; `g = X² + uX + v`, `v ≠ 0` | `κ = ψ(c + t/c)`, `etaPoly = ψ(c − t · 1/(−c))`, equal; `κ = ψ(s₁ + t s₁/s₂) = ψ(−u − t u/v)`, `etaPoly = ψ(−u − t u/v)` | the same weight |
| 5.4 lifting relation at `χ = 1` | `p = 3`, `t = 1`, `n = 2` | `K₃ = e(2/3) + e(1/3) = −1`; `α + β = 1`, `α β = 3`; `−(α² + β²) = −(1 − 6) = 5 = K₉` (5.4's Check) | sound |
| the curve count `p^n − 1 + ∑_s K(1; 1, s² t)` | `p = 3`, `n = 1`, `t = 1`: `y² = (x³ − x)² − 1` | `x³ − x = 0` on `𝔽₃`, `y² = 2` has no root: `N = 0`; formula `3 − 1 + 2 · (−1) = 0` | sound |
| 5.1 scaling and 5.6 at `χ = 1` | `u = m`: `K(1; m, n) = K(1; 1, mn)`; `K(1; m, 0)`; `K(1; 0, 0)` over `𝔽₇` | `K(1; 2, 3) = K(1; 1, 6)` (5.1's Check); `∑_{x ≠ 0} ψ(mx) = −1`; `6 = p − 1` | sound |
| 7.4 at `χ = 1` against the Bézout multipliers | `c₁ = 3`, `c₂ = 5` | `5 · 2 + 3 · (−3) = 1`: `c̄₂ = 2 (mod 3)`, `c̄₁ = 2 (mod 5)`; `S(1,1;15) = S(2,2;3) S(2,2;5) = (−1)(2.6180) = −2.6180` | sound |
| 7.6 on squarefree `N`, `n` a unit | `N = 15`, `m = n = 1`; `N = 7`, `m = 7`, `n = 1` | `τ(15) = 4 = 2²`, `(1,1,15) = 1`, `2.618 ≤ 15.49`; `|S(7,1;7)| = 1 ≤ 2√7 = 5.29` | sound |
| 4.2 at `d = 2` against the LeanPool constants | `m = 4`: both thresholds and constants; `𝔽₄`, `f = X` | 4.2: `C = 2 min(32, 16) = 32`, `Q₀ = 2026`; LeanPool: `≤ 800√q + 401`, needs `500(⌊√q⌋ + 1) < q`, so `q > 2.5 · 10⁵`; `N = 4 = Q` | admissible pair; R03 |
| 4.4 with `C ≥ 1` | `C = 0`, all roots `0`; roots `1, 1`, `ρ = 1` | sums `0 ≤ 0`, also `≤ 1 · ρ^n`; sums `2 ≤ 2`, norms `1 ≤ 1` | `max(C, 1)` loses nothing |
| 4.1 on `X^{j p^e}` | `p = 2`, `e = 2`, `j = 1`, `k = 2`; `k = 4` | `C(4,2) = 6 = 0`; `C(4,4) = 1 ≠ 0`, so `k < p^e` is needed | sound |

The rows for the other statements stand as in the previous review, of `cbf32cf`.

- Gate, run on this head with `--base origin/main`: every scanner 0, `OK`; the worker's gate reports `build=0`.
- Dependency check: `depcheck: 251 roadmaps, 2394 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 35 `declaration uses sorry` warnings and nothing else; the file is unchanged since `cbf32cf`.
- Outside the folder: `git diff --stat origin/main...HEAD` is empty.
- Repository files read at the cited commits: all 38 of `LeanPool/KloostermanWeil/`, the project record and manifest of lean-pool, 6 files of weil-conjectures; 16 sentences checked, 13 agree, 3 are R01–R03.
- The pull request's text: title, "8 layers and 49 milestones", the three files and the four open suppliers agree with the head; the change adds no section, target, declaration or supplier, so the description leaves nothing unstated.
- Seeded sample: all fifteen targets lie outside the changed lines; 4.1, 5.4 and 7.4 were re-read as statements the new text cites (rows above). No cross-roadmap citation is added or changed; overlaps: none listed.
- Overlap check: read HypergeometricMotives, KloostermanMomentsAndPotentialAutomorphy, KloostermanSheavesAndBesselIsocrystals, FourierDeligneTransform, HalfIntegralWeightModularForms, QuadraticCharactersAndReduction, ClassicalArithmeticCompletion, SieveMethodsAndPrimePatterns; nothing shared (the change touches no owned object; ownership stands as in the previous review).

Source independence: changed passages only; 16 passages compared with 2 repositories (lean-pool and weil-conjectures, statements and docstrings at the cited commits), none shared beyond formulas, declaration hypotheses and standard names; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- "adapted from … `weil-bounds-toolkit` at commit `7adcd23`": the commit exists and lean-pool's project record names it; the 38 files were not compared with the upstream files.
- The items of the earlier reviews (Ireland–Rosen, Lidl–Niederreiter, Iwaniec–Kowalski, Gross–Koblitz, Weil 1948, `schmidt1976` uncertified) are unchanged.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` `## Provenance` (lines 2287–2383) maps targets to five Apache-2.0 Lean repositories (`AxiomMath/Weil`, `AxiomMath/Stacks`, `formal-arithmetic-geometry/weil-conjectures`, `LeanPool/lean-pool`, `charliedorsey/weil-bounds-toolkit`) and says none is a supplier.
- **Licence.** lean-pool's `LeanPool/projects/kloosterman-weil.yaml` records the `KloostermanWeil` directory as `provenance: AI`, `license: Apache-2.0`; its files carry the upstream author's copyright header.
- **Licence.** `Suggested.lean` line 98, `AddChar.liftTrace`, has the same one-line body as `AddChar.compTrace` of weil-conjectures (`WeilConjectures/Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean`); name and binders differ. `kloostermanSum` differs from lean-pool's `kloostermanUnitSum` in name, arguments and character.
- **Not tested.** Several cited books (Ireland–Rosen, Lidl–Niederreiter, Iwaniec–Kowalski) and `schmidt1976` were not read by any review round; wording and arrangement were not compared with them.
