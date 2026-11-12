# Review of SobolevMapsBetweenManifolds (pull request #2230 at 8ab5f59)

**Verdict:** needs changes

## R01 (P2) — Chart independence and locality are statable headlines but absent

**Location:** `TauCetiRoadmap/SobolevMapsBetweenManifolds/README.md:24–25` "the class `W^{1,p}_loc(M, N)` does not depend on the atlases or the metrics, is local"; `Suggested.lean:18–21` states §4.2–§4.6 without either statement.

**Claim:** These two parts of the first end theorem can be stated at the pins, yet `Suggested.lean` does not state them. QuasiregularMaps consumes exactly these two properties (its gap `sobolev-maps-class`).

**Witness:** Both theorems below elaborate in section `Manifold` of a scratch copy of `Suggested.lean` with only `sorry` warnings. They use Mathlib's `IsManifold.maximalAtlas` and the charted-space instance on `Opens M`.

**Repair:** Insert before `IsSobolevMap.comp_contMDiff`:

```lean
/-- §4.2: the class does not depend on the charts: every pair of charts of the maximal atlases
tests it. -/
theorem isSobolevMap_iff_forall_maximalAtlas [CompleteSpace E'] {p : ℝ≥0∞} {f : M → N} :
    IsSobolevMap E E' p f ↔ Continuous f ∧
      ∀ e ∈ IsManifold.maximalAtlas 𝓘(ℝ, E) 1 M, ∀ e' ∈ IsManifold.maximalAtlas 𝓘(ℝ, E') 1 N,
        MemW1pLoc p ⟨interior ((e.extend 𝓘(ℝ, E)).target ∩
            (e.extend 𝓘(ℝ, E)).symm ⁻¹' (f ⁻¹' e'.source)), isOpen_interior⟩
          (e'.extend 𝓘(ℝ, E') ∘ f ∘ (e.extend 𝓘(ℝ, E)).symm) := by
  sorry

/-- §4.5: locality: a continuous map whose restrictions to the sets of an open cover are in the
class is in the class. -/
theorem IsSobolevMap.of_locally [CompleteSpace E'] {p : ℝ≥0∞} {f : M → N} (hf : Continuous f)
    (h : ∀ x, ∃ V : Opens M, x ∈ V ∧ IsSobolevMap E E' p (f ∘ ((↑) : V → M))) :
    IsSobolevMap E E' p f := by
  sorry
```

Then make these edits:
- README §4.2, end of the chart-independence bullet: add "(`isSobolevMap_iff_forall_maximalAtlas`)".
- README §4.5, end of the locality bullet: add "(`IsSobolevMap.of_locally`)".
- Module docstring: add "chart independence and locality (§4.2, §4.5)" to the "Stated here" list.

## R02 (P2) — The general §10.3 density theorem is statable; the docstring's reason is false

**Location:** `Suggested.lean:36–38` "density for a Banach target with a controlled retractive embedding (§10.3, general form): the controlled retraction data of Layer 10 (…) have no carrier at the pins".

**Claim:** The retraction data consist of an open set, two maps, a radius and predicates that Mathlib already has. The end theorem at `README.md:43–44` can therefore be stated, and it is absent.

**Witness:** The theorem below elaborates with only a `sorry` warning when placed before `end Manifold`. That placement keeps `E'` Banach; the `Density` section would add its `[FiniteDimensional ℝ E']`.

**Repair:** Insert before `end Manifold`:

```lean
/-- §10.3: on a closed source of dimension `n`, for a closed smooth embedding `ι` of a Banach
manifold into a Banach space with a controlled retraction (a smooth retraction `r` on an open
`U` containing the `δ`-tube of `ι(N)`, and a `C¹` map `P` with bounded derivative equal to
`ι ∘ r` on the `δ/2`-tube) and `n ≤ p < ∞`, every `u ∈ W^{1,p}(M; F)` with values in `ι(N)`
almost everywhere is a `W^{1,p}` limit of `ι ∘ g_j` with `g_j : M → N` smooth. -/
theorem exists_smooth_approx_of_controlledRetraction [CompleteSpace E'] [CompleteSpace F]
    [IsManifold 𝓘(ℝ, E) ∞ M] [CompactSpace M] [T2Space M] [IsManifold 𝓘(ℝ, E') ∞ N] [T2Space N]
    (ι : N → F) (hι : ContMDiff 𝓘(ℝ, E') 𝓘(ℝ, F) ∞ ι) (hιemb : Topology.IsClosedEmbedding ι)
    (U : Set F) (hU : IsOpen U) (r : F → N) (hr : ContMDiffOn 𝓘(ℝ, F) 𝓘(ℝ, E') ∞ r U)
    (hrι : ∀ y, ι y ∈ U ∧ r (ι y) = y) (δ : ℝ) (hδ : 0 < δ)
    (hT : {z | Metric.infDist z (range ι) < δ} ⊆ U)
    (P : F → F) (hP : ContDiff ℝ 1 P) (hPb : ∃ C, ∀ z, ‖fderiv ℝ P z‖ ≤ C)
    (hPr : ∀ z, Metric.infDist z (range ι) < δ / 2 → P z = ι (r z))
    {p : ℝ≥0∞} (hnp : (finrank ℝ E : ℝ≥0∞) ≤ p) (hp : p < ⊤)
    {u : M → F} (hu : MemW1pLocM E p u) (hN : TauCeti.IsNullSet 𝓘(ℝ, E) {x | u x ∉ range ι}) :
    ∃ g : ℕ → M → N, (∀ j, ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, E') ∞ (g j)) ∧
      ∀ (x₀ : M) (K : Set E), IsCompact K → K ⊆ (extChartAt 𝓘(ℝ, E) x₀).target →
        ∃ Du : E → E →L[ℝ] F,
          TauCeti.HasWeakFDerivOn volume
              ⟨interior (extChartAt 𝓘(ℝ, E) x₀).target, isOpen_interior⟩
              (u ∘ (extChartAt 𝓘(ℝ, E) x₀).symm) Du ∧
            Tendsto (fun j => eLpNorm (ι ∘ g j ∘ (extChartAt 𝓘(ℝ, E) x₀).symm -
              u ∘ (extChartAt 𝓘(ℝ, E) x₀).symm) p (volume.restrict K)) atTop (𝓝 0) ∧
            Tendsto (fun j => eLpNorm
              (fun y => fderiv ℝ (ι ∘ g j ∘ (extChartAt 𝓘(ℝ, E) x₀).symm) y - Du y) p
              (volume.restrict K)) atTop (𝓝 0) := by
  sorry
```

Then make these edits:
- Module docstring: delete the bullet at lines 36–38, and add "density for Banach targets with a controlled retractive closed embedding (§10.3)" to "Stated here".
- README §10.3: end the first sentence with "(`exists_smooth_approx_of_controlledRetraction`)".

## R03 (P2) — The order-`k` local classes have three owners

**Location:** `README.md:57` "the local Lebesgue and local Sobolev classes `MemLpLoc` and `W^{k,p}_loc(Ω; F)` on open subsets of every finite-dimensional real normed space"; also §1.1, lines 335–345.

**Claim:** §1.1 plans the order-`k` class with the full API of PseudoholomorphicCurveAnalysis §1.1, but no target here uses `k ≥ 2`. Two other roadmaps already own this object, so it has no single owner:
- at `E = ℂ` it is PseudoholomorphicCurveAnalysis §1.1's class, on main;
- on `ℝ^d` with finite-dimensional values, YangMillsConnectionsAndCaloricGauge asks PDE to own it.

**Witness:**
- `TauCetiRoadmap/YangMillsConnectionsAndCaloricGauge/README.md:394` (open head), gap `vector-valued-wkp`: "for every `k ≥ 1`, the local class `W^{k,p}_loc(Ω; V)`".
- `PseudoholomorphicCurveAnalysis/Suggested.lean:54` declares `MemWkpLoc`.
- This README uses order `k ≥ 2` only inside §1.1.

**Repair:**
- Scope, lines 57–60, replace with: "the local Lebesgue class `MemLpLoc` and the first-order class `W^{1,p}_loc(Ω; F)` with Banach `F` on open subsets of every finite-dimensional real normed space (§1.1–§1.2); at `E = ℂ` they are the planar classes of PseudoholomorphicCurveAnalysis §1.1 at `k = 1`;"
- "It leaves to named owners": add "Vector-valued classes of order `k ≥ 2` belong to PseudoholomorphicCurveAnalysis §1.1 (planar) and to PDE (gap `vector-valued-wkp` of YangMillsConnectionsAndCaloricGauge)."
- §1.1, deletions: "and the order-`k` class … each in `MemLpLoc p Ω`)", "monotonicity in `k` and the case `k = 0`", the `W^{2,p}_loc` clause of the first Check, and "and `k`" from the second Check.
- §1.1, replacement: change "`TauCeti.Wkp volume W p k`" to "`TauCeti.W1p`".
- `Suggested.lean:67–68`: delete "This is the case `k = 1` of the order-`k` class of §1.1."

## R04 (P3) — Ten sampled sections still carry no locator

**Location:** §1.1, §2.6, §4.1, §4.6, §5.1, §8.2, §8.3, §10.2, §10.4 and §11.2. At §10.4, `README.md:1704–1705` reads "Convent–Van Schaftingen's embedding comparison, specialized to compact targets".

**Claim:** Each of these sections makes claims without a theorem-level or page-level locator, although the texts on record state them. The previous review's locator finding is only partly repaired.

**Witness:**
- ConventVanSchaftingen2016 lines 182–186, 272, 282, 314, 563.
- HeikkilaPankka2025 lines 22–27 and 324–341.
- Hajlasz2009 lines 133–134 and 242–251.
- ArendtKreuter2018 lines 85–104.

**Repair:** Add these locators at the claims:
- §1.1: "(Arendt–Kreuter, §2, pp. 2–3, for the global first-order Bochner space)";
- §2.6: "(Convent–Van Schaftingen, Prop. 1.8, p. 7, for colocal maps)";
- §4.1: "(Convent–Van Schaftingen, §1.1, pp. 3–4)";
- §4.6: "(Convent–Van Schaftingen, Prop. 1.5, p. 6, for finite-dimensional targets)";
- §5.1: "(Heikkilä–Pankka, arXiv 2302.11440v2, p. 1)";
- §8.2: "(Heikkilä–Pankka, §3, p. 7, on Euclidean balls)";
- §8.3: "(Heikkilä–Pankka, §3, p. 7, for quasiregular maps and `p = n`)";
- §10.2: "(Hajłasz 2009, proof of Thm 2.1, p. 188)";
- §10.4: "(Convent–Van Schaftingen, Prop. 1.6, p. 6, and Prop. 2.6, p. 11)";
- §11.2: "(Hajłasz 2009, proof of Thm 2.3, p. 190, for the integral degree and its continuity)".

## R05 (P3) — The downstream-consumer bullet for PseudoholomorphicCurveAnalysis is false

**Location:** `README.md:1800` "**PseudoholomorphicCurveAnalysis** uses §1.1's generalized classes and the comparison of §7.2."

**Claim:** PseudoholomorphicCurveAnalysis is on main and earlier in the merge order. It defines its own classes and consumes nothing from this roadmap.

**Witness:**
- A grep of main for `SobolevMapsBetweenManifolds` finds 0 occurrences.
- `PseudoholomorphicCurveAnalysis/Suggested.lean:47` and `:54` declare its own `MemLpLoc` and `MemWkpLoc`.

**Repair:** Delete the bullet. Scope (lines 97–102) already states the relation, including the §7.2 comparison.

## R06 (P3) — The RiemannianGeometry R6 contract cites a statement R6 does not make

**Location:** `README.md:303–304` "`C¹` for `C²` embeddings and smooth for smooth ones, with `dπ` at a point of the submanifold the orthogonal projection onto its tangent space)".

**Claim:** R6 does not state the derivative of `π`. §9.2 proves it here ("Prove that `dπ_z` at a point of `ι(N)` is the orthogonal projection"), so the contract gives the same statement two owners.

**Witness:** `RiemannianGeometry/README.md:3476–3480` (main) says that R6 owns "a nearest-point retraction with C¹ inverse for C² embeddings and smooth inverse for smooth embeddings". It contains no derivative claim.

**Repair:** Delete ", with `dπ` at a point of the submanifold the orthogonal projection onto its tangent space" from line 303–304.

## R07 (P3) — A conditional supplier sentence on submersions

**Location:** `README.md:226–228` "the finite-dimensional surjective-differential corollary is proved there from the inverse function theorem if the general conversion is not in the supplier API."

**Claim:** The sentence leaves the scope conditional, but whether the conversion exists can be checked: it is absent at the pin.

**Witness:** `Mathlib/Geometry/Manifold/Submersion.lean:75–76` lists "`mfderiv I J f x` being surjective implies `f` is a submersion at `x`" as a TODO; no such declaration exists.

**Repair:** "Mathlib has no conversion from a surjective differential to `IsSubmersionAt`; §2.5 proves the finite-dimensional one from the inverse function theorem."

## R08 (P3) — Layer 11's dependencies omit §6.3

**Location:** `README.md:328–329` "Layer 11 needs Layers 8–10."; `README.md:1792` "Layers 8–10; DifferentialGeometry 10.4–10.5."

**Claim:** §11.1 uses Hadamard's inequality from §6.3, which neither line lists. Layer 8 uses only §6.2.

**Witness:** `README.md:1742` "*Needs:* §6.3, §8.1, §9.3; DifferentialGeometry 10.4–10.5."

**Repair:** "Layer 11 needs §6.3 and Layers 8–10." and "§6.3, Layers 8–10; DifferentialGeometry 10.4–10.5."

## R09 (P3) — The pull-request description overstates the head

**Location:** The description sentences "Claims carry theorem- or page-level locators into Hajłasz (2009), Convent–Van Schaftingen, Arendt–Kreuter, Wockel and Heikkilä–Pankka" and "**`Suggested.lean`** states the headline theorems that are statable at the pins: …".

**Claim:** Ten sampled sections carry no locator (R04), and three statable headlines are absent (R01, R02).

**Witness:** §8.2, §8.3 and §11.2 carry no locator. `Suggested.lean` has no chart-independence, locality or general-density statement.

**Repair:**
- First sentence: replace with "Results that a source states carry theorem- or page-level locators into Hajłasz (2009), Convent–Van Schaftingen, Arendt–Kreuter, Wockel and Heikkilä–Pankka".
- Once R01–R02 are applied: add "chart independence and locality of the class" and "density for Banach targets with a controlled retractive closed embedding" to the list, and delete "controlled retraction data," from the docstring sentence.

## Previous findings

- R01: repaired. `README.md:335` "Define for `E` the classes that PseudoholomorphicCurveAnalysis §1.1 plans for `ℂ`"; §7.3 cites PseudodifferentialOperators §5.2; "Existing code to refactor" is gone.
- R02: repaired. `README.md:388–394` routes the sheaf property through `TauCeti.hasWeakFDerivOn_iff_forall_isCompact_closure`; §3.3 has a pinned route.
- R03: repaired. `README.md:820–824` "agrees almost everywhere with a family `Φ` … whose chart expressions are continuous is `C¹`".
- R04: repaired. `Suggested.lean:176`, `:333`, `:441` and `:471` state the four theorems.
- R05: repaired. `README.md:1224` "carrying the identity chart and the norm of `E` as its tangent norm".
- R06: repaired. `README.md:403–407` (Check) and `:633–635` (weight).
- R07: partly repaired. Locators were added at §2.1(b), §2.3, §2.4, §4.4, §4.7–§4.8, §5.3–§5.4, §9.1, §9.3, §10.3 and §11.3; ten sampled sections remain without one (R04 here).
- R08: repaired. `README.md:1440–1442` "arXiv 2302.11440v2, proof of Prop. B.1, p. 24".
- R09: repaired. Both theorems are deleted.
- R10: repaired. The three definitions are deleted.
- R11: partly repaired. The docstring now names headlines and carriers, but the reason it gives for §10.3 is false (R02 here).
- R12: repaired. `README.md:797` "`Df` denotes a chosen one"; the other two names are gone.
- R13: repaired. `README.md:689` "and `p < ∞`" and `:961` "For `n ≥ 2`"; each listed section now has three Checks.
- R14: repaired. `README.md:478` "with invertible derivative at every point"; `hinj` is dropped and the `z ↦ z²` Check is added.
- R15: repaired. The description now names the roadmap owners.

## Verified sound

| Target | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.1 classes (sampled) | `E = ℂ`, `|z|`; `n = 3`, `|x|⁻¹`; `2·volume` | `∫_{|z|<1}|z|^{−p}` finite iff `p < 2`; `∫_{B³}|x|^{−p}` finite iff `p < 3`; `Lᵖ(K)` norms scale by `2^{1/p}` | holds; order `k` unused; no locator | R03, R04 |
| §1.2 `memW1pLoc_iSup_iff` | empty index; `p = 0` | `⨆ ∅ = ⊥`: both sides true; at `p = 0` `MemLp` is measurability, gluing unchanged | holds | — |
| §1.2 Checks | sup norm, `x = (1, 1/2)`; `log|x|` on `ℝ²` | `Du(x)(0,1) = 0` vs `⟨x/|x|,(0,1)⟩ ≈ 0.447`; `∫₀¹ r^{1−p}dr` finite iff `p < 2` | holds | — |
| §2.1(a) `comp_contDiffOn` | `g = y²`, `u = |x|^{−1/4}` on `ℝ²` | `Du ∈ Lᵖ_loc` iff `p < 8/5`; `D(u²) ∈ Lᵖ_loc` iff `p < 4/3`: continuity is needed | holds | — |
| §2.2 `comp_contDiffOn_diffeo` (sampled) | `Φ = 2x`; `z²` on `ℂ∖{0}`; `dim E = 0` | `‖u∘Φ‖_{Lᵖ(K)} = 2^{−n/p}‖u‖_{Lᵖ(2K)}`; `det = 4|z|² ≠ 0`, `Φ(1) = Φ(−1)`; `det = 1` | holds; Ziemer uncertified | — |
| §2.4 `exists_continuousOn_ae_eq` | `dim E = 0`; `F = ℓ²`, `u_j = e_j` | `finrank 0 < p`, `v = u`; `‖e_j − e_k‖ = √2`: no compactness claimed | holds | — |
| §2.6 (sampled) | `u = max(x,0)`, `v = 0` | `{u = v} = (−∞,0]`; `Du = 1_{x>0} = 0 = Dv` there | holds; no locator | R04 |
| §3.2 Check 3 | `|x|^{−1/3}`, `h(y) = y³` | `∫_{−1}^{1}|x|^{−2/3}dx = 6`; `u∘h = |y|^{−1}`, not `L¹_loc` | holds | — |
| §4.1 (sampled) | `u = x` in chart `2x`; `log|x−x₀|` on `S²` | rep `y/2`, derivative `1/2 = du∘dφ⁻¹`; `∫₀ r^{1−p}dr < ∞` iff `p < 2` | holds; no locator | R04 |
| §4.2 and §4.5 headlines | probe theorems in section `Manifold` | elaborate, `sorry` only; QuasiregularMaps gap `sobolev-maps-class` asks for both | statable, absent | R01 |
| §4.3 `exists_hasWeakMFDeriv`, `.ae_eq` | `f = |t|`; incomplete `E'` | `Df = sign t` off null `{0}`; `HasWeakFDerivOn` forces a complete codomain, so hypotheses fail | holds | — |
| §4.4 `isSobolevMap_of_contMDiff` | `t|t|`; `p < 1` | weak derivative `2|t|` equals classical; continuous maps are `Lᵖ` on compacts, so `hp` is unused | holds | — |
| §4.6 `comp_contMDiff`, `comp_submersion` (sampled) | `g = y²`, `f = |t|^{1/2}`; `θ(x,t) = x` | `2|t|^{1/2}·sign t/(2|t|^{1/2}) = sign t`; `θ⁻¹{0} = {0}×ℝ` null; `D(u∘θ)(h,s) = Du(x)h` | holds; no locator | R04 |
| §4.7 `IsColocallyWeaklyDifferentiable` (sampled) | `1/x`, `u(0) = 0`; `sign x` | CVS Def. 1.1 (line 155) matches the Lean body; probes of `1/x` smooth off `{0}`; `φ(1) ≠ φ(−1)` gives a jump | holds | — |
| §4.8 `exists_hasColocalWeakMFDeriv`, `.ae_eq` | `|t|`, zero field; `n = 1` radial | probe `y` on `[−1,1]`: `D(φ∘u) = sign t ≠ 0`; `sign x` into `S⁰` not colocal | holds (CVS Prop. 1.2, line 215) | — |
| §5.1 (sampled) | `2x`, source `4|dx|²`; sup-norm projection | `‖Df‖ = 2/2 = 1`; `sup|v₁|/max(|v₁|,|v₂|) = 1` | holds; no locator | R04 |
| §5.3 | `g = dx²`, `g' = 4dx²`, `f = id` | `a = 2`; `‖Df‖ = 1`, `‖Df‖' = 1/2`; factor `C^{1/p}ab` | holds | — |
| §5.4 (sampled) | `u = x`, `u(0) = 1` into `ℝ∖{0}`, `g = sign` | CVS Def. 2.1 (line 407): `p < ∞`, Hilbert–Schmidt, as stated; `g∘u` jumps at `0` | holds | — |
| §6.1 four theorems | `diag(2,1)`; `diag(−1,1)`; `dim 0`; one-tactic probes | `J = 2 ≤ 4`; `J = −1`, and `+1` into `−std`; `J = ±1 ≤ ‖A‖⁰ = 1`; `simp`, `exact?` close none | holds; not padding | — |
| §6.3 `integrableOn_orientedJacobian` (sampled) | `|x|^{−1/2}x` on `ℝ²`; `n = 0` | `‖Df‖ = r^{−1/2} ∈ Lᵖ_loc` iff `p < 4`; `J = r^{−1}/2 ∈ L^q_loc` iff `q < 2`; `n = 0`: unit point masses | holds | — |
| §7.1 | sup norm on `ℝ²`, `f = x₁ + x₂` | `‖Df‖ = ‖(1,1)‖_{ℓ¹} = 2` vs Euclidean `√2` | holds | — |
| §8.2 (sampled) | `k = 0`, `n = 1`; HP §3 sign | `∫βφ = −∫αφ′`; HP line 327 `∫ω∧dφ = (−1)^{k+1}∫dω∧φ`, equivalent | holds; no locator | R04 |
| §8.3 (sampled) | `ω = y₁dy₂` on `ℝ²`; Hencl's map | `f^♯(dω) = J_f dx = d(f₁df₂)`; Hencl: `J = 0` a.e., distributional Jacobian `A ↦ |f(A)| ≠ 0` | holds; no locator | R04 |
| §9.1 immersion iff | figure eight; `(x_j) ↦ (x_j/j)` on `ℓ²` | `ι∘f` continuous piecewise `C¹`, `f` jumps: excluded by `hf`; no bounded left inverse | holds | — |
| §9.3 `exists_smooth_approx_rel` | `A = ∅`; smooth `f`; `p = ∞` | `fSeq = f` works; `V'` exists (`M` normal); `‖sign − g′‖_∞ ≥ 1` for `C¹` `g` | holds | — |
| §10.2 (sampled) | `θ = χ log log(1/|x|)`, `p = n = 2` | `∫₀ dr/(r log²(1/r)) < ∞`; `θ` unbounded, no continuous representative | holds; no locator | R04 |
| §10.3 `exists_smooth_approx_of_ae_mem_range` (sampled) | Hajłasz Thm 2.1; `dim M = 0`; `N = ∅` | line 129 states `p > n`, proof lines 138–182 cover `p = n`; points non-null; `N = ∅` forces `M = ∅` | holds | — |
| §10.3, general form | probe before `end Manifold` | elaborates, `sorry` only; VMO bound puts `u_ε` in `T_{δ/2}`, `P∘u_ε → P∘u = u` | statable, absent | R02 |
| §10.4 (sampled) | compact `N ⊆ ℝᵐ` | CVS Prop. 1.6 (closed `ι(N)`), Prop. 2.6 (isometric) give the comparison | holds; no locator | R04 |
| §11.2 (sampled) | antipodal `a` of `S²`; `γ∘θ` | `deg a = (−1)³ = −1`, `J_a = −1`; `rank Du ≤ 1`, `J = 0`, `deg = 0` | holds; no locator | R04 |
| §11.3 `not_exists_smooth_sphere_approx_radial` | `n = 2`, `p = 1`; `p = n` | `∫_B|x|⁻¹ = 2π`; `∫₀¹ r⁻¹dr = ∞`; interior smoothness suffices (spheres `r < 1`) | holds (Hajłasz Thm 2.3, line 227) | — |
| §1.1 order-`k` ownership | YangMills README:394; PH `Suggested.lean:54` | both define vector-valued `W^{k,p}_loc`; this README uses `k ≥ 2` only in §1.1 | three owners | R03 |
| R6 supplier contract | RiemannianGeometry README:3476–3480 | R6: retraction with `C¹`/smooth inverse; no `dπ` claim; §9.2 proves `dπ` | drift | R06 |
| §2.5 submersion corollary | Mathlib `Submersion.lean:75–76` | "surjective differential ⇒ submersion" is a TODO; no declaration | absent at pin | R07 |

- **Source locators checked (24):**
  - Hajlasz2009 lines 20–28, 102–106, 129–182, 227–252;
  - ConventVanSchaftingen2016 lines 155, 188, 196, 215, 272, 282, 308, 314, 407, 563;
  - ArendtKreuter2018 lines 85–104, 378, 736;
  - Wockel2009 line 170;
  - HeikkilaPankka2025 lines 22–27, 324–341, 1328;
  - MartioRickmanVaisala1969 line 124.
- **Library declarations opened at the pins (59):**
  - Tau Ceti `2fd255d`: all 40 cited names resolve, e.g. `WeakDeriv/Basic.lean:251, 292, 453, 747, 856`, `Local.lean:71`, `Classical.lean:138, 145`, `Limit.lean:89`, `W1p/ChainRule.lean:375`, `Wkp/MeyersSerrin.lean:291`, `Manifold/Measure.lean:36, 50, 72, 89`, `VolumeDensity/Volume.lean:82`, `Orientation/Basic.lean:32, 140, 235`, `TopForm.lean:46, 518`, `BoundarylessStokes.lean:122`, `Degree/Basic.lean:76`.
  - Mathlib `1b1ccf4`: 19 names, e.g. `Jacobian.lean:556, 1184`, `Submersion.lean:172`, `Immersion.lean:191, 489`, `ImmersionDiff.lean:165`, `SmoothApprox.lean:104`, `Orientation.lean:198, 245`, `NormDet.lean:69, 389`.
- **Cross-roadmap citations resolved:**
  - PDE §1.2, §1.4, §1.5;
  - PseudoholomorphicCurveAnalysis §1.1 (README:213) and §4.1 (README:807);
  - PseudodifferentialOperators §5.2 (README:967);
  - Yamabe Y1 (README:111);
  - RiemannianGeometry R4.6 and R6, on main and at its open revision;
  - DifferentialGeometry 2.1–2.2, Layer 5, 10.3–10.5 and 12.4;
  - GeometricMeasureTheory (area and coarea).
  - QuasiregularMaps' six gap contracts cite sections that exist at this head.
- **Gate:** rerun here, every check passes; no change outside the folder. Dependency check: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 22 `sorry` warnings and nothing else. The elaborated types of all 35 declarations were compared with the README: theorems keep `[FiniteDimensional ℝ E] [BorelSpace E] [IsAddHaarMeasure]` and their `IsManifold` binders; no generality mismatch.
- **Probes:** the R01–R02 theorems elaborate in a scratch copy (25 `sorry` warnings, no error). One-tactic probes close none of the four §6.1 theorems.
- **README checks:** all 35 Lean names occur in the README, and every definition section has at least three Checks.
- **Overlap check:** read QuasiregularMaps, YangMillsConnectionsAndCaloricGauge and SobolevDifferentialForms (open), and DifferentialGeometry, PseudoholomorphicCurveAnalysis and CalibratedGeometry (main). Shared objects and their owners:
  - planar classes: PseudoholomorphicCurveAnalysis §1.1;
  - vector-valued `W^{k,p}_loc`: PDE through YangMillsConnectionsAndCaloricGauge's gap (R03);
  - Euclidean real-valued weak `d`: SobolevDifferentialForms Layer 2, while §8.2 owns the manifold, Banach-coefficient form;
  - degree: DifferentialGeometry 10.3–10.5;
  - the Jacobian: this roadmap, consumed by QuasiregularMaps.

## Not verifiable

- Ziemer1989, Thm 2.2.2 (§2.2, sampled): settled as uncertified; no legal text to read.
- Lee2012, Ch. 6 and Ch. 15 (§3.3, §6.2): settled as uncertified.
- Rickman1993, Ch. I (Conventions): settled as uncertified.
- Schoen–Uhlenbeck 1983, Hencl 2011, Brezis–Nirenberg 1995 and Hajłasz–Iwaniec–Malý–Onninen 2008 (References): not in the manifest's cache, so not read.

## Source issues

- **Misprint** in HeikkilaPankka2025 at proof of Prop. B.1, p. 24: the source says `p ∘ ι` lies in `W^{1,∞}(M, ℝᵐ)` for the Nash embedding `ι : N → ℝᵐ`; it should be `ι ∘ p`; affects nothing.
- **Misprint** in HeikkilaPankka2025 at proof of Prop. B.1, p. 24: the source says the distortion bound's denominator is the minimum of `det Dφ`; it should be `det Dφ_i`, the diffeomorphism of that simplex; affects nothing.
- **Misprint** in Hajlasz2009 at (2.1), p. 188: the source says the middle term has the factor `C r`, with `r` undefined; it should be `C ε`, the radius of the ball; affects nothing.
