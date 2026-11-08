# Review of SmoothBanachRepresentations (pull request #1145 at 2b062ae)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`

**Verdict:** needs changes

This head is the same commit the previous review read, so no file in the folder has changed. This is a full review. It raises three new blocking findings (R01–R03). All three are about ownership: the README plans results that pinned Tau Ceti or another open roadmap already provides, or credits a supplier with a result that supplier does not state. No mathematical statement was found false. R05 carries the previous review's R01.

## R01 (P2) — Layer 0.2 and the Tau Ceti contract re-plan the pinned C₀-group API

**Location.** `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/README.md`:
- :48: “These are real semigroups indexed by nonnegative time; the group inverse and restriction of scalars enter the two-sided comparison.”
- :88: “Prove the one-sided/two-sided comparison from the inverse group law”
- :98: “The real semigroup adapter … proved from the group homomorphism”

**Claim.**
- Pinned Tau Ceti already has the two-sided object, and the adapter for exactly this roadmap's setting.
- That setting is: `RCLike 𝕜`, `IsScalarTower ℝ 𝕜 V`, an orbit-continuous `ContRepresentation`.
- The pin also has the dictionary between the generator and the two-sided derivative at 0, invariance of the domain under the group, commutation, and the complex-linear generator.
- So the contract at :48 misdescribes the supplier, and the seeded target 0.2 and the paragraph at :98 plan pinned declarations a second time.

**Witness.** `ContRepresentation.toStronglyContinuousGroup` (`TauCeti/RepresentationTheory/Continuous/OneParameter.lean:32`) sends an orbit-continuous `ContRepresentation 𝕜 (Multiplicative ℝ) V` to `StronglyContinuousGroup V` (`Group/Basic.lean:74`). Lines :170, :175 and :248 of `Group/Generator.lean` identify its generator with the two-sided derivative.

**Repair.**
1. Under “From Tau Ceti” (:48), cite:
   - `ContRepresentation.toStronglyContinuousGroup` (`TauCeti/RepresentationTheory/Continuous/OneParameter.lean`);
   - `TauCeti.Semigroups.StronglyContinuousGroup` with `toSemigroup`, `domain`, `generator`, `hasDerivAt_zero`, `hasDerivAt`, `mem_domain_of_hasDerivAt_zero`, `generator_eq_of_hasDerivAt_zero`, `reflect_generator`, `map_mem_domain`, `generator_map` and `generator_commute_of_commute` (`TauCeti/Analysis/Semigroups/Group/Basic.lean`, `Group/Generator.lean`);
   - `StronglyContinuousSemigroup.complexDomain` and `complexGenerator` (`Generator/ComplexLinear.lean`) for 𝕜=ℂ.
2. Delete the sentence quoted from :48.
3. Rewrite §0.2: A_X is the generator of `toStronglyContinuousGroup` applied to π restricted along `oneParameterSubgroup X` (Mathlib's `ContRepresentation.restrict`). Keep as targets only what is new here: the dependence on X, and the 𝕜-submodule and 𝕜-linearity statements for both fields.
4. Delete the adapter paragraph at :98.
5. Add the group API to the Layer 0 *Needs:* line and to its Dependencies.
6. Drop “one-parameter generator adapter” from the module docstring of `Suggested.lean` (:25).

Tested on the instance in Check :106, π(t)x=e^t x. The pinned group has U t = e^t, and `hasDerivAt_zero` at x=1 gives derivative 1. That is A₁·1=1, the README's value.

## R02 (P2) — The Fréchet open mapping theorem has two owners

**Location.** `README.md`:
- :428: “prove the Fréchet open mapping theorem from Baire: every surjective continuous linear map between Fréchet spaces over ℝ or ℂ is open.”
- :430: “the Fréchet open mapping theorem proved here from Baire.”
- The theorem is also used at :440 and named in the Dependencies at :480.

**Claim.**
- LocallyAnalyticDistributions §0.2 is an open pull request that adds a new roadmap, by another author.
- It owns the same theorem for every complete nontrivially normed field, with no ultrametric hypothesis, so ℝ and ℂ are included.
- SpectralManifolds SM3 already consumes it from there, at ℝ and ℂ.
- This README neither cites it nor names itself as the owner, so one object has two owners.

**Witness.**
- LocallyAnalyticDistributions `README.md:1107` (head 473fb50) is the theorem. Its `naFrechet_openMapping` binds `[NontriviallyNormedField K] [CompleteSpace K]` with `WithSeminorms` families.
- SpectralManifolds `README.md:27` (head b1e8fb7) consumes it “at the fields ℝ and ℂ”.

**Repair.**
1. At :428, :430, :440 and :480, cite “LocallyAnalyticDistributions §0.2 (Fréchet open mapping), at 𝕜=ℝ and ℂ”, and delete “proved here from Baire”.
2. Add a “From TauCetiRoadmap.LocallyAnalyticDistributions” contract.
3. At :440 the citation can be dropped altogether. The quotient-seminorm identity proved there already makes the induced bijection a topological isomorphism.

Tested on a scratch copy with :430 so changed. `gate --depcheck --movable` prints “moved: SmoothBanachRepresentations … right after its last supplier LocallyAnalyticDistributions” and “0 problem(s)”. The consumers of this roadmap (order lines 153, 210, 294) stay later. LocallyAnalyticDistributions cites neither this roadmap nor AutomorphicFormsOnReductiveGroups.

## R03 (P2) — The product chart behind `dixmierMalliavin` is credited to a LieGroups section that does not state it

**Location.** `README.md`:
- :54: “LieGroups Layers 0–3 supplies the Lie algebra, exponential, Ad, local product charts and smoothness of continuous finite-dimensional homomorphisms.”
- :397 and :414: “LieGroups Layer 0 local product chart”.
- :378–380 need `Φ(t₁,…,t_d)=exp(t₁X₁)⋯exp(t_dX_d)` “to be a diffeomorphism onto an identity neighborhood”.

**Claim.**
- LieGroups Layer 0 provides the exponential chart, not a product chart.
- No layer of LieGroups, on main or in its open revision, states an exponential-product chart.
- Pinned Tau Ceti has only the two-factor chart `(X,Y)↦lieExp X·lieExp Y` on complementary subspaces. It does not iterate to Φ, because the last d−1 factors of Φ are not the exponential of a subspace.
- The proof route of the headline `dixmierMalliavin` (§6.1; Casselman uses the same step at `casselman2016` line 676) needs Φ, and nothing here owns it.

**Witness.** Searching `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` for “product chart” or “second kind” gives 0 hits, both at main 3b3f7ef and at revision 6bf626d8. The pinned `Submodule.isLocalDiffeomorphAt_lieExpMulLieExp_zero_of_isCompl` (`TauCeti/Geometry/Lie/Exponential/ProductChart.lean:335`) has two factors only.

**Repair.**
1. Make the chart a target of §6.1 (or §1.2). For an ordered basis X₁,…,X_d:
   - Φ is smooth, by `contMDiff_oneParameterSubgroup` and smooth multiplication;
   - its differential at 0 is t↦Σt_iX_i;
   - so Φ is a local diffeomorphism at 0, by the inverse function theorem, proved as in the pinned two-factor theorem.
2. Add a Check on the affine group:
   - in the order (H,N), Φ(t)=(e^{t₁}, e^{t₁}t₂), with Jacobian determinant 1 at 0 and Haar density J≡1;
   - in the order (N,H), Φ(s)=(e^{s₂}, s₁), with J=e^{−s₂}.
3. Correct :54, :397 and :414. At :54 also cite the pinned `TauCeti.Lie.contMDiff_of_continuous_monoidHom` (`TauCeti/Geometry/Lie/AutomaticSmoothness.lean:129`) for the automatic-smoothness clause that §4.1 uses.

I checked the two values above by pulling back `da db/a²` (row 23 of the table).

## R04 (P3) — Two more passages re-plan pinned declarations

**Location.** `README.md`:
- :142: “Supply strong measurability from finite-chart compact localization and separable compact images of each orbit, without requiring separability of E.”
- :428: “Give the Banach quotient E/M its strongly continuous quotient action.”

**Claim.**
- The integrand `g↦f(g)•π(g)v` is continuous with compact support. `Continuous.integrable_of_hasCompactSupport` already gives its integrability, strong measurability included, with no countability or separability hypothesis. The README itself cites that lemma at :44 and :144.
- The quotient action, and the restriction to an invariant subspace used in §7.1, are pinned Tau Ceti constructions. Only orbit continuity is new.

**Witness.**
- `Mathlib/MeasureTheory/Function/LocallyIntegrable.lean:617`. Its section assumes only `OpensMeasurableSpace` (:551) and `IsFiniteMeasureOnCompacts` (:578).
- `ContRepresentation.quotient` and `ContRepresentation.subrepresentation` are at `TauCeti/RepresentationTheory/Continuous/Subrepresentation.lean:141` and `:56`.

**Repair.**
1. Delete the sentence at :142; the *Needs:* at :144 already names the lemma.
2. At :428, build on `ContRepresentation.quotient` and prove only orbit continuity, which holds because the quotient map is continuous.
3. In §7.1, use `ContRepresentation.subrepresentation` for M.
4. Add both declarations under “From Tau Ceti”.

Test: for the trivial action of ℝ on a nonseparable E, the integrand `g↦f(g)v` satisfies the lemma's hypotheses as stated.

## R05 (P3) — The family index still omits this roadmap, and its scope paragraph contradicts it

This finding carries the previous review's R01 (and earlier rounds'). No repair report marks it not actionable.

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md`:
- :11, “## The roadmaps”: 14 bullets, none linking `SmoothBanachRepresentations/README.md`.
- :129–131: “The analytic representation theory stops at compact groups … no infinite-dimensional unitary representations of noncompact groups”.

**Claim.**
- The index calls itself the map of the family (:5), but it omits this folder.
- Its scope boundary excludes what this roadmap's Layers 0–4 cover. Those layers treat strongly continuous representations of arbitrary Lie groups, unitary ones included, and NoncompactQuantumSymmetry M0 consumes them for exactly that case.

**Witness.** Grepping `](<dir>/README.md)` in the index matches 14 of the 15 subfolders; `SmoothBanachRepresentations` is the one missing. Pull request #1146 (head e5e8364) carries the bullet (:55) and a rewritten scope bullet (:119–123).

**Repair.** Choose one:
- Move #1146's :55 bullet and its :119–123 scope bullet into this pull request's family `README.md`, replacing :129–134. The grep then matches 15 of 15.
- Or add to the description: “#1146 adds the family-index entry and scope change for this roadmap and merges right after this pull request.”

## Previous findings

- **Previous R01 (family index): not repaired.** Head 2b062ae is unchanged and the index still has 14 of 15 links. Carried as R05.
- **Previous R02 (asterisk rendering): repaired at this head** (as the previous report found). :494, :506 and :507 still render with no stray emphasis.

## Verified sound

**Head and diff.**
- Head `2b062ae505828ba60173c0b87dbbb6110aa0d769`; the worktree is clean.
- The change set since the previous review is empty.
- Against origin/main, the only changes are the folder's `README.md` (+529) and `Suggested.lean` (+189). Nothing changes outside the folder or the family files.
- This review changed no file in the worktree or the manifest.

**Gate.** Rerun with `--order` set to the candidate merge order and `--build`:
- every scanner reports 0, including `build=0`, `statement-hygiene=0`, `outside-folder=0` and `stray-files=0`;
- the result is `OK`.

Without `--order`, the default order does not list this roadmap and the gate reports `depcheck: NOT IN ORDER`. That is not a defect at this stage.

**Dependency check.**

```text
depcheck: 244 roadmaps, 2464 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. In the candidate order: OperatorKTheory is at line 10, AutomorphicFormsOnReductiveGroups at 69, this roadmap at 70 and LocallyAnalyticDistributions at 72. The consumers are at 153, 210 and 294.

**Elaboration.** `lake env lean Suggested.lean` gives exactly seven warnings, all “declaration uses `sorry`”, at :94, :103, :115, :134, :147, :164 and :182.

**Signatures.** I elaborated a scratch copy with `#check @name` for all 12 declarations.
- All 12 types are identical to `signatures.md` up to universe names.
- The five defs and the abbrev keep exactly the binders their bodies use. `smoothLieVectors` keeps `IsScalarTower`.
- All seven theorems carry `hFD`, `hLie`, `hManifold`, `hT2`, `hBoundary`, `hBorel` and `hLC`.
- `hComplete` is omitted only where E does not occur: `dixmierMalliavin_function` and `scalarParametrix`.
- `smooth_inverse` carries `hCompleteA`.
- Nothing needed changing.

**One-tactic probe.** Each `sorry` was replaced by `first | rfl | infer_instance | trivial | fun_prop | (simp; done) | (exact?)`. All 7 theorems fail, each with “`exact?` could not close the goal” (:98, :106, :129, :142, :154, :169, :187). There is no padding.

**Headline theorems.**
- All seven are stated: `isSmoothLieVector_smear`, `dense_smoothLieVectors`, `scalarParametrix`, `dixmierMalliavin`, `dixmierMalliavin_function`, `smooth_lift` and `smooth_inverse`.
- The docstring names the headlines that cannot be stated at the pins and the carrier each lacks: the mixed-word Fréchet topology, the completed locally convex tensor, the distribution-to-smooth-dual comparison, and the Banach-algebra holomorphic calculus.
- I confirmed the last of these at the pin: the only Riesz projections are nonarchimedean (`TauCeti/Analysis/Normed/Operator/Nonarchimedean/RieszProjection/`).
- The README and Lean generality agree for all seven (RCLike 𝕜; Hausdorff, boundaryless, finite-dimensional real Lie G; regular Haar measure).

**Library declarations opened at the pins.** (Mathlib 1b1ccf4, Tau Ceti 2fd255d.)
- Mathlib `RepresentationTheory/Continuous/Basic.lean`: `ContRepresentation` (:55, a bare monoid hom into `V →L[R] V`) and `ContIntertwiningMap` (:81).
- Mathlib `Analysis/Distribution/Distribution.lean`:
  - `Distribution` (:166) is `𝓓^{n}(Ω,ℝ) →L_c[ℝ] F`, the compact-convergence topology;
  - `delta` (:202);
  - `lineDerivCLM` (:235) carries a minus sign, and at order ⊤→⊤ it is the genuine derivative, since `⊤+1≤⊤` (`TestFunction.lean:577`);
  - `ofFun` (:303) is zero off local integrability.
- Mathlib `TestFunction` (`TestFunction.lean:67`).
- Mathlib `exists_extension_of_le_sublinear` (`Convex/Cone/Extension.lean:159`).
- Mathlib `contDiffAt_ringInverse` (`ContDiff/Operations.lean:779`).
- Mathlib `ContDiffAt.comp_contMDiffAt` (`ContMDiff/NormedSpace.lean:84`).
- Mathlib `Continuous.integrable_of_hasCompactSupport` (`LocallyIntegrable.lean:617`).
- Mathlib `banach_steinhaus` (`BanachSteinhaus.lean:40`).
- Mathlib `IsHaarMeasure` (`Group/Measure.lean:786`): finite on compacts, left invariant, open-positive; no regularity.
- Mathlib `LieGroup` extends `ContMDiffMul`, which extends `IsManifold`, so `hManifold` is implied. That is harmless.
- Tau Ceti `oneParameterSubgroup` (:187) and `contMDiff_oneParameterSubgroup` (:214).
- Tau Ceti `TauCeti.Complexification` (:82), `reCLM` (:276), `ofRealLI` (:290) and `ContinuousLinearMap.complexify` (:409).
- Tau Ceti `chartVolumeDensity`, `chartVolumeDensity_pos` (positive on the chart base set) and `contMDiffOn_chartVolumeDensity` (needs `IsContMDiffRiemannianBundle`).
- Tau Ceti `Homeomorph.measurePreserving_riemannianVolume` (needs `LindelofSpace` source and target). README :50 states these hypotheses correctly.
- Tau Ceti `StronglyContinuousSemigroup.smoothVectors` (`Generator/SmoothVectors.lean:49`).
- Duplication searches:
  - Tau Ceti's `ContRepresentation.integratedOperatorL1` assumes a uniform bound. README §1.3 credits the bounded L¹ action to BanachAlgebras A7.IntegratedRepresentations, which consumes that declaration (A7 :1615), so it is consistent.
  - Tau Ceti's open-mapping files (Henkel) are nonarchimedean only.
  - No finite-orbit-span (G-finite) predicate exists at the pins, so the recorded gap is real.

**Cross-roadmap citations resolved this round.**

| Citation | Where | Result |
|---|---|---|
| AutomorphicFormsOnReductiveGroups §0.1a, §2.1, §2.7 | #1037 head 753cac0: :112, :299, :485 | Resolves. §2.7 owns the complex Banach smooth vectors, smoothing, density and Fréchet D-M. Its `L_X` is this README's `R_X` (AFRG :489; README :58). AFRG names this roadmap as a consumer only (:7, :1312). |
| CompactGroups Layer 5 and `gap:banach-gfinite-density` | Main, `RepresentationTheory/CompactGroups` :318. The gap is declared by AFRG (:51) | Resolves. The gap is AFRG's, consumed here through §2.1. |
| NoncommutativeGeometry N1, N6 | Main :84, :475; revision #1143 (1847a9a6) :16–23, :84, :1381 | Resolves. The revision cedes the real tensor and scalar comparisons to §7.2a and takes nothing from Layer 8. No cycle. |
| BanachSpaceTheory B4 | Main :239–300, :338 | Resolves. Real and complex projective norms. B4.C compares approximation properties and duals, not tensors. |
| BanachAlgebras A1–A2, A7 | Main :181, :440, :1555–1666 | Resolves. A7's conventions `c(g)` and `(f*h)(x)=∫f(y)h(y⁻¹x)` match README :25 and :30. |
| LieGroups Layers 0–3 | Main `RepresentationTheory/LieGroups` :233–323 | Exponential, Ad and automatic smoothness resolve; the product chart does not (R03). |
| OneParameterSemigroups Part A | `Completed/OneParameterSemigroups` :90 | Resolves. |
| OperatorKTheory K3 §3.5 | #866 head b328ec07: :689 (K3) and :866 (§3.5) | Resolves. Its hypotheses (metrizable, complete, locally convex, continuous product and star, dense injective map, matrix and unitization inverse closure) match :494. The roadmap mentions SmoothBanachRepresentations 0 times. |
| NoncompactQuantumSymmetry M0 (anchor) | #1015 a7afa46: :685 “Layer 3: M0 — …” | The anchor resolves; that roadmap's :20 and :131 consume Layers 0–4 as stated. |
| CompactQuantumMetricSpaces §4.5 | #1155: README :1126, :1136 | Uses §§2.1, 3.1, 8.1, as stated. |
| QuantitativeOrbitMethod… §§0.2, 0.6 | #1842: :125, :244 (§0.2), :328 (§0.6) | Uses §§2.1, 3.1, 3.4, 6.1, as stated. |

`roadmaps resolve` finds no unresolved citation or Lean name.

**Ownership against open work.**
- `roadmaps overlaps`: no other pull request changes this roadmap, and no cited id is dropped.
- Searched by object:
  - Dixmier–Malliavin / Gårding: AFRG §2.7 owns the complex Fréchet case. NoncompactQuantumSymmetry, QuantitativeOrbitMethod, AutomorphicLFunctionsPartII, TwistedAutomorphicDescents and AutomorphicSpectralTheoryPartII consume and do not own.
  - Real completed locally convex projective tensor: no other owner (SpectralManifolds defers to NCG N1 for the complex one).
  - Fréchet open mapping theorem: a second owner (R02).
- No `Suggested.lean` elsewhere declares `IsSmoothLieVector`, `smoothLieVectors`, `HasContinuousOrbits`, `LieTestFunction` or this namespace.

**Policy scan.** No process words, no pull-request numbers, no LaTeX, no `lemma`, no `set_option`, no `#eval`. Every layer ends with Examples and Dependencies, and every definition has at least three Checks.

### Seeded source sample

- **0.1, 3.1, 3.3, 4.1 and the integrated action of 1.3 (Casselman p.1).**
  - `casselman2016` lines 11–16 cover iterated domains and V∞.
  - Lines 17–20 cover the Fréchet seminorms ‖π(X)v‖_ρ.
  - Lines 21–35 give π(f)=∫f(x)π(x)dx and π(y)π(f)=π(L_y f), and π(X)π(f)v=π(L_X f)v with Casselman's `L_X=−R_X` here.
  - Line 36 gives density via a Dirac sequence.
  - The orbit convention (line 13) is fixed at Layer 0 :78. Each target's use is supported as written.
- **0.2, 1.1, 1.4, 3.2, 7.1, 7.2a, 7.3.** These carry no external locator; they are the roadmap's own targets or AFRG/A7 citations, checked above and in the table.
- **6.1 (Proposition 6.1, p.13).**
  - `casselman2016` lines 645–649: a smooth vector is a finite sum π(f_j)v_j with f_j ∈ C_c∞(Ω) and v_j smooth. Shrinking Ω into U gives the prescribed support.
  - Lines 670–682 give the basis iteration. Line 676 uses the product image of exp(ℝx₁)exp(ℝx₂) (see R03).
- **7.2 (factorization-based lifting; Layer 7 intro cites Proposition 6.1).** Supported, by the same lines.
- **5.1 locators.**
  - Lemma 4.1 (line 492, p.9) bounds only α_m for m≥1, with α₀=1. This matches “no upper restriction on α₀” and the Lean `∀ n, 0 < n → α n ≤ β n`.
  - Lemma 4.2 is at line 524 (p.10), Lemma 5.1 at line 609 (p.12; convergence in C^{−∞}, small supports, line 637) and Proposition 1.3 at line 188 (p.4).
  - Casselman's remark on the non-monotone bound (line 522) matches §5.1.
- **7.4 (Phillips).**
  - Definition 2.2 (`phillips1955` lines 188–191, p.274): X⁺ is the closure of D(A*), and the adjoint semigroup is its restriction there.
  - Theorem 2.1 (lines 202–204, p.275): class (0,A) on X⁺, and the generator is the largest restriction of A* with domain and range in X⁺.
  - Theorem 2.2 (lines 270–277, p.277): X⁺ is exactly the set where T*(s)x*→x*.
  - The README cites these as the model, not as a supplier, and proves the group case itself. Its sign `⟨dπ′(X)λ,x⟩=−⟨λ,dπ(X)x⟩` comes from the reversed group t↦π(exp(−tX))ᵗ.

### Adversarial table

| # | Statement | Instances and values computed | Result |
|---|---|---|---|
| 1 | 0.1 compact operator bounds | For π(t)=e^t on ℝ, K=[−1,1]: sup_K‖π(t)‖=e≈2.718, while the global sup is ∞. For L∞(ℝ) translation, ‖τ_t1_[0,1]−1_[0,1]‖_∞=1 for 0<\|t\|<1, so it is excluded by `HasContinuousOrbits`. On L² the same difference has norm √(2\|t\|)→0. On E=0, C=0. | True |
| 2 | 0.2 two-sided generator | For e^t, (e^t−1)/t→1 from both sides. For L² translation of 1_[0,1], the squared quotient norm is 2/\|t\|→∞, so the vector is not in D(A). For π(t)=e^{it} on ℂ, A1=i and A(i·1)=−1=i·A1. | True; pinned (R01) |
| 3 | 1.1 fixed-support spaces | For K=∅ or {0}⊂ℝ, D_K={0}. A bump on [−1,1] is in D_K; its translate to [2,4] is not. For G=ℤ, D_K has dimension \|K\|. Translates of a bump to centres n do not tend to 0 in the final topology. | True |
| 4 | 1.3 `‖π(f)v‖≤C_K‖f‖₁‖v‖` | For the trivial group of mass 2: π(f)v=2f(e)v, ‖f‖₁=2\|f(e)\| and C=1, so equality holds. For e^t with f=1_[0,1]: e−1≈1.718 ≤ e·1. | True |
| 5 | 1.4 order and modular factor | On S₃, δ_(12)*δ_(23)=δ_(123) and the reverse gives δ_(132). On the affine group, the substitution a′=aa₀ gives c(a₀,0)=a₀. With `∫F(x⁻¹)dμ=∫F(x)c(x)dμ`, f*(x)=c(x)·conj f(x⁻¹) gives π(f*)=π(f)* (A7 :1568). | True |
| 6 | 3.1 dπ is a Lie map | For H=diag(1,0), N=E₁₂, v=(0,1): HNv=(1,0), NHv=0 and [H,N]v=(1,0)=Nv. The reversed bracket gives (−1,0). | True |
| 7 | 3.2 Ad covariance | For g=diag(2,1): gNg⁻¹=2N=Ad(g)N and gHg⁻¹=H. | True |
| 8 | 3.3 `dπ(X)π(f)v=π(−R_Xf)v` | For e^t: −∫f′e^t=∫fe^t, while the +R sign gives −∫fe^t. On the affine group, R_H b=b and L_H b=0. AFRG's Check `R(X)R(a)=R(−L_Xa)` is the same law with its L as this R. | True |
| 9 | 3.4 `π(f)dπ(X)v=π(q_Xf−L_Xf)v` | On the affine group, ∫L_Hf da db/a²=∫f; q_H=1=tr ad H and q_N=0=tr ad N. On ℝ, q=0. | True |
| 10 | 4.1 real comparison | For rotation on C(S¹,ℝ), cos has real orbit span {cos,sin} of dimension 2, while e^{ix} has complex span of dimension 1; Re e^{ix}=cos. Re(x+0i)=x and ‖Re z‖≤‖z‖. ∏C₂ has trivial identity component and is not discrete, so it is not Lie. | True |
| 11 | `dense_smoothLieVectors` | For translation on L²(ℝ), the smooth vectors are H^∞, which is dense. E=0 is trivial. For G=ℤ (dimension 0), every orbit is smooth. | True |
| 12 | `isSmoothLieVector_smear` | For e^t and v=1, the orbit s↦e^s∫fe^t is smooth. For L²(ℝ) and v=1_[0,1], smear is convolution with a bump, with all derivatives in L². | True |
| 13 | `scalarParametrix` | At ε=0, g=h=0 and the limit would be 0≠δ₀. The partial sums at N=0,1 are α₀[g] and α₀[g]−α₁D²[g]. Pairing with ψ≡1 near [−ε,ε] gives α₀∫g=1+∫h. ̂δ^{(2n)}(y)=(−1)^n(2πy)^{2n}, so the (−1)^n gives positive multipliers. D^{2n} is independent of the sign convention of D. | True |
| 14 | `dixmierMalliavin` (6.1) | For the trivial group of mass 2, f(1)=1/2 and w=v give π(f)w=v. For G=ℤ, f=1_{0}/μ{0}. For v=0, n=0. For a constant density J=2 on an abelian group, ∫(∏g_i/J)J=∏∫g_i. | True |
| 15 | `dixmierMalliavin_function` | On S₃ with U={e} and φ=δ_(12): f=δ_e and h=δ_(12) give f*h=δ_(12), with tsupport h={(12)}. For the trivial group of mass 2: (1/2)·φ·2=φ. | True |
| 16 | 7.1 M∞=M∩E∞ | Projection ℝ²→ℝ with trivial actions. On C(S¹) with M the mean-zero functions, M∞ is the smooth mean-zero functions. | True |
| 17 | `smooth_lift` (7.2) | For T f=f̂(1) from C(S¹) to ℂ, with ρ(t)=e^{−it}: w=1 lifts to the smooth vector e^{ix}. For T=0 and w=1 there is no lift, so surjectivity is needed. | True |
| 18 | 7.2a seminorm, complexification and balancing | In ℝ²⊗ℝ³ (dimension 6), π(e₁⊗e₁)=1, while one representation costs √2+1≈2.414. ℂ_ℝ⊗ℂ_ℝ (dimension 4) maps onto ℂ (dimension 2); taking x=i, y=1 puts 1⊗1+i⊗i in the kernel span. In the inverse map, i(x+ix′) yields i times the original value, so it is ℂ-bilinear. | True |
| 19 | 7.3 diagonal derivatives | For e^t⊗e^{2t}: first derivative 3=1+2, second derivative 9=1+2·1·2+4. | True |
| 20 | 7.4 contragredient | On C(S¹)′, ‖δ_z−δ₁‖=2 while Haar measure has a fixed orbit. For e^t the contragredient is e^{−t}λ, with derivative −λ(x). | True |
| 21 | `smooth_inverse` | For diag(e^t,1) on M₂(ℝ): a=I+E₁₂ has orbit I+e^tE₁₂, a⁻¹ has orbit I−e^tE₁₂, and −a⁻¹E₁₂a⁻¹=−E₁₂. The scalar action e^t fails h1 (e^t≠1). For A=0 the orbit is constant. | True |
| 22 | 8.1 star law | On C(S¹) with f=e^{ix} and f(x−t): Df(0)=−i and D(f*)(0)=i=conj(−i). For diag(e^t,1) on M₂(ℂ): (dαE₁₂)*=E₂₁≠−E₂₁=dα(E₁₂*). | True; the star-preserving hypothesis is required and present |
| 23 | Product chart (R03) | In the order (H,N): Φ=(e^{t₁},e^{t₁}t₂), da∧db/a²=dt₁dt₂, Jacobian 1 and J≡1. In the order (N,H): Φ=(e^{s₂},s₁), J=e^{−s₂}. | A local diffeomorphism, but unowned |
| 24 | Fréchet open mapping (R02) | `naFrechet_openMapping` with K=ℝ or ℂ: `NontriviallyNormedField` and `CompleteSpace` hold. | Same theorem, two owners |

## Not verifiable

- **Dixmier–Malliavin, Bull. Sci. Math. 102 (1978)** (README :529). It was not fetched this round; earlier rounds found no legal open copy. The README labels these locators uncertified and relies on Casselman's stated results, which I verified.
- **The three unrelated board packages** (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) were not read.

## Source issues

- **Misprint** in casselman2016 at the proof of Proposition 6.1, p.13 (lines 654–658, 661–668): the source says the series has coefficients α_n with no alternating sign; it should carry (−1)^n α_n, as in Lemma 5.1 (line 613); affects the proof.
- **Misprint** in casselman2016 at the proof of Proposition 6.1, p.13 (lines 669–672): the source says that π(µ₀)α₀=v+π(µ₁)v with α₁=v gives v=π(µ₀)α₀+π(µ₁)α₁; it should be v=π(µ₀)α₀−π(µ₁)α₁; affects nothing.
- **Misprint** in casselman2016 at the discussion before Lemma 4.2, p.10 (line 509): the source says F′(λ) is (n+1)λⁿe^{−2πλ}−2πe^{−2πλ}, equal to (n+1−2πλ)λ^{n−1}e^{−2πλ}; it should subtract 2πλ^{n+1}e^{−2πλ} and give (n+1−2πλ)λⁿe^{−2πλ}; affects nothing.
- **Misprint** in casselman2016 at the proof of Lemma 5.1, p.12 (line 623): the source says the new bounds B_m are the supremum of A_m and the reciprocal derivative bounds; it should be the infimum, so that α_m≤B_m enforces every bound; affects the proof.
