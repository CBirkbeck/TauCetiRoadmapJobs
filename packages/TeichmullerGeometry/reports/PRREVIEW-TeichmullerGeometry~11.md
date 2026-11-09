# Review of TeichmullerGeometry (pull request #1169 at 3710a21)

**Verdict:** needs changes

This is an incremental re-review of the 16 lines that changed since `85e0f90`. All of them are in `TauCetiRoadmap/TeichmullerGeometry/README.md`:

- the scope bullets (lines 21 and 26);
- the supply paragraph (line 40);
- the FuchsianOrbifolds contract (line 97);
- the §4.1 paragraph and its *Needs* line (lines 499 and 508);
- the Layer 4 dependencies (line 581);
- the first downstream consumer (line 983).

`Suggested.lean` is unchanged.

The change moves the comparison `ℍ ≃ᵢ UpperHalfSpace ℝ` to FuchsianOrbifolds Layer 2 item 1. That pull request claims the comparison at its head (#1168 line 212), and main's RiemannianGeometry R4 item 7 does not, so the comparison now has a single owner. Lines 40 and 983 now list exactly what #1168's Layer 9 consumes.

Of the previous round's three findings, none is repaired: they are carried below as R01–R03. One new P3 finding (R04) comes from text the move left stale. The gate passes and `Suggested.lean` elaborates. One finding blocks: R01, the cyclic supply with FuchsianOrbifolds at #1168.

## R01 (P2) — FuchsianOrbifolds at #1168 still consumes this roadmap, so the supply is cyclic

**Location.**
- README line 40: "Supply runs one way: GeometricTopology, ComplexCurveModuli and FuchsianOrbifolds supply this roadmap and consume nothing from it. … FuchsianOrbifolds does not carry it."
- README line 983: "FuchsianOrbifolds, a supplier of this roadmap, consumes none of these."

**Claim.**
- **#1168 has not changed.** Its head is still `62cca0d1`, the head the previous two rounds read.
- **#1168 consumes this roadmap.** Its Layer 9 (lines 1385–1466) consumes `T0`, `T4a`, `T9` and `T10`. Lines 989–996 of this README map those ids to Layer 0, §§4.2–4.5, §4.1 with Layer 10, and Layer 11. Those are exactly the items lines 40 and 983 now say only a later roadmap consumes.
- **This roadmap consumes #1168.** It uses content that exists only at #1168's head:
  - FuchsianOrbifolds Layer 0 item 2 in its PGL form;
  - Layer 2 item 1's comparison isometry, newly cited in this change at lines 26, 97, 499 and 508;
  - Layer 4a;
  - Layer 7 items 1 and 4.
- **Consequence.** The two roadmaps supply each other. The dependency check reads main, so it cannot see this cycle.

**Witness.** #1168, `TauCetiRoadmap/FuchsianOrbifolds/README.md` at `62cca0d`:
- line 147: "Fuchsian L9 consumes Fuchsian L2.1, L5 and L8, Teichmuller T0, T4a, T9 and T10";
- line 1407: "Use the geometric surface-group convention fixed by TeichmullerGeometry T4a".

**Repair.**
- **In #1168.** Move Layer 9 (lines 1385–1466) to the later Fuchsian roadmap that lines 40 and 983 of this README now describe. Delete the Teichmüller → Fuchsian L9 edges at #1168 lines 32, 146–147, 183–189, 1461–1464 and 1479–1486.
- **In this README.** No change is needed: lines 40 and 983 already describe the state after the move.
- **Re-test.** After the move, `grep -n Teichm` on #1168 returns ownership notes and edges into this roadmap, and no consumed `T`-id.

## R02 (P3) — #903 still assigns the smoothing of paths to its Layer 3.3 (previous R02)

**Location.**
- #903, `TauCetiRoadmap/GeometricTopology/README.md` line 1419: "a continuous path in `Diff(M)` need not be a smooth isotopy, and the smoothing of paths is Layer 3.3's."
- This README, line 12: "the parameter-smoothing converse is owned here for every compact manifold … GeometricTopology Layer 3 stating … but not this converse".

**Claim.**
- **The new head did not touch the sentence.** #903 moved from `1806dd42` to `61401bdf`, but this sentence (formerly line 1390) is unchanged.
- **#903 §3.3 does not contain path smoothing.** §3.3 (lines 1463–1508) states the following:
  - the pinned isotopy extension;
  - the restriction fibration;
  - relative isotopy extension;
  - the continuous form, which lifts a path in `Emb(N, M)` to a path in `Diff_c(M)`;
  - the disc theorem.

  None of these turns a continuous path in `Diff(M)` into a smooth isotopy.
- **Consequence.** Two roadmaps claim the object: this README's §0.2 states it.

**Witness.** At `61401bdf`, `grep -n "smoothing of paths"` on #903's README returns only line 1419.

**Repair.**
- **In #903.** Replace "and the smoothing of paths is Layer 3.3's" with "and the smoothing of paths is not planned here".
- **In this README.** No change is needed.
- **Re-test.** The grep then returns only that sentence.

## R03 (P3) — The description still declares the wrong dependencies (previous R03)

**Location.** The pull-request description, which is unchanged:
- task list: "- [ ] depends on: #953";
- merge-order paragraph: "#271 (SurfaceTopology, mccorvie) → **this pull request** (#1169)".

**Claim.**
- **#953 has merged.** ComplexKahlerGeometry is on main, and #953 is not in the index of open pull requests.
- **SurfaceTopology is barred as a supplier.** Neither file of this folder mentions it.
- **The real predecessors are missing from the task list.** The README cites content that exists only at two open revision heads:
  - GeometricTopology Layers 1.7.2, 3.1, 3.3, 3.4, 11.2.1 and 11.3, at #903 (`61401bd`);
  - FuchsianOrbifolds Layer 0 item 2 in PGL form, Layer 4a, Layer 7, and now Layer 2 item 1, at #1168 (`62cca0d`).
- **Why the new citation adds to this.** On main, FuchsianOrbifolds Layer 2 item 1 is only the volume comparison. Merged before #1168, lines 26, 97 and 499 would cite an item that does not state the isometry.

**Witness.**
- Main (`172efce`), `TauCetiRoadmap/FuchsianOrbifolds/README.md` line 237: "Consume Mathlib's invariant `UpperHalfPlane.volume`. Compare it with hyperbolic Riemannian volume …". It has no `UpperHalfSpace`.
- #1168 line 321: "L2.1: owned dimension-two model comparison and projective action."

**Repair.**
- Make the task list read "- [ ] depends on: #903" and "- [ ] depends on: #1168", and drop #953.
- The computed merge-order paragraph then names #903 and #1168, not #271.

## R04 (P3) — §4.5 still says the comparison `ℍ ≃ᵢ UpperHalfSpace ℝ` is Layer 4.1's

**Location.**
- README line 559 (§4.5): "Consume RiemannianGeometry R4 item 7's Killing–Hopf identification … with `ℍ` (through the comparison `ℍ ≃ᵢ UpperHalfSpace ℝ` of Layer 4.1)".
- §4.5's *Needs* line (line 573), which lists "RiemannianGeometry R4 item 7 … §4.1" and not FuchsianOrbifolds Layer 2 item 1.

**Claim.**
- **The change moved the comparison.** §4.1 (line 499) now reads "Through FuchsianOrbifolds Layer 2 item 1's comparison isometry `ℍ ≃ᵢ UpperHalfSpace ℝ` …". The scope (line 26) lists the comparison among the objects left to FuchsianOrbifolds Layer 2 item 1. So Layer 4.1 no longer constructs it.
- **§4.5 was not updated.** It still credits Layer 4.1. Its route uses the comparison directly: it carries R4 item 7's universal cover identification to `ℍ`. Yet its *Needs* line omits the comparison's owner.
- **The rest of the layer was updated.** The Layer 4 dependencies (line 581) were changed to add Layer 2 item 1; §4.5 was not.

**Witness.**
- Line 499 quoted above.
- Line 26: "the identity-coordinate comparison isometry `x + iy ↦ (x, y)` … : FuchsianOrbifolds Layer 2 item 1".
- `grep -n "≃ᵢ UpperHalfSpace"` on the README returns lines 499 and 559 only.

**Repair.**
- In line 559, replace "(through the comparison `ℍ ≃ᵢ UpperHalfSpace ℝ` of Layer 4.1)" with "(through FuchsianOrbifolds Layer 2 item 1's comparison `ℍ ≃ᵢ UpperHalfSpace ℝ`, as read in Layer 4.1)".
- In line 573, add "FuchsianOrbifolds Layer 2 item 1" to the *Needs* line.
- **Re-test.** Every occurrence of `≃ᵢ UpperHalfSpace` then names FuchsianOrbifolds Layer 2 item 1, and every *Needs* line that uses it lists that item.

## Previous findings

- R01 — not repaired: line 40 still reads "FuchsianOrbifolds supply this roadmap and consume nothing from it". #1168 is still at `62cca0d1`, and its line 147 consumes "Teichmuller T0, T4a, T9 and T10". Carried as R01.
- R02 — not repaired: #903, now at `61401bdf`, still reads at line 1419 "and the smoothing of paths is Layer 3.3's". Its §3.3 (lines 1463–1508) contains no path smoothing. Carried as R02.
- R03 — not repaired: the description still reads "- [ ] depends on: #953" and "#271 (SurfaceTopology, mccorvie) → **this pull request**". Carried as R03.

## Verified sound

### Mechanical checks at `3710a21`

- **Gate.** My own run agrees with the worker's: `set_option=0 … statement-hygiene=0 … readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`, exit 0.
- **Elaboration.** `lake env lean TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` exits 0. It gives 22 `declaration uses sorry` warnings and no other diagnostic.
- **Dependency check.**
  - Output: `depcheck: 238 roadmaps, 2353 edges, 0 problem(s)`.
  - No UPWARD, CYCLE or `moved:` line. FuchsianOrbifolds is line 283 of the merge order and TeichmullerGeometry line 284.
  - The check reads main, so the cycle in R01 is outside its view.
- **Other changes.**
  - `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TeichmullerGeometry'` is empty.
  - `git diff 85e0f90 HEAD` touches only README.md: 8 insertions and 8 deletions.
  - `Suggested.lean` has no diff, so the earlier signature comparison and one-tactic probe stand: 22 of 22 sorries resist, and there is no padding. The worker's `signatures.md` reports 0 lost binders.
- **Citations tool.** It flags 15 Lean names as found nowhere. All are this roadmap's own names, declared in `Suggested.lean`, and none is in the changed lines.

### The moved comparison, resolved

- **The supplier states what the contract says.** #1168 L2.1 (lines 321–326) states the following, which matches the contract at line 97:
  - the literal-coordinate map `x+iy ↦ (x,y)` into the positive-height subtype of `WithLp 2 (ℝ×ℝ)`;
  - the induced distance compared with `UpperHalfPlane.dist_eq`;
  - the Layer 0 PSL and PGL actions as Riemannian isometries, including the negative-determinant case.
- **The carrier matches the pin.** Tau Ceti `2fd255d`, `Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/Basic.lean`:
  - lines 79–91 define `UpperHalfSpace E` as the open set `{p : WithLp 2 (E × ℝ) | 0 < p.snd}`, the same carrier;
  - line 488 is the instance `isPretransitive_isom` that §4.1's *Needs* line cites.
- **There is no metric instance on the carrier.** The Riemannian distance is the explicit `MetricSpace.ofRiemannianMetric` (`Hyperbolic/Completeness.lean` lines 45–51), which is what "with its Riemannian distance" in line 26 can mean.
- **Single owner.**
  - #1168 line 212 says Fuchsian L2.1 owns the comparison, and that R4.7 does not supply it.
  - Main's RiemannianGeometry README never mentions `UpperHalfPlane`, in R4 item 7 (lines 717–750) or elsewhere.
  - `roadmaps grep` for the comparison over all open heads and main finds only #1168 and this README.
  - This README no longer says "Construct the comparison isometry", so the second owner is gone.
- **Mathlib at the pin.**
  - `UpperHalfPlane.dist_eq` is at `Analysis/Complex/UpperHalfPlane/Metric.lean` line 43.
  - `UpperHalfPlane.glAction` is at `Analysis/Complex/UpperHalfPlane/MoebiusAction.lean` line 181, with `σ` at line 91.

### Adversarial table

- **New rows.** Rows C1–C8 cover the changed statements and what depends on them, with values computed for this report.
- **Carried rows.** The rows marked "~10 X" are carried unchanged from `PRREVIEW-TeichmullerGeometry~10`, for statements this diff leaves untouched. That report's rows N8 (supply) and "~9 prev. 19" and "~9 F" (§4.1) are replaced by C5, C3 and C4.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| C1 | Line 97, the FuchsianOrbifolds Layer 2 item 1 contract: `x+iy ↦ (x,y)` is an isometry onto `UpperHalfSpace ℝ` | `i, 2i` (vertical); `i, 1+i` (horizontal); wrong model: the Euclidean `WithLp 2` distance on the subtype | Mathlib: `2 arsinh(1/(2√2)) = 0.693147 = log 2`; half-space `∫₁² dt/t = log 2`. Mathlib: `2 arsinh(1/2) = 0.962424`; half-space `arcosh(1 + 1/2) = 0.962424`. Euclidean: `1 ≠ 0.9624` | true; the Euclidean model is excluded | none |
| C2 | Line 97: the Layer 0 item 2 action is by Riemannian isometries for the comparison | `diag(−1,1)`; `diag(2,1)` | `(x,y) ↦ (−x,y)` keeps `(dx²+dy²)/y²`; `(x,y) ↦ (2x,2y)` pulls it back to `(4dx²+4dy²)/(4y²)`, the same | true | none |
| C3 | §4.1 `exists_mulEquiv_isometryEquiv_glAction`: GL(2,ℝ) modulo the centre is `Isom(ℍ)` (statement unchanged; its paragraph changed) | `diag(1,−1)`; `−I`; `λ = −3` | `det = −1`, `z ↦ conj(z/(−1)) = −z̄`; `−I`: `(−z)/(−1) = z`; `det(−3I) = 9 > 0`, trivial action | true | none |
| C4 | §4.1 Checks 1–3 | conjugation rule inverted; `diag(2,1)`; `diag(−2,1)` | `I ↦ z̄`, `i ↦ −i`, `Im = −1 < 0`; `i, 2i ↦ 2i, 4i`; `det = −2`, `z ↦ −2z̄`, `i ↦ 2i`, `2i ↦ 4i`; `dist(2i, 4i) = log 2` | correct | none |
| C5 | Lines 40 and 983 (supply) | #1168 at `62cca0d` | line 147: L9 consumes `T0, T4a, T9, T10`; lines 989–996 map these to Layer 0, §§4.2–4.5, §4.1 with Layer 10, and Layer 11 | the list now matches L9; the supply is still false | R01 |
| C6 | Line 21 (scope): this roadmap keeps the two-dimensional projective model and reads R4 item 7 through the comparison | R4 item 7 on main; #1168 L2.1 | R4.7 keeps `O⁺(n,1)`, Killing–Hopf and quotients (lines 740–750); L2.1 keeps the comparison; neither states `Isom(ℍ) ≃ PGL₂(ℝ)` | consistent with #1168 line 146, "T9 supplies the … `RiemannianIsometry(H²)≃PGL₂(ℝ)` adapters" | none |
| C7 | *Needs* line 508 and dependencies line 581 | the cited ids | both add "FuchsianOrbifolds Layer 2 item 1"; the id exists at #1168 (line 321) | consistent; dependency on #1168 only | R03 |
| C8 | Consumers of the comparison | `grep "≃ᵢ UpperHalfSpace"`: §4.1 line 499, §4.5 line 559 | line 499 credits FuchsianOrbifolds Layer 2 item 1; line 559 credits Layer 4.1; *Needs* line 573 omits the supplier | stale | R04 |
| ~10 N1 | §0.0b: `M ∖ S` has finite CW type | `S = ∅`; `Δ²` minus a vertex; `∂Δ³` minus 3 vertices; a Cantor set | whole realization; `inferInstance` elaborates; `χ = −1`; excluded | true | none |
| ~10 N2–N4 | §0.0b barycentre, cone matching, relabelling | `σ = {a,c}`; `p` in an open boundary edge; universes | `e_v ↦ ½e_a + ½e_c`; star `[a,c,w]` coned from `p`; one universe `u_1` | true | none |
| ~10 N5 | §0.0b Check, boundary point vs interior point | disc minus `(1,0)`; disc minus `0` | `χ = 1`; `χ = 0` | discriminating | none |
| ~10 N6–N7 | §0.0b *Needs* and consumers | 6 names; §0.0g, §8.3 | 6 of 6 resolve; finite sets of interior points | consistent | none |
| ~10 prev. 1–2 | §0.0a PL approximation, half-plane form | `f = id`; `(x₀, x₁ + x₀²)` | `g = id`; keeps `x₀ ≥ 0` | true | none |
| ~10 prev. 3–5 | §0.0b `image_boundary`; §0.0d Epstein | disc vs `S²`; antipodal map; annulus twist | `∂ = S¹` vs `∅`; degree `−1`; not homotopic rel `∂` | true | none |
| ~10 prev. 6–9 | §0.0f words, `eulerChar_model`, classification | sphere, disc, `RP²`, Klein bottle, Dyck surface; torus vs genus 2 | `2, 1, 1, 0, −1`; `(0,+,0)` vs `(−2,+,0)`; `sInf ∅ = 0` | correct | none |
| ~10 prev. 10–11 | §0.0g Riemann–Hurwitz; §0.0h `toTop_bijective` | `zⁿ` on `Ĉ` and on the disc; disc conjugation | `2 = 2n − 2(n−1)`; `1 = n − (n−1)`; `\|MCG(D²)\| = 2` | true | none |
| ~10 prev. 14, 16, 17 | §0.4 markings; §2.4 dimension; §3.1 `Mod±` | torus shear; `g = 1, 2, 3`; `S²`, `T²` | `≠ ±I`; `1, 3, 6`; `ℤ/2`, `GL₂(ℤ)` | consistent | none |
| ~10 prev. 22 | §4.2 `η` | circle generator | translation `+1`; antihomomorphism via `loopDeck` | true | none |
| ~10 prev. 25–29 | §5.2, §5.4, §5.4a, §5.6 | `T²`, `S²`, Klein bottle; `Aut(Π)`, `Inn(Π)` | `GL₂(ℤ)` on both sides; det `±1`; empty fixed set; `1` | true | none |
| ~10 prev. 30, 32, 34, 35 | §7.4 measurable Riemann mapping; §8.2 Nielsen; §8.5; §10.1 | `μ = a`; `⟨−I⟩` on `T²`; `h = 0, 1, 2`; Bolza surface | `f_z̄ = a f_z`; a second lift `(½ − x, −y)`; `\|K\| = 2`; `96 ≤ 168` | true | none |
| ~10 A, B | Conventions `Δ⁺`; §4.5 Check 1 | `x²`; curvature `−1` at `u = 0` | `Δ⁺ = −2`; `0 + (−1) + 1 = 0`; `⟨Δ⁺v, v⟩ = −2‖v‖²` | consistent | none |
| ~10 D, E | §0.2; §0.3 | `S¹`; `D²`; `n = m = ⊤` | `π₀ = ℤ/2`; spliced rotation in `Diff₀`; `⊤ + 1 ≤ ⊤` | true; second claimant at #903 | R02 |
| ~10 G, H, I | §4.2 `OuterAut`; §4.3 locator; §4.4 | `Q₈`; hatcher2002 line 2266; degree-`k` cover | `24/4 = 6`; Prop. 1.26(a), p. 50; `k(−2) = 2 − 2(1+k)` | consistent | none |
| ~10 J, K, L, M | §5.5; §6.1; §7.3; §8.3 | `2g+1` curves; `cρc⁻¹`; `g = 2`; hyperelliptic | `χ = −2g`, `b = 2`; `deg f = −1`; 6 coordinates; `−2 = 2·2 − 6` | true | none |
| ~10 N, O, P | §10.2, §10.4; line 9; §10.3, §11.1 | Klein quartic `e = 168`; `TopBranchedCover` | `−4 = 336 − 340`; base `OnePoint ℂ`; `168 = 84·2` | true | none |

### Headline theorems

- **Unchanged.** `Suggested.lean` has no diff. It has 22 sorried headline statements, and its docstring names those not statable at the pins: `Teich(Σ)`, completeness, earthquakes, Kerckhoff's convexity, the genus-two kernel, the four loci, Teichmüller's extremal theorem, the Euler number and coherent orientations.
- **No new headline.** The changed passages add no headline. §4.1's headline `exists_mulEquiv_isometryEquiv_glAction` keeps its statement, and the comparison isometry it now consumes is a supplier's object.

### Seeded sample

- **§4.1, the one sampled target in the change.** It carries no external locator: its argument is stated to be the roadmap's own. Its inputs resolve as above:
  - FuchsianOrbifolds Layer 0 item 2 and Layer 2 item 1, at #1168;
  - RiemannianGeometry R4 item 7, on main, lines 717–745;
  - Mathlib `UpperHalfPlane.glAction`;
  - Tau Ceti `UpperHalfSpace.isPretransitive_isom`.
- **The rest of the sample.** Those targets are untouched by this diff and were checked in rounds `~8` to `~10`.

### Cross-roadmap citations resolved

- **#1168 at `62cca0d`.** Lines 32, 146–147, 212, 321–326, 1385, 1407, 1461–1464 and 1479–1486.
- **#903 at `61401bdf`.** Lines 1398–1419 (§3.1), 1463–1508 (§3.3) and 7739.
- **Main `172efce`.** FuchsianOrbifolds Layer 2 (lines 235–262); RiemannianGeometry R4 item 7 (lines 717–745).
- **FuchsianOrbifoldsPartII.** At its open head, it has no mention of this roadmap, as line 983 says.
- **Overlaps report.** Its single item, FuchsianOrbifolds Layer 7 only at #1168, is covered by R01 and R03. No open pull request changes this roadmap, and none drops an id it cites.

### Remarks on untouched text

- None.

## Not verifiable

- **The changed passages.** None carries an external source locator. Their inputs are supplier sections and pinned declarations, all resolved above.
- **Carried from earlier rounds.**
  - Imayoshi–Taniguchi and Hubbard are commercial and not in the cache.
  - Hirsch, Chapter 8, Theorem 1.3 is settled as uncertified.
  - Farb–Margalit, Moise, Massey, Ahlfors–Bers, Douady–Earle, Wolpert and Munkres are paywalled.
  - Kerckhoff 1983 is waived.

## Source issues

- none
