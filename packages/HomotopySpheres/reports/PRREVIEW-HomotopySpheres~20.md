# Review of HomotopySpheres (pull request #1287 at c2c2d3e)

**Verdict:** needs changes

This is an incremental re-review of the 17 changed lines since `1fa76c5`. The folder diff touches only `TauCetiRoadmap/HomotopySpheres/README.md` (Downstream consumers, :3259–3268, and the Track 3 row of the classification table, :3283). Nothing outside the folder changed (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HomotopySpheres'` is empty). `Suggested.lean` and `metadata.toml` are unchanged (last touched at `912f30d6`), and the pull request's description is unchanged with respect to the carried findings. Main is at `3090489d`. Line numbers of other roadmaps refer to their README at the head named.

## R01 (P2) — Three open revisions of BordismFormalGroups own the James construction and the Toda brackets that 3B and 3C.3 own

**Location.** README 3B.1–3B.4 (:1052–1092), 3C.3 (:1237–1253), and :3267–3268, "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4".

**Claim.** Carried from the previous report's R01 and re-checked at the current heads, all three of which are new since the last review. On main (`3090489d`) the sentence at :3267–3268 is true: main's BordismFormalGroups README:331 consumes "HomotopySpheres Stage3C's three-fold Toda brackets" and :668 consumes "HomotopySpheres 3B's actual James stages". Each of the three open revisions still owns both objects and never mentions HomotopySpheres, and the description of this pull request still names none of them. Whichever revision merges first gives the James reduced product with its word filtration, and the three-fold Toda brackets, a second owner, and makes :3267–3268 false.

**Witness.** "Own the three-fold Toda brackets of pointed spaces" and "Own the James construction" appear in BordismFormalGroups README at:
- :1180 and :1909 at #1807 (`7871afe`);
- :944 and :1475 at #1808 (`9ae8cc0`);
- :1103 and :1769 at #1854 (`7abe607`).

`HomotopySpheres` occurs 0 times in each of the three READMEs.

**Repair.** Unchanged. Settle on one owner:
- keep this roadmap as the owner, as main's BordismFormalGroups has it, and record in the description that #1807, #1808 and #1854 must turn their "Own" sentences (F4, F6.2) into citations of 3C.3 and 3B before they merge; or
- a recorded human decision that moves ownership to BordismFormalGroups. Then 3B.1–3B.4 and 3C.3 become citations of F6.2 and F4 as they stand at those heads, the merge-order paragraph names that revision, and :3267–3268 is deleted.

Test it on the Check at :1190, `ΣJ₂(S¹) ≃ S² ∨ S³`, where H₂ has rank 1 (rank 3 for the Cartesian square). Exactly one roadmap may state the filtration quotient `J_r X / J_(r−1) X ≅ X^∧r` that this Check uses.

## R02 (P2) — Three later open roadmaps own objects this roadmap owns

**Location.** README 3B.1–3B.4 (:1052–1092), 4A.1 (:1471–1482), 4B.1–4B.8 (:1612–1726), 7B.2–7B.4 (:2507–2540); `Suggested.lean`:132–182.

**Claim.** Carried from the previous report's R02. All three roadmaps come after this one in `ORDER.txt` (HomotopySpheres 45, DGFloerPartII 46, GeometryOfNumbersAndQuadraticArithmetic 55, GeneralAlgebraicKTheoryPartII 335), so this roadmap is the owner and they must cite it. The bullet at :3261–3262 records GeneralAlgebraicKTheoryPartII's use of 3B.6, which was never in dispute and is now correctly placed (R04 repaired). The double ownership of 3B.1–3B.4's, 4A–4B's and 7B's objects is untouched, and the description names none of the three pull requests.
- GeneralAlgebraicKTheoryPartII (#1742, `ca44359`, unchanged) owns J(W), its word filtration, the James map and the connected James equivalence.
- DGFloerPartII (#1799, `f27b94b`, unchanged) owns stable O, the finite-to-stable range, the Bott maps and real Bott periodicity, and its `Suggested.lean` declares the same periodicity theorem as this roadmap's headline.
- GeometryOfNumbersAndQuadraticArithmetic (#851, `3b084ef`, unchanged) owns Wall's forms and formations and the odd L-groups.

**Witness.**
- #1742 README:13 says J(W), its filtration, the James map and the connected James equivalence are owned there (§4.30b); README:1212 is "### 4.30b The James reduced product".
- #1799 README:1388 is "### 4.2a Stable orthogonal groups and the finite-to-stable range" and :1500 is "### 4.2c Index bounds, the Bott maps and real Bott periodicity". `Suggested.lean`:371 is `nonempty_pi_add_eight_SO_mulEquiv (j m) (hm : j + 11 ≤ m)`. `HomotopySpheres` occurs 0 times in either file.
- #851 README:2719 is "### 6.8 Formations" and :2777 defines `WallFormation R ε`; `HomotopySpheres` occurs 0 times.

**Repair.** Unchanged. In the description, name #1742, #1799 and #851 as consumers whose sections must become citations before they merge:
- #1742's §4.30b, of 3B.1–3B.4;
- #1799's §§4.2a–4.2c and its `Suggested.lean`:371–393, of 4A.1 and 4B.1–4B.8;
- #851's §6.8, of 7B.2–7B.4.

The alternative is a recorded human decision for the reverse settlement, with the corresponding sections here rewritten as citations.

Test: for i ≥ 1, `π_i(SO(m), 1) ≅ π_i(O(m), 1)` because SO(m) is the identity component. With k = j, `nonempty_orthogonalGroup_bottPeriodicity (k n) (hn : k + 11 ≤ n)` here and #1799's `nonempty_pi_add_eight_SO_mulEquiv` state the same theorem, `π_(k+9) ≅ π_(k+1)` for n ≥ k + 11. Only one of the two files may declare it.

## R03 (P3) — The branch pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`; the README cites declarations that exist only at main's `2fd255d` and `1b1ccf4`

**Location.**
- `lake-manifest.json`: unchanged by this branch (`git diff origin/main...HEAD -- lake-manifest.json` is empty). It pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`; main pins `2fd255d9` and `1b1ccf4b`.
- README:340–398 ("From Tau Ceti") and the six `TauCeti.SphereSurgery` citations (:97, :405, :2431, :2455–2456, :2463, :2494, :3287).
- `Suggested.lean`:2–3 and :9–11.

**Claim.** Carried from the previous report's R03; not repaired. The README names Tau Ceti declarations, with files and lines, that are absent at the pin this branch builds against.

**Witness.** At the branch's Tau Ceti `a91d3aaf` (`.lake/packages/TauCeti`) there is no directory `TauCeti/Topology/Surgery`, and a search for `SphereSurgery`, `exists_bandHomeomorph`, `OrientedConnectedSum` and `degreeAtRegularValue` finds 0 files. At main's `2fd255d9`, `SphereSurgery` is in `TauCeti/Topology/Surgery/Basic.lean`:189, as earlier reports verified.

**Repair.** Unchanged. Merge main when rebasing so that the manifest pins `2fd255d9` and `1b1ccf4b`, then rebuild. After that, replace `Suggested.lean`:3 by `import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` and delete :9–11. Test: `lake env lean` exits 0 on the branch today only because the file imports no module that is missing at `a91d3aa`.

## Previous findings

- R01 — not repaired: README:3267–3268 "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4" remains, while #1807 (`7871afe`), #1808 (`9ae8cc0`) and #1854 (`7abe607`) still "Own the James construction" and the three-fold Toda brackets. The description is unchanged.
- R02 — not repaired: #1742 (`ca44359`) still owns J(W) in §4.30b, #1799 (`f27b94b`) still owns stable O and Bott periodicity (README §§4.2a–4.2c, `Suggested.lean`:371), #851 (`3b084ef`) still owns Wall formations (§6.8). The description names none of them.
- R03 — not repaired: `lake-manifest.json` still pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`, and `Suggested.lean`:3 still imports `TauCeti.Geometry.Diffeomorphism.Disc` "whose public imports re-export" the oriented-atlas declarations.
- R04 — repaired: README:3261–3262 is now its own bullet, "GeneralAlgebraicKTheoryPartII consumes the reduced stable James splitting `Σ∞ΩΣW ≃ ⋁_(r≥1) Σ∞W^∧r` of 3B.6 in its §§4.33 and 7.7", outside the "On main" bullet; every roadmap left under "On main" has a folder on main at `3090489d`. The repair introduced no new problem (details below).

## Verified sound

**Gate and dependency check** (my runs at `c2c2d3e`):

```text
gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 235 roadmaps, 2262 edges, 0 problem(s)
```

- The worker's gate (`scratch/gate.md`) also passed, including the targeted build (`build=0`). The dependency check prints no UPWARD, CYCLE or `moved:` line; the edge count rose by one from the previous round (2261 → 2262), which is the new GeneralAlgebraicKTheoryPartII consumer edge, and it points downward (335 > 45).
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`; there are no stray files.

**Elaboration and signatures** (branch pins):
- `lake env lean TauCetiRoadmap/HomotopySpheres/Suggested.lean` exits 0 with exactly 16 ``declaration uses `sorry` `` warnings and no other message.
- The file is byte-identical to the one the previous two reviews elaborated, so the `#check @name` comparison of the 3 definitions and 16 theorems against the README stands: `5 ≤ n`, `[T2Space W] [CompactSpace W] [SimplyConnectedSpace W]`, `IsClosed ↑M₀` and both inclusion homotopy equivalences on the h-cobordism theorem; `0 < n` on `sphere_parallelizable_iff`; `k + 11 ≤ n` and the ranks 4–10 on the Bott entries; `6 ≤ n` … `9 ≤ n` on the stems; `[T2Space M] [SecondCountableTopology M] [CompactSpace M] [IsManifold (𝓡 6) ∞ M]` and both `TauCeti.IsOrientedAtlas` hypotheses on the recognition theorems. The worker's `scratch/signatures.md` reports 0 dropped section binders (its "`below);`" entry at line 41 is a docstring line its scanner misread as a declaration, not a declaration of the file). The one-tactic probe (16 of 16 fail to close) and the headline audit are carried from PRREVIEW-HomotopySpheres~18.

**The changed passages.**
- README:3261–3262. Resolved at #1742 (`ca44359`, head unchanged since the last review): README:196–198 ("From TauCetiRoadmap.HomotopySpheres") consumes §3B.6's `Σ∞ΩΣW ≃ ⋁_(r≥1) Σ∞W^∧r` for a path-connected pointed CW complex W whose basepoint is a 0-cell, and says that "§§4.33 and 7.7 use only the reduced form"; README:1302 is "### 4.33 Acyclicity under the James splitting" and :1952 is "### 7.7 Purity for suspension A-theory", both with "HomotopySpheres §3B.6" on their *Needs:* lines (:1317, :1967). The formula and the two section numbers in the new sentence therefore match the consumer's own text, and the formula matches 3B.6's stable API bullet here (:1186, "identifies Σ∞ΩΣW with ⋁_(r≥1) Σ∞W^∧r"). GeneralAlgebraicKTheoryPartII is at line 335 of `ORDER.txt`, later than this roadmap (45), as the paragraph at :3256–3257 requires.
- README:3263–3268 ("On main, …"). Every roadmap named in the bullet has a folder on main at `3090489d`: PositiveScalarCurvature, GeneralizedCohomology, BordismFormalGroups, DGFloer, CharacteristicClasses, MorseTheory, GeometricCurrents, and in the following sentence AlgebraicTopology, RiemannianGeometry and Orbifolds. PositiveScalarCurvature's clause, moved into this bullet, is supported by main's PositiveScalarCurvature README:87–92, which consumes HomotopySpheres §§1.2–1.6, Layer 2 (Θₙ), §3C, Layers 6–8 and §9A.1, with the handle-decomposition and Whitney-move uses at :230, :766–:790 and :808.
- README:3283 (Track 3 row). "Feeds" now ends in GeneralAlgebraicKTheoryPartII, which agrees with the bullet at :3261 and with the previous report's remark; the other entries of the row are unchanged.
- Seeded sample: none of the 15 seeded targets (1.3, 1.5, 1.6, 2.4, 5.0, 5.0b, 8.3, 9.1–9.4, 9.7, 10.1, 10.3, 10.4) lies in, cites or is cited by the changed lines, which are consumer bookkeeping. Their source verification stands as recorded in the earlier reports (1.3, 1.5, 1.6 in `milnor_hcobordism`; 2.4, 5.0, 8.3, 9.7 in `kervairemilnor1963`; the stems in Toda via the previous reports' values; 10.x against the Lean signatures above).

**Cross-roadmap citations resolved this round.**
- Main `3090489d`: BordismFormalGroups README:331 and :668 support :3267–3268; PositiveScalarCurvature README:87–92 supports :3263–3265.
- BordismFormalGroups at #1807 `7871afe`, #1808 `9ae8cc0` and #1854 `7abe607` (R01, lines above). GeneralAlgebraicKTheoryPartII at #1742 `ca44359`. DGFloerPartII at #1799 `f27b94b` (README:1388, :1442, :1500; `Suggested.lean`:371). GeometryOfNumbersAndQuadraticArithmetic at #851 `3b084ef` (README:2719, :2777).
- Overlaps (`scratch/overlaps.md`): #284 conflicts in both files; it is the baseline this pull request carries, as the description says. No id this README cites is dropped by an open pull request, and none is defined only by an open revision. `scratch/citations.md`: no cross-roadmap citation and no Lean name of the README is found nowhere.

**Adversarial table.** The first three rows are computed for the changed lines this round. The remaining rows cover statements the diff leaves untouched and are carried from the previous reports (PRREVIEW-HomotopySpheres~18 and ~19) with the values computed there.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| :3261–3262 GeneralAlgebraicKTheoryPartII consumes 3B.6's reduced splitting in §§4.33, 7.7 (this round) | #1742 contract :196–198 vs 3B.6 :1186; W = Sᵏ (k ≥ 1); W = S⁰; #1742 §7.7 with the unreduced form | hypotheses match (path-connected CW, 0-cell basepoint, reduced form only); Sᵏ: right side has one cell in each degree rk, r ≥ 1, and H̃_*(ΩSᵏ⁺¹;ℤ) = T(x_k) reduced = ℤ in degrees rk, equal on both sides; S⁰: J(S⁰) ≅ ℕ, ΩΣS⁰ ≃ ℤ, π₀ differ, excluded by path-connectedness on both sides; §7.7 uses Σ∞₊ΩΣW = S ∨ (reduced), the fibre of the augmentation is the reduced splitting, so "reduced only" is right | Pass |
| :3263–3268 "On main, PositiveScalarCurvature …" (this round) | folder list of main `3090489d`; PSC README:87–92; `ORDER.txt` | 10 named roadmaps, 10 folders on main; PSC cites §§1.2–1.6, Layer 2, §3C, Layers 6–8, §9A.1, exactly the five items of the clause; GeneralAlgebraicKTheoryPartII absent from main and from the bullet | Pass |
| :3283 Track 3 "Feeds" (this round) | bullets :3259–3268 vs row | consumers of Layer 3 in the bullets: FourManifolds (3C), PSC (3C), GeneralizedCohomology (3A), BFG (3B, 3C.3), DGFloer (3B), GAKTII (3B.6) = 6; row lists 6, same set | Pass |
| 3B.6 product and James splittings (r19, cited by :3262) | X = Y = S¹; J₂(S²); M(ℤ/2,2); degree-2 map | Σ(S¹×S¹) ≃ S²∨S²∨S³ (`hatcher_at` lines 20110–20111); x² = ±2y in H*(J₂S²), cups vanish on S²∨S⁴; H̃₅(X∧X) = ℤ/2, X^∧3 5-connected; 2ᵏ on Sᵏ⁺¹ | Pass |
| `exists_diffeomorph_prod_Icc_of_hCobordism` (r18) | W = S⁵×I; D⁶ with M₀ = S⁵; (S⁵×I) minus a ball; n = 4 | H₅: ℤ→ℤ at both ends; M₁ = ∅ fails h₁; H₅: ℤ→ℤ² fails h₀; excluded by `5 ≤ n` | Pass |
| 1.2 elementary cobordism (r18) | index 0 on Dⁿ; index 1 on a band | H_*(W,V₀) = ℤ in degree 0; ℤ in degree 1 | Pass |
| 1.3 trading (r18) | n+1 = 6 | remove indices 0, 1, 5, 6; 2–4 remain | Pass |
| 1.5–1.6 Whitney hypotheses (r18) | (p,q) = (3,3); (2,3) in V⁵ | r+s = 6 ≥ 5, s = 3; codimension 4 attaching circle, π₁ of complement 0 | Pass |
| 2.3 inverse h-cobordism (r18) | Σ = Sⁿ; one-handle model | V = Dⁿ⁺¹, Hₙ ℤ→ℤ; π₁ = ℤ, Hₙ = ℤ² | Pass |
| 2.4 Θₙ (r18) | n = 6, 7 | orders 1 and 28; 28 ∤ 2 | Pass |
| 3C.5 exclusion (r18) | r = 1…8 | ν₂(3ʳ−1) = 1,3,1,4,1,3,1,5; 2ʳ ∣ 3ʳ−1 exactly for r ∈ {1,2,4} | Pass |
| 3C.5 Clifford frames (r18) | Cl(0,1), Cl(0,3), Cl(0,7) | ℂ, ℍ×ℍ, M₈(ℝ)²; modules ℝ², ℝ⁴, ℝ⁸ | Pass |
| 4B.6 λ table (r18) | r = 1, 2, 8 | (0,2,8,4,2,2), (2,6,12,6,3,3), (14,30,36,18,9,9) | Pass |
| Bott periodicity and entries (r18) | (k,n) = (0,11), (3,14), (6,17); ranks 4…10 | ℤ/2 ≅ ℤ/2, 0 ≅ 0, ℤ ≅ ℤ; 0, ℤ, 0, 0, 0, ℤ, ℤ/2; π₃SO(4) = ℤ², π₇SO(8) = ℤ² excluded | Pass |
| 5.0b offsets and Arf (r18) | c = 1…4; Lie torus; two tori | π₃S¹ = 0, π₃S² = ℤ, π₄S³ = ℤ/2, π₆S⁴ = ℤ/2; Arf 1; 1+1 = 0 | Pass |
| 6B E₈ family (r18) | pinned graph | det 1, signature −8, σ/8 = −1 | Pass |
| 7A.3 surgery trace, framing, S⁰ surgery (r18) | unknotted S¹ ⊂ S⁵; other framing; n ≥ 3, n = 1 | S²×S³, H₂ = ℤ, trace ≃ S⁵ ∨ S²; non-spin bundle ≠ S²×S³; S¹×Sⁿ⁻¹ with π₁ = ℤ, two circles at n = 1 | Pass |
| 7B/7C forms (r18) | zero; hyperbolic; anisotropic; two anisotropic | Arf 0, 0, 1, 0; Gauss sum 4, 10 zeros | Pass |
| 8.1–8.3 obstruction group and forgetting map (r18) | n = 5…12; n = 7; n = 6 | π_(n−1)SO = 0,0,0,ℤ,ℤ/2,ℤ/2,0,ℤ, zero iff n ≡ 3,5,6,7 (mod 8); J₇(1) ↦ 1 mod 240, image 0 in A₇; ν² nonzero in A₆ | Pass |
| 9.2 odd-primary gap (r18) | (p,k) = (3,3…7), (5,6), (5,7), (5,15) | order 3 at k = 3, 7; zero at 4–6; order 5 at 7 and 15 | Pass |
| 9.5/9.7 Arf of S³×S³ and Θ₆ = 0 (r18) | framed vs normal refinement; exact segment | Arf 1 vs Arf 0 (π₂SO(3) = 0); 0 → Θ₆ → ℤ/2 → ℤ/2 iso, Θ₆ = 0 | Pass |
| 9A.1–9A.4 (r18) | 1/240; 2x = 1/120; p₂ = ±1440, p₁ = 0; k = 2…5 | 240·(1/240) = 0, solutions 1/240, 121/240; σ = 224, σ/8 = 28, μ = 1/28; −360 ≡ 4 (mod 7), v₂(d₃) = 5, v₂(d₄) = 4, v₂(d₅) = 9 | Pass |
| `sphere_parallelizable_iff` (r18) | n = 0, 1, 2, 3, 7, 15 | n = 0 excluded; 1, 3, 7 both true; 2, 15 both false | Pass |
| `smoothPoincareSix_oriented` (r18) | S⁶ A = B; reflected atlas; S³×S³; CP³ | sign +1; −1 so compose; H₃ = ℤ², H₂ = ℤ fail | Pass |
| 6A.3/6B.4/6C.1 attributions and 9.7 Case 1 (r18) | Kervaire–Milnor §4; k = 3 | bP_{n+1}, `p(M,Φ)` at p.510; π₂SO(3) = 0 (p.528) | Pass |

**Remarks on untouched text** (not findings):
- Main's BordismFormalGroups README:14–15 pins its HomotopySpheres citations to a commit URL of this roadmap's README; that is main's text, outside this folder.

## Not verifiable

- Nothing in the changed passages depends on a source text: they are consumer bookkeeping resolved against the consumers' READMEs at main and at the open heads named above.
- The items the earlier reports list (Browder 1969, Bott 1959, Gray 2001, Toda 1962, Fomenko–Fuchs, Wall 1999, Milnor's two print books, Adams–Atiyah, Smale, James) concern untouched text and are unchanged.
- Elaboration at main's pins is not possible in this worktree, which pins Tau Ceti `a91d3aa` (R03).

## Source issues

- none
