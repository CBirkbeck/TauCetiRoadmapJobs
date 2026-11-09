# Review of FuchsianOrbifolds (pull request #1168 at 0dc8059)

**Verdict:** accepted

This is an incremental re-review of the 38 lines that changed since `6c607a2` (7 insertions, 31 deletions, in `README.md` and `Suggested.lean`). No file outside the folder changed.

- The head carries out steps 2–4 of the R01 repair exactly as ~18 wrote them.
- The repair introduces no new problem.
- No finding remains, and the gate passes.

## Previous findings

- R01 — repaired:
  - `Suggested.lean` no longer has the two abbreviations, the seven-name `export TauCeti.RiemannSurface (…)` or the imports `…Compactification.Manifold` and `…RiemannSurface.Divisor.Basic`.
  - Lines 148–153 keep only `export TauCetiRoadmap.FuchsianOrbifolds (genus riemannHurwitz)`.
  - README 179–184 drops "It also declares …".

## Verified sound

**Gate, dependencies and build.**

- Gate rerun on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- The worker's gate on this head, including the targeted build (`build=0`), also passed: "Every check passed."
- Dependency check: `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. FuchsianOrbifolds is line 49 of the merge order.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FuchsianOrbifolds'` is empty.
- `lake env lean TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean` gives 8 `sorry` warnings and nothing else. They are at lines 58, 74, 84, 98, 110, 118, 129 and 138.

**The repair, checked against the instance that refuted the original.**

- **Statements unchanged.** I took the file at `6c607a2` and the file at this head. To each I appended the same `#check @`/`#print` block for the 9 declarations and the 2 short names, under `pp.explicit`, `pp.universes` and `pp.fullNames` (scratch copies only). The two outputs are 2889 lines each and `diff` is empty. So dropping the two imports changed no elaborated statement. In particular:
  - `riemannHurwitz` takes `f : TauCeti.RiemannSurface.FiniteHolomorphicMap X Y` through `open TauCeti`;
  - the `FiniteCWType Γ.CompactifiedQuotient` binders resolve to the same topology instance as before.
- **Kept short names.** `#check @RiemannSurface.genus` and `#check @RiemannSurface.riemannHurwitz` resolve. They are the names main cites: NoncongruenceModularForms README 651 and 1400; PseudoholomorphicCurveAnalysis README 194, 1317 and 1378.
- **Removed names have no user.**
  - `roadmaps grep` finds no match for `FuchsianOrbifolds\.CompactifiedQuotient` on main or at any open head.
  - `compactifiedChartedSpace` occurs only in this roadmap: main's superseded copy, and this pull request's head as indexed before this commit.
  - The bare short names `RiemannSurface.{FiniteHolomorphicMap, localMultiplicity, degree, degree_comp, divisorPullback, biholomorphOfDegreeEqOne}` are cited nowhere except main's own FuchsianOrbifolds README 95–98, which this pull request replaces.
  - No `.lean` file outside the folder, on main or in this worktree, names `TauCetiRoadmap.FuchsianOrbifolds`.
- **Kept README sentence (182).** It reads: "The carrier written `CompactifiedQuotient Γ` in other roadmaps is Tau Ceti's `Γ.CompactifiedQuotient`." With the abbreviation gone, it is now the only pointer.
  - NoncongruenceModularForms README 652 and 1252 write `CompactifiedQuotient Γ_ℙ`.
  - The pinned carrier is `inductive CompactifiedQuotient (Γ : Subgroup PSL(2, ℝ))` at `TauCeti/Analysis/Complex/Fuchsian/Compactification/Basic.lean:75`.
- **Pinned names in the docstring and README.** These are pinned declarations that the reduced imports no longer load. Each one exists at the Tau Ceti pin:
  - `Subgroup.CompactifiedQuotient.instChartedSpace`: `Fuchsian/Compactification/Manifold.lean:120`;
  - `instIsManifold`: same file, line 260;
  - `IsCofinite.compactSpace_compactifiedQuotient`: `Fuchsian/DirichletDomain/Cofinite.lean:163`;
  - `eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree`: `RiemannSurface/Branch/EulerCharacteristic.lean:130`;
  - `compactifiedQuotientFiniteHolomorphicMap`: `Fuchsian/Compactification/FiniteHolomorphicMap.lean:38`;
  - `jBiholomorph`: `Fuchsian/LevelOne/Sphere.lean:175`;
  - `exists_isCofinite_triangleGroup`: `Fuchsian/TriangleOrder/Group.lean:469`;
  - `relatorQuotientTo_bijective_of_isParabolic`: `Fuchsian/Polygon/Poincare.lean:102`;
  - `IsCofinite.exists_sidePairing_relatorQuotientTo_bijective`: `Fuchsian/DirichletDomain/Cofinite.lean:225`;
  - `instIsManifoldOrbitRelQuotient`: `Fuchsian/CoarseQuotient.lean:130`;
  - `instMulActionPSL2`: `UpperHalfPlane/PSL/Action.lean:136`.

  `TauCeti.RiemannSurface.divisorPullback` and `biholomorphOfDegreeEqOne` (README 689–691) elaborate at the pin.
- **Form.**
  - The section comments are `Layer 2`, `Layer 5`, `Layer 4a`, in README order (headings at 405, 659 and 816).
  - The README's line 190 import graph names `RiemannSurface.{Degree, Ramification, Divisor, Branch}`. It describes the library dependencies of Layer 5, not `Suggested.lean`'s imports. All four modules exist at the pin.
  - The file has no `variable` block, so no binder can be lost.
- **Citations and overlaps.**
  - `roadmaps resolve` on the README: no cross-roadmap citation or Lean name is found nowhere. The worker's one lead, `RiemannSurface.riemannHurwitz` (README 180), is this file's export and resolves under `#check`.
  - `roadmaps overlaps`: the only pull request that changes this roadmap is this one. No cited id is dropped or defined only by an open revision. The closest roadmaps are FuchsianOrbifoldsPartII, GroupActionsOnRiemannSurfaces, KleinianGroups, TeichmullerGeometry and ArithmeticFuchsianGroups. Their ownership was audited in ~13, and this change adds no object.

**Sources: the seeded sample.** The 8 "Source spine:" lines are textually unchanged. They moved up by 4 lines and are now at 365, 403, 561, 602, 657, 813, 899 and 936. I re-read Martin2013 lines 212–227 (page 6):

- Theorem 2.1 (213–214): the minimum is `π/21`, attained only by the `(2,3,7)` triangle group.
- Theorem 2.2 (217–227): the area is `2π(2g − 2 + N + Σ(1 − 1/mⱼ))`.

These support line 899 and the four Layer 4a and Layer 5 area theorems as stated. No README locator is flagged unverified.

**Headline theorems and padding.**

- The headline list is unchanged from ~18:
  - the distance comparison;
  - `χ = 2 − 2g`;
  - Riemann–Hurwitz;
  - the orbifold area formula;
  - the four minimal-area theorems.
- The docstring names the headlines that are proved at the pin. Every headline is statable at the pins.
- One-tactic probe, rerun this round on a scratch copy: each `sorry` was replaced by `first | rfl | infer_instance | simp | norm_num | decide`. All 8 fail, at lines 58, 76, 90, 102, 111, 123, 131 and 143. Nothing is padding.
- After the repair, `genus` is the only definition, and three headlines use it.

**Adversarial table.** Rows marked "new" are computed this round. Rows marked "~18" are carried from review ~18, which carried most of them from ~14 to ~17. They are carried because no statement or Check they test changed: the term-level diff of the 9 declarations is empty, and the README diff touches only 179–184.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| new: deleted block, users at `0dc8059` | main `1bea835`; 458 open heads; this tree | `FuchsianOrbifolds.CompactifiedQuotient` hits: 0; `compactifiedChartedSpace` outside this roadmap: 0; bare `RiemannSurface.{degree,…}` outside it: 0; `.lean` files naming the module outside the folder: 0 | deletion breaks nothing |
| new: the 9 declarations after dropping 2 imports | `6c607a2` file against `0dc8059` file, `pp.explicit` | 2889 lines against 2889 lines; `diff` empty; 8 `sorry` warnings, 0 errors | statements identical |
| new: `RiemannSurface.genus`, `RiemannSurface.riemannHurwitz` | `#check @` at this head; citations on main | both resolve, to `TauCetiRoadmap.FuchsianOrbifolds.genus` and `TauCetiRoadmap.FuchsianOrbifolds.riemannHurwitz`; citations: NMF 2 and PHCA 3 | README 179–181 holds |
| new: README 182, the carrier sentence | NMF 652 and 1252; pin `Compactification/Basic.lean:75` | 2 uses of `CompactifiedQuotient Γ_ℙ`; the pinned `inductive CompactifiedQuotient (Γ : Subgroup PSL(2, ℝ))` is `Γ.CompactifiedQuotient` by dot notation | holds |
| new: module docstring 13–29 | 11 pinned names it and the README cite | 11 of 11 found at the pin (file and line above); 0 needed in the imports, since they occur only in prose | consistent |
| new: one-tactic probe | 8 theorems; `first \| rfl \| infer_instance \| simp \| norm_num \| decide` | 8 errors, 0 closed | no padding |
| ~18: README 920 against ModularForms §10A | `X(1)`: `χ = 2`; §10A formula | `genus X(1) = 0`; `1 + 1/12 − 1/4 − 1/3 − 1/2 = 0` | agree |
| ~18: §10A formula against `riemannHurwitz` | `X₀(2) → X(1)`: `d = 3`, `ε₂ = 1`, `ε₃ = 0`, `ε∞ = 2` | §10A gives `0`; RH forces `R = 4`; the fibres give `1 + 1 + 2 = 4` | consistent |
| ~18: Conventions and L3.4, scaling of a cusp datum | `σ′ = 2σ + 1`, `w = 1` | `w′ = 2`; `q′ = −q`; the pinned factor gives `−1` | README formula = pin |
| ~18: L4.3, every cusp chart in the atlas | `D` with `A = w = 1`; `D′` with `A′ = w′ = 2` | `cuspChart_mem_atlas D le_rfl` and `D′ le_rfl` hold; the transition `q ↦ −q` is linear | holds |
| ~18: L4.3, the cutoff "at least the width" | `PSL(2,ℤ)` at `∞`; `z = 0.8i`, `Sz = −1/z` | at `A = 1/2`: `Im = 0.8` and `1.25`, so not injective; at `A = 1`: `Im(gz) < 1` for `c ≠ 0` | cutoff needed and correct |
| ~18: L5.6 and L5.7 *Needs:* L2.1 | `Γ(2) ≤ PSL(2,ℤ)`, `d = 6`; `(0; 2, 3; 1)` | `6·π/3 = 2π`; `2π(−2 + 1/2 + 2/3 + 1) = π/3` | holds |
| ~18: L4a.1–2 *Needs:* L2.1 | `(0;2,3,7)`, `(0;2,3;1)`, `(0;2;2)` | `π/21 ≈ 0.1496`, `π/3`, `π` | holds |
| ~18: dependency table and the one interleave | Depends against Feeds | equal for L0–L5 and L4a; 1 interleave (L2/L3), stated | consistent |
| ~18: README 36, what ArithmeticFuchsianGroups takes | AFG contract 267–284 | L0 `{1,2,3}`, L2 `{1,3,4,5}`, L4 `{5}`, L4a, L5 `{5,6,7}` | equal |
| ~18: README 109–116, free-locus covering | `PSL(2,ℤ)` at `i`, `ρ`, `2i` | stabilizer orders `2, 3, 1`; covering only at `2i` | as stated |
| ~18: meridian endpoint; cusp extensions | `w = 1` from `i`; `exp(2πiz)`; `j` | `1 + i = T·i` (the inverse convention gives `−1 + i`); `F(0) = 0`; `j` has a simple pole | matches |
| ~18: `isRiemannianManifold_upperHalfPlane` | `(i,2i)`, `(i,3i)`, `(i,1+i)` | `0.693147`, `1.098612`, `0.962424` | holds |
| ~18: `genus` | `P¹`, torus, genus 3, `RP²`, `P¹ ⊔ P¹` | `0, 1, 3`; `RP²` gives `0` (junk); `P¹ ⊔ P¹` gives `0` (junk) | determines the genus |
| ~18: `eulerChar_eq_two_sub_two_mul_genus` | genus 3; `P¹ ⊔ P¹`; `ℂ`; `X(1)` | `−4 = 2−6`; `4 ≠ 2`; `1 ≠ 2`; `2 = 2` | holds; both hypotheses needed |
| ~18: `riemannHurwitz` | `z³`; `[2]` on `E`; genus 2 → `P¹`; sign error | `−2 = −6+4`; `0 = 0`; `2 = −4+6`; with `−R`, `−2` against `−6` | holds |
| ~18: L5.3 punctured step | tetrahedron, `z²` | `0 = 2·0`; the no-drop model gives `2 = 4` | holds |
| ~18: `covolume_eq_two_pi_mul_signature` | `PSL(2,ℤ)`, `Γ₀(2)`, `Γ(2)`, `(2,3,7)`, trivial group | `π/3`; `π`; `2π`; `π/21`; trivial group: RHS `0`, LHS `∞` | holds; `hΓ` needed |
| ~18: L5.7 cell count | `(3,1,1,1)`, `(4,0,0,3)`, `(4,0,0,1)`, `(8,0,1,0)` | `2, 2, 0, −2`; the wrong count gives `1` | holds |
| ~18: `pi_div_twentyOne_le_covolume` | `(2,3,7)`, `(2,3,8)`, `(2,4,5)`, `(3,3,4)`, `PSL(2,ℤ)` | `π/21, π/12, π/10, π/6, π/3`, all `≥ 0.1496` | holds |
| ~18: L4a.1 cases | `(2,3,m)` for `m = 6,7,8`; `(2,4,4)`; `(2,4,5)`; `(3,3,3)`; `(2,2,2,3)`; `(1;2)` | `0, 1/42, 1/24`; `0`; `1/20`; `0`; `1/6`; `1/2` | minimum `1/42` only at `(2,3,7)` |
| ~18: `covolume_eq_pi_div_twentyOne_iff` | `(2,3,7)`, `(2,3,8)`, `PSL(2,ℤ)` | T/T; F/F; F/F | agree both ways |
| ~18: `minimum_area_finite_area_orbifold` | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;2,4;1)`, `(2,3,7)` | `π/3, π, π/2 ≥ 1.0472`; with no cusp, `π/21 < π/3` | holds; cusp needed |
| ~18: `covolume_eq_pi_div_three_iff` | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;2,4;1)`, `(0;3,3;1)` | T/T; F/F; F/F; F/F | agree both ways |
| ~18: L2.1 tensor Checks, completeness | `diag(2,1)` at `i`; `−1/z` at `2i`; `i/n` | `1 = 4/4`; `1/4 = 1/4`; `dist(i/n, i/2n) = log 2` | conventions pinned |
| ~18: L0.1, L0.2; L1.2, L3.3, Layer 6 | discrete `PSL(2,ℝ)`; `diag(1,−1)`; `ε = log 3, m = 3`; `S(2i)`; `j` | uncountable; distances `2 arsinh(1/2)` on both sides; radius `1/8`; height `1/2`; orders `3, 2`, degree 1 | as stated |

## Not verifiable

- These are recorded `uncertified` in the manifest and are cited by locator only: Beardon1983, Forster1981, FarkasKra1992, DiamondShurman2005, Serre1973, Stillwell1992 and Siegel1945. Siegel's statement was read through Martin2013, Theorem 2.1.
- Katok, *Fuchsian Groups* (1992), and Miranda, *Algebraic Curves and Riemann Surfaces* (1995), have no key in the package's `sources.toml`. In ~13 the sources service found no legal copy of either.
- Ownership against open pull requests: this change only deletes renamings of pinned declarations and adds no object, so the audit of ~13 stands.

## Source issues

- **Misprint** in Martin2013 at Theorem 2.2, p. 6 (lines 217–222): the source names the number of punctures with one letter and then writes a different letter for the cusp count in the area formula; it should use one letter for the number of cusps; affects nothing.
