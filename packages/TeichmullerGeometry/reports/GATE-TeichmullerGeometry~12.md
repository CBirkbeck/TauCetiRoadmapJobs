# GATE-TeichmullerGeometry~12: answers to the review of 2026-10-19

There is one review (roed-math, of head `84e3d81`, whose roadmap content is unchanged at `7deb505`). The points are numbered in the order they appear. Repairs are in commit `6cf02f81` (not pushed).

## H01 (roed-math) — applied differently
`TauCetiRoadmap/TeichmullerGeometry/Suggested.lean:7` imported `TauCetiRoadmap.ComplexKahlerGeometry.Suggested`. A roadmap may never import another roadmap's module, so waiting for that supplier to be integrated would not fix the build. Lines 1–8 are now `import Mathlib`, `TauCeti.Geometry.Manifold.Basic` and `TauCeti.Geometry.Manifold.Orientation`. The file was restated as an acceptance test. Removed: the CKG-dependent Nijenhuis lemma, the `GeometricSurfaceGroup`/`geometricToNative` definitions, the `#check` and `#print axioms` lines, and the `Mathlib.*` sub-imports. It now states the two headlines that are statable at the pins:
- `exists_diffeomorph_mapOfEq_eq` (T6): smooth, based Dehn–Nielsen realization for closed orientable surfaces with nonabelian `π₁`.
- `exists_mulEquiv_isometryEquiv_glAction` (T9): `GL(2,ℝ)/centre ≃* (ℍ ≃ᵢ ℍ)`, compatible with Mathlib's `UpperHalfPlane.glAction`.

The docstring names the headlines that cannot be stated and what each lacks: `Teich(Σ)`, a topology on `Diffeomorph` or a smooth isotopy relation, a surface genus, and the Euler number of a representation. A normal repository build of the module now succeeds (output below).

## H02 (roed-math) — applied
T5 ("Build quasiconformal theory…") now has a prior-work paragraph. It cites RiemannDynamics (github.com/will1491/RiemannDynamics; the repository exists and holds Beltrami, quasiconformal and measurable-Riemann-mapping material) and says T5 coordinates with its authors before any reuse. It also cites mathlib4#42630, which is open and proposes `Complex.wirtingerDeriv` and `Complex.wirtingerDerivBar`; grep finds no `wirtinger` anywhere in the pinned Mathlib. T5's classical-derivative layer follows that PR's names and shape and is built here, not waited for. The weak `W^{1,2}_loc` hypotheses are kept, and the paragraph adds that weak and classical Wirtinger derivatives agree almost everywhere on the set where the map is classically differentiable.

## H03 (roed-math) — applied
I checked the source: Douady–Earle 1986, §3, Theorem 1 (journal p. 28). It extends every circle homeomorphism, not only quasisymmetric ones, to a homeomorphism of the closed disk whose restriction to the open disk is a real-analytic diffeomorphism. It is natural for the full group `G` of conformal and anticonformal disk automorphisms, `E(g∘φ∘h)=g∘E(φ)∘h` (§1 defines `G`; §3, display before Lemma 2).

In T6, old: "quasisymmetric circle homeomorphism … barycentric extension … Apply GeometricTopology Layer 3g's relative smoothing comparison …". New: the boundary map only needs to be an equivariant homeomorphism; naturality gives `E(φ)∘γ=α(γ)∘E(φ)`, also for orientation-reversing `φ`; and `E(φ)` descends to a real-analytic diffeomorphism, so realization needs no smoothing step. Layer 3g remains in use for T6's collar and disk refinements. Douady–Earle was added to References with its DOI. I read it from the open Acta Mathematica archive at YMSC Tsinghua (licence class `institutional`).

## H04 (roed-math) — applied differently
The section contents of Kerckhoff 1983 cannot be checked from a legal copy. The DOI resolves only to JSTOR (paywalled). The linked unipi page is a course-page copy, not an author or publisher archive, so I did not use it. So neither the README's old section-by-section attribution nor the proposed one can be certified. A section-by-section summary of a source is also outside house style.

The reference (README References, Kerckhoff entry) now cites the paper by DOI for its main theorem: every finite subgroup of the extended mapping class group fixes a point of Teichmüller space, proved by earthquake length-convexity and properness over a filling collection, with the earthquake and convexity theorems proved there. It says explicitly that no section locators are given. The citation is uncertified, by locator only. If a legal copy is named, the section locators can be pinned.

## H05 (roed-math) — applied
T7, after the convexity theorem, now names four T7 targets:
1. The weak transverse-measure topology on `ML(Σ)`, equivalently convergence of `i(·,γ)` for every simple closed curve `γ`.
2. Marking independence: a homeomorphism `ML_X(Σ)≃ML_Y(Σ)` that straightens geodesics through the lifted marking, preserves `i`, and is natural under marking changes.
3. Density of weighted simple closed geodesics, with continuity of `i` and of lengths, used to extend first variation and convexity.
4. The filling-intersection criterion, with its proof for a pants decomposition plus one transverse curve per cuff. A lamination crossing no cuff lies in the pants and is supported on cuffs; the transverse curve through such a cuff then has positive intersection with it.

## H06 (roed-math) — answered
The verification paragraphs request no change. I recomputed the claims they rest on against the current text, and all hold:
- **Local quotient.** For `w=z^m`, `w^{-k}dw²=m²z^{2m−2−mk}dz²` is holomorphic iff `k≤2−2/m`, so the downstairs pole order is at most 1 for `m≥2`.
- **Riemann–Hurwitz.** With `e≥2` and every `1−1/mᵢ≥1/2`, `2g−2≥4h−4+r` gives `r≤2g+2−4h`.
- **Codimension.** `(3g−3)−(3h−3+r)≥g+h−2`, which is positive for `g≥3`.
- **Index bound.** `Area(H²/Γ)/(π/21)=4π(g−1)·21/π=84(g−1)`, and `[Λ:Λ⁺]≤2` gives `D=168(g−1)`.
- **PGL model.** T9's formula for `det A<0`, `(a z̄+b)/(c z̄+d)`, matches Mathlib's `UpperHalfPlane.glAction` (`σ g` is conjugation exactly when `det ≤ 0`). Checks: `diag(1,−1)` and `diag(−1,1)` both act by `z↦−z̄` and differ by the scalar `−1`; `−I` acts trivially.

## H07 (roed-math) — answered
The review's limit, that no Lean compilation was run, no longer applies. `lake build TauCetiRoadmap.TeichmullerGeometry.Suggested` now succeeds in the repository context with only `sorry` warnings. The Nijenhuis statement the review called an honest admitted target depended on the ComplexKahlerGeometry prototype. It is no longer in the Lean file, and the README keeps it in T1 as prose.

## Further repairs and open issues found while checking (not raised by the reviewer)
- **Pinned links.** 19 pinned `github.com/…/blob/<sha>` links to other roadmaps were replaced by name-and-section citations; the gate counted these as `blob`. `InductionRestriction IR2.1` became `InductionRestriction Layer 2.1`, which exists on main ("Layer 2.1: almost-conjugacy and permutation representations", `Gassmann.almostConjugate_iff_permutation_equiv`).
- **Open issue: FuchsianOrbifolds sections not on main.** T8 (L7), T9 (L4a) and the downstream paragraph (L8, L9) cite FuchsianOrbifolds Layers 4a, 7, 8 and 9. These exist only in the open *revision* of FuchsianOrbifolds (PR #1168, checked at its head); main has Layers 0–6. Supplier policy says a revision PR is never a dependency. This also makes a roadmap-level cycle once #1168 merges: Fuchsian L9 consumes Teich T9/T10, and Teich consumes Fuchsian L4a/L7.
  - I did not restructure this, because it is outside the review and would widen scope substantially: L7 is about 650 lines of arithmetic-lattice theory.
  - The human merge decision needs one of three things: merge after #1168 with a section-level exception, move L9 out of FuchsianOrbifolds (for example into a later roadmap), or move ownership of L4a, and of L7's fixed-signature finiteness, into this roadmap.
  - depcheck does not flag this.
- **Ownership.** Both Lean statements are owned here: T6 (realization) and T9 (PGL model). I grepped the pinned Mathlib and Tau Ceti and found no isometry classification of `ℍ` and no Dehn–Nielsen statement. Ownership against the other open new-roadmap PRs was checked only for these two objects, using `roadmaps grep`.
- **Signature check.** I appended `#check @…` for both declarations, elaborated once via the module build, then removed them. Both elaborated types match their README statements: `∞` elaborates to `↑⊤` (C^∞, not analytic), and all binders (`IsManifold`, `TauCeti.Orientable`, `IsClosedConnectedSurface`) are in the signature. No `variable` blocks are used.
- **Adversarial pass on the changed statements:**

| statement | instances | values | result |
|---|---|---|---|
| `exists_diffeomorph_mapOfEq_eq` | S², T², Klein bottle, genus 2 | S²: `π₁=1`, so `hna` fails (excluded); T²: `π₁=ℤ²` abelian, `hna` fails (excluded); Klein bottle: `π₁` nonabelian but not orientable (excluded by `Orientable`); genus ≥2: `Aut(π₁)` ≅ based extended mapping class group (outer version, Farb–Margalit Ch. 8, plus point pushing for inner automorphisms) | true as stated |
| `exists_mulEquiv_isometryEquiv_glAction` | `−I`, `diag(1,−1)`, `diag(−1,1)`, `S` | `−I` acts as `z↦(−z)/(−1)=z` and is in the centre; `diag(1,−1)`: `det=−1`, `z↦conj(z/(−1))=−z̄`, `Im` preserved, is an isometry; `diag(−1,1)` gives the same map and equals `−1·diag(1,−1)`; `S` is an isometry (Mathlib `IsIsometricSMul SL(2,ℝ) ℍ`) | true; the kernel is exactly the scalars |
| T6 Douady–Earle step | orientation-reversing `φ`; `φ` not quasisymmetric | `G` includes anticonformal maps (DE §1), so naturality holds; Theorem 1 needs only a homeomorphism | true |
| T7 filling criterion (iv) | `μ` = a cuff `β`; `μ` crossing a cuff | `i(β, transverse curve)>0`; `i(β',μ)>0` for the crossed cuff `β'∈C` | true |

- **Sources.** Douady–Earle 1986 was fetched (institutional). Kerckhoff 1983 and Farb–Margalit 2012 resolve only to paywalled pages and are cited by locator as uncertified (Farb–Margalit at chapter level only, "Chapter 8"). No text is listed in `needs-references.toml`. This job may not edit `sources.toml`, and the roadmap folder has none yet.

## Build
`lake build TauCetiRoadmap.TeichmullerGeometry.Suggested`: Build completed successfully (8980 jobs); warnings only `Suggested.lean:48:8` and `:65:8` declaration uses `sorry`.

## Gate
`gate TeichmullerGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The single failure is `depcheck: NOT IN ORDER: TeichmullerGeometry (insert it after its last supplier)`, which is expected for a roadmap not yet in the merge order.

Depcheck output:
```
NOT IN ORDER: TeichmullerGeometry (insert it after its last supplier)
depcheck: 155 roadmaps, 1063 edges, 1 problem(s)
```
There are no UPWARD or CYCLE lines.
