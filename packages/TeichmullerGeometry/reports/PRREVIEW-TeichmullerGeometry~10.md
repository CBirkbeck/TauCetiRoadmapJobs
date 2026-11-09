# Review of TeichmullerGeometry (pull request #1169 at 85e0f90)

**Verdict:** needs changes

This is an incremental re-review of the 7 lines that changed since `a4b2942`. All 7 are in the README: the Tau Ceti contract, the finite-CW-type paragraph of §0.0b, one new §0.0b Check, and §0.0b's *Needs* line. `Suggested.lean` is unchanged.

Of the previous round's four findings:

- one is repaired (R02);
- three are not repaired (R01, R03 and R04, carried below as R01, R02 and R03).

The repair introduces no new problem. The gate passes and `Suggested.lean` elaborates. One finding blocks: the cyclic supply with FuchsianOrbifolds at #1168 (R01). The README needs no change for any of the three findings. Each repair is in #1168, #903 or the pull-request description.

## R01 (P2) — FuchsianOrbifolds at #1168 still consumes this roadmap, so the supply is cyclic

**Location.**
- README line 40: "Supply runs one way: GeometricTopology, ComplexCurveModuli and FuchsianOrbifolds supply this roadmap and consume nothing from it."
- README line 983: "FuchsianOrbifolds, a supplier of this roadmap, consumes none of these."

**Claim.**
- **This roadmap needs #1168.** It consumes the following, which exist only at #1168's head:
  - FuchsianOrbifolds Layer 0 item 2 in its PGL form;
  - Layer 4a;
  - Layer 7 items 1 and 4.

  Main's FuchsianOrbifolds (`13665dd`) ends at "## Layer 6" (its line 344). The overlaps report says #1168 "must merge first".
- **#1168 consumes this roadmap.** #1168's head is still `62cca0d1`, the head the previous round read. Its Layer 9 (lines 1385–1466) consumes `T0`, `T4a`, `T9` and `T10`. Lines 989–996 of this README map those ids to:
  - Layer 0;
  - §§4.2–4.5;
  - §4.1 with Layer 10;
  - Layer 11.
- **Consequence.** Lines 40 and 983 are false at the head this roadmap depends on, and the two roadmaps supply each other. The dependency check reads only main, so it cannot see this cycle.

**Witness.** #1168, `TauCetiRoadmap/FuchsianOrbifolds/README.md`:
- line 147: "Fuchsian L9 consumes Fuchsian L2.1, L5 and L8, Teichmuller T0, T4a, T9 and T10";
- line 1388: "consume TeichmullerGeometry T10's";
- line 1443: "Consume the following precise T9/T10 interfaces".

**Repair.**
- **In #1168 (same author).** Move Layer 9 (lines 1385–1466) to the later Fuchsian roadmap that this README's line 983 already names. Delete the Teichmüller → Fuchsian L9 edges at #1168 lines 32, 146–147, 183–189 and 1479–1486.
- **In this README.** No change is needed.
- **Re-test.** After the move, `grep -n Teichm` on #1168 returns only ownership notes, and no consumed id.

## R02 (P3) — #903 still assigns the smoothing of paths to its Layer 3.3 (previous R03)

**Location.**
- #903, `TauCetiRoadmap/GeometricTopology/README.md` lines 1389–1390: "a continuous path in `Diff(M)` need not be a smooth isotopy, and the smoothing of paths is Layer 3.3's."
- This README, line 12: "the parameter-smoothing converse is owned here for every compact manifold … GeometricTopology Layer 3 stating … but not this converse".

**Claim.**
- **#903 has not changed.** Its head is still `1806dd42`.
- **#903 §3.3 does not contain path smoothing.** §3.3 (lines 1434–1478) states isotopy extension and its continuous form, which lifts a path in `Emb(N, M)` to a path in `Diff_c(M)`. Neither turns a continuous path in `Diff(M)` into a smooth isotopy.
- **This roadmap owns it.** §0.2 states the parameter-smoothing theorem.
- **Consequence.** #903's §3.1 still names its own §3.3 as the owner. Two roadmaps claim the object, and a reader of #903 is sent to a section that does not contain it.

**Witness.** At `1806dd42`, `grep -n "smoothing of paths"` on #903's README returns only line 1390.

**Repair.**
- **In #903 (same author).** Replace "and the smoothing of paths is Layer 3.3's" with "and the smoothing of paths is not planned here".
- **In this README.** No change is needed.
- **Re-test.** `grep -n "smoothing of paths"` on #903 returns only that sentence.

## R03 (P3) — The description still declares the wrong dependencies (previous R04)

**Location.** The pull-request description, which is unchanged:
- task list: "- [ ] depends on: #953";
- merge-order paragraph: "#271 (SurfaceTopology, mccorvie) → **this pull request** (#1169)".

**Claim.**
- **#953 has merged.** ComplexKahlerGeometry is on main at `13665dd`, and #953 is not in the index of open pull requests.
- **SurfaceTopology is barred as a supplier.** Neither file of this folder mentions it.
- **The real predecessors are missing.** The README cites ids that exist only at open revision heads:
  - GeometricTopology Layers 1.7.2, 3.1, 3.3, 3.4, 11.2.1 and 11.3, at #903 (`1806dd4`);
  - FuchsianOrbifolds Layer 0 item 2 in PGL form, Layer 4a and Layer 7, at #1168 (`62cca0d`).

**Witness.**
- Main's GeometricTopology has unnumbered `### Layer 1` and `### Layer 11` (lines 177 and 831), and no "11.2.1" anywhere.
- Main's FuchsianOrbifolds ends at Layer 6 (line 344).

**Repair.** Make the task list read "- [ ] depends on: #903" and "- [ ] depends on: #1168", and drop #953. The computed merge-order paragraph then names #903 and #1168, not #271.

## Previous findings

- R01 — not repaired: line 40 still reads "GeometricTopology, ComplexCurveModuli and FuchsianOrbifolds supply this roadmap and consume nothing from it". #1168 is still at `62cca0d1`, and its line 147 consumes "Teichmuller T0, T4a, T9 and T10". Carried as R01.
- R02 — repaired: line 137 now reads "That space has finite CW type by Tau Ceti's instance `AbstractSimplicialComplex.instFiniteCWTypeComplVertexImage` … `Homeomorph.finiteCWType` transports this to `M ∖ S` … the subdivision step [is] the roadmap's own". Both names are in line 65 and in *Needs* (line 148).
- R03 — not repaired: #903 at `1806dd42`, line 1390, still reads "and the smoothing of paths is Layer 3.3's". Carried as R02.
- R04 — not repaired: the description still reads "- [ ] depends on: #953", and its merge order still reads "#271 (SurfaceTopology, mccorvie) → **this pull request**". Carried as R03.

## Verified sound

### Mechanical checks at `85e0f90`

- **Gate.** My own run agrees with the worker's: `set_option=0 … sorry-data=0 … statement-hygiene=0 … readme-ids-missing=0 … depcheck=0 … outside-folder=0 source-material=0 OK`, exit 0.
- **Elaboration.** `lake env lean TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` exits 0. It gives 22 `declaration uses sorry` warnings and nothing else.
- **Dependency check.**
  - Output: `depcheck: 238 roadmaps, 2353 edges, 0 problem(s)`.
  - No UPWARD, CYCLE or `moved:` line. FuchsianOrbifolds is line 283 of the merge order and TeichmullerGeometry line 284.
  - The check reads main, so the #1168 cycle (R01) is outside its view.
- **Other changes.**
  - `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TeichmullerGeometry'` is empty.
  - `git diff a4b2942 HEAD -- …/Suggested.lean` is empty.
  - The previous round's signature comparison and one-tactic probe therefore stand: 22 of 22 sorries resist, and there is no padding. The worker's `signatures.md` reports 0 lost binders.
- **Citations tool.** It flags 15 Lean names as found nowhere. All are this roadmap's own names, and each is declared in `Suggested.lean`; for example, `toTop_bijective` has 2 hits and `holeWord` 3.

### The repair of the previous R02, checked at Tau Ceti `2fd255d`

- **The six newly cited declarations exist under the names the README uses.** I opened each one and elaborated a scratch probe of `#check @…` for all six, which exits 0:
  - `AbstractSimplicialComplex.instFiniteCWTypeComplVertexImage`: `Realization/Complement.lean` line 132, `[Finite (Face K)] (s : Set ι)`, giving `FiniteCWType {x // x ∉ K.vertex '' s}`;
  - `Homeomorph.finiteCWType`: `Topology/CWComplex/Classical/FiniteCWType.lean` line 98, `{X Y : Type w}`, so both spaces lie in one universe, as the README says;
  - `PreAbstractSimplicialComplex.exists_homeomorph_stellarSubdivision`: `Subdivision/Stellar/Homeomorph.lean` line 53, with hypotheses `σ ∈ K`, `{v} ∉ K`, `K.faces.Finite` and an ambient `A` containing both precomplexes;
  - `PreAbstractSimplicialComplex.map_closedStar_eq_join` and `PreAbstractSimplicialComplex.map_closedStar_inf_deletion_eq_join`: `Join/Star.lean` lines 43 and 98;
  - `PreAbstractSimplicialComplex.realizationRelabelingHomeomorph`: `Realization/Relabel/Basic.lean` line 178.
- **The relabelling route is the pinned one.** `TauCeti.IsTriangulable.finiteCWType` (`Topology/Triangulable/FiniteCWType.lean` lines 50–61) relabels into `ULift (Fin n)` with `realizationRelabelingHomeomorph`, as line 137 says.
- **The instance applies to the new Check's case.** In the probe, `example (K : AbstractSimplicialComplex (Fin 3)) [Finite (Face K)] : FiniteCWType {x : Realization K // x ∉ K.vertex '' {0}} := inferInstance` elaborates. That is the closed disc minus a boundary point.
- **The dropped name is gone.** `ContinuousMap.HomotopyEquiv.finiteCWType` no longer appears anywhere in the README; its role is now inside the pinned instance (`Complement.lean` line 125).
- **Ownership against open pull requests.**
  - I ran `roadmaps grep -i stellar` over the open heads and main.
  - #903 Layer 11.1 (lines 7353–7357) and its contract (lines 592–597) only cite the same pinned declarations.
  - #271's PlanarTopology defines a stellar-subdivision API (lines 595–601), but it is barred as a supplier and does not state the step that turns a given point into a vertex.
  - No other roadmap owns that step, so it is rightly this roadmap's own.

### Adversarial table

- **New rows.** Rows N1–N8 cover the changed statements and what depends on them.
- **Carried rows.** The rows marked "~9 X" are carried unchanged from the previous report, `PRREVIEW-TeichmullerGeometry~9`. Each reads a statement this diff leaves untouched, with the values that report computed. Rows "~9 prev. N" are the rows that report itself carried from `~8`.
- **Replaced rows.** The previous rows C (§0.0b finite CW type) and Q (supply) are replaced by N1 and N8.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| N1 | §0.0b: `M ∖ S` has finite CW type for every finite `S`, interior or boundary | `S = ∅`; `Δ²` minus vertex `0`; `∂Δ³` minus 3 vertices; `S` a Cantor set | `K.vertex '' ∅ = ∅`, so the whole realization; probe `inferInstance` on `Fin 3` elaborates; `χ = 2 − 3 = −1`, the theta-graph value; `H₁` infinitely generated, excluded by finiteness | true | prev. R02 repaired |
| N2 | §0.0b barycentre convention of `exists_homeomorph_stellarSubdivision` | `σ = {a, c}` with new vertex `v`; old vertex `w` | `stellarSubdivisionLinearMap σ v` sends `e_v` to `½e_a + ½e_c`; `x v = 0` leaves `e_w` fixed (`Stellar/Realization.lean` lines 48–56) | the README's "new vertex at the barycentre" matches | none |
| N3 | §0.0b cone matching moves the new vertex to the given point | `p` in the open boundary edge `(a, c)` of the triangle `[a, c, w]`; `p` in an open triangle (void link) | closed star `[a, c, w]`, part avoiding `σ` = `[a, w] ∪ [c, w]`, triangle = `[p, a, w] ∪ [p, c, w]`, one ray from `p` through each other point; void link: closed star `σ`, part `∂σ`, cone from `p` | valid at boundary and interior points | none |
| N4 | §0.0b transport to `M ∖ S` | universes of `Homeomorph.finiteCWType` and of the instance | `#check`: `X Y : Type u_1`, one universe; the instance lives in the universe of `ι` | the README's relabelling step is needed and stated | none |
| N5 | §0.0b new Check, boundary point vs interior point | closed disc minus `(1, 0)`; minus `0`; the wrong uniform count | `\|t x\| < 1` unless `t = 1` and `x ≠ p`: star-shaped, `χ = 1`; retracts onto `S¹`, `χ = 0 = 1 − 1`; the uniform count predicts `0 ≠ 1` at the boundary point | true and discriminating; `eulerChar_compl_of_finite` asks `[ChartedSpace E X]` with `E` normed (`Puncture.lean` line 113), which excludes the disc | none |
| N6 | §0.0b *Needs* and contract (lines 65, 148) | the six added names; the one dropped name | 6 of 6 resolve at the pin; 0 remaining references to `ContinuousMap.HomotopyEquiv.finiteCWType` | consistent | none |
| N7 | Consumers of §0.0b | §0.0g route (line 235, "points of `B` among its vertices"); §8.3 (line 806, finite-CW hypotheses on `X/F⁺` minus its branch values) | both need finite sets of interior points of closed or compact surfaces, covered by N1 | consistent | none |
| N8 | Lines 40 and 983 (supply) | #1168 at `62cca0d` | line 147: L9 consumes `T0, T4a, T9, T10`; this README lines 989–996 map them to Layer 0, §§4.2–4.5, §4.1 with Layer 10, and Layer 11 | supply false | R01 |
| ~9 prev. 1 | §0.0a `exists_pl_approximation_open` | `f = id`; `1/q` error | `g = id`; error infimum 0 excluded | true | none |
| ~9 prev. 2 | §0.0a half-plane form | `(x₀, x₁ + x₀²)` | keeps `x₀ ≥ 0`, fixes `x₀ = 0` | true | none |
| ~9 prev. 3 | §0.0b `image_boundary` (untouched sentence) | disc vs `S²` | `∂ = S¹` vs `∅` | true | none |
| ~9 prev. 4 | §0.0d closed-surface Epstein | `S²` identity vs antipodal map | degrees `1`, `−1`; `Mod(RP²) = 1` | true | none |
| ~9 prev. 5 | §0.0d relative form | disc conjugation; annulus twist | hypothesis fails; not homotopic rel `∂` | true | none |
| ~9 prev. 6–7 | §0.0f `word`, `eulerChar_model` | sphere, disc, `RP²`, Klein bottle, Dyck surface | `2, 1, 1, 0, −1` | correct | none |
| ~9 prev. 8–9 | classification, genus | torus vs genus 2 / Klein bottle / annulus | `(0,+,0)`, `(−2,+,0)`, `(0,−,0)`, `(0,+,2)`; `sInf ∅ = 0` | true | none |
| ~9 prev. 10 | §0.0g degree and `riemannHurwitz` | `zⁿ` on `Ĉ` and on the disc | `2 = 2n − 2(n−1)`; `1 = n − (n−1)` | true | none |
| ~9 prev. 11 | §0.0h `toTop_bijective` | disc conjugation; `S₄` on `∂Δ³` | `\|MCG(D²)\| = 2`; even permutations trivial | consistent | none |
| ~9 prev. 14 | §0.4 markings (sampled) | torus shear; genus-2 involution | `[[1,1],[0,1]] ≠ ±I`; `h_* = −I` realized | consistent | none |
| ~9 prev. 16 | §2.4 dimension | `g = 1, 2, 3` | `0+0+1 = 1`; `3`; `6` | true | none |
| ~9 prev. 17 | §3.1 `Mod±` (sampled) | `S²`, `T²` | `ℤ/2`; `GL₂(ℤ)` | consistent | none |
| ~9 prev. 19 | §4.1 `exists_mulEquiv_isometryEquiv_glAction` | `diag(1,−1)`, `diag(−2,1)`, `λI` with `λ < 0` | `−z̄`; `dist = log 2` kept; `det = λ² > 0` | true | none |
| ~9 prev. 22 | §4.2 `η` | circle generator | translation `+1`; `loopDeck p` gives an antihomomorphism | true | none |
| ~9 prev. 25–28 | §5.2, §5.4, §5.4a (sampled) | `T²`, `S²`, Klein bottle; `(x,−y)`; `−I`, swap | `GL₂(ℤ)` on both sides; `1 ≤ 0` false; isotopic vs `diag(1,−1)`; det `1`, `−1` | true | none |
| ~9 prev. 29 | §5.6 stabilizers | `Aut(Π)`, `Inn(Π)` | infinite, empty fixed set; `1` | consistent | none |
| ~9 prev. 30 | §7.4 `measurable_riemann_mapping` | `μ = a`; `μ = 0`; `k < 0` | `f_z̄ = a/(1+a) = a f_z`; `0`; `hbound` false | true | none |
| ~9 prev. 32 | §8.2 `nielsen_realization` | `⟨−I⟩` on `T²` | `(½ − x, −y)` is a second lift | true | none |
| ~9 prev. 34 | §8.5 genus-two kernel (sampled) | `h = 0, 1, 2` | `r = 6`, `\|K\| = 2`; `2 ≥ 3` impossible; `\|K\| = 1` excluded | true | none |
| ~9 prev. 35 | §10.1 index bound | `(2,3,7)`; Bolza surface | `1/42`; `96 ≤ 168`, `96 > 84` | true | none |
| ~9 A | Conventions `Δ⁺` | `x²` on the flat plane; pinned equation at `φ = 0`, `K = −1` | `laplaceBeltrami = 2`, `Δ⁺ = −2`; `−0 + (−1) + 1 = 0` | consistent with Tau Ceti `CurvatureEquation.lean` line 90 | none |
| ~9 B | §4.5 Check 1 | wrong sign; correct sign | `Δ⁺v = 2v`; `⟨Δ⁺v, v⟩ = −2‖v‖²`, so `v = 0` | discriminating | none |
| ~9 D | §0.2 for every compact manifold | `S¹`; `D²` with a collar | `π₀ = ℤ/2`; spliced `2π` rotation lies in `Diff₀` | true; second claimant at #903 | R02 |
| ~9 E | §0.3 via pinned isotopy extension | `n = m = ⊤`; `σ(1)`; translated line | `⊤ + 1 ≤ ⊤`, `1 ≤ ⊤`; `σ(1) = 1`; no compact support | true | none |
| ~9 F | §4.1 Check 1 | inverted conjugation rule | `I ↦ z̄`, `i ↦ −i`, `Im = −1 < 0` | correct | none |
| ~9 G | §4.2 `OuterAut` vs `TauCeti.ContinuousOut` | `Q₈` discrete; `(ℝ, +)` | `24/4 = 6` both; `ContinuousOut ≅ ℝˣ` | true | none |
| ~9 H | §4.3 locator (sampled) | hatcher2002 | line 2266 (p. 50) Prop. 1.26(a); lines 2318–2325 (p. 51) | matches | none |
| ~9 I | §4.4 Euler number (sampled) | genus-2 holonomy; degree-`k` cover; reflection conjugate | `e = −2`; `k(−2) = 2 − 2(1+k)`; `+2`; `\|e\| ≤ 2` | consistent | none |
| ~9 J | §5.5 chain of curves | `2g+1` curves | `V = 2g`, `E = 4g`, `χ = −2g`, `b = 2` | true | none |
| ~9 K | §6.1 | `cρc⁻¹` | `e = 2g − 2`, `deg f = −1` | consistent | none |
| ~9 L | §7.3 | `g = 2`; zero twists | `6` coordinates; reflection fixes the zero-twist point | consistent | none |
| ~9 M | §8.3 holomorphic Riemann–Hurwitz | hyperelliptic `g = 2`; `ℤ/3` with signature `(1; 3, 3)` | `R = 6`, `−2 = 2·2 − 6`; `R = 4`, `−4 = 3·0 − 4` | true | none |
| ~9 N | §10.2 (sampled), §10.4 count | index-2 cover; Klein quartic `(0; 2,3,7)`, `e = 168` | genus `2g − 1`; `R = 84 + 112 + 144 = 340`, `−4 = 336 − 340` | true | none |
| ~9 O | line 9, how the kept forms differ | `TopBranchedCover`; `FiniteHolomorphicMap` | base `OnePoint ℂ`, marked `{0,1,∞}`; `ChartedSpace ℂ`, no boundary | accurate | none |
| ~9 P | §10.3 Checks; §11.1 (sampled) | `N = Π`; genus-3 double cover; Klein quartic | 3 Checks; `3h − 3 + r = 3`; `168 = 84·2` | consistent | none |

### Headline theorems

- **Unchanged since the previous round.** `Suggested.lean` has no diff. Its docstring and headline statements are the ones the previous report listed: 22 sorried statements, and the named not-statable list including `Teich(Σ)`, completeness, earthquakes, Kerckhoff's convexity, the genus-two kernel, the four loci, Teichmüller's extremal theorem, the Euler number and coherent orientations.
- **No new headline.** The changed §0.0b statement is an intermediate step (finite CW type of a punctured compact surface), not a headline.

### Library declarations resolved at the pins

- **Tau Ceti `2fd255d`.** The six declarations listed above, plus:
  - `Topology/Triangulable/FiniteCWType.lean` line 41;
  - `AlgebraicTopology/Cellular/EulerCharacteristic/Puncture.lean` line 113;
  - `Topology/CWComplex/Classical/FiniteCWType.lean` line 91;
  - `Subdivision/Stellar/Realization.lean` line 48;
  - `Analysis/Complex/RiemannSurface/Branch/EulerCharacteristic.lean` line 79 (`finiteCWType_compl_preimage`, the source-side step after §0.0b supplies the base).

### Cross-roadmap citations resolved

- **#1168 at `62cca0d`.** Lines 32, 147, 1385 (Layer 9 heading), 1388 and 1443 (R01).
- **#903 at `1806dd42`.**
  - Lines 1369, 1389–1390, 1434 and 1481 (R02).
  - Lines 592–597 and 7353–7357 (stellar subdivision cited from the pin).
- **Main `13665dd`.**
  - GeometricTopology `### Layer 1` (line 177) and `### Layer 11` (line 831).
  - FuchsianOrbifolds `## Layer 6` (line 344).
  - ComplexKahlerGeometry and ComplexCurveModuli are present.
- **Overlaps report.** Its single item (FuchsianOrbifolds Layer 7 only at #1168) is R01 and R03. No open pull request changes this roadmap, and none drops an id it cites.

### Remarks on untouched text

- None.

## Not verifiable

- **The changed passage.** §0.0b carries no external source locator: its new step is the roadmap's own, and its inputs are pinned Tau Ceti declarations.
- **Seeded sample.** Of the sample, only §0.0b falls in the change; it has no external locator. The rest of the sample was checked in the previous rounds (`~8` and `~9`).
- **Carried from the previous round.**
  - Imayoshi–Taniguchi and Hubbard are commercial and not in the cache.
  - Hirsch, Chapter 8, Theorem 1.3 is settled as uncertified.
  - Farb–Margalit, Moise, Massey, Ahlfors–Bers, Douady–Earle, Wolpert and Munkres are paywalled.
  - Kerckhoff 1983 is waived.

## Source issues

- none
