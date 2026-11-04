# Review of GeometricTopology (pull request #903 at fbceb3f)

**Verdict:** needs changes

Seven of the eight findings of the previous review are repaired or substantially repaired at this head: the cyclic surgery theorem has one owner, the oriented two-bridge classification carries its parity normalisation, the concordance kernel is a subgroup, the tube and Hopf-annulus Checks compute the right values, the three missing locators are supplied, Palmeira is in the References, and the admitted finite-volume Mostow–Prasad theorem is deleted from the companion file. The one P1 is unchanged and now covers nine names instead of eight: the supplier contract still consumes Tau Ceti declarations that do not exist at the pinned revision, and this head adds a tenth name that does not exist either. The remaining findings are P3.

## Disposition of the previous review

Locations are in `TauCetiRoadmap/GeometricTopology/README.md` unless specified.

| Previous finding | Current passage and disposition |
|---|---|
| R01 (P1), eight missing declarations | **Not repaired.** Line 227: "Every declaration below exists at the pinned Tau Ceti and is consumed as it stands"; lines 248–254 list `normalTubeOfRadius`, `TauCeti.exists_isOpenEmbedding_normalTubeOfRadius`, the new `TauCeti.exists_isOpenEmbedding_normalTubeOfRadius_contMDiff_subset`, `TauCeti.normalFiberBundle`, `TauCeti.normalVectorBundle`, `TauCeti.normalContMDiffVectorBundle`; lines 297, 1607, 1642 `TauCeti.knotExterior`; lines 315, 1289, 1319 `TauCeti.KnotTheory.homflySpecialization`; lines 689 and 708 `TauCeti.IsPLOn.isPiecewiseAffineOn_of_isCompact`. See R01 below. |
| R02 (P2), two-bridge parity | **Repaired.** Lines 1452–1457: "for fractions written with `q, q'` odd … for odd `p` an even `q` is replaced by `q + p` … as oriented knots iff `p = p'` and `q' ≡ q^{±1} (mod 2p)`"; the Check at 1468–1471 computes `3/1` versus `3/7` (isotopic, `7 ≡ 1 (mod 6)`) and `3/1` versus `3/5` (mirror, `5 ≡ −1 (mod 3)`), and normalises `3/4` to `3/7`. Matches Kauffman–Lambropoulou Theorem 3 (`de77c7cf` lines 103–109). |
| R03 (P2), cyclic surgery ownership | **Repaired.** Lines 50–55 (Layer 5 scope): "the statements of Property P, Property R and the cyclic surgery theorem, and the Kanenobu–Murakami criterion derived from the cyclic surgery theorem as stated"; lines 113–118: Part II owns "the cyclic surgery theorem (from Layers 5.2 and 8, through the Culler–Shalen theory …)"; line 1716: "State the cyclic surgery theorem"; lines 1722, 1731–1733 and 1752 consume it "as stated"; line 1547 (Layer 4.13) says "stated there". Lines 66–69 add normal surfaces, the Haken hierarchy and Waldhausen's theorem to the Layer 8 scope bullet. |
| R04 (P2), concordance kernel | **Repaired.** Lines 1788–1790: "whose kernel is the subgroup of smooth concordance classes of topologically slice knots: the class of the unknot is its zero, and its nonzero elements are the classes of the smoothly non-slice topologically slice knots, such as the untwisted Whitehead double of the trefoil". |
| R05 (P2), companions admit Part II targets | **Partly repaired.** `finiteVolumeMostowPrasad` and `finiteVolume_eq_of_piOne_equiv` are deleted from `FiniteVolumeExtension.lean` (its remaining admission, `finiteVolume_pos` at line 60, is a Layer 7.3 target of this roadmap). `LeeFrobenius.lean:7–15` still reads "Suggested rank-two Frobenius forms for GT6 … GT6 owns the deformation and its filtered comparison", while `README.md:123–124` gives the Lee deformation to Part II; the file admits nothing, so the remainder is a form and ownership-statement defect, folded into R02 below. |
| R06 (P3), companion form | **Not repaired.** No companion file changed except the deletion above. See R02 below. |
| R07 (P3), two Checks | **Repaired.** Lines 624–629 (Layer 1.5 Check): injective for `ε ≤ 1`, image `0 < |z| < 2` at `ε = 1`, failure for `ε > 1`, and at `ε = 1` for the closed tube; lines 1199–1205: positive Hopf link `[−1]`, unchanged under reversal since `θ(−x, −x) = θ(x, x)`, negative Hopf link `[1]`. Recomputed below. |
| R08 (P3), locators and Palmeira | **Repaired.** Line 470 (Layer 1.2): Hirsch, Chapter 4, Theorem 6.1; lines 956–958 and 965–966 (Layer 3.2): `Diffeomorph.continuousEval_weakWhitney`, Hirsch Chapter 2 §1, Mathlib `Continuous.isClosedEmbedding`; lines 2567–2572 (Layer 11.1): Hatcher, *Algebraic Topology*, Proposition A.1 and Rourke–Sanderson, Chapter 2; lines 2520 and 2873–2874: Palmeira with pages and Calegari, Theorem 4.38. All four locators checked below. |

No finding was marked "not actionable in this package".

## R01 (P1) — Nine consumed Tau Ceti declarations do not exist at the pin

Re-raised: r5 R01 (r4 R02).

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:227`: "Every declaration below exists at the pinned Tau Ceti and is consumed as it stands"; lines 248–254, 297, 315, 603–605, 689, 708, 1289, 1319, 1607, 1642.

**Claim:** `normalTubeOfRadius`, `TauCeti.exists_isOpenEmbedding_normalTubeOfRadius`, `TauCeti.exists_isOpenEmbedding_normalTubeOfRadius_contMDiff_subset`, `TauCeti.normalFiberBundle`, `TauCeti.normalVectorBundle`, `TauCeti.normalContMDiffVectorBundle`, `TauCeti.knotExterior`, `TauCeti.KnotTheory.homflySpecialization` and `TauCeti.IsPLOn.isPiecewiseAffineOn_of_isCompact` are supplied by Tau Ceti.

**Witness:** `lake-manifest.json` pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`, the same pins the previous review read. A whole-source search of both (every `.lean` file, by last name component) returns no hit for any of the nine. Every other backticked qualified name in the README (218 extracted mechanically) resolves. What exists: `TauCeti.normalTube` (`Geometry/Manifold/TubularNeighborhood/Euclidean.lean:273`, strict `‖p.2‖ < ε`) and `TauCeti.exists_isOpenEmbedding_normalTube` (compact source); `LowDimTopology/SolidTorusNeighborhood/` holds only `Basic.lean` and `Sphere.lean`; `TubularNeighborhood/` holds `Basic`, `DiscSphere`, `Euclidean`, `NormalFrame`, `WholeBundle` and no `VectorBundle.lean`. The repair round added a tenth name, `…_contMDiff_subset` (lines 250–251 and 604), to the same block instead of removing the block.

**Repair and retest:** For each name, cite the pinned declaration that actually carries the fact (the compact-source tube theorem; the Temperley–Lieb Markov trace for the HOMFLY specialization, if that is the intended object), or make the construction a target of this roadmap with its hypotheses (the radius-function tube and the normal bundle instances in Layer 1.5, the compact exterior in Layer 5.1 from the tube of 1.5 and the complement of 1.2, the PL inverse on compact pieces in Layer 1.7), or declare a supplier gap against Tau Ceti. Delete line 227 or make it true. Retest: the nine-name search returns zero hits at the pin and every remaining backticked `TauCeti.*` name resolves.

## R02 (P3) — The 25 companion files still violate the Lean form rules

Re-raised: r5 R06 (r4 R22), with the remainder of r5 R05.

**Location:** `ExchangeFamily.lean:92–103` (12 `#print axioms`), `RealAlgebraicRealization.lean:53–57` (5), `SimplicialLinks.lean:88–94` (7); `import Mathlib.<submodule>` lines in `BrunnianBraidTargets.lean`, `CompositeKnotGeneratorTargets.lean`, `IndexedDoublingTargets.lean`, `JonesCyclotomicTargets.lean`, `KnotGrowthTargets.lean`, `KnotMixedCycleTargets.lean`, `LeeFrobenius.lean`, `MarkedAlexanderMinorTargets.lean`, `TorusKnotTargets.lean`, `TrefoilMirrorTargets.lean`, `TwoTangleSkeinTargets.lean` (31 lines in 11 files); namespaces `TauCetiRoadmap.GT4Exchange` (`ExchangeFamily.lean:8`), `GT7FiniteVolume` (`FiniteVolumeExtension.lean:19`), `GT7RealAlgebraic` (`RealAlgebraicRealization.lean:12`); process labels "GT4", "GT6", "GT1" (`KnotMixedCycleTargets.lean:5`, `CrossingChangeTargets.lean:9`, `LeeFrobenius.lean:7–15`, `TorusKnotTargets.lean:143`); `FiniteVolumeExtension.lean:7–10` uses `module` and `public import`.

**Claim:** The Lean form rules apply to every `.lean` file in the folder. These files are API catalogues and calculation certificates (78 admitted declarations across them, `TorusKnotTargets.lean` alone 16, `SeifertFamilyTargets.lean` 11) whose statements have no README counterpart, and `LeeFrobenius.lean:14–15` asserts an ownership ("GT6 owns the deformation") that `README.md:123–124` assigns to Part II.

**Witness:** The commands, imports and docstrings quoted above; `README.md` names none of the companion declarations; `git diff` since `585080b` touches no companion except the 32-line deletion in `FiniteVolumeExtension.lean`.

**Repair and retest:** Delete the companion files from the folder; keep any mathematics worth keeping as README targets or Checks (never prove padding in place). Retest: the folder contains `README.md`, `Suggested.lean` and the generated status files only, and the gate's import and command scanners, run on every `.lean` file, report zero.

## R03 (P3) — Brown's 1960 theorem has a second claimant in an open pull request

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:819–822` (Layer 2.2): "Prove Brown's theorem: for `n ≥ 1` and a bicollared embedding of `Sⁿ⁻¹` in `Sⁿ`, each of the two complementary domains has closure homeomorphic to `Dⁿ` … (Brown, Bull. Amer. Math. Soc. 66 (1960), Theorems 4 and 5)".

**Claim:** This roadmap owns the proof of the generalized Schoenflies theorem.

**Witness:** `TauCetiRoadmap/MorseTheory/README.md` at the head of its open pull request, lines 70–73: "this roadmap owns Brown's bicollared generalized Schoenflies theorem as the input of M4.1, while GT Layer 2 keeps local flatness, codimension-one collaring and the annulus theorem", and lines 619–631 plan the same proof (Brown 1960, Theorems 0–5). MorseTheory is not in the merge order; it names GeometricTopology Layers 1 and 2 as suppliers, so it is placed after this roadmap. By the single direction of supply the earlier roadmap, this one, is the owner: Layers 2.3 (annulus theorem for `n + 1 ≤ 3`), 4.9 (decomposing spheres) and 8.1 consume Layer 2.2, and a roadmap never cites a later one. The conflict is therefore MorseTheory's to resolve, not a defect of Layer 2.2, and is recorded here so that the two pull requests do not merge with two owners.

**Repair and retest:** In the *Downstream consumers* section add Layer 2.2 to MorseTheory's line ("consumes Layer 1 and Layer 2.2's generalized Schoenflies theorem"), so that the ownership is stated on this side. Retest: a grep of both READMEs for "generalized Schoenflies" shows one "prove" and one "consume".

## R04 (P3) — Kondo locator names the wrong displayed equation

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:1542–1543`: "the knot is a normal form built from one unknotting band with integer parameters solving the linear system of equation (8)"; line 2823: "Theorem 3 and equation (8)".

**Claim:** The parameters of Kondo's normal form solve equation (8).

**Witness:** `kondo1979` lines 258–277 (Osaka J. Math. 16, pp. 558–559): equation (8) is the formula for the Alexander polynomial of the normal-form knot in terms of the band linking numbers; the integers `a₀, …, a_{n−1}` are "a solution of the linear equations (*)" (line 262), and (8) is what shows that the solution gives the prescribed polynomial (line 267). Theorem 3 is at line 269 as cited.

**Repair and retest:** Write "solving Kondo's linear system (*), through his formula (8)". Retest: the two displayed labels on pp. 558–559 are cited for what each states.

## Verified sound

Read: the whole README (2881 lines), `Suggested.lean`, all 25 companion files, the previous review's eight findings, the change set and the folder's `PROGRESS.md`, `STATUS.md` and `metadata.toml` (unchanged from main). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GeometricTopology'` is empty: no change outside the folder.

**Gate and elaboration.** The worker's gate at this head reports every check zero and `OK`. Independently, `lake env lean` on `Suggested.lean` exits 0 in 3 s with exactly the 14 `declaration uses sorry` warnings at lines 62, 69, 74, 81, 88, 93, 98, 104, 110, 121, 132, 138, 142, 153, and nothing else. The file is byte-identical to the previous head. A scratch copy with every `sorry` replaced by `first | simp | rfl | infer_instance | exact?` leaves all 14 goals open (errors at lines 63, 70, 75, 82, 89, 94, 99, 105, 117, 127, 133, 139, 146, 154): no headline is padding. A scratch copy with `#check @name` for the 14 declarations elaborated once; every printed type agrees with its README statement and no binder is dropped (`poincare_conjecture` keeps `CompactSpace`, `T2Space`, `SecondCountableTopology`, `SimplyConnectedSpace`; `smoothAmbientIsotopic_unknot_of_knotGroup` keeps the basepoint `x` in the complement and the `Multiplicative ℤ` isomorphism; `gordon_luecke` keeps the complement homeomorphism; `manolescu_triangulation_conjecture_false` keeps `5 ≤ n`).

The dependency check returned exactly:

```text
depcheck: 208 roadmaps, 1461 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE` or `moved:` line. The `*Needs:*` graph was walked by hand at the target level: the early edges stated under *How to read the build* (1.4→3.3→1.5, 4.4→5.1→{1.2, 1.5, 3.3, 4.1}, 1.8→11.3→{1.7, 11.1}, 2.3→11.2→{1.7, 11.1}, 5.4→{8.2, 8.4}→{8.1, 8.3}→11.2, 7.3→{5.2, 8.2}) are acyclic, and the five layer-level dependencies that look reciprocal (4↔5, 8↔11, 7↔8) are all broken at the target level as the paragraph says.

**Pins.** `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Every backticked qualified name in the README (218) was extracted mechanically and searched at both pins; all resolve except the nine of R01. New names this round, opened at the pin: `Continuous.isClosedEmbedding` (`Mathlib/Topology/Separation/Hausdorff.lean:685`, hypotheses `[CompactSpace X] [T2Space Y]`, continuous and injective, as the README says); `Diffeomorph.continuousEval_weakWhitney` (`Geometry/Diffeomorphism/Evaluation.lean:37`); `TauCeti.normalTube` (`Euclidean.lean:273–274`, strict inequality, which the repaired Check at lines 624–629 now relies on). Headline carriers re-opened: `TauCeti.AnnulusConjecture`, `SmaleConjecture`, `WatanabeTheorem`, `FreedmanSliceTheorem`, `MostowRigidity`, `VirtualFiberingConjecture`, `VirtualHakenConjecture`, `IsSphereBoundsBall`, `JSJTheorem`, `GeometrizationConjecture`, `TriangulationConjecture`, with the hypotheses recorded in the previous review (closed connected orientable with `IsSphereBoundsBall` for JSJ and geometrization; closed connected hyperbolic for Agol; compact Hausdorff charted for triangulation).

**Cross-roadmap citations.** DifferentialGeometry (*Boundary and corners* at line 63; Layers 3, 4, 5, 12 at lines 371, 402, 503, 910), HopfRinow (Layers 1–3 at lines 244, 407, 431) and TypeAHeckeAlgebras (H1 at line 40, H2 at line 143) resolve on main. SurfaceTopology Layers 8 and 9 (lines 860, 943) and PlanarTopology Layers 5, 7, 8 (lines 617, 787, 870) are not on main: they are new roadmap folders in another author's open pull request (#271, with the planar and surface roadmaps), which the brief permits as suppliers; the README cites them by name and layer, never by number. The worker's citation check found nothing missing; this review found nothing new. The depcheck accepts both (not in the merge order, placed after their suppliers).

**Ownership by object.** Searched with the roadmap grep across main and the 440 open heads: Heegaard genus, Dehn filling, Seifert fibrations, the concordance group, the Smale conjecture, Reeb components, Kneser finiteness, Gordon–Luecke and the Hauptvermutung occur only in this roadmap (on main and in the pull requests that carry copies of its README) and, for the Hauptvermutung and Schoenflies in dimension two, in PlanarTopology, which this roadmap cites. FourManifolds (in the merge order, line 119, before this roadmap by the brief's list) is cited for the four-dimensional annulus theorem and Freedman's proof, as the README says. The one conflict found is R03. Ownership against open pull requests whose files the brief does not give was checked only through the grep tool, not by reading.

**Seeded locator audit (15 targets).** Cached texts are cited by their first eight hex characters or the id assigned at fetch.

| Sample | Text at locator and outcome |
|---|---|
| 1.7 PL manifolds | No source locator; the target consumes four Tau Ceti names, three of which resolve (`PLGroupoid`, `IsPLOn`, `IsPiecewiseAffineOn`) and one of which does not (R01). `doubleRight_mem_PLGroupoid` at `PLGroupoid.lean:172`. |
| 2.2 Schoenflies | `brown1960` (Bull. AMS 66, fetched from the publisher's open archive): Theorem 4 at lines 84–85 (two inverse sets are cellular), Theorem 5 at lines 101–103 (closure of either complementary domain of `h(Sⁿ⁻¹ × ½)` is an `n`-cell). Supports the statement; the boundary-parametrisation clause is the standard coning extension. Ownership: R03. |
| 4.4 Alexander | Lickorish Theorems 6.5 and 8.6 uncertified (paywalled); the identities recomputed in the table. |
| 4.6 HOMFLY | `fyhlmo1985` lines 54–60: homogeneous Laurent polynomials of degree 0 in `x, y, z` with `x P₊ + y P₋ + z P₀ = 0`, exactly the README's normalisation. Lickorish Chapter 15 uncertified. |
| 4.8 crossing and braid numbers | `franksWilliams1987` Theorem 2.2 lines 356–368 and the remark on Corollary 2.4 at line 489 (the braid-index bound); `armondLowrance2017` Theorem 1.1 lines 75–76 and §2 for the Turaev surface; Turaev 1987 and Morton 1986 not readable. |
| 4.10 rational knots | `de77c7cf` Theorem 3 lines 103–109: `q, q'` odd, `q ≡ q'` or `q q' ≡ 1 (mod 2p)`. The repaired text matches. |
| 4.11 torus knots | Schubert 1954 not readable; the coordinate isotopies recomputed. |
| 4.13 Kondo | `kondo1979` (institutional copy, Osaka University repository): Theorem 3 at lines 269–277; equation (8) at line 258, system (*) at line 262 (R04). |
| 5.2 Dehn filling | Lickorish Chapter 12 and Rolfsen Chapter 9 uncertified; the Hopf-link and unknot fillings recomputed. |
| 6.4 Freedman, Levine | `levine2016` abstract lines 9–13 and §1 lines 24–30: pattern `P` generating `H₁`, `P(K)` not smoothly slice in any homology ball, a knot in a homology sphere bounding no PL disc. Freedman 1982: Project Euclid returned only a landing page, not verifiable; Freedman–Quinn 11.7B uncertified. |
| 8.1 Dehn's lemma, sphere theorem | `c8add1a8` Theorem 1.1 line 57, Corollary 3.2 (Dehn's lemma) line 2114, Theorem 3.8 (sphere theorem) lines 2219–2224: for orientable `M` an embedded `S²` nontrivial in `π₂`, as the README states. |
| 8.4 Seifert fibred spaces | `c8add1a8` Proposition 1.12 lines 707–709, Proposition 1.13 line 811, Theorem 2.3 lines 1260–1266 (all five exceptional families, matched clause by clause); `369fa395` §3 invariants lines 1518–1613. |
| 8.6 geometrization | `thurston1982` Conjecture 1.1 referenced at lines 83–96; `267c8382` Corollary 0.2 lines 189–191 (previous round); Scott §4 for the six Seifert geometries. |
| 10.1 foliations | `4827ccaf` Theorem 4.5 lines 5900–5902 (a sphere leaf forces `S² × S¹` with the product foliation; the README's finite-`π₁` hypothesis reduces to it by the classification of surfaces, since a leaf of a transversely oriented foliation of an orientable manifold is orientable), Theorem 4.35 lines 6702–6707, Theorem 4.38 lines 6916–6918, §4.6 at line 6652. Lickorish 1965 not readable. |
| 11.5 collapse and Zeeman | Zeeman 1964 not readable (Topology, paywalled); the pinned `TauCeti.ZeemanConjecture` and `Contractible2Complex` resolve; the dunce-hat Checks recomputed. |

Also checked this round: Hirsch (`3d4722b4`) Chapter 4 Theorem 6.1 line 4560 (collars), Chapter 2 §1 lines 1525–1526 (strong equals weak for compact `M`), Theorems 5.3, 6.3, 6.6 lines 4503, 4587, 4670, Chapter 8 Theorems 1.3 and 3.1 lines 7042, 7250; `hatcherAT` Proposition A.1 lines 22534–22535; `c8add1a8` Basic Fact lines 233–236, Proposition 1.7 lines 522–525, Theorem 1.9 lines 628–631; `8af39754` (Moser) lens-space formula `L(|q|, p s²)` lines 21, 191, 237 in Moser's convention, which is the README's `L(p, 9q)` for `T(2, 3)`.

**Adversarial values.** One row per sampled target, headline or passage a finding touches; "consistent" is not "proved".

| Statement | Instances | Values computed | Result; change |
|---|---|---|---|
| 1.1 collars | `[0,1]`; disc; `S¹`; constant map | images `[0,½) ∪ (½,1]`, `0 < |z| ≤ 1` open; `∂S¹ = ∅` vacuous; `(x,t) ↦ x` not open | Consistent |
| 1.2 complements | `ℝ ∖ (−1,1)`; `ℝ² ∖` disc; `Sⁿ ∖` ball | 2 components vs 1; `Dⁿ` by stereographic projection | Consistent; locator now Hirsch 6.1 |
| 1.4 connected sum | `T² # T²`; `ℂP² # ±ℂP²`; `ℝ # ℝ` | `χ = 0 + 0 − 2 = −2`; forms `diag(1,1)`, `diag(1,−1)`, signatures 2, 0; 2 components | Consistent |
| 1.5 tube Check | unit circle, strict tube | `x(1+s)`, `−ε < s < ε`: injective for `ε ≤ 1`, image `1−ε < |z| < 1+ε`; `ε = 1`: `0 < |z| < 2`; `ε > 1`: `(x, −x) ↦ 0` for all `x`; closed tube at `ε = 1`: `(x,−x) ↦ 0` | Repaired |
| 1.6 Whitney move | `d = 4` | Whitney disc need not embed; excluded by `d ≥ 5` | Consistent with Milnor 6.6 |
| 1.7 PL | `x ↦ x + x³`; `x ↦ x³` | not affine on any interval; inverse `x^{1/3}` not differentiable at 0 | Consistent |
| 1.8 genus | torus; genus-one, `b = 1`; disc | `(2−0−0)/2 = 1`; `(2+1−1)/2 = 1`, `rank H₁ = 2`; `(2−1−1)/2 = 0` | Consistent |
| 2.2 Schoenflies | round sphere; horned sphere | two round balls; not bicollared, excluded | Consistent; ownership R03 |
| 2.3 annulus headline | `n = 0`, points `±1`, `±2` | `[−2,−1] ∪ [1,2] = S⁰ × I`; pinned `coboundAnnulus_smul_coe_sphere` | Consistent |
| 3.1 topologies | `f_k = θ + k⁻² sin kθ` | `f_k' = 1 + k⁻¹ cos kθ > 0`; `sup|f_k − id| = k⁻²`, `sup|f_k' − 1| = k⁻¹`, `f_k'' = −sin kθ`, sup 1 | Consistent |
| 3.2 families | `F_k = e^{i sin(kθ)/k} z`; reflection | angle `≤ 1/k`; `∂_θ F_k(0, z) = iz`, norm 1; conjugation degree `−1`; `O(n+1)` compact, `Diff(Sⁿ)` Hausdorff | Repaired; `Continuous.isClosedEmbedding` hypotheses match |
| 3.4 Smale, Watanabe headlines | `O(4)`; `A₂ = ℚ` | `π₀ O(4) = C₂`, `π₁ SO(4) = C₂`, `−I ∈ SO(4)`; first nonzero class in degree 2 | Statement only; proofs Part II / elsewhere |
| 4.1 knot types | square vs granny; trefoil vs mirror | `Δ = (t−1+t⁻¹)²` both, `σ = 0, −4`; `V = t+t³−t⁴` vs `t⁻¹+t⁻³−t⁻⁴` | Consistent |
| 4.3 Seifert form | trefoil; figure-eight; Hopf annulus | `V − Vᵀ = [[0,1],[−1,0]]`, det 1; `[[1,1],[0,−1]]`; annulus: `lk(∂₁,∂₂) = −lk(c, c_A)`, so positive Hopf (`lk = +1`) has `θ(c,c) = −1`, `θ(−c,−c) = θ(c,c)`; trefoil diagonal `−1, −1` | Repaired |
| 4.4 Alexander | `T(2,n)`, `n = 0,…,3`; `Δ(−1)` | `Σ_{j<n}(−t)^j = 0, 1, 1−t, 1−t+t²`; value `n` at `t = −1`; `V+Vᵀ ≡ V−Vᵀ (mod 2)`, det odd | Consistent |
| 4.5 Jones | Hopf, trefoil by skein; reversal | `V(H) = t(t^½−t^−½) − t²(t^½+t^−½) = −t^½ − t^{5/2}`; `V(T) = t² + t(t^½−t^−½)(−t^½−t^{5/2}) = t+t³−t⁴`; reversed Hopf `−t^−½−t^{−5/2} = t^{−3·1} V(H)` | Consistent |
| 4.6 HOMFLY | trefoil skein; specialisations | `P(H) = vz + (v−v³)/z`, `P(T) = v² + vz·P(H) = 2v²−v⁴+v²z²`; `x = t⁻¹, y = −t, z = t^−½−t^½` gives `t⁻¹V₊ − tV₋ = (t^½−t^−½)V₀`; `x = 1, y = −1` gives Conway's relation; `P_H(1,−1,w) = −w`, `Δ_H = t^½ − t^−½` | Consistent |
| 4.7 colourings, Arf | trefoil mod `1, 3, 6, 7`; `6₁` | `1, 9, 6·1·3 = 18, 7`; `det 6₁ = 9 ≡ 1 (mod 8)`, Arf 0 | Consistent |
| 4.8 span, MFW | `U₂`, `U₃`; trefoil `σ₁³`; `T(3,4)` | spans `1 = 0+2−1`, `2 = 0+3−1`; `k = 2, w = 3`: `v`-exponents in `[2,4]`, `P(T)` has `v², v⁴`; `span V = 5 < 8` | Consistent |
| 4.8 Turaev genus | `g_T = (2 + n − s_A − s_B)/2`; band sum of two alternating diagrams | `s_A(D₁#D₂) = s_A(D₁)+s_A(D₂)−1`, likewise `s_B`, `n` additive: `g_T(D₁#D₂) = g_T(D₁)+g_T(D₂)` | Consistent |
| 4.10 two-bridge | `3/1` vs `3/4`, `3/7`, `3/5`; `5/2` vs `5/3`; `7/2` vs `7/3` | `4 ≡ 1 (mod 3)` same unoriented; `4 ≢ 1^{±1} (mod 6)` so parity normalisation needed; `7 ≡ 1 (mod 6)` isotopic; `5·1 ≢ 1 (mod 6)`, `5 ≡ −1 (mod 3)` mirror; `2·3 ≡ 1 (mod 5)`; `3 ≢ 2^{±1} (mod 7)` | Repaired |
| 4.11 torus knots | `T(p,−q)`, `T(−p,−q)`, `T(1,q)` | `(u^p, ū^q)` is the reflection image; `(u^{−p},u^{−q}) = T(p,q)(u⁻¹)`, the reverse; isotopy `(√(1−s²)u, s u^q)`, `0 ≤ s ≤ 2^{−½}`, each slice injective in the first coordinate | Consistent |
| 4.12 Garside | `σ₁σ₂⁻¹` | `Δ₃σ₂⁻¹ = σ₂σ₁`; `σ₁Δ₃⁻¹ = Δ₃⁻¹σ₂`; normal form `Δ₃⁻¹·σ₂·σ₂σ₁`, `F(σ₂) = {2} ⊇ S(σ₂σ₁) = {2}` | Consistent |
| 4.13 Kondo | `Δ_k = 1 + (−1)^{k−1}(t+t⁻¹−2)^k` | symmetric, `Δ_k(1) = 1`, span `2k ≤ 2g` | Consistent; locator R04 |
| 4.14 counting | `n = 4,…,7`; `n = 3` upper bound | `(2^{n−2}−1)/6 = ½, 7/6, 5/2, 31/6` vs `1, 2, 3, 7`; `4·16^{2n}` from `Catalan(s)·Catalan(s+1) ≤ 4^s·4^{s+1}`, `s = 2n` | Consistent |
| 5.2 fillings | Hopf framings `(0,0),(0,n),(1,1),(3,2)`; trefoil `±1` | `ab − 1 = −1, −1, 0, 5`: `S³, S³, S¹×S², L(5,2)`; `Σ(2,3,5)` vs `Σ(2,3,7)` | Consistent |
| 5.3 Mathieu | `k = 0` | slopes `9/1`, `9/2`; multiplicities `2, 3, |9−6| = 3` and `|9−12| = 3`; `H₁ = ℤ/9` | Consistent |
| 5.4 Moser, Kanenobu–Murakami | `T(1,2)` at 5; trefoil at `5, 6, 7`; `8₃ = 17/4` | `|5−2| = 3` yet `L(5,1)`, excluded by `|r|,|s| ≥ 2`; `|p−6q| = 1, 0, 1`: `L(5,9) = L(5,4)`, `L(2,1)#L(3,1)`, `L(7,9) = L(7,2)`; `17 = 2mn ± 1` gives `(m,n) ∈ {(4,2),(8,1),(9,1),(3,3)}`, `2n², 2m² mod 17 ∈ {8, 15, 2, 9, 1}`, none `≡ 4^{±1} = 4, 13` | Repaired ownership; values consistent |
| 6.1 kernel | unknot; Whitehead double of trefoil; square knot | unknot in kernel (zero); double nonzero in kernel (`τ = 1`); square knot slice, `Δ ≠ 1` | Repaired |
| 6.2 signatures | trefoil; figure-eight; `ω = e^{iπ/3}`; `−1 ∈ S¹_!` | `V+Vᵀ = [[−2,1],[1,−2]]`, `σ = −2`; `[[2,1],[1,−2]]`, det `−5`, `σ = 0`; `t²−t+1 = 0` at `e^{±iπ/3}`, one-sided `0, −2`, mean `−1`; `p(−1) ≡ p(1) (mod 2)` | Consistent |
| 6.4 Freedman headline | unknot; trefoil | perfect commutator, slice; `Δ ≠ 1`, `σ = −2`, not slice | Consistent |
| 7.1 quotients | genus 2; cusp end | area `2π·2 = 4π`; `∫₀^∞ A e^{−2t} dt = A/2` | Consistent |
| 7.2 Mostow headline | genus-2 surface | `6g − 6 = 6` moduli; excluded by `n ≥ 3` | Statement only; proof Part II |
| 7.3 finite volume | Gieseking; empty manifold; cusp | `v₃ = 1.0149…`, Klein-bottle cusp; volume 0; `T² × [0,∞)` finite, non-compact | Consistent |
| 7.4 Weeks, Agol headlines | `(5,1),(5,2)` filling; `S³` | `0.9427… < 1.0149… < 2.0298…`; `H₁ = (ℤ/5)²`; `π₁(S³)` finite, not hyperbolic | Consistent |
| 8.1 headlines | equatorial `S²`; unknot vs trefoil; granny vs square | two balls; `ℤ` vs `⟨x,y ∣ xyx = yxy⟩` with `S₃` quotient; equal groups, `σ = −4, 0` | Consistent |
| 8.2 finiteness | `N` parallel spheres in `S²×S¹`; small spheres in `T³` | complements `S² × [0,1]`, punctured spheres; `π₁`-injective but excluded as spheres | Consistent; Basic Fact lines 233–236 |
| 8.4 Seifert | `ℝP³ # ℝP³`; `T³` vs `K × S¹`; sphere in `T³` | `π₁ = C₂ ∗ C₂`, reducible; orientation characters `0` vs nonzero; `χ = 2 ≠ 0`, not essential | Consistent; Theorem 2.3 exceptions complete |
| 8.5 JSJ headline | `T³`; Anosov bundle; two trefoil exteriors glued `μ ↔ λ` | 0 tori; 1 torus; fibre slopes `6` and `1/6` differ | Consistent |
| 8.6 geometrization, Poincaré | `S³`; Poincaré sphere; `S¹×S²` | empty decomposition; `|π₁| = 120`; `π₁ = ℤ`, not irreducible, excluded by `IsSphereBoundsBall` | Consistent |
| 9.2 genus | `L(1,q)`; Poincaré sphere; `T³` | genus 0; `g = 2 = rank`; `g = 3 = rank ℤ³` | Consistent |
| 10.1 Reeb stability | orientable leaf with finite `π₁`; Reeb foliation | `χ = 2`, leaf `S²`; torus leaf compressible, no closed transversal through it | Consistent with Calegari 4.5 |
| 10.2 Novikov–Rosenberg | `S²×S¹`; `L(p,q)`; `S³` | taut product foliation, reducible, universal cover `S²×ℝ`; finite `π₁`, no taut foliation; Reeb foliation only | Consistent |
| 11.1 join law | one edge `e`; vertex of triangle | `Lk(e) = ∅`, `∂e ∗ ∅ = S⁰`; `Lk = S⁰`, cone on `S⁰` | Consistent; Hatcher A.1 |
| 11.3 triangulations | `ΣP`; `Σ²P`; `E8 × S¹` | punctured-vertex `π₁` of order 120; `≅ S⁵`, non-combinatorial; triangulable, non-PL | Consistent |
| 11.4 Manolescu headline | `n = 5`; `n = 0` | non-orientable examples only, no orientability clause; `TriangulationConjecture 0` holds | Consistent |
| 11.5 collapse | triangle boundary; dunce hat; vertex cylinder | no free face, `χ = 0`; contractible, no free face; interval | Consistent |

**Headline coverage.** The README's fourteen statable headlines (annulus, Smale, Watanabe, Freedman, Mostow, virtual fibering, virtual Haken, Alexander, knot-group, Gordon–Luecke, JSJ, geometrization, Poincaré, Manolescu) are all in `Suggested.lean`; the docstring names Li, Weeks, Property P, Property R, the cyclic surgery theorem, Kondo, Cerf, Kneser–Milnor and Novikov–Rosenberg as not statable with the missing carrier, and Zeeman as open. Searches at the pin confirm no Dehn filling, Heegaard genus, Weeks manifold, geometric Alexander polynomial, unknotting number, orientation-preserving predicate on `Diff(S³)`, connected sum of manifolds or transverse orientation of a foliation.

**Policy.** No `set_option`, no `lemma`, no pull-request number, no process narrative and no LaTeX delimiter in the README or in `Suggested.lean` (gate scanners zero; confirmed by grep). The README's generality equals the Lean's for every headline. The companions are the subject of R02.

## Not verifiable

Paywalled or unlocated texts, cited by locator only: Lee (both books), Lickorish, Burde–Zieschang, Rolfsen, Birman, Moise, Munkres, Rourke–Sanderson, Ratcliffe, Brown 1962, Kirby 1969, Quinn, Smale 1959, Cerf 1961/1968, Schubert 1954/1956, Hashizume, Garside, Epstein et al., Elrifai–Morton, Scharlemann 1985, Kanenobu–Murakami, Ernst–Sumners, Morton 1986, Turaev 1987 (L'Enseignement, not found by the service), Gabai 1987, Mathieu, Culler–Gordon–Luecke–Shalen, Gordon–Luecke, Freedman 1982 (Project Euclid returned a landing page without text), Freedman–Quinn, Mostow, Prasad, Papakyriakopoulos, Milnor 1962/1965, Waldhausen (both), Jaco–Shalen, Johannson, Perelman, Novikov, Lickorish 1965, Palmeira, Zeeman, Seifert 1933, Reeb, Hatcher 1983, Piccirillo (not re-read), Kronheimer–Mrowka (not re-read). The texts fetched this round through the sources service are listed in `needs-references.toml` only where the service found nothing; no manifest was edited and no source was copied.

## Source issues

- none
