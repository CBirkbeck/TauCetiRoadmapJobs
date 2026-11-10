# Review of AlgebraicCurves (pull request #1808 at 6c9a62a)

**Verdict:** needs changes

This is an incremental re-review covering 0 changed lines since `a96d197`. `TauCetiRoadmap/AlgebraicCurves/README.md` (2054 lines) and
`TauCetiRoadmap/AlgebraicCurves/Suggested.lean` (39 lines) are byte-identical to the copies the previous
review read: the SHA-256 is the same at `a96d197` and at this head. The two commits since then
(`01872e77` and `6c9a62ac`) touch only `TauCetiRoadmap/ComplexKahlerGeometry/README.md` and
`TauCetiRoadmap/AlgebraicTopology/{README.md,Suggested.lean}`. Neither of those files mentions AlgebraicCurves (0 matches), and
this README mentions neither roadmap (0 matches for `AlgebraicTopology` or `ComplexKahler`). The one previous
finding is still open and the worker's gate still fails on it.

## R01 (P3) — edits outside the pull request's roadmap folders (not repaired; same R01 as the previous reviews)

Location: `Completed/ArithmeticDirichletSeries/README.md` line 331 ("`LFunctions` consumes this package
and supplies its own character-specific continuation") and `TauCetiRoadmap/SymplecticGeometry/README.md`
line 77 ("boundary and sign adapters consumed by HeegaardFloer and consumed by DGFloer").

Claim: these two files are not among the fifteen folders the brief names as this pull request's own, but the pull request still changes them.
The worker's gate at this head reports `outside-folder=2 … FAIL` on exactly these two files. I re-ran
`git diff --stat origin/main...HEAD` with the fifteen own folders excluded (main at `e2d1245`) and got the same two files:
2 insertions, 2 deletions. They come from commits `e591d103` and `61e5385e`, unchanged since the previous review.

Witness: `git log origin/main..HEAD -- Completed/ArithmeticDirichletSeries/README.md
TauCetiRoadmap/SymplecticGeometry/README.md` lists only `e591d103` and `61e5385e`. The gate line reads `outside-folder=2`.

Repair: revert both hunks from this pull request, or move them to the pull request that owns those
folders. If the SymplecticGeometry sentence is kept anywhere, write "consumed by" once. Re-run the gate:
`outside-folder` must read `0`.

## Previous findings

- R01 — not repaired: `Completed/ArithmeticDirichletSeries/README.md` 331 and
  `TauCetiRoadmap/SymplecticGeometry/README.md` 77 still differ from main by the same two one-line hunks.
  The worker's gate still reports `outside-folder=2`. Written again as R01 above.

## Verified sound

**Gate, build and dependency check.** The worker's gate at this head (data) reads `0` on every scanner except
`outside-folder=2` (R01), and `build=0`. I ran the gate myself at this head and every text scanner reads `0`:
`set_option`, `blob`, `latex`, `tex`, `prnum`, `sorry-data`, `sorry-examples`, `residue`, `private-paths`,
`imports`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`, `statement-hygiene`, `forbidden`,
`dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`, `layer-ids`,
`target-ids`, `depcheck`, `metadata`, `stray-files`, `dirty`, `source-material`. My run reports
`outside-folder=28` because it has no list of the pull request's own folders and so counts them too. The
two files of R01 are among the 28.

`lake build TauCetiRoadmap.AlgebraicCurves.Suggested` reports "Build completed successfully (18239 jobs)".
`lake env lean` on `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` gives no output and exits 0 in 4 s.

Dependency check at this head:

```
depcheck: 239 roadmaps, 2349 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. AlgebraicCurves is on main and is not listed in the merge order, which is not a defect. The
pins equal main's (`git diff origin/main HEAD -- lake-manifest.json lean-toolchain` is empty): Tau Ceti
`2fd255d9`, Mathlib `1b1ccf4b`. The worker's citation resolver found no unresolved citation or Lean name,
and the overlap facts list no dropped id in either direction. A three-way merge of this head into main conflicts
only in `TauCetiRoadmap/ModularCurves/{README.md,Suggested.lean}` and
`TauCetiRoadmap/TopologicalKTheory/README.md`, not in this folder.

**Lean form.** `Suggested.lean` is unchanged: `module`, `public import Mathlib`, one module docstring,
and an empty `namespace TauCetiRoadmap.AlgebraicCurves`. It has no `set_option`, `lemma`, `sorry`, `example`, `#eval`,
`#print` or `#synth`. With no declarations there is nothing to `#check @`-compare and nothing to padding-probe.

**Headlines named in the docstring, re-located at the pin.** All 18 names are present (paths under `TauCeti/`):
- `isFunctionField_iff_trdeg_eq_one`: `FieldTheory/FunctionField/Basic.lean` 155
- `Divisor.degree_principal`: `…/Divisor/ProductFormula.lean` 255
- `isRiemannRochDivisor_weilDifferentialDivisor`: `…/Differential/CanonicalDivisor.lean` 415
- `Divisor.two_mul_dim_le_degree_add_two`: `…/Consequences/Clifford.lean` 317
- `hurwitz_genus_formula`: `…/Different/Hurwitz.lean` 72
- `isDomain_tensorProduct_of_separating`: `FieldTheory/Separable/Regular.lean` 142
- `genus_eq_genus_of_constantCompositum_eq_top` 273 and `genus_le_…` 243: `…/ConstantExtension/Genus/Basic.lean`
- `finrank_kaehlerDifferential_eq_one_of_separating`: `…/Differential/Kaehler.lean` 140
- `finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero`: `…/Differential/Independence.lean` 386
- `genus_eq_of_sq_eq`: `…/Hyperelliptic/Genus/Basic.lean` 339
- `finite_algEquiv_of_two_le_genus`: `…/Automorphism/HigherGenus.lean` 124
- `natCard_le_eighty_four_mul_genus_sub_one`: `…/Automorphism/HurwitzBound.lean` 83
- `AlgebraicGeometry.twoChartModel`: `AlgebraicGeometry/Curves/TwoChartModel/Basic.lean` 143
- `isProjectiveOver_of_isCurveOver`: `…/TwoChartModel/ProjectiveEmbedding.lean` 185
- `RegularProjectiveCurveCat.equivFunctionFieldCat`: `…/TwoChartModel/AntiEquivalence.lean` 296
- `twoChartModel.genus_eq_genus`: `…/TwoChartModel/Genus.lean` 60

**Seeded sample.** None of the three sampled targets is in a changed passage. I re-read each at this head:
- **Riemann–Hurwitz** (README 805–891). `hurwitz_genus_formula` (`Hurwitz.lean` 62–78) carries the instance
  arguments `[FiniteDimensional F F'] [Algebra.IsSeparable F F'] [FiniteDimensional k k']
  [Algebra.IsSeparable k k']` and the hypotheses `IsFunctionField` and `IsIntegrallyClosedIn` on both levels.
  Its conclusion is `[k′:k]·(2g′−2) = [F′:F]·(2g−2) + [k′:k]·deg Diff(F′/F)`, which is the cross-multiplied form at README 865–868.
  The pin's two extra arguments about `k′/k` follow from the README's hypotheses, as the previous reviews showed.
- **Portfolio ownership** (README 29–34). `TauCetiRoadmap/BelyiMaps/README.md` on main (line 185) assigns the regular
  projective model and the anti-equivalence to AlgebraicCurves.
- **Route decision (pinned)** (README 36–56). On main, `TauCetiRoadmap/JacobianChallenge/README.md` has Layer A at line
  111 and Layer B at line 135, with `g := dim_k H¹(X, 𝒪_X)` and `χ(L) = deg L + 1 − g` at line 139.
  `TauCetiRoadmap/EllipticCurves/README.md` consumes this roadmap's place interface (357, 367) and Layer 6 (377), and has "no Riemann–Roch
  anywhere" at 394. All of these citations match.

**Overlaps.**
- **#1854.** Its copy of `Suggested.lean` is byte-identical to this head's. Its README differs in one place
  only: lines 865–886 there against 871 here, the expanded Hurwitz bullet deriving finite and separable `k′/k`. This
  pull request leaves that passage as main has it, so there is no conflict in this folder.
- **#1807.** The conflict is covered by the merge order the description states (#1101 → #1807 → this pull request),
  so it is not a finding. However, #1807's head (`e444d15`) now carries a newer, divergent revision of this folder:
  - its README is 2326 lines (4358 diff lines against this head);
  - its `Suggested.lean` imports `TauCeti.FieldTheory.FunctionField.RiemannRoch.Genus` and states one `sorry`
    headline, `finite_algEquiv_of_two_le_genus` over a perfect `k`;
  - both branches revise the folder independently from commit `0eb8b7d1`.

  Under the stated order this pull request takes #1807's text when it is rebased.
- **Closest vocabulary.** The nearest open roadmaps (CanonicalModelsAndGonality, NumberFieldArithmetic, HyperellipticCurves,
  RamificationOfCompleteDiscretelyValuedFields, FunctionFieldArithmetic) consume and do not restate, as the earlier reviews found. Nothing in this folder changed.

**Adversarial pass.** No statement changed this round. Every row below is carried from the previous review (review 49, which carried reviews 45, 40, 33, 27, 22 and 20). One extra
row (last) supports the second remark below.

| statement | instance | left | right | result |
|---|---|---|---|---|
| Hurwitz genus formula | `y² = f(x)`, `deg f = 2g + 1`, char `≠ 2`, over `k(x)` | `2g − 2` | `−4 + (2g + 2)` | holds (review 22) |
| Hurwitz, tameness iff | Artin–Schreier `y^p − y = x` over `𝔽_p(x)`, `e = p`, `d = 2(p − 1)` | `−2p + 2(p − 1) = −2`, `g = 0` | `∑(e − 1) = p − 1 ≠ d` | wild: the `iff` fails exactly when some `p ∣ e` (review 22) |
| infinitely many places | `𝔽₂(x)`: counts `1, 1, 2, 3, 6` in degrees `1…5`, plus `∞` | one in every degree | `Infinite` | holds (review 22) |
| class-group bridge | `y² = x³ − x` over `ℚ`; `R = ℚ[x, 1/x, y]` | `ker π = ⟨[P∞]⟩`; `[P_(0,0)] − [P∞]` nonzero 2-torsion | `Cl⁰ ≅ ClassGroup R` only for a singleton set | singleton hypothesis load-bearing (review 22) |
| genus-one ladder | `D = 2[0] − [Q]`; `[0]`; `0` | `ℓ = 1; 1; 1` | `deg = 1; 1; 0` | `0 < deg D` load-bearing (review 22) |
| residue theorem | `k(x)`, `z = 1/x`, `ω = z dx` | `η_{P₀} = 1`, `η_{P∞} = −1` | `∑ᶠ = 0` | holds (review 22) |
| Hilbert's formula | `y² − y = x³` over `𝔽₂` at `∞`, `G₀…G₃ = ℤ/2`, `G₄ = 1` | `∑(|G_i| − 1) = 4` | `d = 4` | holds (review 22) |
| unramified/split compositum | `ℚ(√x)`, `ℚ(√(x−1))`, `ℚ(√(x+3))` over `ℚ(x)` | `e = 1`; `e = 2`; `T² − 2` irreducible | both directions | holds (review 22) |
| exact constants from a rational place | `ℚ(√x)`, `ℚ(√(−x))` | constants `ℚ(i)` | no rational place splits in both | hypothesis load-bearing (review 22) |
| genus 2 ⇒ hyperelliptic | `y² + y = x⁵` over `𝔽₂`; `y² = x⁵ − 1` | `g = 2`, index-2 subfield `k(x)` | hyperelliptic | holds (review 22) |
| plane-curve genus | `X⁴ + Y⁴ + Z⁴` over `𝔽₃`; over `𝔽₂` it is `(X + Y + Z)⁴` | `g = 3` | `(d−1)(d−2)/2 = 3`; all partials `0` over `𝔽₂` | nonsingularity load-bearing (review 22) |
| rigidity | genus 1, `[−1]` fixes 4 points, `4 < 5` | `σ ≠ 1` | bound not met | consistent (review 22) |
| Clifford | `ℙ¹`, `D = n[∞]` | `2(n + 1)` | `n + 2` | `≤` iff `n ≥ 0`, equality at `n = 0` (review 20) |
| Riemann–Roch on `ℙ¹` | `D = n[∞]`, `K = −2[∞]` | `(n + 1) − 0`; at `n = −2`: `0 − 1` | `n + 1` | holds (review 20) |
| `genus_eq_of_sq_eq` | `x³ − x`, `x⁵ − 1`, `x⁶ − 1` | `1, 2, 2` | `⌊(deg f − 1)/2⌋` | holds (review 20) |
| Hurwitz bound | `g = 2`, `|Aut| ≤ 48`; Klein quartic `g = 3`, `168` | `84; 168` | `84(g − 1)` | holds, sharp at `g = 3` (review 20) |
| constant extension, genus drop | `y² = x^p − t` over `𝔽_p(t)`; `y² = x³ + t` over `𝔽₂(t)` | `(p − 1)/2; 1` | `0; 0` after `k^{1/p}` | separability load-bearing (review 20) |
| `isDomain_tensorProduct_of_separating` | `k = 𝔽_p(t)`, `F = k(t^{1/p})`, `k' = k^{1/p}` | nilpotents | excluded by exactness | load-bearing (review 20) |
| finiteness of `Aut`, `g ≥ 2` | `g = 0`: `PGL₂(k)`; `g = 1`: translations | infinite | `2 ≤ g` needed | holds (review 20) |
| Abhyankar, `e₁ ≠ 0` in `k` | `k(√x)`, `k(x^{1/3})`, char `∤ 6`; Artin–Schreier pair, `e₁ = p` | `e = 6`; `e = p²` | `lcm = 6`; `lcm = p` | `e₁ ≠ 0` load-bearing (review 33) |
| Weierstrass `≥ 2g + 3`, non-hyperelliptic | `y² = x⁵ − 1`; Klein quartic | `6`; `24` | `7`; `9` | non-hyperelliptic load-bearing (review 33) |
| genus comparison | `ℙ¹_k`; `ℙ¹_{k'}` over `k`, `[k':k] = 2` | `h¹ = 0`; `h⁰ = 2` | `g = 0`; `1` | exactness load-bearing (review 33) |
| Serre duality, `K = (ω)` | `ℙ¹`, `ω = dx`, `ω' = x dx`, `D = n[∞]` | `h¹ = max(−n − 1, 0)` | `ℓ(K − D)` for both `K` | holds; `ω = 0` excluded (review 33) |
| pinned `finite_algEquiv_of_two_le_genus` (`IsAlgClosed k`, gaps injective in `k`) | Hermitian `y³ + y = x⁴` over `𝔽̄₃`, `g = 3`, `P∞`: semigroup `⟨3, 4⟩` | gaps `{1, 2, 5}`, `2 = 5` in `𝔽₃` | `|Aut| = |PGU₃(3)| = 27·28·8 = 6048`, finite | the gap hypothesis fails while the conclusion holds: the pin covers a proper subclass (this round) |

**Remarks on untouched text** (previously passed, so no R-number and no change requested):
- **Route decision (README 41–43).** It says the pin has no coherent cohomology, no scheme dimension theory and no
  divisors on schemes. At Tau Ceti `2fd255d9` that is out of date: the pin has
  - `TauCeti.AlgebraicGeometry.SchemeWeilDivisor` (`AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean` 45);
  - sheaf cohomology under `AlgebraicGeometry/Cohomology/`;
  - `SchemeWeilDivisor.genus_eq_genus_functionField` (`WeilDivisor/Scheme/SerreDuality.lean` 245);
  - this README's own Layer 12 citation `twoChartModel.genus_eq_genus`, which is about `dim_k H¹(X_F, 𝒪)`.
- **Automorphism finiteness.** The `Suggested.lean` docstring lists `finite_algEquiv_of_two_le_genus` as "finiteness of the
  automorphism group in genus at least two". The pinned theorem assumes `[IsAlgClosed k]` and gaps that are pairwise distinct in `k`;
  the Hermitian row above shows the gap hypothesis failing. README 1502–1529 states those hypotheses and
  excludes the general positive-characteristic case. #1807's newer copy instead states the perfect-`k` theorem
  as a headline.

## Not verifiable

- H. Stichtenoth, *Algebraic Function Fields and Codes* (`Stichtenoth2009`): recorded as `uncertified`, so it is cited
  by locator alone. The pin's docstring cites the same Theorem 3.4.13 (`Hurwitz.lean` 69), and the computed rows above test
  the statement.
- Hartshorne, *Algebraic Geometry*, Serre, *Local Fields*, and Villa Salvador, *Topics in the Theory of Algebraic Function
  Fields*: recorded as `uncertified` and cited by locator alone.
- Fulton, *Algebraic Curves* (`Fulton2008`): a cached text exists, but no sampled target and no changed passage cites it,
  so it was not opened this round.

## Source issues

- none
