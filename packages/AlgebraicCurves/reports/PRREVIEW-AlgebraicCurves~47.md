# Review of AlgebraicCurves (pull request #1854 at 56715a5)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines. `git diff c07dda7..HEAD -- TauCetiRoadmap/AlgebraicCurves`
is empty, so `README.md` (2054 lines) and `Suggested.lean` (39 lines) are byte-identical to what the previous
review read. The folder has in fact been unchanged since `c9c60d0`. The pins have not moved: Mathlib is
`1b1ccf4b` and Tau Ceti `2fd255d9`, and `lake-manifest.json` and `lean-toolchain` show no diff against main.

The two commits since `c07dda7` touch four files of two other folders:

- `1ccc517` changes `TauCetiRoadmap/AlgebraicTopology/{README.md,Suggested.lean}`;
- `56715a5` changes `TauCetiRoadmap/BordismFormalGroups/{README.md,Suggested.lean}`.

Neither folder is linked to this one. `grep -n -i "AlgebraicTopology\|BordismFormalGroups\|Bordism\|formal group"`
on both files of this folder finds nothing. `grep -n AlgebraicCurves` on the four changed files also finds
nothing. The only lines of the new diff that mention curves are about EllipticCurves and ModularCurves.

The one previous finding is still not repaired, so the gate still fails on it.

## R01 (P3) — two edits outside the pull request's roadmap folders (not repaired; previously R01)

**Location.** Two hunks, both unchanged since the previous review:

- `Completed/ArithmeticDirichletSeries/README.md` line 331: "`LFunctions` consumes this package alongside
  its own character-specific continuation".
- `TauCetiRoadmap/SymplecticGeometry/README.md` lines 76–78: "HeegaardFloer and DGFloer consume the
  geometric boundary and sign adapters of CG6".

**Claim.** The brief names sixteen folders besides AlgebraicCurves as this pull request's own. These two
folders are not on that list, so the gate fails `outside-folder`, and no folder of the pull request can be
accepted while it does.

What the two sentences say is not in question. Each states the direction of supply correctly, and the
description explains both cuts: ArithmeticDirichletSeries → LFunctions and SymplecticGeometry → DGFloer. The
only problem is where the edits are.

**Witness.** The worker's gate at `56715a5` (data) reports `outside-folder=2` on exactly these two files,
`FAIL`, and 0 on every other scanner, `build` included. `git diff --name-only origin/main...HEAD` lists 35
paths:

- 2 in this folder;
- 31 in the sixteen named folders;
- these 2.

**Repair.** This cannot be fixed from inside this folder. Do one of these:

- add `Completed/ArithmeticDirichletSeries` and `TauCetiRoadmap/SymplecticGeometry` to the pull request's own
  folders (the description already lists both cuts as its work); or
- move the two hunks to a pull request that owns those folders.

Tested on this head's diff: with those two paths owned or removed, every changed path lies inside the pull
request's folders, so `outside-folder` reads 0.

## Previous findings

- R01 — not repaired: `Completed/ArithmeticDirichletSeries/README.md` line 331 ("`LFunctions` consumes this
  package alongside …") and `TauCetiRoadmap/SymplecticGeometry/README.md` lines 76–78 are still in the diff.
  The gate still reports `outside-folder=2` on those files.

## Verified sound

**Gate.** The worker's gate at this head (data):

```
set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0
imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0
dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0
depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=2 source-material=0 build=0 FAIL
```

I also ran the gate myself (`gate … AlgebraicCurves --base origin/main`, exit 1). Every scanner reads 0
except `outside-folder=33`. Run by hand, the gate does not know this pull request's folder list, so it counts
every changed path outside `AlgebraicCurves/`. Those 33 paths are:

- 31 in the pull request's own folders:
  - AlgebraicTopology: 9;
  - 2 each: BanachSpaceTheory, BordismFormalGroups, CharacteristicClasses, ClassifyingSpaces,
    OperatorTheory/SelfAdjointSpectralTheory, RigidAnalyticGeometry, TopologicalKTheory;
  - 1 each: ComplexKahlerGeometry, GeneralizedCohomology, LocalPurity, MorseNovikov, PadicFunctionalAnalysis,
    PurityOfBranchLocus, ReductiveGroups, SchemeAndStackFoundations;
- the 2 paths of R01.

That agrees with the worker's count of 2. There is no stray file: the folder holds `README.md`,
`Suggested.lean`, `PROGRESS.md`, `STATUS.md` and `metadata.toml`.

**Dependency check** (`gate --depcheck … --movable`, against main `bbbde05`):

```
depcheck: 239 roadmaps, 2380 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. AlgebraicCurves is on main, which is why `ORDER.txt` does not
list it.

**Elaboration.** `lake env lean TauCetiRoadmap/AlgebraicCurves/Suggested.lean` exits 0 with no output. The
file declares nothing, so it does not even produce a `sorry` warning.

**Pinned names, elaborated again at this head.** I wrote a scratch file with `#check @…` for 29 names. It
imports `Mathlib` and the 21 Tau Ceti modules that define them, and it elaborated at the pins with exit 0 and
0 errors. The 29 names are:

- the docstring's 17 headline names;
- the 9 names the sampled Riemann–Hurwitz passage cites;
- Mathlib's `differentIdeal_eq_differentIdeal_mul_differentIdeal`;
- the carriers `TauCeti.IsFunctionField`, `TauCeti.Place` and `TauCeti.Divisor`.

The 17 headline names sit at the same files and lines as the previous report gives, for example
`…/Different/Hurwitz.lean`:72 and `…/TwoChartModel/AntiEquivalence.lean`:397. The other names, under
`TauCeti/` at the pin unless marked:

- `FieldTheory/FunctionField/Different/Hurwitz.lean`:
  - :160 `hurwitz_genus_formula_ratFunc`
  - :134 `genus_le_genus`
  - :120 `two_mul_genus_sub_two_eq_iff_forall_isTame`
  - :173 `different_ne_zero_of_one_lt_finrank`
- `…/Different/Tower.lean`:
  - :135 `Place.differentExponent_restrict_add`
  - :243 `Divisor.different_eq_conorm_add`
- `…/Different/Tame.lean`:
  - :386 `Divisor.tameDifferent`
  - :103 `Place.IsTame`
- `…/GeometricDegree.lean`:210 `geometricDegree`
- the carriers:
  - `…/Basic.lean`:51 `IsFunctionField`
  - `…/Place/Basic.lean`:103 `Place`
  - `…/Divisor/Basic.lean`:43 `Divisor`
- Mathlib `RingTheory/DedekindDomain/Different.lean`:572 `differentIdeal_eq_differentIdeal_mul_differentIdeal`

**Lean form.** Unchanged since the previous review:

- line 1 is `module`, and `public import Mathlib` is the only import;
- one module docstring names every headline by its pinned name;
- then `@[expose] public section` and an empty `namespace TauCetiRoadmap.AlgebraicCurves`;
- there is no `lemma`, `set_option`, `example`, `#eval`, sorry'd data or placeholder.

The padding probe has nothing to run on. Every headline is proved at the pin, so a file that states nothing is
the correct form.

**Seeded sample (unchanged passages, re-read at this head against main `bbbde05`).**

- *Riemann–Hurwitz* (README lines 864–890). `TauCeti.hurwitz_genus_formula` elaborates with these
  hypotheses:
  - `F′/F` finite and separable, and `k′/k` finite and separable;
  - both fields are function fields;
  - both constant fields are exact (`IsIntegrallyClosedIn`).

  Its conclusion `finrank k k′ * (2g′ − 2) = finrank F F′ * (2g − 2) + finrank k k′ * deg Diff` is the
  README's "cross-multiplied form of record". The other cited names also match the README:
  - `hurwitz_genus_formula_ratFunc` gives `2g − 2 = −2·finrank (RatFunc k) F + deg Diff` (Cor. 3.4.14);
  - `two_mul_genus_sub_two_eq_iff_forall_isTame` is an iff between equality with `geometricDegree` and
    `tameDifferent` and `∀ P′, IsTame`, under the hypotheses of `hurwitz_genus_formula`, as the README says
    (Cor. 3.5.6);
  - `genus_le_genus` has exact constants on both sides (Cor. 3.5.7);
  - `different_ne_zero_of_one_lt_finrank` needs `1 < finrank (RatFunc k) F` and exactness (Cor. 3.5.8).
- *Portfolio ownership* (README lines 29–34) agrees with BelyiMaps on main `bbbde05`. Its lines 185–186 cite
  AlgebraicCurves Layers 0–8 and 12 for the model and the anti-equivalence. The three carriers it names
  elaborate (see above).
- *Route decision (pinned)* (README lines 36–56) agrees with JacobianChallenge on main `bbbde05`:
  - its Layer A (line 111) and Layer B (line 135) exist;
  - its line 139 states `g := dim_k H¹(X, 𝒪_X)` and `χ(L) = deg L + 1 − g`, as the README quotes.

**Fulton locators (untouched text, newly readable).** The cached text `Fulton2008` now exists, so I checked
the README's Fulton locators (lines 1929–1938) against it:

- Ch. 5 is projective plane curves, with Bézout §5.3 and Max Noether §5.5 (`Fulton2008` lines 140–145).
- §8.3 Prop. 5 is the genus formula for ordinary multiple points (`Fulton2008` line 3937).
- §8.4 Prop. 6(2) assumes char 0 (`Fulton2008` line 4068).
- §8.5 Prop. 8 is the adjoint description of canonical divisors (`Fulton2008` line 4122).
- §8.6 is Riemann–Roch (`Fulton2008` line 4160).
- "repartition" occurs 0 times in the text, as the README claims.

All of these are correct.

**Overlaps (data, checked).**

- #1808: `roadmaps show AlgebraicCurves --pr 1808` matches this head byte for byte in both files, apart from
  the tool's one-line header. There is no conflict in this folder.
- #1807: it carries the older state. Its `Suggested.lean` still imports
  `TauCeti.FieldTheory.FunctionField.ConstantExtension.Algebraic` and `…RiemannRoch.Genus`, and its docstring
  covers only Layers 0–7, 9 and 10. The description's merge-order paragraph (#1101 → #1807 → this pull
  request) states which head survives, so this conflict has a stated order and is not a finding.
- No id this README cites is dropped by an open pull request, and this pull request drops none. The citations
  tool finds no unresolved citation or Lean name.

**Ownership.** I checked the closest open roadmaps at their heads:

- FunctionFieldArithmetic (#1474) line 28: "AlgebraicCurves owns places, divisors, `L(D)`, Weil differentials
  and Riemann–Roch …".
- HyperellipticCurves (#1707) lines 92–96 leave the function-field theory to AlgebraicCurves Layers 10–11.
- CanonicalModelsAndGonality (#1726) line 28 takes the regular projective model from AlgebraicCurves Layer 12.
- CurvesOverFiniteFields (#1729) cites AlgebraicCurves 10 times.

None of them claims an object this roadmap owns. I did not check NumberFieldArithmetic (#1187) or the
JacobianChallenge revision (#1892), because this brief does not give their files.

**Adversarial table.** The diff changes no statement. The rows below carry forward the previous report
(`PRREVIEW-AlgebraicCurves~41`), and I recomputed each value against the signatures elaborated above at this
head. The last three rows are new and cover the remaining sampled Riemann–Hurwitz names.

| statement | instances | left | right | result |
|---|---|---|---|---|
| `isFunctionField_iff_trdeg_eq_one` (~41) | `k = ℚ`: `ℚ(x)`; `ℚ(x, y)`; `ℚ`; `ℚ(x^{1/2^∞})` | function field: yes; no; no; no | trdeg `1`; `2`; `0`; `1` | holds; `[Algebra.EssFiniteType k F]` excludes the fourth and is needed |
| `Divisor.degree_principal` (~41) | `ℚ(x)`, `div(x² + 1) = P_{x²+1} − 2P_∞` | `1·2 − 2·1 = 0` | `0` | holds; unweighted count gives `−1` |
| `isRiemannRochDivisor_weilDifferentialDivisor` (~41) | `k(x)`, `W = −2P_∞`; `D = 0`, `D = P_∞` | `1 − 0 = 1`; `2 − 0 = 2` | `0 + 1 − 0 = 1`; `1 + 1 − 0 = 2` | holds; `W = 0` gives `0 ≠ 1` |
| `Divisor.two_mul_dim_le_degree_add_two` (~41) | `y² = x⁵ − 1`, `g = 2`: `D = 2P_∞`; `D = 0`; `D = 5P_∞` | `4`; `2`; `8` | `4`; `2`; `7` | equality in the first two; the third is out of range and violates the bound, so the range hypothesis is needed |
| `hurwitz_genus_formula` (sampled) | `y² − y = x³` over `𝔽₂`, `[k′:k] = 1`, `[F′:F] = 2`, wild at `∞`, `d = (3+1)(2−1) = 4` | `1·(2·1 − 2) = 0` | `2·(0 − 2) + 1·4 = 0` | holds; the tame count `Σ(e − 1) = 1` gives `−3` |
| same, constant factor (~41) | `ℚ(x) ⊂ ℚ(i)(x)`, `Diff = 0` | `2·(−2) = −4` | `2·(−2) + 2·0 = −4` | holds; without `[k′:k]` on the left: `−2 ≠ −4` |
| `hurwitz_genus_formula_ratFunc` (sampled) | `y² = x³ − x` over `ℚ`, degree 2, tame at `0, ±1, ∞` | `2·1 − 2 = 0` | `−2·2 + 4·1 = 0` | holds |
| `genus_le_genus` (sampled) | `ℚ(x) ⊂ ℚ(x, √(x³ − x))` | `g = 0` | `g′ = 1` | `0 ≤ 1` |
| `isDomain_tensorProduct_of_separating` (~41) | `k = ℝ`, `F = ℂ(x)`, `A = ℂ` | `(1⊗i − i⊗1)(1⊗i + i⊗1) = 0` | not a domain | exactness is needed |
| `genus_eq_genus_of_constantCompositum_eq_top` (~41) | `y² = x³ − x` over `ℚ`, `k′ = ℚ(i)` | `g′ = 1` | `g = 1` | holds; the inseparable row of ~28 drops `1 → 0` |
| `genus_le_genus_of_constantCompositum_eq_top` (~41) | `y² = x³ − t` over `𝔽₃(t)`, `k′ = k(t^{1/3})` | `g′ = 0` | `g = 1` | `0 ≤ 1`, strict |
| `finrank_kaehlerDifferential_eq_one_of_separating` (~41) | `𝔽_p(x)`; `k(s, x)`, `s^p = t`, `k = 𝔽_p(t)` | rank `1`; rank `2` | `1`; no separating element | the separating hypothesis is needed |
| `finsum_traceResidue…_eq_zero` (~41) | `k(x)`, `ω = dx/x` | `1 + (−1)` | `0` | holds |
| `genus_eq_of_sq_eq` (~41) | `deg f = 5; 6; 1; 2`, char `≠ 2`; `𝔽₂`, `y² = x³ + x + 1` | `2; 2; 0; 0`; `0` | `2; 2; 0; 0`; `1` | holds; `(2 : k) ≠ 0` is needed |
| `finite_algEquiv_of_two_le_genus` (~41) | genus 0; genus 1; `y² = x⁵ − 1` | infinite; infinite; `ℤ/10` | bound fails; fails; finite | the genus bound is needed |
| `natCard_le_eighty_four_mul_genus_sub_one` (~41) | Klein quartic `g = 3`; Hermitian `q = 41`, `g = 820` | `168`; `41³ = 68921` | `168`; `84·819 = 68796` | equality; the wild case violates the bound, so tameness is needed |
| `isProjectiveOver_of_isCurveOver` (~41) | `ℙ¹_k`; `𝔸¹_k` | proper; not proper | projective; class fails | holds |
| `RegularProjectiveCurveCat.equivFunctionFieldCat` (~41) | `ℙ¹ → ℙ¹`, `t ↦ t²` | `k(x) → k(x)`, `x ↦ x²` | arrow of `(FunctionFieldCat k)ᵒᵖ` | contravariant, as the README says |
| `twoChartModel.genus_eq_genus` (~41) | `F = k(x)` | `0` | `0` | holds |
| `two_mul_genus_sub_two_eq_iff_forall_isTame` (new row) | `y² = x³ − x` over `ℚ`, `n = 2`; `y² − y = x³` over `𝔽₂` | `0 = 2·(−2) + 4`: true; `0 = 2·(−2) + 1`: false | all tame: true; `∞` wild: false | the iff holds in both directions |
| `different_ne_zero_of_one_lt_finrank` (new row) | `𝔽₂(x) ⊂ 𝔽₂(y)`, `x = y² − y`; `F = ℚ(x)` | `deg Diff = 2` (wild at `∞`), and Hurwitz `−2 = 2·(−2) + 2` checks; degree `1` | `Diff ≠ 0`; `1 < 1` fails, `Diff = 0` | holds; the degree hypothesis is needed |
| `Divisor.different_eq_conorm_add` (new row) | `ℚ(x) ⊂ ℚ(√x) ⊂ ℚ(x^{1/4})`, over `0` | `d(P″∣P) = 3` (tame, `e = 4`) | `e(P″∣P′)·d(P′∣P) + d(P″∣P′) = 2·1 + 1 = 3` | holds |
| other rows of ~28 (Hilbert different, Abhyankar, split-completely, class-group bridge, Castelnuovo, Weierstrass counts, …) | as in `PRREVIEW-AlgebraicCurves~28` | bytes unchanged | pins unchanged | carried forward |

**Remark carried from the previous review (untouched text, no change requested).** The elaborated
`hurwitz_genus_formula` carries `[FiniteDimensional k k′] [Algebra.IsSeparable k k′]`, while README line 865
says only "with constant fields `k′/k`". Its other hypotheses imply both instances: with `F` exact over `k`,
the minimal polynomial over `F` of any `a ∈ k′` has coefficients in `k`, and `F′/F` is separable.

## Not verifiable

- H. Stichtenoth, *Algebraic Function Fields and Codes* (GTM 254); Hartshorne; Serre, *Local Fields*. The board
  manifest records all three as `uncertified` (paywalled, cited by locator). The sampled Stichtenoth locators
  (Thm. 3.4.13, Cor. 3.4.14, Cor. 3.5.6–3.5.8) are in unchanged passages. I checked them against the pinned
  declarations, whose docstrings give the same theorem numbers.
- Liu, Goldschmidt, Villa Salvador and Deuring: I know of no legal electronic copy, and the manifest does not
  record them.

## Source issues

- none
