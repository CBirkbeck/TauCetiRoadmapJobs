# Review of SmoothBanachRepresentations (pull request #1145 at d7717e6)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`
**Verdict:** needs changes

This is an incremental re-review of the 96 lines changed since `073a53d` (35 in the README, 61 in `Suggested.lean`; nothing outside the folder). The gate passes with the candidate order and the build. Of the four previous findings, R01, R02 and R04 are repaired and R03 is settled by the repair report's reason. One new P3 remains, introduced by the R01 repair.

## R01 (P3) — §7.2a says Mathlib gives no seminorms on `UniformSpace.Completion`; it gives the norm, and the extended seminorm must agree with it

**Location.** `README.md:470` (§7.2a): “The pins give none of these: … Mathlib gives no seminorms on `UniformSpace.Completion`, and `CompletedProjectiveTensorProduct.liftEquiv` asks of its target a seminorm family”.

**Claim.** The clause is false for a seminormed group, and the construction the paragraph then gives (extend each seminorm by uniform continuity to the Hausdorff completion) is, for a norm, exactly a pinned instance. The paragraph identifies its complexified seminorm with the pinned Taylor norm in the normed case (“no second topology arises”) but does not do the same for the completion, so for a seminormed X whose defining family is its norm the completion carries the pinned norm and the roadmap's extended seminorm with no stated agreement.

**Witness.** `Mathlib/Analysis/Normed/Group/Completion.lean` at the pin:
- :35 gives `Norm (Completion E)` by `Completion.extension Norm.norm`, the continuous extension of the norm;
- :39 `norm_coe`: the norm of the image of x is the norm of x;
- :42 `NormedAddCommGroup (Completion E)` for `[SeminormedAddCommGroup E]`.

**Repair.** At :470 replace the clause by: “Mathlib extends only a norm to `UniformSpace.Completion` (`Mathlib/Analysis/Normed/Group/Completion.lean`: the completion of a seminormed group carries the continuous extension of its norm) and gives no seminorm family on it”. In the completion sentence at :474 add: “for a seminormed X whose family is its norm, the extended seminorm is the pinned norm of the completion, so no second norm arises”. Add `Mathlib/Analysis/Normed/Group/Completion.lean` to the Mathlib contract at :46.

**Tested.** X = finitely supported real sequences with the sup norm: Mathlib's completion is the null sequences with the sup norm, and the roadmap's extension of the sup norm is the same function by `norm_coe` and continuity. With the coordinate family p_n instead, the completion is the product space of Check 3 at :486, on which the sup norm has no continuous extension; the two cases are different carriers, so the Check stays as it is.

## Previous findings

- R01 (P2) — repaired: §7.2a (:470–476) now owns the complexified seminorms `p^ℂ(x+iy) = sup_θ p(cos θ·x − sin θ·y)` with their two-sided bounds, the product topology, agreement with the pinned Taylor norm, the complexification of maps, realifications by `Seminorm.restrictScalars` and the extended seminorms on the completion; :472 (E_ℂ with the complexified seminorms) and the Needs line at :478, the API at :480, the Mathlib and Tau Ceti contracts (:46, :58) and three Checks (:484–486) follow. Every value in the Checks recomputes (rows 20–22). The new R01 is the one problem the repair introduced.
- R02 (P2) — repaired: `Suggested.lean:62–74` define `lieGenerator` and `wordApply` with real bodies on pinned carriers, :119–125 state `contMDiff_orbit_iff_wordApply_isSome`, the three imports are at :5–7, the docstring at :14–15 lists the criterion among the headlines and :21–22 no longer says it is not statable, and the README names the three at :110, :121 and :221.
- R03 (P3) — not repaired, settled: the family index at this head still has no entry for this folder and the description does not name RepresentationTheory's revision. The round-18 repair marked it not actionable in this package because a repair's gate refuses every committed path outside the nested folder; that reason holds (the gate's outside-folder check takes the nested folder as prefix with an empty allow list and diffs against the reviewed head), so it is not raised again. The author's two options of the previous report stay open and are not a finding here.
- R04 (P3) — repaired: the Tau Ceti contract at :62 names the field `continuous_orbit`, `CStarAction.toContinuousLinearMap`, `CStarAction.toStronglyContinuousGroup` and `CStarAction.generator_restrictScalars`; each was reopened at the pin (`TauCeti/Analysis/CStarAlgebra/Action/Basic.lean:45`, :90; `…/Action/Generator/Basic.lean:45`, :88) and the one-clause descriptions match.

## Verified sound

### Gate, dependency check, diff and elaboration

- **Diff.** The 96 changed lines are in `README.md` and `Suggested.lean`; `git diff --stat origin/main...HEAD` outside the folder and the family index is empty, and the family index itself is unchanged from main.
- **Gate** at `d7717e6` (worker's run, every check passed):

  ```text
  gate SmoothBanachRepresentations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
  ```

- **Dependency check** (`gate --depcheck … --movable`, candidate order), rerun by me:

  ```text
  depcheck: 237 roadmaps, 2309 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line. The new text adds no supplier: the new imports are Tau Ceti modules at the pin, and the new citations are Mathlib and Tau Ceti declarations.
- **Elaboration.** `lake env lean` on `Suggested.lean`: exactly 9 warnings, all “declaration uses `sorry`”, at :119, :135, :144, :156, :175, :188, :205, :223, :240. No other output.
- **Signatures.** `#check @lieGenerator`, `@wordApply` and `@contMDiff_orbit_iff_wordApply_isSome` were elaborated in a scratch copy. `lieGenerator` keeps the five Lie binders, `NormedSpace ℝ E` and `IsScalarTower ℝ 𝕜 E`, and no `CompleteSpace E`: the pinned generator is a `LinearPMap` that needs no completeness, as §0.2 says. `wordApply` mentions only the normed structure of E, as §0.3 says. The theorem carries all five Lie binders, `FiniteDimensional ℝ V` and `CompleteSpace E`, which matches §2.1 (the completeness enters through the pinned `hasDerivAt` dictionary). The 13 older declarations were not changed by the diff; their elaborated types equal `signatures.md`.
- **Padding probe** on the one changed statement: in the scratch copy the `sorry` of `contMDiff_orbit_iff_wordApply_isSome` was replaced by `first | rfl | simp | infer_instance | fun_prop | aesop | (constructor <;> intro h <;> simp_all) | exact contMDiff_zero_iff.2 (hπ v)`; every alternative fails and both directions remain as goals. It restates no definition and mirrors no Check.
- **README and Lean agree.** The three new names appear in the README (:110, :121, :221), and `roadmaps resolve` and the gate's `readme-ids-missing` report nothing missing.

### Library declarations opened at the pins

**Mathlib** (`lake-manifest.json` pin), the names the diff adds to the contract at :46 or to §7.2a:

| Declaration | Where, and what it says |
|---|---|
| `Seminorm.restrictScalars` | `Analysis/Normed/Module/Seminorm/Basic.lean:1035`: a seminorm over 𝕜' read over a smaller normed field 𝕜 with `IsScalarTower`; `coe_restrictScalars` says the function is unchanged, as :474 says (same balls) |
| `ContDiffMapSupportedIn` | `Analysis/Distribution/ContDiffMapSupportedIn.lean` |
| `TestFunction.continuous_iff_continuous_comp` | `Analysis/Distribution/TestFunction.lean:335` |
| `measure_isHaarMeasure_eq_smul_of_isOpen` | `MeasureTheory/Measure/Haar/Unique.lean:829`: `LocallyCompactSpace G`, two Haar measures, an open set, equality up to `haarScalarFactor`; no second countability, as :46 says |
| `Distribution.ofFun` | `Analysis/Distribution/Distribution.lean:303`, docstring: the zero map when f is not locally integrable, as :46 says; `delta` :202, `lineDerivCLM` :235 |
| `IsBoundedBilinearMap.contDiff` | `Analysis/Calculus/ContDiff/Basic.lean:189` |
| `ContinuousLinearMap.hasFDerivAt_of_bilinear` | `Analysis/Calculus/FDeriv/Bilinear.lean:120` |
| `contMDiff_infty` | `Geometry/Manifold/ContMDiff/Defs.lean:648`: C^∞ iff C^n for every natural n, which is the step :221 uses to pass from the finite-k headline to E∞ |
| `contMDiff_zero_iff` | `Defs.lean:596`, the k = 0 case of the headline |
| Norm on `Completion` | `Analysis/Normed/Group/Completion.lean:35`, :39, :42 (R01) |

**Tau Ceti** at the pin:

| Declaration | Where, and what it says |
|---|---|
| `TauCeti.Complexification.norm_def` | `Analysis/Normed/Module/Complexification.lean:183`: the norm of z is the supremum over the circle of the norm of the real part of w•z; with w = cos θ + i sin θ the real part of w(x+iy) is cos θ·x − sin θ·y, which is the formula at :472 |
| `instNormedSpace`, `equivProd` | :270 and :312 (`≃L[ℝ] X × X`), both under `[SeminormedAddCommGroup X] [NormedSpace ℝ X]` (:178); before :178 the file has only the additive group and the complex module (:90–174), as :58 says |
| `ContinuousLinearMap.complexify` | :404 onwards, seminormed X and Y, as :474 says |
| `StronglyContinuousSemigroup.smoothVectors` | `Analysis/Semigroups/Generator/SmoothVectors.lean:49`: the infimum over n of `generator.domainPow n`, as :50 says |
| `CStarAction` | `Analysis/CStarAlgebra/Action/Basic.lean:41`, field `continuous_orbit` :45, `toContinuousLinearMap` :90 (`A →L[ℂ] A`), `comp` :156 |
| `CStarAction.toStronglyContinuousGroup`, `generator_restrictScalars` | `Analysis/CStarAlgebra/Action/Generator/Basic.lean:45` (apply :60, t ↦ α(ofAdd t)) and :88 (`α.generator.restrictScalars ℝ = α.toStronglyContinuousGroup.generator`), as :62 says |
| `oneParameterSubgroup`, `ContRepresentation.toStronglyContinuousGroup`, `StronglyContinuousGroup.generator` | unchanged since the previous review; `lieGenerator` elaborates against them |

### Cross-roadmap citations in the changed passages

The diff adds no cross-roadmap citation. The citations it touches (NoncommutativeGeometry N1 at :470–480, BanachSpaceTheory B4, AutomorphicFormsOnReductiveGroups §2.7 at :221) are those the previous review resolved; `overlaps.md` and `citations.md` report nothing dropped and nothing found nowhere. Ownership of the new objects: the complexified, realified and completion seminorm families are claimed by §7.2a; the previous review's search (`roadmaps grep` over the open heads, NoncommutativeGeometry at its head ceding the scalar comparisons) found no other owner, and the diff does not change that; the only pinned overlap is the normed case, which the README identifies for the complexification and R01 asks it to identify for the completion.

### Seeded sample where it falls in the changed passages

| Target | Result |
|---|---|
| 0.2 | No external locator; `lieGenerator` is the pinned generator of the pinned restriction. The scaling and coefficient laws are unchanged text (previous row 2). |
| 0.3 | `casselman2016` lines 11–16 give the inductive domains V^(n+1); `wordApply` evaluates right to left with failure on the first domain miss, which is that definition. |
| 1.1, 1.2, 1.3, 1.5, 3.3, 3.4, 5.1, 6.1, 7.1, 7.2 | Untouched by the diff; the previous review's sample rows stand. |
| 7.2a | Grothendieck Théorème 1, p.76 (`grothendieck1952` lines 153–163) and the completed product with its universal property for complete targets, p.77 (lines 180–188), unchanged. The new seminorm paragraph cites the pin (`norm_def`) rather than a text, and is the roadmap's own, as it says. |
| 7.3 | Only the Needs line changed; it now names §7.2a for the seminorm families its completed tensors need, which is where they are built. |

### Adversarial table

Rows 1–19, H1–H8 of the previous report cover statements the diff leaves untouched and are carried forward as there (their values were not recomputed here). Rows 20–25 are the changed statements.

| # | Statement | Instances and values computed | Result | Change |
|---|---|---|---|---|
| 1–19, H1–H8 | As in the r18 report | Carried from r18 | True | — |
| 20 | §7.2a complexified seminorm `p^ℂ` | X = ℝ, p = \|·\|: p^ℂ(3+4i) = sup_θ \|3cos θ − 4sin θ\| = 5 = \|3+4i\|; p^ℂ(x) = \|x\|. Phase shift: e^{iφ}(x+iy) has real part cos φ·x − sin φ·y and imaginary part sin φ·x + cos φ·y, so cos θ·x′ − sin θ·y′ = cos(θ+φ)·x − sin(θ+φ)·y and p^ℂ(wz) = p^ℂ(z). Bounds: θ = 0 gives p(x), θ = −π/2 gives p(y); \|cos θ\|p(x) + \|sin θ\|p(y) ≤ p(x)+p(y). Wrong models: p(x)+p(y) at z = 1, w = e^{iπ/4} gives √2 against \|w\|p(1) = 1; max gives 1/√2. | True | — |
| 21 | §7.2a Check 2 | z = 1+i: max = 1, p^ℂ = sup\|cos θ − sin θ\| = √2, sum = 2; z = 1: 1, 1, 1. | True | — |
| 22 | §7.2a completion seminorms and Check 3 | Finitely supported sequences with p_n = \|x_n\|: completion ℝ^ℕ, extended p_n = \|x_n\|, the all-ones sequence is the limit of its truncations. The sup norm: e_k → 0 coordinatewise with norm 1, no continuous extension. With the sup norm as the family: the completion is c₀ and Mathlib's norm is the extension (`norm_coe`), which the README does not say. | True; one pinned instance unacknowledged | R01 |
| 23 | §7.2a complexification of maps | T = 2·id on ℝ, C = 2: q^ℂ(T_ℂ z) = sup_θ \|2(cos θ·x − sin θ·y)\| = 2p^ℂ(z). T = 0: 0 ≤ C·p^ℂ(z). | True | — |
| 24 | `lieGenerator`, `wordApply` (§0.2, §0.3) | Affine group, v = (0,1): wordApply [H, N] v applies A_N first then A_H and gives (1,0); [N, H] gives A_N A_H v = 0; [] gives v. L² translation, v = 1_[0,1]: domain test fails, [0] gives `none`, [] gives `some v`. | True | — |
| 25 | `contMDiff_orbit_iff_wordApply_isSome` (§2.1 headline) | k = 0: only [] with `some v`, and C^0 is continuity (`contMDiff_zero_iff`), given by hπ: both sides true. k = 1, L² translation, v = 1_[0,1]: ‖τ_t v − v‖²/t² = 2/\|t\| = 200 at t = 0.01, so [0] is `none`; the orbit is not C¹: both sides false. k = 1, v = a smooth bump: [0] is `some v′`; orbit C¹: both true. Discrete G, V = 0: ι empty, only []; every orbit is C^k: both true. k = 2 on the affine group with v = (0,1) in the 2-dimensional matrix representation: all four words defined, orbit polynomial in the entries, C²: both true. | True | — |

### Degenerate and generality checks on the changed statements

- `wordApply` with the empty index type: only `[]` occurs and the criterion reduces to continuity for every k, which is true on a 0-dimensional Lie group.
- The theorem quantifies over every basis b of `LeftInvariantDerivation I G` with any index type, over ℝ and ℂ alike (𝕜 is `RCLike`); the README states it “over either field for every basis b of the Lie algebra of left-invariant derivations and every natural k” (:221), the same generality.
- The infinite case is not stated separately; :221 derives it from every k through `contMDiff_infty`, which is at the pin.
- `p^ℂ` for p = 0 is 0; for X = 0 the complexification is 0 with the zero family; complete, Hausdorff, metrizable each hold trivially.
- The realification sentence: for a complex seminorm q, `q.restrictScalars ℝ` has the same balls, so the topology is unchanged; at X = ℂ with q = \|·\|, the realification is ℝ² with the Euclidean norm.

## Not verifiable

- **Dixmier–Malliavin, Bull. Sci. Math. 102 (1978)** is recorded uncertified in the manifest and was not read; nothing in the diff cites it.
- **Ownership against open pull requests** beyond `overlaps.md`, `citations.md` and the previous review's `roadmaps grep` searches was not rerun for this incremental round; the diff introduces no new object outside §7.2a's seminorm families.

## Source issues

- none
