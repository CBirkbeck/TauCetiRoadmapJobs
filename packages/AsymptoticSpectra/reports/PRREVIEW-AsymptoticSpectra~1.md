# Review of AsymptoticSpectra (pull request #3023 at 69d0c08)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of the three layers was recomputed at its degenerate cases (empty graph, no party, one party, a zero dimension, `a` not above `1`, ungapped `a`) and holds as written; the locators were read in the thesis, the survey, Zuiddam 2019 and Knuth, and the three supplier roadmaps resolve at their heads. There is one small correction and two format notes, none blocking, and two questions about which copy of the thesis and of the survey the numbers refer to. Four facts are left for the human reviewers (the outside paper and Lean development named in the scope section, the definitions copied from open roadmaps, the chapter-level parallel with the thesis, the page numbers of the survey).

## C01 — The scope section places `ϑ(C₅) = √5` in LovaszThetaFunction 5.3, which states `Θ(C₅) = √5`

In "Scope and ownership" (line 814) the sentence "`Θ ≤ ϑ`, `ϑ(C₅) = √5` and multiplicativity are LovaszThetaFunction 5.2, 5.3 and 3.2" sends a reader to the wrong section for the value of the theta function. At the head of LovaszThetaFunction, 5.3 is "The capacity of the pentagon" and proves `shannonCapacity_cycleGraph_five`, `Θ(C₅) = √5`; the value of `ϑ` on odd cycles is 4.1, `lovaszTheta_cycleGraph`, and 5.3 itself cites 4.1 for `ϑ(C₅) = √5`.

Either write "LovaszThetaFunction 5.2, 4.1 and 3.2", or keep 5.3 and name the statement it makes, `Θ(C₅) = √5`. No target here depends on the sentence: 2.2 and 2.4 use the value only in Checks.

## N01 — Several Checks and two reference entries say how a value was verified instead of stating it

"checked on 17³ sampled triples" (1.1), "all fields checked on the 27 polynomials" (1.3), "both proved in Lean on the definitions" and "evaluated in Lean by `decide`" (3.1), "in Lean … over `ZMod 31` by `decide`" (3.3), "no source read proves it" (2.4), and "Not consulted" (References) describe the drafting. A Check reads the same a year from now if it states the value and what it excludes; the three preorders concerned (positive pairs, `ℕ[x]`, restriction) have two-line proofs of every field, which could replace the sampling remarks.

## N02 — "From additivity and monotonicity … `φ n = n`" also uses `φ 1 = 1`

In the Conventions (line 51), the zero map is additive and monotone and has `φ n = 0`. The sentence is about spectral points, so nothing is wrong; "From the definition" would be exact.

## Questions for the author

- Which copy of the thesis do the numbers "Thm. 2.12, p. 26" (1.2) and "Cor. 2.13, pp. 27–28" (1.3) refer to? In the copy on the author's page the duality theorem is Theorem 2.13 on p. 27, preceded by a Lemma 2.12 on pp. 26–27, and the rank and subrank corollaries are 2.14 and 2.15 on pp. 28–29; every other thesis locator of the README (§2.3 p. 20, Def. 2.1 p. 21, Lemmas 2.3–2.7, Def. 2.8 p. 25, Lemmas 2.9 and 2.11, §2.8 p. 27) agrees with that copy. The University of Amsterdam copy could not be fetched, so the cited numbering was not checked there.
- Do the survey's page numbers hold in the copy on A. Wigderson's page? In the copy dated August 5, 2025 on J. Zuiddam's page all item numbers agree with the README, and so do the pages up to Example 2.19, but from Example 2.20 on every item sits one page earlier than cited (Example 2.20 on pp. 26–27, Def. 3.1 p. 31, Lemmas 3.3 and 3.5 p. 32, Thm. 3.22 p. 38, Thm. 3.25 pp. 39–40, Def. 3.27 p. 40, Remark 3.32 p. 41, Lemma 3.33 p. 42, Examples 3.37–3.39 pp. 43–44, Thm. 3.40 p. 44). The 2025 copy on A. Wigderson's page was not found; an October 2023 draft there numbers the examples of §3.7 differently.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `IsStrassenPreorder` | `ℕ`; positive pairs; `ℚ≥0²` without the zero condition | `ℕ`: all fields (proved example). Pairs: `(1,0)` not below `0`, `(0,1) ≤ r(1,0)` fails for all `r` | definition excludes the wrong model | none |
| 1.1 `asympLE` vs thesis Def. 2.1 | `x_N` vs `2^(f N)`; `n = 0`; `b ≈ 0` | `x_N ≤ 2^⌈log₂ x_N⌉`; `n=0`: `1 ≤ 2^(f 0)·1`; `b≈0` forces `a ≤ 2^(f 1)·0 ≈ 0` | equivalent | none |
| 1.1 ordered semirings | `ℕ`, `ℚ≥0`, positive pairs | `¬ b ≤ 0 ⇔ 0 < b` under `0 ≤ b`; `Archimedean` gives `a ≤ n•b = n*b`; spectral `φ 0 = 2 φ 0 = 0`, so a ring hom | true | none |
| 1.1 closedness and cancellation | `b ≈ 0`; `c ≈ 0`; `n = 0` in (iii) | exponent `M f(N) + g_N(M) ≤ (f N/N + 1/N)·NM`; chain `aᴺ ⊑ (N+1) bᴺ`, `⌈log₂(N+1)⌉/N → 0` | true | none |
| 1.2 duality | quotient by `≈`; `ℕ`; pairs `(1,2)` vs `(2,1)` | `R/≈` is a commutative semiring with thesis's preorder; `ℕ`: spectrum `{id}`; pairs: second projection `2 > 1` | true | none |
| 1.3 `isCompact_asymptoticSpectrum` | bounds per coordinate | `0 ≤ φ a ≤ R(a)`; closed in `∏[0, R(a)]` | true | none |
| 1.3 `asympRank_spec` | `a = 1/2` in `ℚ≥0`; `(2,3)` in pairs; `n = 0` term | `R((1/2)ⁿ) = 1`, limit `1 ≠ 1/2`; `R((2,3)ⁿ) = 3ⁿ`; `(xᵐ+1)^(1/m) → x` for `x ≥ 1` | true; `1 ≤ a` needed | none |
| 1.3 `asympSubrank_spec` | pairs `a = (1, 1/2)`; `x` in `ℕ[x]`; `φ₀ a = 1` case | `Q(aⁿ) = 0 < 1/2`; `ℕ[x]`: `Q(xⁿ) = 1`, `φ x = 2` from `4 ≤ 2x ≤ 4`; `φ₀ a = 1`: `1 ≤ Q(aⁿ) ≤ 1` | true; both hypotheses needed | none |
| 1.3 `ℕ[x]` preorder is Strassen | sums and products equal to a power of `x`; `r b` for `r ≥ 2` | `q + r = xᵏ` forces one summand `0`; `q r = xᵏ` forces both powers; `r b` never a power for `r ≥ 2` | true | none |
| 2.1 `isStrassenPreorder_cohomLE` | empty graph; `K̄ₙ` vs `K̄ₘ`; `K̄₂` vs `K₁` | `0 * G` has no vertex; `Kₙ → Kₘ` iff `n ≤ m`; `K₂ → K₁` none, so `K̄₂ ≰ K₁`; `v ↦ (e v, h₀)` has distinct first coordinates | true | none |
| 2.1 rank and subrank | `C₅`, `C₄`, `C₆`, `C₇`, `P₃`, `K₁,₃`, `K₃`, empty | `(3,2)`, `(2,2)`, `(3,3)`, `(4,3)`, `(2,2)`, `(3,3)`, `(1,1)`, `(0,0)` on both sides | true | none |
| 2.1 `shannonCapacity_eq_asympSubrank` | empty graph; complete graph; `α ≥ 2` | empty: both `0`, every `φ G = 0`; complete: `G ≈ 1`, value `1`; else `2 ≤ G¹` gapped | true | none |
| 2.2 `lovaszTheta_sum` | `V` empty; `C₅ ⊔ K₁`; block-diagonal wrong model | empty: `0 + ϑ(H)`; trace `(t+t')/(t+t') = 1`, entry sum `(t+t')²/(t+t')`; block-diagonal gives `6/(√5+1) ≈ 1.85 < 3.24` | true | none |
| 2.2 `lovaszTheta_mem_asymptoticSpectrum` | `C₅` circulant; one vertex; `K̄₂ ≤ C₅ ≤ K̄₃` | eigenvalue `1/5 − 4/20 = 0`, entry sum `√5`; `ϑ(K₁) = 1`; `2 ≤ √5 ≤ 3` | true | none |
| 2.3 `fracCliqueCover`, `_spec` | empty `V`; `C₅`; support condition dropped | empty: inf `0` attained, dual `0`; `C₅`: cover `5·½`, packing `5·½`; without support: value `1` | true | none |
| 2.3 spectral point | `C₅ ⊠ C₅`; `C₅ ⊔ K₁`; preimage of a clique | `25·¼ = 25/4 = (5/2)²`; `7/2 = 5/2 + 1`; two nonadjacent preimages would map to nonadjacent points of a clique | true | none |
| 2.4 `asympRank_cohomLE` | empty graph; `C₅ ⊠ C₅` | empty: `0 = 0`; cover number: each row needs 3 squares, each square meets 2 rows, `2k ≥ 15`, so `≥ 8 > 25/4`; `(1 + n log\|V\|)^(1/n) → 1` | true | none |
| 3.1 `isStrassenPreorder_restrictLE` | one party; no party over `GF(2)`; a dimension `0` | one party: `(1,1) = [[1],[1]]·(1)`, so `2 ≤ 1`; no party: `2 = 0`; two parties: flattening of `⟨n⟩` has rank `n` | true; two parties needed | none |
| 3.1 `abstractRank_restrictLE` | no party over `ℚ`, scalar `1/2`; party present | no party: both sets `{r : c = r·1}`, both `sInf ∅ = 0`; with a party: restriction from `⟨r⟩` is `∑_{i<r} ∏ A p (x p) i` | true, sets equal | none |
| 3.1 `tensorRank_ofHolor` | `ds = []`, scalar `2` over `ℚ`; `ds = [0]`; `ds = [2]`, `(1,1)` | `[]`: `cprank = 1`, `tensorRank = 2`; `[0]`: `0 = 0`; `[2]`: `1 = 1` | true; `ds ≠ []` needed | none |
| 3.2 `flatRank_mem_asymptoticSpectrum` | `S = ∅`; `⟨2,2,2⟩`; a dimension `0` | `∅`: `⟨1⟩ + ⟨1⟩ ↦ 1 ≠ 2`; `(4,4,4)`; dimension `0`: `0` | true; hypotheses needed | none |
| 3.2 `asymptoticSpectrum_restrictLE_fin_two` | zero matrix; empty format | `t ≈ ⟨rank t⟩`, so `φ t = rank t`; rank `0` both sides, zero array below everything | true | none |
| 3.3 `mmTensor`, `matMulExponent_spec` | `n = 0, 1`; Strassen's seven products; `n = 5` | `n=1`: the unit; `c₀₀ = M₁+M₄−M₅+M₇` etc. expand to `ab`; `7³ = 343 ≤ 7·5^(log₂ 7) ≈ 642`; `n² ≤ R ≤ n³` | true | none |
| C01 scope sentence | LovaszThetaFunction 4.1, 5.3 at its head | 4.1: `ϑ(Cₙ)`; 5.3: `Θ(C₅) = √5` | section number wrong | C01 |

- Source locators checked against the text: 16 in the thesis (author's-page copy), 21 in the survey (August 5, 2025 copy), 8 in Zuiddam 2019 (arXiv v2), 1 in Knuth (arXiv v1; printed p. 19); all numbers agree except the two in the first question, pages as in the second.
- Library declarations opened at the pins: `Nat.unaryCast` (`Mathlib/Data/Nat/Cast/Defs.lean`), `IsStrictOrderedRing` (`Mathlib/Algebra/Order/Ring/Defs.lean:74`), `Submultiplicative.tendsto_lim` and `Subadditive.tendsto_lim` (`Mathlib/Analysis/Subadditive.lean:89, 155`), `zorn_subset_nonempty` (`Mathlib/Order/Zorn.lean:152`), `harmonic_le_one_add_log` (`Mathlib/NumberTheory/Harmonic/Bounds.lean:34`), `Matrix.posSemidef_vecMulVec_self_star` (`Mathlib/LinearAlgebra/Matrix/PosDef.lean:453`), `Holor.CPRankMax1`, `Holor.CPRankMax`, `Holor.cprank` (`Mathlib/Data/Holor.lean:253, 260, 333`; `α : Type`), `finProdFinEquiv` (`Mathlib/Logic/Equiv/Fin/Basic.lean:330`), `Fin.divNat`, `Fin.modNat` (Batteries), `Matrix.exists_eq_mul_fin_rank`, `Matrix.rank_le_iff_exists_eq_mul` (`TauCeti/LinearAlgebra/Matrix/Rank.lean:293, 321`), `Matrix.kroneckerPower` (`TauCeti/LinearAlgebra/Matrix/KroneckerPower.lean:49`).
- Library survey confirmed by object: no strong product, Shannon capacity, fractional chromatic number, tensor rank other than `Holor.cprank`, rank of a Kronecker or block-diagonal matrix, or asymptotic spectrum in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved at the suppliers' open heads: LovaszThetaFunction 1.1, 1.2, 2.1, 3.1, 3.2, 5.1 (the four copied definitions agree character for character); ConvexAnalysisAndDuality 5.3 `linearProgramming_duality`; ApproximationGuarantees 1.1, 1.2 (`IsFractionalCover` agrees character for character; `IsGreedy.sum_cost_le_harmonic_mul` has the hypotheses the contract lists).
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates at the pins with 21 `sorry` warnings and nothing else; the elaborated types of all 44 declarations were compared with the README (the binders reported as dropped are instances the definitions do not use). One-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`): none of the 21 theorems closes.
- Headline theorems of the summary (duality, compactness, rank and subrank; graphs, theta, fractional clique cover, McEliece–Posner; tensors, flattening ranks, matrices, `ω`): all stated in `Suggested.lean`.
- All automatic checks passed on this head.

Overlap check: read LovaszThetaFunction, PerfectAndChordalGraphs, AlgebraicCircuitsAndValiantsClasses (and searched every open head and main by object); the theta function, the strong product and the Shannon capacity are owned by LovaszThetaFunction and cited here; PerfectAndChordalGraphs and AlgebraicCircuitsAndValiantsClasses list the Shannon capacity, tensor rank and the exponent of matrix multiplication outside their scope; nothing else shared.

Source independence: 14 passages compared with 4 sources, none shared beyond formulas; largest share survey, 21 of 46 locators; contents compared with survey (§§2–3) and with the thesis (chs. 2–4): independent (the abstract layer precedes the two instances because 2.1 and 3.1 need 1.1–1.3; section scopes differ).

Research link: Layer 1 is the duality theorem of Strassen 1988 as presented by Zuiddam 2018 and Wigderson–Zuiddam 2025; Layer 2 is Zuiddam 2019's dual characterisation of the Shannon capacity; Layer 3 is Strassen's setting for the exponent of matrix multiplication. Rests on the README's references and the texts read.

## Not verifiable

- Strassen 1969 and 1988, McEliece–Posner 1971: not read (the README says so too); the statements attributed to them were checked through the survey and Zuiddam 2019 only.
- The University of Amsterdam copy of the thesis: fetch failed; the author's-page copy was read instead.
- The 2025 copy of the survey on A. Wigderson's page: not found; the August 5, 2025 copy on J. Zuiddam's page was read instead.

## Source issues

- **Misprint** in survey at Example 2.20, p. 26 of the copy read: the source writes the third index pair of the Kronecker product as a repeated first-tensor index; it should pair the third index of each factor; affects nothing.

## For the human reviewers

- Scope and licence: `TauCetiRoadmap/AsymptoticSpectra/README.md` lines 842–857 name an unrefereed paper titled "VP ≠ VNP over every field" in a public repository, and say nothing here rests on it; no refereed source for that title was looked for.
- Reuse: that repository's `vp-vnp/Ov/Core/Tensor.lean` was read; its declarations (`Ten`, `Restr`, `RankLE`, `unit`) share no name, binder names or statement with `Suggested.lean`. The pages read showed no licence; the README says Apache-2.0.
- Reuse: `Suggested.lean` copies five definitions character for character from two roadmaps that are still open pull requests (LovaszThetaFunction, ApproximationGuarantees), under its own namespace and marked as copies.
- Arrangement: Layers 1, 2, 3 match chapters 2, 3, 4 of the thesis at chapter level (theory, graphs, tensors); the sections inside do not map one to one, and the most cited source is the survey.
- Not tested: the survey's page numbers against the copy the README cites (A. Wigderson's page); see the second question.
