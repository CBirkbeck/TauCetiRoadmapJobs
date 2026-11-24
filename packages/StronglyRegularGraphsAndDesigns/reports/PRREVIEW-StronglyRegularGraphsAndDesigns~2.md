# Review of StronglyRegularGraphsAndDesigns (pull request #3061 at 7dac2a2)

**Verdict:** accepted

**Summary.** Accepted: both findings of the previous review are repaired and the repairs introduce no new problem. The overview now carries `k ≥ 3` for projective planes and the nondegeneracy conditions of 5.5, and the route of 2.1 takes `2k − μ ≤ n − 2` and `2k − ℓ ≤ n` from the count of a union of two neighbourhoods, which I recomputed. There are no small corrections and one format note, not blocking. The Brouwer–Haemers and Brouwer–Van Maldeghem locators remain unread, which is left to the human reviewers as before.

## N01 — The header "Library declarations consumed" in `Suggested.lean` (line 662) still has only `#check` lines under it, now forty-two, repeating the supplier contracts of the README. Harmless; the README list is the one a reader uses.

## Previous findings

- R01 — repaired: "finite projective planes are the symmetric designs with `λ = 1` and `k ≥ 3`"; the bullet on `λ = μ` or `μ = λ + 2` now reads "under the nondegeneracy conditions of 5.5 (`2 ≤ k < n` and `0 < λ`, respectively `1 ≤ k` and `k + 1 < n`)", which are the hypotheses of 5.5.
- R02 — repaired: the route of 2.1 counts a union of two neighbourhoods, with the two Mathlib lemmas on its `*Needs:*` line, and records that `(10, 6, 4, 2)` shows the parameter relation alone does not suffice.
- C01 — repaired: "Nica states the converse direction for regular graphs under the standing assumption that graphs are connected [N, §1.1, p. 3]"; the convention is in the arXiv version (N lines 108–114); the printed locator was not seen.
- C02 — repaired: the boundary sentence now lists what the six layers contain, and residual and derived designs, Paley graphs and the three topics beyond the roadmap are named as outside it.
- C03 — repaired: the four API statements are marked "Basic API" with their consumers, the pentagon and order six as sanity checks, in the README and in the docstrings.
- C04 — repaired: `IsSRGWith.param_eq_real` assumes `0 < n` in both files; the route treats `G = ⊥` separately, with a Check on the edgeless graph and a negative control on the empty type.
- N01 — not repaired: written again above as N01.
- N02 — repaired: Scope and ownership now names the three topics of "Beyond this roadmap" as outside the scope; the section itself is the author's to keep.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 `IsSRGWith.param_eq_real` with `0 < n` | Petersen; `3K₃`; edgeless `(3,0,7,0)`; `K₃` as `(3,2,1,5)`; one vertex `(1,0,ℓ,μ)`; empty type `(0,1,5,2)` | `6 = 6`; `0 = 0`; `0·(−8) = 0 = 2·0`; `2·0 = 0·5`; `0 = 0·μ`; `−5 ≠ −4` | holds for `0 < n`; fails on the empty type, as the new control says | none |
| 1.2 route, case `G = ⊥` | `n = 1`; `n ≥ 2` | `k = 0`; `n − k − 1 = 0`; two distinct nonadjacent vertices force `μ = 0` | both sides vanish | none |
| 1.2 empty-type control | `(⊥ : SimpleGraph Empty).IsSRGWith 0 1 5 2` | elaborated with vacuous fields; `1·(1−5−1) = −5`, `(0−1−1)·2 = −4` | Check true | none |
| 2.1 route (union count) | Petersen; `3K₃`; `C₄`; `(16,5,0,2)`; parameters `(10,6,4,2)` | `2k−μ`: `5 ≤ 8`, `4 ≤ 7`, `2 ≤ 2`, `8 ≤ 14`; `2k−ℓ`: `6 ≤ 10`, `3 ≤ 9`, `4 ≤ 4`, `10 ≤ 16`; `6·1 = 3·2` and `10 > 8` | route sound; `μ ≤ k` (1.2) keeps `2k − μ` exact | none |
| Overview, projective planes | triangle `2`-`(3,2,1)`; Fano | triangle `k = 2`, excluded by `k ≥ 3`; Fano `k = 3`, `v = k² − k + 1 = 7` | agrees with 5.4 (`q = k − 1 ≥ 2`) | none |
| Overview, 5.5 conditions | edgeless `(n,0,0,0)`; `2K₂` `(4,1,0,0)`; `C₄` `(4,2,0,2)`; `K_n` | `k = 0 < 2`; `λ = 0`; `C₄`: adjacent pair in `0 + 2` closed neighbourhoods, nonadjacent in `2`, block size `3 < 4`; `K_n`: `k + 1 = n` | degenerate cases excluded; `C₄` gives `2`-`(4,3,2)` | none |
| 3.2 pentagon (docstring) | `C₅` | degree `2`; adjacent `0`, nonadjacent `1` common neighbours | holds | none |
| 5.1 `card_blocks_mul` (docstring) | Fano; `AG(2,3)` | `7·3 = 7·3`; `12·3 = 9·4` | holds | none |
| 6.3 order six (docstring) | `q = 6` | `6 ≡ 2 (mod 4)`; sums of two squares up to `6`: `0,1,2,4,5` | holds | none |
| Downstream consumers | Higman's inequality from 2.4; consumers' citations | DistanceRegularGraphsCodesAndPolygons cites 2.4, 5.1, 5.2, 5.3 (its README lines 783, 905, 944); LineSystemsAndSwitching cites 1.3 (lines 798, 813) | the sentence matches the open heads | none |

The rows for the untouched statements stand as in the previous review, of `be20d40`.

- Source locators checked against the text: 1 new (N, the standing connectivity convention, N lines 108–114 of arXiv:1609.08072v1; the converse of the three-eigenvalue theorem at N lines 2664–2665 and its proof at 2676–2681); it supports the changed sentence of 1.3.
- Library declarations opened at the pin: `SimpleGraph.IsSRGWith.card_neighborFinset_union_of_not_adj`, `…_of_adj`, `SimpleGraph.IsSRGWith.param_eq`, `SimpleGraph.bot_strongly_regular` (`Mathlib/Combinatorics/SimpleGraph/StronglyRegular.lean`, lines 108, 114, 169, 61); signatures as the README states (`2 * k - μ`, `2 * k - ℓ` in natural numbers; `0 < n`).
- Cross-roadmap citations resolved: the two consumers named under Downstream consumers, at the heads of their open pull requests; no citation of this README is unresolved.
- Elaboration: `Suggested.lean` elaborates at the pins with 40 `sorry` warnings and no error; one `import Mathlib` and four `TauCeti.*` imports, no `set_option`, no sorried data. The changed signature of `IsSRGWith.param_eq_real` agrees with the README (`0 < n`).
- Padding probe: `IsSRGWith.param_eq_real` tried with `exact_mod_cast`, `simp` and `push_cast; linarith` on Mathlib's `param_eq`; none closed.
- Dependency check: `depcheck: 129 roadmaps, 1436 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the folder is changed.
- Pull request text: the title and description agree with this head (boundary sentence, 40 `sorry`, suppliers unchanged).
- Overlap check: read StronglyRegularAndMooreGraphs, DistanceRegularGraphsCodesAndPolygons, GraphSpectra, AssociationSchemes, LineSystemsAndSwitching; nothing shared (the two later roadmaps cite this one's 1.3, 2.4, 5.1–5.3 and copy its design definitions under their own names; ownership as in the previous review).

Source independence: changed passages only: 1 passage compared with 1 source (N), none shared; largest share BH, about 33 of 62 locators; contents of BH not read; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layers 1–4 state the theory of strongly regular graphs treated in Brouwer–Van Maldeghem 2022 and Brouwer–Haemers 2012; Layer 6 is the Bruck–Ryser–Chowla theorem as in Brouwer–Van Maldeghem, Theorem 8.3.1; the uniqueness of the Hoffman–Singleton graph (Hoffman–Singleton 1960) is named as the extension. Rests on the README's references.

## Not verifiable

- BH (Brouwer–Haemers) and BVM (Brouwer–Van Maldeghem): not readable legally, as in the previous review; the References now say the BH pages are those of the printed edition, which I could not confirm.
- N, §1.1, p. 3 of the EMS edition: read only in the arXiv version, where the convention opens the first section (unnumbered subsection, p. 4).
- GR, CRS, BCN, Biggs, Hoffman–Singleton: unchanged passages, not read, as before.

Automatic checks set aside as false positives: none (the header without a declaration under it is real and is N01).

## Source issues

- none

## For the human reviewers

- Not tested: BH has the largest share of the locators (about 33 of 62) and could not be read, nor its table of contents; wording and arrangement were compared with N only.
- Licence: BH and BVM are on the first author's own page at an address that does not carry his name, so the sources service refused them; a human can confirm the page and supply the texts.
- Locators: the References now state that BH pages are those of the printed edition (ISBN 978-1-4614-1938-9); the previous review found them 2 to 4 pages off StronglyRegularAndMooreGraphs 1.2, 3.5 and AssociationSchemes 3.1 for the same theorems.
- Practice: `Suggested.lean` copies twelve definitions from six roadmaps that are still open pull requests (lines 44–181), under its own namespace; whether that is the wanted way to state targets before the suppliers merge is a project decision.
