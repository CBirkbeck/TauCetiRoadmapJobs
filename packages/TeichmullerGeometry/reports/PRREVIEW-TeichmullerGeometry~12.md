# Review of TeichmullerGeometry (pull request #1169 at d5e2d95)

**Verdict:** needs changes

This is an incremental re-review of the 10 lines that changed since `3710a21`. All of them are in `TauCetiRoadmap/TeichmullerGeometry/README.md`:

- the §0.5 paragraph and its *Needs* line (lines 332 and 340);
- the Layer 0 dependencies (line 349);
- the §4.5 paragraph and its *Needs* line (lines 559 and 573).

`Suggested.lean` is byte-identical to its version at `3710a21`.

The previous R04 is repaired. §4.5 now credits FuchsianOrbifolds Layer 2 item 1 for `ℍ ≃ᵢ UpperHalfSpace ℝ` and lists it in its *Needs* line. The same change also states §0.5's hidden inputs: the comparison, and `Isom⁺(ℍ) = PSL₂(ℝ)` from §4.1. Making the second input explicit gives Layer 0 a dependency on Layer 4, while Layer 4 consumes Layers 0 to 2. That is new finding R04.

The previous R01–R03 are not repaired: the sibling heads (#1168 at `62cca0d`, #903 at `61401bd`) and the description are unchanged. R01 blocks.

## R01 (P2) — FuchsianOrbifolds at #1168 still consumes this roadmap, so the supply is cyclic

**Location.**
- README line 40: "Supply runs one way: GeometricTopology, ComplexCurveModuli and FuchsianOrbifolds supply this roadmap and consume nothing from it."
- README line 983: "FuchsianOrbifolds, a supplier of this roadmap, consumes none of these."

**Claim.**
- **#1168 has not changed.** Its head is still `62cca0d1`.
- **#1168 consumes this roadmap.** Its Layer 9 consumes `T0`, `T4a`, `T9` and `T10`. Lines 989–996 of this README map those ids to Layer 0, §§4.2–4.5, §4.1 with Layer 10, and Layer 11.
- **This roadmap consumes #1168.** It uses FuchsianOrbifolds Layer 0 item 2 in PGL form, Layer 2 item 1's comparison isometry (now also from Layer 0, lines 332, 340 and 349), Layer 4a, and Layer 7 items 1 and 4. All of these exist only at #1168's head.
- **The new Layer 0 edge adds no section cycle.** #1168 line 185 already reads "Fuchsian L2 + RiemannianGeometry R4.7 -> Teichmuller T0".
- **The roadmap-level cycle remains.** The dependency check reads main, so it cannot see it.

**Witness.** #1168, `TauCetiRoadmap/FuchsianOrbifolds/README.md` at `62cca0d`:
- line 147: "Fuchsian L9 consumes Fuchsian L2.1, L5 and L8, Teichmuller T0, T4a, T9 and T10";
- line 1407: "Use the geometric surface-group convention fixed by TeichmullerGeometry T4a".

**Repair.**
- **In #1168.** Move Layer 9 (lines 1385–1466) to the later Fuchsian roadmap that lines 40 and 983 of this README describe. Delete the Teichmüller → Fuchsian L9 edges at #1168 lines 32, 146–147, 183–189, 1461–1464 and 1479–1486.
- **In this README.** No change is needed.
- **Re-test.** After the move, `grep -n Teichm` on #1168 returns only ownership notes and edges into this roadmap, and no consumed `T`-id.

## R02 (P3) — #903 still assigns the smoothing of paths to its Layer 3.3 (previous R02)

**Location.**
- #903, `TauCetiRoadmap/GeometricTopology/README.md` line 1419: "and the smoothing of paths is Layer 3.3's."
- This README, line 12, which owns the parameter-smoothing converse in §0.2.

**Claim.**
- **#903 has not changed.** It is still at `61401bdf`, and the sentence is unchanged.
- **#903's §3.3 has no path smoothing.** §3.3 (lines 1463–1508) states the following:
  - the pinned isotopy extension;
  - the restriction fibration;
  - relative isotopy extension;
  - the lift of a path in `Emb(N, M)` to `Diff_c(M)`;
  - the disc theorem.

  None of these turns a continuous path in `Diff(M)` into a smooth isotopy.
- **Consequence.** Two roadmaps claim the object.

**Witness.** At `61401bdf`, `grep -n "smoothing of paths"` on #903's README returns only line 1419.

**Repair.**
- **In #903.** Replace "and the smoothing of paths is Layer 3.3's" with "and the smoothing of paths is not planned here".
- **In this README.** No change is needed.

## R03 (P3) — The description still declares the wrong dependencies (previous R03)

**Location.** The pull-request description, which is unchanged:
- task list: "- [ ] depends on: #953";
- merge-order paragraph: "#271 (SurfaceTopology, mccorvie) → **this pull request** (#1169)".

**Claim.**
- **#953 has merged.** ComplexKahlerGeometry is on main.
- **SurfaceTopology is barred as a supplier.** Neither file of this folder cites it.
- **The real predecessors are missing.** The README cites content that exists only at two open revision heads:
  - GeometricTopology Layers 1.7.2, 3.1, 3.3, 3.4, 11.2.1 and 11.3, at #903;
  - FuchsianOrbifolds Layer 0 item 2 in PGL form, Layer 2 item 1's comparison isometry, Layer 4a and Layer 7, at #1168.
- **This change adds to the list.** It adds three more citations of the comparison, at lines 332, 340 and 349.

**Witness.**
- Main (`373d88d`), `TauCetiRoadmap/FuchsianOrbifolds/README.md` line 237: Layer 2 item 1 is the comparison of `UpperHalfPlane.volume` with Riemannian volume. `grep -c UpperHalfSpace` on that README returns 0.
- #1168 line 321: "L2.1: owned dimension-two model comparison and projective action."

**Repair.**
- Make the task list read "- [ ] depends on: #903" and "- [ ] depends on: #1168", and drop #953.
- The computed merge-order paragraph then names #903 and #1168, not #271.

## R04 (P3) — §0.5 in Layer 0 now consumes §4.1, while Layer 4 consumes Layers 0 to 2 (new)

**Location.**
- README line 332 (§0.5): "the orientation-preserving isometries of `ℍ` being `PSL₂(ℝ)` by §4.1, which uses no section of this roadmap".
- *Needs* line 340: "… FuchsianOrbifolds Layer 2 item 1; §4.1; §0.2."
- Line 349: "… and, for §0.5 only, §4.1, which uses no section of this roadmap."

**Claim.**
- **The change made a hidden input explicit.** §0.5 needs `Isom⁺(ℍ) = PSL₂(ℝ)`, and `Isom(ℍ) = PGL₂(ℝ)` for its PGL form, which is §4.1's content. The repair now says so.
- **The citation points forward.** A Layer 0 target needs a Layer 4 target, but line 109 says "Layer 4 identifies `Isom(ℍ)` with `PGL₂(ℝ)`", and line 581 says "Layer 4 consumes Layers 0 to 2".
- **The layer graph is cyclic.** It contains Layer 0 → Layer 4 → Layer 0. Through §2.1–§2.3, which need §0.5 (lines 403, 415 and 427), it also contains Layer 0 → Layer 4 → Layer 2 → Layer 0.
- **The target graph is not cyclic.** The chain is §4.5 → §2.1 → §0.5 → §4.1, and §4.1's *Needs* line (508) cites no section of this roadmap. So the defect is the layer order, not the logic.
- **Moving §0.5 instead does not work.** §2.1–§2.3 need §0.5, so §0.5 cannot move into Layer 4.

**Witness.**
- Line 581: "Layer 4 consumes Layers 0 to 2 …".
- Line 349: "Layer 0 consumes … for §0.5 only, §4.1".
- Line 403 (§2.1 *Needs*): "… §0.2; §0.5; §1.2."

**Repair.** Move §4.1 into Layer 0, since it consumes nothing of this roadmap:

1. **The section.** Make it `### 0.4a The isometry group of the hyperbolic plane`, placed before §0.5. Keep its text, Checks and *Needs* line unchanged. Keep §§4.2–4.5 numbered as they are: other roadmaps cite this one's §5.6, §8.4, §9.1 and §10.1 by number, and none cites §4.1 or §0.5.
2. **The citations.** Replace "§4.1" or "Layer 4.1" by "§0.4a" at lines 21, 40, 332, 340, 559, 573, 861, 907, 947, 949, 983 and 995.
3. **The build paragraph (line 109).** Move "identifies `Isom(ℍ)` with `PGL₂(ℝ)`" from the Layer 4 sentence to the Layer 0 sentence.
4. **Layer 0 dependencies (line 349).** Replace ", and, for §0.5 only, §4.1, which uses no section of this roadmap" with Mathlib's `UpperHalfPlane.glAction` and FuchsianOrbifolds Layer 0 item 2, both now consumed by Layer 0. Add `Isom(ℍ) ≃ PGL₂(ℝ)` and isometry lifting to what Layer 0 supplies.
5. **Layer 4 dependencies (line 581).** Drop them from Layer 4's supply sentence.
6. **`Suggested.lean`.** The declaration already sits right after the last Layer 0 section. Change the header at line 531 to `/-! ## Layer 0: the projective model of Isom(ℍ) (§0.4a) -/`. Add `/-! ## Layer 4: the outer automorphism group (§4.2) -/` before `innerAut_normal`.

**Re-test.**
- `grep -n "§4\.1\|Layer 4\.1"` on the README returns nothing.
- Every *Needs* line that cites §0.4a is in §0.5 or later.
- No Dependencies paragraph names a later layer of this roadmap.

## Previous findings

- R01 — not repaired: #1168 is still at `62cca0d1`, and its line 147 reads "Fuchsian L9 consumes … Teichmuller T0, T4a, T9 and T10". README line 40 still says FuchsianOrbifolds "consume[s] nothing from it". Carried as R01.
- R02 — not repaired: #903 is still at `61401bdf`, and its line 1419 reads "and the smoothing of paths is Layer 3.3's". Carried as R02.
- R03 — not repaired: the description still reads "- [ ] depends on: #953" and "#271 (SurfaceTopology, mccorvie) → **this pull request**". Carried as R03.
- R04 — repaired: line 559 reads "(through FuchsianOrbifolds Layer 2 item 1's comparison isometry `ℍ ≃ᵢ UpperHalfSpace ℝ`, as read in Layer 4.1)", and *Needs* line 573 lists "FuchsianOrbifolds Layer 2 item 1". The accompanying §0.5 edit introduced the new R04.

## Verified sound

### Mechanical checks at `d5e2d95`

- **Gate.** My own run agrees with the worker's: `set_option=0 … statement-hygiene=0 … readme-ids-missing=0 … layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0.
- **Elaboration.** `lake env lean TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` exits 0. It gives 22 `declaration uses 'sorry'` warnings and no other diagnostic.
- **Signatures.** A scratch copy with `#check @name` for all 53 declarations elaborates with exit 0 and no errors. `Suggested.lean` is byte-identical to `3710a21` (`git diff --quiet` succeeds), so no signature changed, and the earlier comparison with the README stands. The worker's `signatures.md` reports 0 lost binders. Its entries `groups`, `group` and `and` are docstring words, not declarations.
- **Dependency check.**
  - Output: `depcheck: 238 roadmaps, 2353 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
  - FuchsianOrbifolds is line 283 of the merge order and TeichmullerGeometry line 284.
  - The check reads main, so neither R01 nor the in-roadmap layer cycle of R04 is visible to it.
- **Other changes.**
  - `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TeichmullerGeometry'` is empty.
  - `git diff 3710a21 HEAD` touches only README.md: 5 insertions and 5 deletions.
- **Citations tool.** It flags 15 Lean names as found nowhere. All are this roadmap's own declarations in `Suggested.lean`, and none is in the changed lines.

### The changed passages, resolved

- **The comparison now has one credited owner everywhere.** `grep -n "≃ᵢ UpperHalfSpace"` returns lines 332, 499 and 559, all naming FuchsianOrbifolds Layer 2 item 1. The *Needs* lines of those sections (340, 508 and 573) all list it.
- **#1168 at `62cca0d` states the contract.**
  - Line 321 heads L2.1, "owned dimension-two model comparison and projective action".
  - Line 326 proves that the PSL and PGL actions are Riemannian isometries.
  - Line 212 says L2.1 owns the identity-coordinate comparison with `TauCeti.UpperHalfSpace ℝ`.
- **RiemannianGeometry R4 item 7 on main (`373d88d`).** Line 749 reads "Prove the Killing–Hopf universal-cover classification". Lines 733–735 pin `(|dx|²+dy²)/y²` on `y > 0` with `K = −1`, and consume native `UpperHalfSpace` with its Riemannian distance.
- **Completed/UniversalCovers Stage 2 on main.** Item 6 (lines 100–106) consumes `IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le`.
- **ComplexCurveModuli D0 item 4 on main.** It is the finite-type uniformization, with its complete finite-area curvature `−1` metric.
- **Declarations at the pins.**
  - Mathlib `1b1ccf4b`: `IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le` at `Mathlib/Topology/Homotopy/Lifting.lean` line 510.
  - Tau Ceti `2fd255d`: `TauCeti.UniversalCover.deckFundamentalGroupEquiv` at `TauCeti/AlgebraicTopology/UniversalCover/Deck/FundamentalGroup/UniversalCover.lean` line 105.
  - Tau Ceti `2fd255d`: `UpperHalfSpace.isPretransitive_isom` at `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/Basic.lean` line 488.
- **"§4.1 uses no section of this roadmap" is true.** Its *Needs* line (508) has 7 items: Mathlib ×3, Tau Ceti ×1, RiemannianGeometry ×1 and FuchsianOrbifolds ×2. Its paragraph cites no section of this roadmap either.
- **Seeded sample.** No sampled target is in the changed lines. §2.1, §5.6, §8.2 and §10.2 cite §0.5. Its statement is unchanged, so their use of it stands; §5.6 uses the PGL form, which the change keeps. §2.1's *Needs* line is part of R04's witness. The sample's locators were checked in rounds `~8` to `~10`.
- **Ownership.** The change introduces no new object, and `roadmaps grep` found no other roadmap citing this one's §4.1 or §0.5. The overlaps report's single item, FuchsianOrbifolds Layer 7 only at #1168, is covered by R03. No open pull request changes this roadmap, and none drops an id it cites.

### Adversarial table

- **New rows.** Rows D1–D8 cover the changed statements, with values computed for this report.
- **Carried rows.** The rows marked "~11 X" are carried from `PRREVIEW-TeichmullerGeometry~11` for statements this diff leaves untouched; that report's ~10 rows are carried through it. Row ~11 C8, the stale §4.5 credit, is replaced by D6, and row ~11 C5, the supply, by D7.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| D1 | §0.5: the universal cover of a closed hyperbolic surface is `ℍ`, by R4.7's Killing–Hopf theorem through the comparison | genus 2, area `4π`; `i, 2i`; wrong model: the Euclidean distance on `ℍ` | the cover is complete, simply connected, `K = −1`. Mathlib `2 arsinh(1/(2√2)) = 2·0.346574 = 0.693147`; half-space `∫₁² dt/t = 0.693147`. Euclidean: `1` | true; the Euclidean model is excluded | none |
| D2 | §0.5: the orientation-preserving isometries of `ℍ` are `PSL₂(ℝ)`, by §4.1 | `diag(2,1)`; `diag(−1,1)`; `−I` | `det 2 > 0`, same class as `diag(√2, 1/√2) ∈ SL₂`, `z ↦ 2z`; `det −1`, `z ↦ −z̄`, Jacobian `−1`; `−I ↦ id`. Kernel of `SL₂ → PGL₂` is `{±I}`; `sign det(λg) = sign det g`, index 2 | true | none |
| D3 | §0.5: the centralizer of a nonelementary group in `PSL₂(ℝ)` and in `PGL₂(ℝ)` is trivial | `γ₁ = diag(2, ½)` (`z ↦ 4z`, fixed `0, ∞`); `γ₂ = [[cosh t, sinh t],[sinh t, cosh t]]` (fixed `±1`, attracting `+1`) | `C(γ₁) = {z ↦ λz} ∪ {z ↦ −λz̄}`, `λ > 0`; `z ↦ −1/z` and `z ↦ 1/z̄` conjugate `γ₁` to `z ↦ z/4 = γ₁⁻¹`. In `C(γ₁)`, `z ↦ λz` fixes `1` only for `λ = 1`; `z ↦ −z̄` swaps `±1` and conjugates `γ₂` to `γ₂⁻¹` | trivial in both groups | none |
| D4 | §0.5 Checks 1 and 3 | `ℂ/Λ`; `⟨γ₁⟩` | `z ↦ z + tc` isotopes a translation to the identity, so the statement fails at `g = 1`; `C(⟨γ₁⟩)` is infinite, as D3 shows | discriminating | none |
| D5 | Line 349 together with line 581: the layer order | the *Needs* lines 340, 403, 415, 427, 573 and 508 | targets: `§4.5 → §2.1 → §0.5 → §4.1 → ∅`, acyclic. Layers: `0 → 4 → 0` and `0 → 4 → 2 → 0` | the layer graph is cyclic | R04 |
| D6 | §4.5 and its *Needs* line: the comparison's owner | `grep "≃ᵢ UpperHalfSpace"` | 3 of 3 lines name FuchsianOrbifolds Layer 2 item 1; 3 of 3 *Needs* lines list it | repaired | none |
| D7 | Lines 40 and 983 (supply), with Layer 0's new Fuchsian edge | #1168 at `62cca0d` | line 185: `Fuchsian L2 + R4.7 → T0`, consistent with the new edge; line 147: L9 consumes `T0, T4a, T9, T10` | the section graph is acyclic; the supply is still false | R01 |
| D8 | §4.5: `e(ρ) = 2 − 2g` for the uniformizing holonomy (paragraph reworded) | `g = 2`; the wrong sign `2g − 2` | `χ = −2`, `∫K dA = −4π = 2πχ`, `e(ρ) = −2`; the wrong sign gives `+2`, which contradicts Gauss–Bonnet | true | none |
| ~11 C1 | Line 97: the FuchsianOrbifolds Layer 2 item 1 contract, `x+iy ↦ (x,y)` an isometry | `i, 2i`; `i, 1+i`; the Euclidean model | `log 2 = 0.693147` on both sides; `0.962424` on both sides; Euclidean `1` | true | none |
| ~11 C2 | Line 97: the Layer 0 item 2 action is by Riemannian isometries | `diag(−1,1)`; `diag(2,1)` | `(dx²+dy²)/y²` is preserved by both | true | none |
| ~11 C3, C4 | §4.1 `exists_mulEquiv_isometryEquiv_glAction` and its Checks | `diag(1,−1)`; `−I`; `−3I`; `diag(±2,1)` | `−z̄`; trivial action; `det 9 > 0`; `i, 2i ↦ 2i, 4i`, distance `log 2` | true | none |
| ~11 C6, C7 | Line 21 (scope); *Needs* line 508; dependencies line 581 | R4.7 on main; #1168 L2.1 | consistent; the citation depends on #1168 | consistent | R03 |
| ~10 N1–N7 | §0.0b: finite CW type of `M ∖ S`, barycentre, cones, relabelling | `S = ∅`; `Δ²` minus a vertex; `∂Δ³` minus 3 vertices | `χ = 1`, `0`, `−1`; a Cantor set is excluded | true | none |
| ~10 prev. 1–11 | §§0.0a–0.0h | `zⁿ` on `Ĉ`; the Dyck surface; disc conjugation | `2 = 2n − 2(n−1)`; `χ = −1`; `\|MCG(D²)\| = 2` | true | none |
| ~10 prev. 14–35 | §0.4, §2.4, §3.1, §4.2, §5.2–§5.6, §7.4, §8.2, §8.5, §10.1 | torus shear; `g = 1, 2, 3`; `Q₈`; Bolza surface | `≠ ±I`; `1, 3, 6`; `24/4 = 6`; `96 ≤ 168` | true | none |
| ~10 A–P | Conventions `Δ⁺`; §0.2, §0.3; §4.3, §4.4; §5.5–§11.1 | `x²`; `S¹`; degree-`k` cover; Klein quartic | `Δ⁺ = −2`; `π₀ = ℤ/2`; `k(−2) = 2 − 2(1+k)`; `−4 = 336 − 340` | true (§0.2: R02) | R02 |

### Headline theorems

- **Unchanged.** `Suggested.lean` has no diff. It has 22 sorried headline statements, and its docstring names those not statable at the pins: `Teich(Σ)`, completeness, earthquakes, Kerckhoff's convexity, the genus-two kernel, the four loci, Teichmüller's extremal theorem, the Euler number and coherent orientations.
- **No padding.** The earlier one-tactic probe stands: 22 of 22 sorries resist.
- **No new headline.** The changed passages add none.

### Remarks on untouched text

- §4.1's isometry lifting, for quotients by discrete torsion-free groups, uses that discrete subgroups act properly discontinuously. That is FuchsianOrbifolds Layer 0 item 3, listed in the contract at line 97, but *Needs* line 508 omits it and no *Needs* line cites it.

## Not verifiable

- **The changed passages.** None carries an external source locator. Their inputs are supplier sections and pinned declarations, all resolved above.
- **Carried from earlier rounds.**
  - Imayoshi–Taniguchi and Hubbard are commercial and not in the cache.
  - Hirsch, Chapter 8, Theorem 1.3 is settled as uncertified.
  - Farb–Margalit, Moise, Massey, Ahlfors–Bers, Douady–Earle, Wolpert and Munkres are paywalled.
  - Kerckhoff 1983 is waived.

## Source issues

- none
