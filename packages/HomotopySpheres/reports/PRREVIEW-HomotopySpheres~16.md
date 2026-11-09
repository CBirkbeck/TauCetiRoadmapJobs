# Review of HomotopySpheres (pull request #1287 at 29eac99)

**Verdict:** needs changes

This is an incremental re-review of the 7 changed lines since `ec8d4d7`. The only change in the folder is the Kervaire–Milnor entry of the References (`README.md`:3249–3255). The pull-request description also changed: its depends-on list and merge-order paragraph now name #1652 and #1663 (AlgebraicTopology). Two findings of the last review are repaired: R06 by the README change, R01 by the description. The other four are carried below, renumbered: old R02 → R01, R03 → R02, R04 → R03, R05 → R04. Main is now `3f7196b`. Line numbers of other roadmaps refer to their README at the head named.

## R01 (P2) — BordismFormalGroups at #1854, #1807 and #1808 still owns the James construction and the Toda brackets that 3B and 3C.3 own

**Location.** `TauCetiRoadmap/HomotopySpheres/README.md`:1018–1068 (3B.1–3B.6), :1203 (3C.3), and :3187–3188: "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets".

**Claim.** Not repaired; the description does not mention these pull requests. On main the sentence at :3187 is true: BordismFormalGroups README:331 and :668 consume this roadmap. #1854 moved to `b66c1e8`, and BordismFormalGroups still owns both objects there and no longer mentions HomotopySpheres. If #1854 (or #1807 or #1808) merges, two roadmaps own each object and :3187–3188 becomes false.

**Witness.** BordismFormalGroups at #1854 `b66c1e8`: README:1017 "Own the three-fold Toda brackets of pointed spaces"; README:1564 "Own the James construction". Same at #1807 `9562289` (:999, :1509) and #1808 `43a6b84` (:944, :1475).

**Repair.** Unchanged. Keep this roadmap as the owner, as main has it. Record in the description that #1854, #1807 and #1808 must turn F4's and F6.2's "Own" sentences into citations of 3C.3 and 3B before they merge. The alternative is a recorded human decision that moves ownership, with 3B.1–3B.3 and 3C.3 rewritten as citations.

## R02 (P2) — Three later open roadmaps still own objects this roadmap owns; #1742 now cites §3B.6 but still owns 3B.1–3B.4

**Location.** README 3B.1–3B.4 (:1018–1059), 4A.1 (:1437), 4B.1–4B.8 (:1578–1672), 7B.2–7B.4 (:2446–2474).

**Claim.** Partly repaired, on the other side only. GeneralAlgebraicKTheoryPartII (#1742, now `ca44359`) dropped its stable James splitting (old 4.30c) and consumes §3B.6. Its §4.30b still defines the reduced product J(W), its word filtration with quotients W^∧r, the James map and J(W) ≃ ΩΣW. Those are 3B.1–3B.4, and #1742 does not cite them. DGFloerPartII (#1799 `0cb1f18`) and GeometryOfNumbersAndQuadraticArithmetic (#851 `3b084ef`) are unchanged, with 0 mentions of HomotopySpheres. All three come later in `ORDER.txt` (positions 333, 46, 55; HomotopySpheres is 45).

**Witness.** #1742 README:1212 "### 4.30b The James reduced product"; README:1235 names its own `JamesReducedProduct.exists_jamesMap_homotopyEquiv`. #1799 README:1330, :1384, :1442 (4.2a–4.2c). #851 README:23 ("quadratic L-groups of `ℤ`"), :2718 (6.8 Formations).

**Repair.** Name #1742, #1799 and #851 in the description as consumers whose sections must become citations before they merge. For #1742, §4.30b becomes a citation of 3B.1–3B.4, keeping in one clause only what 3B does not state. For #1799, §§4.2a–4.2c become citations of 4A.1 and 4B.1–4B.8. For #851, §6.8 becomes a citation of 7B.2–7B.4. The alternative is a recorded human decision for the reverse settlement.

## R03 (P3) — GeometricTopology §1.4 is cited for orientation-preserving associativity, which only #903 states, and the description does not name #903

**Location.** README:392–395: "§1.4 … proves that the native sum of connected oriented summands is associative up to orientation-preserving diffeomorphism". README:739–740: "§1.4 states associativity up to orientation-preserving diffeomorphism". Also :96, :721, :732, :852.

**Claim.** Not repaired. Main's GeometricTopology (`3f7196b`) has no §1.4: `grep '^### 1\.'` finds no heading. Two open revisions define §1.4, and only #903 (this author's, `5859c0d`) states the orientation-preserving form. The description's new depends-on list and merge-order paragraph add #1652 and #1663, but neither #903 nor #1797.

**Witness.** GeometricTopology at #903 `5859c0d` README:956: "**Associativity** up to orientation-preserving diffeomorphism". At #1797 `c62aafd` README:734: "Prove **associativity** `(M # N) # P ≃ M # (N # P)`", with no orientation clause. The merge-order paragraph runs "#1077 → #1652 → #948 → #1663 → #942 → this pull request".

**Repair.** Add #903 to the depends-on list and the merge-order paragraph, before this pull request; #1797 cannot be a supplier. The alternative is to prove associativity up to orientation-preserving diffeomorphism in 2.2 on `TauCeti.OrientedConnectedSum`, citing Kervaire–Milnor Lemma 2.1, p.505 (`kervairemilnor1963` lines 70–72).

## R04 (P3) — The branch pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`; the README and the import are written against main's `2fd255d` and `1b1ccf4`

**Location.** `lake-manifest.json` (unchanged); README:332–388 and 2.2 (:719–741), which name `TauCeti.OrientedConnectedSum`, `…nonempty_diffeomorph_connectedSum` and `TauCeti.ConnectedSum.orientation`; `Suggested.lean`:2–3 and :9–11.

**Claim.** Not repaired. At the branch pin, Tau Ceti has no `Geometry/Manifold/Orientation/` directory and no connected-sum file. So the declarations that 2.2 consumes do not exist at the pin this branch builds against. They all exist at main's pin `2fd255d` (checked in the last review: `ConnectedSum/Oriented.lean`:143, :208, :222, :295; `ConnectedSum/Orientation.lean`:250).

**Witness.** `lake-manifest.json` pins TauCeti `a91d3aa…` and mathlib `6b7abb3…`; `git show origin/main:lake-manifest.json` pins `2fd255d…` and `1b1ccf4…`. `grep -rl OrientedConnectedSum .lake/packages/TauCeti/TauCeti` finds nothing.

**Repair.** Unchanged. Merge main when rebasing, so that the manifest pins `2fd255d`/`1b1ccf4`, and rebuild. Then replace `Suggested.lean`:3 by `import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` and delete the workaround sentence at :9–11.

## Previous findings

- R01 — repaired: the merge-order paragraph now reads "#1077 (IndexTheory) → #1652 (AlgebraicTopology) → #948 …". At #1652 `456e2cb`, README:655 maps "Stage 4 item 8" to §4.8 (:1451), and the README no longer hands the coreflection to HomotopySpheres.
- R02 — not repaired: README:3187–3188 is unchanged, and #1854 `b66c1e8` README:1017 and :1564 still say "Own". Carried as R01.
- R03 — partly repaired: #1742 `ca44359` dropped its stable James splitting and consumes §3B.6. Its §4.30b still owns J(W) and J(W) ≃ ΩΣW, and #1799 and #851 are unchanged. Carried as R02.
- R04 — not repaired: "§1.4 states associativity up to orientation-preserving diffeomorphism, and it is consumed in that form" (README:739–740). The description names neither #903 nor #1797. Carried as R03.
- R05 — not repaired: `lake-manifest.json` still pins `a91d3aa`/`6b7abb3`. `Suggested.lean`:9–11 still reaches the oriented-atlas declarations "through `TauCeti.Geometry.Diffeomorphism.Disc`". Carried as R04.
- R06 — repaired: README:3252–3253 reads "Theorem 3.1 and Bott's table of `π_(n−1)(SO)`, p.508, with the proof of Theorem 3.1, pp.508–509". `kervairemilnor1963` line 211, on p.509, ends that proof.

## Verified sound

**Gate and dependency check** (my runs at `29eac99`):

```text
gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 237 roadmaps, 2309 edges, 0 problem(s)
```

- The worker's gate at this head also reports `build=0 OK`. There is no UPWARD or CYCLE line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HomotopySpheres'` is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- The open suppliers are earlier in `ORDER.txt`: IndexTheory 10, StringOrientation 11, TangentialBordism 14. AlgebraicTopology is on main, and #1652 is this author's revision of it, now named in the merge-order paragraph.

**Elaboration and signatures** (branch pins):
- `lake env lean` on `TauCetiRoadmap/HomotopySpheres/Suggested.lean` exits 0. It gives 16 warnings, all `declaration uses 'sorry'` (lines 96–234), and nothing else.
- A scratch copy with `#check @name` for all 19 declarations elaborates with exit 0. After whitespace normalisation and removing the namespace prefix, each elaborated type equals its entry in `signatures.md`: 19 of 19, checked by script. The other two entries there are docstring fragments that the worker's script misread.
- Each theorem carries its hypotheses in its own signature. Examples: `[T2Space M] [SecondCountableTopology M] [CompactSpace M] [IsManifold (𝓡 6) ∞ M]` on `smoothPoincareSix_oriented` and `nonempty_diffeomorph_sphere_six`; `5 ≤ n`, `[SimplyConnectedSpace W]` and `IsClosed ↑M₀` on `exists_diffeomorph_prod_Icc_of_hCobordism`.
- `Suggested.lean` and `metadata.toml` are unchanged since `912f30d`, so the padding probe of PRREVIEW-HomotopySpheres~14 still applies: no declaration closes in one tactic.

**The changed passage, against `kervairemilnor1963`.**
- Line 160 is the p.508 running head and line 197 the p.509 running head (page marker at line 196).
- Theorem 3.1 is at line 172 (p.508). The proof starts at line 174, and the obstruction class in `H^n(Σ; π_(n−1)SO)` is at lines 174–177 (p.508). Bott's table is at lines 178–182 (p.508), and Case 1 at line 183 (p.508). Case 3 continues at lines 198–209, and line 211 closes the proof (p.509). So "p.508 … proof … pp.508–509" is exact.
- Lemmas 2.1–2.4, §4, the Πₙ table and §§5–6 in the same entry are unchanged and were verified in the last review.

**Text that cites the changed entry.**
- 8.2 (README:2618–2621) cites "proof of Theorem 3.1, p.508" for the obstruction class: lines 174–177, p.508. Correct.
- 8.3 (README:2636) cites "p.508, Case 1": line 183, p.508. Correct.
- 8.3 is the only target of the seeded sample that depends on the change. The other 14 sampled targets are outside the changed lines, and their source checks from the full review stand.

**R01's resolution.**
- Main's AlgebraicTopology Stage 4 ends at item 7 (README:817). At README:567, main hands the coreflection to "HomotopySpheres §3A.1".
- At #1652 `456e2cb`, the AlgebraicTopology README maps "Stage 4 items 1–8" to §§4.1–4.8 (:655). Its §4.8 *Compact generation and the pointed adjunction* (:1451) has everything this README cites as item 8: the coreflection k right adjoint to the inclusion, the counit homeomorphism for Hausdorff CW complexes, convenient products, smash and reduced suspension, and the suspension–loop adjunction. It mentions HomotopySpheres 0 times. Once #1652 merges, the object has one owner, and this README's 29 citations resolve.
- #1663 merged on 2026-11-09 into #1652's branch, not into main: its merge commit is #1652's head `456e2cb`. So the separate #1663 entry in the description is already satisfied, and #1652 alone carries the item.

**Cross-roadmap citations re-resolved today.** Main moved from `4daf5e1` to `3f7196b` (23 commits). None of them touches AlgebraicTopology, GeometricTopology, BordismFormalGroups, TopologicalKTheory, CharacteristicClasses or HomotopySpheres. I re-read these heads: #1652 `456e2cb`, #903 `5859c0d`, #1797 `c62aafd`, #1854 `b66c1e8` (newer than the index's `a7b81af`), #1807 `9562289`, #1808 `43a6b84`, #1742 `ca44359`, #1799 `0cb1f18`, #851 `3b084ef`.
- #1742 now cites "HomotopySpheres §3B.6" nine times. §3B.6 exists at this head (README:1068) and states the splitting #1742 consumes (README:196–198).
- Overlap facts (`scratch/overlaps.md`): no id is dropped. GeometricTopology §1.4 is defined only by #903 and #1797 (R03). #284 conflicts, and the description says this pull request carries #284's baseline forward.

**Ownership.** The change adds no object.

**Adversarial table.** The first six rows are computed today. The rest are carried from PRREVIEW-HomotopySpheres~15 and ~14 for statements the diff leaves untouched.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| References: KM Thm 3.1 and Bott's table p.508; proof pp.508–509 | running heads at lines 160, 197; theorem line 172; proof lines 174–211 | statement p.508; table p.508; proof begins p.508 (174) and ends p.509 (211) | Pass (old R06 repaired) |
| Bott's table as cited: `π_(n−1)SO` by `n mod 8` | `n = 8, 9, 10, 3, 4, 5, 6, 7`; `n = 1` | `π₇ = ℤ, π₈ = ℤ/2, π₉ = ℤ/2, π₂ = 0, π₃ = ℤ, π₄ = π₅ = π₆ = 0`, which matches the row `ℤ, ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0`; at `n = 1`, `π₀SO = 0 ≠ ℤ/2`, outside the table's `n ≥ 2` and excluded by 8.3's `n ≥ 5` | Pass |
| 8.2 / 8.3 locators into the changed entry | obstruction class; Case 1 | lines 174–177 and 183, both on p.508 | Pass |
| AlgebraicTopology Stage 4 item 8 | main `3f7196b`; #1652 `456e2cb` | main: items 1–7 and handoff to HS §3A.1 (:567); #1652: §4.8 (:1451), map (:655), 0 HS mentions; named in merge order | Pass (old R01 repaired) |
| Owners of 3B (James) and 3C.3 (Toda) | main; #1742; #1854, #1807, #1808 | main: HS owns, BFG consumes; #1742: owns J(W) and J(W)≃ΩΣW and cites 3B.6 only; BFG: "Own" at all three heads | R01, R02 |
| GeometricTopology §1.4 associativity | main; #903; #1797 `c62aafd`; `(CP² # CP²) # (−CP²)` | main: no §1.4; #903 :956 orientation-preserving; #1797 :734 bare `≃`; signatures `1 + 1 − 1 = 1` on both sides | content Pass; supplier R03 |
| 2.2: independence, commutativity and sphere identity orientation-preserving | `CP² # CP²`, `CP² # (−CP²)`, `CP² # S⁴` (r15) | σ: commutativity `2 = 2`, `0 = 0`; sphere identity `1 + 0 = 1` | Pass |
| 6C.3 Kervaire–Milnor §§5–6, pp.512–526 | heading lines 343, 586, 842 (r15) | p.512, p.519, p.526 | Pass |
| 8.2 obstruction group `H^n(Σ; π_(n−1)SO) ≅ π_(n−1)SO` | `S⁶, S⁸, S⁹` (r14) | `π₅SO = 0`, `π₇SO = ℤ`, `π₈SO = ℤ/2` | Pass |
| 8.2 `coker J_n ≅ ker(A_n → π_(n−1)SO)` | `n = 6, 7, 8` (r14) | coker `ℤ/2, 0, ℤ/2`; image in `π₇SO` is `240ℤ` | Pass |
| 8.3 `π_(n−1)SO = 0` exactly for `n ≡ 3,5,6,7 (mod 8)` | `n = 5..12` (r14) | zero at `n = 5, 6, 7, 11` | Pass |
| `sphere_parallelizable_iff` | `n = 1, 2, 3, 7, 15` (r14) | both sides true at 1, 3, 7; false at 2, 15 | Pass |
| `exists_diffeomorph_prod_Icc_of_hCobordism` | `S⁵×I`, `D⁶`, `∅`, punctured `S⁵×I`, `n = 4` (r14) | as there | Pass |
| `nonempty_orthogonalGroup_bottPeriodicity`, Bott entries 2–8 | `(k,n) = (0,11), (3,14), (6,17)`; `n = 4..10` (r14) | as there | Pass |
| `sphere_homotopyGroup_*Stem`, 9.2, 9.4 | `π₁₀S⁶ = 0`, `n = k+1` sharpness, `ℤ/240` (r14) | as there | Pass |
| `PreservesOrientedAtlases`, `smoothPoincareSix_oriented`, `nonempty_diffeomorph_sphere_six` | `S⁶`, reflected atlas, `S³×S³`, `CP³` (r14) | as there | Pass |
| 3C.4, 3C.5, 4B.6, 2.3, 5.0b, 1.6, 6B, 7B, 8.4/9.5, 9A.1–9A.4 | carried (r14) | as there | Pass |

## Not verifiable

- **Bott 1959** (4B.6–4B.8): paywalled (JSTOR).
- **Gray 2001**, **Fomenko–Fuchs 2016**, **Toda 1962** (3C.4, 9.2–9.4, 9A.1; the README marks Toda uncertified): paywalled or print only.
- **Browder 1969** (8.4, 9.5): JSTOR only.
- **Milnor, *Topology from the Differentiable Viewpoint***, **Adams–Atiyah 1966**, **Wall 1999**, **Milnor, *Morse Theory***: no legal copy found.
- **Elaboration at main's pins**: Lean runs only in this worktree, which pins `a91d3aa`. At that pin the connected-sum declarations of 2.2 do not exist (R04).

## Source issues

- none
