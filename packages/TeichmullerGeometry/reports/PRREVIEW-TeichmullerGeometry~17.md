# Review of TeichmullerGeometry (pull request #1169 at 1991188)

**Verdict:** needs changes

This is an incremental re-review of the 51 lines changed since `62043e1`. The changes are:
- scope lines 21 and 27;
- Conventions line 51;
- the Mathlib, Tau Ceti and ArithmeticFuchsianGroups contracts (lines 62, 66 and 102);
- How to read the build (line 114);
- §0.4a (lines 337, 343 and 348);
- the Layer 0 and Layer 4 Dependencies (lines 369 and 588);
- Downstream consumers (lines 990–1005);
- the deletion of `exists_mulEquiv_isometryEquiv_glAction` from `Suggested.lean`.

The two findings that touched the roadmap folder (the double ownership of the isometry identification, and the PGL topology convention) are repaired correctly. The repairs introduce no new defect. Two P3 findings remain, and neither one's repair is in this folder:
- a stale ownership pointer in GeometricTopology (#903);
- a false sentence in this pull request's description.

## R01 (P3) — #903 still assigns the smoothing of paths to its §3.3, which does not state it

**Location.**
- #903 at its new head `d3b536e`, `TauCetiRoadmap/GeometricTopology/README.md` line 1460: "a continuous path in `Diff(M)` need not be a smooth isotopy, and the smoothing of paths is Layer 3.3's."
- This README's scope line 12 owns "the parameter-smoothing converse … for every compact manifold". §0.2 (line 292) plans it.

**Claim.**
- **The pointer is unchanged.** #903 moved from `aaa605b` to `d3b536e` and kept the sentence.
- **§3.3 still states no path smoothing.** At `d3b536e` it is lines 1504–1550. It states:
  - the weak topology on embeddings;
  - isotopy extension (`TauCeti.SmoothIsotopy.exists_diffeotopy_apply_eq`);
  - the continuous lift of paths in `Emb(N, M)` to `Diff_c(M)`;
  - the disc theorem.
- **Consequence.** Two roadmaps claim the parameter-smoothing theorem, and only this one plans it. This README's scope line 12 correctly says that GeometricTopology Layer 3 does not state the converse.

**Witness.** At `d3b536e`, `grep -n "smoothing of paths"` hits only line 1460. Over §3.3, a grep for `smooth\|path` finds only embedding-space, isotopy-extension, ambient-isotopy and disc statements, at §3.3 relative lines 4–46.

**Repair.**
- **In #903.** Replace "and the smoothing of paths is Layer 3.3's" with "and the smoothing of paths is TeichmullerGeometry §0.2's", or with "and the smoothing of paths is not planned here".
- **In this README.** No change.
- **Re-test.** `grep -n "smoothing of paths"` over #903 then names no section of #903 that lacks the statement.

## R02 (P3) — The description's "Dependencies:" sentence still describes an exchange with FuchsianOrbifolds that does not exist

**Location.** The pull-request description, "Dependencies:" paragraph: "Its early quotient/area/Riemann–Hurwitz and arithmetic L7.4 targets feed Teich; this roadmap's T0/T4a/T9/T10 feed Fuchsian late L9."

**Claim.**
- **The sentence is unchanged.** It contradicts both roadmaps.
  - At #1168's head `a1a346e`, FuchsianOrbifolds has no Layer 7 or Layer 9, and it consumes nothing from this roadmap.
  - The arithmetic lattices come from ArithmeticFuchsianGroups.
  - README line 41 says supply runs one way.
- **The other half of the repair is already done.** The generated "Depends on" block lists #2026, #1168 and #903. Only the sentence remains.

**Witness.**
- #1168 at `a1a346e` has `## Layer` headings 0, 1, 2, 3, 4, 5, 4a and 6 (lines 285–623).
- Its line 659 reads: "No row depends on TeichmullerGeometry".

**Repair.** Replace the quoted sentence with: "FuchsianOrbifolds (#1168) and ArithmeticFuchsianGroups (#2026) supply this roadmap and consume nothing from it."

## Previous findings

- R01 — repaired:
  - Scope line 27 leaves "that every distance-preserving bijection of `ℍ` … is the action of exactly one element of `PGL₂(ℝ)`" to ArithmeticFuchsianGroups §3.1.
  - §0.4a line 337 consumes it.
  - `exists_mulEquiv_isometryEquiv_glAction` is deleted from both files.
  - The variant clause is gone.
- R02 — not repaired: the description still reads "arithmetic L7.4 targets feed Teich; this roadmap's T0/T4a/T9/T10 feed Fuchsian late L9". The generated "Depends on" block now lists #2026. Carried as R02.
- R03 — not repaired: #903 at `d3b536e` line 1460 still reads "and the smoothing of paths is Layer 3.3's". Its §3.3 (lines 1504–1550) states no path smoothing. Carried as R01.
- R04 — repaired: line 51 now reads "a `def` for `GL (Fin 2) ℝ ⧸ Subgroup.center (GL (Fin 2) ℝ)` that derives only its group structure and carries no topology at the pin; this roadmap gives it the quotient topology". A probe confirms both halves.

## Verified sound

### Mechanical checks at `1991188`

- **Gate.** The brief's command printed:

  `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

  It exited 0. The worker's `gate.md` records the same result, with `build=0`.
- **Elaboration.** `lake env lean TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` exits 0. It reports 21 "declaration uses `sorry`" warnings (22 at `62043e1`, one theorem deleted) and no other diagnostic.
- **`#check @name`.** A scratch copy with `#check @name` for all 52 `TauCetiRoadmap.TeichmullerGeometry.*` declarations elaborates with 0 errors. No surviving declaration changed its type. Removing `UpperHalfPlane` from `open scoped` is safe, because `ℍ` and `UpperHalfPlane` occur nowhere in the file.
- **Dependency check** (the brief's command):

  ```text
  depcheck: 238 roadmaps, 2323 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or `moved:` line. The new edge to ArithmeticFuchsianGroups §3.1 points down the merge order: ArithmeticFuchsianGroups is at line 284 and TeichmullerGeometry at line 285.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TeichmullerGeometry'` is empty.
- **Overlaps and citations.**
  - `overlaps.md` lists no open pull request that changes this roadmap and no dropped id.
  - The 15 "Lean names found nowhere" in `citations.md` are this roadmap's own `Suggested.lean` declarations.
  - The tool index still shows the deleted theorem at an older head of #1169. The worktree at `1991188` contains it in neither file.
  - `roadmaps grep` finds no other roadmap that cites `exists_mulEquiv_isometryEquiv_glAction`, so the deletion drops no cited id.
- **Sibling heads checked directly:** #2026 at `c567d7a`, #1168 at `a1a346e` and #903 at `d3b536e`.

### The changed passages

- **Single owner.** ArithmeticFuchsianGroups owns the statement at its scope line 46 and §3.1 (line 913).
  - Its Lean statement (`Suggested.lean` line 239) is `existsUnique_pgl_smul_eq_isometryEquiv (f : UpperHalfPlane ≃ᵢ UpperHalfPlane) : ∃! c : PGL(2, ℝ), ∀ z, f z = c • z`. It has no smoothness or lift binder, exactly as the new contract at line 102 assumes.
  - This README now only cites it, at lines 27, 102 and 337.
  - #2026's references to this roadmap (lines 919, 1028 and 1031) are consumer notes, not *Needs*, so supply runs one way.
- **Library declarations opened at the pin.**
  - `Matrix.ProjGenLinGroup` is a `def … := GL n R ⧸ Subgroup.center (GL n R) deriving Group` (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean` lines 40–42).
  - `Matrix.ProjectiveSpecialLinearGroup.toPGL` is at line 113 of the same file.
  - `FaithfulSMul PGL(2, ℝ) ℍ` is at `Mathlib/Analysis/Complex/UpperHalfPlane/FixedPoints.lean` line 208.
  - `UpperHalfPlane.σ` (`MoebiusAction.lean` lines 90–92) is the identity for `0 < det` and conjugation otherwise. `smulAux'` (line 140) applies it after the Möbius map, which confirms the `(a z̄ + b)/(c z̄ + d)` reading.
  - `IsometryEquiv.mul_apply` (`Mathlib/Topology/MetricSpace/Isometry.lean` line 578) gives `(e₁ * e₂) x = e₁ (e₂ x)`.
  - `UpperHalfPlane.dist_eq` is at `Metric.lean` line 43.
- **Probe of R04's repair.**
  - `Matrix.ProjGenLinGroup (Fin 2) ℝ = GL (Fin 2) ℝ ⧸ Subgroup.center _` holds by `rfl`.
  - `TopologicalSpace` is found on the quotient spelling and fails to synthesize on `ProjGenLinGroup`.
  - `FaithfulSMul` is found.
  - FuchsianOrbifolds installs a topology on `PSL(2,ℝ)` only (its line 287), so no second owner exists for the `PGL₂(ℝ)` topology convention.
- **Dropped contract entries.** `MulAction.IsPretransitive` and `UpperHalfSpace.isPretransitive_isom` are no longer used anywhere in the README or `Suggested.lean`; a grep finds 0 hits.
- **Citations of §0.4a elsewhere in the README** still resolve to content that §0.4a keeps:
  - line 41 and line 990: lifting;
  - line 352: orientation-preserving isometries are `PSL₂(ℝ)`;
  - line 566: the comparison isometry;
  - line 954: lifting.
- **The seeded sample.** None of the fifteen seeded targets falls in the changed lines. Their locators were verified in rounds `~8` to `~10` and `~14`, and the README flags no locator as unverified. No changed line carries an external locator.

### Adversarial table

Rows B1–B11 are new and cover every changed statement. Rows marked `~16`, `~15`, `~14` and `~13` are carried from those reports for statements this diff leaves untouched.

Rows `~16` A1, A2 and A7 checked the metric argument and the Tau Ceti/Mazur–Ulam remark, which this head deletes from §0.4a. Rows A5, A6, A8 and A10 are superseded by B3, B5, B4/B7 and B11.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| B1 | §0.4a new Check 3: `z ↦ −2z̄` is one class, and one geodesic does not fix the class | `diag(−2,1)`, `diag(−4,2)`, `diag(2,−1)`, `diag(2,1)`; `z = 1+i`, `iy` | `σ` conjugates when `det ≤ 0`, so all three send `1+i ↦ conj(−2−2i) = −2+2i`; determinants `−2, −8, −2`; `diag(−4,2) = 2·diag(−2,1)` and `diag(2,−1) = (−1)·diag(−2,1)`; `diag(2,1)`: `1+i ↦ 2+2i`, `iy ↦ 2iy`, while `diag(−2,1)`: `iy ↦ −2·(−iy) = 2iy`; `dist(2+2i, −2+2i) = 2 arsinh(4/4) = 1.762747 ≠ 0` | true | none |
| B2 | §0.4a: the action gives a homomorphism `PGL(2,ℝ) → Isom(ℍ)`, injective by its kernel and bijective by §3.1 | `−3I`; `S = [[0,−1],[1,0]]` | `−3I`: `det = 9 > 0` and `(−3z)/(−3) = z`, so trivial; `S`: `i ↦ i` and `2i ↦ i/2`, with `dist(i,2i) = dist(i,i/2) = 2 arsinh(0.353553) = 0.693147`; `mul_apply` `(e₁e₂)x = e₁(e₂x)` matches `(gh)•z = g•(h•z)` | true, with the homomorphism in the right direction | none |
| B3 | Line 51: the R04 repair | Lean probe | `rfl`: the types are equal; quotient spelling: `TopologicalSpace` found; `ProjGenLinGroup`: synthesis fails | true as now written | none |
| B4 | Line 102: §3.1 holds for every `ℍ ≃ᵢ ℍ`, with no smoothness and no lift | #2026 `c567d7a`, `Suggested.lean` line 239; `f = z ↦ −2z̄` | one binder, `f : ℍ ≃ᵢ ℍ`; the conclusion is `∃!` in `PGL(2, ℝ)`; for this `f` the class is that of `diag(−2,1)` (= `diag(2,−1)`, B1) | true | none |
| B5 | Line 62: the Mathlib contract | 4 declarations | file and line listed above; `deriving Group` only; dropped `IsPretransitive` has 0 remaining uses | true | none |
| B6 | Line 66: `isPretransitive_isom` dropped | grep | 0 uses in the README or `Suggested.lean` | consistent | none |
| B7 | Lines 21, 27 and 337: a single owner | grep of both READMEs | owning statements: #2026 lines 46 and 913; here, 0 owning and 3 citing (27, 102, 337); #2026 has 0 *Needs* on this roadmap | single owner | none |
| B8 | Lines 990–1005: Downstream consumers | the earlier ids and the supplied-elsewhere bullets | 3 such bullets (the `Isom(ℍ)` identification, `Γ(O)`, `π/21`), matching "three objects"; `T9` maps to Layer 10 and §0.4a; Layer 4.1 maps to §0.4a; the identification maps to #2026 §3.1 (line 913) | true | none |
| B9 | Lines 114, 369 and 588: How to read, and the Layer 0 and Layer 4 Dependencies | the cited section | ArithmeticFuchsianGroups §3.1 exists at line 911 of #2026 | resolve | none |
| B10 | Line 41: supply runs one way | #2026, #1168, #903 | 0 *Needs* on this roadmap; the mentions are #2026 lines 919/1028/1031, #1168 line 659 and #903 lines 168/215/8004, all consumer notes | true | none |
| B11 | `Suggested.lean` deletion | elaboration; `#check @` × 52 | 21 `sorry` warnings and 0 other diagnostics; 52 checks with 0 errors; 0 uses of `ℍ` after the `open scoped` change | true | none |
| ~16 A3 | §0.4a: the image of `toPGL` is the positive-determinant classes; `[Γ : Γ⁺] ≤ 2` | `diag(2,1)`, `diag(−2,1)`, `−I`; `Γ = ⟨diag(−2,1)⟩` | `det(λg) = λ² det g`; `diag(−2,1)` gives `−2λ² < 0`; `Γ⁺ = ⟨diag(4,1)⟩`, index 2 | true | none |
| ~16 A4 | §0.4a: discreteness pulls back along `toPGL` | `⟨diag(−2,1)⟩`; `⟨diag(2,1), diag(3,1)⟩` | `d(i, 4ᵏi) = \|k\|·1.386294`; `log 2/log 3` is irrational, so the second group is non-discrete on both sides | true | none |
| ~16 A9 | Line 21: R4 item 7 keeps `O⁺(n,1)`, Killing–Hopf, continuation and the quotient metric | RiemannianGeometry main, lines 717–765 | all four present for `n ≥ 2` | true | none |
| ~15 H2 | The earlier-id list covers the cited ids | 11 ids | 10 resolve to headings; Layer 4.1 is mapped (now B8) | true | none |
| ~14 G1–G2 | ArithmeticFuchsianGroups contract, Layer 1 items 1 and 4 | `M₂(ℤ)`; `(2,3,7)`; `(g; −)` with `g = 0, 1, 2` | area `π/3 ≈ 1.0472`; `2π/42 ≈ 0.1496`; `A = −4π, 0, 4π` | true | none |
| ~14 G3–G5 | §9.2 covolume, Check 3; §9.1 Takeuchi | Bolza; Klein; `(0;2,3,8)`; `PSL₂(ℤ)` | `48·π/12 = 4π`; `168·π/21 = 8π`; `π/12 < π/3` | true | none |
| ~14 G6–G7, G11 | `OuterAut`; Dehn–Nielsen–Baer; Layer 4 supplies §4.2 | `S₃`, `Q₈`, `ℤ²`; `T²`, `S²`, genus 2 | `\|Out\|` = 1 and 6; `GL₂(ℤ)`; `S²` excluded | true | none |
| ~14 G8, G10 | Supply runs one way; line 989 | `g = 3`, `g = 2` | genus `17 = 8·3 − 7` | true | none |
| ~13 E1–E8 | §0.4a proper discontinuity, glide and lifting; layer order | `diag(−2,1)`, `K = B(i,1)`; *Needs* lines | `d(i, gⁿi) = 0.693147·\|n\|`; 0 upward citations | true | none |
| ~13 (~12 D1–D8, ~11 C1–C2, ~10 N1–N7) | §§0.0a–0.5, §2.4, §§3.1–11.1, conventions | `S = ∅`, Dyck, `Q₈`, Bolza, Klein | `χ = 1, 0, −1`; `96 ≤ 168`; `e = −2` | true | R01 (ownership in #903) |

### Headline theorems and padding

- **Headlines.** `Suggested.lean` states 21 sorried headlines. The isometry identification is no longer a headline here, because it is a supplier's theorem: ArithmeticFuchsianGroups `existsUnique_pgl_smul_eq_isometryEquiv`.
- **Module docstring.** The not-statable list is unchanged: `Teich(Σ)` and its loci, Teichmüller's theorem, the Euler number and coherent orientations.
- **Padding.** The diff adds no declaration, so the one-tactic probe of earlier rounds stands.

### Remarks on untouched or supplier text (no change requested here)

- **ArithmeticFuchsianGroups §3.1's route has a gap.** At `c567d7a`, lines 913–919, the route takes the "identity differential" of an arbitrary distance isometry. At the pins, smoothness of distance isometries is proved only for normed spaces, through Mazur–Ulam. The Myers–Steenrod theorem on main (PositiveScalarCurvature §2.1) is for closed manifolds, and `ℍ` is not closed. The statement this roadmap consumes is true, so its contract stands. #2026's own review should ask for the metric argument this head removed from §0.4a, or for a Myers–Steenrod theorem for complete manifolds.
- **Two citation styles for one supplier.** Line 102 cites ArithmeticFuchsianGroups both as "Layer 1 item 1/item 4" and as "§3.1". Both resolve: #2026 line 1028 records that the first are its §1.1 and §1.4.

## Not verifiable

- **Changed passages.** No changed line carries an external locator. ArithmeticFuchsianGroups' locator for §3.1 (Voight, Theorem 33.5.5) belongs to that roadmap.
- **Carried from earlier rounds.**
  - Imayoshi–Taniguchi and Hubbard are commercial and not in the cache.
  - Hirsch, Chapter 8, Theorem 1.3 is settled as uncertified.
  - Farb–Margalit, Moise, Massey, Ahlfors–Bers, Douady–Earle, Wolpert and Munkres are paywalled.
  - Kerckhoff 1983 is waived.

## Source issues

- none
