# Review of SmoothBanachRepresentations (pull request #1145 at 073a53d)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`
**Verdict:** needs changes

This is a full review: 165 lines of the folder changed since `7cde28a`. The gate passes with the candidate order and the build.

- **Previous findings.** Five of the seven are fully repaired (R01, R02, R03, R05, R07). R06 is repaired except for three contract names, which are now R04. The family-index finding (previous R04) is not repaired and is carried as R03.
- **New findings.** R01 and R02 are P2.

## R01 (P2) — §7.2a uses a topology on the complexification of a real Fréchet space that nothing provides

**Location.**
- `README.md:470` (§7.2a): “For real Fréchet E and F let E_ℂ be the complexification E×E of `TauCeti.Complexification` with its product topology.”
- The same paragraph uses `(E⊗̂ℝF)_ℂ`, the complexification of a completed (non-normed) tensor.
- The contract at :58 consumes `TauCeti.Complexification` “for real Banach actions”.
- Neither the *Needs:* line at :472 nor the API at :474 has a target for this topology.

**Claim.**
- At the pin, `TauCeti.Complexification X` has a topology only when X is seminormed.
- For a non-normable Fréchet E, and for `E⊗̂ℝF`, there is no topology on E_ℂ. There is also no complex seminorm family with `WithSeminorms`.
- Both `CompletedProjectiveTensorProduct` and `liftEquiv` at 𝕜=ℂ need such a family.
- The complexification isomorphism therefore rests on a construction that no layer, supplier section or pinned declaration provides.

**Witness.** In `TauCeti/Analysis/Normed/Module/Complexification.lean`:
- Before :178 the file has only algebraic instances: `AddCommGroup` (:115) and `Module ℂ` (:143).
- The norm (:181), `instNormedSpace` (:270) and `equivProd` (:312) all sit under `[SeminormedAddCommGroup X] [NormedSpace ℝ X]` (:178).
- A grep of the pinned Tau Ceti finds no `TopologicalSpace`, `UniformSpace` or `WithSeminorms` on `Complexification` beyond this.
- `roadmaps grep` finds no other roadmap that owns it.

**Repair.**
1. In §7.2a, before the complexification isomorphism, add a target in prose. For a real space X whose topology is given by a seminorm family (p_i):
   - give `TauCeti.Complexification X` the complex seminorms `p_i^ℂ(x+iy) = sup_θ p_i(cos θ·x − sin θ·y)`, the pin's Taylor norm with p_i in place of the norm;
   - prove they are ℂ-seminorms (`p^ℂ(wz)=p^ℂ(z)` for |w|=1) with `max(p(x),p(y)) ≤ p^ℂ(x+iy) ≤ p(x)+p(y)`;
   - prove they give the product topology of X×X, and that X_ℂ is Hausdorff, complete or metrizable whenever X is;
   - prove that for normed X they give the pinned `instNormedSpace` topology.
2. Add this target to the scalar-comparison API (:474) and to *Needs:* (:472), and add Checks (below).
3. Change :470 to “with the topology of that target”.

**Tested.** For X = ℝ with p = |·|:
- p^ℂ(3+4i) = sup_θ |3 cos θ − 4 sin θ| = 5 = |3+4i|, and p^ℂ(x+i0) = |x|.
- The plausible wrong choice p(x)+p(y) is ℝ-homogeneous but not ℂ-homogeneous. At z = 1 and w = e^{iπ/4}, it gives p(w·1) = 1/√2 + 1/√2 = √2 ≈ 1.414, whereas |w|·p(1) = 1.
- Both values belong in the Checks.

## R02 (P2) — The finite-k domain criterion can be stated at the pins, but the docstring says it cannot

**Location.**
- `Suggested.lean:17–21`: “The complete mixed-word topology and its finite-regularity criterion, continuous Lie/enveloping action, … need the mixed-domain Fréchet topology on the smooth vectors … That carrier is not at the pins”.
- `README.md:7` and §2.1 (:221) make the finite-k criterion this roadmap's own result: “the finite-k criterion is this roadmap's own, proved by the frame argument”.

**Claim.**
- The criterion says: v∈E^k exactly when every basis word of length ≤ k is defined. It involves the orbit's `ContMDiff` of order k in the Banach norm, and the generators A_X.
- It does not involve the Fréchet topology on E∞.
- The generators are pinned (`ContRepresentation.toStronglyContinuousGroup` applied to `π.restrict (oneParameterSubgroup X)`). A right-to-left word evaluation is a three-line recursive definition with a real body.
- So a headline the docstring itself lists is statable and absent, and the docstring's reason is false for it.

**Witness.** In a scratch copy of `Suggested.lean`, the declarations below elaborate with only `sorry` warnings. The copy adds the imports `TauCeti.Geometry.Lie.Exponential.Basic`, `TauCeti.RepresentationTheory.Continuous.OneParameter` and `TauCeti.Analysis.Semigroups.Group.Generator`, and places the declarations after `lieSmoothVectors`. The binders of `oneParameterSubgroup` (`Geometry/Lie/Exponential/Basic.lean:132`) are exactly the file's `hFD hLie hManifold hT2 hBoundary`.

```lean
/-- The real generator of `π` along the one-parameter subgroup of `X` (README §0.2's `A_X`). -/
def lieGenerator (π : ContRepresentation 𝕜 G E) (hπ : HasContinuousOrbits π)
    (X : LeftInvariantDerivation I G) : E →ₗ.[ℝ] E :=
  ((π.restrict (oneParameterSubgroup X).toMonoidHom).toStronglyContinuousGroup
    (fun v => (hπ v).comp (oneParameterSubgroup X).continuous)).generator

open Classical in
/-- A word of partial maps applied right to left; `none` when a domain condition fails. -/
def wordApply {ι : Type*} (A : ι → E →ₗ.[ℝ] E) : List ι → E → Option E
  | [], v => some v
  | i :: w, v => (wordApply A w v).bind fun u =>
      if h : u ∈ (A i).domain then some (A i ⟨u, h⟩) else none

include hFD hLie hManifold hT2 hBoundary hComplete in
/-- Finite-order domain criterion: the orbit is `C^k` iff every basis word of length `≤ k`
is defined. -/
theorem contMDiff_orbit_iff_wordApply_isSome (π : ContRepresentation 𝕜 G E)
    (hπ : HasContinuousOrbits π) {ι : Type*} (b : Module.Basis ι ℝ (LeftInvariantDerivation I G))
    (k : ℕ) (v : E) :
    ContMDiff I 𝓘(ℝ, E) k (fun g : G => π g v) ↔
      ∀ w : List ι, w.length ≤ k →
        (wordApply (fun i => lieGenerator (I := I) π hπ (b i)) w v).isSome := by
  sorry
```

**Repair.**
1. Add the three declarations and the three imports to `Suggested.lean`.
2. Name `lieGenerator` in §0.2 (as A_X) and `wordApply` with `contMDiff_orbit_iff_wordApply_isSome` in §2.1.
3. Remove “and its finite-regularity criterion” from the docstring at :17.

**Tested** on the instances that the README's own Checks use:
- k = 0: only the empty word exists, and it is defined; the left side is continuity of the orbit, which `hπ` gives. Both sides are true.
- Translation on L²(ℝ), v = 1_[0,1], k = 1: the squared difference quotient is 2/|t| = 200 at t = 0.01, so v ∉ D(A_1) and the word [0] is undefined. The orbit is not C¹. Both sides are false.
- Discrete G (V = 0): ι is empty and only [] occurs. Every orbit is smooth. Both sides are true.

## R03 (P3) — The family index still omits this roadmap, and its scope paragraph contradicts it

This carries the previous R04 (earlier R01). No repair report marks it not actionable.

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md`:
- “## The roadmaps” links 14 of the 15 subfolders.
- :129–131: “The analytic representation theory stops at compact groups … no infinite-dimensional unitary representations of noncompact groups”.

**Claim.**
- The index of this pull request's family does not list this folder.
- Its scope boundary excludes what Layers 0–4 cover.
- The description does not name the pull request that adds the entry; it says “changes only SmoothBanachRepresentations/”.

**Witness.**
- At this head, a count of `](<Dir>/README.md)` gives 0 for SmoothBanachRepresentations and at least 1 for every other subfolder.
- RepresentationTheory #1146 (head e5e8364) has the entry at :55 and a rewritten scope bullet at :119–125.

**Repair.** Do one of the following:
- Copy #1146's entry (:55) and scope bullet (:119–125) into the family `README.md`, replacing :129–134.
- Or state in the description that #1146 adds them and merges right after this pull request.

## R04 (P3) — §8.1 uses three pinned `CStarAction` declarations that the Tau Ceti contract does not list

**Location.**
- `README.md:524` uses `α.toContinuousLinearMap`, `continuous_orbit` and `CStarAction.generator_restrictScalars`.
- The contract at :62 lists only `TauCeti.CStarAction`, `CStarAction.comp`, `generator`, `isClosed_generator`, `dense_generator_domain`, `generatorDomain`, `generator_mul`, `generator_star` and `generator_one`.
- *Needs:* (:530) refers to “the generator laws listed in the Tau Ceti contract”.

**Claim.** The adapter and the identification with dα(X) consume three declarations that are not in “From Tau Ceti”.

**Witness.**
- `CStarAction.toContinuousLinearMap` is at `TauCeti/Analysis/CStarAlgebra/Action/Basic.lean:90`.
- `continuous_orbit` is a structure field, at :45.
- `CStarAction.generator_restrictScalars` is at `…/Action/Generator/Basic.lean:88`. It states that restricting the complex generator to ℝ gives `toStronglyContinuousGroup.generator`.

**Repair.** Add the three names, with their files, to the contract paragraph at :62.

## Previous findings

- **R01 (P2), the real tensor at the pin — repaired.**
  - :60 now consumes the pinned `PiTensorProduct` API, file by file.
  - :468 reads “This section builds no tensor product and proves no law of one”.
  - `Suggested.lean:22–23` now says the tensor “is at the pin … the tensor comparison lacks only that Fréchet carrier”.
  - Every declaration named at :60 was re-opened at its file (see Verified sound).
- **R02 (P2), two owners of the real tensor — repaired.**
  - :9 reads “NoncommutativeGeometry N1 owns the rest of the completed locally convex projective tensor, over ℝ and over ℂ alike”.
  - NoncommutativeGeometry at f1b5581 agrees:
    - :19–23 says “The two scalar-comparison maps … are stated by SmoothBanachRepresentations §7.2a and are not planned here”;
    - :351–352 makes N1.Tensor cover both fields.
  - The description names #1143 among the revisions that merge first.
- **R03 (P2), holomorphic closure — repaired.**
  - It is `smooth_resolventIntegral` (`Suggested.lean:205`), which is more general than the proposed statement (f only continuous on the trace).
  - The general form is true: see row H8 below.
- **R04 (P3), the family index — not repaired.** It is carried as R03.
- **R05 (P3), locators — repaired.**
  - §0.1 cites Bernstein–Krötz Lemma 2.3 and Remark 2.4.
  - §1.1, §1.2, §2.1 (finite k), §3.2, §7.2a, §7.3 and §8.1 (non-isometric case) now say in one clause that the statement is this roadmap's own, and name the method's source.
  - §1.4 cites Bernstein–Krötz §2.5; §2.1 cites Lemma 2.15 and Remark 2.13(a); §8.1 cites Schweitzer Theorems 1.17, 2.2 and 4.1.
  - All were checked against the text (see the sample).
- **R06 (P3), `CStarAction` — repaired, except for the three contract names in R04.** The contract at :62 and §8.1 at :524 consume the pinned C\*-action and its generator laws.
- **R07 (P3), the second name — repaired.**
  - :221 reads “at 𝕜=ℂ they are §2.7's definitions, so the library has one declaration of each”.
  - The Lean names are now `IsLieSmoothVector`, `lieSmoothVectors`, `lieSmoothVectors_dense` and `isLieSmoothVector_smear`.
  - AutomorphicFormsOnReductiveGroups at #1037 (:490) uses the same names, over ℂ, for real Lie groups.

## Verified sound

### Gate, dependency check and diff

- **Diff.** `git diff origin/main...HEAD` touches only `README.md` (+568) and `Suggested.lean` (+216). Nothing outside the folder changed.
- **Gate**, rerun with the candidate order and `--build`:

  ```text
  gate SmoothBanachRepresentations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
  ```

  Without `--order`, the only failure is `depcheck: NOT IN ORDER`, which is expected for a roadmap still in a pull request.
- **Dependency check** (`gate --depcheck … --movable`, candidate order):

  ```text
  depcheck: 238 roadmaps, 2320 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
  - This roadmap is at line 61 of the order. Its suppliers come first: LocallyAnalyticDistributions (44) and AutomorphicFormsOnReductiveGroups (60).
  - NoncommutativeGeometry, BanachSpaceTheory, BanachAlgebras, LieGroups, CompactGroups and OneParameterSemigroups (Completed) are on main.
  - The consumers come later: NoncompactQuantumSymmetry (156), CompactQuantumMetricSpaces (209) and QuantitativeOrbitMethod (294).

### Elaboration and signatures

- `lake env lean Suggested.lean` gives exactly 8 warnings, all “declaration uses `sorry`”, at :100, :109, :121, :140, :153, :170, :188 and :205.
- `#check @name` was run on all 13 declarations in one scratch file. After normalising whitespace, all 13 elaborated types are identical to `signatures.md`.
- The seven “dropped binder” leads are definitions whose bodies do not need the dropped binders, and two theorems (`smooth_inverse`, `smooth_resolventIntegral`) that use no measure:
  - every theorem carries `CompleteSpace` for E, F or A where its statement needs it;
  - every theorem keeps all five Lie hypotheses.
- **Padding probe:**
  - each of the 8 theorems was tried with `simp`, `rfl`, `infer_instance`, `fun_prop` and `aesop`;
  - all 40 attempts fail;
  - no declaration restates a definition or mirrors a Check.

### Library declarations opened at the pins

**Mathlib 1b1ccf4**, beyond the 17 already listed in the previous review:

| Declaration | Where, and what it assumes |
|---|---|
| `TestFunction.continuous_iff_continuous_comp` | `Analysis/Distribution/TestFunction.lean:335`: the final-topology universal property |
| `ContDiffMapSupportedIn` | `Analysis/Distribution/ContDiffMapSupportedIn.lean:97` |
| `measure_isHaarMeasure_eq_smul_of_isOpen` | `MeasureTheory/Measure/Haar/Unique.lean:829`: `LocallyCompactSpace`, no second countability, as :162 says |
| Instance `[Regular μ] : InnerRegularCompactLTTop μ` | `MeasureTheory/Measure/Regular.lean:1122`, as :172 says |
| `IsBoundedBilinearMap.contDiff` | `Analysis/Calculus/ContDiff/Basic.lean:189` |
| `ContinuousLinearMap.hasFDerivAt_of_bilinear` | `Analysis/Calculus/FDeriv/Bilinear.lean:120` |
| `QuotientAddGroup.completeSpace_right` | `Topology/Algebra/IsUniformGroup/Basic.lean:691–700` (the `to_additive` form): complete, first countable |
| `LieGroup 𝓘(𝕜, R) n Rˣ` | `Geometry/Manifold/Instances/UnitsOfNormedAlgebra.lean:64`, used in §4.1 |
| `ContRepresentation.restrict` | `RepresentationTheory/Continuous/Basic.lean:446` |

**Tau Ceti 2fd255d**, beyond the previous review's 38:

| Area | Declarations, file and line |
|---|---|
| Completed projective tensor, under `Analysis/Normed/Module/PiTensorProduct/` | `projectiveSeminormOf` (:41), `_tprod_le` (:57), `_mono` (:108) in `Projective/Seminorm.lean`; `withSeminorms` (:167) and `instFirstCountableTopology` (:180) in `Projective/Topology.lean`; `CompletedProjectiveTensorProduct` (`Projective/Completion.lean:54`, the `UniformSpace.Completion`) with `tprod` (:65), `continuousLinearMap_ext` (:82), `lift` (:100), `map` (:139), `map_id` (:156), `map_comp` (:167); `liftEquiv` (`UniversalProperty.lean:122`, `NontriviallyNormedField`, complete T0 target with `WithSeminorms`); `reindex` (`Reindex/Completion.lean:41`) |
| C\*-actions | `CStarAction` (`Analysis/CStarAlgebra/Action/Basic.lean:41`, `NonUnitalCStarAlgebra`, continuous orbits), `comp` (:156, along a `ContinuousMonoidHom`), `toContinuousLinearMap` (:90); in `Generator/Basic.lean`: `generator` (:72), `generator_restrictScalars` (:88), `dense_generator_domain` (:133), `isClosed_generator` (:140), `generator_mul` (:172), `generator_star` (:192), `generatorDomain` (:199, `NonUnitalStarSubalgebra`), `generator_one` (:259, unital) |
| Contour cycles | `Cycle` (`Analysis/Contour/Cycle/Basic.lean:192`), `trace` (:198), `IsIn` (:261), `integral` (:312, the raw `∫ deriv γ • f∘γ` extended additively), `intervalIntegrable_of_mem_support` (:345), `integral_comp_comm` (:356, needs `CompleteSpace` on both sides), `windingNumber` (:426), `IsNullHomologous` (:447) |
| Resolvent integrals | `integral_smul_resolvent_eq_of_windingNumber_eq` (`Analysis/Normed/Algebra/HolomorphicFunctionalCalculus/Cycle.lean:73`) and `integral_eval_smul_resolvent` (:184, value `(2πi) • aeval a p`). Both match §8.1's description. |
| Integrated operator | `ContRepresentation.integratedOperatorL1` (`RepresentationTheory/Continuous/Integrated/Basic.lean:144`, `AddMonoid`, R1, Borel, `InnerRegularCompactLTTop`) and `integratedOperatorL1_toL1` (:181), as :66 says. The transport to `Additive G` is how Tau Ceti itself proceeds (`Analysis/CStarAlgebra/Action/Covariant/Integrated.lean:212`). |
| One-parameter groups | `ContRepresentation.toStronglyContinuousGroup` (`RepresentationTheory/Continuous/OneParameter.lean`, takes the orbit-continuity proof); `oneParameterSubgroup` (`Geometry/Lie/Exponential/Basic.lean:187`, a `ContinuousMonoidHom (Multiplicative ℝ) G`, under the binders at :132); `StronglyContinuousGroup.generator` (`Analysis/Semigroups/Group/Generator.lean:81`), `hasDerivAt` (:261); `StronglyContinuousSemigroup.smoothVectors` (`Generator/SmoothVectors.lean:49`) |

Every backticked name in the README (133) exists at a pin, except this roadmap's own 13, which `Suggested.lean` declares. `roadmaps resolve` reports nothing found nowhere.

### Cross-roadmap citations resolved

| Citation | Where it resolves | Result |
|---|---|---|
| AutomorphicFormsOnReductiveGroups §0.1a, §2.1, §2.7 | #1037 head: headings at :115, :302, :488; the gap `banach-gfinite-density` at :53 | Resolves. §2.7's `IsLieSmoothVector` is over ℂ for real Lie groups, and its L_X differentiates a(exp(tX)y), matching :76. |
| LocallyAnalyticDistributions §0.2 | #854 head: :1082, theorem :1108; Lean `naFrechet_openMapping` has `[NontriviallyNormedField K] [CompleteSpace K]` and `WithSeminorms`, with no ultrametric hypothesis | Applies at ℝ and ℂ |
| NoncommutativeGeometry N1.Tensor, N6 | #1143 head f1b5581: :349–404 (both fields, cross property, unit, sums, Fréchet, B4), :19–23 (§7.2a owns the two maps), :1476–1479; N6 on main :475 | Resolves |
| CompactGroups Layer 5 | main :318 (Peter–Weyl density) | Resolves |
| BanachSpaceTheory B4; BanachAlgebras A1–A2, A7 | main | Unchanged since the previous review |
| NoncompactQuantumSymmetry M0 | #1015 :840 | A consumer, later in the order |
| QuantitativeOrbitMethod | #1842: :123–125, :244, :328 | Consumes §§2.1, 3.1, 3.4 and 6.1, which exist here |

`overlaps.md` reports no open pull request that changes this roadmap and no dropped id. The renamed §7.2a heading keeps its number, which is how #1143 cites it.

### Ownership by object

These searches used `roadmaps grep` over 468 open heads and main, and the sibling checkouts of #1143, #1146, #1842 and #1015.

| Object | Owner, and why |
|---|---|
| Balancing map and complexification isomorphism | Owned here only; #1143 cedes them. |
| Continuous-dual contragredient subspace | Here only. |
| Inverse closure and holomorphic closure of smooth elements | Here only. |
| Support-controlled Dixmier–Malliavin | Here. AutomorphicFormsOnReductiveGroups §2.7 owns the unsupported complex Fréchet form; #1756, #1758 and #1761 consume that one. |
| Locally convex complexification | No owner anywhere (R01). |
| Fréchet open mapping theorem | LocallyConvexDuality (#1782) disclaims it at its :55, so it does not compete with LocallyAnalyticDistributions §0.2. |

### Seeded sample against the sources

| Target | Locator and result |
|---|---|
| 0.2 | No external locator; it consumes the pinned group-generator API (verified above). The scaling, coefficient and s=0 laws were computed (row 2). |
| 0.3 | Casselman p.1 defines V^(n+1) inductively (`casselman2016` lines 11–16). That supports composable word domains; truncation and powers are definitional. |
| 1.1 | Said to be this roadmap's own; its Euclidean model `TestFunction.continuous_iff_continuous_comp` was checked at the pin. |
| 1.2 | Said to be this roadmap's own assembly. Haar uniqueness on opens (`Unique.lean:829`) needs no second countability, as stated. |
| 1.3 | No external locator; the pinned L¹ comparison and the regular-measure instance were checked. |
| 1.4 | Bernstein–Krötz §2.5, pp.11–12 (`bernsteinkrotz2013` lines 366–415) gives M_c(G), R(G) and Π(µ∗ν)=Π(µ)Π(ν). The folios are 11 (line 365) and 12 (line 405). Its displayed convolution has the reversed order (see Source issues); the README's order is the standard one (row 6). |
| 1.5 | Standard; Casselman p.1 (lines 34–36) gives the Dirac-sequence convergence π(f_n)v→v. |
| 3.1 | Casselman p.1 (line 17) gives stability under U(𝔤). The Lie-homomorphism sign was computed on the affine group (row 8). |
| 3.4 | Derived here from the modular convention; the sign is verified in row 11. |
| 4.1 | Casselman p.1 (line 36) gives norm density. Automatic smoothness and the units Lie group are pinned. |
| 5.1 | Casselman Lemma 4.1, p.9 (lines 492–499), Lemma 4.2, p.10 (lines 524–526), Lemma 5.1, p.12 (lines 609–614): positive α_m ≤ A_m and arbitrarily small supports. The scalar headline is weaker than this (α₀ free). |
| 6.1 | Casselman Proposition 6.1, p.13 (lines 645–649) gives f_j ∈ C_c∞(Ω); lines 675–676 give the exponential-product chart. As stated. |
| 7.1 | Elementary; M∞ = M∩E∞ holds because a closed subspace contains the derivatives. |
| 7.3 | Said to be this roadmap's own; its method (`IsBoundedBilinearMap.contDiff`) was checked at the pin. Grothendieck p.77 (`grothendieck1952` lines 180–188) gives the completed product and its universal property for complete targets. |
| 7.4 | Phillips, Definition 2.2, p.274 (`phillips1955` line 188), Theorem 2.1, p.275 (lines 202–204), Theorem 2.2, p.277 (lines 270–272). Bernstein–Krötz §3.1, p.13 (lines 460–477): the continuous dual Ẽ, closed and G-invariant by Lemma 2.3. As stated. |
| Other locators of the repair | Bernstein–Krötz Lemma 2.3, p.6 (lines 196–206); Remark 2.4(a)(b), p.7 (lines 209–220); Remark 2.13(a), p.10 (line 341); Lemma 2.15, p.10 (lines 357–360); Remark 2.18, p.12 (lines 423–428). Schweitzer Theorem 1.17, p.8 (line 299); Theorem 2.2, p.10 (lines 428–435, isometric actions); Theorem 4.1, p.14 (lines 548–554). Grothendieck Théorème 1, p.76 (lines 153–163): page 2 of the scan is p.73 and page 6 is p.77 (line 174). All as stated. |

### Adversarial table

| # | Statement | Instances and values computed | Result | Change |
|---|---|---|---|---|
| 1 | 0.1 compact bound | π(t)=e^t, K=[−1,1]: sup‖π‖ = e ≈ 2.718; ‖π(10)‖ = e^10 ≈ 22026, so there is no global bound. L∞ translation of 1_[0,1]: difference norm 1, so it is excluded. L²: √(2\|t\|) = 0.141 at t=0.01. | True | — |
| 2 | 0.2 generator laws | e^t model: A₂x = 2x (the wrong law A_sX = A_X gives x); A₋₁x = −x (\|s\|A_X gives x); A₀ = 0 with domain E. Rotation on ℂ: A₁1 = i, A₁i = −1 = i·A₁1 (conjugate-linear would give 1). | True | — |
| 3 | 0.3 word order, non-additive domains | Affine matrices, v=(0,1): A_H A_N v = (1,0) and A_N A_H v = 0. f = 1_[0,1](x−y)φ(x+y): the derivative along (1,1) is −2·1_[0,1](x−y)φ′(x+y) ∈ L²; along (1,0), ‖τ_t f − f‖² ≈ \|t\|‖φ‖², so the quotient is ‖φ‖²/\|t\| → ∞. | True | — |
| 4 | 1.1 fixed-support spaces | K={0}: f(0) = lim f(1/n) = 0, so D_K = {0}. sin(nx)/n·bump: sup norm O(1/n), derivative ≈ cos 0 = 1 at the plateau. | True | — |
| 5 | 1.2 Haar density | Affine group: left multiplication by (2,0) has Jacobian 4, and 4·1/(4a²) = 1/a², so da db/a² is invariant. Right translation gives c(a₀,0) = a₀. Density at a=2 is ¼ > 0. | True | — |
| 6 | 1.3–1.4 integration, order | e^t, f ≡ 1 on [0,1]: π(f)1 = e−1 ≈ 1.718 ≤ C_K‖f‖₁ = e. S₃: δ_(12)∗δ_(23) = δ_(123) and δ_(23)∗δ_(12) = δ_(132), so the order is detected. μ{1}=2: (½1₁)∗(½1₁)(1) = ¼·2 = ½. | True | — |
| 7 | 1.5 approximate identity | Trivial action: a mass-1 kernel sends 1 to 1 and a mass-0 kernel sends it to 0. In dimension 0 the unit is 1_{e}/μ{e}. | True | — |
| 8 | 3.1 conventions | Affine group: [L_H,L_N] = [a∂a, a∂b] = a∂b = L_N; [R_H,R_N] = [a∂a+b∂b, ∂b] = −∂b = −R_N; R_H b = b, L_H b = 0; HN−NH = E₁₂ = N. | True | — |
| 9 | 3.3 smoothing sign | e^t: π(−R_X f)1 = −∫f′e^t = ∫f e^t = dπ(X)π(f)1. The sign +R_X gives −∫f e^t. Casselman's L_X equals −R_X here (line 35). | True | — |
| 10 | 3.2 Ad-covariance | g=(2,0) in the matrix representation: gNg⁻¹ = 2N = dπ(Ad(g)N). | True | — |
| 11 | 3.4 modular integration by parts | ∫ f(g)π(g exp tX)v dμ = c(exp tX)∫ f(y exp(−tX))π(y)v dμ; d/dt at 0 gives π(q_X f − L_X f)v. Affine, trivial action: ∫a∂a f·a⁻² = ∫f a⁻², so ∫(q_H f − L_H f) = 0, with q_H = 1 = tr ad H. | True | — |
| 12 | 4.1 compact-finite comparison | e^{inx} has a 1-dimensional span. ∏C₂: functions of r coordinates span ≤ 2^r dimensions; the identity component is trivial, so the group is not Lie. Projection: Taylor norm at θ=0 gives ‖x‖ ≤ ‖x+iy‖; projecting after including gives x, not 2x or 0. | True | — |
| 13 | 5.1 scalar parametrix | N=0 paired with ψ≡1 near [−ε,ε]: α₀∫g = 1+∫h. ε=0: 0 = δ₀(φ) = 1 is false, so hε is needed. β₁ = 1/10 and D₃ = 100 force α₁ ≤ 1/100; the maximum 1/10 gives 10 > 1. (−1)^{2n} = 1, so `lineDerivCLM`'s sign cancels. | True | — |
| 14 | 6.1 chart | Order (H,N): Φ = (e^{t₁}, e^{t₁}t₂), Jacobian e^{2t₁}, J ≡ 1. Order (N,H): Φ = (e^{s₂}, s₁), J = e^{−s₂} = 0.368 at s₂=1. X₁ = X₂ = e₁ gives rank 1, so there is no chart. Constant J = 2: omitting the divisor doubles ∏∫g_i. | True | — |
| 15 | 7.1–7.2 kernel, lift, quotient topology | Trivial actions, ℝ²→ℝ: 1 lifts to (1,0), and the smooth kernel {0}×ℝ is the kernel. C(S¹), f_n = sin(nx)/n: p₀ = 1/n, p₁ = 1/n+1, so the identity onto the sup-norm space is not open. | True | — |
| 16 | 7.2a scalar comparisons | (i,i) ↦ −(1⊗1)⊗1 = i·[i·(1⊗1)⊗1], the value at (1,i); the + variant gives +(1⊗1)⊗1. ℂ_ℝ⊗ℂ_ℝ: kernel span{i⊗1−1⊗i, 1⊗1+i⊗i}, dimension 2. ℂ²,ℂ³: 24−12 = 12. E₁₂−E₂₁ has singular values 1,1, so its norm is 2 and its image is 0; ‖1⊗i‖ = 1 = \|i\|. | True | R01 |
| 17 | 7.3 shuffle | e^t ⊗ e^{2t}: orbit e^{3t}; first derivative 3 = 1+2; second 9 = 1+2·1·2+4. | True | — |
| 18 | 7.4 contragredient | C(S¹)′: ‖δ_z − δ₁‖ = 2, so δ₁ is excluded and Haar is included. e^t: e^{−t}λ, derivative −λ(x). | True | — |
| 19 | 8.1 star and Leibniz | diag(e^{it},1): dα(E₂₁) = −iE₂₁ = (iE₁₂)\*, matching `generator_star`. diag(e^t,1): dα(E₂₁) = −E₂₁ ≠ (dα E₁₂)\* = E₂₁. D²(e^{2ix}) at 0 is −4; a derivation rule gives −2. | True | R04 |
| H1 | `isLieSmoothVector_smear` | G=ℝ, π=e^t, ∫f e^t = c: orbit s ↦ c·e^s, smooth. Discrete G: every orbit is smooth. f = 0: 0. | True | — |
| H2 | `lieSmoothVectors_dense` | 𝕜=ℝ, C(S¹,ℝ) rotations: trigonometric polynomials are smooth and dense. E = {0}: dense. | True | — |
| H3 | `scalarParametrix` | Row 13. Weak convergence implies convergence in the native compact-convergence topology on the barrelled 𝓓. | True | — |
| H4 | `dixmierMalliavin` | Trivial group of mass 2: f(1) = ½ gives smear = ½·2·v = v. v = 0: n = 0. | True | — |
| H5 | `dixmierMalliavin_function` | S₃, U={e}, φ = δ_(12): f = δ_e/μ{e}, h = φ, tsupport h = {(12)}. Derivative series stay in tsupport φ. | True | — |
| H6 | `smooth_lift` | ℝ²→ℝ: w=1 ↦ (1,0). Route: w = Σρ(f_j)w_j, lift each w_j to v_j, and v = Σπ(f_j)v_j has Tv = w. | True | — |
| H7 | `smooth_inverse` | diag(e^t,1): the orbit of a⁻¹ = I−E₁₂ is I−e^tE₁₂, smooth. Trivial action on ℝ: 2 ↦ ½. | True | — |
| H8 | `smooth_resolventIntegral` | M₂(ℂ), a = I+E₁₂, Γ: \|z−1\| = ½. 1/z gives 2πi(I−E₁₂); z² gives 2πi(I+2E₁₂). The non-holomorphic f(z) = z̄ gives ∫(1+½e^{−iθ})i dθ = 2πi for the I-coefficient and ∫(2ie^{−iθ}+ie^{−2iθ})dθ = 0 for the E₁₂-coefficient, so 2πi·I, with a constant orbit. Γ = 0 gives 0. Route: π g(z1−a)⁻¹ = (z1−π g a)⁻¹ on the trace, then `integral_comp_comm`, then smoothness of b ↦ ∫_Γ f(z)(z1−b)⁻¹dz on the open set where the trace lies in the resolvent set. | True | — |
| F1 | 2.1 finite-k criterion (probe) | k=0: both sides true. L² step, k=1: 2/\|t\| = 200 at t=0.01, both sides false. Discrete G: ι = ∅, both sides true. It elaborates at the pins. | True, statable | R02 |
| F2 | 7.2a complexification of a Fréchet space | p = \|·\| on ℝ: the Taylor form gives 5 at 3+4i; the sum form gives √2 at e^{iπ/4}·1 against \|w\|p(1) = 1. There is no pinned topology for non-normed X. | Unowned | R01 |
| D1 | Docstring: finite-regularity criterion not statable | Probe F1 | False | R02 |

## Not verifiable

- **Dixmier–Malliavin, Bull. Sci. Math. 102 (1978).** The manifest records it as uncertified (no legal open copy), so it was not read. The factorization relies on Casselman's locators, which were verified.
- **Schneider's notes, Proposition 8.6.** This is LocallyAnalyticDistributions' source for §0.2, and I did not open it. The consumed statement is contained in Henkel, Theorem 1.6 (`henkel2014` line 131), as the previous review checked.
- **Ownership against open pull requests outside the index.** It was checked through `roadmaps grep` and `roadmaps show` (468 heads) and the listed sibling checkouts.
- **The three board packages** (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) were not read. Their names are far from this roadmap's objects.

## Source issues

- **Misprint** in bernsteinkrotz2013 at §2.5, p.11: the convolution of measures integrates f at the product with the first measure's variable on the right; it should be on the left (f(xy) with x from µ), so that Π(µ∗ν)=Π(µ)Π(ν) on p.12 holds; affects nothing.
- **Misprint** in casselman2016 at the proof of Lemma 5.1, p.12: the normalising factor (2π)^{2n} uses n for the summation index j; it should be (2π)^{2j}; affects nothing.
- **Error** in casselman2016 at the proof of Lemma 5.1, p.12: the new bounds B_m are taken as the supremum of A_m and the derivative-control constants; it should be their infimum, since α_m must meet all of them; affects the proof.
- **Misprint** in casselman2016 at the proof of Proposition 6.1, p.13: the scalar limit and the vector series omit the alternating sign (−1)^n of Lemma 5.1; it should include it; affects the proof.
