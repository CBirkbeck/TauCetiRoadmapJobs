# Review of SobolevMapsBetweenManifolds (pull request #2230 at e5a08ce)

**Verdict:** needs changes

## R01 (P1) — Supplier contracts cite Tau Ceti code that does not exist at the pin (objects owned by roadmaps on main)

**Location:** `TauCetiRoadmap/SobolevMapsBetweenManifolds/README.md:272` "The planar classes `TauCeti.MemLpLoc`, `TauCeti.MemWkpLoc` and their API in `TauCeti/Analysis/Sobolev/Local/`"; likewise lines 101, 107, 292–301, 322–334, 394, 612, 646; `Suggested.lean:28`.

**Claim:** These are presented as existing Tau Ceti declarations, and the section "Existing code to refactor" treats them as code. None of them exists at the pinned Tau Ceti `2fd255d`. Each object is still a target of a roadmap on main.

**Witness:** At the pin, `grep -rw` finds 0 occurrences of `MemLpLoc`, `MemWkpLoc`, `SobolevSection`, `FiniteBundleAtlas`, `SobolevH1`, `isNullSet_iff_riemannianVolume_eq_zero`, `toHomologicalOrientation` and `degree_toHomologicalOrientation`.

**Repair:** Cite the owners and drop the Tau Ceti names:
- planar classes → PseudoholomorphicCurveAnalysis §1.1;
- bundle carrier → PseudodifferentialOperators §5.2;
- chartwise and Riemannian null sets → RiemannianGeometry R4.6;
- degree of continuous maps → DifferentialGeometry Layer 10 (10.3–10.4; the only degree at the pin is `TauCeti.degreeAtRegularValue`).

Then make these edits:
- Delete "Existing code to refactor".
- §1.1: "Define for `E` the classes that PseudoholomorphicCurveAnalysis §1.1 plans for `ℂ`; its classes are the case `E = ℂ`."
- §7.3: "Extend the carrier of PseudodifferentialOperators §5.2 to trivial Banach fibres."
- Layer 11: delete the `HomologicalOrientation` sentence.
- `Suggested.lean`: delete the sentence "In Tau Ceti they replace the planar `TauCeti.MemLpLoc` and `TauCeti.MemWkpLoc` (README, Existing code to refactor)." (lines 27–29).

## R02 (P1) — Supplier contracts cite Tau Ceti lemmas that do not exist at the pin and that no roadmap owns

**Location:** `README.md:253–256` "`TauCeti.hasWeakFDerivOn_iff_locally`, `TauCeti.hasWeakFDerivOn_iSup_iff`, `TauCeti.exists_hasWeakFDerivOn_iSup` … `TauCeti.HasWeakFDerivOn.contDiffOn_comp` (`ChainRule.lean`), already stated for Banach-valued inner and outer maps"; also lines 262, 275, 293, 425, 445, 479, 497, 701.

**Claim:** The routes of §1.2 (the sheaf property), §2.1(a), §2.2, §3.3 and §7.3 rest on declarations that do not exist and that no supplier owns.

**Witness:** The pin has 0 occurrences of `hasWeakFDerivOn_iff_locally`, `hasWeakFDerivOn_iSup_iff`, `exists_hasWeakFDerivOn_iSup`, `hasWeakFDerivOn_iff_coordinates`, `comp_contDiffOn_diffeo` and `isNullSet_image_of_forall_addHaar_image_extChartAt`. There is no `WeakDeriv/ChainRule.lean`.

**Repair:** Delete these from "From Tau Ceti" and state each as this roadmap's own target, with a route from what the pin has:
- §1.2's sheaf property: from `TauCeti.hasWeakFDerivOn_iff_forall_isCompact_closure` (`WeakDeriv/Local.lean:71`) and a countable subcover.
- §2.1(a) and §2.2: by the §2.3 mollification routes. Remove "already stated".
- §3.3: from `TauCeti.IsNullSet.chartwise` (`Measure.lean:50`) and Mathlib `addHaar_image_eq_zero_of_differentiableOn_of_addHaar_eq_zero`.
- §7.3's `TauCeti.Manifold.SobolevH1` bullet: cut it, or cite Yamabe Y1's `H¹` carrier.

## R03 (P1) — The §4.4 converse assumes its conclusion

**Location:** `README.md:792–794` "a member whose weak differential agrees almost everywhere with a continuous family that is the `mfderiv` of `f` at every point is `C¹`".

**Claim:** A map that is differentiable at every point with a continuous derivative is `C¹` by definition, so this converse is vacuous. The intended converse (a continuous weak differential forces `C¹`) is lost.

**Witness:** `TauCeti.HasWeakFDerivOn.fderiv_eq_of_continuousOn` (`WeakDeriv/Classical.lean:138`, normed `E` with Haar measure) needs only a continuous weak derivative of a continuous function. ConventVanSchaftingen2016 line 196 (Prop. 1.1, p. 4) is the manifold form.

**Repair:** "Prove conversely that a member whose weak differential agrees almost everywhere with a family `Φ` that is continuous in charts is `C¹`, with `mfderiv f x = Φ x` at every `x` (Convent–Van Schaftingen, Prop. 1.1, p. 4); in charts, `TauCeti.HasWeakFDerivOn.fderiv_eq_of_continuousOn`."

## R04 (P2) — Headline theorems that are statable at the pins are absent from `Suggested.lean`

**Location:** `Suggested.lean:31–33` "Not stated here: … the controlled extrinsic space and finite-dimensional degree (Layers 10–11)"; `README.md:39–47` (uniqueness of the colocal differential; density for `p ≥ dim M`; the `x/|x|` obstruction); `README.md:772` (uniqueness of the weak differential).

**Claim:** Four end theorems can be stated with the pinned APIs and the file's own definitions, but none is stated: the Schoen–Uhlenbeck density for compact finite-dimensional targets, non-density at `x/|x|` for `n − 1 ≤ p < n`, and almost-everywhere uniqueness of the weak and colocal differentials.

**Witness:** At this head's binders (normed `E`, Haar `volume`), the four statements below elaborate with only `sorry` warnings in a scratch copy of the file that adds `public import TauCeti.Geometry.Manifold.Measure`.

**Repair:** Add the import and these statements:

```lean
theorem not_exists_smooth_sphere_approx_radial (n : ℕ) (hn : 2 ≤ n) (p : ℝ≥0∞)
    (hp : ((n - 1 : ℕ) : ℝ≥0∞) ≤ p) (hpn : p < n) :
    let B : Opens (EuclideanSpace ℝ (Fin n)) := ⟨Metric.ball 0 1, Metric.isOpen_ball⟩
    let u : EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n) := fun x => ‖x‖⁻¹ • x
    ∀ Du, TauCeti.HasWeakFDerivOn volume B u Du →
      ¬ ∃ v : ℕ → EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n),
        (∀ j, ContDiffOn ℝ ∞ (v j) B) ∧ (∀ j, ∀ x ∈ (B : Set _), ‖v j x‖ = 1) ∧
        Tendsto (fun j => eLpNorm (v j - u) p (volume.restrict B)) atTop (𝓝 0) ∧
        Tendsto (fun j => eLpNorm (fun x => fderiv ℝ (v j) x - Du x) p (volume.restrict B))
          atTop (𝓝 0) := by
  sorry

section Density
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasureSpace E] [BorelSpace E] [(volume : Measure E).IsAddHaarMeasure]
  {M : Type*} [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℝ, E) ∞ M] [CompactSpace M]
  [T2Space M]
  {E' : Type*} [NormedAddCommGroup E'] [InnerProductSpace ℝ E'] [FiniteDimensional ℝ E']
  {N : Type*} [TopologicalSpace N] [ChartedSpace E' N] [IsManifold 𝓘(ℝ, E') ∞ N] [CompactSpace N]
  [T2Space N] {m : ℕ}

theorem exists_smooth_approx_of_ae_mem_range
    (ι : N → EuclideanSpace ℝ (Fin m)) (hι : ContMDiff 𝓘(ℝ, E') 𝓘(ℝ, EuclideanSpace ℝ (Fin m)) ∞ ι)
    (hιemb : Topology.IsEmbedding ι)
    (hιimm : ∀ y, Manifold.IsImmersionAt 𝓘(ℝ, E') 𝓘(ℝ, EuclideanSpace ℝ (Fin m)) ∞ ι y)
    {p : ℝ≥0∞} (hnp : (finrank ℝ E : ℝ≥0∞) ≤ p) (hp : p < ⊤)
    {u : M → EuclideanSpace ℝ (Fin m)} (hu : MemW1pLocM E p u)
    (hN : TauCeti.IsNullSet 𝓘(ℝ, E) {x | u x ∉ Set.range ι}) :
    ∃ g : ℕ → M → N, (∀ j, ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, E') ∞ (g j)) ∧
      ∀ (x₀ : M) (K : Set E), IsCompact K → K ⊆ (extChartAt 𝓘(ℝ, E) x₀).target →
        ∃ Du : E → E →L[ℝ] EuclideanSpace ℝ (Fin m),
          TauCeti.HasWeakFDerivOn volume ⟨interior (extChartAt 𝓘(ℝ, E) x₀).target, isOpen_interior⟩
            (u ∘ (extChartAt 𝓘(ℝ, E) x₀).symm) Du ∧
          Tendsto (fun j => eLpNorm (ι ∘ g j ∘ (extChartAt 𝓘(ℝ, E) x₀).symm -
            u ∘ (extChartAt 𝓘(ℝ, E) x₀).symm) p (volume.restrict K)) atTop (𝓝 0) ∧
          Tendsto (fun j => eLpNorm (fun y => fderiv ℝ (ι ∘ g j ∘ (extChartAt 𝓘(ℝ, E) x₀).symm) y
            - Du y) p (volume.restrict K)) atTop (𝓝 0) := by
  sorry
end Density
```

In section `Manifold`, after `IsSobolevMap.exists_hasWeakMFDeriv`:

```lean
/-- §4.3: the weak differential of a continuous map is unique almost everywhere. -/
theorem HasWeakMFDeriv.ae_eq [CompleteSpace E'] [T2Space M] [SecondCountableTopology M]
    {f : M → N}
    {Df Df' : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (f x)}
    (hf : Continuous f) (h : HasWeakMFDeriv E E' f Df) (h' : HasWeakMFDeriv E E' f Df') :
    TauCeti.IsNullSet 𝓘(ℝ, E) {x | Df x ≠ Df' x} := by
  sorry
```

In section `Colocal`, after `exists_hasColocalWeakMFDeriv`:

```lean
/-- §4.8: the colocal weak differential is unique almost everywhere. -/
theorem HasColocalWeakMFDeriv.ae_eq [FiniteDimensional ℝ E'] [BorelSpace N]
    [T2Space M] [SecondCountableTopology M] [T2Space N] [SecondCountableTopology N]
    [IsManifold 𝓘(ℝ, E) 1 M] [IsManifold 𝓘(ℝ, E') 1 N] {u : M → N}
    {Du Du' : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (u x)}
    (h : HasColocalWeakMFDeriv E E' u Du) (h' : HasColocalWeakMFDeriv E E' u Du') :
    TauCeti.IsNullSet 𝓘(ℝ, E) {x | Du x ≠ Du' x} := by
  sorry
```

## R05 (P2) — §7.1 states its comparison for "the flat metric" of a model space that no longer has one

**Location:** `README.md:1171` "Let `Ω ⊆ E` be open, carrying the identity chart and the flat metric"; `:1175–1178` "`‖Df‖ = ‖Du‖` almost everywhere. For the finite-dimensional specialization `F = E` with one orientation on both sides, prove that `J_f = LinearMap.det Du`".

**Claim:** The Conventions now make `E` a normed space with no inner product, so "the flat metric" has no referent. Read as any Euclidean metric, `‖Df‖ = ‖Du‖` is false. `J_f` also needs a Riemannian metric on `E`.

**Witness:** Take `E = ℝ²` with `max(|y₁|, |y₂|)` (§1.1's new Check), `F = ℝ` and `u(x) = x₁ + x₂`. Then `‖Du‖ = 2` for the max norm, and `√2` for the Euclidean metric.

**Repair:** "Let `Ω ⊆ E` be open, carrying the identity chart and the norm of `E` as its tangent norm (§5.1), … that then `Df = Du` and `‖Df‖ = ‖Du‖` almost everywhere. When `E` is an inner product space with its flat metric, `F = E` and one orientation on both sides, prove `J_f = LinearMap.det Du` almost everywhere." This keeps QuasiregularMaps' gap `sobolev-maps-euclidean`, which is stated for inner product `E`.

## R06 (P3) — A Check and the Riemannian weight still assume an inner product and Lebesgue measure on `E`

**Location:** `README.md:419` "`u(x) = |x|` on `E` lies in the class for every `p`, with `Du(x) = ⟨x/|x|, ·⟩` off `0`"; `README.md:627` "Identify Riemannian volume as the density whose coordinate weight is the square root of the metric determinant."

**Claim:** The normed-model change makes both wrong. The Check is false for §1.1's own max-norm model. The weight is off by the normalization of the Haar measure `volume`.

**Witness:** For the max norm at `x = (1, 1/2)`, `Du = dx₁`, so `Du(0, 1) = 0`, while `⟨x/|x|, (0, 1)⟩ ≠ 0`. On `ℝ` with `volume = 2·Lebesgue` and `g = dt²`, the weight is `1/2`, not `√det g = 1`.

**Repair:**
- Line 419: "`u(x) = ‖x‖` on `E` lies in the class for every `p`, being `1`-Lipschitz. For an inner product norm, `Du(x) = ⟨x/‖x‖, ·⟩` off `0`. For the max norm on `ℝ²`, `Du(x) = sign(x₁) dx₁` where `|x₁| > |x₂|`, and symmetrically."
- Line 627: "… whose coordinate weight is `√det (g_ij)` times the density of `b.addHaar` with respect to `volume`, for the basis `b` of `E` in which `g_ij` is computed. For Lebesgue measure on `ℝⁿ` and its standard basis, the weight is `√det (g_ij)`."
- Line 634: replace "Lebesgue measure in charts" with "the Haar measure `volume` in charts".

## R07 (P3) — The sampled targets carry no source locators

**Location:** §2.2, §3.2, §3.3, §4.4, §4.5, §5.2, §5.3, §6.2 (including its new chart formula), §7.1, §7.3 and §9.2 have none. Two passages name authors only: `README.md:1589` "(Schoen–Uhlenbeck when the target is compact and finite-dimensional)" and `README.md:1505` "Wockel's chartwise relative smoothing framework".

**Claim:** No claim in the README has a theorem-level or page-level locator, and §5.4's "§§1–2" is section-level only.

**Witness:** Hajlasz2009, the manifest's certified source, states §10.3 as Thm 2.1 (Hajlasz2009 line 129, p. 188) and §11.3 as Thm 2.3 (line 227, p. 189). It is absent from References.

**Repair:** Add Hajłasz 2009 to References and put locators at the claims:
- §10.3: "(Hajłasz 2009, Thm 2.1, p. 188, with its proof for `p = n`)";
- §11.3: "(Hajłasz 2009, Thm 2.3, p. 189)";
- §2.3's oscillation bound: "(Hajłasz 2009, (2.1), p. 188)";
- §9.3: "(Wockel, Thm 0.11)";
- §4.7–§4.8: "(Convent–Van Schaftingen, Def. 1.1, Prop. 1.2 p. 5, Prop. 1.5 p. 6, Prop. 1.8 p. 7)";
- §5.4: "(Def. 2.1, p. 8)";
- §2.4: "(Arendt–Kreuter, Thm 6.2)";
- §2.1(b): "(Arendt–Kreuter, Thm 4.2)";
- §6.2's chart formula: the coordinate expression of the Riemannian volume form (Lee 2012, Ch. 15).

Give each remaining target a textbook locator.

## R08 (P3) — The Heikkilä–Pankka locator is not in the text on record

**Location:** `README.md:1387` "(Heikkilä–Pankka, Remark 2)"; `README.md:1773` "§2 and Remark 2 (the definition of"; `Suggested.lean:225` "(Heikkilä–Pankka, Remark 2)".

**Claim:** In the version the manifest records (arXiv v2), neither the cited remark nor the cited section contains a definition or an equivalence.

**Witness:** HeikkilaPankka2025 has Remark 1.6 (line 189) and remarks §7.1 (line 874) and §7.2 (line 898) only. §2 reduces Thm 1.1 to Thm 1.3. A Nash embedding appears only in the proof of Prop. B.1 (line 1328).

**Repair:** "(Heikkilä–Pankka, arXiv 2302.11440v2, p. 1, and the proof of Prop. B.1, p. 24)". State the equivalence as this roadmap's §9.1 theorem, and cite the extrinsic definition as Hajłasz 2009, §2, p. 187.

## R09 (P3) — Padding in `Suggested.lean`

**Location:** `Suggested.lean:370–371` "§6.1: the defining identity. -/ theorem orientedJacobian_mul_volumeForm"; `Suggested.lean:383` `orientedJacobian_neg_left`.

**Claim:** The first theorem restates the definition, and the second closes in one tactic.

**Witness:** At this head, `simp [orientedJacobian, Orientation.volumeForm_neg_orientation, div_neg]` closes `orientedJacobian_neg_left` in a scratch copy.

**Repair:** Delete both theorems from `Suggested.lean`; the README §6.1 bullets keep the statements.

## R10 (P3) — Definitions that no stated theorem uses

**Location:** `Suggested.lean:141` `IsPositiveContinuousDensityMeasure`, `:213` `sobolevPullback`, `:238` `IsSmoothRetractiveEmbedding`.

**Claim:** `Suggested.lean` may carry only the definitions that a stated headline needs, and no theorem uses these three. `IsPositiveContinuousDensityMeasure` also omits the Borel structure that README §3.1 assumes ("On `M` with its Borel measurable structure").

**Witness:** grep finds each name once, on its definition line. The elaborated type of `IsPositiveContinuousDensityMeasure` has `[MeasurableSpace M]` but no `[BorelSpace M]`.

**Repair:** Delete the three definitions; README §3.1, §8.1 and §9.2 keep them. Alternatively, keep each one with a headline that uses it, adding `[BorelSpace M]` to the first.

## R11 (P3) — The module docstring frames the file as a catalogue and omits the missing carriers

**Location:** `Suggested.lean:11–13` "The statements here suggest Lean forms for particular milestones, so that contributors and reviewers converge on names and signatures"; `:27–35`.

**Claim:** The file is the acceptance test, which states the headline theorems. The docstring lists omitted layers without naming, for each one, the carrier that is missing at the pins.

**Witness:** Lines 31–33 list Layers 5, 6, 8 and 10–11 as "Not stated here" and name no missing declaration. Line 28 names `TauCeti.MemLpLoc`, which is absent at the pin (R01).

**Repair:** Replace lines 10–35 with: "The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. The local classes have a finite-dimensional normed source with an additive Haar measure `volume` and a Banach-valued target. Not statable at the pins: the degree of continuous and `W^{1,n}` maps (Layer 11; there is no degree of continuous maps between closed oriented manifolds, DifferentialGeometry Layer 10); the weak exterior derivative of `V`-valued forms (Layer 8; there is no Bochner top-form integral, §8.2); …". Name each omitted headline with its missing carrier.

## R12 (P3) — The README backticks roadmap names that `Suggested.lean` does not declare

**Location:** `README.md:773` "`weakMfderiv f` as a chosen one"; `README.md:1299` "(`HasWeakMExtDeriv α β`)"; `README.md:1683` "(`sobolevDegree`)".

**Claim:** A backticked name of this roadmap's own claims a declaration in `Suggested.lean`, and these three have none.

**Witness:** grep of `Suggested.lean` finds 0 occurrences of `weakMfderiv`, `HasWeakMExtDeriv` and `sobolevDegree`.

**Repair:** Write them in prose without backticks ("a chosen weak differential", "`β` is a weak exterior derivative of `α`", "the degree `deg u`"), or declare each one with the headline that needs it.

## R13 (P3) — Some definitions have too few Checks, and two Checks fail at boundary parameters

**Location:** §3.2, §4.1, §4.3, §4.7, §4.8, §9.2 and §11.2 have two Checks each. `README.md:678` "the function `1` is in `L^p_loc` but not in `Lᵖ` of the volume"; `README.md:919–920` "The radial map `x ↦ x/|x|` into `S^{n−1}` … is colocal even without continuity".

**Claim:** Seven definitions have fewer than the three Checks required. The §3.2 Check is false at `p = ∞`, and the §4.8 Check is false at `n = 1`.

**Witness:** `‖1‖_{L^∞(eˣdx)} = 1 < ∞`. For `n = 1`, `x/|x| = sign x` into `S⁰`, and a probe with `φ(1) ≠ φ(−1)` turns it into a jump that is not in `W^{1,1}_loc`.

**Repair:** Write "for `p < ∞`" and "for `n ≥ 2`", and add a third discriminating Check to each listed section:
- §4.3: "the zero family is not a weak differential of `t ↦ t`";
- §4.7: "`sign x` on `ℝ` is not colocal into `ℝ`";
- §9.2: "`t ↦ (t, t²)` with `r(z) = z₁` on `U = ℝ²` is retractive";
- §11.2: "the antipodal map of `S²` has degree `−1`";
- §3.2, §4.1 and §4.8: one each in the same style.

## R14 (P3) — §2.2's injectivity hypothesis differs between README and Lean, and is not needed

**Location:** `README.md:484` "an injective `Φ : E → E` that is `C¹` on `Ω'`"; `Suggested.lean:84` `(hinj : InjOn Φ Ω')`.

**Claim:** The two files state different hypotheses, and neither is needed. The conclusions are local, and `Φ` is injective near each point of `Ω'`.

**Witness:** `Φ(z) = z²` on `Ω' = Ω = ℂ ∖ {0}` is not injective, yet `u ∘ Φ ∈ W^{1,p}_loc(Ω')` for every `u ∈ W^{1,p}_loc(Ω)`, with `D(u ∘ Φ)(z) = Du(z²) ∘ (2z·)`.

**Repair:** In both files, require only "`C¹` on `Ω'` with invertible derivative at every point", drop `hinj` (the statement without it elaborates at this head), and add `z ↦ z²` on `ℂ ∖ {0}` as a Check.

## R15 (P3) — Two sentences of the pull-request description are contradicted by the pin

**Location:** The description's sentences "Existing Euclidean weak derivatives and the manifold measure, differential-form, and bundle APIs are named suppliers" and "The ownership boundaries preserve the existing planar Sobolev classes, extend the first-order trivial-bundle carrier in place".

**Claim:** The planar classes and the bundle carrier do not exist at the pinned Tau Ceti.

**Witness:** Tau Ceti `2fd255d` has no `TauCeti.MemLpLoc`, `TauCeti.MemWkpLoc` or `TauCeti.SobolevSection` (R01).

**Repair:** "Euclidean weak derivatives (`TauCeti.HasWeakFDerivOn`) and the manifold null-set, Riemannian-volume and differential-form APIs at the Tau Ceti pin are named suppliers. The planar local classes (PseudoholomorphicCurveAnalysis §1.1) and the bundle Sobolev carrier (PseudodifferentialOperators §5.2) are roadmap targets: this roadmap generalizes the first and extends the second to trivial Banach fibres."

## Previous findings

- R01 — not repaired (R01 here): `README.md:272` still lists "The planar classes `TauCeti.MemLpLoc`, `TauCeti.MemWkpLoc` and their API in `TauCeti/Analysis/Sobolev/Local/`"; "Existing code to refactor" (line 322) remains.
- R02 — not repaired (R02 here): `README.md:253` "locality `TauCeti.hasWeakFDerivOn_iff_locally`, `TauCeti.hasWeakFDerivOn_iSup_iff`, `TauCeti.exists_hasWeakFDerivOn_iSup` (`Local.lean`)".
- R03 — not repaired (R03 here): `README.md:792` "a member whose weak differential agrees almost everywhere with a continuous family that is the `mfderiv` of `f` at every point is `C¹`".
- R04 — not repaired (R04 here): `Suggested.lean:31–33` "Not stated here: … the controlled extrinsic space and finite-dimensional degree (Layers 10–11)"; there is no density, radial or uniqueness theorem.
- R05 — not repaired (R07 here): no theorem-level or page-level locator was added; References still lack Hajłasz 2009.
- R06 — not repaired (R08 here): `README.md:1387` "(Heikkilä–Pankka, Remark 2)"; `Suggested.lean:225` the same.
- R07 — not repaired (R09 here): `orientedJacobian_mul_volumeForm` (`Suggested.lean:371`) and `orientedJacobian_neg_left` (`:383`) remain.
- R08 — not repaired (R10 here): `IsPositiveContinuousDensityMeasure` (`:141`), `sobolevPullback` (`:213`) and `IsSmoothRetractiveEmbedding` (`:238`) remain unused.
- R09 — not repaired (R11 here): `Suggested.lean:11` "The statements here suggest Lean forms for particular milestones"; the changed lines 25–29 still name `TauCeti.MemLpLoc`.
- R10 — not repaired (R12 here): `README.md:773` "`weakMfderiv f` as a chosen one"; lines 1299 and 1683 unchanged.
- R11 — not repaired (R13 here): `README.md:678` "the function `1` is in `L^p_loc` but not in `Lᵖ` of the volume"; the seven sections still have two Checks.
- R12 — not repaired (R14 here): `README.md:484` "an injective `Φ : E → E`"; `Suggested.lean:84` `(hinj : InjOn Φ Ω')`.
- R13 — not repaired (R15 here): the description is unchanged, and both sentences remain.

## Verified sound

| Target | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.1 Haar and linear-equivalence transport | `L(x) = 2x` on `ℝ`; `2·volume`; `u = |x|^{−1/2}` | `∫_{−1}^{1}|y/2|^{−p/2}dy = 2^{p/2}∫_{−1}^{1}|y|^{−p/2}dy`, finite iff `p < 2` both sides; `‖u‖_{Lᵖ(K,2vol)} = 2^{1/p}‖u‖_{Lᵖ(K)}` | holds | — |
| §1.1 max-norm Check | `ℝ × ℝ` with sup norm vs `EuclideanSpace ℝ (Fin 2)` | `‖x‖_∞ ≤ ‖x‖₂ ≤ √2‖x‖_∞`, so the same compacts; `#synth` finds `instIsAddHaarMeasureProdRealVolume` | holds | — |
| §1.2 Check `u = |x|` | sup norm, `x = (1, 1/2)`, `h = (0, 1)` | `Du = dx₁`, `Du(h) = 0`; `⟨x/‖x‖_∞, h⟩ = 1/2`; Euclidean `⟨x/‖x‖₂, h⟩ ≈ 0.447` | false for normed `E` | R06 |
| §2.5 normed `E₀` | `θ(x, t) = x`, `E₀ = ℝ × ℝ` with sup norm | `D(u∘θ)(h, s) = Du(x)h`; `θ⁻¹{0} = {0} × ℝ`, product measure `0` | holds | — |
| §3.1 Riemannian weight | `E = ℝ`, `volume = 2·Lebesgue`, `g = dt²` | weight `1/2` vs `√det g = 1`; Tau Ceti's chart volume uses `(Module.finBasis ℝ E).addHaar` | off by the Haar constant | R06 |
| §4.2 some-atlas clause | `f = |t|^{1/2}`; target chart `exp`; a family covering only `ℝ ∖ {0}` | `(e^{|t|^{1/2}})′ ~ |t|^{−1/2}/2`: in `L^p_loc` iff `p < 2`, as for `id`; off `0`, a member for every `p` | holds; the covering hypothesis is needed and stated | — |
| §6.2 chart formula | `id: (ℝ,dt²) → (ℝ,e^{2t}dt²)`; `(ℝ,o) → (ℝ,−o)` with `ψ = −y`; `volume = 2·Lebesgue`; `n = 0` | `eᵗ` both sides; `det = −1 = J`; weights `1/2`, `eᵗ/2`, ratio `eᵗ`; `n = 0`: `J = 1`, as in §6.1 | holds | — |
| §7.1 `‖Df‖ = ‖Du‖`, `J_f = det Du` | `E = ℝ²` with sup norm, `u = x₁ + x₂`, `F = ℝ` | `‖Du‖ = 2` (sup norm) vs `√2` (Euclidean "flat metric"); `J_f` needs a metric that `E` lacks | ill-posed for normed `E` | R05 |
| Changed binders in `Suggested.lean` | `#check @` on 10 declarations; `comp_submersion` with `E₀` | theorems carry `[BorelSpace E] [volume.IsAddHaarMeasure]`; definitions keep only `[MeasureSpace E]`, which their bodies need | holds | — |
| §1.1–§1.2 suppliers | grep at Tau Ceti `2fd255d` | `MemLpLoc`, `SobolevSection`, `exists_hasWeakFDerivOn_iSup`: 0 each; `hasWeakFDerivOn_iff_forall_isCompact_closure`: `Local.lean:71` | absent | R01, R02 |
| §1.2 `memW1pLoc_iSup_iff` | empty index | `⨆ ∅ = ⊥`: both sides true | holds | R02 |
| §4.4 converse | `t ↦ t|t|`; the hypothesis "continuous family = `mfderiv f` everywhere" | weak derivative `2|t|` is continuous; the hypothesis already gives `C¹`; CVS Prop. 1.1 needs only continuity | vacuous | R03 |
| End theorem 7, `x/|x|` | `n = 2`, `p = 1`; `p = n` | `∫_{B²}|x|^{−1} = 2π < ∞`; `∫_{Bⁿ}|x|^{−n} = ∞` | statable, absent | R04 |
| End theorems 1 and 6, uniqueness | `f = |t|`; colocal `u = 1/x`, `u(0) = 0` | two weak differentials differ only on `{0}`, which is null; `Du = −x^{−2}` off `0` | statable, absent | R04 |
| §6.1 `orientedJacobian_neg_left` | `A = id` on `ℝ²` | `J_{−o,o}(id) = −1 = −J_{o,o}(id)`; `simp` closes the theorem | padding | R09 |
| §2.2 injectivity | `z ↦ z²` on `ℂ ∖ {0}` | `Φ(1) = Φ(−1)`; `D(u∘Φ)(z) = Du(z²)∘(2z·)`, `|det| = 4|z|² ≠ 0` | holds without injectivity | R14 |
| §3.2 Check | `p = ∞`, metric `e^{2x}dx²` | `‖1‖_{L^∞(eˣdx)} = 1 < ∞`; for `p < ∞`, `∫ eˣ dx = ∞` | false at `p = ∞` | R13 |
| §4.8 radial Check | `n = 1` | `x/|x| = sign x` into `S⁰`; the probe `φ(1) = 1`, `φ(−1) = 0` gives a jump | false at `n = 1` | R13 |
| §9.1 locator | HeikkilaPankka2025 | Remark 1.6 (line 189), §7.1 (line 874), §7.2 (line 898); no Remark 2 | locator absent | R08 |

- The rows for statements that the change does not touch stand as in the previous review, of 99c2648.
- Gate at e5a08ce: every check passes (the worker's run includes the targeted build; a rerun here also passes). Dependency check: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`. No files changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` reports 19 `sorry` warnings and nothing else. The scratch probes also elaborate: R04's four statements (the two uniqueness theorems at their proposed places: 21 `sorry` warnings, no error), R14's statement without `hinj`, R09's `simp` closure, and the instances for the sup norm on `ℝ × ℝ`.
- Library declarations opened at the pins (12): Tau Ceti `Measure.lean:36` (`IsNullSet`, normed `E`, every Haar measure), `VolumeDensity/Volume.lean:58, 82`, `VolumeDensity/Measure.lean:113`, `Orientation/Basic.lean:26`, `WeakDeriv/Basic.lean:251`, `Classical.lean:41, 138`, `Wkp/Basic.lean:83` (inner product, as §1.1 now says); Mathlib `Group/Measure.lean:903`, `Haar/Basic.lean:668`.
- Tau Ceti names: the 15 names of R01–R02 were recounted at the pin, and each still has 0 occurrences.
- Source locators checked against the text (6): ConventVanSchaftingen2016 line 196; HeikkilaPankka2025 lines 189, 874, 898; Hajlasz2009 lines 129, 227.
- Cross-roadmap citations resolved: QuasiregularMaps, at its open head, cites §1.2, §3.1, §4.2–§4.5, §5.1–§5.3, §6.1–§6.3 and §7.1, and no heading changed. R01's owners exist on main: PseudoholomorphicCurveAnalysis §1.1 (line 213), PseudodifferentialOperators §5.2 (line 967), RiemannianGeometry R4.6, DifferentialGeometry Layer 10.
- Overlap check: read QuasiregularMaps, YangMillsConnectionsAndCaloricGauge and DeRhamCohomologyAndDuality (open), and DifferentialGeometry, PseudoholomorphicCurveAnalysis and CalibratedGeometry (main). Shared objects and their owners:
  - Jacobian chart formula: this roadmap, §6.2 (QuasiregularMaps consumes it);
  - Riemannian chart volume: Tau Ceti `TauCeti.riemannianVolume`;
  - planar classes: PseudoholomorphicCurveAnalysis §1.1 (R01).

  SobolevDifferentialForms and RiemannianGeometry were named without checkouts, so they were not rechecked this round.

## Not verifiable

- Lee 2012, Ch. 15 (proposed in R07 for §6.2's chart formula): settled as uncertified in the manifest, so the chapter locator was not checked against the text.
- Schoen–Uhlenbeck 1983 and the Annals numbering of Heikkilä–Pankka: unchanged since the previous review, where no legal copy was found.

## Source issues

- none
