# Review of HeegaardFloer (pull request #957 at 0f45b88)

**Verdict:** needs changes

The six findings of the previous review were reconsidered against this head before the full review. No repair report marking a finding "not actionable in this package" exists in the package's reports; the last two reports there are the two AI reviews.

| Previous finding | Passage at this head | Disposition |
| --- | --- | --- |
| R01 (P1), reversed Spinᶜ difference | `README.md:2700`, "prove s_z(y)−s_z(x)=PD(ε(x,y))"; `:2704`, "s_(z₂)(x)−s_(z₁)(x)=α_i*" | Repaired. Both signs now agree with os-disks line 646 and line 650 (Lemma 2.19, pp. 16–17); the order-three torus Check at `:2766` computes 2=2, 1=1, 0=0. |
| R02 (P1), reciprocal suppliers | `:2104`, "Consume AnalyticStableMaps §0.5"; `:2118`, "Consume M0.1's"; `:3024`, "AnalyticStableMaps M0–M3"; `:815`, "Consume DGFloer1.3's"; `:921`, "Consume DGFloer1.2's"; `:1541`, "MorseNovikov N5's early return-map clause" | Not repaired. Only the label "M0.1" at `:2000` and `:2104` was renamed "§0.5"; every reciprocal pair remains, and a fourth one (ConvexityToric) is present. R01 below. |
| R03 (P1), stale AnalyticStableMaps contract | `:2118`, "Consume M0.1's simple/somewhere-injective equivalence"; `:3024`, "M0–M3: normalized labelled nodal domains" | Partly repaired. Two of four citations were renamed; "M0.1" and "M0–M3" remain, and the supplied head says this roadmap consumes nothing from it. R02 below. |
| R04 (P3), calibration padding | `TorusBottShearTargets.lean:30`; `NonorientableBottModuliTargets.lean:28`; the circle, Klein-bottle and four-dimensional files | Not repaired. The five companion files are byte-identical to the previous head. R03 below. |
| R05 (P3), locators | `:322`, "Hutchings, §4.1–4.2, Lemmas 4.1–4.3"; `:924`, "Hutchings, §3, Exercises 2, 4 and 5"; `:2650`, `:2700`, `:2721`, `:2795`, `:3115` | Partly repaired. M.5, M.9, F4.A–C and F5.2 now carry exact locators, all verified below. F5.4–F5.6, F2.6b and F3 still have none, and there is no `sources.toml`. R04 below. |
| R06 (P3), shape, APIs, Checks | `:161`, "Lane M"; `:2753`, "The comparison API includes"; `:3174`, "use the following APIs" | Partly repaired. F4.B and F5.2 received API bullets, three Checks and a `*Needs:*` line. The README has seven `*Needs:*` lines and seven Checks lists in 3,626 lines, no `## Layer`, `### Examples`, `### Dependencies` or `## Downstream consumers`. R05 below. |

## R01 (P1) — Reciprocal supplier contracts with four roadmaps still prevent a merge order

Re-raised: R02 of the previous review (no repair report addressed it).

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:2104`, "Consume AnalyticStableMaps §0.5's arbitrary-genus nonconstant closed-curve factorization"; `:815`, "Consume DGFloer1.3's independent filtered-complex algebra"; `:921`, "Consume DGFloer1.2's multiplicative cohomological Serre sequence"; `:1541`, "the local section/basepoint conjugacy germ in MorseNovikov N5's early return-map clause"; `:802`, "Separately consume ConvexityToric T2's compact moment-map negative-bundle attachment".

**Claim:** these four roadmaps are suppliers of HeegaardFloer.

**Witness:** each of them consumes HeegaardFloer. AnalyticStableMaps at its supplied head (rev/987 `README.md:68`, "### From TauCetiRoadmap.HeegaardFloer"; `:137`, "*Needs:* HeegaardFloer Lane F1 item 2, Lane F2 item 2"; `:1093`, "HeegaardFloer consumes nothing from this roadmap"). DGFloer on main (`README.md:113`, `:1148`, "Consume HeegaardFloer F0 and F1.1–5"; `:1167`, "Consume HF Lane M"). MorseNovikov on main (`README.md:48`, supplier row "HeegaardFloer Lane M,F0"; `:390`, "Consume HeegaardFloer M.5"). SymplecticGeometry/ConvexityToric on main (`README.md:20`, "ordinary Darboux/Moser from HeegaardFloer"). With h, a, d, m, c the merge positions, the cited contracts require a<h<a, d<h<d, m<h<m and c<h<c: no order satisfies them.

The dependency check reports `depcheck: 208 roadmaps, 1457 edges, 0 problem(s)` with no UPWARD, CYCLE or moved line. That is not a false positive of the tool: it reads `*Needs:*` lines and contract headings, and this README names these four roadmaps only in prose consumption sentences. The binding contract is the text.

**Repair:** move ownership so that each pair has one direction. Keep the early Morse/analytic foundation (M.0–M.5, F0–F2) here, as the four roadmaps already consume it, and move the consumers of AnalyticStableMaps (the F2.6b and F5.0 normalization and nodal-domain inputs), of DGFloer (M.8's filtered-complex algebra and Serre comparison), of MorseNovikov (the F0.6 return-germ conjugacy) and of ConvexityToric (M.7's moment-map perfection comparison) into HeegaardFloer, Part II, placed after them; or state those inputs as owned targets here and delete the four consumption sentences. Do not duplicate the constructions. Test: with foundation at 0, the four roadmaps at 1 and Part II at 2, every cited edge is strictly increasing.

## R02 (P1) — The AnalyticStableMaps contract cites sections that do not exist at its head, for inputs that roadmap takes from HeegaardFloer

Re-raised: R03 of the previous review.

**Location:** `README.md:2118`, "Consume M0.1's simple/somewhere-injective equivalence and its at-most-countable noninjective locus, with accumulation only at critical points"; `:3024`, "Consume the closed-source interfaces specified by AnalyticStableMaps M0–M3: normalized labelled nodal domains … plumbing charts … varying-domain map compactness".

**Claim:** those sections of AnalyticStableMaps supply these inputs.

**Witness:** at the supplied head (rev/987) the sections are `### 0.1 The Cauchy–Riemann section, energy, area and the virtual dimension` (`README.md:104`) and `### 0.5 Normalization of a nonconstant closed curve through a simple curve` (`:168`); there is no "M0.1", and the somewhere-injectivity and isolated-critical-point statements are listed there as consumed from HeegaardFloer (`:71`, "Lane F2 item 2: unique continuation, isolated critical points and somewhere injectivity"). Its contracts delegate nodal domains, deformations and plumbing to ComplexCurveModuli D1/D3/D4/D6 (`:77`–`:80`), and `:1093` states that HeegaardFloer consumes nothing from it. The instance from the previous review still separates the two inputs: z↦z² has degree 2 and ramification 2 with 2=2·2−2, which §0.5 supplies; a one-nodal rational source needs two paired flags and a nodal-domain carrier, which neither §0.5 nor any section of that README names.

**Repair:** apply R01's ownership split first. Then inventory the F2.6b and F5.0 inputs one by one; for the simple/somewhere-injective equivalence cite this roadmap's own F2.2a–c (the owner by both READMEs); for the labelled nodal domains, stabilization, plumbing and stable-domain compactness name the actual owner section or state them as owned targets, or declare a precise supplier gap with its slug in `plan.json` and the README. Delete every "M0.1" and "M0–M3" label.

## R03 (P3) — Delete the five calibration companion files from the acceptance package

Re-raised: R04 of the previous review.

**Location:** `TauCetiRoadmap/HeegaardFloer/TorusBottShearTargets.lean:30`, `shear_intertwines`; `NonorientableBottModuliTargets.lean:28`, `normalMonodromy_calibration`; `CircleContinuationTargets.lean:19`; `KleinBottleBottTargets.lean:21`; `FourDimensionalCompatibility.lean:29`–`:76`.

**Claim:** these files belong to the roadmap's acceptance test.

**Witness:** a scratch probe with `import Mathlib` closed `shear_intertwines` by `simp [shear_apply, hF, add_assoc]` and `normalMonodromy_calibration` by one `simp` with the determinant, `Fin.sum_univ_succ` and `weightedSumSquares_apply` lemmas (no error, no `sorry`). `continuation_calibration` closes by `decide`; the seven four-dimensional theorems are 4×4 matrix identities; `firstHomology_coordinates` is the README's finite Klein complex (`README.md:707`) without the geometric identification. All five files import `Mathlib.*` submodules.

**Repair:** delete the five files; the README already carries each value as a Check (D=I−S, det −1 and +1, (152,−39), H₁=ℤ⊕ℤ/2, A²=−I when a²+b²+c²=1). Remove the four README sentences that point to them (`:378`, `:583`, `:681`, `:719`). Do not prove the admissions in place.

## R04 (P3) — Supply the remaining exact locators and correct four page numbers

Re-raised: R05 of the previous review.

**Location:** `README.md:3274`–`:3397` (F5.4–F5.6, no locator); `:2097`–`:2151` (F2.6b, "MS" by chapter only); `:2352`, "§0.3.A, Corollary, pp. 309–310"; `:3117`, "the sequential formulations are Theorems 10.4–10.6, p. 850"; `:2721`, "Lipshitz, arXiv:math/0502404v2, Lemma 4.11, p. 984".

**Witness:** lot (arXiv:0810.0687v6) has the strands algebra at Definition 3.2, p. 30 (line 1478), the box tensor differential at equation (2.29) (line 1166) and the pairing theorem at Theorem 1.3, p. 13 (line 379); mos (arXiv:math/0607691v2) has the V-factor bigradings at Theorem 1.1 (lines 221–223); none is cited in F5.4–F5.6. gromov line 124 is the printed-page-310 marker and the Corollary is at line 144, so it is pp. 310–311. behwz Theorem 10.4 is at line 2045 before the page-850 marker at line 2069, so pp. 849–850. lipshitz line 1153 attributes Lemma 4.11 to Ozsváth–Szabó, Proposition 7.5 (arXiv:math/0105202), the primary source.

**Repair:** cite lot Definition 3.2 and §3.2–3.3, equation (2.29) and Theorem 1.3; mos Theorem 1.1 for the V factor; the knot-invariants paper for the Alexander formula; McDuff–Salamon by theorem number in F2.6b; correct the Gromov and BEHWZ pages; add Ozsváth–Szabó Proposition 7.5 beside Lipshitz Lemma 4.11. Record every cited work once in `sources.toml` (BEHWZ, Ozsváth–Stipsicz–Szabó and the Introduction to Symplectic Topology cited in `Suggested.lean:111` are absent from `## References`).

## R05 (P3) — Finish the layer structure, APIs and Checks

Re-raised: R06 of the previous review.

**Location:** `README.md:161`, "### Lane M: Morse homology (Stage 0)"; counts over the file: 7 `*Needs:*` lines, 7 `**Checks.**` lists, 0 `## Layer`, 0 `### Examples`, 0 `### Dependencies`, 0 `## Downstream consumers`; `:42` and `:3551`, "⚠".

**Witness:** M.1 defines parametrized and unparametrized trajectory spaces with no Checks; F5.4 defines the strands algebra and box tensor with no Checks; the only new Checks since the previous head are F4.B's three and F5.2's five.

**Repair:** keep the mathematics and reorganize it into `## Layer k` sections with `### k.n` subsections, each definition with its API bullets and three discriminating Checks, each theorem with a `*Needs:*` line, each layer ending with `### Examples` and `### Dependencies`, and a `## Downstream consumers` section naming DGFloer, MorseNovikov, AnalyticStableMaps, ConvexityToric, SymplecticGeometry, ComplexCurveModuli and HamiltonianFloerOperations as consumers rather than suppliers. For M.1 use: indices 2→0 give quotient dimension 1=2−0−1; the constant trajectory has stabilizer ℝ and is excluded; a cyclic chain of nonconstant breaks would give total drop 0 against a strictly negative sum.

## R06 (P3) — Two supplier names do not exist where they are cited

**Location:** `README.md:1859`, "Use `RoughForm.interior` for ι_Xω=ω(X,·)"; `:1862`–`:1863`, "following HamiltonianSystems Layer1's existing design".

**Witness:** DifferentialGeometry on main (`README.md:280`) takes the interior product to be Mathlib's `curryLeft` and plans `RoughForm.wedgeWith` (`:291`), no `RoughForm.interior`; the pinned Tau Ceti has no `RoughForm`. HamiltonianSystems is a new roadmap in an open pull request by another author, listed in no merge order; it says at its head (`README.md:220`) that HeegaardFloer F2.1 builds the contraction inverse "following this layer". Both texts agree F2.1 is the owner, so this is a naming issue, not a cycle.

**Repair:** write the interior product as DifferentialGeometry's `curryLeft`-based operation by section, and phrase the HamiltonianSystems sentence as a downstream consumer ("HamiltonianSystems Layer 1 specializes this inverse to differentials") rather than an existing design.

## Verified sound

The worker's gate for this head passes every scanner and the targeted build:

```text
gate HeegaardFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The independent dependency command produced:

```text
depcheck: 208 roadmaps, 1457 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line; R01 explains why this does not settle the reciprocal contracts. `git diff --stat origin/main...HEAD` outside the folder is empty; HEAD is 0f45b88 and the worktree stayed clean. `PROGRESS.md` and `STATUS.md` are the generated progress files already present on main for this folder, not stray files. No copied passage, executable algorithm, sorry'd data or `set_option` was found; the theory is general (no exact-only or good-case restriction replaces a general statement; the circle, torus, Klein-bottle and sphere computations are examples).

**Lean.** `lake env lean` on `Suggested.lean` gives exactly seven `declaration uses sorry` warnings. A scratch copy with `#check @name` for all seven declarations elaborated; the elaborated types keep `FiniteDimensional`, `BoundarylessManifold`, `CompleteSpace`, `SecondCountableTopology`, `T2Space`, `CompactSpace`, the index inequality and the isotropy hypothesis, and agree with the README statements at F0.S, F0.0, F2.1, F2.6a, F2.6f and F2.7. Replacing every `sorry` by `simp`, by `rfl` and by `infer_instance` produced seven errors each time: no headline is padding. The two companion admissions closed with one `simp` each (R03).

**Headline inventory.** Integral Morse/Bott homology and comparison (M.3–M.7); filtered/Serre comparison (M.8); products, duality and cup product (M.9–M.9a); Witten comparison (M.10); Fredholm determinant orientations (F0.0); sharp Sard and Sard–Smale (F0.S, F0.0); spectral flow and Riemann–Roch (F1.3–F1.5); Darboux and Moser (F2.1); sphere normalization, moduli, nonsqueezing, rulings and the equal-area group (F2.6a–h); forced Lagrangian discs (F2.7); exact Floer comparison (F3); HF invariance, gradings and naturality (F4); cylindrical, bordered and knot theory (F5); the three reconciliations. The seven statable ones are in `Suggested.lean`; the docstring names each of the others and the missing carrier. No statable headline is absent.

**Pinned declarations opened** (Mathlib 6b7abb3c, Tau Ceti a91d3aaf): `ContinuousLinearMap.IsFredholm` (`Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean`); `TauCeti/Analysis/Fredholm/SardSmale.lean`, `NormalForm.lean`, `Proper.lean`, `LevelSet/Basic.lean` (`levelSetChartedSpace`, `isManifold_levelSet`); `Geometry/Symplectic/Manifold/TwoForm.lean` (`SmoothTwoForm`, `IsSymplectic`); `Geometry/Symplectic/StandardCompatible.lean` (`stdSymplecticForm`); `Geometry/Symplectic/Lagrangian/Basic.lean` (`isLagrangian_of_finrank`); `Geometry/Symplectic/JHolomorphic/Energy/Basic.lean` (`stdComplexLineEnergyDensity_sub_two_mul_symplecticForm`); `Geometry/Manifold/SmoothEmbedding/Basic.lean` and `NormalSpace.lean` (`SmoothEmbedding`, `tangentRange`); `LowDimTopology/Heegaard/Admissibility.lean` (`WeaklyAdmissible`), `Domain.lean` (`HeegaardRegionSystem`), `MaslovIndex.lean` (`maslovIndex`), `CurveHomology.lean` (`epsilon`); `LinearAlgebra/TotallyReal/Complex.lean` (`IsMaximalTotallyReal`); `Analysis/Complex/RiemannSurface/Degree.lean` (`biholomorphOfDegreeEqOne`); `LinearAlgebra/Matrix/SpecialLinearGroup/Basic.lean` (`finite_center`); `Geometry/Manifold/VectorBundle/Section/Parametric.lean` (`eventually_residual_exists_isManifold_sectionZero`); Mathlib `Analysis/Distribution/ContDiffMapSupportedIn.lean` and `LinearAlgebra/Projectivization/PSL/Stabilizer.lean` (`lineStab`). Absent at the pins: `RoughForm.interior` and `hamiltonianVectorField` (R06; the latter is HamiltonianSystems' planned name, not claimed native).

**Cross-roadmap citations resolved on main:** MorseTheory M1–M6 (`README.md:90`–`:649`); DifferentialGeometry Layers 0, 1, 3, 5, 5.6, 6, 8, 10 (`:268`–`:877`); ComplexKahlerGeometry K1, K3, K4, K5a, K7 (`:96`, `:296`, `:444`, `:570`, `:1405`); AlgebraicTopology Stage 5 item 1 and Stage 6 items (`:849`, `:946`); MorseNovikov N5 and N7 (`:292`, `:564`, Poincaré–Hopf at `:578`); GeometricCurrents G1–G4a (`:137`–`:523`); GeometricTopology Layers 1, 3, 9 (`:177`, `:357`, `:744`: tubular neighbourhoods, `Diff(M)` topology, Heegaard splittings); PDE Lane C item 13 (maximum principles); FuchsianOrbifolds Layer 5 (`:311`, branched-cover Euler formula); RepresentationTheory/LieGroups Layer 9 and the SU(2)→SO(3) worked example (`:448`, `:479`); SymplecticGeometry/ConvexityToric T2 (`:74`); HamiltonianFloerOperations H7 (`:91`); CombinatorialHeegaardFloer Lanes G, ALG, L, H (`:162`–`:250`); DGFloer Layer 1 (`:442`). At supplied heads: AnalyticStableMaps §0.5 (rev/987 `:168`); CalibratedGeometry C2 and C4 (rev/946 `:180`, `:277`); HamiltonianSystems Layer 1 (pull request #480, Layer 1 at its `:188`). Ownership against the open pull requests not supplied with files was not checked.

**Seeded-source verification.** Texts read through the sources service; locators quoted against the cached line numbers.

| Target | Text at the locator and outcome |
| --- | --- |
| M.1 | hutchings §2.2 begins line 262 (p. 8) and runs to Theorem 2.1 line 334 (p. 10); the translation quotient and dimension are there. "pp. 9–10" should read pp. 8–10. Supports the statement. |
| M.2 | wehrheim Definition 1.1 line 65 (p. 2), Theorem 2.3 and Remark 2.4 lines 281–285 (p. 6), Theorem 2.6 line 339 (pp. 7–8), Corollary 2.9 line 499 (pp. 10–11). Euclidean-near-critical hypothesis retained. Supports. |
| M.5 | hutchings Lemma 4.1 line 665 (p. 20), Lemma 4.2 line 697 (p. 21), Lemma 4.3 line 725 (p. 22), §4 Exercise 1 line 732 (p. 22). §4.1 begins p. 19. Supports the ordinary continuation inputs; the relative Cerf extensions are correctly marked as owned. |
| Circle counterexamples | hutchings §4 Exercise 2(a),(b) lines 734–748 (pp. 22–23): the two statements to refute are exactly tracking-equals-continuation and strict composition. The source gives no construction; the README's is checked in the table. |
| M.5a | hutchings §3 Exercise 5 line 608 (p. 18) and Theorem 3.9 route; AlgebraicTopology Stage 6 duality owns the cap product. Supports the route. |
| M.6 | hutchings §6.2.1–6.2.3 lines 1085–1165 (pp. 33–35). Supports the endpoint fibre products and negative orientation coefficients; the integral sign package is marked owned. |
| Oriented ambient, nonorientable trajectories | Realizes the §6.2.3 warning; no source statement is cited, the computation is checked below. |
| M.7 | hutchings Lemma 6.2 line 1184 (p. 36), Theorem 6.5 and Corollary 6.6 lines 1234–1240 (p. 38). Supports the geometric complex and comparison route. |
| M.9a | mescher (arXiv:1611.07916v1) §§1–5 and Appendix A (line 23, p. 72) exist; the oriented-manifold hypothesis there is retained by the README's coorientation argument. Supports the route. |
| F2.6b | McDuff–Salamon unreadable (below); AnalyticStableMaps §0.5 read (rev/987 lines 168–191): the factorization and the simplicity equivalence are stated there, with the somewhere-injectivity input taken from HeegaardFloer (R02). |
| F2.6h | gromov §0.3.C line 182 (p. 311): the equal-area symplectomorphism group statement with the factor exchange. Supports; the detailed proof is in the unreadable McDuff–Salamon. |
| F4.A | os-disks §2.1 line 165 (p. 5), Proposition 2.2 line 210 (p. 6), Proposition 7.1 line 2161 (p. 51). Supports diagrams, moves and pointed connectivity. |
| F4.B | os-disks Definition 2.11 line 430 (p. 11: a−b with both paths from x to y, equal to the README's x→y then y→x cycle); Lemma 2.19 lines 645–650 (pp. 16–17: s_z(y)−s_z(x)=PD[ε(x,y)] and s_{z₂}(x)−s_{z₁}(x)=α_i*); Theorem 4.9 line 1546 (p. 37: μ(ψ)=⟨c₁(s),H(ψ)⟩ for periodic classes); lipshitz Corollary 4.10 line 1145 (p. 983: μ(D)=n_x+n_y+e), Lemma 4.11 line 1155 (p. 984); erratum Lemma 4.1′ and Proposition 4.2′ lines 119, 153. All support the statements as written. |
| F4.C | os-disks Definition 4.10 line 1553 (p. 37), Remark 4.11 line 1562 (p. 38), Lemmas 5.2, 5.4, 5.6, 5.8 lines 1836, 1888, 1946, 1975 (pp. 44–47), Proposition 7.2 line 2191 (p. 52). Supports the fixed-s definitions and the existence/move theorems. |
| F4.M | oss-stable (arXiv:0912.0830v3) Theorems 10.2–10.4 lines 3443–3473 (p. 91): the (𝔽⊕𝔽)^{b−1} factor and the b₁=0 twisted comparison. Supports. |
| F5.2 | behwz §5.3 lines 836–860 (p. 820: E_ω and E_λ as in the README), §7.1–7.3 lines 1367–1583 (pp. 831–837), Theorems 10.1–10.3 lines 2023–2036 (p. 849, total-energy bound retained), Theorems 10.4–10.6 lines 2045–2104 (pp. 849–850), Proposition B.4 line 3575. Supports the closed cylindrical sector. |
| F5.4 | lot Definition 3.2 line 1478 (p. 30), differential by one removed inversion lines 1465–1472, box tensor (2.29) line 1166. The README's conventions agree; no locator is cited (R04). |
| F5.6 | mos Theorem 1.1 lines 221–223 (V in bigradings (0,0) and (−1,−1)). Agrees; no locator is cited (R04). |
| F0.S | sard Theorem 4.1 line 91 (p. 885, m≤n, any C^q), Theorem 7.2 line 275 (p. 889, m>n, q≥m−n+1). Supports; the m<n Lipschitz argument is a legitimate alternative to Theorem 4.1's m-null statement. |
| F2.6f | gromov Corollary line 144 (p. 310), proof to line 158 (p. 311): symplectic embedding of B(R) into the ε-neighbourhood of ℝ^{2n−2} forces R≤ε. Supports; page slip (R04). |

**Adversarial pass.** One row per statement; values on both sides.

| Statement | Instances and values | Result |
| --- | --- | --- |
| Supplier order (R01) | a<h<a, d<h<d, m<h<m, c<h<c from the quoted contracts; split 0<1<2 satisfies all. | Fail; R01. |
| ASM inputs (R02) | z² : d=2, R=2, 2=2·2−2 from §0.5; nodal rational source needs 2 flags, §0.5 supplies 0 node fields. | Fail; R02. |
| M.1 quotient | Indices 2→0: dim 2−0−1=1; constant trajectory stabilizer ℝ; cyclic chain total drop 0 against <0. | Pass. |
| M.2 corners | 3→2→1→0: two gluing parameters, dimension 3−0−1=2, deepest codimension 2; 2→1→0: codimension 1. | Pass. |
| M.3 integral complex | ℝP²: d₂=±2, d₁=0, H₁=ℤ/2, H₂=0; mod 2 gives H₂=𝔽₂. | Pass. |
| M.5 circle differential | p_j=r+jπ, q_j=r+π/2+jπ; ∂p₀=q₀−q₁, ∂p₁=q₁−q₀: D=[[1,−1],[−1,1]]=I−S; H₀=ℤ, H₁=ℤ(1,1). | Pass. |
| M.5 window estimate | T=∫_{1/6}^{5/6}dt/(t(1−t²))=ln5+½ln(35/11)≈2.188; 2δT<π/12 needs δ<0.0598>0; drift ≤2δT<π/12. | Pass. |
| M.5 tracking vs continuation | r=πρ, f_π=f₀ with fixed bases: tracking moves p₀ from 0 to π, the position of p₁, giving S; W^u(p₀,0)∩{t=1/6}=(−π/2,π/2) and its image at t=5/6 lies within π/12 of it, so it contains 0 and not π: the count is I. | Pass. |
| M.5 nonadmissible path | dψ/ds=2δ sin2ψ−πρ′t(1−t²): at ψ=π/4 value 2δ−πρ′t(1−t²)>0, at ψ=π/2 value ≤0: strip traps; endpoint θ≥π+π/4 versus small-δ θ<π; IVT gives θ=π=p₀(π); indices of (q₀,0) and (p₀,1) both 1, moduli dimension −1. | Pass. |
| M.5 strict composition | Steps of π/3 with drift <π/12 and basin margin π/2−π/3=π/6: Φ₁=Φ₂=I; concatenation 2π/3: 8π/12∉(−5π/12,5π/12) but −4π/12∈, so Φ=S. K=−I: DK=KD=S−I. | Pass. |
| M.5 large-constant product | h=(t²−1)²/4: h″(0)=−1, h″(1)=2, time eigenvalues −C, 2C, index shifts +1, 0; −∂_tF=Ct(1−t²)−∂_tf_t>0 on (0,1); λ=1 where ∂_tf_t=0. | Pass. |
| M.5a relative homology | H₁([0,1],{0,1})=ℤ, absolute 0; endpoint coefficients (+1,−1) sum 0. | Pass. |
| M.6 dimension | Circle components λ_C=2, λ_D=0: 2−0+1−1=2; isolated: 2−0−1=1. | Pass. |
| M.6 fibre-product sign | X=Y=T=ℝ, columns (1,1),(1,0): det −1=(−1)^{1·1}; swap exponent for dims 1: 1+2+1=4, sign +1. | Pass. |
| Oriented ambient example | τ=reflection×reversal: orientation-preserving, X oriented; f=z+εcosθ critical circles (N,0),(N,π),(S,0),(S,π) ranks 2+1,2+0,0+1,0+0=3,2,1,0; ν⁻_C monodromy det diag(1,−1)=−1, positive line −1, product +1; flow fixes θ=π, meridians give fibre S¹, seam (t,φ)↦(t+1,−φ): Klein bottle, dim 2=2−0+1−1. | Pass. |
| M.7 internal cross term | λ_C=2, λ_D=0, d=1: (−1)^0(−1)^1+(−1)^2=0; λ_C=λ_D=1, d=−1: (−1)(−1)−1=0. | Pass. |
| M.7 sign local system | Monodromy −1: boundary ρ(g)−1=−2, H₀=ℤ/2, H₁=0; twice-around a+ρa=0. | Pass. |
| M.7 two-cap sphere | d₂(a,b)=a+b: H₂=ℤ(1,−1), H₁=0, H₀=ℤ. | Pass. |
| M.7 torus shear | d=2,e=3,P=5,Q=7,F=31,x=11,y=13: left (425−273,−39)=(152,−39); right (2·76,−39)=(152,−39). | Pass; Lean padding (R03). |
| M.7 Klein bottle | d₂(n)=(0,2n), d₁=0: H₂=0, H₁=ℤ⊕ℤ/2, H₀=ℤ; [C₁]=(1,1) differs from (1,0) by torsion (0,1). | Pass. |
| M.7 four-component sphere | f=5z/4−z³, a=√(5/12): values −5a/6,−1/4,1/4,5a/6 increasing; ranks 0,2,0,1 from f″(−a)=6a>0, S local max, N local min, f″(a)<0; D₁D₂(a,b)=D₁(0,−a+b)=(0,0); H₂=ℤ(1,1), H₁=ℤ²/⟨(0,1)⟩ modulo ker: 0, H₀=ℤ²/⟨(−1,1)⟩=ℤ. | Pass. |
| M.7 moment-map obstruction | E poles f=−ε,+ε, weights (1,−2),(−1,2): both indices 2; invariant connecting surface dimension 2>0=transverse dimension. | Pass. |
| M.8 index page | Two-cap drop 2 puts the sum at d₂ in the index filtration, at d₁ in the value filtration; equal-index map ℤ→ℤ at index 0 gives E₁=0, not ℤ⊕ℤ. | Pass. |
| M.9 tensor sign | |x|=|y|=1: −dx⊗dy+dx⊗dy=0. Tor₁(ℤ/2,ℤ/2)=ℤ/2 is a separate summand. | Pass. |
| M.9a cup product | T²: a∪b=−b∪a=[T²]*, a²=b²=0; RP² mod 2: x²≠0, x³=0. | Pass. |
| F0.S `sharp_sard` | m=3,n=1,k=3: 3>2 true, native 3≥10 false; m=1,n=2: ℕ-subtraction 0<1, mesh δ^{−1} pieces of 2-volume δ² total δ→0; m=n=0: critical set empty. | Pass. |
| F0.0 `sharp_sardSmale` | id_ℝ index 0<1; inclusion ℝ→ℝ² index −1, image nowhere dense; zero map ℝ³→ℝ index 2, k=3 passes, k=2 fails. | Pass. |
| F2.1 `exists_darbouxChart` | dim E=0: zero form, 0=0; dim 2: chart id, form₀=ω, ω(e₁,e₂)=1=1; standard version m=1, matrix [[0,1],[−1,0]]. | Pass. |
| F2.6a triple | (0,1,∞)↦identity; (1,2,∞)↦z+1; (0,0,∞) violates x≠y. T(z)=z+1, D(z)=2z: TD(0)=1≠DT(0)=2. | Pass. |
| F2.6b | z²: trivial-stabilizer fails (deck ℤ/2); simple sphere stabilizer 1; constant sphere stabilizer PSL. Unmarked dimension 2n+2c₁−6: n=2,c₁=2 gives 2. | Pass. |
| F2.6f `nonsqueezing` | n=1,f=id,r=R=1: Im⟨1,i⟩=1 both sides, 1≤1; f=2z: 4≠1; r=2,R=1: (3/2,0,…) has norm 3/2<2 and |z₀|=3/2>1; n=0, r=0 excluded. | Pass. |
| F2.6h | Swap sends (A,B)↦(B,A); areas (a,a) preserved, (a,b) with a≠b not. ℤ/2 factor only in the equal-area case. | Pass. |
| F2.7 disc | L=unit circle, u(z)=z: holomorphic, boundary in L, area π>0; constant disc area 0 excluded; n=0 excluded by 1≤n. Green identity: πr²a=r∫e^{iθ}u dθ, hence |a|≤2R. | Pass. |
| F3 | T*S¹ zero section: Morse/Floer ranks (1,1), Euler 0. | Pass. |
| F4.A ε | α=(1,0), β=(1,3), x=(0,0), y=(1/3,0): arcs (1/3,0)+(−1/3,−1)=(0,−1)≡2b in ℤ/3; forward β arc (2/3,2) gives (1,2)≡2b, consistent. | Pass. |
| F4.B Spinᶜ sign | s_z(y)−s_z(x)=2=PD(ε); reversed pair 1=1; self-pair 0=0; the old formula would give 1≠2. | Pass (repaired). |
| F4.B basepoint | S¹×S² genus-one diagram: γ with α·γ=1 is the S¹ generator, α*=generator, increments +1, −1, 0. | Pass. |
| F4.B gradings | μ=1, n_z=0: gr(x)−gr(y)=1; sphere μ=2, n_z=1: 0; U: 2(i−1)−2i=−2. | Pass. |
| F4.B Chern formula | Whole surface: e=2−2g, n_x=g, e+2n_x=2, not a normalized domain. | Pass. |
| F4.C admissibility | Coefficients (−1,1) have both signs; zero domain excluded; strong condition r=0 needs a positive coefficient. | Pass. |
| F4.M | S³ with b=2: rank 1·2=2; b=3: 4. | Pass. |
| F5.1 embedded index | Bigon g=1,e=1/2,n_x+n_y=1/2: χ=1, ind=1. | Pass. |
| F5.2 energies | Trivial cylinder (Ts,γ(Tt)): E_ω=0, E_λ=T²∫φ(Ts)ds=T; k-fold: kT; translates a=2,−3 same class. | Pass. |
| F5.2 stability | Constant sphere n=2: 0 unstable; n=3: 1; torus n=0: 0, n=1: 1; self-node plus mark: n=3, value 1 (counting the node once wrongly gives 0). | Pass. |
| F5.4 box tensor | δ²=0: sums stop at length 1; δ=id over a discrete ring: unbounded identical terms, no sum. | Pass. |
| F5.5 pairing | Solid tori giving S³: rank 1; giving L(p,1): rank p. | Pass. |
| F5.6 knot | Unknot n=2 grid: HFK̂ rank 1 times V rank 2 = 2; V bigradings (0,0),(−1,−1). | Pass. |
| R1 twisted | R=𝔽[t^{±1}], differential 1+t injective, R/(1+t) rank 1; augmentation t↦1 gives rank 2, Tor₁=𝔽. | Pass. |
| R2 contraction | h=−1 gives dh+hd=−id=iπ−id; h=+1 wrong sign over ℤ. | Pass. |
| Calibrations (R03) | D=I−S, S²=I; det diag(1,−1)=−1, det diag(1,−1,−1)=+1, square I; A²=−(a²+b²+c²)I, at (1,0,0) −I. | Pass; padding. |
| Locators (R04) | Gromov corollary line 144 after page-310 marker line 124; BEHWZ Theorem 10.4 line 2045 before page-850 marker line 2069. | Fail; R04. |

There are 52 computed rows; the sampled targets, the seven headlines and every finding target appear.

## Not verifiable

- **McDuff–Salamon, J-holomorphic Curves and Symplectic Topology** (F2.6b, F2.6h, F0–F2 chapters) and **Introduction to Symplectic Topology** (`Suggested.lean:111`): paywalled; the previous attempt at the author-hosted PDF returned HTTP 403. Not re-requested; F2.6b's factorization locator remains uncertified.
- **Schwarz, Morse Homology; Oh, Symplectic Topology and Floer Homology; Robbin–Salamon (both papers); Micallef–White; Hartman–Wintner; Floer–Hofer–Salamon; Kronheimer–Mrowka:** no legal full text found by the service in the previous round; not re-requested, since none is a sampled target at this head.
- **Audin–Damian, April 2013 draft** (M.0a, Proposition 2.1.5, p. 28): not fetched; outside the sample.
- **Perutz arXiv:0801.0564, Zemke arXiv:2111.14962, Juhász–Thurston–Zemke arXiv:1210.4996, Ozsváth–Szabó arXiv:math/0105202 (Proposition 7.5):** readable on arXiv but outside the sample; not read this round.
- **Hutchings lecture notes:** read from the UT Austin course copy of the author's notes (OCR text); the printed pagination was taken from the notes' own page numbers.
- **Ownership against open pull requests** not supplied with files was not checked.

## Source issues

- **Misprint** in hutchings at Example 6.4, printed p. 37: the source applies the top differential to m₁ although its isolated maximum is named m₂; it should read m₂; affects nothing.
- **Misprint** in os-disks at Definition 5.5, printed p. 46: the source says two strongly s-isotopic diagrams are strongly s-isotopic when the intermediate diagrams are; it should say strongly s-admissible for the endpoint and intermediate diagrams; affects nothing.
- **Gap** in lipshitz at Lemma 4.1, printed pp. 975–976, as the author states in lipshitz-erratum §1, pp. 2–3: the source does not justify the corner-preserving gluing and removes double points while keeping the branched projection; it should use the revised Lemma 4.1′ and Proposition 4.2′; affects the proof; corrected in print at lipshitz-erratum, pp. 4–8.
