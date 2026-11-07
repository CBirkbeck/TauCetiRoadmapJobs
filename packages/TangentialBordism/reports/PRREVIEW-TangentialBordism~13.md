# Review of TangentialBordism (pull request #942 at ac710dc)

**Verdict:** needs changes

This is an incremental re-review of the 76 README lines that changed since 1d3ca3f, which PRREVIEW-TangentialBordism~11 read. `Suggested.lean` and `metadata.toml` are byte-identical to 1d3ca3f. Nothing outside the folder changed.

- **~11 R01 is repaired.** The repaired text is correct at the Tau Ceti pin and agrees with AlgebraicTopology 6.3 at its head. I recomputed u₁ = −1 from the pinned definitions.
- **The GeometricTopology renumbering is correct.** It moves the citations to Layer 11.1 and Layer 11.3, and both resolve at the head of #903, which the description names.
- **R01 below is new.** It is in a sentence this head renumbers: the 8.4 route has no triangulation input for a non-compact three-manifold with boundary.
- **The two revision-naming findings remain.** ~11 R02 and R03 are not repaired (R02 and R03 below).

## R01 (P3) — 8.4's obstruction route has no triangulation input for a non-compact three-manifold with boundary

**Location.** `TauCetiRoadmap/TangentialBordism/README.md:2199–2202` (8.4, B3.1): "of a smooth triangulation of M (GeometricTopology Layer11.3's Whitehead triangulation and its Layer11.1 simplicial CW structure; for boundary, B1.5's relative refinement)". The *Needs:* line is `:2222`.

**Claim.** These inputs give a CW model for every M the headline covers. That class is stated at `:2166` ("with boundary allowed and without a compactness or connectedness assumption") and in `orientedThreeManifold_parallelization`, which has no compactness hypothesis.

**Witness.** Take the closed half-space ℍ³, the instance of the Check at `:2219`. Neither cited input applies to it:
- This roadmap consumes GeometricTopology Layer 11.3 only for manifolds "without boundary" (`:627`).
- B1.5's refinement is stated only "for every compact smooth manifold N with boundary" (`:632`).

The clause predates this head, but it sits in the sentence that this head renumbers.

**Repair.**
1. At `:2201–2202`, replace "for boundary, B1.5's relative refinement" with: "when M has boundary, applied to the interior M∖∂M, a boundaryless smooth three-manifold whose inclusion into M is a homotopy equivalence (GeometricTopology Layer 1.1)".
2. Add "GeometricTopology Layer 1" to the *Needs:* line at `:2222`.

**Test on ℍ³.**
- The interior ℝ²×(0,∞) ≅ ℝ³ is boundaryless and non-compact, so GeometricTopology 11.3 triangulates it.
- GeometricTopology 1.1, at the head of #903 (`README.md:560–561`), makes the inclusion of the interior a homotopy equivalence, for every second-countable manifold with boundary.
- The CW model is contractible, so the Spin bundle is trivial, and the coordinate frame has determinant 1, as in the Check.

## R02 (P3) — AlgebraicTopology 8.13 is defined only at open revision #1663, which the description still does not name

**Location.**
- `README.md:243`: "Layers2–4,6,8 and 8.13".
- Also `:75`, `:388`, `:412`, `:423`, `:445`, `:486`, `:804` and `:2879–2881`.
- The description's revision paragraph: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652".

**Claim.** The cited numbering, 8.13 included, is defined by the revision the description names.

**Witness.**
- AlgebraicTopology on main (eaf17b1) has no "8.13".
- The head of #1652 (c686921) has none either.
- The head of #1663 (8029fe9) defines it, at `README.md:68` and `:2704`.

**Repair.**
- Name #1663 beside #1652 in that paragraph, and say which of the two merges first.
- The other is rebased on it, so that one head carries both Layer 8 and 8.13.
- No README change is needed.

Re-raised from ~11 R02. No repair report marks it not actionable.

## R03 (P3) — DifferentialGeometry 5.5b is defined only at open revision #886, which the description still does not name

**Location.**
- `README.md:244`: "5.5b's smooth face structure and face-indexed abstract boundary".
- Also `:338`, `:373`, `:453`, `:486`, `:498`, `:565`, `:610`, `:613`, `:712` and `:804`.
- The same description paragraph.

**Claim.** DifferentialGeometry 5.5b is a citable supplier section.

**Witness.**
- DifferentialGeometry on main (eaf17b1) has 0 hits for "5.5b".
- The head of #886 (a565de6) defines it at `README.md:88` and `:850`.
- `overlaps.md` lists "DifferentialGeometry §5.5b … #886 … must merge first".

**Repair.** Name #886 in the revision paragraph. No README change is needed. #903 may be listed there as well, but this is not required: the description's Finite Arf paragraph already names it, for GeometricTopology 4.3.1, 11.1 and 11.3.

Re-raised from ~11 R03.

## Previous findings

- **R01 — repaired.**
  - From Tau Ceti `:222–235` now gives the normalisation: "[−b₀]−[b₀]; so on ℝ … connecting-map image [−1]−[1] and is minus the class of the increasing segment". It also names `TauCeti.HomologicalOrientation`.
  - 2.2 `:517–532` states u_m, with u₁=−1, and the new Check is at `:611`.
- **R02 — not repaired (now R02).** The description still reads "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652", and `:243` still cites "Layers2–4,6,8 and 8.13".
- **R03 — not repaired (now R03).** The same paragraph names only #1652, and `:244` and `:565` still cite 5.5b's faces, sheet orientations and product boundary sign.

## Verified sound

### Gate, dependency direction, outside-folder diff, elaboration

- **Gate.** Rerun at ac710dc with `--base origin/main`:

  ```text
  gate TangentialBordism: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  Exit 0. The worker's record at this head adds `build=0`.
- **Dependency check** with `--movable`:

  ```text
  depcheck: 242 roadmaps, 2452 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line.
- **Folder and outside-folder diff.** The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/TangentialBordism/Suggested.lean` exits 0, and its only diagnostics are the two `sorry` warnings (`:51`, `:71`).
- **Signature probe.** I elaborated a scratch copy with `#check @` for both theorems and five pinned names:
  - Both theorem types are identical to `signatures.md`, and no section binder is lost.
  - The README's statements of `exists_contMDiff_homotopicRel` (B1.6) and `orientedThreeManifold_parallelization` (8.4) match them.
- **Headlines and padding.** The headline list and the not-statable list in the docstring are unchanged. The one-tactic padding probe carries from ~9 to ~11 because the file is byte-identical.

### Pinned declarations opened this round

These are at Tau Ceti 2fd255d9; all elaborated in the probe.

- `reducedSingularHomologySphereIso` (`AlgebraicTopology/Singular/Sphere.lean:470`) takes `b : OrthonormalBasis (Fin (n+1)) ℝ E`, and `_inv_ι` (`:498`) gives `[-b 0] − [b 0]` in degree 0. This is as at `:223–227`.
- `reducedSingularHomologySphereIsoOfOrientation` (`LocalHomology/Orientation/Chart.lean:47`) is the sphere iso of `o.finOrthonormalBasis`, so it uses an oriented orthonormal basis, as at `:225`.
- `singularHomologyComplSingletonIsoOfOrientation` (`:104`), `localOrientationOfOrientedChart` (`:169`), `localOrientationOfManifoldOrientation` (`:202`) and `_neg` (`:227`): the generator is `inv 1` of the chart iso.
  - The binders are `ChartedSpace E M`, `IsManifold 𝓘(ℝ,E) 1 M`, `T2Space M`, `InnerProductSpace ℝ E` and `finrank E = n+1`.
  - This is as at `:215–222`, where the model is a "real inner-product space of dimension n+1".
- `singularHomologyComplSingletonIso` (`LocalHomology/Basic.lean:170`) composes three maps:
  - the chart isomorphism;
  - the reduced δ of `(E, E∖{φ x})`;
  - `complSingletonHomotopyEquivSphere`, which is radial projection about y followed by translation by −y (`Topology/Homotopy/PuncturedStarConvex.lean:243`).

  This is the "chart, the reduced connecting map and radial projection" of `:223–224`.
- `cubeRelClass_singularHomologyδ` (`IntervalGenerator.lean:125`): δ of the increasing simplex is [end]−[start]. `singularHomologyCubeBoundaryPairIso_one_inv` (`:295`): the native interval generator is −`cubeRelClass`. This is the same sign as the README's "minus the class of the increasing segment".
- `HomologicalOrientation` (`LocalHomology/Orientation/Homological.lean:75`) is a structure: a local orientation at each point, invariant under path transport.
  - Only one file at the pin mentions `HomologicalOrientation` and imports `Geometry/Manifold/Orientation/Basic`: `Geometry/Manifold/Foliation/EulerClass.lean`. It uses homological orientations of surfaces only.
  - No declaration mentions `localOrientationOfManifoldOrientation` outside `Chart.lean`.
  - So "no declaration relating them" (`:232–235`) is accurate.

### Cross-roadmap citations resolved

- **GeometricTopology at the head of #903 (a49ede6).**
  - `### 11.1 The realization and its CW structure` (`README.md:12972`) builds the `Topology.CWComplex` on `Realization K` with the realized simplices as closed cells, for every abstract simplicial complex. This covers the finite complexes of 2.3 (`:629–630`).
  - `### 11.3 Smooth triangulations and combinatorial manifolds` (`:13038`) is the Cairns–Whitehead theorem.
  - #903's anchor note (`:528–532`) maps main's "smoothing-and-triangulation comparison, item 1" to Layer 11.3. Main has only "Layer 11" (`:831`) and that item (`:930`). #903's downstream note (`:13180–13182`) lists this roadmap as a consumer of Layers 1, 4.3.1 and 11.3.
  - Neither 11.1 nor 11.3 cites this roadmap, so there is no cycle.
  - Every occurrence of the old numbering is gone: `grep` for "smoothing item" and "item1 of" returns 0 hits. The new citations are at `:245`, `:342–343`, `:628–630`, `:659`, `:804`, `:2200–2201`, `:2222` and `:2273`.
- **AlgebraicTopology 6.3 at the head of #1652 (c686921).**
  - The point generator is the signed image of the ordered-simplex class with v₀=−∑e_i, v_i=e_i (`:2045–2046`, `:2022–2023`).
  - For m=1 this is the segment [−1,1] with boundary [1]−[−1] (Check, `:2281–2282`). This is as at `:514–515` and `:529–530`.
  - Its comparison units sₙ=σₙιₙ(g̃ₙ) with the native sphere generators are at `:2210–2271`. These are "AlgebraicTopology 6.3's comparison units" (`:527–528`).
- **Ownership of the comparison.** No roadmap on main, at the heads of #1652, #1663 or #886, or in the open index (`roadmaps grep`) mentions `localOrientationOfManifoldOrientation`. B1.1 owning the u_m comparison is therefore not a duplicate.
- **Citation resolver.** The worker's resolver found no unresolved citation or Lean name.

### Seeded sample, where it meets the change

- **2.1 (B1.6) and 2.3 (B1.5)** are the sampled targets the diff touches. The change in both is the GeometricTopology renumbering, checked above. 2.3's Check "two vertex cells and one edge" agrees with 11.1's CW structure.
- **2.3's Munkres locator** (Theorem 10.6, p.104) is unchanged and was not re-verified this round; the text is paywalled (Not verifiable).
- **The other sampled targets** (2.5–2.7, 4.3, 4.4, 5.1, 5.3, 5.6, 5.7, 6.4, 8.2, 9.3, 10.4) are untouched by the diff. Their locator checks carry from ~7, ~9 and ~10.

### Ownership and overlaps

- **Overlap scan.** `overlaps.md` lists five items:
  - DifferentialGeometry 5.5b at #886: R03.
  - AlgebraicTopology Layers 2, 4, 6 and 8 at #1652: named in the description.
- **Other changes to this roadmap.** No open pull request changes TangentialBordism or drops an id it cites.
- **Revision dependencies.** GeometricTopology 4.3.1, 11.1 and 11.3 exist only at #903, which the description names.
- **Pin mismatch with the supplier.** AlgebraicTopology's head is pinned to Tau Ceti 358314d, not 2fd255d. Its σ₀ dichotomy (`:2245–2265`: σ₀=−1 when the native pole is q) covers the basis-indexed generator at this pin, where the pole is b 0=e₀=q. So σ₀=−1=u₁, consistent with `:528`.
- **Unchecked pull requests.** Ownership against open pull requests whose files the brief does not supply (for example #1797) was not checked.

### Adversarial mathematics table

Rows marked "new" were computed this round on the changed passages. Rows marked "~11" carry from PRREVIEW-TangentialBordism~11 for passages the diff leaves untouched.

| Statement / target | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| From Tau Ceti `:222–227`, pinned generator normalisation | ℝ, chart id, increasing orientation, x=0 | b₀=1; sphere generator [−1]−[1]; radial map = sign; δ(g)=[−1]−[1]; δ(segment −1→1)=[1]−[−1]; so g=−[segment] | Pass, new |
| Same, translated point | x=5 | radial about 5; δ(g)=[4]−[6]=−δ([4,6]); ratio −1 | Pass, new |
| Same, reversed orientation | −o at 0 | b₀=−1; δ(g)=[1]−[−1]; g=+[segment]; AT gives −[segment]; ratio −1 | Pass, new (u₁ unchanged under reversal) |
| Same, negative chart | chart z↦−z with chart sign −1, same orientation | chart orientation −std, b₀=−1; δ in E is [1]−[−1]; pulled back by z↦−z gives [−1]−[1]; g=−[segment] | Pass, new (chart-independent) |
| From Tau Ceti `:229–235`, no bridge between homological and smooth orientation | grep of the pin | 1 file mentions `HomologicalOrientation` with the orientation import (surfaces only); 0 declarations outside `Chart.lean` mention `localOrientationOfManifoldOrientation` | Pass, new |
| 2.2 `:517–532`: u_m depends only on m | m=1; ℝ vs EuclideanSpace ℝ (Fin 1) | reduce by translation and an oriented isometry to ℝ^m at 0; pin naturality `Chart.lean` (`…IsoOfOrientation_hom_naturality`); AT linear sign law, det>0 gives +1 | Pass, new |
| 2.2: u₁ via AT 6.3 σ₀ | standard basis at this pin | p₀=e₀=q gives σ₀=−1 (#1652 `:2264`); direct: AT/pinned = [seg]/(−[seg]) = −1 | Pass, new |
| 2.2 `:530–531`: "u_m times pinned = AT" | m=1 | (−1)(−[seg]) = [seg] = AT generator | Pass, new |
| 2.2 Check `:611` | [0,1] with increasing orientation | AT: ∂_*[I,∂I]=[1]−[0]; without u₁: −([1]−[0])=[0]−[1], contradicting endpoint signs (−1,+1) from the pinned interval lemmas | Pass, new |
| 2.2 `:566–572`: frame, local-homology (AT) and determinant agree in every dimension | m=0; m=1 | m=0: AT generator σ(x)[x]₊ vs frame ray σ; the pin needs m=n+1≥1, so naming AT here is required; m=1: frame e₁, det +1, AT [seg] | Pass, new |
| 2.1 `:342–343`, 2.3 `:628–630`, GT 11.1 | interval complex; ∅; boundary of the 2-simplex | 2 zero-cells + 1 one-cell; empty CW complex; 3+3 cells ≅ S¹ | Pass, new |
| 2.3 `:626–628`, GT 11.3 | S² as the tetrahedron boundary; ℝ³ | 4+6+4 simplices, smooth on faces (GT Check); infinite locally finite triangulation | Pass, new |
| 8.4 route `:2199–2202` | ℍ³; [0,1)×ℝ²; compact D³ | ℍ³ and [0,1)×ℝ²: boundary present and non-compact, so neither GT 11.3 (boundaryless use, `:627`) nor B1.5 (compact, `:632`) applies; D³: B1.5 applies | **Fail: R01**; repaired by the interior route (ℝ³, contractible, GT 1.1 `:560–561`) |
| `orientedThreeManifold_parallelization` (headline, unchanged) | ∅; ℝ³; ℍ³; negated e₁ | vacuous; det 1; det 1; det −1 excluded | Pass, ~11 |
| `exists_contMDiff_homotopicRel` (headline, unchanged) | M=∅; C=U=∅; C=M; P=pt | empty g; Whitney approximation; g=f; g=f | Pass, ~11 |
| `:107–108` outward-first = pinned `boundaryOrientation` | half-space ℝ² | (−e₀,v) positive iff v=−e₁; pin gives −basisFun | Pass, ~11 |
| From Tau Ceti `neg`, `pullback`, `prod`, interval endpoints | `interval 0 1`; t↦1−t; [0,1]² | endpoints (−1,+1)↦(+1,−1); pullback by 1−t is −interval; swap det −1 | Pass, ~11 |
| From Tau Ceti `IsOrientedAtlas.orientation`, converse absent | ℝ with {id}; [0,1] | standard orientation; [0,1] oriented but has no oriented atlas | Pass, ~11 |
| 2.2 cylinder Check `:610`, DG 5.5b facet and corner signs | I×[0,1]; Q² facets; corner (0,0) | t=1 +e_s, t=0 −e_s, s=0 +e_t, s=1 −e_t, i.e. −(I×∂); (−1)^(i+1) = −1, +1; lifts +1 vs −1 | Pass, ~11 |
| 2.2 atlas converse, dim ≥ 2 | ℝ² half-space; quadrant | reflection det −1; swap det −1 | Pass, ~11 |
| `orientable_closedBall` | n=1, 2, 0 | [−1,1] and D² orientable; `NeZero 0` fails | Pass, ~11 |
| 2.1 Sard / parametric / relative transversality | M=∅; pt→ℝ²; t² on [0,∞); β=ψ² | image ∅; null point; stratum critical at 0; dβ=0 on ψ=0 | Pass, ~11 |
| 2.2 dimension-zero signs | two point rays | ±1 on the same empty basis | Pass, ~11 |
| 2.3 relative triangulation | [0,1], D², ∅ | two vertices + edge; cone on triangle; empty | Pass, ~11 |
| 2.4 / 2.5 interval gluing, relative interval | [0,1]∪[1,2]; ([0,1],{0,1}) | +1−1 at 1; (−1,+1)∈ℤ² | Pass, ~11 |
| 2.7 quartic / E(1) | degree 4; F=3H−ΣE_i | χ=24, σ=−16, Â=2; F²=0, χ=12, σ=−8 | Pass, ~11 |
| Gap finite-quadratic-arf | V=0, H, A, H⊕A, A⊕A | Gauss sums 1, 2, −2, −4, 4 | Pass, ~11 |
| 3.1–3.4 | O points; interchange; pt, ∅ | 1+1=0; (−1)^(1·1)=−1; 1, 0 | Pass, ~11 |
| 4.1–4.4 operations | a∈H¹(RP∞); RP²; p=3 | Sq²a²=a⁴; w(RP²)=1+a+a²; P¹y=y³ | Pass, ~11 |
| 5.1–5.7 | framed point; ranks (0,1,1), (2,2,5); AHSS on pt | ±1; normal ranks 2, 5; E²=Ω_q, `hatcherSS line 1010` | Pass, ~11 |
| 6.2–6.6 | id S¹; RP²; H_ℝ(2,4); σ₄ | 0 vs 1; w₁²=w₂=1; binom(6,2)=15≡1; ∂₂σ₄=σ₂ | Pass, ~11 |
| 7.1–7.2, 8.1, 8.5 | +pt; K3; Lie torus; n=1,2 | 1; σ/16=−1; Arf 1; S¹=∂D² | Pass, ~11 |
| 9.1–9.4 | (1,0,0); flip C₈; OP²; HP² | trace 1; −I₁₆; (381·39−19·36)/14175=1; (49−4)/45=1 | Pass, ~11 |
| 10.1–10.4 | C₃; HP² Gysin; KS numbers | ker(3)=0; π!u₄²=1; gcd 28 | Pass, ~11 |

Every row passes except the R01 row.

## Not verifiable

- **Lee, *Introduction to Smooth Manifolds*** (Springer, paywalled).
  - Theorem 9.26 is cited by GeometricTopology 1.1, on which the R01 repair rests. I relied on GeometricTopology's own statement, not the text.
  - Proposition 15.6 is cited by DifferentialGeometry 2.2: unchanged since ~11.
- **Munkres, *Elementary Differential Topology*** (Annals of Math. Studies 54, paywalled), Theorem 10.6, p.104: cited by locator alone in 2.3 and unchanged.
- **Whitehead 1940 and the other locator-only works** listed in ~11 are untouched by the diff.
- **AlgebraicTopology 8.13 and DifferentialGeometry 5.5b** exist only at open heads (#1663, #886): R02 and R03.

## Source issues

- none
