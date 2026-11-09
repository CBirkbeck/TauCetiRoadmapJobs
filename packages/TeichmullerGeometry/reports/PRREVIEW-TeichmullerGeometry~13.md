# Review of TeichmullerGeometry (pull request #1169 at da7dcd5)

**Verdict:** needs changes

This is an incremental re-review of the 73 lines that changed since `d5e2d95`. The changes are 67 lines of `README.md` and 6 lines of `Suggested.lean`, which are section comments and docstring text only.

- **R04 is repaired.** §4.1 is now §0.4a in Layer 0. No *Needs* line or Dependencies paragraph cites a later layer, and the repair introduced no new defect.
- **R01–R03 are not repaired.** Their repairs belong in #1168, in #903 and in this pull request's description, and none of those has changed on the relevant point. R01 is blocking.

## R01 (P2) — FuchsianOrbifolds at #1168 still consumes this roadmap, so the supply is cyclic

**Location.**
- README line 40: "Supply runs one way: GeometricTopology, ComplexCurveModuli and FuchsianOrbifolds supply this roadmap and consume nothing from it."
- README line 984: "FuchsianOrbifolds, a supplier of this roadmap, consumes none of these."

**Claim.**
- **This roadmap consumes FuchsianOrbifolds as it is at #1168.** It cites Layer 0 item 2 in its PGL form, Layer 2 item 1's comparison isometry, Layer 4a and Layer 7 items 1 and 4. All of these exist only at #1168's head, which is still `62cca0d1`.
- **#1168 consumes this roadmap.** Its Layer 9 consumes `T0`, `T4a`, `T9` and `T10`. Lines 990–997 of this README map those ids to:
  - Layer 0;
  - §§4.2–4.5;
  - §0.4a with Layer 10;
  - Layer 11.
- **There is a roadmap-level cycle.** The section graph is acyclic: §0.4a's new edge to FuchsianOrbifolds Layer 0 item 3 adds no section cycle, because #1168's Layer 0 consumes nothing of this roadmap. The dependency check reads main, so it cannot see the cycle.

**Witness.** #1168, `TauCetiRoadmap/FuchsianOrbifolds/README.md` at `62cca0d`:
- line 147: "Fuchsian L9 consumes Fuchsian L2.1, L5 and L8, Teichmuller T0, T4a, T9 and T10";
- line 188: "Fuchsian L2.1 + Teichmuller T0/T4a/T9/T10 + … -> Fuchsian L9".

**Repair.**
- **In #1168.** Move Layer 9 (lines 1385–1466) to the later Fuchsian roadmap that lines 40 and 984 of this README describe. Delete the Teichmüller → Fuchsian L9 edges at #1168 lines 32, 146–147, 183–189, 1461–1464 and 1479–1486.
- **In this README.** No change is needed.
- **Re-test.** After the move, `grep -n Teichm` on #1168 returns only ownership notes and edges into this roadmap, and no consumed `T`-id.

## R02 (P3) — #903 still assigns the smoothing of paths to its Layer 3.3

**Location.**
- #903, `TauCetiRoadmap/GeometricTopology/README.md` line 1421, now at head `68bf156f`: "and the smoothing of paths is Layer 3.3's."
- This README, line 12, which owns the parameter-smoothing converse in §0.2. Line 12 also says that GeometricTopology Layer 3 does not state this converse.

**Claim.**
- **#903 has moved, but this sentence has not.** Its head went from `61401bdf` to `68bf156f`, and the sentence is unchanged.
- **#903's §3.3 still has no path smoothing.** §3.3 is lines 1465–1511 at the new head. It states:
  - the pinned isotopy extension;
  - relative isotopy extension;
  - the continuous lift of paths in `Emb(N, M)` to `Diff_c(M)`;
  - the disc theorem.

  None of these turns a continuous path in `Diff(M)` into a smooth isotopy.
- **Consequence.** Two roadmaps claim the object.

**Witness.** At `68bf156f`, `grep -n "smoothing of paths"` on #903's README returns only line 1421. `grep -n -i "smooth\|path"` over lines 1465–1511 finds no path-smoothing statement.

**Repair.**
- **In #903.** Replace "and the smoothing of paths is Layer 3.3's" with "and the smoothing of paths is not planned here".
- **In this README.** No change is needed.

## R03 (P3) — The description still declares the wrong dependencies

**Location.** The pull-request description, which is unchanged:
- task list: "- [ ] depends on: #953";
- merge-order paragraph: "#271 (SurfaceTopology, mccorvie) → **this pull request** (#1169)".

**Claim.**
- **#953 has merged.** ComplexKahlerGeometry is on main.
- **SurfaceTopology is barred as a supplier.** Neither file of this folder cites it.
- **The real predecessors are missing.** The README cites content that exists only at two open revision heads:
  - GeometricTopology Layers 1.7.2, 3.1–3.4, 11.2.1 and 11.3, at #903. All of them still exist at its new head `68bf156f`: lines 1173, 1400–1512, 7641 and 7711.
  - FuchsianOrbifolds Layer 0 item 2 in its PGL form, Layer 2 item 1's comparison isometry, Layer 4a and Layer 7, at #1168.

**Witness.**
- On main, `grep -c UpperHalfSpace` returns 0 on `TauCetiRoadmap/FuchsianOrbifolds/README.md`, and `grep -c "1\.7\.2"` returns 0 on `TauCetiRoadmap/GeometricTopology/README.md`.
- On main, FuchsianOrbifolds has no `## Layer 4a` or `## Layer 7` heading. Its layers run 0–6 (lines 193–344).
- The overlaps report lists "FuchsianOrbifolds Layer 7 … #1168 defines it … main does not".

**Repair.**
- Make the task list read "- [ ] depends on: #903" and "- [ ] depends on: #1168", and drop #953.
- The computed merge-order paragraph then names #903 and #1168, not #271.

## Previous findings

- R01 — not repaired: #1168 is still at `62cca0d1`, whose line 147 reads "Fuchsian L9 consumes … Teichmuller T0, T4a, T9 and T10". README line 40 still says FuchsianOrbifolds "consume[s] nothing from it". Carried as R01.
- R02 — not repaired: #903 moved to `68bf156f`, but its line 1421 still reads "and the smoothing of paths is Layer 3.3's", and its §3.3 states no path smoothing. Carried as R02.
- R03 — not repaired: the description still reads "- [ ] depends on: #953" and "#271 (SurfaceTopology, mccorvie) → **this pull request**". Carried as R03.
- R04 — repaired: line 330 now reads "### 0.4a The isometry group of the hyperbolic plane", placed before §0.5. Line 363 says Layer 0 "supplies … `Isom(ℍ) ≃ PGL₂(ℝ)` and isometry lifting", and `grep "§4\.1\|Layer 4\.1"` returns nothing.

## Verified sound

### Mechanical checks at `da7dcd5`

- **Gate.** My own run agrees with the worker's: `set_option=0 … statement-hygiene=0 … dropped=0 readme-ids-missing=0 … layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`, exit 0.
- **Elaboration.** `lake env lean TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` exits 0. It gives 22 `declaration uses 'sorry'` warnings and no other diagnostic.
- **Signatures.**
  - A scratch copy with `#check @name` for all 48 named declarations elaborates with exit 0 and no errors. The `StandardSurface.*` names were checked with their namespace.
  - The `Suggested.lean` diff touches only comments: the docstring bullet now reads "(Layer 0, §0.4a)", line 531 is `/-! ## Layer 0: the projective model of Isom(ℍ) (§0.4a) -/`, and line 543 is the new `/-! ## Layer 4: the outer automorphism group (§4.2) -/`. So no elaborated type changed, and the earlier comparison of signatures with the README stands.
  - The worker's `signatures.md` reports 0 lost binders. Its entries `groups`, `group` and `and` are docstring words.
- **Dependency check** (the command of the brief):

  ```text
  depcheck: 238 roadmaps, 2352 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. FuchsianOrbifolds is line 283 of the merge order and TeichmullerGeometry line 284. The check reads main, so it cannot see R01.
- **Other changes.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TeichmullerGeometry'` is empty.
- **Citations tool.** It flags 15 Lean names as found nowhere. All are this roadmap's own declarations in `Suggested.lean`; none is in the changed lines.

### The R04 repair

- **No *Needs* line cites a later section.** A script over all 52 `### k.n` sections parsed every own-roadmap `§k.n` in each *Needs* line. It found none that cites a later layer, or a section later in the same layer.
- **The §0.4a citations all point backwards.** §0.4a is cited by the *Needs* lines of §0.5 (line 354), §4.5 (574), §9.1 (862), §10.1 (908) and §10.4 (950), all after it. §0.4a's own *Needs* line (342) cites no section of this roadmap: it has Mathlib ×3, Tau Ceti ×1, RiemannianGeometry ×1 and FuchsianOrbifolds ×3.
- **The layer graph is acyclic.** From the 12 Dependencies paragraphs: L1→{0}, L2→{0,1}, L3→{0–2}, L4→{0–2}, L5→{0,3,4}, L6→{1,4,5}, L7→{0–5}, L8→{0,2–7}, L9→{0,3–6}, L10→{0,2,3,4,5,7,8}, L11→{3,8,9,10}. Layer 0 names no layer of this roadmap.
- **Layer 9 is consistent.** Its paragraph (line 894) now includes Layer 0, as §9.1's *Needs* {§0.4a, §4.5, §3.2, §6.1} requires.
- **Layer 4 is consistent.**
  - Its paragraph (line 582) no longer lists `UpperHalfPlane.glAction`, and no Layer 4 *Needs* line cites it.
  - It keeps FuchsianOrbifolds Layer 0 item 2, which §4.4's *Needs* line still cites.
- **All twelve citation sites from the previous repair list now read §0.4a or "Layer 0, §0.4a".** They are lines 21, 40, 346, 354, 560, 574, 862, 908, 948, 950, 984 and 996. The build paragraph (line 109) moves "identifies `Isom(ℍ)` with `PGL₂(ℝ)`" into Layer 0.
- **No other roadmap cites the old id.** `roadmaps grep` for TeichmullerGeometry together with `§4.1`, `Layer 4.1`, `§0.4a` or `§0.5` returns no match on main or at any open head. The one `§4.2` hit (GroupActionsOnRiemannSurfaces README line 1300) is that roadmap's own section. The gate's `dropped=0` agrees.
- **The Lean section comments are in README order.** Layer 0 appears at lines 88, 190, 365, 412 and 531, followed by Layer 4 (543), Layer 5 (561), Layer 7 (685) and Layer 8 (705). §4.2 defines `OuterAut` (README line 513), matching the new comment.
- **Numbering.** Layer 4 now begins at §4.2. That keeps the ids other roadmaps cite, as the previous review asked.

### The new §0.4a text (lines 332, 339 and 342)

- **The proper-discontinuity route for `Γ ≤ PGL₂(ℝ)` is correct.**
  - *The preimage is discrete.* Take `U ∋ 1` open in `PGL₂(ℝ)` with `U ∩ Γ = {1}`. Then the preimage of `U` meets the preimage of `Γ` in the kernel, which is trivial. Injectivity follows from item 2's kernel statement, since `SL₂ ∩ ℝˣ·I = {±I}`. Continuity follows because `SL₂ → GL₂ → GL₂/ℝˣ` is constant on `±I` cosets, and item 1 gives `PSL₂(ℝ)` the quotient topology.
  - *Index and the second coset.* `det(λg) = λ² det g`, so the index is at most 2. For the second coset `σΓ⁺`, the set `{δ : σδK ∩ K ≠ ∅}` lies in the finite set of transporters of `K ∪ σ⁻¹K`.
  - *Stabilizers.* A stabilizer is finite, so it is trivial when `Γ` is torsion-free.
- **The supplier contract matches both copies of FuchsianOrbifolds.** The new wording at line 97, "a discrete subgroup of `PSL(2,ℝ)` acts properly discontinuously on `ℍ`", is FuchsianOrbifolds Layer 0 item 3 both on main (line 202) and at #1168 (line 286). It now appears in §0.4a's *Needs* line and in Layer 0's Dependencies paragraph. This resolves the previous review's remark that the input was cited nowhere.
- **R4 item 7's quotient needs exactly this input.** RiemannianGeometry R4 item 7 on main (lines 749–753) builds the quotient atlas, the descended metric and the covering "for a free properly discontinuous discrete group of smooth isometries on any Riemannian manifold".
- **Mathlib has only the `SL₂` case.** At the pin, `Mathlib/Analysis/Complex/UpperHalfPlane/ProperAction.lean` line 128 has `instProperlyDiscontinuousSL2RSubgroup`, for discrete subgroups of `SL(2, ℝ)`, and line 66 has `instContinuousSMulGL2R`. There is no `GL` or `PGL` proper-discontinuity statement. `roadmaps grep` finds no other roadmap that owns the `PGL` case, so stating it here duplicates nothing.
- **Mathlib's action matches the Checks.** `UpperHalfPlane.glAction` is at `MoebiusAction.lean` line 181. It applies `σ g`, which is conjugation when `det < 0`, to `num/denom`. So `diag(−2, 1)` sends `z` to `conj(−2z) = −2z̄`, and `diag(−1, 1)` and `diag(1, −1)` both send `z` to `−z̄`. Tau Ceti `UpperHalfSpace.isPretransitive_isom` is at `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/Basic.lean` line 488.

### The other reworded passages

- **§1.2 (line 381).** The forward claim to prove agreement with Layer 2.1's topology is replaced by "Layer 2.1 proves that the marked-slice topology of its charts agrees with it". §2.1 does state that its "topology agrees with the `C^∞` quotient topology of Layer 1.2", and its *Needs* line lists §1.2. §1.2's *Needs* line is {§1.1, §0.4, §0.2}.
- **§2.2 (line 421).** The antiholomorphic statement is now credited to Layer 3.2. §3.2 states that "the orientation-reversing coset acts antiholomorphically in the atlas of Layer 2", and its *Needs* line (487) lists §2.2. §2.2's *Needs* line cites no Layer 3 section.

### Seeded sample, ownership and overlaps

- **Seeded sample.** Two sampled targets fall in changed text: §2.2 (one sentence, above) and §10.4 (the citation §4.1 → §0.4a in its third Check and its *Needs* line). Neither change carries an external locator. §2.1 is cited by the reworded §1.2 and was checked above. The sample's locators were verified in rounds `~8` to `~10`, and their text is unchanged.
- **Ownership.** No new object: §0.4a is §4.1 moved, plus the proper-discontinuity paragraph checked above.
- **Overlaps.**
  - No open pull request changes this roadmap, and none drops an id it cites.
  - The single "only an open revision defines" item, FuchsianOrbifolds Layer 7 at #1168, is R03.
  - FuchsianOrbifolds Layer 0 item 3, newly cited, exists on main.

### Adversarial table

- **New rows.** Rows E1–E9 cover the changed statements, with values computed for this report.
- **Carried rows.** Rows marked "~12 X" are carried from `PRREVIEW-TeichmullerGeometry~12` for statements this diff leaves untouched. Rows "~11" and "~10" are carried through it. Row ~12 D5 (the layer cycle) is replaced by E4, and ~12 D7 (the supply) by E9.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| E1 | §0.4a: a discrete torsion-free `Γ ≤ PGL₂(ℝ)` acts freely and properly discontinuously | `Γ = ⟨g⟩`, `g = [diag(−2,1)]`, `K = B(i, 1)`; `⟨z ↦ −z̄⟩`; `⟨z ↦ 2z, z ↦ 3z⟩`; `Γ ≤ PSL₂` | `gⁿ(i) = 2ⁿ i`, so `d(i, gⁿi) = 0.693147·\|n\|`, and `gⁿK ∩ K ≠ ∅` iff `\|n\| ≤ 2.885`: 5 elements. Preimage `⟨±diag(2,½)⟩`, index 2. The reflection is PD, but `Stab(i)` has order 2: excluded by torsion-freeness. `{2^a 3^b}` is dense in `ℝ₊`, so not discrete: excluded. For `Γ ≤ PSL₂` the index is 1 | true; every hypothesis is used | none |
| E2 | §0.4a Check 4 (glide reflection) | `z = i`, `1 + i`; `g²`, `g³`, `g⁻¹` | `g(i) = 2i`; `g(1+i) = −2+2i`; `g(−2+2i) = 4+4i = 4(1+i)`; `g³ = −8z̄`; `g⁻¹ = −z̄/2`. Imaginary part `2ⁿy ≠ y` for `n ≠ 0`. Log-polar `(r,θ) ↦ (r + log 2, π − θ)`: Möbius band, double cover `S¹ × (0,π)` | true and discriminating | none |
| E3 | §0.4a: isometry lifting for `Γ₁, Γ₂ ≤ PGL₂(ℝ)`, unique up to `Γ₂` | `Γ₁ = Γ₂ = ⟨g⟩`; `a = diag(2,1)` | `a g a⁻¹ = g` (diagonal); `a² = diag(4,1) = g²`. The lifts `a` and `a g⁻¹ = diag(−1,1)` (`z ↦ −z̄`) induce the same isometry of the band, and differ by `g ∈ Γ₂` | true | none |
| E4 | R04 re-test: layer and section order | 52 *Needs* lines; 12 Dependencies paragraphs | 0 citations of a later section; the layer edges are listed above, every one downward; 5 of 5 *Needs* lines citing §0.4a come after it | acyclic | R04 repaired |
| E5 | §1.2 and §2.1: the topologies agree | the `g = 1` analogue, `τₙ = i(1 + 1/n)` | `J_{τₙ} → J_i` in `C^∞` (constant coefficients); chart distance `\|τₙ − i\| = 1/n → 0`. The discrete topology would give no convergence. §1.2's *Needs* layers are {1, 0} | consistent | none |
| E6 | §2.2 and §3.2: the orientation-reversing coset acts antiholomorphically | the `g = 1` analogue, `diag(1,−1)`, `[[1,1],[0,1]]` | `τ ↦ −τ̄`: `∂_τ = 0`, `∂_τ̄ = −1`, antiholomorphic. `τ ↦ τ + 1`: holomorphic | consistent | none |
| E7 | Line 97, the item 3 contract | main line 202; #1168 line 286 | both read "a discrete subgroup `Γ <= PSL(2,R)` acts properly discontinuously" | matches | none |
| E8 | `exists_mulEquiv_isometryEquiv_glAction` under its new Lean comment (carrying ~11 C3, C4) | `diag(1,−1)`, `−I`, `−3I`, `diag(±2,1)` | `−z̄`; trivial; `det 9 > 0`; `i, 2i ↦ 2i, 4i`, with Mathlib distance `2 arsinh(1/(2√2)) = 0.693147 = log 2` on both sides | true; the type is unchanged | none |
| E9 | Lines 40 and 984 (supply), with the new Layer 0 edge to Fuchsian L0 item 3 | #1168 at `62cca0d` | #1168's L0 consumes nothing of this roadmap, so there is no new section cycle. Lines 147 and 188: L9 consumes `T0, T4a, T9, T10` | the supply claim is still false | R01 |
| ~12 D1 | §0.5: the universal cover is `ℍ`, through the comparison | genus 2; `i, 2i`; the Euclidean model | `0.693147` on both sides; Euclidean distance `1` | true | none |
| ~12 D2 | §0.5: `Isom⁺(ℍ) = PSL₂(ℝ)`, now by §0.4a | `diag(2,1)`, `diag(−1,1)`, `−I` | `det > 0` gives `z ↦ 2z`; `det < 0` gives Jacobian `−1`; `−I ↦ id`; index 2 | true | none |
| ~12 D3, D4 | §0.5: the centralizer is trivial; Checks 1 and 3 | `z ↦ 4z`, and a hyperbolic element with fixed points `±1`; `ℂ/Λ` | `C(γ₁) = {λz, −λz̄}`, and only `λ = 1` fixes `±1`; the torus translation fails at `g = 1` | true and discriminating | none |
| ~12 D6 | The owner of the comparison | `grep "≃ᵢ UpperHalfSpace"` | 3 of 3 sites name Fuchsian L2 item 1 (lines 332, 346, 560) | true | none |
| ~12 D8 | §4.5: `e(ρ) = 2 − 2g` | `g = 2`; the wrong sign | `−2`; `∫K dA = −4π`; the wrong sign gives `+2` | true | none |
| ~11 C1, C2 | Line 97: the L2 item 1 isometry, and the L0 item 2 action by isometries | `i, 2i`; `i, 1+i`; `diag(−1,1)` | `0.693147` and `0.962424` on both sides; the metric is preserved | true | none |
| ~10 N1–N7, prev. 1–35, A–P | §§0.0a–0.4, §0.5, §2.4, §3.1–§11.1, Conventions | `S = ∅`; Dyck surface; `Q₈`; Bolza; Klein quartic | `χ = 1, 0, −1`; `χ = −1`; `24/4 = 6`; `96 ≤ 168`; `−4 = 336 − 340` | true (§0.2: R02) | R02 |

### Headline theorems

- **Unchanged.** `Suggested.lean` states the same 22 sorried headline theorems.
- **The docstring's "not statable" list is unchanged.** It names `Teich(Σ)`, completeness, earthquakes, Kerckhoff's convexity, the genus-two kernel, the open dense loci, Teichmüller's extremal theorem, the Euler number and coherent orientations.
- **No padding.** No statement changed, so the earlier one-tactic probe stands: 22 of 22 sorries resist.
- **No new headline.** The changed passages add none.

### Remarks on untouched text

- Scope line 16 attributes `OuterAut` to Layer 5, but §4.2 (line 513) defines it, and so does `Suggested.lean`'s new section comment.

## Not verifiable

- **The changed passages.** None carries an external source locator. Their inputs are supplier sections and pinned declarations, all resolved above.
- **Carried from earlier rounds.**
  - Imayoshi–Taniguchi and Hubbard are commercial and not in the cache.
  - Hirsch, Chapter 8, Theorem 1.3 is settled as uncertified.
  - Farb–Margalit, Moise, Massey, Ahlfors–Bers, Douady–Earle, Wolpert and Munkres are paywalled.
  - Kerckhoff 1983 is waived.

## Source issues

- none
