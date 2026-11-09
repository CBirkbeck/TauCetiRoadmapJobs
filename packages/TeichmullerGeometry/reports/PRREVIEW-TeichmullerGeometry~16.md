# Review of TeichmullerGeometry (pull request #1169 at 62043e1)

**Verdict:** needs changes

This is an incremental re-review of the 16 lines changed since `0fcc3db`: scope line 21, Conventions line 51, the Mathlib contract (line 62), §0.4a (line 337, one new Check and its *Needs* line) and the docstring of `exists_mulEquiv_isometryEquiv_glAction`. ArithmeticFuchsianGroups (#2026) moved from `e4e4f9a` to `c567d7a` during the same repair round. At that head its §3.1 states, for every distance isometry of `ℍ`, the theorem that §0.4a now says it does not consume.

## R01 (P2) — §0.4a and ArithmeticFuchsianGroups §3.1 both own "every isometry of ℍ is one element of PGL₂(ℝ)", and the new variant clause misdescribes §3.1

**Location.**
- `TauCetiRoadmap/TeichmullerGeometry/README.md` line 337 (§0.4a): "What this roadmap proves is that every isometry of `ℍ` arises". The same paragraph adds: "ArithmeticFuchsianGroups Layer 3 identifies … the lift of a smooth isometry … so §0.4a does not consume it".
- Scope line 21: ArithmeticFuchsianGroups Layer 3 "keeps the step … which differs from §0.4a by needing a lift and a differential".
- `Suggested.lean` lines 533–541, `exists_mulEquiv_isometryEquiv_glAction`.

**Claim.**
- **The repair tells the two statements apart by a property ArithmeticFuchsianGroups' statement does not have.** At `c567d7a`, ArithmeticFuchsianGroups §3.1 (README lines 911–925) is a standalone target, not a step inside the nonisometry argument. It quantifies over every `f : ℍ ≃ᵢ ℍ` with no lift and no smoothness hypothesis. Its scope (lines 46–47) lists it as owned there.
- **The two roadmaps contradict each other.** ArithmeticFuchsianGroups line 919 says "This is the identification TeichmullerGeometry §0.4a consumes", and lines 1028–1029 repeat it. §0.4a says it does not consume it.
- **The object still has two owners.** It now also has two Lean statements of the same theorem. `PGL(2, ℝ)` is by definition `GL (Fin 2) ℝ ⧸ Subgroup.center (GL (Fin 2) ℝ)`: a scratch probe checks this by `rfl`. So the two statements share their carrier.
- **What the new paragraph does establish.** It correctly finds a gap in ArithmeticFuchsianGroups' route: §3.1 takes the "identity differential" of an arbitrary `ℍ ≃ᵢ ℍ`. Tau Ceti's rigidity theorem applies only to `RiemannianIsometry`, which extends `Diffeomorph … ∞`. That gap is ArithmeticFuchsianGroups' to close, not a reason to own the statement twice.

**Witness.**
- #2026 at `c567d7a`, `Suggested.lean` line 239 states `existsUnique_pgl_smul_eq_isometryEquiv (f : UpperHalfPlane ≃ᵢ UpperHalfPlane) : ∃! c : PGL(2, ℝ), ∀ z, f z = c • z`.
- A scratch Lean probe derives `exists_mulEquiv_isometryEquiv_glAction` from that statement and the isometric action in 15 lines, and elaborates with no error.

**Repair.** Make ArithmeticFuchsianGroups §3.1 the single owner. It is earlier in the merge order (line 284; this roadmap is line 285) and already says that §0.4a consumes it.
- **In this README.**
  - §0.4a, line 337: replace everything from "What this roadmap proves is that every isometry of `ℍ` arises" through "does not consume §0.4a." with: "That every isometry of `ℍ` for Mathlib's distance is the action of exactly one class is ArithmeticFuchsianGroups §3.1 (`existsUnique_pgl_smul_eq_isometryEquiv`), consumed here." Move the third Check (two points versus three) together with the metric argument.
  - Keep the isomorphism `GL(2,ℝ)/Z ≃* Isom(ℍ)` as prose packaging of §3.1 and FuchsianOrbifolds Layer 0 item 2, with no backticked Lean name.
  - Keep the orientation identification and the isometry-lifting statement in §0.4a. Neither is stated in §3.1.
  - Scope line 21: drop "that every isometry of `ℍ` … is induced by an element of `GL (Fin 2) ℝ`" and the clause "and ArithmeticFuchsianGroups Layer 3 keeps the step … a lift and a differential".
  - Add to "It leaves to named owners": "every distance isometry of `ℍ` is the action of exactly one element of `PGL₂(ℝ)`: ArithmeticFuchsianGroups §3.1".
  - Add §3.1 to the ArithmeticFuchsianGroups contract (line 102) and to §0.4a's *Needs* line.
  - Downstream consumers:
    - Lines 990, 1002 and 1004: the identification becomes "ArithmeticFuchsianGroups §3.1, read in §0.4a". Lifting stays at §0.4a.
    - Move line 1004 into the supplied-elsewhere group, and change "two objects" (line 994) to "three objects".
- **In `Suggested.lean`.** Delete `exists_mulEquiv_isometryEquiv_glAction` (lines 531–542) and its docstring bullet (lines 36–38). The probe shows it repackages a supplier's headline. The README keeps the packaging as a target.
- **In ArithmeticFuchsianGroups (#2026).** Replace §3.1's differential route with §0.4a's metric argument. The argument needs no differentiability, which closes the gap that §0.4a identifies. Lines 919 and 1028–1029 can stay.
- **Alternative.**
  - #2026 §3.1 is restricted to smooth isometries, `TauCeti.Isom` of the half-space model through FuchsianOrbifolds Layer 2 item 1, with a Lean statement off `ℍ ≃ᵢ ℍ`.
  - #2026 lines 919 and 1028–1029 drop the claim that §0.4a consumes §3.1.
  - The variant clause here then describes §3.1 as that smooth statement.
- **Re-test.** `grep -n "every isometry"` over both READMEs at their heads finds one owning statement (#2026 line 913) and a citation in §0.4a.

## R02 (P3) — The description's "Dependencies:" paragraph still describes an exchange with FuchsianOrbifolds that #1168 does not have

**Location.** The pull-request description, "Dependencies:" paragraph: "Its early quotient/area/Riemann–Hurwitz and arithmetic L7.4 targets feed Teich; this roadmap's T0/T4a/T9/T10 feed Fuchsian late L9." The hand-written task list names only #903 and #1168.

**Claim.**
- **This head leaves the description unchanged.** At #1168's head `a1a346e`, FuchsianOrbifolds has no Layer 7 or Layer 9.
- **The sentence contradicts both roadmaps.**
  - FuchsianOrbifolds consumes nothing from this roadmap.
  - The arithmetic lattices come from ArithmeticFuchsianGroups.
  - README line 41 says supply runs one way.

**Witness.**
- #1168 at `a1a346e` has `## Layer` headings 0, 1, 2, 3, 4, 5, 4a and 6 (lines 285–623).
- Its lines 31–34 say this roadmap takes its Layers 0, 1, 2, 4 and 4a "and no layer here consumes any layer of it".
- Its line 659: "No row depends on TeichmullerGeometry".

**Repair.**
- Replace the quoted sentence with: "FuchsianOrbifolds (#1168) and ArithmeticFuchsianGroups (#2026) supply this roadmap and consume nothing from it."
- Add "- [ ] depends on: #2026" to the hand-written task list.

## R03 (P3) — #903 still assigns the smoothing of paths to its §3.3, which does not state it

**Location.**
- #903, `TauCetiRoadmap/GeometricTopology/README.md` line 1458 at head `aaa605b`: "and the smoothing of paths is Layer 3.3's."
- This README's scope line 12 owns the parameter-smoothing converse.

**Claim.**
- **#903's head moved but kept the sentence.** It moved from `a6ba299` to `aaa605b`, and line 1458 is unchanged.
- **§3.3 (lines 1502–1548) still states no path smoothing.** It states:
  - the weak topology on embeddings;
  - isotopy extension;
  - the continuous lift of paths in `Emb(N, M)` to `Diff_c(M)`;
  - the disc theorem.
- **Consequence.** Two roadmaps claim the object, and only this one plans it.
- **Main is unaffected.** GeometricTopology on main contains no "smoothing of paths", so the claim exists only in the open revision.

**Witness.** At `aaa605b`, `grep -n "smoothing of paths"` returns only line 1458. Over lines 1502–1548, a grep for "smooth\|path" finds only embedding-space, isotopy-extension and disc statements.

**Repair.**
- **In #903.** Replace "and the smoothing of paths is Layer 3.3's" with "and the smoothing of paths is not planned here".
- **In this README.** No change is needed.

## R04 (P3) — The new convention attributes to Mathlib's `Matrix.ProjGenLinGroup` a topology it does not carry at the pin

**Location.** `README.md` line 51 (Conventions): "`PGL₂(ℝ) = GL (Fin 2) ℝ` modulo its centre, Mathlib's `Matrix.ProjGenLinGroup (Fin 2) ℝ`, carries the quotient topology of `GL (Fin 2) ℝ`".

**Claim.**
- **The pinned type has no topology.** `Matrix.ProjGenLinGroup` is a `def` that derives only `Group`, so no `TopologicalSpace` instance reaches it.
- **The quotient spelling does have one.** The same type written `GL (Fin 2) ℝ ⧸ Subgroup.center _` has Mathlib's quotient-group topology.
- **Why it matters.** Read as a statement about Mathlib, the sentence is false. Every discreteness statement here, and §0.4a's continuity of `toPGL`, needs the instance installed or the quotient spelling used.
- **It also contradicts a supplier.** ArithmeticFuchsianGroups line 886 says that `PGL₂(ℝ)` "carries no topology at the pins".

**Witness.**
- Pinned `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean` line 41: `def ProjGenLinGroup … := GL n R ⧸ Subgroup.center (GL n R) deriving Group`.
- Scratch probe: `example : TopologicalSpace PGL(2, ℝ) := inferInstance` fails to synthesize. The same with `GL (Fin 2) ℝ ⧸ Subgroup.center (GL (Fin 2) ℝ)` succeeds.

**Repair.** Write: "… Mathlib's `Matrix.ProjGenLinGroup (Fin 2) ℝ`, a `def` for `GL (Fin 2) ℝ ⧸ Subgroup.center (GL (Fin 2) ℝ)` with no topology at the pin, is given here the quotient topology of `GL (Fin 2) ℝ`, the topology Mathlib puts on that quotient group; …".
- **Tested on the probe instance:** the quotient-group spelling synthesizes `TopologicalSpace`.

## Previous findings

- R01 — not repaired: §0.4a line 337 still reads "What this roadmap proves is that every isometry of `ℍ` arises". ArithmeticFuchsianGroups at `c567d7a` §3.1 (line 913) states it for every `f : ℍ ≃ᵢ ℍ`, and its line 919 says §0.4a consumes it. Carried as R01.
- R02 — not repaired: the description still says "arithmetic L7.4 targets feed Teich; … feed Fuchsian late L9". The hand-written task list still lacks #2026. Carried as R02.
- R03 — not repaired: #903 at `aaa605b` line 1458 still reads "and the smoothing of paths is Layer 3.3's", and its §3.3 states no path smoothing. Carried as R03.

## Verified sound

### Mechanical checks at `62043e1`

- **Gate.** The brief's command printed:

  `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

  It exited 0. The worker's `gate.md` records the same result, with `build=0`.
- **Elaboration.** `lake env lean TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` exits 0 with 22 "declaration uses `sorry`" warnings and no other diagnostic.
- **`#check @name`.** A scratch copy with `#check @name` for all 53 `TauCetiRoadmap.TeichmullerGeometry.*` declarations elaborates with no error. The one changed declaration keeps its type, `∃ e, ∀ (g : GL (Fin 2) ℝ) (z : UpperHalfPlane), (e ↑g) z = g • z`; only its docstring changed.
- **`signatures.md` artifacts.** The "Elaboration errors" in `signatures.md` (`groups`, `group`) come from its parser reading "class groups" in docstring line 35. They are not Lean errors.
- **Dependency check** (the brief's command):

  ```text
  depcheck: 238 roadmaps, 2322 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or `moved:` line. The merge order has FuchsianOrbifolds at line 49, ArithmeticFuchsianGroups at 284 and TeichmullerGeometry at 285.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TeichmullerGeometry'` is empty.
- **Overlaps and the tool index.** The index is from 04:13:08Z and lists #2026 at `e4e4f9a` and #903 at `a6ba299`, both older than the heads the brief supplies. Ownership was therefore re-checked by grepping the sibling checkouts directly:
  - #2026 at `c567d7a`;
  - #1168 at `a1a346e`;
  - #903 at `aaa605b`.

  No open pull request changes this roadmap. The 15 "Lean names found nowhere" in `citations.md` are this roadmap's own `Suggested.lean` declarations.

### The changed passages

- **Mathlib contract (line 62) and §0.4a *Needs*.** Every declaration exists at the pin with the stated meaning:
  - `Matrix.ProjGenLinGroup`: `Projective.lean` line 41;
  - `Matrix.ProjectiveSpecialLinearGroup.toPGL`: line 113, "induced by the inclusion map from `SL(n, R)` to `GL(n, R)`";
  - `toPGL_injective`: line 120;
  - `MulAction.IsPretransitive PGL(2, ℝ) ℍ`: `MoebiusAction.lean` line 275;
  - `FaithfulSMul PGL(2, ℝ) ℍ`: `FixedPoints.lean` line 208;
  - Tau Ceti `TauCeti.UpperHalfSpace.isPretransitive_isom`: `Hyperbolic/UpperHalfSpace/Basic.lean` line 488.
- **Tau Ceti claims in §0.4a.**
  - `TauCeti.Isom` is an `abbrev` for `RiemannianIsometry` (`Riemannian/Isometry/Group.lean` line 49), which `extends Diffeomorph I J M N ∞` (`Isometry/Basic.lean` lines 44–52).
  - Smoothness of distance isometries is proved only for inner-product spaces, through Mazur–Ulam (`Isometry/Euclidean.lean` lines 20–23).
  - No `≃ᵢ` statement occurs in Tau Ceti's hyperbolic files.
- **RiemannianGeometry R4 item 7 on main** (lines 717–765) matches the new scope clause:
  - `O⁺(n,1)` on the hyperboloid;
  - continuation and monodromy of local isometry germs;
  - Killing–Hopf;
  - the quotient by a free, properly discontinuous group of smooth isometries;
  - determination of a local isometry by its 1-jet.
- **FuchsianOrbifolds at `a1a346e`.**
  - Layer 0 item 2 (lines 289–310) contains the `PSL → PGL` restriction, Mathlib's `FaithfulSMul`, and the isometric `GL(2,ℝ)` action.
  - L2.1 (lines 348–362) identifies `dist` with the Riemannian distance and the half-space model.
- **The metric argument itself is correct** (rows A1–A4). It moves to ArithmeticFuchsianGroups under R01.
- **The seeded sample.** None of the fifteen seeded targets falls in the changed lines. Their locators were verified in rounds `~8` to `~10` and `~14`, and the README flags no locator as unverified. No changed line carries an external locator.

### Adversarial table

Rows A1–A10 are new. Rows marked `~15`, `~14` and `~13` are carried from those reports for statements this diff leaves untouched.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| A1 | §0.4a three-point rule; new Check 3 | reflection `r(z) = −z̄`; points `i`, `2i`, `1+i`, `−1+i` | `cosh d = 1 + \|z−w\|²/(2 Im z Im w)`: `d(±1+i, i) = d(±1+i, 2i) = arcosh 1.5 = 0.962424 = 2 arsinh(1/2)` (Mathlib `dist_eq`); `d(1+i, −1+i) = arcosh 3 = 1.762747 ≠ 0` | two points do not determine `r`; three non-collinear points do | none (moves under R01) |
| A2 | §0.4a: fixing `i` and the ray `{ti : t ≥ 1}` fixes the axis | `i/2` | `d(i/2, i) = 0.693147`, `d(i/2, 2i) = 1.386294 = 0.693147 + log 2` (equality in the triangle inequality), so `i/2` is the unique such point | true | none |
| A3 | §0.4a: the image of `toPGL` is the positive-determinant classes; `[Γ : Γ⁺] ≤ 2` | `diag(2,1)`, `diag(−2,1)`, scalar `−I`; `Γ = ⟨diag(−2,1)⟩` | `det(λg) = λ² det g`: `diag(−2,1)` gives `−2λ² < 0` for every `λ`, so it is not in the image; `diag(2,1)` is the class of `diag(√2, 1/√2) ∈ SL`; `Γ⁺ = ⟨diag(4,1)⟩`, index 2 | true | none |
| A4 | §0.4a: discreteness pulls back along the continuous injective `toPGL` | `Γ = ⟨diag(−2,1)⟩`; `Γ' = ⟨diag(2,1), diag(3,1)⟩` | preimage of `Γ` is the classes `z ↦ 4ᵏz`, with `d(i, 4ᵏi) = \|k\|·1.386294`; `log 2 / log 3` is irrational, so `Γ'` is non-discrete on both sides | true | none |
| A5 | Line 51: `ProjGenLinGroup` "carries the quotient topology" | probe | `TopologicalSpace PGL(2, ℝ)`: synthesis fails; `TopologicalSpace (GL (Fin 2) ℝ ⧸ center)`: found; the two types are equal by `rfl` | Mathlib's type has no topology | R04 |
| A6 | Line 62: Mathlib contract additions | 5 declarations | file and line listed above; `toPGL` docstring "induced by the inclusion map from `SL(n, R)` to `GL(n, R)`" | exist as stated | none |
| A7 | §0.4a: `TauCeti.Isom` is smooth; Mazur–Ulam only for normed spaces | `Isom`, `Euclidean.lean` | `abbrev Isom … := RiemannianIsometry I I M M`, extends `Diffeomorph … ∞`; `IsometryEquiv.toRealAffineIsometryEquiv`; 0 `≃ᵢ` hits in `Hyperbolic/` | true | none |
| A8 | Line 21 and §0.4a: ArithmeticFuchsianGroups Layer 3 "needs a lift and a differential" | #2026 `c567d7a` §3.1; `f = z ↦ −2z̄`, `f = r` | §3.1 quantifies over every `f : ℍ ≃ᵢ ℍ`; both give `c = diag(−2,1)` and `c = diag(−1,1)`; probe: this roadmap's statement follows from §3.1's in 15 lines | false: the same statement | R01 |
| A9 | Line 21: R4 item 7 keeps `O⁺(n,1)` of smooth isometries, Killing–Hopf, continuation and the quotient metric | RiemannianGeometry main, lines 717–765 | all four present for `n ≥ 2` | true | none |
| A10 | `Suggested.lean` docstring of `exists_mulEquiv_isometryEquiv_glAction` | `#check @` | type unchanged | true; restates the supplier's statement | R01 |
| ~15 H1 | Line 1004 (1003 at `0fcc3db`): Layer 4.1 maps to §0.4a | `diag(−2,1)`, `diag(−4,2)`, `diag(2,−1)` | all three act by `z ↦ −2z̄`; `dist(i,2i) = 0.693147 = dist(2i,4i)` | true at `0fcc3db`; the identification half moves under R01 | R01 |
| ~15 H2 | Line 994 (993 at `0fcc3db`): the list covers the earlier ids | 11 cited ids | 10 resolve to headings; `Layer 4.1` mapped; #2026 at `c567d7a` no longer cites `Layer 4.1` | true | none |
| ~14 G1–G2 | ArithmeticFuchsianGroups contract, Layer 1 items 1 and 4 | `M₂(ℤ)`; `(2,3,7)`; `(g; −)` with `g = 0, 1, 2` | area `π/3 ≈ 1.0472`; `2π/42 ≈ 0.1496`; `A = −4π, 0, 4π` | true | none |
| ~14 G3–G5 | §9.2 covolume, Check 3; §9.1 Takeuchi | Bolza; Klein; `(0;2,3,8)`; `PSL₂(ℤ)` | `48·π/12 = 4π`; `168·π/21 = 8π`; `π/12 < π/3` | true | none |
| ~14 G6–G7, G11 | `OuterAut`; Dehn–Nielsen–Baer; Layer 4 supplies §4.2 | `S₃`, `Q₈`, `ℤ²`; `T²`, `S²`, genus 2 | `\|Out\|` 1, 6; `GL₂(ℤ)`; `S²` excluded | true | none |
| ~14 G8, G10 | supply runs one way; line 989 | #1168, #2026, #903; `g = 3`, `g = 2` | 0 ids consumed by each supplier; genus `17 = 8·3 − 7` | true | none |
| ~13 E1–E8 | §0.4a proper discontinuity, glide, lifting; layer order | `diag(−2,1)`, `K = B(i,1)`; 52 *Needs* lines | `d(i, gⁿi) = 0.693147·\|n\|`; 0 upward citations | true | none |
| ~13 (~12 D1–D8, ~11 C1–C2, ~10 N1–N7) | §§0.0a–0.5, §2.4, §§3.1–11.1, conventions | `S = ∅`, Dyck, `Q₈`, Bolza, Klein | `χ = 1, 0, −1`; `96 ≤ 168`; `e = −2` | true | R03 (ownership) |

### Headline theorems

- **Unchanged.** `Suggested.lean` states the same 22 sorried headlines.
- **Module docstring.** The not-statable list still names `Teich(Σ)` and the open dense and arithmetic loci, Teichmüller's theorem, the Euler number and coherent orientations.
- **Padding probe.** The one-tactic probe of earlier rounds stands. Under R01, `exists_mulEquiv_isometryEquiv_glAction` becomes a 15-line consequence of a supplier's headline, and the repair deletes it.

### Remarks on untouched text

- At `c567d7a`, ArithmeticFuchsianGroups numbers the items cited here as "Layer 1 items 1 and 4" as §1.1 and §1.4. It records the mapping itself at its line 1028, so the citations still resolve.

## Not verifiable

- **Changed passages.** No changed line carries an external locator.
- **Carried from earlier rounds.**
  - Imayoshi–Taniguchi and Hubbard are commercial and not in the cache.
  - Hirsch, Chapter 8, Theorem 1.3 is settled as uncertified.
  - Farb–Margalit, Moise, Massey, Ahlfors–Bers, Douady–Earle, Wolpert and Munkres are paywalled.
  - Kerckhoff 1983 is waived.

## Source issues

- none
