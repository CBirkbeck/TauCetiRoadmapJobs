# Review of AdelicImagesAndModularCurves (pull request #1727 at e4f956a)

**Verdict:** accepted

Incremental re-review of 0 changed lines since e4f956a; this round reads the pull request's title and description against the head. No finding.

## Previous findings

- none: the previous review, of this same head, was an acceptance with no finding.

## Verified sound

**The pull request's text against the head.** Every sentence of the title and of the description's prose (the `roadmap-summary` block included) was set beside `README.md` and `Suggested.lean`; none is contradicted and no change is left unstated (the pull request adds the folder; nothing is removed or renumbered).

| Statement of the description | Instances | Values on each side | Result |
|---|---|---|---|
| “8 layers and 46 milestones” | `README.md` headings | `## Layer 0` … `## Layer 7` = 8; numbered `### k.n` headings = 46 | agrees |
| `Suggested.lean` contents as listed | declarations at head | 44 declarations, 25 sorried theorems; `pslIndex_eq_index_pm` (strong approximation), `closure_range_mapGL` (density), `mazur_torsion`, `mazur_torsion_exists`, `kenku_isogenyClassSize`, `card_GSp4_zmod` present | agrees |
| “all fifteen groups” | `ℤ/N`, `N ∈ {1,…,10,12}`; `ℤ/2 × ℤ/2n`, `n ≤ 4` | `11 + 4 = 15` | agrees |
| Docstring “names the headlines that are not statable” | `Suggested.lean:36–55` | frame for the image in `GL₂(Ẑ)`; `X_H`; genus-two Jacobian; Mitchell: all four named with the missing carrier | agrees |
| `N = 27`: “degrees 3 and 2, `σ³ = 9τ² + 27τ + 27`” | `τ = 9η(9z)³/η(z)³`, `σ = 3η(3z)⁴/(η(z)³η(9z))`, exact series to `q⁵⁹` | `τ = 9q + 27q² + 81q³`, `σ = 3 + 9q + 27q² + 54q³`; `σ³ − 9τ² − 27τ − 27 = 0`; pole orders at `0`: 3, 2 | holds |
| `N = 21`: “`σ² = τ⁴ − 6τ³ − 17τ² − 6τ + 1`”, `σ` Fricke anti-invariant | `τ`, `u`, `u∘W₂₁` as in 6.4, exact series to `q⁵⁵` | `τ = q⁻¹ + 2 + 5q + 8q²`; `σ = u − u∘W = q⁻² + q⁻¹ − 5 − 21q − 61q²`; difference of the two sides `= 0` | holds |
| `gap:x1-16-rational-points` point list | `u = 0, 1, −1` in `u(u² + 1)(1 + 2u − u²)` | `0, 4, 4`: `(0, 0)`, `(±1, ±2)`; odd degree 5, one point at infinity | agrees with `README.md:549–556` |
| `gap:x1-18-rational-points` point list | `x = 0, −1` in the sextic | `1, 1`: `(0, ±1)`, `(−1, ±1)`; leading coefficient `1`, two points at infinity | agrees with `README.md:557–562` |
| “proof of `mazur_torsion` rests on the last three gaps … and on no other” | `README.md:2774–2776`, `2785–2790` | gaps named there: `x1-16`, `x1-18`, `nebentypus-rank-zero` at `N = 16, 18, 25`; `abelian-surface-open-image` only in 7.2 | agrees |
| Four supplier gaps, suppliers and needs | `README.md:529–562` | four slugs, same suppliers (ArithmeticGaloisRepresentations Layer 7; EllipticCurveModularityPartII §6.0e; EffectiveDiophantineMethods Layer 3 twice), same needs | agrees |
| Ownership paragraph | `README.md:350–527` | NoncongruenceModularForms §§2.1–2.3, 2.5; ArithmeticGaloisRepresentations §§3.3, 6.1, 6.4, 7.3; NoncommutativeAndEquivariantIwasawa §4.0; AlgebraicModularFormsAndSerreWeights §§4.1–4.3; ClassicalSerreModularity R27.6; FiniteGroupInvariants 7.3; ModularCurves 5A; ModularCurvesPartII §8.2: each in the contracts as described | agrees |
| “CanonicalModelsAndGonality leaves them to this roadmap … its §7.6” | CanonicalModelsAndGonality at its open head, README l.162–171, l.1804–1806 | modular-curve dictionary and “the behaviour of isolation under the `j`-map” assigned to this roadmap | agrees |
| Summary block: consumers | `README.md:3149–3156`; ModularIwasawaMainConjectures l.21, l.171; KatoEulerSystems l.96, l.457 | §2.2 lifting used in its §3.6; §4.3 surjectivity imported | agrees |
| Commensurability sentence (3.3, 4.5) | `README.md:1573–1580`, `2005–2017` | without CM every pair; with CM some pair iff the orders agree, no pair otherwise | agrees |
| `metadata.toml`: “arXiv topic `math.NT`” | file at head | `topic = "math.NT"` | agrees |

The rows for the roadmap's statements stand as in the previous review, of e4f956a: no statement changed.

- Gate, rerun at this head: every count `0`, `OK` (the targeted build is the worker's, `build=0`).
- Dependency check: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- `lake env lean` on `TauCetiRoadmap/AdelicImagesAndModularCurves/Suggested.lean`: 25 `declaration uses 'sorry'` warnings, nothing else. No `set_option`, no `lemma`.
- Signatures: the one flagged lead is unchanged (`adelicTateModule` omits `[CharZero F] [IsSepClosed K]`, which its carrier does not need; `finrank_adelicTateModule` carries both).
- Nothing outside the folder changes: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AdelicImagesAndModularCurves'` is empty.
- Cross-roadmap citations named by the description, resolved this round at the open heads or on main (12): NoncongruenceModularForms §§2.1–2.3, 2.5 (main, l.562–690); ArithmeticGaloisRepresentations §§3.3, 6.1, 6.4, 7.3; NoncommutativeAndEquivariantIwasawa `elliptic_nonCM_openImage`; EllipticCurveModularityImaginaryQuadratic `nonCM_elliptic_large_residual_primes`; AlgebraicModularFormsAndSerreWeights §§4.1–4.3; ClassicalSerreModularity `R27.6/full-classical-serre-theorem`; FiniteGroupInvariants 7.3; ModularCurvesPartII §§8.2, 9.3; EisensteinIdealAndRationalTorsion `all_prime_torsion`; CanonicalModelsAndGonality §§1.6, 2.1, 2.5, 7.6, 9.1; ArithmeticDynamics `gap:x1-16-rational-points`.
- Source sample: no seeded target falls in a changed passage (the folder did not change); the locators stand as verified in the previous reviews.
- Remark (generated block, outside the check of the text): the `depends-on` block lists four siblings and not the other suppliers still in open pull requests; the `merge-order` block lists them.

Overlap check: read CanonicalModelsAndGonality, SatoTateGroups, NoncongruenceModularForms; nothing shared (each assigns the open subgroups of `GL₂(Ẑ)`, the modular-curve dictionary and the genus-two Galois images to this roadmap; `scratch/overlaps.md` lists no dropped id, no second copy and no conflicting head).

Source independence: changed passages only; 0 passages changed, so 0 compared with 0 sources; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Carried unchanged from the previous review: Fricke 1922; Prasad–Rajan 2003; Serre, *Abelian ℓ-adic representations*; Mitchell 1914; Bray–Holt–Roney-Dougal 2013; the further unfetched references listed there; `kubert1976` (waived); the LMFDB data of worked examples 5–9.
- “One of 23 roadmaps for the mathematics behind the LMFDB” (description): the count concerns other pull requests and was not checked.

## Source issues

- none

## For the human reviewers

- none
