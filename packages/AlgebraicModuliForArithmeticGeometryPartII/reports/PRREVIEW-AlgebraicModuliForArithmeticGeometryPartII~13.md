# Review of AlgebraicModuliForArithmeticGeometryPartII (pull request #3027 at 6ff5aef)

**Verdict:** accepted

**Summary.** An incremental re-review of the 11 lines changed since `f3b4ab1`, with a check of the pull request's title and description against this head. The three changed locator paragraphs (§§6.3, 6.6, 6.7) now say that Kollár states the theorems for proper varieties and why the roadmap states them for projective ones; each sentence agrees with the source at its locator, so the previous review's one small correction is repaired. The description's sentences on this folder agree with the head. No finding, no small correction, no format note; one question of placement remains for the human reviewers.

## Previous findings

- The previous report (of `f3b4ab1`) had no finding (no R-numbered point).
- C01 of that report — repaired: §6.3 "there for normal proper `X` … stated here for projective `X`, which is all that 6.6–6.8 apply it to"; §6.6 "although 5.8 itself is stated for proper pairs"; §6.7 "Theorem 5.9 is stated for proper pairs".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §6.3 Nadel vanishing, with its new locator clause | ℙ¹, Δ = c·p, 0 ≤ c < 1, L = O(m); m = −2, c = 0; source hypothesis | degree of L − (K+Δ) is `m + 2 − c > 0` iff m ≥ −1, and `H¹(O(m)) = 0` iff m ≥ −1; m = −2: degree 0, `h¹(O(−2)) = 1`. KOL97 line 538: "normal and proper" | holds; the clause states the source's hypothesis correctly; blow-ups of projective X are projective | none |
| §6.3 as applied by §§6.6–6.8 | hypotheses of the three consumers | §6.6 line 1441 "projective klt pair"; §6.7 line 1466 "projective klt pair"; §6.8 line 1513 "smooth projective variety over ℂ" | "all that 6.6–6.8 apply it to" is true | none |
| §6.6 global generation, new clause on projectivity | ℙ², N = O(a), c₁ = c₂ = 3; a proper non-projective X | `1/3 + 2/3 = 1`; lines need a > 3, a² > 9: a ≥ 4, M = O(a−3) generated. KOL97 line 1555 "projective klt pair"; line 1593 writes N = A + E with A ample, impossible when X carries no ample divisor; line 1349 "proper klt pair" | the three source claims of the clause hold | none |
| §6.7 two-point separation, new clause | ℙ¹, N = O(a); a = 2 | `2^{1/1}·1/c₁ ≤ 1` gives c₁ ≥ 2, a > 2: a ≥ 3, O(a−2) separates iff a ≥ 3; a = 2: O(0) does not. KOL97 line 1362 "proper klt pair"; line 1572 "Notation as above" after the projective 6.4 | holds; clause correct | none |

The rows for the untouched statements stand as in the previous review, of `f3b4ab1`.

- Source locators checked against the text: 6 (KOL97 lines 538, 1349, 1362, 1555, 1572, 1588–1593). No target of the seeded sample lies in the changed passages (§6.4 is untouched).
- Library declarations: none touched; `Suggested.lean` is unchanged since `f3b4ab1`, as are the pins.
- Cross-roadmap citations resolved for the changed passages and their route: AlgebraicModuliForArithmeticGeometry §§9.4, 9.7, 9.10 (`algebraicAdjointVanishing`, for smooth projective varieties, README line 10133) and §9.12 at this head; MultiplierIdealsOfPairsAndPointSeparation 9.12 cites §6.3 in its *Corollary of:* line (README line 202) at this head.
- Automatic checks: all passed. Dependency check: `depcheck: 1 roadmaps, 6 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 19 `sorry` warnings and nothing else.
- Outside the folder: every changed file lies in one of the pull request's own roadmap folders or family index files.
- Title and description: the title names the family-wide change. The sentences on this folder (the theory of pairs as a new Layer 6 of Part II, built on the first part's §§9.4, 9.7, 9.10; §1.6a and §1.7a; CyclotomicClassGroupsAndStickelberger §4.3 as a new supplier; "None of Part II's sections is removed or renumbered"; the three theorems and two definitions `Suggested.lean` receives; §6.8 as the complex case of MultiplierIdealsOfPairsAndPointSeparation 9.12c; the first part citing Part II nowhere) each agree with the head: 0 headings and 0 declarations removed, 13 headings and 5 declarations added, and the first part's README has no occurrence of this roadmap's name.

Overlap check: read MultiplierIdealsOfPairsAndPointSeparation (this head), DynamicalDegreesOfRationalMaps and SchemeAndStackFoundations (main), as in the previous review; the change adds no object. Owners unchanged: pairs, multiplier ideals of pairs, Nadel vanishing and point separation are owned here and cited by MultiplierIdealsOfPairsAndPointSeparation; the numerical intersection by CyclotomicClassGroupsAndStickelberger §4.3.

Source independence: changed passages only; 3 passages compared with 1 source (KOL97, at lines 538, 1349–1362, 1555–1593), none shared: each is a locator note in the roadmap's own words; largest share in Layer 6 KOL97 (SCH23 over the whole README); the diff adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: Layer 6 states Kollár's algebraic form (KOL97, 1997, §§5–7) of the Angehrn–Siu theorem (AS95, 1995) on separation of points by adjoint bundles, an effective result toward Fujita's conjecture; Layers 2–4 give Schröer's descent (SCH23, 2023); Layers 1 and 5 feed the mixed-characteristic MMP (BMP23, HW23). Rests on the README and AS95 line 60.

## Not verifiable

- LAZ04-II 9.4.17, cited beside KOL97 in the changed paragraph of §6.3: settled as uncertified, not read; KOL97 Theorem 2.16 (line 538) carries the statement.

Automatic checks set aside as false positives: none.

## Source issues

- **Gap** in KOL97 at Lemma 6.6.1, p. 35 (KOL97 lines 1588–1593), used for Theorems 5.8–5.9: the source takes a proper scheme, but its proof writes N as ample plus effective. It should assume X projective, as Theorem 6.4 does; affects nothing.

## For the human reviewers

- Layer 6 (pairs, multiplier ideals of pairs, Angehrn–Siu over ℂ; README from line 1154) joins a roadmap titled for numerical Picard groups and contraction descent; the family roadmap that held this material now cites it here. Whether it belongs here or in a further Part is yours to decide.
