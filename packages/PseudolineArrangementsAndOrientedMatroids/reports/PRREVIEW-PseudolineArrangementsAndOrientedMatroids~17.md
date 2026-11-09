# Review of PseudolineArrangementsAndOrientedMatroids (pull request #1523 at 17149ad)

**Verdict:** needs changes

This is a full review of the head, not an incremental one.

- **Previous review (of f542605):** four of its five findings are repaired. R03 is partly repaired: the folder-80 References entry is still missing, and the route the author added to 5.4 cites the wrong target. Both are carried into R02 and R03 below.
- **Gate:** it passes, apart from the expected `NOT IN ORDER` line. The dependency check against the candidate order reports 0 problems.
- **Lean:** `Suggested.lean` elaborates with 51 warnings, all `sorry`. No binder is lost.
- **Findings:** four: one P2 and three P3.

## R01 (P2) — 4.5 states the converse flip theorem without its uniformity hypothesis

- **Location:** `TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/README.md`:
  - line 999–1000: "`Chirotope.exists_triangle_of_flipFun`: if the flip at three distinct elements is a chirotope, they are the walls of a triangle";
  - line 997 states `Chirotope.isChirotope_flipFun` "for a uniform χ", with no finiteness.
- **Claim:** the README statement of `exists_triangle_of_flipFun` has neither "uniform" nor a finite `E`. Its Lean signature (`Suggested.lean` line 553–554) has both. Without uniformity the README statement is false.
- **Witness:** take the near-pencil `e₁, e₂, e₁ + e₂, e₃` of 4.5's Checks.
  - `χ(e₁, e₂, e₁ + e₂) = 0`, so that flip is `χ` itself, a chirotope (0 three-term violations, enumerated).
  - Its 12 topes have walls `{pᵢ, pⱼ, e₃}`; none has walls `{e₁, e₂, e₁ + e₂}`.
- **Repair:** in README 4.5, read:
  - "`Chirotope.isChirotope_flipFun`: for a uniform `χ` on a finite `E` the flip at a triangle is a chirotope (…), and it is uniform;"
  - "`Chirotope.exists_triangle_of_flipFun`: for a uniform `χ` on a finite `E`, if the flip at three distinct elements is a chirotope, they are the walls of a triangle (…)".

  Add the witness to the 4.5 Checks as a negative control: "Uniformity is needed in the converse: for the near-pencil, the flip at the three concurrent elements is `χ` itself, a chirotope, and no triangle has those walls."

  A readable locator for flips at triangles of simple arrangements is Richter-Gebert–Ziegler 2017, §6.3.3, p. 175 (richtergebertziegler2017 line 719–725).
- **Tested:**
  - The near-pencil is excluded by "uniform".
  - On the uniform alternating chirotope on five elements, enumeration gives 0 violations for the flips at the five triangles and 7200 for each of the five other triples. This is what the converse requires.

## R02 (P3) — 5.4's new route takes the pseudoline picture from 2.5, and its *Needs:* line omits Layer 3

- **Location:**
  - README line 1108–1111: "the extension of a position is a new pseudoline (2.5), and perturbing it off each vertex of the arrangement it passes through … gives a generic position above it";
  - *Needs:* line 1116: "2.5, 2.7, 5.1, 5.2";
  - Layer 5 Dependencies, line 1152: "5.4 uses 5.1–5.2".
- **Claim:** the route needs the topological representation of the extension, which 2.5 does not provide.
  - 2.5 defines the projective face poset; it does not draw an extension as a pseudoline.
  - 5.5 gives the unmarked representation, but 5.5 needs 5.4, so citing it here would be circular.
  - 3.6 gives the representation, but it needs a simple chirotope with a generic line at infinity. The extension at a position need not be either.
- **Witness:** 5.4's third Check, `v none = e₁`.
  - It is a position whose extension has `none` parallel to `e₁`: not simple, so 3.6 does not apply to it.
  - 5.5 (*Needs:* 1.7, 3.6, 5.4) cannot be cited from 5.4.
- **Repair:**
  - In 5.4, replace "the extension of a position is a new pseudoline (2.5)" with: "draw the extension by 3.6: take its simplification (1.7), which is `χ` when `none` is parallel to an element, add a lexicographic extension along an ordered basis as the line at infinity (generic, as proved below), and relabel; the new element is then a wire of a monotone arrangement, whose localization is read off by 3.3 and 3.5".
  - Make the *Needs:* line "1.7, 2.5, 2.7, 3.3, 3.5, 3.6, 5.1, 5.2".
  - Make the Layer 5 Dependencies "5.4 uses 1.7, 3.6 and 5.1–5.2".
  - Make line 227–228 of "How to read the build": "Layer 5 builds single-element extensions on Layers 1–2, draws positions with 3.6 in 5.4, and closes the unmarked representation with 3.6".
  - The same round added 1.5 and 1.6 to 3.7's *Needs:* line, but the Layer 3 Dependencies (line 889–890) still says "3.7 uses 0.3 and Layer 2". Make it "3.7 uses 0.3, 1.5, 1.6 and Layer 2".
- **Tested:** on the Check's instance:
  - the simplification is `χ`;
  - the lexicographic extension `[e₁⁺, e₂⁺, e₃⁺]` gives four lines in general position, which 3.6 draws;
  - moving `e₁`'s wire off its two vertices gives `e₁ + ε(a e₂ + b e₃)`, the four generic positions above it that the Check lists.

  3.6's *Needs:* line (1.5, 1.7, 2.7, 3.3) contains no Layer 5 target, so no cycle arises.

## R03 (P3) — Locators: targets with no locator or no theorem number, and folder 80 still has no References entry

- **1.3** (line 393–399, sampled) has no locator.
  - **Repair:** append "(Richter-Gebert–Ziegler 2017, §6.2.3, p. 167, (CHI1): the supports of a chirotope are the bases of a matroid; §6.3.1, pp. 172–173: loops, and uniformity as a chirotope with values in `{+, −}`)".
  - **Tested:** richtergebertziegler2017 line 373, 592–593 and 605–607.
- **3.4** (line 717–721, sampled; `chiFun_ofLines` is a headline) has no locator.
  - **Repair:** append "(Richter-Gebert–Ziegler 2017, §6.2.3, p. 168: the chirotope of a vector configuration is the sign of its determinants; for `i < j < k`, `det [(-1, a i, b i); (-1, a j, b j); (-1, a k, b k)] = (a i - a j) * (a j - a k) * (crossX j k - crossX i j)`, and `det [(-1, a i, b i); (-1, a j, b j); (0, 0, 1)] = a i - a j`)".
  - **Tested:**
    - Expanding the determinant gives `(aᵢ − aⱼ)(bₖ − bⱼ) − (aⱼ − aₖ)(bⱼ − bᵢ)`, and `crossX j k − crossX i j` is that numerator over `(aᵢ − aⱼ)(aⱼ − aₖ)`.
    - On the lines of 3.1 the two products are `1 · 1 · (2 − 1) = 1` and `1 − 0 = 1`, the determinants of 3.4's first Check.
- **5.3** (line 1088–1092; `levi_enlargement` is a headline) cites "(Levi 1926)" with no theorem or page.
  - **Repair:** "(Levi 1926; Felsner–Goodman 2017, Theorem 5.1.1, p. 126, for two distinct points not on a common pseudoline)".
  - **Tested:**
    - felsnergoodman2017 line 84–87 states the lemma with that hypothesis, which is the README's second clause.
    - The first clause (`Y e = Z e = 0` allowed) is met by the parallel extension of 5.2.
- **8.4 (ii)** (line 1444–1445, sampled): "Björner–Edelman–Ziegler 1990" has no theorem or page.
  - **Repair:** give the theorem and page stating that the tope graph determines a simple oriented matroid up to reorientation, recorded `uncertified`: doi:10.1007/BF02187790 resolves only to a paywall.
- **1.5** (line 445, sampled) cites BLSWZ §3.4 and §3.6 for deletion and contraction.
  - The Handbook points to BLSWZ §3.3 for minors (richtergebertziegler2017 line 576–577).
  - **Repair:** "(BLSWZ §3.3 for minors; §3.4 for duality; §3.6)".
- **Research context** (line 1691–1694) still cites folder 80 without a References entry. This is the last bullet of the previous R03, not repaired.
  - **Repair:** add "- A. Grothendieck, manuscript notes on pseudoline arrangements, Université de Montpellier, fonds Grothendieck, folder 80, https://grothendieck.umontpellier.fr/80.pdf (pp. 20, 22, 24 and 28)."

## R04 (P3) — 3.5 (ii) holds for every `n` in Lean, but the README states it only for `n ≥ 2`

- **Location:**
  - README line 735–739: "For `n ≥ 2` and `L = covectorsOf A.chiFun`: … (ii) `MonotoneArrangement.isPathConnected_cell`: every nonempty cell is path-connected";
  - `Suggested.lean` line 475–476 has no hypothesis on `n`.
- **Claim:** the README's generality is narrower than the Lean signature's.
- **Witness:** (ii) does not involve `L`.
  - For `n = 0` the only cell is `ℝ²` (3.2's Check).
  - For `n = 1` the cells are the open regions above and below one graph, and the graph itself. Each is path-connected.
- **Repair:** "For `n ≥ 2` and `L = covectorsOf A.chiFun`: (i) …; (ii), for every `n`, `MonotoneArrangement.isPathConnected_cell`: …".
- **Tested:**
  - The witness covers `n = 0, 1`.
  - For every `n`, a nonempty cell projects onto an interval of abscissae: an intersection of half-lines `{x | f j x < f i x}`, since each pair crosses once. Over each abscissa its fibre is an interval of ordinates with continuous ends.

## Previous findings (review of f542605)

| Finding | Status | Evidence at this head |
|---|---|---|
| R01 | repaired | `Suggested.lean` line 4 imports `TauCeti.GroupTheory.Coxeter.Basic`, and the local lemma is deleted. Lines 716, 859 and 885 call `CoxeterSystem.commute_simple_of_eq_two`. README 7.1 (line 1266–1267) cites it. 7.5 (line 1346–1349) and the contracts (line 197–200) cite `MonoidHom.quotientComapStabilizerEquiv`. |
| R02 | repaired | (a) `geometricRepresentationFun_stringCoxeterMatrix_injective`: Lean line 951–954, README line 1653–1655, docstring line 77. (b) README line 1200–1201: "its nine points are pairwise non-proportional, so it is simple". (c) Lean line 788 drops the binders; README line 1474–1476 and its Check (line 1486–1487) follow. |
| R03 | partly | Repaired: the 4.2 locator (line 924–927); 4.5's "p. 139" (line 1010), FG p. 133 (line 998), BLSWZ Theorem 7.3.9 (line 1000) and the Roudneff–Sturmfels pages (line 1746); the *Esquisse* at Convention 10 and 7.1 (line 143–144, 1267–1269). Open: the 5.4 route (line 1108–1111) has the defect of R02; the folder-80 References entry is R03 here. |
| R04 | repaired | The 3.5 Check (line 756–758) adds "their three negatives, with `X none = -1`". The 8.4 Check (line 1456) reads "the wreath product of `ℤ/2` by `S₃`". |
| R05 | repaired | 3.7 *Needs:* line 795 reads "0.3, 1.5, 1.6, 2.5, 2.6". The 4.5 *Needs:* line 1011 adds 2.5. |

## Verified sound

### Gate, order and Lean

- **The brief's gate command at 17149ad:**
  - Every counter is 0 except `depcheck=1`, whose line is "NOT IN ORDER: PseudolineArrangementsAndOrientedMatroids (insert it after its last supplier)". That is not a defect before placement.
  - The worker's gate on this head is 0 everywhere, including `build=0`.
- **Dependency check** (`--order merge-order-candidate.txt --movable`):
  - Output: `depcheck: 236 roadmaps, 2262 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
  - The candidate order lists this roadmap at line 401. Its roadmap suppliers, RootSystems and GraphConnectivityAndFlows, are on main.
- **Outside the folder:** `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 51 warnings, all "declaration uses `sorry`" (51 sorried theorems). There is no `set_option`, `lemma` or sorry'd data.
- **Binders:** I ran `#check @name` for all 122 declarations in one scratch copy (exit 0) and compared each type with its README statement. Kept binders include:
  - `[Nonempty D]` and `hfix` (`isConnected_orientationDoubleCover_iff`);
  - `[Finite D]` and `hS` (`natCard_cell_orientationDoubleCover`);
  - `[Nonempty D]`, `hG` and `hS` (8.1);
  - `[Finite D] [Nonempty D]` (`natCard_aut_le`, `isRegular_iff_natCard_aut`);
  - `[IsStrictOrderedRing 𝕜]` and the span hypothesis (1.4);
  - `[Finite E]` and `IsUniform` (the three 4.5 theorems);
  - `[Finite E]`, `IsSimple` or `IsUniform`, and `Nat.card E ≤ 8` (6.4).

  The only differences from the README are R01 and R04.
- **One-tactic probe:** every `sorry` was replaced by `first | rfl | (simp; done) | infer_instance | trivial | (norm_num; done) | omega | decide | (aesop; done)`. All 51 theorems fail, at 51 distinct lines.
- **Headlines:**
  - Every end theorem of the Summary is stated: 0.4, 2.2, 2.3, 3.5, 3.6, 3.8 (a), 4.4, 4.5, 5.3, 5.5, 6.1, 6.3, 6.4, 7.5, 9.1, 9.5 and 9.6.
  - 3.7, 8.2 and 8.4 are named in the docstring with their missing carrier (the map of a projective arrangement).
  - The 9.5–9.6 computations stay as headlines, as earlier rounds settled.
  - Nothing in the file restates a definition or mirrors a Check.

### Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`)

**Tau Ceti:**

| Declaration | File and line |
|---|---|
| `CoxeterSystem.commute_simple_of_eq_two` | `GroupTheory/Coxeter/Basic.lean` 113 |
| `MonoidHom.quotientComapStabilizerEquiv` (needs `IsPretransitive ρ.range X`, which 7.3 gives for `monodromyHom`) | `GroupTheory/GroupAction/Transitive.lean` 156 |
| `CoxeterSystem.orderOf_simple_mul_simple` (`orderOf = M i i'`) | `GroupTheory/Coxeter/Geometric.lean` 525 |
| `CoxeterSystem.orderOf_simple` | `GroupTheory/Coxeter/Geometric.lean` 553 |
| `CoxeterSystem.geometricRepresentation` | `GroupTheory/Coxeter/Geometric.lean` 479 |
| `CoxeterSystem.geometricRepresentation_simple` | `GroupTheory/Coxeter/Geometric.lean` 485 |
| `CoxeterMatrix.geometricForm` | `GroupTheory/Coxeter/Geometric.lean` 125 |
| `CoxeterMatrix.geometricReflection` | `GroupTheory/Coxeter/Geometric.lean` 161 |
| `CoxeterMatrix.isLiftable_geometricReflection` | `GroupTheory/Coxeter/Geometric.lean` 458 |
| `TauCeti.braidEquivalent_of_isReduced_wordProd_eq` | `GroupTheory/Coxeter/Matsumoto.lean` 83 |
| `CoxeterSystem.IsBraidMove` | `GroupTheory/Coxeter/BraidEquivalence.lean` 56 |
| `CoxeterSystem.BraidEquivalent.wordProd_eq` | `GroupTheory/Coxeter/BraidEquivalence.lean` 180 |
| `TauCeti.permCoxeterSystem` | `GroupTheory/Perm/Coxeter.lean` 195 |
| `TauCeti.permCoxeterSystem_wordProd` (`wordProd ω = (ω.map transposition).prod`) | `GroupTheory/Perm/Coxeter.lean` 213 |
| `TauCeti.permCoxeterSystem_length_eq_card_inversion` | `GroupTheory/Perm/Coxeter.lean` 293 |
| `TauCeti.BraidGroup.transposition` | `GroupTheory/SpecificGroups/Braid/Basic.lean` 264 |
| `TauCeti.TriangleGroup.natCard_two_three_three` | `GroupTheory/TriangleGroup/Polyhedral.lean` 404 |
| `TauCeti.TriangleGroup.natCard_two_three_four` | `GroupTheory/TriangleGroup/Polyhedral.lean` 414 |
| `TauCeti.TriangleGroup.natCard_two_three_five` | `GroupTheory/TriangleGroup/Polyhedral.lean` 424 |
| `TauCeti.TriangleGroup.equivIcosahedral` | `GroupTheory/TriangleGroup/Polyhedral.lean` 460 |

All but the four `Polyhedral.lean` names were `#check`ed in one scratch file, which exits 0. That module has no built object file, so its names were read at file and line.

**Mathlib:** every contract name was `#check`ed in the same file, together with these evaluations by `decide`:
- `(CoxeterMatrix.B 3).M 1 2 = 4`;
- `CoxeterMatrix.H₃.M 0 1 = 3`, `M 1 2 = 5` and `M 0 2 = 2`.

| Declaration | File and line |
|---|---|
| `Matroid.ExchangeProperty` | `Combinatorics/Matroid/Basic.lean` 174 |
| `Matroid.ofIsBaseOfFinite` | `Combinatorics/Matroid/IndepAxioms.lean` 524 |
| `Matroid.restrictSubtype` | `Combinatorics/Matroid/Map.lean` 636 |
| `Matroid.restrict_closure_eq` | `Combinatorics/Matroid/Closure.lean` 989 |
| `SimpleGraph.bipartiteDoubleCover` | `Combinatorics/SimpleGraph/Bipartite.lean` 538 |
| `CoxeterSystem.lengthParity` | `GroupTheory/Coxeter/Length.lean` 129 |
| `CoxeterMatrix.IsLiftable` | `GroupTheory/Coxeter/Basic.lean` 296 |
| `CoxeterMatrix.B` | `GroupTheory/Coxeter/Matrix.lean` 123 |
| `CoxeterMatrix.H₃` | `GroupTheory/Coxeter/Matrix.lean` 260 |
| `Graph.ofSimpleGraph` | `Combinatorics/Graph/Simple.lean` 119 |
| `Graph.toSimpleGraphOfSimpleGraphIso` | `Combinatorics/Graph/Simple.lean` 132 |
| `Finsupp.linearEquivFunOnFinite` | `LinearAlgebra/Finsupp/Defs.lean` 60 |
| `CircularOrder` | `Order/Circular.lean` 151 |
| `Fin.revPerm` | `Data/Fin/Rev.lean` 40 |

### Seeded sample (15 targets)

| Target | Locator | Result |
|---|---|---|
| 1.1 | BLSWZ Def. 3.5.3, Lemma 3.5.4 | Not readable. The structure agrees with (CHI1)–(CHI2), richtergebertziegler2017 line 371–378 (p. 167). Allowing `a, b, c, d` in `λ` or repeated adds only all-zero or opposite-pair triples. |
| 1.2 | BLSWZ Def. 3.5.3 (B2′), §3.6 | Not readable. The Checks were computed (table). |
| 1.3 | none | R03 |
| 1.5 | BLSWZ §3.4, §3.6 | Not readable. Minors are §3.3 per richtergebertziegler2017 line 576–577 (R03). |
| 1.6 | FG §5.1 p. 126; §5.2 p. 131 | ✓ felsnergoodman2017 line 47–50 (labelled isomorphism classes = reorientation classes) and line 297–303 (abstract order types) |
| 2.2 | BLSWZ §3.5, §3.7, Thm 3.5.5, Prop. 3.7.2 | Not readable. Supported by richtergebertziegler2017 line 347–354 (covectors are finite compositions of cocircuits, p. 167) and line 402–407 (cocircuits from a chirotope, unique up to sign, p. 168). |
| 3.4 | none | R03 |
| 3.5 | RGZ Thm 6.2.4, p. 169 | ✓ richtergebertziegler2017 line 463–468 (no loops; `chiFun` has none) |
| 3.8 | Kelly–Rottenberg Thm 3.6 | ✓ kellyrottenberg1972 line 191–198 (`λ ≥ 3n/7`, p. 621) |
| 3.8 | Bokowski–Pokora Thm 1.3, Cor. 1.4 (arXiv) | ✓ bokowskipokora2018 line 86–94 (arXiv v4, p. 2) |
| 3.8 | Csima–Sawyer, for `n ≠ 7` | Via bermangrunbaumlenchner2008 line 667–669 (Theorem 13) |
| 3.8 | BGL p. 221, fn. 3 | ✓ bermangrunbaumlenchner2008 line 875 and 919 |
| 3.8 | LPS §3.2, Problem 5; Green–Tao for large `n` | ✓ lundpurdysmith2014 line 188–204 |
| 3.8 | folder 80 | Not readable (Not verifiable) |
| 7.4 | Wilson §5, p. 268 | ✓ wilson2012 line 131–133 (`i`-faces as orbits of `⟨rⱼ, j ≠ i⟩`) |
| 7.5 | Wilson §5, p. 270; Tau Ceti | ✓ wilson2012 line 173–179; declaration above |
| 8.1 | Wilson §5, p. 270 | ✓ wilson2012 line 187–190 (orbits of `C⁺`, bipartite flag graph) and line 115–116 (fixed-point-free, pairwise different `rᵢ`), as the README says |
| 8.4 | Eppstein Lemma 1 and proof | ✓ eppstein2014 line 121–134 (`G*` 3-connected planar after Bose et al.; pseudolines as paths through opposite edges) |
| 8.4 | Whitney 1932; Bondy–Murty Thm 10.28; BEW 2003; BEZ 1990 | Not readable; BEZ has no theorem number (R03) |
| 9.3 | McMullen–Schulte §2A, Thm 2E11; Humphreys §5.5 | Not readable. The flag-system clause agrees with wilson2012 line 203–204. |
| 10.2 | Tau Ceti `orderOf_simple_mul_simple` | ✓ `Geometric.lean` 525 |

**Other locators read** (changed or adjacent passages):
- **4.2:** felsnergoodman2017 line 66–69, 356–359 and 369–373.
- **4.3:** line 382–384.
- **4.5:**
  - Theorem 5.4.5, p. 139 (line 654–656);
  - p. 133 (line 379–381);
  - Theorem 5.5.8, p. 145 (line 924–928), for labelled simple arrangements.
- **4.4:** bergoldegelinghoang2025 line 69–77 (Definition 1, p. 16:2). The sequence runs from `X∖{x₁}` to `X∖{x₄}`, which is Convention 9 reversed.
- **9.6 "Not a target":** ahos2013 line 78 (standing assumption of simple graphs) and line 298–303 (Theorem 3.1).
- **Wilson §7, p. 272 (9.1, 9.2, Convention 12):** line 264–270 and 282–286.

### Cross-roadmap citations (main at `1bea835`)

- **RootSystems §1.3:**
  - It is at `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` line 515.
  - `geometric_faithfulness` is stated for every `CoxeterSystem` at its `Suggested.lean` line 73.
  - The transport to `I → ℝ` through `Finsupp.linearEquivFunOnFinite` is at its line 538–540.
- **GraphConnectivityAndFlows Target 1.1:** its line 224, with the isomorphism interface in that target ✓.
- **BelyiMaps:** on main ✓.
- **ConformalMapping:** in `Completed` ✓.

### Ownership and overlaps

- **Overlaps tool:** no open pull request changes this roadmap, and no id is dropped in either direction.
- **Same objects:** I ran `roadmaps grep` over the open heads and main for chirotope, oriented matroid, pseudoline, signotope, wiring diagram, maniplex, cartographic group, hemi-icosahedron, string C-group, abstract polytope, Sylvester–Gallai, non-Pappus, `stringCoxeterMatrix` and `{3,6}`. They match only this pull request (and one unrelated HabiroRings line).
- **"orientation double cover":** the hits on main (CharacteristicClasses, DifferentialGeometry, HeegaardFloer, GeometricTopology) are covers of manifolds, a different object.
- **`GMap`:** besides this roadmap, it appears only in SurfaceTopology (#271), which is on the never-cite list. This roadmap stays the owner.

### Adversarial table

Values were computed by hand, or by exact enumeration in scratch scripts.

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.3 `isConnected_iff_preconnected_flagGraph` | projective plane `(01)(23)`, `(03)(12)`, `(02)(13)`; `Fin 2` with every `adj i = 1`; empty | 1 orbit / connected flag graph; 2 orbits / 2 isolated vertices; vacuous / vacuous | true | none |
| 0.4 three theorems | one dart with `adj i = 1`; projective plane; a `{0,2}`-residue of a closed surface | Cover connected while `G` is orientable, so `hfix` is needed. `(1,1,1) ↦ (2,2,2)`, connected (odd triangle `0, 1, 3`). `a₂d ≠ a₀d` gives 4 flags, lifting to two residues. | true | none |
| 1.1 `Chirotope` (sampled) | rank 0; rank 2 on 4 with `χ13 = −1`; alternating on 5 | One empty tuple, so `±1`. `χ12χ34, −χ13χ24, χ14χ23 = 1, 1, 1`, which fails. 0 violations in 468750 instances. | true | none |
| 1.2 (sampled) | alternating on 5, `x = 1234`, `y = 15`; rank 1 | terms `0, −1, 1, −1`; `−χx₂χx₁` against `+χx₁χx₂` | true | none |
| 1.3 (sampled) | rank 0; rank 1 on 2 elements; `(1,0,0), (2,0,0), (0,1,0), (0,0,1)` | Forces `E = ∅`; unsatisfiable; the pair `{1,2}` is in no basis, not simple, with no loop | true | R03 |
| 1.4 `isChirotope_ofVectorsFun` | `(1,0), (0,1), (1,1), (1,2)`; `v = 0`; `r = 0` | `1·1 − 1·(−1) + 2·(−1) = 0`, signed terms `1, 1, −1`; zero function; empty determinant `1` | true | none |
| 1.5 (sampled) reorientation, relabelling, dual | rank 1, all ones on `Fin 3`; a three-term relation under reorientation | Dual `1, −1, 1`, from signs of `(2,0,1)`, `(1,0,2)`, `(0,1,2)`, realized by `(1,0), (0,1), (−1,−1)`. Every term gains the same `ε_a ε_b ε_c ε_d`. | true | R03 |
| 1.6 (sampled) | rank-2 alternating on 3; rank 3 on 3 | `ε₁ε₂ = ε₁ε₃ = ε₂ε₃ = −1` has product `−1 ≠ (ε₁ε₂ε₃)² = 1`; `(−1)³χ = −χ` | true | none |
| 2.2 (sampled) two theorems | `(1,0), (1,1), (0,1)`; alternating on 5; `E = ∅` | 6 cocircuits, 13 covectors; 20 cocircuits and 83 = 1 + 20 + 40 + 22 covectors; the rank-0 chirotope gives `{0}` | true | none |
| 2.3 `three_le_ncard_walls` | alternating on 5; near-pencil on 4 | wall counts `{3: 10, 4: 10, 5: 2}` on 22 topes, triangles `123, 125, 145, 234, 345`; 12 topes with 3 walls | true | none |
| 2.7 `exists_unique_circularOrder` | `E = {1,2}`, `χ12 = 1`; `(1,0), (2,0), (0,1)` | Order `(1,+), (2,+), (1,−), (2,−)` forced. Degenerate triples are true by totality and cyclicity, so the order is unique. No order exists for the parallel pair. | true | none |
| 3.3 two theorems | lines of 3.1; concurrent lines; `n = 1` | `sign(2 − 1) = 1`; `0`, so neither uniform nor simple; no injective triple | true | none |
| 3.4 `chiFun_ofLines` (sampled) | general `i < j < k`; lines of 3.1 | `det = (aᵢ − aⱼ)(aⱼ − aₖ)(crossX j k − crossX i j)`; `1 = 1·1·1`; with `none`, `aᵢ − aⱼ = 1` | true | R03 |
| 3.5 two theorems (sampled) | lines `(−1, a, b)`, point `w = (y, x, 1)`; `n = 0, 1` | `⟨v, w⟩ = a x + b − y`, `⟨v_none, w⟩ = 1`; for `n ≤ 1` the right side of (i) is empty; cells path-connected for every `n` | true | R04 |
| 3.6 `exists_monotoneArrangement` | `n = 2`; contraction at `none` | `±chiFun`, `R = {none}`; representatives in an open half-circle give `χ(some i, some j, none) = 1` for `i < j` | true | none |
| 3.8 (a) (sampled) | 3 elements; Melchior | Three 2-element flats. `f₀ − f₁ + f₂ = 1` and `2f₁ ≥ 3f₂` give `Σ(3 − ν(v)) ≥ 3`. | true | none |
| 3.8 (b)–(c) (sampled) | complete quadrangle; `Q`, `ℓ = (1,2,5)`, `δ = e₁ + e₂` | Deleting `e₂ − e₃` leaves `e₁` on 2 vertices. `δ` is on 3 vertices of the six, but on 2 in `Q ∪ {δ}`. | true | none |
| 4.4 `isSignotope_iff_exists_monotoneArrangement` | every reduced word on 3, 4, 5 wires | 2, 16, 768 words; 2, 8, 62 classes of `sign(t(jk) − t(ij))`, equal as sets to the 2, 8, 62 signotopes | true | none |
| 4.5 three theorems | alternating on 5; near-pencil on 4 | triangles 0 violations, other triples 7200 each; the near-pencil flip equals `χ` with no triangle | Lean true; README converse false | R01 |
| 5.3 `levi_enlargement` | two vertices on `e`; `Z = −Y` | the extension parallel to `e` has `(Y, 0)` and `(Z, 0)` as covectors; one projective point | true | R03 |
| 5.4 route | `v none = e₁` | not simple, so 3.6 does not apply; 5.5 needs 5.4 | route mis-cited | R02 |
| 5.5 `exists_monotoneArrangement_of_isSimple` | alternating on 3 | `n = 3`, `e = id`, `R = ∅`: `sign(2 − 1) = 1` | true | none |
| 6.1 `isRealizable_iff_exists_ofLines` | a vector with first coordinate `0` | At most one, by genericity. The shear `(p, a, b) ↦ (p + t a, a, b)` (det 1), then scaling to `p = −1`, gives distinct slopes. | true | none |
| 6.3 three theorems | `pappusPoints` | `C = (13,2,5), (15,3,8), (2,1,3)`, `det = 0`; the value `1` at `(6,7,8)` contradicts it | true | none |
| 6.4 two theorems | `Nat.card E = 3`; non-Pappus | `det(e₁, e₂, e₃) = 1`; 9 elements, not realizable, so the bound is sharp | true | none |
| 7.2 `exists_monoidHom_stringCoxeterMatrix_iff` | `p i = 0` | `(adj i * adj (i+1))⁰ = 1`, no relation | true | none |
| 7.3 three theorems | `Bool` with the swap; `Fin 3` with `swap 0 1`; empty; infinite connected `D` with finite `aut` | `2 = 2`; `2 < 3`; `1 > 0`, so `Nonempty` is needed; `Nat.card D = 0`, so `Finite` is needed | true | none |
| 7.4 residues (sampled) | tetrahedron; `J = ∅` | `⟨s₁, s₂⟩` of order 6 on 24 flags gives 4 vertices; singletons | true | none |
| 7.5 two theorems (sampled) | `H = ⊤`, `⊥`; empty | one flag fixed by every `adj i`; a free action; no subgroup | true | none |
| 8.1 (sampled) | projective plane; tetrahedron; one dart | `adj 0 * adj 1 = (02)(13) = adj 2`, so the even part `{1, a₀, a₁, a₂}` is transitive and not orientable; 2 orbits of 12; one dart is orientable and transitive | true | none |
| 8.4 (sampled) | 3 elements; 4 elements | `3!·2³ = 48` against 24; octahedral graph with 4 label triangles, 24 against 24 | true | none |
| 9.1 four theorems | `cosetGMap ⊥`; empty; tetrahedron; four lines | infinite, regular, `Aut` transitive; regular with 1 automorphism and `Nat.card = 0`; 24 / 24; 48 / 24 | true | none |
| 9.2 three theorems | right multiplications; a group of order 4 with `ρ` constant | `r_g r_h = r_{hg}`; index 2, two components | true | none |
| 9.3 (sampled) | polygon; group of order 2, constant family | ranks `−1..2`, chains of `4 = n + 3`; `⟨ρ0⟩ ∩ ⟨ρ1⟩ = G ≠ ⊥` | true | none |
| 9.5 four theorems | `H₃`, `w₀ = (s₀s₁s₂)⁵` | Length 15, odd, central; `120/2 = 60`; `(6, 15, 10)`, `6 − 15 + 10 = 1`. `g ↦ (gZ, ℓ(g) mod 2)` is a bijection `H₃ ≃ (H₃/Z) × Bool` commuting with `adj`. | true | none |
| 9.6 two theorems | `n = 2..6` | 24, 108, 192, 300, 432 elements; cells `(4,6,4)` at 2 and `(n², 3n², 2n²)` for `n ≥ 3`; orientable, since `det = −1 ≠ 1` in `ZMod n` | true, `n ≥ 3` needed | none |
| 10.2 (sampled) | `n = 0`; adjacent and distant entries | the generator acts by `−1` on `ℝ`; `orderOf = M i j` gives `0` and `2` | true | none |

## Not verifiable

- **BLSWZ, *Oriented Matroids*:** a paywalled CUP book.
  - It is cited for 1.1, 1.2, 1.5, 1.7, 2.1, 2.2, 2.4, 2.6 (general rank), 5.1, 5.2, 5.4 and Theorem 7.3.9 in 4.5.
  - 1.1, 2.2 and 3.5 were cross-checked in the Handbook.
- **Grothendieck, *Esquisse d'un programme*:** the sources service found no legal copy. Convention 10 and 7.1 cite §3, p. 14 and §4, pp. 21–22.
- **Grothendieck, folder 80:** an image-only handwritten scan. OCR is not installed on this worker. The page claims of the Research context (pp. 20, 22, 24, 28) are unchecked.
- **Paywalled papers:** for each, the DOI resolves only to a paywall, or no legal copy was found.
  - Roudneff–Sturmfels 1988 (doi:10.1007/BF00181618);
  - Björner–Edelman–Ziegler 1990 (doi:10.1007/BF02187790);
  - Bose–Everett–Wismath 2003, Whitney 1932, Csima–Sawyer 1993;
  - Levi 1926, Ringel 1956, Goodman–Pollack 1980/1984, Felsner–Weil 2001, Richter 1989.
- **Books:** Bondy–Murty, McMullen–Schulte, Humphreys and Coxeter–Moser.
- **Handbook chapters 5 and 6:** read in the editors' preliminary versions (July 16 and August 10, 2017). Pages are those printed there.
- **This review's records:** it fetched its sources into a scratch manifest. It edits no manifest and writes no `needs-references.toml`.

## Source issues

- **Gap** in kellyrottenberg1972 at Theorem 3.6, p. 621: the source states at least `3n/7` simple points for every arrangement of its Definition 2.1, which admits pencils; it should exclude pencils and `n = 1`, where there are none; affects nothing.
- **Error** in richtergebertziegler2017 at §6.2.3, p. 168: the source says `χ_X` is a chirotope for every vector configuration in `(ℝ^d)^n`; it should require `X` of rank `d`, else `χ_X` vanishes identically; affects nothing.
- **Misprint** in felsnergoodman2017 at Theorem 5.3.1, p. 134: the source writes "an arrangement A or pseudolines"; it should read "of pseudolines"; affects nothing.
