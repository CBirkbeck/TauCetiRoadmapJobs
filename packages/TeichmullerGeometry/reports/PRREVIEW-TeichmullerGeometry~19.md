# Review of TeichmullerGeometry (pull request #1169 at 8883653)

**Verdict:** needs changes

This is a full review at the head the previous round read. The folder has not changed since then. Both earlier findings are repaired; their fixes were outside this folder. There are four new findings: one P2 and three P3.

## R01 (P2) — §§2.1–2.2 count genus-two automorphisms that §8.5 shows act trivially

**Location.** `TauCetiRoadmap/TeichmullerGeometry/README.md`:
- line 419, §2.1 Check 1: "a chart built from an unmarked family near a curve with automorphisms would be `|Aut(X)|`-to-one, which the marking removes";
- line 427, §2.2: "the coarse forgetful map is not an unbranched covering at a point with automorphisms";
- line 433, §2.2 Check 3: "The coarse forgetful map at the hyperelliptic point of genus two is two-to-one near the point on the marked side, not a covering."

**Claim.**
- **The genus-two failure.** All three statements are false at a genus-two point with `Aut(X) = ⟨h⟩`, the generic genus-two point.
  - `h` fixes every point of `Teich(S_2)`.
  - `h` acts trivially on the deformation base `H¹(X, T_X)`.
  - So near such a point the unmarked chart is one-to-one and the coarse forgetful map is injective.
- **Where the statements do hold.** Only where the stabilizer acts nontrivially on `Teich(Σ)`: `Aut(X) ≠ 1` for `g ≥ 3`, and `Aut(X) ≠ ⟨h⟩` for `g = 2`.

**Witness.**
- **The roadmap's own statements.** §8.5, line 838, puts `[h]` in the kernel of the action. By §3.3, nearby points with the same image differ by a stabilizer element.
- **The computation.** `h` acts by `−1` on `H⁰(K) = ⟨dx/y, x dx/y⟩`. It therefore acts by `+1` on `H⁰(K²) = Sym² H⁰(K)`, both of dimension 3.

**Repair.**
- **Line 419:** "a chart built from an unmarked family near `X` would be `|Aut(X)/K_X|`-to-one at a generic point of its base, `K_X` the automorphisms acting trivially on the base (`⟨h⟩` in genus two, trivial for `g ≥ 3`, Layer 8.5), which the marking removes".
- **Line 427:** "the coarse forgetful map is not an unbranched covering at a point whose stabilizer acts nontrivially on `Teich(Σ)`, that is `Aut(X) ≠ 1` for `g ≥ 3` and `Aut(X) ≠ ⟨h⟩` for `g = 2` (Layer 8.5)".
- **Line 433:** "At a genus-two point with `Aut(X) = ⟨h⟩` the coarse forgetful map is injective nearby, `h` fixing every point of `Teich(S_2)` (Layer 8.5); at the Bolza point, `|Aut(X)| = 48`, it is `24`-to-one at nearby generic points, so it is branched there."
- **Re-test on the refuting instance:**
  - At `Aut(X) = ⟨h⟩` the repaired count is `|⟨h⟩/⟨h⟩| = 1`, in agreement with §8.5.
  - At the Bolza point it is `48/2 = 24`.
  - For a genus-three hyperelliptic `X`, `h` fixes a 5-dimensional subspace of the 6-dimensional base, so the count is `2`, as the `g ≥ 3` clause says.

## R02 (P3) — ModularForms is cited by item labels and a declaration it does not have

**Location.** README line 39: "the analytic-genus comparison: ModularForms Layer 10B (iii)–(v)". Line 110: "Layer 10B (iii)–(v): Riemann–Roch … Serre duality by residues, `analyticGenus_eq_topologicalGenus`".

**Claim.** ModularForms §10B on main has this content, but it has no items (iii)–(v), and no declaration `analyticGenus_eq_topologicalGenus` exists anywhere.

**Witness.**
- ModularForms `README.md` §10B, line 1173 on main, is unnumbered prose. It contains divisor Riemann–Roch (line 1206), the residue pairing and Serre duality (1213–1214), and `g_an` equal to the topological genus (1228).
- `roadmaps grep --fixed analyticGenus_eq_topologicalGenus` finds the name only in this README, ComplexCurveModuli and PseudoholomorphicCurveAnalysis, never in ModularForms.

**Repair.**
- **Line 39:** "ModularForms §10B".
- **Line 110:** "§10B: Riemann–Roch `χ(𝒪(D)) = deg D + 1 − g_an`, Serre duality through the residue pairing, and the equality of the analytic genus `dim H¹(X, 𝒪)` with the topological genus; consumed only through ComplexCurveModuli D0 item 2's comparison, never directly."
- **Re-test:** `10B (iii)` and `analyticGenus_eq_topologicalGenus` no longer occur in the README.

## R03 (P3) — The map from earlier milestone ids has no citer

**Location.**
- README line 994: "Other roadmaps cite this one by its earlier milestone and section ids".
- Lines 996–1004: the bullets for `T0`, `T3`, `T4a`, `T5`, `T7`, `T8`, `T9`, `T10` and "Layer 4.1".
- Line 1005: "which citations of `T9` and of Layer 4.1 also take".

**Claim.**
- **Nothing cites these ids.** No roadmap on main or in any open pull request cites them. The sentence at line 994 is therefore false, and the list is a record of the roadmap's drafting.
- **The last three bullets are still needed.** Lines 1005–1007 have current citers and should stay.

**Witness.**
- `roadmaps grep -i 'Teichm(ü|u)ller[^.]{0,40}\bT(0|3|4a|5|7|8|9|10)\b'`, and the corresponding `Layer 4\.1` search, both print "no match on main or in any open roadmap pull request".
- The kept bullets have citers: QuaternionArithmetic cites §9.1, and GroupActionsOnRiemannSurfaces cites §10.1.

**Repair.**
- Delete lines 996–1004.
- Replace line 994 with "Three objects that consumers take with this roadmap are supplied elsewhere:".
- In line 1005, delete ", which citations of `T9` and of Layer 4.1 also take".
- **Re-test:** the README contains no `T9` or `Layer 4.1`. The deleted ids are not headings, so the gate's id checks still pass.

## R04 (P3) — The reference entry for Epstein's Theorem 6.4 a) is false for the closed disc

**Location.** README line 1016: "Theorem 6.4 a) (a homeomorphism homotopic to the identity is isotopic to the identity, orientation preservation being asked only on the plane and the cylinders, p. 101)".

**Claim.**
- **The paraphrase is false.** Complex conjugation of the closed disc is homotopic to the identity but not isotopic to it, as §0.0d's own Check 4 (line 189) says. The paraphrase copies a gap in the source (see Source issues).
- **The roadmap's uses are sound.** It applies 6.4 a) only to closed surfaces (lines 180 and 621), where the theorem holds.

**Witness.**
- epstein1966 lines 605–607 ask orientation preservation only of the plane and the cylinders.
- Epstein's isotopy is a level-preserving embedding (lines 54–55), which keeps the local degree constant. So `z ↦ z̄`, of local degree `−1`, cannot be isotoped to the identity, of local degree `+1`.

**Repair.** Replace the parenthesis with "(for a closed surface, a homeomorphism homotopic to the identity is isotopic to the identity, p. 101; the roadmap uses it only in that case)". **Re-test:** the closed disc is not closed, so it no longer falls under the paraphrase, and lines 180 and 621 are unchanged.

## Previous findings

- **R01 of the previous report — repaired.** #903 at its head `5859c0d`, `TauCetiRoadmap/GeometricTopology/README.md` line 1460, now reads: "and the smoothing of paths is TeichmullerGeometry §0.2's." This agrees with this README's scope line 12 and with §0.2.
- **R02 of the previous report — repaired.** The pull-request description now reads: "Dependencies: FuchsianOrbifolds (#1168) and ArithmeticFuchsianGroups (#2026) supply this roadmap and consume nothing from it; GeometricTopology (#903) supplies the two-dimensional comparison of categories."

## Verified sound

### Mechanical checks at `8883653`

- **Gate.** The brief's gate command exits 0:

  ```text
  gate TeichmullerGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's run of the gate also reports `build=0`.
- **Dependency check.** The brief's command exits 0:

  ```text
  depcheck: 238 roadmaps, 2323 edges, 0 problem(s)
  ```

  - It prints no UPWARD, CYCLE or `moved:` line.
  - `ORDER.txt` places FuchsianOrbifolds at line 49, ArithmeticFuchsianGroups at 284 and TeichmullerGeometry at 285.
  - Every other supplier is on main.
- **Elaboration.** `lake env lean TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` exits 0 with 21 "declaration uses `sorry`" warnings and no other diagnostic.
- **`#check @name`.** All 52 declarations were checked in one scratch copy and all elaborate.
  - Each theorem keeps its binders. For example:
    - `isotopicRel_of_homotopicRel` carries `[CompactSpace M]` and `T2Space` on both sides;
    - `homeomorph_iff_invariants` carries `FiniteCWType` on both `M` and `N`;
    - `dehn_nielsen_baer` carries `boundary = ∅`, `Surface.IsOrientable` and `1 ≤ Surface.genus`.
  - Nothing was changed in the file.
  - `signatures.md` lists 55 entries; three of them are docstring words, not declarations.
- **Convention witnesses.** Run by `decide` in the scratch file:
  - `StandardSurface.eulerChar` gives `−2` for `orientable 2 0`, `−1` for `nonorientable 3 _ 0` and `0` for `orientable 0 2`;
  - the canonical words of `orientable 0 0`, `orientable 2 1` and `nonorientable 2 _ 0` have lengths `2`, `11` and `4`.
- **Padding probe.** None of the probed statements closes in one tactic:
  - `simp` on `mcg_torus_full`: "simp made no progress";
  - `simp_all` on `homeomorph_unique`: no progress;
  - `infer_instance` for `T2Space (schemaRealization w)`: fails.

  The definitions with real bodies are exactly those the headlines need: the schema definitions, `isotopicToIdSubgroup`, `plHomeomorphSubgroup`, `innerAut_normal` and `torusLinearHomeomorph`.
- **Folder contents.** There are no changes outside the folder. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Leads from the citation and overlap tools.**
  - The 15 names under "Lean names found nowhere" in `citations.md` are this roadmap's own, and each is declared in `Suggested.lean`. `S.IsOrientable` and `S.boundaryCount` are dot notation on a `StandardSurface`.
  - `overlaps.md` lists no dropped id and no conflicting pull request.

### Seeded sample (15 targets): sources at their locators

- **§0.0c.**
  - hatcher2002, §3.3: the orientable two-sheeted cover is on printed p. 234 (line 10170).
  - Proposition 3.25 is on p. 234 (line 10184), with its proof on p. 235 (lines 10191–10200).
  - These are manifolds without boundary, as the README says.
- **§0.0h and §0.0d.** epstein1966:
  - Appendix Theorem A4 is on p. 107 (lines 778–779).
  - Theorem 6.3 is on p. 99 (lines 533–535). Its reduction to a homotopy that fixes `∂M` is at lines 548–549.
  - Theorem 6.4 a) is on p. 101 (lines 604–607); see R04.
  - Theorems 2.1 (lines 109–111), 3.1 (214–217), 3.3 and 3.4 (229–248) and Remark 1 after 2.1 (112–115) all match.
- **§0.2.** kriegl-michor1997:
  - Theorem 42.1 is on p. 439 (line 20142);
  - Lemma 42.5 is on p. 442 (lines 20284–20289), including the compact-support clause the collar case uses;
  - Theorem 43.1 is on pp. 454–455 (lines 20817–20835).
- **§§9.1–9.2, 10.4.**
  - takeuchi1975 §1 and the Definition, pp. 600–601 (lines 10–46): commensurable with some `Γ(A, O)`, and a change of splitting gives a `GL₂(ℝ)`-conjugate.
  - borel1981: Lemma 8.1 is on p. 25 (lines 779–789), with the case `a = 1, b = 0` treated first; Theorem 8.2 is on p. 26 (lines 811–815).
  - greenberg1963: Theorem 2 is on p. 571 (lines 86–91). Its Fuchsian groups lie in the orientation-preserving group (lines 8–10), as §10.4 notes.
- **§§0.1, 2.1, 2.2, 2.3, 4.5 and 8.5.** These rest on ComplexCurveModuli items that I resolved on main (listed under the cross-roadmap citations below).
- **§0.4a.** ArithmeticFuchsianGroups §3.1 and FuchsianOrbifolds Layer 0 items 2–3 and Layer 2 item 1 resolve (listed under the cross-roadmap citations below), as do the Mathlib declarations listed below.
- **§§5.5, 7.4 and 8.1.** These rest on uncertified or waived texts (see Not verifiable). Their Tau Ceti inputs were checked, and so were their Epstein locators (§5.5).
- **§11.1.** This is the roadmap's own; it is checked in the table below.

### Adversarial table

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `image_boundary` (§0.0b) | closed half-plane at `0` and `(1,0)`; disc vs sphere | `0` has `x₀ = 0`, outside the interior `{x₀ > 0}` of the range, so boundary; `(1,0)` has `x₀ = 1`, so interior; `∂D² = S¹ ≠ ∅ = ∂S²` | true: charts are `OpenPartialHomeomorph`s onto open subsets of the half-space, so invariance of domain applies | none |
| 2 | `exists_pl_approximation_open`, `_halfPlane` (§0.0a) | `φ = 1/(1+‖x‖)`; `φ = 1/q` at `x₀ = p/q`; `f = (x₀, x₁ + x₀²)`; empty source | `φ ≥ 1/(2+‖x‖)` on `B(x,1)`, so admissible; the infimum of `1/q` is `0` on every ball, so excluded; `f(0,t) = (0,t)` and `f{x₀ ≥ 0} = {x₀ ≥ 0}`; empty source: `g = f` | true; `IsPLOn` is local (`Topology/PL/Map.lean:187`), so infinitely many pieces are allowed | none |
| 3 | `isotopic_of_homotopic_closedSurface`, `isotopicRel_of_homotopicRel` | disc with `id` and `z̄`; annulus twist; Klein bottle with `(x,−y)` | on the disc, `z̄ ≠ id` on `S¹`, so the relative hypothesis fails, and `∂D² ≠ ∅`, so the closed hypothesis fails; Klein bottle: `(x,−y) = (x+½,y)`, and `f_t = (x+t/2, y)` commutes with `τ(x,y) = (x+½,−y)` | true; Epstein's isotopy (lines 54–55) is a level-preserving embedding, which is `TauCeti.Isotopic` | none |
| 4 | schema words, `StandardSurface.eulerChar` (§0.0f) | `a a⁻¹`, `a a`, `a b a⁻¹ b⁻¹`, `orientable 0 2` | `e^{πit}` is glued to `e^{−πit}` (sphere) and to `−e^{πit}` (`ℝP²`); torus: `1 ↔ −i`, `i ↔ −1`; annulus: vertex classes `{v₀,v₃}, {v₁,v₂}, {v₄,v₅}`, so `χ = 3 − 4 + 1 = 0`; by `decide`, `χ = −2, −1, 0` | true | none |
| 5 | `classification_of_surfaces`, `homeomorph_iff_invariants`, `homeomorph_unique` | `T²`, `S₂`, Klein bottle, annulus; Dyck word | `(χ, orientable, b)`: `(0,y,0)`, `(−2,y,0)`, `(0,n,0)`, `(0,y,2)`; `x y x⁻¹ y⁻¹ z z` gives `nonorientable 3 0`, `χ = −1` | true; each invariant is needed, and `(g,b) ↦ (2−2g−b, b)`, `(k,b) ↦ (2−k−b, b)` are injective | none |
| 6 | `Surface.genus`, `Surface.eulerChar_eq_two_sub_two_mul_genus` | `S²`, `T²`, `S₂`; Klein bottle | genus `0, 1, 2` gives `χ = 2, 0, −2`; the Klein bottle has genus `2` (crosscaps) and `χ = 0 ≠ −2`, and the hypothesis `ho` excludes it | true | none |
| 7 | `IsBranchedCover`, `exists_degree`, `riemannHurwitz` (§0.0g) | `zⁿ` on the sphere and on the disc; identity; `S² → ℝP²` | `2 = 2n − 2(n−1)`; `1 = n − (n−1)`; `χ = 1·χ − 0`; `2 = 2·1`; over `0` the fibre has 1 point, of weighted count `n` | true; `p⁻¹(B)` is interior because `p⁻¹(∂Y) = ∂X` and `B` is interior | none |
| 8 | `MappingClassGroupFull`, `MappingClassGroupPL.toTop_bijective` (§0.0h) | disc; annulus twist; boundary of the tetrahedron | the disc has 2 classes; the twist is trivial via `([θ+st], t)`; elements of `A₄` are trivial and transpositions are not, so the PL group has order 2 against `|S₄| = 24` | true | none |
| 9 | `OuterAut` (§4.2) | `S₃`, `Q₈`, `ℤ`, `ℤ²`, `Multiplicative ℝ` | `6/6 = 1`; `24/4 = 6`; `2`; `GL₂(ℤ)`; `ContinuousOut ≅ ℝˣ`, while the Hamel swap lies only in `OuterAut` | true | none |
| 10 | `dehn_nielsen_baer` (§5.4) | `T²`, `S²` | `Out(ℤ²) = GL₂(ℤ)`, matching `mcg_torus_full`; on `S²` the groups have orders 2 and 1, and `1 ≤ genus` excludes it; `(f∘g)_* = f_* ∘ g_*`, and both groups multiply by composition | true | none |
| 11 | `exists_diffeomorph_mapOfEq_eq` (§5.2) | `T²` with `α = [[1,0],[1,1]]`; `S²` | `(x,y) ↦ (x, x+y)` sends `(1,0) ↦ (1,1)` and `(0,1) ↦ (0,1)` and fixes `0`; on `S²`, `α = id` and `f = id` | true | none |
| 12 | `baer_epstein_smooth` (§5.4) | Klein bottle; antipodal map of `S²` | the diffeotopy of row 3; the antipodal map has degree `(−1)³ = −1`, so it is not homotopic to the identity | true | none |
| 13 | `mcg_sphere_full`, `mcg_torus_full` (§5.4a) | `diag(1,1,−1)`, `−I₃`; shear, `−I₂`, swap | determinants `−1` and `−1`, and their composite is the rotation by `π`, of determinant `1`; the shear gives `[[1,0],[1,1]]`; `−I₂` has determinant `1` and 4 fixed points; the swap has determinant `−1` | true | none |
| 14 | `measurable_riemann_mapping` (§7.4) | `μ = a`, `μ = 0`, `z̄`, `k < 0` | `U z 1 = 1`, `U z i = i(1−a)/(1+a)`, `f_z = 1/(1+a)`, `f_z̄ = a/(1+a) = a f_z`; for `μ = 0`, `(1 + i·i)/2 = 0`; for `z̄`, `f_z = 0` and `f_z̄ = 1`; for `k < 0` the hypothesis is unsatisfiable | true; these agree with `Wirtinger/Basic.lean:66,80`; an orientation-reversing solution would have `Df = 0` almost everywhere | none |
| 15 | `nielsen_realization` (§8.2) | `T²` with `F = ⟨−I⟩`; a Klein four-group; a Dehn twist | lifts `{1, −I}` and `{1, (½−x, −y)}`; the Klein four-group maps onto `F` two-to-one; `⟨T⟩` is infinite, so has no finite lift | true; a bijection is needed, not a surjection | none |
| S1 | §0.0c | tetrahedron, its barycentric subdivision, the 3-simplex, the seven-vertex torus | `4−6+4 = 2`; `14−36+24 = 2`; `4−6+4−1 = 1`; `7−21+14 = 0` | true | none |
| S3 | §0.1 | `g = 2` | D0 item 1's count gives `g = (2−b−χ)/2 = (2−0+2)/2 = 2` | true | none |
| S4 | §0.2 | `S¹`; a path through `|t−½|` | `π₀ Diff(S¹) = ℤ/2`; `τ(s) = 2(s−½)²` has `τ(0) = τ(1) = ½` and `τ(½) = 0` | true | none |
| S5 | §0.4a | `diag(1,−1)`, `diag(−2,1)`, `diag(−4,2)`, `diag(2,−1)`, glide | `−z̄`; all three give `−2z̄`; `1+i ↦ 2+2i` vs `−2+2i`; `dist(i,2i) = log 2 ≈ 0.693147`; glide² `= 4z`, and odd powers have imaginary part `2ⁿy ≠ y` | true | none |
| S6 | §§2.1–2.2 | `g = 2` with `Aut(X) = ⟨h⟩`; Bolza; genus-three hyperelliptic | `h` acts by `+1` on `H⁰(K²)` (dim 3), so the fibre has 1 point, not 2; Bolza: `48/2 = 24`; genus three: invariant subspace of dimension `5 < 6`, fibre 2 | false in genus two | R01 |
| S8 | §2.3 | `T²` | `𝒥/Diff₀ = ℍ`; `𝒥/Diff = ℍ/GL₂(ℤ)` | true | none |
| S9 | §4.5 | `K₀ = −1`, `u = 0`; genus 2 | `0 − 1 + 1 = 0`; the linearization is `Δ⁺v + 2v = 0`, and the wrong sign would give `Δ⁺v = 2v`; `∫K = −4π = 2π·(−2)`; the pinned `CurvatureEquation.lean:90` is `−laplaceBeltrami φ + Scal/2 + e^{2φ} = 0` | true | none |
| S10 | §5.5 | chains of `2g+1` and of `2g` curves | `χ = −2g` (for `g = 2`, `−4`); 2 vs 1 boundary circles | true | none |
| S11 | §7.4 | Beurling transform | multiplier `ξ̄/ξ`, of modulus `1` | true | none |
| S12 | §8.1 | `ML(T²)`; earthquake direction | `i([1,0],[0,1]) = 1`, `i([1,0],[2,0]) = 0`; `E^ℓ_γ = τ_γ⁻¹ ⋅` raises the twist by `+ℓ`, and `τ_γ` changes it by `−ℓ` (§7.2) | true | none |
| S13 | §8.5 | `g = 3`; the three `g = 2` cases | hyperelliptic `g = 3`: `h = 0`, `r = 8`, dimension 5, codimension `1 = g+h−2`; `g = 2`: `(h,r) = (1,3)` would need `2 ≥ (3/2)|K| ≥ 3`, impossible; `(2,0)` gives `|K| = 1`; `(0,6)` gives `|K| = 2` with all `mᵢ = 2` | true | none |
| S14 | §9.2 | `g = 2`; Bolza; `(0;2,3,m)` | covolume `4π ≈ 12.566`; `48·π/12 = 4π`; `2π(1/6 − 1/m) < π/3` | true | none |
| S15 | §11.1 | `g = 2`; Klein quartic | the locus is empty for `g = 2`; the Klein quartic is arithmetic, has `|Aut| = 168`, and its overgroup has index `336 = 168(g−1)` | true | none |
| C1 | Conventions; §4.3 | `x²`; the native attaching word | `laplaceBeltrami(x²) = 2` and `Δ⁺(x²) = −2`; `∏_{i=g}^{1}[Bᵢ⁻¹, Aᵢ⁻¹]` maps to `∏_{i=g}^{1}[bᵢ, aᵢ] = R⁻¹` | true | none |
| C2 | §10.1 | `(2,3,7)`, `(2,3,8)`, Bolza | `85/42 − 2 = 1/42`; `49/24 − 2 = 1/24`; `96 ≤ 168`, but `96 > 84` | true | none |
| C3 | §§7.1, 7.5 | `B = 2 asinh 1`; `k = ½` | `ℓ ≥ 2 asinh 1 ≈ 1.762747`; `d_T = artanh ½ ≈ 0.549306`, the curvature `−4` normalization | true | none |
| D1 | line 994 | searches for `T0`–`T10` and Layer 4.1 | 0 matches on main and at 469 open heads | false | R03 |
| D2 | lines 39, 110 | ModularForms §10B | no labels (iii)–(v); no declaration `analyticGenus_eq_topologicalGenus` | false | R02 |
| D3 | line 1016 | closed disc with `z̄` | homotopic to the identity; local degree `−1 ≠ +1` | false as stated | R04 |

### Library declarations opened at the pins

- **The cited names.** All 145 library names cited in the README resolve at the pins. The resolver's 13 misses were checked by hand:
  - `_root_` names;
  - universe-annotated definitions: `TauCeti.IsTriangulable` (`Topology/Triangulable/Basic.lean:38`) and `TauCeti.IsCombinatoriallyTriangulable` (`Topology/CombinatoriallyTriangulable.lean:44`);
  - the scoped namespace `TauCeti.DiffeomorphWeakWhitney`;
  - prose short forms.
- **Statements read in full** (paths under `TauCeti/`):
  - `Topology/PL/Map.lean:97,187`;
  - `Geometry/Diffeomorphism/Diffeotopy/Path.lean:74`;
  - `AlgebraicTopology/UniversalCover/Deck/FundamentalGroup/UniversalCover.lean:115`, which gives `(deckFundamentalGroupEquiv x₀).symm (op g) = loopDeck x₀ g⁻¹`;
  - `AlgebraicTopology/UniversalCover/Action.lean:172`;
  - `AlgebraicTopology/Cellular/EulerCharacteristic/Puncture.lean:113`, which gives `χ(Sᶜ) = χ − (−1)^dim·#S`, so `2 − 3 = −1`;
  - `AlgebraicTopology/SimplicialComplex/Realization/CWComplex/EulerCharacteristic.lean:156`;
  - `Topology/CWComplex/Classical/FiniteCWType.lean:74` (a `Prop` class);
  - `AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:123`;
  - `Geometry/Manifold/Basic.lean:128`;
  - `Geometry/Manifold/Riemannian/Hyperbolic/CurvatureEquation.lean:90,166`;
  - `Geometry/Manifold/Riemannian/Laplacian.lean:238`, which is `div ∘ grad`;
  - `Geometry/Manifold/SmoothIsotopy/Extension.lean:82`;
  - `Topology/Covering/LocalPower.lean:72`;
  - `Analysis/Complex/Wirtinger/Basic.lean:66,80` and `Holomorphic.lean:39`;
  - `Analysis/Sobolev/WeakDeriv/Basic.lean:251`, whose `Ω` is an `Opens`, so `⊤` is the plane;
  - `Geometry/Manifold/Orientation/Basic.lean:263`, which covers boundary and corners;
  - `Topology/Algebra/Group/ContinuousAut/Basic.lean:311`;
  - `Geometry/Diffeomorphism/Sphere.lean:283`, `Disc.lean:63` and `Topology.lean:85`;
  - `Data/Rat/BranchDeficit.lean:116`.
- **Mathlib statements read** (paths under `Mathlib/`):
  - `LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean:41`: `ProjGenLinGroup` derives `Group` only, and no topology instance exists;
  - `toPGL` at line 113 and `toPGL_injective` in the same file;
  - `Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:181`: `glAction` conjugates exactly when `det < 0`;
  - `Analysis/Complex/UpperHalfPlane/FixedPoints.lean:208`: `FaithfulSMul PGL(2, ℝ) ℍ`;
  - `Algebra/Group/End.lean:721`: `MulAut.conj`.

### Cross-roadmap citations resolved

- **On main.**
  - **ComplexCurveModuli:**
    - D0 items 1–5 (lines 27–51), with the genus count `g = (2−b−χ)/2` and the positive Laplacian equation;
    - D3 items 3–6 (82–103): `dim Def¹ = 3g−3+n+dim A_C`, the Kodaira–Spencer map, the full chart, the arbitrary-complement offset inverse function theorem and local uniqueness, and `J = [[i,0],[α,j]]`;
    - D4 items 1 and 4 (107, 114);
    - D6 item 2 (150).
  - **ComplexKahlerGeometry:** K1 (96), K4 (444), K5b (1168).
  - **DifferentialGeometry:** 12.3 (920).
  - **AlgebraicTopology:** Stage 1 items 4–5 (301, 304), Stage 6 (946), Stage 7 items 1, 3 and 4 (1577–1591).
  - **CharacteristicClasses:** C2 items 2–3 (822, 835).
  - **RiemannianGeometry:** R4 item 7 (717).
  - **PDE:** 2.1–2.3 (1098, 1148, 1187).
  - **Completed/UniversalCovers:** Stages 1–2 (89, 98).
- **GeometricTopology at #903's head `5859c0d`.**
  - Resolved: §1.7.2 (1212), §3.1 (1439), §3.2 (1475), §3.3 with its relative isotopy extension (1504, 1525), §3.4 with Smale's disc theorem and `Diff(S²) ≃ O(3)` (1551–1575), §11.2.1 items 2–5 (7817–7870) and §11.3 (7887).
  - These numbers exist only at that revision. It is the author's own and is named in the description's depends-on list and merge-order paragraph, so they are declared, not a finding.
- **FuchsianOrbifolds at #1168's head `40532c9`.** The head moved from `1e1ceeb` during this review, and every cited item was re-checked at the new head.
  - Layer 0 item 2 (309–338): the action of `GL(2,ℝ)` is isometric, and faithful through `PGL`.
  - Layer 0 item 3 (339) and Layer 1 (358).
  - Layer 2 item 1 (397): Riemannian distance equals `dist`, and `x + iy ↦ (x, y)` is an isometry onto Tau Ceti's `UpperHalfSpace ℝ`. This is exactly what README line 98 assumes.
  - Layer 4 item 5 (581) and Layer 4a (703).
  - Layer 4a, and the metric comparison in Layer 2 item 1, exist only at this revision; they are declared in the same way.
- **ArithmeticFuchsianGroups at #2026's head `f16c179`.** §1.1 (311), §1.4 (634; `Suggested.lean` line 200) and §3.1 (991; `Suggested.lean` line 241).
- **Consumers.**
  - GroupActionsOnRiemannSurfaces (#1728) cites §§3.3, 5.6, 8.4 and 10.1; all exist.
  - QuaternionArithmetic (#1722) cites §9.1; README line 1006 redirects its object to ArithmeticFuchsianGroups §1.1.
  - PseudoholomorphicCurveAnalysis (main, line 65) attributes the weak Wirtinger derivatives and the measurable Riemann mapping theorem to §7.4, which owns them.

### Ownership

- **`OuterAut`.** Neither pin defines an outer automorphism group of a discrete group; only `TauCeti.ContinuousOut` exists. FiniteGroupInvariants Layer 3.1 defines `Out(G)` under its standing `[Finite G]` (its README line 104) and declares no Lean `Out`. The variant clause at line 15 is accurate.
- **The classification of surfaces, Epstein's theorem and the topological mapping class group.** SurfaceTopology and PlanarTopology (#271) also own these. Both are excluded as suppliers of this roadmap, so the overlap is settled by ownership here.
- **Fully qualified names.** No other roadmap's `Suggested.lean` declares a `TauCetiRoadmap.TeichmullerGeometry.*` name.

### Headline theorems

- **Stated.** 21 sorried headlines:
  - PL approximation, in open and half-plane form;
  - invariance of the boundary;
  - Epstein's theorem, closed and relative;
  - the classification of surfaces: the models, their Euler characteristic, uniqueness, existence with uniqueness, the complete invariant, and the genus formula;
  - the degree of a branched cover and the Riemann–Hurwitz formula;
  - the comparison of PL and topological mapping class groups;
  - the Dehn–Nielsen realization and the Dehn–Nielsen–Baer theorem;
  - the smooth Baer–Epstein theorem;
  - the mapping class groups of the sphere and the torus;
  - the measurable Riemann mapping theorem;
  - Nielsen realization in its lifting form.
- **Named in the docstring as not statable.** The end theorems (the open dense loci of Layers 8–11), Teichmüller space and its complex structure, Fenchel–Nielsen coordinates, completeness, earthquakes and convexity, the fixed-point form of Nielsen realization, the fixed-locus dimension, the genus-two kernel, Teichmüller's theorem, the holonomy comparison and coherent orientations.
- **Not padding.** The padding probe above confirms it.

### Remarks on supplier text (no change requested here)

- #2026, line 1131, still says this roadmap cites §1.1 and §1.4 "as Layer 1 items 1 and 4".
- #1168, line 783, says this roadmap's Layer 10 consumes the equality case of Layer 4a. §10.1 here uses only the inequality.
- #1728, line 315, says §10.1 supplies `π/21` and its equality case. They are Tau Ceti's and FuchsianOrbifolds Layer 4a's; README line 1007 gives that redirect.

## Not verifiable

- **Farb–Margalit** (§5.5 sample: Propositions 1.7 and 2.8; also §2.2, Chapters 7, 8 and 11, §10.6). The sources service found no legal copy: the DOI's landing page is on a host with no licence class, and the author-page host did not resolve.
- **Douady–Earle 1986**, Theorem 1 (§5.2). The service classes the DOI as paywalled and records it as uncertified.
- **Commercial or paywalled texts, absent from the cache and cited by locator only**:
  - Imayoshi–Taniguchi (§§2.1, 4.5, 6.1, 7.3–7.5);
  - Hubbard 2006;
  - Ahlfors–Bers 1960 (§7.4);
  - Wolpert 1979 (§7.5);
  - Moise 1977 (§0.0a);
  - Massey 1977 (§0.0f);
  - Munkres 1966 (§0.0e).
- **The package's `sources.toml`** records only eight works. These nine are absent from it.
- **Settled texts.** Hirsch, Chapter 8, Theorem 1.3 is settled as uncertified. Kerckhoff 1983 (§§8.1–8.2 sample) is settled as waived.

## Source issues

- **Error** in epstein1966 at Theorem 6.4 a), printed p. 101: the source says a homeomorphism homotopic to the identity is isotopic to it, asking orientation preservation only for the plane and the cylinders; it should be also asked on the closed disc, where complex conjugation is homotopic but not isotopic to the identity; affects nothing.
- **Error** in epstein1966 at Theorem 5.6, printed p. 97: the source says every orientation-preserving basepoint-fixing homeomorphism of the closed cylinder is isotopic to the identity; it should be required to map each boundary circle to itself, since `(θ, t) ↦ (−θ, 1 − t)` fixing `(0, ½)` acts by `−1` on `H₁`; affects nothing.
