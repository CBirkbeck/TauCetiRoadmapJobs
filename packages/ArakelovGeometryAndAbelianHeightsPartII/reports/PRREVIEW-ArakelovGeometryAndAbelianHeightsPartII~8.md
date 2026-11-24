# Review of ArakelovGeometryAndAbelianHeightsPartII (pull request #3027 at 4a2d22f)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 14 changed lines since `592bdb1`. The review checked the new §0.3a (Moriwaki's inequality) and its reference entry against Moriwaki's paper: the statement, its hypotheses and its locators agree with Corollary 6.4, and with Theorem 6.2 through Example 6.1 (2). The remark that nefness on the closed fibres is enough holds, and so do the route through the arithmetic Hilbert–Samuel formula of HeightsRationalPointsAndObstructions §5.17d and the Check. There is no finding. There are two small corrections: the *Needs:* line leaves out two inputs the route uses, and the source's surface case, which needs nefness on the generic fibre only, is not stated. There is also one format note. Nothing is left for a human to decide.

## C01 — The *Needs:* line of §0.3a (line 132) leaves out two inputs that its route uses

An implementer who follows the route reaches two steps that nothing on the line supplies.

- **"L + εA is ample" for L nef on every fibre.** This is Kleiman's "nef ⊗ ample is ample" on each fibre, then the fact that a line bundle ample on one fibre of a proper morphism is ample over a neighbourhood of that point. AlgebraicModuliForArithmeticGeometryPartII states both on `main`, in §1.7 (ii) and §3.8 (i).
- **"ĥ⁰ ≥ χ̂ + o(n^d)".** This is the lattice-point lower bound ĥ⁰ ≥ χ̂ − c·rank (Gillet–Soulé; moriwaki-2009, Proposition 2.1 (1), p. 13). HeightsRationalPointsAndObstructions §5.17d does not state it. There, the Minkowski input only produces one small section (`positiveIntersection_strictSmallSection`), so "(with its Minkowski input)" points at a different statement.

The smallest repair has two parts:

- Add AlgebraicModuliForArithmeticGeometryPartII §§1.7 (ii), 3.8 (i) to this line, to the layer's Dependencies and to the supplier contracts. That roadmap is on `main` and earlier in the merge order, so no upward edge arises.
- Either name an owner for the counting bound, or state it as a route input with the locator above.

## C02 — §0.3a states Moriwaki's theorem only in its fibre-nef form, which is narrower than the source for arithmetic surfaces

For d = 2 the source needs only that L_ℚ be nef on the generic fibre: moriwaki-2009, Corollary 6.3, p. 41, from Theorem 6.2 with Example 6.1 (1). By Remark 6.6 (1), p. 42, this case contains the Hodge index theorem of Faltings and Hriljac. The hypothesis in the README, "nef on every geometric fibre", also demands nefness on the closed fibres in dimension 2, so the general library would lack that case. One sentence would carry it, for instance "For d = 2 it suffices that L_ℚ be nef on X_ℚ (moriwaki-2009, Corollary 6.3, p. 41)". If the narrower scope in the title is deliberate, a clause saying that the surface case is stronger would also do. Either way, the description's claim that each added section is "stated in the generality of its source" then holds for this folder too.

## N01 — In the remark on the hypothesis in §0.3a (line 124), "flat over an open subscheme of Spec ℤ" says less than is true

The closure of an integral curve of X_ℚ is integral and dominates Spec ℤ, so it is flat over the whole of Spec ℤ. Every prime then gives a special fibre of the same degree. "Flat over Spec ℤ" would do.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.3a, d = 1 | X = Spec ℤ, L̄ = O(c), c = 1, 0, −1 | vol^ = 1, 0, 0; L̄¹ = 1, 0, −1 | 1 ≥ 1, 0 ≥ 0, 0 ≥ −1; equality fails only at c = −1 (not nef) | none |
| §0.3a, d = 2 | X = ℙ¹_ℤ, L = O, ‖1‖ = e^(−c), c > 0 | ĥ⁰(m) = log(2⌊e^(mc)⌋+1) ≈ mc, so vol^ = lim 2mc/m² = 0; L̄² = 0 (c₁ = 0) | 0 ≥ 0, sharp | none |
| §0.3a against the source | moriwaki-2009 Corollary 6.4 (line 2467), Conventions 6 (line 187) | Same d, smooth metric, nef on every geometric fibre, c₁ semipositive; vol ≥ deg; big if deg > 0; no normality or generic smoothness assumed | match | none |
| §0.3a generality | d = 2, L_ℚ nef, L not nef on a closed fibre | Corollary 6.3 (line 2461) gives the inequality; §0.3a's hypothesis excludes this case | narrower than the source | C02 |
| Remark: closed fibres suffice | ℙ¹_ℤ, O(a) | degree a on every ℙ¹_𝔽ₚ and on ℙ¹_ℚ; for C ⊂ X_ℚ, deg_L C = deg_L [C̄_p] ≥ 0 | holds; the closure is flat over all of Spec ℤ | N01 |
| Route: L + εA ample | ℙ¹_ℤ, L = O, A = O(1) | O(ε) is ample on every fibre and on X; in general AMAG II §1.7 (ii) then §3.8 (i) | holds; the input is not on the *Needs:* line | C01 |
| Route: ε → 0 | ℙ¹_ℤ, L̄ = O with constant metric e^(−c), Ā = Ō(1) | (L̄+εĀ)² = 2εc + ε²Ā² → 0 = L̄²; vol^(L̄+εĀ) → vol^(L̄) = 0 by §0.3 (3) | consistent | none |
| Route: counting step | moriwaki-2009 Prop. 2.1 (1) (line 707) | ĥ⁰ ≥ χ̂ − rk·log 6 with rk H⁰(nL) = O(n^(d−1)), hence o(n^d) | holds; not stated in §5.17d | C01 |
| Route: §5.17d on singular X | HRPO §5.17d at the head (line 2955) | resolves over K only and keeps vertical and Tor terms; d + 1 there is the absolute d here | supported | none |
| Locator: Theorem 4.2 | moriwaki-2009 line 1614, p. 27; use at line 2459 | birational invariance of lim sup ĥ⁰(mL+N)/m^d; the proof of Thm 6.2 cites it with the projection formula | match | none |
| Check of §0.3a | O(c) on Spec ℤ, c = 2, −1 | vol^ = 2, 0 against L̄¹ = 2, −1; O(−1) semipositive and not nef (§0.1 Check) | true; separates ≥ from = | none |
| Supplier ids | HRPO §§5.17a, 5.17d | at merge base lines 2737, 2808; at head lines 2778, 2955; text unchanged | resolved | none |

- Source locators checked against the text: 7 in moriwaki-2009, read from arXiv math/0612269v2 (open repository): Theorem 6.2 and Example 6.1 (1), (2) on p. 40, Corollaries 6.3 and 6.4 on pp. 41–42, Theorem 4.2 on p. 27, Proposition 2.1 (1) on p. 13. The roadmap's source manifest does not yet record moriwaki-2009.
- Seeded sample: none of its fifteen targets lies in the changed text or depends on it, so none was checked in this review of the change.
- Library: the pinned Tau Ceti and Mathlib have no arithmetic volume or hermitian line bundle carrier (searched by object). Mathlib's Minkowski theorem (`MeasureTheory/Group/GeometryOfNumbers.lean`, line 63) gives existence of a lattice point, not the count.
- Cross-roadmap citations resolved: HRPO §§5.17a, 5.17d (merge base, `main` and head); AMAG II §§1.7, 3.8 (`main` and head); HeightsForLogSingularMetrics 4.3a cites §0.3a at the head.
- Dependency check: `depcheck: 132 roadmaps, 1476 edges, 0 problem(s)`.
- Elaboration: `lake env lean` of `Suggested.lean` gives no output and no error. The file is unchanged and states no theorem. §0.3a is not a headline statement and is not statable at the pins.
- Files changed: only README.md in this folder; outside it, only the folders named as the pull request's own.

Overlap check: read HeightsRationalPointsAndObstructionsPartII, GrossZagierAndArithmeticHeightsPartII and NeronModelsAndSemistableAbelianVarieties (open), and ArithmeticDynamics, TropicalAndBerkovichArithmetic, ArakelovGeometryAndAbelianHeights and HeightsRationalPointsAndObstructions (on `main`). Nothing is shared for the changed object, Moriwaki's inequality. Its only other statement, HeightsForLogSingularMetrics 4.3a (b), cites §0.3a as its general form, so this roadmap owns it.

Source independence: changed passages only. 4 passages (the statement, the hypothesis remark, the route, the Check) were compared with 1 source (moriwaki-2009 §6, Theorem 4.2, Proposition 2.1). The longest shared run is 9 words, the standard opening "Let X be a projective arithmetic variety of dimension d"; none copied, and the route differs from the source's proof. Largest share: yuan-2026, 85 of 218 keyed citations. Contents not compared, because the diff adds no layer.

Research link: Layers 10–13 prove Yuan's bigness of the admissible canonical bundle and its comparison with the Faltings height (yuan-2026). HeightsRationalPointsAndObstructionsPartII uses these for the uniform Bogomolov theorem of Gao–Ge–Kühne and Kühne. The new §0.3a is Moriwaki's bigness criterion (moriwaki-2009, Corollary 6.4). Rests on the README summary and moriwaki-2009 §6.

## Not verifiable

- none

Automatic checks set aside as false positives: the check for files outside the folder, run by hand without the list of this pull request's folders, lists 112 files, all in the other roadmap folders the pull request changes and owns.

## Source issues

- none

## For the human reviewers

- none
