# GATE-CharacterSumsOverFiniteFields~5: answers to human review

One unanswered comment (mycaule, 2026-11-16T05:18:21Z), making one point (H01). Head before this
round `cbf32cf`; repair commit `e06f143` (README only, 47 insertions, 4 deletions;
`Suggested.lean` unchanged). Not pushed.

## H01 (mycaule) — applied

The overlap is real and the Provenance section did not record it. Before the repair it mapped only
AxiomMath/Weil, AxiomMath/Stacks and weil-conjectures, and said that Kloosterman sums have "no
counterpart in the modules above". `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md` lines
2339–2380 now add `LeanPool/lean-pool` at `f8b9b72` (Apache-2.0; Lean `v4.35.0`, Mathlib `56a0058`;
`LeanPool/KloostermanWeil/` has 38 files, adapted from the Apache-2.0
`charliedorsey/weil-bounds-toolkit` at `7adcd23`). Its results are mapped to the roadmap's targets
as follows, each read at that commit:

- **4.1:** `Stepanov/Algebra.lean`.
- **4.2 at `d = 2`:** `Stepanov/Defect.lean`, which adds two hypotheses: `f(0) ≠ 0` and `deg f ≥ 4`.
- **4.4:** `Stepanov/PowerSumSpectral.lean`, stated with `C ≥ 1`.
- **5.1, 5.4–5.6 at `χ = 1` over `𝔽_p`:** `Weil/PrimeFoundation.lean`, `Carlitz/`,
  `Stepanov/CarlitzRoots.lean`, `Stepanov/PrimeWeil.lean` and `Weil/PrimeKloosterman.lean`. The
  proof goes through the curve `y² = (x^p − x)² − 4t`, not through 4.3 (ii).
- **7.4 at `χ = 1`, and 7.6 for squarefree `N` with one frequency a unit:**
  `Weil/ChineseRemainderAndCompletion.lean` and `Weil/Contracts.lean`. That directory's bounds for
  incomplete sums over intervals fall under *Not owned here*.

The old line 2337 "no counterpart in the modules above" now reads "no counterpart in these three
repositories". The closing paragraph "any of the three repositories … all three" now reads "any of
these repositories … all of them".

The pattern was checked across the pool: every file path in `LeanPool/` at `f8b9b72` (33,238 files)
was searched for character-sum, Gauss, Jacobi, Kloosterman, Stepanov, Weil, Hasse and Salié
vocabulary. Three other projects came up, and none of them formalizes a target here:

- `CCDN/Plane/StepanovBound.lean` proves a one-sided upper bound for the points of an irreducible
  plane curve over `𝔽_p`, conditional on a dimension inequality. It is not 4.2, which is two-sided
  and holds over every extension.
- `MarkoffModP/BGS/FiniteField/EllipticCharacterSum.lean` keeps the Hasse bound as an explicit
  hypothesis and does not prove it.
- `KasamiCyclicAdditive/Phase/CharacterSums.lean` has the orthogonality relations, which Mathlib
  already supplies at the pin.

The repair adds no target, construction or citation of another roadmap. No ownership question
arises, and the merge order is unchanged.

---

## What changed, item by item

| Place | Old | New |
|---|---|---|
| Provenance, bullet "Layers 0–2, 4.5 and 5–7" (line 2336–2337) | "have no counterpart in the modules above" | "have no counterpart in these three repositories" |
| Provenance, new paragraph (lines 2339–2347) | — | LeanPool/lean-pool `f8b9b72`, `LeanPool/KloostermanWeil/` (38 files, from weil-bounds-toolkit `7adcd23`), Apache-2.0, versions; why it is no supplier |
| Provenance, new bullet 4.1, 4.2 and 4.4 (lines 2349–2360) | — | Hasse-derivative criterion, root count, `p`-power vanishing; the `d = 2` Stepanov estimate with its exact hypotheses and constants; the power-sum lemma with `C ≥ 1` |
| Provenance, new bullet 5.1 and 5.4–5.6 (lines 2361–2374) | — | symmetry, scaling, degenerate values; Carlitz's weight `= κ` at `χ = 1, a = 1, b = t`, its coefficient sums, the lifting relation; `|α| = |β| = √p` via `y² = (x^p − x)² − 4t`; `|S(m, n; p)| ≤ 2√p`; what has no counterpart |
| Provenance, new bullet 7.4 and 7.6 (lines 2375–2380) | — | untwisted Chinese-remainder factorization; `|S(m, n; N)| ≤ 2^{ω(N)} √N` for squarefree `N`, `n` a unit; completion estimates out of scope |
| Provenance, closing paragraph (lines 2382–2383) | "any of the three repositories … all three" | "any of these repositories … all of them" |

The LeanPool declaration names are kept out of the README, in line with the three existing bullets,
which name files only. They are listed here for checking:

| Target | File | Declarations |
|---|---|---|
| 4.1 | `Stepanov/Algebra.lean` | `hasseRootMultiplicityCriterion`, `card_mul_le_natDegree_of_uniform_rootMultiplicity`, `hasseDeriv_X_mul_prime_pow_eq_zero` |
| 4.2 | `Stepanov/Defect.lean` | `stepanov_hyperelliptic_defect_high_field`, `IsScalarSquare` in `Stepanov/Auxiliary.lean` |
| 4.4 | `Stepanov/PowerSumSpectral.lean` | `norm_le_radius_of_power_sums_eventually` |
| 5.1 and 5.6 | `Weil/PrimeFoundation.lean` | `kloostermanSumPrime_comm`, `weilKloostermanPrime_scaling`, `kloostermanSumPrime_zero_left`, `kloostermanSumPrime_zero_zero` |
| 5.4 | `Carlitz/DicksonFiniteAlgebra.lean`, `Carlitz/GeneratingIdentity.lean`, `Stepanov/CarlitzRoots.lean` | `etaPoly`, `A_one_eq_K`, `A_two_eq_card`, `A_eq_zero_of_three_le`, `carlitz_generating_identity`, `Kext_eq_neg_root_power_sum_pos` |
| 5.5 | `Stepanov/PrimeWeil.lean`, `Stepanov/CurveTrace.lean`, `Stepanov/PointCountBridge.lean`, `Weil/PrimeKloosterman.lean` | `carlitzAlpha_norm_eq_sqrt_prime`, `card_quadraticArtinCurve_eq_scalarSums`, `errorAggregate_eq_Kext_sum`, `weil1948_bound` |
| 7.4 | `Weil/ChineseRemainderAndCompletion.lean` | `kloostermanUnitSum`, `kloostermanUnitSum_crt` |
| 7.6 | `Weil/Contracts.lean` | `squarefreeUnitNumerator_bound` |

## Adversarial pass on the sentences added

`kloostermanUnitSum N a b` and `kloostermanSumPrime p a b` are both `∑ ψ(b x + a x⁻¹)`, which is
`S(b, a; N)` in the README's notation. Every row below was computed by script in the scratch
directory.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Hasse criterion in divisibility form | `h = 0`; `h = X, x = 0, l = 1, 2` | `h = 0`: both sides true. `X ∣ X` and `D⁰X(0) = 0`. `X² ∤ X` and `D¹X(0) = 1 ≠ 0` | holds without `h ≠ 0`, as stated | — |
| root count `l · #S ≤ deg h` | `h = 0` (excluded); `h = X²(X − 1)²`, `l = 2`, `S = {0, 1}` | `h = 0`: degree `0`, but every `(X − x)^l` divides it, so `l · #S ≤ 0` fails once `S ≠ ∅`; `2 · 2 = 4 ≤ 4` | needs `h ≠ 0` and multiplicity `≥ l` on `S` | stated both |
| `D^k X^{j p^e} = 0` for `0 < k < p^e` in characteristic `p` | `p = 2, e = 1, j = 1, k = 1`; `p = 3, j = 3, k = 1, 2`; `j = 0` | `2X = 0`; `C(9, 1) = 9 ≡ 0`, `C(9, 2) = 36 ≡ 0 (mod 3)`; `D^k 1 = 0` | holds | "in characteristic `p`" added |
| Stepanov estimate, case `d = 2` of 4.2 | `f = X⁴ + 1` at `p = 1009, 10007, 100003, 300007` | the size hypothesis `500(⌊√q⌋ + 1) < q` fails for the first three and holds at `300007`. There `|N − q| = 1 < 219201` | non-vacuous for `q > 2.6·10⁵`; the constants depend on `m` only | — |
| "not a nonzero constant times a square in `F[X]`" equals 4.2's condition over `F̄` at `d = 2` | `f = X⁴ + 1` (non-square); `f = X²` (excluded) | `(X² + aX + b)² = X⁴ + 1` forces `a = b = 0`, a contradiction for odd `p`. A monic square root over `F̄` is Galois-fixed, so it lies in `F[X]` | equivalent | — |
| 4.4 with `C ≥ 1` | `C = 0` hypothesis | `max(C, 1)` satisfies the `C ≥ 1` form | no loss | — |
| Carlitz weight `= κ` at `χ = 1, a = 1, b = t` | `g = X − c`; `g = X² + c₁X + c₀` | `ψ(c + t/c)` on both sides; `ψ(−c₁ − t c₁/c₀)` on both sides | equal | — |
| coefficient sums `K(1; 1, t)`, `p` (for `t ≠ 0`), `0` | `p = 5, t = 0, 1, 2` | degree 2: `0, 5, 5`; degree 3: `5·10⁻¹⁵` (zero) | `t ≠ 0` is needed for degree 2 | "(for `t ≠ 0`)" stated |
| lifting relation `K_{𝔽_{p^n}} = −(α^n + β^n)`, `α + β = −K`, `αβ = p` | `p = 3, t = 1, n = 2`; `p = 5, 7`, `t = 1, 2, 3`, `n = 2` | `K₉ = 5 = −(1 − 6)`; at `p = 7, t = 1`: `K₄₉ = 9.8019 = −(α² + β²)`; all six cases agree | holds; agrees with 5.4's Checks | — |
| `|α| = |β| = √p` for odd `p` | `p = 5, 7`, `t = 1, 2, 3` | `|α| = 2.2361 = √5` and `2.6458 = √7` | holds | — |
| curve `y² = (x^p − x)² − 4t` has `p^n − 1 + ∑_{s ≠ 0} K_{𝔽_{p^n}}(1; 1, s²t)` points | `p = 3, 5, 7`, every `t ≠ 0`, `n = 1, 2` | `p = 3, t = 1`: `0 = 2 + 2(−1)`. `t = 2`: `6 = 2 + 2·2`. Direct count equals the formula in all 18 cases | holds | — |
| `|S(m, n; p)| ≤ 2√p` for `m, n ≠ 0`; `p = 2` trivial | `p = 2` | one unit, `|S| = 1 ≤ 2√2` | holds | — |
| symmetry, scaling `S(m, n; p) = S(1, mn; p)` for `m ≠ 0`, `S(m, 0; p) = −1`, `S(0, 0; p) = p − 1` | `p = 11`, all `m, n` | all true; `{−1}`; `10` | holds; agrees with 5.6 at `χ = 1` (`g(1) = −1`, `(q − 1)[χ = 1]`) | — |
| untwisted CRT with multipliers `c̄₂ mod c₁`, `c̄₁ mod c₂` | `S(1, 1; 15)` | `−2.6180 = S(2, 2; 3) S(2, 2; 5)`; without the multipliers `−0.3820` | holds; agrees with 7.4's Checks | — |
| `|S(m, n; N)| ≤ 2^{ω(N)} √N`, `N` squarefree, `n` a unit | every `m` and every unit `n` for `N ∈ {1, 2, 3, 5, 6, 7, 10, 15, 21, 30, 35, 42, 66, 105}` | largest ratio `1.0`, attained at `N = 1` (`S = 1`, bound `1`) | holds; equals 7.6 there because `τ(N) = 2^{ω(N)}` and `(m, n, N) = 1` | — |
| "carries no multiplicative character; over a finite field, parameters in `𝔽_p`" | grep of all 38 files for `MulChar`, `gaussSum`, `quadraticChar` | only `gaussSum_one_left` (`PrimeFoundation`) and `quadraticChar` in the point count of `y² = f(x)`; `Kext p n t` takes `t ∈ ZMod p` | holds | — |

## Signatures

`Suggested.lean` did not change this round. The two binders that `signatures.md` reports as
dropped, `(h : c₁.Coprime c₂)` on `crtFactorLeft` and `crtFactorRight`, are present in the
elaborated types as the anonymous argument `c₁.Coprime c₂ →`. Both are false positives.

## Build

`lake build TauCetiRoadmap.CharacterSumsOverFiniteFields.Suggested`: `Build completed successfully
(18252 jobs).` There are 35 warnings, all `declaration uses 'sorry'`.

## Gate

`gate CharacterSumsOverFiniteFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0
sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0
round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0
outside-folder=0 source-material=0 OK`

Before the commit, the same gate failed only on `dirty=1`, the uncommitted README.

Depcheck (`--movable --pr 1712`): `depcheck: 249 roadmaps, 2380 edges, 0 problem(s)`. There are no
UPWARD or CYCLE lines.

`roadmaps resolve` on the edited README: no cross-roadmap citations and no Lean names found
nowhere. It did not check Lean names outside TauCetiRoadmap, because this host has no pinned Lake
packages.
