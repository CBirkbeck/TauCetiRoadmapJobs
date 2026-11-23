# Review of ExpanderWalksAndCodes (pull request #3017 at 12749b4)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of `Suggested.lean` and every Check of the README was recomputed (degenerate parameters, the worked examples, the routes marked "Proved here") and none fails; the locators into Hoory–Linial–Wigderson, Vadhan and Spielman agree with the texts. There are no small corrections, one format note and two questions for the author, both about the two sources that could not be read (Healy's report and Chung's 1989 paper). Four points are left for the human reviewers: whether the decoding theorem of 3.2 is within the project's rule on algorithms, the relation of 3.1 to ExpanderCodes, the results without a published locator, and the two unread sources.

## N01 — The ratio form of Tanner's bound in 2.4 needs `S` nonempty

In 2.4 (line 370) the consequence `|N(S)|/|S| ≥ 1/(λ² + (1 − λ²)ρ)` is stated for every `S` with `|S| ≤ ρn` and `λ ≤ 1`; for `S = ∅` the left side is `0/0`. The multiplied-out statement above it and the Lean statement are right for every `S`. "for nonempty `S`" would make the sentence exact.

## Questions for the author

- In 2.3 and in the Summary the constant `36` is attributed to Healy, Theorem 1, p. 3. Does revision 1 of the report state the exponent `ε²(1 − λ)k/36`, or a smaller denominator? The route of 2.3 does prove `36` (recomputed: `r = ε(1 − λ)/18` gives `9kr²/(1 − λ) − rεk = −ε²(1 − λ)k/36`), so the statement stands either way; if the source's constant differs, the locator should say that 2.3 states the constant its route gives. What stopped me: the report's host is one the sources service does not classify, and the journal version is behind a paywall.
- In 2.4 (line 377) the source's condition is written `(k/A)ᵐ > n − 1`. Is `A` Chung's symbol for the largest absolute value of a nontrivial eigenvalue, or a slip for `λ`? `A` is the adjacency matrix elsewhere in the README (2.1). What stopped me: no legal copy of Chung's 1989 paper was found.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 contraction (cited, not a target) | `K₄`, `x ⊥ 𝟙`; `x = 𝟙`; non-involutive map on 2 vertices | `Mx = −x/3`, equality; `‖M𝟙‖² = 4 > 4/9`; `λ(R) = 0`, `Mx = (a, a) ≠ 0` | holds; both controls separate | none |
| 1.2 `card_mul_secondEigenvalue_le_of_isRamanujan` | `K₃` with `q = 0, 1, 5`; `2K₄`; `K₃,₃`; Petersen; Paley 13; `n = 1, 2` | `q=0`: hypothesis fails (`2 ≰ 0`); `q=1`: `1 ≤ 2`; `2K₄`: `3 > 2√2`; Petersen `2 ≤ 2.83`; Paley `2.30 ≤ 4.47`; `n ≤ 2` bipartite, vacuous | holds; route rechecked (exempt case gives `d ≤ 2√q ≤ q+1 < d`) | none |
| 1.2 `secondSingularValue_le_of_isRamanujan` | `card U ≤ 1`; `2K₃,₃`; `K₃,₃`; 3-cube; 6-cube split by parity of five coordinates | `σ₂ = 0`; `3 > 2√2` (disconnected); `0`; `1 ≤ 2.83`; `σ₂ = 5 > 2√5 = 4.47` with 32 edges inside the sides | holds; edge hypotheses and connectivity needed | none |
| 2.1 `walk`, transfer count | `K₄`, `t = 2`; `t = 0`; `d = 0`, `t ≥ 1` | 36 walks, 12 closed (`(A²)_vv = 3`); one walk per vertex; none | agrees with `rotationPower` recursion | none |
| 2.2 `card_walk_mem_le` | Petersen, `C₅`, `C₆`, `K₄`: 400 random `(t ≤ 5, B, K)` each; `K = ∅`; non-involutive map; `λ > 1`; `n = 0` | least slack `0` (at `t = 0`); Petersen check `20 ≤ 125/4`; `C₆`: `12 = 12`, with `1/2`: `9 < 12`; `K = ∅`: `12 > 3`; `2 > 1` | holds; `K ≠ ∅` and involutivity needed | none |
| 2.2 `card_walk_mem_seq_le` | same graphs, random sequences `B 0 … B t`; `t = 0`; `d = 0` | least slack `0`; `t = 0`: `√(μ₀²) n = |B 0|`; right side `0` | holds | none |
| 2.3 `card_walk_sum_sub_ge_le` | Petersen, `t ≤ 4`, 60 random `f`, exact enumeration; `ε = 0`, `ε > 1`, `λ ≥ 1`; `ε = −1`; `C₆`, `k = 288` | least slack `5.0` walks; bound `≥ n dᵗ`; empty events; `4 > 4e^(−1/54)`; `e⁻¹ < 1/2` | holds; route's Lemmas 15, 16 rederived (`2r/(1−√λ) ≤ 4r/(1−λ)`, `1 + rμ + 9r²/(1−λ)`) | none |
| 2.4 `card_le_card_image_mul` | all random `S` of the 2.2 runs; `K₄`, one vertex; `P = ∅`; non-involutive map | no violation; `3(1/9 + 2/9) = 1`; `N = ∅`; `1 > 1/2` | holds | N01 on the ratio form |
| 2.4 `exists_walk_eq_of_mul_pow_lt_one` | Petersen `m = 1…6`; `K₄` `m = 1, 2`; `m = 0`; `P = ∅` | least entry of `Aᵐ`: `0,0,0,4,12,56`; condition first true at `m = 6` (`576 < 729`); `m=1`: `3·(1/3) = 1`, diagonal `0`; `m = 0` forces `n ≤ 1` | holds; strictness and ports needed | none |
| 3.1 `abs_card_edges_sub_le_sqrt` | double cover of `K₄`, `S = T` of size 2; `D = 0` with `card U = 1`, `card V = 5` | `|2 − 3| = 1 = 1·√1`; left `0`, radicand `≤ 0`, right `≥ 0` | holds, equality attained | none |
| 3.1 `mul_le_one_sub_mul_hammingNorm` | `K₄` and `K₅` double covers, even-weight codes; `ε = 2`; `δ₀ = −2`; `V = ∅` | `4 ≤ 4`; `10/3 ≤ 4`; `−3 > −4`; `4 > 1`; `6 > 2` | holds; route rechecked (`(1−a)(1−b) ≤ (1−√(ab))²`) | none |
| 3.2 `alternatingCorrection_eq` | `K₉` cover, repetition code; 18-vertex `B = 2J + E`; `δ₀ = 0`; `D = 0`; radius `≤` on repetition code of length 2 | `C(72, ≤4) = 1 091 059`; rows, columns sum `36`, `EEᵀ(EEᵀ−2)(EEᵀ−128) = 0` exactly, `σ₂ = 8√2 ≤ 12`, weights `36, 36, 18, 0`; `g ≡ 1` gives `1 ≠ 0`; contradiction at `(1,0)` | holds; induction rechecked on both sides with the transpose | none |
| Layer 3 Example, `δ₀ = 1/2` | `D = 142, 143` | `12√141 = 142.49 > 142`; `12√142 = 143.00 ≤ 143` | holds | none |

- Source locators checked against the text: 17 (Hoory–Linial–Wigderson 8: its text lines 836, 1187–1262, 1264, 2023–2070; Vadhan 3: lines 495–505, 624, 643–656; Spielman 6: lines 9455–9542). Not read: Healy (7 locators), Chung (1).
- Library declarations opened at the pin: 14 (Mathlib `Analysis/InnerProductSpace/Rayleigh.lean:121`, `Adjoint.lean:1059`, `SingularValues.lean:101, 125`, `Analysis/Complex/Exponential.lean:519, 629`, `SpecialFunctions/Log/Basic.lean:307`, `InnerProductSpace/Basic.lean:471`, `Data/Matrix/Mul.lean:786`, `Analysis/Matrix/Spectrum.lean:60, 67`, `Combinatorics/SimpleGraph/Bipartite.lean:288`, `Diam.lean:265`; Tau Ceti `Analysis/InnerProductSpace/SingularValues.lean:189, 336, 347`, `InformationTheory/Coding/Basic.lean:31`). No expander, Tanner-code or walk-concentration declaration exists in either library.
- Cross-roadmap citations resolved at the open heads: ExpanderConstructions 1.1–1.3, 2.1, 4.1; ExpanderCodes 1.1–1.4, 2.1, 3.1, 3.2, 4.1; GraphSpectra 2.6, 3.2, 3.7 (the three theorems exist under `TauCetiRoadmap.GraphSpectra.SimpleGraph`); SpectralGraphBounds 1.1, 1.3, 4.1, 5.2; IharaZetaFunction 5.3; MarkovChainMixing 6.4 on main. The seven copied definitions agree with their owners' bodies.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line. All five suppliers are open pull requests that add new roadmaps; they merge first.
- Elaboration: `Suggested.lean` elaborates with ten `sorry` warnings and nothing else. `#check`-level signatures of all 21 declarations compared with the README: the binders reported as dropped belong to definitions whose bodies do not use them (`walk`, `tannerCode`, the three corrections); nothing changed.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `omega`, `positivity`, `exact?`) on a copy of the file: none of the ten theorems closes.
- The worker's automatic checks all passed on this head; no change outside the roadmap folder.
- Overlap check: read ExpanderCodes, ExpanderConstructions, GraphSpectra, SpectralGraphBounds, IharaZetaFunction; the bipartite mixing lemma without the factors, the distance bound `δ₀(δ₀ − ε)` and the edge-set lemma are owned by ExpanderCodes, the forms with `(1 − s/n)(1 − t/n)` and `1/(1 − ε)` and the decoding theorem (which ExpanderCodes' scope excludes) by this roadmap; the seven copied definitions by their suppliers; nothing else shared.

Source independence: 9 passages compared with 3 sources (Hoory–Linial–Wigderson, Vadhan, Spielman), none shared; largest share Hoory–Linial–Wigderson and Healy, 7 each of 22 locators; contents compared with Hoory–Linial–Wigderson: independent (Layer 1 has no counterpart, Layer 2 draws on its §§2.4, 3.2 and 4 together with three other sources, Layer 3 on none of it); Healy's text and Chung's could not be read.

Research link: Layer 2 states the hitting property (Ajtai–Komlós–Szemerédi, Kahale, as in Vadhan Theorem 4.17) and Healy's 2006 Chernoff bound for expander walks; Layer 3 the Zémor–Spielman analysis of Tanner codes (Spielman, Chapter 29); Layer 1 feeds Ramanujan graphs into both. Rests on the README and on the texts of Vadhan and Spielman.

## Not verifiable

- Healy, ECCC TR06-058 revision 1 (Theorem 1, (1)–(3), Lemmas 15 and 16, Remark 17): the report's host is not classified by the sources service and the journal version resolves only to a paywalled page; the statement of 2.3 was verified through its route instead.
- Chung, *Diameters and eigenvalues* (Theorem 1, pp. 188–189): the publisher's archive is not classified by the sources service and no copy was found on the author's page; the statement of 2.4 was verified through its route instead.

## Source issues

- **Error** in Spielman, *Spectral and Algebraic Graph Theory* (draft of April 2, 2025) at §29.5, p. 240: the source says the local decoder returns a codeword from every word within distance `δ₀d/2` inclusive; it should be distance strictly less than `δ₀d/2`, since at equality two codewords can be equally near; affects a stated result.
- **Gap** in Spielman, *Spectral and Algebraic Graph Theory* (draft of April 2, 2025) at Theorem 29.5.3, p. 241: the source says the lemma for a right step after a left step gives convergence of all later steps; it should also invoke the lemma with the two sides exchanged for a left step after a right step; affects the proof.
- **Misprint** in Spielman, *Spectral and Algebraic Graph Theory* (draft of April 2, 2025) at the proof of Theorem 29.5.3, p. 241: the source says each vertex of `S` meets at least `δd/2` edges in error; it should be `δ₀d/2`; affects nothing.

## For the human reviewers

- **Scope.** 3.2 and `alternatingCorrection_eq` state that the iterates of two correction maps reach the codeword; ExpanderCodes' scope excludes "decoding procedures". Whether this is the mathematics of an algorithm or an algorithm is yours to decide (README lines 501–513).
- **Scope.** 3.1 strengthens ExpanderCodes 1.2 and 3.1 (same hypotheses, plus `ε ≤ 1` for the distance bound) and implies both; whether the supplier should carry the stronger forms instead is a design choice between the two roadmaps.
- **Scope.** Both statements of 1.2 and both of 3.1 carry "Proved here" and no published locator; the description says no legal copy of Sipser–Spielman 1996 or Zémor 2001 was found. I rechecked the four routes.
- **Not tested.** Healy's report has, with Hoory–Linial–Wigderson, the largest share of the locators (7 of 22) and could not be read: the wording and the locators of 2.3 were not compared with it. Chung's 1989 paper was not read either.
- **Licence.** The copy of Healy's report on the ECCC server could not be classified by the sources service.
