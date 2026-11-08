# Review of AlgebraicCurves (pull request #1854 at c07dda7)

**Verdict:** needs changes

This is an incremental re-review. No line of this folder has changed since `c9c60d0`, the head the previous
review read: `git diff c9c60d0..HEAD -- TauCetiRoadmap/AlgebraicCurves` is empty. `README.md` (2054 lines)
and `Suggested.lean` (39 lines) are byte-identical to what that review read. The pins have not moved
either (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`), and `lake-manifest.json` and `lean-toolchain` match main.
The only commit since then, `c07dda7`, changes `TauCetiRoadmap/CharacteristicClasses/README.md` and
`TauCetiRoadmap/CharacteristicClasses/Suggested.lean`. This README never cites CharacteristicClasses
(`grep -n -i "CharacteristicClasses\|Characteristic classes"` on both files finds nothing), and the
CharacteristicClasses README never cites AlgebraicCurves. So that commit touches nothing this roadmap
relies on. The one previous finding is still not repaired, and the gate still fails because of it.

## R01 (P3) — two edits outside the pull request's roadmap folders (not repaired; previously R01)

**Location.** Two lines:

- `Completed/ArithmeticDirichletSeries/README.md` line 331: "`LFunctions` consumes this package alongside
  its own character-specific continuation".
- `TauCetiRoadmap/SymplecticGeometry/README.md` lines 76–78: "HeegaardFloer and DGFloer consume the
  geometric boundary and sign adapters of CG6".

**Claim.** The pull request edits two folders that are not among its own. The brief names sixteen folders
besides this one as the pull request's own, and these two are not on that list. The gate therefore fails
on `outside-folder`. While it does, no folder of this pull request can be accepted. Both sentences state
the direction of supply correctly, and the description explains both cuts (ArithmeticDirichletSeries →
LFunctions and SymplecticGeometry → DGFloer). The problem is where the edits are, not what they say.

**Witness.** The worker's gate at `c07dda7` (data) reports `outside-folder=2` on exactly these two files,
and `FAIL`. Every other scanner reports 0, and `build=0`. `git diff --name-only origin/main...HEAD` lists
35 paths: 2 in this folder, 31 in the sixteen named folders, and these 2.

**Repair.** Either of two:

- add `Completed/ArithmeticDirichletSeries` and `TauCetiRoadmap/SymplecticGeometry` to the pull request's
  own folders (the description already lists both cuts as its work); or
- move the two hunks to a pull request that owns those folders.

This cannot be fixed from inside this folder. Tested on the same diff: with those two files owned or
removed, every changed path lies inside the pull request's folders, so `outside-folder` reads 0.

## Previous findings

- R01 — not repaired: the same two hunks are still at this head, in
  `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md`
  lines 76–78. The gate still reports `outside-folder=2` on those files.

## Verified sound

**Gate.** The worker's gate at this head (data):

```
set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0
imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0
dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0
depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=2 source-material=0 build=0 FAIL
```

I also ran the gate myself (`gate … AlgebraicCurves --base origin/main`). Every scanner is 0 except
`outside-folder=33`. Run by hand, the gate does not know this pull request's folder list, so it counts
every changed path outside `AlgebraicCurves/`. Those 33 paths are:

- 31 in the pull request's own folders: AlgebraicTopology 9; BanachSpaceTheory, BordismFormalGroups,
  CharacteristicClasses, ClassifyingSpaces, OperatorTheory/SelfAdjointSpectralTheory,
  RigidAnalyticGeometry and TopologicalKTheory 2 each; ComplexKahlerGeometry, GeneralizedCohomology,
  LocalPurity, MorseNovikov, PadicFunctionalAnalysis, PurityOfBranchLocus, ReductiveGroups and
  SchemeAndStackFoundations 1 each;
- the 2 files of R01.

This agrees with the worker's count of 2. There is no stray file: the folder holds `README.md`,
`Suggested.lean`, `PROGRESS.md`, `STATUS.md` and `metadata.toml`.

**Dependency check** (`gate --depcheck … --movable`, against main `c58403c`):

```
depcheck: 238 roadmaps, 2368 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. AlgebraicCurves is on main.

**Elaboration.** `lake env lean TauCetiRoadmap/AlgebraicCurves/Suggested.lean` exits 0 with no output.
The file declares nothing, so there is not even a `sorry` warning.

**Pinned headline names, elaborated again at this head.** I wrote a scratch file with `#check @…` for 19
names. It imports `Mathlib` and the 16 Tau Ceti modules that define those names. It elaborated at the pins
with exit 0 and 0 errors, giving 19 signatures. The 19 names are the module docstring's 17 headline names
plus `TauCeti.hurwitz_genus_formula_ratFunc` and `TauCeti.genus_le_genus` from the Riemann–Hurwitz passage.
Where each is declared, under `TauCeti/` at the pin:

- `FieldTheory/FunctionField/Basic.lean`:155 `isFunctionField_iff_trdeg_eq_one`
- `…/Divisor/ProductFormula.lean`:255 `Divisor.degree_principal`
- `…/Differential/CanonicalDivisor.lean`:415 `isRiemannRochDivisor_weilDifferentialDivisor`
- `…/Consequences/Clifford.lean`:317 `Divisor.two_mul_dim_le_degree_add_two`
- `…/Different/Hurwitz.lean`:72, 160, 134 `hurwitz_genus_formula`, `hurwitz_genus_formula_ratFunc`,
  `genus_le_genus`
- `FieldTheory/Separable/Regular.lean`:142 `isDomain_tensorProduct_of_separating`
- `…/ConstantExtension/Genus/Basic.lean`:273, 243 `genus_eq_genus_of_constantCompositum_eq_top`,
  `genus_le_genus_of_constantCompositum_eq_top`
- `…/Differential/Kaehler.lean`:140 `finrank_kaehlerDifferential_eq_one_of_separating`
- `…/Differential/Independence.lean`:386 `finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero`
- `…/Hyperelliptic/Genus/Basic.lean`:339 `genus_eq_of_sq_eq`
- `…/Automorphism/HigherGenus.lean`:124 `finite_algEquiv_of_two_le_genus`
- `…/Automorphism/HurwitzBound.lean`:83 `natCard_le_eighty_four_mul_genus_sub_one`
- `AlgebraicGeometry/Curves/TwoChartModel/Basic.lean`:143 `AlgebraicGeometry.twoChartModel`
- `…/TwoChartModel/ProjectiveEmbedding.lean`:185 `AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver`
  (namespace `AlgebraicGeometry.Scheme`, outside `TauCeti`, as the docstring writes it)
- `…/TwoChartModel/AntiEquivalence.lean`:397 `RegularProjectiveCurveCat.equivFunctionFieldCat`
- `…/TwoChartModel/Genus.lean`:60 `twoChartModel.genus_eq_genus`

The anti-equivalence elaborates as `RegularProjectiveCurveCat k ≌ (FunctionFieldCat k)ᵒᵖ`, which is
contravariant, as the README says.

**Lean form.** Unchanged from the previous review:

- line 1 is `module`, and `public import Mathlib` is the only import;
- one module docstring says the roadmap is `README.md` and names every headline by its pinned name;
- then `@[expose] public section` and `namespace TauCetiRoadmap.AlgebraicCurves`, with no declaration;
- there is no `lemma`, `set_option`, `example`, `#eval`, sorry'd data or placeholder.

The padding probe has nothing to probe. Every headline is already proved at the pin, so a file that states
nothing is the correct form.

**Seeded sample (unchanged passages, re-read at this head).**

- *Riemann–Hurwitz* (README 864–885), checked against the elaborated `TauCeti.hurwitz_genus_formula`.
  The hypotheses are: `F′/F` finite and separable, `k′/k` finite and separable, both fields function
  fields, and both constant fields exact (`IsIntegrallyClosedIn`). The conclusion is
  `finrank k k′ * (2g′ − 2) = finrank F F′ * (2g − 2) + finrank k k′ * deg Diff`, which is exactly the
  README's "cross-multiplied form of record". `hurwitz_genus_formula_ratFunc` concludes
  `2g − 2 = −2·finrank (RatFunc k) F + deg Diff`, as the README states Cor. 3.4.14.
- *Portfolio ownership* (README 29–34) agrees with BelyiMaps on main (`c58403c`). Its lines 185–186 cite
  AlgebraicCurves Layers 0–8 and 12 for the model and the anti-equivalence.
- *Route decision (pinned)* (README 36–56) agrees with JacobianChallenge on main. Its line 139 states
  `g := dim_k H¹(X, 𝒪_X)` and Riemann–Roch as `χ(L) = deg L + 1 − g`, as the README quotes.

**Overlaps (data, checked).**

- `roadmaps show AlgebraicCurves --pr 1808` matches this head byte for byte in both files, apart from the
  tool's one-line header. So there is no conflict in this folder.
- #1807 carries the older state: its `Suggested.lean` imports
  `TauCeti.FieldTheory.FunctionField.ConstantExtension.Algebraic` and `…RiemannRoch.Genus`. The
  description's merge order (#1101 → #1807 → this pull request) makes this head the version that survives.
- No id this README cites is dropped by an open pull request, and this pull request drops none.
- The citations tool finds no unresolved citation or Lean name.

**Ownership.** Earlier reviews checked the closest roadmaps in vocabulary (CanonicalModelsAndGonality,
HyperellipticCurves, FunctionFieldArithmetic, CurvesOverFiniteFields, JacobianChallenge) against these
same bytes. The folder has not changed since, so that result carries forward. I did not check ownership
against NumberFieldArithmetic (#1187), whose files this brief does not give.

**Adversarial table.** The diff changes no statement. The rows below carry forward the previous report
(`PRREVIEW-AlgebraicCurves~37`). I recomputed each value against the signatures elaborated above at this
head. Rows marked ~28 take their instances from that report.

| statement | instances | left | right | result |
|---|---|---|---|---|
| `isFunctionField_iff_trdeg_eq_one` | `k = ℚ`: `F = ℚ(x)`; `ℚ(x, y)`; `ℚ`; `ℚ(x^{1/2^∞})` | function field: yes; no; no; no | trdeg `1`; `2`; `0`; `1` | holds on the first three; `[Algebra.EssFiniteType k F]` excludes the fourth (trdeg 1, not a function field) and is needed |
| `Divisor.degree_principal` | `ℚ(x)`, `z = x² + 1`: `div z = P_{x²+1} − 2P_∞` | `1·2 − 2·1 = 0` | `0` | holds; counting places without their degree gives `1 − 2 = −1`, so the weighting is needed |
| `isRiemannRochDivisor_weilDifferentialDivisor` | `k(x)`, `W = −2P_∞`, `g = 0`; `D = 0`, `D = P_∞` | `ℓ(0) − ℓ(W) = 1 − 0 = 1`; `ℓ(P_∞) − ℓ(−3P_∞) = 2 − 0 = 2` | `0 + 1 − 0 = 1`; `1 + 1 − 0 = 2` | holds; the wrong class `W = 0` gives `1 − 1 = 0 ≠ 1` at `D = 0` |
| `Divisor.two_mul_dim_le_degree_add_two` (Clifford) | `y² = x⁵ − 1` over `ℚ`, `g = 2`: `D = 2P_∞` (`L = ⟨1, x⟩`); `D = 0` | `2·2 = 4`; `2·1 = 2` | `2 + 2 = 4`; `0 + 2 = 2` | equality in both (hyperelliptic); `D = 5P_∞` (`L = ⟨1, x, x², y⟩`, `ℓ = 4`) gives `8 > 7`, and `D = −3P` gives `0 > −1`, so both range hypotheses are needed |
| `hurwitz_genus_formula` (sampled) | `y² − y = x³` over `𝔽₂`, `[k′:k] = 1`, `[F′:F] = 2`, one wild place over `∞` with `d = (3+1)(2−1) = 4` | `1·(2·1 − 2) = 0` | `2·(0 − 2) + 1·4 = 0` | holds; the tame count `Σ(e − 1) = 1` would give `−3`, so the wild different is needed |
| same, constant factor (~28) | `F = ℚ(x)`, `F′ = ℚ(i)(x)`, `Diff = 0` | `2·(−2) = −4` | `2·(−2) + 2·0 = −4` | holds; without `[k′:k]` on the left it reads `−2 ≠ −4` |
| `hurwitz_genus_formula_ratFunc` (sampled) | `y² = x³ − x` over `ℚ`, `[F : ℚ(x)] = 2`, tame at `0, ±1, ∞` | `2·1 − 2 = 0` | `−2·2 + 4·1 = 0` | holds |
| `genus_le_genus` (sampled) | `ℚ(x) ⊂ ℚ(x, √(x³ − x))` | `g = 0` | `g′ = 1` | `0 ≤ 1` |
| `isDomain_tensorProduct_of_separating` (~28) | `k = ℝ`, `F = ℂ(x)`, `A = ℂ` (constants not exact) | `(1⊗i − i⊗1)(1⊗i + i⊗1) = 0`, both factors nonzero | not a domain | exactness is needed |
| `genus_eq_genus_of_constantCompositum_eq_top` | `y² = x³ − x` over `ℚ`, `k′ = ℚ(i)` | `g′ = 1` | `g = 1` | holds; the inseparable `p = 3` row of ~28 drops `1 → 0`, so `[Algebra.IsSeparable k k′]` is needed |
| `genus_le_genus_of_constantCompositum_eq_top` (~28) | `y² = x³ − t` over `𝔽₃(t)`, `k′ = k(t^{1/3})` | `g′ = 0` | `g = 1` | `0 ≤ 1`, strict |
| `finrank_kaehlerDifferential_eq_one_of_separating` | `F = 𝔽_p(x)`; `F = k(s, x)`, `s^p = t`, `k = 𝔽_p(t)` | `Ω = F·dx`, rank `1`; `Ω = F·ds ⊕ F·dx`, rank `2` | `1`; no separating element exists | holds; the second instance shows the separating hypothesis is needed |
| `finsum_traceResidue…_eq_zero` (~28) | `k(x)`, `ω = dx/x`, `t_0 = x`, `t_∞ = 1/x` | `res_0 + res_∞ = 1 + (−1)` | `0` | holds |
| `genus_eq_of_sq_eq` | `deg f = 5; 6; 1; 2`, char `≠ 2` | `2; 2; 0; 0` | `(m − 1)/2` in `ℕ`: `2; 2; 0; 0` | holds; over `𝔽₂`, `y² = x³ + x + 1` gives the purely inseparable `𝔽₂(x^{1/2})` of genus `0`, against `1`, so `(2 : k) ≠ 0` is needed |
| `finite_algEquiv_of_two_le_genus` (~28) | genus 0 (`PGL₂(ℂ)`); genus 1 (translations); `y² = x⁵ − 1` | infinite; infinite; `ℤ/10` | `2 ≤ g` fails; fails; finite | the genus bound is needed |
| `natCard_le_eighty_four_mul_genus_sub_one` | Klein quartic over `ℂ`, `g = 3`; `y² = x⁷ − 1`, `G ⊇ ℤ/14` | `168`; `14` | `84·2 = 168`; `168` | holds, with equality for the Klein quartic; the wild Hermitian curve at `q = 41` (`g = 820`) has a Sylow subgroup of order `41³ = 68921 > 84·819 = 68796`, so tameness is needed |
| `isProjectiveOver_of_isCurveOver` | `ℙ¹_k`; `𝔸¹_k` | proper, integral, dimension 1; not proper | projective; `IsCurveOver` fails | holds; properness is part of the class |
| `RegularProjectiveCurveCat.equivFunctionFieldCat` | `ℙ¹ → ℙ¹`, `t ↦ t²` | `k(x) → k(x)`, `x ↦ x²` (pull-back) | an arrow of `(FunctionFieldCat k)ᵒᵖ` | the direction matches "anti-equivalence" |
| `twoChartModel.genus_eq_genus` (~28) | `F = k(x)`, `x` itself (transcendental, exact constants) | `Scheme.genus ℙ¹ = 0` | `genus k k(x) = 0` | holds |
| the other 22 rows of ~28 (Hilbert different, Abhyankar, split-completely, class-group bridge, Castelnuovo, Weierstrass counts, …) | as in `PRREVIEW-AlgebraicCurves~28` | bytes unchanged | pins unchanged | carried forward, no change |

**Remark (untouched text, no change requested).** The elaborated `hurwitz_genus_formula` carries
`[FiniteDimensional k k′] [Algebra.IsSeparable k k′]`, while README 865 says only "with constant fields
`k′/k`". The other hypotheses already imply both instances, so the README's wording loses nothing:

- Take `a ∈ k′`. Its minimal polynomial over `F` has coefficients that are algebraic over `k` and lie in
  `F`, so by exactness they lie in `k`. That polynomial is therefore the minimal polynomial of `a` over
  `k`, and since `F′/F` is separable, `a` is separable over `k`.
- So `k′` and `F` are linearly disjoint over `k`, which gives `[k′ : k] ≤ [F′ : F]`.

## Not verifiable

- No legal electronic copy exists of: H. Stichtenoth, *Algebraic Function Fields and Codes* (GTM 254);
  W. Fulton, *Algebraic Curves*; or Liu, Hartshorne, Goldschmidt, Villa Salvador and Deuring. The sampled
  locators (Thm. 3.4.13, Cor. 3.4.14, Cor. 3.5.6–3.5.8) are in unchanged passages. I checked them against
  the pinned declarations, whose docstrings give the same theorem numbers.
- The board package has no `sources.toml`, so there is no cached text to quote against.

## Source issues

- none
