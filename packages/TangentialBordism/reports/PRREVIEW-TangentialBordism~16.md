# Review of TangentialBordism (pull request #942 at 059ac6a)

**Verdict:** needs changes

This is a full review of the head that ~15 read; the folder has not changed since then. There are two P2 findings and eight P3 findings. The two findings of ~15, both about the pull-request description, are not repaired (R08, R09).

## R01 (P2) — ΩSO₃ = 0 is statable at the pins; the docstring says the low tables are not

**Location.**
- `TauCetiRoadmap/TangentialBordism/Suggested.lean:22–24`: "the geometric bordism groups … and their low tables (B2, B3.1–B3.4) … Mathlib's `SingularManifold` has no bordism relation or quotient group".
- `README.md:2168`: "Give nullbordism witnesses for the zero entries".

**Claim.** No entry of the B3.1 table can be stated without a bordism quotient, so none is stated.

**Witness.** I elaborated a scratch file stating "every closed oriented smooth 3-manifold is the oriented boundary of a compact oriented 4-manifold". It uses the pinned `TauCeti.isManifold_boundary`, `TauCeti.boundaryOrientation` and `IsOrientationPreservingAt`, and `lake env lean` reports only the `sorry` warning.

**Repair.**
1. Add the following to `Suggested.lean` under Layer 8 (B3.1). It needs the imports `TauCeti.Geometry.Manifold.Boundary.InducedOrientation` and `TauCeti.Geometry.Manifold.Orientation.Preserving`. This exact text elaborates at the pins.

   ```lean
   /-- Rokhlin (`ΩSO_3 = 0`): every closed oriented smooth three-manifold is, by an
   orientation-preserving diffeomorphism, the outward-first oriented boundary of a compact
   oriented smooth four-manifold. -/
   theorem closedOrientedThreeManifold_isOrientedBoundary
       (M : Type*) [TopologicalSpace M] [T2Space M] [CompactSpace M]
       [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M]
       [IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) ∞ M]
       (o : TauCeti.Manifold.Orientation 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) M (Fin 3)) :
       ∃ (W : Type*) (_ : TopologicalSpace W) (_ : T2Space W) (_ : CompactSpace W)
         (_ : ChartedSpace (EuclideanHalfSpace 4) W) (_ : IsManifold (𝓡∂ 4) ∞ W)
         (oW : TauCeti.Manifold.Orientation (𝓡∂ 4) W (Fin 4)),
         letI : IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) ∞ ↥((𝓡∂ (3 + 1)).boundary W) :=
           TauCeti.isManifold_boundary W (by simp)
         ∃ φ : ↥((𝓡∂ (3 + 1)).boundary W) ≃ₘ^∞⟮𝓘(ℝ, EuclideanSpace ℝ (Fin 3)),
             𝓘(ℝ, EuclideanSpace ℝ (Fin 3))⟯ M,
           ∀ x, TauCeti.Manifold.Orientation.IsOrientationPreservingAt
             (TauCeti.boundaryOrientation oW) o φ x := by
     sorry
   ```

2. State ΩO₃ = 0 the same way, without the orientations (`Nonempty` of the diffeomorphism). That form also elaborates.
3. Name both theorems in 8.4 with a locator. The table of Ω_k for k < 8 is Thom, Théorème IV.13, p.81 (`25813484 line 2686`).
4. Narrow the docstring bullet: what is not statable is the groups, Thom's ring, Wall's presentation, and the nonzero and Spin entries. The pins have no bordism quotient, no Stiefel–Whitney or Pontryagin numbers of manifolds, and no Spin structures on manifolds.

The statement is true on the obvious instances: M = ∅ (take W = ∅), M = S³ (W = D⁴ with its outward-first boundary orientation), M = T³ (W = T²×D²).

## R02 (P2) — The supply direction loops through StringOrientation S5.3 and BordismFormalGroups back to Layer 4

**Location.**
- `README.md:1775–1776`: "Consume StringOrientation S5.3's equivalence MSpin[1/2]≃MSO[1/2]"; the same equivalence is consumed at `:2030–2031`.
- `README.md:2911–2913`: "These consumers provide no prerequisite of the targets above, except that AlgebraicTopology supplies B1.6's boundaryless case and B2–B6."

**Claim.** No consumer of this roadmap supplies any of its prerequisites. The README also says StringOrientation "consumes nothing from here" (`:64–65`, `:2904–2905`).

**Witness.**
- StringOrientation at #948 (07f0981), `README.md:1199`: S5.3's *Needs:* begins "BordismFormalGroups F3–F5".
- BordismFormalGroups on main, `README.md:2759–2760`: "F2 consumes TB B4's mod-p Adams/coefficient tools … and supplies F3's spectra/cooperations".
- Chain: 6.4, 7.2 → S5.3 → F3 → F2 → Layer 4.

**Repair.**
1. The equivalence itself does not need BordismFormalGroups. At #948 (`:1170–1184`) its proof uses only the K(ℤ/2,1) fibre of BSpin→BSO, DGFloer Layer 1 items 2 and 4, CharacteristicClasses C2's Thom isomorphism and the Thom spectra. Have StringOrientation give it its own item with that *Needs:* line, ahead of the Hovey splitting.
2. Cite the new item's id here at `:31`, `:264`, `:1775`, `:1798`, `:1937` and `:2030–2031`.
3. Add it to 7.2's *Needs:* (`:2069`) and to Layer 7's Dependencies (`:2077`). Both omit StringOrientation today, although `:2030–2031` consumes S5.3.

With that split, `:2911–2913` becomes true as written.

## R03 (P3) — Pinned Tau Ceti tubes, framed Pontryagin–Thom collapse and exhaustion functions are not cited

**Location.**
- `README.md:432–434`: "GeometricTopology Layer1's tubular neighbourhood of the image gives an open W⊇P and a smooth submersive retraction".
- `:475–476`: "a smooth proper exhaustion function f:M→ℝ".
- `:1272–1277`: "Construct here the finite-rank framed interface … tube/regular-value choices".
- The tube of B5.1 at `:1201–1203`.

**Claim.** These inputs come from GeometricTopology Layer 1, are left unowned, or are built here. From Tau Ceti (`:140–254`) names none of them.

**Witness.** All three are at the Tau Ceti pin, under `Geometry/Manifold/`:
- `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset` (`TubularNeighborhood/Existence.lean:53`);
- `TauCeti.exists_contMDiffMap_isProperMap_nonneg` (`Exhaustion.lean:71`);
- `TauCeti.pontryaginThomSphereMap` (`PontryaginThom/Basic.lean:217`), with isotopy and framing invariance (`:149`, `:196`).

**Repair.**
1. Add the three to From Tau Ceti with their hypotheses, read at the pin:
   - The tube: a smooth embedding between finite-dimensional boundaryless manifolds, the ambient one Hausdorff and second countable; the intrinsic quotient normal bundle; the tube can be placed inside any open neighbourhood of the image.
   - The exhaustion function: any model with corners, on a sigma-compact Hausdorff manifold.
   - The collapse: a compact framed submanifold of a Hausdorff space; framed tubes exist by `TauCeti.SmoothEmbedding.exists_isFramedTube` (`PontryaginThom/Existence.lean:68`).
2. Consume the tube in the B1.6 smoothing route (r = the bundle projection composed with Φ⁻¹) and in B5.1.
3. Consume the exhaustion function in B1.6's "Neighbourhoods and doubles" bullet.
4. In B5.2, either build the framed forward map on `TauCeti.pontryaginThomSphereMap` or state its comparison with the B_r = point case of item 2. Keep as targets only what the pin lacks: bordism invariance, the inverse, the bijection and pinch addition.

## R04 (P3) — 10.1 cites Thom IV.17 for the realization results; they are Thom III.2–III.4 and III.9

**Location.** `README.md:2566–2568`: "For the rational coefficient result compare Thom IV.17, p.84; the stated integral range and lens-space example are proved by the explicit AHSS and operation calculations above".

**Claim.** IV.17 supports 10.1's rational SO surjection over every pair.

**Witness.**
- `25813484 line 2774` (p.84): IV.17 says only that Ω⊗ℚ is a polynomial algebra with one generator in each dimension divisible by 4.
- `line 1825` (p.59): III.4 makes every integral class of a finite polyhedron, up to a nonzero multiple, a manifold image.

**Repair.** At `:2566`, cite Thom Théorèmes III.2 (mod 2, every degree), III.3 (integral, degree at most 5) and III.4 (the rational statement), all on p.59 (`25813484 lines 1818–1828`). Cite III.9 and the L⁷×L⁷ example on pp.62–63 (`lines 1936–1961`) for the degree-seven counterexample. Cite IV.17 only for the coefficient ring.

## R05 (P3) — 8.1 and 8.3 have no locator, and 8.3's η³ = 12ν has no owner

**Location.**
- 8.1 (`README.md:2081–2106`) cites no source.
- 8.3 (`:2137–2145`): "the product Lie framing is η³ by B5.4c's external products, and η³=12ν≠0".

**Claim.** The theorems of 8.1 and 8.3 are classical results cited at a source, and every input they use is supplied.

**Witness.**
- Neither subsection cites a source.
- StringOrientation S2.3 at #948 (`:607–616`) supplies π₃S≅ℤ/24 and ν, not η³=12ν.
- EllipticCohomology uses 12ν=4ν only 2-locally (`:1457`).
- No supplier says the Lie-framed circle is η.

**Repair.**
1. Give 8.1 a locator for the quadratic refinement of a Spin surface and its polarization: D. Johnson, *Spin structures and quadratic forms on surfaces*, J. London Math. Soc. (2) 22 (1980), 365–373, at its theorem, recorded uncertified if paywalled.
2. Give 8.3 locators for ΩSpin₃ = 0, for the Lie-framed circle representing η, and for η³ = 12ν: a stem computation at its theorem, or a supplier section that states them.
3. Otherwise, make the two framing facts targets of 8.3 with their source.

## R06 (P3) — 8.3 cites TopologicalKTheory T5 for ko₃ = 0

**Location.** `README.md:2137`: "TopK's ko3=0". `:2153`: "*Needs:* … TopologicalKTheory T5 connective KO coefficients."

**Claim.** T5 states the connective KO coefficients.

**Witness.**
- TopologicalKTheory on main, `README.md:886`: "## T5. Complex Thom classes and pushforwards".
- The KO table is in T7, `:1266–1267`: "The KO coefficients in degrees 0,−1,…,−7 are respectively Z,Z/2,Z/2,0,Z,0,0,0".
- The file never mentions a connective cover.

**Repair.** At `:2137` and `:2153`, cite TopologicalKTheory T7 for KO₃ = 0 (the degree −3 entry). Cite GeneralizedCohomology G3.8 for ko = τ≥0 KO, so π₃ko = π₃KO = 0.

## R07 (P3) — The two IndexTheory I7.5 names cited do not exist

**Location.** `README.md:273` and `:2052–2056`: "IndexTheory I7.5's `spinFour_signature_eq_neg_sixteen_mul_quaternionicIndex` gives σ(M)=−16α_ℍ … I7.5's `rokhlin_signature_dvd_sixteen`".

**Claim.** IndexTheory I7.5 declares these two names.

**Witness.**
- `roadmaps grep` over main and every open head finds both names only in this README.
- IndexTheory at #1077 (6a51fc7) states σ(M)=−16α and Rokhlin's theorem in prose (`README.md:1494–1498`).
- Its `Suggested.lean` declares only `normPath_iff_index_eq` and `exists_index_eq`.

**Repair.** At `:273` and `:2052–2056`, cite "IndexTheory I7.5's integral equality σ(M) = −16α and its Rokhlin divisibility theorem" in prose and drop the two backticked names. The sign chain itself is correct (adversarial table, row 7.2).

## R08 (P3) — AlgebraicTopology 8.13 is defined only at #1663, which the description does not name

This is ~15 R01, not repaired.

**Location.**
- `README.md:260`: "Layers2–4,6,8 and 8.13"; 8.13 is also cited at `:74`, `:405`, `:429`, `:440`, `:462`, `:503`, `:821`, `:2908` and `:2910`.
- The description: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652".

**Witness.**
- AlgebraicTopology on main (1d4e7ce) and at #1652 (9cac1ae): 0 hits for "8.13".
- At #1663 (a6488e3): Stage 8 item 13, owning the three boundaryless-source theorems (`README.md:66–76`, `:2859`).

**Repair.** Name #1663 beside #1652 in that paragraph and say which merges first, so that one head carries both #1652's Layer numbering and 8.13. No README change.

## R09 (P3) — DifferentialGeometry 5.5b is defined only at #886, which the description does not name

This is ~15 R02, not repaired.

**Location.**
- `README.md:261`: "5.5b's smooth face structure and face-indexed abstract boundary".
- 5.5b is also cited at `:355`, `:390`, `:470`, `:503`, `:515`, `:582`, `:627`, `:630`, `:729` and `:821`.
- The same description paragraph.

**Witness.**
- DifferentialGeometry on main: 0 hits for "5.5b".
- At #886 (e8165fc), `README.md:152`: "5.5b adds a smooth face structure on `M` for face-indexed boundary and corner".

**Repair.** Name #886 in that paragraph. List #903 there as well: GeometricTopology 1.1, 4.3.1 and 11.3 exist only at #903 (8bd9871, `:570`, `:3538`, `:13218`), and the description links #903 only in its Finite Arf paragraph.

## R10 (P3) — Adams–Atiyah is listed in References but cited nowhere

**Location.** `README.md:2973–2976`: "J. F. Adams and M. F. Atiyah, *K-theory and the Hopf invariant* … §1 for the integral K0/Adams-operation dimension restriction."

**Witness.** No section cites it. The only related line, `:42`, says the Hopf invariant one theorem is "Neither owned nor used here".

**Repair.** Delete the entry.

## Previous findings (~15)

- **~15 R01 (AlgebraicTopology 8.13 at #1663): not repaired.** The head is unchanged, and the description still reads "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652". It is now R08.
- **~15 R02 (DifferentialGeometry 5.5b at #886): not repaired.** The same paragraph is unchanged. It is now R09.

## Verified sound

### Gate, dependency check, outside-folder diff, elaboration

- **Gate**, rerun at 059ac6a with `--base origin/main`:

  ```text
  gate TangentialBordism: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's record adds `build=0`.
- **Dependency check** (`--movable`):

  ```text
  depcheck: 236 roadmaps, 2419 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line. TangentialBordism is line 14 of the merge order, after IndexTheory (10), StringOrientation (11), SmoothBundlesConnections (12) and PseudodifferentialOperators (13). The loop in R02 runs through StringOrientation, which is not on main, so the check cannot see it.
- **Folder.** `README.md`, `Suggested.lean` and `metadata.toml`; `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0; the only diagnostics are the two `sorry` warnings (`:51`, `:71`).
- **`#check @` probe.** Both elaborated types equal the README statements:
  - smoothing: any `I`, `[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]`; P with `[CompactSpace P] [BoundarylessManifold J P]`; `IsClosed C → IsOpen U → C ⊆ U → ContMDiffOn … U → ∃ g, ContMDiff … ∧ f.HomotopicRel g C`;
  - parallelization: `[T2Space M] [SecondCountableTopology M]` on `𝓡∂ 3` with `TauCeti.IsOrientedAtlas … A`.

  The file has no section `variable`s, so no binder can be lost.
- **Padding probe.** Each `sorry` was replaced by `first | simp | infer_instance | rfl | trivial | aesop`. The smoothing theorem fails ("`aesop` failed, made no progress") and the parallelization theorem fails (unsolved goals). Neither restates a definition, mirrors a Check or computes a value.
- **Headlines.** The README's headlines are:
  - relative smoothing (B1.6) and parallelization (B3.1), both stated;
  - the bordism groups, low tables, Thom's and Wall's rings (B2–B3, B4.6, B6.2);
  - the Pontryagin–Thom isomorphisms (B5.4c, B5.5);
  - the Steenrod and Adams results (B4);
  - the ABS genus, Rokhlin-type results and the KO kernel (B3.0, B3.4, B6.6);
  - the realization range and the transfer images (B6.3, B6.5);
  - the Cayley plane (B3.6–B3.9).

  Apart from R01, the docstring's not-statable claims hold at the pins:
  - Mathlib `Geometry/Manifold/Bordism.lean:82–89` lists bordisms, the relation and the groups as TODO.
  - Tau Ceti's `AlgebraicTopology/Spectra/` has symmetric spectra but no stable homotopy groups and no Thom or KO spectra.
  - Tau Ceti's only cup-one is on continuous group cohomology (`RepresentationTheory/Homological/ContCohomology/Cup/Graded/Comm.lean:196`), not on singular cochains.
  - Neither library has a transversality predicate for manifolds.
  - `Algebra/AlbertAlgebra/Basic.lean` is the split Albert algebra.
  - Its `StiefelWhitney` files concern quadratic forms, not bundles.
- **Overlaps.** No other open pull request changes this roadmap, and it cites no dropped id. The only-at-a-revision ids are DifferentialGeometry 5.5b (#886, R09), AlgebraicTopology Layers 2–8 (#1652, named in the description), AlgebraicTopology 8.13 (#1663, R08), and GeometricTopology 1.1, 4.3.1 and 11.3 (#903, linked in the description).
- **Declared gap.** `gap:finite-quadratic-arf` is not in a plan.json (the brief reports none readable), so it is a citation of GeometricTopology 4.3.1. At #903 (`:3538–3600`) that section supplies every item the README's contract lists: Arf on a symplectic basis, basis independence, isometry invariance, additivity, the plane classification, the integer Gauss sum, the zero count with m = 0, and the Lagrangian criterion. No finding.

### Seeded sample (15 targets)

Sources were fetched through the sources service into a scratch copy of the manifest; the package manifest is unchanged. Ids used here: `25813484` (Thom 1954), `4f8edd74` (Milnor–Stasheff, TeXromancers), `c70bf1f2` (Miller), `06e4566a` (Führing), `84114d0a` (Borel–Hirzebruch I), `hatcherSS`.

| Target | Locator in README | Text at the locator | Result |
| --- | --- | --- | --- |
| 2.3 (B1.5) | Munkres Thm 10.6, p.104 | not readable legally | Not verifiable; statement checked by computation below |
| 2.4 (B1.2) | MS Thm 17.1, Lemma 17.2, pp.206–207; Miller Ch.1 Defs 1.1–1.2, pp.1–2; Ch.2 Defs 1.1, 1.3, pp.39–41 | `4f8edd74 line 5439` collar theorem (p.206), `line 5457` cobordism an equivalence relation (p.207); `c70bf1f2 lines 95, 104` (p.2), `line 1453` (p.39), `line 1538` (p.41) | Pass |
| 5.1 (B5.1) | Miller Ch.1 §§2–3, pp.3–7; Thom §IV.4 Thm IV.6, p.74; IV.8, p.75 | `c70bf1f2 lines 131–300`; `25813484 line 2410` IV.6 in §IV.4 (`line 2195`), p.74 (`line 2424`); `line 2462` IV.8, p.75 | Pass |
| 5.3 (B5.3) | Thom IV.8, p.75 (as not covering arbitrary ξ) | IV.8 is the stable cobordism ≅ stable homotopy statement only | Pass |
| 5.4 (B5.4) | Thom IV.8 (negative attribution); GeneralizedCohomology G3.3 | G3.3 on main `:710`: morphism of theories + coefficient iso ⇒ iso on all CW pairs | Pass |
| 5.7 (B5.7) | Hatcher SS §1.1, pp.18–19 | `hatcherSS lines 995–1012`: E²=H_p(X;h_q(pt)), finite-dimensional X; naturality on p.19 | Pass |
| 6.2 (B4.5) | Thom IV.10, Cor IV.11, p.77 | `25813484 lines 2528, 2538` on p.77 (folio `line 2545`) | Pass |
| 6.4 (B4.8) | Milnor 1960 §4 Thms 4–5, p.519 | JSTOR only | Not verifiable |
| 6.5 (B6.1) | MS Problems 16-C–E, pp.203–204 | `4f8edd74 line 5351` (16-C, p.203), `line 5370` (16-E, p.204): s_{m+n−1}[H_{m,n}]=−(m+n)!/m!n!, m,n≥2 | Pass |
| 8.1 (B3.2(b)) | none | — | R05 |
| 8.3 (B3.3) | none | — | R05, R06 |
| 9.3 (B3.8) | BH §19 Thm 19.4 | `84114d0a line 3021`: p₂=6u, p₄=39u² (p.535); `line 3027` index 1 | Pass |
| 9.4 (B3.9) | BH I §15.5 eq. (13), p.519 | `84114d0a line 2417`: p(P_{q−1}(K))=(1+u)^{2q}(1+4u)^{−1}, in 15.5 (`line 2355`), p.519 (`line 2406`) | Pass |
| 10.1 (B6.3) | Thom IV.17, p.84 | `25813484 line 2774` is the rational ring | R04 |
| 10.2 (B6.4) | Führing §3, pp.359–363; closed fibre p.359; Prop 3.4 p.362 | `06e4566a line 175` (F closed, B CW, p.359), `line 332` (Prop 3.4, p.362); fat embeddings and skeletal sections `lines 190–211` | Pass |

The README flags no locator as unverified.

### Adversarial mathematics table

| Statement | Instances | Values computed (each side) | Result |
| --- | --- | --- | --- |
| `exists_contMDiff_homotopicRel` | M=∅; M=P=S¹, f=id, C=U=∅; C=U=M with f smooth; P a point; dim E'=0 | g=∅; g≃id so deg g=1; g=f; g=f; f locally constant, hence smooth, g=f | Pass |
| same, route inputs | Mathlib `Continuous.exists_contMDiff_approx_and_eqOn` (`SmoothApprox.lean:71–79`); Whitney (`WhitneyEmbedding.lean:132`) | approx: any `I`, `[SigmaCompactSpace M] [T2Space M]`, `U ∈ 𝓝ˢ S`; embedding: `[T2Space] [CompactSpace]`; equal to the Lean binders; g=r∘g̃ equals f on C | Pass |
| `orientedThreeManifold_parallelization` | ∅; ℝ³; ℍ³; first vector negated; RP²×ℝ | empty b; det 1; det 1; det −1 excluded; no oriented atlas, hypothesis false | Pass |
| same, `IsOrientedAtlas` (`OrientedAtlas.lean:283–292`) | fields | maximal-atlas charts, covering, positive transition det within `range I`; so `mfderiv e x` is defined at boundary points | Pass |
| R01 proposed ΩSO₃=0 | M=∅; S³; T³; −S³ | W=∅; D⁴; T²×D²; −D⁴; elaborates (C¹ and C^∞ forms) | statable (R01) |
| 2.3 Checks | ℝ/ℤ; S³/S¹; mapping tori of S¹; rank 1 and 0 discs; interval | S¹; CP¹ fibre S¹; T², Klein bottle (w₁≠0); [−1,1] with 2 boundary points, point with S⁻¹=∅; 2 vertices + 1 edge, ∂ = 2-vertex subcomplex | Pass |
| 2.4 Checks | ∅; [0,1]∪[1,2]; constant interval | count 0; −1 at 0, +1 at 2, sum 0; cancels ±pt at x, not across components | Pass |
| 5.1 Checks | +pt in ℝ¹; reversed frame; ∅ | S¹→S¹ degree 1; degree −1; basepoint | Pass |
| 5.2/5.3 regression | n=0, k=1, B={a,b} | Th=S¹∨S¹; a+,b+,a−,b− ↦ aba⁻¹b⁻¹ ≠ 1 in F₂; a+,a−,b+,b− ↦ 1; stable counts (0,0) | Pass |
| 5.4 Checks | X={x,y}; e₀=e₁=e; relative interval | (1,0),(0,1) in ℤ² on both sides, X→pt sums to 2; rotation by −θ sends (cosθe,sinθe)↦(e,0); +1 at 1, −1 at 0 | Pass |
| 5.4 complex instance | rank 2r→2r+1→2r+2 | (γ_r)_ℝ⊕ε → (γ_r)_ℝ⊕ε⊕ε ≅ (γ_r⊕ε_ℂ)_ℝ, the pullback of γ_{r+1} | Pass |
| 5.7 Checks | pt; total degree 0; two components | only p=0, abutment Ω_q; only (0,0); Ω₀⊕Ω₀ | Pass |
| 6.2 Checks | pt; {x,y}; RP²; S² | 1 vs 0; (1,0); w=(1+a)³ so w₁²=w₂=a², both 1; w=1, both 0 | Pass |
| 6.4 Checks | p=3; p=5; BC₂ | v₀ (1,1) stem 0, v₁ (1,5) stem 4, degree-4 C generator absent (3=3¹); v₁ stem 8, degree-4 present; H̃*(BC₂;F_p)=0 at odd p | Pass |
| 6.4 Thom formula | complex line, c₁=x | P(U)=U+U^p=(1+x^{p−1})U | Pass |
| 6.5 Newton numbers | H_C(2,3); CP⁴; CP²; H_C(1,1); v=w=(1,i,0) | −binom(5,2)=−10; 5; 3; CP¹ has c₁=+2 ≠ −2; bilinear 1+i²=0, Hermitian 1+1=2 | Pass |
| 6.5 rational basis | CP⁴, CP²×CP² | (p₁²,p₂)=(25,10),(18,9); det 25·9−10·18=45≠0 | Pass |
| 7.2 sign chain (R07) | σ=−16α_ℍ (IndexTheory I7.5 `:1494–1497`); `realSpinDiracIndexClass = α·a` (SpinGeometry G6.7 main `:831`) | α(M)=−(σ/16)a; K3 σ=−16 gives a, reversed gives −a; Â=−p₁/24=−σ/8=2 matches c(a)=2u² | Pass |
| 8.1 | Lie torus; disc curve; S² | q(a)=q(b)=1, a·b=1 so q(a+b)=1, Arf=q(a)q(b)=1; q(0)=2q(0) gives q(0)=0; H₁=0, Arf 0 | Pass (R05) |
| 8.3 | KO₃; 12ν; E(1)∖νF | KO^{−3}=0 (TopologicalKTheory T7 `:1266`); 12ν has order 24/gcd(12,24)=2; σ=−8, Spin since F is characteristic; S³=∂D⁴ | Pass (R05, R06) |
| 8.4 table | dim 0; RP⁴ vs RP²×RP²; CP² | O count 1, SO ±1; (w₄,w₂²)=(1,0) vs (1,1); σ=1, SW vector (1,1) | Pass |
| 9.3 | p₂=6u, p₄=39u²; u↦−u | (381·39−19·36)/14175=(14859−684)/14175=1; p₂²=36u² unchanged | Pass |
| 9.4 | k=1; k=2 | (1+u)⁴(1+4u)⁻¹≡1 mod u²; (1+6u+15u²)(1−4u+16u²)≡1+2u+7u²; (49−4)/45=1; BH p₁=(2q−4)u=2u at q=3 (`84114d0a line 2420`) | Pass |
| 10.1 range | H₆(B(ℤ/m)); d₅ at n=5; d₆ | even homology ker(m)=0, odd ℤ/m; torsion image in free H₀ is 0; H₀(;ℤ/2) detected by maps to S⁰, H₆(S⁰)=0 | Pass |
| 10.1 counterexample | L⁷×L⁷ at p=3 | ρβ(v₁v₂u₂²)=u₁v₂u₂²−v₁u₂³; P¹β(v₁v₂)=u₁³v₂−v₁u₂³; product −v₁v₂u₁³u₂³, coefficient −1≡2 mod 3; Thom `25813484 line 1961` | Pass |
| 10.2 Checks | trivial G at a point; trivial bundle; F=S¹; F=I | 1↦[F]; [M]·[F], dim m+f; ∂(I×S¹)={1}×S¹−{0}×S¹, +1 and −1; I×I has 4 edges, excluded | Pass |
| 2.1 Sard and smoothing Checks | t↦(t,0); point→ℝ²; \|x\|²; [0,∞) with t, t²; [0,1], C={0}; circle with r(z)=z/\|z\| | line null; bad set {0}; critical {0}, c>0 regular; t regular for f but critical on {0}; endpoint face rank 0, not fixable; constant map smooths to degree 0 | Pass |
| 2.1 pinned inputs (R03) | tube `TubularNeighborhood/Existence.lean:53–61`; exhaustion `Exhaustion.lean:68–73` | tube applies to e:P→V (P compact boundaryless, V Euclidean); exhaustion over any model with corners | Pass (R03) |
| 2.2 cylinder | I×[0,1], (e_t,e_s) | det(e_t,e_s)=det(−e_t,−e_s)=det(−e_s,e_t)=det(e_s,−e_t)=+1; free face −(I×∂[0,1]) | Pass |
| 4.1 identities | AW on [0,1]; δ(c∪₁δc) with \|c\|=2 | AW−T·AW = d(−[0,1]⊗[0,1]) term by term; from dD₁+D₁d=(1−T)AW: δ(c∪₁δc)=c∪δc−δc∪c−δc∪₁δc | Pass |
| 4.4 Checks | p=3 | τ(βx)=−βι₂=2βι₂; P¹βι₂ degree 7, transpotence βP¹βι₂ degree 2·1·3+2=8; z²=−z² gives z²=0 | Pass |
| 6.6 Checks | ∂₂ on σ₄; Y₆, Y₅; Dold dimension | ∂₂σ₄=σ₂, ∂₂²σ₄=1; δ(Y₆Y₅)=Y₅²; dim P(2^r−1,2^r s)=2^r(2s+1)−1=2k−1 | Pass |
| 9.1 transition | v=(1,x,y) | A₀₁/A₁₁=x̄/N(x)=x⁻¹, A₂₁/A₁₁=y x̄/N(x)=y x⁻¹ | Pass |
| 10.4 Checks | n=2, r=0; n=3, r=0,1; λ_t(ℓ−2); I=(2),(3); a², h₀²b | −2(6−1)=−10; −2(15−1)=−28, gcd 28=2²·7 (n=2²−1, 7=2n+1); (1+ℓt+t²)/(1+t)²=1+(ℓ−2)t/(1+t)²; k=8, 10; both (6,14) | Pass |
| 10.4 PSC | 8-dimensional, 1≤K≤4 (RiemannianGeometry R1 main `:295`) | Scal ≥ 8·7=56; exact 16·2·4=128 | Pass |
| Gap vs GeometricTopology 4.3.1 | V=0, H, A | Gauss sums 1, 2, −2; zero counts 1, 3, 1 = 2+(±1) | Pass |

### Library declarations opened at the pins

- **Mathlib:**
  - `exists_embedding_euclidean_of_compact` (`Geometry/Manifold/WhitneyEmbedding.lean:132`)
  - `Continuous.exists_contMDiff_approx_and_eqOn` (`Geometry/Manifold/SmoothApprox.lean:79`)
  - `SingularManifold` (`Geometry/Manifold/Bordism.lean:111`, TODO `:82–89`)
  - `Orientation.eq_or_eq_neg_of_isEmpty` (`LinearAlgebra/Orientation.lean:217`)
  - `Orientation.map_of_isEmpty` (`:116`)
  - `Rep.FiniteCyclicGroup.groupHomologyIsoEven` (`RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:85`)
  - `ChartedSpace.secondCountable_of_sigmaCompact` (used at `Analysis/Distribution/AEEqOfIntegralContDiff.lean:52`)
- **Tau Ceti, Sard and orientation:**
  - `TauCeti.addHaar_image_criticalPoints_eq_zero` (`Analysis/Calculus/Sard/OutermostStratum.lean:347`, needs (dim E)²+1 ≤ n)
  - `TauCeti.isNullSet_image_criticalPoints` and `TauCeti.dense_isRegularValue` (`Geometry/Manifold/Sard/EqualDimension.lean:105`, `:112`, both `finrank` equal)
  - `ContMDiff.isMeagre_image_criticalPoints` (`Sard/Meagre.lean:114`, `[I.Boundaryless]`)
  - `TauCeti.IsNullSet` (`Measure.lean:36`), `.biUnion` (`:81`), `.dense_compl` (`:108`)
  - `TauCeti.IsRegularPoint` (`RegularValue.lean:86`)
  - `TauCeti.IsOrientedAtlas` (`Orientation/OrientedAtlas.lean:283`) and `.det_fderivWithin_pos` (`:305`)
  - `TauCeti.boundaryOrientation` (`Boundary/InducedOrientation.lean:108`)
  - `TauCeti.isManifold_boundary` (`Boundary/Charts.lean:321`)
  - `Manifold.Orientation.pullback` (`Orientation/Pullback.lean:173`) and `eq_pullback_iff` (`:212`)
  - `IsOrientationPreservingAt` (`Orientation/Preserving.lean:63`)
- **Tau Ceti, tubes, collapse and other carriers:**
  - `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset` (`TubularNeighborhood/Existence.lean:53`)
  - `TauCeti.exists_contMDiffMap_isProperMap_nonneg` (`Exhaustion.lean:71`)
  - `TauCeti.pontryaginThomSphereMap` and its homotopy lemmas (`PontryaginThom/Basic.lean:149`, `:196`, `:217`), `TauCeti.SmoothEmbedding.exists_isFramedTube` (`PontryaginThom/Existence.lean:68`)
  - `TauCeti.DivisionOctonionReal` (`Algebra/CayleyDickson/Quaternion.lean:312`)
- **Checked and not duplicates:**
  - `Gluing/Double.lean` doubles along an open subset (non-Hausdorff), not along a boundary.
  - `Boundary/Collar/Basic.lean` is the model calculation only; its docstring says the global collar theorem is not proved there.
  - `Corners/AbstractBoundary.lean` constructs the abstract boundary as a topological space, without charts.
  - `ModelTransport/Boundaryless.lean` is a different adapter from 2.2's E_p×E_q≃E_{p+q}.

### Cross-roadmap citations resolved

- **On main (1d4e7ce):**
  - DifferentialGeometry 2.1 and 2.2 (`:345–356`, including the oriented-atlas criterion for boundaryless M).
  - GeneralizedCohomology G1.1 (`:141`), G2.10 `MappingPathSpace` (`:533–558`), G3.3 (`:710`), G3.8 `spectrumConnectiveCover` (`:785–797`), G5.2 unframed collapse (`:1523–1535`), `realMixedCliffordIndexClassification` (`:2084`).
  - CharacteristicClasses C1.3 (`:664`), C1.4 (`:682`), C3.3 (`:1122`), C3.6 (`:1229`), C7.3a (`:1936`).
  - SpinGeometry G4.3 (`:479`), G4.4 (`:491`), G5.0 (`:506`), G6.0 (`:571`), G6 item 5 (`:775–781`), G6.7 (`:800–831`) and the four `realSpin…` names.
  - TopologicalKTheory T7 (`:1148`, `:1266`).
  - ClassifyingSpaces Stage 4 item 17 (`:238`).
  - RiemannianGeometry R1 (`:280–295`).
  - BordismFormalGroups (`:30`, `:172`, `:2759`); EllipticCohomology (`:1457`); DGFloer (`:93`, `:183`).
- **At open heads:**
  - StringOrientation #948 (07f0981): S1.3, S1.5, S2.2 (`:551`), S2.3 (`:607`), S5.3 (`:1158–1199`), and consumers (`:1410–1415`).
  - IndexTheory #1077 (6a51fc7): I7.2 (`:1338`), I7.5 (`:1480`).
  - AlgebraicTopology #1652 (9cac1ae): Layers 2–8, 6.3 (`:1958`). #1663 (a6488e3): 8.13.
  - DifferentialGeometry #886 (e8165fc): 5.5b.
  - GeometricTopology #903 (8bd9871): 1.1 (`:570`), 4.3.1 (`:3538`), 11.3 (`:13218`).
  - HomotopySpheres #1287 and FourManifolds #936 consume B1, B1.7, B3.2, B5.2 rather than owning them.
- The worker's resolver found nothing unresolved; R07's names were found only in this README by `roadmaps grep`.
- No two `Suggested.lean` files declare the same fully qualified name; `roadmaps grep --lean-only` finds neither headline elsewhere.
- DGFloer on main consumes B5/B6.3 in its Layer 10.5 and says the layering is explicit (`:183`); its Layer 1 precedes this roadmap's Layer 4, so that relation is layered and not a finding.

## Not verifiable

- **Munkres**, *Elementary Differential Topology*, Theorem 10.6, p.104 (2.3): no legal open copy. Cited by its locator.
- **Milnor**, *On the cobordism ring Ω\* and a complex analogue, Part I*, §4 Theorems 4–5, p.519 (6.4): the sources service resolved DOI 10.2307/2372970 only to a JSTOR page.
- **Lee**, *Introduction to Smooth Manifolds*, Theorems 6.10, 6.26, 6.35, 6.36, 21.10, 21.13 (2.1, 8.5): Springer, paywalled.
- **Johnson 1980** and the stem source suggested in R05: not read. Their theorem numbers are for the author to supply.
- **Ownership against GeneralizedCohomology #1187** (closest in vocabulary in the overlap list): the brief gives no checkout, so it was not checked. GeneralizedCohomology was checked on main.

## Source issues

- none
