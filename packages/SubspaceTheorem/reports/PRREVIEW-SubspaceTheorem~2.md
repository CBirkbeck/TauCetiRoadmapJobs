# Review of SubspaceTheorem (pull request #2678 at c0ff588)

**Verdict:** accepted

**Summary.** Accepted. This head repairs all three findings and all six small corrections of the previous review, and the repairs introduce no new problem. In particular, Thue–Mahler over `ℤ` is now cited from DiophantineApproximationAndTranscendence §2.3 rather than restated, and the 7.2 and 8.7 statements now hold at every case they name. There are no new findings, small corrections or format notes. One question from the previous round, the Jensen constant in 2.2, is still open. The human reviewers still have to decide the licence question about the cited formalization, and Bombieri–Gubler, the source cited most, could not be read.

## Previous findings

- R01 — repaired: the 7.2 Check now reads "`|U| ≤ 4 |V|` for `j ≥ 4` (at `j = 3`, `|U| = 9 > 8 = 4 |V|`)" (line 1826).
- R02 — repaired: 8.7 now reads "for `p` in a nonempty finite set `P` and `i` in a nonempty `ι`" (line 2103). Its Check adds the case `b = 1` and the empty case (line 2114).
- R03 — repaired: the declaration is gone from `Suggested.lean`. 8.4 now reads "at `K = ℚ`, with `S` the primes `p_1, …, p_s`, this gives DiophantineApproximationAndTranscendence §2.3's Thue–Mahler theorem over `ℤ` … for `G` square-free or not" (line 1986). This agrees with the scope-table row at line 2516.
- C01 — repaired: Convention 2 now requires `[Nontrivial ι]` only of "6.2–6.5 and 9.1" and names 3.4, 6.7 and 6.1 as exceptions (lines 72–79). The Lean signatures agree.
- C02 — repaired: 6.2 now reads "As a statement it is 6.3's `exists_finset_submodule_of_approxProd_le_extension` at `F = K` and `w v = v`, the name under which a consumer cites it" (line 1531).
- C03 — repaired: the 7.3 Check now reads "complexity at most `2n` for every `n ≥ 1` … The values for `n = 1, …, 5` are `2, 4, 6, 7, 9`" (line 1863), with a proof.
- C04 — repaired: the 1.3 Check now reads "while `w_1(√2) = 1`: a definition of `A` as "every `w_n = 0`" would leave `√2` out" (line 515).
- C05 — repaired: 2.1 now assumes "`λ > 0` with `x ↦ exp (−λ x) g x` integrable" (line 555).
- C06 — repaired: the overview now reads "The route is Schmidt's method: Roth's lemma in several blocks of variables against the geometry of numbers of a family of parallelepipeds" (line 36). The Bombieri–Gubler entry in the References now reads "Cited for:" (line 2751).

## Questions for the author

- From the previous round, still open: in the 2.2 Check (lines 594–597), which disc and which normalization give the Jensen bound `P.logHeight ≥ (32 log 2 / (e π)) D − 256 log (D + 1)` over `ℚ(2^(1/256))`? The conclusion is plausible, but I could not reproduce the constant.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Convention 2, scope of `[Nontrivial ι]` | one-element `ι` in 6.2 and 6.4; Lean signatures | 6.2: `approxProd = 1 ≤ 1`. 6.4: every `S`-unit gives `affineProd = 1 ≤ 1`. Lean: 6.3–6.5 and 9.1 carry it; 3.4 and 6.6 need `card ι = 2`; 6.7 needs `2 ≤ finrank` | sound |
| 1.3 Check, `A`-numbers | `√2`; rationals; variant "every `w_n = 0`" | `w_1(√2) = 2 − 1 = 1` (`mahlerExponent_one_add_one`); `|a² − 2b²| ≥ 1` gives `w_n ≤ 1`, so `w = 0`; the variant excludes `√2` | sound |
| 2.1 exponential-moment estimate | `g = 1/(1+x²)`; `g = 1_[0,1]`, `m = 1`, `s = 1/2`, `λ = 1`; `m = 0` | First now excluded by the hypothesis. Second: `1/2 ≤ e^(1/2)(1 − e^(−1)) = 1.042`. At `m = 0`: `1 ≤ e^(λs)` for `s ≥ 0`, `0 ≤ e^(λs)` otherwise | sound |
| 6.2 as 6.3 at `F = K`, `w v = v` | Lean specialization `F := K`, `w := id` | elaborates; `LiesOver` holds because `v.under K = v` | sound |
| 7.2 Check, stammering with `w = 3` | `j = 3, 4, 5`; zeros after position `2^j` | `9 > 8`, `17 ≤ 20`, `33 ≤ 40`; the `3⌊(2^j−1)/3⌋` zeros are present for `j ≤ 9` | sound |
| 7.3 Check, complexity `≤ 2n` | `1 ≤ n ≤ 400` | `p = 2, 4, 6, 7, 9` for `n ≤ 5`; `p(n) ≤ 2n` throughout, with equality at `n = 1, 2, 3`; count `1 + n + (n − 1)` | sound |
| 8.4, Thue–Mahler over `ℤ` | DiophantineApproximationAndTranscendence `finite_thueMahler` (square-free, degree `≥ 3`); `x²y(x − y)` | square-free of degree `≥ 3` gives three non-proportional factors; for `x²y(x−y)`, `(−1, 1)` gives `|G| = 2` | sound |
| 8.7 subclasses | `P = ∅`; `b = 1`; 2000 random cases with `#P, card ι ≤ 3`, `N ≤ 20` | `P = ∅` now excluded; at `b = 1`, `k = N` gives `1 ≤ 1`; floor rounding met both bounds in every case | sound |
| Layer 2 opening sentence | Dependencies of Layers 3 and 5 | Layer 3 uses 2.1 and 2.2; Layer 5 uses only 2.1 | sound |
| Overview route sentence | content of Layers 4 and 5 | generalized Roth lemma in blocks (5.3); parallelepipeds and their rank (4.1–4.3) | sound |
| Module docstring of `Suggested.lean` | removed 8.4 declaration | lists "Thue and hyperelliptic"; 38 `sorry` warnings | sound |

The rows for untouched statements stand as in the previous review, of `3d741a9`.

- Source locators checked against the text: 2, both in Evertse1984. Theorem 4 (line 201) states the `S`-adic form over `K` and credits it to Schlickewei's 1977 paper in Arch. Math. (reference [16], line 472), which supports the attribution in 6.2. §2 (lines 190–261) was compared with 8.7's wording.
- Library declarations opened at the pins: Mathlib `AbsoluteValue.LiesOver` (`Mathlib/Analysis/Normed/Ring/WithAbs.lean`:301); Tau Ceti `TauCeti.mahlerExponent_one_add_one` (`TauCeti/NumberTheory/DiophantineApproximation/LinearFormExponent.lean`:579) and `TauCeti.linearFormExponent_ratCast` (:375).
- Cross-roadmap citations resolved:
  - DiophantineApproximationAndTranscendence on main: §2.3 states `finite_thueMahler` (README line 951, `Suggested.lean` line 394).
  - HeightsRationalPointsAndObstructions at its open head (README lines 119 and 2114) still uses the old proposed name for §6.2. 6.2 now maps that name to 6.3's declaration.
- Automatic checks: every check passed. The dependency check reports `depcheck: 191 roadmaps, 2119 edges, 0 problem(s)`.
- Elaboration: `lake env lean` gives 38 `sorry` warnings and nothing else. `#check @name` of 6.1, 6.3, 6.4, 6.5, 8.4 and 9.1 matches the README. The 6.2 specialization of 6.3 elaborates.
- The pull request's text against the head:
  - The README has 45 Check blocks with 95 bullets, as the description says.
  - The description's items on the conventions, 2.1, 8.4, 8.7 and the complexity bound (attained at `n = 1, 2, 3`) match the head.
  - The 31 removed and 21 added declarations are accounted for.
  - There are no changes outside the folder.
- Overlap check: read DiophantineApproximationAndTranscendence, SuccessiveMinima and HeightsAndUnits on main, and HeightsRationalPointsAndObstructions and ArithmeticDynamics at their open heads.
  - Thue–Mahler over `ℤ` belongs to DiophantineApproximationAndTranscendence §2.3. 8.4 cites it and does not restate it.
  - HeightsRationalPointsAndObstructions consumes §6.2, which this roadmap owns.
  - ArithmeticDynamics takes unit equations from DiophantineApproximationAndTranscendence §2.4 and shares nothing with this roadmap.
- Source independence: changed passages only. I compared 10 passages: the overview's route sentence, Convention 2, the Checks of 1.3, 7.2, 7.3 and 8.7, the 2.1 estimate, the 6.2 and 8.4 sentences, and the References entry.
  - One passage was compared with a source text: the 8.7 subclass bullet against Evertse1984 §2. No wording is shared.
  - Bombieri–Gubler, cited at 2.1, 6.2 and 8.4, could not be read.
  - The largest share is as in the previous review: Bombieri–Gubler, about 51 of 180 mentions.
  - The arrangement was not compared again, because no layer was added, removed or reordered.
- Research link: Layer 6 is Schmidt's Subspace Theorem in Schlickewei's `S`-adic form (1972, 1977). Layer 9 is the elementary half of Evertse's quantitative theory (2010). 7.3 is Adamczewski–Bugeaud's complexity theorem (2007) and 8.6 the Corvaja–Zannier gcd bounds (2003–2005), both applications of the theorem. This rests on the README's references, Evertse2010 §2 and AdamczewskiBugeaud2007 Theorem 1.

## Not verifiable

- Bombieri–Gubler, *Heights in Diophantine Geometry* (2006), the locators of 2.1 (6.3.3 and Lemmas 6.3.4–6.3.5), 6.2 (Theorem 7.2.2) and 8.4 (5.3.1–5.3.2): there is no open copy and none is held locally. This is as found in the previous round; I did not fetch it again.
- Schmidt 1972 (Ann. of Math.) and Schlickewei 1977 (Arch. Math.), cited for 6.2: both are behind publisher paywalls. I read Schlickewei's statement only through Evertse1984 Theorem 4, and the extracted text lost its displayed inequality.
- The Jensen constant of the 2.2 Check: I could not recompute it.

## Source issues

- none

## For the human reviewers

- **Licence.** The README's Provenance section (line 2374) maps the milestones to `rwst/Subspace-Theorems` at `09835cb` (Apache 2.0, "by the author of this roadmap"). `Suggested.lean` was not compared with that repository.
- **Not tested.** Bombieri–Gubler, the source with the largest share of locators, could not be read legally. The wording comparison did not cover it, and the contents were compared only through the section numbers the README cites.
