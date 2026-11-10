# Review of MorseNovikov (pull request #1161 at e3dc9d3)

**Verdict:** needs changes

This is a full review: the folder changed by 195 lines since `3a07f9f`. All seven findings of the previous review are repaired in the folder (table under "Verified sound"). The gate and the dependency check pass on my own run, `Suggested.lean` elaborates with only its two `sorry` warnings, every sampled locator that can be read agrees with its text, and the two headlines survive every computed instance.

One finding remains, P3 and not blocking. It is about the pull request description, which the repair of the previous R02 made false; the folder itself needs no change.

## R01 (P3) — The description says the `AbelianCoverHomology` section is unchanged; this head deletes it

**Location.** Pull request description, second bullet, last sentence: "The `AbelianCoverHomology` section is unchanged."

**Claim.** The pull request leaves main's `AbelianCoverHomology` section of `Suggested.lean` as it is.

**Witness.** Main's `TauCetiRoadmap/MorseNovikov/Suggested.lean:104–133` has the section (`doubling`, `fiberMap` and three theorems). At this head the file ends with `poincare_hopf` at line 160, and a grep for `AbelianCoverHomology` in the folder finds nothing.

The same bullet is also silent on two other changes of this head to the file: the nondegeneracy hypothesis of `lefschetz_fixed_point_formula` is now `TauCeti.IsNondegenerateFixedPt` (`Suggested.lean:107`), and the file imports `TauCeti.Geometry.Manifold.MFDeriv.FixedPoint` (`Suggested.lean:5`).

**Repair.** In the description, replace the sentence by:

> The `AbelianCoverHomology` section (`doubling`, `fiberMap` and their three one-line theorems) is deleted; §2.3 of the README keeps the calibration as prose. The Lefschetz statement takes its nondegeneracy hypothesis from Tau Ceti's `TauCeti.IsNondegenerateFixedPt`, and the module docstring names the pinned Novikov-series, Reidemeister-torsion and orbit-zeta declarations that the file does not restate.

**Tested.** `git diff origin/main...HEAD -- TauCetiRoadmap/MorseNovikov/Suggested.lean` removes main's lines 104–133; the replacement sentence matches `Suggested.lean:5`, `:21–30` and `:107` at this head.

## Verified sound

### The previous review's findings

| Previous finding (at `3a07f9f`) | Passage at `e3dc9d3` | Status |
|---|---|---|
| R01: docstring names pinned carriers as missing | `Suggested.lean:21–30` names `TauCeti.NovikovSeries`, `completionPkg`, `mapRingHom`, `isDomain_of_fg`, `reidemeisterTorsion` and its three companions, `orbitZeta` and its Euler product as proved at the pin; lines 32–51 name only absent carriers | repaired; every name opened at the pin (below) |
| R02: `AbelianCoverHomology` padding | section deleted; `README.md:1521–1525` lists exactly the eight declarations of the file | repaired (the description is now out of date: R01 above) |
| R03: §6.4 rebuilds GeometricTopology §4.4 | `README.md:194–201` consumes §4.4; `:1249–1254` builds only the based equivariant complex, its identification with §4.4's module and the filling cells; `:1267`, `:1277` follow | repaired |
| R04: pinned nondegenerate-fixed-point predicate not cited | `README.md:131–135`, `:1283–1286`, `:1317`, `:1326`, `:1344–1345`; `Suggested.lean:107` states `hnd` through `TauCeti.IsNondegenerateFixedPt` | repaired |
| R05: `rationalBetti` without API or Checks; two Checks blocks in a row | `README.md:1450–1464` (four API bullets, four Checks); the formula's Checks moved to `:1302–1308` | repaired |
| R06: four rt3 locators | `README.md:607` (Lemma 4.1, p. 235, proof p. 236), `:612` (Remark 4.3, p. 237), `:1152` (pp. 235–236), `:1412` | repaired; each read in rt3 (below) |
| R07: `zeroSign` cites a page that does not state the sign | `Suggested.lean:127–130` and `README.md:1438` cite Milnor, *Topology from the Differentiable Viewpoint*, §6 | repaired (the book itself is under "Not verifiable") |

### Gate and dependency check

- **Gate, own run:** `gate MorseNovikov: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate adds `build=0`.
- **Dependency check:** `depcheck: 233 roadmaps, 2259 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line; every supplier is on main.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/MorseNovikov'` is empty. `lake-manifest.json` equals main's (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d`).

### Lean

- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0; the only diagnostics are "declaration uses `sorry`" at lines 102 and 149.
- **Signatures.** A scratch copy with `#check @name` for all eight declarations gives the types of `scratch/signatures.md`. Both theorems carry `[FiniteDimensional ℝ E] [I.Boundaryless] [IsManifold I ∞ M] [CompactSpace M] [T2Space M]` with `M : Type u_1` independent of `E` and `H`, as §§6.5 and 7.3 say (compact Hausdorff, boundaryless model, any universe; no orientation, connectedness or second countability). `zeroDet` and `zeroSign` carry `[IsManifold I 1 M]`, supplied by the theorem's `IsManifold I ∞ M`. No binder is lost; I changed nothing.
- **One-tactic probe.** On scratch copies, `simp` leaves both headlines unsolved, `rfl` fails on both, and `infer_instance` fails on both. The six definitions are what the two statements need; nothing else is declared.
- **Headlines.** Stated: the smooth Lefschetz fixed-point formula and the vector-field Poincaré–Hopf theorem. The docstring names the rest as proved at the pin (Layers 1, 4, 5 algebra) or not statable with the missing carrier (cutoff trajectory spaces, the Novikov complex of a closed one-form, periodic-orbit data of −α♯, a based cellular torsion of an abelian cover, the Alexander polynomial of a smooth knot, a continuous local fixed-point index, the Euler-structure torsor). A grep of both pins for declarations named after Lefschetz, Poincaré–Hopf, a fixed-point index, an Euler structure or a Novikov complex finds none, so none of these is statable and absent.

### Pinned declarations opened (Tau Ceti `2fd255d`)

- `TauCeti.IsNondegenerateFixedPt` (`Geometry/Manifold/MFDeriv/FixedPoint.lean:74`): `IsFixedPt f x ∧ MDifferentiableAt I I f x ∧ ∀ v, mfderiv I I f x v = v → v = 0`. It includes differentiability and the fixed-point condition, which the README's gloss "1 is not an eigenvalue of df_x" leaves to the smoothness of f and the quantifier over fixed points.
- `TauCeti.finite_fixedPoints_of_isNondegenerateFixedPt` (`:146`): needs `[CompleteSpace 𝕜] [FiniteDimensional 𝕜 E] [CompactSpace M] [T2Space M]` and `Continuous f`, as `README.md:133–135` says.
- `TopPair.singularHomologyInclIso` (`AlgebraicTopology/Singular/Empty.lean:143`); `TauCeti.eulerChar_eq_finsum_finrank_singularHomology` (`AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:133`, for `[FiniteCWType X]` and a division ring in the universe of X). The pinned `FiniteCWType` instances are for discrete, contractible, product, circle and projective spaces; none is for a compact manifold, as `README.md:1457` says.
- `TauCeti.NovikovSeries` (`RingTheory/NovikovSeries/Basic.lean:92`), `completionPkg` (`Topology.lean:349`), `mapRingHom` (`Functoriality.lean:184`), `isDomain_of_fg` (`LeadingTerm.lean:266`, with `[HasUniqueDiv H]`), `orbitZeta` (`OrbitZeta.lean:104`), `orbitZeta_eq_mapRingHom_eulerProduct` (`:264`).
- `HomologicalComplex.reidemeisterTorsion` (`Algebra/Homology/ReidemeisterTorsion/Basic.lean:291`), `reidemeisterTorsion_eq_mul_finprod_det_toMatrix` (`:896`), `reidemeisterTorsionWithHomology` (`Homology.lean:226`), `componentwiseReidemeisterTorsion` (`Componentwise.lean:99`).
- `TauCeti.cellularChainComplexRep` (`AlgebraicTopology/Cellular/Covering.lean:153`), `TauCeti.KnotTheory.alexander` (`KnotTheory/Alexander.lean:395`, a function of a matrix), `TauCeti.BraidWord.seifertMatrix` (`KnotTheory/BraidWord/SeifertMatrix/Basic.lean:233`), `TauCeti.SmoothCircleEmbedding` (`KnotTheory/SmoothCircle.lean`).
- `isCompleteVectorField_of_compactSpace` (`Geometry/Manifold/Flow/Complete.lean:154`), `exists_contMDiffAt_localFlow` (`IntegralCurve/SmoothFlow.lean:58`), `rieszDual` and `inner_rieszDual` (`VectorBundle/Riemannian/Riesz.lean:77`, `:85`), `MorseChart` (`Morse/Lemma.lean:69`), `stableSet_eq_biUnion_orbit_localInvariantSet_Ici` (`Analysis/Calculus/Morse/LocalToGlobal.lean:187`), `isMeagre_image_criticalPoints_of_isFredholm` (`Analysis/Fredholm/SardSmale.lean:409`).
- Mathlib `1b1ccf4b`: `LinearMap.det` is 1 when the module has no finite basis, the value the Checks at `README.md:1325–1326` use.

### Duplication and ownership

- **Pinned Tau Ceti against Layers 1–5.** The pin also has `TauCeti.IsMorseOneForm` (`Geometry/Manifold/Morse/OneForm.lean:48`, with local-primitive independence and finiteness of zeros), `TauCeti.periodHom` (`Geometry/Manifold/DeRham/Period.lean:313`) and `Flow.ClosedOrbit` with `multiplicity` and `iterate` (`Dynamics/Flow/ClosedOrbit.lean`), which §§2.1, 2.2 and 5.2 of this README still describe as targets, as it does the Layer 1, 4 and 5 algebra. The open pull request #1854 rewrites exactly these passages to consume the pinned declarations (its README lines 153–200, 232–239, 542–546, 572–578, 1086–1087), and the generated merge-order block of this pull request orders it first (`MorseNovikov`: this pull request → #1854), so #1854 is rebased onto it. As in the previous review, those rewrites are not asked for twice. The docstring of `Suggested.lean` at this head already agrees with #1854's.
- **Headline objects.** No other roadmap on main or at an open head declares `lefschetz_fixed_point_formula`, `poincare_hopf` or the six definitions (the only other hits are main's own MorseNovikov file and #1854's copy of it). The smooth Lefschetz formula and vector-field Poincaré–Hopf have no second owner: CharacteristicClasses on main (`:138–139`) hands the fixed-point index sum to MorseNovikov N6; HeegaardFloer §1.9 (`:1179–1180`) names N7's theorem as a downstream comparison; IndexTheory, SchubertGeometry and GroupActionsOnRiemannSurfaces own the Atiyah–Bott and holomorphic formulas; AlgebraicTopologyPartII (`:421`) and K3SurfacesAndSymplecticBoundedness (`:200`) consume N6.
- **Overlaps file.** One open pull request, #1854, changes this folder and conflicts with it; the order is stated (above). No id is dropped or defined only by a revision, in either direction.

### Cross-roadmap citations resolved (main at `8fe2a7b`)

None of the supplier folders changed on main since the previous review (`git diff --stat 4452ffa 8fe2a7b` over the eleven folders is empty). Re-opened this round:

- GeometricTopology §4.4 (`:2740–2753`): infinite cyclic cover of the exterior, Alexander module `H₁(X∞;ℤ)` over `ℤ[t,t⁻¹]`, Seifert presentation `tV − Vᵀ`, Wirtinger presentation and Fox computation, agreement of the routes up to units, Δ_K as the order. This is what `README.md:194–197` says it consumes. Layers 1, 3, 4 at `:783`, `:1429`, `:1611`.
- HeegaardFloer §1.5 (M.5) `:467`, §1.9 (M.9) `:1162`, §2.8 (F0.6) `:1913`; it lists MorseNovikov as a consumer only (`:54`).
- MorseTheory M1–M4, M6 (`:110`, `:144`, `:453`, `:481`, `:895`); DifferentialGeometry Layers 0–3, 5, 6, 8, 10, 12 (`:268–910`); AlgebraicTopology Stage 4 items 2–3 (`:512–515`); DGFloer Layer 1 item 1 (`:462`); UniversalCovers (Completed) Stage 2 items 7–8 (`:107`, `:111`).
- Consumers that cite this roadmap: DGFloer `:1343`, `:1375`; TaubesGromov `:15`, `:445`, `:451`; CharacteristicClasses `:139`.

### Sources: the seeded sample

The README flags no locator as unverified. Read in the worker's cache: rt3 (file page N is printed page 208+N) and Hat02 (file page N is printed N−9). Fetched through the sources service into a scratch manifest only: rt2 (author's copy of the published paper). rt1 was read from the cache.

| Target | README claim | Text at the locator | Result |
|---|---|---|---|
| 1.2 | cutoff relation and limits rt3 §2.1, p. 220; finite-cover restriction §3.4, pp. 226–227 | rt3 lines 604–614 (file p. 12); §3.4 at line 1043 (p. 226), pushforward and finite-kernel pullback at 1063–1069 (p. 227) | agrees |
| 1.3 | rt3 §1.3, (1.1)–(1.2), Remark 1.4, p. 212 | rt3 lines 162–212 (file p. 4): zeta as an exponential, exp on the rational ring, product (1.2), log by the usual series | agrees |
| 1.4 | cyclic case Example 1.3, p. 211; leading coefficients in the proof of Lemma A.4, p. 240 | rt3 lines 148–153; lines 1900–1931 (the argument at 1925–1927) | agrees |
| 1.5 | critical-lift model rt3 §1.4, pp. 212–213 | rt3 lines 213–224: formal sums finite above each value of the primitive, free over the Novikov ring on chosen lifts | agrees |
| 2.1 | rt3 §1.1, pp. 210–211; §1.4, pp. 212–213; conditions (a), (b) of Definition 1.1, p. 211 | rt3 lines 83–84, 119–124, 231–242 | agrees |
| 2.2 | cover and exactness: Choice 1.2, p. 211 | rt3 lines 133–136: connected abelian cover with exact pullback, a surjection from H₁ onto the deck group with kernel the classes that lift | agrees; the source asserts no injectivity, as the README says |
| 2.3 | Hatcher §1.2, pp. 51–52 | Hat02 lines 2338–2350: N₂ is the Klein bottle, word `aba⁻¹b`, abelianization ℤ ⊕ ℤ/2 | agrees |
| 3.1 | rt3 §1.4, equation (1.3), pp. 212–213 | rt3 lines 225–246 (p. 213): signed counts to all lifts, sign rule, well defined by compactness, square zero | agrees |
| 3.3 | (1.4), p. 213; Example 1.8, p. 215; Lemma 4.1, p. 235, proof p. 236; Remark 4.3, p. 237 | rt3 lines 252–258; 364–376 ("apparently", a sketch); 1634–1663 (no closed orbits, small-perturbation argument); 1712–1714 | agrees |
| 4.2 | Lemma A.4 and proof, p. 240; minimal ideals, p. 240; total-quotient map §1.6, p. 214 | rt3 lines 1900–1931; 1896–1898; 330–335 | agrees |
| 4.3 | Definition 2.6, Lemmas 2.7–2.9, pp. 220–221; proof of Lemma 2.8 fixes the acyclic set | rt3 lines 632, 638, 681, 727 (file pp. 12–13); 706–711 | agrees |
| 5.1 | rt3 §1.1, p. 210 | rt3 lines 67–82: return map, linearization on the normal quotient independent of the section, eigenvalues independent of the point | agrees |
| 5.3 | (1.1)–(1.2), p. 212; Proposition 3.6(a), p. 228; rt2 Definition 1.3, p. 371 | rt3 lines 162–208, 1146–1149; rt2 lines 105–123 (equation (2) has exponent −(−1)^{i₀}) | agrees; the README's dimension caveat is right (Source issues) |
| 6.3 | Lemmas 2.7–2.9, pp. 220–221; §4, Lemma 4.1 and the deduction of Theorem B, pp. 235–236; Example 1.8, p. 215 | as above; rt3 lines 1664–1702; line 365–366 ("classical", citing Milnor) | agrees |
| 7.1 | Appendix B, p. 241; Definition B.1, p. 241; B.3–B.4, pp. 241–242; Milnor §6, p. 35; Turaev 1990 | rt3 lines 1947–1989 (Euler chains with boundary the zero cycle, affine over H₁, nonempty when χ = 0, transport through a transverse section over X × [0,1]); Milnor and Turaev not read | rt3 agrees; the two books are not verifiable |

Beyond the sample: Hatcher Lemma 3.27(b), p. 236 (Hat02 line 10259, file p. 245) and Corollaries A.8–A.9, p. 527 (lines 22832–22845, file p. 536: a compact ENR has finitely generated homology; a compact manifold is an ENR); rt1 Example 1.9 (rt1 lines 80–81).

### Adversarial pass

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `lefschetz_fixed_point_formula` | S¹, z ↦ z̄ | fixed points ±1, df = −1, det(1+1) = 2 > 0 twice: LHS 2; traces 1 and −1: RHS 1 − (−1) = 2 | equal | none |
| same | S¹, z ↦ z² | one fixed point, det(1−2) = −1: LHS −1; RHS 1 − 2 = −1 | equal | none |
| same | ℝP², rotation by θ ∉ {0, π} | one fixed point, det(1−R_θ) = 2 − 2cos θ > 0: LHS 1; rational homology (ℚ,0,0): RHS 1 | equal, nonorientable | none |
| same | three points, two swapped | zero-dimensional det = 1 at the fixed point: LHS 1; trace of the permutation on ℚ³ = 1 | equal | none |
| same | identity of S¹; M = ∅; translation of ℝ | 1 is an eigenvalue, `hnd` fails, nothing claimed; 0 = 0; 0 against 1, excluded by `CompactSpace` | hypotheses needed | none |
| `hnd` through `IsNondegenerateFixedPt` against det(1−df) ≠ 0 | reflection; identity; zero-dimensional E; infinite-dimensional E | det 2 and only v = 0 fixed; det 0 and every v fixed; det 1 and E = 0; `LinearMap.det` = 1 although every v is fixed | equivalent exactly in finite dimension, which the theorem assumes | none |
| `fixedPointSign` under `hnd` | f(x) = 2x conjugated by x ↦ 3x | det(1−2) = −1 before and after | chart-independent at a fixed point | none |
| `poincare_hopf` | S² height gradient | Hessians definite at both zeros, det > 0: LHS 2; Betti (1,0,1): RHS 2 | equal | none |
| same | S¹, sin θ ∂θ; constant field | derivatives 1 and −1: LHS 0; no zeros: LHS 0; RHS 1 − 1 = 0 | equal | none |
| same | ℝP², Morse indices (0,1,2); two points | +1 − 1 + 1 = 1 = 1 − 0 + 0; two zero-dimensional zeros, 2 = b₀ | equal | none |
| same | constant field on ℝ | 0 against 1 | excluded by `CompactSpace` | none |
| `zeroDet`, wrong projection `fst` | any zero | first component of the section's derivative is the identity, det 1 at every zero: T² gradient would give 4 ≠ 0 | `snd` needed | none |
| `rationalBetti` | point; S¹; ℝP²; infinite discrete space | (1); (1,1), sum 0, reduced homology would give −1; (1,0,0), 𝔽₂ would give (1,1,1); `finrank` 0 on an infinite-dimensional H₀ | Checks discriminate; finiteness needs compactness | none |
| `rationalBetti` vanishing above n | Hatcher 3.27(b) with A = M | H_i(M | M) = H_i(M) = 0 for i > n | as claimed | none |
| §1.2 maps | ℤ² → ℤ; ℤ ⊕ ℤ/2 → ℤ; U₂ | 1 + e^(0,1) ↦ 2; pullback of 1 is 1 + g, (1+g)² = 2 + 2g; t² ∈ U₂, t⁻³t² = t⁻¹ ∉ U₂ | as claimed | none |
| §1.3 series | N(k) = −k; partitions | (1−t)(−t⁻¹Σt^(−k)) = 1; coefficient of t⁴ is 5 | as claimed | none |
| §1.4 domain | ℤ/2; a + √2b on ℤ² | (1−g)(1+g) = 0; injective N gives a unique leading term | torsion-free needed | none |
| §2.3 cover | A(s,y) = (s+1,−y), B(s,y) = (s,y+1) | AB = (s+1,−y−1), BA = (s+1,−y+1), equal modulo 2; [a,b] = b⁻²; (1−g)(1+g) = 0 | as claimed | none |
| §3.3 large gradient | cos θ + C⁻¹θ on S¹ | −∇ = (sin θ − C⁻¹)∂θ: two zeros for C > 1, none for C < 1 | as claimed | none |
| §4.1 convention | ℚ →2 ℚ; A₀ = 3, A₁ = 5 | torsion 1/2; new differential 10/3, torsion 3/10 = (1/2)·3·5⁻¹ | as claimed | none |
| §4.2 components | ℤ/2; ℤ/3 | g ↦ (1,−1), 1−g ↦ (0,2); ℚ[x]/(x³−1) = ℚ × ℚ(ζ₃) | as claimed | none |
| §4.4 norm and trace | ℤ ⊃ 2ℤ, s = t² | t has matrix [[0,s],[1,0]], trace 0, det −s; Norm(1−t) = 1−s; Norm(1+ct) = 1 − c²s; Tr(1+t²) = 2+2s | as claimed | none |
| §4.5 two-cell circle | matrix [[−1,t],[1,−1]] | det = 1 − t | as claimed | none |
| §5.3 iterate signs and exponent | λ = 1/2, 2, −2 | signs (+,+,…), (−,−,…), (+,−,+,…); factors (1−t)⁻¹, 1−t, 1+t; exponent −(−1)^(i₊+i₋) = (−1)^(n−i₀) from i₊+i₋+i₀+2c = n−1 | as claimed | none |
| §5.3 Klein-bottle ζ | f(θ) = −θ + ε sin θ | fixed points 0, π only (2θ − ε sin θ increasing); derivatives −1+ε, −1−ε; log ζ = Σt^k/k + Σ(−1)^(k+1)t^k/k, ζ = (1+t)/(1−t); the homological formula gives (1−t)⁻¹(1+t) | consistent with §6.4 | none |
| §6.2 covers | H = ℤ ⊕ ℤ/2, h = (2,1) | d = 2; μ(n,e) = 2n mod 3 sends h to 1; ν(n,e) = n mod 4 sends h to 2 and nh to 0 iff n even; coefficient 4c₂ | as claimed | none |
| §6.4 surgery | unknot; trefoil V = [[−1,1],[0,−1]] | (1−t)⁻²; det(tV − Vᵀ) = (1−t)² + t = t² − t + 1, Conway form t⁻¹ − 1 + t; invariant under t ↦ t⁻¹ up to t² | as claimed, and it is GT §4.4's Seifert route | none |
| §7.1 signs | maximum of ∇f in dimension n | dV negative definite, sign (−1)^n = (−1)^ind; −∇f gives (−1)^(n−ind) | as claimed | none |

## Not verifiable

- **Milnor, *Topology from the Differentiable Viewpoint*, §6, p. 35** (Poincaré–Hopf and the index of a nondegenerate zero, cited at `README.md:1377`, `:1438`, `:1473` and `Suggested.lean:129`). A book with no legal open copy found; cited by locator.
- **Dold, *Lectures on Algebraic Topology*, Chapter VII §6.** A Springer book, not read; the simplicial statement and trace formula were checked in Hatcher in the previous round.
- **Turaev** (the 2001 book and Math. USSR-Izv. 34 (1990)) and **Pajitnov** (2006 book): cited without locators; rt3 Appendices A–B, which were read, cover what §§4.5 and 7.1–7.2 use.
- **Not re-read this round** (outside the sample, unchanged since the previous review read them): Milnor, Whitehead torsion (§4.1) and Hutchings' erratum page (§3.2).
- **Manifest.** The package manifest records rt3, Gra72, Hat02 and Hop29 only; rt1 and rt2 were read from legal author copies and are recorded only in a scratch manifest.

## Source issues

- **Error** in rt2 at equation (2), printed page 371: the source says the product formula's exponent is −(−1)^{i₀(γ)} on closed manifolds of any dimension n; it should be −(−1)^{i₊(γ)+i₋(γ)} = (−1)^{n−i₀(γ)}, which agrees only for odd n; affects a stated result.
- **Misprint** in rt3 at §1.2, printed page 211: the source says the inclusion of the group ring into the Novikov ring is the identity exactly when N vanishes; it should be that the inclusion is onto, hence an isomorphism, exactly when N vanishes; affects nothing.
- **Gap** in rt3 at equation (1.5), printed page 215, and Remark 4.3, page 237: the source says the Euler-refined equality holds but only sketches it, relying on Example 1.8's apparent triangulation-adapted perturbation; it should be proved with a rigorous Example 1.8; affects a stated result.
