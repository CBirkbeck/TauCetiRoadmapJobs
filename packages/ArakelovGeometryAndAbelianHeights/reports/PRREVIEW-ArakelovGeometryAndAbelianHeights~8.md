# Review of ArakelovGeometryAndAbelianHeights (pull request #1000 at 5fc305b)

**Verdict:** accepted

No finding. Incremental re-review of 0 changed lines since `5fc305b`; this round reads the pull request's title and description against the head.

## Previous findings

- R01 — repaired: the description now reads "`Suggested.lean` states no theorem: its module docstring explains, layer by layer, why no headline theorem is statable" and "the targeted Lake build of `Suggested.lean` succeeds with no warning, since the file declares nothing".

## Verified sound

**Adversarial table: statements the description cites, with values computed at this head.**

| Statement (description → head) | Instances | Values computed | Result |
|---|---|---|---|
| "`Suggested.lean` states no theorem"; "build … succeeds with no warning" | `Suggested.lean` at `5fc305b` | 0 declarations (empty namespace, lines 38–40); `lake env lean` prints nothing, exit 0; the one `sorry` token is in the docstring (line 8). | holds |
| "names the missing carriers (hermitian arithmetic bundles, Green functions …; Néron models …; semi-abelian families and integral Siegel compactifications; stable Faltings height and polarized moduli)" | docstring bullets, lines 11–32 | Layer 1: hermitian bundles, Green functions, metrized heights. Layers 2–3: Néron models, Faltings metric. Layer 5: semi-abelian families, Siegel compactifications. Layer 6: stable height, polarized moduli. | holds |
| "adds the roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" | folder listing; diff outside the folder | three files; the diff against `origin/main` outside the folder is empty; the folder is not on main. | holds |
| "Roadmaps on main are cited by name; everything else named in the README is a consumer" | every roadmap name in the README | 15 names: 3 on main (SchemeAndStackFoundations, DifferentialGeometry, ClassFieldTheory); 8 open suppliers, the 8 of the dependency list; 4 consumers (lines 1823–1827). | holds |
| "isogeny formula and half-log-degree bounds" → §4.4(ii), line 1222 | `d = pⁿ`, `#(O_K/𝔡_u) = p^k`; `[p]` on an elliptic curve over `ℚ`; `d = 1` | `m = 2k − [K:ℚ]n`, so `|m| ≤ [K:ℚ]n` for `0 ≤ k ≤ [K:ℚ]n`. `[p]`: `n = 2, k = 1, m = 0`, `Δh = 0`. `d = 1`: `0 ≤ 0`. | holds |
| §4.4(iii), line 1222 | `[p]` over `ℚ`; `k = 0`, `n = 1` over `ℚ` | `p²·p⁻² = 1`, `v_p = 0`. `k = 0`: value `p`, `v_p = 1 = [K:ℚ]·v_p(d)`, the extreme of the bound. | holds |
| "non-semistable-reduction checks" → §3.6, line 1098 | `A` semistable everywhere; `g = 1` | empty sum: `c(A, K′/K) ≥ 0`, consistent with `h(A/K) ≥ h_st(A)`. `#GL₂(ℤ/15ℤ) = 48·480 = 23040`. | holds |
| "On projective space the sup-metric degree equals Mathlib's `Height.logHeight`" → §1.14 | `(1,2)` over `ℚ` and over `ℚ(i)` | `log 2 = 0.6931` over `ℚ`; `2·log 2 = 1.3863` over `ℚ(i)` (relative, not absolute, height). | holds |
| "Compactifications live over Spec ℤ because ℤ[1/n] models miss level-one finite-place terms" → lines 161, 1387 | `g = 1`, `n = 3`, `j = 1/3` | `h(j) = log 3 = 1.0986`, all from `p = 3`, the prime `ℤ[1/3]` omits. | holds |

The rows of the previous reports, for the untouched statements, stand as in the previous review, of `5fc305b`.

- **Description against the head.** Title, summary block and the four prose paragraphs were read sentence by sentence against the README and `Suggested.lean`; no sentence is contradicted, and nothing is left unstated (new roadmap, 0 headings removed, 0 Lean declarations removed, suppliers as listed).
- **Gate.** The worker's gate and my own run on this head: every counter 0, ending `OK`.
- **Elaboration.** `lake env lean` on `Suggested.lean`: exit 0, no output. No declarations, so no `#check` comparison and no padding probe.
- **Dependency check** (`--movable`): `depcheck: 245 roadmaps, 2239 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Suppliers end at PELModuli (ORDER line 117) and PadicDifferentialEquationsAndRigidCohomology (122).
- **Citations and overlaps.** `citations.md` lists no unresolved cross-roadmap citation; its four Lean-name leads are supplier names of open roadmaps, resolved in the previous review of this same head. `overlaps.md`: no other pull request changes this roadmap, no dropped id, no second copy.
- **Seeded sample.** No sampled section lies in a changed passage (the folder has 0 changed lines).
- **Remarks (untouched text, as before).** Line 621 cites Faltings §3 Lemma 3, p. 356, for the point height, which the source defines on p. 354. Line 1464: "for the extension `ω_G`" is meant to read `ω̄_G`.

Overlap check: read the scopes of FaltingsFinitenessAndIsogenyTheorems, ArakelovGeometryAndAbelianHeightsPartII, FaltingsFinitenessAndIsogenyTheoremsPartII, HeightsRationalPointsAndObstructionsPartII, AbelianSchemesAndArithmeticModuli, HeightsAndUnits, DiophantineApproximationAndTranscendence and SubspaceTheorem. Shared objects: the Faltings metric, stable height, Zarhin's product, §2.0 and the Siegel compactifications are owned here and cited by section from both Faltings roadmaps and Part II; Euclidean and tuple heights are pinned Tau Ceti declarations that this roadmap and DiophantineApproximationAndTranscendence both cite; nothing else shared.

Source independence: changed passages only; the folder has 0 changed lines, so 0 passages were compared with 0 sources. The largest share of the locators is Deligne's, 36 of 162, as counted in the previous review; the arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- Faltings–Chai, *Degeneration of Abelian Varieties* (Springer, paywalled): supplies the §§5.0a–5.0b and §5.3 locators, unchanged lines, cited by locator alone.

## Source issues

- none

## For the human reviewers

- none
