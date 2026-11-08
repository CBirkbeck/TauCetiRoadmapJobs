# Review of AlgebraicCurves (pull request #1854 at d723ba1)

**Verdict:** needs changes

An incremental re-review of 0 changed lines since `25e4020`, the head the previous review read.
`git diff 25e4020..HEAD -- TauCetiRoadmap/AlgebraicCurves` is empty: the README (2054 lines) and
`Suggested.lean` (39 lines) are the same bytes the previous review read, against the same pins
(Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the revs of the pull request's `lake-manifest.json` and of
main's). The files changed outside the folder since then are `TauCetiRoadmap/AlgebraicTopology/README.md`
and `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`; this README cites AlgebraicTopology nowhere
(grep: no match), so they do not touch this roadmap. The one finding of the previous review remains.

## R01 (P3) — edits outside the pull request's roadmap folders (unrepaired; previously R01, before that R05)

Location: `Completed/ArithmeticDirichletSeries/README.md` line 331 ("`LFunctions` consumes this
package alongside its own character-specific continuation") and
`TauCetiRoadmap/SymplecticGeometry/README.md` lines 76–78 ("HeegaardFloer and DGFloer consume the
geometric boundary and sign adapters of CG6").

Claim: the worker's gate at this head (data) reports `outside-folder=2` on exactly these two files,
and `git diff --stat origin/main...HEAD` restricted to paths outside the sixteen folders the brief
names as the pull request's own lists the same two files and nothing else (one hunk each, 4
insertions, 4 deletions). Neither folder is among the pull request's own, so the gate fails
(`FAIL` on `outside-folder` alone, every other scanner `0`, `build=0`) and this folder cannot be
accepted while it does. The two sentences are correct statements of the supply direction (the
description explains both cuts: ArithmeticDirichletSeries → LFunctions and SymplecticGeometry →
DGFloer), so the defect is placement, not content.

Repair: add the two folders to the pull request's own (the description already lists both cuts), or
move the two hunks to a pull request that owns those folders. Not editable from this folder.

## Previous findings

- R01 — not repaired: the two hunks are unchanged at this head; `outside-folder=2` on the same two
  files, `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.

## Verified sound

**Gate and dependency check.** The worker's gate at this head (data): `set_option=0 blob=0 latex=0
tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0
mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0
readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0
depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=2 source-material=0 build=0`; the only
failure is R01. My own dependency check:

```
depcheck: 244 roadmaps, 2483 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; AlgebraicCurves is on main. `lake env lean` on
`TauCetiRoadmap/AlgebraicCurves/Suggested.lean`: exit 0, no output (the file declares nothing, so
not even a `sorry` warning). The pins in `.lake/packages` are Mathlib `1b1ccf4b` and Tau Ceti
`2fd255d9`, the revs of the manifest, which equal main's manifest (`eaf17b10`).

**Lean form.** Line 1 `module`, line 3 `public import Mathlib` and no other import, one module
docstring (lines 5–34) saying the roadmap is `README.md`, that the file states headline theorems
against the pins, and naming every headline with its pinned name, `@[expose] public section`, the
namespace `TauCetiRoadmap.AlgebraicCurves`, no declaration; no `lemma`, `set_option`, `example`,
`#eval`, `#print`, sorry'd data or placeholder. The 22 pinned names the docstring cites were
elaborated by the previous review at the same pins (0 errors among 166 `#check` lines); the bytes
and the pins are unchanged, so that check stands. Padding probe: nothing to probe; a file that
states nothing because every headline is proved at the pin is the correct form, and the previous
review's probe (the three former declarations closed by their pinned names) is the justification.

**The changed passages.** None in the folder. The citations tool reports no cross-roadmap citation
or Lean name found nowhere (data, `citations.md`); the roadmaps the README cites (EllipticCurves,
JacobianChallenge, FormalLaurentPuiseux, ModularForms, BelyiMaps on main; LocalFieldsRamification
under `Completed/`) were resolved by the previous review and main's copies of them are unchanged in
this folder's citations.

**Overlaps (data, checked).** The two other open pull requests on this folder: #1808's copy of
`README.md` and `Suggested.lean` at its current head is byte-identical to this head (`roadmaps show
--pr 1808`, `diff` empty apart from the tool's header comment), so the two no longer conflict in this
folder; #1807's copy is the older state (its `Suggested.lean` still imports two Tau Ceti modules and
its README line 348 says "Layers 0–7 and 10"), and the description's merge order (#1807 before this
pull request) makes this head the surviving version. No id this README cites is dropped by an open
pull request, this pull request drops none, and the closest roadmaps in vocabulary
(CanonicalModelsAndGonality, HyperellipticCurves, FunctionFieldArithmetic, CurvesOverFiniteFields)
name this roadmap as the owner of places, divisors, Weil differentials, the different, the model and
the anti-equivalence (previous report, "Portfolio ownership"). Ownership against open pull requests
whose files the brief does not give was not checked.

**Seeded sample.** The three targets (Riemann–Hurwitz at README 864–885 against
`TauCeti.hurwitz_genus_formula`, `Different/Hurwitz.lean` 72; Portfolio ownership at README 29–34;
Route decision (pinned) at README 36–56 against JacobianChallenge on main lines 135–139 and the pin's
`TauCeti/FieldTheory/FunctionField/` tree) fall in unchanged passages and were verified by the
previous review at the same bytes and pins; its findings carry (the pin's `Algebra.IsSeparable k k'`
is implied by exact constants on both sides with `F'/F` separable).

**Adversarial table.** Every statement is untouched by the (empty) diff, so every row of the previous
report's table (34 rows, from the tensor-domain criterion through `twoChartModel.genus_eq_genus`,
each with the instance and the values computed on both sides) carries forward, citing
`PRREVIEW-AlgebraicCurves~28`; no changed statement, so no new row. One row recomputed as a
spot-check at this head: the Hurwitz formula for `y² − y = x³` over `𝔽₂` with `Diff = 4Q_∞`:
left `1·(2·1 − 2) = 0`, right `2·(0 − 2) + 1·4 = 0`, holds, and the tame count `Σ(e_P − 1) = 1`
would give `−3`, so the wild different is load-bearing as the previous row says.

| statement | instances | left | right | result |
|---|---|---|---|---|
| all 34 statements of the previous table | as in `PRREVIEW-AlgebraicCurves~28` | unchanged bytes | unchanged pins | carried, no change |
| `TauCeti.hurwitz_genus_formula` (spot-check) | `y² − y = x³` over `𝔽₂`, `Diff = 4Q_∞` | `1·(2·1 − 2) = 0` | `2·(0 − 2) + 4 = 0` | holds; tame count would give `−3` |

## Not verifiable

- H. Stichtenoth, *Algebraic Function Fields and Codes* (GTM 254); W. Fulton, *Algebraic Curves*;
  Liu, Hartshorne, Goldschmidt, Villa Salvador, Deuring: no legal electronic copy, as in the
  previous review; the locators sit in unchanged passages and were checked there against the pinned
  declarations whose docstrings carry the same theorem numbers.
- The board package has no `sources.toml`; no cached text is recorded for it.

## Source issues

- none
