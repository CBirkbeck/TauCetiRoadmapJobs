# Review of SobolevMapsBetweenManifolds (pull request #2230 at 99c2648)

**Verdict:** needs changes

## R01 (P1) — Supplier contracts cite Tau Ceti code that does not exist at the pin (objects owned by roadmaps on main)

**Location:** `TauCetiRoadmap/SobolevMapsBetweenManifolds/README.md:266` "The planar classes `TauCeti.MemLpLoc`, `TauCeti.MemWkpLoc` and their API in `TauCeti/Analysis/Sobolev/Local/`"; likewise lines 101, 107, 286–295, 318–328, 1188, 1635–1637; `Suggested.lean:26`.

**Claim:** These are presented as existing Tau Ceti declarations (and as "Existing code to refactor"). None of them exists at the pinned Tau Ceti `2fd255d`. Each object is still a target of a roadmap on main.

**Witness:** At the pin, `grep -rw` finds 0 occurrences of `MemLpLoc`, `MemWkpLoc`, `SobolevSection`, `FiniteBundleAtlas`, `isNullSet_iff_riemannianVolume_eq_zero`, `toHomologicalOrientation`, `degree_toHomologicalOrientation`. There is no `Analysis/Sobolev/Local/` and no `LocalHomology/Degree.lean`.

**Repair:** Cite the owners and drop the Tau Ceti names:
- planar classes → PseudoholomorphicCurveAnalysis §1.1;
- bundle carrier → PseudodifferentialOperators §5.2;
- chartwise and Riemannian null sets → RiemannianGeometry R4.6;
- degree of continuous maps → DifferentialGeometry 10.4–10.5 (the only degree at the pin is `TauCeti.degreeAtRegularValue`).

Then make these edits:
- Delete "Existing code to refactor".
- §1.1: "Define for `E` the classes that PseudoholomorphicCurveAnalysis §1.1 plans for `ℂ`; its classes are the case `E = ℂ`."
- §7.3: "Extend the carrier of PseudodifferentialOperators §5.2 to trivial Banach fibres."
- Layer 11: delete the `HomologicalOrientation` sentence.
- `Suggested.lean`: delete line 26's reference.

## R02 (P1) — Supplier contracts cite Tau Ceti lemmas that do not exist at the pin and that no roadmap owns

**Location:** `README.md:246–252` "`TauCeti.hasWeakFDerivOn_iff_locally`, `TauCeti.hasWeakFDerivOn_iSup_iff`, `TauCeti.exists_hasWeakFDerivOn_iSup` … `TauCeti.HasWeakFDerivOn.contDiffOn_comp` (`ChainRule.lean`), already stated for Banach-valued inner and outer maps"; also lines 256, 269, 287.

**Claim:** The routes of §1.2 (sheaf property), §2.1(a), §2.2, §3.3 and §7.3 (the `H¹` comparison) rest on declarations that do not exist and that no supplier owns.

**Witness:** The pin has 0 occurrences of `hasWeakFDerivOn_iff_locally`, `hasWeakFDerivOn_iSup_iff`, `exists_hasWeakFDerivOn_iSup`, `hasWeakFDerivOn_iff_coordinates`, `contDiffOn_comp`, `comp_contDiffOn_diffeo`, `isNullSet_image_of_forall_addHaar_image_extChartAt` or `SobolevH1`. There is no `WeakDeriv/ChainRule.lean`.

**Repair:** Delete these from "From Tau Ceti" and state each as this roadmap's own target, with a route from what the pin has:
- §1.2's sheaf property: from `TauCeti.hasWeakFDerivOn_iff_forall_isCompact_closure` (`WeakDeriv/Local.lean:71`) and a countable subcover.
- §2.1(a) and §2.2: by the §2.3 mollification routes. Remove "already stated".
- §3.3: from `TauCeti.IsNullSet.chartwise` (`Measure.lean:50`) and Mathlib `addHaar_image_eq_zero_of_differentiableOn_of_addHaar_eq_zero`.
- §7.3's `TauCeti.Manifold.SobolevH1` bullet: cut it, or cite Yamabe Y1's `H¹` carrier.

## R03 (P1) — The §4.4 converse assumes its conclusion

**Location:** `README.md:779–781` "a member whose weak differential agrees almost everywhere with a continuous family that is the `mfderiv` of `f` at every point is `C¹`".

**Claim:** A map that is differentiable at every point with a continuous derivative is `C¹` by definition, so this converse is vacuous. The intended converse (a continuous weak differential forces `C¹`) is lost.

**Witness:** `TauCeti.HasWeakFDerivOn.fderiv_eq_of_continuousOn` (`WeakDeriv/Classical.lean:138`) needs only a continuous weak derivative of a continuous function. Convent–Van Schaftingen (arXiv 1312.5858v1), Prop. 1.1, p. 4, is the manifold form.

**Repair:** "Prove conversely that a member whose weak differential agrees almost everywhere with a family `Φ` that is continuous in charts is `C¹`, with `mfderiv f x = Φ x` at every `x` (Convent–Van Schaftingen, Prop. 1.1, p. 4); in charts, `TauCeti.HasWeakFDerivOn.fderiv_eq_of_continuousOn`."

## R04 (P2) — Headline theorems that are statable at the pins are absent from `Suggested.lean`

**Location:** `Suggested.lean:29–31` "Not stated here: … the controlled extrinsic space and finite-dimensional degree (Layers 10–11)"; `README.md:43–47` (density for `p ≥ dim M`; the `x/|x|` obstruction).

**Claim:** Two end theorems can be stated with the pinned APIs and the file's own `MemW1pLocM`, but are not stated: Schoen–Uhlenbeck density for compact finite-dimensional targets, and non-density at `x/|x|` for `n − 1 ≤ p < n`. The same holds for almost-everywhere uniqueness of the weak and colocal differentials (end theorems 1 and 6).

**Witness:** The two statements below elaborate with only `sorry` warnings in a scratch copy of the file, which adds `import TauCeti.Geometry.Manifold.Measure`.

**Repair:** Add the two statements (adding the import), plus uniqueness theorems next to `IsSobolevMap.exists_hasWeakMFDeriv` and `exists_hasColocalWeakMFDeriv`:

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

-- in its own section, as tested:
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]
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
```

## R05 (P3) — The sampled targets carry no source locators

**Location:** §2.2, §3.2, §3.3, §4.4, §4.5, §5.2, §5.3, §6.2, §7.1, §7.3, §9.2 have none. Two name authors only: `README.md:1570` "(Schoen–Uhlenbeck when the target is compact and finite-dimensional)" and `README.md:1486` "Wockel's chartwise relative smoothing framework".

**Claim:** No claim in the README has a theorem- or page-level locator. Twelve of the fifteen sampled sections have none, and §5.4's "§§1–2" is section-level only.

**Witness:** Hajlasz2009, the manifest's certified source, states §10.3 as Thm 2.1 (Hajlasz2009 line 129, p. 188) and §11.3 as Thm 2.3 (Hajlasz2009 line 227, p. 189). It is absent from References. Wockel's theorem is Thm 0.11 (arXiv v1, p. 4).

**Repair:** Add Hajłasz 2009 to References and put locators at the claims:
- §10.3: "(Hajłasz 2009, Thm 2.1, p. 188, with its proof for `p = n`)";
- §11.3: "(Hajłasz 2009, Thm 2.3, p. 189)";
- §2.3's oscillation bound: "(Hajłasz 2009, (2.1), p. 188)";
- §9.3: "(Wockel, Thm 0.11)";
- §4.7–§4.8: "(Convent–Van Schaftingen, Def. 1.1, Prop. 1.2 p. 5, Prop. 1.5 p. 6, Prop. 1.8 p. 7)";
- §5.4: "(Def. 2.1, p. 8)";
- §2.4: "(Arendt–Kreuter, Thm 6.2)";
- §2.1(b): "(Arendt–Kreuter, Thm 4.2)".

Give each remaining target a textbook locator.

## R06 (P3) — The Heikkilä–Pankka locator is not in the text on record

**Location:** `README.md:1368` "(Heikkilä–Pankka, Remark 2)"; `README.md:1754` "§2 and Remark 2 (the definition of `W^{1,n}_loc(M, N)` and its equivalence with the Nash-embedding definition)".

**Claim:** Neither the cited remark nor the cited section contains a definition or an equivalence in the version the manifest records (arXiv v2).

**Witness:** HeikkilaPankka2025 has Remarks 1.6, 7.1 and 7.2 only. §2 (line 266) reduces Thm 1.1 to Thm 1.3. The class is named on p. 1 (line 23), and a Nash embedding appears only in the proof of Prop. B.1 (line 1328).

**Repair:** "(Heikkilä–Pankka, arXiv 2302.11440v2, p. 1, and the proof of Prop. B.1, p. 24)". State the equivalence as this roadmap's §9.1 theorem, and cite the extrinsic definition as Hajłasz 2009, §2, p. 187.

## R07 (P3) — Padding in `Suggested.lean`

**Location:** `Suggested.lean:368–369` "§6.1: the defining identity. -/ theorem orientedJacobian_mul_volumeForm"; `Suggested.lean:381` `orientedJacobian_neg_left`.

**Claim:** The first theorem restates the definition, and the second closes in one tactic.

**Witness:** In a scratch copy, `simp [orientedJacobian, Orientation.volumeForm_neg_orientation, div_neg]` closes `orientedJacobian_neg_left`. Its four siblings do not close with `simp [orientedJacobian]`.

**Repair:** Delete both theorems from `Suggested.lean`; the README §6.1 bullets keep the statements.

## R08 (P3) — Definitions that no stated theorem uses

**Location:** `Suggested.lean:139` `IsPositiveContinuousDensityMeasure`, `:211` `sobolevPullback`, `:236` `IsSmoothRetractiveEmbedding`.

**Claim:** `Suggested.lean` may carry only the definitions that a stated headline needs, and these three are used by no theorem. `IsPositiveContinuousDensityMeasure` also omits the Borel structure that README §3.1 assumes.

**Witness:** grep finds each name only on its definition line. The elaborated type of `IsPositiveContinuousDensityMeasure` has `[MeasurableSpace M]` but no `[BorelSpace M]`.

**Repair:** Delete the three definitions (README §3.1, §8.1 and §9.2 keep them). Alternatively, keep each one together with a headline that uses it, with `[BorelSpace M]` added to the first.

## R09 (P3) — The module docstring frames the file as a catalogue and omits the missing carriers

**Location:** `Suggested.lean:11–13` "The statements here suggest Lean forms for particular milestones, so that contributors and reviewers converge on names and signatures"; `:29–33`.

**Claim:** The file is the acceptance test, which states the headline theorems. The docstring lists omitted layers without naming, for each, the carrier missing at the pins.

**Witness:** Lines 29–31 list Layers 5, 6, 8 and 10–11 as "Not stated here" and name no missing declaration. Line 26 names `TauCeti.MemLpLoc`, which is absent at the pin (R01).

**Repair:** Replace lines 10–33 with: "The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. Not statable at the pins: the degree of continuous and `W^{1,n}` maps (Layer 11; there is no degree of continuous maps between closed oriented manifolds, DifferentialGeometry 10.5); the weak exterior derivative of `V`-valued forms (Layer 8; there is no Bochner top-form integral, §8.2); …". Name each omitted headline with its missing carrier.

## R10 (P3) — The README backticks roadmap names that `Suggested.lean` does not declare

**Location:** `README.md:760` "`weakMfderiv f` as a chosen one"; `README.md:1280` "(`HasWeakMExtDeriv α β`)"; `README.md:1664` "(`sobolevDegree`)".

**Claim:** A backticked name of this roadmap's own claims a declaration in `Suggested.lean`, and these three have none.

**Witness:** grep of `Suggested.lean` finds 0 occurrences of `weakMfderiv`, `HasWeakMExtDeriv` and `sobolevDegree`.

**Repair:** Write them in prose without backticks ("a chosen weak differential", "`β` is a weak exterior derivative of `α`", "the degree `deg u`"), or declare each with the headline that needs it.

## R11 (P3) — Some definitions have too few Checks, and two Checks fail at boundary parameters

**Location:** §3.2, §4.1, §4.3, §4.7, §4.8, §9.2 and §11.2 have two Checks each. `README.md:667` "the function `1` is in `L^p_loc` but not in `Lᵖ` of the volume"; `README.md:906` "The radial map `x ↦ x/|x|` into `S^{n−1}` … is colocal".

**Claim:** Seven definitions have fewer than the three Checks required. The §3.2 Check is false at `p = ∞` and the §4.8 Check is false at `n = 1`.

**Witness:** `‖1‖_{L^∞(eˣdx)} = 1 < ∞`. For `n = 1`, `x/|x| = sign x` into `S⁰`, and a probe with `φ(1) ≠ φ(−1)` turns it into a jump that is not in `W^{1,1}_loc`.

**Repair:** Write "for `p < ∞`" and "for `n ≥ 2`", and add a third discriminating Check to each listed section:
- §4.3: "the zero family is not a weak differential of `t ↦ t`";
- §4.7: "`sign x` on `ℝ` is not colocal into `ℝ`";
- §9.2: "`t ↦ (t, t²)` with `r(z) = z₁` on `U = ℝ²` is retractive";
- §11.2: "the antipodal map of `S²` has degree `−1`";
- §3.2, §4.1 and §4.8: one each in the same style.

## R12 (P3) — §2.2's injectivity hypothesis differs between README and Lean, and is not needed

**Location:** `README.md:474` "an injective `Φ : E → E` that is `C¹` on `Ω'`"; `Suggested.lean:82` `(hinj : InjOn Φ Ω')`.

**Claim:** The two files state different hypotheses, and neither is needed. The conclusions are local, and `Φ` is injective near each point of `Ω'`.

**Witness:** `Φ(z) = z²` on `Ω' = Ω = ℂ ∖ {0}` is not injective, yet `u ∘ Φ ∈ W^{1,p}_loc(Ω')` for every `u ∈ W^{1,p}_loc(Ω)`, with `D(u ∘ Φ)(z) = Du(z²) ∘ (2z·)`.

**Repair:** In both files, require only "`C¹` on `Ω'` with invertible derivative at every point", drop `hinj`, and add `z ↦ z²` on `ℂ ∖ {0}` as a Check.

## R13 (P3) — Two sentences of the pull-request description are contradicted by the pin

**Location:** The description's sentences "Existing Euclidean weak derivatives and the manifold measure, differential-form, and bundle APIs are named suppliers" and "The ownership boundaries preserve the existing planar Sobolev classes, extend the first-order trivial-bundle carrier in place".

**Claim:** The planar classes and the bundle carrier do not exist at the pinned Tau Ceti.

**Witness:** Tau Ceti `2fd255d` has no `TauCeti.MemLpLoc`, `TauCeti.MemWkpLoc` or `TauCeti.SobolevSection` (R01).

**Repair:** "Euclidean weak derivatives (`TauCeti.HasWeakFDerivOn`) and the manifold null-set, Riemannian-volume and differential-form APIs at the Tau Ceti pin are named suppliers. The planar local classes (PseudoholomorphicCurveAnalysis §1.1) and the bundle Sobolev carrier (PseudodifferentialOperators §5.2) are roadmap targets: this roadmap generalizes the first and extends the second to trivial Banach fibres."

## Verified sound

| Target | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 2.2 change of variables | `Φ=2x`; `Φ=exp`, `Ω'=ℝ`; `z²` on `ℂ∖{0}` | `‖u∘Φ‖_{Lᵖ(K)}=2^{−n/p}‖u‖_{Lᵖ(2K)}`, `D(u∘Φ)=2Du(2x)`; `exp′` unbounded, local; `z²` non-injective, still member | holds; injectivity unused | R12 |
| 3.2 local `Lᵖ` | `1` on `(ℝ, e^{2x}dx²)`; `|x|^{−1/2}` | `∫eˣdx=∞` for `p<∞`, but `‖1‖_∞=1`; `∫|x|^{−p/2}<∞` iff `p<2` | Check false at `p=∞` | R11 |
| 3.3 null sets under `C¹` maps | `t↦e^{2πit}`; constant `ℝ→ℝ` | preimage of a point is `ℤ`, measure `0`; preimage of `{c}` is `ℝ`, measure `∞` | holds | — |
| 4.4 `C¹` members | `t↦t|t|`; converse | derivative `2|t|` continuous equals weak derivative; "continuous `Φ = mfderiv f` everywhere" already gives `C¹` | converse vacuous | R03 |
| 4.5 restriction, locality | `t↦(cos t, sin t)` into `ℝ²∖{0}` | `|f|=1≠0`, smooth; member into `ℝ²` and `ℝ²∖{0}` | holds | — |
| 5.2 `Lᵖ` characterization | `|t|^{1/2}`; `(cos t, sin t)` | `‖Df‖=1/(2|t|^{1/2})`, `∫_{−1}^{1}|t|^{−p/2}<∞` iff `p<2`; `‖Df‖=1` | holds | — |
| 5.3 comparison | `g′=4dx²`, `f=id` into `(ℝ,dx²)` | `‖Df‖′=|v|/(2|v|)=1/2` vs `‖Df‖=1`; factor `C^{1/p}ab`, lower `c^{1/p}/(ab)` | holds | — |
| 5.4 energy classes | `u=x`, `u(0)=1` into `ℝ∖{0}`; `g=sign` | probes vanish near `0`, so `φ∘u=φ` off `{0}`: colocal; `sign∘u` jumps: not colocal | Check discriminates | — |
| 6.1 oriented Jacobian | `diag(2,1)`; `diag(−1,1)` to `(ℝ²,−std)`; `n=0` | `J=2<4=‖A‖²`; `J=+1`; `J=(±1)/(±1)`, `normDet=1` | holds | R07 |
| 6.2 Jacobian of a map | `z²`; `id:(ℝ,dx²)→(ℝ,4dx²)` | `J=|2z|²=4|z|²`; `ρ_N=2`, `ρ_M=1`, `J′=2` | holds | — |
| 7.1 Euclidean domains | fold; `−o` on target | `Du=diag(sign x₁,1,…)`, `‖Du‖=1`, `det=sign x₁`; `J=−det` | holds | — |
| 7.3 bundle carrier | `|sin θ|^{1/2}` on `S¹`; constant `1` | derivative `~|θ|^{−1/2}/2 ∈ Lᵖ` iff `p<2`; `‖1‖_p=vol^{1/p}` | holds; carrier absent at pin | R01, R02 |
| 9.2 retractive embeddings | `S^{m−1}⊆ℝ^m`; `S(ℓ²)` | `d(z/|z|)` at `|z|=1` is `I−zzᵀ`; `v−⟪y,v⟫y`; `S(ℓ²)` not locally compact | holds; two Checks | R11 |
| 9.3 relative approximation | `|t|` at `p=∞`; Wockel Thm 0.11 with `L=M`, `U=M∖cl V′` | any `C¹` `g`: `ess sup|g′−sign| ≥ 1` near `0`; Thm 0.11 gives `τ=f` on `cl V′`, smooth | holds for `p<∞` | R05 |
| 10.3 density `p ≥ n` | `θ=χ log log(1/|x|)` on a surface; Hajłasz Thm 2.1 | `∫₀ dr/(r log²(1/r))<∞`: discontinuous `W^{1,2}` map; Thm 2.1 says `p>n`, its proof covers `p=n` | holds | R04, R05 |
| End theorem 1: class, `C¹`, chain rules | `f=|t|^{1/2}`, `g=y²`; projection `M×ℝ→M` | member iff `p<2`; `g∘f=|t|`, `2|t|^{1/2}·sign t/(2|t|^{1/2})=sign t`; extra-variable derivative `0` | holds | — |
| End theorem 2: `‖Df‖` and Hadamard | `f=|x|^{−1/2}x` on `ℝ²` | `‖Df‖=|x|^{−1/2}∈L^p_loc` iff `p<4`; `J=|x|^{−1}/2∈L^q_loc` iff `q<2` | holds, sharp | R09 |
| End theorem 3: pullback commutes with `d` | `ω=y₁dy₂`; `α=sign(x₁)dx₁` | `f^♯dω=J_f dx₁∧dx₂`; `∫sign(x₁)∂₂φ=0`, so weak `d=0`; sign `(−1)^{k+1}` | holds | — |
| End theorem 4: split immersions | figure-eight `ι`, `f=π` (`t≤0`), `t` (`t>0`); `(x_j)↦(x_j/j)` | `ι∘f` Lipschitz, `f` discontinuous; range not closed, no left inverse | holds with continuity | — |
| End theorem 5: approximation | `e^{iφ}`, `φ_j` mollified; `|t|` at `p=∞` | `e^{iφ_j}→e^{iφ}` in `W^{1,p}_loc`; `p=∞` fails | holds | — |
| End theorem 6: colocal differential | `u=1/x`, `u(0)=0` | `φ∘u=0` near `0` off `{0}`: colocal; `∫_{−1}^{1}|x|^{−1}=∞`, so `u∉L¹_loc` | holds (CVS Prop. 1.2) | R04 |
| End theorem 7: density, `x/|x|` | `n=2`, `p=1`; `p=n` | `∫_{B²}|x|^{−1}=2π<∞`; `∫_{Bⁿ}|x|^{−n}=∞` | holds (Hajłasz Thm 2.3) | R04 |
| End theorem 8: degree | `zᵏ` on `S¹`; `|x|^{a−1}x` on `Sⁿ`, `0<a<1` | `∫f^♯dθ=2πk`; `‖Df‖ⁿ~|x|^{n(a−1)}` integrable iff `a>0`; `∫J=vol(Sⁿ)` | holds | R01, R09 |
| §1.2 sheaf, `memW1pLoc_iSup_iff` | empty index; uncountable cover | `⨆∅=⊥`: both sides true; Lindelöf subcover glues `Du` | holds; cited supplier absent | R02 |
| §4.8 radial Check | `n=1` | `x/|x|=sign x` into `S⁰`; `φ(1)≠φ(−1)` gives a jump | false at `n=1` | R11 |

- Gate re-run at 99c2648: every check passes. Dependency check: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` reports 19 `sorry` warnings and nothing else. In the `#check @` signatures, the five flagged binder drops are on definitions whose bodies do not need them.
- One-tactic probe: tried on the six §6.1 theorems; one closes (R07). The R04 statements elaborate in a scratch copy.
- Source locators checked against the text (16): Hajlasz2009 lines 129, 138–182, 227, 801; HeikkilaPankka2025 lines 23, 189, 266, 1328; Convent–Van Schaftingen Def. 1.1 and Props. 1.1, 1.2, 1.5, 1.8 and Def. 2.1; Wockel Thm 0.11; Arendt–Kreuter Thms 4.2 and 6.2.
- Mathlib declarations opened at the pin (15): `Jacobian.lean:556, 1184`; `Submersion.lean:172`; `Immersion.lean:191, 489`; `ImmersionDiff.lean:65, 165`; `WhitneyEmbedding.lean:132`; `SmoothApprox.lean:104`; `Orientation.lean:198, 223, 245`; `NormDet.lean:69, 389`; `HaarToSphere.lean`.
- Tau Ceti: 48 cited names checked, 17 absent (R01, R02); the rest exist, e.g. `WeakDeriv/Basic.lean:251, 856`, `Classical.lean:138`, `Interval.lean`, `Measure.lean:36, 72, 89`.
- Cross-roadmap citations resolved on main: PDE 1.2, 1.4, 1.5; PseudoholomorphicCurveAnalysis 1.1, 4.1; PseudodifferentialOperators 5.2; Yamabe Y1; RiemannianGeometry R4.6, R6; DifferentialGeometry 2, 5, 10.4–10.5, 12. QuasiregularMaps' six gaps cite §1.2, 3.1, 4.2–4.6, 5.1–5.3, 6.1–6.3 and 7.1, and all of these exist here.
- Overlap check: read QuasiregularMaps, YangMillsConnectionsAndCaloricGauge, SobolevDifferentialForms, Surfaces, RiemannianGeometry, DifferentialGeometry, PseudoholomorphicCurveAnalysis and CalibratedGeometry. Shared objects and their owners:
  - planar `MemLpLoc`/`MemWkpLoc`: PseudoholomorphicCurveAnalysis §1.1 (this roadmap owns the generalization to `E`; R01);
  - bundle `W^{k,p}` carrier: PseudodifferentialOperators §5.2;
  - null sets: RiemannianGeometry R4.6;
  - continuous degree: DifferentialGeometry 10.5;
  - Euclidean weak `d`: SobolevDifferentialForms §2.1 (§8.2 here is the manifold, Banach-valued variant);
  - YangMills Layer 2 (Euclidean `G`-valued density): not shared.

## Not verifiable

- Heikkilä–Pankka, Ann. of Math. 201 (2025): only arXiv v2 was read; the Annals numbering ("Remark 2") cannot be checked, because the journal version is not openly available.
- Schoen–Uhlenbeck 1983, §4 (§10.3, §11.3): the DOI 10.4310/jdg/1214437663 landing page has no PDF, and no legal copy was found.
- Ziemer 1989, Ch. 2 and Rickman 1993, Ch. I: settled as uncertified in the manifest.
- Iwaniec–Martin 2001, Hajłasz–Iwaniec–Malý–Onninen 2008, Hélein–Wood 2008, Bethuel–Zheng 1988, Brezis–Nirenberg 1995, Marcus–Mizel 1979, Hencl 2011: outside the sample, books or paywalled journals; not read.

## Source issues

- **Misprint** in Hajlasz2009 at Theorem 2.1, p. 188: the source states density of smooth maps only for `p > dim M`; it should read `p ≥ dim M`, since its own proof treats `p = n` and p. 203 cites the theorem for `W^{1,n}`; affects nothing.
