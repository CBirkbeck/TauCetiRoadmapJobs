# Review of MorseTheory (pull request #1682 at a6876c4)

**Verdict:** needs changes

:robot: Independent AI full review of the roadmap folder `TauCetiRoadmap/MorseTheory/` at head a6876c44f1b512b3a103838bea5313f016b27171. This head is the one the previous review read: the change set is empty, so none of its findings can have been repaired, and every passage was reviewed afresh below. Five findings, two blocking (P2). The gate, the dependency check, the targeted build and direct elaboration all pass; the mathematics of every sampled target checks out on computed instances. The two blocking findings concern where the Palais–Smale extension lives and how its headline is stated, not its truth. No pull-request file was changed.

## R01 (P2) — The nonproper Palais–Smale theory is an extension of an existing roadmap and belongs in MorseTheoryPartII

**Location:** `TauCetiRoadmap/MorseTheory/README.md:1097–1185` ("### 6.2 Palais–Smale compactness without properness" through its Dependencies) and `TauCetiRoadmap/MorseTheory/PalaisSmaleTargets.lean:1–56`.

**Claim:** The pull request adds, to the roadmap on main, a sequential compactness condition, a noncompact critical-free-band deformation on complete manifolds, infinite forward lifetime, global convergence with exponential rate and minimum attainment, with a companion Lean file for them.

**Witness:** Main's `TauCetiRoadmap/MorseTheory/README.md:649–680` (M6) stops at compact trapping and proper, bounded-below sublevels, and its line 14–16 names Palais–Smale only to exclude it from the Morse predicate. The folder's history on main has one content commit (#884), so this is the first revision. The separating instance: f(x,y)=x on ℝ² has ‖grad f‖=1, so the sequential condition holds vacuously, while f⁻¹[0,1]=[0,1]×ℝ is not compact, so no target of M2 or M6 on main applies; §6.2's normalized flow (x,y)↦(x−t,y) stopped at time max(x,0) retracts {x≤1} onto {x≤0}.

**Exact repair:** Move §6.2, its Checks and Examples, the Morgan reference and the Palais–Smale acceptance statements into a new roadmap MorseTheoryPartII whose introduction says where the base stops (compact bands in §2.2, compact trapping in §6.1) and which consumes §2.2 and §6.1 by section. Keep in this pull request only the corrections to existing targets (Layers 1–6.1, the restructured headings, the native headlines). The moved text needs no mathematical change: every §6.2 instance in the table below (f=x², f(x,y)=x, f=e^(−x), the 4g rescaling, the zero-dimensional case) keeps its value under the move.

## R02 (P2) — The Palais–Smale headline is statable on the promised native manifolds but is stated only on a vector space, without its rate

**Location:** `TauCetiRoadmap/MorseTheory/README.md:1124–1142` ("On a complete manifold, every maximal forward negative-gradient trajectory … Deduce exponential convergence, finite forward tail length and the … minimum-attainment corollary") and `README.md:1152–1155` ("suggests … on the native finite-dimensional real inner-product-space specialization"); `TauCetiRoadmap/MorseTheory/PalaisSmaleTargets.lean:47–54` (`exists_forwardTrajectory_converges`); the module docstring of `Suggested.lean:6–24`, which does not name this headline.

**Claim:** The README promises, for a complete smooth Riemannian manifold, a Morse bounded-below f and the metric's sequential condition, forward existence, convergence to a critical point and intrinsic exponential decay. The Lean statement quantifies over a fixed inner-product space E, concludes convergence with no rate, and the acceptance test neither states the manifold headline nor says which carrier it lacks.

**Witness:** A scratch prototype with exactly the native carriers elaborated at the pins with a single `sorry` warning: a predicate `IsPalaisSmale` on `M → ℝ` built from `Riemannian.Tensor.rieszDual` (`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Riesz.lean:74`), and a theorem over `[EMetricSpace M] [IsManifold I ∞ M] [SecondCountableTopology M] [Bundle.RiemannianBundle …] [IsContMDiffRiemannianBundle I ∞ E …] [IsRiemannianManifold I M] [CompleteSpace M]` with `TauCeti.IsMorse I f`, the predicate and `BddBelow (range f)`, concluding `IsMIntegralCurveOn γ (fun y ↦ -rieszDual y (mfderiv I 𝓘(ℝ) f y)) (Ici 0)`, a critical limit p and `edist (γ t) p ≤ ENNReal.ofReal (C·exp(−c t))` for t ≥ T. So no carrier is missing. The round circle with f=cos θ from θ₀=π/2 has θ(t)=2 arctan(eᵗ): at t=1, θ′=0.648054=sin θ(1), and the distance to π is 0.705027 ≤ 2e⁻¹=0.735759; the circle is not any vector-space carrier E of the file.

**Exact repair:** In the Part II `Suggested.lean` (R01), define the sequential predicate on native manifolds as in the prototype (the only new definition, with a real body) and state the headline with the manifold, smooth-metric, compatible-complete-distance, Morse, bounded-below and Palais–Smale hypotheses and the intrinsic exponential conclusion; delete the vector-space file. If the vector-space statement is kept as a Check in the README, it is prose, not Lean. The repaired statement covers the circle computation above, the zero-dimensional constant curve (distance 0 for every C,c) and f=x² with γ=x₀e^(−2t) (C=|x₀|+1, c=2, T=0).

## R03 (P3) — The companion Lean file violates the Lean form rules

**Location:** `TauCetiRoadmap/MorseTheory/PalaisSmaleTargets.lean:1–10` ("import TauCeti.Analysis.Calculus.Morse.Basic / import Mathlib.Analysis.Calculus.Gradient.Basic / … / Suggested forms, not an exhaustive checklist. … These signatures specialize M6.1").

**Claim:** The form rules apply to every `.lean` file in the folder.

**Witness:** Lines 2–4 are three `Mathlib.<submodule>` imports and there is no `import Mathlib` line; the docstring is not a "<title>: target signatures" docstring and names a section "M6.1" that does not exist (the README's section is §6.2); the five names `Satisfies`, `of_isProperMap`, `finite_criticalValueBand`, `exists_gradient_lowerBound`, `exists_forwardTrajectory_converges` occur nowhere in `README.md` (the gate's name check reads only `Suggested.lean`, so it did not see this). `Satisfies` keeps `[CompleteSpace E]` from the section block while its type does not need it beyond finite dimension.

**Exact repair:** Under R01–R02 the file is deleted and its surviving statements live in Part II's `Suggested.lean` with `import Mathlib` plus the used `TauCeti.*` modules, a module docstring of the required form, the layer heading, and every kept name written in the README. The x² instance keeps its values after the move: critical band {0}, η=2 on the band [1,4], γ=x₀e^(−2t).

## R04 (P3) — A native module cited in §2.2 does not exist at the pinned Tau Ceti

**Location:** `TauCetiRoadmap/MorseTheory/README.md:458–459` ("Native `Analysis/Calculus/Morse/CompactSublevel` gives vector-space orbit/trajectory compactness, not a cell-attachment or band deformation.").

**Claim:** A pinned Tau Ceti module `Analysis/Calculus/Morse/CompactSublevel` supplies vector-space orbit compactness.

**Witness:** At Tau Ceti a91d3aaf the directory `TauCeti/Analysis/Calculus/Morse/` has 22 files (Basic, ContinuousLevelSlice, Convergence, ExponentialConvergence, ExponentialDichotomy, FlowExistence, Generic, GradientFlow, GraphChart, HessianFlow, Index, LevelSlice, Linearization, LocalInvariantManifold, LocalToGlobal, NormalForm, OrbitSlice, Prod, RegularLevel, SpectralSplitting, SplitModel, Stable) and no `CompactSublevel`; `grep -ril sublevel` over that directory is empty. Nothing is consumed from the phantom module, so no target depends on it; the sentence is a false library claim.

**Exact repair:** Delete the sentence, or replace it by the declaration that does exist and says what the sentence means: `TauCeti.IsIntegralCurveOn.exists_tendsto_atTop` in `TauCeti/Analysis/Calculus/Morse/Convergence.lean:272` (a negative-gradient curve mapped into a compact K with finitely many critical points in K converges to one of them), which is the vector-space orbit-compactness input and is indeed not a band deformation. The x² instance: K=[−|x₀|,|x₀|], critical set in K is {0}, limit 0.

## R05 (P3) — A redundant hypothesis on the sphere-recognition headline

**Location:** `TauCetiRoadmap/MorseTheory/Suggested.lean:151–152` (`[CompactSpace M] [ConnectedSpace M] (hdim : 0 < Module.finrank ℝ E)`); `README.md:916–917` ("a closed connected positive-dimensional M admitting a Morse function with exactly two critical points").

**Claim:** Connectedness is a separate hypothesis of the two-critical-point sphere theorem.

**Witness:** With compactness, positive dimension and exactly two critical points, connectedness follows: each component of a compact manifold carries a minimum and a maximum of f, and on a positive-dimensional component these are distinct points (a Morse function is not constant on it, since a constant has Hessian 0), so a second component would give at least four critical points, against `encard = 2`. The source (cohen-iga-norbury line 1617, Application 5.13, p. 43) assumes only a closed manifold.

**Exact repair:** Take or leave: drop `[ConnectedSpace M]` from the Lean statement and "connected" from README:916, or keep both as a harmless convenience. Either way the statement is unchanged on S² (height, two critical points, homeomorphic to S²) and still excludes the point (dimension 0) and f=h−h³/3 (degenerate poles).

## Previous findings

The previous review read this same head, so the status is unchanged for every finding:

- R01 (Part II) — not repaired: README §6.2 at lines 1097–1185 and `PalaisSmaleTargets.lean` are unchanged; re-stated above as R01.
- R02 (manifold headline) — not repaired: README:1152–1155 and `PalaisSmaleTargets.lean:47–54` are unchanged; re-stated above as R02 with a fresh prototype elaboration.
- R03 (companion file form) — not repaired: `PalaisSmaleTargets.lean:1–10` unchanged; re-stated above as R03.
- R04 (source records) — the page locators added at fc36307…a6876c4 are correct (re-verified below). The manifest `sources.toml` is kept on the board, not in the roadmap folder, so adding records is not an edit the author can make inside this folder; I do not raise it as a finding. Hirsch and Mark remain uncertified under "Not verifiable".

No repair report marks any finding not actionable in this package.

## Verified sound

**Head, pins, gate.** Head a6876c44f1b512b3a103838bea5313f016b27171; Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 (committed 2026-10-05, so none of the manifold Morse work the folder's STATUS.md describes is at this pin; the Lean headlines restate no pinned declaration); main context 929496d4. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/MorseTheory'` is empty. The gate rerun on this head printed:

```text
gate MorseTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate additionally reports `build=0`. The dependency check printed `depcheck: 204 roadmaps, 1662 edges, 0 problem(s)` with no UPWARD, CYCLE or moved line; MorseTheory and all its suppliers are main roadmaps outside `ORDER.txt`. A scan of the README for process words (optional, deferred, later, removed, currently, so far, pull request, review, round labels, LaTeX delimiters) found none; the Lean files have no `lemma`, `set_option`, `#eval`, `#print` or `True` placeholder.

**Elaboration and signatures.** A combined scratch copy (Suggested.lean plus the Palais–Smale namespace, `import Mathlib` and the three Tau Ceti modules) elaborated with `lake env lean`: exit 0, exactly 16 `declaration uses sorry` warnings (12 + 4), and `#check @name` for all 21 declarations. I compared each elaborated type with its README statement. The three definitions the worker flagged (`criticalPoints`, `criticalCount`, `sublevelInclusion`) lose the standing geometric binders by design: README:32–35 says the raw critical-set and count definitions need only charted calculus and `sublevelInclusion` only a topological space, and their bodies use nothing else. All 12 base theorems retain `FiniteDimensional`, `Boundaryless`, `T2Space`, `IsManifold`, `SecondCountableTopology`; the four Palais–Smale theorems retain `FiniteDimensional` and `CompleteSpace`. Nothing changed, so no `#check` was rerun after an edit. One-tactic probe: a second scratch copy replacing every `sorry` by `first | rfl | simp | infer_instance | (intro x; simp)` produced 16 errors, one per admitted declaration; none closes, so no declaration is padding by that test. By reading: no declaration restates a definition, mirrors a Check or computes a value. The prototype of R02 elaborated separately with one `sorry` warning.

**Headline inventory.** From the README: normalized Morse charts and compact finiteness (§1.3); regular scalar levels with tangent kernel (§2.1); compact critical-free band deformation (§2.2); relative handle/CW comparison with coherent families (§2.3); the proper Morse CW model (§2.4); strong smooth Morse approximation (§3.1); proper bounded-below Morse existence (§3.2); strong Morse inequalities (§4.1); the arbitrary-function Lusternik–Schnirelmann bound with its two deformation bridges and categorical cover (§4.2); two-critical-point sphere recognition (§4.3); Morse–Bott normal form, negative-bundle attachment and filtered inequalities (§5.1); compact-trapped convergence with exponential decay (§6.1); Palais–Smale forward existence, convergence and minimum attainment (§6.2). `Suggested.lean` states the first three, the CW model, exhaustion existence, the inequalities, the sphere theorem, the two deformations with the categorical cover, and the compact-trapped limit; its docstring names the coherent-family handle comparison, the strong topology and the Morse–Bott carriers as not statable, which is correct at the pins (no strong topology on `C^∞⟮I,M;ℝ⟯`, no critical normal bundle splitting, no filtered attachment complex). The §6.2 headline is statable and absent: R02.

**Sources.** Four works were read in the sources cache under their stable keys `milnor-morse` (Edinburgh institutional copy, 79 two-page spreads), `cohen-iga-norbury` (Stanford author copy, 232 pages; printed page = PDF page − 13), `weber-conley` (author copy; printed = PDF page) and `morgan-condition-c` (author copy; printed = PDF page). No passage was copied. Locators checked at the sampled targets:

| Target | Evidence read | Result |
| --- | --- | --- |
| 1.1 Model transport | Pinned `ModelWithCorners.Boundaryless` (`range I = univ`, `I.toHomeomorph`), `PartialDiffeomorph` structure; ComplexManifolds Milestone 1 heading on main (line 172) | No source claim; supplier and carriers resolve. |
| 1.2 Critical Hessians and counts | `TauCeti/Geometry/Manifold/Morse/Index.lean:74,140,154`; cohen-iga-norbury line 1423 (Cor 5.4, p. 38) | Complementary-index theorem carries the nondegenerate-Hessian premise the README states; discreteness of the critical set is the cited corollary. |
| 1.3 Normal forms and persistence | cohen-iga-norbury line 1322 (Thm 5.3, pp. 36–37), line 1423 (Cor 5.4, p. 38); `Mathlib/Analysis/Calculus/ImplicitContDiff.lean:90` (`contDiffAt_implicitFunction`) | Morse lemma with index λ and signed squares; implicit-function smoothness exists at the pin with the `n ≠ 0` and invertibility hypotheses the README's route supplies. |
| 2.1 Scalar levels and regular boundary faces | `Section/Chart.lean:52–58,136,213–214,246` (`hf,hFred,hsurj,hindex,hb,he`, `sectionZeroChartAt_apply`, `sectionZeroChartedSpace`), `Section/Manifold.lean:151–154` (`include hs`), `Boundary/Charts.lean:195`, `ImplicitFunctionTheorem.lean:79–88`, `Mathlib/Geometry/Manifold/Submersion.lean:153,179` (`IsSubmersionAtOfComplement`, `mk_of_charts`); morgan-condition-c line 183–188 (p. 6) | Every named constructor input and law exists with the stated shape; the kernel-chart equation matches line 136–141. |
| 2.2 Deformation and adapted fields | milnor-morse line 2225 (Thm 3.1, p. 12; PDF spread 9 carries printed 12–13); cohen-iga-norbury line 1202 (Thm 5.1, pp. 33–35) | Milnor assumes the band compact, not M; Cohen's version is a compact manifold with boundary whose boundary is the two levels. R04 concerns the phantom module in this section. |
| 2.3 Handles and change of chart | milnor-morse line 3623 (Lemma 3.6, pp. 20–21; spread 13 carries 20–21); cohen-iga-norbury line 1438 (Thm 5.6, pp. 38–40) | Whitehead's comparison for homotopic attaching maps and the single-cell attachment; see source issues for slips not adopted. |
| 2.4 CW exhaustion | milnor-morse line 3565 (Thm 3.5, p. 20); cohen-iga-norbury line 1519 (Thm 5.7, pp. 40–41) | Milnor: nondegenerate critical points and every M_a compact; Cohen: closed M. Proper plus bounded below gives Milnor's hypothesis. |
| 3.1 Strong smooth approximation | Hirsch Ch. 2 §1 and Ch. 6 Thm 1.2: not readable (below) | Statement is the standard one; uncertified. |
| 3.2 Exhaustions and relative approximation | milnor-morse line 6228 (Cor 6.7, p. 36; spread 21 carries 36–37) | Existence of a nondegenerate function with compact sublevels on any manifold. |
| 4.1 Strong inequalities | cohen-iga-norbury line 1569 (Cor 5.11, p. 42) | Alternating sums over k ≤ i; the README's polynomial form is equivalent with Q ∈ ℕ[t]. |
| 4.2 Arbitrary-function LS inequality | weber-conley line 65–67 (Thm 1.1, p. 2), 73–106 (proof, pp. 2–3) | C² function on a closed manifold, cat = least number of nullhomotopic open sets; no nondegeneracy. |
| 4.3 Sphere and projective applications | cohen-iga-norbury line 1617 (Application 5.13, p. 43) | Closed manifold, two critical points, homeomorphic to Sⁿ; Remark 5.2 there says not diffeomorphic. |
| 5.1 Critical normal bundles and attachments | cohen-iga-norbury line 4986 (Thm 15.1, p. 143), 5091 (Thm 15.4, p. 146), 5142 (Thm 15.6, p. 147), 5161 (Thm 15.7, pp. 147–148) | Pages correct; the README's neighborhood-of-zero-section and E¹ conventions correct two slips listed below. |
| 6.1 Compact trapping | cohen-iga-norbury line 1022 (Thm 4.6, pp. 27–29); `Convergence.lean:272`, `ExponentialConvergence.lean:239,262` | Closed-manifold convergence; pinned vector-space convergence and exponential estimates exist with the hypotheses the README lists. |
| 6.2 Palais–Smale compactness without properness | morgan-condition-c line 198–203 (Def 1.6, Rem 1.7, p. 6), 205–258 (Prop 1.8, pp. 6–7) | Sequential condition, complete metric and the critical-free product; the roadmap uses the sequential form (see source issues). |

**Pinned declarations opened.** Paths are relative to the respective library root at the pin.

| File and line | What was checked |
| --- | --- |
| `TauCeti/Geometry/Manifold/Morse/Basic.lean:59,99,170` | `IsManifoldNondegenerateCriticalPoint`, `IsMorseOn` (smooth on s and preferred-chart critical points nondegenerate), `IsMorse := IsMorseOn univ`. |
| `TauCeti/Geometry/Manifold/Morse/Index.lean:74,140,154` | `manifoldMorseIndex` is the preferred-chart `morseIndex`; the complementary-index theorem needs a nondegenerate preferred-chart Hessian. |
| `TauCeti/Analysis/Calculus/Morse/Index.lean:236` | `exists_hessianQuadraticForm_equivalent_weightedSumSquares` gives ±1 weights, so the README's division by √2 after the Hessian isometry is the right normalization (Hessian 2, not 1). |
| `TauCeti/Analysis/Calculus/Morse/Basic.lean:136`; `NormalForm.lean:217`; `Generic.lean` header | `HasNondegenerateCriticalPointsOn`; `exists_congruence_of_symmetric_family` (fixed reference form B₀, so the base-dependent extension is correctly owned here); linear-perturbation genericity. |
| `TauCeti/Analysis/Fredholm/Basic.lean:57`, `Index.lean:83`, `Criteria.lean:146` | `isFredholm_of_finiteDimensional`, `index_eq_of_finiteDimensional`, `finrank_ker_eq_iff_index_eq`. |
| `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Riesz.lean:74,85` | `rieszDual`, `inner_rieszDual`. |
| `TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/Singular.lean` | the two finite-CW singular homology theorems named in the supplier contract exist. |
| `Mathlib/Geometry/Manifold/IntegralCurve/Basic.lean:65`; `Riemannian/PathELength.lean:207`; `Riemannian/Basic.lean:79`; `VectorBundle/Riemannian.lean:67`; `Topology/VectorBundle/Riemannian.lean:420` | `IsMIntegralCurveOn`, `riemannianEDist` (needs only an `ENorm` on fibres), `IsRiemannianManifold` (needs a `PseudoEMetricSpace`), `IsContMDiffRiemannianBundle`, `RiemannianBundle`. |
| `Mathlib/Geometry/Manifold/SmoothEmbedding.lean:72`; `Immersion.lean:758`; `MFDeriv/NormedSpace.lean:448`; `Topology/CWComplex/Classical/Basic.lean:99,135`; `AlgebraicTopology/SingularHomology/Basic.lean:52`; `Topology/Homotopy/Contractible.lean:26` | `IsSmoothEmbedding` (immersion and embedding, no separation axiom), `IsImmersionOfComplement.comp_diffeomorph`, `mvfderiv`, `RelCWComplex`/`CWComplex` (no `T2Space` built in; `Suggested.lean:112` adds it), `singularHomologyFunctor`, `Nullhomotopic` (needs a point of the target). |

**Cross-roadmap citations resolved on main** (`TauCetiRoadmap/…/README.md`): DifferentialGeometry Layer 3 (line 371), Layer 5 with `boundaryOrientation_spec` (503, 509), §10.2 Sard (884), Layer 12 with §12.2 `mgradient`/`inner_mgradient`/`mgradient_eq_gradient` (910, 918–919) and §12.3 Hessian (921); AlgebraicTopology Stages 2–8 (326–1602), item 4.4 `diskBoundaryRelCW` (624), item 4.5 `relativeCWPushout`, `homotopyPushoutGluingComparison`, `cofibrationTowerHomotopyEquivalence`, `cwSubcomplexTowerUnion`, `relativeCWPushoutCWModel` (644–716), item 4.6 real projective space (789), §6.1–§6.2 (1011, 1056) and the categorical-cover supplement after 6.2 with `LSCategoricalCover`, `lsCategoryCount`, `normalizedLSCategory`, `lsCupLength` (1082–1123); GeometricTopology Layer 1 collars (177, 205); CharacteristicClasses C2 (550); ComplexManifolds Milestone 1 (172); ComplexKahlerGeometry K7, K7.1 (1405, 1407); DGFloer Layer 1 item 3 `SpectralObject` (615–621); HeegaardFloer Lane M (57); RiemannianGeometry R3 (82–127); AffineMorseLefschetz (189–213) and SymplecticGeometry/ConvexityToric T2 (73–75) as consumers. HomotopySpheres is not on main; its open head consumes MorseTheory M5 (its line 125–127), and this README cites it only as a consumer. MorseNovikov on main (47, 580) and at its open head (22, 130, 377) consumes M1–M4 and M6 and adds nothing this roadmap cites. No supplier is cited upward; no gap is declared.

**Ownership by object.** Searched on main and across the open heads: the sequential Palais–Smale condition on finite-dimensional manifolds has no other owner (the only "Palais" hits elsewhere are Palais's extension and local-triviality papers in GeometricTopology and DGFloer); `bettiNumber` occurs in no other `Suggested.lean`; GeometricTopology Layer 3 owns the C^∞ topology on `Diff(M)` for compact M (its line 357–380), a different carrier from the strong topology on real functions on noncompact M here; LS category carriers are consumed from AlgebraicTopology, not restated; Morse–Smale trajectory spaces stay with HeegaardFloer. Ownership against open pull requests without supplied files was not checked.

**Adversarial table.** Each row computed on the instance named; rows marked (sample) are seeded targets, (headline) Lean statements, (finding) targets a finding touches.

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1 | §1.1 transport of derivatives (sample) | f(x)=x, rechart y=2x | derivative in x: 1; in y: 1/2; chain product (1/2)·2=1 | transport, not equality; sound |
| 2 | §1.1 boundaryless hypothesis (sample) | half-line model | range I=[0,∞)≠ℝ; `range I=univ` fails | excluded as stated |
| 3 | §1.2 Hessian convention (sample) | f=−x²+y² | d²f=diag(−2,2); index 1; one critical point | matches Check; no factor 1/2 |
| 4 | §1.2 complementary index premise (sample) | f=0 on ℝ; f=x² | 0+0=0≠1; 0+1=1 | nondegeneracy needed, as stated; pinned theorem has it |
| 5 | `criticalCount` on infinite locus (headline) | constant on S¹ | encard=⊤; `Nat.card` would give 0 | ℕ∞ is essential |
| 6 | §1.3 normalized chart (sample, headline) | f=2x² | ψ=√2·x gives f=ψ²; Hess f=4, normalized Hess 2 | √2 division correct |
| 7 | §1.3 persistence (sample) | f_t=x²+tx; f_t=x³−tx | x_t=−t/2, value −t²/4, index 0; second: 0 roots for t<0, Hess 0 at t=0 | branch cannot cross birth–death |
| 8 | §1.3 compact Cᵏ seminorms (sample) | h=δx² on [−1,1] and [−1/2,1/2] | suprema (δ,2δ,2δ) and (δ/4,δ,2δ) | restriction need not shrink every order |
| 9 | `finite_criticalPoints_inter` (headline) | x² on [−1,1]; constant on S¹ | 1 point; constant fails `IsMorse` | compactness plus isolation |
| 10 | §2.1 regular level (sample, headline) | f(x,y)=x, c=0 | level ℝ, Di(v)=(0,v), range=span e₂=ker(1,0) | sound |
| 11 | §2.1 dimension 0 (sample, headline) | point, f=0, c=0 and c=1 | 0→ℝ not onto, so level ∅ for regular c; model `Fin (0−1)=Fin 0` | empty level, vacuous atlas |
| 12 | §2.1 Fredholm index (sample) | D(x,y)=x | ker dim 1, coker 0, index 1=2−1 | integer and natural index agree |
| 13 | §2.1 face coordinates (sample) | f=x on band [a,b] | lower f−a≥0, upper b−f≥0, sublevel a−f≥0 | signs correct |
| 14 | §2.1 outward sign (sample) | [a,b] with dx | outward −∂ₓ at a: sign −; +∂ₓ at b: sign + | matches Check |
| 15 | §2.2 strong retraction (sample, headline) | f=x², a=1, b=4 | r(x)=max(−1,min(x,1)); r∘incl=id on [−1,1] | matches Milnor 3.1 |
| 16 | §2.2 normalized field (sample) | x² on [a,b], a>0 | X=−1/(2x); d(x²)/dt=−1; hitting time x²−a | denominator ≥4a>0 |
| 17 | §2.2 adapted field sign (sample) | −u²+v², X=(2u,−2v) | df(X)=−4(u²+v²)<0; wrong field (−2u,−2v) gives +4u² on v=0 | sign pinned |
| 18 | §2.2 dimension 0 band (sample, headline) | discrete M | every point critical (TangentSpace=0), so a critical-free band is ∅; r=id | sound |
| 19 | `sublevelInclusion` laws (headline) | x², levels 1→4→9, x=1 | 1↦1 both ways; a=b: id; 1≤1 true | sound |
| 20 | §2.2 escape vs completeness | X=x² on ℝ | x=x₀/(1−x₀t), blowup 1/x₀ | smooth field need not be complete |
| 21 | §2.3 double-well chart (sample) | (x²−1)², y=x√(2−x²) | 1−y²=f at x=0,0.3,0.7,−0.9 (1, 0.8281, 0.2601, 0.0361 both sides) | chart identity exact |
| 22 | §2.3 attaching values (sample) | ε=1/2 | α₊(1)=0.541196, f=0.500000; α₋(1)=−0.541196 | different components; reflection needed |
| 23 | §2.3 RP² normalized chart (sample) | (u,v)=(0.2,0.5),(1.3,−0.4) | f=1.744186, 0.757895 = 2−X²−Y² | chart formula exact |
| 24 | §2.3 Milnor comparison seams (sample) | h=−id, λ=1 | at r=1/2 inner \|2x\|=1 and outer parameter 2−2r=1 agree; at r=1 parameter 0 gives α₁ | seams match Lemma 3.6 |
| 25 | §2.3 boost transition (sample) | A=[[cosh s,sinh s],[sinh s,cosh s]] | Q(A(x,0))=−x²; A_uu=cosh s≥1 | negative block invertible |
| 26 | §2.3 orientation law (sample) | λ=1,2, reflection | λ=1 swaps ±1; λ=2 degree −1; λ=0 empty boundary | exceptional low indices stated |
| 27 | `exists_morseCWModel` (sample, headline) | S² height; ℝ, x²; ∅; discrete ℕ, f(n)=n | cells (1,0,1); one 0-cell; no cells; ℵ₀ 0-cells | proper noncompact and empty cases hold |
| 28 | §2.4 empty start (sample) | x², a₀=−1 | M_(−1)=∅ | tower starts at the empty CW complex |
| 29 | §3.1 strong vs compact-open (sample) | ℝ, tolerance e^(−x²), constant δ | at large x e^(−x²)<\|δ\|; on [−1,1] \|δ\|<e⁻¹ passes | distinction correct |
| 30 | §3.1 restriction to open sets (sample) | δψ, ψ=1 near 0, on (0,1) | at x=δ/2 error δ>x; on [a,b]⊂(0,1), δ<a passes | only compact-core/clopen restriction asserted |
| 31 | `exists_proper_boundedBelow_morse` (sample, headline) | ℝ; point; ∅; discrete ℕ | x², constant 0, empty function, f(n)=n; constant on ℕ not proper | sound |
| 32 | §3.2 perturbation bound (sample) | x², \|g−f\|<1 | g≥−1; g≤b⇒x²<b+1 | exhaustion preserved |
| 33 | `bettiNumber` (headline) | point; ∅; S¹ | (1,0,…),(0,0,…),(1,1,0,…) | native finrank |
| 34 | `strong_morse_inequalities` (sample, headline) | S²; RP² over ℚ and 𝔽₂; ∅; r points | 1+t²=1+t²+0; 1+t+t²=1+(1+t)t (check at t=2: 7=7); 𝔽₂: Q=0; 0=0; r=r | sound |
| 35 | §4.1 negative control (sample) | c=(2,0,0,2), b=(1,0,0,1) | weak true; Euler 0=0; degree-1 strong −2≥−1 false | Check correct |
| 36 | §4.1 Q coefficient (sample) | RP² cellular ∂₂=2 over ℚ | rank ∂₂=1 ⇒ Q₁=1 | matches Q=t |
| 37 | §4.1 free subgroups (sample) | ⊕ₙ2ℤ⊂⊕ₙℤ | basis {2eₙ}, infinite rank | finite-rank PID lemma insufficient, as stated |
| 38 | §4.2 LS bound (sample) | S¹ height; constant; T²; ∅ | 2≤2; 2≤∞; cat 3≤4, cup length 2; 0≤0 | sound |
| 39 | `exists_criticalCategoricalCover` (headline) | ∅; nonempty compact M | Fin 0 cover, vacuous; crit≥1 by extreme value, so the cover is nonempty | sound |
| 40 | §4.2 minimum c(M) (sample) | ∅; point; r points; S¹ with 2- and 4-critical witnesses | 0; 1; r; min{2,4,…,∞}=2 | witness independence |
| 41 | `exists_degenerateCriticalLevelDeformation` (headline) | x⁴ at 0, U=(−r,r); no critical point at c | {x⁴≤ε}⊂U for ε<r⁴; empty hypotheses, band flow below c−ε | both disjuncts used |
| 42 | `exists_noCriticalOpenSublevelDeformation` (headline) | S¹ height, a=−1/4,b=1/4,δ=1/4 | no critical value in [−1/2,1/2]; endpoint f<−1/4 | buffer makes strict target achievable |
| 43 | §4.2 boundary exclusion (sample) | f(t)=t on [0,1] | df=1, no interior critical point | boundaryless premise needed |
| 44 | `nonempty_homeomorph_sphere_of_two_criticalPoints` (sample, headline, finding) | S² height; h−h³/3; point; two points | 2 nondegenerate points, S²; poles with Hessian 0 excluded; count 1≠2; disconnected excluded, and also ≥4 critical points if dim>0 | R05 redundancy |
| 45 | §4.3 CP¹ (sample) | f=\|z₁\|²/(\|z₀\|²+\|z₁\|²) | near [1:0]: g(r)=r²/(1+r²), g″(0)=2.0000; values 0,1; indices 0,2 | denominator positive, z≠0 |
| 46 | §4.3 parity (sample) | S²; T²; S¹ | 2≡χ=2; 4≡0; c(−f)=(1,1), χ=0 | sound |
| 47 | §5.1 Morse–Bott definition (sample) | y² vs y⁴ on ℝ² | kernel span e₁ vs ℝ² | second not Morse–Bott |
| 48 | §5.1 constant function (sample) | f=0 on compact M | normal rank 0, contribution B(M) | isolated points not inferred |
| 49 | §5.1 Thom shift (sample) | point base, rank λ | H_j(D^λ,S^(λ−1))=ℤ iff j=λ | recovers ordinary Morse |
| 50 | §5.1 orientation system (sample) | negative Möbius line over S¹ | twisted H₀=ℤ/2; constant ℤ gives ℤ | Check correct |
| 51 | §5.1 E¹ convention (sample) | RP² cells | E¹=(ℤ,ℤ,ℤ), d=2 on the 2-cell; E²=(ℤ,ℤ/2,0) | relative groups are E¹ |
| 52 | §6.1 trapped convergence (sample, headline) | x², γ=x₀e^(−2t) | E=x₀²e^(−4t), E′(0)=−4x₀²=−‖grad‖²; tail \|x₀\|e^(−2t) | constants consistent |
| 53 | §6.1 metric rescaling (sample, headline) | 4dx², x² | grad=x/2, γ=x₀e^(−t/2), tail length 2\|x₀\|e^(−t/2) (numerically 1.213092 vs 1.213061 at t=1, x₀=1) | rate depends on metric, as the Check says |
| 54 | §6.1 equilibrium (sample, headline) | γ≡0 | E=0, distance 0≤C e^(−ct) | no division by E |
| 55 | §6.1 non-Morse rate (sample) | x⁴, γ=(x₀⁻²+8t)^(−1/2) | decay t^(−1/2), Hess 0 | nondegeneracy needed |
| 56 | §6.1 extended distance (sample, headline) | two copies of ℝ, x² | cross-component distance ∞; in-component \|x₀\|e^(−2t) | `riemannianEDist` handles it |
| 57 | `Satisfies` positive/negative (finding) | x²; e^(−x) with x_j=j | 2\|x_j\|→0⇒x_j→0; values and gradients 4.540e−05 at j=10, no convergent subsequence | definition discriminates |
| 58 | §6.2 vacuous PS, nonproper (finding) | f(x,y)=x | ‖grad‖=1; band [0,1]×ℝ noncompact; flow (x−t,y) | witnesses R01's boundary |
| 59 | `of_isProperMap` (finding) | x² | \|f\|≤C ⇒ \|x\|≤√C, compact | sound |
| 60 | `finite_criticalValueBand` (finding) | x², [0,1]; x⁴; E=0 | {0}; x⁴ fails nondegeneracy; constant c gives {0} or ∅ | sound |
| 61 | `exists_gradient_lowerBound` (finding) | x² on [1,4]; a>b | η=2; empty band, η=1 | sound, honest vacuity |
| 62 | §6.2 endpoint buffers (finding) | critical points p_i with f(p_i)↑a | bounded values, gradient 0 ⇒ PS limit p with f(p)=a critical | contradiction, so a buffer exists |
| 63 | §6.2 forward lifetime (finding) | length² ≤ (t−s)(f(γ(s))−f(γ(t))) | ≤ T(f(γ(0))−L) on [0,T] | Cauchy tail; completeness supplies the endpoint |
| 64 | §6.2 escape example (finding) | e^(−x), x₀=0.3 | γ=log(e^(x₀)+t): γ′(1)=0.425557=e^(−γ(1)); normalized x′=eˣ blows up at e^(−x₀)=0.740818 | Check correct |
| 65 | `exists_forwardTrajectory_converges` (finding) | x²; f(x)=x | x²: γ=x₀e^(−2t)→0; f=x: PS vacuous, not bounded below, γ=x₀−t diverges | `BddBelow` necessary |
| 66 | §6.2 minimum attainment (finding) | x₀ with f(x₀)→inf m | ∫₀¹‖grad‖²≤f(x₀)−m ⇒ a point with ‖grad‖²≤f(x₀)−m; PS limit has f=m | nonempty M needed, as stated |
| 67 | §6.2 manifold headline (finding) | round S¹, cos θ, θ₀=π/2 | θ(t)=2 arctan eᵗ; θ′(1)=0.648054=sin θ(1); dist 0.705027≤2e⁻¹=0.735759 | R02: not covered by any vector-space E |
| 68 | §6.2 metric rescaling (finding) | g→4g | grad scales by 1/4, norm by 1/2; limit 0 unchanged | uniform equivalence suffices |
| 69 | §6.2 dimension 0 (finding) | E=0, f≡c | unique sequence converges; γ constant; band count 1 or 0 | all conclusions hold |

**Checks and Checks counts.** Every definition in the README (`criticalPoints`, `criticalCount`, the critical Hessian, compact Cᵏ neighborhoods, `sublevelInclusion`, adapted pseudo-gradients, strong neighborhoods, `bettiNumber`, the finite minimum, Morse–Bott, the Palais–Smale condition) has at least three Checks, and each evaluated above agrees with its section's theorems and with the other Checks on the same object; no Check names a Lean counterpart.

## Not verifiable

- `hirsch-differential-topology` (Chapter 2 §1, Chapter 6 Theorem 1.2): the only legal location found is the publisher's paywalled DOI 10.1007/978-1-4684-9449-5; no readable copy on arXiv, author or institutional pages. Cited by locator, uncertified; the statements are the standard strong-topology density theorem.
- `mark-math240` (Homework 10 problem 3, Homework 11): no legal text was found through the sources service or the author's pages; README:1214–1216 makes it bibliographic attribution only and certifies no target from it.
- The coherent-family comparison of §2.3, the continuous C² persistence of §1.3 and the base-dependent Morse–Bott normal form of §5.1 are owned extensions beyond the cited theorems; the sources prove only the single-chart or fixed-form cases, which the README says.
- Ownership against open pull requests whose files the brief does not supply was not checked.

## Source issues

- **Error** in morgan-condition-c at Remark 1.7, printed p. 6: the source says the set form of Condition (C) is equivalent to the sequential form; it should keep the sequential form, since f=0 on ℝ satisfies the set form while the sequence n has no convergent subsequence; affects a stated result.
- **Misprint** in morgan-condition-c at Definition 1.6, printed p. 6: the source says a critical value lies in the closure of the subset of M; it should say a critical point; affects nothing.
- **Misprint** in morgan-condition-c at the regular-point coordinate proof, printed p. 6: the source says the second coordinate of ψ(v) is the fixed value f(x); it should be f(v), which is what makes the derivative invertible; affects the proof.
- **Misprint** in morgan-condition-c at Proposition 1.8, printed p. 6: the source says f composed with the band-to-product diffeomorphism is the projection; it should say f equals the second projection composed with that diffeomorphism; affects a stated result.
- **Misprint** in morgan-condition-c at Proposition 1.8 proof, printed p. 7: the source says the enlarged upper endpoint is less than b; it should be greater than b; affects the proof.
- **Misprint** in morgan-condition-c at Proposition 1.9, printed p. 8: the source says the finite upper endpoint is less than negative infinity; it should be less than positive infinity; affects a stated result.
- **Error** in cohen-iga-norbury at Exercise 5.3, printed p. 38: the source says a critical level of a Morse function on a compact manifold is never a manifold; the minimum level of the height on a sphere is a point, a 0-manifold; affects a stated result.
- **Misprint** in cohen-iga-norbury at Theorem 5.6, printed p. 38: the source says the attached cell lies in the interior of M while its boundary lies on the lower level; it should place the open cell in the interior and the boundary on the level; affects a stated result.
- **Error** in cohen-iga-norbury at Theorem 15.1, printed p. 143: the source says the quadratic normal form holds on a product with whole Euclidean normal fibers mapped diffeomorphically into M; on a compact M the bounded f cannot satisfy it there, so the domain should be a neighborhood of the zero section; affects a stated result.
- **Misprint** in cohen-iga-norbury at Theorems 15.6–15.7, printed pp. 147–148: the source calls the relative homology of the filtration quotients the E² term; in the filtration spectral sequence it is the E¹ term, whose differential need not vanish; affects a stated result.
- **Misprint** in weber-conley at Theorem 1.1 proof, footnote 3, printed p. 3: the source labels the stable half-line of 0 for f(u)=u³ as Wᵘ(0); it should be Wˢ(0); affects nothing.
