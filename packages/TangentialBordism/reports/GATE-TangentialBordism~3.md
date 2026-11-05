# GATE-TangentialBordism~3: answers to the review of 29 October (head 67b1819 → a33b21c)

Line numbers "old" refer to `67b1819`, "new" to `a33b21c`, both in `TauCetiRoadmap/TangentialBordism/README.md` unless stated.

## H01 (rwst) — applied

B1.6 now owns only what no main roadmap states: free proper quotients, neat Euclidean embeddings, parametric/relative transversality with relative Whitney approximation, corner rounding, and compact neighbourhoods and doubles (new :211–279). The orientation carrier, chart signs, faces and manifold Sard are consumed from a new DifferentialGeometry row (2.1, 2.2, 5.5, 10.2; new :32). Collars, gluing, handles, tubular neighbourhoods, `|K|` and Whitehead's triangulation are consumed from a restored GeometricTopology row (Layer1, Layer11, far-horizon item1; new :33). Checked on main `c994070`: DifferentialGeometry :345–357, :528–533, :884–885 and :1024–1031; GeometricTopology :202–222, :868–882 and :938–942. Consumers were repointed: B1.5 mapping tori and triangulation (new :195, :200–204), B3.1 CW model (new :440–442), B3.2(c) handles (new :458) and B5.1 normal bundle (new :919–920).

## H02 (rwst) — applied

B1.1 old :114 "B1.6's single manifold-orientation carrier" → "DifferentialGeometry 2.1's `Manifold.Orientation` as the single manifold-orientation carrier" (new :120–123). Old :160 → "DifferentialGeometry 2.1's carrier is the only manifold-orientation carrier used" (new :168–170). The boundaryless atlas equivalence now consumes DG 2.2's oriented-atlas criterion. The half-space/corner case in dimension ≥2 stays owned here, because DG 2.2 states only the boundaryless case (DG :354–356). In dimension 0, DG 2.1's quotient of (model orientation, chart sign) pairs by the diagonal flip has 2·2/2 = 2 classes per point, so B1.1's σ comparison is compatible with that carrier.

## H03 (rwst) — applied

Whitehead's theorem is no longer an item of this roadmap. B1.5 and B3.1 now cite it as item1 of GeometricTopology's smoothing-and-triangulation comparison (new :200–203, :440–442), so this roadmap's dependency on that far-horizon item is now visible in its *Needs*. B1.5 keeps only the relative refinement that makes a collared boundary a subcomplex.

## H04 (rwst) — applied differently

Free proper quotients stay in B1.6 (new :222–228, now with Lee Theorems 21.10 and 21.13), rather than being consumed from SmoothBundlesConnections B1.4. That roadmap is an open new-roadmap pull request by the same author as this one, and in the merge order it comes after TangentialBordism (ORDER.txt line 199 against 189), so it is not a permitted supplier here. The reviewer's own repair also keeps the item here and reconciles with SmoothBundlesConnections at merge time. CharacteristicClasses C1.3 on main, which this roadmap consumes for E_m→B_m, already uses SmoothBundlesConnections B1.4 internally, so the two statements must agree when SmoothBundlesConnections merges.

## H05 (rwst) — applied

The counterexample is correct. In K(ℤ/p,1)→P→K(ℤ/p,2), reading B4.2's 2-primary conclusion at p would make βι₂ (degree 3) polynomial, with (βι₂)² ≠ 0 in degree 6, and would miss βP¹βι₂ in degree 2p+2 (= 8 at p = 3). B4.7 old :865–866 "Kudo and Borel theorems proved at p" → new :835–860. These lines state Kudo's transgression theorem d_r(y^(p−1)⊗z) = −βP^k z with r = 2k(p−1)+1 and the transpotence in degree 2kp+2. They state Borel's odd-prime theorem H*(B) = F_p[τx_i]⊗Λ(τy_j)⊗F_p[βP^(k_j)τy_j], derive Cartan's computation from it, and add the counterexample and the p = 3 degrees (7 and 8) as Checks. The source is McCleary, Chapter 6, added to References. The sign of the transpotence differential is taken from that source and is not fixed by a computed witness here; it does not affect which classes are generators.

## H06 (rwst) — disputed

Blob links and pull-request numbers for other roadmaps are refused by the house rules: cross-roadmap citations name the roadmap and section, never a pull request. The gate counts both (`blob=0 prnum=0` is required), so the four suppliers stay cited by name and section. The underlying concern is real. IndexTheory (I7.2, I7.5), PseudodifferentialOperators and FourManifolds (F7.0) are not on main, and FourManifolds sits after this roadmap in the merge order (ORDER.txt 190 against 189) while B3.3/B3.4 consume its F7.0. The depcheck does not see these unlinked names. Sequencing them is therefore a decision for the merge, recorded below under "Open for the human decision".

## H07 (rwst) — answered

The README has no merge-order block. "No other open PR must merge first" is in the pull-request description, which this job cannot edit, and the worker should correct it. The lane-level order the reviewer asks for is already in the supplier table. FourManifolds: "these examples precede bordism consequences; later Four Wu/Rokhlin applications consume B3/B4" (new :40). StringOrientation: "only this early obstruction/lift lane precedes B3.8" (new :42). IndexTheory and PseudodifferentialOperators do not cite this roadmap, so they can merge first without a cycle, as the reviewer says.

## H08 (rwst) — applied

B6.4 no longer owns the smoothing theorem (old :1325–1342). It consumes CharacteristicClasses C1.4 (main :504–510), whose relative homotopy version it applies rel a neighbourhood of a closed union of faces, and on M×I for uniqueness (new :1318–1327). C1.4 was added to the CharacteristicClasses supplier row (new :36). The supplier contract assumes that C1.4's "smooth bases" include compact manifolds with corners. If CharacteristicClasses states it only for boundaryless bases, that is the one gap left.

## H09 (rwst) — applied

"C2.3" → "C1.3" in B6.5 (new :1362) and in the supplier row (new :36). B6.4's occurrence (old :1332) was removed with H08. CharacteristicClasses C2.3 on main is the zero locus of a transverse section (:657); C1.3 is the finite faithful unitary representation with E_m→B_m (:486–503).

## H10 (rwst) — applied

B5.1 old :924 "pullback isomorphism ν_M≃γ_k" → "lift ℓ:M→B_k and pullback isomorphism ν_M≃ℓ*ξ_k, where ξ_k is the pullback of the designated universal γ_k along B_k→BO(k)" (new :916–917). The same defect was at old :936, "bundle map ν_M→γ_k covering the lift M→B_k", now "ν_M→ξ_k covering ℓ" (new :930): a bundle map covering a map into B_k must land in a bundle over B_k.

## H11 (rwst) — applied

The Mathlib proposal is cited again as [mathlib4#31350](https://github.com/leanprover-community/mathlib4/pull/31350) at new :19–21, in the form main roadmaps use for Mathlib pull requests. It is checked as "feat: (unoriented) bordism groups", still open.

## H12 (rwst) — applied

Added to References (new :1631–1646): Milnor, *On the cobordism ring Ω\* and a complex analogue, Part I* (Amer. J. Math. 82, 1960); Atiyah–Bott–Shapiro, *Clifford modules* (Topology 3, Suppl. 1, 1964); Anderson–Brown–Peterson, *The structure of the Spin cobordism ring* (Ann. of Math. 86, 1967). Hirsch and Munkres were removed because their claims now live in GeometricTopology. No source text was fetched for these entries, and `sources.toml` was not edited (outside this job's files).

## H13 (rwst) — applied

Old :70 "requires an oriented manifold target" → a smooth manifold target without boundary: any target for O, an oriented one for SO, a Spin one for Spin (new :71–75). B2.4's construction was changed the same way (new :326–333), and the Spin case was corrected as well. A new Check: [RP¹]·[RP¹] = [pt] ≠ 0 in ΩO₀(RP²) = F₂ (two lines meet in one point, 1+1−2 = 0), on a non-orientable target.

## H14 (rwst) — applied

The `Suggested.lean` module docstring is now "Tangential bordism: target signatures". It says the README is the roadmap and this file is not. It names the one statable headline (`finiteQuadraticArf_eq_of_symplecticBasis`) and the carriers kept. It lists the headlines that are not statable and what each lacks: bordism quotient groups, Thom spectra, Steenrod operations, `KO` and the compact Albert algebra (none at the pins; `compactAlbert` and `DivisionOctonionReal` occur nowhere in pinned Tau Ceti).

## H15 (rwst) — applied

B6.5 old :1360 "modulo the central circle of scalars" → "modulo the circle of scalars, which is normal but not central (conjugating the scalar λ by v↦v̄ gives λ̄)" (new :1347–1350). Computed: (c∘λ∘c)(v) = conj(λ·v̄) = λ̄v.

## H16 (rwst) — answered

The pull-request description is outside this job's files. The three stale sentences ("eleven inspected immutable public supplier editions", "byte-identical", "No open pull request … must merge before this one") are for the worker to rewrite.

## H17 (rwst) — answered

HomotopySpheres consuming B3.2(b)/(c) and B5.2 is a repair in that roadmap. Here, B3.2(b)/(c) and B5.2/B5.5 remain the single owners, as stated at new :92–99 and :1567.

## H18 (rwst) — answered

B6.5 owns PU(3)⋊C₂ because PositiveScalarCurvature on main consumes this roadmap's transfers (PSC :38, :44, :158–163). Consuming PSC's construction here would close a cycle, so ownership moved down to this roadmap. PSC's switch to consuming B6.5 and B3.9 is a repair in that roadmap.

## H19 (rwst) — answered

A(1) and its Q₀ Margolis split-injection criterion are owned here (new :92–97), while finite sub-Hopf algebras beyond A(1) and general Margolis theory stay BordismFormalGroups' (main :1003–1006). BordismFormalGroups consumes this roadmap's Steenrod/Adams carriers, so the boundary runs in the supply direction. The carve-out is a repair in BordismFormalGroups.

## H20 (rwst) — answered

The GeometricTopology pull request is a revision of a roadmap on main, so it is not a supplier. This roadmap cites GeometricTopology as it is on main, where transversality and corner rounding are not stated (grep of main GT: no occurrence). If that revision adds them, whichever merges second reconciles with B1.6.

## Open for the human decision

- IndexTheory (I1/I2/I3/I5, I7.2, I7.5), PseudodifferentialOperators and FourManifolds (F7.0, F7.0b) are consumed but are same-author open pull requests that are neither on main nor earlier in the merge order. FourManifolds also cites this roadmap back (a lane-level cycle). The depcheck does not detect unlinked names, so it reports no problem.
- `TauCeti.DivisionOctonionReal` (new :43) occurs nowhere at the Tau Ceti pin. It is a LieHighestWeight supplier name and was not changed here.

## Adversarial pass on changed statements

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| Odd-p Borel, B4.7 | K(ℤ/p,1)→P→K(ℤ/p,2); p=3 | H³ = ⟨βι₂⟩, (βι₂)² = 0 since exterior; transpotence degree 2·1·3+2 = 8; P¹βι₂ degree 3+4 = 7 | 2-primary form false, odd form consistent | stated odd form, two Checks |
| Kudo transpotence | y = βx, k = 1 | r = 2(p−1)+1; total degree of y^(p−1)⊗z is 2k(p−1)+2k+1 = 2kp+1, so the target has degree 2kp+2 = 2p+2 | degrees agree | sign from McCleary, unwitnessed |
| Intersection product, B2.4 | RP² target, two lines | dim 1+1−2 = 0; count 1 mod 2 | O needs no orientation | Check added |
| Intersection, Spin case | ν = f*TN − TM | Spin on M, Q gives Spin on fibre product only if TN Spin | "oriented" was insufficient for Spin | Spin target required |
| PU(3)⋊C₂ scalar circle | λ = i | c∘i∘c = −i ≠ i | normal, not central | text fixed |
| (A,ε)(B,δ) | ε = c | A·conj(B·δ(v)) = A·B̄·c(δ(v)) | product law holds | none |
| ν_M ≅ ℓ*ξ_k | B_k = BO(k), ℓ = Gauss map | ξ_k = γ_k, so the old formula is the special case | general case needs ℓ* | fixed |
| Compact neighbourhood, B1.6 | K = ∅; M compact | any regular c; c > max f gives M with ∂ = ∅ | holds | none |
| Parametric transversality | M with boundary, S boundaryless | conclusion for F_s and ∂F_s needs F|∂M×S ⋔ Z | hypothesis added | fixed |
| DG 2.1 carrier at n = 0 | one point | 4 pairs / flip = 2 orientations | matches σ | none |

## Mechanical signature check

All 13 declarations of `Suggested.lean` were checked with `#check @name` lines appended temporarily, elaborated in one build and then removed. Every binder the README needs is present, for example `[FiniteDimensional (ZMod 2) V]` on `finiteQuadraticArf` and `finiteQuadraticArf_eq_of_symplecticBasis`. No declaration changed; only the module docstring did.

## Ownership against open pull requests

Checked against SmoothBundlesConnections (open, readable as a sibling checkout) for free proper quotients (H04). GeometricTopology and DifferentialGeometry revisions are not suppliers. Other open pull requests were not searched beyond `roadmaps resolve`, which reports no unresolved citation or Lean name.

## Build and gate

- `lake build TauCetiRoadmap.TangentialBordism.Suggested`: Build completed successfully (8980 jobs); one `declaration uses 'sorry'` warning (`finiteQuadraticArf_eq_of_symplecticBasis`).
- depcheck: `depcheck: 200 roadmaps, 1310 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).
- gate: `gate TangentialBordism: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Commit `a33b21c` (not pushed).
