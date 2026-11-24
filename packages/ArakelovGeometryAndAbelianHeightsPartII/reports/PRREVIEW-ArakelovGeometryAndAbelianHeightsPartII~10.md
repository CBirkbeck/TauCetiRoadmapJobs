# Review of ArakelovGeometryAndAbelianHeightsPartII (pull request #3027 at e7914b5)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 14 changed lines since `aecb53a`. The change is the new §0.3a (Moriwaki's inequality) and its reference entry; the folder's text is the one the previous review read, which had no finding. The statement, its hypotheses and its three locators were read again against Moriwaki's paper and agree with Corollary 6.4 (Theorem 6.2 through Example 6.1 (2)); the remark on closed fibres, the route through HeightsRationalPointsAndObstructions §5.17d and the Check hold. There is no finding. The previous review's two small corrections and one format note are not taken up at this head and stand below; none blocks. Nothing is left for a human to decide.

## C01 — The *Needs:* line of §0.3a (line 132) leaves out two inputs that its route uses

An implementer who follows the route meets two steps that nothing on the line supplies.

"L + εA is ample" for L nef on every fibre is Kleiman's "nef plus ample is ample" on each fibre, followed by openness of fibrewise ampleness; AlgebraicModuliForArithmeticGeometryPartII §1.7 and §3.8 (i) state these on `main`. "ĥ⁰ ≥ χ̂ + o(n^d)" is the lattice-point bound ĥ⁰ ≥ χ̂ − log 6·rank (moriwaki-2009, Proposition 2.1 (1), p. 13); HeightsRationalPointsAndObstructions §5.17d does not state it, since its Minkowski input (`positiveIntersection_strictSmallSection`) produces one small section, so "(with its Minkowski input)" points at a different statement.

The smallest repair: add AlgebraicModuliForArithmeticGeometryPartII §§1.7, 3.8 (i) to the line (and to the layer's Dependencies and the supplier contracts; that roadmap is on `main`), and either name an owner for the counting bound or state it as a route input with the locator above.

## C02 — §0.3a states Moriwaki's theorem only in its fibre-nef form, which is narrower than the source for arithmetic surfaces

For d = 2 the source needs only that L_ℚ be nef on the generic fibre (moriwaki-2009, Corollary 6.3, p. 41, from Theorem 6.2 with Example 6.1 (1)); by Remark 6.6 (1), p. 42, that case contains the Hodge index theorem of Faltings and Hriljac. The README's hypothesis "nef on every geometric fibre" also asks for nefness on the closed fibres when d = 2, so the library would lack that case. One sentence carries it, for instance "For d = 2 it suffices that L_ℚ be nef on X_ℚ (moriwaki-2009, Corollary 6.3, p. 41)". The description's phrase "stated in the generality of its source" then holds for this folder as well.

## N01 — In the remark on the hypothesis in §0.3a (line 124), "flat over an open subscheme of Spec ℤ" says less than is true

The closure in X of an integral curve of X_ℚ is integral and dominates Spec ℤ, hence is flat over all of Spec ℤ, and every prime gives a special fibre of the same degree. "Flat over Spec ℤ" would do.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.3a, d = 1 | X = Spec ℤ, L̄ = O(c), c = 1, 0, −1 | vol^ = 1, 0, 0; L̄¹ = 1, 0, −1 | 1 ≥ 1, 0 ≥ 0, 0 ≥ −1; strict only at c = −1 (not nef) | none |
| §0.3a, d = 2 | X = ℙ¹_ℤ, L = O, ‖1‖ = e^(−c), c > 0 | ĥ⁰(m) ≈ mc, so vol^ = lim 2mc/m² = 0; L̄² = 0 | 0 ≥ 0, sharp | none |
| §0.3a against the source | moriwaki-2009 Corollary 6.4 (line 2467), Theorem 6.2 (line 2413), Example 6.1 (2) (line 2395), Conventions 6 (line 185) | same d = dim X, smooth metric, nef on each geometric fibre, c₁ semipositive; vol ≥ deg; big if deg > 0; no normality or generic smoothness | match | none |
| §0.3a generality | d = 2, L_ℚ nef, L not nef on a closed fibre | Corollary 6.3 (line 2461) gives the inequality; §0.3a's hypothesis excludes it | narrower than the source | C02 |
| Remark: closed fibres suffice | ℙ¹_ℤ, O(a); C ⊂ X_ℚ with closure C̄ | degree a on each ℙ¹_𝔽ₚ and on ℙ¹_ℚ; deg_L C = deg_L [C̄_p] ≥ 0 | holds; C̄ is flat over all of Spec ℤ | N01 |
| Route: L + εA ample | ℙ¹_ℤ, L = O, A = O(1) | O(ε) ample on every fibre, hence on X; in general Kleiman on fibres, then openness | holds; inputs not on the *Needs:* line | C01 |
| Route: counting step | moriwaki-2009 Prop. 2.1 (1) (line 707) | ĥ⁰ ≥ χ̂ − log 6·rk (ĥ¹ ≥ 0), rk H⁰(nL) = O(n^(d−1)), so the error is o(n^d) | holds; not in §5.17d | C01 |
| Route: ε → 0 | ℙ¹_ℤ, L̄ = (O, e^(−c)), Ā = Ō(1) | (L̄+εĀ)² = 2εc + ε²Ā² → 0 = L̄²; vol^(L̄+εĀ) → 0 by §0.3 (3) | consistent | none |
| Route: §5.17d on singular X | HeightsRationalPointsAndObstructions §5.17d at the head (line 2955) | ample L, semipositive metric, exponent d+1 there for relative dimension d = absolute d here; singular models treated | supported | none |
| Locator: Theorem 4.2, p. 27 | moriwaki-2009 line 1614; used at line 2459 | birational invariance of the lim sup of ĥ⁰(mL+N)/m^d; the proof of 6.2 ends with it and the projection formula | match | none |
| Check of §0.3a | O(c) on Spec ℤ, c = 2, −1 | vol^ = 2, 0 against L̄¹ = 2, −1; O(−1) semipositive and not nef (Check of §0.1, line 73) | true; separates ≥ from = | none |
| Supplier ids | HeightsRationalPointsAndObstructions §§5.17a, 5.17d | on `main` lines 2737, 2808; at the head lines 2778, 2955 | resolved | none |

- Source locators checked against the text: 7 in moriwaki-2009 (arXiv math/0612269v2): Theorem 6.2, Example 6.1 (1), (2), Corollaries 6.3 and 6.4, Theorem 4.2, Proposition 2.1 (1).
- Seeded sample: none of its fifteen targets lies in the changed text or depends on it; none was checked in this review of the change.
- Previous review: no finding to repair; its two small corrections and one format note are unchanged in the text and are repeated above.
- Cross-roadmap citations resolved: HeightsRationalPointsAndObstructions §§5.17a, 5.17d (`main` and head); AlgebraicModuliForArithmeticGeometryPartII §§1.7, 3.8 (`main` and head); HeightsForLogSingularMetrics 4.3a cites §0.3a as its general form.
- Record: the 14 layers of the README at the merge base are all present with their titles; the diff has no deletion.
- Dependency check: `depcheck: 132 roadmaps, 1476 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives no output; the file is unchanged and states no theorem, and §0.3a is not statable at the pins (no arithmetic volume or hermitian line bundle carrier there).
- Automatic checks: all passed. The pull request's text: no sentence about this folder contradicts the head (the description covers it under the sections added to existing roadmaps); see C02 for "generality of its source".

Overlap check: read HeightsRationalPointsAndObstructionsPartII, ArithmeticDynamics, GrossZagierAndArithmeticHeightsPartII (open), TropicalAndBerkovichArithmetic, ArakelovGeometryAndAbelianHeights, HeightsRationalPointsAndObstructions (on `main`); nothing shared for the changed object: Moriwaki's inequality is owned here, and HeightsForLogSingularMetrics 4.3a cites it.

Source independence: changed passages only; 4 passages (statement, hypothesis remark, route, Check) compared with 1 source (moriwaki-2009 §6, Theorem 4.2, Proposition 2.1), none shared beyond the forced opening "Let X be a projective arithmetic variety of dimension d", and the route differs from the source's proof; largest share yuan-2026, 85 keyed citations (next yuan-zhang-2025, 56); contents not compared, the diff adds no layer.

Research link: Layers 10–13 prove Yuan's bigness of the admissible canonical bundle and its comparison with the Faltings height (yuan-2026), on the adelic line bundles of Yuan–Zhang (yuan-zhang-2025); the new §0.3a is Moriwaki's bigness criterion (moriwaki-2009, Corollary 6.4). Rests on the README summary and moriwaki-2009 §6.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
