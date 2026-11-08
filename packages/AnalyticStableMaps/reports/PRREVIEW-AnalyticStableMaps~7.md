# Review of AnalyticStableMaps (pull request #987 at 41557ba)

**Verdict:** accepted

This is an incremental re-review of the 29 lines that changed in `TauCetiRoadmap/AnalyticStableMaps/README.md` since 8c9b5c4. `Suggested.lean` is unchanged. Nothing outside the folder changed: `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/AnalyticStableMaps/` is empty.

The one finding of the previous review is repaired, and the repair introduces no new problem. This report raises no finding.

## Previous findings

- R01 — repaired: "From Tau Ceti" line 72 now lists `NodalGluing.dualGraph`, the `DualGraph` genus, log-canonical, stability, `Iso` and clutching declarations and the `DegreeDecoration` criteria, "for genus labels given as an input". §3.7 (line 647) derives its bounds from them, and D1 (line 99) is narrowed.

## Verified sound

**Gate, build and dependency check.**
- `gate AnalyticStableMaps --base origin/main` reports 0 for every check and ends in "OK", exit 0.
- `lake env lean TauCetiRoadmap/AnalyticStableMaps/Suggested.lean` exits 0. Its only output is three `sorry` warnings, at lines 105, 128 and 161.
- The dependency check prints `depcheck: 243 roadmaps, 2456 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. ImplicitAtlases is at merge-order line 217 and AnalyticStableMaps at line 218.
- `overlaps.md` lists no other pull request changing this roadmap, no dropped ids and no ids that only an open revision defines. `citations.md` lists no unresolved names.

**Lean form.**
- `Suggested.lean` is byte-identical to the head the previous review read: `git diff 8c9b5c4 41557ba` on it is empty.
- So the four declarations, their elaborated types and the one-tactic probe recorded in PRREVIEW-AnalyticStableMaps~6 stand.
- `signatures.md` reports a fifth declaration, `supplies`, with an error at line 182. That is a parsing artefact: line 58 is docstring prose that begins with the word "instance". Elaboration of the file itself is clean.

**Pinned declarations opened (Tau Ceti; file and line).**

All 32 dual-graph and `NodalGluing` names the README backticks elaborate under `#check @` in one scratch file that imports the four modules below.

- `NodalGluing/DualGraph.lean`:
  - `dualGraph` (line 84) needs `ι Flag : Type u`, `Fintype` on both, `∀ i, ConnectedSpace (X i)` and `ConnectedSpace (GluedCurve d)`. The genus `g : ι → ℕ` is an argument, as line 72 says.
  - `valence_dualGraph` (121) counts flag points, so a self-node counts twice; `card_edge_dualGraph` (140) counts nodes.
  - `arithmeticGenus_dualGraph_add_card` (146), `logCanonicalDegree_dualGraph` (153) and `isStable_dualGraph_iff` (171) count the special points as flag points ∪ marks.
- `DualGraph/Basic.lean`:
  - `logCanonicalDegree` (359) is ℤ-valued, `2g − 2 + val + n`.
  - `arithmeticGenus_add_card_vertex` (334); `sum_logCanonicalDegree` (367), `= 2pₐ − 2 + n`.
  - `IsStable.card_vertex_le` (421) and `IsStable.card_edge_le` (429), both in ℤ.
- `DualGraph/Iso.lean`:
  - `Iso` (75): vertex and edge bijections preserving ends as `Sym2`, genera and marks. Both graphs carry the same mark type, which is why §11.2 relabels marks "as in D7 item 3".
  - `logCanonicalDegree_vertexEquiv` (231) and `arithmeticGenus_eq` (248).
- `DualGraph/Clutching.lean`:
  - `clutch` (109) takes inputs with marks `Option ι` and `Option κ`; its new edge `none` joins the two `none` marks.
  - `arithmeticGenus_clutch` (172) adds the genera.
  - `selfClutch` (253) takes marks `ι ⊕ Fin 2`; `arithmeticGenus_selfClutch` (298) adds 1.
  - `logCanonicalDegree_selfClutch` (317).
- `StableMaps/DualGraph/Basic.lean`:
  - `DegreeDecoration` (74) and `IsStable` (105): degree-0 vertices have positive log-canonical degree.
  - `isStable_iff_weightedLogCanonicalDegree_pos` (121), with weight `+3d`.
  - `sum_weightedLogCanonicalDegree` (132), `= 2pₐ − 2 + n + 3Σd`.
  - `isStable_congr` (140): stability depends only on the degree-0 set.
- `StableMaps/DualGraph/Clutching.lean`: `isStable_clutch_iff` (164) and `isStable_selfClutch_iff` (238).
- The claim that the genus of a compact Riemann surface is not at the pin holds:
  - `RiemannSurface/Branch/EulerCharacteristic.lean` gives Riemann–Hurwitz only under finite-CW hypotheses;
  - the only pinned "genus" definitions are combinatorial (`RibbonGraph`, `PermutationTriple`, `NumericalType.topologicalGenus`) or function-field ones.

**Cross-roadmap citations resolved (main at the content checkout).**
- ComplexCurveModuli D1 (line 57 there) reads "Prove the graph genus formula and its compatibility with smoothing/cutting" and "Derive pointed stability iff finiteness from D0's cases". This matches the narrowed D1 contract at README line 99.
- ComplexCurveModuli D7 item 3 constructs domain clutching to `(g₁+g₂, I⊔J)` and `(g+1, I)` with relabelled marks. It is the input §11.2 cites. The map-level stability of the clutched map, via degree decorations, is not stated there, so §11.2 does not re-plan it.
- FuchsianOrbifolds Layer 5 item 1 is listed at README line 112, the "below" of line 72.
- Ownership: `roadmaps grep 'DualGraph\.(clutch|selfClutch)|NodalGluing\.dualGraph|DegreeDecoration'` over the 476 open heads and main hits only this README.
- GromovWittenTheory (open head, line 25) consumes §3.7 and the stability theorem. The ids §3.7, §3.8 and §11.2 are unchanged, so its citations still resolve.

**Seeded sample.**
- None of the 15 sampled targets lies in a changed passage: §0.4, §0.5, §1.2, §2.7, §2.11, §2.14, §2.16, §2.20, §2.22, §2.23, §4.2, §4.3, §5.2, §8.2 and §12.2.
- §5.2 cites §3.7 only for compactness of `X_∅`, a conclusion the diff leaves as it was. §1.2 is cited by §3.7 for "every ghost pointed stable", which is `2g_v − 2 + val_v + n_v > 0` by `logCanonicalDegree_dualGraph`, consistent with §1.2's genus-0 / genus-1 / genus ≥ 2 cases.
- §12.2 cites §11.1, not the changed §11.2.
- Spot check: §0.5's locator "Wendl, Lectures, v3.2, Prop. 4.3; Definition 4.5" is at wendl lines 5107–5117. There, Prop. 4.3 factors a nonconstant closed curve through a curve embedded off a finite set, and Def. 4.5 defines injective points. Both support the README's weaker countability claim. The text is Version 3.2 (wendl line 8).
- The §3.7 locators into is99 (Thm 1.1, Remark 2, Def. 1.11, Lemmas 4.3 and 4.5) are unchanged by the diff and were checked in PRREVIEW-AnalyticStableMaps~6.

**Adversarial table: rows for the statements the diff adds or changes, with values computed this round.** In this table, `p_a` is the arithmetic genus, V and E are the vertex and edge sets, lcd is the log-canonical degree, w is the weighted degree, and `#gh` is the number of ghosts.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Source convention (line 40): g = `arithmeticGenus` of the labelled `dualGraph` | smooth genus-2 curve | V = 1, E = 0: `b₁ = 0 + 1 − 1 = 0`, `p_a = 2` | match | none |
| same | sphere with one self-node | `b₁ = 1 + 1 − 1 = 1`, `p_a = 0 + 1 = 1` | match | none |
| same | two spheres meeting in two nodes | `b₁ = 2 + 1 − 2 = 1`, `p_a = 1` | match | none |
| same, degenerate | ι = ∅ | the glued curve is empty, so `ConnectedSpace` fails and `dualGraph` is not formed | outside the convention, as a curve is connected; line 72 states the hypothesis | none |
| Line 72: valence and lcd | self-node sphere, no marks | val = 2; lcd `= −2 + 2 + 0 = 0`; sum `0 = 2·1 − 2 + 0` | not stable, as for M̄_(1,0) | none |
| Line 72: decorations | the two-node banana | d = (1,0): w = (3, 0), not stable; d = (1,1): w = (3, 3), sum `6 = 0 + 3·2` | match | none |
| Line 72: clutching | two one-marked spheres | `p_a`: 0 + 0 = 0; E: 0 + 0 + 1 = 1 | match | none |
| Line 72: self-clutching | sphere with marks inr 0 and inr 1 | loop, `p_a` = 0 + 1 = 1 | match | none |
| D1 contract (line 99) | ComplexCurveModuli D1 line 57 | genus formula with smoothing/cutting compatibility, and pointed stability from D0, are both there | match | none |
| §3.7 bounds: `#ghost ≤ 2g − 2 + n + 2a`, `#E ≤ 3a + 3g − 3 + n` | (0, 0, 1) | `#gh ≤ 0`, `#E ≤ 0` | lone sphere | none |
| same | (0, 4, 0) | `#gh ≤ 2`, `#E ≤ 1` | the two-ghost boundary of M̄_(0,4) | none |
| same | (0, 3, 0) | `#V ≤ 1`, `#E ≤ 0` | X itself | none |
| same | (1, 0, 1): sphere plus constant torus ghost | ghost lcd `= 0 + 1 + 0 = 1`; w = (2, 1), sum `3 = 2 − 2 + 0 + 3`; `#gh = 1 ≤ 2`; `#E = 1 ≤ 3` | match | none |
| same | (0, 2, 0) | `2g − 2 + n = 0` leaves no room for a vertex | empty, as stated | none |
| same, a = 0 | the reduction cited | all-zero decoration gives `IsStable` ⇔ `G.IsStable` (definitional); bounds are `card_vertex_le` and `card_edge_le` | match | none |
| §3.7 Check 2 (line 656) | 2 + 2 marks, one edge | `g + 2 = 0 + 1 + 1` gives g = 0; lcd `= −2 + 1 + 2 = 1`; sum `2 = −2 + 4`; the wrong valence gives `3 + 3 = 6` | match | none |
| §3.7 Check 3 (line 657) | line plus a two-marked ghost, (0, 2, 1) | w = (2, 1), sum `3 = −2 + 2 + 3`; `#gh = 1 ≤ 2`; `#E = 1 ≤ 2`; with one mark, lcd = 0 | stable; one mark excluded | none |
| §3.7 Check 4 (line 658) and §3.8 Check | conic limit, a = 2 | w = (2, 2), sum `4 = −2 + 6`; `#E = 1 ≤ 3`; `#gh = 0 ≤ 2` | match | none |
| §11.2: clutched-domain `dualGraph` ≅ `clutch` / `selfClutch` | edge orientation | `dualGraph` edge = `![d.fst f, d.snd f]`; `Iso` compares `Sym2` ends, so order is free; marks relabelled to `ι ⊕ κ` and `ι ⊕ Fin 2` as the types require | statable at the pin | none |
| §11.2 Check (line 1016) | two one-marked lines, external clutching | `0 + 2 = 0 + 1 + 1` | genus 0, no cycle | none |
| §11.2 Check (line 1017) | two-marked sphere, self-clutching | `1 + 1 = 0 + 1 + 1` | genus 1 | none |
| §11.2 Check (line 1018) | constant sphere with marks 1, *, ** | lcd `= −2 + 0 + 3 = 1`, then `−2 + 2 + 1 = 1`; loop valence 1 would give 0 | stable; the wrong count is refuted | none |
| §11.2, negative control | constant sphere with marks 1 and *, clutched to a line | input lcd `= −2 + 0 + 2 = 0`; the clutched ghost has 1 mark and 1 node, lcd = 0 | unstable on both sides, as `isStable_clutch_iff` says | none |

Rows carried from PRREVIEW-AnalyticStableMaps~6 (its adversarial table, including the rows it carried from ~5), for statements the diff leaves untouched:

| Statement | Instances | Values computed (previous reports) | Result | Change |
|---|---|---|---|---|
| `finite_isotropy_iff` (Lean, §1.2) | ι = ∅; degree-one sphere; `ℓ∘z²`; ghost with 1 or 2 marks; genus-2 ghost; nodal torus; no `hu`; dim X = 0 | 1 element; 1; `{id, −z}`; ℂ* vs trivial; `≤ 84`; finite; rotations make the set infinite; reduces to `finite_ordered_iff` | true; `hu` is needed | none |
| Normalization, existence (Lean) | `z²` composed with a line; genus-one double cover; dim X = 0 | `d = 2`, `R = 2`, `2 = 2·2 − 2`; `2g − 2 = 0`; `hnc` fails | true, or vacuous where it should be | none |
| Normalization, uniqueness (Lean) | `π₁ = π₂ = z²`; `π₂ = φ∘π₁` | `a = id`; `a = φ` | true | none |
| `IsSomewhereInjective` | line; double cover; constant map | injective; `mfderiv = 0` at the branch; `mfderiv = 0` | both clauses needed | none |
| Genus identity (§0.5) | `g₀ = 0`, `d = 2`, `R = 4`; `z^d` | `g = 1`; `R = 2(d − 1)` | match | none |
| Fixed-j dimension (§2.10) | g = 0, 1, 2 | `2m + 2c₁ − 6`; `2c₁ − 2`; `−2m + 2c₁` | match | none |
| Incidence (§2.15) | lines; conics; three line points | 0; 0; −2 | match | none |
| Relative families (§2.16) | lines over `[0, 1]` | index 5; outward normals `±∂_t` | match | none |
| Arbitrary targets (§2.20) | torus with fixed j and one mark; diagonal | `2c₁`; `4 + 4 − 4 = 4`, empty | match | none |
| Nodal index (§4.1) | two lines | `20 − 12 + 4 − 4 + 2 = 10 = v` | match | none |
| Thickened topology (§5.2) | `I = ∅`; nonempty I | compact; unbounded e | match | none |
| Layer 5 Example (two lines) | `D_α` meeting each line twice | `r_α = 4`; `r_α = 3` leaves 2 special points on a sphere | match | none |
| End norm and neck (§6.1) | `c + e^(−μs)w`; linear neck | node value 0; `π|Δ|²e^(2δR)/(4δ³R²)` and `π|Δ|²e^(2δR)/(2δR²)` | match | none |
| Gluing orientations (§8.2) | hyperplane; codimension 2 | 2 components; connected | match | none |
| Functional (§9.2) | point target (1,1); (0,3) | `v = 2`, weight ½; 1 | match | none |
| Joint models (§12.1) | two-marked lines and the diagonal | normal dimension 4; fibre empty | match | none |
| Domain adapter (§13.3) | `M̄_(0,5)`, `M̄_(1,1)`, `M̄_(2,0)` | dimension 4; isotropy 2, 4, 6 | match | none |

## Not verifiable

- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology*, and Robbin–Ruan–Salamon (Math. Z. 2008):
  - both are paywalled and already settled as uncertified in the manifest;
  - they are cited by locator only;
  - no changed passage depends on them.
- Ownership against open pull requests was checked with `roadmaps grep` and `overlaps.md` at the index of 2026-11-08T01:17:41Z. Pull requests opened after that index were not checked.

## Source issues

- none
