# Review of HomotopySpheres (pull request #1287 at 1fa76c5)

**Verdict:** needs changes

This is an incremental re-review of the 2 changed lines since `93d7033`. The folder diff touches one line of `TauCetiRoadmap/HomotopySpheres/README.md` (:3267, in Downstream consumers). Nothing outside the folder changed (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HomotopySpheres'` is empty). `Suggested.lean` and `metadata.toml` are unchanged, and so is the pull request's description with respect to the three earlier findings. Line numbers of other roadmaps refer to their README at the head named. Main is at `1bea8354`.

## R01 (P2) — Three open revisions of BordismFormalGroups own the James construction and the Toda brackets that 3B and 3C.3 own

**Location.** README 3B.1–3B.4 (:1052–1092), 3C.3 (:1237–1253), and :3266–3267, "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4".

**Claim.** This is carried from the previous report's R01, re-checked at the current heads. On main the sentence at :3266 is true: main's BordismFormalGroups README:331 consumes "HomotopySpheres Stage3C's three-fold Toda brackets" and :668 consumes "HomotopySpheres 3B's actual James stages". All three open revisions of BordismFormalGroups have new heads since the last review. Each still owns both objects and never mentions HomotopySpheres, and the description of this pull request still does not name them. Whichever revision merges first gives the James reduced product with its word filtration, and the three-fold Toda brackets, a second owner, and it makes :3266–3267 false.

**Witness.** "Own the three-fold Toda brackets of pointed spaces" and "Own the James construction" appear in BordismFormalGroups README at:
- :1180 and :1909 at #1807 (`2ce4de6`);
- :944 and :1475 at #1808 (`d56e187`);
- :1103 and :1769 at #1854 (`0905eb1`).

None of the three READMEs mentions HomotopySpheres.

**Repair.** Unchanged. Settle on one owner:
- keep this roadmap as the owner, as main's BordismFormalGroups has it, and record in the description that #1807, #1808 and #1854 must turn their "Own" sentences (F4, F6.2) into citations of 3C.3 and 3B before they merge; or
- a recorded human decision that moves ownership to BordismFormalGroups. Then 3B.1–3B.4 and 3C.3 become citations of F6.2 and F4 as they stand at those heads, the merge-order paragraph names that revision, and :3266–3267 is deleted.

Test it on the Check at :1190, `ΣJ₂(S¹) ≃ S² ∨ S³`, where H₂ has rank 1 (rank 3 for Cartesian powers). Exactly one roadmap may state the filtration quotient `J_r X / J_(r−1) X ≅ X^∧r` that this Check uses.

## R02 (P2) — Three later open roadmaps own objects this roadmap owns

**Location.** README 3B.1–3B.4 (:1052–1092), 4A.1 (:1471–1482), 4B.1–4B.8 (:1612–1726), 7B.2–7B.4 (:2507–2540); `Suggested.lean`:132–182.

**Claim.** This is carried from the previous report's R02. All three roadmaps come after this one in `ORDER.txt` (HomotopySpheres 45, DGFloerPartII 46, GeometryOfNumbersAndQuadraticArithmetic 55, GeneralAlgebraicKTheoryPartII 335), so this roadmap is the owner and they must cite it. The new line :3267 records GeneralAlgebraicKTheoryPartII's use of 3B.6, which was never in dispute. The double ownership of 3B.1–3B.4's objects is untouched, and the description still names none of the three pull requests.
- GeneralAlgebraicKTheoryPartII (#1742, `ca44359`) owns J(W), its word filtration, the James map and the connected James equivalence.
- DGFloerPartII (#1799, now `f27b94b`) owns stable O, the finite-to-stable range, the Bott maps and real Bott periodicity. Its `Suggested.lean` now also declares the same periodicity theorem as this roadmap's headline.
- GeometryOfNumbersAndQuadraticArithmetic (#851, `3b084ef`) owns Wall's forms and formations and the odd L-groups.

**Witness.**
- #1742 README:13 says J(W), its filtration, the James map and the connected James equivalence "are owned here (§4.30b)"; README:1212 is "### 4.30b The James reduced product".
- #1799 README:1388 is "### 4.2a Stable orthogonal groups and the finite-to-stable range" and :1500 is "### 4.2c … real Bott periodicity". `Suggested.lean`:371 is `nonempty_pi_add_eight_SO_mulEquiv (j m) (hm : j + 11 ≤ m)`. HomotopySpheres occurs 0 times in either file.
- #851 README:2777 defines `WallFormation R ε`; HomotopySpheres occurs 0 times.

**Repair.** Unchanged. In the description, name #1742, #1799 and #851 as consumers whose sections must become citations before they merge:
- #1742's §4.30b, of 3B.1–3B.4;
- #1799's §§4.2a–4.2c and its `Suggested.lean`:371–393, of 4A.1 and 4B.1–4B.8;
- #851's §6.8, of 7B.2–7B.4.

The alternative is a recorded human decision for the reverse settlement, with the corresponding sections here rewritten as citations.

Test: for i ≥ 1, `π_i(SO(m), 1) ≅ π_i(O(m), 1)` because SO(m) is the identity component. With k = j, `nonempty_orthogonalGroup_bottPeriodicity (k n) (hn : k + 11 ≤ n)` here and #1799's `nonempty_pi_add_eight_SO_mulEquiv` therefore state the same theorem, `π_(k+9) ≅ π_(k+1)` for n ≥ k + 11. Only one of the two files may declare it.

## R03 (P3) — The branch pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`; the README cites declarations that exist only at main's `2fd255d` and `1b1ccf4`

**Location.**
- `lake-manifest.json`: unchanged by this branch (`git diff origin/main...HEAD -- lake-manifest.json` is empty). It pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`; main pins `2fd255d9` and `1b1ccf4b`.
- README:340–398 ("From Tau Ceti") and the `TauCeti.SphereSurgery` citations (:97, :405, :2431, :2455–2456, :2463, :2494, :3287).
- `Suggested.lean`:2–3 and :9–11.

**Claim.** Carried from the previous report's R03; not repaired. The README names Tau Ceti declarations, with files and lines, that are absent at the pin this branch builds against.

**Witness.** At the branch's Tau Ceti `a91d3aaf` (`.lake/packages/TauCeti`), a search for `SphereSurgery`, `exists_bandHomeomorph`, `OrientedConnectedSum` and `degreeAtRegularValue` finds 0 files. At main's `2fd255d9`, `SphereSurgery` is in `TauCeti/Topology/Surgery/Basic.lean`:189, as the previous report verified.

**Repair.** Unchanged. Merge main when rebasing so that the manifest pins `2fd255d9` and `1b1ccf4b`, then rebuild. After that, replace `Suggested.lean`:3 by `import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` and delete :9–11. Test: `lake env lean` exits 0 on the branch today only because the file imports no module that is missing at `a91d3aa`.

## R04 (P3) — The new consumer sentence puts GeneralAlgebraicKTheoryPartII under "On main", but it is an open pull request

**Location.** README:3264–3267: "On main, GeneralizedCohomology consumes … ; BordismFormalGroups consumes … ; GeneralAlgebraicKTheoryPartII consumes the stable James splitting of 3B.6;".

**Claim.** The clause this head adds is correct about what is consumed. It sits in the semicolon list governed by "On main," and that makes it false: GeneralAlgebraicKTheoryPartII is not on main. The line was added by this round's repair.

**Witness.** Main at `1bea8354` has no `GeneralAlgebraicKTheoryPartII` folder. It is #1742 (`ca44359`), line 335 of `ORDER.txt`. Every other roadmap in the bullet (GeneralizedCohomology, BordismFormalGroups, DGFloer, CharacteristicClasses, MorseTheory, GeometricCurrents, AlgebraicTopology, RiemannianGeometry, Orbifolds) has a folder on main.

**Repair.** Move the clause into a bullet of its own outside the "On main" bullet, as FourManifolds has, for example: "- GeneralAlgebraicKTheoryPartII consumes the reduced stable James splitting of 3B.6 in its §§4.33 and 7.7." Test: after the edit, each roadmap named in the "On main" bullet has a folder on main at `1bea8354`, and GeneralAlgebraicKTheoryPartII is still later than this roadmap in `ORDER.txt` (335 > 45), as the paragraph at :3256–3257 requires.

## Previous findings

- R01 — not repaired: README:3266–3267 "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4" remains, while #1807 (`2ce4de6`), #1808 (`d56e187`) and #1854 (`0905eb1`) still "Own the James construction" and the Toda brackets. The description is unchanged.
- R02 — not repaired: the new :3267 only records "GeneralAlgebraicKTheoryPartII consumes the stable James splitting of 3B.6". #1742 still owns J(W) (§4.30b), and #1799 still owns stable O and Bott periodicity, now also in its `Suggested.lean`:371. The description names neither.
- R03 — not repaired: `lake-manifest.json` still pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`, and `Suggested.lean`:3 still imports `TauCeti.Geometry.Diffeomorphism.Disc` "whose public imports re-export" the oriented-atlas declarations.

## Verified sound

**Gate and dependency check** (my runs at `1fa76c5`):

```text
gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 235 roadmaps, 2261 edges, 0 problem(s)
```

- The worker's gate (`scratch/gate.md`) also passed, including the targeted build (`build=0`). The dependency check prints no UPWARD, CYCLE or `moved:` line. The new consumer GeneralAlgebraicKTheoryPartII (335) is later than this roadmap (45), so the new edge points downward.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`; there are no stray files.

**Elaboration and signatures** (branch pins):
- `lake env lean TauCetiRoadmap/HomotopySpheres/Suggested.lean` exits 0 with exactly 16 ``declaration uses `sorry` `` warnings and no other message.
- A scratch copy with `#check @name` for the 3 definitions and 16 theorems exits 0. Every elaborated type matches the previous report's comparison with the README: `5 ≤ n`, `[T2Space W] [CompactSpace W] [SimplyConnectedSpace W]`, `IsClosed ↑M₀` and both inclusion homotopy equivalences on the h-cobordism theorem; `0 < n` on `sphere_parallelizable_iff`; `k + 11 ≤ n` and the ranks 4–10 on the Bott entries; `6 ≤ n` … `9 ≤ n` on the stems; `[T2Space M] [SecondCountableTopology M] [CompactSpace M] [IsManifold (𝓡 6) ∞ M]` and both `TauCeti.IsOrientedAtlas` hypotheses on the recognition theorems. Nothing changed, as expected since the file is untouched. The one-tactic probe (16 of 16 fail to close) and the headline audit are carried from the previous report.

**The changed passage.** README:3267 says that GeneralAlgebraicKTheoryPartII consumes the stable James splitting of 3B.6.
- Resolved at #1742 (`ca44359`):
  - README:196–198, "From TauCetiRoadmap.HomotopySpheres", consumes §3B.6's `Σ∞ΩΣW ≃ ⋁_(r≥1) Σ∞W^∧r` and its unreduced form `S ∨ ⋁`, for a path-connected pointed CW complex W whose basepoint is a 0-cell.
  - README:1304–1317 and :1960–1967 use the reduced form (*Needs:* "HomotopySpheres §3B.6 (stable James splitting)").
  - README:13 and :2455 say the same.
- These are exactly the hypotheses and conclusions of 3B.6 here (:1102–1141 and its API bullet at :1186). The consumption claim is accurate; only its placement is wrong (R04).
- 3B.6's locators were re-read for this citation in `hatcher_at`:
  - Proposition 4I.1 at line 20117 (p.467) states `Σ(X×Y) ≃ ΣX ∨ ΣY ∨ Σ(X∧Y)` for CW complexes, with the reduced-join and cone-collapse proof at lines 20120–20133.
  - Proposition 4I.2 at line 20146 (p.468) states `ΣJ(X) ≃ ⋁_n ΣX^∧n` for connected CW X.
  - For CW complexes "connected" and "path-connected" agree, so 3B.6's hypothesis is right.
- Seeded sample: none of the 15 seeded targets (1.1, 1.2, 1.5, 1.6, 2.1, 2.2, 2.3, 5.0, 5.1, 8.1, 8.4, 9.3, 9.4, 10.1, 10.2) lies in, cites or is cited by the changed line. Their source verification (1.5, 1.6, 2.1, 2.2, 2.3, 8.1, 8.4, 10.2 at the source lines; 1.2 in the table) stands as recorded in the previous report.

**Cross-roadmap citations resolved this round.**
- Main `1bea8354`: 11 roadmaps mention HomotopySpheres (PositiveScalarCurvature, CharacteristicClasses, GeneralizedCohomology, Orbifolds, TopologicalKTheory, RiemannianGeometry, DGFloer, AlgebraicTopology, MorseTheory, BordismFormalGroups, GeometricCurrents). BordismFormalGroups README:331 and :668 support :3266.
- BordismFormalGroups at #1807 `2ce4de6`, #1808 `d56e187` and #1854 `0905eb1` (R01, lines above). GeneralAlgebraicKTheoryPartII at #1742 `ca44359`. DGFloerPartII at #1799 `f27b94b` (README:1388, :1500; `Suggested.lean`:371, :377, :384, :390). GeometryOfNumbersAndQuadraticArithmetic at #851 `3b084ef` (README:2777).
- TangentialBordism has moved to `4e86746`. Every id the README cites still resolves there: B1.6 (:480), B1.1 (:750), B1.2 (:923), B3.2(a) (:444), B3.2(b) (:2367), B3.2(c) (:2400), B4.1 (:1205), B4.2 (:1265), B4.7 (:1349), B5.2 (:1509). It has no `gap:` and does not cite HomotopySpheres.
- Overlaps (`scratch/overlaps.md`): #284 (`fb7c47e`) conflicts in both files. It is the baseline this pull request carries, as the description says ("This follows Paul Lezeau's proposal #284 … The baseline is …"). No id this README cites is dropped, and none is defined only by an open revision.

**Adversarial table.** The first two rows are computed for the changed line this round. The remaining rows cover statements the diff leaves untouched and are carried from the previous report (PRREVIEW-HomotopySpheres~18) with the values computed there.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| :3267 GeneralAlgebraicKTheoryPartII consumes 3B.6 (this round) | #1742 contract vs 3B.6; W = S¹; W = S⁰; #1742's use with E = Hℚ, W = M(ℤ/p, m) | hypotheses match (path-connected CW, 0-cell basepoint; reduced and unreduced forms); S¹: summand Σ∞Sᵏ gives H̃ₖ(ΩS²;ℤ) = ℤ for every k ≥ 1 on both sides; S⁰: J(S⁰) ≅ ℕ but ΩΣS⁰ ≃ ℤ, π₀ differ, excluded on both sides; Hℚ⊗Σ∞W = 0 and H̃_*(ΩΣW;ℚ) = reduced T(H̃_*(W;ℚ)) = T(0)⁺ = 0, consistent with the conclusion | Pass |
| :3264 "On main, … GeneralAlgebraicKTheoryPartII …" (this round) | folder list of main `1bea8354`; `ORDER.txt` | 11 roadmaps on main mention HomotopySpheres, GeneralAlgebraicKTheoryPartII not among them and has no folder; open #1742; position 335 | Fail → R04 |
| 3B.6 product and James splittings (this round, cited by :3267) | X = Y = S¹; J₂(S²); M(ℤ/2,2); degree-2 map | Σ(S¹×S¹) ≃ S²∨S²∨S³ (`hatcher_at` lines 20110–20111) = ΣX∨ΣY∨Σ(X∧Y); x² = ±2y in H*(J₂S²;ℤ), cups vanish on S²∨S⁴; H̃₅(X∧X) = Tor(ℤ/2,ℤ/2) = ℤ/2, X^∧3 has bottom cell in dimension 6 so is 5-connected; 2ᵏ on Sᵏ⁺¹ | Pass |
| `exists_diffeomorph_prod_Icc_of_hCobordism` (r18) | W = S⁵×I, M₀ = S⁵×0; D⁶ with M₀ = S⁵; (S⁵×I) minus a ball; n = 4 | H₅: ℤ→ℤ at both ends, f = id; M₁ = ∅ fails h₁; H₅: ℤ→ℤ² fails h₀; excluded by `5 ≤ n` | Pass |
| 1.2 elementary cobordism (r18) | index 0 on Dⁿ; index 1 on an annulus band | H_*(W,V₀) = ℤ in degree 0; ℤ in degree 1 | Pass |
| 1.3 trading (r18) | n+1 = 6 | remove indices 0, 1, 5, 6; 2–4 remain | Pass |
| 1.5–1.6 Whitney hypotheses (r18) | (p,q) = (3,3); (2,3) in V⁵ | r+s = 6 ≥ 5, s = 3; codimension 4 attaching circle, π₁ of complement 0 | Pass |
| 2.3 inverse h-cobordism (r18) | Σ = Sⁿ; one-handle model | V = D^(n+1), Hₙ ℤ→ℤ; one-handle model π₁ = ℤ, Hₙ = ℤ² | Pass |
| 2.4 Θₙ (r18) | n = 6, 7 | orders 1 and 28; 28 ∤ 2 | Pass |
| 3C.5 exclusion (r18) | r = 1…8 | ν₂(3ʳ−1) = 1,3,1,4,1,3,1,5; 2ʳ ∣ 3ʳ−1 exactly for r ∈ {1,2,4} | Pass |
| 3C.5 Clifford frames (r18) | Cl(0,1), Cl(0,3), Cl(0,7) | ℂ, ℍ×ℍ, M₈(ℝ)²; modules ℝ², ℝ⁴, ℝ⁸ | Pass |
| 4B.6 λ table (r18) | r = 1, 2, 8 | (0,2,8,4,2,2), (2,6,12,6,3,3), (14,30,36,18,9,9) | Pass |
| Bott periodicity and entries (r18) | (k,n) = (0,11), (3,14), (6,17); ranks 4…10 | ℤ/2 ≅ ℤ/2, 0 ≅ 0, ℤ ≅ ℤ; 0, ℤ, 0, 0, 0, ℤ, ℤ/2; π₃SO(4) = ℤ², π₇SO(8) = ℤ² excluded | Pass |
| 5.0b offsets and Arf (r18) | c = 1…4; Lie torus; two tori | π₃S¹ = 0, π₃S² = ℤ, π₄S³ = ℤ/2, π₆S⁴ = ℤ/2; Arf 1; 1+1 = 0 | Pass |
| 6B E₈ family (r18) | pinned graph | det 1, signature −8, σ/8 = −1 | Pass |
| 7A.3 surgery trace (r18) | unknotted S¹ ⊂ S⁵ | result S²×S³, H₂ = ℤ; trace ≃ S⁵ ∨ S² | Pass |
| 7A.3 framing dependence (r18) | other element of π₁SO(4) | non-spin S³-bundle over S² ≠ S²×S³ | Pass |
| 7A.3 S⁰ surgery (r18) | n ≥ 3; n = 1 | S¹×Sⁿ⁻¹, π₁ = ℤ; two circles at n = 1 | Pass |
| 7B/7C forms (r18) | zero; hyperbolic; anisotropic; two anisotropic | Arf 0, 0, 1, 0; Gauss sum 4, 10 zeros | Pass |
| 8.2–8.3 obstruction group (r18) | n = 5…12 | π_(n−1)SO = 0,0,0,ℤ,ℤ/2,ℤ/2,0,ℤ; zero iff n ≡ 3,5,6,7 (mod 8) | Pass |
| 8.1 forgetting map (r18) | n = 7; n = 6 | J₇(1) ↦ 1 mod 240, image 0 in A₇; ν² nonzero in A₆ | Pass |
| 9.2 odd-primary gap (r18) | (p,k) = (3,3…7), (5,6), (5,7), (5,15) | order 3 at k = 3, 7; zero at 4–6; order 5 at 7 and 15 | Pass |
| 9.5/9.7 Arf of S³×S³ (r18) | framed vs normal-bundle refinement | Arf 1 vs Arf 0 (π₂SO(3) = 0) | Pass |
| 9.7 Θ₆ = 0 (r18) | exact segment | 0 → Θ₆ → ℤ/2 → ℤ/2 iso, Θ₆ = 0 | Pass |
| 9A.1 e-invariant (r18) | 1/240; 2x = 1/120 | 240·(1/240) = 0; solutions 1/240, 121/240 | Pass |
| 9A.2–9A.3 (r18) | p₂ = ±1440, p₁ = 0 | σ = 224, σ/8 = 28; μ = 1/28 | Pass |
| 9A.4 (r18) | k = 2…5 | −360 ≡ 4 (mod 7); v₂(d₃) = 5, v₂(d₄) = 4, v₂(d₅) = 9 | Pass |
| `sphere_parallelizable_iff` (r18) | n = 0, 1, 2, 3, 7, 15 | n = 0 excluded; 1, 3, 7 both true; 2, 15 both false | Pass |
| `smoothPoincareSix_oriented` (r18) | S⁶ A = B; reflected atlas; S³×S³; CP³ | sign +1; −1 so compose; H₃ = ℤ², H₂ = ℤ fail | Pass |
| 6A.3/6B.4/6C.1 attributions (r18) | Kervaire–Milnor §4 | bP_{n+1}, `p(M,Φ)` at p.510 | Pass |
| 9.7 Case 1 (r18) | k = 3 | π₂SO(3) = 0 (p.528) | Pass |

**Remarks on untouched text** (not findings):
- The Track 3 row of the classification table (README:3282) lists FourManifolds, PositiveScalarCurvature, GeneralizedCohomology, BordismFormalGroups and DGFloer under "Feeds", but not GeneralAlgebraicKTheoryPartII.
- PositiveScalarCurvature is on main but sits in its own bullet outside "On main". This makes nothing false.

## Not verifiable

- Nothing in the changed passage depends on a text I could not read. Its one source, `hatcher_at` Propositions 4I.1–4I.2, was read at lines 20117–20150.
- The items the previous report lists (Browder 1969, Bott 1959, Gray 2001, Toda 1962, Fomenko–Fuchs, Wall 1999, Milnor's two print books, Adams–Atiyah, Smale, James) concern untouched text and are unchanged.
- Elaboration at main's pins is not possible in this worktree, which pins Tau Ceti `a91d3aa` (R03).

## Source issues

- none
