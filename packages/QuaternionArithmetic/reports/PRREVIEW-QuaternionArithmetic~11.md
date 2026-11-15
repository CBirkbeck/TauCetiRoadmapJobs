# Review of QuaternionArithmetic (pull request #1722 at 17a00a0)

**Verdict:** accepted

Incremental re-review of 11 changed lines since e0f2268 (three passages of `TauCetiRoadmap/QuaternionArithmetic/README.md`), together with the pull request's title and description read against this head. No finding.

## Previous findings

- R01 — repaired: the description now reads "local ramification predicates, the ramification set and the discriminant (the classification by ramification, the Hilbert symbols and reciprocity are consumed)", which agrees with `README.md:84–86`.
- R02 — repaired: the description's bullet now reads "the headline theorems statable over Mathlib and the pinned Tau Ceti (30), with the definitions they need; its docstring names the headlines not statable at the pins; every other target is specified in the README, with Checks".

## Verified sound

| Statement | Instances | Values computed (both sides) | Result |
| --- | --- | --- | --- |
| §0.6 quadratic subfields (its *Needs:* line changed, `README.md:626–633`): `K ↪ B` iff no ramified place of `B` splits in `K` | `B = ℍ[ℚ,−1,−1]`, `Ram = {2, ∞}`; `K = ℚ(i)`, `ℚ(√−7)`, `ℚ(√2)` | `ℚ(i)`: 2 ramifies, `∞` complex; `i² = −1` embeds. `ℚ(√−7)`: `−7 ≡ 1 mod 8`, 2 splits; `x²+y²+z² = 7` has no rational solution. `ℚ(√2)`: `∞` splits; every trace-zero square is negative | holds, both directions |
| §0.6 route: restriction doubles the invariant (`invMap_brRes`, cited by the changed line) | `[K_w : F_v] = 2`, invariant `1/2` | `2 · (1/2) = 0` in `ℚ/ℤ`; the pinned statement is `invMap L (brRes K L σ x) = finrank K L • invMap K x` | holds |
| Supplier contract, `README.md:264–272`: `IsOrder`, `IsMaximalOrder`, `Submodule.leftOrder` "at Tau Ceti `2fd255d`"; "no right order" | the pin of `lake-manifest.json` | manifest rev `2fd255d997f4`; `IsOrder Λ := (toSubmodule Λ).IsLattice F` (`Basic.lean:75`); `IsMaximalOrder := Maximal (IsOrder F)` (`Maximal.lean:67`); `leftOrder` (`LeftOrder.lean:61`); `rightOrder` occurs nowhere | holds; `QuatOrder.isLattice` (`Suggested.lean:165`) is the body of `IsOrder` |
| Supplier contract, `README.md:273–280`: `invMap_…_quaternionClass_eq_half_iff` "(line 79)", `brauerCohomologyEquiv_baseChange` | the same pin | `Invariant.lean:79`, with `[Invertible (2 : K)]` in scope (line 63); `quaternionSubgroup_eq_twoTorsion` at line 67; `Naturality.lean:51`, for `σ : L →ₐ[K] SeparableClosure K`, `L/K` finite | holds |
| `README.md:17–18`: `[V, 15.5.5]` is Theorem 15.5.5 of the 2021 author edition v0.9.28 | the source's title page and the theorem | voight lines 8–9: v.0.9.28, May 20, 2021; voight line 10727: Theorem 15.5.5 (the maximality criterion of §1.7) | holds |
| Description: "(30)", "11 layers and 87 milestones" | the head | 30 `sorry` theorems; `## Layer` headings 0–10 = 11; `### k.n` headings = 87 | holds |

The rows for the roadmap's other statements stand as in the previous review, of `e0f2268`: the diff changes no statement.

- **Changed passages (3):** the sentence citing Voight no longer says the roadmap follows the book, and the description's summary now says "The layers are ordered by their dependencies"; the three pin notes dropped "absent at `358314d`", which is right, since the merge of main moved the Tau Ceti pin from `358314d` to `2fd255d`. No mention of `358314d` remains in the folder.
- **Library declarations opened at the pin (Tau Ceti `2fd255d`):** 7: `IsOrder`, `IsMaximalOrder`, `Submodule.leftOrder`, `invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff`, `quaternionSubgroup_eq_twoTorsion`, `brauerCohomologyEquiv_baseChange`, `invMap_brRes` (`NumberTheory/ClassFieldTheory/Brauer/Invariant.lean:262`); also the three line numbers 106, 93, 114 of `Algebra/Quaternion/AlgEquiv.lean` cited at `README.md:229`, unchanged by the pin move.
- **Description against the head:** title (adds a roadmap: the folder is not on main; 3 files, 3794 insertions); the summary block's three paragraphs (Dedekind base for Layers 1–2 and number fields for Layers 0, 3–7 at `README.md:2721–2722`; curves over `ℚ` at `README.md:25`; consumers at `README.md:2739–2749`; classification and strong approximation consumed at `README.md:84–88`); the prose paragraph; the three file bullets (`metadata.toml` is `topic = "math.NT"`). No sentence disagrees with the head.
- **Elaboration at the new pin:** `lake env lean` on `Suggested.lean` exits 0 with 30 `declaration uses sorry` warnings and no other message; every `TauCeti.*` import resolves.
- **Worker's gate:** every counter 0, `build=0`, OK. **My rerun:** agrees except `depcheck: NOT IN ORDER: QuaternionArithmetic (insert it after its last supplier)`; the candidate order places it after ArithmeticFuchsianGroups. Not a finding.
- **Dependency check** (the brief's command, `--movable`): `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- **Outside the folder:** `git diff --stat origin/main...HEAD` outside the folder is empty (the files changed since `e0f2268` outside it are main's, through the merge). **Overlaps:** no other pull request changes this roadmap; no dropped or revision-only id. Cross-roadmap citations: the worker's resolver finds none unresolved; the changed passages add none.
- Seeded sample: of the sampled sections only §1.7 is touched, through the example locator `[V, 15.5.5]`, checked above.

Overlap check: read ArithmeticFuchsianGroups, HilbertModularVarietiesAndShimuraCurves and AdelicAlgebraicGroups as in the previous review (their handoffs at `README.md:84–126` are unchanged by this diff); nothing shared.

Source independence: 3 passages compared (changed passages only) with 1 source, none shared: two are pin notes with no source behind them, the third is the citation sentence; largest share voight, about 190 of about 234 locators; contents not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts": a statement about other pull requests, not about this folder; not checked.
- The description's generated blocks (`depends-on`, `merge-order`): outside this check.
- `pizer1976`, `eichler1955`, the LMFDB knowls `shimcurve.label` and `shimcurve.eichler`, and the uncertified `ogg1983`, `vigneras1980`, `pizer1980`, `shimizu1965`, `alsina_bayer2004`: as in the earlier reports; none is cited by a changed passage.

## Source issues

- none

## For the human reviewers

- Voight's book carries about 190 of about 234 locators (`README.md:17` now only cites it and no longer says the roadmap follows it); the arrangement was compared with its contents in earlier rounds and not again in this one.
