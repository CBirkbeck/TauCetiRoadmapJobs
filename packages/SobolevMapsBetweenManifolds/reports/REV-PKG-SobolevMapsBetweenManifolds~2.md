<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12769#issuecomment-6780036980 -->
Review (claude) of 1c25397

Verdict: needs_changes

1. **F01** (P3) Two Check cross-references point at the wrong Check

   **Location.** `packages/SobolevMapsBetweenManifolds/README.md:758`: "Continuity is used: §2.3's third
   Check has `u = log |x|` discontinuous at `0` and `G(t) = e^{t²}`". And line 588: "This agrees with
   §1.2's second Check."

   **Claim.** The third Check of §2.3 is the `e^{t²}` example; the second Check of §1.2 is the
   `log |x|` example.

   **Witness.** §2.3's Checks (lines 714–723) are, in order: `W1p` agreement, linear `G`, the cubic
   mollifier Check added by the F03 repair, then `e^{t²}`. §1.2's Checks (lines 515–523) are: `Ω = ∅`,
   the identity of `E`, then `log |x|`.

   **Repair.** Line 758: "§2.3's fourth Check". Line 588: "§1.2's third Check". Tested on the instance:
   the fourth Check of §2.3 is the one with `G(u(x)) = e^{(log |x|)²} ≥ |x|^{−2}` for `|x| ≤ e^{−2}`;
   the third of §1.2 is the one with `∫_{|x|<1} |x|^{−p} dx = 2π/(2 − p)`, infinite at `p = 2`, which is
   the value §1.4 uses.

2. **F02** (P3) §7.1 states membership "for `volume`" on spaces that carry none

   **Location.** `packages/SobolevMapsBetweenManifolds/README.md:1494`: "`f ∈ W^{1,p}_loc(Ω, F)` iff
   `f̃` is continuous on `Ω` and `f̃ ∈ W^{1,p}_loc(Ω; F)` for `volume`."

   **Claim.** The membership bullet is stated for `E`, `F` "finite-dimensional real normed spaces"
   (line 1487), with inner products only for the later bullets.

   **Witness.** `volume` on `E` comes from `measureSpaceOfInnerProductSpace`
   (`Mathlib/MeasureTheory/Measure/Haar/OfBasis.lean`), which needs an inner product. `E = ℝ²` with the
   sup norm is a normed space of line 1487 with no such `volume`. `Suggested.lean:301`
   `euclidean_compatibility` quantifies over an arbitrary additive Haar measure `μ`.

   **Repair.** Replace "for `volume`" by "for one, equivalently every, additive Haar measure `μ` on `E`
   (§1.2)". Tested on the instance: on `(ℝ², sup norm)` with `μ` the Haar measure of the standard basis,
   `f = id_Ω` has representative `id`, weak derivative `id`, and both sides hold for every `p`; this is
   the generality of the Lean statement.

3. **F03** (P3) `memManifoldW1pLoc_iff_norm` carries a hypothesis that `hD` implies

   **Location.** `packages/SobolevMapsBetweenManifolds/Suggested.lean:220`: "`(hf : MemManifoldW1pLoc I
   J 1 f)`", followed by `(hD : HasWeakMDeriv I J f D)`.

   **Claim.** `W^{1,1}_loc` membership is an independent hypothesis of the criterion for a supplied
   weak differential.

   **Witness.** README:204: "Admitting a manifold-valued weak differential is equivalent to continuous
   `W^{1,1}_loc` membership." `HasWeakMDeriv` contains `Continuous f`, and
   `TauCeti.HasWeakFDerivOn.locallyIntegrableOn` with `MeasureTheory.locallyIntegrableOn_iff` gives
   local `L¹` of each representative and of its field. So `hD` gives `hf`.

   **Repair.** Delete the binder `hf` from `memManifoldW1pLoc_iff_norm`, and change its docstring's
   "Given W11 membership and any weak differential" to "Given any weak differential". The README
   statement of §5.2 keeps `f ∈ W^{1,1}_loc(M, N)`, which is what the total `Df` needs. Tested: the file
   with the binder removed elaborates from the content checkout with 16 `sorry` warnings and no error;
   on `f(t) = |t|^{1/2}`, `D = sign(t)|t|^{−1/2}/2`, `hD` holds, `∫_{−1}^{1} |t|^{−1/2}/2 dt = 2 < ∞`
   gives the deleted hypothesis, and both sides of the equivalence hold exactly for `p < 2`.

4. **F04** (P3) §6.4 does not state the identity that `jacobian_changeOfVariables` states

   **Location.** `packages/SobolevMapsBetweenManifolds/README.md:1433`: "If `f` is a `C¹` open
   embedding … and is orientation preserving at every point, then `μ_f^− = 0` and `μ_f^+(A) =
   vol_N(f(A))`", and the orientation-reversing case after it.

   **Claim.** Line 1410 says the Lean theorem is "the absolute-density change-of-variables identity",
   but the "Prove" paragraph states only the two cases of constant orientation behaviour.

   **Witness.** `M = (0, 1) ⊔ (2, 3)`, `N = ℝ`, `f(x) = x` on `(0, 1)` and `f(x) = 5 − x` on `(2, 3)`: a
   `C¹` open embedding with invertible differential, `J_f = 1` and `−1` on the two components. Neither
   README case applies; `Suggested.lean:279` asserts `∫_M |j| = 2 = vol(f(M))`.

   **Repair.** In the "Prove" paragraph of §6.4, state first: "If `f` is a `C¹` open embedding with
   invertible differential, then `μ_f^+(A) + μ_f^−(A) = vol_N(f(A))` for every Borel `A ⊆ M`, with no
   hypothesis on orientations", then keep the two orientation cases as its consequences, and add the
   witness as a Check. Tested on the witness: `μ_f^+(M) = 1`, `μ_f^−(M) = 1`, sum `2`, and
   `vol((0, 1) ∪ (2, 3)) = 2`.

5. **F05** (P3) The `*Needs:*` line of §1.3 is fused into its last Check

   **Location.** `packages/SobolevMapsBetweenManifolds/README.md:568`–569: "- The empty index set:
   `Ω = ∅`, and both sides hold." followed directly by "*Needs:* §1.1, §1.2; Tau Ceti …".

   **Claim.** §1.3 ends with a `*Needs:*` line of its own, as every other section does.

   **Witness.** There is no blank line between line 568 and line 569, so Markdown reads the `*Needs:*`
   line as a continuation of the last Check bullet. Sections 1.1, 1.2 and 1.4 (lines 481–482, 537–538,
   592–593) have the blank line.

   **Repair.** Insert a blank line before line 569. In the same pass, re-indent the continuation lines
   that start in column 0 inside bullets (lines 209, 932, 952, 1659, 1670). Tested on line 568–569: with
   the blank line the section renders three Check bullets and a separate `*Needs:*` paragraph.

Five findings, all P3 (0 blocking). The six findings of round 1 are repaired. No statement of
`Suggested.lean` or of the sampled README targets was found false. The remaining items are two stale
Check cross-references (one created by the round-1 repair), one README/Lean generality slip in §7.1,
one hypothesis of `memManifoldW1pLoc_iff_norm` that another hypothesis already implies, one Lean
statement wider than its README target in §6.4, and one fused `*Needs:*` line.

## Round-1 findings, one by one

| Id | State | Repaired passage (quoted) |
| --- | --- | --- |
| F01 (P1) | repaired | `packages/SobolevMapsBetweenManifolds/README.md:1032`: "For `N = V` and continuous `f` admitting a weak differential, it agrees almost everywhere with the total choice of §4.1, by uniqueness." Conventions line 205–207 say the same; the log-radius negative control is the third Check of §4.3. |
| F02 (P2) | repaired | `Suggested.lean:233` `jacobian_hadamard_integrability` now has `(n : ℕ)` unrestricted, the chart formula `j x = εM * εN * det * ρN / ρM` with `0 < ρM ∧ 0 < ρN`, `0 < n → MemLpLoc … (p / n)` and `n = 0 → MemLpLoc … ∞`; `euclidean_volume` (line 313) and `euclidean_jacobian` (line 325) are stated. |
| F03 (P2) | repaired | README:703: "Split the derivative difference as `DG(u_ε)(Du_ε − U) + (DG(u_ε) − DG(u))U`. The first term has `L¹` norm at most `L‖Du_ε − U‖₁ → 0`"; dominated convergence is applied to the second term only. The repair made a cross-reference stale (R01). |
| F04 (P2) | repaired | README:388: "extends to a compactly supported `C^k` vector-valued map of the ambient manifold when its model is finite-dimensional and it is smooth, Hausdorff and σ-compact". Matches `TauCeti/Geometry/Manifold/SmoothEmbedding/Extension.lean:165`–172 and :201 at the pin. |
| F05 (P3) | repaired | `isometric_immersion_norm` occurs in neither file; README:1565: "The norm identity follows from `LinearMap.isometryOfInner` and `LinearIsometry.norm_toContinuousLinearMap_comp` applied fibrewise." |
| F06 (P3) | repaired | README:1424: "HeikkilaPankka2025 line 25–27 supplies only the determinant notation."; the manifest's `cited_for` reads "6.2 Jacobian determinant notation J_f (lines 25–27)". |

The repair report marks no finding `not actionable in this package`, so nothing is re-raised.

## Verified sound

### Principles, shape and policy

- Read all of `README.md` (1739 lines), `Suggested.lean`, `metadata.toml`, `sources.toml`, the
  round-1 review and the repair report, and the README diff between the two rounds (99 changed
  lines), every one of which was put through the adversarial pass.
- No route-specific shortcut, re-planned roadmap, copied passage, algorithm, sorry'd data,
  `set_option`, `lemma`, admitted `example`, pull-request number, machine path, HTML anchor or LaTeX
  delimiter in the two roadmap files (grep, 0 hits). The eight layers are named by their mathematics
  and each ends with `### Examples` and `### Dependencies`; no layer follows a source's chapters.
- Every one of the 21 Lean names occurs in the README; every backticked name the README presents
  as its own is one of them. Every other backticked library identifier was resolved mechanically
  against the pinned sources: the only miss is `MeasureTheory.Measure.isAddLeftInvariant_eq_smul`, which is
  the `to_additive` name generated at `Mathlib/MeasureTheory/Measure/Haar/Unique.lean:919`.
- Line numbers of the supplier contracts opened at the pins and found exact:
  `LpSeminorm/Defs.lean:92`, `:154`; `LpSeminorm/Basic.lean:584`, `:620`;
  `Measure/Restrict.lean:50`; `Group/Measure.lean:773`; `Measure/WithDensity.lean:476`;
  `Integral/Bochner/ContinuousLinearMap.lean:311`; `MFDeriv/Defs.lean:336`;
  `ContMDiff/Defs.lean:211`; `MFDeriv/NormedSpace.lean:786`; `LinearAlgebra/Determinant.lean:164`;
  `InnerProductSpace/LinearMap.lean:126`; `Normed/Operator/NormedSpace.lean:53`;
  `TauCeti/Geometry/Manifold/ExtChartAt.lean:374`.
- Definitions opened and compared with what the README says of them: `TauCeti.HasWeakFDerivOn`
  (`TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:250`; a weak line derivative in every direction,
  with local integrability, no `Lᵖ` and no continuity); `TauCeti.IsNullSet`
  (`TauCeti/Geometry/Manifold/Measure.lean:36`; every preferred chart, every Haar measure, no
  measurable structure on `M`, no separation axiom); `TauCeti.riemannianVolume`
  (`…/VolumeDensity/Volume.lean:82`; Lindelöf, Borel, `C¹`, continuous metric, model with boundary
  allowed); `TauCeti.chartVolumeDensity` (`…/VolumeDensity/Basic.lean:48`, positivity at :61 on the
  chart base set); `TauCeti.riemannianVolumeForm` (`…/Riemannian/VolumeForm.lean:55`);
  `TauCeti.Manifold.Orientation.card_eq` (`…/Orientation/Basic.lean:83`: an orientation indexed by
  `Fin n` forces `n = finrank`, so T4 needs no separate dimension hypothesis); `LinearMap.normDet`
  (`Mathlib/Analysis/InnerProductSpace/NormDet.lean:69`; `0` when the map is not injective, `1` in
  dimension `0`); `ContMDiffOn.isImmersionAt_iff_injective_mfderiv`
  (`TauCeti/Geometry/Manifold/Immersion/Differential.lean:257`);
  `exists_contMDiffOn_retraction` (`…/SmoothEmbedding/Extension.lean:64`, which does assume a
  topological embedding, as §8.1 says); `DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank`
  (`TauCeti/Analysis/Calculus/Sard/LowDimension.lean:73`).

### Elaboration, binders and padding

- `lake env lean` on `packages/SobolevMapsBetweenManifolds/Suggested.lean` from the content
  checkout: exit 0, 16 warnings, all "declaration uses `sorry`", no error. The six `TauCeti.*`
  imports had object files; none needed building. Header: `module`, `import Mathlib`, six
  `TauCeti.*` modules, each used.
- Elaborated types of all 21 declarations compared with the README: no needed section binder is
  lost. `[I.Boundaryless]`, `[J.Boundaryless]`, both `IsManifold … 1`, the Lindelöf, Borel and
  continuous-metric instances are present where the README has them.
- One-tactic probe on a scratch copy, every one of the 16 theorems with
  `first | rfl | (simp; done) | infer_instance | (intros; rfl) | (constructor <;> simp; done) | sorry`:
  16 `sorry` warnings remain, so none closes. The `hflat` binder of `euclidean_volume` and
  `euclidean_jacobian` is needed: `infer_instance` fails on
  `IsContinuousRiemannianBundle V fun x => TangentSpace 𝓘(ℝ, V) x` at the pins.
- Headlines T1–T7 are each stated (table below); the module docstring says all are statable and
  none is replaced by a stand-in. The parts of T3–T6 not in the Lean file (comparison constants,
  sign laws, the isometric norm identity) are fibrewise linear algebra, kept in the README.

### Adversarial table

Values are computed here; `p ≥ 1` unless a row says otherwise.

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §1.1 `MemLpLoc` and its API | `s = ∅`; `|x|^{−1/2}` on `ℝ`; `1/x` on `(0, 1)`; `p = 0` | restricted measure `0`; `∫_{−1}^{1} |x|^{−p/2} = 4/(2 − p)`, `4` at `p = 1`, `∞` at `p = 2`; `sup_{[a,b]} = 1/a`, `∫_0^1 dx/x = ∞`; seminorm `0` at `p = 0` | sound |
| §1.1 gluing | compact `K ⊆ s₁ ∪ s₂`, two compact neighbourhoods `C₁`, `C₂` | `μ|_K ≤ μ|_{C₁} + μ|_{C₂}`; for `p = ∞` the bound is `max` of the two | sound, every `p` |
| §1.3 `memW1pLoc_iUnion` | `ι` empty; half-planes; `{ℝ² ∖ 0, B(0,1)}` with `log |x|` | both sides true on `∅`; half-planes do not cover `ℝ²`; both sides true iff `p < 2` | sound |
| §2.1 null sets | projection `ℝ² → ℝ`; constant map; `E' = 0`, `E = ℝ` | image `ℝ` of a null line, measure `∞`, `finrank 2 > 1`; preimage of a point is `ℝ²`; image of at most one point is null | sound |
| §2.2 `precomp_localDiffeomorph` | `θ = 2y`, `u = |x|`; `θ = z²`, `u = log |w|`; `θ = y³ + y`; `E = E' = 0` | `2⟨y,·⟩/|y|` on both sides; `⟨z², 2zh⟩/|z|⁴ = 2⟨z,h⟩/|z|²`; `(3y² + 1) sign y`, unbounded; zero space: `U = 0` forced, both sides hold | sound |
| §2.2 negative control | `θ(y) = (y₁, 0)`, `u = log |x|` | `∫_{[−1,1]²} |y₁|^{−1} = ∞` | hypothesis used |
| §2.3 `postcomp_boundedDerivative` and repaired route | `G = id`, `u = x³`, mollifier of variance `σ²` | `u_ε = x³ + 3σ²ε²x`, `Du_ε − U = 3σ²ε²`; `L¹(−1,1)` norm `6σ²ε²`; `3σ²ε² > 6x²` iff `|x| < σε/√2` | repaired route sound |
| §2.3 negative control | `G = e^{t²}`, `u = log |x|` | `(log |x|)² ≥ −2 log |x|` iff `|x| ≤ e^{−2}`; `2π ∫ dr/r = ∞` | sound; R01 fixes its citation |
| §2.4 `postcomp_continuous` | `G = log` on `(0, ∞)`, `u = |x|` on `ℝ² ∖ 0`; `G(s,t) = st` | `⟨x,·⟩/|x|²`; `u₂Du₁ + u₁Du₂`; cut-off `G̃ = G` near `u(V̄)` so `DG̃(u) = DG(u)` on `V` | sound |
| §3.1 `isNullSet_iff_riemannianVolume_eq_zero` | dimension `0`; `M = [0, ∞)`, `s = {0}`; density `1 + |x₁|^{1/2}` | only `∅` null on both sides; `{0}` null on both sides; `∫_0^1 (1 + t^{1/2}) = 5/3`, segment null | sound, boundary allowed |
| §3.3 null sets on manifolds | `ℝ × D`, `D` discrete uncountable, `s = {0} × D`, `f(x,d) = d` | each chart image `{0}`, null; `f(s) = ℝ`, not null | countable cover needed and present |
| §4.2 `MemManifoldW1pLoc`, `memManifoldW1pLoc_iff_atlases` | angle map `|t|^{1/2}`; source atlas `{x³}`; `M = ∅` | derivative `|t|^{−1/2}/2`, in `L^p_loc` iff `p < 2`; `y^{1/3}`, `|y|^{−2/3}/3`, iff `p < 3/2`; both sides true | sound |
| §4.3 `HasWeakMDeriv`, `exists_hasWeakMDeriv` | `φ = 2x`, `f = id`; change `D` at `t = 1`; `log |x|` on `1 < |x| < 2` | `1 · Df · (1/2) = 1/2`, `Df = 1`; difference set `{1}`, null; vector norm `1/|x| ∈ (1/2, 1)` against manifold total `0` | sound; F01 repaired |
| §4.4 `contMDiff_memManifoldW1pLoc` | `t|t|`; `p = ∞` | `mfderiv = 2|t|`, continuous, bounded on compacts | sound |
| §4.6 chain rules | `θ = 2y`, `f = |t|^{1/2}`; `θ = (y₁, 0)`, `f = |x|^{1/2}` on `ℝ²` | `2 Df(2y) = sign(y)|2y|^{−1/2}`, derivative of `√2 |y|^{1/2}`; `p < 4` against `p < 2` | sound |
| §5.1 norm and chart comparison | `id : ℝ → (ℝ, 4dt²)`; circle of radius `3`; chart `2x` | `2`; `3|t|^{−1/2}/2`; chart norm `1/2` against `‖Df‖ = 1` | sound |
| §5.2 `memManifoldW1pLoc_iff_norm` | `|t|^{1/2}`; `t log |t|`; non-Hausdorff `M` | both sides iff `p < 2`; both true for finite `p`, false at `∞`; compact `K` covered by finitely many chart-compact neighbourhoods, `vol|_K ≤ Σ vol|_{C_i}` | sound; R03 |
| §5.3 comparable metrics | `g' = c² g` on `N`; `dx² + 4dy²` | `‖A‖' = c‖A‖` both bounds; `‖id‖' = 2 = β/a` | sound |
| §6.1 oriented Jacobian | `diag(2,1)`; `diag(−1,1)`; bases `(2e₁, e₂)`; `n = 0` | `2`; `−1`, and `+1` to the reversed orientation; matrix determinant `2` against `J(id) = 1`; `±1`, `normDet = 1`, `1 ≤ 0⁰` | sound |
| §6.2–6.3 `jacobian_hadamard_integrability` | `id`, chart `2x`, target `4dt²`; model bases `a`, `b`; reindexing `σ_E`, `σ_F`; `x|x|^{−1/2}` | `(1/2)·2/(1/2) = 2`; `sign(a) sign(b) · a/(2b) · 2|b|/(|a|/2) = 2`; factors `s_E s_F (s_E s_F) = 1`; `J = |x|^{−1}/2 ≤ |x|^{−1}`, `p < 4`, `q < 2 = p/n` | sound |
| §6.4 `jacobian_changeOfVariables` | `2x`; `−x`; `z²` on `1 < |z| < 2`; two components of opposite orientation | `2 = vol[0,2]`; `|j| = 1`, `1 = 1`; `30π` against `15π` (not injective); `1 + 1 = 2` | sound; R04 |
| §6.4 extended integral | `(√|x|, y)` on `[−1,1]²` | `∫ |J| = 2 · ∫_{−1}^{1} dx/(2√|x|) = 4`; `‖Df‖² ≥ 1/(4|x|)`, integral `∞` | sound |
| §7.1 `euclidean_compatibility` | `Ω = ∅`; `E = 0`; `E = (ℝ², sup)` | both sides true; `U = 0`, both sides true; chart is `Subtype.val`, representative `u` on `Ω`, transported field `U` | sound; R02 |
| §7.1 `euclidean_volume`, `euclidean_jacobian` | `(a, b) ⊆ ℝ` with model basis `c ≠ 0`; reflection; `z²`; `n = 0` | density `|c|` times basis Haar mass `(b − a)/|c|` gives `b − a`; `−1 = det`, `normDet = 1`; `4|z|²`; `1` | sound |
| §8.1 local retraction | circle; `s³`; figure-eight | `r(v) = v/|v|`; only left inverse `s^{1/3}`, derivative `|t|^{−2/3}/3` unbounded; patch in the source | sound |
| §8.2 `immersion_comparison` | circle map; `ι = s³`, `f = t^{1/3}`; double cover `z²` | `|t|^{−1/2}/2` both sides; `ι ∘ f = id` against `p < 3/2`; both `p < 2` | sound |
| §8.4 `embedding_independence` | `(s, exp exp s)`, `u = log log(1/|x|)`; half-angle map; `z` and `(z, z²)` | `∫_0^{1/e} dr/(r log²(1/r)) = 1`, second coordinate `1/|x|` with `∫ r^{−2} r dr = ∞`; jump of `ι₂ ∘ u`; norms `1/|x|`, `√5/|x|`, both `p < 2` | sound |
| Conventions, direction and metric witnesses | `φ = 2x`; `4dt²` | `Df = 1` (not `1/4`, `1/2`); `‖Df‖ = 2`, `J_f = 2` | sound |

For the sections no repair touched and outside the sample (§1.2, §1.4, §3.2, §4.1, §4.5, §8.3 and the
worked examples), the round-1 table carries computed values in every row; those rows were read
against the present text and stand, apart from the two cross-references of R01.

### Sources: the seeded sample

| Target | Locator | Outcome |
| --- | --- | --- |
| 1.1 | Mazya2011 §1.1 | uncertified; not read |
| 2.1, 3.3 | Lee2012 Ch. 6 | uncertified; the two library inputs were opened instead |
| 2.2 | Ziemer1989 Theorem 2.2.2; Mazya2011 §1.1 | uncertified |
| 2.3, 2.4 | Ziemer1989 Theorem 2.1.11; Mazya2011 §1.1 | uncertified; the README says the scalar statement is extended |
| 4.2 | HeikkilaPankka2025 line 22–23 | read: the continuous class `W^{1,n}_loc(M, N)` is named there for oriented Riemannian `n`-manifolds, `n ≥ 2`; the chartwise definition and atlas independence are this roadmap's |
| 4.6 | Ziemer1989 Theorems 2.1.11, 2.2.2 | uncertified |
| 5.1 | HeikkilaPankka2025 line 26; Rickman1993 Ch. I §1 | line 26 read: the operator norm of the weak differential; Rickman uncertified |
| 5.3 | Hajlasz2009 line 104–106 | read: equivalence of Riemannian metrics on a compact manifold; the README says so and gives its own compactness argument |
| 6.1 | MartioRickmanVaisala1969 line 124; Rickman1993 Ch. I §1 | line 124 read: the Jacobian `J(x, f)` on domains of `ℝⁿ` |
| 6.4 | Lee2012 Ch. 16; HeikkilaPankka2025 line 25–27 | lines 25–27 read: determinant notation only, as the README now says |
| 7.1 | MartioRickmanVaisala1969 line 124, lines 332–340 | read: the Jacobian, and Definition 2.16 of `ACL` and `ACL^p`; the README claims no `ACL` equivalence |
| 8.1 | Lee2012 Ch. 4 | uncertified |
| 8.2 | Hajlasz2009 line 28; HeikkilaPankka2025 line 1328–1329 | read: the class through an embedding, compact manifolds and `1 ≤ p < ∞`; the `W^{1,∞}` step through a Nash embedding |

Also read: Hajlasz2009 lines 23–28, 37–53, 106–107, 129–130 and 138–141 against the Conventions, §8.3,
§8.4 and the Part II scope; each says what the README attributes to it. All eight cited works are
in the manifest, one key each; no author flagged a locator as unverified.

### Duplication, ownership and suppliers

- Searched both pinned libraries by object for a chartwise-null/volume-null equivalence, a flat
  Riemannian volume identity, a local `Lᵖ` carrier and a manifold weak differential.
  `TauCeti/Geometry/Manifold/Sard/EqualDimension.lean:90` and `:105` (null images of critical
  points) and `UpperHalfPlane.riemannianVolume_eq_volume`
  (`TauCeti/Analysis/Complex/UpperHalfPlane/PoincareMetric.lean:181`) are the nearest; neither
  states a target of this roadmap. The Loogle and LeanSearch leads for the 21 declarations contain
  no statement of any of them.
- Cross-roadmap citations resolved now: on main, PDE Layer 1 (README:675), GeometricCurrents G6
  (heading :668, `W^{j,p}_loc` and finite-cover gluing :750–753), PseudoholomorphicCurveAnalysis
  PH1.1 (:213), PH1.2 (:279), PH4.1 (:807), SobolevPolynomialApproximation §2.1 (:324),
  PseudodifferentialOperators §5.2 (:967), RiemannianGeometry R4.6 (:120), DifferentialGeometry
  2.1–2.2 (orientations, :314), 12.1 (:2801) and 12.4 (:2896), GeometricMeasureTheory G2 (:148); at open heads,
  SobolevDifferentialForms §4.1 (:388) and TeichmullerGeometry §7.4 (:742). All exist and say what
  is cited.
- Overlaps: no other open pull request changes this roadmap, drops an id it cites, or defines one
  only in a revision. Of the closest roadmaps, QuasiregularMaps at its head names this roadmap as
  owner of the class, `Df`, `‖Df‖`, `J(A)` and `J_f` through six declared gaps and owns only the
  locally Lipschitz membership (its §2.8); no object has two owners.
- This package declares no supplier gap.
- Dependency check, exact command of the brief:

  ```text
  depcheck: 236 roadmaps, 2133 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line. Every `*Needs:*` line cites earlier sections, pinned declarations or
  roadmaps on main. For the intake: `merge-order/ORDER.txt` lists QuasiregularMaps (line 288) before
  this roadmap (line 402) although it consumes it; this is the consumer's placement, not a defect of
  this package.

### Remarks that need no change

- `hi` in `jacobian_changeOfVariables` (bijective differential) is part of the README's definition
  of a `C¹` open embedding in §6.4; the identity also holds for `x ↦ x³` (`∫_0^1 3x² = 1`), so the
  hypothesis narrows the class but agrees with the README.
- `hp : 1 ≤ p` is not needed by `memW1pLoc_iUnion` or `contMDiff_memManifoldW1pLoc`; it is the
  roadmap's standing exponent convention.

## Not verifiable

- Ziemer1989 (Ch. 2 §2.1, Theorems 2.1.11 and 2.2.2), Mazya2011 (§1.1), Rickman1993 (Ch. I §1),
  Lee2012 (Ch. 4, 6, 15, 16): settled as uncertified, paywalled; the texts were not read and the
  theorem numbers, hypotheses and pages could not be checked.
- Bethuel1991 (Introduction): settled as uncertified; no text is cached.
- MartioRickmanVaisala1969: the scan's extraction is noisy; lines 118–125 and 332–340 are legible,
  but the printed page numbers are not, so "page 6" in the manifest was confirmed only as the page
  of the extraction.
- Ownership against open pull requests was checked for the roadmaps the overlap ledger lists and
  the cited ones; the other open heads were searched only through the overlap and citation tools.

## Source issues

- **Misprint** in HeikkilaPankka2025 at Appendix B, proof of Proposition B.1, printed p. 24 (line 1328): the source says the map into the target manifold is composed before the embedding in the written order; it should be the embedding applied after the map; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1c2539704dcc3744603dbfa8412f4339ff3aed21", "job": "REV-PKG-SobolevMapsBetweenManifolds~2", "model": "fable", "worker": "chris-x10"} -->
