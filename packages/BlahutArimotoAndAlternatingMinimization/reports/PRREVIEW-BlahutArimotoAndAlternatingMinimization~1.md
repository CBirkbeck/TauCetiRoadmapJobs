# Review of BlahutArimotoAndAlternatingMinimization (pull request #3222 at b80a27c)

**Verdict:** accepted

**Summary.** Accepted: every statement, Check and counterexample of Layers 1–4 was recomputed and holds, including the versions for nonnegative vectors with the mass-corrected divergence that go beyond the cited sources, and `Suggested.lean` elaborates with `sorry` as its only warning. There are no findings; there are three small corrections (an author list, the owner of the general golden formula, three hypotheses the statements do not need) and two format notes, none blocking. The seven locators into Polyanskiy–Wu could not be checked against the text, and that is left for the human reviewers to weigh.

## C01 — The paper arXiv:2209.04961 has three authors; K. Watabe is not one of them

The README cites "Nakagawa–Takei–Hara–Watabe" for Theorem A and eq. (5) (in 3.2, line 315; in 4.0, line 371; in the References, line 541), and the pull request's description does the same under "Prior work". The arXiv paper with that number and title is by K. Nakagawa, Y. Takei and S. Hara (the arXiv text, line 8 of its extraction); the four-author paper is its reference [8], the 2021 IEEE article on the same recurrence (line 1601). A reader searching by the four names finds the other paper, whose numbering differs.

Write "Nakagawa–Takei–Hara" in the three places of the README and in the description. Theorem A (p. 2) and eq. (5) (p. 3) are where the README says.

## C02 — The scope section does not name the roadmap that states the golden formula for general channels

"Scope and ownership" (lines 483–485) says that the forms of the golden formula on general measure spaces, "such as for additive channels, are not treated here", without an owner. GaussianChannelsAndWaterFilling 1.1 (an open roadmap) states exactly those: the identity for a Markov kernel on a standard Borel input space and a probability measure `Q`, and its additive-channel case. The two statements are different results (there the mutual information is a divergence of the joint law and `Q` is a probability measure; here it is ChannelCoding's entropy-based finite mutual information and `Q` is any nonnegative vector, and that roadmap excludes finite alphabets), so nothing is owned twice; but a reader of 3.1 should learn where the general form lives.

Add one clause: "they are stated by GaussianChannelsAndWaterFilling 1.1".

## C03 — The nonnegativity of the reference vector in 1.1, 1.3 and 3.1 is not needed by the statements

`klDivVec p Q` depends on `Q` only through `vecMeasure Q`, which reads `Q` as its positive part: for `Q = (−1, 1)` it is the point mass at the second letter, the measure of `(0, 1)`, so `klDivVec p (−1, 1) = klDivVec p (0, 1)` for every `p`. Hence 1.1 and 3.1 for an arbitrary `Q` follow from the same statements at `Q⁺`, and likewise 1.3 for an arbitrary `P` (and arbitrary `P'`, since both sides read `P'` as `P'⁺`). The hypotheses `hQ` (`Suggested.lean` lines 54 and 183), `hP` and the restriction on `P'` (lines 84 and 87) therefore only narrow the statements; the Conventions (lines 46–48) already say that the entry is read as `0`. This is unlike the nonnegativity of the sets `S`, `P`, `Q`, which the Checks show to be necessary.

The hypotheses would either be dropped from the three Lean statements, or kept with a sentence in the Conventions saying that they are a normalisation and that the statements hold without them.

## N01 — A docstring names a commit and an open pull request

The module docstring of `Suggested.lean` (line 22) says the channel definitions are copied "at commit 3ee689ed4 of its open pull request". The citation "ChannelCoding 1.1 and 1.3" in the same sentence suffices and does not date.

## N02 — The Example of Layer 4 omits the starting law

"On the Z channel the laws tend to `(3/5, 2/5)`" (line 460) holds from every input law with positive entries (4.3); from `δ₁` the sequence stays at `δ₁`. Add "from every input law with positive entries".

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.0 `vecMeasure`, `klDivVec` | `D(δ₁‖(1,0))`; `D((1/2,1/2)‖(1,0))`; naive sum | `0`; `∞` (not a.c.); naive sum `(1/2)log(1/2) < 0` | Check true; excludes the `log 0 = 0` sum |
| 1.1 Pythagorean inequality | identity `D(p‖Q)−D(p‖p')−D(p'‖Q)`; `S={δ₁,δ₂}`; segment `(−1/2,1)–(1/2,0)`, `Q` uniform; `Q=0`; empty `α` | `= ∑(p−p')log(p'/Q)`, mass terms cancel; `∞+log 2 ≰ log 2`; `p'=(1/4,1/4)`, `(3/2)log 2 ≰ log 2`; trivial | holds; all four Checks true |
| 1.1 existence | `S={(t,1−t): t<1/2}`; bound `m log(m/M)+M−m` | inf `0` not attained; bound → ∞ as `m→∞` | holds |
| 1.2 linear family | 3 letters, mean `5/2`; members' means; `Q=(1,0)`; `ι` empty | `r²−r−3=0`, `r=(1+√13)/2`; `5/2` three times; form vanishes at letter 2; `p'=Q/∑Q` | holds |
| 1.3 four-point property | derivative inequality; segment Check; `S={(2/5,3/5),(19/20,1/20)}`; `P=(1/2,1/2,0)` | `∑P q/q' ≤ ∑P+∑q−∑q'`; `2log2−1/2=0.886 ≰ 0.693`; `0.697 ≰ 0.495`; `∞ ≰ log 2` | holds; Checks true |
| 2.1 telescoping bound | induction step; convexity of `P`; of `Q`; finiteness | `D(x‖p_{k+1})+D(p_{k+1}‖q_{k+1}) ≤ D(x‖y)+D(x‖p_k)`; `log(625/432)=0.369 ≰ 0.288`; `(4/5)log 9 ≰ log(10/9)`; `∞ ≰ 2log2` | holds |
| 2.2 convergence | `q₀=δ₃`; negative entry in `P`; in `Q` | values `∞`, inf `log 2`; value `(1−log2)/2=0.153`, inf `0`, `17·0.1534=2.608 > log20−1/2=2.496` (16 gives `2.455`); segments disjoint (`w=1/3>1/5`) | holds without compactness |
| 3.0 copied definitions | text comparison with ChannelCoding's head | the eight definition bodies identical | no second object |
| 3.1 golden formula | expansion; `p=0`, `Q` uniform; `W=2·id`, `p=Q` uniform | corrections `∑Q−1` both sides; `0` vs `1`; `4log2−1` vs `2log2−1` | holds; hypotheses needed |
| 3.2 Kuhn–Tucker | Z channel `p=(3/5,2/5)`; three-input `p=(1/2,0,1/2)`; `p=0`; `c=∞` | `q=(4/5,1/5)`, both `log(5/4)`; `log2,0,log2`; `c=∞` admissible, `I=0<log2`; `c=∞` impossible for a law | holds |
| 3.3 divergence radius | `A=B=∅`; `A=∅`, `B≠∅`; `W=2·id` | value set empty; `0` is least; all values `≥ 4log2−1 > 0 = C` | holds |
| 4.0 update | three-input channel from uniform | `pₙ=(2ⁿ,1,2ⁿ)/(2ⁿ⁺¹+1)`, `I=(1−1/(2ⁿ⁺¹+1))log2`, `Z=5/3` | Check true |
| 4.1 sandwich | same channel; `p=δ₁/e`; `W=2·id` | `0.462 ≤ 0.511 ≤ 0.555`; `I=1/e > log Z=0`; `log 4 > 0` | holds |
| 4.2 rate | three-input; `δ₁` on identity; `(1/4,1/4)`; `p'=p₀`; `W=2·id`, `n=1`; empty `A` | `n log2/(2ⁿ⁺¹+1) ≤ log(3/2)`; sum `−(1/2)log2`; `0 ≰ −(1/2)log2`; `(1/5)log2 ≰ 0`; `0.113 ≰ (1/2)log(9/8)=0.059`; `0 ≤ 0` | holds |
| 4.3 convergence | identity from `δ₁`; `W=2·id` from `(1/3,2/3)`; Z channel | `I=0<log2`; alternates with `(2/3,1/3)`; rows independent, unique optimum | holds |
| C03 | `Q=(−1,1)` | `vecMeasure Q = vecMeasure (0,1)` | hypotheses unused |

- Source locators checked against the text: 13 of 20 (Csiszár–Shields: Theorems 3.1, 3.2, 3.4, 5.3, (5.8), pp. 466–468; Nakagawa–Takei–Hara: Theorem A, eq. (5); Fasoulakis–Varsos–Traganitis: Lemma 2, Corollary 1); 7 into Polyanskiy–Wu not read.
- Library declarations opened at the pins: 15 in Mathlib (among them `InformationTheory.klDiv`, `KullbackLeibler/Basic.lean` line 56; `klDiv_eq_zero_iff`, line 372; `LowerSemicontinuousOn.exists_isMinOn`, `Topology/Semicontinuity/Basic.lean` line 77; `Submodule.orthogonal_orthogonal`, `Projection/Submodule.lean` line 59) and 5 in Tau Ceti (`klDiv_eq_ofReal_sum_log_singleton`, `KullbackLeibler/Finite.lean` line 53; `llr_eq_log_real_div_real_singleton`, `Basic.lean` line 35; `klDiv_eq_klDiv_add_klDiv`, `ChangeOfReference.lean` line 73; `fitLaw`, `Projection.lean` line 87; `proportionalFitting`). All exist with the stated content.
- Cross-roadmap citations resolved: ChannelCoding 1.1, 1.3, 1.5 at its open head; ProbabilisticAndMetricNumberTheory §5.1a and §5.2, MathematicalStatisticsSemiparametric Layer 7, ConvexAnalysisAndDuality and FirstOrderOptimization on main.
- Duplication by object: neither library has I-projections onto convex sets, the four-point property, channel capacity or the update; Tau Ceti's Pythagorean identities are for prescribed marginals and changes of reference on general spaces.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; the one supplier not on main, ChannelCoding, is an open pull request adding a new roadmap.
- Elaboration: 11 `sorry` warnings and nothing else; elaborated types compared with the README statements, no binder lost. One-tactic probe (`simp`, `rfl`) closes none of the 11 theorems.
- Headline theorems (1.1, 1.2, 1.3, 2.1, 2.2, 3.1, 3.2, 3.3, 4.1, 4.2, 4.3) are all stated; no padding.
- The worker's automatic checks all passed.

Overlap check: read RateDistortionTheory, ChannelCoding, GaussianChannelsAndWaterFilling, EntropyAndSourceCoding (through ChannelCoding's contract), DiffusionReverseStepKLBound, PACBayesBounds, OnlineConvexOptimization; channels, mutual information and capacity are owned by ChannelCoding and copied; the golden formula for general kernels is owned by GaussianChannelsAndWaterFilling 1.1 and its finite form with a nonnegative reference by this roadmap (C02); nothing else shared.

Source independence: 18 passages compared with 3 sources, none shared (the routes of 1.1–1.3 and 2.1 use the sources' ideas in the roadmap's own wording and generality); largest share Csiszár–Shields, 8 of 20 locators; contents compared with Csiszár–Shields: independent (Layer 1 takes three theorems of its Section 3, Layer 2 part of 5.2, Layers 3–4 nothing; the order of Layers 1 and 2 is forced by 2.1 needing 1.1 and 1.3). The text and contents of Polyanskiy–Wu could not be read.

Research link: Layers 1–2 are the alternating minimization theory of Csiszár–Tusnády (1984) as in Csiszár–Shields (2004); Layer 4 is the Arimoto (1972) and Blahut (1972) iteration, whose rate is the subject of Nakagawa–Takei–Hara (2022) and Fasoulakis–Varsos–Traganitis (2025). Rests on the README's references and the three texts read.

## Not verifiable

- Polyanskiy–Wu, Theorem 4.1 with eq. (4.2), p. 67 (3.1 and the scope section); Theorem 5.4, p. 94, and Corollaries 5.5–5.7, pp. 94–96 (3.2, 3.3); §5.6, pp. 102–103, with (5.29) (4.0, 4.1, 4.3): the publisher's page is not open and the sources service did not accept the first author's page, so the text was not read. The statements themselves were verified by computation.
- The commit of ChannelCoding named in the description: only the definitions at its present head were compared (identical).

## Source issues

- none

## For the human reviewers

- Not tested: seven of the README's twenty locators point into Polyanskiy–Wu (prepublication version of 16 August 2024), whose text could not be fetched from a place the sources service accepts; wording and locators were not compared with it.
- Licence: Csiszár–Shields was read from the first author's page at the Rényi Institute; the reviewer vouched for that page as an author's own.
- Scope: 1.1, 1.3, 2.1 and 2.2 are stated for finite measures with the mass-corrected divergence, a generality the cited sources only indicate (Csiszár–Shields, p. 466, uses the uncorrected divergence); the README says so and gives its own proofs.
