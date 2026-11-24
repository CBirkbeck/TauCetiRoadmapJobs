# Review of AlgebraicModuliForArithmeticGeometry (pull request #3027 at 644c332)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 78 changed lines since `74a09b7`. The change adds §9.12 (the Ein–Lazarsfeld global division theorem) with its proof route, three Checks, the sentences that cite it and two reference lines, and extends the module docstring of `Suggested.lean`. The statement agrees with Ein–Lazarsfeld 1999, Proposition 1.2 (ii), read at its locator; the route (Koszul chase for `k = 1`, induction on `k`) was recomputed and the three Checks evaluated. There are no findings, no small corrections and no format notes, and nothing is left for a human to decide.

## Previous findings

The previous review (of `e7914b5`) had no finding, small correction or format note, and the folder has not changed since the head it read. Its repaired points still hold at this head: the chase asks for `H^{p−1}` of the degree-`p` term only (lines 10177–10182), the `k ≥ 2` step is the induction on `(A − D, ℓ − 1)` (lines 10183–10187), and the guide sentence names §9.12 as resting on the vanishing theorems and multiplier ideals (line 69).

## Verified sound

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| §9.12 statement against its source (sampled target) | ein_lazarsfeld_nullstellensatz lines 349–360 (setup, p. 9), 473–483 (Prop. 1.2 (ii), p. 12) | Source: `X` projective, `ℓ ≥ min(m+k−1, n+k)`, `A−ℓD` ample or big and nef, map onto `H⁰(O(K_X+A)⊗I_ℓ)`. README: the same | Agree; none |
| §9.12, index ranges | `m ≥ 1` (as `J ≠ 0`), `k ≥ 1`; `n = 0` | `min(m+k−1, n+k) ≥ k`, so `ℓ−k ≥ 0` and `I_{ℓ−k}` is defined; `c = 0` gives `π_*O(K_{Y/X}) = O_X` | No junk index; none |
| Route, degree-`p` term (`k = 1`) | `Λ^p(⊕O(−D′_j))` twisted by `O(K_{Y/X}−ℓF)⊗f^*O(K_X+A)` | `O(−F) = N⊗f^*L^{−1}` gives `K_Y⊗f^*(A−ℓD)⊗N^{ℓ−p}`; source line 434 agrees | True; none |
| Route, the chase | Short exact pieces of the twisted complex; source (***) line 449 with `j = p−1` | Needs `H^{p−1}(C_p) = 0`, `2 ≤ p ≤ m`; free for `p−1 > n`; else `ℓ−p ≥ 0` iff `ℓ ≥ min(m, n+1)` | Same range as source; none |
| Route, degree-1 term | `N^{−1}⊗O(K_{Y/X}−ℓF)` | Equals `f^*L^{−1}⊗O(K_{Y/X}−(ℓ−1)F)`; pushes forward to `I_{ℓ−1}⊗L^{−1}` (source line 362) | Map is the stated one; none |
| Route, `k ≥ 2` | `(A, ℓ)` at `k = 1`, then `(A−D, ℓ−1)` at `k−1` | `ℓ−1 ≥ min(m+k−2, n+k−1)`; `(A−D)−(ℓ−1)D = A−ℓD`; source `I_{(ℓ−1)−(k−1)} = I_{ℓ−k}`, twist `A−kD` | Hypotheses reproduced; none |
| Check 1 | ℙ¹, `x, y`, `ℓ = 2 = min(2, 2)`, `deg A = a` | `a ≥ 3`: forms of degree `a−2 ≥ 1` lie in `(x, y)`. `a = 2`: `H⁰(O(−1))² = 0 → H⁰(O) = ℂ` not onto, `A−2D` trivial | True; bigness needed |
| Check 2 | ℙ¹, `J = O(−P)`, `m = k = ℓ = 1 = min(1, 2)` | `Y = X`, `F = P`, `K_{Y/X} = 0`: `I_1 = J`, `I_0 = O`; `deg(A−D) = j+1 > 0`; `j = 0`: `0 = s·0` | True; none |
| Check 3 | Blow-up of reduced points; els_symbolic_powers lines 295–299 (p. 8, `e = n`) | `K_{Y/X} = (n−1)F`; `f_*O((n−1−ℓ)F) = I_Z^{ℓ+1−n}` for `ℓ ≥ n`, `O_X` at `ℓ = n−1`; `ℓ = n+k−1`: `I_ℓ = I_Z^k`, `I_{ℓ−k} = O_X` | True; locator holds |
| `algebraicAdjointVanishing` as §9.12 uses it | §9.10, line 10117: nef and big rational `A`, SNC fractional support, smooth projective, characteristic 0 | Integral `f^*(A−ℓD)+(ℓ−p)N` has no fractional part; gives `H^q(K_Y⊗·) = 0`, `q > 0`; used with `q = p−1 ≥ 1` | Applies; none |
| Koszul *Needs:* line | `TauCeti/RingTheory/KoszulComplex/Basic.lean:219`, `:346` at the pin | `koszulComplex (φ : Module.Dual R M)`; `φ m • z = 0` on homology; where one `D′_j` is missing `φ` takes a unit value | Exist; claim true |
| `Suggested.lean` docstring | Pins searched for nef, big, multiplier ideal; `AlgebraicCycle`, `WeilDivisor`, `CartierDivisor` | No nef/big/multiplier-ideal declaration; `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`, Tau Ceti `WeilDivisor/Basic.lean:43`, `CartierDivisor/Basic.lean:127` | §9.12 not statable; docstring true |

- **Seeded sample.** §9.12 is the only sampled target in changed text; it is checked above. The other fourteen (§§1.3, 1.5, 2.1a, 3.3, 3.4, 4.1, 4.13, 4.15, 5.1, 7.2, 7.8, 8.2, 9.1, 9.5) lie in text the change neither alters nor cites and were not re-read.
- **Source locators checked against the text:** 3 — ein_lazarsfeld_nullstellensatz Prop. 1.1 (ii) (lines 393–452, pp. 10–11) and Prop. 1.2 (ii) (lines 473–494, p. 12); els_symbolic_powers, proof of Theorem 2.2 (lines 287–300, pp. 7–8).
- **Library declarations opened at the pins** (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`): 5 — the two Koszul declarations and the three divisor/cycle carriers in the table.
- **Cross-roadmap citations.** The change adds none. The README cites AlgebraicModuliForArithmeticGeometryPartII 0 times. In the same pull request, MultiplierIdealsOfPairsAndPointSeparation (lines 584, 606) cites §9.12 for Proposition 1.2 (ii), which is what §9.12 states.
- **Record.** Against the merge base: 0 headings removed, 1 added (§9.12); 9 layers kept under their ids; no Lean declaration added, removed or restated.
- **Automatic checks.** The worker's run passed every check. Dependency check: `depcheck: 130 roadmaps, 1443 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- **Elaboration of `Suggested.lean`.** Five `sorry` warnings (lines 50, 75, 89, 121, 133), nothing else. Only the module docstring changed, so signatures are as on `main`; the one-tactic probe was not rerun, as no declaration changed.
- **Pull request text.** Its sentences about this folder hold: the first part "receives only §9.12", which "needs nothing of Part II"; in `Suggested.lean` "only the module docstring changes". The Koszul declarations come from Tau Ceti, already a supplier. The other open pull request that edits this README (`*Needs:*` lines only) merges with this head's README without conflict.

Overlap check: read FunctionFieldArithmeticPartII, SchemeAndStackFoundations, FunctorOfPoints, ResolutionOfSingularitiesCharacteristicZero, StableReductionPartII; also ComplexComparisonPartII C7.6 and AlgebraicModuliForArithmeticGeometryPartII Layer 6. Algebraic global division: owned here (§9.12) alone; ComplexComparisonPartII C7.6 is Skoda's analytic `L²` division on pseudoconvex domains, a different statement. Principalization: ResolutionOfSingularitiesCharacteristicZero, consumed through §9.4. Multiplier ideals of pairs: Part II, not restated here.

Source independence: changed passages only; 5 passages compared with 2 sources (statement, `k = 1` chase, `k ≥ 2` step and setup against ein_lazarsfeld_nullstellensatz lines 349–360, 404–452, 473–494; Check 3 against els_symbolic_powers lines 287–300), none shared beyond formulas the mathematics forces; the `k ≥ 2` step is an induction where the source uses a Schur complex. Largest share among the changed passages: ein_lazarsfeld_nullstellensatz, 2 of 4 locators. Arrangement not compared: no layer added, removed or reordered.

Research link: §9.12 is Ein and Lazarsfeld's global division theorem (1999, Proposition 1.2), the algebraic form of Skoda's theorem behind their geometric effective Nullstellensatz; Ein–Lazarsfeld–Smith (2001) use the same multiplier ideals for symbolic powers. Rests on the README and the two sources read.

## Not verifiable

- Lazarsfeld 2004, *Positivity in Algebraic Geometry II*, §9.6 (secondary locator of §9.12): a paywalled book, recorded as uncertified; not read.
- The numbering of the published Inventiones version of Ein–Lazarsfeld 1999: the arXiv v3 was read, which the reference line names.

## Source issues

- none

## For the human reviewers

- none
