# Review of HeightsRationalPointsAndObstructionsPartII (pull request #1821 at 4a579da)

**Verdict:** needs changes

Incremental re-review of the 12 README lines changed since 73d7cae (all in Layer 12), and of the pull request's title and description against this head.

## R01 (P3) — §12.3 is no longer a section, and §12.2 now carries two conflicting standing hypotheses

**Location:** `TauCetiRoadmap/HeightsRationalPointsAndObstructionsPartII/README.md` lines 2097–2116: "### 12.2 Uniform torsion and small-height counts … This section bounds … the torsion points (§12.2) and the points of small height (§12.3)" and "**12.3 Uniform Bogomolov for bielliptic genus-two curves.** There are B and b > 0 …".

**Claim:** The change turns the heading of §12.3 into a bold run-in paragraph inside §12.2. The headings now run 12.1, 12.2, 12.4; the new sentence, placed inside §12.2, cites "§12.2" as one half of itself and a "§12.3" that is not a section; and one `###` section now has two "Throughout this subsection" lines that contradict each other.

**Witness:** Line 2103: "Throughout this subsection, X bielliptic of genus 2 over ℂ"; line 2116, under the same heading: "Throughout this subsection, X bielliptic of genus 2 over ℚ̄". Stoll's curve: torsion count over ℂ is 34, the height count is defined only over ℚ̄.

**Repair:** Keep the source-free titles and give each theorem its own `### k.n` section again:

- line 2097: `### 12.2 Uniform Manin–Mumford for bielliptic genus-two curves`, followed directly by "There is a uniform B such that …";
- line 2114: `### 12.3 Uniform Bogomolov for bielliptic genus-two curves` on its own line, then a blank line, then "There are B and b > 0 such that …";
- move the new paragraph to directly under `## Layer 12: …` (before §12.1), reworded so that it cites sections that exist: "Sections 12.2 and 12.3 bound, uniformly in the curve and the Weierstrass base point, the torsion points and the points of small height on the Abel–Jacobi image of a bielliptic genus-two curve, both through the diagonal-lift model of §12.1; they are the worked bielliptic case of the general uniform theorems of §§3.6 and 3.5."

With that, each "Throughout this subsection" line again governs one statement (ℂ for §12.2, ℚ̄ for §12.3), and each section has one statement, its Checks and one Needs line.

## Previous findings

- none: the review of 73d7cae had no finding (its R01 of the round before was recorded there as repaired; §7.1 is untouched by this diff).

## Verified sound

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| §12.1 (sampled; heading retitled, statement unchanged) | Jacobi model y² = x⁶ − s₁x⁴ + s₂x² − 1; branch sets; Riemann–Hurwitz; kernel count | π₁ branches over {∞, r₁, r₂, r₃}, π₂ over {0, r₁, r₂, r₃}, r₁r₂r₃ = 1 so no rᵢ = 0: intersection 3. Degree-4 map, 5 branch values, two double points each: 2g − 2 = −8 + 10, g = 2. Six Weierstrass points in 3 pairs: 3 non-zero kernel classes, deg Φ = 4 | agrees with dky-2020 lines 2009–2016 (statement), 2019–2045 (proof) |
| §12.2 statement (heading and intro changed) | lifts per common x-value; another Weierstrass base point; Stoll's curve; lower bound | 4 lifts to E₁×E₂ times 4 preimages under Φ: 16, so B = 16·B₀ (dky-2020 line 2052). j_P(X) = j_Q(X) + [Q − P], [Q − P] 2-torsion: same torsion count. 6 ≤ 34 ≤ B | true as stated; source line 41–44, p. 950 |
| §12.3 statement (demoted to a paragraph) | height identity; torsion points; torsion translate | `ĥ_{L_X}`(x) = ĥ_{E₁}(Φ(x)₁) + ĥ_{E₂}(Φ(x)₂) = ½(ĥ_{t₁} + ĥ_{t₂}) on the common x-value (source lines 2069–2071). Torsion has height 0 ≤ b, so B ≥ 34 on Stoll's curve over ℚ̄, consistent with §12.2. Symmetric L_X: ĥ(x + t) = ĥ(x) for t torsion | true as stated; base field ℚ̄, not the ℂ of the first "Throughout" line (R01) |
| New sentence, line 2099: "compared with the general uniform theorems of §§3.5–3.6" | resolve both citations and both Needs lines | §3.5 is the uniform Bogomolov theorem (line 642), §3.6 uniform Manin–Mumford for curves (line 658); §12.2 Needs §3.6 (line 2112), §12.3 Needs §3.5 (line 2125); for g = 2, §3.6 gives B = c(2) | citations resolve; the self-reference is R01 |
| §12.4 (heading retitled, statement unchanged) | order of a preimage under Φ | w ↦ Φ(w) of order ≥ N, ker Φ finite: ord(w) is a multiple of ord(Φ(w)) ≥ N | agrees with dky-2020 lines 2079–2091, p. 997 |

The rows for all untouched statements stand as in the previous review, of 73d7cae.

- Source locators checked against the text, 7 (dky-2020): Theorem 1.1 line 41 (p. 950); Remark 1.2 line 49 (p. 950); Theorem 1.10 line 192 (p. 953); Proposition 9.1 line 2009 (pp. 995–996); §9.3 line 2046 (p. 996); §9.4 line 2056 and Proposition 9.2 line 2079 (p. 997). All as the README states.
- Remark, untouched text: §12.1 gives "pp. 994–996" for Proposition 9.1 and §§9.1–9.2; §9.1 starts on p. 995 (line 1992), p. 994 holds only the section's introduction.
- Seeded sample: of the fifteen targets only §12.1 lies in the changed passages (row above); the others are untouched since 73d7cae.
- Cross-roadmap citations: the diff adds none; no other roadmap, open or on main, cites a §12.x of this roadmap (searched all heads for the roadmap's name: two hits, ArakelovGeometryAndAbelianHeightsPartII `README.md` lines 17 and 2128, neither citing Layer 12).
- Gate, run at 4a579da: every counter 0, `OK`; the worker's run adds `build=0`. No file changed outside the folder (`git diff --stat origin/main...HEAD` outside it is empty).
- Dependency check: `depcheck: 242 roadmaps, 2246 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/HeightsRationalPointsAndObstructionsPartII/Suggested.lean` exits 0 with three "declaration uses `sorry`" warnings (lines 61, 79, 100) and nothing else; the file is unchanged since 73d7cae, and its three elaborated signatures were read against the description's account of them.
- Pull request text: title and description read against this head, 14 claims checked (adds a roadmap; thirteen layers = Layers 0–12; parent stops at its Layer 5; level-four Siegel moduli; five curve-family maps; three headlines with a genus-only constant, B quantified before the field in all three signatures; one Tau Ceti import and no roadmap import; folder of three files; residue characteristics, characteristics 2 and 3, inseparable isogenies; Yuan–Zhang route for family equidistribution in §3.2; imported cycle heights, Betti maps and twice-theta bundle; the bielliptic family as a worked case). None contradicted, and the Layer 12 change alters nothing they state.

Overlap check: read ArakelovGeometryAndAbelianHeightsPartII, HeightsRationalPointsAndObstructions, ArithmeticDynamics; nothing shared (ArithmeticDynamics `README.md` line 93 places the bielliptic genus-2 application outside itself and supplies only the elliptic-quotient dynamics; ArakelovGeometryAndAbelianHeightsPartII line 17 assigns uniform Bogomolov and small-point counts to this roadmap).

Source independence: changed passages only; 5 passages compared with 1 source (dky-2020), none shared (the one added paragraph and the three retitled headings have no counterpart in the source; the statements are unchanged); the arrangement was not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- Unchanged from the previous reports: the explicit constants of remond-2000-vojta Théorème 1.2 (display formulas lost in the extraction) and the uncertified remond-2000-decompte and david-philippon-2007; the diff touches none of them.

## Source issues

- none

## For the human reviewers

- none
