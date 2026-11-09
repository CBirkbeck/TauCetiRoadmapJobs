# Review of SmoothBanachRepresentations (pull request #1145 at 18e94ff)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`
**Verdict:** accepted

This is an incremental re-review of the 12 lines changed since `d7717e6` (6 insertions and 6 deletions, all in `README.md`; `Suggested.lean` and everything outside the folder are unchanged). The change is the repair of the single finding of the previous report: the §7.2a clause on seminorms of `UniformSpace.Completion` and the identification of the extended seminorm with the pinned norm in the normed case. The repair is correct at the pin, introduces no new problem, the gate passes, and no finding remains, so the folder is ready for a human's final approval.

## Previous findings

- R01 (P3) — repaired: `README.md:470` now says Mathlib extends only a norm to `UniformSpace.Completion` (naming `Mathlib/Analysis/Normed/Group/Completion.lean` and `Mathlib/Analysis/Normed/Module/Completion.lean`) and gives no seminorm family; :474 identifies the extended seminorm of a seminormed X with the pinned norm through `UniformSpace.Completion.norm_coe`; :46, :478, :480 and Check 3 at :486 follow. Each claim was reopened at the pin (below) and the Check's values recompute.

The round-18 finding R03 (the family index has no entry for this folder) stays settled by the repair report's reason the previous review accepted: the files directly in `TauCetiRoadmap/RepresentationTheory/` are unchanged from main at this head (`git diff --stat origin/main...HEAD` on them lists only the two files of this folder), and a repair's gate refuses a committed path outside the nested folder. It is not raised again.

## Verified sound

### Gate, dependency check, diff and elaboration

- **Diff.** The 12 changed lines are at `README.md:46`, :470, :474, :478, :480 and :486. `git diff --stat origin/main...HEAD` outside the folder and the family index is empty; the family index itself is unchanged from main.
- **Gate** at `18e94ff` (worker's run, every check passed):

  ```text
  gate SmoothBanachRepresentations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
  ```

- **Dependency check** (`gate --depcheck … --movable`, candidate order), rerun by me:

  ```text
  depcheck: 236 roadmaps, 2281 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line. The change adds no supplier: the new citations are two Mathlib files and one Mathlib theorem at the pin.
- **Elaboration.** `lake env lean` on `Suggested.lean` (unchanged since `d7717e6`): exactly 9 warnings, all “declaration uses `sorry`”, at :119, :135, :144, :156, :175, :188, :205, :223, :240. No other output. The 16 elaborated signatures equal those the previous review compared with the README (`#check @name` on every declaration in a scratch copy at round 19; the file has not changed since), including the binders `signatures.md` lists as “looks dropped”, each of which the previous reviews found to be absent from the README statement as well (`HasContinuousOrbits` is a predicate on the pinned `ContRepresentation` and needs no completeness or separation; `lieGenerator` is a `LinearPMap` and needs no `CompleteSpace`).
- **Padding probe.** No statement of `Suggested.lean` changed; the one-tactic probe of round 19 on `contMDiff_orbit_iff_wordApply_isSome` (every alternative of `first | rfl | simp | infer_instance | fun_prop | aesop | … ` fails) and the earlier rounds' probes of the other eight theorems stand.
- **README and Lean agree.** No Lean name was added or removed; `readme-ids-missing=0` and `citations.md` report nothing found nowhere.

### Library declarations opened at the pins

**Mathlib** (`lake-manifest.json` pin), the names and files the diff adds:

| Declaration | Where, and what it says |
|---|---|
| `Norm (Completion E)` | `Analysis/Normed/Group/Completion.lean:35`: `Completion.extension Norm.norm`, under `[UniformSpace E] [Norm E]`; the continuous extension of the norm, as :470 says |
| `UniformSpace.Completion.norm_coe` | `Analysis/Normed/Group/Completion.lean:39`: for `[SeminormedAddCommGroup E]` the norm of the image of x equals the norm of x, the values on the image that :474 and :486 cite |
| `NormedAddCommGroup (Completion E)` | `Analysis/Normed/Group/Completion.lean:42`, for `[SeminormedAddCommGroup E]`: the extension is a norm on the (Hausdorff) completion |
| `NormedSpace 𝕜 (Completion E)` | `Analysis/Normed/Module/Completion.lean:39`, for `[NormedField 𝕜] [SeminormedAddCommGroup E] [NormedSpace 𝕜 E]`: the normed space structure over the same field, as :46 and :470 say |
| “no seminorm family on the completion” | grep of the pinned Mathlib and Tau Ceti for `Seminorm`/`WithSeminorms` together with `Completion`: only the norm instances above and Tau Ceti's normed-ring and star-group instances on `Completion` (`TauCeti/Analysis/Normed/Ring/Completion.lean:56`, :64, :71; `TauCeti/Analysis/CStarAlgebra/Completion.lean:40`, :51); no extension of a seminorm family, so the “lacks” clause at :46 and :470 is true at the pins |

Uniqueness of the identification at :474: both the pinned norm and the roadmap's extended seminorm are continuous maps from the completion to ℝ agreeing with the norm of X on the dense image (`norm_coe` for the first, the definition for the second), and ℝ is Hausdorff, so they are equal. The sentence's reason is the right one.

**Tau Ceti** at the pin: the diff touches no Tau Ceti citation; the previous review's rows for `TauCeti.Complexification.norm_def`, `instNormedSpace`, `equivProd`, `ContinuousLinearMap.complexify` and the `CompletedProjectiveTensorProduct` names stand.

### Cross-roadmap citations in the changed passages

The diff adds no cross-roadmap citation. The citations in the changed paragraphs (NoncommutativeGeometry N1 at :470–480, BanachSpaceTheory B4 at :476–478) are those the previous reviews resolved; `overlaps.md` and `citations.md` report nothing dropped, nothing only an open revision defines and nothing found nowhere. Ownership of the extended completion seminorms stays with §7.2a: the only pinned overlap is the normed case, which :474 now identifies with the pinned norm instead of building a second one.

### Seeded sample where it falls in the changed passages

| Target | Result |
|---|---|
| 7.2a | The one sampled target the diff touches. Its external locator (Grothendieck 1952, Chapitre I, n° 1, Théorème 1, p.76, and the completed product with its universal property for complete targets, p.77: `grothendieck1952` lines 153–163 and 180–188) is unchanged and was verified at round 19; the changed sentences cite the pin, not a text, and were verified above. |
| 0.1, 0.3, 1.3, 1.4, 1.5, 2.1, 3.1, 3.3, 4.1, 5.1, 6.1, 7.1, 7.4, 8.1 | Untouched by the diff; the previous reviews' sample rows stand. |

### Adversarial table

Rows 1–25 and H1–H8 of the previous reports cover statements the diff leaves untouched and are carried forward as there (their values were not recomputed here). Rows 26–28 are the changed statements.

| # | Statement | Instances and values computed | Result | Change |
|---|---|---|---|---|
| 1–19, H1–H8 | As in the r18 report | Carried from r18 | True | — |
| 20–25 | As in the r19 report (complexified seminorm, Check 2, completion seminorms, complexification of maps, `lieGenerator`/`wordApply`, the finite-k headline) | Carried from r19 | True | — |
| 26 | :474 normed case: the extended seminorm of a seminormed X equals the pinned norm of `Completion X` | X = c₀₀ with the sup norm: completion c₀; on the image both give sup_n\|x_n\| (`norm_coe`); on (1/k)_{k≥1} the truncations x^{(N)} have ‖x − x^{(N)}‖ = 1/(N+1) → 0, so both continuous extensions give lim ‖x^{(N)}‖ = 1. X = 0: both 0. X = ℝ: completion ℝ, both \|·\|. Wrong model: a rescaling c·‖·‖ with c ≠ 1 disagrees on the image at x = 1 (c against 1), excluded by `norm_coe`. | True | — |
| 27 | :486 Check 3, new sentence | Sup-norm family on c₀₀: completion c₀ (a different carrier from ℝ^ℕ of the coordinate case); (1/k)_{k≥1} is in c₀, norm sup_k 1/k = 1. Coordinate family: completion ℝ^ℕ, p_n((1/k)_k) = 1/n, and the sup norm has no continuous extension (e_k → 0 coordinatewise with norm 1, carried from row 22). The two families give different carriers and different values on the same element, as the Check says. | True | — |
| 28 | :470 and :46: “Mathlib extends only a norm to `UniformSpace.Completion` … makes it a normed space over the same field … gives no seminorm family” | Pin: `Norm` at `Group/Completion.lean:35`, `NormedAddCommGroup` at :42, `NormedSpace 𝕜` at `Module/Completion.lean:39` over the same 𝕜; grep for seminorm families on `Completion` in Mathlib and Tau Ceti finds none. | True | — |

### Degenerate and generality checks on the changed statements

- The identification at :474 is stated for a seminormed X whose defining family is its norm; it does not claim it for a family of several seminorms, where no pinned norm exists (Check 3's coordinate case), so the generality matches the pin.
- A seminormed, non-normed X (p = 0 on a nonzero X): the pinned completion is Hausdorff and the extended seminorm is the pinned norm, which vanishes on the image; both are the zero map, consistent with :474.
- The index in “(1/k)_k” and “p_n = 1/n” is read with k, n ≥ 1, as the prose's sequence notation implies; with this reading every value above is defined.

## Not verifiable

- **Dixmier–Malliavin, Bull. Sci. Math. 102 (1978)** is recorded uncertified in the manifest and was not read; nothing in the diff cites it.
- **Ownership against open pull requests** beyond `overlaps.md`, `citations.md` and the previous reviews' `roadmaps grep` searches was not rerun for this incremental round; the diff introduces no new object.

## Source issues

- none
