# Review of SmoothBanachRepresentations (pull request #1145 at 7cde28a)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`
**Verdict:** needs changes

This is a full review of the same head that the previous review read; nothing has changed since. The gate passes.

- Three findings are P2 and new: R01, R02 and R03. Earlier rounds never compared these passages with the pinned Tau Ceti tensor and contour API, or with NoncommutativeGeometry's open revision.
- The previous R01 (the family index) is not repaired. It is carried as R04.
- R05–R07 are P3.

## R01 (P2) — §7.2a plans the real completed projective tensor, which the pinned Tau Ceti already constructs

**Location.**
- `README.md:460–464` (§7.2a): “Build the same object here for real Hausdorff locally convex spaces E and F, by N1's construction with real scalars … Define E⊗̂ℝF as the Hausdorff completion … Prove the universal property … functoriality … the flip”.
- The Tau Ceti contract (:48–60) names none of these declarations.
- `Suggested.lean:14–18` says the “completed locally convex tensor” is “not at the pins”.

**Claim.**
- At the pin, Tau Ceti already provides, over every normed field and so over ℝ:
  - the projective seminorms, the projective topology and the separated completion;
  - the canonical continuous multilinear map and the continuous universal property;
  - functoriality with its identity and composition laws, and the flip.
- §7.2a restates all of this as new targets, and the docstring's reason is false for the tensor.

**Witness.**
- `TauCeti.CompletedProjectiveTensorProduct` (`TauCeti/Analysis/Normed/Module/PiTensorProduct/Projective/Completion.lean:54`, `[NormedField 𝕜]`) is the `UniformSpace.Completion` of the projective topology.
- `…/UniversalProperty.lean:122` `liftEquiv` gives continuous multilinear maps ≃ continuous linear maps.
- `map` (:139) and `reindex` (`Reindex/Completion.lean:41`) give functoriality and the flip.

**Repair.**
1. Add to “From Tau Ceti”, all under `TauCeti/Analysis/Normed/Module/PiTensorProduct/`:

   | Declarations | File and lines |
   |---|---|
   | `PiTensorProduct.projectiveSeminormOf`, `projectiveSeminormOf_tprod_le`, `projectiveSeminormOf_mono` | `Projective/Seminorm.lean:41, :57, :108` |
   | `TauCeti.ProjectiveTensorProduct` with `withSeminorms`, `instFirstCountableTopology`, `continuous_tprod` | `Projective/Topology.lean:49, :167, :180, :197` |
   | `TauCeti.CompletedProjectiveTensorProduct` with `tprod`, `continuousLinearMap_ext`, `map`, `map_id`, `map_comp` | `Projective/Completion.lean:54, :65, :82, :139, :156, :167` |
   | `CompletedProjectiveTensorProduct.liftEquiv` | `UniversalProperty.lean:122` |
   | `reindex`, `reindex_refl`, `reindex_trans`, `map_comp_reindex` | `Reindex/Completion.lean:41, :90, :97, :111` |

2. In §7.2a, consume these at 𝕜 = ℝ for the two-factor family (E, F). Keep as targets only what the pin lacks:
   - the cross property `π_(p,q)(x⊗y)=p(x)q(y)`, since the pin gives only `≤`;
   - associativity, the scalar unit and finite sums;
   - Fréchet completeness and agreement with B4;
   - the two scalar comparisons.

   Under R02, the first three items may move to N1.Tensor.
3. In `Suggested.lean:14–18`, say that the tensor comparison is not statable only because the Fréchet smooth-vector carrier is missing.

**Tested.** On the Check at :475 (ℝ²⊗ℝ³), the pinned `projectiveSeminormOf_tprod_le` gives only `π(e₁⊗e₁) ≤ 1`. The cross property, `=1`, therefore stays a target. The `√2+1 ≈ 2.414` representation is unaffected.

## R02 (P2) — The real completed locally convex projective tensor has two owners

**Location.**
- `README.md:9`: “§7.2a owns the same construction for real spaces … and assumes nothing of N1 beyond its complex construction”.
- :76: the real tensor's laws “are targets of §7.2a”.
- §7.3, :481: “consume NoncommutativeGeometry N1 when 𝕜=ℂ and §7.2a when 𝕜=ℝ”.

**Claim.**
- NoncommutativeGeometry's open revision states N1.Tensor for both fields. It assigns this roadmap only the two scalar comparisons, and it has §7.3 consuming N1.Tensor at ℝ.
- The two heads therefore disagree about who owns the following for the real tensor: the cross property, associativity, the unit, finite sums, Fréchet completeness and the Banach comparison.
- This pull request's own description sides with that revision (“N1.Tensor owns … over both ℝ and ℂ”), not with this README.

**Witness.** NoncommutativeGeometry `README.md` at the head of #1143 (f1b5581):
- :351–352: “Fix 𝕜=ℝ or ℂ (`RCLike 𝕜`); every statement of this section is made for both fields”.
- :1476–1479: “SmoothBanachRepresentations §7.3 consumes N1.Tensor's … tensor at both fields …, its §7.2a owns only the two scalar-comparison maps”.

**Repair.** NoncommutativeGeometry is on main and therefore earlier, so make it the owner.
- Cite N1.Tensor at 𝕜 = ℝ in :9, :74–76, :88, §7.2a, :468, :470, :481–483 and :507. The description already names that revision as merging first.
- Keep in §7.2a only the complexification isomorphism and the balancing quotient, with the Checks at :474 and :476.

If §7.2a is instead to keep the real tensor, the revision must restrict N1.Tensor to ℂ and correct its consumer note before either pull request merges.

**Tested.** Under either choice, the balancing Check at :476 stays in §7.2a:
- ℂ_ℝ⊗ℝℂ_ℝ has real dimension 4 and maps onto ℂ, which has real dimension 2.
- i⊗1−1⊗i ↦ i−i = 0 and 1⊗1+i⊗i ↦ 1+i² = 0, so the kernel has real dimension 2.

## R03 (P2) — Holomorphic closure is statable at the pins, but `Suggested.lean` says it is not

**Location.**
- `Suggested.lean:22–24`: “Holomorphic closure needs the general Banach-algebra holomorphic functional calculus of BanachAlgebras A2; the pinned continuous functional calculus does not supply that carrier.”
- `README.md:519` makes holomorphic-functional-calculus closure a target of §8.1.

**Claim.** Pinned Tau Ceti defines f(a), up to the factor 2πi, as a resolvent integral over a cycle, together with every hypothesis the calculus needs. So this Layer 8 headline is statable, but it is absent.

**Witness.**
- In a scratch copy, the statement below elaborates with only the `sorry` warning, after the module `TauCeti.Analysis.Normed.Algebra.HolomorphicFunctionalCalculus.Cycle` was built.
- It uses `TauCeti.Contour.Cycle.integral`, `IsIn`, `windingNumber` and `IsNullHomologous` (`Contour/Cycle/Basic.lean:312, :261, :426, :447`).
- `integral_eval_smul_resolvent` (`…/HolomorphicFunctionalCalculus/Cycle.lean:184`) gives 2πi·p(a) for polynomials.

**Repair.**
1. Add `import TauCeti.Analysis.Normed.Algebra.HolomorphicFunctionalCalculus.Cycle`.
2. After `smooth_inverse`, add the theorem below, with `omit [NormedAlgebra 𝕜 A] [IsScalarTower ℝ 𝕜 A] in` and `include hCompleteA in`, as the probe used:

   ```lean
   theorem smooth_holomorphicCalculus [NormedAlgebra ℂ A] [IsScalarTower ℝ ℂ A]
       (π : ContRepresentation ℂ G A) (h1 : ∀ g : G, π g 1 = 1)
       (hmul : ∀ (g : G) (a b : A), π g (a * b) = π g a * π g b)
       {a : A} (ha : IsSmoothLieVector (I := I) π a)
       {U : Set ℂ} (hU : IsOpen U) {f : ℂ → ℂ} (hf : DifferentiableOn ℂ f U)
       {Γ : TauCeti.Contour.Cycle} (hΓ : TauCeti.Contour.Cycle.IsIn Γ (U \ spectrum ℂ a))
       (hΓU : TauCeti.Contour.Cycle.IsNullHomologous Γ U)
       (hwind : ∀ z ∈ spectrum ℂ a, TauCeti.Contour.Cycle.windingNumber z Γ = 1) :
       IsSmoothLieVector (I := I) π
         (TauCeti.Contour.Cycle.integral (fun z => f z • resolvent a z) Γ) := by
     sorry
   ```

3. Name the theorem in §8.1.
4. List the cycle declarations in the Tau Ceti contract.
5. Delete the docstring sentence at :22–24.

**Tested.** Take M₂(ℂ) with conjugation by diag(e^t,1) and a = I+E₁₂, so σ(a) = {1}. Let Γ be the circle |z−1| = ½.
- f(z) = 1/z on ℂ∖{0}: the integral is 2πi(I−E₁₂), with smooth orbit 2πi(I−e^tE₁₂).
- f(z) = z²: the integral is 2πi(I+2E₁₂), with smooth orbit 2πi(I+2e^tE₁₂).

## R04 (P3) — The family index still omits this roadmap, and its scope paragraph contradicts it

This carries the previous R01. No repair report marks it not actionable.

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md`:
- :11–70 (“## The roadmaps”): 14 of the 15 subfolders are linked, and this one is not.
- :129–131: “The analytic representation theory stops at compact groups … no infinite-dimensional unitary representations of noncompact groups”.

**Claim.**
- The index does not list this folder.
- Its scope boundary excludes what Layers 0–4 cover: strongly continuous, including unitary, representations of noncompact Lie groups.
- The description does not name the companion pull request that adds the entry.

**Witness.**
- A per-folder count of `](<Dir>/README.md)` at this head gives 0 for SmoothBanachRepresentations and at least 1 for every other folder.
- #1146 (RepresentationTheory, head e5e8364) has the entry at :55 and the rewritten scope bullet at :119–125.

**Repair.** Do one of the following:
- Copy #1146's entry (:55) and scope bullet (:119–125) into this pull request's family `README.md`, replacing :129–134. The count is then 15 of 15.
- Or state in the description that #1146 adds them and merges right after this pull request.

## R05 (P3) — Sampled sections state theorems with no locator

**Location.** In each of these sections, the listed statements carry no locator:

| Section | Statements |
|---|---|
| §0.1 (:96) | joint continuity, compact operator bounds |
| §1.1 (:148) | completeness and atlas independence of D_K, the final-topology universal property |
| §1.2 (:154) | positive smooth chart density of Haar measure |
| §1.4 (:170) | associativity, π(f*h) = π(f)π(h) |
| §2.1 (:213) | E^k ⇔ basis words of length ≤ k |
| §3.2 (:261) | Ad-covariance |
| §7.2a (:460–466) | the whole section |
| §7.3 (:481) | diagonal action, shuffle identities, dense range |
| §8.1 (:515–521) | smooth subalgebra, star law, inverse and holomorphic closure |

The only locator these layers carry is Casselman, p.1.

**Witness.** `casselman2016` lines 11–41 (p.1) state the following, and none of the statements above:
- the all-order space V^∞ and its seminorms;
- π(f) and π(y)π(f) = π(L_y f);
- smoothing and density;
- the Dixmier–Malliavin theorem.

**Repair.**
- Give each listed theorem a locator (theorem or section, and page) in a legal source, and record it in the manifest.
- For the complex counterparts, check and reuse the locators that AutomorphicFormsOnReductiveGroups §§0.1a and 2.7 already give: Getz §3.3 and Bernstein–Krötz §§2.1–2.5.
- For the tensor laws, use N1.Tensor's Grothendieck locators once R01 and R02 are settled.
- Where a statement is this roadmap's own (the scalar comparisons, the finite-k bridge), say so in one clause and cite the source of its method.

## R06 (P3) — §8.1's C\*-algebra case does not consume the pinned `TauCeti.CStarAction` API

**Location.**
- `README.md:521`: “For a strongly continuous action of G by \*-automorphisms of a complex C\*-algebra A, …”.
- :517: the star statements.
- The Tau Ceti contract (:48–60).

**Claim.** This carrier, together with its first-order one-parameter derivation, star and unit laws, is pinned. The README neither names nor consumes it.

**Witness.**
- `TauCeti.CStarAction` (`TauCeti/Analysis/CStarAlgebra/Action/Basic.lean:41`): a homomorphism into `A ≃⋆ₐ[ℂ] A` with continuous orbits.
- `CStarAction.comp` (:156).
- For `Multiplicative ℝ`, in `Generator/Basic.lean`: `generator` (:72), `generatorDomain`, which is a star subalgebra (:199), `generator_mul` (:172), `generator_star` (:192) and `generator_one` (:259).

**Repair.**
- List these declarations in the Tau Ceti contract.
- State §8.1's C\* paragraph for `TauCeti.CStarAction G A`.
- Say that along `α.comp (oneParameterSubgroup X)`, the first-order derivation, star and unit laws are the pinned `generator_mul`, `generator_star` and `generator_one`. §8.1 extends them to A∞, to all orders and to all of 𝔤, and does not prove them again.

**Tested.** Conjugation by the unitary diag(e^{it},1) on M₂(ℂ) is a `CStarAction` of ℝ. `generator_star` gives −iE₂₁ = (iE₁₂)\*, which is the value of the Check at :534.

## R07 (P3) — The smooth-vector predicate has a second name

**Location.**
- `README.md:213`: “The simple predicate `IsSmoothLieVector` and algebraic submodule `smoothLieVectors` … The complex all-order construction is the supplied §2.7 carrier; identify these predicates with it.”
- `Suggested.lean:67–71`.

**Claim.** At 𝕜 = ℂ, these are AutomorphicFormsOnReductiveGroups §2.7's predicate and submodule under swapped names. The library would then carry two names for one definition, plus an identification lemma between them.

**Witness.** AutomorphicFormsOnReductiveGroups `README.md` at the head of #1037 (4a03177), :490:
- “define `IsLieSmoothVector π v` as smoothness (`ContMDiff`) of the orbit map `G→E`, and `lieSmoothVectors π` as the invariant submodule of smooth vectors”;
- its density theorem is `lieSmoothVectors_dense`.

**Repair.**
- In the README and `Suggested.lean`, rename the declarations to `IsLieSmoothVector`, `lieSmoothVectors`, `lieSmoothVectors_dense` and `isLieSmoothVector_smear`.
- Replace “identify these predicates with it” by “at 𝕜=ℂ this is §2.7's definition”.

**Tested.** At 𝕜 = ℂ, the renamed body is `ContMDiff I 𝓘(ℝ, E) ∞ (fun g => π g v)`, which is AutomorphicFormsOnReductiveGroups' definition word for word.

## Previous findings

- **R01 (previous review) — not repaired.** The head is unchanged:
  - `RepresentationTheory/README.md:129–131` still reads “The analytic representation theory stops at compact groups … no infinite-dimensional unitary representations of noncompact groups”;
  - the index still links 14 of 15 folders.

  It is carried as R04.
- **R02 (previous review)** was already repaired at this head. The Henkel sentence at :11 was re-checked: `henkel2014` line 131 has Theorem 1.6, the page marker is at line 117, and the printed folio “4” is at line 147.

## Verified sound

### Head, gate and dependency check

- **Head.** 7cde28a07a18810431571988fe4484f3531b6c15. The diff against `origin/main` touches only `README.md` (+557) and `Suggested.lean` (+190). Nothing outside the folder changed, and no file in the worktree was edited.
- **Gate.** Rerun with `--order` set to the candidate order and with `--build`:

  ```text
  gate SmoothBanachRepresentations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
  ```

- **Dependency check** (`gate --depcheck … --movable`, candidate order, content main e2d1245):

  ```text
  depcheck: 238 roadmaps, 2322 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line. This roadmap is at line 61 of the order; its suppliers LocallyAnalyticDistributions (44) and AutomorphicFormsOnReductiveGroups (60) come before it. The consumers NoncompactQuantumSymmetry (156), CompactQuantumMetricSpaces (209) and QuantitativeOrbitMethod (294) come after.

### Elaboration and signatures

- `lake env lean Suggested.lean` gives exactly 7 warnings, all “declaration uses `sorry`”, at :95, :104, :116, :135, :148, :165 and :183.
- `#check @name` on all 12 declarations, in one scratch file: after normalizing universe and instance names, all 12 types are identical to `signatures.md`.
- The six “dropped binder” leads are definitions whose bodies need no dropped binder:
  - `LieTestFunction` needs only `ChartedSpace`;
  - `smear` needs only `NormedSpace ℝ E`;
  - `IsSmoothLieVector` needs only `ContMDiff`;
  - `smoothLieVectors` keeps `IsScalarTower` for `smul_mem'`;
  - `HasContinuousOrbits` needs only a topology;
  - `smooth_inverse` uses no measure.
- Every theorem carries `CompleteSpace` where its statement needs it: E, F or A.
- No change to the file was made, so no re-check was needed.

### Padding probe

- Each of the 7 theorems was tried with `simp`, `rfl`, `infer_instance`, `fun_prop` and `aesop`. All 35 attempts fail, so there is no padding.
- Note on `smooth_inverse`: a 12-line proof from `contDiffAt_ringInverse` (`Mathlib/Analysis/Calculus/ContDiff/Operations.lean:779`) closes it in scratch, and it uses none of `hFD hLie hManifold hT2 hBoundary`. It is true as stated. The hypothesis `h1` follows from `hmul`, because each π(g) is bijective.

### Library declarations opened at the pins

Mathlib 1b1ccf4 (17 declarations):

| Declaration | File:line |
|---|---|
| `ContRepresentation` | `RepresentationTheory/Continuous/Basic.lean:55` |
| `ContIntertwiningMap` | :81 |
| `ContRepresentation.restrict` | :446 |
| `Continuous.integrable_of_hasCompactSupport` (opens-measurable, finite on compacts, no separability) | `MeasureTheory/Function/LocallyIntegrable.lean:617` |
| `contDiffAt_ringInverse` | `Analysis/Calculus/ContDiff/Operations.lean:779` |
| `ContDiffAt.comp_contMDiffAt` | `Geometry/Manifold/ContMDiff/NormedSpace.lean:84` |
| `exists_extension_of_le_sublinear` | `Analysis/Convex/Cone/Extension.lean:159` |
| `QuotientAddGroup.completeSpace_right` (via `to_additive`) | `Topology/Algebra/IsUniformGroup/Basic.lean:700` |
| `Distribution` (compact-convergence topology `→L_c`) | `Analysis/Distribution/Distribution.lean:166` |
| `delta` | :202 |
| `lineDerivCLM` (= −T∘∂, so even powers are sign-free) | :235 |
| `ofFun` | :303 |
| `ContinuousLinearMap.isOpenMap` | `Analysis/Normed/Operator/Banach.lean:229` |
| `MonoidHom.isOpenMap_of_sigmaCompact` (additive form) | `Topology/Algebra/Group/OpenMapping.lean:114` |
| `IsModuleTopology.isOpenMap_of_surjective` | `Topology/Algebra/Module/ModuleTopology.lean:491` |
| `IsModuleTopology.continuous_of_linearMap` | :340 |
| `Submodule.isOpenMap_mkQ` | `Topology/Algebra/Module/Basic.lean:333` |

Tau Ceti 2fd255d (every declaration the contracts name, 38 in all):

| Area | Declarations (file:line) |
|---|---|
| One-parameter subgroups | `oneParameterSubgroup` (`Geometry/Lie/Exponential/Basic.lean:187`, a `ContinuousMonoidHom`), `contMDiff_oneParameterSubgroup` (:214) |
| Semigroups | `StronglyContinuousSemigroup` (`Analysis/Semigroups/Basic.lean:43`), `.dense_domain` (`Generator/Basic.lean:351`), `isClosed_generator` (`Generator/Closed.lean:91`), `smoothVectors` (`Generator/SmoothVectors.lean:49`) |
| One-parameter groups | `ContRepresentation.toStronglyContinuousGroup` (`RepresentationTheory/Continuous/OneParameter.lean:32`, `RCLike 𝕜`, `IsScalarTower ℝ 𝕜 V`); `StronglyContinuousGroup` (`Group/Basic.lean:74`), `toSemigroup` (:202) |
| Group generator (`Group/Generator.lean`) | `domain`, `generator` (:76, :81); `mem_domain_of_hasDerivAt_zero` (:170); `generator_eq_of_hasDerivAt_zero` (:175); `reflect_generator` (:218); `hasDerivAt_zero` (:248); `hasDerivAt` (:261); `map_mem_domain` (:146); `generator_map` (:152); `generator_commute_of_commute` (:125). `CompleteSpace` is a section variable from :181 on. |
| Complex scalars (`Generator/ComplexLinear.lean`) | `IsComplexLinear` (:77), `complexDomain` (:149), `complexGenerator` (:170) |
| Charts and smoothness | `isLocalDiffeomorphAt_of_mfderiv_eq` (`Geometry/Manifold/LocalDiffeomorph/Basic.lean:358`: Cⁿ with n ≥ 1, an open set, an interior point, a derivative equivalence); `Submodule.isLocalDiffeomorphAt_lieExpMulLieExp_zero_of_isCompl` (`Exponential/ProductChart.lean:335`); `TauCeti.Lie.contMDiff_of_continuous_monoidHom` (`Geometry/Lie/AutomaticSmoothness.lean:129`, finite-dimensional real Lie groups) |
| Sub- and quotient representations | `ContRepresentation.subrepresentation` and `.quotient` (`RepresentationTheory/Continuous/Subrepresentation.lean:56, :141`) |
| Complexification | `TauCeti.Complexification` (`Analysis/Normed/Module/Complexification.lean:82`), `ContinuousLinearMap.complexify` (:409), `reCLM` (:276), `ofRealLI` (:290) |
| Riemannian volume | `chartVolumeDensity`, `_pos`, `contMDiffOn_` (`Riemannian/VolumeDensity/Basic.lean:48, :61, :74`); `Homeomorph.measurePreserving_riemannianVolume` (`Isometry.lean:173`, Lindelöf source and target) |
| Open mapping | `TauCeti.isOpenMap_of_exists_norm_le` (`Analysis/Normed/Group/OpenMapping.lean:26`); `LinearMap.isOpenMap_of_isTate` (`RingOpNorm/OpenMapping.lean:159`); `HasZeroSequenceOfUnits.isOpenMap` (`Topology/Algebra/OpenMapping/Henkel.lean:79`); `LinearMap.isOpenMap_of_isTateRing` (`RingTheory/Huber/OpenMapping.lean:109`) |

The declarations behind R01, R03 and R06 are listed in those findings.

### Cross-roadmap citations resolved

| Citation | Where it resolves | Result |
|---|---|---|
| AutomorphicFormsOnReductiveGroups §0.1a, §2.1, §2.7 | #1037 at 4a03177: :115, :302, :488; the gap `banach-gfinite-density` is declared there at :54 | Resolves; CompactGroups #1047 at 5ccf6cc supplies it in Layer 5 (:418–447) |
| CompactGroups Layer 5 | main :318 | Representative density |
| NoncommutativeGeometry N1 | main :84 (“Algebras are complex”) | Resolves |
| NoncommutativeGeometry N6 | main :475; anchor `#n6-smooth-noncommutative-two-tori-and-differential-calculus` | Resolves; the #1143 head :94–99 agrees with :13 here |
| BanachSpaceTheory B4, B4.C | main :239, :338 | No real/complex tensor map is stated, as :9 says |
| BanachAlgebras A1–A2, A7 | main: A1–A8 naming at :181; A7.ChosenApproximateIdentity :1577; A7.IntegratedRepresentations :1615; `∫f(xg)dμ(x)=c(g)∫f` :1564 | Resolves |
| LocallyAnalyticDistributions §0.2 | #854 at 473fb50: :1082, theorem :1108; its Lean `naFrechet_openMapping` has `[NontriviallyNormedField K] [CompleteSpace K]`, `WithSeminorms`, no ultrametric hypothesis | Applies at ℝ and ℂ, as :84 says |
| LieGroups Layers 0–3 | main :252–:446 | Resolves |
| OneParameterSemigroups Part A | Completed, main :90 | Resolves |
| NoncompactQuantumSymmetry M0 | #1015 at 4e793e8: :841, consuming Layers 0–4 at :924 | Resolves |
| CompactQuantumMetricSpaces §4.5 | #1155 at 7db4c19: :1124 | Resolves |
| QuantitativeOrbitMethod §§0.2, 0.6 | #1842 at d8dd99f: :235, :325 | Resolves |
| OperatorKTheory K3 §3.5 | #866 at 1377338: :879 | Resolves |

`roadmaps resolve` and `overlaps.md` list nothing found nowhere and no dropped id.

### Ownership by object

| Object | Owner, and why |
|---|---|
| Dixmier–Malliavin | AutomorphicFormsOnReductiveGroups §2.7 (#1037 :496) owns finite-sum factorization for smooth Fréchet representations of G∞, and #1756, #1758 and #1761 consume that one. This roadmap owns the kept variant its :7 describes: all finite-dimensional Lie groups, both fields, prescribed and function support. It also owns the scalar parametrix, which no other roadmap names. That §2.7 states its theorem with no route is a matter for that roadmap's review. |
| Generic smooth-vector inverse closure | Owned here only. HeisenbergImprimitivity (#1149 :622–636) applies `contDiffAt_ringInverse` to its own gauge action and does not restate the generic theorem. |
| Real/complex tensor | Two owners (R01, R02). |

### Seeded sample against the sources

| Target | Locator and result |
|---|---|
| 0.1 | No locator (R05). The mathematics holds (row 1). |
| 0.3 | Casselman, p.1, defines V^(n+1) inductively from V^(1) (lines 11–16). It supports the iterated domains. |
| 1.1 | No locator for the test-space theorems (R05). |
| 1.2 | No locator (R05). |
| 1.4 | Left covariance is at Casselman p.1, lines 27–33. Associativity and multiplicativity have no locator (R05). |
| 2.1 | All orders and the seminorms ‖π(X)v‖_ρ are at lines 11–19. The finite-k criterion is not there (R05). |
| 3.1 | Stability under U(𝔤) is at line 17. |
| 3.2 | No locator (R05). |
| 3.3 | π(X)π(f)v = π(L_X f)v, with L the left regular representation, is at lines 34–35. That L_X equals −R_X here, which matches :269. |
| 6.1 | Proposition 6.1, p.13 (lines 645–649): f_j ∈ C_c^∞(Ω), with Ω a neighbourhood on which exp is a diffeomorphism; shrinking Ω inside U gives the README form. The exponential-product chart is at lines 675–676, as :404 says. |
| 7.1 | Elementary consequences of the definitions. |
| 7.2a | No locator (R05). |
| 7.3 | No locator (R05). |
| 7.4 | Phillips, Definition 2.2, p.274 (line 188), defines X⁺. Theorem 2.1, p.275 (lines 202–204), gives strong continuity and A⁺ as the largest restriction of A\* with domain and range in X⁺. Theorem 2.2, p.277 (lines 270–272), gives X⁺ = {x\*: T\*(s)x\* → x\*}. The folios are at lines 167, 201 and 258. All as stated. |
| 8.1 | No locator (R05). |
| Scalar parametrix (5.1) | Lemma 5.1, p.12 (lines 609–614) is checked in row H3. |

### Adversarial table

| # | Statement | Instances and values computed | Result | Change |
|---|---|---|---|---|
| 1 | 0.1 compact bound, joint continuity | π(t)=e^t, K=[−1,1]: sup ‖π‖ = e ≈ 2.718; at t=10 the norm is e^10 ≈ 22026, so the global bound fails. L∞ translation of 1_[0,1]: difference norm 1 for 0<\|t\|<1, so it is excluded. L²: √(2\|t\|), 0.141 at t=0.01. | True | R05 |
| 2 | 0.2 scaling law | e^t: A₂x = 2x, whereas the wrong law A_sX = A_X gives x. A₋₁x = −x, whereas \|s\|A_X gives x. | True | — |
| 3 | 0.3 word order | Affine matrices, v=(0,1): A_H A_N v = H(1,0) = (1,0) and A_N A_H v = N·0 = 0. HN = E₁₂, NH = 0, so [H,N]v = (1,0). | True | — |
| 4 | 1.1 D_K | K={0}: a continuous f vanishing off 0 has f(0) = lim f(1/n) = 0, so D_K = {0}. Bump translates to n: not convergent in the final topology. | True | R05 |
| 5 | 1.2 Haar density, modular factor | Affine group, left multiplication by (2,0): Jacobian 4, density 1/(4a²), and 4·1/(4a²) = 1/a², so da db/a² is invariant. Right translation by (2,0): c = 2. Chart density a⁻² = ¼ at a=2. | True | R05 |
| 6 | 1.4 convolution order | S₃: δ_(12)*δ_(23) = δ_(123) and δ_(23)*δ_(12) = δ_(132). μ{1}=2: (½1₁)*(½1₁)(1) = ¼·2 = ½. | True | R05 |
| 7 | 2.1 seminorms and finite k | e^{inx}/n on C(S¹): p₀ = 0.1 and p₁ = 1.1 at n=10. e^{ix}: p₃ = 4; with basis 2∂, 2⁴−1 = 15. L² step: the squared difference quotient is 2/\|t\| = 200 at t=0.01, so E⁰ holds and E¹ fails. | True | R05, R07 |
| 8 | 3.1 derivative conventions | Affine group: [L_H,L_N] = L_N; [R_H,R_N] = [a∂a+b∂b, ∂b] = −∂b = −R_N; R_H b = b and L_H b = 0. | True | — |
| 9 | 3.2 Ad-covariance | g=(2,0) in the matrix representation: gNg⁻¹ = 2N = dπ(Ad(g)N). For general (a,b): aN. | True | R05 |
| 10 | 3.3 smoothing sign | e^t: dπ(X)π(f)1 = ∫f e^t, and π(−R_X f)1 = −∫f′e^t, which equals ∫f e^t after integration by parts. The sign +R_X would give −∫f e^t. | True | — |
| 11 | 3.4 modular integration by parts | Affine group, trivial action: ∫a∂a f·a⁻²da = ∫f a⁻²da. With q_H = 1 = tr ad H, ∫(q_H f − L_H f) = 0 = π(f)dπ(H)v. q_N = 0, because right translation by (1,s) has Jacobian 1. | True | — |
| 12 | 6.1 exponential-product chart | Order (H,N): Φ = (e^{t₁}, e^{t₁}t₂), Jacobian e^{2t₁}, J ≡ 1. Order (N,H): Φ = (e^{s₂}, s₁), \|det\| = e^{s₂}, J = e^{−s₂} = 0.368 at s₂=1. X₁ = X₂ = e₁: rank 1, so no chart. Constant J=2: dividing gives ∏∫g_i; not dividing gives twice that. | True | — |
| 13 | 7.1 kernel | Trivial action, ℝ²→ℝ: the smooth kernel is {0}×ℝ, equal to the kernel. | True | — |
| 14 | 7.2a cross property, comparisons | ℝ²⊗ℝ³: π(e₁⊗e₁) = 1, while the representation (e₁+e₂)⊗e₁ − e₂⊗e₁ costs √2+1 ≈ 2.414; the pin gives only ≤ 1. Balancing ℂ_ℝ⊗ℂ_ℝ → ℂ: kernel span{i⊗1−1⊗i, 1⊗1+i⊗i}, dimension 2. The inverse of the complexification map is complex-bilinear: multiplying the first argument by i turns (x⊗y−x′⊗y′) + i(x⊗y′+x′⊗y) into i times itself. | True | R01, R02 |
| 15 | 7.3 shuffle law | e^t ⊗ e^{2t}: orbit e^{3t}; first derivative 3 = 1+2; second 9 = 1+2·1·2+4. | True | R05 |
| 16 | 7.4 contragredient | C(S¹)′: ‖δ_z−δ₁‖ = 2 for z≠1, so δ₁ is excluded. e^t: the contragredient is e^{−t}λ, with derivative −λ(x), the negative transpose. | True | — |
| 17 | 8.1 inverse rule, star law, Leibniz rule | diag(e^t,1) on M₂(ℝ): a = I+E₁₂ has derivative E₁₂; a⁻¹ = I−E₁₂ has derivative −E₁₂ = −a⁻¹E₁₂a⁻¹. M₂(ℂ): dα(E₂₁) = −E₂₁, while (dαE₁₂)\* = E₂₁, so the star law fails. Unitary case: −iE₂₁ = (iE₁₂)\*. D²(e^{2ix}) at 0 = −4, whereas a derivation rule gives −2. | True | R06 |
| H1 | `isSmoothLieVector_smear` | G=ℝ, π=e^t on ℝ, bump f with ∫f e^t = c: orbit s ↦ c·e^s, smooth. G discrete (V=0): every orbit is smooth. f=0: smear = 0. | True | — |
| H2 | `dense_smoothLieVectors` | E={0}: dense. L²(ℝ) translation: H^∞ ⊇ C_c^∞, which is dense. Trivial group: everything is smooth. | True | R07 |
| H3 | `scalarParametrix` | ε=0: g=h=0, so the sums are 0, while δ₀(φ) = 1 for φ(0)=1: false, and excluded by hε. N=0 with φ ≡ 1 near [−ε,ε]: α₀∫g = 1+∫h. β₀ = −5 is allowed, since α₀ is unbounded. (−1)^{2n} = 1, so the derivative convention is irrelevant. Casselman's (2π)^{−2k} is absorbed: α′_k = α_k(2π)^{−2k} ≤ A_k. Weak convergence implies compact convergence on the barrelled Montel space 𝓓. | True | — |
| H4 | `dixmierMalliavin` | Trivial group of mass 2: f(1) = ½ gives π(f)v = ½·2·v = v. v=0: n=0. | True | — |
| H5 | `dixmierMalliavin_function` | S₃, U={e}, φ=δ_(12): f=δ_e and h=δ_(12) give f*h = δ_(12), with tsupport h = {(12)}. Proof route: series of derivatives of φ stay supported in tsupport φ (a closed set), so the inner factors are C_c^∞ with tsupport ⊆ tsupport φ. | True | — |
| H6 | `smooth_lift` | Trivial action, ℝ²→ℝ: w=1 lifts to v=(1,0). T = id: v = w. F = 0: v = 0. | True | — |
| H7 | `smooth_inverse` | Trivial action on ℝ: 2 ↦ ½. diag(e^t,1): the orbit of a⁻¹ is I−e^tE₁₂. The 12-line scratch proof elaborates. | True | — |
| H8 | proposed holomorphic closure | M₂(ℂ), a = I+E₁₂, Γ: \|z−1\| = ½. 1/z gives 2πi(I−E₁₂); z² gives 2πi(I+2E₁₂). The orbits are smooth, and the statement elaborates at the pins. | True, statable | R03 |
| D1 | docstring: completed locally convex tensor “not at the pins” | `TauCeti.CompletedProjectiveTensorProduct` at `Projective/Completion.lean:54` | False | R01 |
| D2 | docstring: holomorphic closure not statable | Probe elaborates with the cycle integral | False | R03 |
| C1 | :11 Fréchet open mapping not pinned | 4 Mathlib criteria (Banach; σ-compact with Baire target; module topology; quotient topology) and 4 Tau Ceti (seminormed or nonarchimedean source). V=ℝ^ℕ: (2,0,…) ∉ {\|x₀\|<1}, so V is not nonarchimedean. W=ℓ²: e_n/n has norm 0.1 at n=10, while φ(e_n/n) = 1. | True | — |

## Not verifiable

- **Dixmier–Malliavin, Bull. Sci. Math. 102 (1978).** The manifest records it as uncertified (no legal open copy), so it was not read. The README relies on Casselman's stated locators.
- **Bernstein–Krötz, and Getz.** These are the sources AutomorphicFormsOnReductiveGroups gives for the complex counterparts that R05 suggests reusing. I did not open them, so the R05 pointers are candidates, not verified locators.
- **Grothendieck's locators of N1.Tensor.** The #1143 head cites them; I did not open them.
- **Schneider's notes, Proposition 8.6.** This is LocallyAnalyticDistributions' source for §0.2. I did not open it; the consumed form is contained in Henkel's Theorem 1.6 (`henkel2014` lines 131–141).
- **The three board packages** (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory): I did not read their READMEs. Their names are far from this roadmap's objects.

## Source issues

- **Misprint** in casselman2016 at the proof of Lemma 4.1, pp.10–11: the statement has no 2π normalization, while the proof bounds α_k by (2π)^k A_k and divides by (2π)^{2n} with n not the summation index; it should be (2π)^{2k}, with α_k(2π)^{−2k} renamed as the lemma's coefficients; affects nothing.
- **Error** in casselman2016 at the proof of Lemma 5.1, p.12: the replacement bounds B_m are taken as the supremum of A_m and the derivative-control constants; it should be their infimum, since each α_m must satisfy all of them at once; affects the proof.
- **Misprint** in casselman2016 at the proof of Proposition 6.1, p.13: the scalar limit and the vector series omit the alternating sign (−1)^n that Lemma 5.1 carries; it should include (−1)^n in both; affects the proof.
