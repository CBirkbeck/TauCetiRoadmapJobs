# Review of ColemanIntegration (pull request #1043 at 9d45df9)

**Verdict:** needs changes

Incremental re-review of the 11 lines changed since c35168f (6 insertions, 5 deletions, all in `TauCetiRoadmap/ColemanIntegration/README.md`), and a check of the title and description against this head.

## R01 (P3) — the description's AI-assistance sentence points to co-author lines that most commits do not have

**Location.** Pull request description, the paragraph "Validation": "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package; the red-team and review repairs since are in the branch's commits, whose co-author lines name the assistant."

**Claim.** Every repair commit of the branch carries a co-author line naming the model used, so the description need name only GPT-6.

**Witness.** `git log --no-merges --format='%h %(trailers:key=Co-Authored-By)' origin/main..HEAD`: 24 commits, 17 without a co-author line (the oldest seventeen, `fc49b429` to `acaaf506`); the rest name Claude Opus 5.5 (3, the head among them), Claude Fable 5.1 (3), Codex (1). `CONTRIBUTING.md` lines 54–56 ask for the models in the description.

**Repair.** Replace the sentence by one that names the models itself: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package and for the red-team repairs up to `acaaf506`; Claude Opus 5.5 and Claude Fable 5.1 for the red-team and review repairs since." (Correct the first clause if the seventeen commits without a co-author line were made with another model.)

## Previous findings

- R01 — repaired: line 2655 "Prove the regulator theorem for every number field `k₀`, Galois over `ℚ` or not: the map `α ↦ (reg_∞(τ_*α))_τ`, `τ` running over the embeddings `k₀ → ℂ`"; lines 38, 2416, 2419 agree with it.
- R02 — repaired: "with author-side red-team passes to follow" is gone; the description reads "the red-team and review repairs since are in the branch's commits". The clause added after it is R01 of this report.

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Regulator theorem of L3.Fc.1 for every number field `k₀` (line 2655): invariant space `{a_(τ̄) = overline(a_τ)}` in `⊕_τ ℝ(n − 1)` has real dimension the rank | `ℚ`, `ℚ(i)`, `ℚ(2^(1/3))`; `n = 2, 3` | `ℚ`: `0 = r₂`, `1 = r₁ + r₂`. `ℚ(i)`: `(a, −a)`, `a ∈ iℝ`: `1`; `(c, c)`: `1`. `ℚ(2^(1/3))`: `1`, `2` | dimensions equal `r₂` (`n` even), `r₁ + r₂` (`n` odd); BBdJR Theorem 2.2 is stated for every number field, over the embeddings | none |
| Same, specialization `k₀ = k` Galois: "the embeddings are the `φ_∞ ∘ σ`" | `k = ℚ(i)`, `G = {1, c}`; `k = ℚ(ζ_3, 2^(1/3))`, `G = S₃` | `ℚ(i)`: `φ_∞`, `φ_∞ ∘ c = overline(φ_∞)`: 2 = `[k:ℚ]`; `S₃`: 6 distinct `φ_∞ ∘ σ`, 6 = `[k:ℚ]` embeddings | the family `(Φ_∞ ∘ σ)_σ` is the family `(reg_∞ ∘ τ_*)_τ`; non-abelian `G` included | none |
| New Check, line 2671 (`k₀ = ℚ(2^(1/3))`) | `n = 2`, `n = 3`; indexing by `Aut(k₀)` | real `τ₁`: `a₁ = overline(a₁)`, so `a₁ = 0` in `iℝ`, free in `ℝ`; pair: `a₃ = −a₂` in `iℝ`, `a₃ = a₂` in `ℝ`. `Aut(k₀) = 1` (`k₀ ⊂ ℝ`, other roots non-real). `rk K_5 = 2`; `ℤ² → ℝ` is non-injective or has dense image | `{(0, a, −a)}` of dimension 1, `{(b, c, c)}` of dimension 2; the wrong indexing is excluded for `n = 3` | none |
| `noLowWeightKTheory_numberField` route (lines 2416, 2419) | `k = ℚ(2^(1/3))`, `n = 2`, `x` of weight `j ≠ 2`; `ψ²` | `ch_(D,2)(τ_*ψ²x)`: `4·ch = 2^j·ch`, `4 − 2^j ∈ {3, 2, −4, …} ≠ 0`, so `reg_∞(τ_*x) = 0` for the three `τ`; injectivity gives `x = 0`; `dim K_3(k)_ℚ = r₂ = 1` | holds for the non-Galois witness of the previous R01; L3.Fc.1 needs L3.Fa.1 for the K-group construction only (line 2664), so no cycle | none |
| Scope sentence, line 38 ("for every number field `k` (L3.Fc.1)") | against line 2655 | both say every number field; `G`, `M^E_π`, pairings and determinants stay with `k/ℚ` Galois (lines 2655, 2677, 3035) | agree | none |

The rows for the untouched statements stand as in the previous review, of `c35168f`.

- Gate at this head (the worker's run and mine): every check 0, OK; the worker's targeted build `build=0`. `lake env lean` on `TauCetiRoadmap/ColemanIntegration/Suggested.lean`: five `declaration uses sorry` warnings (lines 52, 68, 76, 97, 118), nothing else; the file is unchanged since `c35168f`.
- Dependency check: `depcheck: 245 roadmaps, 2242 edges, 0 problem(s)`; no UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the folder: empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Source locators read against the text, 9: BBdJR (arXiv:0707.3682v2) Theorem 2.2, p. 5 (BBdJR line 216–230: any number field, sum over `σ : k → ℂ`, lattice in the conjugation-invariant part); Definition 3.1, (3.2), Lemma 3.3, (3.4), Definition 3.5, p. 10 (lines 443–480); Definition 3.6, Lemma 3.7, p. 11 (lines 485–492); BDJ (Numdam version of record) Remark 3.5 and Remark 3.6, p. 881 (BDJ line 751, 756), Remark 3.21, p. 886 (line 965: the regulator injection for a number field, as the route uses it). Of the seeded sample, the Definition of L3.Fc.1 falls in the changed passages; its locators are these.
- Cross-roadmap citations in the changed passages resolved at the open heads, 6: ArithmeticKTheory §3.4 (`borel_rank_order`, `borel_rank_centralSimple`, heading and both names present; it "owns the rank theorem independently of a regulator-value formula"); MotivicEtaleKTheory §2.0a, §2.2 (the weight-`p` character "annihilates all other weights", `ch(ψᵃx) = aᵖ ch(x)`), §7.1, §7.2, §7.4. Both are earlier in the merge order (139, 140 against 142).
- Pull request text: title equals the README's; the summary block and prose were re-read against README lines 3, 38–41, 3344 (the four consumers named there) and the folder's three files and nine declarations; the change of this head (the regulator theorem's generality) is below the level the description states, and no supplier, section or declaration changed; one sentence fails (R01).
- Overlap check: read BorelRegulators, PadicHodgeRegulators, ColemanIntegrationPartII (scope paragraphs; `scratch/overlaps.md` lists no shared roadmap, dropped id or second copy). The embeddingwise Beilinson map `reg_∞` and its lattice-image and injectivity theorem: owner ColemanIntegration L3.Fc.1; the Chern-normalized Borel regulator, its lattice and the comparison `r_Bo` against `r_Be`: owner BorelRegulators (later in the order, line 306), which cites L3.Fc.1 for the map only. Its `README.md` lines 10 and 161 still describe the L3.Fc.1 theorem as the one "for finite Galois number fields": for that roadmap's next review, no change here.
- Remark (untouched, passed before): the *Needs:* line of L3.Fc.1 (line 2664) still writes "the rank of `K_(2n−1)(k)_ℚ`" where the theorem now has `k₀`; the rank supplier is stated for every number field, so nothing depends on it.
- Source independence: changed passages only; 5 changed passages compared with 2 sources (BBdJR, BDJ), none shared (the invariant-space formula and the map `α ↦ (reg_∞(τ_*α))_τ` are forced by the mathematics); arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Whether the seventeen commits without a co-author line were made with GPT-6 (Codex): the history does not say; the repair of R01 leaves that clause to the author.
- Serre, *Linear Representations of Finite Groups*; Kedlaya, *p-adic Differential Equations*; Quillen, LNM 341; RJW published pages; BHYY OCR formulas: unchanged from the previous reviews, and outside the changed passages.

## Source issues

- **Misprint** in BBdJR at Remark 2.5, p. 5: the source says the rank `m_n` vanishes exactly for totally real `k` and odd `n ≥ 2`; it should be even `n`, since `m_n = r₂` for even `n` and `r₁ + r₂` for odd `n`; affects nothing.
- **Misprint** in BBdJR at Definition 3.6, p. 11: the source says that for `∗ = ∞` or `p` the determinant of `[·,·]_∗` is called `R_(n,∞)`; it should be `R_(n,∗)`, as Lemma 3.7(2) then uses `R_(n,p)`; affects nothing.

## For the human reviewers

- none
