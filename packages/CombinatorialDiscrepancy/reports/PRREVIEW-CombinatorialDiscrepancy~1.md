# Review of CombinatorialDiscrepancy (pull request #2999 at 348ff42)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed at its degenerate cases, every proof route was re-derived, the README's exhaustive Checks were reproduced by an independent script, and the cited theorems of Bansal–Nikolov, Fox–Xu–Zhou and Li–Nikolov were read at their locators. There are no small corrections and three format notes, none blocking. Two things are left to humans: Nikolov's Prague lecture notes could not be fetched, and three results carry constants and routes that are the roadmap's own.

## N01 — Lecture 4, Theorem 7 has two different page locators

In 3.4 (line 296) the Prague lecture 4 locator reads "pp. 3–4"; in the References (line 467) it reads "(p. 3)". Use one.

## N02 — The Lean heading of Layer 2 differs from the README's

`Suggested.lean` line 40 has "Layer 2: set systems of bounded degree"; the README has "Layer 2: families of sets of bounded degree".

## N03 — Three definitions accept index types that are not finite

The Conventions take `ι` and `V` finite, but `setSystemDisc` and `herdisc` are declared with no finiteness assumption, and `matrixDisc` and `lindisc` with none on the rows; on infinite types the `⨆` and `⨅` return junk values. Every theorem carries both `Fintype` binders, so no statement is affected. A sentence in the docstrings saying the definitions are meant for finite types would be enough.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `matrixDisc` | one row of `n` ones; `[[1,1],[1,−1]]`; `[1]`; no rows; no columns; colour `0` allowed | `0`/`1` by parity; `2` (one of `x₁±x₂` is `±2`); `1`; `0`; `0`; wrong variant gives `0` for `[1]` | agrees with Checks | none |
| 1.2 `matrixDisc_le_sqrt` | `m=0`; `V` empty; `[1]`, `s=1`; `[1]`, `s=0`; all sign vectors `2ⁿ×n`; `s<0` | `0≤√(2s·log 0)=0`; `0≤…`; `1≤√(2 log 2)=1.177`; `1>0` (hypothesis fails); `n≤√(2n(n+1)log 2)`; `s<0` forces `m=0` | true; strict step `τ'>τ` gives sum `<1` | none |
| 1.2 against BansalNikolov §1.1 | BansalNikolov line 186–190 (printed p. 2) | source: random colouring, Hoeffding and union bound, `≲√(|U| log 2|S|)` | README's description exact | none |
| 2.1 `setSystemDisc` | `{{0,1}}`; `{{0}}`; empty family; `{∅}`; sup instead of inf | `0`; `1`; `0`; `0`; wrong variant `2` | agrees | none |
| 2.2 Beck–Fiala | `t=0` with `{∅}`; disjoint odd set, `t=1`; `({0},{0})`; all 9427 tuples (≤4 sets on ≤3 points, ≤3 sets on 4 points) | `0>−1`; `1=2·1−1`; degree `2`, disc `1`; max disc by degree `1,2,3,4` = `1,2,2,1`, bound never violated | true with `t≥1`; count `4681+4369+341+31+5=9427` | none |
| 2.2 against BansalNikolov Thm 2.2, Lemma 2.3 | BansalNikolov lines 872–961 (printed pp. 20–22) | source bound `2 deg(S) − 1`, no exclusion of degree `0` | locator and the README's remark both correct | none |
| 3.1 `herdisc`, `lindisc` | `{{0,1}}`; `[a]`; identity `k≥1`; no rows; no columns | `disc 0, herdisc 1, lindisc 1` (at `w=(1,0)`); all `|a|`; `1, 1`; `0`; `0` | agrees; `lindisc ≤ 2 max_i ∑|A i j|` | none |
| 3.2 `lindisc ≤ 2 herdisc` | `[a]`; `{{0,1}}`; `[[1,1],[1,−1]]`; induction step `u−w=(x'−z)/2` | `|a|≤2|a|`; `1≤2`; `2≤lindisc≤4`; error `h+h` | true; `±1` form is twice the `0/1` form of BansalNikolov Thm 1.4 (line 327, pp. 5–6) | none |
| 3.3 `|det B|^(1/k) ≤ lindisc B` | identity; `[a]`; `[[1,1],[1,−1]]`; `0×0`; `det=0` | `1≤1`; `|a|≤|a|`; `√2≤2`; `1>0` (so `Nonempty` needed); `0≤D` | true; `(2D)^k/|det| ≥ 2^k` | none |
| 3.4 determinant bound | `k=0`, zero matrix; `[a]`; identity; `[[1,1],[1,−1]]`; `f` not injective | `1/2>0` (so `0<k` needed); `|a|/2≤|a|`; `1/2≤1`; `√2/2≤2`; `0^(1/k)=0≤herdisc` | true; matches BansalNikolov Lemma 7.10 (line 4450), proof with `1/4`, Exercise 7.12 (line 4501) | none |
| 4.1 `arithProg` | `n=0`; `n=3`; `n≤12` all triples; `(0,2,2)` in `Fin 3`, `(1,3,5)` in `Fin 5`, `(1,0,0)` by `decide` | index type empty; 8 sets; nonempty sets = all progressions; `{0,2}`, `{1,4}`, `∅`; arithmetic is in `ℕ` (`↑v = ↑a + k * ↑d`) | agrees | none |
| 4.2 Roth | `n=0`; `1≤n<24`; `n=24` (`L=3`, `D=11<n`); exhaustive `n≤14`; inequality `24≤n≤200000` | `0≤0`; `n^(1/4)/8<1≤disc`; `√24·0.2071=1.015≥1`; disc `0,1,1,2,2,2,2,2,2,3,3,3,3,3,3`; no failure | true; pair count `(4L−1)(n+2L(L−1)) ≤ 8Ln` gives `S²≥L/32≥√n/64` | none |
| 4.2 against FoxXuZhou, LiNikolov | FoxXuZhou line 28 (p. 1); LiNikolov line 53–56 (p. 2) | both: Roth, Fourier argument, `disc ≥ c n^(1/4)` with unspecified constant | README's description exact | none |

- Source locators checked against the text: 9 (BansalNikolov §1.1, Thm 1.4, Thm 2.2, Lemma 2.3, Lemma 7.10 twice, Exercise 7.12; FoxXuZhou p. 1; LiNikolov p. 2); 3 not readable (Prague lectures).
- Library declarations opened at the pin: 23, among them `ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun` (`Mathlib/Probability/Moments/SubGaussian.lean:772`), `hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero` (`:833`), `iIndepFun_pi` (`Mathlib/Probability/Independence/Basic.lean:895`), `ZSpan.volume_fundamentalDomain` (`Mathlib/Algebra/Module/ZLattice/Basic.lean:387`), `IsAddFundamentalDomain.measure_eq_tsum` (`Mathlib/MeasureTheory/Group/FundamentalDomain.lean:274`), `addHaar_preimage_linearMap` (`Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:261`), `Real.exists_int_int_abs_mul_sub_le` (`Mathlib/NumberTheory/DiophantineApproximation/Basic.lean:94`), `Polynomial.sum_sq_norm_coeff_eq_circleAverage` (`Mathlib/Analysis/Polynomial/Fourier.lean:90`), `Real.one_sub_mul_le_cos` (`Mathlib/Analysis/SpecialFunctions/Trigonometric/Bounds.lean:131`); each says what the supplier contracts say.
- Cross-roadmap citations resolved on main: 4 (ProbabilisticAndMetricNumberTheory §2.7, DiophantineApproximationAndTranscendencePartII §3.1, FiniteSamplingDiscrepancy, Equidistribution); all are boundary remarks, none a supplier.
- Duplication: no declaration of the pinned Mathlib or Tau Ceti states a discrepancy of a set system or matrix; Tau Ceti's `cutDiscrepancy` (`TauCeti/Combinatorics/Regularity/Graph/CutDiscrepancy.lean:200`) is the cut norm deviation of a graph, another object. No roadmap on main or open names Beck–Fiala, hereditary or linear discrepancy.
- Overlap check: read LovaszLocalLemma, PACBayesBounds, RamseyNumbers; nothing shared (LovaszLocalLemma owns two-colourings with no monochromatic edge, PACBayesBounds uses Hoeffding's lemma from Mathlib, RamseyNumbers cites Mathlib's van der Waerden).
- Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`. The roadmap has no supplier roadmap. No change outside the roadmap folder.
- Elaboration: `sorry` the only warning (6). `#check` of all 11 declarations compared with the README: generality equal on every theorem. One-tactic probe (`simp`, `rfl`, `positivity`, `infer_instance`, `simp` unfolding the definitions, the nonnegativity lemma) closes none of the 6 theorems: no padding. All five headlines of the README, and the volume bound, are stated.
- Pull request text read against the head: title and description agree with it (new roadmap, 6 theorems, 5 definitions, no supplier roadmap).

Source independence: 9 passages compared with 3 sources, none shared (longest run in common about four words, in the Beck–Fiala route); largest share BansalNikolov, 7 of 12 locators; contents compared with BansalNikolov: independent (Layer 1 ↔ §1.1 in part, Layer 2 ↔ §2.1, Layer 3 ↔ §1.2 with §7.2.3, Layer 4 ↔ nothing; no run in order); Nikolov's Prague notes could not be read.

Research link: Beck–Fiala (1981), Lovász–Spencer–Vesztergombi (1986) and Roth (1964) are the base of the theory in Bansal–Nikolov (2026); Fox–Xu–Zhou (2021) and Li–Nikolov (2025) extend Roth's bound; the Beck–Fiala and Komlós conjectures start from 2.2. Rests on the README's references and the three texts read.

## Not verifiable

- Nikolov, Prague Summer School 2018 lecture notes (Lecture 1 Lemma 1; Lecture 3 Theorem 2; Lecture 4 Theorem 7): the README gives the author's directory but no file names; the directory refused listing and guessed file names were not found. Each of the three statements is also located in BansalNikolov, which was read.
- Beck–Fiala (1981), Lovász–Spencer–Vesztergombi (1986), Roth (1964): the README attributes them without locators and says they were not consulted; not fetched.
- The dyadic-grid computation in the Checks of 3.2 was not rerun (the route of 3.2 was re-derived instead).

## Source issues

- **Error** in BansalNikolov at Theorem 2.2, printed p. 20: the source says every set system has a colouring of discrepancy at most twice the maximum degree minus one; it should be assumed that the maximum degree is at least one, since for degree zero the bound is negative; affects a stated result.
- **Gap** in BansalNikolov at Lemma 2.3, printed p. 20: the source says the incidence count strictly exceeds `k·s` and concludes a strict bound; it should treat `k = 0` apart, where strictness needs a nonempty universe and positive degree; affects the proof.
- **Gap** in BansalNikolov at the proof of Theorem 2.2, printed p. 22: the source says the change of a set's sum is strictly below twice its number of unfixed points; it should be non-strict when no point of the set is unfixed; affects the proof.

## For the human reviewers

- **Scope.** Three targets have no source stating them as written: the constant in 1.2, the route of 3.3 and Roth's bound with `1/8` in 4.2 (README lines 85–87, 257–261, 348–350, "Proved here"). I re-derived each route.
- **Licence / not tested.** Nikolov's Prague 2018 lecture notes (README line 465) could not be fetched from the author's page, so wording was not compared with them; three locators rest on them besides BansalNikolov.
- **Scope.** The primary papers (Beck–Fiala 1981, Lovász–Spencer–Vesztergombi 1986, Roth 1964) are "attributed, not consulted" (README lines 472–477); verification rests on an arXiv monograph of 2026 and two arXiv papers.
