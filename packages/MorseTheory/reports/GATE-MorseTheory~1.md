# GATE-MorseTheory~1: answer to human review

The review was posted at 9b99d510. The branch head 350293f had already taken repair option 2 (new section M4.1). This round checked that repair and corrected it at ffdbaa67.

## H01 (roed-math) — applied differently

The finding is correct: Milnor, *Morse Theory*, Theorem 4.1 gives the two-disc proof only for nondegenerate critical points, and M4's categorical deformation gives no disc decomposition. The scope is kept to all smooth functions (option 2). M4.1 states `exists_twoEuclideanOpenCover_of_two_criticalPoints` (the descending gradient flow over a uniform time carries a chart ball at the minimum onto an open set that, together with a chart ball at the maximum, covers M), then `nonempty_homeomorph_sphere_of_two_euclidean_opens`, and composes them into `nonempty_homeomorph_sphere_of_two_criticalPoints`. That composite has no `IsMorse` hypothesis, and its Lean proof is just the composition. The acceptance paragraph (README ≈ line 680) now separates the Morse route (M1/M2 discs) from the degenerate route (M4.1).

The repair at 350293f was wrong in one place, corrected here. Its step "consume GT Layer 2's … Brown generalized Schoenflies construction" cited a section that is not on main. GeometricTopology Layer 2 on main (`TauCetiRoadmap/GeometricTopology/README.md` lines 289–356) has local flatness, Brown's 1962 collaring theorem and the annulus theorem, but no generalized Schoenflies theorem. `brownGeneralizedSchoenflies` exists only in a pull request revising GeometricTopology, and the merge rules forbid using a revision as a supplier. So M4.1 now owns Brown's bicollared generalized Schoenflies theorem itself (Brown 1960, Theorem 5, p. 76; route through Theorems 0–4). It also adds Jordan–Brouwer separation from Mayer–Vietoris (AlgebraicTopology Stage 3). The bicollar comes straight from radial coordinates on a thin annulus in U∩V, so neither local flatness nor collaring is an input. The Scope paragraph records this ownership. The Milnor 1959 locator is now "Theorem 1(3) and Corollary 1, p. 442": Corollary 1 is the homeomorphism conclusion, while Theorem 1 itself is about diffeomorphism after connected sum.

## Further repairs

The same pattern (citations to content not on main, or to pull requests) appeared elsewhere. These lines were also needed for the gate to pass:

- Lines 66 and 482: links to an AlgebraicTopology commit not on main → `../AlgebraicTopology/README.md#stage-6-cohomology-products-and-manifold-duality`. On main, Stage 6 "Categorical covers and Lusternik–Schnirelmann bounds" (line 1080 ff.) has `LSCategoricalCover`, `lsCategoryCount`, `normalizedLSCategory` and `lsCupLength`.
- Lines 241 and 660: commit-pinned DifferentialGeometry and ComplexKahlerGeometry links → relative links to the same sections on main (Layer 5 and K7 both exist there).
- Line 77: "HomotopySpheres §4B" linked to a pull request → plain "HomotopySpheres §4B" (§4B exists in that roadmap's open head). Line 662 "K1/#279" → "K1". Line 721 "Riemannian/PR284" → "RiemannianGeometry and HomotopySpheres".
- `Suggested.lean`: seven `Mathlib.*` submodule imports → a single `import Mathlib` plus the three TauCeti modules.
- `Suggested.lean`: the `scalarRegularLevelChartedSpace` def had a `sorry` body (sorry'd data). It is removed, together with its three law theorems. `exists_scalarRegularLevelData` remains, with the same statement, now proved by `sorry`. README line 160 no longer backticks the def.

## Build and gate

- `lake build TauCetiRoadmap.MorseTheory.Suggested`: **Build completed successfully (8995 jobs)**. The only warnings are "declaration uses `sorry`".
- Signatures: I appended `#check @name` for every declaration to the file, built once, and compared each elaborated type with the README. Every binder needed (e.g. `[CompactSpace M] [ConnectedSpace M] [SecondCountableTopology M]`, `0 < Module.finrank ℝ E`, `[T2Space X] [CompactSpace X]`) is present in the declaration's own type. Nothing changed as a result, and the `#check` lines were removed before the commit.
- Gate: `gate MorseTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`.
  - Before this round it reported blob=4, prnum=1, sorry-data=1, imports=1, mathlib-subimports=7, no-import-mathlib=1 and depcheck=1.
  - The one remaining failure is `depcheck: NOT IN ORDER: MorseTheory (insert it after its last supplier)`. MorseTheory is on main but absent from ORDER.txt; this is not an upward edge, and I did not edit the order file.
- Depcheck (`--movable`): `NOT IN ORDER: MorseTheory (insert it after its last supplier)` / `depcheck: 148 roadmaps, 1006 edges, 1 problem(s)`. There is no UPWARD or CYCLE line.
- Commit: ffdbaa67 (not pushed).

## Ownership

I searched by object ("generalized Schoenflies", "bicollared") on main and in the open heads.

- Main has no owner, so MorseTheory owns Brown's theorem.
- A pull request revising GeometricTopology proposes `brownGeneralizedSchoenflies`. That PR revises an existing roadmap, so it cannot be cited as a supplier.
- Our declarations live in the `TauCetiRoadmap.MorseTheory` namespace and no new Lean declaration was added for Brown's theorem (it is README prose), so no fully qualified name collides.
- No notion moved down from a later roadmap.

## Sources

- Milnor 1959, *Sommes de variétés différentiables…*: read from Numdam, the open repository. Theorem 1 is at text lines 72–76, the proof of (3)⇒(1) at lines 94–116, Corollary 1 at line 117 (p. 442).
- Brown 1960, Bull. AMS 66: read from the AMS open archive PDF, fetched with `--licence-class publisher-open` after checking that the archive is free to read. Theorems 0–4 are at lines 25–100; Theorem 5 is at lines 101–113 (p. 76).
- Rosen 1960 (a Notices abstract) could not be read and is cited by locator only; no statement depends on it alone.
- Milnor, *Morse Theory*, Theorem 4.1 and Remark 1 are cited from the reviewer's locator. I did not fetch the course-page copy because its licence status is unclear.
- The job may not edit `sources.toml`, so the two fetched works are not recorded there. No text is missing, and no `needs-references.toml` was left.

## Adversarial pass (changed or added statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `nonempty_homeomorph_sphere_of_two_criticalPoints` | f = h − h³/3 on S^m | df = (1−h²)dh, so the critical points are the two poles; near the north pole f ≈ 2/3 − \|y\|⁴/4, so the Hessian is 0 | the theorem applies and the conclusion holds; M1 does not apply | none |
| same | f constant, M nonempty, m>0 | critical count = ∞ ≠ 2 | vacuous; the hypothesis excludes it | none |
| same | M disconnected with two components | each component needs ≥2 critical points (min ≠ max, or else constant with ∞ many), so count ≥ 4 | count = 2 forces M connected; `ConnectedSpace` is a harmless extra hypothesis (P3) | none |
| same | m = 0 | `hdim` excludes it; f on 2 points has 2 critical points, and two points ≃ S^0 holds anyway | consistent | none |
| `exists_twoEuclideanOpenCover…` | uniform time | the band [a+ε, b−δ] is compact and critical-free, so ‖grad f‖ ≥ η > 0; T > (b−δ−a−ε)/η² gives f(Φ_T x) < a+ε for x ∈ K, and {f ≤ a+ε} is forward-invariant | U = Φ_{−T}(B) ⊇ K, so U ∪ V = M | none |
| `nonempty_homeomorph_sphere_of_two_euclidean_opens` | m = 0, X a single point | U = V = X ≃ Fin 0 → ℝ, but S^0 has 2 points | false at m = 0; `hm : 0 < m` is needed and present | none |
| same | m = 1 | U∩V = ∅ would make X two disjoint open intervals, which is not compact, so X is a connected compact 1-manifold ≃ S^1 | holds | none |
| same | U = X | then X ≃ ℝ^m is compact, impossible for m > 0 | vacuous | none |
| same, proof step "C ⊂ V" | | X∖V ⊂ int D gives X∖int D ⊂ V; S^m∖Σ = (X∖D) ⊔ ((int D∩V) ∪ {∞}), the second part open since its complement C is compact in V | holds | the side identification is now written out |
| Brown, Theorem 5 | Alexander horned sphere | it has no bicollar, so the hypothesis fails; with only an embedded sphere the theorem fails | the bicollar hypothesis is necessary | stated in M4.1 |
| Jordan–Brouwer via Mayer–Vietoris | m ≥ 2: A = S^m∖Σ, B = open collar, A∩B ≃ S^(m−1) ⊔ S^(m−1) | H₁(S^m) = 0, so H̃₀(A) ≅ H̃₀(A∩B) = ℤ | two components | added |
| same | m = 1 | H̃₀(A∩B) = ℤ³, H̃₀(B) = ℤ, H₁(S¹) = ℤ, H₁(A) = 0, so rank H̃₀(A) = 3 − 1 − 1 = 1 | two components | none |
| `exists_scalarRegularLevelData` (now the only form) | empty level; m = 1 | the empty type with the empty atlas satisfies all three clauses; for m = 1 the level is discrete with model Fin 0 → ℝ and tangent range 0 = ker of a surjection ℝ → ℝ | holds | the sorry'd def is removed |
| `onePointEquivSphereOfFinrankEq`, `Homeomorph.onePointCongr` | checked at the pin | Mathlib `Topology/Compactification/OnePoint/Sphere.lean:34`, which needs `finrank V + 1 = card ι`; `OnePoint/Basic.lean:629` | they exist with the hypotheses used | none |

No passage in the review asked for anything outside the job.
