# Review of HomotopySpheres (pull request #1287 at ec8d4d7)

**Verdict:** needs changes

This is an incremental re-review of the 24 changed lines since `912f30d`. All of them are in `README.md`: the GeometricTopology supplier contract (:391–398), the associativity paragraph of 2.2 (:732–741), the Kervaire–Milnor page range in 6C.3 (:2336) and the Kervaire–Milnor References entry (:3249–3254). `Suggested.lean`, `metadata.toml` and the pull-request description are unchanged. None of the five findings of the last review is repaired. The new text of 2.2 and of the supplier contract is mathematically correct. It makes R04 sharper, though: the cited claim now holds only at one of the two open GeometricTopology revisions. The extended References entry adds one P3 locator slip (R06). Main is now `4daf5e1`. Line numbers of other roadmaps refer to the README at the head named.

## R01 (P2) — The compact-generation supplier item still exists in no AlgebraicTopology on main, and the merge-order paragraph names no revision that defines it

**Location.** `TauCetiRoadmap/HomotopySpheres/README.md`:864–868: "the pointed convenient category … are AlgebraicTopology Stage 4 item 8, *Compact generation and the pointed adjunction*". 28 more lines cite "Stage 4 item 8", 29 in all.

**Claim.** Carried from the last review and not repaired. Neither the README nor the description changed here. On main (`4daf5e1`, no AlgebraicTopology commit since the last round), AlgebraicTopology's Stage 4 stops at item 7. Its README:567, :768 and :1933 give the coreflection to "HomotopySpheres §3A.1", while this README gives it back to AlgebraicTopology. So the object has no owner. The item is defined at #1652 `287181d` (`### 4.8 Compact generation and the pointed adjunction`, :1396) and at #1663, which is now at `bc3d150` (item 8, :1069). Both are this author's revisions. The other-author revisions #1797 (`872449f`, Stage 4.5, with a mapping line at :592) and #1854 (`59d8c40`, a compact-generation paragraph in Stage 4 at :1015, no mapping line for "Stage 4 item 8") cannot be suppliers.

**Witness.** Main AlgebraicTopology README:567: "with kZ using only HomotopySpheres §3A.1's coreflection". Merge-order paragraph: "#1142 → #866 → #1077 → #948 → #942 → this pull request".

**Repair.** Add #1652 or #1663 to the merge-order paragraph, before this pull request; no README edit is needed. Otherwise, state the coreflection as 3A.1's own target, as main's AlgebraicTopology README:567 expects.

## R02 (P2) — Open #1854 still gives BordismFormalGroups the James construction and Toda brackets that 3B and 3C.3 own

**Location.** README:1018–1068 (3B.1–3B.6) and :1203 (3C.3). README:3187–3188: "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4".

**Claim.** Not repaired. On main the sentence is true: BordismFormalGroups README:331 and :668 cite this roadmap. At #1854's new head, BordismFormalGroups still owns both objects. The drafts #1807 (`6d06f1d`) and #1808 (`55323ac`) do the same. If #1854 merges, the two roadmaps each own the objects and each hand them to the other.

**Witness.** BordismFormalGroups at #1854 `59d8c40`: README:1017 "Own the three-fold Toda brackets of pointed spaces"; README:1564 "Own the James construction". #1807 README:999 and :1509 say the same.

**Repair.** Unchanged. Keep this roadmap as the owner, as main has it. Record in the description that #1854 (and #1807, #1808) must turn F4's and F6.2's "Own" sentences into citations of 3C.3 and 3B before they merge. The alternative is a recorded human decision that moves ownership, with 3B.1–3B.3 and 3C.3 rewritten as citations.

## R03 (P2) — Three later open roadmaps still own objects this roadmap owns

**Location.** README 3B.1 (:1018), 3B.6 (:1068); 4A.1 (:1437), 4B.1–4B.8 (:1578–1672); 7B.2–7B.4 (:2446–2474).

**Claim.** Not repaired. All three roadmaps are later in `ORDER.txt` (HomotopySpheres 45, DGFloerPartII 46, GeometryOfNumbersAndQuadraticArithmetic 55, GeneralAlgebraicKTheoryPartII 333). None of them cites this roadmap.
- **GeneralAlgebraicKTheoryPartII** (#1742 `3f10248`): `### 4.30b The James reduced product` (:1208), `### 4.30c The stable James splitting` (:1243).
- **DGFloerPartII** (#1799, checkout at `0cb1f18`): `### 4.2a Stable orthogonal groups and the finite-to-stable range` (:1330), 4.2b (:1384), `### 4.2c Index bounds, the Bott maps and real Bott periodicity` (:1442).
- **GeometryOfNumbersAndQuadraticArithmetic** (#851 `3b084ef`): README:23 owns "Wall's nonsingular quadratic forms and formations … quadratic L-groups of `ℤ`"; `### 6.8 Formations` (:2718).

**Witness.** `grep -c HomotopySpheres` gives 0 for each of the three READMEs at those heads.

**Repair.** Unchanged. Name #1742, #1799 and #851 in the description as consumers whose §§4.30b–c, 4.2a–4.2c and 6.8 must become citations of 3B.1/3B.6, 4A.1/4B.1–4B.8 and 7B.2–7B.4. The alternative is a recorded human decision for the reverse settlement.

## R04 (P3) — GeometricTopology §1.4 is cited for orientation-preserving associativity, which only #903 states, and #903 is not named

**Location.** README:392–395: "§1.4 … proves that the native sum of connected oriented summands is associative up to orientation-preserving diffeomorphism". README:739–740: "§1.4 states associativity up to orientation-preserving diffeomorphism, and it is consumed in that form". Also :96, :721, :732, :852.

**Claim.** Not repaired, and the change narrows it. Main's GeometricTopology has no §1.4: its Layer 1 is the single section at README:177. Of the two open revisions that define §1.4, only #903 (this author's, now at `5859c0d`) states associativity up to *orientation-preserving* diffeomorphism. #1797 (another author's, `872449f`) states it as a bare diffeomorphism. So the new sentence at :739–740 is true only once #903 merges, and the merge-order paragraph still names neither revision.

**Witness.** GeometricTopology at #903 `5859c0d` README:956: "**Associativity** up to orientation-preserving diffeomorphism". At #1797 `872449f` README:734: "Prove **associativity** `(M # N) # P ≃ M # (N # P)` for connected oriented summands", with no orientation clause.

**Repair.** Add #903 to the merge-order paragraph, before this pull request. #1797 cannot be a supplier. The alternative is to prove associativity up to orientation-preserving diffeomorphism in 2.2 on `TauCeti.OrientedConnectedSum`, citing Kervaire–Milnor Lemma 2.1, p.505 (`kervairemilnor1963` lines 70–72).

## R05 (P3) — The branch pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`; the README and the import are written against main's `2fd255d` and `1b1ccf4`

**Location.** `lake-manifest.json` (unchanged); README:332–388; README:719–736 (the changed 2.2 names `TauCeti.OrientedConnectedSum`, `…nonempty_diffeomorph_connectedSum` and `TauCeti.ConnectedSum.orientation`); `Suggested.lean`:2–3 and :9–11.

**Claim.** Not repaired. At the branch pin `a91d3aa` Tau Ceti has no `Geometry/Manifold/Orientation/` directory, and no `ConnectedSum` file at all. So every connected-sum declaration that 2.2 consumes is missing at the pin this branch builds against. At main's pin `2fd255d` all of them exist: `ConnectedSum/Oriented.lean`:143 (`OrientedConnectedSum`), :208, :222, :295, and `ConnectedSum/Orientation.lean`:250.

**Witness.** `lake-manifest.json` pins TauCeti `a91d3aa…`; `git show origin/main:lake-manifest.json` pins `2fd255d…`/`1b1ccf4…`. At the branch pin, `grep -rl OrientedConnectedSum .lake/packages/TauCeti/TauCeti` finds no connected-sum file.

**Repair.** Unchanged. Merge main when rebasing, so that the manifest pins `2fd255d`/`1b1ccf4`, and rebuild. Then replace `Suggested.lean`:3 by `import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` and delete the workaround sentence at :9–11.

## R06 (P3) — The new References locator puts the whole proof of Kervaire–Milnor Theorem 3.1 on p.508; it ends on p.509

**Location.** README:3252: "Theorem 3.1, its proof and Bott's table of `π_(n−1)(SO)`, p.508".

**Claim.** Theorem 3.1 and Bott's table are on p.508, but the proof continues onto p.509 (Case 3 and its conclusion). The parts the README uses (8.2's obstruction class and 8.3's Case 1) are on p.508. So the error is only in the References locator, which this change introduced.

**Witness.** `kervairemilnor1963` line 197 is the p.509 running head; line 211, on p.509, concludes the proof of Theorem 3.1. Line 172 (theorem) and lines 174–184 (obstruction class, table, Case 1) are on p.508.

**Repair.** Write "Theorem 3.1 and Bott's table of `π_(n−1)(SO)`, p.508, with its proof, pp.508–509". The alternative is "the obstruction class and Case 1 of its proof, p.508".

## Previous findings

- R01 — not repaired: "the pointed convenient category … suspension–loop adjunction are AlgebraicTopology Stage 4 item 8" (README:864–868). The merge-order paragraph still names no AlgebraicTopology revision.
- R02 — not repaired: "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4" (README:3187–3188). #1854 `59d8c40` README:1017 and :1564 still say "Own".
- R03 — not repaired: 3B.1, 3B.6, 4A.1, 4B.1–4B.8 and 7B.2–7B.4 are unchanged. #1742, #1799 (`0cb1f18`) and #851 still own the same objects without citing this roadmap.
- R04 — not repaired: "§1.4 states associativity up to orientation-preserving diffeomorphism, and it is consumed in that form" (README:739–740). Only #903 states this, and the merge-order paragraph names neither #903 nor #1797.
- R05 — not repaired: `lake-manifest.json` still pins `a91d3aa`/`6b7abb3`. `Suggested.lean`:9–11 still says the declarations "are reached through `TauCeti.Geometry.Diffeomorphism.Disc`".

## Verified sound

**Gate and dependency check** (my runs at `ec8d4d7`):

```text
depcheck: 238 roadmaps, 2320 edges, 0 problem(s)
gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

- The worker's gate at this head also reports `build=0 OK`. No UPWARD or CYCLE line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HomotopySpheres'` is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- The open suppliers are still earlier in `ORDER.txt`: IndexTheory 10, StringOrientation 11, TangentialBordism 14.

**Elaboration and signatures** (branch pins `a91d3aa`/`6b7abb3`):
- `lake env lean` on `Suggested.lean` exits 0 with 16 warnings, all `declaration uses 'sorry'` (lines 96–234), and nothing else.
- A scratch copy with `#check @name` for all 19 declarations elaborates with no error. With the namespace prefix removed, each elaborated type is character-for-character equal to its entry in `signatures.md`: 19 of 19, checked by script. The other two entries there are docstring fragments the worker's script misread.
- `Suggested.lean` is unchanged since `912f30d`, so the last review's padding probe still applies: no declaration closes in one tactic.

**Changed passages, against the sources and suppliers.**
- **2.2 and the supplier contract, Kervaire–Milnor.** `kervairemilnor1963` lines 70–72 (p.505) state Lemma 2.1: the sum is well defined, associative and commutative up to orientation-preserving diffeomorphism, with Sⁿ as identity. Lines 59–67 give the convention: the first disc preserves orientation, the second reverses it, and the sum is oriented compatibly with both summands. This matches 2.2's "at the level of oriented diffeomorphism" and `TauCeti.ConnectedSum.orientation`.
- **2.2, "the pinned theorems".** At main's Tau Ceti pin, `OrientedConnectedSum.nonempty_diffeomorph_connectedSum` (Oriented.lean:208), `nonempty_diffeomorph_comm` (:222) and `nonempty_diffeomorph_sphere` (:295) are all `Nonempty (… ≃ₘ^∞ …)` with no orientation clause, so "assert only that diffeomorphisms exist" is accurate. `grep assoc` in `ConnectedSum/` at that pin finds nothing, which confirms README:364 ("Tau Ceti has no associativity").
- **GeometricTopology §1.4 at #903 `5859c0d`** (:939–972). Its *Needs:* line lists `TauCeti.ConnectedSum` and `TauCeti.OrientedConnectedSum`. It has the cut-and-glue comparison with the gluing model (:951–955) and orientation-preserving associativity (:956). The supplier sentence at :391–396 matches it item by item. The re-wrapped clauses also resolve: main's GeometricTopology README:546 (Layer 5, general-dimension framed sphere surgery) and :930 (the smoothing-and-triangulation comparison). #903 README:776–778 maps that item 1 to its Layer 11.3.
- **6C.3, §§5–6, pp.512–526.** In `kervairemilnor1963`, §5 starts at line 343 (p.512, running head line 311), §6 at line 586 (p.519) and §7 at line 842 (p.526, line 819). The old upper bound p.521 fell inside §6.
- **References.** Theorem 1.1 is at line 25 (p.504) and Theorem 3.1 at line 172 (p.508). Bott's table is at lines 178–181 (p.508). §4 runs over lines 237–342 (pp.510–512). Lemma 4.2 is at line 257 (p.510) and Lemma 4.5 at line 292 (p.511). The Remarks after Theorem 4.1 are at line 316 (p.512), and the Πₙ table at lines 320–327 (p.512). §§5–6 are as above. The one exception is R06.
- **Text that depends on the change.** 2.4's associativity Check (:842), the Layer 2 Dependencies (:852), 2.3, 10.2 and 10.3 do not use the orientation choice that the change moved to §1.4. 2.3 uses Σ # (−Σ) and W_Σ; 10.3 composes with a reflection of S⁶. None of the 15 seeded-sample targets lies in the changed lines. Their source checks from the full review stand.

**Adversarial table.** The first four rows are computed today; the rest are carried from the review of `912f30d` (PRREVIEW-HomotopySpheres~14).

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Supplier contract / 2.2: §1.4 gives associativity up to orientation-preserving diffeomorphism | GT main, #903, #1797; `(CP² # CP²) # (−CP²)` vs `CP² # (CP² # (−CP²))`; `n = 1` | main: no §1.4. #903 :956: orientation-preserving. #1797 :734: bare `≃`. Signatures `1+1−1 = 1` on both sides, so an orientation-reversing identification (σ = −1) is impossible; the orientation-preserving form is the one that holds and the one Θₙ needs. `n = 1`: three circles give `S¹` either way | content Pass; supplier R04 |
| 2.2: independence, commutativity and sphere identity can be chosen orientation-preserving | `CP² # CP²`, `CP² # (−CP²)`, `CP² # S⁴`; contrast `nonempty_diffeomorph_neg` | σ: comm `2 = 2` and `0 = 0`; sphere identity `1 + 0 = 1`, so nothing obstructs. Excluded case: `CP² # CP²` (σ 2) against `(−CP²) # (−CP²)` (σ −2) admits no orientation-preserving map, and 2.2 rightly omits `neg` from "the pinned theorems" (its list at :730) | Pass |
| 6C.3 Kervaire–Milnor §§5–6, pp.512–526 | heading lines 343, 586, 842 | p.512 (§5), p.519 (§6), p.526 (§7 starts); old bound 521 cut §6 at lines 644–679 | Pass |
| References, KM Theorem 3.1 "its proof, p.508" | lines 172–211 | statement p.508; proof lines 174–211, ending on p.509 (head line 197) | R06 |
| 8.2 obstruction group `H^n(Σ; π_(n−1)SO) ≅ π_(n−1)SO` | `S⁶, S⁸, S⁹` (r14) | `π₅SO = 0`, `π₇SO = ℤ`, `π₈SO = ℤ/2`; stable since `n−1 ≤ (n+1)−2` | Pass |
| 8.2 framings form a coset of `im J_n`; `coker J_n ≅ ker(A_n → π_(n−1)SO)` | `n = 6, 7, 8` (r14) | coker `ℤ/2, 0, ℤ/2`; `A₆ = ℤ/2`, `A₇ = 0`; image in `π₇SO` is `240ℤ` | Pass |
| 8.3 `π_(n−1)SO = 0` exactly for `n ≡ 3,5,6,7 (mod 8)` | `n = 1, 5..12` (r14) | zero at `n = 5, 6, 7, 11`; `n = 1` excluded by `n ≥ 5` | Pass |
| `sphere_parallelizable_iff` | `n = 0, 1, 2, 3, 7, 15` (r14) | both sides true at 1, 3, 7, false at 2, 15; `n = 0` excluded | Pass |
| `exists_diffeomorph_prod_Icc_of_hCobordism` | `S⁵×I`, `D⁶`, `∅`, punctured `S⁵×I`, `n = 4` (r14) | as there | Pass |
| `nonempty_orthogonalGroup_bottPeriodicity`, Bott entries 2–8 | `(k,n) = (0,11), (3,14), (6,17)`; `n = 4..10` (r14) | as there | Pass |
| `sphere_homotopyGroup_*Stem`, 9.2, 9.4 | `π₁₀S⁶ = 0`, `n = k+1` sharpness, `ℤ/240` (r14) | as there | Pass |
| `PreservesOrientedAtlases`, `smoothPoincareSix_oriented`, `nonempty_diffeomorph_sphere_six` | `S⁶`, reflected atlas, `S³×S³`, `CP³` (r14) | as there | Pass |
| 3C.4, 3C.5, 4B.6, 2.2–2.3, 5.0b, 1.6, 6B, 7B, 8.4/9.5, 9A.1–9A.4 | carried (r14) | as there | Pass |
| AlgebraicTopology compact-generation item | main, #1652, #1663, #1797, #1854 | to HomotopySpheres §3A.1 / §4.8 / item 8 / 4.5 with map / 4.5 without | R01 |
| 3B, 3C.3 owners | main; #1854, #1807, #1808 | HomotopySpheres owns / both own | R02 |

**Cross-roadmap citations re-resolved today.** Main moved from `39d3d60` to `4daf5e1` (33 commits), and none of them touches AlgebraicTopology, GeometricTopology, BordismFormalGroups, TopologicalKTheory or HomotopySpheres. I re-read these heads: #903 `5859c0d`, #1652 `287181d`, #1663 `bc3d150`, #1797 `872449f`, #1854 `59d8c40`, #1807 `6d06f1d`, #1808 `55323ac`, #1742 `3f10248`, #1799 `0cb1f18`, #851 `3b084ef`. The overlap facts are as `scratch/overlaps.md` says: no id dropped; GeometricTopology §1.4 is defined only by #903 and #1797 (R04); #284 conflicts, and the description states that this pull request follows it.

**Ownership.** The change adds no object. It moves the orientation-preserving form of associativity from 2.2's own work to GeometricTopology §1.4. That section owns it at #903, and Tau Ceti has no associativity at either pin.

## Not verifiable

- **Bott 1959** (4B.6–4B.8): paywalled (JSTOR).
- **Gray 2001**, **Fomenko–Fuchs 2016**, **Toda 1962** (3C.4, 9.2–9.4, 9A.1; the README marks Toda uncertified): paywalled or print only.
- **Browder 1969** (8.4, 9.5): JSTOR only.
- **Milnor, *Topology from the Differentiable Viewpoint***, **Adams–Atiyah 1966**, **Wall 1999**, **Milnor, *Morse Theory***: no legal copy found.
- **Elaboration at main's pins**: Lean runs only in this worktree, which pins `a91d3aa`. At that pin the connected-sum declarations of 2.2 do not exist (R05).

## Source issues

- none
