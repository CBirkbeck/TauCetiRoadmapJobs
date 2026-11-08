# Review of AlgebraicCurves (pull request #1808 at d487de8)

**Verdict:** needs changes

An incremental re-review of 20 changed lines since `beeacfb`, all in
`TauCetiRoadmap/AlgebraicCurves/README.md` (12 insertions, 8 deletions; `Suggested.lean` unchanged,
39 lines). The change applies the four rewordings the previous review found in #1854's copy of this
folder (Abhyankar's tameness clause, "for non-hyperelliptic `F`", the hypothesis list of the genus
comparison, `K` as the divisor of a nonzero Weil differential). Each is checked against the pin below
and is correct; the previous R02 is repaired by it. One finding remains, the previous R01, which this
head leaves exactly as it was: the worker's gate still fails on two files outside the pull request's
folders.

## R01 (P3) — edits outside the pull request's roadmap folders (unrepaired R01 of the previous four reviews)

Location: `Completed/ArithmeticDirichletSeries/README.md` line 331 ("`LFunctions` consumes this
package and supplies its own character-specific continuation") and
`TauCetiRoadmap/SymplecticGeometry/README.md` line 77 ("sign adapters consumed by HeegaardFloer and
consumed by DGFloer").

Claim: the worker's gate at this head reports `outside-folder=2 FAIL` on exactly these two files, and
`git diff --stat origin/main...HEAD` restricted to paths outside the fifteen folders the pull request
names as its own lists the same two files (2 insertions, 2 deletions; re-run at `d487de8`). Neither
folder is among the pull request's own, so the folder review cannot be accepted while the gate fails.
Both hunks are unchanged since the previous review.

Repair: revert both hunks from this pull request (or move them to the pull request that owns those
folders). If the SymplecticGeometry sentence is kept anywhere, write "consumed by" once.

## Previous findings

- R01 — not repaired: `Completed/ArithmeticDirichletSeries/README.md` 331 and
  `TauCetiRoadmap/SymplecticGeometry/README.md` 77 still differ from main (the same two hunks); the
  worker's gate still reports `outside-folder=2`. Written again as R01 above.
- R02 — repaired: this head's README is byte-identical to #1854's copy of the folder (`cmp` on the
  two files after stripping the tool's banner line), so a three-way merge against main reports no
  conflict for either #1854 or #1807; the overlap facts at this head no longer list this folder among
  #1854's conflicts. No order needs stating for this folder.

## Verified sound

**Gate and dependency check.** The worker's gate at this head (data): every scanner `0` except
`outside-folder=2` (R01); `build=0`. My own run of the dependency check at this head:

```
depcheck: 245 roadmaps, 2491 edges, 0 problem(s)
```

No UPWARD or CYCLE line; AlgebraicCurves is on main and so not in the merge order (not a defect). The
worker's citation resolver found no unresolved cross-roadmap citation or Lean name; the overlap facts
list no dropped id in either direction. The pins are unchanged (Tau Ceti `2fd255d9`, Mathlib
`1b1ccf4b`).

**Elaboration and Lean form.** `lake env lean` on `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` at
this head: no output, exit 0 (2.8 s). The file is unchanged since `925dc8b`: `module`,
`public import Mathlib`, one module docstring, `@[expose] public section`, an empty
`namespace TauCetiRoadmap.AlgebraicCurves`; no `set_option`, `lemma`, `sorry`, `example`, `#eval`,
`#print`, `#synth`. Nothing to probe for padding; nothing stands in for a headline.

**The four changed passages, each opened at the pin** (`TauCeti/` paths, Tau Ceti `2fd255d9`):

- README 1105–1111, Abhyankar's lemma, "pinned, with the tameness hypothesis `e₁ ≠ 0` in `k`, as"
  both forms: `Place.ramificationIdx_restrict_sup_of_isGalois`
  (`FieldTheory/FunctionField/Place/Extension/Abhyankar.lean` 79–80) carries
  `h₁ : (ramificationIdx F (Q.restrict k E₁) : k) ≠ 0` under `[IsGalois F F']` (66) and residue
  separability (67); `Place.ramificationIdx_restrict_sup` (142–145) carries the same `h₁` under
  `[Algebra.IsSeparable F F']` (131) and `[PerfectField (P'.restrict k F).ResidueField]` (143). The
  sentence now attributes `e₁ ≠ 0` to both, which is what the pin says; the old wording attached it
  to the Galois form only. The separable form also takes `hF : IsFunctionField k F`, the layer's
  standing hypothesis.
- README 1506–1508, "and, for non-hyperelliptic `F`,
  `two_mul_genus_add_three_le_ncard_setOf_weierstrassWeight_ne_zero`":
  `FieldTheory/FunctionField/Differential/Weierstrass/Count.lean` 149–154 has
  `(hhyp : ¬ IsHyperellipticFunctionField k F)` with `[IsAlgClosed k]` (55), `hex`, `hgaps`,
  `hg : 2 ≤ genus k F`, matching the prose on line 1500 and the "pinned over algebraically closed `k`
  with exact constants and gaps pairwise distinct in `k`, with `g ≥ 2`" clause. The three other count
  names are at lines 69, 82 and 126 of the same file with the same hypotheses (minus `hhyp`).
- README 1744–1749, `SchemeWeilDivisor.genus_eq_genus_functionField` "for an integral separated
  Noetherian scheme over `k` of coheight at most one satisfying the existence half of the valuative
  criterion, with DVR codimension-one local rings, `k(X)` a function field and `k` exact in `k(X)`":
  `AlgebraicGeometry/WeilDivisor/Scheme/SerreDuality.lean` 94–98 (`[IsIntegral X]`, DVR stalks at
  `CodimensionOnePoint X`, `[X.IsSeparated]`, `hex : ValuativeCriterion.Existence`, `hdim : coheight ≤ 1`),
  193 (`[IsNoetherian X]`, `hF : IsFunctionField k X.functionField`), 241–245 (`include hex hdim hF hk`,
  `hk : IsIntegrallyClosedIn k X.functionField`). Eight hypotheses in the README, eight at the pin.
- README 1753–1755, `cohomologyOneDualEquivCohomologyZero` "for `K` the divisor on `X` of a nonzero
  Weil differential of `k(X)`, with `k` exact in `k(X)`": the same file 108–113 has
  `hω : ω ≠ 0` for `ω : Module.Dual k (repartitionSpace k X.functionField)`, `hK : IsGreatest {E | ω ∈
  weilDifferentialFiltration E} (equivFunctionFieldDivisor hex hdim K)` (that greatest element is the
  divisor `(ω)` of Layer 4), and `hk`; the declaration at 122–124 is
  `Module.Dual k (Cohomology (sheaf D) 1) ≃ₗ[k] Cohomology (sheaf (K - D)) 0`. The old wording "a
  divisor in the canonical class" named the same set (every such divisor is `(zω)` for some `z ≠ 0`);
  the new wording is the pin's own hypothesis.

**The headline theorems, re-located at the pin** (unchanged file; 18 names, 18 found at the lines of the
previous report): `isFunctionField_iff_trdeg_eq_one` `FieldTheory/FunctionField/Basic.lean` 155;
`Divisor.degree_principal` `Divisor/ProductFormula.lean` 255; `isRiemannRochDivisor_weilDifferentialDivisor`
`Differential/CanonicalDivisor.lean` 415; `Divisor.two_mul_dim_le_degree_add_two`
`Consequences/Clifford.lean` 317; `hurwitz_genus_formula` `Different/Hurwitz.lean` 72;
`isDomain_tensorProduct_of_separating` `FieldTheory/Separable/Regular.lean` 142;
`genus_eq_genus_of_constantCompositum_eq_top` 273 and `genus_le_genus_of_constantCompositum_eq_top` 243
in `ConstantExtension/Genus/Basic.lean`; `finrank_kaehlerDifferential_eq_one_of_separating`
`Differential/Kaehler.lean` 140; `finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero`
`Differential/Independence.lean` 386; `genus_eq_of_sq_eq` `Hyperelliptic/Genus/Basic.lean` 339;
`finite_algEquiv_of_two_le_genus` `Automorphism/HigherGenus.lean` 124;
`natCard_le_eighty_four_mul_genus_sub_one` `Automorphism/HurwitzBound.lean` 83;
`AlgebraicGeometry.twoChartModel` `AlgebraicGeometry/Curves/TwoChartModel/Basic.lean` 143;
`Scheme.isProjectiveOver_of_isCurveOver` `TwoChartModel/ProjectiveEmbedding.lean` 185;
`RegularProjectiveCurveCat.equivFunctionFieldCat` `TwoChartModel/AntiEquivalence.lean` 296;
`twoChartModel.genus_eq_genus` `TwoChartModel/Genus.lean` 60. Also re-found: `Place.infinite`
`Place/Existence.lean` 144.

**Overlaps.** #1854's copy of `TauCetiRoadmap/AlgebraicCurves/README.md` (as the roadmaps tool prints
it at its head) is byte-identical to this head's; `git merge-file` with main as base reports 0
conflicts for #1854 and 0 for #1807 (#1807's copy differs from main by one line, 1803, the
consumer-table wording this head also carries; its older `Suggested.lean` is covered by the stated order
#1807 → this pull request). No dropped id in either direction. The closest open roadmaps
(CanonicalModelsAndGonality, HyperellipticCurves, FunctionFieldArithmetic, CurvesOverFiniteFields)
consume and do not restate; a 20-line precision of pinned hypotheses creates no new owned object.

**Seeded sample.** None of the three sampled targets lies in a changed passage: Riemann–Hurwitz
(README 805–878), Portfolio ownership (29–34), Route decision (pinned) (36–56); the line numbers are
unchanged and the previous reports' verification stands: `hurwitz_genus_formula`
(`Different/Hurwitz.lean` 66–76) carries `[FiniteDimensional F F'] [Algebra.IsSeparable F F']
[FiniteDimensional k k'] [Algebra.IsSeparable k k']` with conclusion
`[k' : k]·(2g' − 2) = [F' : F]·(2g − 2) + [k' : k]·deg Diff`, as README 805–878 states; the ownership
paragraph names this roadmap sole owner of general places, Riemann–Roch, Riemann–Hurwitz, regular
projective models and the anti-equivalence, and the four closest open roadmaps consume rather than
restate; the route decision names the function-field-first route the pinned names realise.

**Adversarial pass.** Rows for statements the diff leaves untouched are carried from the previous
report (review 27, which carried them from reviews 22 and 20); the last four rows are this round's,
for the changed statements:

| statement | instance | left | right | result |
|---|---|---|---|---|
| Hurwitz genus formula | `y² = f(x)`, `deg f = 2g + 1` odd, char `≠ 2`, over `k(x)`: `2g' − 2 = 2(−2) + deg Diff` | `2g − 2` | `−4 + (2g + 2)` (the `2g + 1` finite branch places and `∞`, each `d = 1`) | holds (review 22) |
| Hurwitz, tameness iff | Artin–Schreier `y^p − y = x` over `𝔽_p(x)`, only `∞` ramifies, `e = p`, `d = 2(p − 1)` | `2g − 2 = −2p + 2(p − 1) = −2`, `g = 0` | `∑(e − 1) = p − 1 ≠ d` | wild: the `iff` fails exactly when some `p ∣ e` (review 22) |
| infinitely many places | `𝔽₂(x)`: `∞` and the monic irreducibles, `1, 1, 2, 3, 6` in degrees `1…5` | at least one in every degree | `Infinite` | holds (review 22) |
| class-group bridge, singleton | `y² = x³ − x` over `ℚ`, `R = ℚ[x, y]`, non-integral set `{P∞}` | `ker π = ⟨[P∞]⟩`, `deg n[P∞] = n` | `Cl⁰ ≅ ClassGroup R` | holds; with `R = ℚ[x, 1/x, y]` the set is `{P∞, P_(0,0)}` and `[P_(0,0)] − [P∞]` is nonzero 2-torsion in `ker π ∩ Cl⁰`: the singleton hypothesis is load-bearing (review 22) |
| genus-one ladder | genus 1, `D = 2[0] − [Q]`; `[0]`; `0` | `ℓ = 1; 1; 1` | `deg = 1; 1; 0` | `0 < deg D` load-bearing (review 22) |
| residue theorem, abstract | `k(x)`, `η_P(z) = res_P(z dx)`, `z = 1/x` | `η_{P₀} = 1`, `η_{P∞} = −1`, others `0` | `∑ᶠ = 0` | holds (review 22) |
| Hilbert's formula | `y² − y = x³` over `𝔽₂` at `∞`: `G₀ = … = G₃ = ℤ/2`, `G₄ = 1` | `∑(|G_i| − 1) = 4` | `d = 4` | holds; tame `y² = x`: `1 = e − 1` (review 22) |
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
| Abhyankar, `e₁ ≠ 0` in `k` on both pinned forms (changed, 1105–1111) | `k(x^{1/6})`, `E₁ = k(√x)`, `E₂ = k(x^{1/3})` over `(x)`, char `∤ 6`: `e₁ = 2 ≠ 0` in `k`; Artin–Schreier pair of the pin's docstring over `𝔽_p(x)` (Galois, `k = 𝔽_p` perfect so both forms apply): `e₁ = p = 0` in `k` | `e = 6`; `e = p²` | `lcm(2, 3) = 6`; `lcm(p, p) = p` | holds; the pair satisfies every other hypothesis of both forms and refutes the conclusion, so `e₁ ≠ 0` is load-bearing in both, as the new sentence says (this round) |
| Weierstrass `2g + 3` for non-hyperelliptic `F` (changed, 1506–1508) | hyperelliptic `g = 2`, `y² = x⁵ − 1` over `ℂ`: the 6 branch places, weight `g(g−1)/2 = 1` each; Klein quartic `g = 3`: 24 flexes, weight 1 each | `6 = 2g + 2`, total `6 = g³ − g`; `24` | `2g + 3 = 7`; `2g + 3 = 9` | `6 < 7`: the hypothesis `¬hyperelliptic` is load-bearing; `24 ≥ 9` holds, total `24 = 27 − 3` (this round) |
| genus comparison hypotheses (changed, 1744–1749) | `ℙ¹_k`: `h¹(𝒪) = 0`, `genus k k(x) = 0`; `X = ℙ¹_{k'}` over `k` with `[k' : k] = 2` (integral, proper, DVR stalks, `k(X) = k'(x)` a function field over `k`, `k` not exact) | `h⁰(𝒪_X) = 2` | `1` (`finrank_cohomology_zero_trivial_eq_one_of_isIntegrallyClosedIn`) | `0 = 0` holds; exactness is load-bearing for the companion `h⁰ = 1` statement of the same section (line 236), so the README's listing it is right (this round) |
| Serre duality, `K = (ω)` for a nonzero `ω` (changed, 1753–1755) | `ℙ¹`, `ω = dx`, `(ω) = −2[∞]`, `D = n[∞]`; `ω' = x·dx`, `(ω') = [0] − 2[∞]` | `h¹(𝒪(n[∞])) = ℓ(−2[∞] − n[∞]) = max(−n − 1, 0)` | `h¹ = 0` for `n ≥ −1`, `1` at `n = −2`; with `K' = (ω')`, `ℓ(K' − D) = ℓ([0] − (n+2)[∞]) = max(−n − 1, 0)` | holds for both admissible `K`; `ω = 0` would make `{E | ω ∈ filtration E}` everything with no greatest element, which `hω` excludes (this round) |

**README shape and policy.** The worker's text scanners all read `0` at this head (no LaTeX, no process
words, no pull-request numbers, no local paths, no round labels, no long fences, no stray files); the
changed lines are prose precisions of pinned hypotheses and introduce no new target, Check or Lean
name (the resolver finds every backticked name).

## Not verifiable

- H. Stichtenoth, *Algebraic Function Fields and Codes* (GTM 254): no legal electronic copy (the
  sources cache has no text with this title). The changed Abhyankar clause cites Theorem 3.9.1, which
  the pin's docstrings for both forms (`Abhyankar.lean` 68–78, 133–141) also cite; the computed
  instances above test the statement.
- W. Fulton, *Algebraic Curves*: no legal source found by the sources service (not touched by this
  diff).
- The roadmap's board package has no `sources.toml`, so no cached text is recorded for it.

## Source issues

- none
