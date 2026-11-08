# Review of TangentialBordism (pull request #942 at 8e5c510)

**Verdict:** needs changes

This is an incremental re-review of the 24 README lines that changed since ac710dc. `Suggested.lean` and `metadata.toml` are byte-identical to ac710dc, and nothing outside the folder changed.

- **~13 R01 is repaired.** The 8.4 obstruction route now runs on the interior M°. GeometricTopology 1.1 supplies M°, and the mathematics checks out (table below).
- **The gate fails** on a rule it did not apply at ac710dc: four mentions of a dropped roadmap name (R01).
- **R02 is new.** The edited sentence re-cites GeometricTopology 11.1 for the CW structure on `|K|`, and that structure already exists at the Tau Ceti pin.
- **~13 R02 and R03 are not repaired** (R03 and R04 below).

All four findings are P3.

## R01 (P3) — Gate fails: four mentions of the dropped roadmap HomotopySpheres

**Location.** `TauCetiRoadmap/TangentialBordism/README.md`:
- `:42–44`: "the classification of parallelizable spheres (`sphere_parallelizable_iff`) are HomotopySpheres §3C item5".
- `:48–49`: "consumed by BordismFormalGroups and HomotopySpheres".
- `:1151`: "HomotopySpheres and BordismFormalGroups."
- `:2878`: "BordismFormalGroups and HomotopySpheres consume".

**Claim.** The scope section gives an owner for the Hopf invariant one theorem, and the consumer lists name roadmaps the project cites.

**Witness.** The gate at 8e5c510 reports `dropped=4 … FAIL`, at exactly these four lines. HomotopySpheres is on the project's dropped-names list. The AlgebraicTopology revision at the head of #1652 (4e825d6, "dropped-name mentions removed") made the same removal.

**Repair.**
1. At `:42–44`, replace the first sentence with: "Neither owned nor used here: the integral Hopf invariant one theorem and the classification of parallelizable spheres." Start the next sentence "The stable trivialization `TSⁿ⊕ε¹≅ε^(n+1)`, …" and leave the rest unchanged. This also drops the backticked `sphere_parallelizable_iff`, which is a declaration of the dropped roadmap.
2. At `:48–49`, write "Owned here and consumed by BordismFormalGroups:".
3. At `:1150–1151`, write "consumed by item8 and BordismFormalGroups."
4. At `:2878`, write "BordismFormalGroups consumes the ordinary operation, …".

**Test.** I applied these four edits to a scratch copy and grepped it for every name on the dropped-names list: 0 hits.

## R02 (P3) — The CW structure on `|K|` that 8.4 takes from GeometricTopology 11.1 is at the Tau Ceti pin

**Location.**
- `README.md:2203–2205` (8.4, changed at this head): "its Layer11.1 simplicial CW structure, which covers every simplicial complex".
- `:245` (changed): "the CW structure on the realization `|K|` of a simplicial complex, one cell per simplex (Layer11.1)".
- The same object is cited at `:341–342` (2.1) and `:629–630` (2.3), and in the *Needs:* lines `:659`, `:2228` and `:2279`.

**Claim.** The CW structure on a simplicial realization is a supplier section, GeometricTopology 11.1, which exists only at the open head of #903.

**Witness.** Tau Ceti at the pin (2fd255d) has `AbstractSimplicialComplex.realizationCWComplex (K : AbstractSimplicialComplex ι) : Topology.CWComplex (Set.univ : Set (Realization K))`, for any `[LinearOrder ι]`, in `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/CWComplex/Basic.lean:172`. I elaborated it in my probe.

**Repair.**
1. In From Tau Ceti, name:
   - `AbstractSimplicialComplex.realizationCWComplex`, with its file. It is the classical CW structure on the weak realization of every simplicial complex on a linearly ordered vertex type. Its n-cells are the faces with n+1 vertices (`realizationCellEquiv`, `:217`), and `skeletonLT_realizationCWComplex` (`:273`) cuts out its skeleta by support size.
   - `TauCeti.IsSmoothTriangulation` (`TauCeti/Geometry/Manifold/SmoothTriangulation/Basic.lean:191`), as the carrier of "smooth triangulation". The pin defines this predicate but has no existence theorem, so existence remains GeometricTopology 11.3.
2. At `:245`, `:342`, `:630` and `:2204`, cite the pinned name in place of Layer 11.1.
3. Remove "11.1" from `:245`'s header and from `:659`, `:2228` and `:2279`.

**Test on 8.4's instance ℍ³.**
- M° ≅ ℝ³ has the Kuhn triangulation K: 6 tetrahedra per unit cube and 24 per vertex.
- `skeletonLT_realizationCWComplex K 4` is `{x | support.card ≤ 4}`, which is all of `|K|`. So the cells have dimensions 0–3, as the obstruction route needs.
- On 2.3's interval Check, `realizationCellEquiv` gives two 0-cells and one 1-cell.

## R03 (P3) — AlgebraicTopology 8.13 is defined only at open revision #1663, which the description still does not name

**Location.**
- `README.md:243`: "Layers2–4,6,8 and 8.13".
- Also `:75`, `:388`, `:412`, `:423`, `:445`, `:486`, `:804`, `:2885` and `:2887`.
- The description's revision paragraph: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652".

**Claim.** The revision the description names defines the cited numbering, 8.13 included.

**Witness.**
- AlgebraicTopology on main (65930ba) has 0 hits for "8.13".
- The head of #1652, which moved to 4e825d6, has none either. Its Layer 8 headings run from 8.1 (`:2538`) to 8.12 (`:3302`).
- The head of #1663 (8029fe9) defines it at `README.md:68` and `:2704`.

**Repair.**
- Name #1663 beside #1652 in that paragraph, and say which of the two merges first.
- The other is rebased on it, so that one head carries both Layer 8 and 8.13.
- No README change is needed.

Re-raised from ~13 R02. No repair report marks it not actionable.

## R04 (P3) — DifferentialGeometry 5.5b is defined only at open revision #886, which the description still does not name

**Location.**
- `README.md:244`: "5.5b's smooth face structure and face-indexed abstract boundary".
- Also `:338`, `:373`, `:453`, `:486`, `:498`, `:565`, `:610`, `:613`, `:712` and `:804`.
- The same description paragraph.

**Claim.** DifferentialGeometry 5.5b is a supplier section that can be cited.

**Witness.**
- DifferentialGeometry on main (65930ba) has 0 hits for "5.5b".
- The head of #886 (a565de6) defines it at `README.md:88`.
- `overlaps.md` lists "DifferentialGeometry §5.5b … #886 … must merge first".

**Repair.** Name #886 in the revision paragraph. #903 may be listed there too, now for GeometricTopology 1.1 as well as 4.3.1, 11.1 and 11.3. That is optional, because the Finite Arf paragraph already names #903.

Re-raised from ~13 R03.

## Previous findings

- **R01 — repaired.** `:2199–2212` now reads: "Let M°=M∖∂M be the interior of M … whose inclusion into M is a homotopy equivalence (GeometricTopology Layer1.1). On the at-most-three-dimensional CW model of a smooth triangulation h:|K|→M°". GeometricTopology 1.1 is in *Needs:* (`:2228`), and the ℍ³ Check is at `:2226`.
- **R02 — not repaired (now R03).** The description still reads "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652", and `:243` still cites "Layers2–4,6,8 and 8.13".
- **R03 — not repaired (now R04).** The same paragraph names only #1652, and `:244` still cites "5.5b's smooth face structure and face-indexed abstract boundary".

## Verified sound

### Gate, dependency direction, outside-folder diff, elaboration

- **Gate**, rerun at 8e5c510 with `--base origin/main`:

  ```text
  gate TangentialBordism: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=4 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
  ```

  The only failure is `dropped` (R01). The worker's record adds `build=0`.
- **Dependency check** with `--movable`:

  ```text
  depcheck: 243 roadmaps, 2456 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line.
- **Folder and outside-folder diff.** The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff --stat origin/main...HEAD` outside the folder is empty, and `git diff ac710dc..HEAD` touches only `README.md` (15+/9−).
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/TangentialBordism/Suggested.lean` exits 0. Its only diagnostics are the two `sorry` warnings (`:51`, `:71`).
- **Signature probe.** I elaborated a scratch probe with `#check @` for both theorems and four pinned names.
  - `exists_contMDiff_homotopicRel` and `orientedThreeManifold_parallelization` are identical to `signatures.md`. No section binder is lost: `T2Space`, `SecondCountableTopology` and the half-space model are all present.
  - The README statements (B1.6, 8.4) are unchanged and match.
- **Headlines and padding.** The file is byte-identical to ac710dc. The headline list (B1.6 relative smoothing, 8.4 parallelization), the docstring's not-statable list (transversality, bordism groups, PT, Steenrod/Adams, KO, B6.3/B6.5, Cayley plane) and the one-tactic padding probe carry from ~9, ~11 and ~13.

### The 8.4 repair, checked

- **GeometricTopology 1.1** at the head of #903 (a49ede6), `README.md:560–561`: the interior `M ∖ ∂M` is a smooth boundaryless manifold, and its inclusion is a homotopy equivalence. The layer's standing hypotheses (`:537–538`) are Hausdorff, second countable, with half-space model `𝓡∂ n`. These match the headline's `T2Space`, `SecondCountableTopology` and `modelWithCornersEuclideanHalfSpace 3`.
- **"M° is M itself when ∂M is empty"** is Mathlib's `ModelWithCorners.interior_eq_univ` (`Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean:192`).
- **GeometricTopology 11.3** (`:13038`): Cairns–Whitehead for every smooth manifold, which includes non-compact boundaryless M°.
- **GeometricTopology 11.1** (`:12972`): a CW structure for every abstract simplicial complex, with an infinite locally finite Check. This resolves, but see R02.
- **Countability and local finiteness of K.**
  - Tau Ceti `Realization/LocallyFinite.lean` (module docstring) has the direction from finite vertex stars to local compactness.
  - The converse, together with countability from second countability, is the standard CW fact the README invokes.
  - The route does not need either property for obstruction theory. They are correct, but not load-bearing.
- **Transport back to M.** Let g : M → |K| be a homotopy inverse of i∘h. Then P ≅ (i∘h∘g)*P = g*(h*i*P) ≅ g*(|K|×Spin(3)), which is trivial. This uses homotopy invariance over M, and M is paracompact because it is Hausdorff, second countable and locally compact.
- **No cycle.** GeometricTopology 1.1's *Needs:* (Mathlib, Tau Ceti `TauCeti.isManifold_boundary` and `TauCeti.IsLocallyCollared`, DifferentialGeometry Layer 3) does not cite this roadmap.
- **Ownership on main.** GeometricTopology on main (65930ba) has only "Layer 1" (`:177`) without numbered items, so 1.1 exists only at #903. The description names #903 in its Finite Arf paragraph.
- **No other owner at the pins.** Neither Mathlib nor Tau Ceti has a homotopy-equivalence statement for the interior inclusion: a grep for `HomotopyEquiv` with interior, collar or boundary finds only sphere and disc lemmas. So GeometricTopology 1.1 is the right supplier.

### Pinned declarations opened this round (Tau Ceti 2fd255d)

- `AbstractSimplicialComplex.realizationCWComplex` (`AlgebraicTopology/SimplicialComplex/Realization/CWComplex/Basic.lean:172`): `[LinearOrder ι]`, every K, weak realization.
- `realizationCellEquiv` (`:217`): n-cells ≃ `RealizationCell K n`.
- `skeletonLT_realizationCWComplex` (`:273`): `skeletonLT n = {x | support.card ≤ n}`.
- `TauCeti.IsSmoothTriangulation` (`Geometry/Manifold/SmoothTriangulation/Basic.lean:191`): a homeomorphism `Realization K ≃ₜ M` that is a Cⁿ simplex immersion on every face.
  - The SmoothTriangulation directory proves secant approximation and subdivision stability only.
  - `GlobalEmbedding.lean`'s docstring says it does not establish existence.
- Mathlib `ModelWithCorners.interior_eq_univ` (`InteriorBoundary.lean:192`).

### Cross-roadmap citations resolved

- **GeometricTopology at the head of #903 (a49ede6):** 1.1 (`:540`, `:560`), 4.3.1 (`:3488`), 11.1 (`:12972`), 11.3 (`:13038`).
- **AlgebraicTopology at the head of #1652, which moved to 4e825d6.**
  - Layers 2 (`:556`), 4 (`:841`), 6 (`:1578`) and 8 (`:2531`) are present.
  - 6.3 (`:1938`) still fixes the point generator v₀=−∑e_i (`:2025`), sₙ=σₙιₙ(g̃ₙ) (`:2244`) and σ₀=−1 when p₀=q (`:2266`). The u₁=−1 of 2.2 stands.
  - 8.9 relative obstruction theory (`:2986`) is "AT8's relative obstruction construction".
- **AlgebraicTopology 8.13** is at the head of #1663 (8029fe9) only: R03.
- **DifferentialGeometry 5.5b** is at the head of #886 (a565de6) only: R04.
- **CharacteristicClasses on main:** C7 items 3 and 3a exist, as R01's repaired sentence keeps them.
- **Citation resolver:** none unresolved.

### Seeded sample, where it meets the change

- **8.4 (B3.1)** is the sampled target the diff touches. Benedetti–Lisca, arXiv:1806.04991v2, was read in the cached arXiv text:
  - Theorem 1 on p.1 (line 15): every orientable closed 3-manifold is parallelizable.
  - §2.1 spans pp.2–3 (lines 74–98, page break at line 86). It derives w₂=0 by Wu's formula, gets a Spin structure and a framing off a ball, and extends over the ball by π₂(SO(3))=0.

  The README's locator and its description of the Wu/Spin proof are accurate. The closed case is the source's, and the boundary and non-compact extensions are claimed as this roadmap's own, as the README says.
- **The other sampled targets** (2.1, 2.7, 3.3, 5.1, 5.6, 6.1, 6.4, 7.2, 8.2, 8.3, 8.5, 9.3, 9.4, 10.3) are untouched by the diff. Their checks carry from ~7, ~9, ~10 and ~11; 2.1's GeometricTopology 11.1 citation is R02.

### Ownership and overlaps

- **Overlap scan.** `overlaps.md` lists:
  - DifferentialGeometry 5.5b at #886: R04.
  - AlgebraicTopology Layers 2, 4, 6 and 8 at #1652: named in the description.
- **Other changes to this roadmap.** No open pull request changes TangentialBordism or drops an id it cites.
- **Closest vocabulary.** HomotopySpheres (#1287, #284) is on the dropped list: R01.
- **Unchecked pull requests.** Ownership against open pull requests whose files the brief does not supply was not checked.

### Adversarial mathematics table

Rows marked "new" were computed this round. Rows marked "~13" carry from PRREVIEW-TangentialBordism~13, for statements the diff leaves untouched.

| Statement / target | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| 8.4 `:2199–2203`: M°=M∖∂M, boundaryless, inclusion ≃ (GT 1.1) | ∅; ℝ³; ℍ³; [0,1] (dimension-one analogue) | ∅°=∅, K=∅; ℝ³°=ℝ³ (`interior_eq_univ`); ℍ³°={x₀>0}≅ℝ³ via (t,y,z)↦(eᵗ,y,z), both contractible; (0,1)↪[0,1], both contractible | Pass, new |
| 8.4 `:2203–2206`: triangulation of M° infinite, K countable and locally finite | Kuhn triangulation of ℝ³; its image in ℍ³°; D³° | 6 tetrahedra per cube, 24 per vertex, countably many (ℤ³×6); x₀-widths eᵏ(e−1)=1.718 (k=0), 0.0116 (k=−5), accumulating at ∂ℍ³, so locally finite in M° and not in M; open ball non-compact, so K infinite | Pass, new |
| 8.4 `:2207–2209`: section of the pulled-back Spin(3) bundle over cells | cells of dimension 1, 2, 3; a 4-cell | needs π₀,π₁,π₂(S³)=0,0,0; π₃(S³)=ℤ would obstruct, but `skeletonLT 4`=univ for faces with ≤4 vertices | Pass, new |
| 8.4 `:2209–2211`: transport back along \|K\|→M°→M | ℍ³; S¹×D² | P≅(i∘h∘g)*P=g*(h*i*P), trivial; S¹×D²: H¹(;ℤ/2)=ℤ/2 Spin structures, each underlying Spin(3) bundle trivial (Spin(3) connected, M≃S¹) | Pass, new |
| Check `:2226` | ℍ³; S¹×D²; S¹×[0,1)×ℝ; D³ | finite K gives compact \|K\|, but ℍ³ is non-compact; π₁=ℤ on both sides, generator S¹×{0} in the interior; same for S¹×(0,1)×ℝ; D³ compact, open ball not | Pass, new |
| Supplier row `:245`, GT 1.1 hypotheses | model and separation axioms | GT `:537`: Hausdorff, second countable, `𝓡∂ n`; headline: `T2Space`, `SecondCountableTopology`, `modelWithCornersEuclideanHalfSpace 3` | Pass, new |
| CW on \|K\| via GT 11.1 (`:245`, `:2204`) | interval complex; 3-dimensional K | pinned `realizationCWComplex`: 2 zero-cells + 1 one-cell; `skeletonLT 4`=univ | **R02**: owner is the pin |
| *Needs:* `:2228` | GT 1.1 added; B1.5 kept | 1.1 is used by the route; B1.5 adapts the quotient carriers RP⁴ and CP² of the table Checks | Pass, new |
| Scope `:42–49`, `:1151`, `:2878` | dropped-names list | gate dropped=4; after the R01 edits, 0 hits for every listed name | **R01** |
| Benedetti–Lisca locator (8.4) | Theorem 1, p.1; §2.1, pp.2–3 | cached text line 15; lines 74–98 (page 3 at line 86) | Pass, new |
| From Tau Ceti `:222–227`, pinned generator normalisation | ℝ, x=0; x=5; −o; chart z↦−z | δ(g)=[−1]−[1]=−δ(seg); [4]−[6]; b₀=−1; chart-independent | Pass, ~13 |
| 2.2 `:517–532`, u₁=−1 and Check `:611` | m=1; [0,1] | AT/pinned = −1; (−1)(−[seg])=[seg]; endpoint signs (−1,+1) | Pass, ~13 (#1652 `:2266` re-read at 4e825d6) |
| 2.1 / 2.3 GT 11.1 and 11.3 | interval; ∅; ∂Δ²; S² tetrahedron | 2+1 cells; empty; 3+3 cells; 4+6+4 simplices | Pass, ~13 (owner: R02) |
| `orientedThreeManifold_parallelization` | ∅; ℝ³; ℍ³; negated e₁ | vacuous; det 1; det 1; det −1 excluded | Pass, ~13 |
| `exists_contMDiff_homotopicRel` | M=∅; C=U=∅; C=M; P=pt | empty g; Whitney approximation; g=f; g=f | Pass, ~13 |
| `:107–108` outward-first = pinned `boundaryOrientation` | half-space ℝ² | (−e₀,v) positive iff v=−e₁ | Pass, ~13 |
| From Tau Ceti `neg`, `pullback`, `prod`, interval endpoints | `interval 0 1`; t↦1−t; [0,1]² | (−1,+1)↦(+1,−1); −interval; swap det −1 | Pass, ~13 |
| 2.2 cylinder Check, DG 5.5b facet and corner signs | I×[0,1]; Q² facets; corner | −(I×∂); (−1)^(i+1) = −1, +1 | Pass, ~13 |
| `orientable_closedBall` | n=1, 2, 0 | [−1,1] and D² orientable; `NeZero 0` fails | Pass, ~13 |
| 2.1 Sard / parametric / relative transversality | M=∅; pt→ℝ²; t² on [0,∞) | image ∅; null point; stratum critical at 0 | Pass, ~13 |
| 2.4 / 2.5 interval gluing, relative interval | [0,1]∪[1,2]; ([0,1],{0,1}) | +1−1 at 1; (−1,+1)∈ℤ² | Pass, ~13 |
| 2.7 quartic / E(1) | degree 4; F=3H−ΣEᵢ | χ=24, σ=−16, Â=2; F²=0, χ=12, σ=−8 | Pass, ~13 |
| Gap finite-quadratic-arf | V=0, H, A, H⊕A, A⊕A | Gauss sums 1, 2, −2, −4, 4 | Pass, ~13 |
| 3.1–3.4 | O points; interchange; pt, ∅ | 1+1=0; (−1)^(1·1)=−1; 1, 0 | Pass, ~13 |
| 4.1–4.4 operations | a∈H¹(RP∞); RP²; p=3 | Sq²a²=a⁴; w(RP²)=1+a+a²; P¹y=y³ | Pass, ~13 |
| 5.1–5.7 | framed point; ranks (0,1,1), (2,2,5); AHSS on pt | ±1; normal ranks 2, 5; E²=Ω_q, `hatcherSS line 1010` | Pass, ~13 |
| 6.2–6.6 | id S¹; RP²; H_ℝ(2,4); σ₄ | 0 vs 1; w₁²=w₂=1; binom(6,2)=15≡1; ∂₂σ₄=σ₂ | Pass, ~13 |
| 7.1–7.2, 8.1, 8.5 | +pt; K3; Lie torus; n=1,2 | 1; σ/16=−1; Arf 1; S¹=∂D² | Pass, ~13 |
| 9.1–9.4 | (1,0,0); flip C₈; OP²; HP² | trace 1; −I₁₆; (381·39−19·36)/14175=1; (49−4)/45=1 | Pass, ~13 |
| 10.1–10.4 | C₃; HP² Gysin; KS numbers | ker(3)=0; π!u₄²=1; gcd 28 | Pass, ~13 |

Every mathematical row passes. R01 and R02 are policy and ownership findings, not mathematical errors.

## Not verifiable

- **Lee, *Introduction to Smooth Manifolds*, Theorem 9.26** (Springer, paywalled). GeometricTopology 1.1 cites it for the interior homotopy equivalence on which the 8.4 route rests. I relied on GeometricTopology's statement and on the standard collar argument, not on the text.
- **Munkres, *Elementary Differential Topology*, Theorems 10.5–10.6, and Whitehead 1940** (paywalled). These are the sources of GeometricTopology 11.3 and of 2.3's relative refinement. They are cited by locator alone and are unchanged since ~13.
- **AlgebraicTopology 8.13 and DifferentialGeometry 5.5b** exist only at open heads (#1663, #886): R03 and R04.

## Source issues

- none
