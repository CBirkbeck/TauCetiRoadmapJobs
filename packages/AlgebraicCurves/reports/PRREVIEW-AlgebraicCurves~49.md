# Review of AlgebraicCurves (pull request #1808 at a96d197)

**Verdict:** needs changes

An incremental re-review of 0 changed lines since `dc47c7e`: `TauCetiRoadmap/AlgebraicCurves/README.md`
(2054 lines) and `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` (39 lines) are byte-identical to the
copies the previous review read (same SHA-256 at `6931121`, `dc47c7e` and this head). The change since
`dc47c7e` is one commit touching only `TauCetiRoadmap/BordismFormalGroups/` (README and `Suggested.lean`),
a folder the pull request names as its own; neither file mentions AlgebraicCurves (0 occurrences) and this
README does not mention BordismFormalGroups (0 occurrences). The single finding of the previous review
remains, exactly as it was: two hunks outside the pull request's folders, on which the worker's gate still
fails.

## R01 (P3) — edits outside the pull request's roadmap folders (unrepaired R01 of the previous seven reviews)

Location: `Completed/ArithmeticDirichletSeries/README.md` line 331 ("`LFunctions` consumes this package
and supplies its own character-specific continuation") and `TauCetiRoadmap/SymplecticGeometry/README.md`
line 77 ("sign adapters consumed by HeegaardFloer and consumed by DGFloer").

Claim: the worker's gate at this head reports `outside-folder=2 FAIL` on exactly these two files, and
`git diff --stat origin/main...HEAD` restricted to paths outside the sixteen folders the pull request names
as its own lists the same two files (2 insertions, 2 deletions; re-run at `a96d197`). Neither folder is
among the pull request's own, so the folder review cannot be accepted while the gate fails. Both hunks are
the commits `e591d103` and `61e5385e`, unchanged since the previous review.

Repair: revert both hunks from this pull request (or move them to the pull request that owns those
folders). If the SymplecticGeometry sentence is kept anywhere, write "consumed by" once.

## Previous findings

- R01 — not repaired: `Completed/ArithmeticDirichletSeries/README.md` 331 and
  `TauCetiRoadmap/SymplecticGeometry/README.md` 77 still differ from main by the same two hunks; the
  worker's gate still reports `outside-folder=2`. Written again as R01 above.

## Verified sound

**Gate and dependency check.** The worker's gate at this head (data): every scanner `0` except
`outside-folder=2` (R01); `build=0`. My own run of the gate at this head: every text scanner `0`
(`set_option`, `blob`, `latex`, `tex`, `prnum`, `sorry-data`, `sorry-examples`, `residue`,
`private-paths`, `imports`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`, `statement-hygiene`,
`forbidden`, `dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`, `layer-ids`,
`target-ids`, `depcheck`, `metadata`, `stray-files`, `dirty`, `source-material` all `0`);
`outside-folder=28`, because my run has no list of the pull request's sixteen own folders and so counts
them too (one more than last round: the BordismFormalGroups `Suggested.lean` now differs from main); the
two files of R01 are among the 28. My run of the dependency check at this head:

```
depcheck: 239 roadmaps, 2346 edges, 0 problem(s)
```

No UPWARD or CYCLE line; AlgebraicCurves is on main and so not in the merge order (not a defect). The
worker's citation resolver found no unresolved cross-roadmap citation or Lean name; the overlap facts list
no dropped id in either direction. The pins are unchanged and equal main's (Tau Ceti `2fd255d9`, Mathlib
`1b1ccf4b`, read from `lake-manifest.json` at this head and at `origin/main`).

**Elaboration and Lean form.** `lake build TauCetiRoadmap.AlgebraicCurves.Suggested` at this head:
"Build completed successfully" (18239 jobs, cached, 6 s). `lake env lean` on
`TauCetiRoadmap/AlgebraicCurves/Suggested.lean`: no output, exit 0 (5 s). The file is unchanged since
`925dc8b`: `module`, `public import Mathlib`, one module docstring, `@[expose] public section`, an empty
`namespace TauCetiRoadmap.AlgebraicCurves`; no `set_option`, `lemma`, `sorry`, `example`, `#eval`,
`#print`, `#synth`. Nothing to probe for padding; nothing stands in for a headline.

**The headline theorems, re-located at the pin** (unchanged file; 18 names in the module docstring, 18
re-found by grep at `2fd255d9`, paths under `TauCeti/`): `isFunctionField_iff_trdeg_eq_one`
`FieldTheory/FunctionField/Basic.lean` 155; `Divisor.degree_principal`
`FieldTheory/FunctionField/Divisor/ProductFormula.lean` 255; `isRiemannRochDivisor_weilDifferentialDivisor`
`FieldTheory/FunctionField/Differential/CanonicalDivisor.lean` 415; `Divisor.two_mul_dim_le_degree_add_two`
`FieldTheory/FunctionField/Consequences/Clifford.lean` 317; `hurwitz_genus_formula`
`FieldTheory/FunctionField/Different/Hurwitz.lean` 72; `isDomain_tensorProduct_of_separating`
`FieldTheory/Separable/Regular.lean` 142; `genus_eq_genus_of_constantCompositum_eq_top` 273 and
`genus_le_genus_of_constantCompositum_eq_top` 243 in
`FieldTheory/FunctionField/ConstantExtension/Genus/Basic.lean`;
`finrank_kaehlerDifferential_eq_one_of_separating` `FieldTheory/FunctionField/Differential/Kaehler.lean` 140;
`finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero`
`FieldTheory/FunctionField/Differential/Independence.lean` 386; `genus_eq_of_sq_eq`
`FieldTheory/FunctionField/Hyperelliptic/Genus/Basic.lean` 339; `finite_algEquiv_of_two_le_genus`
`FieldTheory/FunctionField/Automorphism/HigherGenus.lean` 124; `natCard_le_eighty_four_mul_genus_sub_one`
`FieldTheory/FunctionField/Automorphism/HurwitzBound.lean` 83; `AlgebraicGeometry.twoChartModel`
`AlgebraicGeometry/Curves/TwoChartModel/Basic.lean` 143; `Scheme.isProjectiveOver_of_isCurveOver`
`AlgebraicGeometry/Curves/TwoChartModel/ProjectiveEmbedding.lean` 185;
`RegularProjectiveCurveCat.equivFunctionFieldCat` `AlgebraicGeometry/Curves/TwoChartModel/AntiEquivalence.lean`
296; `twoChartModel.genus_eq_genus` `AlgebraicGeometry/Curves/TwoChartModel/Genus.lean` 60. Also re-found:
`Place.infinite` `FieldTheory/FunctionField/Place/Existence.lean` 144. Every one is proved at the pin, so
the file rightly states nothing.

**Overlaps.** #1807's copy of this folder (as the roadmaps tool prints it at its head) is older (its README
differs from this head by 267 diff lines and its `Suggested.lean` by 112, the pre-`925dc8b` text that still
imports Tau Ceti modules); the conflict is covered by the merge order the pull request's description
states (#1101 → #1807 → this pull request). #1854's `Suggested.lean` is byte-identical to this head's;
its README now differs by 31 diff lines, all in one place: #1854 expands the Hurwitz genus formula bullet
(its lines 865–886 against this head's 865–871) with the derivation of finiteness and separability of
`k′/k` from the stated hypotheses. This pull request leaves that passage exactly as main has it (main
843–849 = this head 865–871, confirmed by `diff` against `origin/main`), so #1854's change merges cleanly
over this one in either order, which is what the overlap facts report (no conflict in this folder); no
order needs stating. No dropped id in either direction. The closest open roadmaps in vocabulary
(CanonicalModelsAndGonality, NumberFieldArithmetic, HyperellipticCurves, FunctionFieldArithmetic,
JacobianChallenge) consume and do not restate, as the previous reviews found; nothing in this folder
changed.

**Seeded sample.** None of the three sampled targets lies in a changed passage (the folder is unchanged):
Riemann–Hurwitz (README 805–878), Portfolio ownership (29–34), Route decision (pinned) (36–56); re-read at
this head at the same line numbers and re-resolved:
- Riemann–Hurwitz: `hurwitz_genus_formula` (`Different/Hurwitz.lean` 62–78) carries `[FiniteDimensional F F']
  [Algebra.IsSeparable F F'] [FiniteDimensional k k'] [Algebra.IsSeparable k k']` with hypotheses
  `IsFunctionField k F`, `IsFunctionField k' F'`, `IsIntegrallyClosedIn k F`, `IsIntegrallyClosedIn k' F'`
  and conclusion `[k' : k]·(2g' − 2) = [F' : F]·(2g − 2) + [k' : k]·deg Diff(F'/F)`, the cross-multiplied
  form README 865–868 states. The README's hypotheses ("`F′/F` finite separable with constant fields
  `k′/k`") imply the pin's two extra instance arguments: `k′` is finite over `k` because `F′` is finite
  over `F` and `k′ ⊆ F′` is algebraic over `k`; `k′/k` is separable because, `k` being the full constant
  field of `F`, the minimal polynomial over `k` of `a ∈ k′` stays its minimal polynomial over `F`, which is
  separable since `F′/F` is. So the README's generality equals the pin's (the expansion #1854 adds says the
  same at greater length). The passage's other pinned names re-found: `two_mul_genus_sub_two_eq_iff_forall_isTame`
  (`Hurwitz.lean` 120), `hurwitz_genus_formula_ratFunc` (160), `hurwitz_genus_formula_geometricDegree` (89),
  `geometricDegree` (`GeometricDegree.lean` 210), `Divisor.tameDifferent` (`Different/Tame.lean` 386),
  `Place.differentExponent_restrict_add` (`Different/Tower.lean` 135), `Divisor.different_eq_conorm_add` (243).
- Portfolio ownership: the paragraph names this roadmap sole owner of general places, divisors and `L(D)`,
  Weil differentials and Riemann–Roch, ramification and Riemann–Hurwitz, regular projective models and the
  anti-equivalence, with BelyiMaps a consumer of the pinned carriers; `TauCetiRoadmap/BelyiMaps/README.md`
  on main 185–186 cites AlgebraicCurves Layers 0–8 and 12 as the owner of exactly these.
- Route decision: `TauCetiRoadmap/JacobianChallenge/README.md` on main has Layer A (line 111) and Layer B
  (135) with `g := dim_k H¹(X, 𝒪_X)` and `χ(L) = deg L + 1 − g` at 139, as cited;
  `TauCetiRoadmap/EllipticCurves/README.md` on main consumes this roadmap's place interface (357, 367) and
  Layer 6 (377) and says "with no Riemann–Roch anywhere" (394), as cited.

**Adversarial pass.** Every row is carried from the previous report (review 45, which carried the rows of
reviews 40, 33, 27, 22 and 20); no statement changed in this round, so no new row is due:

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
| Abhyankar, `e₁ ≠ 0` in `k` on both pinned forms (1105–1111) | `k(x^{1/6})`, `E₁ = k(√x)`, `E₂ = k(x^{1/3})` over `(x)`, char `∤ 6`: `e₁ = 2 ≠ 0` in `k`; Artin–Schreier pair of the pin's docstring over `𝔽_p(x)`: `e₁ = p = 0` in `k` | `e = 6`; `e = p²` | `lcm(2, 3) = 6`; `lcm(p, p) = p` | holds; the pair satisfies every other hypothesis of both forms and refutes the conclusion, so `e₁ ≠ 0` is load-bearing in both (review 33) |
| Weierstrass `2g + 3` for non-hyperelliptic `F` (1506–1508) | hyperelliptic `g = 2`, `y² = x⁵ − 1` over `ℂ`: 6 branch places, weight 1 each; Klein quartic `g = 3`: 24 flexes, weight 1 each | `6 = 2g + 2`, total `6 = g³ − g`; `24` | `2g + 3 = 7`; `2g + 3 = 9` | `6 < 7`: `¬hyperelliptic` is load-bearing; `24 ≥ 9` holds, total `24 = 27 − 3` (review 33) |
| genus comparison hypotheses (1744–1749) | `ℙ¹_k`: `h¹(𝒪) = 0`, `genus k k(x) = 0`; `X = ℙ¹_{k'}` over `k` with `[k' : k] = 2` (`k` not exact) | `h⁰(𝒪_X) = 2` | `1` (`finrank_cohomology_zero_trivial_eq_one_of_isIntegrallyClosedIn`) | `0 = 0` holds; exactness load-bearing for the companion `h⁰ = 1` statement (review 33) |
| Serre duality, `K = (ω)` for a nonzero `ω` (1753–1755) | `ℙ¹`, `ω = dx`, `(ω) = −2[∞]`, `D = n[∞]`; `ω' = x·dx`, `(ω') = [0] − 2[∞]` | `h¹(𝒪(n[∞])) = max(−n − 1, 0)` | `h¹ = 0` for `n ≥ −1`, `1` at `n = −2`; with `K' = (ω')`, `ℓ(K' − D) = max(−n − 1, 0)` | holds for both admissible `K`; `ω = 0` leaves no greatest element, which `hω` excludes (review 33) |

**README shape and policy.** The worker's text scanners all read `0` at this head (no LaTeX, no process
words, no pull-request numbers, no local paths, no round labels, no long fences, no stray files); the
folder's two files are the ones the previous review passed, byte for byte. The folder's `PROGRESS.md`,
`STATUS.md` and `metadata.toml` are unchanged from the merge base.

Remark on untouched text (no change requested): the Hurwitz bullet at README 865–868 states the pin's
hypotheses in the mathematically equivalent short form; #1854's head spells out the implication, which
would reach this folder when #1854 merges.

## Not verifiable

- H. Stichtenoth, *Algebraic Function Fields and Codes* (GTM 254): recorded as `uncertified` (no legal
  electronic copy); the pin's docstrings cite the same theorem numbers the README cites (Thm. 3.4.13 at
  `Hurwitz.lean` 69), and the computed instances above test the statements.
- Hartshorne, *Algebraic Geometry*, and Serre, *Local Fields*: recorded as `uncertified`; cited by locator
  alone.
- W. Fulton, *Algebraic Curves*: a cached text exists in the worker's sources cache, but none of the three
  sampled targets and no changed passage cites it, so nothing in it was checked this round.

## Source issues

- none
