# GATE-GeometricTopology~2: answers to the review of 8f2bcb3

Repairs are in commit `585080ba` on top of `8f2bcb3`. Only `TauCetiRoadmap/GeometricTopology/README.md` and `TauCetiRoadmap/GeometricTopology/Suggested.lean` changed. H01–H22 are F01–F22 of the review by CBirkbeck, in order.

## H01 (CBirkbeck) — applied differently
The proofs of the end theorems that main's base left as statements now belong to "GeometricTopology, Part II". These are Cerf's theorem, Hatcher's Smale conjecture, Mostow rigidity and its volume and isometry consequences, the Gordon–Luecke theorem and its `S³`-filling corollary, and the JSJ theorem. The base keeps their statements and carriers. The changes are in README *Scope and ownership* (Layers 3, 7 and 8, plus a Part II bullet saying where the base stops), §3.4, §5.3, §7.2, §7.3, §8.1, §8.5, the Layer 7 and Layer 8 introductions, and the `Suggested.lean` docstring ("Prove …" → "State …; the proof is GeometricTopology, Part II's"). Two things were not done because this job may edit only these two files: creating the `GeometricTopologyPartII` folder, and restoring main's README. That is a human decision. The classical foundations (Alexander's theorem, Dehn's lemma, the loop and sphere theorems, Kneser–Milnor) stay proved in the base, because the base's own Layer 8.2 uses them.

## H02 (CBirkbeck) — disputed
All seven names exist at the pinned Tau Ceti `358314d4` (the `lake-manifest.json` rev; the review searched `a91d3aaf`):
- `TauCeti.exists_isOpenEmbedding_normalTubeOfRadius`: `Geometry/Manifold/TubularNeighborhood/Noncompact.lean:48`
- `TauCeti.normalFiberBundle`: `TubularNeighborhood/VectorBundle.lean:181`
- `TauCeti.normalVectorBundle`: `VectorBundle.lean:217`
- `TauCeti.normalContMDiffVectorBundle`: `VectorBundle.lean:238`
- `TauCeti.knotExterior`: `LowDimTopology/SolidTorusNeighborhood/Exterior.lean:33`
- `TauCeti.KnotTheory.homflySpecialization`: `KnotTheory/Homfly/Specialization.lean:47`
- `TauCeti.IsPLOn.isPiecewiseAffineOn_of_isCompact`: `Topology/PL/Compact.lean:38`

Each file opens `namespace TauCeti` or `namespace TauCeti.KnotTheory`.

## H03 (CBirkbeck) — applied
§3.2 was "for compact `P` and `M` it is a homeomorphism onto the subspace …". It now says `ofSmoothFamily` is a bijection onto the continuous maps whose adjoint is smooth, and explicitly makes no claim that the inverse is continuous. The review's family `F_k(θ, z) = exp(i sin(kθ)/k) z` is added as a Check: it converges in `C(S¹, Diff(S¹))`, but `|∂_θ F_k(0, z)| = 1` for every `k`. Injectivity of the reference inclusion is now cited as the pinned `TauCeti.orthogonalToDiffSphere_injective` (`Geometry/Diffeomorphism/Sphere.lean:299`).

## H04 (CBirkbeck) — applied
In §10.2 the corollary now reads: a closed connected orientable 3-manifold with a taut transversely oriented foliation, not finitely covered by `S² × S¹`, is aspherical with universal cover `ℝ³`. The route is Novikov–Rosenberg, an essential closed transversal, and Palmeira (Ann. of Math. 108, 1978). The `S² × S¹` Check now also refutes the old corollary: `π₁ = ℤ` is infinite, but the universal cover is `S² × ℝ` with `π₂ = ℤ`.

## H05 (CBirkbeck) — applied
In the §11.3 Check, "The suspension … is a triangulated manifold" is replaced by two facts:
- `ΣP` is not a manifold: a punctured neighbourhood of a cone point has `π₁` the binary icosahedral group (order 120), while a punctured ball in `ℝ⁴` is simply connected.
- `Σ²P ≅ S⁵` has a non-combinatorial triangulation, because the link of a cone point is `ΣP` (`manolescu-triangulation-lectures` line 127–133, Example 2.2).

The claim "triangulable does not imply PL" now uses `E8 × S¹`, a closed 5-manifold that is triangulable but not PL (`manolescu-triangulation-lectures` line 261–273, the diagram closing §2). The Layer 11 Examples and References were updated to match.

## H06 (CBirkbeck) — applied
§11.1 was "the realized link of a face is the boundary of a conical neighbourhood of its barycentre". It now says: the closed star of `σ` is `σ ∗ Lk(σ)`, and the boundary of a conical neighbourhood of the barycentre is `∂σ ∗ Lk(σ)`, with `∅ ∗ X = X`. A new Check covers a single edge: `Lk(e) = ∅`, the boundary is `∂e ∗ ∅ = S⁰`, which is two points.

## H07 (CBirkbeck) — applied
§4.8 now states `span V_L = c(L) + s − 1` for an alternating split union of `s` non-split links, and `= c(L)` when `L` is non-split. Unlink Checks: `1 = 0 + 2 − 1` and `2 = 0 + 3 − 1`. The adversarial pass found two more defects in the same paragraph, both fixed:
- **Strict inequality.** `span V < c(D)` now needs a prime diagram. Counterexample: two trefoil diagrams banded with opposite checkerboard types give a reduced, non-alternating 6-crossing diagram of the granny knot, with span 6.
- **Turaev genus.** "`g_T(D) = 0` iff `D` alternating" is now "iff `D` is a diagram connected sum of alternating diagrams", since `s_A(D₁ # D₂) = s_A(D₁) + s_A(D₂) − 1`.

## H08 (CBirkbeck) — applied
§6.2 now writes `σ` for the raw signature and `σ̄` for the averaged one, and defines `S¹_!` (`conway-signature` line 238–240). The raw slice-genus bound is stated for `ω ∈ S¹_!` (`conway-signature` line 282–284, Theorem 2.12). The averaged bound holds for every `ω ≠ 1`, by Powell (`conway-signature` line 296–298). Off the roots of `Δ_K` the raw bound follows. `−1 ∈ S¹_!` because `p(−1) ≡ p(1) mod 2`. New Check: the Cha–Livingston slice knots with `σ(K, ω) ≠ 0` (`conway-signature` line 244–245) break the raw bound, while the averaged bound gives `0 ≤ 0`.

## H09 (CBirkbeck) — applied
§8.4 now states the vertical-or-horizontal theorem for essential surfaces in a compact connected irreducible Seifert fibred space (`hatcher-3m` line 641–651 and 707–709). The citation was corrected from "Proposition 1.11" to Proposition 1.12, which is its number in the current notes. Checks added: a ball-boundary sphere in `T³` has `χ = 2` and is not essential; a coordinate torus is essential and vertical.

## H10 (CBirkbeck) — applied
The infinite-`π₁` restriction is dropped. A compact connected Seifert fibred space is irreducible unless it is `S¹ × S²`, `S¹ ×̃ S²` or `ℝP³ # ℝP³` (`hatcher-3m` line 811–812; Proposition 1.13, not 1.12). Added a Check: `ℝP³ # ℝP³`, with group `C₂ ∗ C₂`.

## H11 (CBirkbeck) — applied
The Seifert invariants now include the genus and orientability of the base, the boundary count, the fibre orientation character, the normalized exceptional pairs up to permutation, and the Euler obstruction (Scott §3). For orientable total spaces they reduce to Hatcher's `M(±g, b; …)`. The uniqueness clause now cites the exception list of `hatcher-3m` line 1260–1266 (Theorem 2.3), replacing "Proposition 1.13 and Lemma 1.14". New Check: `T³ → T²` versus `K × S¹ → T²`.

## H12 (CBirkbeck) — applied
§8.2 now states both of Kneser's finiteness theorems with the source's hypotheses:
- **Spheres:** a system with no complementary punctured 3-sphere, so no two members are parallel. This is the "Basic Fact" in the proof of Theorem 1.5 (`hatcher-3m` line 233–236). The old citation to Proposition 1.7 / Corollary 1.8 did not contain this statement.
- **Surfaces:** closed connected two-sided surfaces, incompressible in Hatcher's sense with no spheres, and with no product complementary piece (`hatcher-3m` line 440–448 and 522–525).

Checks added: the `N` parallel fibres of `S² × S¹`, and the small spheres in `T³`.

## H13 (CBirkbeck) — applied
§4.7 now handles modulus `n`:
- the colouring count is `n · ∏ gcd(n, d_i)`, where the `d_i` are the invariant factors of the reduced colouring matrix;
- a non-constant colouring exists iff `gcd(n, det K) > 1`;
- `p · p^r` is kept for prime `p`;
- `n = 1` gives one colouring, and `n = 0` gives only constants.

New Check: the trefoil has 18 six-colourings, including `(0, 2, 4)`, and 1 colouring mod 1.

## H14 (CBirkbeck) — applied
In §5.4 the cyclic surgery conclusion is now "distance at most one, exactly one for distinct slopes". Moser's criterion now requires coprime `|r|, |s| ≥ 2` and a primitive slope; the unknot case `L(p, q)` is stated separately. Checks added: the figure-eight meridian taken twice (distance 0), and `T(1, 2)` with `5`-surgery `L(5, 1)` while `|5 − 2| = 3`.

## H15 (CBirkbeck) — applied
§3.1 now states continuity and injectivity of `Diff(M) → C(M, M)` for every compact `M`, and non-embedding only for nonempty `M` of positive dimension. The `S⁰` Check now records that the map is an embedding of discrete spaces (2 points into 4).

## H16 (CBirkbeck) — applied
§1.3 was "it is a closed manifold". It now says the double is boundaryless, and closed exactly when `M` is compact. The Check now contrasts the doubles of `[0, ∞)` (which is `ℝ`) and `[0, 1]` (which is `S¹`).

## H17 (CBirkbeck) — applied
§1.4 now gives the construction for `n ≥ 1`, connectedness for `n ≥ 2`, and the `n = 1` cases explicitly: `ℝ # ℝ` is two lines, `ℝ # S¹` one line, `S¹ # S¹` one circle. The Euler formula is now restricted to compact summands. Checks: `ℝ # ℝ`, and the surface of infinite genus.

## H18 (CBirkbeck) — applied
§7.3 now says cusp cross-sections are flat tori or Klein bottles, and tori when the manifold is orientable. It notes that `TauCeti.IsFiniteVolumeHyperbolic` assumes neither orientability nor connectedness. Positivity of volume now requires nonempty. Checks: the Gieseking manifold (Klein-bottle cusp, volume `v₃`), and the empty manifold.

## H19 (CBirkbeck) — applied
§9.2 was "`g(M) = 1` iff `M` is a lens space or `S¹ × S²`". It now says `L(p, q)` with `p ≥ 2`, or `S¹ × S²`. New Check: `L(1, q) ≅ S³` has genus 0.

## H20 (CBirkbeck) — applied
The duplicate targets in §3.1 are deleted and the pinned declarations cited instead:
- `Diffeomorph.continuous_trans` and `Diffeomorph.continuousMul` (`Geometry/Diffeomorphism/Composition.lean:57,67`)
- `Diffeomorph.continuous_symm` and `Diffeomorph.isTopologicalGroup` (`Inversion.lean:215,241`)
- `Diffeomorph.continuousEval_weakWhitney` (`Evaluation.lean:37`)
- `Diffeomorph.isClosed_fixingSubgroup` (`FixingSubgroup/Topology.lean:41`)

These pinned theorems assume compact, `T2` and a locally compact model. Also in this repair:
- §8.4 now consumes `TauCeti.IsSeifertFibration.nonempty_homeomorph_circle` (`LowDimTopology/SeifertFibration.lean:218`) for the circle-fibre claim.
- §2.1 consumes `TauCeti.SmoothEmbedding.isLocallyFlat` (`LocallyFlat/Smooth.lean:233`) rather than listing it as a new target.

## H21 (CBirkbeck) — answered
The finding is correct. `LeeFrobenius.lean`, `FiniteVolumeExtension.lean` and the other companion files are added by this pull request, but neither `README.md` nor `Suggested.lean` references them. Their admitted targets (the Lee deformation, finite-volume Mostow–Prasad) are assigned to Part II by the README. Removing them is outside the two files this repair may edit, so a human or the worker must delete them from the branch.

## H22 (CBirkbeck) — answered
The finding is correct for the same reason as H21. The companion `.lean` files and `STATUS.md`/`PROGRESS.md` follow none of the `Suggested.lean` form rules; for example, `SimplicialLinks.lean` contains `#print axioms` and `LeeFrobenius.lean` imports Mathlib submodules. They are outside this job's edit scope. The gate passed with them present only because it checks `Suggested.lean`. Deleting the 25 companions is the repair. Nothing in the README depends on them.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Double is closed iff `M` compact (§1.3) | `[0,∞)`, `[0,1]` | doubles `ℝ` (noncompact), `S¹` (compact) | holds | added |
| `M # N` connected for `n ≥ 2` (§1.4) | `ℝ#ℝ`, `ℝ#S¹`, `S¹#S¹`, `S²#S²` | 2, 1, 1, 1 components | holds for `n ≥ 2`; `n = 1` listed | added |
| `χ(M#N)` formula, compact (§1.4) | `T²#T²`, `S¹#S¹` | `−2 = 0+0−2`; `0 = 0+0−0` | holds | restricted |
| Forgetful map is not an embedding, `dim > 0` (§3.1) | `S⁰`; `S¹` with `θ + k⁻²sin kθ` | `S⁰`: 2 → 4 discrete, embedding; `S¹`: `C⁰` error `k⁻²`, `f''` sup 1 | holds | restricted |
| `ofSmoothFamily` bijective onto smooth adjoints (§3.2) | `F_k = e^{i sin(kθ)/k} z` | angle `≤ 1/k`; `‖∂_θ F_k(0,z)‖ = 1` | no inverse continuity claimed | changed |
| Fox count `n ∏ gcd(n, d_i)` (§4.7) | trefoil, `d = (1,3)`, `n = 1, 3, 6`; figure-eight `(1,1,5)`, `n = 5`; `5₂`, `n = 7` | 1, 9, 18; 25; 49; `(0,2,4)` satisfies `2a ≡ b+c` mod 6 at all 3 crossings | holds | changed |
| `span V = c + s − 1`, alternating (§4.8) | 2- and 3-unlink; trefoil | spans 1, 2; `c = 0`; trefoil `3 = 3` | holds | changed |
| `span V < c(D)` for prime non-alternating `D` | granny via a non-alternating band diagram | `span = 6 = c(D)` | needs prime | added hypothesis and Check |
| `g_T(D) = 0` iff connected sum of alternating diagrams | same granny diagram | `s_A + s_B = (3+2)+(3+2)−2 = 8 = c+2`, so `g_T = 0` | old iff false; fixed | changed |
| Raw signature bound on `S¹_!` (§6.2) | `ω = −1`; Cha–Livingston knots at a Knotennullstelle | `p(−1) ≡ p(1)` odd, so `−1 ∈ S¹_!`; raw `≠ 0` vs `g_s = 0` | holds on `S¹_!` only | changed |
| Averaged bound, all `ω ≠ 1` | trefoil at `e^{iπ/3}` | one-sided 0 and −2, `σ̄ = −1`, `|−1| ≤ 2·1` | holds | added |
| CGLS: distance ≤ 1 (§5.4) | figure-eight meridian twice; unknot `∞`, `±1` | 0; 1 (unknot excluded: Seifert fibred) | holds | changed |
| Moser: `|p − qrs| = 1`, `|r|,|s| ≥ 2` | `T(2,3)` at `5, 7, 6`; `T(1,2)` at 5 | 1, 1, 0 (`6` reducible); `T(1,2)`: 3 but `L(5,1)` | holds with hypothesis | changed |
| Cusp cross-sections are tori or Klein bottles (§7.3) | figure-eight; Gieseking; ∅ | torus; Klein bottle, vol `v₃`; vol 0 | holds; positivity needs nonempty | changed |
| Kneser sphere bound (§8.2) | `S²×S¹` with `N` fibres | pieces `S²×I` punctured spheres, so `(∗)` fails | excluded by `(∗)` | changed |
| Kneser surface bound | small spheres in `T³` | `π₁`-injective but spheres | excluded by "no spheres" | changed |
| Vertical/horizontal for essential surfaces (§8.4) | ball sphere in `T³`; coordinate torus | `χ = 2` vs 0 for vertical/horizontal; torus `χ = 0`, vertical | holds | changed |
| SF irreducibility exceptions | `ℝP³#ℝP³`; `T³` | reducible, `π₁ = C₂∗C₂`; irreducible | holds with 3 exceptions | changed |
| Seifert invariants include fibre character | `T³→T²`, `K×S¹→T²` | same `g = 1`, `b = 0`, `k = 0`; orientability differs | separated only by fibre character | changed |
| `g = 1` iff `L(p,q)`, `p ≥ 2`, or `S¹×S²` (§9.2) | `L(1,q)`, `L(2,1)`, `S¹×S²` | genus 0, 1, 1 | holds | changed |
| Taut ⇒ aspherical with exclusion (§10.2) | `S²×S¹`; a genus-2 mapping torus | `π₁ = ℤ`, `π₂ = ℤ`, so not aspherical (excluded); mapping torus has universal cover `ℝ³` | holds with exclusion | changed |
| Boundary of a conical neighbourhood is `∂σ ∗ Lk σ` (§11.1) | vertex of a triangle boundary; edge alone | `∅ ∗ S⁰ = S⁰`; `S⁰ ∗ ∅ = S⁰` (2 points) | holds | changed |
| `ΣP` not a manifold; `Σ²P` non-combinatorial (§11.3) | punctured cone neighbourhood | `π₁ = 2I` of order 120 vs 1 | holds | changed |
| Triangulable ⇏ PL | `E8 × S¹`, `dim = 5` | Manolescu diagram, line 268 | holds | changed |

## Other checks
- **Signatures.** No Lean declaration signature changed; only the module docstring of `Suggested.lean` was edited. The `#check` scratch elaboration was not run separately, since the brief allows only the targeted build, and the worker's signature dump had failed on a missing olean. The targeted build elaborates all 14 statements unchanged.
- **Ownership.** No new construction was added; Part II is this roadmap's own extension. Ownership against open pull requests was checked only for "GeometricTopology": `roadmaps list` shows no `GeometricTopologyPartII` folder in any open pull request.
- **Sources.** Read through the sources service:
  - `conway-signature` (arXiv 1903.04477)
  - `hatcher-3m` (author page, `3Mfds.pdf`; the README URL `3M.pdf` was corrected)
  - `manolescu-triangulation-lectures` (arXiv 1607.08163)

  `sources.toml` is not among the files this job may edit, so these keys are not recorded in the folder. A fetch of Armond–Lowrance failed for a transient network reason (arXiv returned HTTP 429). No locator for that paper was added or changed, and nothing was written to `needs-references.toml`.
- **Untrusted text.** Nothing in the review text was suspicious.

## Build
`lake build TauCetiRoadmap.GeometricTopology.Suggested`: `Build completed successfully (9153 jobs).` The only warnings are 14 `declaration uses 'sorry'`.

## Gate
`gate GeometricTopology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Dependency check
`depcheck: 208 roadmaps, 1455 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
