# Review of WachLatticesOverTheCyclotomicTower (pull request #3027 at 7b5fe43)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/WachLatticesOverTheCyclotomicTower/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 141 changed lines since `b8f3652`. I checked the new `*Origin:*`, `*Method of the formal proof:*` and `*Corollary of:*` labels of 6.4–6.11, the rewritten sources paragraph of 6.4, and the new scope sentence, supplier contract and references, each against PhiGammaModulesAndIwasawaCohomology §§6.4–6.6 at this head and against the source texts. The three corollary claims hold, and so does the new account of what Berger (2004) and Berger (2008) contain; nothing blocks. There are two small corrections and one format note, all three carried over unrepaired from the previous review (the folder has not changed since): two pointers name a Layer 8 that does not exist, and the label of 6.4 calls clause (5) and the integral half of (2) particular to this proof although Berger (2004) states them. Two facts are left for the human reviewers.

## C01 — Two pointers send the reader to a Layer 8 of PhiGammaModulesAndIwasawaCohomology that does not exist; the sections meant are §§6.4–6.6

A reader who follows the overview or the layer's Dependencies line looks for sections that are not there. At this head PhiGammaModulesAndIwasawaCohomology has Layers 0–7, and Berger's comparison, the action of `Γ_F` modulo `φ^{s−1}(q)` and Wach's criterion are its §§6.4, 6.5 and 6.6 (its lines 2608, 2671, 2694). The `*Corollary of:*` lines, the `*Needs:*` line of 6.4, the scope paragraph and the supplier contract of this roadmap all cite them there. The overview (line 7) says instead "whose Layer 8 states Berger's comparison over the open disc, the action of `Γ_F` modulo `φ^{s−1}(q)` and Wach's crystallinity criterion", and the Dependencies line (line 947) lists "6.0, 6.1, 8.1 and 8.3" and omits §§6.4–6.6.

Repair: in line 7, "whose §§6.4–6.6 state Berger's comparison …"; in line 947, "6.0, 6.1 and 6.4–6.6".

## C02 — The `*Origin:*` label of 6.4 calls clause (5), and the integral half of (2), particular to this proof, but Berger (2004) states them

The labels record which statements are already published, and the sources paragraph of 6.4 cites nothing for (5), so a reader takes (5) to be new. Berger-Wach-2004 Proposition III.4.2 (line 742) says that `V ↦ N(V)` is an equivalence compatible with exact sequences, and that `T ↦ N(T)` is an inclusion-respecting bijection on lattices. With `N(T) = N(V) ∩ D(T)` (Lemme II.1.3, line 429) this gives all of (5): `N(T′) = N(V) ∩ D(T′) = N(T) ∩ D(T′)`, the sums, `N(T₀) = N(T₁) ∩ D(T₀)` and `f(N(T₁))[1/p] = N(T₂)[1/p]`.

Définition III.4.1 and the sentence after it (lines 735–741) give the heights of `N(T)` for weights in one interval. Berger's interval `[a; b]` is `[−b, −a]` in the standing sign; his `φ(π^bN) ⊂ π^bN` and "killed by `q^{b−a}`" are the two inclusions of the first half of (2), with one bound for all embeddings.

Repair (one option): keep "particular to this proof" for the reductions modulo `λ` on the `Γ_F^{tor}`-invariants in (1)–(4), and add to the "Adapted from" sentence the heights of `N(T)` (Berger-Wach-2004 Définition III.4.1, here labelled by the embeddings, in (2)) and the saturation, sums and exact sequences of (5) (Proposition III.4.2 with Lemme II.1.3).

## N01 — The two new reference entries (Caruso–Liu, Gee–Liu–Savitt) name the journal without volume and pages, unlike the other entries

The Gee–Liu–Savitt entry also has no year of publication: the "2012" in it and in the label of 6.11 is the year of the arXiv preprint.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 6.4 (6) as corollary of PhiGamma §6.4 | `F = ℚ_p`, `V = ℚ_p(−1)` | `πe₋₁ = (π/t)·te₋₁`; `π/t` has a pole at each `ζ_{p^s} − 1`; lattices agree only after inverting `t`, as §6.4 states | holds |
| 6.4 (8) as corollary of §6.6 through the twist | `T = ℤ_p(1)`, `a = 1`, `b = 0` | `N = π⁻¹e₁A⁺`: `qφ(π⁻¹e₁) = π⁻¹e₁`; `φ^*N = q⁻¹N ⊇ N`; twisted module `A⁺`, `h = 1`; weight `−1 ∈ [−1, 0]` | holds |
| 6.5 (1), `s = 1`, `p` inverted, as corollary of §6.5 | weight `u`, `χ(γ) = 1 + p ∈ Γ_1` | `γ = (1+p)^{−u}`, `π₀ ≡ −p`: `ν = ((1+p)^{−u} − 1)/(−p) = c(−u)`; §6.5 gives weights of the `ℚ_p`-representation, not per `e_i` | holds; the hedge is needed |
| 6.4 sources paragraph on Berger 2008 and 2004 | Berger-2008 II.2.5 (line 411), V.2.3 (2) (line 789); Berger-Wach-2004 III.2.1–III.2.2 | II.2.5: `Fil⁰` for `M(D)^r` over `B^{†,r}_{rig,K}`, only `n > n(r)`; Berger 2004 uses `θ∘φ^{−n}` into `C`, no `F_s[[t]]` | holds |
| 6.4 label: (1)–(5) particular to this proof | Berger-Wach-2004 III.4.1, III.4.2, II.1.3 | heights of `N(T)` and exactness with lattice bijection are stated there | C02 |
| 6.6 label and method | `n = 1`, `φ(e) = X^he` | `p·m ≤ m + h` gives `m ≤ ⌊h/(p−1)⌋ = σ`; `(γ−1)(X^an) = X^{a+1}(∇ − a)n + …`; Caruso–Liu §§3.3–3.4 are maximal, minimal objects | holds |
| 6.7 label and method | `χ(γ) = 1 + p`, summand `j ≠ 0` | `γ((1+π)^jφ(x)) = (1+π)^jφ((1+π)^jγx)`; `T_j(π^cm) ≡ jπ^{c+1}m`; Herr 3.1, 3.8 (1), CC I.5.1 say what is claimed | holds |
| 6.8 method | rank 0; all low, `d = 0` | only pair `0`; injection `a ↦ (c_{a,i} mod N_i)` into dimension `≤ Σd_i` matches the route step by step | holds |
| 6.9 label: Fontaine–Laffaille count | `F = ℚ_p`, `r = t = 1`, `h ≤ p − 2` | `σ = 0`; `d = 1` if `u < w`, `0` if `u > w`; equals `dim H¹_f` of a character of weight `u − w` | holds |
| 6.10 label and method | `p = 3`, `r = 6` | `q = 3(1+π) + π² = pw + π^{p−1}`; `α(6) = 3 + 1 = 4 = cost(0, 6) = 1 + 1 + 2` | holds |
| 6.11 label and method | `U = {0, p − 1}`, `m′ = 2` | minors of `P·diag(t^u)·Q` have order `≥ σ₂(U) = p − 1`; Check: exponents `0`, `p − 1`, sum `p − 1` | holds |
| Headline (1), unchanged | `T = ℤ_p(−a)`, `a = p` | `π₀ ≡ π^{p−1}` (Wilson); `(γ − 1)π^ae ≡ aXπ^ae`; `∇ = ā = 0` at weight `p` | holds |
| Headline (2), unchanged | (P3), `η ≥ 1`, `σ ≥ 0` | `1 + 0 + 6 < p` forces `p ≥ 11` | holds |
| Headline (3), unchanged | `H = p − 1`, sharp example `m = 1`; `H ≤ p − 2` | cokernel `ℤ_p[[π]]/(p, π^{p−1})`: killed by `π^H`, `p`; `e_W = 5 ≥ cost + 3 = 4`; `cost(0, H) = 0` below | holds |
| Headline (4), unchanged | `T = {a ≡ b mod p}` in `ℤ_p ⊕ ℤ_p(1−p)` | carries `−1`, `+1`: `(p−1) − p + 1 = 0`, `0 + p − 1 = h`; residues `{0, −1}` of `U`; `(p−1)|c| = h` | holds |
| Overview line 7, Dependencies line 947 | PhiGamma headings at this head | Layers 0–7; §§6.4, 6.5, 6.6 present; no §8.x | C01 |

- Source locators checked against the text, 19: Berger-Wach-2004 II.1.1, II.1.3, II.2.1, II.3.1, III.2.1, III.2.2, III.4.1, III.4.2, III.4.4, IV.1.1 with `α(r)`, IV.1.3; Berger-2008 II.2.5, V.2.3; Wach-1996 Théorème (printed p. 380) and Remarque a) (p. 381); Herr-1998 2.1 (p. 572), 3.1 (p. 578), 3.8 (p. 584); Cherbonnier-Colmez-1999 I.5.1. Caruso–Liu (arXiv 0709.2118v1): Theorem 1 and §§3.3–3.4 read.
- Library: `Suggested.lean` is unchanged and declares nothing (no headline is statable at the pins; its docstring says which carriers are missing), so there is no signature to compare and no one-tactic probe to run.
- Cross-roadmap citations resolved at this head: PhiGammaModulesAndIwasawaCohomology §§6.0–6.6 (the supplier contracts for §§6.4–6.6 agree with those sections), PadicHodgeTheory §§1.5 and 5.2; §§8.1 and 8.3 are absent (C01).
- Dependency check: `depcheck: 129 roadmaps, 1441 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. `lake env lean` on `Suggested.lean`: no output (no declarations, no warnings).
- Record: no layer, section or item of the README at the merge base is removed or renumbered; the 12 deleted lines are rewritten in place.
- The pull request's text: its sentences on this folder (PhiGammaModulesAndIwasawaCohomology gains §§6.4–6.6; 6.4 and 6.5 here cite them in `*Corollary of:*` lines) agree with the head.

Overlap check: read TriangulineVarietyAndItsLocalModel, SelmerLengthBoundsAndLocalLifting, CongruenceModulesOfThetaLifts, LengthBoundsInPadicFamilies and PhiGammaModulesAndIwasawaCohomology. Berger's comparison, the `Γ_F` action modulo `φ^{s−1}(q)` and Wach's criterion with one height bound: owner PhiGammaModulesAndIwasawaCohomology §§6.4–6.6, cited here. The criterion with labelled heights, 6.4 (8): owner this roadmap, a variant named as such in its scope. The lattices at finite level (SelmerLengthBoundsAndLocalLifting §4.10e (0)): owner that roadmap, a consumer. Nothing else shared.

Source independence: changed passages only; 12 passages compared with 6 sources (Berger-Wach-2004, Berger-2008, Wach-1996, Herr-1998, Cherbonnier-Colmez-1999, Caruso–Liu), none shared beyond formulae; largest share [FormalProof], 52 of about 75 locators, text not read; contents not compared, since no layer is added, removed or reordered.

Research link: 6.4–6.11 extend Wach (1996), Berger (2004) and Herr (1998) to reduced Wach lattices with weights beyond `p`, with Caruso–Liu (2009) and Gee–Liu–Savitt (2012) as nearest results on Kisin modules; they supply SelmerLengthBoundsAndLocalLifting and CongruenceModulesOfThetaLifts in Alpöge's formal proof (2026). Rests on the README and the sources read.

## Previous findings

- The previous review had no findings. Its small corrections C01 and C02 and its format note N01 are not repaired (the folder is unchanged since that head) and are written again above.

## Not verifiable

- The `*Method of the formal proof:*` labels of 6.4–6.11, and the clause "which [FormalProof] has one level at a time" in the label of 6.4, describe how the Lean repository [FormalProof] proves each clause. No copy is in the sources cache; I checked only that the labels agree with the routes and source lines of their sections.
- Gee–Liu–Savitt is not in the sources cache; the description "Kisin modules in weights up to `p`" in the label of 6.11 was not read against it. No locator is cited.

## Source issues

- none

## For the human reviewers

- Neither decision is exercised here: no section leaves this roadmap. 6.4 (6), 6.4 (8) and 6.5 (1) stay, with `*Corollary of:*` lines naming PhiGammaModulesAndIwasawaCohomology §§6.4–6.6, which do state those theorems.
- Scope: the labels mark the reductions of 6.4, and 6.8 and 6.9, as particular to the formal proof; their only source is [FormalProof], a Lean repository announced on 20 November 2026 ([Announcement]), not refereed (README lines 41, 512, 557, 997–998).
- Not tested: [FormalProof] has the largest share of the locators and its text was not read, so wording was not compared against it.
