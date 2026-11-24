# Review of WachLatticesOverTheCyclotomicTower (pull request #3027 at 6f088b9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/WachLatticesOverTheCyclotomicTower/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 141 changed lines since `b8f3652`. I checked the new `*Origin:*`, `*Method of the formal proof:*` and `*Corollary of:*` labels of 6.4–6.11, the rewritten sources paragraph of 6.4, and the new scope, supplier contract and references. I also checked each new citation against PhiGammaModulesAndIwasawaCohomology at this head and against the source texts. The three corollary claims hold (6.4 (6) from §6.4, 6.4 (8) from §6.6 through the twist, and the case `s = 1` of 6.5 (1) after inverting `p` from §6.5), and so does the new account of what Berger (2004) and Berger (2008) contain; nothing blocks. There are two small corrections and one format note: two pointers name a Layer 8 that does not exist, and the label of 6.4 calls (5) and the integral half of (2) particular to this proof although Berger (2004) states them. Two facts are left for the human reviewers: neither decision of theirs is exercised here, and the only source of the clauses particular to the proof is the unrefereed formal proof.

## C01 — Two pointers send the reader to a Layer 8 of PhiGammaModulesAndIwasawaCohomology that does not exist; the sections meant are §§6.4–6.6

A reader who follows the overview or the layer's Dependencies line looks for sections that are not there. At this head PhiGammaModulesAndIwasawaCohomology has Layers 0–7. Berger's comparison, the action of `Γ_F` modulo `φ^{s−1}(q)` and Wach's criterion are §§6.4, 6.5 and 6.6 of its Layer 6. The `*Corollary of:*` lines, the `*Needs:*` line of 6.4, the scope paragraph and the supplier contract all give them there. The overview (line 7) says instead "whose Layer 8 states Berger's comparison over the open disc, the action of `Γ_F` modulo `φ^{s−1}(q)` and Wach's crystallinity criterion". The Dependencies line (line 947) lists "6.0, 6.1, 8.1 and 8.3" and omits §§6.4–6.6.

Repair: in line 7, "whose §§6.4–6.6 state Berger's comparison …"; in line 947, "6.0, 6.1 and 6.4–6.6".

## C02 — The `*Origin:*` label of 6.4 calls clause (5), and the integral half of (2), particular to this proof, but Berger (2004) states them

These labels record which statements are already published, and the sources paragraph of 6.4 cites nothing for (5). Berger-Wach-2004 Proposition III.4.2 (line 742) says three things: `V ↦ N(V)` is an equivalence compatible with exact sequences and direct sums, and `T ↦ N(T)` respects the inclusion of lattices. Combined with `N(T) = N(V) ∩ D(T)` (Lemma II.1.3, line 429), this gives all of (5): saturation, sums, `N(T₀) = N(T₁) ∩ D(T₀)` and `f(N(T₁))[1/p] = N(T₂)[1/p]`.

Définition III.4.1 and the sentence after it (lines 735–741) give the heights of `N(T)` for weights in one interval. Berger's interval `[a; b]` is `[−b, a]` in the standing sign. His `φ(π^aN) ⊆ π^aN` is `q^aφ(N) ⊆ N`, and his `q^{a+b}`-height is `q^bN ⊆ φ^*N`. Together these are the first half of (2), with one bound for all embeddings.

Repair (one option): keep "particular to this proof" for the reductions modulo `λ` on the `Γ_F^{tor}`-invariants in (1)–(4). Add to the "Adapted from" sentence the heights of `N(T)` (Berger-Wach-2004 Définition III.4.1, here labelled by the embeddings, in (2)) and the saturation, sums and exact sequences of (5) (Proposition III.4.2 with Lemma II.1.3).

## N01 — The two new reference entries (Caruso–Liu, Gee–Liu–Savitt) name the journal without volume, pages or year of publication, unlike the other entries

For Gee–Liu–Savitt, the year in the entry and in the label of 6.11 (2012) is the year of the arXiv preprint.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 6.4 (6) as corollary of PhiGamma §6.4 | `F = ℚ_p`, `V = ℚ_p(−1)` | `πe₋₁ = (π/t)·te₋₁`; `π/t` has poles at every `ζ_{p^s} − 1`, so the two lattices agree only after inverting `t` | holds |
| 6.4 (8) as corollary of §6.6, through the twist | `T = ℤ_p(1)`, `a = 1`, `b = 0` | `N = π⁻¹e₁ℤ_p[[π]]`: `qφ(n) = n`, `φ^*N = q⁻¹N ⊇ N`; twisted module `ℤ_p[[π]]`, `h = 1`; weight `−1 ∈ [−1, 0]` | holds |
| 6.5 (1), `s = 1`, `p` inverted, as corollary of §6.5 | `V = E(−1)`; `n = 2`, labelled weights `(5, 0)` | `γ` acts by `(1+p)⁻¹`, `π₀ ≡ −p`, so `ν` acts by `c(−1) = 1/(1+p) ≡ 1`; §6.5 gives `{χ⁻⁵, 1}` without the factors | holds; the hedge is needed |
| 6.4 sources paragraph: Berger 2008 and Berger 2004 | Berger-2008 Prop. II.2.5, Thm V.2.3 (2); Berger-Wach-2004 §III.2 | `Fil⁰` form for `M(D)^r` on an annulus, `n > n(r)` only; Berger 2004 uses `θ∘φ⁻ⁿ` into `C`, no `t`-adic map | holds |
| 6.4 label: (1)–(5) particular to this proof | Berger-Wach-2004 Déf. III.4.1, Prop. III.4.2 | `φ(π^aN) ⊆ π^aN` is `q^aφ(N) ⊆ N`; `q^{a+b}`-height is `q^bN ⊆ φ^*N`; III.4.2 exactness gives (5) | C02 |
| 6.6 label: Caruso–Liu nearest | Lemma 3.2.4; `n = 1`, `φ(e) = X^he` | their chain bound `⌊(es+1)/(p−1)⌋`; here `σ = ⌊h/(p−1)⌋`, lattices `X^{−m}k[[X]]e` for `0 ≤ m ≤ σ` | holds |
| 6.7 label and method | `χ(γ) = 1 + p` | `γ((1+π)^jφ(x)) = (1+π)^jφ((1+π)^jγx)`, so `γ − 1` is `(1+π)^jγ − 1` on the summand; Herr 3.1, 3.8 and CC I.5.1 say what is claimed | holds |
| 6.8 method | rank 0; all indices low with `d = 0` | the only pair is `0`; every polar pair is a coboundary by 6.7 (1b); the steps match the route | holds |
| 6.9 label: the Fontaine–Laffaille count | `n = 1`, `h ≤ p − 2`; `F = ℚ_p`, `r = t = 1` | `σ = ⌊h/(p−1)⌋ = 0`; `d = 1` if `u < w`, `0` if `u > w` | holds |
| 6.10 label and method | `p = 3`, `r = 6` | `α(6) = ⌊6/2⌋ + ⌊6/6⌋ = 4 = cost(0, 6) = 1 + 1 + 2`; `q = 3(1+π) + π² = pw + π^{p−1}` | holds |
| 6.11 label and method | `U = {0, p − 1}`, `m′ = 2` | divisors `t^u` at `ζ_p − 1` give minor order `σ₂(U) = p − 1`; Check: carries `−1`, `+1`, `(p − 1)|c| = h` | holds |
| Headline (1), unchanged | `T = ℤ_p(−a)`, `a = p` | `φ^*N̄ = X^aN̄`, `∇ = ā = 0` although the weight is `p` | holds |
| Headline (2), unchanged | (P3) with `η ≥ 1`, `σ ≥ 0` | `1 + 6 < p` forces `p ≥ 11` | holds |
| Headline (3), unchanged | `H ≤ p − 2`; sharp example with `m = 1` | `cost(0, H) = 0` gives `C_i = 0`; at `H = p − 1` the cokernel is `ℤ_p[[π]]/(p, π^{p−1})` | holds |
| Headline (4), unchanged | `T = {(a, b) : a ≡ b mod p}` in `ℤ_p ⊕ ℤ_p(1−p)` | carries `−1`, `+1`; `(p − 1)|c| = p − 1 = h`; sum `p − 1 = σ₂(U)` | holds |
| Overview line 7, Dependencies line 947 | PhiGamma headings at this head | Layers 0–7; §§6.4, 6.5, 6.6 at its lines 2608, 2671, 2694; no section 8.x | C01 |

- Source locators checked against the text, 24 in all:
  - Berger-Wach-2004: II.1.1, II.2.1, II.3.1, III.2.1, III.2.2, III.4.1, III.4.2, III.4.4, IV.1.1, IV.1.3 and `α(r)`;
  - Berger-2008: II.2.5 and V.2.3;
  - Wach-1996: Théorème, p. 380, and Remarque a), p. 381;
  - Herr-1998: 2.1, 3.1 and 3.8;
  - Cherbonnier-Colmez-1999: I.5.1;
  - Caruso–Liu: Theorem 1 and §§3.2–3.4;
  - Gee–Liu–Savitt: §§4 and 6.
- Library: `Suggested.lean` declares nothing, so no `#check` comparison was needed. The pinned Mathlib and Tau Ceti have no Wach modules, `D_cris` or crystalline representations: a grep finds "crystalline" only in divided-power files.
- Cross-roadmap citations resolved at this head:
  - PhiGammaModulesAndIwasawaCohomology §§0.1, 1.0, 2.2, 2.4, 2.5, 3.1, 3.4–3.6 and 6.0–6.6 all resolve; §§8.1 and 8.3 are absent (C01).
  - The supplier contracts for §§6.4–6.6 agree with those sections in substance.
- Dependency check: `depcheck: 129 roadmaps, 1441 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- Automatic checks: every check passed. Elaboration of `Suggested.lean` with `lake env lean` gives no output (no declarations, no warnings).
- Record: no layer, section or item of the README at the merge base is removed or renumbered. All 12 deleted lines are rewritten in place. `Suggested.lean` is unchanged.

Overlap check: read TriangulineVarietyAndItsLocalModel, SelmerLengthBoundsAndLocalLifting, CongruenceModulesOfThetaLifts, LengthBoundsInPadicFamilies and PhiGammaModulesAndIwasawaCohomology. Shared objects and their owners:
- Berger's comparison, the `Γ_F` action modulo `φ^{s−1}(q)` and Wach's criterion with one height bound: owned by PhiGammaModulesAndIwasawaCohomology §§6.4–6.6, which this roadmap cites.
- The criterion with labelled heights, 6.4 (8): owned by this roadmap, as a variant stated in its scope. Its level-`s` analogue is SelmerLengthBoundsAndLocalLifting §4.10e (0), a consumer.

Source independence: changed passages only; 15 passages compared with 7 sources (Berger-Wach-2004, Berger-2008, Wach-1996, Herr-1998, Cherbonnier-Colmez-1999, Caruso–Liu, Gee–Liu–Savitt), none shared beyond formulae. The largest share is [FormalProof], 52 of about 75 locators. Contents were not compared, because no layer is added, removed or reordered.

Research link: 6.4–6.11 extend Wach (1996), Berger (2004) and Herr (1998) to reduced Wach lattices with weights beyond `p`. They are analogues for Wach lattices of Caruso–Liu (2009) and Gee–Liu–Savitt (arXiv 2012) on Kisin modules. They supply SelmerLengthBoundsAndLocalLifting and CongruenceModulesOfThetaLifts in Alpöge's formal proof of RH for Dirichlet L-functions (2026). This line rests on the README and the sources I read.

## Not verifiable

- The `*Method of the formal proof:*` labels of 6.4–6.11 describe how the Lean repository [FormalProof] proves each clause, as does the clause "which [FormalProof] has one level at a time" in the label of 6.4. No copy of that repository is in the sources cache or held locally, and I did not read it. I checked only that the labels agree with the routes and source lines of their sections.
- For Caruso–Liu and Gee–Liu–Savitt I read the arXiv versions (0709.2118v1 and 1203.2552v4). No locator is cited, so numbering does not arise.

## Source issues

- none

## For the human reviewers

- Neither of your decisions applies here: no section leaves this roadmap. 6.4 (6), 6.4 (8) and 6.5 (1) stay, with `*Corollary of:*` lines naming PhiGammaModulesAndIwasawaCohomology §§6.4–6.6, which do state those theorems.
- The labels now mark the reductions of 6.4, and 6.8 and 6.9, as particular to the formal proof. Their only source is [FormalProof], a Lean repository announced on 20 November 2026 ([Announcement]) and not refereed (README lines 41, 512, 557 and 997–998).
