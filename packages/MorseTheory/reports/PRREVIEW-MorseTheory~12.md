# Review of MorseTheory (pull request #1682 at 8315f03)

**Verdict:** needs changes

This is a full re-review of `TauCetiRoadmap/MorseTheory/` at head 8315f03b80c9b4a04e1001b44c4e1abc988feaab: 357 lines changed since 9a916c5, the head the previous review read. There are two findings, and both block. Both come from one cause. The branch still sits on Tau Ceti a91d3aaf and has not been rebased onto main. Meanwhile the new §4.3–§4.4 text cites main's pin, Tau Ceti 2fd255d.

## R01 (P1) — §4.3–§4.4 cite pinned Tau Ceti declarations that do not exist at this head's pin; the branch is still not rebased

**Location:** `TauCetiRoadmap/MorseTheory/README.md:34–37`: "The pinned Tau Ceti already proves Reeb's theorem for Morse functions with two critical points, the Jordan–Brouwer separation theorem, Brouwer's invariance of domain and the recognition of a space glued from two closed discs". The same claims appear in:
- the Tau Ceti contract, lines 135–164;
- the uses at lines 996–997, 1031, 1058, 1124, 1145, 1151–1152, 1180, 1188 and 1210–1211.

**Claim:** §4.3 and §4.4 consume seven pinned declarations. Six of them are absent at this head's own pin:
- `TauCeti.IsMorse.nonempty_homeomorph_sphere_of_totalCriticalCount_eq_two`;
- `IsOpen.image_of_continuousOn_of_injOn`;
- `Continuous.isOpenEmbedding_of_injective`;
- `Homeomorph.coe_apply_mem_frontier_iff`;
- `TauCeti.nonempty_homeomorph_sphere_of_union_closedBall`;
- `Homeomorph.radialExtension`.

The head also dropped main's ownership of the open-map step of invariance of domain (Hatcher, Theorem 2B.3) and of the radial extension. So at this pin three things rest on nothing that exists:
- Brown's Theorem 0 inside `exists_closedBall_homeomorph_closure_of_bicollar`;
- the boundary clause of that theorem;
- the final gluing step of `nonempty_homeomorph_sphere_of_two_euclidean_opens`.

The gate passes only because `Suggested.lean` imports none of these modules.

**Witness:** At this head's pin, Tau Ceti a91d3aaf, `Geometry/Manifold/Morse/` holds only Basic, Index, Prod and Sphere, with no `Reeb.lean`. `AlgebraicTopology/Singular/InvarianceOfDomain.lean` is absent, and `Hemisphere.lean` has no `union_closedBall`. `git merge-tree origin/main HEAD` reports CONFLICT in both files.

**Exact repair:**
1. Rebase onto main eaf17b1, or merge `origin/main` into the branch. Resolve `README.md` and `Suggested.lean` to this head's text, which already carries main's M4.1 as §4.4.
2. Either route brings main's `lake-manifest.json` and `lean-toolchain`: Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2. Re-elaborate `Suggested.lean` and re-run the gate at those pins. These are steps 1 and 8 of the previous R01.
3. Update the pull request's title and description. They still announce "Palais–Smale compactness and nonproper gradient convergence", which README lines 40–45 now place outside this roadmap.

Tested at 2fd255d: all seven declarations exist, with the hypotheses the README states.
- `TauCeti/Geometry/Manifold/Morse/Reeb.lean:148` requires compact, T2, boundaryless, `IsMorse` and `totalCriticalCount I f = 2`, with no connectedness.
- `TauCeti/AlgebraicTopology/Singular/InvarianceOfDomain.lean:160, 201, 257` work on manifolds charted on finite-dimensional spaces of equal dimension.
- `TauCeti/Analysis/InnerProductSpace/Hemisphere.lean:377` takes closed sets A and B with A ∪ B = univ and two disc homeomorphisms matching A ∩ B with the unit sphere. Its target is the unit sphere of any inner-product space of dimension m+1.
- `Homeomorph.radialExtension` is in `TauCeti/Analysis/Normed/Module/Ball/Radial/Extension.lean`.

## R02 (P2) — At main's pin, which R01 brings, `Suggested.lean` restates Tau Ceti declarations, and its docstring calls proved headlines unstatable

**Location:** `TauCetiRoadmap/MorseTheory/Suggested.lean:47–48`: "def criticalPoints (f : M → ℝ) : Set M := {x | mvfderiv I f x = 0}". The other restated declarations are at lines 51, 55, 61, 76, 90, 96, 124, 149, 164 and 176. Docstring lines 19–20 say: "Strong smooth Morse approximation lacks the specified strong smooth topology on smooth maps". Lines 23–25 make the matching claim for the Lusternik–Schnirelmann invariant.

**Claim:** Once the pin is Tau Ceti 2fd255d, three definitions and eight theorems here restate Tau Ceti declarations. The docstring's list of unstatable headlines also becomes false: Tau Ceti proves strong Morse density, the Lusternik–Schnirelmann bound and the per-level cell attachment. And every remaining headline is stated through a private `criticalPoints` that stands in for the native one. The repository README's rule "Import existing Tau Ceti APIs" forbids exactly that.

**Witness:** At 2fd255d, `TauCeti/Geometry/Manifold/Morse/CriticalPoints.lean:87` defines `TauCeti.criticalPoints` with the identical body. `Deformation.lean:199`, `TauCeti.exists_sublevelDeformation`, has this file's line-96 conclusion with only `a ≤ b`.

Restatements at Tau Ceti 2fd255d (paths under `TauCeti/Geometry/Manifold/Morse/` unless given):

| `Suggested.lean` | Tau Ceti 2fd255d | Relation |
| --- | --- | --- |
| `criticalPoints` (47) | `TauCeti.criticalPoints`, `CriticalPoints.lean:87` | same body |
| `criticalCount` (51) | `TauCeti.criticalCount`, `CriticalPoints.lean:348` | same encard of the index-j critical points |
| `sublevelInclusion` (90) | `TauCeti.sublevelInclusion`, `TauCeti/Topology/Order/Sublevel.lean:124` | same inclusion, for any preorder |
| `finite_criticalPoints_inter` (55) | `TauCeti.IsMorse.finite_criticalPoints_inter`, `CriticalPoints.lean:274` | same, with fewer hypotheses |
| `exists_normalized_morseChart` (61) | `TauCeti.IsManifoldNondegenerateCriticalPoint.exists_normalized_morseChart`, `NormalizedChart.lean:196` | same conclusion; f need only be smooth near x |
| `exists_scalarRegularLevelData` (76) | `TauCeti.exists_regularFiber_smoothEmbedding`, `TauCeti/Geometry/Manifold/RegularValue/ManifoldLevel.lean:257`, with N = ℝ | `IsRegularValue` unfolds to `hregular`; `finrank ℝ ℝ = 1` |
| `exists_sublevelDeformation` (96) | `TauCeti.exists_sublevelDeformation`, `Deformation.lean:199` | same conclusion; only needs `a ≤ b` |
| `exists_proper_boundedBelow_morse` (124) | `TauCeti.exists_isMorse_isProperMap_bddBelow`, `Generic/Strong.lean:290` | same; sigma-compactness follows from second countability |
| `exists_degenerateCriticalLevelDeformation` (149) | `TauCeti.exists_criticalLevelDeformation`, `Deformation.lean:315` | same conclusion; the pinned theorem needs neither finiteness nor isolation |
| `exists_noCriticalOpenSublevelDeformation` (164) | `TauCeti.exists_ambientSublevelDeformation`, `Deformation.lean:283` | same conclusion; no buffer δ and no compact M |
| `exists_criticalCategoricalCover` (176) | `TauCeti.lsCategoryCount_univ_le_totalCriticalCount`, `LusternikSchnirelmann.lean:185`, over `LSCategoricalCover` (`TauCeti/Topology/Homotopy/LusternikSchnirelmann.lean:84`) | the stand-in's purpose; the LS headline itself is proved |

**Exact repair**, after R01:
1. Delete the definitions `criticalPoints`, `criticalCount` and `sublevelInclusion`. Import `TauCeti.Geometry.Manifold.Morse.CriticalPoints` and `TauCeti.Topology.Order.Sublevel`. Write `TauCeti.criticalPoints I f`, `TauCeti.criticalCount I f j` and `TauCeti.sublevelInclusion f a b h` in the statements that remain.
2. Delete the eight theorems in the table.
3. Keep `exists_morseCWModel`, `bettiNumber`, `strong_morse_inequalities`, the four §4.4 statements and `exists_compactTrapped_gradient_limit`. None of them is a single pinned declaration:
   - The polynomial identity with Q ∈ ℕ[t] repackages the pinned alternating inequalities (`Inequalities.lean:414`) and Euler's equality (`Inequalities.lean:429`) by partial-sum algebra.
   - The trapped headline combines `GradientFlow.lean:261` and `ExponentialConvergence.lean:303` for an arbitrary integral curve on [0,∞).
4. Rewrite the docstring paragraph on unstatable headlines. It should cite the following as proved at the pin:
   - `TauCeti.dense_setOf_isMorse_manifoldStrongWhitney` (`Generic/Strong.lean:267`), on `manifoldStrongWhitneyTopology` (`TauCeti/Geometry/Manifold/ContMDiffMap/Chart/Strong.lean:240`);
   - `TauCeti.lsCategoryCount_univ_le_totalCriticalCount`;
   - the per-level cell attachment `TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation` (`RelCWComplex.lean:298`).

   It should then name as unstatable only what remains: the parametrised handle comparison and the Morse–Bott attachment.
5. In the README, write the pinned `TauCeti.` name wherever a deleted declaration is backticked: lines 52, 268, 284, 307, 317–318, 563, 565, 799, 872, 880 and 966–967. List those declarations with their files under "From Tau Ceti". For §2.1's level theorem, cite `TauCeti.exists_regularFiber_smoothEmbedding`; its docstring gives Lee, Corollary 5.14 and Proposition 5.38. This also supplies the source that §2.1's headline currently lacks.

Tested on `exists_sublevelDeformation` with f = x², a = 1, b = 4:
- The pinned theorem applies with `hab.le`.
- `hreg` follows from `hnocrit` by `mem_criticalPoints_iff_mfderiv_eq_zero` (`CriticalPoints.lean:96`).
- It returns the same retraction r(x) = max(−1, min(x, 1)).

Tested on `exists_scalarRegularLevelData`: with N = ℝ, `IsRegularValue I 𝓘(ℝ) f c` unfolds to `hregular` (`TauCeti/Geometry/Manifold/RegularValue.lean:92–93`). Since `finrank ℝ ℝ = 1`, the pinned model `Fin (finrank ℝ E − finrank ℝ ℝ) → ℝ` is this file's model.

Main's own `Suggested.lean` restates the same declarations against the same pin, so this repair corrects main as well.

## Previous findings

- **R01 of the previous review: partly repaired.**
  - Repaired:
    - §4.4 (README lines 1040–1195) carries main's three targets, each with its *Needs:* line, its Checks and its locators: Brown 1960, Theorem 5, p. 76, and Milnor 1959, Theorem 1(3) and Corollary 1, pp. 440 and 442.
    - `Suggested.lean:241–246` now states `nonempty_homeomorph_sphere_of_two_criticalPoints` with "hf : ContMDiff I 𝓘(ℝ) ∞ f".
    - `nonempty_homeomorph_sphere_of_two_euclidean_opens` is restored at line 227.
    - The §4.3 Check at line 1036 now presents h − h³/3 as the case §4.4 covers.
    - Line 220 maps `#m41-two-critical-points-with-arbitrary-degeneracy` to `#44-two-critical-points-with-arbitrary-degeneracy`.
  - Not repaired: steps 1 and 8, the rebase and the pins. The merge base is still ffcc9d31, and both files still conflict. Step 3, which restored main's ownership of the open-map step, was replaced by citations that hold only at main's pin. This is R01 above.

No repair report marks a finding "not actionable in this package".

## Verified sound

**Head, gate, dependencies.**
- Head 8315f03b80c9b4a04e1001b44c4e1abc988feaab; the worktree is clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/MorseTheory'` is empty.
- The worker's gate passes every check, including `build=0`.
- My rerun stopped on a GitHub API rate limit (exit 77) before any check ran; see Not verifiable.
- The dependency check printed `depcheck: 239 roadmaps, 2427 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. Every supplier is a roadmap on main: DifferentialGeometry, AlgebraicTopology, GeometricTopology, CharacteristicClasses, ComplexKahlerGeometry, ComplexManifolds and DGFloer.

**Elaboration, signatures and padding.**
- `lake env lean` on `Suggested.lean` at this head's pins exits 0. It gives exactly 15 `declaration uses sorry` warnings, at lines 55, 61, 76, 96, 109, 124, 138, 149, 164, 176, 189, 204, 227, 241 and 252.
- A scratch copy with `#check @name` for all 19 declarations elaborated. I compared each elaborated type with its README statement, and all 19 agree.
- Three definitions drop the standing binders: `criticalPoints`, `criticalCount` and `sublevelInclusion`. That is the generality the Conventions state at lines 50–53.
- `bettiNumber` forces `k` and `M` into one universe, as the Conventions say.
- One-tactic probe: I replaced each `sorry` by `first | rfl | simp | infer_instance | aesop | exact ⟨⟩` and elaborated. All 15 theorems failed, so none closes in one step at this pin. R02 concerns main's pin.

**Sources, seeded sample.** Cohen–Iga–Norbury's printed page is the PDF page minus 13.

| Target | Locator | Checked at | Result |
| --- | --- | --- | --- |
| 1.1, 1.2 | none (constructions and definitions) | adversarial rows 1–4 | sound |
| 1.3 | CIN Thm 5.3, pp. 36–37; Cor 5.4, p. 38 | cohen-iga-norbury lines 1322, 1423 (PDF 49, 51) | Morse lemma at a nondegenerate point; Morse critical set discrete |
| 2.1 | none | R02 step 5 supplies one | see R02 |
| 2.2 | Milnor 1963 Thm 3.1, p. 12 | Not verifiable; CIN Thm 5.1, line 1202 (p. 33), agrees | band compactness, as stated |
| 2.3 | Milnor 1963 Lemma 3.6, pp. 20–21 | Not verifiable; CIN Thm 5.6, line 1438 (p. 38) | — |
| 2.4 | Milnor 1963 Thm 3.5, p. 20; CIN Thm 5.7, pp. 40–41 | cohen-iga-norbury line 1519 (PDF 53) | closed M, Morse f, one λ-cell per index-λ point |
| 3.1 | Hirsch Ch. 2 §1, Ch. 6 Thm 1.2 | uncertified (settled) | — |
| 3.2 | Milnor 1963 Cor 6.7, p. 36 | Not verifiable | — |
| 4.1 | CIN Cor 5.11, p. 42 | line 1569 (PDF 55) | strong inequalities, closed M, field coefficients |
| 4.2 | Weber Thm 1.1, p. 2; proof pp. 2–3 | weber-conley lines 62–67, 73–106 | C² f on a closed manifold; cat is the least number of nullhomotopic open sets, at least 1 |
| 4.3 | CIN Application 5.13, p. 43 | line 1617 (PDF 56) | closed M, Morse, two critical points, homeomorphic to Sⁿ |
| 4.4 | Brown 1960 Thms 0–4, pp. 74–76; Thm 5, p. 76 | brown-1960 lines 25–36, 37–59, 60–68, 69–81, 84–100, 101–113 | the README's paraphrases of Theorems 0–5 match; collar parameter in [0,1], middle sphere at 1/2 |
| 4.4 | Milnor 1959 Thm 1(3), p. 440; Cor 1, p. 442 | milnor-1959 lines 72–76, 117–119 | compact M covered by two open sets diffeomorphic to ℝⁿ, hence homeomorphic to Sⁿ |
| 5.1 | CIN Thms 15.1, 15.4, 15.6–15.7, pp. 143, 146–148 | lines 4986, 5091, 5142, 5161 (PDF 156, 159, 160) | pages exact |
| 6.1 | CIN Thm 4.6, pp. 27–29 | lines 1022–1098 (PDF 40–42) | closed M, Morse f (§4.2, line 873); see Source issues |

**Library declarations opened.**
- Mathlib 6b7abb3c (this head's pin):
  - `onePointEquivSphereOfFinrankEq` (`Topology/Compactification/OnePoint/Sphere.lean:34`, with `finrank V + 1 = card ι`);
  - `Homeomorph.onePointCongr` (`OnePoint/Basic.lean:629`);
  - `EuclideanSpace.instChartedSpaceSphere` (`Geometry/Manifold/Instances/Sphere.lean:351`);
  - `Manifold.IsSubmersionAtOfComplement.mk_of_charts` (`Geometry/Manifold/Submersion.lean:179`);
  - `ContDiffAt.contDiffAt_implicitFunction` (`Analysis/Calculus/ImplicitContDiff.lean:90`).
- Tau Ceti a91d3aaf (this head's pin):
  - `natCard_zerothHomotopy_sphere_compl_range_eq_two` (`AlgebraicTopology/Singular/JordanBrouwer.lean:212`), which matches README lines 143–148;
  - `finite_singularHomology_of_cwComplex` and `finsum_finrank_singularHomology_of_finite_cwComplex` (`AlgebraicTopology/Cellular/EulerCharacteristic/Singular.lean:125, 141`);
  - 20 contract file paths present;
  - 35 contract names present, among them `sectionZeroChartedSpace`, `implicitCoordEquiv`, `boundaryChartedSpace`, `kerModelEquiv`, `exists_congruence_of_symmetric_family`, `sqrtNearOne`, `IsLocallyFlat` and `brownBicollaring`;
  - the six absences of R01.
- Tau Ceti 2fd255d (main's pin): the files and lines cited in R01 and R02.

**Cross-roadmap citations resolved on main (eaf17b1).**
- DifferentialGeometry:
  - Layer 3 at line 371;
  - §5.1 `boundaryOrientation_spec` at 507–509, with anchor `#layer-5-integration-and-stokes-theorem` from heading 503;
  - §10.2 Sard at 884;
  - §12.2 `mgradient`, `inner_mgradient` and `mgradient_eq_gradient` at 918–919;
  - §12.3 `hessian` at 920.
- AlgebraicTopology:
  - `diskBoundaryRelCW` at 624, `cwSubcomplexTowerUnion` at 700, `relativeCWPushoutCWModel` at 716;
  - `LSCategoricalCover` and its supplement at 1082;
  - Stage 4 at 499, Stage 6 at 946, and the Stage 4.6 RP² sign system at 1034.
- GeometricTopology Layer 1 at 177, with collars at 206.
- CharacteristicClasses C2 at 728.
- ComplexKahlerGeometry: K1 at 96, K7.1 at 1407, K7.2 at 1444.
- ComplexManifolds Milestone 1 at 172.
- DGFloer Layer 1 item 3, the filtered `SpectralObject`, at 622.
- HeegaardFloer Lane M at 70.
- RiemannianGeometry R3 at 82 and 89.
- SymplecticGeometry/ConvexityToric T2 at 73.
- HomotopySpheres §4B is cited as a consumer only, in plain text. It resolves at the open head of the HomotopySpheres pull request, line 1569.

**Overlaps and ownership.**
- The id map at README lines 216–222 covers every id that `overlaps.md` reports as cited, HeegaardFloer's m2 and m5. It also covers main's m41 slug.
- No other roadmap cites main-only MorseTheory Lean names (`roadmaps grep`, 14 names, on main and at all open heads): for example `exists_cwComplex_homotopyEquiv`, `morse_inequalities`, `MorseFiniteWitness` and `tendsto_of_isMIntegralCurveOn_neg_mgradient`.
- MorseNovikov cites MorseTheory only by the labels M1–M4 and M6, which the head's headings keep.
- On main, only MorseTheory owns Brown's generalized Schoenflies theorem; GeometricTopology's README on main does not mention it. Two open pull requests claim otherwise:
  - the GeometricTopology revision (head checkout rev 903, §2.2, line 1309), which also says MorseTheory consumes it (line 13133);
  - FourManifolds (rev 936, line 223), whose gap `brown-schoenflies` names GeometricTopology as supplier.

  A revision is never a supplier, and this head keeps main's ownership. Those two pull requests should cite MorseTheory §4.4; this is not a finding here.
- No other roadmap owns the sphere recognition from two critical points.

**Adversarial table.** Every row was computed this round.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §1.1 model transport (sample) | f(x)=x, rechart y=2x; half-line model | df/dx=1, df/dy=1/2, chain rule (1/2)·2=1; range [0,∞) ≠ ℝ | transport, not equality; the boundaryless hypothesis excludes the half-line | none |
| 2 | `criticalPoints` (def, sample 1.2) | x², x³ on ℝ; a point; constant on S¹ | {0}; {0} (degenerate kept); the point (derivative into a 0-space is 0); all of S¹ | df=0 locus, not nondegeneracy | R02 |
| 3 | `criticalCount` (def, sample 1.2) | −x²+y² on ℝ²; constant on S¹ | Hessian diag(−2,2): c₁=1, c₀=c₂=0; c₀=⊤ by encard, where `Nat.card` gives 0 | ℕ∞ needed | R02 |
| 4 | §1.2 complementary index (sample) | f=x²; f=0 on ℝ | 0+1=1=dim; 0+0=0≠1 | nondegeneracy needed, as stated | none |
| 5 | `finite_criticalPoints_inter` (headline) | sin, K=[0,10]; K=ℝ; constant on S¹ | {1.571, 4.712, 7.854}: 3 points; ℝ: infinitely many; constant: Hessian 0 in dimension 1, not Morse | compactness and Morse both used | R02 |
| 6 | `exists_normalized_morseChart` (headline, sample 1.3) | f=2x²; −x²+y²; dimension 0 | ψ=√2·x gives f=ψ² (Hessian 4, normalized 2); index 1, signs (−1,+1) from `i.val < 1`; empty sum on source {x} | normalization correct | R02 |
| 7 | §1.3 compact Cᵏ seminorms (sample) | h=δx² on [−1,1] and [−1/2,1/2] | suprema (δ, 2δ, 2δ) and (δ/4, δ, 2δ) | order 2 does not shrink | none |
| 8 | §1.3 persistence (sample) | x²+tx; x³−tx | branch −t/2, value −t²/4, index 0; none for t<0, ±√(t/3) for t>0, Hessian 0 at t=0 | the branch stops at birth–death | none |
| 9 | `exists_scalarRegularLevelData` (headline, sample 2.1) | f(x,y)=x, c=0; x² with c=1 and c=0; dimension 0 | level {0}×ℝ, model `Fin (2−1) → ℝ`, range span e₂ = ker(1,0); level {±1}, model `Fin 0 → ℝ`, range 0 = ker(±2); c=0 fails `hregular`; `Fin (0−1)` = `Fin 0`, level forced empty | sound | R02 |
| 10 | §2.1 outward sign (sample) | f=x on [a,b] | outward +∂ₓ at b, df=+1; −∂ₓ at a, df=−1 | matches the Check | none |
| 11 | `sublevelInclusion` (def) | x², levels 1→4→9 | x=1 ↦ 1 by both routes; a=b is the identity; x=1 lies in the closed sublevel at 1 | sound | R02 |
| 12 | `exists_sublevelDeformation` (headline, sample 2.2) | x², a=1, b=4; a=−1, b=4 | band [−2,−1]∪[1,2] compact and critical-free, r(x)=max(−1,min(x,1)); second band contains 0 and its sublevel at −1 is ∅, not a retract of [−2,2] | hypothesis needed | R02 |
| 13 | §2.2 adapted field (sample) | −u²+v², X=(2u,−2v) | df(X)=−4u²−4v²; flow (e^(2t)u, e^(−2t)v); X=(−2u,−2v) gives +4u² on v=0 | sign pinned | none |
| 14 | §2.3 double well, RP² (sample) | (x²−1)², y=x√(2−x²); RP² chart at [0:0:1] | 1−y² = 1−2x²+x⁴ = (x²−1)²; α±(1) = ±√(1−1/√2) = ±0.5412 with f = 0.5000; 2−f = (2X²+Y²)/(1+X²+Y²) = u₁²+u₂² | chart identities exact | none |
| 15 | `exists_morseCWModel` (headline, sample 2.4) | S² height; x² on ℝ; ∅; f=x on ℝ; discrete ℕ, f(n)=n | cells (1,0,1); one 0-cell; none; f=x is proper and unbounded below, and ℝ ≄ ∅; ℵ₀ 0-cells | `BddBelow` necessary and present | none |
| 16 | §3.1 strong vs compact-open (sample) | tolerance e^(−x²), constant 0.01 | fails for x > √(ln 100) = 2.146; on [−1,1], 0.01 < e^(−1) = 0.368 | the distinction is correct | none |
| 17 | `exists_proper_boundedBelow_morse` (headline, sample 3.2) | ℝ; ∅; discrete ℕ | x² with bound 0; the empty function is proper, `BddBelow ∅`, Morse vacuously; f(n)=n is proper, a constant is not | sound | R02 |
| 18 | §3.2 perturbation (sample) | x², distance from f below 1 | g ≥ −1; g ≤ b implies x² < b+1 | exhaustion kept | none |
| 19 | `bettiNumber` (def) | point over ℚ; S¹; RP² over ℚ and 𝔽₂ | (1,0,…); (1,1,0,…); (1,0,0) and (1,1,1) | native finrank | none |
| 20 | `strong_morse_inequalities` (headline, sample 4.1) | RP², 3 critical points; S² with c=(2,1,1); c=(2,0,0,2), b=(1,0,0,1) | ℚ: C−B = t+t² = (1+t)t, Q=t; 𝔽₂: Q=0; S²: C−B = 1+t, Q=1; control 1+t³ = (1+t)(1−t+t²) has coefficient −1, not in ℕ | ℕ[t] encodes the strong inequalities | none |
| 21 | §4.2 LS bound (sample) | S¹ height; T² height; constant on S¹; ∅ | 2≤2; 3≤4; 2≤⊤; 0≤0; Weber's cat ≥ 1 equals `lsCategoryCount` for nonempty M | sound | none |
| 22 | `exists_degenerateCriticalLevelDeformation` (headline) | S¹, f(θ)=(1−cos θ)², c=0, δ=1, U=(−1/2,1/2), ε=0.01 | critical set {0, π}; f ≈ θ⁴/4 at 0 (Hessian 0); f(π)=4 is outside the δ-band; sublevel at ε is −0.451 ≤ θ ≤ 0.451, inside U, so Φ=id meets the U-disjunct | sound | R02 |
| 23 | `exists_noCriticalOpenSublevelDeformation` (headline) | S¹ height, a=−1/4, b=1/4, δ=1/4; δ=3/4 | buffer band [−1/2,1/2] avoids ±1, endpoint value below −1/4; band [−1,1] contains both critical points, hypothesis fails | buffer used | R02 |
| 24 | `exists_criticalCategoricalCover` (headline) | ∅; point; S¹ height; T² height | `Fin 0`, vacuous; one set; two open arcs, each contractible in S¹; 4 sets ≥ cat 3, padded by ∅ (a constant map exists since M ≠ ∅) | sound | R02 |
| 25 | §4.3 Reeb citation (R01) | Tau Ceti a91d3aaf vs 2fd255d | a91d3aaf: no `Reeb.lean`; 2fd255d: `Reeb.lean:148`, compact, T2, boundaryless, `IsMorse`, count 2 | absent at this pin | R01 |
| 26 | §4.3 CP¹ and parity (sample) | f = ‖z₁‖²/(‖z₀‖²+‖z₁‖²); S² with c=(2,1,1) | near [1:0]: ‖w‖²/(1+‖w‖²) ≈ ‖w‖², index 0; near [0:1]: 1/(1+‖u‖²) ≈ 1−‖u‖², index 2; 2−1+1 = 2 = χ(S²); c(−f) = (1,1,2) | sound | none |
| 27 | `exists_twoEuclideanOpenCover_of_two_criticalPoints` (headline, sample 4.4) | S¹ round height; m=0; h−h³/3 | ‖grad h‖ = √(1−h²); on [−1/2,1/2], η = √3/2, η² = 3/4, (b−a)/η² = 8/3; two points, each ≃ ℝ⁰; band critical-free, both poles degenerate | flow estimate needs no normal form | none |
| 28 | `exists_closedBall_homeomorph_closure_of_bicollar` (headline, sample 4.4) | m=0; m=1 with β(+1,t) at angle εt and β(−1,t) at π+εt; equator of S² | m=0: S⁻¹=∅, Σ=∅, A={1}, B={−1}, closures ≃ {0}, the iff reads false ↔ (‖0‖=1), true; m=1: one collar side meets both arcs; hemispheres with frontier the equator | Brown Theorem 5 gives cells; frontier clause derived | none |
| 29 | `nonempty_homeomorph_sphere_of_two_euclidean_opens` (headline, R01) | S¹ as two arcs; X a point, m=0; X=ℝ^m | glued arcs give S¹; 1 point ≠ 2 = #S⁰, so `hm` is needed; ℝ^m not compact | sound; gluing input absent at a91d3aaf | R01 |
| 30 | `nonempty_homeomorph_sphere_of_two_criticalPoints` (headline, sample 4.4) | h−h³/3 on S²; h² on S^m; two copies of S²; m=0 | h = cos r gives f = 2/3 + (1/24 − 7/24)r⁴ = 2/3 − r⁴/4, Hessian 0, f(S) = −2/3; h²: count ⊤ (m≥2) or 4 (m=1), but only 2 critical values; two copies: at least 4; two points ≃ S⁰ | smooth-only statement correct | none |
| 31 | §5.1 Morse–Bott (sample) | y² vs y⁴; negative Möbius line; RP² cells | kernel span e₁ vs ℝ²; twisted H₀ = ℤ/2 vs ℤ; E¹ = (ℤ,ℤ,ℤ) with d=2, E² = (ℤ, ℤ/2, 0) | sound | none |
| 32 | `exists_compactTrapped_gradient_limit` (headline, sample 6.1) | x², x₀=1; metric 4dx²; γ≡0; f=x | γ=e^(−2t), E=e^(−4t), E′ = −4e^(−4t) = −(2γ)²; grad = x/2, γ = e^(−t/2), distance 2e^(−t/2); distance 0; f=x: trapping fails, no critical point | the rate depends on the metric, as the Check says | none |
| 33 | Section-id map (overlaps) | GitHub slugs | "4.4 Two critical points with arbitrary degeneracy" → `44-two-critical-points-with-arbitrary-degeneracy`; 7/7 old ids mapped, including HeegaardFloer's m2 (main line 647) and m5 (line 1064) | sound | none |
| 34 | docstring unstatable list (R02) | a91d3aaf vs 2fd255d | a91d3aaf has no `manifoldStrongWhitney` and no `lsCategoryCount`; 2fd255d has `Chart/Strong.lean:240`, `Generic/Strong.lean:267`, `Topology/Homotopy/LusternikSchnirelmann.lean:264`, `Morse/LusternikSchnirelmann.lean:185` | true now, false after R01 | R02 |

## Not verifiable

- **Milnor, *Morse Theory* (1963).** The README uses it for §2.2 (Theorem 3.1, p. 12), §2.3 (Lemma 3.6, pp. 20–21), §2.4 (Theorem 3.5, p. 20) and §3.2 (Corollary 6.7, p. 36). The sources service, run into a scratch manifest, found no legal source, and the roadmap's `sources.toml` has no entry for this work. These four locators were not re-read this round. Where Cohen–Iga–Norbury Theorems 5.1, 5.6 and 5.7 cover the same statements, the README agrees with them.
- **`hirsch-differential-topology`** (Chapter 2 §1; Chapter 6, Theorem 1.2): uncertified and settled; cited by locator.
- **Thomas Mark, Math240 Homework 11:** no legal text. It is used only for bibliographic attribution.
- **Elaboration at main's pins:** only Lean commands run from this worktree are permitted. The R02 comparisons were made by reading the Tau Ceti 2fd255d sources.
- **Gate rerun:** GitHub API rate limit, exit 77, before any check ran. The verdict relies on the worker's gate, my elaboration and the dependency check.
- **Ownership against ManifoldOptimization:** this is the closest open roadmap in vocabulary, but the brief supplies no files for it, so ownership against it was not checked.

## Source issues

- **Gap** in brown-1960 at Theorem 1, proof, p. 75: the source says the maps hᵢ converge to a map because consecutive differences are below 1/(i+1); it should be that hⱼ agrees with hᵢ off Qᵢ and preserves hᵢ(Qᵢ), so the sup-distance from hⱼ to hᵢ is below 1/i for all j>i; affects the proof.
- **Gap** in cohen-iga-norbury at Theorem 4.6, proof, p. 28: the source says the derivative of f∘γ tends to 0 because f∘γ is bounded and decreasing; it should be that −‖∇f‖²∘γ is integrable and uniformly continuous in t on compact M, hence tends to 0; affects the proof.
