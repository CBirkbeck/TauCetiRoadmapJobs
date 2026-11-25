# Review of ArakelovGeometryAndAbelianHeightsPartII (pull request #3027 at 7633b39)

**Verdict:** accepted

**Summary.** An incremental re-review of the 12 lines changed since `e7914b5`, with the pull request's title and description read against this head. The change takes up the two small corrections of the previous review in §0.3a: the route now names its inputs, and the case d = 2 of Moriwaki's inequality is stated with nefness on the generic fibre only; both were read against Moriwaki's paper and against AlgebraicModuliForArithmeticGeometryPartII §§1.7 and 3.8, and hold. There is no finding. One small correction (the description does not mention this folder's new section or its new supplier) and one format note carried from the previous review; neither blocks. Nothing is left for a human to decide.

## C01 — The description does not say that this roadmap gains §0.3a and a new supplier

A reader of the description cannot tell that this pull request revises ArakelovGeometryAndAbelianHeightsPartII: the roadmap is not named in it. Against `main` the folder gains §0.3a (Moriwaki's inequality `vol^(L̄) ≥ L̄^d` for a hermitian line bundle with smooth semipositive metric, nef on every geometric fibre, and for d = 2 nef on the generic fibre only) and a supplier it did not have, AlgebraicModuliForArithmeticGeometryPartII (§1.7 (ii) and §3.8 (i), in the route of §0.3a; README lines 126, 132, 140 and 2131). HeightsForLogSingularMetrics 4.3a cites §0.3a in its `*Corollary of:*` line. The description states exactly this kind of fact for the other general roadmaps ("CharacterSumsOverFiniteFields gains §3.1a …, with SieveMethodsAndPrimePatterns §0.10 … as a new supplier").

A sentence in part 1 would do, for instance: "ArakelovGeometryAndAbelianHeightsPartII gains §0.3a (Moriwaki's inequality `vol^(L̄) ≥ L̄^d` for hermitian line bundles with smooth semipositive metric that are nef on every geometric fibre, and on arithmetic surfaces nef on the generic fibre; Moriwaki 2009, Corollaries 6.3 and 6.4), with AlgebraicModuliForArithmeticGeometryPartII §§1.7 and 3.8 as a new supplier; HeightsForLogSingularMetrics 4.3a is a corollary of it. No section is removed or renumbered and its `Suggested.lean` is unchanged."

## N01 — In the remark on the hypothesis in §0.3a (line 124), "flat over an open subscheme of Spec ℤ" says less than is true

The closure in X of an integral curve of X_ℚ is integral and dominates Spec ℤ, hence is flat over all of Spec ℤ, and every prime gives a special fibre of the same degree. "Flat over Spec ℤ" would do.

## Previous findings

The previous review, of `e7914b5`, had no finding (no R-numbered point). Its small corrections and format note:

- C01 — repaired: the route derives "L + εA is ample" from AlgebraicModuliForArithmeticGeometryPartII §1.7 (ii) and §3.8 (i) and cites moriwaki-2009, Proposition 2.1 (1), p. 13; the *Needs:* line, the Dependencies and a supplier contract name them.
- C02 — repaired: "For d = 2 it suffices that L_ℚ be nef on X_ℚ, with no condition on the closed fibres (moriwaki-2009, Theorem 6.2 with Example 6.1 (1), stated as Corollary 6.3, p. 41)", with its route.
- N01 — not repaired: "flat over an open subscheme of Spec ℤ" stands; written again as N01.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.3a, new sentence for d = 2 | X = blow-up of ℙ¹_ℤ at a closed point over p, fibre F′ + E; L = O(F′), ‖1‖ = e^(−c) | L_ℚ trivial (nef); L·F′ = −1; L̄² = F′²·log p + 0 = −log p; H⁰(mL)_ℚ of rank 1, ĥ⁰ = O(m), vol^ = 0 | 0 ≥ −log p; a case the fibre-nef hypothesis excludes | none |
| §0.3a, d = 2 against the source | moriwaki-2009 Corollary 6.3 (line 2461, p. 41), Example 6.1 (1) (line 2393), Theorem 6.2 (line 2413) | arithmetic surface, L nef on the generic fibre, c₁ semipositive; vol ≥ deg | match | none |
| Route: "L + εA need not be ample" for d = 2 | same X, L = O(F′), A ample | (L + εA)·F′ = −1 + ε(A·F′) < 0 for small ε | true; §5.17d (ample L) does not apply | none |
| Route: d = 2 through Claim 6.2.1 | moriwaki-2009 lines 2429–2459, pp. 40–41 | χ̂(H⁰) + log#H² − log#H¹ = deg·m²/2 + o(m²); H² = 0 (fibres of dimension ≤ 1 over an affine base); log#H¹ ≥ 0, so χ̂(H⁰) ≥ deg·m²/2 + o(m²); Gromov and Prop. 2.1 (3) to sup norms; Theorem 4.2 back to X | match | none |
| Route: L + εA ample, fibre-nef case | ℙ¹_ℤ, L = O, A = O(1) | O(ε) nef + ample on each geometric fibre, ample on each fibre (field extension), relatively ample near each point, ample on X over the affine Spec ℤ | holds; §1.7 (ii), the API bullet of §1.7 and §3.8 (i) state each step | none |
| Route: counting step | moriwaki-2009 Proposition 2.1 (1) (line 707, p. 13) | −log 6·rk ≤ ĥ⁰ − ĥ¹ − χ̂ and ĥ¹ ≥ 0 give ĥ⁰ ≥ χ̂ − log 6·rk; rk H⁰(nL) = O(n^(d−1)) = o(n^d) | match | none |
| *Needs:* locators | Conventions 6 (line 187, p. 5); Theorem 4.2 (line 1614, p. 27) | generic resolution defined there; birational invariance of the volume | match | none |
| Supplier contract | AlgebraicModuliForArithmeticGeometryPartII §1.7 (ii), §1.7 field-extension bullet, §3.8 (i) | head lines 346, 368, 793; `main` lines 333, 353, 762: "If H is ample and L is nef, then L ⊗ H is ample"; ample iff ample after K/k; openness over a Noetherian base | resolved on `main` and at the head | none |
| Description against the head | search of the live description for the roadmap's name, "Moriwaki", "0.3a" | no occurrence of this roadmap; §0.3a and the new supplier unstated | C01 | C01 |

The rows for untouched statements stand as in the previous review, of `e7914b5`.

- Source locators checked against the text: 7 in moriwaki-2009 (Corollary 6.3, Example 6.1 (1), Theorem 6.2, Claim 6.2.1, Proposition 2.1 (1), Conventions 6, Theorem 4.2), with their pages.
- Seeded sample: of its fifteen targets only §0.3a lies in the changed text; it was checked in full as above. The other fourteen are untouched and were not re-read.
- Cross-roadmap citations resolved: AlgebraicModuliForArithmeticGeometryPartII §§1.7, 3.8 (on `main` and at the head; the roadmap is on `main` and earlier in the merge order, and does not cite this roadmap); HeightsForLogSingularMetrics 4.3a cites §0.3a.
- Record: no layer or item removed; against `main` the folder has 19 insertions and 1 deletion (the Dependencies line of Layer 0, extended).
- Dependency check: `depcheck: 122 roadmaps, 1398 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives no output (exit 0); the file is unchanged since `e7914b5`, and §0.3a is not statable at the pins (no arithmetic volume or hermitian line bundle carrier).
- Automatic checks: all passed.
- The pull request's text: title and live description read against the head; no sentence about this folder is contradicted (the general sentence "each a theorem published … stated in the generality of its source" now holds for §0.3a with the d = 2 case); what is unstated is C01.

Overlap check: read HeightsRationalPointsAndObstructionsPartII, GrossZagierAndArithmeticHeightsPartII (open), ArithmeticDynamics, TropicalAndBerkovichArithmetic, ArakelovGeometryAndAbelianHeights (on `main`); nothing shared for the changed object: Moriwaki's inequality is owned here, Kleiman's theorem and openness of ampleness by AlgebraicModuliForArithmeticGeometryPartII, cited.

Source independence: changed passages only; 3 passages (the d = 2 sentence, the route, the supplier contract) compared with 1 source (moriwaki-2009 §6, Proposition 2.1, Conventions 6), none shared; largest share yuan-2026, 85 keyed citations (next yuan-zhang-2025, 56); contents not compared, the diff adds no layer.

Research link: Layers 10–13 prove Yuan's bigness of the admissible canonical bundle and its comparison with the Faltings height (yuan-2026), on the adelic line bundles of Yuan–Zhang (yuan-zhang-2025); the new §0.3a is Moriwaki's bigness criterion (moriwaki-2009, Corollary 6.4). Rests on the README summary and moriwaki-2009 §6.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
