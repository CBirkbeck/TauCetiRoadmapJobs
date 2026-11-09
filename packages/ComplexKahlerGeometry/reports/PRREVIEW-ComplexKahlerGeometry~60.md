# Review of ComplexKahlerGeometry (pull request #1808 at a96d197)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since c9403e2, the head the previous review read: `git diff c9403e2..a96d197 -- TauCetiRoadmap/ComplexKahlerGeometry` is empty (README 2534 lines, `Suggested.lean` 384 lines, byte-identical), the pull request's description and merge-order paragraph are unchanged, and the two commits since (a96d1971, dc47c7e0) touch only `TauCetiRoadmap/BordismFormalGroups/` and `TauCetiRoadmap/LocalPurity/`, neither of which this roadmap cites. Nothing the previous review asked for has been applied to this folder, so its six findings carry over unchanged (one P1, one P2, four P3), and one new finding arises from the sibling pull request #1807, whose copy of this same folder has since moved ahead of this one.

Mechanics at this head: the worker's gate is `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=2 source-material=0 build=0 FAIL` (the two outside-folder files are R04). Dependency check, re-run with the board order and `--movable`: `depcheck: 238 roadmaps, 2318 edges, 0 problem(s)`, no UPWARD, no CYCLE, no `moved:` line (this roadmap is not in the board's merge order; it is placed after its last supplier). `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean`: exit 0 in 6 s, 16 `declaration uses sorry` warnings and nothing else. Pins: Tau Ceti 2fd255d9, Mathlib 1b1ccf4b.

## R01 (P1) — The finite CW structure of complex projective space has no owner at this head

Carried from the previous review (its R01); not repaired.

Location: `README.md` lines 82 ("the CW structure of complex projective space (Stage 4.6)"), 405–406 ("Stage 4.6: the quotient topology on `Projectivization ℂ (Fin (n+1) → ℂ)` and its finite CW structure"), 2186 ("on which AlgebraicTopology Stage 4.6 builds the CW structure"), 2242–2243 ("Consume AlgebraicTopology Stage 4.6's finite CW structure"), 2271.

Claim: this roadmap consumes the ℂPⁿ cell structure from AlgebraicTopology Stage 4.6 and uses it in 7.2 for `H*(ℂPⁿ; ℤ) = ℤ[u]/(u^(n+1))`. The AlgebraicTopology folder of this pull request has no such construction: its Stage 4 item 6 builds real projective space only, and its Stage 7 item 4 (lines 1839–1845) says "The complex-projective check consumes ComplexKahlerGeometry K7.1's projective model and K7.2's finite CW structure … No complex-projective construction is required in Stage4". CharacteristicClasses at this head (lines 109–115) likewise consumes "K7.1 and only K7.2's CW/cellular/cup subitems". Only #1807's AlgebraicTopology (its lines 826–827, "construct complex projective n-space on native `Projectivization ℂ (Fin (n+1) → ℂ)` as a finite CW complex") builds the cells; this pull request merges after #1807 by its own merge order and its AlgebraicTopology folder replaces that text. Each folder points at the other and neither builds the cells.

Witness: `TauCetiRoadmap/AlgebraicTopology/README.md` line 1845 at a96d197, "No complex-projective construction is required in Stage4"; this README line 2242, "Consume AlgebraicTopology Stage 4.6's finite CW structure".

Repair: own it in 7.2, as the roadmap on main does and as AlgebraicTopology Stage 7 and CharacteristicClasses C1.5 expect: "Construct the finite CW structure on `Projectivization ℂ (Fin (n+1) → ℂ)` with one cell in each even dimension `0, 2, …, 2n` and characteristic maps `z ↦ [z : √(1−|z|²)]` from the closed unit disc of `ℂᵏ`, consuming AlgebraicTopology Stage 4's CW theory and cellular/singular comparison", with a Check that the cellular differential vanishes (cells in even dimensions only) and that the `2`-skeleton is `ℂP¹`; rewrite lines 82, 405–408, 2186, 2221, 2242 and 2271 so that Stage 4 supplies the CW theory and Stage 6 the products, not the cells. (The alternative, keeping #1807's Stage 4.6 text in this pull request's AlgebraicTopology folder and deleting its Stage 7 claim that K7.2 owns the cells, is an edit outside this folder; either way the two folders of this pull request must say the same.)

## R02 (P2) — 7.3 consumes a genus-`j` surface CW model that AlgebraicTopology does not have

Carried from the previous review (its R02); not repaired.

Location: `README.md` lines 2290–2292: "Construct the comparison of that model with AlgebraicTopology's standard CW model (one vertex, `2j` edges, one face attached by the product of commutators), treating `j = 0` by the sphere comparison, and compute `b₁ = 2j`, hence `g = j`."

Claim: the genus dictionary `g = j`, `b₁ = 2g` and the unimodular cup matrix of 7.3 rest on this one-vertex CW model. AlgebraicTopology at this head contains no CW model of a closed orientable surface: its only "product of commutators" is the kernel description in the degree-one Hurewicz proof (line 1943); "genus" and "one vertex" do not occur; Stage 7 lists spheres, tori and `ℂPⁿ` only. GeometricTopology §1.7.1 (at #903) supplies a polyhedral model with triangle orientations, not the one-face polygon model. The supplier is cited for a statement it does not make.

Witness: `grep -n -i 'genus\|one vertex' TauCetiRoadmap/AlgebraicTopology/README.md` at a96d197 returns nothing; this README line 2290, "AlgebraicTopology's standard CW model".

Repair: own the model in 7.3: "Construct the oriented one-vertex, `2j`-edge, one-face CW complex `Σ_j` attached by `[a₁,b₁]⋯[a_j,b_j]`, prove it homotopy equivalent to the orientable surface of genus `j` through GeometricTopology §1.7.1's polyhedral model, and compute its cellular chain complex (`d₂ = 0`, `d₁ = 0`), hence `b₁ = 2j` by AlgebraicTopology Stage 4's cellular comparison"; add the Check that the torus (`j = 1`, word `aba⁻¹b⁻¹`) has `H₁ = ℤ²` while the word `abab` gives the Klein bottle with `H₁ = ℤ ⊕ ℤ/2`. Drop "AlgebraicTopology's" from line 2290.

## R03 (P3) — GeometricTopology 1.7 and 1.7.1 exist only at #903's head, and the description does not name that revision

Carried from the previous review (its R03); not repaired (the description is unchanged).

Location: `README.md` lines 109–110, 443–450 (`### From TauCetiRoadmap.GeometricTopology`, "Layer 1.7 … Layer 1.7.1"), 2282–2286, 2329, 2341; the pull request's merge-order paragraph ("#1101 → #1807 → this pull request. It depends on no other author's open pull request").

Claim: GeometricTopology on main has no section 1.7; `### 1.7 Compact smooth surfaces` and `### 1.7.1 Polyhedral surfaces and explicit Euclidean embedding models` exist only at the head of #903 (now its lines 1047 and 1099; the file has grown since the previous review, which read them at 921 and 982). Citing a revision's numbering makes that revision a dependency to be named in the merge-order paragraph; the paragraph names only #1101 and #1807 and says the pull request depends on no other author's open pull request, while this roadmap also consumes two other-author new folders, VariationalMethods (#1028) and UnboundedOperators (#1027, under `OperatorTheory/`, absent from main's `OperatorTheory/` directory, which has Majorization … SelfAdjointSpectralTheory and no UnboundedOperators). The paragraph also gives no order against #1234 and #1398, kim-em's open revisions of this folder, which conflict with this head (`scratch/overlaps.md`).

Witness: main `TauCetiRoadmap/GeometricTopology/README.md` has no `### 1.7` heading; #903's head line 1047 `### 1.7 Compact smooth surfaces`.

Repair (description only; the folder text is right, and #1807's copy already writes "§1.7/§1.7.1", see R07): extend the merge-order paragraph to "#1101 → #1807 → this pull request; GeometricTopology §1.7/§1.7.1 are cited at #903's numbering, and VariationalMethods (#1028) and UnboundedOperators (#1027) are consumed as new folders; #1234 and #1398 are rebased on this pull request's copy of `TauCetiRoadmap/ComplexKahlerGeometry/`".

## R04 (P3) — Two edits outside the pull request's folders; the gate fails

Carried from the previous review (its R04); not repaired.

Location: `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77 (`git diff --stat origin/main...HEAD` outside the fifteen named folders: 2 files, 1 line each; gate `outside-folder=2`, verdict FAIL).

Re-raised: R14 of the review before last, answered as outside the folder. The reason fails because the gate fails on exactly these two files and no acceptance is possible while it fails; the repair is a revert on this branch, not an edit in the folder.

Claim: the two one-line rewordings are #1807's commits e591d103 and 61e5385e, which #1807 itself reverted; they are not this pull request's subject.

Witness: `git log --oneline origin/main..HEAD -- Completed/ArithmeticDirichletSeries/README.md TauCetiRoadmap/SymplecticGeometry/README.md` lists 61e5385e and e591d103 at a96d197.

Repair: revert the two commits on this branch, or rebase onto #1807's current head, which no longer carries them (that rebase is also R07's repair).

## R05 (P3) — A false Check in 2.3

Carried from the previous review (its R05); not repaired.

Location: `README.md` lines 793–795: "`polydisc (1, 1)` in `ℂ²` contains `(0.9, 0.9)`, of Euclidean norm `0.9·√2 > 1`, and omits `(1, 0)`; a definition by the Euclidean ball `|z| < 1` would decide both points the other way, and a closed-disc definition would contain `(1, 0)`."

Claim: the open Euclidean unit ball also omits `(1, 0)` (its norm is `1`, not `< 1`), so it decides only the first point the other way; the open ball is contained in the open polydisc, so no point is in the ball and outside the polydisc.

Witness: `‖(1, 0)‖ = 1`, and `1 < 1` is false.

Repair: "a definition by the Euclidean ball `|z| < 1` would omit `(0.9, 0.9)`, which the polydisc contains, and a closed-polydisc definition would contain `(1, 0)`, which the open polydisc omits".

## R06 (P3) — Two locator and wording nits

Carried from the previous review (its R06); not repaired here (#1807's copy fixes the line-316 half, see R07).

Location: `README.md` lines 2055–2058, 2087 and 2514 ("Prove `Δ″_E = Δ′_E + [iΘ(E), Λ]` and the integrated Bochner–Kodaira–Nakano identity … (Demailly, Chapter VII, (1.2))"); line 316 ("the same definition as Mathlib's, from the same Mathlib pull request").

Claim: Demailly VII (1.2) (demailly-agbook line 16274, printed p. 330) is the Hermitian identity with the two torsion terms `[D′, τ*] − [D″, τ*]`, `τ = [Λ, ∂ω]`; the torsion-free identity the sentence states is Corollary (1.3) (line 16281), which needs `ω` Kähler. The sentence sits in the Kähler layer but does not say so, and cites the theorem with the extra terms. Line 316 refers to a Mathlib pull request, a process reference the README avoids.

Witness: demailly-agbook line 16274 ((1.2), four terms), line 16281 ((1.3), "If ω is Kähler").

Repair: "For a Kähler form `ω` prove `Δ″_E = Δ′_E + [iΘ(E), Λ]` (Demailly, Chapter VII, (1.3), the Kähler case of the Bochner–Kodaira–Nakano identity (1.2))" at 2055–2058 and in the References line 2514; at line 316 write "(the same definition as Mathlib's)".

## R07 (P3) — This folder now lags #1807's copy of the same folder, which the stated merge order makes it overwrite

Location: the whole of `TauCetiRoadmap/ComplexKahlerGeometry/README.md` against `ComplexKahlerGeometry/README.md` at #1807's head (`roadmaps show ComplexKahlerGeometry --pr 1807`); the merge-order paragraph "#1101 → #1807 → this pull request".

Claim: #1807 (the same author's loop-cutting pull request) now carries this folder with 68 differing README lines and an identical `Suggested.lean`. Its copy is this one plus repairs made to it since: GeometricTopology cited as "§1.7/§1.7.1" (its lines 111, 446, 449, 2294, 2296, 2341, 2353), line 316 without "from the same Mathlib pull request" (half of R06), Demailly IV "(6.13)–(6.15), p. 216" for the Dolbeault isomorphism (816–817, 2521), the regular-local-ring sentence of 3.4 with the Krull dimension argued by the prime chain and Krull's height theorem rather than read off (4.32) (1012–1016), 2.4's forward `*Needs:*` on Layer 4 and 7.1 removed with the bundle-valued Dolbeault comparison moved into 4.2 with Demailly V (11.7) (834–838, 858, 1204–1210, 1223) and the ℂP¹ one-form example made a 7.2 Check (2278–2281). By the pull request's own order #1807 merges first, so at merge this unchanged copy replaces #1807's and reverts every one of those repairs; the two pull requests change the same targets differently with the order stated the wrong way round for this folder's content.

Witness: `diff TauCetiRoadmap/ComplexKahlerGeometry/README.md <(roadmaps show ComplexKahlerGeometry --pr 1807)`: 68 lines; this README line 859–860 "Layer 4 for the bundle-valued comparison; 7.1 for the acceptance example" (a Layer 2 target needing Layers 4 and 7) against #1807's line 858, which ends the `*Needs:*` at `MDifferentiable.exists_eq_const_of_compactSpace`.

Repair: rebase this branch onto #1807's current head (which also discharges R04), so that this folder equals #1807's copy and this pull request's diff of it carries only its own repairs (R01, R02, R05 and the Demailly VII half of R06); or, if the branch is not rebased, copy #1807's two files into this folder verbatim before adding those repairs. Do not restate in this folder what #1807 already changes.

## Previous findings

- R01 — not repaired: README lines 82, 405–406, 2186, 2242–2243 still consume "AlgebraicTopology Stage 4.6's finite CW structure"; AlgebraicTopology at this head, line 1845, still says no complex-projective construction is required in Stage 4 (R01 above).
- R02 — not repaired: line 2290 still says "AlgebraicTopology's standard CW model (one vertex, `2j` edges, one face …)"; AlgebraicTopology at this head has no such model (R02 above).
- R03 — not repaired: the merge-order paragraph is unchanged ("#1101 → #1807 → this pull request. It depends on no other author's open pull request"); GeometricTopology 1.7/1.7.1 are still only at #903's head, now its lines 1047/1099 (R03 above).
- R04 — not repaired: e591d103 and 61e5385e are still on the branch; gate `outside-folder=2`, FAIL (R04 above).
- R05 — not repaired: lines 793–795 unchanged, "a definition by the Euclidean ball `|z| < 1` would decide both points the other way" (R05 above).
- R06 — not repaired: lines 2055–2058 and 2514 still cite Chapter VII (1.2) for the torsion-free identity; line 316 still says "from the same Mathlib pull request" (R06 above; #1807's copy fixes the latter).

## Verified sound

- **Change set.** `git diff --stat c9403e2..a96d197 -- TauCetiRoadmap/ComplexKahlerGeometry TauCetiRoadmap/AlgebraicTopology TauCetiRoadmap/CharacteristicClasses` is empty; the two commits since c9403e2 change `TauCetiRoadmap/BordismFormalGroups/{README.md,Suggested.lean}` and `TauCetiRoadmap/LocalPurity/{README.md,Suggested.lean}`, which this README does not cite (no `BordismFormalGroups` or `LocalPurity` token in it) and which do not cite this roadmap; `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` remain the only files outside the fifteen named folders (R04). The pull-request description is identical to the one the previous review read.
- **Gate, build, probe, signatures.** Gate counts above (only `outside-folder=2`); depcheck `238 roadmaps, 2318 edges, 0 problem(s)`; `lake env lean` exit 0 with 16 sorry warnings. One-tactic probe on a scratch copy (every proof `sorry` replaced by `first | rfl | infer_instance | (simp; done) | (norm_num; done) | trivial | decide`): all 16 sorried theorems fail (16 errors, one at each of lines 88, 115, 131, 144, 158, 172, 178, 190, 209, 236, 273, 282, 327, 334, 340, 364 of the copy); no declaration is padding. The same copy carries `#check @` for all 26 declarations (`newlander_nirenberg`, `polydisc`, `dolbeault_grothendieck_polydisc`, `hartogs_extension`, `weierstrass_preparation`, `weierstrass_preparation_unique`, `isRegularLocalRing_holomorphicStalk`, `uniqueFactorizationMonoid_holomorphicStalk`, `rueckert_nullstellensatz`, `oka_coherence`, `hodge_theorem_deRham`, `dolbeaultCocycles`, `dolbeaultCoboundaries`, `DolbeaultCohomology`, `finiteDimensional_dolbeaultCohomology`, `finrank_dolbeaultCohomology_serre`, `mextDerivℂ`, `deRhamCocycles`, `deRhamCoboundaries`, `ComplexDeRhamCohomology`, `IsKahlerForm`, `finrank_complexDeRhamCohomology_eq_sum_dolbeault`, `finrank_dolbeaultCohomology_symm`, `even_finrank_complexDeRhamCohomology_odd`, `lefschetzPow`, `hard_lefschetz`); the elaborated types are those of the previous review and of `scratch/signatures.md` (whose 27th entry, an "unknown identifier `…of`" at its line 396, is an artefact of its own scaffold, not a declaration of the file). `hard_lefschetz` carries `[T2Space M] [CompactSpace M]`, `IsKahlerForm E M κ` and `k ≤ Module.finrank ℂ E` with both the injectivity and surjectivity clauses on cocycles modulo coboundaries, as the README 6.2 states. The nine definitions elaborate without `[FiniteDimensional ℂ E]` because their bodies do not need it; every theorem about them carries it (recorded, not a finding, as before).
- **Previous-finding witnesses re-read at this head.** AlgebraicTopology lines 1839–1845 (R01), `grep -i 'genus\|one vertex'` on it (R02, one hit at 1943, the Hurewicz kernel), CharacteristicClasses lines 109–115 (consumes K7.2's CW subitems), GeometricTopology main (no `### 1.7`) and #903 (1047, 1099, and a new 1.7.2 at 1210), main's `TauCetiRoadmap/OperatorTheory/` listing (no `UnboundedOperators`), no `TauCetiRoadmap/VariationalMethods/` on main (R03), `git log origin/main..HEAD` on the two outside files (R04), README 792–795 (R05), 316, 2055–2058, 2087, 2514 (R06), demailly-agbook lines 16274 and 16281 as cited in the previous report.
- **Overlap with #1807.** `roadmaps show ComplexKahlerGeometry --pr 1807` (README 2545 lines, `Suggested.lean` 384 lines): README differs from this head by 68 lines, listed in R07; `Suggested.lean` is identical. `roadmaps show AlgebraicTopology --pr 1807` lines 826–827 build the ℂPⁿ CW complex in Stage 4.6 and its line 1818 consumes it, so within #1807 the pair is consistent; within this pull request it is not (R01). #1234 and #1398 still conflict with this head in both files and the description still gives no order (R03). The three dropped anchors `#k2-…`, `#k5-…`, `#k7-…` that Hyperfunctions, PseudodifferentialOperators, SmoothBundlesConnections, SpectralManifolds, SpinGeometry, GeneralizedCohomology, MorseTheory and RiemannianGeometry cite are covered by the unchanged old → new numbering list (README lines 476–489). `scratch/citations.md`'s seven leads (`HolomorphicStalk`, `MeromorphicGermField`, `ComponentwiseFiniteRankAssembly`, `DistributionLocalStructure`, `ComponentwiseCompact`, `SmoothSectionMontel`, `NilpotentCentralReduction`) are the K-labels of that numbering list and of section headings, not Lean names; none is claimed as a declaration.
- **Seeded sample.** No sampled target lies in a changed passage (there is none). Beyond the previous report's locator checks for 1.2, 2.2, 2.3, 2.4, 3.4, 3.5, 4.2, 5.5, 5.7, 5.9, 5.10, 7.3 and 8.3, opened now: 8.1's "Demailly, Chapter VI, §11" is demailly-agbook line 15941, printed p. 322 (page marker at 15921), with (11.1) `E₁^(p,q) = H^(p,q)(X, ℂ)` at 15946, the inequality (11.2) `b_k ≤ Σ_(p+q=k) h^(p,q)` with equality iff `E₁`-degeneration at 15950–15958, and degeneration for compact Kähler at 15959–15960, as 8.1 states. The pinned names of 4.1, 7.1 and 8.1 are at the pins: Tau Ceti `affineOpenPartialHomeomorph` (`Geometry/Manifold/Projectivization/ZeroLocus.lean`), `isOpen_affineOpen` (`Topology/Algebra/Projectivization.lean`), `contDiffOn_affineChart_symm_trans` (`Geometry/Manifold/Instances/Projectivization.lean`), `complexOrientationLift` (`Geometry/Manifold/Complex/Orientation.lean`), `OnePoint.equivProjectivization` (`LinearAlgebra/Projectivization/OnePoint.lean`; Mathlib `Topology/Compactification/OnePoint/ProjectiveLine.lean`); Mathlib `Opens.overPullbackSheafEquivOver` and `sheafRestrict` (`Topology/Sheaves/Over.lean`), `SheafOfModules` (`Algebra/Category/ModuleCat/Sheaf.lean`), `SpectralObject` (`Algebra/Homology/SpectralObject/Basic.lean`), `MDifferentiable.exists_eq_const_of_compactSpace` (`Geometry/Manifold/Complex.lean`). AlgebraicTopology at this head names K8's column-filtration adapter as consumer of Stage 5.0 (its line 951) and K7 as consumer of the quotient topology (820), as 8.1 and 7.1 assume.
- **Remarks on untouched text (not findings; the previous review passed them):** 2.4's `*Needs:*` (lines 859–860) lists Layer 4 and 7.1, a Layer 2 target depending on later layers; #1807's copy already removes it (R07 brings the fix). 7.1's third Check writes the transition's real determinant as `|−1/z²|² > 0`, the right sign witness for the complex orientation of 1.1.
- **Adversarial table.** Every statement is untouched since the previous review; its rows are carried (each value recomputed there, cited as "r51"), and rows are added for what was recomputed now.

| statement | instance | left | right | result |
|---|---|---|---|---|
| orientation sign `|det_ℂ A|²` (1.1) | `A = i`; `A = diag(2, i)`; conjugation | 1; 4 | `> 0`; conjugation has real det `−1` | holds (r51) |
| `φ_z̄ = 0` iff `φ^*dz` of type `(1,0)` (1.1) | `φ = z̄`; `φ = z²` | `dz̄`; `2z dz` | `(0,1)`; `(1,0)` | holds (r51) |
| implicit map and uniqueness (1.2) | `G = v² − z` at `(1,1)` | `F = √(z+w)`, `F(1,0) = 1` | `−√(z+w)` gives `−1 ≠ v₀` | holds (r51) |
| `J² = −1`, `N(∂_x, ∂_u)` (1.3) | `J∂_u = ∂_v + y∂_x`, `J∂_v = −∂_u − y∂_y` | `J²∂_u = −∂_u` | `N = ∂_x ≠ 0` | holds (r51) |
| tensoriality forces the signs (1.3) | `Y ↦ fY` | extra terms cancel to `0` | reversed signs leave `2((JXf)JY − (Xf)Y)` | holds (r51) |
| `N(v, Jv) = 0` (1.4) | pinned antisymmetry, `apply_left`, `self` | `−N(Jv, v) = J N(v, v)` | `= 0` | holds (r51) |
| Cauchy estimate (2.1) | `h = 1/(1−z)`, `r = 1/2`, `ρ = 3/4` | error `2^(−N)` | bound `8·(2/3)^N ≥ 2^(−N)` | holds (r51) |
| Laurent vs Taylor truncation (2.1) | `h = 1/z + z` on `1/2 ≤ |z| ≤ 2` | Laurent of order `≥ 1` is `h` | Taylor error `2` | holds (r51) |
| solver with holomorphic parameter (2.2) | `f = q⁻¹`; `f = q̄` | `u = q⁻¹ z̄`, `∂̄_q u = 0` | `q̄` not holomorphic in `q`, no solution | holds (r51) |
| `∂̄u = f` (2.3) | `f = z̄` | `u = z̄²/2` | `u = |z|²` gives `∂̄u = z` | holds (r51) |
| closedness needed (2.3) | `z̄₂ dz̄₁` on ℂ² | `∂̄ = dz̄₂ ∧ dz̄₁ ≠ 0` | `∂̄² = 0` forbids a primitive | holds (r51) |
| polydisc vs ball (2.3) | `(0.9, 0.9)`, `(1, 0)` | polydisc: in, out | open ball: out, out | Check false at `(1,0)` (R05) |
| `H¹` of the two-set cover of `ℂ² ∖ {0}` (2.4) | `𝒪(ℂ*×ℂ*)/(𝒪(ℂ*×ℂ) + 𝒪(ℂ×ℂ*))` | monomials `z₁^(−m) z₂^(−n)`, `m, n ≥ 1` | neither factor holomorphic | holds (r51) |
| real Osgood fails (3.1) | `xy/(x²+y²)` | separately analytic | not continuous at `0` | holds (r51) |
| realified equations of `w − z²` (3.1) | `Re w − (x² − y²)`, `Im w − 2xy` | differentials independent | cusp `w² − z³`: vanish at `0` | holds (r51) |
| Weierstrass coefficients (3.2) | `w² − z`; `e^z w`; `f = z` | `u = 1`, `a₀ = −z`; `u = e^z`, `P = w` | `f(0, w) ≡ 0`: no `d` | holds (r51) |
| `d = 0` in `weierstrass_preparation` | `f(0,0) ≠ 0` | `u = f`, polynomial `1` | `hlow` vacuous | holds (r51) |
| Laurent coefficient (3.3) | `f = 1/(z−a)`, `k = 1` | `(2πi)⁻¹∮ dz/(z−a) = 1` | principal part `1/(z−a)` | holds (r51) |
| regular evaluation (3.3) | `(z−a)^(−2)(1 + (z−a)²)` | regular germ `1`, value `1` | `(z−a)/(z−a) = 1` | holds (r51) |
| `I(V(𝔞)) = √𝔞` (3.4) | `𝔞 = (z²)`; `(z₁z₂)` | `(z)`; radical | `rueckert`: `m = 2`, `a₁ = 1` | holds (r51) |
| relation modules (3.4) | `(z₁, z₂)`; `(z, z²)` | Koszul `(z₂, −z₁)`; `(z, −1)` | `(a,b) = b(−z, 1)` | holds (r51) |
| irreducibility of germs (3.4) | node `w² − z² − z³` | branches `w = ±z√(1+z)` | irreducible polynomial | holds (r51) |
| Hartogs hypotheses (3.5) | `n = 1`, `1/z`; shell `1 ≤ |z| ≤ 2` | no extension | disconnected complement: `1`/`0` no extension | both needed, present (r51) |
| Riemann vs Hartogs (3.5) | `z₁/z₂` near `z₂ = 0` | unbounded, no extension | codimension one needs boundedness | holds (r51) |
| `Sing`, descending sequence (3.5) | two lines in `ℂP²` | `S₁ = {[0:0:1]}`, `S₂ = ∅` | pieces two copies of ℂ | holds (r51) |
| trivial line bundle sections (4.1) | rank `1`, `𝒪` | sections = holomorphic functions | `O(1)` on ℂP¹: `h⁰ = 2`, `O(2)`: `3` | holds (r51 values of 7.2) |
| Chern connection, curvature (4.2) | `h = e^(−φ)`; `h = (1+|z|²)^(−1)` | `A = −∂φ`, `Θ = ∂∂̄φ` | `∂∂̄ log(1+|z|²) = −2πi ω_FS` | holds (r51) |
| gauge sign (4.2) | `(∂̄ + a)(e^(−u) f)` | `= 0` iff `∂̄u = a` | `e^(u) f` gives `2a e^u f` | holds (r51) |
| monodromy of `d + λ dz/z` (4.3) | `λ = 1/2` | `M = e^(−2πiλ) = −1` | inverse convention agrees iff `λ ∈ ℤ/2` | holds (r51) |
| curvature of `d + z₂ dz₁` (4.3) | ℂ² | `dz₂ ∧ dz₁ ≠ 0` | curves: `(2,0)`-forms vanish | holds (r51) |
| componentwise assembly (4.4) | ranks `(1, 2)` | stalks ℂ, ℂ² | morphism to `(2, 1)` is a pair of linear maps | holds (r51) |
| `⋆⋆` signs (5.1) | ℝ², `k = 1`; ℝ³, `k = 1` | `−1` | `+1` | holds (r51) |
| LF topology (5.1) | bumps on `[j, j+1]` | `Σ_j j φ(j + 1/2)` continuous | value `j` unbounded | holds (r51) |
| `D = ∂ + 3` (5.2) | `x²` at `x = 2`; `ξ = 2` | `16` | `σ_F = 2i`, `σ_geom = 2` | holds (r51) |
| `P* = −ā∂ − ā′` (5.2) | `a = x` | zeroth-order term `−1` | negating `∂` alone misses it | holds (r51) |
| `Δ_∂̄ = −2∂_z∂_z̄` (5.2, 5.9) | functions on ℂ | symbol `½|ξ|²` | `Δ_d` symbol `|ξ|²`, `Δ_d = 2Δ_∂̄` | holds (r51) |
| `H₂ = t_+`, `D²H₂ = δ` (5.3) | `m = 2` | `t_+` continuous | `m = 1`: `1_(t>0)` not continuous | holds (r51) |
| jet coefficient (5.3) | `u = δ′` | `⟨δ′, z⟩ = −1` | `u₁ = 1`; degree `−2` | holds (r51) |
| `⟨δ^(n)/n!, φ⟩` (5.3) | `φ = 1/(1+2x)`; `1/(1−2x)` | `2^n` | `(−2)^n` | holds (r51) |
| nonextension (5.3) | `|x| ≤ (1+c)ε` | `exp((1+c)^(−2)ε^(−2))` | times `(cε)^n ∫φ` vs `Cε^(−N)` | holds (r51) |
| Montel (5.4) | `sin(jx)/j`; `C⁰` ball | `C⁰ → 0`, `C¹` norm `1` | `sin(jx)` no convergent subsequence | holds (r51) |
| `δ ∈ H^s` iff `s < −n/2` (5.5) | `∫⟨ξ⟩^(2s)` | finite iff `2s < −n` | `‖e^(ikθ)‖ ≍ (1+k²)^(s/2)` | holds (r51) |
| sharp embedding (5.5) | `u = χ log log(1/|x|)`, `n = 2` | `∫|∇u|² = 2π/log 2` | `u` unbounded | holds (r51) |
| weight constants (5.5) | `(1+|ξ|)² ≤ 2(1+|ξ|²)` | `1` and `2^|s|` | not `1, 1` | holds (r51) |
| dilation pullback (5.5) | `x ↦ 2x` | `δ(2x) = δ/2` | Jacobian `1/2` | holds (r51) |
| periods (5.6) | `dz/z`; `dz̄/z̄`; difference | `2πi`; `−2πi` | `2i dθ`, period `4πi` | holds (r51) |
| `Log_− − Log_+` (5.6) | upper; lower half plane | `0` | `2πi` | holds (r51) |
| `d(i(x dy − y dx))` (5.6) | ℂ ∖ {0} | `2i dx ∧ dy = dz̄ ∧ dz` | `H² = 0` consistent | holds (r51) |
| `d*` sign (5.7) | `m = 3`, `k = 1` | `(−1)^7 = −1` | pinned `(k+1)`-form, `k = 0`: `(−1)^7` | holds (r51) |
| Peetre with `⟨η⟩^|s|` (5.7) | `s = −1`, `η = −ζ` | `1 ≤ √2` | `⟨η⟩^s` version fails for `|ζ| ≥ 1` | holds (r51) |
| `Δ_d e^(ikθ) = k² e^(ikθ)` (5.7) | circle | nonnegative | `laplaceBeltrami` gives `−k²` | holds (r51) |
| `ker Δ_d` on two circles (5.8) | ranks `1`, `2` | multiplicity `3` | one per component would give `2` | holds (r51) |
| `dvol = ω^n/n!` (5.9) | `n = 1`; `n = 2` | `ω`; `ω² = 2 dx₁dy₁dx₂dy₂` | `/2!` | holds (r51) |
| `|dz|² = 2`, `dz♯ = 2∂_z` (5.9) | `H = I` | `2` | dual frame gives `∂_z` | holds (r51) |
| anticommutators (5.9) | `ψ` orthonormal; `φ = √2ψ` | `1`, mixed `0` | `2` | holds (r51) |
| Hodge numbers (5.10) | ℂP¹; Hopf | `h^(0,0) = h^(1,1) = 1` | Hopf `h^(0,1) = h^(2,1) = 1`, `h^(1,0) = 0` | Serre holds, symmetry fails off-Kähler (r51) |
| `IsKahlerForm` (6.1) | `dx ∧ dy`, `J = i`; `−dx ∧ dy` | `κ(1, i) = 1 > 0` | `−1` | discriminates (r51) |
| invariance clause (6.1) | `κ = dx₁dy₁ + dx₂dy₂ + ε dx₁dx₂` | `κ(v, Jv) ≥ (1−ε)|v|²` | `κ(∂_(x₁), ∂_(x₂)) = ε ≠ 0 = κ(∂_(y₁), ∂_(y₂))` | clause needed, present (r51) |
| `[Λ, L] = n − k` (6.1) | ℂ, `k = 0`; `k = 2` | `1` | `−1` | holds (r51) |
| `[iΘ, Λ]` bound (6.1) | line on a curve, `iΘ = aω` | on `(1,1)`: `a` | on functions: `−a` | holds, `k ≥ 1` needed (r51) |
| Hodge–Riemann sign (6.2) | `f dz`; `f dz̄` | `2∫|f|²` | `2∫|f|²` | holds (r51) |
| Hodge index (6.2) | `ω₁ − ω₂` on ℂP¹×ℂP¹ | primitive | `(−1)^1 · (−2) = 2 > 0` | holds (r51) |
| `lefschetzPow` (6.2) | `ω` on ℂ², `j = 2`, `α = 1` | `ω ∧ ω = 2 dx₁dy₁dx₂dy₂` | no `1/j!` | holds (r51) |
| `hard_lefschetz` at `k = n`; `n = 0` | `finrank − k = 0` | `lefschetzPow 0 = id` | both clauses trivial | holds (r51; binders re-read now) |
| odd Betti even (6.2) | elliptic curve; Hopf | `b₁ = 2` | Hopf `b₁ = 1`, not Kähler | holds (r51) |
| `∫_V ω_FS` (6.2) | line; nodal cubic | `1` | `3` | holds (r51) |
| ℂP¹ charts (7.1) | `[1 : z] ↦ z`, `[w : 1] ↦ w` | transition `z = 1/w` | `∞ = [1 : 0]` has `U₀`-coordinate `0` | holds (r51) |
| transition orientation (7.1) | `z ↦ 1/z` | real det `|−1/z²|² > 0` | conjugation would give `< 0` | holds |
| `ω_FS` on `U₀` (7.2) | ℂP¹ | `(1/π) dxdy/(1+r²)²`, `∫ = 1` | unnormalized: `π` | holds (r51) |
| `c₁(O(1))` (7.2) | `(i/2π)(−2πi ω_FS)` | `ω_FS`, `⟨u, [ℂP¹]⟩ = 1` | opposite sign contradicts `∫ω_FS > 0` | holds (r51) |
| `h⁰(O(k))` (7.2) | `n = 1`, `k = 2`; `k = −1` | `3` | `0`, Serre with `K = O(−2)` | holds (r51) |
| `K_(ℂP¹) ≃ O(−2)` (7.2) | `z = 1/w` | `dz = −w⁻² dw` | degree `−2` | holds (r51) |
| torus, curves (7.3) | `n = 1`; ℂP¹; genus 2 | `b₁ = 2` | `0`; `4` | holds (r51) |
| Hopf weights (7.3) | `z₁^a z₂^b dz_j`; `z₁^(−m) z₂^(−n) dz_j` | `2^(a+b+1) ≥ 2` | `2^(1−m−n) ≤ 1/2` | holds (r51) |
| Hopf diamond vs Betti (7.3) | `S¹ × S³` | `1, 1, 0, 1, 1` | `h^(0,0)`, `h^(0,1)`, `0`, `h^(2,1)`, `h^(2,2)` | holds (r51) |
| Frölicher (11.2) on Hopf (8.1 Check) | `k = 0..4` | `b_k = 1, 1, 0, 1, 1` | `Σ_(p+q=k) h^(p,q) = 1, 0+1, 0+0+0, 1+0, 1` | equality without Kähler, holds |
| Frölicher bidegree (8.1) | column filtration by `p` | `d_r : (p,q) → (p+r, q−r+1)` | `d₁ = ∂` | holds (r51) |
| central reduction (8.2) | complex Heisenberg, `ℤ[i]` lattice | `A/(Γ∩A) = ℂ/ℤ[i]` | `G/A = ℂ²`, lattice `ℤ[i]²` | holds (r51) |
| Iwasawa (8.3) | `dz₃ − z₁dz₂`; conjugate | `∂ ≠ 0`, `h^(1,0) = 3` | `∂̄ ≠ 0`, `h^(0,1) = 2`, `b₁ = 4 < 5` | holds (r51; and 8.1's second Check) |

## Not verifiable

- webster-nn (1.4's Newlander–Nirenberg route), hormander-alpdo1 (5.3, Theorems 2.3.4–2.3.5), wells-dacm (2.4, 5.7, 5.10): recorded as uncertified in the manifest; cited by locator, text not read.
- Ownership against open pull requests was checked against the sibling checkouts this brief lists and against #1807, #1234 and #1398 through `roadmaps show`; open pull requests the brief names without files were not searched.

## Source issues

- none
