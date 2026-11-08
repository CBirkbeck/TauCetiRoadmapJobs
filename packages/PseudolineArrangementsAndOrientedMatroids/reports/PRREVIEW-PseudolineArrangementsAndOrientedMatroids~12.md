# Review of PseudolineArrangementsAndOrientedMatroids (pull request #1523 at 470b693)

**Verdict:** needs changes

This is an incremental re-review of the 39 lines changed since 280b170. The change adds the new target 3.8 (c) with three Checks and extends one sentence of Research context. `Suggested.lean` is unchanged.

None of the five findings of the previous review is touched at this head, so R01–R05 are carried below. Two new P3 findings concern 3.8 (c). The mathematics of 3.8 (c) is correct: its route and its three Checks hold when computed (table below).

## R01 (P3) — `Suggested.lean` computes the Platonic examples of 9.4 (carried)

**Location:** `TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/Suggested.lean`.
- Line 914–930: `natCard_platonicGroups`, `cellNumbers_platonic`, `isClosedSurface_isOrientable_platonic`.
- Line 888–911: `tetrahedronGMap`, `octahedronGMap`, `cubeGMap`, `dodecahedronGMap`, which only these three theorems use.
- Docstring line 73–75 lists them as headlines.

**Claim:** the three theorems are headlines. In fact they are padding under the acceptance-test rule ("computes a small value"): each states the values or decidable properties of five fixed finite maps.

**Witness:** line 919–922 states `tetrahedronGMap.cellNumbers = (4, 6, 4) ∧ …`. The Summary names no Platonic map. README 9.4's Check (line 1411–1412) computes the same quotients, `24/6 = 4`, `48/8 = 6`, `120/10 = 12`.

**Repair:**
- Delete the three theorems and the four definitions. Keep `coxeterGMap` and `icosahedronGMap`, which `nonempty_iso_orientationDoubleCover_hemiIcosahedronGMap` (line 962) uses.
- In the docstring, delete the 9.4 bullet (line 73–75) and add `coxeterGMap`, `icosahedronGMap` to the "on …" list of the 9.5 bullet.
- In README 9.4 (line 1393–1405), keep every statement as a prose target and drop the backticks from the seven deleted names.

**Tested:** at 280b170, a scratch copy with exactly these deletions elaborated with 49 `sorry` warnings and nothing else. `Suggested.lean` and the pins are unchanged since then.

## R02 (P3) — The docstring gives the wrong missing carrier for 3.7, 8.2 and 8.4 (carried)

**Location:** `Suggested.lean` line 89–90: "they lack the projective face poset of 2.5, which needs the rank of a covector". Line 86–88 gives the same reason for 2.2 and 2.4–2.6.

**Claim:** the rank of a covector is what makes these statements unstatable at the pins. It is not. The map of 3.7 is a `GMap2` only through the theorem that each member of a maximal chain can be exchanged in exactly one way. So it cannot be given a real body before that theorem.

**Witness:** against the built module, `noncomputable def covectorRank [Finite E] (χ : Chirotope r E) (X : E → SignType) : ℕ∞ := r - χ.matroid.eRk {e | X e = 0}` elaborates. This was checked at 280b170; the file and pins are unchanged.

**Repair:**
- Replace the reason in line 89–90 with: "the map of a projective arrangement is a `GMap2` only through the theorem of 3.7 that each member of a maximal chain of the projective face poset can be exchanged in exactly one way, so it is a heavy definition kept in the README; 8.4 (ii) also needs GraphConnectivityAndFlows Target 1.1's isomorphisms of `Graph α β`."
- For line 86–88, either delete the bullet (2.2's uniqueness clause and 2.4–2.6 are not end theorems of the Summary), or define the rank as above and state them.

## R03 (P3) — A Mathlib declaration is credited to GraphConnectivityAndFlows (carried)

**Location:** README line 181–183, "From GraphConnectivityAndFlows. Target 1.1: … and the bridge `toSimpleGraph (Graph.ofSimpleGraph H) ≃ H`, for 8.3 and 8.4."

**Claim:** GraphConnectivityAndFlows Target 1.1 supplies this bridge.

**Witness:** the pinned Mathlib already has `Graph.toSimpleGraphOfSimpleGraphIso (G : SimpleGraph α) : (toSimpleGraph (ofSimpleGraph G)) ≃g G` (`Mathlib/Combinatorics/Graph/Simple.lean` line 132–133).

**Repair:**
- Delete the bridge clause from the GraphConnectivityAndFlows contract.
- Add `Graph.ofSimpleGraph` and `Graph.toSimpleGraphOfSimpleGraphIso` to the "Graphs" bullet of From Mathlib (line 172–173).
- The isomorphism interface of `Graph α β` stays with Target 1.1.

## R04 (P3) — The flag-system targets carry no source locator (carried)

**Location:** these subsections name no theorem, section or page:
- 0.3 (line 249–266) and 0.4 (284–294);
- 7.2 (1154–1164), 7.3 (1175–1183) and 7.5 (1209–1217);
- 8.1 (1241–1248);
- 9.1 (1335–1344), 9.2 (1353–1362), 9.4 (1393–1405) and 9.5 (1416–1429);
- 1.4 (372–380), 5.2 (979–982) and 6.1 (1057–1065).

Vince 1983 and Jones–Singerman 1978 (References, line 1598–1600) are cited by no target.

**Witness:** `grep -n 'Vince\|Jones'` on the README hits only the References lines 1598–1599. The house rule requires a locator at every claim.

**Repair:** add a locator at each claim.
- Checked against the text: Wilson, *Maniplexes: Part 1*, Symmetry 4 (2012) 265–275, doi:10.3390/sym4020265, open access.
  - §5, p. 267–270 covers 0.3 and 8.1: flags with involutions `rᵢ`, the connection group, connectedness, isomorphisms, and orientability as bipartiteness.
  - §7, p. 272 covers 7.3, 9.1–9.2 and Convention 12's `ᵐᵒᵖ`.
  - Say that 8.1 uses only the absence of fixed darts: Wilson assumes the `rᵢ` fixed-point-free and pairwise different.
- For 0.4, 7.5, 9.4–9.5, 1.4, 5.2 and 6.1, cite the theorem the statement comes from.
- Cite Vince 1983 and Jones–Singerman 1978 at a claim, or delete them from References.

## R05 (P3) — Two Checks misstate their object (carried)

**(a) README line 349:** "In rank 2 the full relations are the three-term relations of Convention 2 (one `x`, three `y`)."
- 1.2's relation has `r + 1` elements `x` and `r − 1` elements `y`, so rank 2 has three `x` and one `y`.
- With `x = (b, c, d)` and `y = (a)` it expands to `χab χcd − χac χbd + χad χbc`, which is Convention 2.
- **Repair:** "(three `x`, one `y`)".

**(b) README line 1252:** "The empty map is orientable (any `S` works)".
- `GMap.IsOrientable` is 2-colourability of the flag graph (0.3). No `S` occurs in it.
- **Repair:** "(its flag graph, with no vertex, is 2-colourable)".

## R06 (P3) — 3.8 (c) carries no locator, and its source is cited only by a page range in Research context

**Location:**
- README line 764–767, "(c) Prove: if no element is bigonal, the `n` elements can be listed `e₁, …, eₙ` so that …". There is no locator before "Route:".
- Line 1537–1538: "the listing of 3.8 (c) (Montpellier fonds, folder 80, pp. 20–28, …)".

**Claim:** the listing is Grothendieck's, somewhere in pp. 20–28. The target itself names no source, and the notes are absent from References.

**Witness:** I read the scans of folder 80, using the archive's printed page numbers. The listing is the "Lemme" of p. 28, stated for `N ≥ 5`. The classification is on pp. 20, 22 and 24. Pages 21, 23 and 25 are a German letter draft, and p. 27 is a 1981 thesis-defence notice.

**Repair:**
- In 3.8 (c), before "Route:", add "(Grothendieck, Montpellier fonds, folder 80, p. 28, the lemma, stated for `N ≥ 5` pseudolines; his type III₆ of p. 24 is the complete quadrangle)".
- In Research context, replace "pp. 20–28" with "pp. 20, 22, 24, 26 and 28".
- Add to References: "A. Grothendieck, manuscript notes on arrangements of pseudolines, Université de Montpellier, fonds Grothendieck, folder 80, pp. 20–28, https://grothendieck.umontpellier.fr/80.pdf".

**Tested:** p. 28 states, for an arrangement of `N ≥ 5` pseudolines with no bigonal one, two alternatives:
- `D₁, …, D₄` of type II₄ and `Dᵢ` not bigonal in `Kᵢ` for `i ≥ 5`;
- or `D₁, …, D₆` of type III₆ and the same for `i ≥ 7`.

This is 3.8 (c) once 3.8 (c)'s monotonicity step is applied.

## R07 (P3) — 3.8 (c)'s route uses the matroid of a deletion, which no target states, and its `*Needs:*` line is shared

**Location:**
- README line 768–769: "a vertex of a restriction through an element `f` is the trace of its closure in every larger restriction".
- Line 782: "*Needs:* 1.3, 1.5, 2.3, 2.6; Mathlib `Matroid.IsFlat`, `Matroid.eRk`".

**Claim:** 1.5 supplies what the route uses. It does not. Vertices of a restriction are rank-2 flats of the restricted chirotope's own matroid (1.3). Taking their trace needs two facts:
- that this matroid is `χ.matroid` restricted to the subset;
- Mathlib's closure-of-restriction lemma.

1.5 states the matroid compatibility for the dual only.

**Witness:**
- 1.5 (line 399–400) says "that the matroid of the dual is `Matroid.dual` of `χ.matroid`". It says nothing about deletion.
- The pinned `Matroid.restrict_closure_eq` (`Mathlib/Combinatorics/Matroid/Closure.lean` line 989) is the trace step: `(M ↾ R).closure X = M.closure X ∩ R`.

**Repair:**
- In 1.5, after "Prove that each is a chirotope;", insert "that the matroid of the deletion of a non-coloop `e` is `χ.matroid.restrictSubtype {e}ᶜ`;". Add Mathlib `Matroid.restrictSubtype` (`Combinatorics/Matroid/Map.lean` line 636) to 1.5's *Needs:*.
- Give 3.8 (c) its own line, "*Needs:* 3.8 (b), 1.3, 1.5; Mathlib `Matroid.restrictSubtype`, `Matroid.restrict_closure_eq`".
- Return (a)–(b) to "*Needs:* 1.3, 2.3, 2.6; Mathlib `Matroid.IsFlat`, `Matroid.eRk`". (a) does not need 1.5.
- Add the two Mathlib names to the "Matroids and orders" bullet of From Mathlib.

**Tested:** on Check 2's `Q ∪ {δ}`, the traces of the closures of `{e₁, e₂}` and `{e₃, e₁ + e₂ + e₃}` are `{e₁, e₂, δ}` and `{e₃, e₁ + e₂ + e₃, δ}`. These are exactly the vertices of the restriction computed directly, which makes `δ` bigonal there.

## Previous findings

- R01 — not repaired: `Suggested.lean` line 914–930 still declares `natCard_platonicGroups`, `cellNumbers_platonic`, `isClosedSurface_isOrientable_platonic`, and docstring line 73–75 still lists them as headlines.
- R02 — not repaired: docstring line 89–90 still reads "they lack the projective face poset of 2.5, which needs the rank of a covector."
- R03 — not repaired: README line 182–183 still reads "and the bridge `toSimpleGraph (Graph.ofSimpleGraph H) ≃ H`, for 8.3 and 8.4."
- R04 — not repaired: 0.3, 0.4, 7.2, 7.3, 7.5, 8.1, 9.1, 9.2, 9.4, 9.5, 1.4, 5.2 and 6.1 still name no source. Vince and Jones–Singerman (line 1598–1599) are still cited by no target.
- R05 — not repaired: line 349 still reads "(one `x`, three `y`)", and line 1252 still reads "The empty map is orientable (any `S` works)".

## Verified sound

**Gate, order and elaboration.**
- **Brief's gate command:** every counter is 0 except `depcheck=1`, "NOT IN ORDER: PseudolineArrangementsAndOrientedMatroids (insert it after its last supplier)". That line is not a defect.
- **Worker's gate at this head:** every counter 0 including `build=0`, "OK".
- **Dependency check** (`gate --depcheck … --order merge-order-candidate.txt --movable`): `depcheck: 239 roadmaps, 2350 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The folder is at line 397 of 397.
- **Changes outside the folder:** `git diff --stat origin/main...HEAD` outside the folder is empty. The files that `changes.md` lists outside the folder come from merging main, not from this pull request.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 52 warnings, all "declaration uses `sorry`".
- **Carried from the previous review:** the binder check (`#check @name` for all 134 declarations), the auto-bound-implicit census and the one-tactic probe (all 52 fail). `git diff 280b170 HEAD` is empty for `Suggested.lean`, `lake-manifest.json` and `lean-toolchain`, so they carry.

**3.8 (c), checked step by step** (simple rank-3, so two elements span exactly one vertex, and two distinct vertices meet only in `{f}`):
- **Monotonicity.** For `S ⊆ T`, `V ↦ cl_T(V)` sends the vertices through `f` of `χ|S` injectively to those of `χ|T`, since `cl_T(V) ∩ S = V`. So it suffices that the new element `e_k` lies on at least 3 vertices.
- **Complete-quadrangle case.** Four triples on six elements with pairwise intersections of at most one force each element into exactly two triples, so any two triples share exactly one element. A vertex through an outside `f` meets the quadrangle `C` in a flat of `χ|C`, so in at most 3 elements. Covering six elements with two such vertices would need two disjoint triple points, which do not exist. So `f` has at least 3 vertices.
- **`Q` case.** An outside `f` on two vertices of `Q` that are not opposite would put three elements of `Q` on one vertex. An `f` on at most one vertex of `Q` has 4 or 3 vertices in `Q ∪ {f}`.
- **At most one diagonal.** Two diagonals on one opposite pair lie in the intersection of two distinct rank-2 flats, so they are parallel, hence equal. Two on different pairs give six elements with exactly four 3-element vertices, `{a,b,f}, {c,d,f}, {a,c,g}, {b,d,g}`: a complete quadrangle.
- **Deletions.** The deletions are of non-coloops because `Q` keeps rank 3, so the restriction stays simple of rank 3.
- **Gap.** The only unstated input is R07's.

**Grothendieck, folder 80, read from the page scans.** The text layer of the sources service is glyph names, so I read the rendered pages.
- **p. 20:** the four types (four lines in general position; five general; five special; six, tetrahedral) and the claim that every arrangement without a bigonal line contains one of them.
- **p. 22:** the case split by the existence of a bigonal pseudoline.
- **p. 24:** the theorem that an arrangement without bigons and without II₅ is III₆ or III₇, and the NB that every one contains I′₃,₂, II₅ or III₆.
- **p. 28:** the listing lemma (R06).
- The Research-context claim is therefore true: the notes contain both the classification and the listing.

**Library declarations opened at the pin.**
- `Matroid.restrict` (`Combinatorics/Matroid/Minor/Restrict.lean` 122);
- `Matroid.delete` (`Minor/Delete.lean` 51, notation `＼` at 54);
- `Matroid.restrict_closure_eq` (`Closure.lean` 989);
- `Matroid.IsFlat` (`Closure.lean` 94);
- `Matroid.eRk` (`Rank/ENat.lean` 79);
- `Matroid.ofIsBaseOfFinite` (`IndepAxioms.lean` 524);
- `Matroid.restrictSubtype` (`Map.lean` 636);
- `Chirotope.ofVectorsFun` (`Suggested.lean` 279), used by the new Checks.

**Cross-roadmap citations, re-resolved on main (94294cd).**
- RootSystems: `geometric_faithfulness` at README line 517 and `Suggested.lean` line 73; §1.3 at line 515; Layer 1 at 428; Layer 2 at 614.
- GraphConnectivityAndFlows: Target 1.1 at README line 224.
- No roadmap on main cites this one.
- The citations tool lists no cross-roadmap citation found nowhere. Its 65 Lean-name leads are this roadmap's own declarations; the gate's `readme-ids-missing=0` confirms that each is declared.

**Ownership and overlaps.**
- The overlaps tool finds no open pull request changing this roadmap, no dropped id in either direction, and no id that only an open revision defines. Its closest roadmap is SurfaceTopology (0.14), which is on the never-cite list.
- `roadmaps grep -i 'bigonal|complete quadrangle|pseudoline'` hits only this pull request (63 lines).

**Seeded sample.** None of the 15 sampled targets lies in the changed passages.
- Covered by the previous review's table: 2.2, 2.3, 2.4, 5.2 and 9.1, 9.2, 9.4 (rows carried below); 4.6 (Felsner–Goodman Table 5.6.1) and 5.3 (Felsner–Goodman Theorem 5.1.1), which were source-checked.
- Computed this round (rows below): the Checks of 3.2, 3.3, 3.7, 5.4, 5.5 and 8.3.
- Remark on untouched text, not a finding: 3.3, 3.8 (b) and 5.5 also carry no locator at the claim. 3.8 (b) is on p. 20 and p. 24 of folder 80.

**Headline theorems.** The README Summary is unchanged, and so is its headline list as checked in the previous review: all stated except 8.4 (i)–(ii), which the docstring names (with R02's wrong reason). 3.8 (c) is not an end theorem of the Summary and needs no Lean statement.

**Adversarial table.** The rows for 3.8 (c), its Checks and the sampled 3.2–8.3 targets were computed this round. Scripts enumerate rank-2 flats of integer vector configurations by cross products. The random run uses 18,778 simple rank-3 configurations with no bigonal element, `n = 4, …, 8`, drawn from the 49 primitive vectors of `{−2, …, 2}³`. Rows marked (r10) are carried from the previous report, with the values it computed.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.8 (c) statement | `n = 3`; `n = 4` general; the three Checks; 18,778 random configurations | `n = 3`: every element bigonal, so excluded; `n = 4`: any order. The route's listing works in all 18,778: 18,687 via `Q`, 91 via a quadrangle. A valid listing exists for every `n ≤ 6` (exhaustive over permutations) | true | R06 locator |
| 3.8 (c) "at most one diagonal" | the same 18,778; quadrangle of Check 1 with `Q = {e₁, e₂, e₁−e₃, e₂−e₃}` | no configuration without a quadrangle has two diagonals; the Check 1 `Q` has diagonals `e₃` and `e₁−e₂` on different pairs, and `Q` plus both is the quadrangle | true | none |
| 3.8 (c) route, trace step | Check 2, `Q ∪ {ℓ} ⊂ χ` | `ℓ` lies on 4 vertices in `Q ∪ {ℓ}` and on 5 in `χ` (monotone); traces of the closures equal the directly computed vertices | true; input unstated | R07 |
| 3.8 (c) Check 1 (quadrangle) | `e₁, e₂, e₃, e₁−e₂, e₁−e₃, e₂−e₃` | vertices `{0,1,3}, {0,2,4}, {1,2,5}, {3,4,5}`, `{0,5}, {1,4}, {2,3}`; deleting `i` makes `5−i` bigonal; no `m = 4` listing among 720; an `m = 6` listing exists | sound | none |
| 3.8 (c) Check 2 (diagonal last) | `Q = e₁, e₂, e₃, (1,1,1)`, `δ = (1,1,0)`, `ℓ = (1,2,5)` | 11 vertices, triples `{e₁,e₂,δ}`, `{e₃,(1,1,1),δ}`; no bigonal element; no quadrangle; `Q,ℓ,δ` valid; `Q,δ,ℓ` invalid (`δ` on 2 vertices of `Q ∪ {δ}`) | sound | none |
| 3.8 (c) Check 3 (3+2) | `e₁, e₂, e₁+e₂, e₂+e₃, e₁+e₃` | vertices: one triple plus 7 pairs; vertex counts `3,3,3,4,4`; general 4-sets are the 3 omitting `e₁`, `e₂` or `e₁+e₂`; 72 of 120 listings valid, `= 3 · 4!` | sound | none |
| Research context, folder 80 | pp. 20–28 | the lemma is on p. 28 (`N ≥ 5`), the types on pp. 20 and 24; pp. 21, 23, 25 and 27 are other material | true; range loose | R06 |
| 3.2 Checks (sampled) | `(3/2, 6/5)` for `y = x, 1, 3−x`; `n = 0` | `signAt = (+, −, +, 1)` (values `0.3, −0.2, 0.3`); cells `7 + 9 + 3 = 19`; `n = 0` gives one cell | sound | none |
| 3.3 Checks (sampled) | lines of 3.1; `n = 1`; concurrent lines | `crossX = 1, 3/2, 2`; `χ(0,1,2) = sign(2 − 1) = 1`; transposed `−1`; `n = 1` all zero; concurrent `crossX 0 1 = crossX 1 2 = 0`, so `χ = 0` | sound | none |
| 3.7 Checks (sampled) | three and four lines in general position | `(3, 6, 4)`, 24 flags, `χ = 1`; `(6, 12, 7)`, `4·3 + 3·4 = 24 = 2·12`, 48 flags, `χ = 1` | sound | none |
| 5.4 Checks (sampled) | `e₁, e₂, e₃`, `w` without zeros; `v none = e₁` | localization at the three cocircuits `= (± w₁, ± w₂, ± w₃)`: 8 generic; `e₁` gives `(1, 0, 0)` up to the convention's signs, below `e₁ + ε(a e₂ + b e₃)`: 4 positions | sound | none |
| 5.5 Checks (sampled) | `w = (1,1,1)`; `none ∥ e` | three lines in general position; `det(e, f, e) = 0` violates 3.6's hypothesis | sound | none |
| 8.3 Checks (sampled) | three and four lines; projective plane on 4 darts | 3 vertices, 6 edges in 3 parallel pairs; `K₂,₂,₂`: 6 vertices, 12 edges, 4-regular, simple; `(1,1,1)`: one loop | sound | none |
| 0.1–0.2 (r10) | `X = (+,0)`, `Y = (−,+)`; `E' = {e₁}` | `X∘Y = (+,+)`, `Y∘X = (−,+)`; `(+,−) ↦ (+) ↦ (+,0)` | sound | none |
| 0.3–0.4 flag systems (r10) | projective plane on 4 darts; sphere with a loop; one dart; empty | `(1,1,1)` non-orientable, cover `(2,2,2)` connected; `(1,1,2)` cover `(2,2,4)` two components; one dart and empty show `hfix`, `Nonempty` needed | sound | none |
| 1.2 rank-2 Check (r10) | `r = 2` | 3 `x`, 1 `y` | Check wrong | R05 |
| 1.4, 1.7 (r10) | `(1,0),(0,1),(1,1),(1,2)`; loop and parallel pair | minors `1,1,1,−1,2,−1`; classes `{1,2},{3},{4}`, loop `5` | sound; 1.4 has no locator | R04 |
| 2.2–2.4, 2.6 (r10, sampled) | alternating on 5; nine vectors; `r = 0` | 83 covectors `= 1+20+40+22`; walls 10×3, 10×4, 2×5; chain length `3 = r+1`; `20−40+22 = 2`; `r = 0` needs `r ≥ 1` | sound | none |
| 3.5, 3.8 (a) (r10) | three lines; loop added | 19 covectors at `none = 1`; with a loop every rank-2 flat has 3 elements | sound | none |
| 4.3–4.6 (r10) | `m = 3, 4, 5`; Table 5.6.1 | signotopes `2, 8, 62`; simple arrangements `1, 1, 1, 4` for `n = 3..6` | sound | none |
| 5.1–5.3 (r10, sampled) | `(1,0),(0,1)`; `v none = ±v e`; Thm 5.1.1 | localization `1, −1`; `Y ↦ ± Y e`; loop gives `0`; Levi as stated | sound; 5.2 has no locator | R04 |
| 6.1–6.3 (r10) | `pappusPoints`; `det A = 2` | collinear `det 0`; `−60`; exactly 9 collinear triples | sound; 6.1 has no locator | R04 |
| 7.2–7.5 (r10) | `n = 0`; empty; `Bool`; `H = ⊤, ⊥` | `x⁰ = 1`; 1 automorphism vs 0 flags; `2 = 2`; `2 < 3`; 1 flag; regular action | sound | R04 |
| 8.1 (r10) | projective plane; tetrahedron; one dart; empty | transitive; 2 orbits of 12; `hS` and `Nonempty` needed | sound; Check wording | R05, R04 |
| 9.1–9.2 (r10, sampled) | empty; tetrahedron; four lines; order-4 group | 1 vs 0; `24 = 24`; 48 flags vs 24; index 2, two components | sound | R04 |
| 9.4 (r10, sampled) | `B 3` entry `(1,2) = 4` | `24/6, 48/8, 120/10 = 4, 6, 12`; `(4,6,4)` … `(20,30,12)` | values sound; padding | R01, R04 |
| 9.5–9.6 (r10) | `H₃/Z`; `n = 2..5` | `60/10, 60/4, 60/6 = 6, 15, 10`, `χ = 1`; orders `24, 108, 192, 300` | sound | none |
| Docstring 86–90 (r10) | `covectorRank` | elaborates at the pins | wrong reason | R02 |
| Contract 181–183 (r10) | `Graph.toSimpleGraphOfSimpleGraphIso` | at `Graph/Simple.lean` 132 | duplicated | R03 |
| 10.1–10.2 (r10) | `n = 2`, `M = (0,0,2)`; `n = 0` | Gram `[[1,−1,0],[−1,1,−1],[0,−1,1]]`; `n = 0` acts by `[−1]` | sound | none |

## Not verifiable

- **Unchanged from the previous review**, cited by locator only:
  - BLSWZ *Oriented Matroids* (CUP, paywalled), for 0.1, 1.5, 1.7, 2.4, 2.6, 5.1 and 5.4;
  - Coxeter–Moser §8.4, McMullen–Schulte §2A/2E11 and Humphreys §5.4 (paywalled);
  - Ringel 1956, Roudneff–Sturmfels 1988, Levi 1926, Goodman–Pollack, Felsner–Weil 2001, Björner–Edelman–Ziegler 1990, Vince 1983 and Jones–Singerman 1978 (paywalled journals);
  - Grothendieck's *Esquisse d'un programme* (no copy on a host the sources service accepts), so Convention 10's "exactly these objects" is unchecked.
- **Grothendieck, folder 80:** the scans are handwritten French. I read the statements on pp. 20, 22, 24 and 28 from the images; individual words I could not read did not affect the statements above.

## Source issues

- none
