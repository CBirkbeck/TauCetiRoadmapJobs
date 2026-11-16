# FIX-PKG-GrossZagierAndArithmeticHeightsPartII~11

This round settles the three findings of `REV-PKG-GrossZagierAndArithmeticHeightsPartII~10`. All three are P3. I checked each against the cached legal sources (LZ, LL2, Z, K) and against the README's own targets. All three are correct.

- F02 and F03 are applied as asked.
- F01 is applied with a different witness for n = 3. The review pointed to the vector u of §12.10, but that vector has norm 6. The group setting needs a vector of norm 1, so the Check uses (1/6)e₁ + e₃.
- The F02 pattern also turned up nine more wrong locators of the same kind. All are repaired.

Files changed:

- `packages/GrossZagierAndArithmeticHeightsPartII/README.md`.
- `packages/GrossZagierAndArithmeticHeightsPartII/sources.toml`: only the `locator` field of Bor98 changed, to match the corrected References entry.

Unchanged: `Suggested.lean`, `metadata.toml`, `design/plan.json`. No other manifest locator contains a corrected range. No source was fetched and no `needs-references.toml` was written. No supplier gap was added.

## F01 (P3) — applied differently

Old: one Check asserting, for all n ≥ 3, a regular unipotent element with cyclic distinguished vector. New: three Checks. Odd n: §12.10's matrix with unit vector (1/6)e₁ + e₃, det −1. Even n ≥ 4: no single-block unipotent; g₁ ⊕ d, determinant 8 at n = 4, 0 for d = 1. n = 2: anisotropic, the notions coincide.

Evidence that the finding is right:

- For unitary g put N = g − 1. Then N* = g⁻¹ − 1 = −g⁻¹N, so (N*)^k = (−1)^k g^(−k) N^k. Hence (im N^k)^⊥ = ker N^k.
- With a single Jordan block, im N^(n/2) = ker N^(n/2). So ker N^(n/2) would be totally isotropic of dimension n/2.
- The nonsplit V_n of even dimension has Witt index n/2 − 1. So no such g exists, and the old Check was empty for every even n.

The criterion "u cyclic ⇔ regular semisimple for U(V_(n−1))" is now cited at Z line 969–971 (proof of Lemma 4.3(i)).

Where my repair differs from the suggested one: the review's text said "§12.10 gives one for n = 3". But the vector u = e₁ + e₃ of §12.10 has h(u,u) = 6, not 1, and the group setting needs the distinguished unit vector. The Check therefore uses §12.10's matrix with u = (1/6)e₁ + e₃.

For even n, I added why unit-norm cyclic vectors exist: take v + l with v ∉ (ker (g₁ − 1))^⊥ and h(v,v) = 1 − h(l,l). Such a v exists because ker (g₁ − 1) is an isotropic line once n − 1 ≥ 3.

The same pattern elsewhere: §12.10's own control Check is in the semi-Lie setting, where u need not have norm one. It is correct as written. §14.6's first Check says only that such elements exist, which the new §9.1 Checks now witness for every n ≥ 3.

## F02 (P3) — applied

The three locators, old → new:

| Section | Old | New |
|---|---|---|
| §0.1 | LZ §§1.7–1.8, pp. 8–10 | pp. 8–9 |
| §4.1 | LZ §§10.1–10.3, pp. 64–66 | pp. 63–66 |
| §6.2 | LL2 Definitions 2.45–2.50, pp. 28–30 | pp. 29–30 |

Evidence:

- LZ line 374: the p. 10 marker, followed by §1.9 at line 375.
- LZ line 2805: §10.1 begins, before the p. 64 marker at line 2811.
- LL2 line 1461: Definition 2.45, after the p. 29 marker at line 1448. Definition 2.50 is at line 1520, before the p. 31 marker at line 1540.

The same pattern elsewhere. I ran a script over 299 numbered items cited with a page in parentheses, across the 17 arXiv and author-copy sources (LRZ with its printed pagination, PDF page minus 18). A second run covered the five journal-paginated works with their offsets: Zha12 +196, Liu11a +847, YZZ09 +1145, KM90 +119, VZ84 +49. A third covered the locator lists in the References. Every item it flagged I opened by hand. Nine further locators were wrong:

| Section | Old | New | Evidence |
|---|---|---|---|
| §3.2 | LZ Definitions 3.5.1–3.5.2, p. 17 | LZ §3.5 and Theorem 3.5.1, p. 17 | LZ has no such definitions. The weights m(a) are defined in the running text of §3.5 (line 680–686). 3.5.1 is Cho–Yamauchi's theorem (line 688); 3.5.2 is an example on p. 18 (line 712). |
| §3.2 | Definitions 7.3.1–7.3.3, pp. 44–45 | p. 45 | §7.3 begins at line 1872, after the p. 45 marker at line 1871; the p. 46 marker is at line 1917. |
| §2.6 | LZ Definitions 6.4.1 and 6.4.3, pp. 37–38 | p. 38 | Lines 1597 and 1619 are both on p. 38. |
| §4.2 | LZ Conjecture 10.4.1, pp. 66–67 | p. 67 | Line 2932 is after the p. 67 marker at line 2927. |
| §8.4 | K proof §§8.3–8.9, pp. 67–72 | its proof is completed by Definition 8.3 through Proposition 8.9 and the proof of the latter, pp. 67–73 | K has no subsections 8.3–8.9. These are numbered items (lines 3603–3834). The proof of Proposition 8.9 ends at line 3871, after the p. 73 marker at line 3863. |
| §13.1 | LZ §§12.1–12.2, pp. 77–79 | pp. 77–78 | §12.3 begins at line 3438 on p. 78. |
| §13.2 | LZ §§12.3–12.4 with (12.3.0.2), (12.4.0.2)–(12.4.0.3), pp. 79–81 | pp. 78–80 | §12.3 begins at line 3438 on p. 78. (12.4.0.3) is at line 3508 and §13.1 at line 3514, both on p. 80. |
| §13.6 | LZ §15.3, (15.3.0.1), p. 88 | LZ §15.3, pp. 87–88, and (15.3.0.1), p. 88 | §15.3 begins at line 3788 on p. 87; (15.3.0.1) is at line 3814 on p. 88. |
| References (and the manifest) | Bor98 §6 and Theorem 6.2, p. 24 | §6, pp. 22–27, with Theorem 6.2, p. 24 | §6 begins at line 1169 on p. 22, and §7 at line 1454 on p. 27. |

Every other flagged item was checked by hand and is correct. These were either parser misses or a section cited at the page of the item named:

- Ter13a Lemma 3.1 (line 1345, p. 21).
- LRZ §16.4 (line 3002, printed p. 70).
- LL1 §8: local identity at line 1845 on p. 39, and (8.2)–(8.3) at lines 1715 and 1754 on pp. 37–38. LL1 §9: local identity at line 2066 on p. 44.
- LL2: footnote 9 at line 498 on p. 11; Proposition 2.28(2) at line 1121 on p. 23; Definitions 2.14–Lemma 2.19 on pp. 13–15.
- Z (2.11) on p. 9, and (2.16)–(2.17) on p. 10.
- Mih16, line 1285 on p. 29.
- LZ §13.1 (line 3514, p. 80).
- BHKRY §7.2, which runs to p. 102 (line 4790).
- Bor99, ρ_M at lines 160–190 on p. 3.

A second check compared each range with where the cited section ends. Its other flags were all statements cited with their proofs, each ending where the next item begins:

- LZ Lemma 6.2.1 (to line 1488, p. 36).
- LZ Proposition 7.3.4 (to p. 48).
- LZ Theorem 7.4.1 (to p. 55).
- LZ Theorem 10.4.3 (to p. 70).
- LL2 Lemma 2.24 (to p. 20).
- LL2 Lemma 2.55 (to p. 34).
- LL2 §2.7 (to p. 37).
- K Theorem 8.2 (to line 3602, p. 67).

The journal-paginated works all agree with their printed pages:

- Zha12: Conjecture 2.9 and the artinian remark at lines 521 and 538 on p. 210; Theorem 2.10 at line 578 on p. 211; Remark 11 at line 1968 on p. 245; Theorem 5.5 at line 2181 on p. 250.
- YZZ09: Theorem 1.3 at line 170 on p. 1150; Proposition 3.1 at line 541 on p. 1157; §4.1 at line 587 on p. 1158.
- Liu11a: Proposition 3.2 through Theorem 4.17 on the pages cited.
- KM90: Theorems 2 and 3 on pp. 126 and 127.
- VZ84: Theorem 8.1 at line 1063 on p. 88.

"Zha12 §2.2, p. 210" points to the passage on p. 210 inside §2.2 (which begins on p. 206). It is correct as a pointer to that passage.

## F03 (P3) — applied

§9.1 now begins "For n ≥ 2". In §9.8, "For n = 1 both sides are trivial" becomes: the statement is empty, because there is no graph at n = 1, V₁ has no unit vector, and Orb(γ, 1) = 1 for every γ ∈ S₁ = F^1, so nothing matches the nonsplit side. The n = 1 Checks of §14.5 and §14.6 now read "empty (§9.8)".

Evidence:

- Z line 679 defines N_(n−1,n) only for n ≥ 2, and line 683 defines the embedding δ only for n ≥ 2.
- PELModuliPartII §1.6 (its board package) states the graph "For n≥2".
- For n = 1 the transfer factor of §9.3 is η̃(det(γ)^0·det(e)) = η̃(1) = 1. Since F^1 ⊂ O_F^×, the unit function takes the value 1 at γ.

The same pattern elsewhere. Every other statement about n = 1 was checked and none needs a change:

- §9.3 (acting rank zero; its Check computes the same Orb = 1 at γ = 1).
- §9.2 semi-Lie dimension 0 (vacuous, §14.5).
- Layer 12 (n = 1: a point, CH¹ = 0).
- §9.4 (u ≠ 0 forced for n ≥ 2).

## Checks run

- **Elaboration.** I ran `lake env lean` on `packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean` from the content checkout: exit 0, no output, about 6 s.
  - The file is unchanged. It has one `import Mathlib`, one module docstring and an empty namespace, with no declaration and no `set_option`.
  - The `#check @name` comparison has no input, since there are no declarations, so no scratch file was needed. Nothing changed.
  - No finding touches a headline. §14.5 is the n ≥ 2 statement it always was, and the docstring's description of it stays accurate.
- **Dependency check.** I ran it after the edits and again after the last edit. The final run's exact output is `depcheck: 249 roadmaps, 2398 edges, 0 problem(s)`; the first run's was `depcheck: 251 roadmaps, 2402 edges, 0 problem(s)`, and the counts moved with a refreshed index. There is no UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." The worker's earlier list of four Lean names was already resolved by the review against GeometryOfNumbersAndQuadraticArithmetic and EtaleCohomologyFoundations, and the tool now finds them.
- **House style on the changed text.** No LaTeX delimiters and no process words. Every locator is in the form `<source> <item>, p. N`.
- **Gate failures.** None were listed for this round.

## Adversarial pass on added or changed statements

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §9.1 "for n ≥ 2" | n = 1, 2 | n = 1: N₀ does not exist (Z line 679, 683); n = 2: Δ ≅ N₁ has relative dimension 0 in N₁ × N₂ of relative dimension 1 (PELModuliPartII §1.6: n − 2 in 2n − 3) | Holds |
| §9.1 Check, odd n | n = 3 over ℚ₉/ℚ₃, H = 3J | gᵗHg = H entry by entry (rows (0,0,3), (0,3,0), (3,0,0)); N² ≠ 0, N³ = 0 (one block); det H = −27, valuation 3 (nonsplit); h(u,u) = 3(1/6 + 1/6) = 1; columns u = (1/6,0,1), gu = (−1/3,−1,1), g²u = (−11/6,−2,1), det = −1; im N = span(e₁,e₂) ∌ u | Holds; witness corrected from §12.10's norm-6 u |
| §9.1 Check, even n | n = 4, H = 3J ⊥ ⟨1⟩, d = −1 and d = 1 | det H = −27 (nonsplit, Witt index 1); gᵗHg = H; u = e₃ + l: h(u,u) = 0 + 1 = 1; det(u, gu, g²u, g³u) = 8; with d = 1 the minimal polynomial (T−1)³ has degree 3 and the determinant is 0 (negative control); g not semisimple (g₁ ≠ 1) | Holds |
| §9.1 even-n impossibility | n = 2, 4 | (N*)^k = (−1)^k g^(−k)N^k gives (im N^k)^⊥ = ker N^k; one block: im N^(n/2) = ker N^(n/2) has dimension n/2 > Witt index n/2 − 1 | Holds |
| §9.1 Check, norm-one cyclic vectors for even n | n = 4, 6 | v = (a/2)e + f, with e spanning ker(g₁ − 1) (isotropic since n − 1 ≥ 3) and f a hyperbolic partner: h(v,v) = Tr(a/2) = a, h(v,e) = 1 ≠ 0; a = 1 − h(l,l); at n = 4, a = 0 and v = e₃ | Holds |
| §9.1 Check, n = 2 | nonsplit V₂ | anisotropic (−det not a norm); unipotent g ≠ 1 would have ker N = im N = (ker N)^⊥, an isotropic line | Holds |
| §9.8 n = 1 sentence | γ = 1, γ = ξ ∈ F^1 of infinite order | Orb(γ, 1, s) = 1_(F^1)(γ) = 1 for all s; ω = η̃(1) = 1; Orb = 1, ∂Orb = 0; V₁ norms of odd valuation (§0.9: a odd); n = 2 unchanged: V₂ = V₁ ⊥ F·u₀ has determinant valuation odd | Holds; agrees with §9.3's Check (Orb = 1) |
| §14.5, §14.6 n = 1 Checks | n = 1, every q | group statement quantifies over matching γ, g: none exist, so it holds vacuously; the semi-Lie statement in dimension 0 is vacuous | Holds; agrees with §9.8 |
| Twelve locators (F02 and pattern) | page markers | each item's line lies between the markers of the new range, as listed above | Holds |

## For the maintainer

- No name, section number or id changed. No other roadmap cites the edited sentences.
- The §9.1 Checks now point to §12.10's control matrix; §12.10 is unchanged.
- PELModuliPartII §1.6 is cited as it reads in its board package ("For n≥2"). That package exists only on the board, so the citation should be rechecked when it moves.
- No new construction was stated, so no ownership question arises and ownership against open pull requests was not re-searched. The overlap inventory lists no pull request that changes this roadmap and no dropped id.
- The review's "For the human reviewers" items (the two untested targets, the licence notes, the scope of gap:jr-afl-local-inputs) were not acted on, as the brief directs.
