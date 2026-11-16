# Review of CyclicHomologyLieHomologyAndQuasiFreeAlgebras (pull request #2037 at dea0b52)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README lines 1045–1051 are R01's replacement text, word for word. The description's Provenance paragraph now reads "a theorem planned on main as DerivedModuleAlgebra §0.2.2, which no target here uses".

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| README 1045–1047: LeanPool proves Eilenberg–Zilber for a bisimplicial object of an abelian category, a homotopy equivalence between the total complex and the diagonal complex | LeanPool at `f8b9b72`; a constant bisimplicial `P` | `eilenbergZilber : HomotopyEquiv (F₁.obj X) (F₂.obj X)` (`BisimplicialNormalized.lean:755`) under `[Abelian C]` (`:37`); for constant `P`, both sides have `H₀ = P` and `H_(>0) = 0` | holds | — |
| README 1047: "built from the shuffle and Alexander–Whitney maps on normalized complexes" | `BisimplicialNormalized.lean:8–24, 733`; `Bisimplicial.lean:81–90` | `ezComponent` and `awComponent` on `N₁`, `N₂`; `eilenbergZilberNormalized` is carried to `F₁`, `F₂` by two normalization comparisons | holds | — |
| README 1047–1048: "That theorem is DerivedModuleAlgebra §0.2.2" | main `5ff4294`, DerivedModuleAlgebra README line 1153; `C = ModuleCat A` | §0.2.2: `s(diag Z) → Tot_⊕(s_h s_v Z)` is a homotopy equivalence for bisimplicial `A`-modules. This is LeanPool's case `C = ModuleCat A` | holds (the module case, as the parenthesis says) | — |
| README 1048–1050: §0.2.2 is stated on Tau Ceti's `diag`, `doubleComplex` and `diagAlexanderWhitney` | `#check @…` at the pin; DerivedModuleAlgebra *Needs:* line 1171 | `Bisimplicial.lean:83, 143, 313`; `diagAlexanderWhitney : s(diag X) ⟶ Tot(doubleComplex X)` under `[Preadditive C] [HasFiniteCoproducts C]` | holds | — |
| README 1050: "no target of this roadmap uses it" | the README searched for shuffle, bisimplicial, Eilenberg–Zilber, Alexander–Whitney, diagonal | 0 hits outside lines 1045–1048. The 7 hits for "diagonal" (lines 61–422) are the operators `f^⊗p` and coproducts | holds | — |
| README 1042–1043: the authors are "named in each file's header and in LeanPool's NOTICE" | the 6 files of `LeanPool/EilenbergZilber` and `NOTICE`, at `f8b9b72` | 5 headers say "Authors: Jeffrey Li"; `Imports.lean` says "Lean Pool contributors"; `NOTICE` line 105 gives upstream `jeffrey-dot-li/lean-homology`, which names the author only by handle | holds | — |
| 5.3 (README 883–885) and its Checks cite GeneralAlgebraicKTheory §8.10, which is now on main | main §8.10 (line 1738); `A = εℚ[ε]`; `A = ℚ` | §8.10's degree-one criterion is `I = I²`. For `εℚ[ε]`, `I/I² = I ≠ 0`, so excision fails; for unital `ℚ`, the positive Tor groups vanish | holds | — |

The rows for the untouched statements stand as in the previous review, of `20efc97`.

- **Change:** `git diff 20efc97 HEAD` changes 16 README lines, all in the Provenance section. `Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged. `dea0b52` merges main, and `git diff --stat origin/main...HEAD` shows nothing outside the folder. None of the 15 seeded targets falls in the changed lines, and no locator was added or changed.
- **Gate:** the worker's gate passes every check, with `build=0`.
  - My run against the public order has every scanner at 0. Its only line is `depcheck: NOT IN ORDER: CyclicHomologyLieHomologyAndQuasiFreeAlgebras (insert it after its last supplier)`, which is not a finding: the candidate order lists the roadmap at line 357, right after RefinedTraceMethods (356).
  - Dependency check (`--movable`, candidate order, `--pr 2037`): `depcheck: 258 roadmaps, 2451 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` gives 0 errors and five `declaration uses 'sorry'` warnings, at lines 80, 106, 119, 130 and 135. The seven types in `signatures.md` are unchanged. The `on` entry is the word "on" at line 42, which sits inside a docstring.
- **Declarations opened:**
  - Tau Ceti at the pin: 3 `#check`s elaborate, against `Bisimplicial.lean` lines 83, 143 and 313.
  - LeanPool at `f8b9b72`: 6 file headers, `NOTICE` lines 1–20 and 105, `NOTICE.extra.yml`, and `Bisimplicial.lean`, `BisimplicialNormalized.lean` and `BisimplicialNormalizationComparison.lean` (their binders).
- **Citations resolved on main `5ff4294`:**
  - DerivedModuleAlgebra §0.2.2, at lines 1100 and 1153.
  - GeneralAlgebraicKTheory §8.3 (line 1615) and §8.10 (line 1738).
  - `roadmaps resolve` reports nothing unresolved.
  - KTheoryFiniteLocalFields and RefinedTraceMethods are still open, at `f92d21b` and `91f73dc`.
- **Pull-request text:** these sentences hold at this head:
  - "Two suppliers are still open";
  - "three files";
  - "Nothing outside the folder changes";
  - "`29c2265` changes only the README's Provenance section";
  - the depcheck sentence;
  - the Provenance paragraph.
- **Remark on untouched text:** 2.4 cites Milnor–Moore 1965 for the structure theorem without a theorem number.

Overlap check: this round read HochschildHomologyAndHKR (open) and GeneralAlgebraicKTheory (main). As in the previous review: RefinedTraceMethods, RefinedTraceMethodsPartII, RationalHomotopyModels and ProjectiveModulesOverPolynomialRings (open), and NoncommutativeGeometry and K2SymbolsBrauer (main). The results-based list is empty. Shared objects and their owners:

- `Λ`, `HC`, `HP` and §4.18: RefinedTraceMethods, cited.
- Normalised forms: NoncommutativeGeometry N1, cited.
- Absolute excision: GeneralAlgebraicKTheory §8.10, cited. That section states only the integral criterion, not 5.3's rational one.
- The bisimplicial Eilenberg–Zilber theorem: DerivedModuleAlgebra §0.2.2.
- HochschildHomologyAndHKR shares nothing. Its §3.6 classifies split square-zero extensions by `HH²`, while 4.1 here uses Mathlib's `Ext`; it comes after this roadmap in the order (line 358).

Source independence: changed passages only. 2 passages (README 1042–1044 and 1045–1051) were compared with 2 sources:

- LeanPool at `f8b9b72`: `NOTICE`, the file headers, `Bisimplicial.lean:81–90` and `BisimplicialNormalized.lean:8–24`;
- DerivedModuleAlgebra §0.2.2.

The longest shared run is 4 words, "complex of the diagonal", a standard phrase. No locator was added. Largest share: Loday–Quillen 1984, 15 of 68 locators. No layer was added, removed or reordered, so the comparison of contents stands as in the full review: independent.

## Not verifiable

- Nothing in the changed passages. Marín 1998 and González-Férez–Marín 2007 remain paywalled (DOI prefix 10.1016). The README names them only in Out of scope, with no locator.

## Source issues

- none

## For the human reviewers

- SmoothRepresentationsOfLocalGroups on main (README lines 81–82) assigns left xst rings and the abelian category of their firm modules to this roadmap. This README's Out of scope (lines 114–115) excludes them. SmoothRepresentationsOfLocalGroups cites no section here.
