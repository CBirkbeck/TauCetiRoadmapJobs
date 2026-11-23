# Review of RamanujanGraphs (pull request #3018 at 9dfb3f5)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement survived the degenerate-case pass (empty vertex type, `d = 0, 1, 2`, `q = 1`, mixed degrees in 1.1, common roots in 1.2, the junk values of `getD`, natural subtraction and `Real.sqrt`), the Checks I recomputed all agree, the source locators that could be read are right, and `Suggested.lean` elaborates with all fifteen headline theorems stated and none closing in one tactic. There is one small correction and three format notes, none blocking. For the humans: McKay's 1981 paper could not be read legally from here, so its four locators are unverified (its formula and theorem are corroborated through Hoory–Linial–Wigderson).

## C01 — The second tool of 2.1 also holds for two nonpositive weights; it is weights of opposite signs that fail

The Check of 2.1 (line 251) says "The weights of the second item must be nonnegative" and gives `p = uv` with weights `+1, −1`. A reader takes from this that the operator `1 + α∂_j + β∂_k` fails as soon as a weight is negative. It does not: a polynomial with real coefficients that has no zero on the product of upper half-planes has none on the product of lower half-planes, and the route (b) run there shows that `α, β ≤ 0` preserves stability as well. For the Check's own `p = uv`, weights `−1, −1` give `uv − u − v = (u − 1)(v − 1) − 1`, which cannot vanish because the arguments of `u − 1` and `v − 1` add to a number in `(0, 2π)`. The computation in the Check is right (`uv + v − u` vanishes at `u = i`, `v = (1 + i)/2`); only its lead sentence overstates. Would read correctly as "The two weights may not have opposite signs: …". The theorem as stated (`α, β ≥ 0`) is unaffected.

## N01 — The Summary gives Serre's theorem for `d ≥ 2`; 5.4 and the Lean statement are for every `d`

Line 25 against line 660. Either is true; the Summary would match the layer with "for each `d`".

## N02 — The second Check of 1.1 does not say what it tests

`(x + 1)(x + 2) + (x − 1)(x − 2) = 2x² + 4` (line 115) is the negative control for the interlacing hypothesis: the pair is not commonly interlaced (`1 > −1`), the sum has no root, and the conclusion of 1.1 fails. One clause saying so would make the Check readable on its own.

## N03 — `PowerSeries.exp` is listed under "Measures" in the Mathlib contract

Line 769; it belongs with the polynomial or power-series names.

## Questions for the author

- 5.2 gives McKay's derivation of the density as "§3, pp. 210–213" (line 576) and the References give "§3, pp. 207–213" (line 840). Is the first a sub-range of the second, or is one of them a slip? I could not open the paper to tell.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 interlacing families | `m = 0`; constant member; degree 3 with degree 1; MSS pair; `−(x−1)`, `x−5` | `m = 0`: member is the sum. Mixed degrees: route uses only `r₂ ≤ r₁`, never `getD` junk. MSS sum `2x³−17x²−51x+498`, largest root in `(7,8)`; `(11/20)f+(9/20)g` not real-rooted | true as stated | none |
| 1.2 pair iff convex combinations | degrees 0, 1; 750 pairs, `t = k/48`; `f = 1`, `g = x²−1`; negative leading coefficient | 750 pairs, 0 mismatches (Sturm). Unequal degree: condition holds, `(x²+2)/4` rootless. `−0.4x²+1.27x−1.08`: discriminant `−0.115` | true; both hypotheses needed | none |
| 2.1 three closure properties | `n = 0`; `ι` empty; `j = k`; `p = uv`, weights `(1,−1)` and `(−1,−1)`; `x²+y²` | `det = 1`; `charpoly(−D)` real-rooted; `uv+v−u = 0` at `(i,(1+i)/2)`; `(u−1)(v−1)−1` never zero; `(−1+i)²+(1+i)² = 0` | true; Check sentence loose | C01 |
| 2.2 rank-one updates | `ι` empty; `n = 0`; `p = (−1,−1)` example | `P` monic (weights sum to 1); `P = 1` for `n = 0`; example gives `2(x+1)² − (x²+2x) = x²+2x+2` | true | none |
| 3.1 Bilu–Linial | empty `V`; conjugation by `[[1,1],[1,−1]]`; signing count | both sides `1`; conjugate is `[[A,0],[0,A_s]]`; `2+4+8+16+32+64+8+512 = 646` | true | none |
| 3.2 good signing | `K₄`, `K₃,₃`, `C₅`, `C₄`, `K₁,₃`; `K₃` with `p = −1`; one vertex | good signings 56/64, 192/512, 16/32, 8/16, 8/8; Godsil–Gutman sums exact; `x³−3x+54`, one real root; `x` against `x` | true | none |
| 3.3 existence | `d = 1, 2`; `K₄ ⊔ K₄`; `K_(d,d)` | `2√(d−1) = d` at `d = 2`, so multiplicity argument fails there; eigenvalues `3,3,(−1)⁶`; `d−1 ≥ 2` for the supplier's `q ≥ 2` | true for `d ≥ 3` | none |
| 4.1 error term | empty `V`; `q = 1`; `K₄`; `K₆` at `m = 0`; two `K₆ − e` joined | `0 ≤ 0`; modulus-1 roots; `N₃ = N₄ = 24`, `E₃ = 15`, `225 ≤ 288`; `14 > 10`; ratios `98624761/31719424`, `35.4`, `172.2` | true, both directions | none |
| 5.1 closed walks and tree | `d = 0, 1`; `ℓ = 0..3`; Petersen, Heawood, `K₄`, `K₃,₃`, `K₄,₄`; `P₃` | `t(3) = 1,0,3,0,15,0,87,0,543`; `t_(2s)(2) = C(2s,s)`; McKay formula equal for `d ≤ 7`, `s ≤ 8`; inequality for `ℓ ≤ 10`; `1 < 2` | true | none |
| 5.2 Kesten–McKay moments | `d = 0, 1, 2, 3, 5`; `x = ±d` | zero density for `d ≤ 1`; `0/0 = 0` at `±2` when `d = 2`; quadrature: `1,0,3,15,87` and `1,0,5,45,485`; mass `d/(a+1) = 1` | true for `d ≥ 2` | none |
| 5.3 McKay | `k = 0,1,2`; copies of `K₄`; Heawood; bounded `n` | no cycles of length `< 3`; moments `3` and `6 ≠ 0`; `tr A⁴/n = 15 = t₄`; bounded `n` contradicts the hypothesis at some `k ≤ N` | true; `n → ∞` follows | none |
| 5.4 Serre | `n = 0`; `d = 0, 1`; `ε` large; `d = 3`, `ε = 1`, `k = 60` | `0 ≤ 0`; all, resp. half, of eigenvalues exceed `−ε`; `2·61²·(2√2−2)^60 ≈ 0.093 < 1` | true for every `d` | N01 |

- Source locators checked against the text: 17 in Marcus–Spielman–Srivastava (arXiv v2), 2 in Bilu–Linial (arXiv v3), 4 in Hoory–Linial–Wigderson, 1 in the Terras draft; 4 in McKay not readable.
- Library declarations opened at the pins: 26 Mathlib and 5 Tau Ceti names, all present with the hypotheses the README states (for example `Matrix.spectralMeasure` needs `[Nonempty n]`; `tendsto_of_tendsto_integral_pow` asks for a compact carrier of the limit, which 5.2 supplies).
- Cross-roadmap citations resolved: 13 (MatchingPolynomial 1.1, 2.1, 4.2; IharaZetaFunction 1.1, 1.2, 2.1, 5.1, 5.3; SpectralGraphBounds 1.1–1.4; EigenvalueAndSingularValueInequalities 3.4 at their open heads; RandomMatrices Conventions 3 and 6, 1.1, 3.2 on main). The nine copied definitions agree with their owners' text.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with `sorry` the only warning (15). Elaborated types compared with the README statements for all 32 declarations: the three binders dropped are unused section variables on copied definitions; no theorem lost a hypothesis.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `aesop`, `exact?`): none of the 15 theorems closes. All headline theorems of the README are stated; none is padding.
- Automatic checks: all passed; no change outside the folder.
- Overlap check: read ExpanderWalksAndCodes, IharaZetaFunction, MatchingPolynomial, GraphSpectra, SpectralGraphBounds and KestenAmenabilityAndSpectralRadius (no roadmap on main is close); `IsRamanujan`, the Hashimoto matrix and the counts `N_m` are owned by IharaZetaFunction, the matching polynomial and signed adjacency matrix by MatchingPolynomial, the sorted eigenvalues by SpectralGraphBounds, each copied and cited here; interlacing families, real stability, 2-lifts, the tree numbers, the Kesten–McKay law, McKay's and Serre's theorems appear in no other roadmap's targets (the others list them as outside their scope). Ownership was searched by object across the open roadmap pull requests and main, and in the pinned Mathlib and Tau Ceti.

Source independence: 12 passages compared with 3 sources (Marcus–Spielman–Srivastava, Hoory–Linial–Wigderson, Bilu–Linial), none shared; largest share Marcus–Spielman–Srivastava, 17 of about 29 locators; contents compared with its sections: independent (Layers 1, 2, 3 use its §4, §6, §5 in the order the dependencies of 3.2 force, with proofs of 1.2 and 2.1 that are not the source's; Layers 4 and 5 are outside it). McKay's text could not be read, so no passage was compared with it.

Research link: Layers 1–3 are the existence theorem of Marcus–Spielman–Srivastava (2015), answering for bipartite graphs the conjecture of Bilu–Linial (2006); Layer 5 is McKay (1981) and Serre's theorem as in Hoory–Linial–Wigderson (2006), the quantitative Alon–Boppana theory. Rests on the README's sources, read except McKay.

## Not verifiable

- McKay 1981, Thm 1.1 and abstract (pp. 203–204), Lemma 2.1 (p. 205), §3, and the remark on `d = 2` (p. 204): the journal copy is paywalled and the sources service did not accept the scan as an author's page. The formula for `t_(2s)` and the limit density were checked instead against Hoory–Linial–Wigderson Lemma 7.3 and Thm 7.2, and by computation.
- That McKay assumes the number of vertices tends to infinity (5.3): same reason.
- Terras draft, p. 45: the remark after Exercise 37 is there, but the cached text is OCR and its first line is garbled, so only its place and subject (the error term in the graph prime number theorem) were confirmed.

## Source issues

- **Misprint** in Marcus–Spielman–Srivastava (arXiv:1304.4132v2) at Theorem 4.4, p. 7: the source says some member has largest root less than that of the sum; it should be at most, as its proof and Lemma 4.2 give (a one-member family has equality); affects nothing.

## For the human reviewers

- **Not tested / licence.** McKay, Linear Algebra Appl. 40 (1981): cited at four places in `TauCetiRoadmap/RamanujanGraphs/README.md` (lines 529, 575, 617, 655); the text could not be read legally here, so those locators and the wording comparison against it are unchecked.
- **Licence.** Terras, *A stroll through the garden of graph zeta functions*: an unpublished draft on the author's page (a book grew from it), cited once for a remark (README line 460); no stated result rests on it.
