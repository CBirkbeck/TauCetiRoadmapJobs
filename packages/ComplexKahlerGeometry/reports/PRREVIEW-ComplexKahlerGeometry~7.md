# Review of ComplexKahlerGeometry (pull request #1234 at 0cad4c7)

**Verdict:** accepted

This is a full re-review of the repaired head (689 changed lines since 6456ba7, the head the previous review read). The pull request revises the roadmap on main; no file outside `TauCetiRoadmap/ComplexKahlerGeometry/` changes (`git diff --stat origin/main...HEAD` outside the folder is empty). The previous review's findings are checked first, then the whole roadmap. No P1 or P2 finding survives; five P3 notes are the author's to take or leave.

## Previous findings (r3 at 6456ba7) at this head

| Finding | Status at 0cad4c7 |
| --- | --- |
| R01 (P1) K7.2 consumed ComplexComparisonPartII (cycle) | Repaired. The two consuming passages are gone; `README.md:1734–1738` now reads "the identification of the blowup's analytification with E over V needs scheme analytification and belongs to ComplexComparisonPartII … and is not a target here", and `README.md:1820–1825` leaves the general eventual surjectivity to ComplexComparisonPartII "and is not a target here". The "Order and references" sentence about C1.8 is deleted (`README.md:2117–2120`). ComplexComparisonPartII is named only as a consumer (`README.md:484, 593`). Dependency check: 0 problems. |
| R02 (P2) K2 solver and point Hartogs absent | Repaired. `Suggested.lean:111–131` states `exists_mixed_parameter_dbar_solution`; `Suggested.lean:151–157` states `hartogs_extension_across_point`; the docstring (`Suggested.lean:16–46`) now names every remaining headline with the carrier it lacks (Newlander–Nirenberg, Dolbeault/Hodge/Serre, Weierstrass/Rückert/coherence, Chern/Koszul–Malgrange, Pic_hol, K5a carriers, K7). README names both (`README.md:218–220, 448–450`). |
| R03 (P3) HTML anchors | Repaired: gate `residue=0`; no `<a id=` in the file. |
| R04 (P3) four companion Lean files | Repaired: all four deleted; the README keeps their statements as prose (`README.md:1395–1396, 1809–1811`) and Checks. |
| R05 (P3) nickname sources | Repaired: Ballmann, Berwick-Evans–Tripathy, Knutson and Łojasiewicz have reference entries with locators (`README.md:2153–2160`); "Demazure9 p1" and "the source page 21" are gone; the pointwise normal-coordinate criterion is marked as the roadmap's own strengthening (`README.md:1404–1408`). |
| R06 (P3) SchubertGeometry S3P | Repaired in substance: `README.md:668–671` cites GeometricQuantization for `H^q(K/H,𝒪)=0` and SchubertGeometry S5 for the algebraic counterpart; both sections exist (see R02 below for the consumer wording). |
| R07 (P3) ownership of the exponential comparison | Repaired: `README.md:589–597` names K4.P as owner, the consumers, and the normalisation in both conventions (see R01 below for one overclaim in that paragraph). |
| R08 (P3) padding | Repaired: `dbarFunction_apply_J`, `dbarFunction_eq_zero_iff`, `memSobolev_iff_bundled`, `complexBesselDistributionMultiplier_real` are gone; docstrings added to both multiplier definitions. |
| R09 (P3) `#279`/`#280`, VariationalMethods names, Checks/Needs | Repaired: gate `prnum=0`; `CompactFormPair.operatorDomainV` and §2.3/§5.1 (`README.md:1177–1190`) exist at the #1028 head (`VariationalMethods/README.md:494, 839, 845`; `Suggested.lean:185`); the new blocks have `*Needs:*` lines and `**Checks.**` lists (K4.P, K6.0, FS, TautologicalIncidence, RationalQuartic, FlatDegreeZero). The pre-existing on-main prose outside the new blocks keeps its older shape, as before. |

## R01 (P3) — K4.P claims to answer the whole K3SurfacesAndSymplecticBoundedness request; it answers one of its two items

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:591–592` ("It answers K3SurfacesAndSymplecticBoundedness's integral-Chern comparison request").

Claim: that roadmap's `gap:integral-topology` (its `README.md:203–207` at the #1375 head) asks ComplexKahlerGeometry for two generic results: the exponential comparison, and an intersection adapter identifying `c₁(O(D))` with the Poincaré dual of a divisor and cup-evaluation with analytic divisor intersection on a compact complex surface. K4.P supplies exactly the first; nothing in K4.P or K6.1 states the second.

Witness: K3SurfacesAndSymplecticBoundedness `README.md:205` ("Intersection adapter: identify c₁(O(D)) with the Poincaré dual of D …"); `grep -n "Poincaré dual" README.md` in this folder finds no divisor statement.

Repair: write "It supplies the exponential-comparison item of K3SurfacesAndSymplecticBoundedness's `gap:integral-topology`; the intersection adapter of that gap is not a target here." (or add that adapter as a K6.1 target with its own hypotheses, which this pull request need not do). Test: the sentence then matches the gap text item by item.

## R02 (P3) — Two consumers are described as consuming K4.P when their own text does not

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:593–594` ("ComplexComparisonPartII C5.4, K3Surfaces 1.1 and GeometricQuantization consume this construction rather than restating it") and `README.md:668–671` ("GeometricQuantization proves the flag-specific vanishing … and SchubertGeometry S5 proves its algebraic counterpart on Schubert varieties; both consume K4.P").

Claim: SchubertGeometry on main never cites ComplexKahlerGeometry (`grep -c ComplexKahlerGeometry TauCetiRoadmap/SchubertGeometry/README.md` is 0); its S5 is an algebraic vanishing theorem with no Picard input. GeometricQuantization at the #1186 head takes the exponential segment from ComplexComparisonPartII C5.4 (`GeometricQuantization/README.md:641–650`), and ComplexComparisonPartII C5.4 at the #848 head still plans the sequence itself (`ComplexComparisonPartII/README.md:145`). The ownership direction is right (this roadmap is on main and earlier than all three), so these are consumers that should cite K4.P; the sentences state it as fact.

Witness: SchubertGeometry `README.md:70–76` (S5: `H^q(X(w),Lλ)=0` by splitting and Serre vanishing, no analytic input); GeometricQuantization `README.md:649`.

Repair: in `README.md:593–594` write "are its consumers" (an owner's statement of direction) and in `README.md:668–671` drop "both consume K4.P" or restrict it to GeometricQuantization. The duplication in ComplexComparisonPartII C5.4 is that roadmap's to repair by citing K4.P; it is recorded here, not raised against this pull request.

## R03 (P3) — Two definitions in `Suggested.lean` make no headline statable

Location: `TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean:182–193` (`complexBesselMultiplier`, `complexBesselDistributionMultiplier`); `README.md:953–955`.

Claim: after R08's deletions no theorem in the file mentions either definition; the file's rule admits definitions only to make a headline statable. `complexBesselSymbol` is used by `complexBesselSymbol_temperate` and stays.

Witness: `grep -n "complexBesselMultiplier\|complexBesselDistributionMultiplier" Suggested.lean` returns only the two definitions and their docstrings.

Repair: either delete the two definitions from `Suggested.lean` and drop their backticks in `README.md:953–955` (the README keeps them as targets), or keep `complexBesselMultiplier` and state the K5a imaginary-axis isometry that uses it; this signature elaborates at the pins with one `sorry` (scratch copy, `lake env lean`, exit 0):

```lean
theorem complexBesselMultiplier_imaginary_axis_isometry (n : ℕ) (t : ℝ)
    (f : 𝓢(EuclideanSpace ℝ (Fin n), ℂ)) :
    ∫ x, ‖SchwartzMap.fourierMultiplierCLM ℂ (complexBesselSymbol n (t * Complex.I)) f x‖ ^ 2 =
      ∫ x, ‖f x‖ ^ 2 := by
  sorry
```

Test: `|exp((it/2)·log(1+‖ζ‖²))| = 1`, so Plancherel gives the identity; at `t = 0` the multiplier is the identity and both sides agree trivially.

## R04 (P3) — A Check names the wrong "plausible wrong model"

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1782–1784` ("a convention taking `F(A_t x)=t^(−k)F(x)` would attach `V` instead of `V*` to `k=1`").

Claim: under that inverse convention the degree-one space is the entire functions with `F(tv)=t⁻¹F(v)`, which is zero (`F(0)=lim t⁻¹F(v)` forces `F=0`); `V*` would then sit at `k=−1`. Nothing attaches `V`.

Witness: for `φ ∈ V*`, `φ(tv)=tφ(v)`, so `φ` has degree `+1` and degree `−1` is empty; the Check's first sentence computes exactly this.

Repair: "a convention taking `F(A_t x)=t^(−k)F(x)` would make the `k=1` space zero and put `V*` at `k=−1`, contradicting `H⁰(P(V),O(1))≃V*`." Test: `d=2`, `φ=v₁`: `φ(tv)=tv₁`, degree `+1`.

## R05 (P3) — A statable instance of the K2 Dolbeault–Grothendieck lemma is neither stated nor named

Location: `TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean:21–25` (docstring: "no `(p,q)`-form carrier"); `README.md:203–204`.

Claim: the general `(p,q)` statement indeed has no carrier, and the docstring says so honestly, so this is not a P2. But the `(0,1)` case on an open polydisc, written in coordinates exactly as the parameter solver is, elaborates at the pins (scratch copy, exit 0, one `sorry`):

```lean
theorem dbar_lemma_degree_one {n : ℕ} (r : Fin n → ℝ) (f : Fin n → (Fin n → ℂ) → ℂ)
    (hf : ∀ j, ContDiffOn ℝ ∞ (f j) {z | ∀ k, ‖z k‖ < r k})
    (hcompat : ∀ j k, ∀ z ∈ {z : Fin n → ℂ | ∀ k, ‖z k‖ < r k},
      (fderiv ℝ (f j) z (Pi.single k 1) + Complex.I * fderiv ℝ (f j) z (Pi.single k Complex.I)) / 2 =
      (fderiv ℝ (f k) z (Pi.single j 1) + Complex.I * fderiv ℝ (f k) z (Pi.single j Complex.I)) / 2) :
    ∃ u : (Fin n → ℂ) → ℂ, ContDiffOn ℝ ∞ u {z | ∀ k, ‖z k‖ < r k} ∧
      ∀ j, ∀ z ∈ {z : Fin n → ℂ | ∀ k, ‖z k‖ < r k},
        (fderiv ℝ u z (Pi.single j 1) + Complex.I * fderiv ℝ u z (Pi.single j Complex.I)) / 2 = f j z := by
  sorry
```

Repair: state it under `/-! ## Layer K2 -/` (it is the whole-polydisc exactness the README promises at `README.md:211`, in degree one), or say in the docstring that only the general `(p,q)` form is withheld. Test: `n=1`, `f₁=z̄`: `u=|z|²`, `∂̄u=z̄`; `n=2`, `f=(z̄₂,0)` fails compatibility (`∂̄₂f₁=1≠0=∂̄₁f₂`) and is excluded by `hcompat`.

## Verified sound

**Principles.** Read all 2160 README lines and the 197-line `Suggested.lean`, and the full 689-line change set. No route-specific shortcut, no re-planning of another roadmap (the pull request revises the roadmap that is on main; its additions K4.P, K6.0's coordinates, the FS block, K7.2.TautologicalIncidence, K7.2.RationalQuartic and K7.FlatDegreeZero have no other owner, see below), no upward supply, no copied passage, no algorithm, no sorry'd data, no `set_option`, no admitted `example`. Ownership of the exponential comparison is recorded in the README; the one remaining mutual citation (TopologicalKTheory T1.6d ↔ K7.2 / K4.P) is item-disjoint as the README says (`README.md:2111–2116`) and T1.6d's smoothing clause is the last sentence of `TopologicalKTheory/README.md:577–612` on main.

**Gate** (rerun by me on 0cad4c7): every counter 0, `OK`. Dependency check printed exactly:

```text
depcheck: 204 roadmaps, 1651 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Lean.** `lake env lean` on `Suggested.lean` from the worktree: exit 0, five `sorry` warnings (lines 76, 111, 140, 151, 175), nothing else. Imports: `import Mathlib` plus two `TauCeti.*` modules that exist at the pin (Tau Ceti `a91d3aa`, Mathlib `6b7abb3`). The signature file's "structure `induced`" at line 19 is a misparse of the docstring; no such declaration exists.

Section-binder audit (the 11 elaborated types compared with the README): `nijenhuisOnFields` and `IsKahler` drop `[CompleteSpace E] [FiniteDimensional ℝ E] [T2Space M] [I.Boundaryless]`, which a pointwise total expression and a `Prop` do not need; `nijenhuisOnFields_eq_of_eq` keeps all four. The two multiplier definitions drop `[CompleteSpace G]`, which `SchwartzMap.fourierMultiplierCLM`/`TemperedDistribution.fourierMultiplierCLM` do not require (their elaborated types carry no completeness). `exists_mixed_parameter_dbar_solution` carries `[FiniteDimensional ℝ EP] [I.Boundaryless] [T2Space P] [SecondCountableTopology P]` and `[FiniteDimensional ℂ E]`, matching the README's "finite-dimensional smooth parameter manifold" under the Conventions (`README.md:12`) and "Q ⊆ ℂ^m any open complex parameter domain" (the Lean is the coordinate-free form, equal in generality). `hartogs_extension_across_point` carries `2 ≤ finrank ℂ E` as the README's "dimension at least two"; it omits T2 and second countability, which the extension does not need (it is a chart-local statement). `realified_isManifold_analytic` matches `README.md:317–320`. Nothing changed.

Padding probes (scratch copy, one tactic each): `nijenhuisOnFields_eq_of_eq` with `simp [nijenhuisOnFields, hXx, hYx]`: unsolved goals; `exists_mixed_parameter_dbar_solution` with `exact ⟨f, hf, hfhol, by simp⟩`: `simp` made no progress; `realified_isManifold_analytic` with `infer_instance`: instance not found (no manifold-level restriction of scalars exists at the pin: `grep restrictScalars Mathlib/Geometry/Manifold` finds only pointwise derivative lemmas); `hartogs_extension_across_point` with `exact ⟨f, by simpa using hf, …⟩`: type mismatch; `complexBesselSymbol_temperate` with `fun_prop`, with `unfold; fun_prop`, with `simp [complexBesselSymbol]`: all fail. None is padding.

**Pinned declarations opened** (`#check` in a scratch file against the pins; file and line where read):

| Declaration | Where | What it gives / does not give |
| --- | --- | --- |
| `VectorField.mlieBracket` | Mathlib, elaborated | bracket on `Π x, TangentSpace I x`, any `I`; junk for nonsmooth fields, which is why tensoriality is stated only for smooth fields |
| `TauCeti.SmoothAlmostComplexStructure`, `.square_neg` | `TauCeti/Geometry/Symplectic/Manifold/AlmostComplex.lean` | `J x ∘ J x = −id` |
| `TauCeti.SmoothTwoForm.Compatible`, `.IsClosed` | `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean` | invariance plus tameness; closedness separate, as `IsKahler` conjoins them |
| `SchwartzMap.fourierMultiplierCLM`, `TemperedDistribution.fourierMultiplierCLM` | `Mathlib/Analysis/Distribution/FourierMultiplier.lean` | take any symbol `E → 𝕜`; temperate growth is a separate hypothesis, stated as `complexBesselSymbol_temperate` |
| `TemperedDistribution.besselPotential`, `MemSobolev`, `BesselPotentialSpace`, `memSobolev_zero_iff` | `Mathlib/Analysis/Distribution/Sobolev.lean` | real order `s`, `p` with `Fact (1 ≤ p)`, `CompleteSpace F` |
| `Function.HasTemperateGrowth` | Mathlib | predicate on `E → F` over ℝ |
| `MDifferentiable.exists_eq_const_of_compactSpace`, `.isLocallyConstant` | Mathlib | need `I.Boundaryless`, `CompactSpace`; constancy needs `PreconnectedSpace`, as `README.md:299–302` says |
| `Differentiable.exists_eq_const_of_bounded` | `Mathlib/Analysis/Complex/Liouville.lean` | Liouville, used by K7.FlatDegreeZero |
| `Projectivization.map`, `OnePoint.equivProjectivization` | Mathlib | injective semilinear maps; `OnePoint K ≃ ℙ(K, Fin 2 → K)` as an `Equiv` only, so "upgrade to a homeomorphism" is a real target |
| `CategoryTheory.Sheaf.H.δ` | `Mathlib/CategoryTheory/Sites/SheafCohomology/ExactSequences.lean` | connecting map for `AddCommGrpCat` sheaves; needs `HasSheafify`, `HasExt`; hence `Additive 𝒪×` |
| `smoothSheafCommRing`, `smoothSheafCommGroup`, `smoothSheafCommRing.isUnit_stalk_iff` | `Mathlib/Geometry/Manifold/Sheaf/{Smooth,LocallyRingedSpace}.lean:59` | the README's `isUnit_stalk_iff` is this namespaced name |
| `TestFunction`, `Distribution`, `TestFunction.continuous_iff_continuous_comp` | Mathlib | order `n : ℕ∞`, LF criterion over compacts |
| `ContinuousLinearEquiv.toCompactConvergenceCLM`, `MontelSpace` | Mathlib | needs `T1Space`, `MontelSpace 𝕜₁ E` |
| `TauCeti.riemannianVolume`, `isLocallyFiniteMeasure_riemannianVolume` | `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:76, 101` | measure and the locally-finite instance |
| `ImplicitFunctionData.analyticAt_implicitFunction`, `contDiffAt_implicitFunction` | `TauCeti/Analysis/Analytic/Inverse.lean` | joint analytic/smooth regularity of `uncurry implicitFunction`, complete spaces |
| `TauCeti.analyticOnNhd_iff_differentiableOn_of_finiteDimensional`, `analyticAt_circleIntegral`, `analyticOnNhd_circleIntegral`, `DifferentiableOn.analyticOnNhd_of_finiteDimensional` | `TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean` | finite-dimensional domain, complete codomain, open set |
| `ContDiffAt.implicitFunction`, `ContDiffAt.to_localInverse`, `AnalyticAt.restrictScalars`, `AnalyticAt.contDiffAt`, `contDiffGroupoid` | Mathlib | over `RCLike`; `contDiffGroupoid ω` exists |
| `differentiableAt_complex_iff_differentiableAt_real`, `real_linearMap_map_smul_complex`, `ContinuousLinearMap.complexOfReal`, `LinearMap.det_restrictScalars`, `Algebra.norm_complex_eq`, `Complex.starConvex_one_slitPlane`, `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `MvPolynomial.mul_esymm_eq_sum`, `PowerSeries.IsWeierstrassFactorization`, `meromorphicOrderAt_eq_int_iff`, `MeromorphicAt`, `SchwartzMap.fourier_convolution`, `Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'`, `IsCoercive.continuousLinearEquivOfBilin`, `TopologicalSpace.Opens.overPullbackSheafEquivOver`, `Orientation.volumeForm`, `Fin.insertNth`, `Topology.RelCWComplex`/`CWComplex` | Mathlib | exist with the hypotheses the README states |
| Absent at the pins (confirms the docstring and the ownership claims) | `grep` of both pins | no Hartogs, Osgood or separate-holomorphy theorem; no Nijenhuis tensor or Kähler predicate in Tau Ceti; no manifold-level `IsManifold` restriction of scalars |

**Citations resolved** (every cross-roadmap citation of the changed text, and the supplier citations the findings touch, at the copy named):

| Citation | Where resolved | Result |
| --- | --- | --- |
| ComplexManifolds Milestones 1–7, "M2.1", "M2.2", "M2.4", "7.4" | main `ComplexManifolds/README.md:172–376` | items 1, 2, 4 of Milestone 2 (determinant positivity, overlap transport, biholomorphisms) and item 4 of Milestone 7 (codimension-one normal bundle) exist; the resolver's "no M2.1" is a label-format false positive |
| ComplexTori Milestone 1 | main `ComplexTori/README.md:130` | fixed complex tori |
| SchubertGeometry S5 | main `SchubertGeometry/README.md:70–76` | exists; `H^q(X(w),Lλ)=0` for dominant λ including 0; does not cite this roadmap (R02) |
| GeometricQuantization flag vanishing | #1186 `README.md:644–649` | proves `H^q(K/H,𝒪)=0` for `q>0` as the README says; consumes ComplexComparisonPartII C5.4 for the exponential segment (R02) |
| VariationalMethods §2.3, §5.1, `CompactFormPair.operatorDomainV`, V3.1 orthogonal sums, V3–V4, V5.2 | #1028 `README.md:494, 839–867, 569, 558–835, 882`; `Suggested.lean:185` | all exist |
| TopologicalKTheory T1.6d rank-one smoothing | main `TopologicalKTheory/README.md:577–612` | last sentence is the clause consumed |
| SmoothBundlesConnections B1, B2, B5, B6.1–B6.3 | main `SmoothBundlesConnections/README.md:221–559, 1375, 1668, 1716` | exist; B6.2 is the circle-bundle classification, B6.3 rank-one Chern–Weil |
| StableReduction Layer 4 Rees blowup with affine charts | main `StableReduction/README.md:529–534` | "affine chart descriptions" listed |
| ComplexComparisonPartII C−1.1, C0.4, C5.1–C5.2 (as consumers), C5.4 | #848 `README.md:145, 724, 915, 3015` | exist; C5.4 still plans the exponential sequence (R02) |
| K3SurfacesAndSymplecticBoundedness `gap:integral-topology` | #1375 `README.md:203–207` | two items; K4.P supplies the first (R01) |
| K3Surfaces 1.1 | #1285 `README.md:237` | composes with C5.4's exponential sequence (consumer) |
| RealAnalyticGeometry R0–R5, R3.2 item 0 | main `RealAnalyticGeometry/README.md:39–1028` | exist; R3.2 item 0 is the coherent-module calculus |
| GlobalHolomorphicFunctions GH0/GH2/GH5.1, PseudodifferentialOperators P1.0, LieGroupoidsPoisson G1.3, IndexTheory I7.4, FormalConnectionsOpers F2.4, HamiltonianReduction R5 | open pull requests #992, #952, #1050, #1077, #1056, #1187 (`roadmaps list`) | pre-existing on-main citations, unchanged by this pull request; located, not re-read |
| Hyperfunctions HF5, CharacteristicClasses C1.5, GeometricTopology Layer 11, DifferentialGeometry Layers 0/2/5/8/9/12, AlgebraicTopology Stages 4/6/7/8, RealAlgebraicGeometry (Completed) | main | section headers exist |

Ownership searches by object (`roadmaps grep` over the 440 open pull requests and main, by object not name): Hartogs extension in the complex-analytic setting (all other hits are algebraic or rigid-analytic Hartogs), the Nijenhuis tensor on a general almost-complex manifold (LieGroupoidsPoisson consumes it from K1; TeichmullerGeometry uses it only on surfaces), the Fubini–Study form and its unitary symmetry (ComplexComparisonPartII consumes the normalisation), complex-order Bessel multipliers and the three-lines interpolation (StochasticCalculus's complex-order Bessel functions are a different object), holomorphic normal coordinates (HopfRinow's and GeometricCurrents' are Riemannian), the rational quartic, factors of automorphy on an elliptic curve and the exponential sheaf sequence on a complex manifold (HilbertModules' is the continuous-function sequence): no other owner on main or in the open pull requests. `roadmaps grep --lean-only` for the six fully qualified names of `Suggested.lean`: only this pull request, #1398 (an older revision of the same roadmap) and main's own file. Ownership against open pull requests whose files the brief does not provide was checked only by `roadmaps grep` on their README and `Suggested.lean`, not by reading them.

**Sources.** `ballmann-kahler` lines 1990–2016 (printed pages 47–48, PDF pages 53–54): Theorem 4.17 lists seven equivalent global conditions, (7) being normal coordinates at every point; the README cites it for exactly the global equivalences and marks the pointwise criterion as its own. `berwick-evans-tripathy` lines 287–292 (printed page 6): Remark 2.1 identifies the dual elliptic curve with degree-zero lines, i.e. flat unitary lines via `τm+n ↦ e^(2πi(mx+ny))`; supports `README.md:1938–1939` as a cross-reference (a remark, not a proof, and the README uses it as a description). `knutson-borel-weil` lines 12–72 (printed page 1, §1): the incidence variety, its blowup and tautological-bundle projections, functions on it, the ℂ× weight spaces and the theorem that sections of the dual tautological line are `V*`; supports `README.md:1767–1769`. `lojasiewicz-triangulation` lines 512–515 (PDF page 17; page 1 is the Numdam cover, so printed page 464): Theorem 2 triangulates a locally finite family of semianalytic subsets of a countable real-analytic manifold; supports `README.md:1510–1513`. The four are `certified` in the package manifest; no manifest edit.

**Adversarial pass.** One row per statement; each row gives the instance and the values on both sides. "Pass" is about the instance, not a proof of the general statement.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions `h_T=g+iω`, `ω=(i/2)Σh_T(∂_k,∂_j)dz^j∧dz̄^k` | standard ℂ, `u=1, v=i` | `h(1,i)=i`, `g=0`, `ω(1,i)=1`; `(i/2)dz∧dz̄=dx∧dy` | Pass | — |
| `nijenhuisOnFields` (K1) | flat ℂ, constant `J=i`, coordinate fields | all brackets 0, `N=0`; on `(0,1)` fields the README's `N=−4[X,Y]^(1,0)` reading agrees with `∂̄²f=−¼∂f(N)` | Pass | — |
| `nijenhuisOnFields_eq_of_eq` (headline, K1) | `X'=X+φ·Z` with `φ(x)=0`, smooth `Z` | `[JX', JY]−[JX,JY]=φ[JZ,JY]+(JY φ)·JZ`, at `x` the `φ` term is 0 and the derivative term is cancelled by the matching term of `−J[X',JY]`… on the four-term sum the `dφ` terms cancel pairwise, value unchanged | Pass | — |
| `IsKahler` | flat ℂ, `ω=dx∧dy`, `J=i`; Hopf surface | closed, `ω(Jv,Jw)=ω(v,w)`, `ω(v,Jv)=|v|²>0`, `N=0`; Hopf excluded by `b₂=0` | Pass | — |
| K2 solver `exists_mixed_parameter_dbar_solution` (headline) | `Ω=ℂ`, `Q=ℂ×`, `P` a point, `f=pq` | `u=pq·z̄`: `fderiv u z 1=pq`, `fderiv u z I=−I·pq`, `(pq+I(−I pq))/2=pq` ✓; `∂̄_q u=0` | Pass | — |
| same, degenerate | `Q=∅`; `Ω=∅`; `P` empty | existential satisfied by `u=0` vacuously; set `(univ×Q)×Ω` empty | Pass | — |
| same, ∂̄ convention | `u=z` | `(1+I·I)/2=0`: holomorphic functions are in the kernel | Pass | — |
| Parameter Cauchy–Green [sample] | `χ≡1` on `|z|<1`, `f=z̄` | `T(χ z̄)` has `∂̄=z̄` on the disc, holomorphic off `tsupport χ` | Pass | — |
| `realified_isManifold_analytic` (K3.0) | `M=ℂ`, `z↦z`; `M=ℂ` with chart `z↦z̄` not in atlas | holomorphic transitions are ℂ-analytic (finite dimension), hence ℝ-analytic; no instance at the pin, so not padding | Pass | — |
| `hartogs_extension_across_point` (headline, K3) | `ℂ²`, `f=z₁z₂` off 0; `ℂ`, `f=1/z`; `ℂ²` doubled origin | extends by itself; `1/z` unbounded, excluded by `2≤finrank`; non-T2 case: extension is chart-local at `p`, so T2 is not needed | Pass | — |
| K3.MeromorphicGermField [sample] | `f=(z−a)^(−2)+1`, `N=2`, `h=1+(z−a)²` | principal part `(z−a)^(−2)`, regular germ `1`; coefficient of order −2 is `(2πi)^(−1)∮f(z)(z−a)dz=1` | Pass | — |
| K4.ComponentwiseFiniteRankAssembly [sample] | `M=ℕ` discrete, `r(j)=j`; empty base; rank 0 | fibres `ℂ^j` unbounded; empty family unique; zero bundle | Pass | — |
| K4.P exactness | stalk at a point | `exp(2πif)=1 ⟺ f∈ℤ`; local log on a disc | Pass | — |
| K4.P Check: point | `M=pt` | `𝒪=ℂ`, `𝒪×=ℂ×`, `H¹=0`, `Pic=0`; `f↦exp f` has kernel `2πiℤ` | Pass | — |
| K4.P Check: `ℂP¹` normalisation | `O(1)`, `h=(1+|z|²)^(−1)` | `Θ=∂∂̄log(1+|z|²)=−2πiω_FS`, `iΘ/2π=ω_FS`, `∫=1`; `O(−1)` gives `−1` | Pass | — |
| K4.P Check: elliptic curve | `E_τ` | `H¹(𝒪)=ℂ≠0`, `ker c₁=Pic⁰`= unitary characters of K7.FlatDegreeZero | Pass | — |
| K4.P Check: torsion | Enriques surface | `H¹(𝒪)=H²(𝒪)=0`, `H²(ℤ)` has 2-torsion `t`, line with `c₁=t` nontrivial, curvature class 0 | Pass | — |
| K4.P conditional isomorphism, both directions | `ℂP¹` (vanishing) vs `E_τ` (no vanishing) | iso `ℤ≃ℤ`; `c₁` not injective on `E_τ` | Pass | — |
| K4.P units | `ℂP¹`; two copies | constants; `(1,2)` unit, not a global scalar | Pass | — |
| K4.P gap answered | the two items of `gap:integral-topology` | item 1 supplied; item 2 (`c₁(O(D))=PD[D]`) absent | Overclaim | R01 |
| K5a star and Gram [sample] | `ℝ²` | `*dx=dy`, `*dy=−dx`, `*²=−1`, `‖dx∧dy‖=1` | Pass | — |
| K5a.DistributionLocalStructure [sample] | `m=2,k=0,w=δ₀`; `φ=1/(1+2x)` | `F=x₊`, `D²F=δ₀`; `⟨δ^(n)/n!,φ⟩=(−1)^n(−2)^n=2^n`, partial sums `1,3,7` | Pass | — |
| K5a nonextension [sample] | `n=1`, `c=1/8` | integral `≥C'ε·exp((9/8)^(−2)ε^(−2))` beats `Cε^(−N)` for every `N` | Pass | — |
| K5a.SmoothSectionMontel [sample] | `M=ℕ` discrete rank 1; `C⁰` ball on `ℝ` | `ℂ^ℕ` boxes compact; `C⁰` ball not compact, all derivative seminorms needed | Pass | — |
| K5a.ComponentwiseCompact [sample] | 3 points, ranks 0,1,2 | `L²=0⊕ℂ⊕ℂ²`, `‖(0,3,(0,4))‖²=25`; eigen-index = disjoint union | Pass | — |
| `complexBesselSymbol` | `ζ=0`; `‖ζ‖=1, z=2+2i`; `z=it` | `1`; `exp((1+i)log2)`, modulus 2; modulus 1 (imaginary axis) | Pass | — |
| `complexBesselSymbol_temperate` | `z=−3`, `z=5i` | `(1+‖ζ‖²)^(−3/2)` and modulus-1 symbol; derivatives polynomially bounded | Pass | — |
| multiplier definitions | — | no statement uses them | — | R03 |
| K5b.0 [sample] | standard ℂ | `ω/1!=dx∧dy=vol`; `|dz|²_Gram=2`; `dz♯=∂_x−i∂_y=2∂_z`; `*dz=−i dz` type `(1,0)`; `barStar dz=i dz̄` type `(0,1)=(n−p,n−q)` | Pass | — |
| K5b.1 [sample] | `ℂP¹, O(−1)`; elliptic trivial line | `h⁰=0`, `h¹=h⁰(O(1)⊗O(−2))=0`; `h^(0,0)=h^(1,0)=h^(0,1)=h^(1,1)=1` | Pass | — |
| K6.0 coordinate change | `z^i=w^i−½Γ^i_jk w^j w^k`, `H(0)=I` | linear term of `h'_ab̄` is `(∂_c h_ab̄−∂_a h_cb̄)w^c`, zero by `dω(p)=0`; the `½` cancels the two symmetric terms | Pass | — |
| K6.0 two-jet | symmetric `Γ` | first differential `id`, second `(u,v)↦−Γ(u,v)` | Pass | — |
| K6.0 Check `ℂP¹` | chart scaled by `√π` | `H(w)=(1+π|w|²)^(−2)`, `H(0)=1`, `dH(0)=0`, `|H−1|=(2x+x²)/(1+x)²≤2x` with `x=π|w|²` | Pass | — |
| K6.0 negative control | `H=diag(1+z₂+z̄₂,1)` | `dω(0)=(i/2)(dz₂+dz̄₂)∧dz₁∧dz̄₁≠0`; `dH(0)=0` would force `dω(0)=0` | Pass | — |
| K6.0 Gram–Schmidt coframe | `H=I+O(|w|²)` | `A=I+O(|w|²)`, `dA(0)=0`, `dφ_j(p)=0`; `|φ_j|²_Gram=2` | Pass | — |
| Ballmann 4.17 vs pointwise claim | one point | global theorem; pointwise form uses only `∂_c h_ab̄(p)` symmetry | Pass | — |
| K7.1 [sample] | `n=0`; `[2:4]`; `OnePoint` | point; `U₀` coordinate 2, `[1:2]=[2:4]`; `t↦[t:1]`, `∞↦[1:0]` | Pass | — |
| FS chart matrix | `ω=(i/2π)∂∂̄log r` | `∂_i∂̄_j log r=δ_ij/r−w̄_i w_j/r²`; README's `h(e_i,e_j)=(δ_ij/r−w_i w̄_j/r²)/π` is its transpose, as the convention `ω=(i/2)Σh(∂_k,∂_j)dz^j∧dz̄^k` requires | Pass | — |
| FS homogeneous form | `z=(1,w)`, `v=e_i`, `w=e_j` | `(rδ_ij−w_i w̄_j)/(πr²)` = chart matrix | Pass | — |
| FS Check 1 | `z=(1,0)`, `v=(0,1)`; `w=(1,i)/√2` | `1/π`; `r=2`, `w₁w̄₂=−i/2`, `h(e₁,e₂)=i/(8π)`; transposed `−i/(8π)` | Pass | — |
| FS Check 2 | `c=2` | numerator and denominator scale by `16`; `H_z(z,·)=0` | Pass | — |
| FS Check 3, `diag(1,2)` | chart `w↦2w` | pullback `4ω(0)`, `H(2v,2v)=4/π≠1/π`; unitary `U` preserves inner products | Pass | — |
| FS Check 4, `n=0` and `∫` | `ℂP⁰`; `ℂP¹` | zero tangent space, `PU(1)` trivial; `∫(1/π)(1+r²)^(−2)=(1/π)·π=1` | Pass | — |
| FS stabilizers | standard line | `U(1)×U(n)`, descended `U(n)` | Pass | — |
| TautologicalIncidence charts | `ℓ_i,ℓ_k≠0` | `z'_i=1/z_k`, `z'_j=z_j/z_k`, `a'=az_k` | Pass | — |
| `b*` and homogeneity | `d=2,k=−1`; `k=1`; `k=0` | `f(tv)=t^(−1)f(v)` forces `f=0`; `H⁰(O(1))=V*`; constant on fibres, then on compact `P(V)` | Pass | — |
| TautologicalIncidence Check `d=2,k=1` | `φ=v₁` | `φ(tv)=tφ(v)`, degree `+1`, character `t^(−1)` ✓; inverse convention gives `0` at `k=1`, not `V` | Wording | R04 |
| TautologicalIncidence Check `d=1`, `exp(v₁)` | point `P(V)`; `d≥2` | `O(k)` on a point has `h⁰=1`; `exp(tv₁)≠t^k exp(v₁)` | Pass | — |
| RationalQuartic embedding | `z=t/s`; `u=s/t` | `(z,z³,z⁴)`, `(u⁴,u³,u)`, derivative `(1,3z²,4z³)≠0`, `u=1/z`, injective across charts (`x₀≠0` vs `x₀=0`) | Pass | — |
| RationalQuartic restriction | basis `s⁴,s³t,s²t²,st³,t⁴` | `(a,b,c,d)↦(a,b,0,c,d)`, image `{b₂=0}`, left inverse drops `b₂` | Pass | — |
| RationalQuartic `n=2` | exponent pairs | sums `0,…,8` from the nine pairs; `h⁰=9=4·2+1`; kernel `x₀x₃−x₁x₂` (`s⁴t⁴−s³t·st³=0`), `10−9=1` | Pass | — |
| RationalQuartic induction | `[0,4n]+{0,1,3,4}` | `4n+1=4n+1`, `4n+2=(4n−1)+3`, `4n+3=(4n−1)+4`, `4n+4=4n+4` | Pass | — |
| RationalQuartic control | rational normal quartic in `ℂP⁴` | `5→5` surjective at `n=1` | Pass | — |
| FlatDegreeZero holonomy | `(z,v)~(z+λ,ρ(λ)v)` | `(λ,v)~(0,ρ(λ)^(−1)v)`: holonomy `ρ(λ)^(−1)`; inverse convention gives `ρ(λ)` | Pass | — |
| FlatDegreeZero sections | `ρ=1`; `ρ(1)=−1` | `|f|` periodic and bounded, Liouville: constant `c`; `(ρ−1)c=0` gives any `c`, resp. `c=0` | Pass | — |
| Gauge `a` | `u=log|ρ(1)|`, `v=log|ρ(τ)|` | `Re a=u`, `Re(aτ)=uReτ−(uReτ−v)=v`; `|σ(1)|=|σ(τ)|=1` | Pass | — |
| Gauge Check | `ρ(λ)=exp(aλ)`, `a=α+iβ`, `τ=x+iy` | `u=α`, `v=αx−βy`, `α+i(αx−αx+βy)/y=α+iβ`; `σ=1` | Pass | — |
| Square torus Check | `τ=i`, `ρ(m+ni)=(−1)^m` | character ✓, unitary, nontrivial; `f=exp(πix)`: `f(z+1)=−f`, `f(z+i)=f`; `H⁰=H¹=0` | Pass | — |
| Flat metric | `iF_h=φω`, `u=−2Gφ` | `Δ_d u=−2φ` (mean 0); `i∂∂̄u=−(Δ_du)ω/2=φω`; `iF_(h')=φω−φω=0` | Pass | — |
| Serre on `E_τ` | `ρ=1`; unitary `ρ≠1` | `h⁰=h¹=1` with `dz`, `dz̄`; `H¹(L_ρ)≃H⁰(L_(ρ⁻¹))*=0` | Pass | — |
| K8.NilpotentCentralReduction [sample] | real Heisenberg, integer lattice; `G=ℝ²`; `G={e}` | `𝔞=ℝZ`, `Γ∩A=ℤ`, base `ℝ²/ℤ²`, fibre `S¹`; torus base case; dimension 0 | Pass | — |
| Newlander–Nirenberg (headline, not statable) | standard ℂⁿ; `N≠0` | `N=0` with the standard atlas; `N≠0` excludes any atlas; no induced-structure carrier at the pin | Pass | — |
| Dolbeault–Grothendieck `(0,1)` on a polydisc | `n=1`, `f=z̄`; `n=2`, `f=(z̄₂,0)` | `u=|z|²`; compatibility `∂̄₂f₁=1≠0` fails, excluded | statable | R05 |

62 rows, covering the 15 sampled targets, every headline family, every declaration of `Suggested.lean` and every target a finding touches.

## Not verifiable

- Griffiths–Harris chapter 0, Wells, Webster 1989, Demailly II §4.4 (Theorems 4.29, 4.31), Sakane pp. 188–189 and Angella: pre-existing citations, unchanged by this pull request and recorded in earlier rounds as uncertified or without a cached text; not re-requested this round.
- Ownership against open pull requests whose files the brief does not provide: checked only by `roadmaps grep` of their README and `Suggested.lean`.
- The adversarial rows are instance checks, not proofs; the tensoriality of `nijenhuisOnFields` and the temperate growth of the complex Bessel symbol were checked on instances and by reading, not elaborated.

## Source issues

- none
