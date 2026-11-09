# Review of HomotopySpheres (pull request #1287 at c2c2d3e)

**Verdict:** needs changes

This is a full review at the head the previous review read. The folder diff since then is empty, and nothing outside the folder changed (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HomotopySpheres'` is empty). The three carried findings were re-checked at the current heads of the other pull requests; the heads behind R01 and R02 have moved, and both findings still hold. The seeded source sample turned up one new locator defect (R04). Main is at `3090489`. Line numbers of other roadmaps refer to the head named.

## R01 (P2) — Three open revisions of BordismFormalGroups own the James construction and the Toda brackets that 3B and 3C.3 own

**Location.** README 3B.1–3B.4 (:1052–1092), 3C.3 (:1237–1253), and :3267–3268, "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4".

**Claim.** Carried from the previous report and re-checked at the new heads of all three revisions. On main, BordismFormalGroups README:331 consumes "HomotopySpheres Stage3C's three-fold Toda brackets" and :668 consumes "HomotopySpheres 3B's actual James stages", so :3267–3268 is true today. Each revision still owns both objects and never mentions HomotopySpheres, and the description of this pull request names none of them. Whichever revision merges first gives the James reduced product with its word filtration, and the three-fold Toda brackets, a second owner. That also makes :3267–3268 false.

**Witness.** "Own the three-fold Toda brackets of pointed spaces" and "Own the James construction" appear in BordismFormalGroups README:
- at :1181 and :1910 in #1807 (`5004f71`);
- at :945 and :1476 in #1808 (`d724946`);
- at :1104 and :1770 in #1854 (`f28d376`).

`HomotopySpheres` occurs 0 times in each of the three READMEs.

**Repair.** Settle on one owner, either way:
- Keep this roadmap as the owner, as main's BordismFormalGroups has it. Record in the description that #1807, #1808 and #1854 must turn their "Own" sentences (F4, F6.2) into citations of 3C.3 and 3B before they merge.
- Or record a human decision that moves ownership to BordismFormalGroups. Then 3B.1–3B.4 and 3C.3 become citations of F6.2 and F4 as they stand at that head, the merge-order paragraph names the revision, and :3267–3268 is deleted.

Test it on the Check at :1190, `ΣJ₂(S¹) ≃ S² ∨ S³`, where H₂ has rank 1 (rank 3 for the Cartesian square). Only one roadmap may state the filtration quotient `J_r X / J_(r−1) X ≅ X^∧r` that this Check uses.

## R02 (P2) — Three later open roadmaps own objects this roadmap owns

**Location.** README 3B.1–3B.4 (:1052–1092), 4A.1 (:1471–1482), 4B.1–4B.8 (:1612–1726), 7B.2–7B.4 (:2507–2540); `Suggested.lean`:132–179.

**Claim.** Carried. All three roadmaps come after this one in `ORDER.txt` (HomotopySpheres 45, DGFloerPartII 46, GeometryOfNumbersAndQuadraticArithmetic 55, GeneralAlgebraicKTheoryPartII 335), so this roadmap is the owner and they must cite it. None of them mentions HomotopySpheres where it builds these objects, and the description names none of the three pull requests.
- DGFloerPartII has a new head, `9de4d71`. It still owns stable O, the finite-to-stable range and real Bott periodicity, and its `Suggested.lean` now restates five of this file's Bott statements rather than one.
- GeneralAlgebraicKTheoryPartII (#1742, `ca44359`, unchanged) owns J(W), its word filtration, the James map and the James equivalence, while citing 3B.6 for the splitting.
- GeometryOfNumbersAndQuadraticArithmetic (#851, `3b084ef`, unchanged) owns Wall's quadratic formations and the odd L-groups.

**Witness.**
- #1799: README:1456 is "### 4.2a Stable orthogonal groups and the finite-to-stable range" and :1568 is "### 4.2c Index bounds, the Bott maps and real Bott periodicity". `Suggested.lean`:376 is `nonempty_pi_add_eight_SO_mulEquiv (j m : ℕ) (hm : j + 11 ≤ m)`, and :382 `subsingleton_pi_SO_of_stable` gives π_i(SO(m)) = 0 for i ≡ 2, 4, 5, 6 (mod 8) and m ≥ i + 2. `HomotopySpheres` occurs 0 times in either file.
- #1742: README:1212 is "### 4.30b The James reduced product"; :1214 defines `JamesReducedProduct`, :1232 the James map, and :1230 uses the James equivalence.
- #851: README:2719 is "### 6.8 Formations" and :2778 defines `WallFormation R ε` and `wallLGroup`.

**Repair.** In the description, name #1742, #1799 and #851 as consumers whose sections must become citations before they merge:
- #1742's §4.30b, of 3B.1–3B.4;
- #1799's §§4.2a–4.2c and its `Suggested.lean`:376–385, of 4A.1 and 4B.1–4B.8;
- #851's §6.8, of 7B.2–7B.4.

The alternative is a recorded human decision for the reverse settlement, with the corresponding sections here rewritten as citations.

Test: for i ≥ 1, π_i(SO(m), 1) ≅ π_i(O(m), 1), because SO(m) is the identity component. Taking j = k, #1799:376 and `nonempty_orthogonalGroup_bottPeriodicity` both state π_(k+9) ≅ π_(k+1) for m ≥ k + 11. At j = 1, 3, 4, 5, #1799:382 is `orthogonalGroup_second/fourth/fifth/sixthHomotopyGroup` with the same bounds m ≥ 4, 6, 7, 8. Only one of the two files may declare these.

## R03 (P3) — The branch pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`; the README's library citations are main's (`2fd255d`, `1b1ccf4`)

**Location.** `lake-manifest.json` (unchanged by this branch); README "From Mathlib" (:323–338) and "From Tau Ceti" (:340–398); the `TauCeti.SphereSurgery` citations (:97, :2431, :2456, :2463, :2494, :3288); `Suggested.lean`:2–3 and :9–11.

**Claim.** Carried and not repaired. It now also covers Mathlib. Every line-numbered library citation in the README matches main's pins and fails at the pins this branch builds against. The Lean file builds only because it avoids the missing modules.

**Witness.** At the branch's Tau Ceti `a91d3aa`:
- there is no `Orientation/OrientedAtlas.lean` (README:341); `IsOrientedAtlas` and `orientationPreservingGroupoid` are at `TauCeti/Geometry/Manifold/Orientation.lean`:332 and :178;
- `SphereSurgery`, `OrientedConnectedSum`, `exists_bandHomeomorph`, `degreeAtRegularValue` and `dense_isRegularValue` occur in 0 files.

At the branch's Mathlib `6b7abb3`, `SSet.toTop` and `sSetTopAdj` are at lines 65 and 73 (README:324 says 66 and 74), `compactlyGenerated` is at 67 (README:333 says 68), and Bernoulli.lean:696 is `dvd_den_bernoulli` (`padicValRat_bernoulli` is at 689).

**Repair.** Unchanged. Merge main so that the manifest pins `2fd255d` and `1b1ccf4`, then rebuild. After that, replace `Suggested.lean`:3 by `import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` (the module exists at `2fd255d`) and delete :9–11. Test: at `2fd255d`, all 26 Tau Ceti line citations of README:340–398 resolve (listed below).

## R04 (P3) — 1.5 and 1.6 cite Theorem 6.6's statement for the framed Whitney disc and attribute a piping step to its proof

**Location.**
- README:650–652 (1.5): "use simple connectivity to contract it and construct a framed Whitney disc with interior disjoint from P∪Q (Milnor, Theorem 6.6 and its remark, pp.71–72)".
- README:659 (*Needs:* "relative general position and piping") and :665–666 (1.6): "Use this condition for the contraction off Q and the piping argument (Milnor, Theorem 6.6, p.71, and its proof, pp.73–84)".

**Claim.** Theorem 6.6 (p.71) assumes the contractible Whitney loop and concludes the isotopy, and its remark (p.72) supplies the arcs. Neither constructs a disc. The framed disc whose interior misses M ∪ M′ is Lemma 6.7 (p.73), proved on pp.77–84.
- Its normal framing is Lemma 6.13 (pp.80–84). That is the one step where s ≥ 3 enters, through the simple connectivity of the Stiefel manifold O(r+s−2)/O(s−1). 1.5 carries q ≥ 3 for this reason but gives no locator for it.
- Milnor's proof has no piping step. For r = 2 the π₁ hypothesis only makes the loop contractible in V∖M′ (p.80), and Lemmas 6.11–6.12 then embed the disc off M ∪ M′ by general position.
- "Piping" is defined nowhere in the README.

**Witness.** In `milnor_hcobordism` (printed page = PDF page − 5):
- line 1913: Lemma 6.7, the embedding of the standard model, on p.73;
- line 1998: "The proof occupies the rest of Section 6", p.77;
- lines 2079–2080: the r = 2 case uses the π₁ hypothesis, p.80;
- lines 2152–2153: "simply connected since s ≥ 3", p.83;
- line 2185: end of the proof of Lemma 6.7, p.84.

**Repair.**
- In 1.5, replace the parenthesis with "(Milnor, Theorem 6.6 and its remark, pp.71–72, for the hypotheses and the arcs; Lemma 6.7, p.73, and its proof, pp.77–84, for the disc, with Lemma 6.13, pp.80–84, for its framing, where q ≥ 3 is used)".
- In 1.6, replace "and the piping argument" with "and the general-position embedding of Lemmas 6.11–6.12, p.79", and drop "and piping" from the *Needs:* line.

Test on the (2,3) case in V⁵. A generic 2-disc misses P², since 2 + 2 < 5. Against Q³ it has isolated intersections, since 2 + 3 = 5, and these are avoided only by choosing the null-homotopy in V∖Q. The injectivity hypothesis provides that null-homotopy. No piping occurs.

## Previous findings

- R01: not repaired. README:3267–3268 still reads "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4". The three revisions still "Own" both objects at their new heads (`5004f71`, `d724946`, `f28d376`), and the description is unchanged.
- R02: not repaired. #1742 (`ca44359`) still owns J(W) in §4.30b; #1799 (now `9de4d71`) still owns stable O and Bott periodicity, and its `Suggested.lean` gained a second duplicate (:382); #851 (`3b084ef`) still owns Wall formations in §6.8. The description names none of them. (The previous report cited #1742 README:13 for J(W); at `ca44359` that line is about EllipticCohomology, and the ownership is at :1212–1232.)
- R03: not repaired. `lake-manifest.json` still pins `a91d3aaf` and `6b7abb3c`.
- The previous report's R04 (GeneralAlgebraicKTheoryPartII bullet) was repaired then, and :3261–3262 is unchanged.

## Verified sound

**Gate and dependency check** (my runs at `c2c2d3e`):

```text
gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 235 roadmaps, 2262 edges, 0 problem(s)
```

- The worker's gate (`scratch/gate.md`, including `build=0`) also passed.
- The dependency check prints no UPWARD, CYCLE or `moved:` line.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.GT"`).

**Lean** (branch pins):
- `lake env lean` exits 0 with exactly 16 ``declaration uses `sorry` `` warnings.
- `#check @name` of all 19 declarations matches the README. The declarations are 3 definitions (`Sphere`, `OrthogonalGroup`, `PreservesOrientedAtlases`) and 16 theorems. The elaborated hypotheses are:
  - `5 ≤ n`, `[T2Space W] [CompactSpace W] [SimplyConnectedSpace W]`, `IsClosed ↑M₀` and both inclusion homotopy equivalences on the h-cobordism theorem;
  - `0 < n` on `sphere_parallelizable_iff`;
  - `k + 11 ≤ n` and the bounds 4…10 on the Bott statements;
  - `6 ≤ n` … `9 ≤ n` with an arbitrary basepoint on the stems;
  - `[T2Space M] [SecondCountableTopology M] [CompactSpace M] [IsManifold (𝓡 6) ∞ M]` and both `TauCeti.IsOrientedAtlas` hypotheses on the recognition theorems.
  
  No binder is lost.
- One-tactic probe on a scratch copy (`first | rfl | infer_instance | simp | decide | exact inferInstance` in place of each `sorry`): 16 of 16 fail. Nothing is padding.
- `TauCeti.IsOrientedAtlas` at the branch pin (Orientation.lean:332) has the fields `subset_maximalAtlas`, `exists_mem_source` and `symm_trans_mem`. The first makes every transition in `PreservesOrientedAtlases` smooth, so the predicate is not vacuous and not false for arbitrary chart sets.

**Headline audit.** The README's headlines are:
- the smooth h-cobordism theorem (1.7);
- Θₙ as a group (2.4);
- the stable stems, James/EHP and Hopf invariant one (Layer 3);
- the parallelizable spheres (3C.5);
- Bott periodicity and the stable table (4B.7–4B.8);
- PT/J (Layers 4C–5);
- Aₙ, Pₙ, Lₙ and the Kervaire–Milnor sequence (Layers 6–8);
- π₄ˢ, π₅ˢ, π₆ˢ and Θ₆ = 0 (Layer 9);
- π₇ˢ, Θ₇, Eells–Kuiper and the E₈ boundaries (Layer 9A);
- six-dimensional recognition (Layer 10).

Each statable one is in `Suggested.lean`. Each unstatable one is named in the module docstring with its missing carrier. I checked the "missing" claims at both pins (`a91d3aa`/`6b7abb3` and `2fd255d`/`1b1ccf4`). Neither has a topological reduced suspension, smash product, mapping cone, James product, Hopf invariant, framed bordism or h-cobordism carrier; the only `suspension`/`mappingCone` hits are algebraic (graded modules, A∞, SquareZero.lean).

**Seeded sample: sources** (`milnor_hcobordism`: printed page = PDF page − 5, confirmed by the printed "70" on PDF page 75; `kervairemilnor1963`: printed page = PDF page + 503; `hatcher_vbkt`: printed page = PDF page − 4).

| Target | Locator | Read at | Result |
| --- | --- | --- | --- |
| 1.2 | Milnor Thms 3.4 p.21, 3.13 p.31, 3.14/Cor 3.15 p.32, 4.8 p.44, 5.4 p.48, 7.6 pp.92–97 | lines 582, 810, 830–836, 1071, 1182, 2418–2434, 2564 | correct; 7.6 assumes W connected and 2 ≤ λ ≤ n−2, as 1.2 states |
| 1.3 | Thms 7.6, 7.8, 8.1, pp.92, 97, 100; 4.8 | lines 2418, 2565–2569, 2613–2626 | correct; 7.8 needs dim ≥ 6, no index 0, 1, n−1, n, simply connected, H_*(W,V) = 0 |
| 1.4 | Thm 6.6 and the local construction, pp.71–76 | lines 1841–1857, 1913–1938 | correct; the isotopy given the model ends on p.74 |
| 1.5 | Thm 6.6 and remark pp.71–72; Lemmas 6.10–6.12 pp.79–80 | lines 1841–1867, 2049–2077 | hypotheses correct (r + s ≥ 5, s ≥ 3); disc locator R04 |
| 1.6 | Thm 6.6 p.71, proof pp.73–84; proof of Thm 6.4, λ = 2, pp.72–73 | lines 1868–1896, 2079–2080 | Thm 6.4 locator correct; "piping" R04 |
| 1.7 | Thm 9.1 p.107; remark after Def 9.2 pp.107–108 | lines 2784–2823 | correct; the remark after 9.1 gives H_*(W,V′) = 0 by duality, as Check :715 says |
| 2.2 | KM Lemmas 2.1–2.2 pp.505–506; Θ₁ = Θ₂ = 0 p.507; Milnor Thm 8.1 (index 0) p.100; Prop B proof p.110 | KM lines 56–107, 142–144; Milnor 2614–2615, 2871–2875 | correct; KM's sum uses i₁ preserving and i₂ reversing orientation, matching 2.2; Lemma 2.2 assumes simply connected, n ≥ 3 |
| 2.3 | KM Lemmas 2.3–2.4 pp.506–507 | KM lines 108–136 | correct; half-disc H² and the formula `((2t−1) sin θ, (2t−1) cos θ)` match |
| 8.2 | KM proof of Thm 3.1 p.508; Lemma 4.5 p.511; Remarks p.512 | KM lines 174–177, 292–307, 316–319 | correct |
| 8.3 | KM p.508 Case 1 | KM lines 180–184 | correct; Bott's table gives 0 exactly for n ≡ 3, 5, 6, 7 |
| 9.2 | KM p.512 table | KM lines 319–327 | correct (Π₄ = Π₅ = 0); Toda, Gray, Fomenko–Fuchs not verifiable |
| 9.3 | Toda Prop 5.11 p.46 | — | not verifiable (below) |
| 9.4 | KM p.512 table | KM lines 319–327 | correct for the orders, k = 1…6; Toda Ch. XIV not verifiable |
| 9.5 | Snaith Example 8.3; Browder Thms 1.4, 3.2 | `Sna10` (arXiv 1001.4751v1) line 1153–1155 | Snaith correct (existence of Arf-one framings of S³×S³ only); Browder not verifiable |
| 10.1 | no source locator; DifferentialGeometry Layer 2, AlgebraicTopology Stage 6 | main DifferentialGeometry :341; AlgebraicTopology Stage 6 items 3–4 | suppliers resolve |
| 10.4 | Milnor §9 Prop B p.109, proof p.110; KM p.504 | Milnor lines 2847–2898; KM lines 37–40 | correct; Prop B's proof uses the Kervaire–Milnor–Wall bounding result for n = 4, 5, 6 and then Prop A |
| `sphere_parallelizable_iff` | Hatcher VBKT §1.1 p.5; Thm 2.16(b) p.59 | `hatcher_vbkt` lines 195–208, 2326–2330 | correct; 2.16(b) with m = n+1 gives n ∈ {0,1,3,7} |

**Adversarial table.** Each row gives the values computed this round.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `exists_diffeomorph_prod_Icc_of_hCobordism` | W = S⁵×I, M₀ = S⁵×0; W = D⁶, M₀ = S⁵; W = (S⁵×I) minus a ball; n = 4; M₀ = ∅ | H₅ ℤ→ℤ at both ends and f = id; M₁ = ∅ has π₀ = ∅ ≠ {*}, and H₅ ℤ→0 fails h₀; ℤ→ℤ² fails h₀; total dimension 5 is excluded by 5 ≤ n (Milnor 9.1 needs 6); `SimplyConnectedSpace` forces W ≠ ∅, so h₀ forces M₀ ≠ ∅ | Pass |
| `sphere_parallelizable_iff` | n = 0, 1, 2, 3, 7, 15 | n = 0: empty frame exists and RHS is false, excluded by 0 < n; frames ix, (ix, jx, kx), octonion: both sides true; χ(S²) = 2: both false; m = 16 not in {1,2,4,8}: both false | Pass |
| `nonempty_orthogonalGroup_bottPeriodicity` | (k,n) = (0,11), (3,14), (6,17), (7,18) | π₉ = ℤ/2 vs π₁ = ℤ/2; π₁₂ = 0 vs π₄ = 0; π₁₅ = ℤ vs π₇ = ℤ; π₁₆ = ℤ/2 vs π₈ = ℤ/2; k + 9 = n − 2 at each | Pass |
| Bott entries, degrees 2–8 | n = i + 2; n = 4 (i = 3), 8 (i = 7), 5 (i = 4), 6 (i = 5) | 0, ℤ, 0, 0, 0, ℤ, ℤ/2; π₃SO(4) = ℤ², π₇SO(8) = ℤ², π₄SO(5) = ℤ/2 and π₅SO(6) = ℤ are excluded by the bounds | Pass |
| fourth and fifth stems | n = 6 and 5; n = 7 and 6 | π₁₀(S⁶) = 0 (10 = 2·6−2) but π₉(S⁵) = ℤ/2; π₁₂(S⁷) = 0 but π₁₁(S⁶) = ℤ | Pass |
| sixth stem | n = 8; n = 4 | π₁₄(S⁸) = ℤ/2 with 14 ≤ 14; π₁₀(S⁴) = ℤ/24 ⊕ ℤ/3 is excluded | Pass |
| seventh stem | n = 9; n = 8 | π₁₆(S⁹) = ℤ/240 with 16 ≤ 16; π₁₅(S⁸) = ℤ ⊕ ℤ/120 is excluded | Pass |
| `smoothPoincareSix_oriented` | S⁶ with A = B; A the reflected atlas; S³×S³; ℂP³ | transition sign +1; −1, so compose with a reflection (sign (−1)(−1) = +1, M connected); H₃ = ℤ² ≠ 0 and H₂ = ℤ, so no homotopy equivalence | Pass |
| 1.2 elementary cobordism | index 0 on Dⁿ; index 1 on a band | H_*(W,V₀): ℤ in degree 0; ℤ in degree 1 (Cor 3.15) | Pass |
| 1.3 trading | dim W = 6, 7 | 6: remove 0,1,5,6, leaving 2,3,4 within 2 ≤ λ ≤ 4; 7: remove 0,1,6,7, leaving 2…5 within 2 ≤ λ ≤ 5 | Pass |
| 1.4 Whitney move | local pair of signs +1, −1 | count 2 → 0, signed sum 0 → 0 | Pass |
| 1.5 hypotheses | (p,q) = (3,3) in S³×S³; P = S³×a ⊔ −S³×b | 6 ≥ 5, s = 3, r = 3 needs no π₁ condition; no arc in P, componentwise counts (1,−1) | Pass (locator R04) |
| 1.6 level dimension five | (r,s) = (2,3), dim W = 6 | r + s = 5, s = 3, r = 2 needs injectivity; attaching circle codimension 5 − 1 = 4; Thm 6.4 needs λ + 1 = 3 ≤ n − 3 = 3 | Pass (locator R04) |
| 2.2 n = 1, 2 route | Σ = T² (control), S², S¹ | χ(T²) − 2 = −2, so c₁ = 2 remain (not a homotopy sphere); χ(S²) − 2 = 0, so c₁ = 0; S¹ leaves two arcs | Pass |
| 2.3 inverse witness | Σ = Sⁿ; one-handle cylinder | V = D^(n+1), W = Sⁿ×I, Hₙ ℤ→ℤ; Sⁿ∨Sⁿ∨S¹ with π₁ = ℤ and Hₙ = ℤ² | Pass |
| 8.2 sequence `π_n SO → π_nˢ → A_n → π_(n−1) SO` | n = 6, 7, 8 | π₅SO = 0 and im J₆ = 0, so A₆ = ℤ/2; π₆SO = 0 and J₇ onto ℤ/240, so A₇ = 0; obstruction 240 has J-image 0 | Pass |
| 8.3 Case 1 | n mod 8 = 0…7 | π_(n−1)SO = ℤ, ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0 | Pass |
| 9.2 Barratt–Toda instances | (η₂,ν₄); (η₂,ν′) | sign (−1)^(1·3) = −1; C = η₅ν₆ + ν₅η₈ = 0 + ν₅η₈ = Pι₁₁ (ι₄∧ι₇ = ι₁₁); C = η₄(2ν₅) + (Eν′)η₇ = 2(Eν′)η₇ + (Eν′)η₇ = (Eν′)η₇ = Pη₉ (ι₄∧η₅ = η₉) | Pass |
| 9.2 diagonals | n = 4, 5, 6 | (ℤ/2)²/⟨a⟩ ≅ ℤ/2{c}, then /⟨c⟩ = 0: π₁₀(S⁶) = 0; π₁₀(S⁵) = ℤ/2{cη₉}, killed by Pη₁₁; π₁₁(S⁶) ≅ 2ℤ_(2) by H; /⟨Pι₁₃⟩ = 0: π₁₂(S⁷) = 0 | Pass |
| 9.2 odd primes | p = 3: 2p−3 = 3, 4p−5 = 7; p = 5: 7, 15 | 3-parts of π₃…π₇ˢ: 3, 1, 1, 1, 3; 5-parts of π₁…π₁₄ˢ trivial except π₇ (5); π₁₅ˢ = ℤ/480 ⊕ ℤ/2 has 5-part 5 | Pass |
| 9.3 ν² | ν₄∘Σ³ν₄ | Σ³ν₄: S¹⁰→S⁷, ν₄: S⁷→S⁴; stable from n = 8 (14 ≤ 14) | Pass |
| 9.4 table | k = 0…6 at n = k+2; n = k+1 | ℤ, ℤ/2, ℤ/2, ℤ/24, 0, 0, ℤ/2; π₃(S²) = ℤ and π₇(S⁴) = ℤ ⊕ ℤ/12 break n = k+1; −ν ≠ ν since 2ν ≠ 0 in ℤ/24 | Pass |
| 9.5 Arf of ν×ν | Lie framings; normal-bundle refinement | q(a) = q(b) = 1 gives Arf 1·1 = 1; π₂SO(3) = 0 makes the unframed refinement 0 on a, b, a+b | Pass |
| 10.1, 10.4 | M = S⁶; identity; reflection | H₆ = ℤ, so orientable; signs +1 and −1 | Pass |
| R02 duplicate | π_i(SO(m)) vs π_i(O(m)), i ≥ 1 | identity component, so equal; #1799:376 at j = k equals the Bott headline; #1799:382 at j = 1, 3, 4, 5 equals the four vanishing headlines | Finding R02 |
| R01 duplicate | ΣJ₂(S¹) | S²∨S³ (H₂ rank 1) vs Cartesian S²∨S²∨S²∨S³ (rank 3) | Finding R01 |

**Library declarations opened.**
- Branch pin `a91d3aa`: `TauCeti/Geometry/Manifold/Orientation.lean`:178 (`orientationPreservingGroupoid`, through `orientationPreservingPregroupoid`) and :332 (`IsOrientedAtlas`).
- Main's pin `2fd255d`, one per README line citation, all matching:
  - `Orientation/OrientedAtlas.lean`:283, :129; `Orientation/Basic.lean`:32; `Orientation/Preserving.lean`:63;
  - `Boundary/Charts.lean`:195, :321, :374;
  - `ConnectedSum/Oriented.lean`:128, :143, :155, :160, :208, :222, :238, :295; `ConnectedSum/Orientation.lean`:250;
  - `Sard/EqualDimension.lean`:105, :112; `Degree/Basic.lean`:76; `Morse/Deformation.lean`:259;
  - `AlgebraicTopology/Sphere/SimplyConnected.lean`:408; `Topology/Homotopy/MappingCylinder.lean`:87, :425;
  - `Plumbing/E8.lean`:63, :199; `Plumbing/IntersectionForm.lean`:108; `Topology/Surgery/Basic.lean`:189.
- Main's Mathlib `1b1ccf4`: `SingularSet.lean`:50, :66, :74; `CompactlyGeneratedSpace.lean`:68; `Bernoulli.lean`:696 (`padicValRat_bernoulli`, with `[Fact p.Prime]` from :682, so "for a prime p" is right); `PoincareConjecture.lean`:41.

**Cross-roadmap citations resolved** (main `3090489` unless a head is named):
- AlgebraicTopology on main has Stage 4 items 4–7 (:535–:817), Stage 6 item 4 and Stage 8 items 3, 4, 5, 7 and 11b (:1993).
  - "Stage 4 item 8" is defined only at the open revision #1652 (`db70d31`), whose README:850 maps "Stage 4 items 1–8 are §§4.1–4.8" and whose :1765 is "### 4.8 Compact generation and the pointed adjunction".
  - The description names #1652 in its depends-on list and its merge-order paragraph, so this is a declared dependency, not a finding. #1652 no longer cites HomotopySpheres, so no cycle remains at its head.
  - :902–904 and :3272–3274 give the 3A.1 → Stage 4 item 8 mapping that main's AlgebraicTopology (:115–117, :567, :2096–2111) and the other consumers need.
- GeometricTopology §§1.1 :788, 1.2 :822, 1.3 :851, 1.3.1 :888 (regular bands, elementary handle step), 1.4 :939 (associativity up to orientation-preserving diffeomorphism), 1.5 :974, 4.3.1 :2430 (Arf algebra with m = 0 included), 11.3 :7887.
- MorseTheory M3 :453, M5 :857; HeegaardFloer Lane M :217; DifferentialGeometry Layer 2 :341.
- DGFloer Layer 1 item 2 (fibration LES, Serre spectral sequences) and item 4 (Serre classes).
- GeneralizedCohomology G5 item 6 (rational spectral Hurewicz).
- TopologicalKTheory T1.5a :364, T1.6d :721, T2 item 5 (positive Adams operations), T4 item 8 (sphere groups), T7 :1517.
- CharacteristicClasses C1.2b :599 (the counit of `sSetTopAdj`), C6 items 2–3, C7 item 3 (TSⁿ ≅ x^⊥ adapter).
- RiemannianGeometry R3.3c :560, R3.4 :578 (sphere Freudenthal); SpinGeometry G4 :395.
- SpinRepresentations is on main under RepresentationTheory, Layer 7 :881 ("L7").
- TangentialBordism at #942 `d2fece9`: B3.2(a) :469, B1.6 :505, B1.1 :775, B1.2 :948, B4.1 :1232, B4.2 :1292, B4.7 :1376, B5.2 :1536, B3.2(b) :2394.
- StringOrientation at #948 `07f0981`: S2.2 :551, S2.3 :607 (π₃S ≅ ℤ/24 with ν, native π_(n+3)(Sⁿ) for n ≥ 5).
- IndexTheory at #1077: I7.2 :1371, I7.5 :1514.
- Merge order: suppliers IndexTheory 10, StringOrientation 11 and TangentialBordism 14 precede HomotopySpheres at 45.
- Main's TopologicalKTheory consumes 4B (:402, :723, :1605, :1635) while 9A consumes T7. At layer level this is acyclic: 4B uses no T7 (:484–485), 9A → T7 → 4B.

**Ownership and overlaps.**
- I searched main and the open heads (`roadmaps grep`) for the h-cobordism theorem, parallelizable spheres and Hopf invariant one, Θ₆, ℤ/240, the Kervaire–Milnor sequence and real Bott periodicity. The only second owners are those of R01 and R02.
- TangentialBordism (#942) :59 explicitly does not own Hopf invariant one, and DGFloer (#963) cites 4A–4B.
- `scratch/overlaps.md`: #284 conflicts in both files and is the baseline this pull request carries, as its description says. No id this README cites is dropped by an open pull request. `scratch/citations.md`: nothing unresolved.

## Not verifiable

- Toda, *Composition Methods in Homotopy Groups of Spheres* (1962): Lemma 5.4, (5.8), Props 5.6, 5.8, 5.9, 5.11 and Ch. XIV. The README marks these locators as uncertified. The sources service found only a paywalled page. The 2-local values used in 9.2–9.4 were recomputed above instead.
- Gray (2001, Springer chapter, DOI 10.1007/978-3-0348-8312-2_11) and Fomenko–Fuchs (Springer GTM 273): the service reports both "uncertified: paywalled".
- Browder (1969), Bott (1959), Smale (1961) and James (1955): JSTOR landing pages only; the service found no legal source.
- Wall, *Surgery on Compact Manifolds*: AMS ebook, no legal source.
- Adams–Atiyah (1966), Milnor's *Topology from the Differentiable Viewpoint* and *Morse Theory*, Steenrod, Husemoller, Hirsch, Kosinski, Pontryagin and Thom: not tried this round; none is in a seeded target.
- The roadmap's `sources.toml` records only the seven cached texts. Toda, Gray, Fomenko–Fuchs, Browder, Bott, Wall, Snaith and the rest have no entry, so their status is recorded nowhere but in the README's prose.

## Source issues

- none
