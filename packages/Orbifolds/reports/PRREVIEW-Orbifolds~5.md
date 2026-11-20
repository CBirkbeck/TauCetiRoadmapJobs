# Review of Orbifolds (pull request #2624 at 699635e)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 29 lines changed since `c80fb4f`: the proof sketch of §3.4 now places the reflection in the right group (the stabilizer of a frame contains an element whose reflection component is the reflection of the face, and that component is a conjugation invariant), which repairs the one small correction of the previous review, and a table in the scope section maps the ten former labels that other roadmaps cite to their present sections, all ten correctly. Three format notes of the previous review are carried unchanged, none blocking, and nothing is left for the human reviewers to decide.

## N01 — The stratified form of §3.1 is statable at the pins and could be stated beside `isTriangulable_orbitRel_quotient`

§3.1 says itself that the Lean statement "states triangulability only, which does not give this" (lines 601–602), so the acceptance test is passed by a proof that leaves §§3.2–3.4 without their input. The stronger statement elaborates at the pins with no new definition: a complex `C` and a homeomorphism `e` from its realization to the orbit space such that two points whose images under `e.symm` have the same `AbstractSimplicialComplex.carrier` have conjugate stabilizers (`TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Basic.lean`, line 362). It would be a second declaration; the present one is true and stays.

## N02 — Verona's bounded-dimension hypothesis is on p. 429, not p. 428

"Verona, §1, p. 428" (line 613) is cited for Thom–Mather spaces whose strata have bounded dimension. Page 428 defines `d(A)`; the standing assumption `d(A) < ∞` opens p. 429 (Verona1980 lines 138 and 145–146). "§1, pp. 427–429" would cover both.

## N03 — Two theorems that §4.9 proves again still carry no locator

The lemma that realization preserves levelwise weak equivalences of proper simplicial spaces (lines 1030–1032) and the fat–thin comparison (lines 823–825) are published results stated without a citation; one each would let an implementer check the cofibration hypotheses against a source.

## Previous findings

The previous review, of `c80fb4f`, had no finding; its other remarks are accounted for here.

- C01 — repaired: "contains an element whose component in the reflection group is that reflection, a property of the orbit type since conjugation does not change that component, and no stabilizer over a point off the face does" (§3.4, lines 695–698).
- N01 — not repaired: §3.1 still says "`isTriangulable_orbitRel_quotient` states triangulability only, which does not give this"; carried as N01.
- N02 — not repaired: "Verona, §1, p. 428" (line 613); carried as N02.
- N03 — not repaired: the two statements of §4.9 and §4.3 still have no locator; carried as N03.
- The automatic check set aside in the previous review (the label O4.2 reported as dropped) no longer fires: the new table has the row "O4.2 | §4.2".

## Verified sound

| Statement | Instances tried | Roadmap side | Computed | Result |
|---|---|---|---|---|
| §3.4 stabilizer sentence (changed) | closed quadrant in `ℝ²`, double `ℝ²` with `(ℤ/2)²`; frame `f` over `(0, y)`, `y > 0`; over the corner; over `(x, y)`, `x, y > 0` | stabilizer has an element with component `r_1` exactly over face 1 | `(diag(−1, 1)` conjugated by `f`, `r_1)` fixes `f`; corner: components `r_1`, `r_2`, `r_1r_2`; interior: `r_1` moves the base point, no arrow back | holds |
| §3.4 "conjugation does not change that component" | `(B, w)` conjugating `(A, r_i)` in `O(n) × (ℤ/2)^k`; non-abelian control `S₃` | invariant of the orbit type | component `w r_i w⁻¹ = r_i` since `(ℤ/2)^k` is abelian; in `S₃` a transposition is moved, so commutativity is used | holds; reflections of distinct labels commute (collars commute, §1.6) |
| §3.4 "no stabilizer over a point off the face does" | point `(x, ε)` of the double with `x ∉ F_i`, arrows of the double | `r_i` does not fix its coarse point | `(x, ε + e_i) = (y, ε′)` in the orbit forces `y = x` and `x ∈ F_j` for every `j` where the signs differ, so `x ∈ F_i` | holds |
| §3.4 with `O(n)` stabilizers | `ℤ/m` rotating the half-plane's double `ℝ²`, `ρ = y` not invariant (excluded); `ℤ/2` by `x ↦ −x` on `{y ≥ 0}` | face `{y = 0}` a union of strata | stabilizer images in `ℤ/2`: `{1, r}` on `y = 0`, `{1}` off it, whatever the `O(2)` part | holds |
| Former-label table (added) | each of the ten rows against the former text on main and the headings at this head | O1.4 → §1.4, O2.4 → §2.4, O4.2 → §4.2, O`k` → Layer `k` | former O1 item 4: locally free actions = §1.4; O2 item 4: averaging = §2.4; O4 item 2: invariant forms = §4.2; seven layers match | ten of ten correct; agrees with the paragraph at lines 61–67 |
| Former labels cited elsewhere | every label of the form "Orbifolds O…" on main and at the open heads (23 distinct forms) | each is mapped | O1–O7, O1.4, O2.4, O4.2 by the table; "O2 item 6", "O5 items 1, 4, 5", "O4, item 1", O4-N/S/R/K/W/T by the paragraph; "O2 item 3", "O1, item 1" by its general rule | none unmapped |
| `isTriangulable_orbitRel_quotient` (§3.1, cited by §3.4) | file unchanged since `c80fb4f`; elaborated again | compact Lie group, Hausdorff second-countable manifold, smooth action | signature keeps `[CompactSpace K]`, `[T2Space M]`, `[SecondCountableTopology M]`, `[ContMDiffSMul … K M]`; one warning, the `sorry` at line 45 | unchanged |

The rows for the untouched statements stand as in the previous review, of `c80fb4f`.

- Changed lines read: 29 (two hunks of the README, §3.4 and the scope section); the Lean file is unchanged and nothing outside the folder changed.
- Source locators checked against the text: 1 (Illman1983 §7, printed pp. 499–500, lines 535–579: the double, the commuting `ℤ/2`, the isotropy types on and off the boundary).
- Library declarations opened at the pin: none new; the elaborated signature of the one declaration was compared with §3.1 again.
- Cross-roadmap citations resolved: the changed text cites no other roadmap; the citations of this roadmap by former label were read on main (HamiltonianReduction, ConvexityToric, StringOrientation, GromovWittenTheory, AnalyticStableMaps, GeometricQuantization, EtaleHomotopyTypes, ComplexCurveModuli, TeichmullerGeometry) and at the open head of HamiltonianReduction (O1.4, O2, O2.4, O4.2, O7).
- Automatic checks: all pass at this head. Dependency check: `depcheck: 182 roadmaps, 2074 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/Orbifolds/Suggested.lean`: one warning, the `sorry` at line 45.
- Description against the head: 45 Checks in 28 lists and 42 *Needs:* lines counted again and agree; its sentences on §3.4 (the double, the reflections adjoined, Illman §7) and on the numbering paragraph remain true; the added table restates that paragraph and changes nothing the description reports.

Overlap check: the overlap listing reports no shared roadmap, no dropped id and no second copy; read this round the citations of Orbifolds in StringOrientation, ImplicitAtlases, CharacteristicClasses (main) and HamiltonianReduction, ConvexityToric (main and open head); the change touches no ownership, and the shared objects and their owners stand as in the previous review (Thom–Mather spaces: AlgebraicTopologyPartII §§16.1a–16.1b; Morita invariance of orbit spaces: LieGroupoidsPoisson §G3.5; Hamiltonian level identifications: HamiltonianReduction R3 and ConvexityToric Layer 4). Nothing else shared.

Source independence: changed passages only: 1 passage (the §3.4 sentence) compared with 1 source (Illman1983 lines 563–570), none shared, the argument being restated for frame stabilizers, which the source does not treat; the table is the roadmap's own. No layer was added, removed or reordered, so the arrangement was not compared again (previous result: independent; largest share Moerdijk2002 and Verona1980, 4 of 17 locators each).

Research link: the layers build the groupoid model of orbifolds with ineffective isotropy and the rational comparison of `BΓ` with the coarse space (Moerdijk–Pronk 1997; Moerdijk 2002, §§3.4, 4.4), the triangulation of orbit spaces (Yang 1963; Verona 1980; Illman 1983) and weighted integration (Adem–Leida–Ruan 2007); HamiltonianReduction and ConvexityToric consume them. Rests on the README's References and on the four texts read.

## Not verifiable

- Nothing in the changed passages. The items of the previous review stand: AdemLeidaRuan2007 (§5.1), MoerdijkPronk1997 (References only) and Putz's paper named through Verona's Lemma 3.4 were not opened.

## Source issues

- none

## For the human reviewers

- none
