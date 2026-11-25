# Review of AlgebraicModuliForArithmeticGeometryPartII (pull request #3027 at 7633b39)

**Verdict:** accepted

**Summary.** An incremental re-review: the folder has 0 changed lines since `59b3c66`, so this round checks the pull request's title and description against this head. Every sentence of the description that could be read and that speaks of this roadmap agrees with the head (pairs, multiplier ideals of pairs, Nadel vanishing and point separation added as Layer 6; §6.8 as the complex case of MultiplierIdealsOfPairsAndPointSeparation 9.12c; no mention of the family or the formal proof in the additions). No finding, no small correction, no format note; one question of placement remains for the human reviewers.

## Previous findings

- The previous report (of `59b3c66`) had no finding (no R-numbered point), no small correction and no format note.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §6.8 point separation (`PointSeparation.angehrnSiuPointSeparation`), which the description cites as the complex case of 9.12c | ℙ¹, L = O(a), ℓ = 2; ℙ², ℓ = 2; the constant; the `κ` form | ℙ¹: threshold `½·1·4 = 2`, a ≥ 3, O(a−2) separates 2 points iff a ≥ 3. ℙ²: threshold 5; lines give a ≥ 6, `a² > 25` gives a ≥ 6; O(a−3) separates. `Σ_{d=1}^{n}(d+ℓ−1) = ½n(n+1) + n(ℓ−1) = ½n(n+2ℓ−1)` | holds; the integer form equals the `κ` form with `κ = min_d (N_d^{1/d} − c)`, `N_d` the least integer above `c^d`, d = 1..n | none |
| Route of §6.8, the cost `d + ℓ − 1` | d = 1, ℓ = 2; d = 2, ℓ = 3 | `(1 + (ℓ−1)/d)^d`: 2 ≥ 2; 4 ≥ 3; in general ≥ 1 + (ℓ−1) = ℓ by Bernoulli | holds | none |

The rows for the untouched statements stand as in the previous review, of `59b3c66`.

- Folder against `59b3c66`: the diff of the folder is empty; `README.md` and `Suggested.lean` are identical to the head the previous review read.
- Source locators checked against the text: 1 (AS95 line 60, Theorem 0.3: `r` distinct points, the bound `½n(n + 2r − 1) + κ` on `(L^d · W)^{1/d}` for every irreducible subvariety of dimension 1 ≤ d ≤ n). No target of the seeded sample lies in a changed passage, there being none.
- Library declarations: none touched; the pins are unchanged.
- Cross-roadmap citations resolved for what the description says of this folder: 3. CyclotomicClassGroupsAndStickelberger §4.3 on main (README line 725: the numerical intersection as a coefficient of the Euler-characteristic polynomial); MultiplierIdealsOfPairsAndPointSeparation at this head (README lines 5, 7 and 40) names §6.8 as the form over `ℂ` of the wider 9.12c, and §§6.1–6.3, 6.5–6.7, 1.6a and 1.7a as the general theorems of its corollaries; this roadmap's §6.8 (README line 1511) states that theorem over `ℂ`.
- Automatic checks: all passed. Dependency check: `depcheck: 122 roadmaps, 1391 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 19 `sorry` warnings and nothing else; no `set_option`; imports are `import Mathlib` and nine `TauCeti.*` modules.
- Outside the folder: every file changed since `59b3c66` lies in the family RiemannHypothesisForDirichletLFunctions or in AnabelianGeometryAndNonabelianChabauty, both the pull request's own; against the base no file outside `TauCetiRoadmap/` is changed.
- Title and description: the title names the family-wide change. Sentences on this folder, each compared with the head: the list of largest additions names "pairs, multiplier ideals of pairs, Nadel vanishing, point separation for adjoint bundles" (Layer 6, §§6.1–6.8: 0 headings removed, 13 added; 0 layers lost or retitled, 1 added); the wider form of 9.12c "of which AlgebraicModuliForArithmeticGeometryPartII §6.8 states the complex case" (§6.8 is over `ℂ`); "The additions do not mention the family or the formal proof" (no occurrence of either in this README); this roadmap is not in the list of roadmaps said to gain no supplier, which agrees with its new supplier contract.

Overlap check: read MultiplierIdealsOfPairsAndPointSeparation (this head), DynamicalDegreesOfRationalMaps and SchemeAndStackFoundations (main), as in the previous review; nothing changed. Owners: pairs, multiplier ideals of pairs, Nadel vanishing and point separation are owned here and cited by MultiplierIdealsOfPairsAndPointSeparation; the numerical intersection by CyclotomicClassGroupsAndStickelberger §4.3.

Source independence: changed passages only; the folder has no changed passage, so 0 passages were compared; largest share in Layer 6 KOL97 (SCH23 over the whole README), as in the previous review; no layer was added, removed or reordered since `59b3c66`, so the arrangement was not compared again.

Research link: Layer 6 states Kollár's algebraic form (KOL97, 1997, §§5–7) of the Angehrn–Siu theorem (AS95, 1995) on separation of points by adjoint bundles, an effective result toward Fujita's conjecture; Layers 2–4 give Schröer's descent (SCH23, 2023); Layers 1 and 5 feed the mixed-characteristic MMP (BMP23, HW23). Rests on the README and AS95 line 60.

## Not verifiable

- The description as quoted for this review is cut after its account of BesselPoincareSeriesAndGramBounds. Whether the part after the cut still names §1.6a, §1.7a, the new supplier CyclotomicClassGroupsAndStickelberger §4.3 and the five declarations added to `Suggested.lean` (the previous review read those sentences) could not be checked.
- LAZ04-II 9.4.17, cited beside KOL97 in §6.3: settled as uncertified, not read; KOL97 Theorem 2.16 carries the statement.

Automatic checks set aside as false positives: none.

## Source issues

- **Gap** in KOL97 at Lemma 6.6.1, p. 35 (KOL97 lines 1588–1593), used for Theorems 5.8–5.9: the source takes a proper scheme, but its proof writes N as ample plus effective. It should assume X projective, as Theorem 6.4 does; affects nothing.

## For the human reviewers

- Layer 6 (pairs, multiplier ideals of pairs, Angehrn–Siu over ℂ; README from line 1154) joins a roadmap titled for numerical Picard groups and contraction descent; the family roadmap that held this material now cites it here. Whether it belongs here or in a further Part is yours to decide.
- The two recorded decisions for this pull request name no section of this folder; nothing here was settled by them. The family's citation of §6.8 for the complex case of 9.12c was checked: §6.8 states it.
