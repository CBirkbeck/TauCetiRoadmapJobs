# Review of AlgebraicCurves (pull request #1808 at beeacfb)

**Verdict:** needs changes

An incremental re-review of 0 changed lines since `6fc75e4`: `TauCetiRoadmap/AlgebraicCurves/README.md`
(2050 lines) and `Suggested.lean` (39 lines) are byte-identical to the head the previous two reviews read
(`git diff --stat 925dc8b0..HEAD -- TauCetiRoadmap/AlgebraicCurves` is empty). The pull request's only
change since `6fc75e4` is in `TauCetiRoadmap/CharacteristicClasses/`, one of its own folders, which this
roadmap neither cites nor is cited by. The pins are unchanged and equal to main's (Tau Ceti `2fd255d9`,
Mathlib `1b1ccf4b`), so every pinned name the README cites still resolves where the previous reports found
it (re-grepped below). Two findings remain, both P3: the previous review's R01, which this head leaves
exactly as it was, and a merge-order gap against #1854 that the overlap facts now surface for this folder.

## R01 (P3) — edits outside the pull request's roadmap folders (unrepaired R01 of the previous three reviews)

Location: `Completed/ArithmeticDirichletSeries/README.md` line 331 ("`LFunctions` consumes this
package and supplies its own character-specific continuation") and
`TauCetiRoadmap/SymplecticGeometry/README.md` line 77 ("sign adapters consumed by HeegaardFloer and
consumed by DGFloer").

Claim: the worker's gate at this head reports `outside-folder=2 FAIL` on exactly these two files, and
`git diff --stat origin/main...HEAD` restricted to paths outside the fifteen folders the pull request
names as its own lists the same two files (2 insertions, 2 deletions; re-run at `beeacfb`). Neither
folder is among the pull request's own, so the folder review cannot be accepted while the gate fails.
Both hunks are unchanged since the previous review.

Repair: revert both hunks from this pull request (or move them to the pull request that owns those
folders). If the SymplecticGeometry sentence is kept anywhere, write "consumed by" once.

## R02 (P3) — the #1854 head conflicts with this folder's README and neither description states an order

Location: this pull request's merge-order paragraph ("#1101 (ModularCurves) → #1807 (the other loops)
→ this pull request"), which does not name #1854; `TauCetiRoadmap/AlgebraicCurves/README.md` lines
1107–1111 (Abhyankar's lemma, the `e₁ ≠ 0` clause), 1506 (the Weierstrass-point counts), 1744–1745 and
1750 (the genus comparison and Serre duality on the model).

Claim: the overlap facts list #1854 as conflicting with this pull request in
`TauCetiRoadmap/AlgebraicCurves/README.md`. A three-way merge (base main, ours this head, theirs the
#1854 head as the roadmaps tool prints it) confirms four conflict hunks at exactly those lines: #1854's
copy of the folder is this head's README with four rewordings (the tameness hypothesis moved into the
general clause of Abhyankar's lemma, "for non-hyperelliptic `F`" before the `2g + 3` count, the full
hypothesis list of `genus_eq_genus_functionField`, and `K` as the divisor of a nonzero Weil
differential), so it is built on this pull request's text, not on main's. Yet #1854's description says
"#1808 is independent of this pull request", and this pull request's merge-order paragraph names only
#1101 and #1807. The previous review recorded the #1854 conflicts as lying only in `ClassifyingSpaces/`
and `RigidAnalyticGeometry/`; that is no longer what the heads show. (The #1807 conflict in this
folder's `Suggested.lean`, both heads rewriting the module header, is covered by the stated order
#1807 → this pull request, and #1807's one-line change to this folder's README merges cleanly.)

Repair: state the order in this pull request's merge-order paragraph, "this pull request → #1854 for
`AlgebraicCurves/`" (the direction its text already implies), and have #1854's description stop calling
#1808 independent; or have #1854 drop its `AlgebraicCurves/` hunks and resubmit the four rewordings
after this pull request merges. No change to the folder is needed: the four rewordings are precisions,
not corrections (checked against the pin below), and this head's text stays correct on its own.

## Previous findings

- R01 — not repaired: `Completed/ArithmeticDirichletSeries/README.md` 331 and
  `TauCetiRoadmap/SymplecticGeometry/README.md` 77 still differ from main (the same two hunks); the
  worker's gate still reports `outside-folder=2`. Written again as R01 above.

## Verified sound

**Gate and dependency check.** The worker's gate at this head (data): every scanner `0` except
`outside-folder=2` (R01); `build=0`. My own gate run reports `outside-folder=23` because it lacks the
pull request's list of its fifteen folders; subtracting the pull request's own folders leaves the
same two files. My own run of the dependency check at this head:

```
depcheck: 240 roadmaps, 2454 edges, 0 problem(s)
```

No UPWARD or CYCLE line; AlgebraicCurves is on main and so not in the merge order (not a defect). The
worker's citation resolver found no unresolved cross-roadmap citation or Lean name; the overlap facts
list no dropped id in either direction. The #1807 and #1854 overlaps are R02 above.

**Elaboration and Lean form.** `lake env lean` on `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` at
this head: no output, exit 0 (3.2 s). The file is `module`, `public import Mathlib`, one module
docstring, `@[expose] public section`, an empty `namespace TauCetiRoadmap.AlgebraicCurves`; a grep for
`set_option`, `lemma`, `sorry`, `example`, `#eval`, `#print`, `#synth` finds nothing. Nothing to probe
for padding; nothing stands in for a headline.

**The headline theorems, re-located at the pin.** The module docstring says every headline of the
roadmap is proved at the pin and cited at its layer; I re-grepped each name at Tau Ceti `2fd255d9`
(file under `TauCeti/`, line of the declaration):

- `isFunctionField_iff_trdeg_eq_one` `FieldTheory/FunctionField/Basic.lean` 155
- `Divisor.degree_principal` `FieldTheory/FunctionField/Divisor/ProductFormula.lean` 255
- `isRiemannRochDivisor_weilDifferentialDivisor` `FieldTheory/FunctionField/Differential/CanonicalDivisor.lean` 415
- `Divisor.two_mul_dim_le_degree_add_two` `FieldTheory/FunctionField/Consequences/Clifford.lean` 317
- `hurwitz_genus_formula` `FieldTheory/FunctionField/Different/Hurwitz.lean` 72
- `isDomain_tensorProduct_of_separating` `FieldTheory/Separable/Regular.lean` 142
- `genus_eq_genus_of_constantCompositum_eq_top` 273 and `genus_le_genus_of_constantCompositum_eq_top`
  243, `FieldTheory/FunctionField/ConstantExtension/Genus/Basic.lean`
- `finrank_kaehlerDifferential_eq_one_of_separating` `FieldTheory/FunctionField/Differential/Kaehler.lean` 140
- `finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero` `FieldTheory/FunctionField/Differential/Independence.lean` 386
- `genus_eq_of_sq_eq` `FieldTheory/FunctionField/Hyperelliptic/Genus/Basic.lean` 339
- `finite_algEquiv_of_two_le_genus` `FieldTheory/FunctionField/Automorphism/HigherGenus.lean` 124
- `natCard_le_eighty_four_mul_genus_sub_one` `FieldTheory/FunctionField/Automorphism/HurwitzBound.lean` 83
- `AlgebraicGeometry.twoChartModel` `AlgebraicGeometry/Curves/TwoChartModel/Basic.lean` 143
- `AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver` (instance)
  `AlgebraicGeometry/Curves/TwoChartModel/ProjectiveEmbedding.lean` 185
- `AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat` (`@[expose] noncomputable def`)
  `AlgebraicGeometry/Curves/TwoChartModel/AntiEquivalence.lean` 296
- `AlgebraicGeometry.twoChartModel.genus_eq_genus` `AlgebraicGeometry/Curves/TwoChartModel/Genus.lean` 60

18 names, 18 found, at the same lines as in the previous report. The 29 names the earlier diff
introduced were elaborated by `#check @` in review 22 against the same pin; the pin has not moved, so
those signatures stand.

**The three passages #1854 rewords, checked against the pin** (to see whether this head's wording
understates a hypothesis; it does not):

- Abhyankar's lemma, README 1105–1111: the sentence's hypothesis is "one of `Pᵢ∣P` tame in the full
  sense (separable residue and prime-to-characteristic `e`)". At the pin
  `Place.ramificationIdx_restrict_sup` (`Place/Extension/Abhyankar.lean` 142) carries
  `[PerfectField (P'.restrict k F).ResidueField]` and `h₁ : (e₁ : k) ≠ 0`, and
  `ramificationIdx_restrict_sup_of_isGalois` (line 79) carries residue separability and the same
  `e₁ ≠ 0`: both are forms of the tame statement the README makes. The pin's docstring (lines 75–78)
  gives the Artin–Schreier pair with `e = p²` where the README's table row gives `p² ≠ lcm(p, p)`.
- Weierstrass counts, README 1500–1507: the `2g + 3` bound is stated for non-hyperelliptic `F` in the
  prose (line 1500); `two_mul_genus_add_three_le_ncard_setOf_weierstrassWeight_ne_zero`
  (`Differential/Weierstrass/Count.lean` 149) is that statement.
- Genus comparison and Serre duality, README 1744–1750: `SchemeWeilDivisor.genus_eq_genus_functionField`
  (`WeilDivisor/Scheme/SerreDuality.lean` 245) assumes `[IsIntegral X]`, DVR stalks at codimension-one
  points, `[X.IsSeparated]`, the existence half of the valuative criterion, `coheight ≤ 1`,
  `[IsNoetherian X]`, `k(X)` a function field and `IsIntegrallyClosedIn k k(X)` (lines 94–110). A
  "curve over `k`" in 12A (README 1667–1668: integral, proper over `k`, of dimension 1) satisfies all
  but the DVR and exactness hypotheses, which the README states. `cohomologyOneDualEquivCohomologyZero`
  (line 122) takes `K` the scheme divisor corresponding to `(ω)` for a nonzero Weil differential `ω`
  (`hK`, lines 111–113); the README's "a divisor in the canonical class" is the same set, since the
  canonical class is `[(ω)]` (README 178, Stichtenoth Prop. 1.5.13) and `(ω) + (z) = (zω)`.

**Seeded sample.** None of the three sampled targets lies in a changed passage (there is none):
Riemann–Hurwitz (README 805–878), Portfolio ownership (29–34), Route decision (pinned) (36–56). Their
verification in the previous reports stands: the Hurwitz section of the pin (`Different/Hurwitz.lean`
66–76) carries `[FiniteDimensional F F'] [Algebra.IsSeparable F F'] [FiniteDimensional k k']
[Algebra.IsSeparable k k']` and the conclusion `[k' : k]·(2g' − 2) = [F' : F]·(2g − 2) + [k' : k]·deg Diff`,
which is what README 805–878 states; the ownership paragraph (29–34) names this roadmap sole owner of
general function-field places, Riemann–Roch, Riemann–Hurwitz, regular projective models and the
anti-equivalence, and the ownership search of the previous reports over main and the open heads
(the closest open roadmaps CanonicalModelsAndGonality, HyperellipticCurves, FunctionFieldArithmetic,
CurvesOverFiniteFields consume rather than restate) is not affected by a zero-line change; the route
decision (36–56) names the function-field-first route after Stichtenoth, which the pinned names above
realise.

**Adversarial pass.** No statement changed, so every row is carried from the previous report
(review 25, which carried them from reviews 22 and 20), with its values:

| statement | instance | left | right | result |
|---|---|---|---|---|
| Hurwitz genus formula | `y² = f(x)`, `deg f = 2g + 1` odd, char `≠ 2`, over `k(x)`: `2g' − 2 = 2(−2) + deg Diff` | `2g − 2` | `−4 + (2g + 2)` (the `2g + 1` finite branch places and `∞`, each `d = 1`) | holds (review 22) |
| Hurwitz, tameness iff | Artin–Schreier `y^p − y = x` over `𝔽_p(x)`, only `∞` ramifies, `e = p`, `d = 2(p − 1)` | `2g − 2 = −2p + 2(p − 1) = −2`, `g = 0` | `∑(e − 1) = p − 1 ≠ d` | wild: the `iff` fails exactly when some `p ∣ e` (review 22) |
| infinitely many places | `𝔽₂(x)`: `∞` and the monic irreducibles, `1, 1, 2, 3, 6` in degrees `1…5` | at least one in every degree | `Infinite` | holds (review 22) |
| class-group bridge, singleton | `y² = x³ − x` over `ℚ`, `R = ℚ[x, y]`, non-integral set `{P∞}` | `ker π = ⟨[P∞]⟩`, `deg n[P∞] = n` | `Cl⁰ ≅ ClassGroup R` | holds; with `R = ℚ[x, 1/x, y]` the set is `{P∞, P_(0,0)}` and `[P_(0,0)] − [P∞]` is nonzero 2-torsion in `ker π ∩ Cl⁰`: the singleton hypothesis is load-bearing (review 22) |
| genus-one ladder | genus 1, `D = 2[0] − [Q]`; `[0]`; `0` | `ℓ = 1; 1; 1` | `deg = 1; 1; 0` | `0 < deg D` load-bearing (review 22) |
| residue theorem, abstract | `k(x)`, `η_P(z) = res_P(z dx)`, `z = 1/x` | `η_{P₀} = 1`, `η_{P∞} = −1`, others `0` | `∑ᶠ = 0` | holds (review 22) |
| Hilbert's formula | `y² − y = x³` over `𝔽₂` at `∞`: `G₀ = … = G₃ = ℤ/2`, `G₄ = 1` | `∑(|G_i| − 1) = 4` | `d = 4` | holds; tame `y² = x`: `1 = e − 1` (review 22) |
| Abhyankar | `k(x^{1/6})`, `E₁ = k(√x)`, `E₂ = k(x^{1/3})` over `(x)` | `e = 6` | `lcm(2, 3) = 6` | holds; `E₂ = k(√(x(x−1)))`: `2 = lcm(2, 2) ≠ 4`; `p`-Artin–Schreier pair: `p² ≠ lcm(p, p)`, tameness load-bearing (review 22; the pin's docstring gives the same pair) |
| unramified / split compositum (`↔`) | `ℚ(x)`, `E₁ = ℚ(√x)`, `E₂ = ℚ(√(x−1))` at `(x−2)` and `(x)`; `E₂ = ℚ(√(x+3))` at `(x−1)` and `(x−2)` | `e = 1`; `e = 2`; four rational places; `T² − 2` irreducible | both directions | holds (review 22) |
| exact constants from a rational place | `E₁ = ℚ(√x)`, `E₂ = ℚ(√(−x))` | constants `ℚ(i)` | no rational place splits in both | hypothesis load-bearing (review 22) |
| genus 2 ⇒ hyperelliptic | `𝔽₂`, `y² + y = x⁵`, `g = 2`; `y² = x⁵ − 1`, char `∉ {2, 5}` | index-2 separable subfield `k(x)` | `IsHyperellipticFunctionField` | holds (review 22) |
| plane-curve genus | `𝔽₃`, `X⁴ + Y⁴ + Z⁴`, `d = 4` | `g = 3` | `(d−1)(d−2)/2 = 3` via a constant extension since `3 < d + 1` | holds; `𝔽₂`, `X⁴ + Y⁴ + Z⁴ = (X + Y + Z)⁴`: all partials `0`, nonsingularity load-bearing (review 22) |
| rigidity | genus 1, `σ = [−1]` fixes the four 2-torsion points, `4 < 5` | `σ ≠ 1` | bound not met | consistent (review 22) |
| Clifford | `ℙ¹`: `D = n[∞]`, `n ≥ 0` | `2(n + 1)` | `n + 2` | `≤` holds, equality only at `n = 0` (review 20) |
| Riemann–Roch on `ℙ¹` | `D = n[∞]`, `K = −2[∞]` | `ℓ(D) − ℓ(K − D) = (n + 1) − 0` for `n ≥ −1` | `n + 1 − 0` | holds, including `n = −1`, `n = −2` (`0 − 1 = −1`) (review 20) |
| hyperelliptic genus `genus_eq_of_sq_eq` | `y² = x³ − x`, `y² = x⁵ − 1`, `y² = x⁶ − 1` | `1, 2, 2` | `⌊(deg f − 1)/2⌋` | holds (review 20) |
| Hurwitz bound | `g = 2`: `84` vs `|Aut| ≤ 48` (`y² = x⁵ − x`, `GL₂(𝔽₃)`); `g = 3` Klein quartic `168` | `84(g − 1)` | `84; 168` | holds, sharp at `g = 3` (review 20) |
| constant extension, genus drop | `y² = x^p − t` over `𝔽_p(t)`, `p ≠ 2`; `y² = x³ + t` over `𝔽₂(t)` | `(p − 1)/2; 1` | `0; 0` after `k^{1/p}` | separability load-bearing in `genus_eq_genus_of_constantCompositum_eq_top`; `≤` in `genus_le_…` (review 20) |
| `isDomain_tensorProduct_of_separating` | `k = 𝔽_p(t)`, `F = k(t^{1/p})`, `k' = k^{1/p}` | `F ⊗_k k'` has nilpotents | excluded by `IsIntegrallyClosedIn k F` plus separating | load-bearing (review 20) |
| finiteness of `Aut`, `g ≥ 2` | `g = 0`: `PGL₂(k)` infinite over infinite `k`; `g = 1`: translations | infinite | `2 ≤ g` load-bearing | holds (review 20) |
| Serre duality on the model, `K` | `ℙ¹`, `ω = dx`, `(ω) = −2[∞]`, `D = n[∞]` | `h¹(𝒪(n[∞])) = ℓ(−2[∞] − n[∞]) = max(−n − 1, 0)` | `h¹ = 0` for `n ≥ −1`, `1` at `n = −2` | holds; `K' = (ω) + (z)` gives the same `h⁰` (this round) |

**README shape and policy.** Unchanged since the previous round: the worker's text scanners all read
`0` at this head (no LaTeX, no process words, no pull-request numbers, no local paths, no round labels,
no long fences, no stray files).

## Not verifiable

- H. Stichtenoth, *Algebraic Function Fields and Codes* (GTM 254): no legal electronic copy (the
  sources cache has no text with this title). The README's locators into it were checked in the
  previous rounds against the pinned declarations whose docstrings cite the same numbers (for this
  round, `ramificationIdx_restrict_sup` cites Theorem 3.9.1 and `hurwitz_genus_formula` Theorem 3.4.13)
  and against the computed instances above.
- W. Fulton, *Algebraic Curves*: no legal source found by the sources service; the pin's
  `genus_eq_of_isHomogeneous` docstring cites its Section 8.3.
- The roadmap's board package has no `sources.toml`, so no cached text is recorded for it.

## Source issues

- none
