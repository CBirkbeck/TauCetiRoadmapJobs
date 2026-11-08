# Review of ComplexComparisonPartII (pull request #848 at 2f169dc)

**Verdict:** needs changes

This is a full review: the folder changed by 221 lines since `d0ac71a`, the head the previous review read.

- **Checks.** The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with exactly four `sorry` warnings. No statement closes with one tactic.
- **Previous findings.** R03 and R04 of the previous review are repaired. R01 and R02 are not, and the facts behind them are unchanged at the current heads. Both are carried below.
- **New finding.** The new `holomorphicPoincare` statement is true as stated, also without finite dimension. Its proof route cites an existential Poincaré lemma that cannot supply the type-`(k,0)` primitive. The route needs the pinned homotopy operator itself (R03, P3).
- **Repair report.** No repair report was available to this review, so no finding carries a `Re-raised:` line.

## R01 (P2) — DifferentialGeometry Layers 8–9 are cited, and the open revision of DifferentialGeometry drops them

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:546–547` ("The de Rham theorem and Poincaré duality are DifferentialGeometry Layers 8–9."). The same layers are cited at:

- :737–739 (Layer 8 `deRhamEquiv`, Layer 9 `finiteDimensional_deRhamCohomology`);
- :2949–2950 (*Needs:* of `multiplicativePeriodInterface`, "Layers 5, 8 and 9");
- :3722 and :3734 (C5.4, "DifferentialGeometry Layer 8's `deRhamEquiv`");
- :4346–4347 (C5 dependencies, "Layers 0–2, 5, 8, 9 and 12").

**Claim:** DifferentialGeometry Layers 8 and 9 supply the de Rham theorem `deRhamEquiv` and Poincaré duality.

**Witness:** At the head of #886 (a565de6), `DifferentialGeometry/README.md` has layer headings 0–5, 5.6 and 12 only, and contains no `deRhamEquiv`, `finiteDimensional_deRhamCohomology`, Layer 8 or Layer 9. Its line 262 hands them to DeRhamCohomologyAndDuality (`ORDER.txt:395`).

**Context:**

- The citations are correct against main: `DifferentialGeometry/README.md:816` (Layer 8), :852 (`deRhamEquiv`) and :862 (Layer 9).
- `deRhamEquiv` now lives at DeRhamCohomologyAndDuality's head (1b57dbe, line 176). That roadmap sits after this one (`ORDER.txt:43`), so a *Needs:* edge to it would point upward.
- CharacteristicClasses C4.2, which C5.4 also cites, itself uses DifferentialGeometry's de Rham map (its README :1331 and :1473). It is no alternative owner.
- The overlap report flags only Layer 8 (lines 547, 3722, 3734), but Layer 9 is gone at that head too.
- The pull-request description names neither DifferentialGeometry nor #886.

**Repair:** This is a description edit. No README line needs to change, so it is for the author or the worker, not for an in-folder repair. Add one sentence to the merge-order paragraph of the description, saying three things:

- the README consumes `deRhamEquiv` and `finiteDimensional_deRhamCohomology` from DifferentialGeometry Layers 8–9 as they stand on main;
- #886 removes those layers;
- before both merge, either #886 keeps the ids or adds an old → new map, or DeRhamCohomologyAndDuality moves ahead of this roadmap in the merge order.

The in-folder alternative is to state the smooth de Rham comparison in C5.1, from the pinned `TauCeti.poincareHomotopy`, fine resolutions and `nonempty_sheafSingularComparison`. It is the larger change.

In the same description edit, the "external suppliers in other authors' open pull requests" sentence can be corrected. ComplexKahlerGeometry, RealAnalyticGeometry, SmoothBundlesConnections, CharacteristicClasses and GeometricCurrents are on main, and the README cites no section of GlobalHolomorphicFunctions.

This finding is carried from the previous review's R01, unchanged.

## R02 (P2) — The holomorphic exponential sequence and `Pic_hol ≅ H¹(O^×)` still have two owners

**Location:** `README.md:146`: "C5.4 is the single owner, on every complex manifold, of the holomorphic-to-smooth forgetful adapter, the frame-torsor bijection … the holomorphic exponential sequence with its cocycle `δu`". The same claim appears at:

- :90–93 (scope);
- :3690 ("Prove the holomorphic exponential-sequence description here");
- :4963–4965 (consumers K3Surfaces §1.1 and GeometricQuantization §3.3).

**Claim:** C5.4 is the only owner, on every complex manifold, of three things: the exponential sequence, the bijection onto `H¹(M,O_M^×)`, and the identification of the connecting map with the integral first Chern class.

**Witness:** At #1234's head (a2c5e1c3), `ComplexKahlerGeometry/README.md:686–690` says K4.P owns these on every complex manifold. It names C5.4, K3Surfaces 1.1 and GeometricQuantization §3.3 as its consumers.

**Context:**

- #1234 repeats the ownership claim at :765–766.
- Both consumers still cite this roadmap's C5.4: K3Surfaces (#1285, 9e7760f) at :370, and GeometricQuantization (#1186, 663f762) at :649.
- On main, ComplexKahlerGeometry does not mention the exponential sequence. None of the other open ComplexKahlerGeometry heads (#1398, #1807, #1808, #1854) claims it.
- The description records no settlement.

**Repair:** Record one owner. The README already chose C5.4 in `d0ac71a`. ComplexKahlerGeometry on main does not own the object, and a revision pull request is never a dependency. So the smallest repair is a description sentence:

- C5.4 owns the holomorphic exponential sequence, the frame-torsor bijection and the connecting-map identification on every complex manifold;
- #1234 must drop K4.P's ownership sentence (:686–690) and its consumer line (:765–766) before both merge, or be rebased on this roadmap.

The alternative is to cite ComplexKahlerGeometry K4.P for the three items and name #1234 in the merge-order paragraph, since K4.P exists only at that head. In that case:

- keep in C5.4 only the identification of `analyticPicardGroup` with `Pic_hol`, the explicit `δu` cocycle, and the `O(±1)`, elliptic-curve and Enriques Checks;
- rewrite :90–93, :146 and :4963–4965 to match.

The normalisation survives either way: #1234 at :692–694 fixes `c₁(O(−1))·[ℂP¹]=−1`, as :433 here does.

This finding is carried from the previous review's R02, unchanged.

## R03 (P3) — `holomorphicPoincare`'s route cites the existential Poincaré lemma, whose primitive need not have type `(k,0)`

**Location:** `README.md:565–568`: "the real radial homotopy `StarConvex.exists_contDiffOn_forall_extDeriv_eq` (for `r ≥ 1`, a closed `C^r` form … has a `C^r` primitive". The same citation appears in three more places:

- :2767–2769 ("the real radial homotopy of a form that is complex-linear in each argument is again complex-linear in each argument, so `η` has type `(k,0)`");
- the *Needs:* at :2776–2777;
- C5 dependencies at :4353.

**Claim:** The cited pinned declaration supplies the type-`(k,0)` primitive of a closed `(k+1,0)`-form.

**Witness:** The pinned theorem (`TauCeti/Analysis/Calculus/DifferentialForm/Poincare.lean:393`) asserts only `∃ α`, `C^r`, `α x₀ = 0`, `dα = ω`. On `ℂ²`, with `ω = dz₁∧dz₂` and `x₀ = 0`, the form `(z₁dz₂ − z₂dz₁)/2 + d|z₁|²` satisfies all three. Its (0,1)-part is `z₁dz̄₁`.

That form is the README's own Check at :2751–2753, and `d|z₁|² = z̄₁dz₁ + z₁dz̄₁` vanishes at 0. So the existential can return a primitive that is not of type `(1,0)`. The type argument at :2768 holds for the specific operator, not for an arbitrary witness.

**Repair:** At all four places, cite the operator and its lemmas:

- `TauCeti.poincareHomotopy` with `TauCeti.poincareHomotopy_apply` (`Poincare.lean:91`, :95: `x ↦ ∫₀¹ tⁿ ω(x₀ + t(x − x₀))(x − x₀, ·) dt`);
- `StarConvex.contDiffOn_poincareHomotopy` (:226);
- `StarConvex.extDeriv_poincareHomotopy` (:383).

Then state the type step from that formula. If each `ω(y)` is `ℂ`-multilinear, so is each integrand `(ω y).curryLeft (x − x₀)` in its remaining arguments. The `ℂ`-multilinear alternating maps form a closed subspace, so the integral stays in it.

Tested on the refuting instance: for `ω = dz₁∧dz₂` and `x₀ = 0` the formula gives `∫₀¹ t(x₁v₂ − x₂v₁) dt`, which is `(z₁dz₂ − z₂dz₁)/2`, of type `(1,0)`, with `d` of it equal to `dz₁∧dz₂`.

## Previous findings

- **R01 — not repaired.** README :547 still reads "The de Rham theorem and Poincaré duality are DifferentialGeometry Layers 8–9." The description still names neither DifferentialGeometry nor #886, and #886's head is still a565de6.
- **R02 — not repaired.** README :146 still reads "C5.4 is the single owner, on every complex manifold, of … the holomorphic exponential sequence", and #1234's :686 still claims K4.P ownership. No settlement is recorded.
- **R03 — repaired.** README :1076 now defines the punctured polydisc by "the inequalities `z_i≠0` for `1≤i≤b`". With `n=b=1` this gives `{0<|z₁|<r₁}=Δ*`, and with `n=b=2` it gives `(Δ*)²`. Both match the Checks at :1083–1084 and the complement `(Δ*)^b×Δ^(n−b)` at :1078.
- **R04 — repaired.** The module docstring (`Suggested.lean:29–97`) now names every unstatable headline, layer by layer, with the carrier it lacks. `sncPolydiscChart`, `fibreDimensionLoci` and `topologicalCoefficientComparison` are named with the reasons the previous review proposed. `holomorphicPoincare` is now stated rather than named. A mechanical check finds every one of the 67 names in the README headline table (:47–54) in `Suggested.lean`: four are stated and 63 are named.

## Verified sound

**Gate.** My run on this head printed the following and exited 0:

```text
gate ComplexComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate on the same head also records `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty. No `design/plan.json` is readable, so no gaps are declared, and none should be.

**Dependency check.** The check with `--movable` printed, in full:

```text
depcheck: 245 roadmaps, 2474 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. FormalConnectionsOpers, InverseGaloisAndArithmeticFundamentalGroups, LefschetzPencilsAndVanishingCycles, MotivesAndAlgebraicCycles, K3Surfaces, GeometricQuantization and DeRhamCohomologyAndDuality are all later in `ORDER.txt`, and they occur only as consumers.

**Lean (pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`).**

- `lake env lean` on `Suggested.lean` gives exactly four `declaration uses sorry` warnings, at lines 116, 127, 154 and 172, and nothing else. It needed the Tau Ceti modules `…Dolbeault.ComplexManifold` and `…DifferentialForm.Poincare`, built with `lake build` for the probes.
- One-tactic probe on scratch copies, three runs:
  - `first | rfl | simp | infer_instance | aesop | exact?`: `simp` makes progress on three goals and closes none, and `exact?` fails on `nonempty_sheafSingularComparison`.
  - The same with `(simp; done)`: `aesop` fails on `montelTheorem` and `schwartzFiniteness`, and `holomorphicPoincare` reaches a heartbeat timeout.
  - `exact?` alone on all four: all four fail.
  - Nothing is padding.
- `#check @` contexts agree with the worker's signature file, and no binder is lost.
  - `montelTheorem` keeps `FiniteDimensional ℂ E` (README C1.6, :1709).
  - `schwartzFiniteness` keeps completeness, metrizability, `T2Space` and local convexity on both sides (:1734).
  - `nonempty_sheafSingularComparison` keeps `LocallyContractibleSpace` (:2914).
  - `holomorphicPoincare` keeps `IsManifold 𝓘(ℂ, E) ∞ M` and the three hypotheses on `α` (:2762–2766).
- **`holomorphicPoincare`, carriers and instances.**
  - `IsManifold 𝓘(ℝ, E) ∞ M` is found by `TauCeti.ComplexManifold.isManifold_real` (`TauCeti/Geometry/Manifold/Complex/Orientation.lean:195`). Its `#check` shows no `FiniteDimensional` binder, although the file's section variable has one.
  - `ofComplexManifold` (`…/Complex/AlmostComplexStructure.lean:76`) is multiplication by `i` on every tangent space.
  - `delBar` (`…/Dolbeault/Basic.lean:95`) is the type-`(p,q+1)` component of `d` summed over types.
  - `IsOfType` (`…/AlmostComplexType.lean:201`) is `p+q=k` together with the derivation acting by `(p−q)i`.
  - The README's "none of these assumes a finite-dimensional model" (:562) holds for all eight names.
- **`holomorphicPoincare`, truth.** The statement is true at this generality.
  - In a chart, a ball is star-convex. The pinned operator gives `η` with values in the complete space of alternating maps into `ℂ`, so `E` need not be complete or finite-dimensional.
  - `η` is `ℂ`-multilinear, hence of type `(k,0)`.
  - On a chart `d` of a `(k,0)`-form has only `(k+1,0)` and `(k,1)` parts, so `∂̄η` is the `(k,1)`-part of `α`, which is 0.
  - Holomorphic coordinate changes preserve types.
- **`hα_hol` is redundant.** It is implied by `hα` and `hα_closed`: `mextDerivₗ_eq_del_add_delBar_ofComplexManifold` splits `dα` into parts of types `(k+2,0)` and `(k+1,1)`, so `dα = 0` forces `∂̄α = 0`. It is harmless and matches the README's definition of a holomorphic form. No change is needed.
- `LocallyContractibleSpace` at the pin (`Mathlib/Topology/Homotopy/LocallyContractible.lean:81`) is the weak notion: a neighbourhood whose inclusion into the given one is null-homotopic. This is the notion README :2915 describes.

**Library declarations resolved at the pins (63, one scratch file, no error).**

- The 11 smooth-form, type, `∂̄`, pullback and Poincaré names of the new supplier contract (:548–569).
- `TauCeti.poincareHomotopy`, `TauCeti.poincareHomotopy_apply`, `StarConvex.extDeriv_poincareHomotopy` and `StarConvex.contDiffOn_poincareHomotopy` (R03).
- The analytic-inverse family of C-1.4 (:1074, :1088): `AnalyticAt.hasStrictFDerivAt`, the four `HasStrictFDerivAt.*`, `OpenPartialHomeomorph.analyticAt_symm'`, `OpenPartialHomeomorph.hasFPowerSeriesAt_symm`, `AnalyticAt.exists_openPartialHomeomorph` and `TauCeti.ContDiffOn.exists_openPartialHomeomorph`.
- `ContDiffAt.to_localInverse`, `TauCeti.Topology.subsingleton_H_succ_of_isFlasque`, `TauCeti.CategoryTheory.SheafExtensionByZero.preservesFiniteLimits_sheafPullback` and `TauCeti.montel`.
- `TauCeti.LocalCoefficientSystem` and `.twistedCochainComplex`, the two Riesz theorems, `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator` and `TauCeti.deRhamCohomology`.
- `circleIntegral.integral_sub_inv_of_mem_ball` and the three flatness lemmas.
- `AddSubmonoid.NSMulSaturated`, `Algebra.GrothendieckGroup`, `AlgebraicGeometry.UniversallyClosed.eq_valuativeCriterion` and `AlgebraicGeometry.Scheme.AffineEtale`.
- `CategoryTheory.Abelian.Ext.mapExactFunctor`, `Bundle.Trivialization.pullback`, `Manifold.IsSubmersion` and `KaehlerDifferential.ideal`.
- `Distribution.lineDerivCLM`, `Distribution.delta` and `Distribution.mapCLM`.

The docstring's carrier names were checked as well:

- `TauCeti.SmoothPair.AlgebraicChart` (`TauCeti/AlgebraicGeometry/SmoothPair/AlgebraicChart.lean:35`, :45);
- `TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace` (`…/AlgebraicSpace/Basic.lean:60`);
- `TauCeti.RiemannSurface.MeromorphicFunction` (`…/RiemannSurface/FunctionField.lean:104`);
- `TauCeti.holomorphicStructureSheaf` (`…/StructureSheaf/Basic.lean:68`).

No Kähler-manifold structure exists at the Tau Ceti pin, as the C1 bullet says.

**Seeded sample (15 targets), read at the locators.**

Printed pages are mapped as follows: SGA 4 retyped page = PDF page − 9; EGA IV₄ printed page = PDF page + 1; LNM 163 printed page = PDF page − 3.

| Target (README line) | Locator | What the source says (my words), at | Agrees |
| --- | --- | --- | --- |
| Riemann surface of a smooth curve (:1889) | SGA 1 XII Props 3.1–3.2, pp. 244–247 | `sga1` line 9594: étale, smooth and separated are detected on `f^an` (p. 244); line 9639: so are proper and finite, for `f` of finite type (p. 245) | yes |
| Curve GAGA as named maps (:1937) | SGA 1 XII Th 4.4, pp. 249–250 | `sga1` line 9805: coherent analytification is an equivalence for proper `X` (p. 249); the proof runs to p. 250 | yes |
| `IsDifferentialOperator` (:2779) | EGA IV₄ §16.7, pp. 36–39; §16.8, 16.8.8, 16.8.9(.2), pp. 39–44 | `ega4-4` line 1259: §16.7 (p. 36); line 1489: order ≤ n iff every `D(a·)−aD` has order ≤ n−1 (p. 42); lines 1526 and 1537: composition (p. 43); §16.9 at line 1616 (p. 46) | yes |
| `holomorphicConnectionDictionary` (:2987) | Deligne LNM 163 I.2.3–2.15, pp. 6–11; I.2.17–2.19, pp. 12–13 | `deligne-lnm163` line 230 (2.3, p. 6) and line 312 (2.10, p. 9); line 422: Th 2.17, local systems ⇔ integrable connections, compatible with ⊗, Hom and dual (p. 12); line 442 (2.19, p. 13) | yes |
| `artinDeRhamBetti` (:3225) | Deligne 1968, Lemma 5.5.3 and (5.5.4), p. 124 | `deligne-lefschetz-1968` lines 689–701: the relative de Rham complex over an Artin base is a resolution; length formula (p. 124) | yes |
| `realComplexCurrentComparison` (:3489) | Demailly I (2.1)–(2.7), pp. 13–15; III (1.14)–(1.15), pp. 133–134; (1.21)–(1.24), pp. 135–136 | `demailly-agbook` line 599: `⟨dT,u⟩=(−1)^{q+1}⟨T,du⟩`; line 617: `d[Z]=(−1)^{m−p+1}[∂Z]`; lines 6611, 6671, 6761, 6781 and 6818 on pp. 133–136 | yes |
| `analyticSetLocalFiniteMass` (:3566) | Demailly III.2.5–2.6, p. 140 | `demailly-agbook` lines 6990 and 6997 (p. 140): `[A]` by integration over `A_reg`; Lelong's local finite mass | yes |
| Analytic cotangent and log differentials (:3822) | Freitag I.2, I.6, II.2; Deligne 1970 I.2.10–2.15, I.2.22; Kato §§1.7–1.9 | `freitag-complex-spaces` lines 12, 16 and 26: I.2 from p. 2, I.6 from p. 16, II.2 at p. 47; `deligne-lnm163` line 312 (p. 9) and line 474 (2.22, p. 14) | yes (Kato not verifiable) |
| `complexAlgebraicTopology` (:4372) | Hironaka 1975; BCR 9.2.1; SGA 1 XII §§1–3 | `sga1` lines 9594–9648 for the local topology and separatedness | SGA 1 yes; Hironaka and BCR not verifiable |
| `artinComparison` (:4584) | SGA 4 XI 3.1, 3.3 (p. 549), 4.4, 4.6 (pp. 552–553), XVI 4.1 (p. 638); Milne §21, pp. 130–134 | `sga4` lines 24606, 24629, 24767, 24818 and 28350; `milne-lec` lines 5007 and 5094 (Th 21.1, 21.5) and lines 5142 and 5154 (Def 21.7, Prop 21.8), pp. 130–133 | yes |
| `IsIso` of the named unit map (:4655) | SGA 4 XVI §4 | `sga4` line 28350: the comparison is induced by the morphism of sites `ε` | yes |
| `artinComparisonCompactSupport` (:4689) | SGA 4 XVI 4.1(i), p. 638; XVII 5.3.5, p. 705 | `sga4` line 28350; line 31745: `H^q_!` agrees with `H^q_c` for torsion sheaves on separated compactifiable `X` (p. 705) | yes |
| `relativeArtinComparison` (:4733) | SGA 4 XVI 4.1, p. 638; XVII 5.3.3, 5.3.4(i), pp. 704–705 | `sga4` line 28350: `f` of finite type between schemes locally of finite type over `ℂ`; line 31733 (p. 704); line 31740 (p. 705) | yes |
| `artinSmoothTrace` (:4798) | SGA 4 XVIII 2.8–2.10, 3.2.5 | `sga4` lines 37190 (2.8), 37209 (Th 2.9), 37405 (Prop 2.10) and 38315 (Th 3.2.5) | yes |
| `adicArtinComparison` (:4836) | Bhatt–Scholze §§5–6, esp. 6.5, 6.7–6.8 | `bhatt-scholze-proetale` lines 1882 (§5.5), 2294 (§6.5), 2579 (§6.7) and 2757 (§6.8) | yes |

New locators at this head:

- `holomorphicPoincare`, "Deligne 1970, I.2.19 and I.2.23 (ii) with 2.23.2–2.23.3, printed pp. 13–17":
  - `deligne-lnm163` line 442: Prop 2.19, p. 13;
  - line 490: Th 2.23(ii), pp. 14–15;
  - line 523: 2.23.2, the polydisc homotopy operator, pp. 15–16;
  - line 552: 2.23.3, pp. 16–17.
- The docstring's "I.2.23" is the case where the base is a point.
- `HolomorphicDeRham`: I.2.7 at line 278 (p. 8) and I.2.10 at line 312 (p. 9). Both agree.

`milne-lec` was fetched through the sources service into a scratch copy of the manifest. The package `sources.toml` is unchanged.

**Adversarial pass (computed).**

| Statement | Instances | Values computed (left / right) | Result |
| --- | --- | --- | --- |
| `holomorphicPoincare` (Lean) | `M=ℂ`, `k=0`, `α=dz`, centre 0 | homotopy gives `η=z`: type (0,0), `∂̄z=0`, `dη=dz=α` | holds |
| same, negative control | `α=dz̄` | type (0,1), so `hα` fails; every primitive `z̄+c` has `∂̄=dz̄≠0` | hypothesis needed and present |
| same | `ℂ²`, `k=1`, `α=dz₁∧dz₂` | formula: `(z₁dz₂−z₂dz₁)/2`, type (1,0), `d` gives `α`; adding `d|z₁|²` gives (0,1)-part `z₁dz̄₁` | the type clause on `η` has content (R03) |
| same | `E=0` | every form of positive degree is 0, so `α=0`, `η=0` | holds |
| same | `E=ℓ²`, `α=dℓ`, `ℓ` ℂ-linear continuous | `η=ℓ−ℓ(x₀)` | holds without `FiniteDimensional` |
| same | `hα_hol` | `dα=∂α+∂̄α`, types (k+2,0) and (k+1,1); `dα=0` gives `∂̄α=0` | implied; harmless |
| `montelTheorem` | `Ω=∅`; `ℂ²`, `f_n=z₁ⁿ` on the unit bidisc; `ℓ²`, `f_n=⟨·,e_n⟩` | vacuous; sup ≤ 1 on compacts and the subsequence tends to 0 locally uniformly; on `B(0,r)` the sup is `r` for every `n`, so there is no locally uniform limit | `FiniteDimensional` needed and present |
| `schwartzFiniteness` | `ℂ`, `g=id`, `h=−id`; `ℓ²`, `g=id`, `h=−diag(1/n)`; `g=diag(1/n)`, `h=0`; `ℓ²`, `g=id`, `h=−id` | range 0, codim 1; range of `diag(1−1/n)` closed, codim 1; dense non-closed range (`g` not surjective); range 0, codim ∞ (`h` not compact) | both hypotheses used |
| `nonempty_sheafSingularComparison` | `T=∅`; point; `S¹`, `A=ℤ`; Warsaw circle | 0 / 0; `A,0,…` / `A,0,…`; `H¹=ℤ` / `ℤ`; Čech `H¹=ℤ` / singular `H¹=0` | hypothesis needed and present |
| `HolomorphicDeRham`, section clause | `U⊆ℂ`, `p=1` | `∂̄(f dz)=(∂f/∂z̄)dz̄∧dz`, zero iff `f` is holomorphic | equals `O·dz` |
| Riemann surface of `C` | `P¹`; `z↦z²` on `G_m` and on `A¹`; nodal cubic; doubled origin | transition `z↦1/z`; derivative `2z≠0` on `ℂ*` and `0` at 0; not smooth at the node; non-Hausdorff | pass |
| `functionFieldToMeromorphic`, divisor clause | `E: y²=x³−x`; `P¹`, `D=∞` | `ord_∞x=−2`, `ord_∞y=−3`; `∂_x(y²−x³+x)=1` at `(0,0)`, so `y` is a parameter, `ord x=2`, `div x=2(0,0)−2∞` of degree 0; `h⁰=2` (`a+bz`) against 0 for the reversed sign | pass |
| `IsDifferentialOperator` | `[d/dz,z]`; `𝔽₂[z]`; `𝔽₃[z]` | `id`; the coefficient of `t²` in `(z+t)²` is 1, so the operator sends `z²` to 1, while `(d/dz)²z²=2=0`; the coefficient of `t³` in `(z+t)⁴` is `4z=z` | pass |
| `holomorphicConnectionDictionary` | `d+z dw`; line gauge `g`; `g=h⁻¹` | curvature `dz∧dw`; `A+g⁻¹dg`; `hAh⁻¹+h·d(h⁻¹)=Ad(h)A−(dh)h⁻¹` | pass |
| `artinDeRhamBetti` | `A=ℂ[ε]/ε²`, `P¹_A`; `A=ℂ` | `H⁰` and `H²` free of rank 1 and length 2 = `lg(A)·1`; `H¹=0`; recovers `properDeRhamBetti` | pass |
| `realComplexCurrentComparison` | disc (`n=1`, `q=2`); segment (`q=1`); `δ_a` | `(−1)^{2−2+1}=−1`, so `dJ₂[D]=−J₁[∂D]`; `(−1)^{2−1+1}=+1`, so `J₀(δ_b−δ_a)`, Demailly (2.6)–(2.7) with `m=2`; `dJ₀=0` | pass |
| `analyticSetLocalFiniteMass` | `cg≤h≤Cg` on a `2d`-plane; a line in `ℂ²`; the node | the density `√det` gives `c^dμ_g≤μ_h≤C^dμ_g`; finite on compacts, infinite in total; two branch areas, no atom | pass |
| `AnalyticLogDifferentials` | `ℂ{z,ε}/ε²`; standard log point | `d(ε²)=2εdε`, so `A dz⊕(A/ε)dε`; relative to `ℂ[ε]`: `A dz`, `εdz≠0`; `ℂ·dlog t`, and 0 relative to itself | pass |
| `complexAlgebraicTopology` | `A¹`; `P¹` with three strata; doubled origin | contractible; `ℂ*` is a union of open simplices but not a subcomplex; locally compact, non-Hausdorff | pass |
| `artinComparison`, named map | `G_m`, `μ_n`; `Spec ℂ`, `ℤ/4`, `(ℤ/2)[0]` | the Kummer class goes to the root torsor with transport `e^{2πi/n}`; its negation gives `e^{−2πi/n}`, a different value iff `n≥3`; `Tor_i^{ℤ/4}(ℤ/2,ℤ/2)=ℤ/2` for all `i` | pass |
| `IsIso` of the unit ⇔ affine-étale form | bounded-below cone `C` with `RΓ(U,C)=0` for all affine étale `U` | the lowest `H^a(C)` has zero sections on a basis, so it is 0; induct | pass |
| `artinComparisonCompactSupport` | `A¹`; `G_m⊂A¹` | `H⁰_c=0` on both sides against ordinary `H⁰=Λ`; `H²_c` of rank 1 on both; the localization connecting maps match | pass |
| `relativeArtinComparison` | `j:G_m↪A¹`, `μ_n`; `⊕_x(i_x)_*Λ` on `A¹` and on `P¹` | `(R¹j_*μ_n)_0≅ℤ/n`, `R^{≥2}=0`; étale `H⁰` is finitely supported, analytic `H⁰` contains `1_ℤ` (closed and discrete), so the map is not onto; on `P¹` both are finite | constructibility in (i) needed |
| `artinSmoothTrace` | `A¹⊔A¹`; `P¹` | `H²_c=Λ²`, trace is the sum, kernel `Λ≠0` for `n>1`; `Tr c₁(O(1))=1` | pass |
| `adicArtinComparison` | a torsion integral object; `P¹` | `⊗ℚ_ℓ` gives 0 on both sides; `H²` of rank 1 | pass |
| `sncPolydiscChart` (old R03) | `n=b=1`; `n=b=2` | `{0<|z₁|<r₁}=Δ*`; `(Δ*)²` | now agrees with :1083–1084 |
| `multiplicativePeriodInterface` (R01) | `G_m` | `∮dz/z=2πi`; lattice `ℚ·(2πi)⁻¹[dz/z]` | pass; supplier ids R01 |
| `integralLineBundleChernClass` and exponential sequence (R02) | `O(±1)`; `u↦exp(−2πiu)`; `O(p−q)` on `E`; Enriques `K`; `h'=e^φh` | ± generator; the reversed exponential swaps them; `[O(p−q)]≠1` with `δ=0`; torsion `c₁≠0` with real image 0; `Θ=∂̄∂ log H` gives the shift `−(i/2π)∂∂̄φ` | pass; owner R02 |
| C1.3 conventions | metric `e^{−|z|²}`; `d^c=i(∂̄−∂)` | `Θ=∂∂̄|z|²=dz∧dz̄`; `dd^c=2i∂∂̄`, so `dd_c=(i/2π)∂∂̄` | pass |
| `analyticTwistCohomology` | `P¹`, `k=1`; general `r`, `k≤−r−1` | `h⁰=2`; with `b_i=−a_i−1≥0` and `Σb_i=−k−r−1` over `r+1` variables, `h^r=binom(−k−1,r)` | pass |
| `StronglyOneComplete` | `ℂ^a×(ℂ*)^b` | for harmonic `u=log|w|`, `i∂∂̄u²=2i∂u∧∂̄u≥0`, and `u²→∞` as `w→0` | pass |
| `chernFubiniStudyIntersection` | affine chart of `P¹` | `∫ π⁻¹(1+r²)⁻² r dr dθ = 1` | pass |
| `lelongPoincareSection` | `‖e‖²=e^{−|z|²}` | `(i/π)∂∂̄(−|z|²/2)=−(i/2π)dz∧dz̄=−c₁` | pass |
| `strongProperSupportExistence`, non-quasi-separated Check | `A=∏ℂ`, `M=⊕_jA`; `M=A` | `(m,m')↦(e_i(m−m'))` meets finitely many `j`, so `(δ_ij)` is not hit and `H¹≠0`; onto for `M=A` | pass |
| C3.2 and C3.2a Checks | `j_!O_η` on `Spec` of a DVR; `O/t^n` on `Spec k[[t]]` | global sections 0 but `O_η≠0` on `{η}`: not quasi-coherent; limit sheaf `A` on `X`, 0 on `D(t)`; the limit in `spaceDQCoh` has sections `k((t))` on `D(t)` | pass |

**Cross-roadmap citations resolved (copy named).**

- **Main (3b3f7ef):**
  - EtaleCohomologyFoundations: the `VanishingCycles.*` and `ClassicalAlgebraic.*` names, including `properBaseChange`, `properSupports` and `smoothTrace`.
  - EnhancedDerivedSheaves: `ClassicalDerived.*`, `perfect_proper_pushforward` and `adjointFunctorTheorem`.
  - DerivedModuleAlgebra `perfectInverseSystemEffectivity`.
  - CharacteristicClasses C4 (its :1321–1340).
  - DifferentialGeometry Layers 8–9 (its :816 and :862; see R01).
  - All of these are present on main: ComplexKahlerGeometry, RealAnalyticGeometry, SmoothBundlesConnections, GeometricCurrents, Hyperfunctions, AffineMorseLefschetz, ComplexManifolds, ModularCurves, SchemeAndStackFoundations, AlgebraicTopology, AlgebraicVectorBundles, AlgebraicCurves, JacobianChallenge, StableReduction and PDE; UniversalCovers is under `Completed/`.
- **Open heads (read with `roadmaps show`):**
  - AlgebraicModuliForArithmeticGeometry: all six `spaceDQCoh.*` names, `spacePerfect`, `common_etale_neighbourhood`, `ModuliDescent.coherentPresentationDescent`, `ProjectiveBundles.projectiveBundle.projectiveSpaceCechComparison` (its :478), `universalFlatteningProperSupport`, `spaceSectionComponentCriterion`, `properSpaceCompletionEquivalence`, `ParameterFormalExports` with both framed-completion equivalences, `relativeSerre`, `coherentDevissage`, `devissageViaChow`, `cohStackFiniteTypeModel`, `artin_stack_criterion`, `openness_of_versality_strongEffective`, `spaceFpqcQuasicoherentDescent` and the seven Picard names.
  - DerivedDeRhamCohomology: `DeRham.d_leibniz` and `DeRham.complexMap`.
  - CrystallineCohomology: the paragraph "Modules with integrable connection and their de Rham complexes" (its :1248).
  - ResolutionOfSingularitiesCharacteristicZero: §1.3 (its :95), §6.2 (:894) and §6.4 (:936).
  - All four are named in the description's merge-order paragraph.

**Ownership against open pull requests.**

- The overlap report's only dropped id is R01. No other pull request changes this roadmap, and no id here is defined only by an open revision.
- Of the closest roadmaps in vocabulary, #1234 is R02. #1398, #1807, #1808 and #1854 make no exponential-sequence, `Pic_hol` or holomorphic-Poincaré claim.
- No roadmap on main or at an open head mentions a holomorphic Poincaré lemma or a holomorphic de Rham complex. So C5.1 is the owner of the new `holomorphicPoincare`.

**Policy.** The README contains no LaTeX, `lemma`, pull-request number, round label or machine path, and the gate scanners agree. I found no copied passage, executable algorithm, `set_option` or sorry'd data.

Seven texts were read for the sample that the package manifest does not record: `deligne-lnm163`, `deligne-lefschetz-1968`, `demailly-agbook`, `freitag-complex-spaces`, `bhatt-scholze-proetale`, `milne-lec` and `sella-comparison` (previous round). This review edits no manifest.

## Not verifiable

- K. Kato, *Logarithmic structures of Fontaine–Illusie* (1989), §§1.7–1.9, pp. 195–196 (analytic log-differentials target). No copy is in this worker's sources cache, the package manifest has no entry, and the previous round's sources-service search found no legal copy (Johns Hopkins volume).
- A. Dimca, *Sheaves in Topology* (2004), §§2.1–2.5, 3.2, 4.1 (C6.1). No cached copy; the DOI resolves only to the paywalled Springer page.
- H. Hironaka, *Triangulations of algebraic sets* (PSPM 29, 1975) (C6.0). No cached copy; the AMS e-book page is not an open host.
- Bochnak–Coste–Roy, *Real Algebraic Geometry*, Theorem 9.2.1 (C6.0). A paywalled Springer book, with no cached copy.
- Kleiman, published numbering "9.6.16" (:2409). The AMS chapter is paywalled; the arXiv locator, Theorem 6.16 on pp. 58–59, was verified in an earlier round.

## Source issues

- none
