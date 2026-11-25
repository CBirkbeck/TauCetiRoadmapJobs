# Review of AlgebraicModuliForArithmeticGeometryPartII (pull request #3027 at 59b3c66)

**Verdict:** accepted

**Summary.** An incremental re-review: the folder has 0 changed lines since `6ff5aef`, so this round checks the pull request's title and description against this head. Every sentence of the description about this roadmap agrees with the head (Layer 6 added, §1.6a and §1.7a added, CyclotomicClassGroupsAndStickelberger §4.3 as a new supplier, no section removed or renumbered, three theorems and two definitions added to `Suggested.lean`, §6.8 as the complex case of MultiplierIdealsOfPairsAndPointSeparation 9.12c). No finding, no small correction, no format note; one question of placement remains for the human reviewers.

## Previous findings

- The previous report (of `6ff5aef`) had no finding (no R-numbered point), no small correction and no format note.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §6.8 point separation (`PointSeparation.angehrnSiuPointSeparation`), which the description cites as the complex case of 9.12c | ℙ¹, L = O(a), ℓ = 2; ℙ², ℓ = 1; n = 0; ℓ = 0; the constant | ℙ¹: threshold `½·1·4 = 2`, `χ(O(a)) − χ(O) = a > 2` iff a ≥ 3; O(a−2) separates 2 points iff a ≥ 3. ℙ²: threshold 3, a ≥ 4, O(a−3) generated. `Σ_{d=1}^{n}(d+ℓ−1) = ½n(n+2ℓ−1)` | holds; n = 0 and ℓ = 0 are vacuous or trivial; the subtraction in Lean is in ℚ (value 0 at n = 0) | none |
| §1.7a asymptotic Riemann–Roch, which the description names with its new supplier | ℙ¹, A = O(1); ℙ², A = O(1) | ℙ¹: coefficient of t₁ in `t₁+1` is 1, `h⁰(O(m)) = m+1`. ℙ²: coefficient of t₁t₂ in `(t+1)(t+2)/2` is 1, `h⁰ = m²/2 + O(m)`, and `1/2! = ½` | holds | none |

The rows for the untouched statements stand as in the previous review, of `6ff5aef`.

- Folder against `6ff5aef`: the diff of the folder is empty; `README.md` and `Suggested.lean` are byte-identical to the head the previous review read.
- Source locators checked against the text: 1 (AS95 line 60, Theorem 0.3: `ℓ` points, the bound `½n(n + 2ℓ − 1) + κ` on `(L^d · W)^{1/d}`). No target of the seeded sample lies in a changed passage, there being none.
- Library declarations: none touched; the pins are unchanged.
- Cross-roadmap citations resolved for what the description says of this folder: CyclotomicClassGroupsAndStickelberger §4.3 (on main, README line 725: the numerical intersection as a coefficient of the Euler-characteristic polynomial; absent from this roadmap's README at the merge base, so a new supplier, and earlier in the merge order); AlgebraicModuliForArithmeticGeometry §§9.4, 9.7, 9.10 and 9.12 at this head, whose README has no occurrence of this roadmap's name; MultiplierIdealsOfPairsAndPointSeparation 9.12c at this head (README lines 451–498) names §6.8 as its complex case.
- Automatic checks: all passed. Dependency check: `depcheck: 122 roadmaps, 1392 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 19 `sorry` warnings and nothing else.
- Outside the folder: every file changed since `6ff5aef` lies in one of the pull request's own roadmap folders or the family's index.
- Title and description, read in full: the title names the family-wide change. The sentences on this folder each agree with the head: "a new Layer 6 of AlgebraicModuliForArithmeticGeometryPartII" resting on the first part's §§9.4, 9.7, 9.10; "Part II also gains §1.6a … and §1.7a"; "a new supplier of Part II"; "None of Part II's sections is removed or renumbered" (0 headings removed, 13 added; 0 layers lost or retitled, 1 added); the three theorems and two definitions `Suggested.lean` receives (0 declarations removed, 5 added, the five named); "The additions do not mention the family or the formal proof" (no occurrence in this README).

Overlap check: read MultiplierIdealsOfPairsAndPointSeparation (this head), DynamicalDegreesOfRationalMaps and SchemeAndStackFoundations (main), as in the previous review; nothing changed. Owners: pairs, multiplier ideals of pairs, Nadel vanishing and point separation are owned here and cited by MultiplierIdealsOfPairsAndPointSeparation; the numerical intersection by CyclotomicClassGroupsAndStickelberger §4.3.

Source independence: changed passages only; the folder has no changed passage, so 0 passages were compared; largest share in Layer 6 KOL97 (SCH23 over the whole README), as in the previous review; no layer was added, removed or reordered since `6ff5aef`, so the arrangement was not compared again.

Research link: Layer 6 states Kollár's algebraic form (KOL97, 1997, §§5–7) of the Angehrn–Siu theorem (AS95, 1995) on separation of points by adjoint bundles, an effective result toward Fujita's conjecture; Layers 2–4 give Schröer's descent (SCH23, 2023); Layers 1 and 5 feed the mixed-characteristic MMP (BMP23, HW23). Rests on the README and AS95 line 60.

## Not verifiable

- LAZ04-II 9.4.17, cited beside KOL97 in §6.3: settled as uncertified, not read; KOL97 Theorem 2.16 carries the statement.

Automatic checks set aside as false positives: none.

## Source issues

- **Gap** in KOL97 at Lemma 6.6.1, p. 35 (KOL97 lines 1588–1593), used for Theorems 5.8–5.9: the source takes a proper scheme, but its proof writes N as ample plus effective. It should assume X projective, as Theorem 6.4 does; affects nothing.

## For the human reviewers

- Layer 6 (pairs, multiplier ideals of pairs, Angehrn–Siu over ℂ; README from line 1154) joins a roadmap titled for numerical Picard groups and contraction descent; the family roadmap that held this material now cites it here. Whether it belongs here or in a further Part is yours to decide.
- The two recorded decisions for this pull request name no section of this folder; nothing here was settled by them. The family's citation of §6.8 for the complex case of 9.12c was checked: §6.8 states it.
