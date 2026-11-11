<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12769#issuecomment-6795016733 -->
Review (claude) of bdea305

Verdict: needs_changes

1. **F01** (P3) The defining sentence of §1.1 has a broken emphasis and states the exponent twice

   **Location.** `packages/SobolevMapsBetweenManifolds/README.md:440`–441: "a set `s ⊆ X`, an exponent
   `p` and a map `g : X → B` into a normed group `B`, with any `p : ℝ≥0∞`, say that `g` is *locally
   `Lᵖ` on `s` *, written".

   **Claim.** The term "locally `Lᵖ` on `s`" is set in emphasis as the defined term.

   **Witness.** The closing `*` follows a space, so it is not a closing delimiter in Markdown: the
   paragraph renders two literal asterisks and no emphasis. The exponent is introduced twice ("an
   exponent `p`", "with any `p : ℝ≥0∞`").

   **Repair.** Replace lines 440–443 up to "written" by: "For a topological space `X` with a measure
   `μ`, a set `s ⊆ X`, an exponent `p : ℝ≥0∞` and a map `g : X → B` into a normed group `B`, say that
   `g` is *locally `Lᵖ` on `s`*, written". Tested on the instance: the closing `*` now follows a
   backtick, the paragraph has one opening and one closing delimiter, and `p` is bound once, with
   the type of `MemLpLoc` in `Suggested.lean:38`.

2. **F02** (P3) "Mathlib's theorem above" in the scope section refers to nothing

   **Location.** `packages/SobolevMapsBetweenManifolds/README.md:77`–79: "Equal-dimensional
   null-image preservation is Mathlib's theorem above, and increasing-dimensional null-image
   preservation is `DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank`".

   **Claim.** A Mathlib null-image theorem has been named earlier in the section.

   **Witness.** Lines 63–74 name `LinearMap.normDet`, `LinearIsometry.norm_toContinuousLinearMap_comp`,
   `LinearMap.isometryOfInner` and `exists_embedding_euclidean_of_compact` only. The null-image theorem
   first appears at line 235. The second declaration is Tau Ceti's
   (`TauCeti/Analysis/Calculus/Sard/LowDimension.lean:73`), which the sentence does not say.

   **Repair.** Write: "Equal-dimensional null-image preservation is Mathlib's
   `MeasureTheory.addHaar_image_eq_zero_of_differentiableOn_of_addHaar_eq_zero`, and
   increasing-dimensional null-image preservation is Tau Ceti's
   `DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank`". Tested: both names are the ones of
   §2.1's `*Needs:*` line (README:633–635) and exist at the pins
   (`Mathlib/MeasureTheory/Function/Jacobian.lean:556`; the Tau Ceti file above).

3. **F03** (P3) "How to read the build" contradicts the `*Needs:*` line of §3.2

   **Location.** `packages/SobolevMapsBetweenManifolds/README.md:432`: "Layers 1 and 3.1–3.2 can be
   built at once." And line 433: "Layer 6 needs Layers 4 and 5. Layer 7 needs Layers 4–6."

   **Claim.** §3.2 has no dependency on Layer 1, and Layers 6 and 7 use nothing of Layers 1–3
   directly.

   **Witness.** README:858: "*Needs:* §1.1, §3.1; …" for §3.2, whose statement is `L^p_loc` of §1.1
   with `s = M`. README:1377 and :1477: §6.2 and §6.4 need §3.1. README:1547: §7.1 needs §1.2 and §3.1;
   the Layer 7 `### Dependencies` (line 1560) says "Layers 1 and 3–6", the Layer 6 one (line 1493)
   "Layers 4 and 5".

   **Repair.** Line 432–434: "Layer 1 and §3.1 can be built at once. §3.2 needs §1.1 and §3.1. Layer 2
   needs Layer 1. §3.3 needs §2.1. Layer 4 needs Layers 1–3. Layer 5 needs Layers 3 and 4. Layer 6
   needs §3.1 and Layers 4 and 5. Layer 7 needs §1.2, §3.1 and Layers 4–6. Layer 8 needs Layers 2, 4
   and 5." Line 1493: "Layers 4 and 5; §3.1; …". Tested against every `*Needs:*` line: §3.1 cites no
   section of this roadmap; each section cited by §3.2, §6.2, §6.4 and §7.1 is now in the layer
   sentence of its layer; no other layer sentence changes.

4. **F04** (P3) §1.2 cites HeikkilaPankka2025 for a class those lines do not contain

   **Location.** `packages/SobolevMapsBetweenManifolds/README.md:492`–493: "(Ziemer1989 Ch. 2 §2.1;
   Mazya2011 §1.1; HeikkilaPankka2025 line 22–23)", after the definition of `W^{1,p}_loc(Ω; F)`.

   **Claim.** The cited lines support the definition of the vector-valued class on an open subset of
   a normed space.

   **Witness.** HeikkilaPankka2025 line 22–23 names `W^{1,n}_loc(M, N)` for a continuous map between
   oriented Riemannian `n`-manifolds, `n ≥ 2`, without defining it; no Euclidean class and no
   exponent other than `n` occurs. The manifest's `cited_for` of that key lists 4.2, 4.3, 5.1, 6.2,
   6.3 and 8.2, not 1.2; the one for Mazya2011 also lacks 1.2.

   **Repair.** In §1.2 keep "(Ziemer1989 Ch. 2 §2.1; Mazya2011 §1.1)" and delete the third locator;
   in `sources.toml` add "1.2 the local class on a domain" to the `cited_for` of Mazya2011. Tested:
   §4.2 (README:973) keeps HeikkilaPankka2025 line 22–23, where the manifold class is the object
   cited, and every locator of §1.2 is then in the manifest under its section.

5. **F05** (P3) §7.1 attaches the `ACL^p` definition to statements that never mention `ACL`

   **Location.** `packages/SobolevMapsBetweenManifolds/README.md:1512`: "Prove
   (MartioRickmanVaisala1969 line 124 and lines 332–340):", before the four bullets of T6.

   **Claim.** The source supports the bullets at both locators.

   **Witness.** MartioRickmanVaisala1969 lines 332–340 (2.16) define `ACL` maps (continuous,
   absolutely continuous on almost every segment parallel to the axes) and `ACL^p` (locally
   `Lᵖ` partial derivatives). The bullets speak of weak derivatives only; that a continuous map is
   `ACL^p` iff it has a weak derivative in `L^p_loc` is a theorem this roadmap neither states nor
   cites. Line 124 (the Jacobian `J(x, f)`) is used in the fourth bullet.

   **Repair.** Line 1512: "Prove (MartioRickmanVaisala1969 line 124, for the Jacobian):". After the
   first bullet add the sentence: "This is the class that MartioRickmanVaisala1969 lines 332–340
   describe as `ACL^p`; the equivalence of the two descriptions is not used here." Tested on
   `f(t) = |t|^{1/2}` on `ℝ`: continuous, absolutely continuous, derivative `sign(t)|t|^{−1/2}/2` in
   `L^p_loc` iff `p < 2` on both descriptions, so the sentence is true on the roadmap's standard
   example and claims no theorem.

6. **F06** (P3) The labels T1(a), T1(b), T1(c) are used in headings and never defined

   **Location.** `packages/SobolevMapsBetweenManifolds/README.md:547`: "### 1.3 Locality and gluing
   (T1(c))"; line 637: "(T1(a))"; line 735: "(T1(b))".

   **Claim.** The Summary, which gives "the labels by which consuming roadmaps cite them", defines
   parts (a), (b), (c) of T1.

   **Witness.** README:18–22 states T1 in four unlettered parts in the order sheaf, precomposition,
   postcomposition of continuous members, postcomposition with bounded derivative. §2.3, the fourth
   part, carries no label. A reader cannot tell which part is (c).

   **Repair.** Rewrite README:18–22 as: "**T1** (§1.3, §2.2–§2.4). On open subsets of
   finite-dimensional spaces, `W^{1,p}_loc` is preserved (a) by precomposition with `C¹` local
   diffeomorphisms (§2.2) and (b) by postcomposition of continuous members with `C¹` maps defined on
   an open set containing their values (§2.4), and (c) it is a sheaf (§1.3). It is also preserved by
   postcomposition of arbitrary members with `C¹` maps of bounded derivative (§2.3). Each comes with
   its almost-everywhere chain rule." Tested: the three headings then match the letters, no heading
   or section number changes, and `Suggested.lean`'s docstring ("T1 is locality and the three
   Euclidean chain rules") still agrees.

Six findings, all P3 (0 blocking). The five findings of round 2 are repaired. No statement of
`Suggested.lean` and no sampled README target was found false, vacuous or overclaimed; the file
elaborates with `sorry` as its only warning and nothing in it is padding. What remains is text:
one broken emphasis in a definition, one dangling reference, one build-order sentence that
contradicts a `*Needs:*` line, two locators attached to statements the cited lines do not make,
and three heading labels that are never defined.

## Round-2 findings, one by one

| Id | State | Repaired passage (quoted) |
| --- | --- | --- |
| F01 (P3) | repaired | README:591: "This agrees with §1.2's third Check." README:761: "Continuity is used: §2.3's fourth Check has `u = log |x|` discontinuous at `0`". The third Check of §1.2 (line 521) is `log |x|`; the fourth of §2.3 (line 724) is `e^{t²}`. |
| F02 (P3) | repaired | README:1514: "iff `f̃` is continuous on `Ω` and `f̃ ∈ W^{1,p}_loc(Ω; F)` for one, equivalently every, additive Haar measure `μ` on `E` (§1.2)"; new Check at :1532 with the sup norm. |
| F03 (P3) | repaired | `Suggested.lean:220`–222 has `(p) (hp) (f) (D) (hD : HasWeakMDeriv I J f D)` and no membership binder; README:1211: "That statement therefore carries no separate membership hypothesis." |
| F04 (P3) | repaired | README:1444: "Prove that `μ_f^+(A) + μ_f^−(A) = ∫⁻_A ENNReal.ofReal |J_f| dvol_M = vol_N(f(A))` for every Borel `A ⊆ M`, with no hypothesis on orientations"; Check at :1465 with the two components. |
| F05 (P3) | repaired | A blank line precedes the `*Needs:*` line of §1.3 (README:571–572). A scan of the whole file finds no `*Needs:*` line without a blank line before it and no column-0 continuation inside a bullet. |

The repair report marks no finding `not actionable in this package`; nothing is re-raised. The
passages the repairs added (README:1206–1212, 1440–1454, 1465–1470, 1514–1516, 1532–1538) were put
through the adversarial pass; the repaired patterns (a stale Check ordinal, "for `volume`" on a
bare normed space, a hypothesis implied by another, a Lean statement wider than its README
target, a fused `*Needs:*` line) were searched for in the rest of the package and not found.

## Verified sound

### Principles, shape and policy

- Read all of `README.md` (1764 lines), `Suggested.lean` (369 lines), `metadata.toml`,
  `sources.toml`, the round-2 review and its repair report.
- No route-specific shortcut, re-planned roadmap, copied passage, algorithm, sorry'd data,
  `set_option`, `lemma`, admitted `example`, pull-request number, date, machine path, HTML anchor,
  LaTeX delimiter or process word in the two roadmap files (grep, 0 hits). The eight layers are
  named by their mathematics; none follows a source's chapters; each ends with `### Examples` and
  `### Dependencies`.
- Definitions and their Checks: `L^p_loc` (5), `W^{1,p}_loc(Ω; F)` (6), `L^p_loc` on manifolds (3),
  `W^{1,p}_loc(M; V)` (4), `W^{1,p}_loc(M, N)` (4), the weak differential (4), `‖Df‖` (3), `J(A)` (5),
  `J_f` (5), the Jacobian measures (5), the extrinsic class (3). Each has an API list.
- All 21 Lean names occur in the README, and every backticked name the README presents as its own
  is one of the 21. Of the 146 other backticked identifiers, a mechanical search of the pinned
  sources misses only four, each resolved by hand: `MeasureTheory.Measure.isAddLeftInvariant_eq_smul`
  (the `to_additive` name at `Mathlib/MeasureTheory/Measure/Haar/Unique.lean:919`),
  `TauCeti.W1p.value_compL_ae` and `TauCeti.W1p.gradient_compL_ae`
  (`TauCeti/Analysis/Sobolev/W1p/ChangeOfVariables.lean:302`, `:316`) and
  `TauCeti.W1p.hasWeakFDerivOn_comp` (`…/W1p/ChainRule.lean:375`, `p ≠ ∞`, `ContDiff ℝ 1 F`).
- Every identifier of a `*Needs:*` line is in the supplier contracts (script, 0 misses). Ten
  contract names are consumed by no `*Needs:*` line (carriers such as `MeasureTheory.eLpNorm`, and
  `TauCeti.IsNullSet.mono`, `TauCeti.isLocallyFiniteMeasure_riemannianVolume`,
  `TauCeti.exists_contMDiffOn_normalRetraction`); they are described correctly and need no change.
- Declarations opened at the pins and compared with what the README says of them:
  `TauCeti.HasWeakLineDerivOn` and `TauCeti.HasWeakFDerivOn`
  (`TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:212`, `:251`: completeness of the codomain, local
  integrability of `u` and of each `U · v`, no `Lᵖ`, no continuity);
  `HasWeakFDerivOn.locallyIntegrableOn_deriv` (`:302`, needs finite-dimensional `E`);
  `TauCeti.hasWeakFDerivOn_of_differentiableOn` (`:747`, needs `u` and `fderiv u` locally
  integrable, which a `C¹` map has); `HasWeakFDerivOn.comp_measurePreserving`
  (`…/WeakDeriv/MeasurePreserving.lean:130`, locally Lipschitz and measure preserving);
  `TauCeti.W1p` (`…/W1p/Basic.lean:372`, `[Fact (1 ≤ p)]`, so `p = ∞` is admitted);
  `MeasureTheory.locallyIntegrableOn_iff`
  (`Mathlib/MeasureTheory/Function/LocallyIntegrable.lean:188`, locally compact, locally closed);
  `TauCeti.IsNullSet` (`TauCeti/Geometry/Manifold/Measure.lean:36`);
  `TauCeti.riemannianVolume` (`…/VolumeDensity/Volume.lean:82`, glued over a Lindelöf subcover of
  chart sources, no separation axiom, boundary allowed); `TauCeti.chartVolumeDensity` and
  `chartVolumeDensity_pos` (`…/VolumeDensity/Basic.lean:48`, `:61`), with `chartGramMatrix`
  (`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/ChartGram.lean:160`: the Gram matrix of the
  trivialization frame of `Module.finBasis ℝ E`); `TauCeti.riemannianVolumeForm`
  (`…/Riemannian/VolumeForm.lean:55`);
  `TauCeti.Manifold.Orientation.IsOrientationPreservingAt` (`…/Orientation/Preserving.lean:63`: it
  contains a continuous linear equivalence equal to `mfderiv`, so §6.2's `J(mfderiv f x) > 0` has
  its bijectivity); `Orientation.model`, `orientationAt_model` (`…/Orientation/Basic.lean:235`,
  `:244`) and `Orientation.restrict` (`…/Orientation/OpenSubset.lean:49`); `LinearMap.normDet`
  (`Mathlib/Analysis/InnerProductSpace/NormDet.lean:69`: `0` unless injective, `1` on a subsingleton
  domain, `:228`); `MeasureTheory.addHaar_image_eq_zero_of_differentiableOn_of_addHaar_eq_zero`
  (`Mathlib/MeasureTheory/Function/Jacobian.lean:556`);
  `DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank`
  (`TauCeti/Analysis/Calculus/Sard/LowDimension.lean:73`);
  `Manifold.IsImmersionAt.exists_contMDiffOn_retraction`
  (`TauCeti/Geometry/Manifold/SmoothEmbedding/Extension.lean:64`, assumes a topological embedding,
  as §8.1 says); `TauCeti.SmoothEmbedding.exists_contMDiffMap_extension_hasCompactSupport`
  (same file, `:201`: source boundaryless of class `C^n`, ambient manifold smooth, Hausdorff,
  σ-compact with finite-dimensional model, as README:388–395 says).

### Elaboration, binders, padding and headlines

- `lake env lean` on `packages/SobolevMapsBetweenManifolds/Suggested.lean` from the content
  checkout: exit 0, 16 warnings, all "declaration uses `sorry`", no error. No `TauCeti.*` module
  needed building. Header: `module`, `import Mathlib`, six `TauCeti.*` modules, each used.
- `#check @name` for all 21 declarations in one scratch elaboration, compared with the README: no
  section binder a statement needs is lost. With `pp.explicit`, the norm `‖D x‖` of
  `memManifoldW1pLoc_iff_norm` and `jacobian_hadamard_integrability` is the operator norm for the
  fibre norms of the two `RiemannianBundle` instances, not for the model norms, as §5.1 requires.
- One-tactic probe on a scratch copy, every one of the 16 theorems with
  `first | rfl | (simp; done) | infer_instance | (intros; rfl) | (constructor <;> simp; done) | (intros; simp_all; done) | (intros; constructor <;> intros <;> simp_all; done) | (intros; exact?) | sorry`:
  16 `sorry` warnings remain. None closes, none restates a definition, none is a boundary case.
- Headlines T1–T7 and their Lean statements: T1 `memW1pLoc_iUnion`, `precomp_localDiffeomorph`,
  `postcomp_boundedDerivative`, `postcomp_continuous`; T2 `isNullSet_iff_riemannianVolume_eq_zero`,
  `memManifoldW1pLoc_iff_atlases`, `exists_hasWeakMDeriv`, `contMDiff_memManifoldW1pLoc`; T3
  `memManifoldW1pLoc_iff_norm`; T4 `jacobian_hadamard_integrability`, `jacobian_changeOfVariables`;
  T5 `immersion_comparison`; T6 `euclidean_compatibility`, `euclidean_volume`,
  `euclidean_jacobian`; T7 `embedding_independence`. The module docstring says all are statable.
  The parts kept in the README only (the comparison constants of §5.3, the sign laws of §6.2, the
  isometric norm identity of §8.2) are fibrewise linear algebra on hypotheses and would be
  padding; the docstring names the last one.
- README and Lean generality: each chain rule of Layer 2 is stated in the README as two items
  (transport of a weak derivative; membership) and in Lean with both hypotheses. At `p = 1` the
  membership hypothesis follows from the weak derivative (`locallyIntegrableOn`,
  `locallyIntegrableOn_deriv`), so the Lean statement gives the first item and the two agree.

### Adversarial table

Values computed in this round; `p ≥ 1` unless a row says otherwise.

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §1.1 `MemLpLoc` | `s = ∅`; `|x|^{−1/2}` on `ℝ`; `1/x` on `(0, 1)`; identity at `p = 0` | restricted measure `0`, member; `∫_{−1}^{1} |x|^{−p/2} dx = 4/(2 − p)`, `4` at `p = 1`, `∞` at `p = 2`; `sup_{[a,b]} = 1/a`, `∫_0^1 dx/x = ∞`; seminorm `0` | sound; R01 is its wording |
| §1.1 gluing, non-Hausdorff `X` | `K ⊆ C₁ ∪ C₂`, `C_j` compact in `s_{i_j}` | `μ|_K ≤ μ|_{C₁} + μ|_{C₂}`; at `p = ∞` the bound is the max | sound |
| §1.2 `MemW1pLoc` | `log |x|` on `ℝ²`; Heaviside; Cantor function; `Ω = ∅` | `2π ∫_0^1 r^{1−p} dr = 2π/(2 − p)`, `∞` at `p = 2`; `∫ U φ = φ(0)` impossible; `c(1/4) = 1/3` (ternary `0.0202…` to binary `0.0101…`), `c(3/4) = 2/3`, not constant; all integrals `0` | sound; R04 is a locator |
| §1.3 `memW1pLoc_iUnion` | empty index type; half-planes with `sign x₁`; `{ℝ² ∖ 0, B(0,1)}` with `log |x|` | both sides true on `∅`; cover misses a line, no conclusion; both sides iff `p < 2` | sound |
| §1.4 agreement with `W1p` | `x₁` on `B(0, 1/2)`; `log |x|`, `p = 2`; `|x|`, `p = ∞`, `V` bounded and `V = ℝ` | gradient `e₁`; `2π ∫_0^{1/2} dr/r = ∞`; `sign x` bounded, `|x| ∉ L^∞(ℝ)` | sound |
| §2.1 null sets | projection `ℝ² → ℝ`; constant map; Cantor function at `0` within the Cantor set | image `ℝ` of a null line, `2 > 1`; preimage of a point is `ℝ²`; `c(3^{−k})/3^{−k} = (3/2)^k → ∞` | sound, each hypothesis used |
| §2.2 `precomp_localDiffeomorph` | `θ = z²`, `u = log |w|`; `θ = y³ + y`, `u = |x|`; `p = 1` | `⟨z², 2zh⟩/|z|⁴ = 2⟨z, h⟩/|z|²` on both sides; `sign(y)(3y² + 1)`, in `L^∞_loc` not `L^∞`; `hu` follows from `hU` | sound |
| §2.3 `postcomp_boundedDerivative` | `G = id`, `u = x³`, even mollifier of variance `σ²`; `G = e^{t²}`, `u = log |x|` | `u_ε = x³ + 3σ²ε²x`, difference `3σ²ε²`, `L¹(−1, 1)` norm `6σ²ε²`; `(log |x|)² ≥ −2 log |x|` iff `|x| ≤ e^{−2}`, `2π ∫ dr/r = ∞` | sound |
| §2.4 `postcomp_continuous` | `G = log` on `(0, ∞)`, `u = |x|` on `ℝ² ∖ 0`; `G(s, t) = st` | `⟨x, ·⟩/|x|²`; `u₂ Du₁ + u₁ Du₂` | sound |
| §3.1 `isNullSet_iff_riemannianVolume_eq_zero` | dimension `0`; metric `(1 + |x₁|^{1/2})(dx₁² + dx₂²)`; `4(dx² + dy²)` | only `∅` null on both sides; density `√((1 + |x₁|^{1/2})²)`, `∫_0^1 (1 + t^{1/2}) dt = 5/3`, segment null; `√det(4 I₂) = 4` | sound |
| §3.2 chartwise `L^p_loc` | `dx²` against `e^{2x} dx²`, `g = 1_{[0,∞)} e^{−x}` | `∫ g dx = 1`, `∫ g e^{x} dx = ∞`; same local class | sound; R03 is its layer sentence |
| §3.3 null sets on manifolds | `ℝ × D`, `D` discrete uncountable, `s = {0} × D`, `f(x, d) = d`; `D = ℤ` | each chart image `{0}`; `f(s) = ℝ` not null; `f(s) = ℤ` null | sound |
| §4.1 `MemVectorW1pLoc` | `|x|` in the atlas `{x³}`; `sign x₁` off the line | `|y|^{1/3}`, derivative `|y|^{−2/3}/3`, `L^p_loc` iff `p < 3/2`; `Du = 0` there, no class on `ℝ²` | sound |
| §4.2 `MemManifoldW1pLoc`, `memManifoldW1pLoc_iff_atlases` | angle map `|t|^{1/2}`; `M = ∅`; one chart on each side | derivative `|t|^{−1/2}/2`, iff `p < 2`; both sides true; the set of the Lean right side is `(e.extend I)(e.source ∩ f⁻¹ e'.source)` | sound |
| §4.3 `HasWeakMDeriv`, `exists_hasWeakMDeriv` | `φ = 2x`, `f = id`; change `D` at one point; `E = 0` | `1 · Df · (1/2) = 1/2`, `Df = 1`; difference set a point, null; `U = 0`, identity `0 = 0` | sound |
| §4.4 `contMDiff_memManifoldW1pLoc` | `t|t|`; identity of an open subset | `mfderiv = 2|t|`; transported field `id` | sound |
| §4.6 chain rules | `θ = 2y`, `f = |t|^{1/2}`; `θ = (y₁, 0)`, `f = |x|^{1/2}` on `ℝ²` | `2 Df(2y) = sign(y)|2y|^{−1/2}`, and `(√2 |y|^{1/2})' = sign(y)|y|^{−1/2}/√2`, equal; `p < 4` against `p < 2` | sound |
| §5.1 norm, chart comparison | `id : ℝ → (ℝ, 4dt²)`; circle of radius `3`; chart `2x` | `2`; `3|t|^{−1/2}/2`; representative norm `1/2` against `‖Df‖ = 1` | sound |
| §5.2 `memManifoldW1pLoc_iff_norm` | `|t|^{1/2}`; `t log |t|`; Cantor function | both sides iff `p < 2`; `|log |t| + 1|`, both true for finite `p`, false at `∞`; no weak differential, hypothesis fails | sound |
| §5.3 comparable metrics | `g'_N = c² g_N`; `dx² + 4dy²` on the target | `‖A‖' = c‖A‖`, both bounds; `‖id‖' = 2 = β/a` | sound |
| §6.1–§6.3 `jacobian_hadamard_integrability` | frames `e = dφ⁻¹ b_E`, `e' = dψ⁻¹ b_F`; `id`, chart `2x`, target `4dt²`; `x|x|^{−1/2}`; `n = 0` | `vol_N(De) = det[A] ε_N ρ_N = j ε_M ρ_M`, so `j = ε_M ε_N det[A] ρ_N/ρ_M`; `(1/2) · 2/(1/2) = 2`; singular values `|x|^{−1/2}`, `|x|^{−1/2}/2`, `J = |x|^{−1}/2 ≤ |x|^{−1}`, `q < 2 = p/n`; `|j| = 1 ≤ ‖D‖⁰` | sound |
| §6.3 third Check | `r_k = 2^{−k}`, `c_k = 4r_k`, `λ_k = 2^k/√k` | centres `2r_k` apart against `3r_k/2`; `λ_k r_k = k^{−1/2} → 0`; `Σ λ_k^p r_k² = Σ 2^{(p−2)k} k^{−p/2}`, finite iff `p < 2`; `π λ_k² r_k²/4 = π/(4k)`, divergent | sound |
| §6.4 `jacobian_changeOfVariables` | `2x`; `−x`; two components; `z²` on `1 < |z| < 2`; `(√|x|, y)` | `2 = vol[0, 2]`; `0 + 1 = vol[−1, 0]`; `1 + 1 = 2`; `2π ∫_1^2 4r³ dr = 30π` against `15π`, excluded by injectivity; `2 ∫_{−1}^{1} dx/(2√|x|) = 4`, `∫ 1/(4|x|) = ∞` | sound |
| §7.1 `euclidean_compatibility` | `Ω = ∅`; `E = (ℝ², sup)`; chart of `Ω` | both sides true; `1 + 1 = 2 ≠ 4`, no inner product, both sides true for `id`; chart target `Ω`, representative `u`, transported field `U` on `Ω` | sound; R05 is a locator |
| §7.1 `euclidean_volume`, `euclidean_jacobian` | `(a, b) ⊆ ℝ`; reflection; `z²`; inversion; `n = 0` | `b − a`; `−1`; `4|z|²`; `‖Df‖ = |x|^{−2}`, `det = −|x|^{−2n}`; `1` | sound |
| §8.1 local retraction | circle; `s³`; figure-eight | `v/|v|`; left inverse `s^{1/3}`, not differentiable at `0`; patch in the source | sound |
| §8.2 `immersion_comparison` | circle map; `ι = s³`, `f = t^{1/3}`; double cover | `|t|^{−1/2}/2` on both sides; `ι ∘ f = id` against `p < 3/2`; both `p < 2` | sound |
| §8.4 `embedding_independence` | `(s, exp exp s)`, `u = log log(1/|x|)`; half-angle map | `2π ∫_0^{1/e} dr/(r log²(1/r)) = 2π`; second coordinate `1/|x|`, `∫ r^{−2} r dr = ∞`; `ι₁ ∘ u = z/|z|` smooth, `ι₂ ∘ u` jumps | sound; compactness and injectivity used |
| Conventions | direction, metric and Jacobian witnesses | `Df = 1` (not `1/4`, `1/2`); `‖Df‖ = 2`; `J(diag(2,1)) = 2`, `J(diag(−1,1)) = −1` | sound |

Sections outside the sample and untouched by repairs (§8.3, the worked examples) were read in
full; their values (`√2/|x|`, `4π ∫_0^1 r^{2−p} dr` finite iff `p < 3`, `‖Df‖²/J_f = 2`) were
recomputed and agree.

### Sources: the seeded sample

| Target | Locator | Outcome |
| --- | --- | --- |
| 1.1, 1.4 | Mazya2011 §1.1 | uncertified; not read |
| 1.2 | Ziemer1989 Ch. 2 §2.1; Mazya2011 §1.1; HeikkilaPankka2025 line 22–23 | first two uncertified; the third read and does not contain the class (R04) |
| 2.1, 3.1, 3.3 | Lee2012 Ch. 6, Ch. 16 | uncertified; the pinned inputs of the three routes were opened instead |
| 4.1 | Hajlasz2009 line 28 | read: the ambient vector-valued class `W^{1,p}(M, ℝ^ν)`, compact manifolds, finite `p`; the README claims only that its class carries that description |
| 4.2 | HeikkilaPankka2025 line 22–23 | read: the class of continuous maps is named there for `p = n`; the chartwise definition and atlas independence are this roadmap's |
| 4.4, 4.6 | Ziemer1989 Ch. 2 §2.1, Theorems 2.1.11, 2.2.2 | uncertified |
| 5.1 | HeikkilaPankka2025 line 26; Rickman1993 Ch. I §1 | line 26 read: the operator norm of the weak differential; Rickman uncertified |
| 5.3 | Hajlasz2009 line 104–106 | read: equivalence of Riemannian metrics on a compact manifold; the README says so and argues for itself |
| 7.1 | MartioRickmanVaisala1969 line 124, lines 332–340 | read: the Jacobian; 2.16, `ACL` and `ACL^p` (R05) |
| 8.1 | Lee2012 Ch. 4 | uncertified |
| 8.2 | Hajlasz2009 line 28; HeikkilaPankka2025 line 1328–1329 | read: the class through an embedding; the `W^{1,∞}` step through a Nash embedding |

Also read: Hajlasz2009 lines 20–28, 37–53, 104–107, 129–130, 138–141 and HeikkilaPankka2025 lines
20–27, against the Summary, the Conventions and the Part II scope; each says what is attributed
to it. All eight cited works are in the manifest with one key each; no locator is flagged
unverified by the author.

### Duplication, ownership and suppliers

- Searched both pinned libraries by object: a local `Lᵖ` predicate, a local first-order class, a
  gluing theorem for weak derivatives over a cover, a chain rule with a `C¹` outer map, a
  chartwise-null/volume-null equivalence, a flat-volume identity, a manifold weak differential.
  Nearest: `TauCeti.hasWeakFDerivOn_iff_forall_isCompact_closure` (relatively compact subdomains,
  not covers), `LocallyLipschitzOn.hasWeakFDerivOn_fderiv`
  (`TauCeti/Analysis/Sobolev/WeakDeriv/Lipschitz.lean:134`), `TauCeti.W1p.localizeL`,
  `TauCeti.W1p.restrictL`, `TauCeti.W1p.compMeasurePreservingL`,
  `Homeomorph.measurePreserving_riemannianVolume` (isometries only,
  `…/VolumeDensity/Isometry.lean:173`), `UpperHalfPlane.riemannianVolume_eq_volume`, and
  `TauCeti/Geometry/Manifold/Riemannian/Sobolev.lean` (the Sobolev inequality for `C¹` functions
  on a closed manifold). None states a target of this roadmap. The Loogle and LeanSearch leads for
  the 21 declarations contain no statement of any of them.
- Cross-roadmap citations resolved now. On main: PDE Layer 1 (README:675), GeometricCurrents G6
  (:668, :750), PseudoholomorphicCurveAnalysis §1.1, §1.2 and §4.1 (:213, :279, :807),
  SobolevPolynomialApproximation §2.1 (:324), PseudodifferentialOperators §5.2 (:967),
  RiemannianGeometry R4.6 (:120), DifferentialGeometry 2.1–2.2 (:314), 12.1 (:2801), 12.4 (:2896),
  GeometricMeasureTheory G2 (:148). At open heads: SobolevDifferentialForms §4.1 (:388),
  TeichmullerGeometry §7.4 (:742). All exist and say what is cited. The citation tool lists no
  citation and no Lean name found nowhere.
- Ownership: `MemLpLoc` of PseudoholomorphicCurveAnalysis (its `Suggested.lean:47`) is the planar
  case, in another namespace; the scope section cites it and says how §1.1 differs. A search of
  main and the open heads for the class `W^{1,p}_loc(M, N)`, `MemLpLoc`, `MemManifoldW1pLoc` and
  the oriented Jacobian finds only that roadmap and QuasiregularMaps, which names this roadmap as
  owner through six declared gaps (`sobolev-maps-class`, `-weak-differential`, `-norm`,
  `-jacobian`, `-chain-rules`, `-euclidean`) and owns only locally Lipschitz membership (its §2.8).
  No object has two owners. The other roadmaps of the overlap ledger were searched through the
  tools, not read in full.
- Overlaps: no other open pull request changes this roadmap, drops an id it cites or defines one
  only in a revision. This package declares no supplier gap.
- Dependency check, exact command of the brief:

  ```text
  depcheck: 232 roadmaps, 2071 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line. For the intake: the merge order lists QuasiregularMaps
  (line 288) before this roadmap (line 402) although it consumes it; that is the consumer's
  placement.

### Remarks that need no change

- `hp : 1 ≤ p` is not needed for the truth of `memW1pLoc_iUnion` or
  `contMDiff_memManifoldW1pLoc`; it is the roadmap's standing exponent range.
- `hi` in `jacobian_changeOfVariables` is part of §6.4's definition of a `C¹` open embedding.
- The Conventions' direction witness speaks of geometric tangent vectors; in Lean's
  `TangentSpace`, identified with the model through the preferred chart, the same differential
  has coordinate `1/2`. `HasWeakMDeriv` encodes the convention through the two `mfderiv` factors.

## Not verifiable

- Ziemer1989 (Ch. 2 §2.1, Theorems 2.1.11 and 2.2.2), Mazya2011 (§1.1), Rickman1993 (Ch. I §1),
  Lee2012 (Ch. 4, 6, 15, 16): settled as uncertified, paywalled; theorem numbers, hypotheses and
  pages were not checked against the texts.
- Bethuel1991 (Introduction): settled as uncertified; no text is cached.
- MartioRickmanVaisala1969: the extraction is of a scan; lines 118–125 and 332–340 are legible,
  the printed page numbers are not, so "page 6" is the page of the extraction.
- Ownership against open pull requests: checked through the overlap ledger, the citation tool and
  object searches over all open heads; no open roadmap other than QuasiregularMaps was read in
  full.

## Source issues

- **Misprint** in HeikkilaPankka2025 at Appendix B, proof of Proposition B.1, printed p. 24 (line 1328): the source says the map into the target manifold is applied after the Nash embedding; it should be the embedding applied after the map; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bdea305c3709574e91ee220584f1a3ed519bd181", "job": "REV-PKG-SobolevMapsBetweenManifolds~3", "model": "fable", "worker": "chris-l"} -->
