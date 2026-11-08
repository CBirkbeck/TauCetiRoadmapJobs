# Review of AlgebraicCurves (pull request #1854 at c9c60d0)

**Verdict:** needs changes

This is an incremental re-review: 0 lines of this folder changed since `d723ba1`, the head the previous
review read. `git diff d723ba1..HEAD -- TauCetiRoadmap/AlgebraicCurves` is empty. `README.md` (2054 lines)
and `Suggested.lean` (39 lines) are byte-identical to what the previous review read, and the pins are
the same (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`; `lake-manifest.json` and `lean-toolchain` are unchanged
against main). The only commit since then, `c9c60d0`, changes `TauCetiRoadmap/AlgebraicTopology/README.md`
and `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`. This README never cites AlgebraicTopology
(`grep -n -i "AlgebraicTopology\|Algebraic Topology"` on both files has no match), so that commit
touches nothing this roadmap relies on. The one previous finding is not repaired, and it keeps the gate
failing.

## R01 (P3) — two edits outside the pull request's roadmap folders (not repaired; previously R01)

**Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 ("`LFunctions` consumes this
package alongside its own character-specific continuation") and
`TauCetiRoadmap/SymplecticGeometry/README.md` lines 76–78 ("HeegaardFloer and DGFloer consume the
geometric boundary and sign adapters of CG6").

**Claim.** The pull request edits two folders that are not among its own. The brief names sixteen
folders besides this one as the pull request's own, and these two are not on that list. The gate
therefore fails on `outside-folder`, and no folder of this pull request can be accepted while it does.
Both sentences state the supply direction correctly (the description explains both cuts:
ArithmeticDirichletSeries → LFunctions and SymplecticGeometry → DGFloer). The problem is where the
edits sit, not what they say.

**Witness.** The worker's gate at this head (data) reports `outside-folder=2` on exactly these two
files and `FAIL`. Every other scanner is 0, and `build=0`. On my side,
`git diff --name-only origin/main...HEAD` lists 33 changed files outside this folder. 31 of them fall in
the sixteen named folders. The remaining 2 are these files, one hunk each (4 insertions, 4 deletions).

**Repair.** Either add `Completed/ArithmeticDirichletSeries` and `TauCetiRoadmap/SymplecticGeometry` to
the pull request's own folders (the description already lists both cuts as its work), or move the two
hunks into a pull request that owns those folders. This cannot be fixed from inside this folder.
Tested against the same diff: with those two files owned or removed, the 33 changed paths all fall
inside the pull request's folders, so `outside-folder` reads 0.

## Previous findings

- R01 — not repaired: the same two hunks sit at this head, `Completed/ArithmeticDirichletSeries/README.md`
  line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` lines 76–78. The gate still reports
  `outside-folder=2` on those files.

## Verified sound

**Gate.** The worker's gate at this head (data):

```
set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0
imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0
dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0
depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=2 source-material=0 build=0 FAIL
```

I also ran the gate myself with `--base origin/main`. Every scanner is 0 except `outside-folder=33`:
run by hand, the gate does not know this pull request's folder list, so it counts all 33 changed paths
outside `AlgebraicCurves/`. Counted per folder, those 33 are AlgebraicTopology 9, BanachSpaceTheory 2,
BordismFormalGroups 2, CharacteristicClasses 2, ClassifyingSpaces 2, ComplexKahlerGeometry 1,
GeneralizedCohomology 1, LocalPurity 1, MorseNovikov 1, OperatorTheory/SelfAdjointSpectralTheory 2,
PadicFunctionalAnalysis 1, PurityOfBranchLocus 1, ReductiveGroups 1, RigidAnalyticGeometry 2,
SchemeAndStackFoundations 1, TopologicalKTheory 2 (31 in all, every one in the pull request's own
folders), plus the two files of R01. This agrees with the worker's count of 2. No stray file: the
folder holds `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md` and `metadata.toml`, as on main.

**Dependency check** (`gate --depcheck … --movable`), run at this head:

```
depcheck: 245 roadmaps, 2492 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line, and AlgebraicCurves is on main.

**Elaboration.** `lake env lean TauCetiRoadmap/AlgebraicCurves/Suggested.lean` exits 0 with no output.
The file declares nothing, so there is not even a `sorry` warning.

**Pinned headline names, elaborated.** I put `#check @…` for 19 names in a scratch file that imports
`Mathlib` and the 16 defining Tau Ceti modules, and elaborated it at the pins: 0 errors, 19 signatures.
The 19 are the module docstring's 17 headline names plus `TauCeti.hurwitz_genus_formula_ratFunc` and
`TauCeti.genus_le_genus` from the Riemann–Hurwitz passage. Where each is declared:

- `isFunctionField_iff_trdeg_eq_one`: `FieldTheory/FunctionField/Basic.lean` 155
- `Divisor.degree_principal`: `Divisor/ProductFormula.lean` 255
- `isRiemannRochDivisor_weilDifferentialDivisor`: `Differential/CanonicalDivisor.lean`
- `Divisor.two_mul_dim_le_degree_add_two`: `Consequences/Clifford.lean`
- `hurwitz_genus_formula`, `hurwitz_genus_formula_ratFunc`, `genus_le_genus`: `Different/Hurwitz.lean`
  72, 160, 134
- `isDomain_tensorProduct_of_separating`: `FieldTheory/Separable/Regular.lean`
- `genus_eq_genus_of_constantCompositum_eq_top`, `genus_le_genus_of_constantCompositum_eq_top`:
  `ConstantExtension/Genus/Basic.lean`
- `finrank_kaehlerDifferential_eq_one_of_separating`: `Differential/Kaehler.lean`
- `finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero`: `Differential/Independence.lean`
- `genus_eq_of_sq_eq`: `Hyperelliptic/Genus/Basic.lean`
- `finite_algEquiv_of_two_le_genus`: `Automorphism/HigherGenus.lean`
- `natCard_le_eighty_four_mul_genus_sub_one`: `Automorphism/HurwitzBound.lean`
- `AlgebraicGeometry.twoChartModel`: `Curves/TwoChartModel/Basic.lean` 143
- `AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver`: `TwoChartModel/ProjectiveEmbedding.lean`
- `RegularProjectiveCurveCat.equivFunctionFieldCat`: `TwoChartModel/AntiEquivalence.lean` 397
- `twoChartModel.genus_eq_genus`: `TwoChartModel/Genus.lean` 60

The anti-equivalence elaborates as `RegularProjectiveCurveCat k ≌ (FunctionFieldCat k)ᵒᵖ`, contravariant
as the README says. `IsCurveOver` (`Curves/Basic.lean` 37) is integral, proper and of dimension one, so
properness is in scope for the projectivity theorem.

**Lean form.** Unchanged from the previous review: line 1 `module`, `public import Mathlib` as the only
import, one module docstring that says the roadmap is `README.md` and names every headline by its pinned
name, then `@[expose] public section` and `namespace TauCetiRoadmap.AlgebraicCurves`, with no declaration.
There is no `lemma`, `set_option`, `example`, `#eval`, sorry'd data or placeholder. The padding probe has
nothing to probe. A file that states nothing because the pin proves every headline is the correct form.

**Seeded sample (unchanged passages, re-read at this head).**

- *Riemann–Hurwitz* (README 864–885) against the elaborated `TauCeti.hurwitz_genus_formula`. Hypotheses:
  `F′/F` is finite and separable, `k′/k` is finite and separable, both are function fields, and both
  constant fields are exact (`IsIntegrallyClosedIn`). The conclusion
  `[k′:k]·(2g′ − 2) = [F′:F]·(2g − 2) + [k′:k]·deg Diff` is exactly the README's "cross-multiplied form
  of record". `hurwitz_genus_formula_ratFunc` concludes `2g − 2 = −2[F : k(x)] + deg Diff`, as Cor. 3.4.14
  is stated in the README.
- *Portfolio ownership* (README 29–34) agrees with BelyiMaps on main, whose lines 185–186 cite
  AlgebraicCurves Layers 0–8 and 12 for the model and the anti-equivalence.
- *Route decision (pinned)* (README 36–56) agrees with JacobianChallenge on main: line 139 states
  `g := dim_k H¹(X, 𝒪_X)` and Riemann–Roch as `χ(L) = deg L + 1 − g`, as the README quotes.

**Overlaps (data, checked).** `roadmaps show AlgebraicCurves --pr 1808` is byte-identical to this head
in both files (`diff` is empty), so there is no conflict in this folder. #1807 carries the older state:
its `Suggested.lean` imports two Tau Ceti modules, and its README line 347 says "Layers 0–7 and 10". The
description's merge order (#1101 → #1807 → this pull request) makes this head the surviving version. No
id this README cites is dropped by an open pull request, this pull request drops none, and the citations
tool finds no unresolved citation or Lean name.

**Ownership.** The closest roadmaps in vocabulary (CanonicalModelsAndGonality, HyperellipticCurves,
FunctionFieldArithmetic, CurvesOverFiniteFields) were checked by earlier reviews of these same bytes.
This folder has not changed since, so that result carries forward. Ownership against open pull requests
whose files this brief does not give (NumberFieldArithmetic, #1187) was not checked.

**Adversarial table.** The diff changes no statement, so the 33 rows of `PRREVIEW-AlgebraicCurves~28`
(carried forward unchanged by `~31`) carry forward again. The rows below give values for the sampled
target and for each headline, recomputed at this head against the elaborated signatures above. Rows
marked ~28 are that report's values, re-read.

| statement | instances | left | right | result |
|---|---|---|---|---|
| `isFunctionField_iff_trdeg_eq_one` | `k = ℚ`: `F = ℚ(x)`; `ℚ(x, y)`; `ℚ`; `ℚ(x^{1/2^∞})` | function field: yes; no; no; no | trdeg `1`; `2`; `0`; `1` | holds on the first three; the fourth (trdeg 1, not a function field) is excluded by `[Algebra.EssFiniteType k F]`, which is load-bearing |
| `Divisor.degree_principal` | `ℚ(x)`, `z = x² + 1`: `div z = P_{x²+1} − 2P_∞` | `1·2 − 2·1 = 0` | `0` | holds; counting places without the residue degree gives `1 − 2 = −1`, so the weighting is load-bearing (~28) |
| `isRiemannRochDivisor_weilDifferentialDivisor` | `k(x)`, `W = div(dx) = −2P_∞`, `g = 0`; `D = 0`, `D = P_∞` | `ℓ(0) − ℓ(W) = 1 − 0 = 1`; `ℓ(P_∞) − ℓ(−3P_∞) = 2 − 0 = 2` | `0 + 1 − 0 = 1`; `1 + 1 − 0 = 2` | holds; the wrong class `W = 0` gives `1 − 1 = 0 ≠ 1` at `D = 0` |
| `Divisor.two_mul_dim_le_degree_add_two` (Clifford) | `y² = x⁵ − 1` over `ℚ`, `g = 2`: `D = 2P_∞` (`L = ⟨1, x⟩`); `D = 0` | `2·2 = 4`; `2·1 = 2` | `2 + 2 = 4`; `0 + 2 = 2` | equality in both (hyperelliptic); `D = 5P_∞` (`ℓ = 4`, outside `deg ≤ 2g − 2`) gives `8 > 7`; `D = −3P` gives `0 > −1`; both range hypotheses are load-bearing |
| `hurwitz_genus_formula` (sampled) | `y² − y = x³` over `𝔽₂`, `[k′:k] = 1`, `[F′:F] = 2`, `Diff = 4Q_∞` | `1·(2·1 − 2) = 0` | `2·(0 − 2) + 1·4 = 0` | holds; the tame count `Σ(e − 1) = 1` would give `−3`, so the wild different is load-bearing |
| same, constant factor (~28) | `F = ℚ(x)`, `F′ = ℚ(i)(x)`, `Diff = 0` | `2·(−2) = −4` | `[F′:F]·(−2) + [k′:k]·0 = 2·(−2) + 2·0 = −4` | holds; without `[k′:k]` on the left it reads `−2 ≠ −4` |
| `hurwitz_genus_formula_ratFunc` | `y² = x³ − x` over `ℚ`, `[F : ℚ(x)] = 2`, tame at `0, ±1, ∞` | `2·1 − 2 = 0` | `−2·2 + 4 = 0` | holds |
| `isDomain_tensorProduct_of_separating` (~28) | `k = ℝ`, `F = ℂ(x)`, `A = ℂ` (constants not exact) | `(1⊗i − i⊗1)(1⊗i + i⊗1) = 0`, both factors nonzero | not a domain | exactness is load-bearing |
| `genus_eq_genus_of_constantCompositum_eq_top` | `y² = x³ − x` over `ℚ`, `k′ = ℚ(i)` | `g′ = 1` | `g = 1` | holds; the inseparable `p = 3` row of ~28 drops `1 → 0`, so `[Algebra.IsSeparable k k′]` is load-bearing |
| `genus_le_genus_of_constantCompositum_eq_top` (~28) | `y² = x³ − t` over `𝔽₃(t)`, `k′ = k(t^{1/3})` | `g′ = 0` | `g = 1` | `0 ≤ 1`, strict |
| `finrank_kaehlerDifferential_eq_one_of_separating` | `F = 𝔽_p(x)`; `F = k(s, x)`, `s^p = t`, `k = 𝔽_p(t)` | `Ω = F·dx`, rank `1`; `Ω = F·ds ⊕ F·dx`, rank `2` | `1`; no separating element exists | holds; the second instance shows the separating hypothesis is load-bearing |
| `finsum_traceResidue…_eq_zero` (~28) | `k(x)`, `ω = dx/x`, `t_0 = x`, `t_∞ = 1/x` | `res_0 + res_∞ = 1 + (−1)` | `0` | holds |
| `genus_eq_of_sq_eq` | `deg f = 5; 6; 1; 2`, char `≠ 2` | `2; 2; 0; 0` | `(m − 1)/2` in `ℕ`: `2; 2; 0; 0` | holds; over `𝔽₂`, `y² = x³ + x + 1` gives `F = 𝔽₂(√x)` of genus `0` against `1`, so `(2 : k) ≠ 0` is load-bearing |
| `finite_algEquiv_of_two_le_genus` (~28) | genus 0 (`PGL₂(ℂ)`), genus 1 (translations); `y² = x⁵ − 1` | infinite, infinite; `ℤ/10` | `2 ≤ g` fails; finite | genus bound is load-bearing |
| `natCard_le_eighty_four_mul_genus_sub_one` | Klein quartic over `ℂ`, `g = 3`; `y² = x⁷ − 1`, `G ≅ ℤ/14` | `168`; `14` | `84·2 = 168`; `168` | holds, with equality for the Klein quartic; the wild Hermitian `q = 41` Sylow subgroup gives `68921 > 68796` (~28), so tameness is load-bearing |
| `isProjectiveOver_of_isCurveOver` | `ℙ¹_k`; `𝔸¹_k` | proper, integral, dimension 1; not proper | projective; `IsCurveOver` fails | holds; properness is in the class |
| `RegularProjectiveCurveCat.equivFunctionFieldCat` | `ℙ¹ → ℙ¹`, `t ↦ t²` | `k(x) → k(x)`, `x ↦ x²` (pull-back) | an arrow of `(FunctionFieldCat k)ᵒᵖ` | direction matches "anti-equivalence" |
| `twoChartModel.genus_eq_genus` (~28) | `F = k(x)`, `x` itself | `Scheme.genus ℙ¹ = 0` | `genus k k(x) = 0` | holds |
| the remaining 22 rows of ~28 (Hilbert different, Abhyankar, split-completely, class-group bridge, Castelnuovo, Weierstrass counts, …) | as in `PRREVIEW-AlgebraicCurves~28` lines 178–210 | unchanged bytes | unchanged pins | carried forward, no change |

## Not verifiable

- H. Stichtenoth, *Algebraic Function Fields and Codes* (GTM 254); W. Fulton, *Algebraic Curves*; Liu,
  Hartshorne, Goldschmidt, Villa Salvador, Deuring: none has a legal electronic copy. The sampled
  locators (Thm. 3.4.13, Cor. 3.4.14, Cor. 3.5.6–3.5.8) sit in unchanged passages. They were checked
  against the pinned declarations, whose docstrings give the same theorem numbers.
- The board package records no `sources.toml`, so no cached text exists for it.

## Source issues

- none
