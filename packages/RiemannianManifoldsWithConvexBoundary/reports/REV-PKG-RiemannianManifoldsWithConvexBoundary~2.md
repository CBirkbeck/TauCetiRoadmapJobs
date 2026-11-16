<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18017#issuecomment-6907578958 -->
Review (claude) of 7d45a7e

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) the product `T = τ(x, v) τ(x, −v)`, half of the named end theorem, is not stated

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/Suggested.lean` lines 286–303
   (`exists_contMDiff_eq_exitTime_sub_exitTime_neg`) and the module docstring, "Every headline
   theorem of the roadmap is statable at the pins and is stated here";
   `packages/RiemannianManifoldsWithConvexBoundary/README.md` line 25, "the regularity of the exit
   time (Paternain–Salo–Uhlmann, Lemmas 3.2.3–3.2.11)".

   **Claim.** The Lean file states the end theorem "regularity of the exit time", which the Summary
   identifies with Lemmas 3.2.3–3.2.11 and describes as the regularity of `τ` at the glancing set.

   **Witness.** Lemma 3.2.11 (`paternain-salo-uhlmann2023` lines 3027–3030) asserts smoothness of two
   functions, the difference and the product; README §5.4 has both ("`σ` … and `T` … are smooth").
   The Lean file states `σ` only. `σ` smooth and `τ` continuous do not give `T` smooth, so
   `τ = (σ + √(σ² + 4T))/2` at `∂₀SM` is not reached.

   **Repair.**

   1. In `Suggested.lean`, after `exists_contMDiff_eq_exitTime_sub_exitTime_neg`, add

      ```lean
      /-- **`T` is smooth.** On a compact Hausdorff non-trapping `(M, g)` with strictly convex
      boundary, `T(x, v) = τ(x, v) τ(x, −v)` is, on the unit sphere bundle `SM`, the restriction of a
      smooth function on `TM`. With `σ` it describes the exit time at the glancing set:
      `τ = (σ + √(σ² + 4T))/2` on `SM` (README §5.4; Paternain–Salo–Uhlmann, Lemma 3.2.11 and
      Remark 3.2.13). -/
      theorem exists_contMDiff_eq_exitTime_mul_exitTime_neg [T2Space M] [CompactSpace M]
          [IsContMDiffRiemannianBundle (𝓡∂ (n + 1)) ∞ (EuclideanSpace ℝ (Fin (n + 1)))
            (fun x : M ↦ TangentSpace (𝓡∂ (n + 1)) x)]
          (hconv : IsStrictlyConvexBoundary n M) (htrap : IsNonTrapping n M) :
          ∃ G : TangentBundle (𝓡∂ (n + 1)) M → ℝ, ContMDiff (𝓡∂ (n + 1)).tangent 𝓘(ℝ) ∞ G ∧
            ∀ z : TangentBundle (𝓡∂ (n + 1)) M, ‖z.snd‖ = 1 →
              G z = (exitTime z).toReal *
                (exitTime (TotalSpace.mk z.proj (-z.snd) : TangentBundle (𝓡∂ (n + 1)) M)).toReal := by
        sorry
      ```

   2. In README §5.4, in the bullet "Intrinsic reading on `TM`", after the sentence on `F` add: "and
      there is a smooth `G` on `TM` equal to `T` on `SM`
      (`exists_contMDiff_eq_exitTime_mul_exitTime_neg`)."
   3. In the module docstring, write the Layer 5 item as "the regularity of the exit time, the
      smoothness of `σ` and `T` and the identity `Xσ = −2` (§5.4)".
   4. In the README Summary write "(Paternain–Salo–Uhlmann, Lemmas 3.2.3 and 3.2.11)", so that the
      end theorem named is the one stated: Lemma 3.2.6 is the restriction of `σ` to `∂SM`, Lemma 3.2.9
      follows from `σ` and `T` by Remark 3.2.13, and Lemma 3.2.8 (which needs `μ`, hence the inward
      unit normal, not a declaration at the pins) stays a target of §5.4.

   Tested: the theorem elaborates on a scratch copy against the pins, `sorry` the only warning; its
   elaborated type keeps `[T2Space M] [CompactSpace M]` and both metric binders; the one-tactic probe
   (`rfl`, `simp` with the definitions, `tauto`, `exact?`, the constant `0`, and the `σ` theorem with
   `simp`) does not close it. Values: closed unit ball, `τ(x, ±v) = ∓⟨x, v⟩ + √(⟨x, v⟩² + 1 − |x|²)`,
   product `1 − |x|²`, and `G(x, v) = 1 − |x|²` is smooth on `TM`; `M = [a, b]`,
   `G(x, v) = (b − x)(x − a)` at `v = ±1`; `M = ∅` holds trivially; a closed nonempty `M` is trapped,
   so the hypothesis fails. The truth is Lemma 3.2.11 followed by the radial extension off `SM` with
   a cutoff near the zero section, as for `σ`.

2. **F02** (P3) two docstrings cite the wrong lemmas of the source

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/Suggested.lean` line 277, "Lemmas
   3.2.3 and 3.2.6, Exercise 3.2.4", and lines 291–292, "Lemmas 3.2.8, 3.2.9 and 3.2.11, Exercise
   3.3.3".

   **Claim.** `contMDiffOn_exitTime` is Lemmas 3.2.3 and 3.2.6; the `σ` theorem, with "on `∂SM`, `σ`
   is the odd extension `τ̃`", is Lemmas 3.2.8, 3.2.9 and 3.2.11.

   **Witness.** `paternain-salo-uhlmann2023` lines 2896–2902: Lemma 3.2.6 is the odd extension on
   `∂SM`. Lines 2935–2939: Lemma 3.2.8 is the extension of `μ/τ̃`, which neither theorem states.
   Lines 2926–2929: Remark 3.2.7 identifies `σ|∂SM` with `τ̃`.

   **Repair.** Line 277: "Lemma 3.2.3, Exercise 3.2.4". Lines 291–292: "Lemmas 3.2.6, 3.2.9 and
   3.2.11, Remark 3.2.7, Exercise 3.3.3". Checked against the text: Lemma 3.2.3 (line 2865) is
   continuity on `SM` and smoothness off `∂₀SM`; Exercise 3.2.4 (line 2891) the continuity; Lemma
   3.2.11 (line 3027) and Exercise 3.3.3 (line 3110) the smoothness of `σ` and `Xσ = −2`.

Two findings, one blocking (P2) and one P3. Both repairs of the previous round hold. Every
statement of `Suggested.lean` that is there is sound; the blocking finding is a statable half of a
named end theorem that the file does not state. No maintainer notes were left for this roadmap.

## Previous findings, one by one

- **F01 (P2), `geodesicEndpoint` and `α` for `T < 0` and infinite exit time: repaired.**
  `packages/RiemannianManifoldsWithConvexBoundary/README.md` §5.6 now reads "`α(z)`
  (`scatteringRelation`) is `geodesicEndpoint z τ(z)` when `0 < τ(z) < ∞`, and otherwise `(y, −w)`
  for `(y, w) = geodesicEndpoint (x, −v) T′` … `T′ = 0` when it is infinite", and the API bullet
  "for `T > 0`, it is `φ_T(z)` whenever … ; for `T ≤ 0` it is `z`". The docstring of
  `scatteringRelation` says "positive finite exit time". Checked against the Lean body
  (`0 < (exitTime z).toReal`, and `ENNReal.toReal ⊤ = 0`) and against the pin:
  `TauCeti.Manifold.IsGeodesicCurveOn` has the field `uniqueDiffOn`
  (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean` line 102) and
  `IsGeodesicCurveOnFrom` the field `zero_mem` (line 134), so no geodesic exists on `Icc 0 T` for
  `T ≤ 0`. The two added Checks (`T = −1`; the zero vector) are recomputed in the table below.
- **F02 (P3), manifest locator of `stefanov-uhlmann-vasy2021`: repaired.**
  `sources.toml` now has `locator = "Abstract; Section 1 (condition (1.1), Theorems 1.1-1.4)"` and
  the README's References "abstract and Section 1 (condition (1.1), Theorems 1.1–1.4), lines
  8–230". Read at the text: abstract `stefanov-uhlmann-vasy2021` lines 8–23, Section 1 heading
  line 24, (1.1) line 67, Theorems 1.1–1.4 lines 89, 99, 198, 210. The two entries repaired with
  it also hold: `uhlmann-vasy2016` Section 1 at line 15 and Section 3 at line 498;
  `paternain-salo-uhlmann2023` lines 307–310 are in the Preface, Section 2.5 starts at line 2443.

Pattern search for F01 (a real time read off `[0, ∞]`, or an endpoint at a time where no geodesic
exists) in the rest of the package: §5.2 (`sup` over `T > 0` against the Lean `⨆` over all real
`T`), §5.4 and the four Lean theorems that use `(exitTime z).toReal` (all on nonzero or unit
vectors of a non-trapping `M`, where `τ < ∞` by homogeneity). No further instance.

## Verified sound

**Elaboration.** `lake env lean` on `packages/RiemannianManifoldsWithConvexBoundary/Suggested.lean`
from the content checkout: exit 0, ten warnings, all `declaration uses sorry` (lines 113, 150, 179,
190, 213, 278, 293, 310, 331, 349). No `set_option`, `lemma`, `#eval`, `example` or sorried data;
`import Mathlib` then six `TauCeti.*` modules, each present at the pin. 21 declarations: 11
definitions with real bodies, 10 theorems.

**Signatures.** `#check @name` for all 21 declarations in one scratch file, elaborated once and
compared with the README statements: all agree, nothing changed. `IsBoundaryDefiningFunctionOn`
has no `IsManifold` binder and needs none (`ContMDiffOn` and `mfderiv` need the charted space
only). Every theorem carries the `C¹` binder its definitions use and the smooth binder it adds.

**Padding probe, all 10 theorems.** Each `sorry` replaced by `first | rfl | infer_instance |
trivial | simp | simp [the ten definitions] | tauto | intros; assumption | exact?`: 10 errors, one
per theorem. None restates a definition, mirrors a Check, computes a value or treats a boundary
case.

**Headline theorems** (README Summary): Hessian characterisation
(`isStrictlyConvexAt_iff_hessian_neg`); realisation (`exists_isSmoothEmbedding_regularDomain`);
leaving of tangent geodesics (`not_exists_isGeodesicCurveOnFrom_of_isStrictlyConvexAt`,
`mem_interior_of_isGeodesicCurveOn`); convexity functions (`exists_convexityFunction`); exit-time
regularity (`contMDiffOn_exitTime`, `exists_contMDiff_eq_exitTime_sub_exitTime_neg`; incomplete,
R01); Proposition 3.3.1 (`isNonTrapping_tfae`); the scattering relation
(`scatteringRelation_involutive`, `exists_contMDiffOn_eq_scatteringRelation`). All 21 Lean names
appear in the README and every backticked name the README attributes to this roadmap is declared.

**Adversarial table** (repaired passages, sampled targets, headlines, the target of R01).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §5.6 `geodesicEndpoint`, `T ≤ 0` (repaired) | disc, `z = ((0,−1),(0,1))`, `T = −1, 0, 1, 3` | `Icc 0 (−1) = ∅`, `zero_mem` fails, value `z ≠ φ_{−1}z = ((0,−2),(0,1))`; `{0}` not `UniqueDiffOn`, value `z`; `T = 1`: `((0,0),(0,1))`; `T = 3 > τ = 2`: `z` | sound |
| §5.6 `α` definition (repaired) | inward, outward, glancing unit `z`; zero vector | inward `τ = 2`, `α = ((0,1),(0,1))`; outward `τ = 0`, `T′ = 2`, flipped `((0,1),(0,−1)) = (x − 2⟨x,v⟩v, v)`; glancing `T′ = 0`, `−(−z) = z`; `(x,0)`: `toReal ⊤ = 0`, `α = (x,0)` | sound |
| 1.1 trichotomy | half-plane; disc at `(0,−1)`; `[0,1]` | `ker dx⁰ = ℝe₁`; `dx⁰(−e₀) = −1`; `(t,1)` inward; `n = 0`: `T_q∂M = 0` | sound |
| 1.2 `ν_in` chart formula | `g = [[1,a],[a,1]]`, `a = ½` | `g⁻¹e⁰ = (1,−a)/(1−a²)`, unit: `(2/√3, −1/√3)`; `g(e₀−ae₁, e₁) = 0` | sound |
| 1.5 Weingarten, `H` | sphere; cylinder; exterior; `n = 0` | `S = id`, `H = 1`; curvatures `1, 0`, `H = ½`; `−1`; `H` undefined | sound |
| 1.6 conformal law | `φ = log 2`; `φ = −|x|²`; derivation | `2h`; `dφ(ν_in) = 2`, `II = −e⁻¹h`, `Ĥ = −e`; `ĝ(∇̂_XY, ν̂_in) = e^φ(II − dφ(ν_in)h)` from `∇̂_XY = ∇_XY + … − g(X,Y)∇φ` | sound |
| 2.2 Hessian iff (Lean) | `ρ′ = (2+x₁)ρ`; `−ρ`; `n = 0` | `ρ = u x⁰`, `u(q) > 0`, `Hess ρ = u(q) Hess x⁰` on `T_q∂M`; `−2(2+x₁)h < 0`; both sides vacuous | sound, both directions |
| 3.1 regular domains | ball with `e^{x₁}`; `(2+x₁)(1−|x|²)`; cone | same `II = h`; value `8` at `x₁ = −3`, extra half-space; critical point at `0` | sound |
| 3.4 extension | `√x`; `(x + 1/100)dx²`; `∂M = ∅` | not smooth at `0`; positive only for `x > −1/100`; `ψ·ext + (1−ψ)g_N` positive where `ψ > 0` lies in the positivity set | sound |
| 3.5 realisation (Lean) | `M = ∅`; closed `M`; `S¹ ⊔ [0,1]`; `[0,∞)`; codimension-0 `IsSmoothEmbedding` | `N = ∅`; `ρ ≡ 1`, `{ρ = 0} = ∅ = j(∂M)`; double = 3 circles; `(−1,∞)`; complement `F = 0`, chart map the inclusion of the half-space | sound |
| 3.6 `B = II ν_in`, Gauss | sphere; cylinder; exterior | `⟨−⟨X,Y⟩x, −x⟩ = ⟨X,Y⟩`; `K = 0 + 1·1 − 0 = 1`; `0 + 1·0 − 0 = 0`; `⟨B, +x⟩ = −h` | sound |
| 4.1 geodesics of a domain | ball tangent; `v = 0`; half-space | `|q+tv|² = 1 + t²|v|² > 1`; constant curve on `ℝ`; boundary line stays in `∂M` | sound |
| 4.2 leaving, no interior tangency (Lean) | ball; exterior; `{y ≥ x⁴}`; `n = 0`; non-Hausdorff `M` | `ρ = −t²`, `″ = −2 = −|dρ|II`; `+t²`; `−t⁴` with `II = 0`; tangent velocity `0` against constant nonzero speed; argument is in one chart | sound |
| 4.5 convexity function (Lean) | disc at `(0,−1)`; `dim 1`; `dim 0`; `x = −ρ` | `Hess x̃ = (2−2ε)g`, `dx̃_q = (0,−2)`, `K_c ⊆ {ε|z−q|² ≤ c}`; interval; hypothesis false; `x = −ρ` fails compactness for a non-compact boundary | sound, not vacuous |
| 4.6 enlargements | ball `ε = ½, ε₁ = ¼`; cap; `(1−|x|²)e^{−|x|²}` | radius `1+δ`, `II = h/(1+δ)`; convex iff `R+δ < π/2`; radial derivative `−2r(2−r²)e^{−r²}`, `−2/e` at `1`, minimum `−e⁻²` at `√2` | sound |
| 5.4 `contMDiffOn_exitTime` (Lean) | `[a,b]`; outward boundary vector; glancing | `τ = (b−x)/v`, `(x−a)/|v|`, smooth, `→ 0` at `(a, v<0)`; IFT root with `t = 0` on `∂M`; `τ = Q(√a)`, `Q(0,z₀) = 0` | sound |
| 5.4 `σ`, `Xσ = −2` (Lean) | ball; `[a,b]` | `σ = −2⟨x,v⟩`, `dσ(v,0) = −2`; `F = (a+b−2x)v`, `dF(v,0) = −2v² = −2` | sound |
| 5.4 `T` | ball; `[a,b]` | `1 − |x|²`; `(b−x)(x−a)`; `a = σ² + 4T = 4(⟨x,v⟩² + 1 − |x|²)` | **R01** |
| 5.5 TFAE (Lean) | `∅`; closed `M`; `[0,1]`; `S¹ ⊔ [0,1]` | all true; all false (`Xf = 0` at a maximum on `SM`, `τ ≡ ∞`); `f = xv`, `Xf = 1`, `u = ∫₀ˣ h/v`; all false | sound |
| 5.6 involution (Lean) | inward, outward, glancing `z`; `[a,b]` | `α(αz) = z` through the other branch each time; outwardness flips; `α(a,+1) = (b,+1)`; no fixed point for `n = 0` | sound |
| 5.6 smoothness (Lean) | `F = α ∘ π`, `π(x⁰,x′,v) = (0, x′, v/|v|)` | smooth into `TM`, equal to `α` on `∂SM`; the flow itself may leave `TM` off `∂SM` | sound |
| 6.2 half-space, exterior | `q + tv`; Euclidean `b = r` | `ρ ≡ 0`; `t²|v|²`; `r̈(0) = rθ̇² > 0`: source's convex circle = boundary of the ball | sound |
| 6.3 caps, hyperbolic balls | `R = π/4`; `p = 2e`; `(0,2)`; `n = 0` | `|dρ|² = sin²R`, `II = cot R·h`; `1/√15 ≈ 0.258`; `u = 5/4`, `|du| = 3/4`; `Hess u_xx = u/y²`; `coth 1 ≈ 1.313`, `cot 1 ≈ 0.642`; `τ = R ∓ θ` | sound |
| 6.4 small balls | flat torus; `S^{n+1}`; `S¹` | `Hess|z|² = 2δ − 2z_kΓ^k_ij`; `II = 4h` at `R = ¼`, `τ ≤ ½`; `r_p ≤ π/2`; every `r_p ≤ π` | sound |

**Library declarations at the pins.** 87 backticked library names of the README resolved by
script against the pinned Mathlib and Tau Ceti, none missing (`exists_halfSpaceOutwardUnitNormal`
is DifferentialGeometry's, `TauCetiRoadmap/DifferentialGeometry/Suggested.lean` line 1020, cited as
12.5). Read in full for this round: `IsGeodesicCurveOn`, `IsGeodesicCurveOnFrom`
(`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean` lines 102, 134);
`curveVelocityWithin` (`TauCeti/Geometry/Manifold/MFDeriv/Curve.lean` line 135);
`hessian` (`TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean` line 135, `IsManifold I 2`, `C¹`
metric, no boundaryless hypothesis); `geodesicSpray`
(`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Spray.lean` line 104, any model);
`IsOutwardPointing` (`TauCeti/Geometry/Manifold/Boundary/Orientation.lean` line 46, includes
`x ∈ ∂M`); `TauCeti.secondFundamentalForm`
(`TauCeti/Analysis/InnerProductSpace/SecondFundamentalForm.lean` line 82, a different object under
a different fully qualified name).

**Duplication audit.** Grep of the pinned libraries by object (exit time, scattering relation,
non-trapping, glancing, defining function, outward or inward unit normal, convex boundary, mean
curvature of a boundary): the only hits are Morse-chart exit times
(`TauCeti/Geometry/Manifold/Morse/PseudoGradient/Passage.lean`) and defining functions of
hypersurfaces in symplectic files, different objects. `roadmaps grep` over main and the open heads
for scattering relation, non-trapping, boundary defining function, strictly convex boundary,
convex boundary, boundary normal coordinates: no match; "exit time" matches only stopping times
(DysonBrownianMotion, StochasticCalculus). `scratch/overlaps.md`: no other pull request changes
this roadmap, no dropped id, no id defined only by a revision, no second copy.

Overlap check: read RiemannianGeometry, RiemannianGeometry/Surfaces, HopfRinow, SmoothBundlesConnections (main), LorentzianGeometry, ManifoldOptimization (open); immersion second fundamental form and Gauss equation: RiemannianGeometry R5a (cited in 3.6); sublevel inclusion and normal collar: RiemannianGeometry R7.9 (cited in 3.1, 4.3); compact collar presentation: RiemannianGeometry R5c (cited in 3.5); normal strips: Surfaces 1.2–1.3 (cited in 4.4); uniform normal radii: SmoothBundlesConnections B6.0 (cited in 6.4); nothing owned twice.

**Supplier-order audit.** `depcheck: 246 roadmaps, 2297 edges, 0 problem(s)`; no UPWARD, CYCLE or
`moved:` line. Every supplier is on main and each citation was resolved there again:
DifferentialGeometry 5.1 (README line 1648), 12.1, 12.2 (lines 2801, 2848), 12.5 (line 2950, "these
three laws determine N at each point"); HopfRinow Layers 1 and 2 (`Completed/HopfRinow/README.md`
lines 264, 427); RiemannianGeometry 2.2 (R1.4) (line 1576), R5a (line 3205; conventions lines
188–192), R5c (line 3715; Seeley extension line 3873, defining function lines 3886–3887), R7.9
(line 4469; "at most two" line 4525, outward criterion lines 4589–4591); Surfaces 1.2, 1.3 (lines
296, 340); GeometricTopology 1.1, 1.3 (lines 788, 851; interval collar line 815; compact and
connected clauses of the gluing as cited); ComplexKahlerGeometry K5a (Seeley extension, line 1796);
SmoothBundlesConnections B6.0 (line 1306, uniform normal radii with `IsNormalDomain`);
AffineMorseLefschetz 4.5 (line 819); PositiveMass 5.1–5.2 (lines 921, 957), a consumer. No gap is
declared and none is needed. No roadmap of the never-cite list is cited.

**Shape and policy.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to
read the build, six layers each ending with Examples and Dependencies, Downstream consumers,
References. Every definition has its API and at least three Checks; theorems carry hypotheses and
locators. Scan of the README and the Lean file for process words, pull-request numbers, dates,
anchors, machine paths and LaTeX delimiters: none. The layers are named by their mathematics.

**Sources.** Read at the cited lines for the 15 sampled targets and the repaired locators:
`paternain-salo-uhlmann2023` lines 307–310, 2443–2530, 2640–2700, 2726–2850, 2862–2970, 3027–3060,
3078–3127; `stefanov-uhlmann-vasy2021` lines 8–26, 53, 64–73, 87–101, 126–135, 148–163, 196–222;
`uhlmann-vasy2016` lines 13–34, 47–52, 132–141, 496–524. Theorem numbers, hypotheses and
statements agree with the README, apart from R02. The author flagged no locator as unverified.
All six cited works are in the manifest.

**Copyright.** Wording: besides the sampled locators, the README or docstring was set beside the
source for the definition of `II` (lines 2730–2737), the fold form (Lemma 3.2.9), the route of 5.5
(proof of Proposition 3.3.1), the construction of 4.5 (`uhlmann-vasy2016` lines 504–524), the
realisation theorem (Lemma 3.1.8), the remark on Definition 2.5.1, the Herglotz condition
(`stefanov-uhlmann-vasy2021` lines 65–72), and the docstrings of `exitTime` and
`scatteringRelation`: own wording and notation; the longest shared runs are statements the
mathematics fixes (Proposition 3.3.1, Lemma 3.2.8). Arrangement: the source cited most is
`paternain-salo-uhlmann2023`; its Sections 3.1–3.3 do not map onto sections here (3.1 is spread
over Layers 1–4 and 5.1–5.2, 5.3 lifts two lemmas out of 3.2, 5.5 and 5.6 split 3.3), and the order
5.2 → 5.4 → 5.5, 5.6 is forced by the `*Needs:*` lines of 5.4 (5.2, 5.3), 5.5 (5.4) and 5.6 (5.4).
Reuse: no table, figure or exercise list taken over.

Source independence: 15 passages compared with 3 sources, none shared beyond statements the mathematics fixes; largest share paternain-salo-uhlmann2023, 47 of 86 named citations; contents compared with paternain-salo-uhlmann2023 (Sections 2.5, 3.1–3.3): independent; lee-riemannian2018, lee-smooth2012 and sharafutdinov1994 are uncertified and were not read.

## Not verifiable

- `lee-riemannian2018` (Ch. 5–8, cited in 1.2, 1.4, 1.5, 1.6, 3.6, 4.3, 4.4, 6.4): paywalled,
  settled as uncertified; the chapter locators were not checked against the text.
- `lee-smooth2012`, Theorem 9.25 (3.3): paywalled, settled as uncertified; GeometricTopology 1.1
  gives the same locator for the collar theorem.
- `sharafutdinov1994`, Ch. 4 (References only): paywalled, settled as uncertified; no target
  relies on it.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed page 64: the source says the second factor of the product is the exit time at `x − v`; it should be the exit time at `(x, −v)`; affects nothing.
- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed page 47: the source says the derivative of `b` is positive at `1`; it should be at the outer radius `r₁`; affects nothing.

## For the human reviewers

- **Licence.** `paternain-salo-uhlmann2023` was read from the authors' copy on an author's
  university page, recorded in `packages/RiemannianManifoldsWithConvexBoundary/sources.toml` with
  the publisher's personal-use notice (`licence_class = "author-page"`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7d45a7e32d4cbdc759d1eff3d290ea910bcb67c8", "job": "REV-PKG-RiemannianManifoldsWithConvexBoundary~2", "model": "fable", "worker": "chris-x26"} -->
