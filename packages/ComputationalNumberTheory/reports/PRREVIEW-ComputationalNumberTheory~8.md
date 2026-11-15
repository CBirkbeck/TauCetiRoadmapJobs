# Review of ComputationalNumberTheory (pull request #1408 at a901968)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `a901968`; this round read the pull request's title and description against the head. No finding.

## Previous findings

- R01 — repaired: the summary block now reads "the top layers reach complete root isolation, explicit error bounds for Dirichlet and cusp-form L-values, and a Turing comparison fixing the zero count"; "Platt's finite-conductor records belong to ExplicitZetaBounds and are not restated."
- R02 — repaired: the prose now lists "the Turing comparison that fixes the zero count of a primitive Dirichlet L-function up to a given height (§4.21a)" and says Platt's records "are owned by ExplicitZetaBounds §§0.3 and 0.4b; this roadmap cites them by name and states none of them."

## Verified sound

| Statement | Instances and values | Result |
| --- | --- | --- |
| §4.21a Turing comparison (description: "fixes the zero count of a primitive Dirichlet L-function up to a given height") | `M = 0`, `U < 1`: `Nχ(T) ∈ ℕ`, `0 ≤ Nχ(T) ≤ U < 1` gives `0`. `M = 3`, `U = 3.9`: `3 ≤ N < 4` gives `3`; `U = 4.2` leaves `{3, 4}`, hypothesis `U < M + 1` fails | Statement is for primitive `χ`, `T > 0`; description agrees |
| §4.21a argument-count identity, conductor one | `q = 1`, `T = 10 < 14.13`: no strip zero, completed function has simple poles at `0`, `1`: contour integral `= 0 − 2`; formula `N − 2δ = 0 − 2` | Both sides `−2` |
| §4.21a Turing integral bound (Platt line 321) | `q = 1`, `t₀ + h = 51`: `1.8397 + 0.1242·log(51/2π) = 2.0998`; `q = 400 000`: `3.7019`. Source: `t₀ > 50`, `h > 0`, constants `1.8397`, `0.1242` | README equals the source's Theorem 3.3 |
| ExplicitZetaBounds §§0.3, 0.4b (description: "absence of real zeros … modulus at most 400 000 … owned by ExplicitZetaBounds") | Its open head: §0.3 at README 533, `LFunction_ne_zero_of_platt` for `q ≤ 400 000`, `0 < s < 1`; `PlattRecord` `2 ≤ q ≤ 400 000`; `PlattCentralRecord` `2 ≤ q ≤ 2·10⁶` (§0.4b, README 679–681) | Description, `README.md:120–123` and supplier agree |
| §§1.26–1.26a (description: "every complete DVR, with the prime-power case a specialization") | `p = 7`, `X² − 2`, `k = 2`: `10² = 100 ≡ 2 (mod 49)`, lift `X ∓ 10` of `X ∓ 3`. `p = 2`, `X²`: `X·X` and `(X+2)² = X² + 4X + 4 ≡ X² (mod 4)`, two pairs, coprimality fails | `README.md:1048–1049` states the specialization |

Rows for all other statements stand as in the previous review, of `a901968`.

- Description against the head, sentence by sentence: the summary block's headline list equals `README.md:5–15` (§§0.15, 1.3–1.6, 1.9, 1.14, 1.16, 1.26–1.26a, 2.6, 2.20, 3.3–3.4, 3.19–3.20, 3.26, 4.19, 4.19a, 4.20a); "factorization and integral-basis existence" are §§1.21, 1.24, 1.28, 2.8; Gram inequalities §§4.29–4.34; folder contents `README.md`, `Suggested.lean`, `metadata.toml`; the pull request adds the folder (3381 insertions, 0 deletions, nothing removed or renumbered).
- "27 `sorry` warnings and no error": elaboration of `Suggested.lean` at the pins rerun: exit 0, 27 `declaration uses sorry`, no other warning. Imports: `Mathlib` and two `TauCeti.*` modules, no roadmap module.
- Suppliers: the six of the `depends-on` block are exactly the README's contract subsections not on main (AlgebraicModularFormsAndSerreWeights, EffectiveDiophantineMethods, EllipticLegendreCharacterInterfaces, ExplicitNumberFields, ExplicitZetaBounds, HeightsRationalPointsAndObstructions); ModularForms, EllipticCurves, ZerosOfLFunctions, NewtonPolygons, ClassicalArithmeticCompletion, IntegralLattices, FormalLaurentPuiseux are on main, GlobalNumberFields under `Completed/`.
- Dependency check with the moved order: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate at `a901968` (worker): every scanner 0, `depcheck=0`, `build=0`, `outside-folder=0`, OK. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Cross-roadmap citations resolved at open heads this round (11): ExplicitZetaBounds §§0.2, 0.3, 0.4, 0.4b with its four names (`Suggested.lean` 121–142 there); EffectiveDiophantineMethods §§0.1–0.3, 0.9, 1.7–1.8, 3.1–3.3, 3.17–3.18; HeightsRationalPointsAndObstructions §1.17; EllipticLegendreCharacterInterfaces Layer 5 (its README line 14 names §3.17 here as consumer). Source locators checked: 1 (Platt line 321).
- Declared gap `gap:local-two-quotient` (`README.md:492`, supplier HeightsRationalPointsAndObstructions §1.17, "Local doubling indices" at its head): unchanged, one object, named supplier.
- `citations.md` leads stand as resolved in the previous review: R15.2 and R15.3 are AlgebraicModularFormsAndSerreWeights' own layer identifiers; the three Lean names are two ClassicalArithmeticCompletion names and this file's `PrattTree.validList`.

Overlap check: read EffectiveDiophantineMethods, EffectiveClassNumbers, EllipticLegendreCharacterInterfaces, ClassicalArithmeticCompletion, AnalyticNumberTheoryPartI, ModularForms (third list empty); p-adic records, selected roots, local images, saturation and ellipsoids: owner EffectiveDiophantineMethods, comparisons only here (`README.md:128–136`); character-sum point count: owner EllipticLegendreCharacterInterfaces Layer 5; Smith and Hermite forms, relation lattices: owner ClassicalArithmeticCompletion; nothing shared with the other three.

Source independence: changed passages only; 0 passages compared with 0 sources (the folder did not change); the largest share and the comparison of contents stand as in the earlier full review; no layer added, removed or reordered.

## Not verifiable

- The fifteen seeded targets (0.12, 0.15, 1.1, 1.2, 1.9, 1.12, 1.13, 1.13a, 2.22, 3.3, 3.14, 3.24, 4.17a, 4.25, 4.31) lie in unchanged text and were not opened at their locators this round.
- "after 0 independent review rounds and 2 red-team rounds on the job board" in the description: the board's history is not part of the head; not checked.

## Source issues

- none

## For the human reviewers

- Licence: `PrattNotes` (`README.md:2753`) is a set of undated author lecture notes on a personal page, and `Sutherland` (`README.md:2769`) and `MilneANT` (`README.md:2765`) are course notes; none is a refereed publication.
- Licence: `Platt` is cited as the arXiv preprint 1305.3087 (`README.md:2749`) with line and page locators into that version, not the published article.
