# GATE-ArithmeticFuchsianGroups~1: answers to human review

Head `a0992d0`. Line numbers refer to `TauCetiRoadmap/ArithmeticFuchsianGroups/README.md` at that
head. No file was changed and nothing was committed.

## H01 (mycaule) — answered

The two projects share no object. This roadmap's only global normalizer is the positive normalizer
`N_B⁺(O)` of a maximal order (README §1.2, lines 561–585). For `N > 1`, Γ₀(N) is `Γ(O)` of the
level-N Eichler order, which is not maximal (§1.1 Check, lines 446–447). So the normalizer of Γ₀(N)
in SL₂(ℝ) and Newman's description of its elements (LeanPool `Norm0` and `newman'`, in
`NormalizerLean/Defs.lean` and `NormalizerLean/NewmanMain.lean` at commit f8b9b72) are neither
planned nor used here. Γ₀(2) appears here only in Checks (lines 616–618, 874–878 and 1024–1025),
and the Atkin–Lehner elements at line 593 normalize the maximal order of the division algebra
`(−1,3)_ℚ`, not Γ₀(N).

The Γ₀(N) side that does exist is already in the pinned Tau Ceti: `TauCeti.IsAtkinLehnerMatrix`
(`TauCeti/NumberTheory/ModularForms/AtkinLehner/Matrix.lean`, line 116) and
`TauCeti.IsAtkinLehnerMatrix.mem_normalizer_map_mapGL`, which shows that an Atkin–Lehner matrix
normalizes Γ₀(N) in GL₂(ℚ) (`.../AtkinLehner/DoubleCoset.lean`, line 80). LeanPool is not among the
suppliers this roadmap may use (Mathlib, Tau Ceti at the pins and Tau Ceti roadmaps), so the overlap
calls for no citation, dependency or edit.

## Adversarial pass on the statements the answer relies on

No statement was added or changed. The table re-checks the README statements that H01 concerns,
with the computed values.

| Statement (README line) | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `N_B⁺(M₂(ℤ))` is the image of `SL₂(ℤ)`, `im ν` trivial, covolume `π/3` (589–591) | `g = λh` with `h ∈ GL₂(ℤ)`; `h = diag(−1,1)` | `det g = λ² det h > 0` forces `det h = 1`; `ν([λh]) = [λ²] = [1]`; `8π · (π²/6)/(4π²) = π/3` | holds | none |
| Discriminant-6 order: area `2π/3`, `im ν = {1,2,3,6}`, normalizer area `π/6` (592–595) | `1+i`, `3+ij`, `3+j+ij` in `ℍ[ℚ,−1,3]`, whose norm form is `x₀² + x₁² − 3x₂² − 3x₃²` | Nrd = `1+1 = 2`, `9−3 = 6`, `9−3−3 = 3`, all positive at `∞`; at `p ∤ 6` each is a local unit, and at `p = 2, 3` every element normalizes the unique local maximal order; `(π/3)·1·2 = 2π/3 = 2π(−2+½+½+⅔+⅔)`; `(2π/3)/4 = π/6 = 2π(−2+½+¾+⅚)` | holds | none |
| Γ₀(2) has index 3 and area `π` and is the intersection of adjacent maximal orders (616–618) | `p = 2`; lattices `ℤ²` and `ℤ⊕2ℤ` | `[SL₂(ℤ):Γ₀(2)] = 2+1 = 3`, and `−I ∈ Γ₀(2)` keeps the index 3 in PSL; `3·π/3 = π`; `End(ℤ⊕2ℤ) = (ℤ ½ℤ; 2ℤ ℤ)`, whose intersection with `M₂(ℤ)` is `(ℤ ℤ; 2ℤ ℤ)` | holds | none |
| The setwise edge stabilizer exchanges the endpoints and normalizes the Eichler order (578–580) | `w = (0 1; 2 0)` at `v = 2`; the identity | `w M₂(ℤ₂) w⁻¹ = (ℤ₂ ½ℤ₂; 2ℤ₂ ℤ₂)`; `w² = 2I` is scalar; `w(a b; 2c d)w⁻¹ = (d c; 2b a)`; the identity fixes both endpoints | holds | none |
| `diag(−1,1)` normalizes Γ₀(2) (876–878) | `(a b; c d)` with `c` even | the conjugate is `(a −b; −c d)`, whose lower-left entry is still even | holds | none |
| `diag(2,1)` conjugates Γ₀(2) into a group commensurable with `PSL₂(ℤ)` (1024–1025) | `(a b; c d)` with `c` even | the conjugate is `(a 2b; c/2 d)`, which lies in Γ⁰(2), of index 3 in `SL₂(ℤ)` | holds | none |
| No README statement computes the normalizer of Γ₀(N), N > 1 | Fricke element `w = (0 −1; 2 0)`, det 2 | `w(a b; 2c d)w⁻¹ = (d −c; −2b a)`, so the normalizer of Γ₀(2) in PSL₂(ℝ) is strictly larger than Γ₀(2); a search of the README and Suggested.lean for `normaliz`, `Γ₀`, `Atkin` and `Fricke` finds no claim about it | consistent | none |

## Suggested.lean

Unchanged. The elaborated signatures of the 28 declarations recorded for this head still apply (0
lost binders), so no `#check` comparison needed rerunning.

## Ownership, citations and sources

- No construction or citation was added, so ownership did not change. A search of the roadmaps on
  main and at the open heads (`atkin.?lehner|Newman`, case-insensitive) finds no plan of Newman's
  theorem on the normalizer of Γ₀(N). The nearest material is ModularCurvesPartII §9.4
  (exact-divisor Atkin–Lehner operators on modular curves), which this roadmap does not use.
- No source was fetched, and no `needs-references.toml` was written. The LeanPool pages
  (CongruenceNormalizers at commit f8b9b72) were read as data only. Nothing suspicious was found in
  the review text or in the fetched pages.

## Build

`lake build TauCetiRoadmap.ArithmeticFuchsianGroups.Suggested`: `Build completed successfully (18344
jobs).` The only warnings were `declaration uses sorry` on the headline theorems and the
module-system notice about `import Mathlib`.

## Gate

`gate ArithmeticFuchsianGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Dependency direction

`depcheck: 250 roadmaps, 2381 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line for
this roadmap.
