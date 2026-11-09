# Review of HomotopySpheres (pull request #1287 at df80d93)

**Verdict:** needs changes

Incremental re-review of the 68 lines changed since `c2c2d3e` (README 1.4–1.6, the Layer 1 Checks, one Downstream bullet; `Suggested.lean` and everything outside the folder unchanged). The changed passages are correct and repair the previous R04 in full. The three findings that remain are the carried ones; none is in the changed text, and R01 and R02 are repaired in the pull-request description, not in the folder. Main is at `3090489`.

## R01 (P2) — Three open revisions of BordismFormalGroups own the James construction and the Toda brackets that 3B and 3C.3 own

**Location.** README 3B.1–3B.4, 3C.3, and :3285–3286, "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4".

**Claim.** Carried, re-checked at the current heads. Main's BordismFormalGroups (README:331, :668) consumes both objects from this roadmap, so :3285–3286 is true today. Each open revision still owns both, never mentions HomotopySpheres, and the description of this pull request names none of them.

**Witness.** "Own the three-fold Toda brackets of pointed spaces" and "Own the James construction" in BordismFormalGroups README: :1181 and :1910 in #1807 (`c271254`); :1002 and :1552 in #1808 (`88e5eaa`); :1104 and :1770 in #1854 (`80ff9a4`). `HomotopySpheres` occurs 0 times in each.

**Repair.** One owner, either way. Keep this roadmap as owner (as main has it) and record in the description that #1807, #1808 and #1854 turn their F4 and F6.2 "Own" sentences into citations of 3C.3 and 3B before they merge; or record a human decision moving ownership, rewrite 3B.1–3B.4 and 3C.3 as citations of F6.2 and F4 at that head, name the revision in the merge-order paragraph and delete :3285–3286. Test on the Check at :1206: `ΣJ₂(S¹) ≃ S² ∨ S³` has H₂ of rank 1 (rank 3 for Cartesian squares); only one roadmap may state the quotient `J_r X / J_(r−1) X ≅ X^∧r` it uses.

## R02 (P2) — Three later open roadmaps own objects this roadmap owns

**Location.** README 3B.1–3B.4, 4A.1, 4B.1–4B.8, 7B.2–7B.4; `Suggested.lean`:132–177.

**Claim.** Carried. All three are later in `ORDER.txt` (HomotopySpheres 45, DGFloerPartII 46, GeometryOfNumbersAndQuadraticArithmetic 55, GeneralAlgebraicKTheoryPartII 335), so they must cite this roadmap. None does where it builds the object, and the description names none of the three pull requests.

**Witness.**
- #1799 (`05e7c01`, moved since the last report): README:1506 "### 4.2a Stable orthogonal groups and the finite-to-stable range", :1624 "### 4.2c Index bounds, the Bott maps and real Bott periodicity"; `Suggested.lean`:377 `nonempty_pi_add_eight_SO_mulEquiv (j m : ℕ) (hm : j + 11 ≤ m)` and :383 `subsingleton_pi_SO_of_stable`. `HomotopySpheres` occurs 0 times in either file.
- #1742 (`ca44359`): README:1213 "### 4.30b The James reduced product", defining `JamesReducedProduct`, its filtration, the James map and the James equivalence.
- #851 (`3b084ef`): README:2719 "### 6.8 Formations", :2778 `WallFormation R ε` and `wallLGroup`.

**Repair.** In the description, name #1742, #1799 and #851 as consumers whose sections become citations before they merge: #1742 §4.30b of 3B.1–3B.4; #1799 §§4.2a–4.2c and its `Suggested.lean`:377–386 of 4A.1 and 4B.1–4B.8; #851 §6.8 of 7B.2–7B.4. The alternative is a recorded human decision for the reverse settlement. Test: π_i(SO(m)) ≅ π_i(O(m)) for i ≥ 1, so #1799:377 at j = k is `nonempty_orthogonalGroup_bottPeriodicity` (π_(k+9) ≅ π_(k+1), m ≥ k + 11), and :383 at j = 1, 3, 4, 5 is the four vanishing headlines with the same bounds 4, 6, 7, 8.

## R03 (P3) — The branch pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`; the README's library citations are main's (`2fd255d`, `1b1ccf4`)

**Location.** `lake-manifest.json` (unchanged by this branch); README "From Mathlib" (:317) and "From Tau Ceti" (:340); the `TauCeti.SphereSurgery` citations (:97, :2447, :2472, :2479, :2510, :3306); `Suggested.lean`:2–3 and :9–11.

**Claim.** Carried, not repaired. The line-numbered library citations resolve at main's pins and fail at the pins this branch builds against.

**Witness.** At `a91d3aa` there is no `Orientation/OrientedAtlas.lean` (`IsOrientedAtlas` is at `TauCeti/Geometry/Manifold/Orientation.lean`:332), and `SphereSurgery`, `OrientedConnectedSum`, `degreeAtRegularValue` occur in 0 files. The manifest at this head still has `a91d3aaf` and `6b7abb3c`; main's has `2fd255d9` and `1b1ccf4b`.

**Repair.** Merge main so the manifest pins `2fd255d` and `1b1ccf4`, rebuild, then import `TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` in `Suggested.lean` and delete :9–11. Test: at `2fd255d` all 26 Tau Ceti line citations of the "From Tau Ceti" block resolve (listed in the previous report).

## Previous findings

- R01 — not repaired: :3285–3286 "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4"; #1807, #1808, #1854 still "Own" both; description unchanged.
- R02 — not repaired: #1742 §4.30b, #1799 §§4.2a–4.2c (now `05e7c01`, `Suggested.lean`:377, :383) and #851 §6.8 unchanged in substance; the description names none.
- R03 — not repaired: `lake-manifest.json` still pins `a91d3aaf` and `6b7abb3c`.
- R04 — repaired: 1.5 now reads "the disc is the embedding of the standard model, Lemma 6.7, p.73, proved on pp.77–84 … Prove the normal framing of the disc (Lemma 6.13, pp.80–83)"; 1.6 uses "Lemmas 6.11–6.12, p.79"; "piping" occurs 0 times.

## Verified sound

**Gate and dependency check** (my runs at `df80d93`):

```text
gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 235 roadmaps, 2265 edges, 0 problem(s)
```

The worker's gate (with `build=0`) also passed. No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Lean.** `Suggested.lean` is byte-identical to `c2c2d3e`. `lake env lean` exits 0 with exactly 16 ``declaration uses `sorry` `` warnings and nothing else. The `#check` comparison, the one-tactic probe (16 of 16 fail) and the headline audit of the previous report carry forward unchanged; no changed README passage is stated in the Lean file (the h-cobordism headline cites 1.7, whose statement is untouched).

**Changed passages against `milnor_hcobordism`** (printed page = PDF page − 5). Every locator the diff adds was read:

| Passage | Locator in the README | Read at | Result |
| --- | --- | --- | --- |
| 1.4 | Thm 6.6, p.71; isotopy on the model of Lemma 6.7, pp.73–74 | lines 1841–1857, 1913–1938 | correct: 6.7 stated on p.73, the isotopy F_t "modulo proving 6.7" ends on p.74 |
| 1.5 | Thm 6.6 and remark, pp.71–72 | lines 1841–1867 | correct: M oriented, normal bundle of M′ oriented, r + s ≥ 5, s ≥ 3; the remark supplies arcs for connected M, M′ |
| 1.5 | Lemma 6.7, p.73, proof pp.77–84; Lemma 6.8, pp.74–77 | lines 1913, 1939–1997, 1998, 2185 | correct |
| 1.5 | Lemmas 6.10–6.12, pp.79–80 | lines 2049–2087 | correct: 6.10 needs codimension ≥ 3 and n ≥ 5; 6.12 needs dim ≥ 2·dim + 1 |
| 1.5 | Lemma 6.13, pp.80–83; simple connectivity at p.83 | lines 2095–2166, 2152–2153 | correct: fibre O(r+s−2)/O(s−1), "simply connected since s ≥ 3" |
| 1.6 | Thm 6.6, p.71, case r = 2; proof of Lemma 6.7, p.80 | lines 1847–1848, 2078–2080 | correct: for r = 2 the π₁ hypothesis replaces 6.10 for V∖M′ |
| 1.6 | proof of Thm 6.4, pp.72–73, λ = 2 | lines 1868–1896 | correct: the flow identifies V₀∖S_L with V∖S_R; van Kampen gives π₁ = 1 |
| Check, m = 6 | Thm 7.8, p.97, proof pp.98–99 | lines 2565–2606 | correct: dimension ≥ 6, 2 ≤ λ < λ+1 ≤ n−2, cancels by Thm 6.4 or Cor 6.5 |

The dictionary is P = M (dimension r = p), Q = M′ (dimension s = q); the README's orientation hypotheses sit on the same sides as Milnor's.

**Adversarial table.** Rows for the changed statements, with this round's values; the rows for every untouched statement (h-cobordism headline, `sphere_parallelizable_iff`, Bott periodicity and entries, the four stems, `smoothPoincareSix_oriented`, 1.2, 1.3, 1.7, 2.2, 2.3, 8.2, 8.3, 9.2–9.5, 10.1, 10.4) carry forward from the previous report (PRREVIEW-HomotopySpheres~21, "Adversarial table"), all Pass.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 1.4 local Whitney move | one pair of signs +1, −1 | count 2 → 0, signed sum 0 → 0; isotopy is the identity off the image of the model | Pass |
| 1.5 general position | (p,q) = (3,3), V⁶ | Q has codimension 3 and P has codimension 3, so 6.10 applies twice (n = 6 ≥ 5); 6.12: 6 ≥ 2·2+1 = 5 | Pass |
| 1.5 Stiefel fibre `O(p+q−2)/O(q−1)` | (3,3); (3,2); (4,3); general | V₂(ℝ⁴) ≅ S³×S², π₁ = 0; V₂(ℝ³) ≅ SO(3), π₁ = ℤ/2; V₃(ℝ⁵), 1-connected; V_(p−1)(ℝ^(p+q−2)) is (q−2)-connected, so π₁ = 0 iff q ≥ 3 | Pass; the (3,2) Check separates q ≥ 3 from q ≥ 2 |
| 1.6 dimensions | m = 5, 6, 7 | (dim P, dim Q) = (2,3), (2,4), (2,5); r + s = m ≥ 5, s = m−2 ≥ 3, r = 2 needs injectivity; Thm 6.4 at λ = 2 needs 3 ≤ (m+1)−3, i.e. m ≥ 5 | Pass |
| 1.6 general position | m = 5; m = 4 (control) | 2·2+1 = 5 ≤ 5; at m = 4 fails, and s = 2 < 3 excludes it already | Pass |
| 1.6 frame fibre `O(m−2)/O(m−3)` | m = 5, 6; m = 4 (control) | S², S³, simply connected; S¹ at m = 4, π₁ = ℤ, excluded by m ≥ 5 | Pass |
| 1.6 complement condition | m = 5, 6 | attaching circle has codimension m−1 = 4, 5 ≥ 3, so π₁ of the incoming level is unchanged; Q has codimension 2, where removal can change π₁ (S¹ ⊂ S³ gives ℤ) | Pass |
| Check, six-dimensional level | cobordism dimension 7 | indices after trading 2…5; pair (2,3) has (2,4); 1.5 fails on dim P = 2; codimension of the circle 6−1 = 5; fibre O(4)/O(3) ≅ S³ | Pass |
| Layer 1 prose at :734–735 | m = 5 | (2, m−2) = (2,3), 2+3 = 5 | Pass |
| Downstream bullet, PositiveScalarCurvature | main PositiveScalarCurvature README:778–785 | its n is the level dimension, pair (2, n−2), circle of codimension n−1 ≥ 5 for n ≥ 6: equals 1.6 at m = n ≥ 6 | Pass |

**Ownership move recorded.** 1.6 now states the index-two Whitney step in every level dimension m ≥ 5, where it previously stated m = 5 only. The product theorem 1.7 needs it for cobordism dimension ≥ 7 (Milnor's Theorem 7.8 cancels (2,3) pairs there, and 1.5 does not cover dim P = 2), so before this change 1.7 had an unowned step. PositiveScalarCurvature on main (README:779) says it "own[s] the index-two complement condition" for n ≥ 6; it consumes 1.2–1.6 and is therefore later than this roadmap, so this roadmap cannot cite it and the notion correctly moves down to 1.6. The Downstream bullet at :3279–3281 says so. PositiveScalarCurvature's :778 and :808 citations of "§1.6's five-dimensional level" still resolve (1.6 names the case m = 5); its "own" sentence at :779 becomes a citation of 1.6 in that roadmap's next revision.

**Cross-roadmap citations and overlaps.**
- The heading of 1.6 changed. `roadmaps grep` for its old anchor finds no match on main or at any open head; the only citations of "HomotopySpheres §1.6" are PositiveScalarCurvature README:778 and :808, both by section number.
- `scratch/overlaps.md`: #284 conflicts in both files and is the baseline this pull request carries, as its description says; no id cited here is dropped by an open pull request; none is defined only by an unnamed revision. `scratch/citations.md`: nothing unresolved.
- The seeded sample falls in the changed text at 1.4 and 1.6 only (rows above); the other sampled targets are untouched and carry the previous report's results.

## Not verifiable

- Nothing in the changed passages. The items of the previous report (Toda, Gray, Fomenko–Fuchs, Browder, Bott, Smale, James, Wall: no legal copy found) concern untouched text and stand as recorded there.

## Source issues

- none
