# Review of SubspaceTheorem (pull request #2678 at 52838c7)

**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 23 lines changed since `c0ff588`, and the one finding of the previous review (the factor that the primes of `p` and `q` contribute in the remark of 3.5) is repaired, as are its three small corrections and its format note; no repair introduced a new problem. There are no findings, no small corrections and no format notes. One question to the author is carried over, and the human reviewers still have the licence question about the cited formalization and the fact that Bombieri–Gubler, the source cited most, could not be read.

## Questions for the author

- Carried over, on untouched text: in the example of 9.5 (lines 2336–2341), "`[K : ℚ]` in place of `[E : ℚ]` would give `κ = 100 < α`" needs `c(ℚ, ∅) = 2`, since `Z = 2 · 5² = 50`. Is that the value of 8.7's Minkowski constant over `ℚ`? 8.7 does not fix `c(K, S)`, so I could not check it; the conclusion holds for every `c(ℚ, ∅) ≤ 2`.

## Previous findings

- R01 — repaired: 3.5 (lines 842–844) now gives the factor `q^(−k) · ∏_{ℓ ∣ q} |N|_ℓ · gcd(N, p^k) / p^k`, "at most `q^(−k) · gcd(N, p^k) / p^k` and equal to it when `N` is prime to `q`"; the description has the same formula and the value `1/72`.
- C01 — repaired: 6.2 (lines 1534–1535) says "a citation of 6.2 as NumberField.exists_finset_submodule_of_approxProd_le means this specialization", which is the name HeightsRationalPointsAndObstructions cites at its open head (its README, lines 119 and 2114).
- C02 — repaired: the normalization in 9.1 (line 2174) reads `0 < ∏ p, C p ≤ (∏ p, |det L p|_p)^(1/N)`, as Evertse's (2.4) does (Evertse2010 lines 194–200); 9.2's sentence now rests on a stated hypothesis.
- C03 — repaired: the References list Schlickewei, "`S`-unit equations over number fields", *Invent. Math.* **102** (1990), 95–107, and Evertse's lecture notes, 2019 edition, Chapter 7, with the author's page.
- N01 — repaired: 8.8 (line 2125) has `totalDegree f_i ≤ δ`, and its *Needs:* line names Mathlib's `MvPolynomial.totalDegree`.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 3.5, remark on the finite places (sampled) | `(p, q, k) = (3, 2, 2)`; `(3, 2, 3)`; `(3, 2, 1)` with `N = 2`; `(5, 2, 1)` with `N = 2` | `β = 8/9`: `1/8 · 1/9 = 1/72`, formula `1/4 · 1/2 · 1/9`; `β = 8/9` with `gcd = 3`: `1/72 = 1/8 · 1 · 3/27`; `β = 4/3`: `1/12`; `β = 4/5`: `1/20`; all ≤ bound | sound |
| 3.5, general identity | numerator `N q^k / g`, denominator `p^k / g`, `g = gcd(N, p^k)` prime to `q` | primes of `q`: `q^(−k) ∏ |N|_ℓ`; primes of `p`: `g / p^k`; `N ≥ 1` since `(p/q)^k ≥ 1` | sound |
| 6.2, the earlier name as the specialization of 6.3 | `F = K`, `w v = v` | `v` lies over itself; the product and exponent `−card ι − ε` are 6.2's; Lean declaration at `Suggested.lean` line 346 | sound |
| 8.8 with `totalDegree` | `f = X₁X₂`, `δ = 2`; `N = 1`, `r = 1`, `f = X₁`, `G = 0`, `δ = 1` | homogenization in degree `2` is `f` itself; ideal `(X₀, X₁)` contains `X₁`, conclusion `c ‖P‖ ≤ |P|` with `c = 1` | sound |
| 9.1 normalization with `0 <` (9.2 sampled) | two equal forms `X, X` at one place with `C = 0`; `∏ C = 2`, `|det| = 4`, `N = 2` | without `0 <`: `0 ≤ 0^(1/2) = 0` holds with `det = 0`; with it: fails. `2 ≤ 4^(1/2) = 2` holds, `det ≠ 0` | sound |
| 9.1 Theorem A against the Lean statement | the Lean signature (`Suggested.lean` lines 627–645) | no normalization hypothesis appears in it, so the added `0 <` leaves README and Lean in agreement | sound |

The rows for the statements the change does not touch stand as in the previous review, of `c0ff588`.

- Source locators checked against the text: 3, in 2 sources. Evertse2010 (2.4) (lines 185–205, with `0 <` at line 194); E19-ch7 Theorem 7.7 (lines 228–230) and Theorem 7.8 (lines 264–266), which state what 7.1's opening and the supplier contract attribute to them.
- Library declarations opened at the pin: Mathlib `MvPolynomial.totalDegree` (`Algebra/MvPolynomial/Degrees.lean`:433).
- Cross-roadmap citations resolved: HeightsRationalPointsAndObstructions at its open head cites §6.2 under the name 6.2 now mentions (2 places); DiophantineApproximationAndTranscendence on main lists the same lecture notes, 2019 edition, among its references (line 3947).
- Automatic checks: every check passed on this head. The dependency check prints `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`: no UPWARD or CYCLE line. Nothing outside the folder is changed, and the change since `c0ff588` touches the README only.
- Elaboration: `lake env lean` on `Suggested.lean` gives 38 `sorry` warnings and nothing else; the file is unchanged since the previous review, whose signature comparison and one-tactic probe stand.
- The pull request's text against the head: the items on 3.5, 6.2, 9.1 and the References agree with the head; no sentence is contradicted. The change of 8.8 to `totalDegree` is notation and needs no mention.
- Overlap check: as in the previous review, read DiophantineApproximationAndTranscendence and SuccessiveMinima on main and HeightsAndUnits among the completed roadmaps, with HeightsRationalPointsAndObstructions, EffectiveDiophantineMethods and ArithmeticDynamics searched at their open heads; the change adds no object, the instances over `ℚ` belong to DiophantineApproximationAndTranscendence, and the Subspace Theorem over a number field (§6.2–6.3) belongs to this roadmap, with HeightsRationalPointsAndObstructions §4.7a consuming it.
- Source independence: changed passages only: 2 passages compared with 2 sources (9.1's normalization with Evertse2010; the citation of Theorems 7.7 and 7.8 with E19-ch7), none shared beyond a formula that can be written one way; largest share Bombieri–Gubler, about 50 of 174 source mentions, whose text could not be read; the change adds, removes or reorders no layer, so the arrangement stands as compared before (independent at chapter level).
- Research link: Layer 6 is the Schmidt–Schlickewei Subspace Theorem (1972, 1977) in the form of Evertse–Schlickewei (2002); Layer 9 is the elementary half of Evertse (2010); 7.3 is Adamczewski–Bugeaud (2007, Theorem 1); 8.6 is Corvaja–Zannier and Bugeaud–Corvaja–Zannier (2003). Rests on the README's references and on Evertse2010 §2 and AdamczewskiBugeaud2007 line 101.

## Not verifiable

- Mahler 1957 and Bombieri–Gubler 6.2.7, the locators of the sampled 3.5: the publisher's pages are closed and no copy is held locally; the remark was checked by computation, not against the sources.
- Schlickewei 1990, §3 and (3.12), cited at 8.7: behind a paywall, cited by its locator alone; only the bibliographic entry was checked.
- The remaining items of the previous review's list (Bombieri–Gubler throughout, Ridout 1958, Davenport–Roth 1955, Vojta 1987, Corvaja–Zannier 2003, Evertse–Schlickewei 2002, the lost displays of Schlickewei1992 and Evertse1996, the value `κ = 100` of 9.5) stand unchanged.

## Source issues

- **Misprint** in Evertse2010 at Proposition 4.1, p. 12: the source says the window is a condition on the norm of `x`; it should be a condition on the height `H(x)`, as its proof uses; affects nothing.
- **Misprint** in Evertse2010 at the definition of large solutions before Theorem 2.1, p. 7 (arXiv v1): the source says the threshold is the maximum of `H` and `n^(2n/δ)`; it should be the maximum of `2H` and `n^(2n/δ)`, as Theorem 3.1 and the proof of Theorem 2.2 use; affects a stated result.
- **Error** in Evertse2010 at Lemmas 4.4 and 4.5, p. 15: the source says a set whose determinants are bounded by `D` lies in at most `100^n D^(1/(n−1))` subspaces for every positive `D`; it should be `100^n max(1, D)^(1/(n−1))`, since one nonzero point needs one subspace however small `D` is; affects a stated result.

## For the human reviewers

- **Licence.** The README's Provenance section maps the milestones to `rwst/Subspace-Theorems` at `09835cb`, Apache 2.0, "by the author of this roadmap". `Suggested.lean` was not compared with that repository.
- **Not tested.** Bombieri–Gubler, the source with the largest share of the locators (about 50 of 174 mentions), could not be read legally; the wording comparison did not cover it and its contents were compared by chapter only.
