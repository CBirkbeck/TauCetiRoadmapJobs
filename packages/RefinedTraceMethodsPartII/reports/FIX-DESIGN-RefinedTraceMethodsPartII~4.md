# FIX-DESIGN-RefinedTraceMethodsPartII~4

Findings of REV-DESIGN-RefinedTraceMethodsPartII~3 (two, both P2). Both were checked against the sources and both are correct.

## F01 (P2) — applied

Checked: akn-delta Corollary 8.7 (line 1787) is stated for G_A. C_A is the ∞-category of E∞-algebras in G_A (line 1714). Its initial object is the unit package (Remark 8.2(ii), lines 1723–1734). For A = ℤ_p this package gives `ℤ_p(0) = fib(id − id) = ℤ_p ⊕ ℤ_p[−1] ≠ 0`.

Change in the §8.2 bullet. Before: "preserve all limits and colimits on C_A". After: G_A is defined (akn-delta Definition 8.1). The functors preserve all limits and colimits on G_A, but only limits and sifted colimits on C_A. The reason given is that C_A is a pullback of E∞-algebra categories, and in those, limits and sifted colimits are computed underlying (lurie-ha Corollaries 3.2.2.5 and 3.2.3.2). The bullet also says why C_A fails for all colimits (its initial object is the unit package). The fourth Check now gives the zero object of G_A and the unit package of C_{ℤ_p} with its value. plan.json 8.2 (`statement`, `locator`, api `exactness`, test `zero`) matches. One source was added to `sources.toml` and References: `lurie-ha`, fetched from Lurie's author page, certified, locators Corollaries 3.2.2.5 and 3.2.3.2 opened at lines 13543 and 13801.

The reviewer's repair rests only on "E∞-algebras compute sifted colimits underlying". I used it, but with the pullback argument above and a citation, because G_A is defined as an operadic pullback and the bare statement needs that step.

Other occurrences: §8.3 item 4 and §8.4 (left Kan extension, akn-delta Corollary 8.9) use only sifted colimits, so they are consistent and unchanged. The §8.2 bullet on Proposition 8.3 (C_A has all colimits) is correct as attributed.

## F02 (P2) — applied

Checked: speirs-axes Lemma 9 (line 360) assumes period s ≥ 2, and part (2) (line 366) is the contractibility statement. `B(x_j^m)` is the weight-m part of `B^cy(⟨x_j⟩_+)`, which is `(T/C_m)_+` (hn-cusp line 122). That space is not contractible.

Change in the §2.5 bullets. Before: "contractible if ω has a cyclic repetition". After: "period ≥ 2 and a cyclic repetition", with the period-1 words `x_j^m ↦ (T/C_m)_+` named as the cells of `k[x_j]` that the birelative sum leaves out. The cell-type bullet is now also scoped to s ≥ 2, as in Lemma 9(1). The third Check now uses x_1x_1x_2 (contractible) and x_1x_1 (period 1, reduced homology ℤ in degrees 0 and 1). plan.json 2.5 (`statement`, `hypotheses`, test `repetition`) matches.

Other occurrences: §1.4 counts words with no cyclic repetition, and `cyc_d(1) = 0` because a one-letter word repeats cyclically, so it agrees. The Lemma 6 bullet already sums over period ≥ 2. Nothing else uses contractibility.

## Checks

Dependency check (`gate --candidate packages/RefinedTraceMethodsPartII/design/README.md --only RefinedTraceMethodsPartII --order merge-order/ORDER.txt`):

```text
candidate: RefinedTraceMethodsPartII is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 650 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

`roadmaps resolve` on the README finds no cross-roadmap citations and no Lean names that it cannot locate. The worker's earlier lead, `BigWitt.TruncationSet` at README line 97, no longer appears.

No `Suggested.lean` exists at the design stage, so no `#check` comparison was run and nothing was elaborated. No gate failures were listed for this round. No new targets were added and none were renamed. Each of §2.5 and §8.2 keeps its count of Checks (3 and 4).

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §8.2 colimits on G_A | zero object of G_{ℤ_p} | `ℤ_p(i)(0) = fib(0 → 0) = 0` = the empty colimit in `D(ℤ)^∧_p` | holds |
| §8.2 colimits on C_A | unit package of C_{ℤ_p} (initial) | `N^{≥0}{0} = ℤ_p`, `can = id`, `cφ = φ_{ℤ_p} = id`, so `fib(0) = ℤ_p ⊕ ℤ_p[−1]`, which is not 0 | all colimits fail; restricted to sifted |
| §8.2 limits on C_A | zero package (terminal in C_A) | 0 ↦ 0 = the empty limit | holds |
| §8.2 sifted colimits on C_A | geometric realization of packages | computed vertexwise (lurie-ha Cor. 3.2.3.2), the same as in G_A, where Corollary 8.7 applies | holds |
| §2.5 contractibility | x_1x_1 (s=1), x_1 (s=1, m=1), x_1x_1x_2 (s=3) | `(T/C_2)_+` with `H̃_0 = H̃_1 = ℤ`; `T_+`, not contractible; Lemma 9(2) gives contractible | period hypothesis is necessary and sufficient here |
| §2.5 cell type | (x_1x_2)² (s=2, i=2); x_1x_2x_3 (s=3, i=1) | `ΣB ≃ S^{λ_2} ∧ (T/C_2)_+`; `B ≃ S^{λ_1} ∧ T_+`, homology in degrees 2 and 3 | unchanged, now scoped to s ≥ 2 |
| §1.4 `cyc_d(1)` | d = 2 | a one-letter word has w_1 = w_1, so it repeats cyclically and `cyc_2(1) = 0`; `A_2(1) = 0 = 1·cyc_2(1)` | agrees |

## For the maintainer

- No names that other roadmaps cite were changed. The only new key in `sources.toml` is `lurie-ha`. When the sources service added it, it also reordered the fields `authors`, `title`, `year` in the entries `riggenbach-cusp` and `amm-perfectoid`; their values did not change.
- No untrusted text contained instructions.
