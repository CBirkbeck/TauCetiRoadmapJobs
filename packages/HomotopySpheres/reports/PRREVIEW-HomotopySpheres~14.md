# Review of HomotopySpheres (pull request #1287 at 912f30d)

**Verdict:** needs changes

Incremental re-review of the 20 changed lines since `08479cb` (README 8.2, 8.3, 3C.5 and References; one docstring of `Suggested.lean`). The two P3 findings of the last review (the Hatcher page and the Kervaire–Milnor locators) are repaired, and the repairs are correct. The five other findings are not repaired. The pull-request description and the five folders it depends on are unchanged, and I re-read the open heads involved today. Line numbers of other roadmaps are README lines at the head named; main is `39d3d60`.

## R01 (P2) — The compact-generation supplier item still exists at no AlgebraicTopology on main, and the merge-order paragraph names no revision that defines it

**Location.** `TauCetiRoadmap/HomotopySpheres/README.md`:866–870, "the pointed convenient category … are AlgebraicTopology Stage 4 item 8, *Compact generation and the pointed adjunction*", and 28 more lines citing "Stage 4 item 8" (29 in all, e.g. :128, :146, :210, :310, :324, :436, :874, :3203).

**Claim.** This is carried from the last review and is not repaired: the README and the description's merge-order paragraph are unchanged. On main, AlgebraicTopology's Stage 4 has only items 1–7 (README:505–817), and its README:567, :768 and :1933 give the coreflection to "HomotopySpheres §3A.1". This README gives it back to AlgebraicTopology Stage 4 item 8. So on main the object has no owner. The open heads:

| AlgebraicTopology text | compact generation |
| --- | --- |
| main `39d3d60` | none; handed to HomotopySpheres §3A.1 |
| #1652 `287181d` (this author's) | `### 4.8 Compact generation and the pointed adjunction` (:1375) |
| #1663 `2dc8cf2` (this author's) | Stage 4 item 8 (:1066) |
| #1797 `f2f59c7` (another author's) | Stage 4.5 (:141). README:541–542 maps "Stage 4 item 8, *Compact generation and the pointed adjunction*" to it (new since the last review) |
| #1854 `81fee5f` (another author's) | Stage 4.5 (:139), with no line for "Stage 4 item 8" |

**Witness.** Main AlgebraicTopology README:567: "with kZ using only HomotopySpheres §3A.1's coreflection". The merge-order paragraph is still "#1142 → #866 → #1077 → #948 → #942 → this pull request".

**Repair.** Add #1652 or #1663 (this author's AlgebraicTopology revisions, whose item 8 is the one cited) to the merge-order paragraph, before this pull request. Do not name #1797 or #1854: a revision of an existing roadmap by another author cannot be a supplier. No README edit is needed. If neither revision is to merge first, the only alternative is to state the coreflection as 3A.1's own target, as main's AlgebraicTopology README:567 expects.

## R02 (P2) — Open #1854 still gives BordismFormalGroups the James construction and Toda brackets that 3B and 3C.3 own

**Location.** README:1018–1068 (3B.1–3B.6) and 3C.3. README:3185–3188: "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4".

**Claim.** Not repaired. On main the README's sentence is true: BordismFormalGroups cites this roadmap in F4 (README:331) and F6.2 (README:668). But at its new head, #1854 still makes BordismFormalGroups the owner of both objects. The drafts #1807 (`62d686c`) and #1808 (`a96d197`) carry the same text. So if #1854 merges, there are two owners, each handing the object to the other.

**Witness.** BordismFormalGroups at #1854 (`81fee5f`): README:23 lists "the three-fold Toda brackets of pointed spaces" among what it owns; README:786 "Own the three-fold Toda brackets of pointed spaces"; README:1170 "Own the James construction". #1807 README:644 and :999 say the same.

**Repair.** #1854 is another author's revision of an existing roadmap, so it cannot become this roadmap's supplier. Keep this roadmap as the owner, as main has it. Record in the description that BordismFormalGroups at #1854 (and #1807, #1808) must turn F4's "Own the three-fold Toda brackets" and F6.2's "Own the James construction" into citations of 3C.3 and 3B before it merges. Alternatively, record a human's decision to move ownership, with 3B.1–3B.3 and 3C.3 then rewritten as citations.

## R03 (P2) — Three later open roadmaps still own objects this roadmap owns

**Location.** README 3B.1 (:1018) and 3B.6 (:1068); 4A.1 (:1437) and 4B.1–4B.8 (:1578–1672); 7B.2–7B.4 (:2446–2474).

**Claim.** Not repaired. Each of the three is later than HomotopySpheres in `ORDER.txt` (HomotopySpheres 45; DGFloerPartII 46, GeometryOfNumbersAndQuadraticArithmetic 55, GeneralAlgebraicKTheoryPartII 333). None of them cites this roadmap, and each still states the same objects:
- **GeneralAlgebraicKTheoryPartII** (#1742, `3f10248`): `### 4.30b The James reduced product` (:1208) and `### 4.30c The stable James splitting` (:1243).
- **DGFloerPartII** (#1799, new head `58c40ae`): README:23, "the stable orthogonal groups with real Bott periodicity, proved by Milnor's Morse theory"; `### 4.2a Stable orthogonal groups and the finite-to-stable range` (:1302), 4.2b (:1356), 4.2c "real Bott periodicity" (:1414).
- **GeometryOfNumbersAndQuadraticArithmetic** (#851, `3b084ef`): README:23, "Wall's nonsingular quadratic forms and formations … and the resulting simply connected quadratic L-groups of `ℤ`"; `### 6.8 Formations` (:2718).

**Witness.** `grep -c HomotopySpheres` gives 0 for each of the three READMEs at the heads above.

**Repair.** Unchanged. Name #1742, #1799 and #851 in the description as consumers. Their §§4.30b–c, 4.2a–4.2c and §6.8 must become citations of this roadmap's 3B.1/3B.6, 4A.1/4B.1–4B.8 and 7B.2–7B.4. Alternatively, record the reverse settlement as a human's decision.

## R04 (P3) — GeometricTopology §1.4, as cited, exists only at open revisions, and neither is named

**Location.** README:96, "the associativity of the native sum proved in GeometricTopology §1.4"; also :392, :721, :732, :737, :852.

**Claim.** Not repaired. Main's GeometricTopology has no §1.4: its Layer 1 is the single section at README:177. The cited §1.4 exists only at #903 (`aaa605b`, `### 1.4 Connected sum` at :937, **Associativity** at :954) and #1797 (`f2f59c7`, :708). The merge-order paragraph names neither.

**Witness.** The worker's overlap check lists GeometricTopology §1.4 (lines 96, 732) as defined only by #903 and #1797. `grep -n "1\.4"` on main's GeometricTopology README finds only `[Kir97, 1.41]`.

**Repair.** Add #903 (this author's) to the merge-order paragraph, before this pull request. #1797 is another author's revision and cannot be a supplier. The alternative is to prove associativity in 2.2 on Tau Ceti's `TauCeti.OrientedConnectedSum`.

## R05 (P3) — The branch pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`; the README and the import are written against main's `2fd255d` and `1b1ccf4`

**Location.** `lake-manifest.json` (unchanged); README:333, :359, :368 and the rest of :332–388; `Suggested.lean`:2–3 and :9–11.

**Claim.** Not repaired. The README cites `TauCeti/Geometry/Manifold/Orientation/OrientedAtlas.lean`, `ConnectedSum/Orientation.lean` and `Degree/Basic.lean`, which exist at main's Tau Ceti pin but not at this branch's pin. `Suggested.lean` reaches the oriented-atlas declarations through the re-export in `TauCeti.Geometry.Diffeomorphism.Disc`.

**Witness.** `lake-manifest.json` pins TauCeti `a91d3aa` and mathlib `6b7abb3`; main's manifest pins `2fd255d` and `1b1ccf4`. `ls .lake/packages/TauCeti/TauCeti/Geometry/Manifold/Orientation` fails (no such directory).

**Repair.** Unchanged. Merge main when rebasing so the manifest pins `2fd255d`/`1b1ccf4`, rebuild, replace `Suggested.lean`:3 by `import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas`, and delete the workaround sentence at :9–11.

## Previous findings

- R01 — not repaired: "the pointed convenient category … suspension–loop adjunction are AlgebraicTopology Stage 4 item 8, *Compact generation and the pointed adjunction*" (README:866–868); the merge-order paragraph is unchanged and names no AlgebraicTopology revision.
- R02 — not repaired: "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4" (README:3187–3188), while #1854 `81fee5f` README:786 and :1170 still say "Own".
- R03 — not repaired: 3B.1, 3B.6, 4A.1, 4B.1–4B.8 and 7B.2–7B.4 are unchanged, and #1742, #1799 (new head `58c40ae`) and #851 still own the same objects without citing this roadmap.
- R04 — not repaired: "the associativity of the native sum proved in GeometricTopology §1.4" (README:96); the merge-order paragraph names neither #903 nor #1797.
- R05 — not repaired: `lake-manifest.json` still pins `a91d3aa`/`6b7abb3`; `Suggested.lean`:9–11 still says the declarations "are reached through `TauCeti.Geometry.Diffeomorphism.Disc`".
- R06 — repaired: README:1385 "and §1.1, p.5, frames S¹, S³ and S⁷"; README:3293 "§1.1, p.5 (frames on S¹, S³, S⁷)"; `Suggested.lean`:115 "§1.1, p.5, for the frames". No "p.9" remains.
- R07 — repaired: 8.2 "(Kervaire–Milnor, proof of Theorem 3.1, p.508 …)" and "(Kervaire–Milnor, Lemma 4.5 and the Remarks after Theorem 4.1, pp.511–512 …)"; 8.3 "(Kervaire–Milnor, p.508, Case 1 …)".

## Verified sound

**Gate and dependency check** (my runs at `912f30d`):

```text
depcheck: 238 roadmaps, 2323 edges, 0 problem(s)
gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate at this head also reports `build=0 OK`. The dependency check has no UPWARD or CYCLE line. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HomotopySpheres'` is empty, and the folder holds only `README.md`, `Suggested.lean` and `metadata.toml`. The open suppliers are still earlier in `ORDER.txt`: IndexTheory 10, StringOrientation 11, TangentialBordism 14.

**Elaboration and signatures** (branch pins `a91d3aa`/`6b7abb3`).
- `lake env lean` on `Suggested.lean`: 16 warnings, all `declaration uses sorry` (lines 96–234), and nothing else.
- A scratch copy with `#check @name` for all 19 declarations elaborates with no error. With the namespace prefix removed, every elaborated type equals `signatures.md`; the other two entries there are docstring lines the worker's script misread. The only Lean change, the docstring of `sphere_parallelizable_iff`, leaves its type unchanged: `0 < n → ((∃ v, (∀ i, ContMDiff … ∞ fun x => ⟨x, v i x⟩) ∧ ∀ x, LinearIndependent ℝ fun i => v i x) ↔ n = 1 ∨ n = 3 ∨ n = 7)`.
- Padding probe: replacing every `sorry` by `first | rfl | simp | infer_instance | trivial | decide | exact inferInstance` leaves 16 errors (4 unsolved goals at lines 108, 122, 228 and 238; 12 instance failures). As in the last round, none is padding.

**Changed passages, against the sources.**
- 8.2, obstruction class. `kervairemilnor1963` lines 172–177 (printed p.508, under the page-5 marker; printed = PDF + 503): Theorem 3.1 and its proof. For a homotopy n-sphere, the only obstruction to trivialising `τ ⊕ ε` is a class in `H^n(Σ; π_(n−1)(SO_(n+1)))`, and the coefficient group is identified with the stable group. This matches the README's parenthetical. It is stated for homotopy spheres only, and 8.2 now says that the all-cycles form is its own target.
- 8.2, coset. Lines 292–295 (p.511): Lemma 4.5, `p(Σ)` is a coset of the subgroup `p(Sⁿ)`. Lines 316–319 (p.512): the Remarks after the proof of Theorem 4.1 identify `p(Sⁿ)` with `im J_n`. Together these give the README's "single coset of `im J_n`".
- 8.3. Lines 178–184 (p.508): the Bott table "for n ≥ 2", and Case 1, `n ≡ 3, 5, 6, 7 (mod 8)` ⇒ `π_(n−1)(SO) = 0`. The table gives the converse for `n ≥ 2`, so "exactly" is supported. The only exception is `n = 1`, which is outside the scope: almost-framed cycles exist only for `n ≥ 5` (README:1969).
- 3C.5 and References. `hatcher_vbkt` line 191 is the running head "Section 1.1 5" of the page whose lines 194–208 give the frames on S¹, S³ and S⁷. Line 2321 "Section 2.3 59" heads Theorem 2.16 (line 2326; (b) at 2328).
- Text that depends on the change: 8.4 (README:2650–2654: Lemmas 4.2–4.5 and the Remarks, pp.510–512, with "not the literal statement of those lemmas") agrees with the new 8.2. Lemma 4.2 is on p.510 (line 257) and 4.4 on p.511 (line 275). 9A.2 (README:2963–2965) uses 8.2's obstruction, unchanged. Of the seeded sample, 8.2 is the only target inside the change. The others (1.2, 1.4–1.7, 2.1, 2.2, 5.1, 8.1, 8.4, 9.2, 9.4, 9.7, 10.4) are untouched since the full review, whose source table stands.

**Adversarial table.** The rows for statements this change touches have values computed today; the other rows are carried from the last review.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 8.2 obstruction group `H^n(Σ; π_(n−1)SO) ≅ π_(n−1)SO` | `Σ = S⁶, S⁸, S⁹` | UCT: `Hom(H_n, G) ⊕ Ext(H_(n−1), G) = G`, since `H_(n−1) = 0` for `n ≥ 2`. `G = π₅SO = 0`, `π₇SO = ℤ`, `π₈SO = ℤ/2`, matching KM line 181. `π_(n−1)SO_(n+1)` is stable since `n−1 ≤ (n+1)−2` | Pass |
| 8.2 framings form a coset of `im J_n` | `n = 6, 7, 8` | `im J₆ = 0`, coker `= Π₆ = ℤ/2`; `J₇` onto `Π₇ = ℤ/240`, coker 0; `Π₈ = (ℤ/2)²`, coker `ℤ/2`. All match KM line 326 | Pass |
| 8.2 `coker J_n ≅ ker(A_n → π_(n−1)SO)` | `n = 6, 7, 8` | `0 → ℤ/2 → A₆ → π₅SO = 0` gives `A₆ = ℤ/2` (8.1 Check); `ℤ ↠ ℤ/240 → A₇ → 0` gives `A₇ = 0` (6C Check); at `n = 8` the kernel is `ℤ/2` and the image in `π₇SO = ℤ` is `ker(J₇) = 240ℤ`, as the 8.2 Checks say (240 ↦ 0, 1 ↦ 1 mod 240) | Pass |
| 8.3 "`π_(n−1)SO = 0` exactly for `n ≡ 3,5,6,7 (mod 8)`" | `n = 1, 5, …, 12` | `n = 5..12`: `0, 0, 0, ℤ, ℤ/2, ℤ/2, 0, ℤ`, so zero exactly at `n = 5, 6, 7, 11 ≡ 5, 6, 7, 3`. `n = 1`: `π₀SO = 0` with `n ≡ 1`, excluded by `n ≥ 5` (README:1969) and KM's "n ≥ 2". Agrees with `orthogonalGroup_fourth/fifth/sixthHomotopyGroup` (`Subsingleton`) and the seventh (`ℤ`) | Pass |
| `sphere_parallelizable_iff` (docstring changed) | `n = 0, 1, 2, 3, 7, 15` | `n = 1, 3, 7`: frames `ix`, `t₁ix+t₂jx+t₃kx`, octonions (VBKT p.5), both sides true; `n = 2, 15`: both false (Thm 2.16(b), p.59, `m = 3, 16`); `n = 0` excluded by `0 < n`. Type unchanged | Pass |
| `exists_diffeomorph_prod_Icc_of_hCobordism` | carried from the last review | `S⁵×I`, `D⁶`, `∅`, punctured `S⁵×I`, `n = 4` | Pass |
| `nonempty_orthogonalGroup_bottPeriodicity`, Bott entries in degrees 2–8 | carried | `(k,n) = (0,11), (3,14), (6,17)`; `n = 4..10` against `n−1` | Pass |
| `sphere_homotopyGroup_*Stem` (four to seven), 9.2, 9.4 | carried | `π₁₀S⁶ = 0`, …, `n = k+1` sharpness, `ℤ/240` | Pass |
| `PreservesOrientedAtlases`, `smoothPoincareSix_oriented`, `nonempty_diffeomorph_sphere_six` | carried | `S⁶`, reflected atlas, `S³×S³`, `CP³` | Pass |
| 3C.4, 3C.5, 4B.6, 2.2, 2.3, 5.0b, 1.6, 6B, 7B, 8.4/9.5, 9A.1–9A.4 | carried | values as in the last review's table | Pass |
| AlgebraicTopology compact-generation item | main, #1652, #1663, #1797, #1854 | handed to HomotopySpheres §3A.1 / §4.8 / item 8 / 4.5 with a mapping line / 4.5 with none | R01 |
| 3B, 3C.3 owners | main BordismFormalGroups; #1854, #1807, #1808 | HomotopySpheres owns / both own | R02 |

**Cross-roadmap citations re-resolved today.** Main changed from `373d88d` to `39d3d60`, but none of the commits touches AlgebraicTopology, GeometricTopology, BordismFormalGroups or TopologicalKTheory. Main's BordismFormalGroups README:331 is in F4 and :668 in F6.2, as README:3187–3188 says. I re-read these heads: #1652 `287181d`, #1663 `2dc8cf2`, #1797 `f2f59c7`, #1854 `81fee5f`, #1807 `62d686c`, #1808 `a96d197`, #903 `aaa605b`, #1742 `3f10248`, #1799 `58c40ae`, #851 `3b084ef`. The overlap facts are as `scratch/overlaps.md` says: no id dropped; GeometricTopology §1.4 (R04); #284 conflicts, with its baseline stated in the description.

**Ownership.** The change adds no object. It adds only locators and one clause scoping 8.2's target.

**Remarks (no change requested).** The board's `sources.toml` still records `hatcher_vbkt` at "Section 1.1, p.9". It is outside the reviewed files, and the worker may align it to p.5. The References entry for Kervaire–Milnor (README:3249–3252) lists pp.504–507 and p.512. It does not list the p.508 and p.511 locators that 8.2–8.3 now cite, nor the Lemmas 4.2–4.5 that the untouched 8.4 already cited. The entry is a summary, not an index.

## Not verifiable

- **Bott 1959** (4B.6–4B.8): paywalled (JSTOR).
- **Gray 2001**, **Fomenko–Fuchs 2016**, **Toda 1962** (3C.4, 9.2–9.4, 9A.1; the README marks Toda uncertified): paywalled or print only.
- **Browder 1969** (8.4, 9.5; Theorems 1.4 and 3.2): JSTOR only.
- **Milnor, *Topology from the Differentiable Viewpoint*** (5.0, 5.1), **Adams–Atiyah 1966** (3C.5), **Wall 1999**, **Milnor, *Morse Theory*** (4B): no legal copy found.
- **Elaboration at main's pins**: Lean runs only in this worktree, which pins `a91d3aa`.

## Source issues

- none
