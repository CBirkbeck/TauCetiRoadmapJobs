# Review of ArakelovGeometryAndAbelianHeights (pull request #1000 at 5fc305b)

**Verdict:** needs changes

## R01 (P3) — The description's account of `Suggested.lean` and its build contradicts the head

**Location:** the pull request description, paragraph 3: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti"; and paragraph 5: "Validation: the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** At this head `Suggested.lean` declares nothing. The description tells the reader that the file states definitions and sorry'd theorems, and that the build emits `sorry` warnings. It does neither.

**Witness:** `TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/Suggested.lean`:
- lines 38–40 are an empty namespace;
- lines 7–9 say that "none of the headline theorems is statable";
- `lake env lean` on the file exits 0 with no output;
- the only `sorry` is in the docstring (line 8).

**Repair:** Make two replacements in the description.
- In paragraph 3, replace the sentence with: "This pull request adds the new roadmap folder `TauCetiRoadmap/ArakelovGeometryAndAbelianHeights` (README, `Suggested.lean`, `metadata.toml`). `Suggested.lean` states no theorem. Its module docstring names, layer by layer, the carriers that are missing at the pins: arithmetic hermitian bundles and Green functions, Néron models and the Faltings metric, integral Siegel compactifications, and the stable Faltings height. Every target is in the README."
- In paragraph 5, replace the opening clause with: "Validation: the targeted Lake build succeeds with no warning (`Suggested.lean` contains no `sorry`)".

## Previous findings

- none: the review of `5fc305b` raised no finding, and this head is that same commit.

## Verified sound

The folder has 0 changed lines since `5fc305b`, so this round checks the pull request's title and description against the head.

**Adversarial table: statements the description cites, with values computed at this head.**

| Statement (description → README) | Instances | Values computed | Result |
|---|---|---|---|
| "the Lean states only real-bodied definitions and theorems"; "`sorry` as the only warning" | `Suggested.lean` at `5fc305b` | 0 declarations. `lake env lean` gives no output and exit 0. One `sorry` token, in the docstring. | contradicted → R01 |
| "sup-metric degree equals Mathlib's `Height.logHeight`" → §1.14 | `(1,2)` over `ℚ`; over `ℚ(i)`; `(2,4)` over `ℚ` | `0 + log 2 = 0.6931 = log mulHeight`. Over `ℚ(i)`, `2·log 2 = 1.3863 = log 4`. For `(2,4)`, `−log 2 + log 4 = log 2`. | holds |
| Wrong model: an absolute height in place of `Height.logHeight` | `(1,2)` over `ℚ(i)` | absolute `log 2 = 0.6931`, but the relative value is `1.3863` | excluded by line 604 ("Mathlib's height is relative") |
| Fubini–Study comparison → §1.14 | `(1,2)` over `ℚ` | `½ log 5 − log 2 = 0.1116 ∈ [0, ½ log 2 = 0.3466]` | holds |
| "three metric normalizations coexist with exact shifts" → Conventions, lines 33–37 | `g = 1` | `h_Del − h_Fal = −½log(2π)⁻¹ + ½log 2⁻¹ = ½ log π = 0.5724`. `h_unscaled − h_Fal = −½ log 2 = −0.3466`. | holds |
| "a lower bound in each dimension" → §6.5 | `g = 1`, `j = 0` | `h_st,Del ≈ −0.749 ≥ −½log(2π) = −0.9189`. In Faltings' normalization, `−½log(2π²) = −1.4913 > −1.5`. | holds |
| "Compactifications live over Spec ℤ because ℤ[1/n] models miss level-one finite-place terms" → line 161 | `g = 1`, `n = 3`, `j = 1/3` | `h(j) = log max(1,|j|₃) + log max(1,1/3) = log 3 + 0 = 1.0986`. All of it comes from `p = 3`, which `ℤ[1/3]` omits. | holds |
| "semi-abelian families may change toric rank" → §2.0 | the Tate curve over `ℤ[[q]]` | toric rank 0 on the generic fibre, 1 on the nodal fibre (identity component `𝔾_m`) | holds; the §2.0 Check |
| "Zarhin's trick removing polarization hypotheses" → §§6.1–6.2 | `Z(A) = (A × A^t)⁴`, `g = 1` | `dim Z = 8`; `h_st(Z) = 4h_st(A) + 4h_st(A^t) = 8h_st(A)` | holds; matches §6.5's `/8` |
| "isogeny formula" → §4.2 | `[n]` on `A`, `dim g` | `½ log deg = ½ log n^{2g} = g log n`. This equals the finite term `[K:ℚ]⁻¹ log #(ω/[n]^*ω) = g log n`, so `Δh = 0`. | holds |

The rows of the previous report, for the untouched statements, stand as in the review of `5fc305b`.

- **The pull request's text against the head.** Every other claim of the summary block and the prose matches the head:
  - the scope of Layers 1–6;
  - the consumers FaltingsFinitenessAndIsogenyTheorems (R28.1–R28.2), GrossZagierAndArithmeticHeights, HilbertModularVarietiesAndShimuraCurves and CM height work (lines 1823–1827);
  - Gaudron–Rémond Theorem 8.1 for the lower bound (§6.5);
  - the reused bundles, divisors, covolumes and forms (line 9).

  The ten roadmaps that the README names as suppliers are SchemeAndStackFoundations and DifferentialGeometry, which are on main, and the eight in the merge-order chain. Every other roadmap it names is a consumer.
- **Gate.** The worker's gate and my own gate run on this head both show every counter at 0, ending `OK`. The diff outside the folder is empty.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with no output. There are no declarations, so there is no `#check` comparison and no padding probe. Statability is unchanged at the unchanged pins.
- **Dependency check** (`--movable`): `depcheck: 247 roadmaps, 2243 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. This roadmap is at ORDER line 143, after PELModuli (117) and PadicDifferentialEquationsAndRigidCohomology (122).
- **Citations.** `citations.md` raised four leads, and all four resolve at the suppliers' open heads:
  - `BarsottiTate.exists_of_tateModule_summand` at FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.21, line 1815;
  - `PELModuli.hodgeLine` at §M6.9, line 4010;
  - `PELModuli.hodgeLine_classify` in the API of §M6.10, line 4049;
  - `RaynaudOneMotive.polarized_positive` at NeronModelsAndSemistableAbelianVarieties §3.14, line 2109.

  `overlaps.md` reports no open pull request that changes this roadmap and no dropped id.
- **Library declarations opened at the Mathlib pin:**
  - `Height.mulHeight`, `Basic.lean:229` (junk value 1 at `0`);
  - `Height.logHeight`, `Basic.lean:268`;
  - `Projectivization.logHeight`, `Projectivization.lean:54`;
  - `NumberField.mulHeight_eq`, `NumberField.lean:127`;
  - `absNorm_mul_finprod_finitePlace_eq_one`, `:199`;
  - `mulHeight_eq_max_abs_of_gcd_eq_one`, `:502`.
- **Locators.** Two locators were checked against the OCR text of the GDZ scan of Faltings, *Endlichkeitssätze* (now readable).
  - The Hodge-line interface locator, §2, pp. 350–351, Bemerkungen a) and b) (README line 136), is supported. On p. 351 the definition `ω = s^*Ω^g` is followed by a) the identity `ω = p_*Ω^g` for proper `p` and b) commutation with base change.
  - Remark only, untouched text: §1.14 (line 621) cites Faltings §3 Lemma 3, p. 356. That lemma is Northcott for metrics with logarithmic singularities. The point height `[K:ℚ]⁻¹ deg x^*O(1)` is defined on p. 354.
- **Remark (untouched text, as before).** At line 1464, "for the extension `ω_G`" is meant to read `ω̄_G`.

Overlap check: read FaltingsFinitenessAndIsogenyTheorems, ArakelovGeometryAndAbelianHeightsPartII, FaltingsFinitenessAndIsogenyTheoremsPartII, HeightsRationalPointsAndObstructionsPartII and AbelianSchemesAndArithmeticModuli, as in the previous rounds; this round, also the scopes of HeightsAndUnits, DiophantineApproximationAndTranscendence and SubspaceTheorem on main. The shared objects and their owners:
- The Faltings metric and the relative and stable heights are owned here. FaltingsFinitenessAndIsogenyTheorems consumes them.
- Projective Northcott is owned by HeightsAndUnits. It is now the pinned Tau Ceti `Projectivization.instNorthcottMulHeight`, which line 73 cites.
- The Euclidean tuple heights and the field comparisons are pinned Tau Ceti declarations. DiophantineApproximationAndTranscendence builds on them, and this roadmap cites the pin (lines 73–75 and 91).
- SubspaceTheorem shares nothing with this roadmap.

Source independence: changed passages only. The folder has 0 changed lines. Faltings pp. 350–351 and 354–356 were set beside README lines 114–116, 136 and 600–621. They share only the formulas the mathematics forces (`ω = s^*Ω^g`, "commutes with base change"). The largest share of the locators is Deligne's, 36 of 162 linked locators. The arrangement was not compared again, because no layer was added, removed or reordered.

## Not verifiable

- Faltings–Chai, *Degeneration of Abelian Varieties* (Springer, paywalled). It supplies the §§5.0a–5.0b and §5.3 locators, which are unchanged lines, and is cited by locator alone.

## Source issues

- none

## For the human reviewers

- none
