# Review of CalibratedGeometry (pull request #946 at e1665fc)
**Verdict:** accepted

:robot: Independent AI review, incremental: 22 changed lines since `d70bed5`, the head the previous review accepted. The change is in `TauCetiRoadmap/CalibratedGeometry/README.md` only. It replaces five citations of GeometricTopology's "smoothing and triangulation comparison item 1" with "GeometricTopology 11.3". Main no longer has that item, because GeometricTopology's revision merged and renumbered it. `Suggested.lean` and `metadata.toml` are byte-identical to `d70bed5`, and so are the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). No finding. Nothing in the worktree was changed.

## Previous findings

- none: the previous review (at `d70bed5`) was an acceptance with no findings, so there is nothing to account for.

## Verified sound

**The changed passages (5 places), each checked against the supplier as it is now.**
- Scope bullet (`README.md:96–100`), "Existence of smooth triangulations of smooth manifolds without boundary (Cairns–Whitehead): GeometricTopology 11.3 (smooth triangulations and combinatorial manifolds)". On main (`origin/main` `1bea8354`, and identically in the merged worktree), `TauCetiRoadmap/GeometricTopology/README.md:7887` is `### 11.3 Smooth triangulations and combinatorial manifolds`. It proves the Cairns–Whitehead theorem: every smooth manifold has a homeomorphism `Realization K ≃ₜ M` satisfying the pinned `TauCeti.IsSmoothTriangulation`, unique up to PL homeomorphism (Munkres Theorems 10.5–10.6). The heading text quoted in parentheses matches the heading. GeometricTopology's Conventions add the standing Hausdorff and σ-compact hypotheses.
- GeometricTopology supplier contract (`README.md:360–365`). It consumes Layer 1 collars and "11.3 (the Cairns–Whitehead theorem: every smooth manifold has a smooth triangulation in the sense of the pinned `TauCeti.IsSmoothTriangulation`, used directly for closed sources)". This is what 11.3 states. Read under this README's Conventions (`:153–154`: Hausdorff, second countable, finite-dimensional), "every smooth manifold" is true. GeometricTopology Layer 1 (`:783`) with 1.1 "Smooth collars" (`:788`) still holds the collars.
- 2.4 (`README.md:757–758`), "For closed N take Whitehead's triangulation from GeometricTopology 11.3", and the 2.4 *Needs:* line (`:771–773`), "GeometricTopology Layer 1 (collars) and 11.3 (closed case)". 11.3 supplies an immersion on each closed simplex. On a compact N this gives everything 2.4 needs: a homeomorphism restricted to a compact simplex is injective and closed, so the immersion is a smooth embedding; and the vertex set of `|K|` is closed and discrete, so K is finite. The other inputs on the *Needs:* line resolve. TangentialBordism B1.5 is at #942's head `f212a45c` (`TangentialBordism/README.md:854–899`, `### 2.3 Quotient and bundle adapters (B1.5)`). That head advanced from `42329d2a` during this review, and the passage is unchanged apart from shifting 20 lines. It states the relative refinement with `∂N` a subcomplex. It itself consumes "GeometricTopology Layer11.3" for the boundaryless case (`:866–867`) and names CalibratedGeometry 2.4 as its consumer (`:879`). AlgebraicTopology Stage 6 item 3, the orientation local systems and fundamental classes, is on main at `AlgebraicTopology/README.md:1180`.
- Layer 2 Dependencies (`README.md:797`), "GeometricTopology Layer 1 and 11.3". This agrees with the *Needs:* line.
- No other passage of the README still cites the old item: `grep -n -i 'smoothing\|item 1'` finds only 2.3's own relative smoothing of simplices (`:54, :293, :718–727`).
- No process words in the changed lines, and the heading text in parentheses matches the heading.

**Library declarations opened at the pin.** Tau Ceti `2fd255d9`, `Geometry/Manifold/SmoothTriangulation/Basic.lean:191` (`IsSmoothTriangulation I n f`: `∀ σ : Face K, IsSimplexImmersion I n (f ∘ faceInclusion K σ)`, Whitehead's `Cⁿ`-triangulation) and `:195` (`isSmoothTriangulation_iff`, `Iff.rfl`). This is the README's description at `:295–296` and in the contract.

**Gate, build, order.**
- Gate re-run on this head: `gate CalibratedGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate with the targeted build also reports `build=0 … OK`.
- `lake env lean TauCetiRoadmap/CalibratedGeometry/Suggested.lean`: exit 0 in 14 s, exactly eleven warnings, all `sorry`, at lines 71, 128, 162, 168, 198, 206, 239, 280, 289, 326 and 374. No other output.
- Dependency check: `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `ORDER.txt`: SmoothBundlesConnections 12, PseudodifferentialOperators 13, TangentialBordism 14, CalibratedGeometry 225, FukayaTheory (a consumer) 226. GeometricTopology, RiemannianGeometry, AlgebraicTopology and ComplexKahlerGeometry are on main.
- Outside the folder: `git diff --stat origin/main...HEAD` lists only the folder's three files. The files that `changes.md` lists outside the folder come from the merge of main (`35fe690a`, second parent `3987f939` = the merge base), not from this pull request.

**Signatures and padding (file unchanged).** `signatures.md` lists the same 26 declarations and the same five dropped-binder leads as the previous review: the definitions `IsCalibration`, `IsKahlerMetric`, `IsNormalizedHolomorphicVolumeForm`, `specialLagrangianForm` and `contractionPullback`. The previous review checked each against its README statement, and every theorem about them carries the hypotheses. `Suggested.lean` is byte-identical, so the previous one-tactic probe still holds: none of the eleven theorems closed.

**Overlaps and ownership for the changed citation.**
- `overlaps.md`: no other pull request changes this folder, no cited id is dropped, and no id is defined only by an open revision. `citations.md`: none found nowhere.
- `roadmaps grep -i 'fundamental chain|smooth triangulation'` over main and the open heads finds no other owner of ordered smooth triangulations or of integral fundamental chains of smooth triangulations. The existence statement is GeometricTopology 11.3's (main) and the relative refinement is TangentialBordism B1.5's (order 14), as cited.

**Remarks on text outside this folder (no change requested here).**
- The two open GeometricTopology revisions predate the merged revision. #1797's head (`ad233ac`) puts Whitehead's theorem at `### 12.1 Smooth manifolds are PL manifolds` (`:3123`), and its 11.3 is "Combinatorial manifolds and the reconciliation with PL manifolds" (`:3012`). #1791's head still has the far-horizon item list (`:931–944`). Neither has main's 11.3 heading or `exists_chartedSpace_hasGroupoid_PLGroupoid` (main has 3 occurrences, each head 0). This README correctly cites main, since a revision is never a dependency. When either revision is rebased onto main, it must keep 11.3 or give an old → new mapping.
- ArithmeticLocallySymmetricSpaces (#871, merge order 59) also states the smooth triangulation of compact manifolds with boundary (`ArithmeticLocallySymmetricSpaces/README.md:2405`, ALS.2.4). TangentialBordism B1.5 (order 14) owns that statement. That is ArithmeticLocallySymmetricSpaces' duplication; this README cites the earlier owner.

**Adversarial table.** New rows cover the changed statements. Rows marked (r9) are carried from the previous report (`PRREVIEW-CalibratedGeometry~9`) for statements this diff leaves untouched, with the values computed there.

| Statement | Instances | Values computed (each side) | Result |
|---|---|---|---|
| 2.4 closed case through GT 11.3 (new) | `S¹` as the radially projected triangle `a<b<c` | `c = [a,b] + [b,c] − [a,c]`, `∂c = (b−a)+(c−b)−(c−a) = 0 = c_(∂S¹)`; `∫_c dθ = 3·(2π/3) = 2π = ∫_(S¹) dθ` | holds |
| 2.4 closed case (new) | `S²` as the radially projected tetrahedron `0<1<2<3` (GT 11.3's own Check) | `c = [123] − [023] + [013] − [012]`, `∂c = ∂∂[0123] = 0`; four spherical triangles of area π, total `4π` | holds; each face is an embedding, the realization map is not smooth across edges |
| 11.3 immersion ⇒ 2.4 embedding (new) | a homeomorphism restricted to a compact simplex | injective and closed, so a topological embedding; together with an injective derivative it is a smooth embedding | holds |
| 11.3 ⇒ finite K on closed N (new) | compact `|K|`; ℝ with vertex set ℤ | vertices are closed and discrete (pairwise distance `√2` in barycentric coordinates), so there are finitely many; ℤ is infinite but ℝ is not compact | holds |
| 2.4 degenerate closed sources (new) | N = ∅; N = a point, m = 0 | `K = ∅`, `c = 0 = [∅]`; one vertex, `IsSimplexImmersion` on the zero tangent space holds, `c = ±[v]`, `∫_c η = ±η(pt) = ∫_N η` | holds |
| contract "every smooth manifold" (new) | line with two origins; long line | no homeomorphism from a Hausdorff realization; not second countable, while a compact or locally finite realization is metrizable | excluded by the Conventions (`:153`: Hausdorff, second countable) |
| `norm_eq_sSup_abs_orthonormal` (r9) | `dx₁∧dx₂+dx₃∧dx₄` on ℝ⁴; k = 0, φ = −3; k = 3 on ℝ² | sup 1 at `(e₁,e₂)`, norm 1; `{3}`, `‖const‖ = 3`; `sSup ∅ = 0 = ‖0‖` | holds |
| 1.2 comass form, `normDet` identity (r9) | `((1,0),(1,1))`; `(v,v)`; empty frame | Gram `[[1,1],[1,2]]`, volume 1 vs `Π‖vᵢ‖ = √2`; 0; 1 = `normDet` on the zero space | holds |
| 1.3 upper bound (r9) | `dx₁∧dx₂+dx₃∧dx₄` | `1 ≤ √2 ≤ √6`; `‖φ̂‖² = 2 ≤ √6·√2·1` | holds |
| 1.4 quotient dimension (r9) | k = 2, ℝ³; k = 1, ℝⁿ; k = n | `6 − 3 − 1 = 2 = 2(3−2)`; `n − 1`; 0, two points | holds |
| 1.4 pinned index (r9) | k = 2, ℝ³; k = 1 | `index_gramSym2Deriv = 2·3 − 3 = 3`; `n − 1` | pinned |
| 1.5 `IsCalibratedFrame` (r9) | `dx₁∧dx₂` on `(e₁,e₂)`, `(e₂,e₁)`, `(e₁,e₃)`; `((2,0,0),(0,1/2,0))`; k = 0, φ = ±1 | 1, −1, 0; value 1 but not orthonormal; T / F | holds |
| 1.6 products (r9) | `dx∧dx`; `ω₁∧ω₂`; Züst | 1 vs bound 2; 1 vs bound 6; `294/256 > 1` | holds |
| `IsCalibration` (2.1) (r9) | `dx₁∧dx₂`; `2dx₁∧dx₂`; `x₃dx₁∧dx₂`; k = 0, −2 | comass 1, closed; comass 2; `d = dx₁∧dx₂∧dx₃`; the absolute bound rejects −2 | holds |
| `immersionVolume`, `IsCalibratedImmersion` (2.2) (r9) | circle of radius 2, both orientations; plane `x₃ = x₁` | 4π both; `f*φ = dvol/√2` | holds |
| 2.4 unit-square Check (computed here) | `a=(0,0)<b=(1,0)<c=(0,1)<d=(1,1)`, `[a,b,d]`, `[a,c,d]` | `det(b−a,d−a) = 1`, `det(c−a,d−a) = −1`; `∂c = ([b,d]−[a,d]+[a,b]) − ([c,d]−[a,d]+[a,c]) = [a,b]+[b,d]−[c,d]−[a,c]`, `[a,d]` coefficients −1, +1 | holds |
| 2.4 interval and Δ² Checks (computed here) | `[0,1]`; `Δ²`, `dx∧dy` | `∂c = [1] − [0]`; `∂c = [e₁,e₂] − [e₀,e₂] + [e₀,e₁]`, `∫_c dx∧dy = 1/2` | holds |
| `immersionVolume_le_of_isCalibratedImmersion` (r9) | flat torus `(t,0)` vs `(t, sin2πt/4)`; reversed circle; k = 0 | periods `(1,0)` both, `1 < ∫sqrt(1+(π/2)²cos²)`; period −1, hypothesis fails; signed counts | holds |
| 3.2 stability chain (r9) | flat disk, `V = u e₃`; equator `Sᵐ ⊂ S^(m+1)` | `Q = ∫|∇u|² ≥ 0`; `Q(ν,ν) = −m·Vol = (cosᵐt)″(0)·Vol` | holds; the equator is unstable and not calibrated |
| 3.2 calibrated ⇒ stable (r9) | compactly supported normal variation | `Vol(f_t) ≥ ∫f_t*φ = ∫f*φ = Vol(f)` | holds |
| 3.3 product calibration (r9) | `dθ₁` on `S¹×S¹`; `φ₁` of comass `c ≤ 1`, ψ unit decomposable; `φ₁ = 0` | comass 1, calibrates `S¹×{pt}`; `comass(φ₁∧ψ) = c`; 0 | holds |
| `standardKahlerForm`, `norm_standardKahlerForm` (r9) | n = 1, `(1,i)`, `(i,1)`, `(1,1)`; n = 0 | 1, −1, 0; zero form, comass 0, so `hn` is needed | holds |
| `isCalibratedFrame_standardKahlerForm_iff` (r9) | `(1,i)`, `(i,1)`, `(1,−i)`, n = 2 `(e₁,e₂)`, n = 0 | T/T, F/F, F/F, F/F, F/F | both directions |
| `kahlerPowerForm` (r9) | r = 0; n = r = 2; r = 3 > n = 2 | 1; `2/2! = 1` on `(e₁,ie₁,e₂,ie₂)`; `ω̂³ = 0` | holds |
| 4.2 Riesz bound (r9) | general n, r; n = 2, r = 1 | `‖ω̂ʳ‖/r! = sqrt(C(n,r))`; `√2 ≥ 1` | holds |
| `isCalibratedFrame_kahlerPowerForm_iff` (r9) | n = 3, r = 2, `(e₁,ie₁,e₂,cos t·ie₂+sin t·e₃)`; r = 0; r > n | `cos t`: T/T at 0, F/F at π, π/2; T/T; F/F | both directions |
| `IsKahlerMetric` (r9) | flat ℂ; `dx²+4dy²`; `|z|⁻²Re⟪,⟫` on `ℂ²∖0` | `ω(1,i) = 1`; `g(i,i) = 4`; `dω ≠ 0` | both clauses needed |
| `immersionVolume_le_of_isKahlerMetric` (r9) | r = 0; `{z₂ = 0}` disk | `#N ≤ #N′`; π vs any surface with equal periods | holds |
| `standardComplexVolume`, `norm_standardSpecialLagrangianForm` (r9) | n = 2, `(e₁,ie₂)`; n = 0, θ = π/2 | `det = i`; constant `cos(π/2) = 0`, so `hn` is needed | holds |
| `specialLagrangianFrame_iff` (r9) | n = 2 tilted frame; `(e₁,ie₂)` at θ = 0, π/2; `(e₁,ie₁)`; n = 0 | F/F; F/F, T/T; F/F; `cos θ = 1 ⇔ sin θ = 0 ∧ cos θ > 0` | both directions |
| `IsNormalizedHolomorphicVolumeForm`, `specialLagrangianForm` (r9) | `dz`; `2dz`; `dz̄`; `dz₁` on ℂ² | modulus 1; 2; `conj(i) ≠ i`; 0 on `e₂` | holds |
| `isCalibration_specialLagrangianForm` (r9) | n = m unitary frame; n > m; n = 0 | `|det| ≤ 1`; the zero form is a calibration; locally constant of modulus ≤ 1 | holds |
| 5.2 symplectic comparison (r9) | `Im⟪v,w⟫` vs `ω₀(Rv,Rw)`; n = 1, `(1,i)` | both `⟪Re v, Im w⟫ − ⟪Im v, Re w⟫`; 1 = 1 | holds |
| 5.3 circle of radius ρ (r9) | `ρe^(is)` | θ = s + π/2, `J grad θ = H_tr`, `ι_H ω = −dθ` | holds |
| 6.1 contraction sign (r9) | `V = Σa_j∂_(y_j)` on ℝⁿ | `β = −Σa_j dx_j`; `ι_V Im Ω = −★β` | holds |
| `secondVariation_volume_eq_hodgeEnergy` (r9) | m = 0 circle `a = ε sin2πx`; double cover `f = 2x`; `T²`, `V = a(x₁)∂_(y₂)`; N = ∅ | `2π²ε²` both sides; `π²ε²` both sides (`8π²ε²` with the wrong metric); `(dδ+δd)β = ι_(LV)ω`; both sides 0 | holds; sign and metric pinned |
| 6.5 second jet (r9) | `A = (a)`; `diag(1,−1)`; `[[0,1],[−1,0]]` | `a²`; gap 0; Gram `(1+t²)I`, `det = 1−t²`, `″ = 4 = |W′|²` | holds |
| 6.5 first variations of `F_t*ω`, `F_t*Im Ω_θ` (r9) | closed α, family F | `d/dt F_t*α|₀ = d(ι_V α|_N)`; `ι_V ω|_N = β`, `ι_V Im Ω_θ|_N = −★β` | holds |
| 6.5 acceleration independence (r9) | f minimal, N closed, acceleration a | `Vol″(0) = Q(V,V) + δVol(a) = Q(V,V)` since `δVol(a) = −∫⟨H, a⟩ = 0` | holds |
| 6.5 isometry `V ↦ ι_V ω` (r9) | Lagrangian plane P | `iP = P^⊥`; `|β| = |iV| = |V|` | holds |
| 6.5 kernel of L (r9) | flat `Tⁿ` | constant normal fields, `n = b₁(Tⁿ)` | holds |

## Not verifiable

- Munkres1966EDT, Chapter II, §10 (the 2.4 locator in the changed passage): the citation is waived, so the text was not read. GeometricTopology 11.3 and TangentialBordism B1.5 cite the same section (Theorems 10.5–10.6, p. 104), which is consistent with it.
- Lee2012ISM and HarveyLawson1982 are recorded uncertified. No locator from either is in the changed passages.
- The seeded sample (1.1, 1.3–1.6, 2.2, 2.3, 3.3, 4.1–4.3, 5.2, 5.4, 6.1, 6.2) lies outside the changed passages. The previous review verified each of these targets in its text, and nothing here re-reads them. The README flags no locator as unverified.
- Ownership against ComplexKahlerGeometry #1807, #1808 and #1854 was not checked file by file, because the brief gives no checkout for them. `overlaps.md` reports no dropped id from them. #1797 and #1791 (GeometricTopology) were read only through `roadmaps show`.
- The build does not establish the truth of the eleven admitted theorems. The table holds hand computations.

## Source issues

- none
