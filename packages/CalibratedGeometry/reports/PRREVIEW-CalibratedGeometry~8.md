# Review of CalibratedGeometry (pull request #946 at 3f5512f)
**Verdict:** needs changes

:robot: Independent AI review. This is a full review of the repaired head (403 changed lines since `e65d893`). All four findings of the previous review are repaired (details below). The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with only its eleven `sorry` warnings. There are five new findings, two of them blocking. Both blocking findings are objects that this roadmap plans to build but that already have an owner: RiemannianGeometry R5b on main (second variation, stability, Jacobi operator) and the pinned Tau Ceti Stiefel manifold. Nothing in the worktree was changed; every probe ran on scratch copies.

## R01 (P2): 3.2 and 6.5 re-plan RiemannianGeometry R5b's normal second variation, stability and Jacobi operator

**Location.**
- `TauCetiRoadmap/CalibratedGeometry/README.md:101–102`: "No general second-variation formula is consumed."
- 3.2 at `:802`: "Define a minimal immersion to be stable".
- 6.5 at `:1361–1363`: the second derivative "depends only on V, independently of the acceleration".
- 6.5 at `:1386–1387`: "Define the normal Jacobi operator `𝒥` … Prove its ellipticity, formal self-adjointness".
- The "Owned here" bullet at `:67–70`.

**Claim.** This roadmap owns three things: the independence of the second variation from the acceleration at a minimal immersion, the definition of a stable minimal immersion, and a "normal Jacobi operator" together with its ellipticity and self-adjointness.

These have two owners. Moreover, 6.5 defines 𝒥 to be the conjugated Hodge Laplacian and never compares it with R5b's operator. McLean's Corollary 3.14 (McLean1998 line 603: the Jacobi operator *is* the Hodge Laplacian) is thereby reduced to a definition. `Suggested.lean:40–43` says the opposite: there the Jacobi operator is RiemannianGeometry's.

**Witness.** RiemannianGeometry R5b on main (`RiemannianGeometry/README.md:1159–1168`): "Prove acceleration independence at minimality and the polarized second-volume-variation formula `minimalNormalSecondVariation`"; "the actual normal Jacobi differential operator, its ellipticity … and formal self-adjointness. Stability means Q(V,V)≥0". GeometricCurrents (`:87`) consumes these from R5b.

**Repair.**
1. In the Scope bullet at `:98–102` and the RiemannianGeometry contract at `:314–320`:
   - delete "No general second-variation formula is consumed";
   - add: "R5b: the normal second variation `minimalNormalSecondVariation` with its acceleration independence at minimality, stability `Q(V,V) ≥ 0`, and the normal Jacobi operator with its ellipticity and formal self-adjointness";
   - rewrite the "Owned here" Layer 6 bullet to "the special Lagrangian second-variation identity and the identification of R5b's Jacobi operator with the Hodge Laplacian".
2. In 3.2:
   - replace the stability definition by R5b's;
   - keep "a volume minimum is stable" and "calibrated immersions are stable" as 3.2's own targets;
   - add RiemannianGeometry R5b to its *Needs:* line.
3. In 6.5, replace the first sentence's claim by "by R5b's acceleration independence at minimality, the second derivative depends only on V". Alternatively, derive it from the second-jet identity below and say so.
4. In 6.5, replace the 𝒥 paragraph by: "Prove that R5b's normal Jacobi operator L of N equals `(V ↦ ι_V ω)⁻¹ ∘ (dδ + δd) ∘ (V ↦ ι_V ω)` (McLean1998, Corollary 3.14, line 603). Both operators are formally self-adjoint, and they have the same quadratic form by `secondVariation_volume_eq_hodgeEnergy` and R5b's `Q(V,V) = ∫⟨LV, V⟩`. Hence `ker L` is the space of harmonic one-forms, which is 6.4's tangent space."
5. Delete "Prove its ellipticity, formal self-adjointness": these belong to R5b for L and to K5a for Δ. Add RiemannianGeometry R5b to 6.5's *Needs:* line.

Tested on the flat torus `T² ⊂ ℂ²/(ℤ²+iℤ²)` with `V = a(x₁)∂_(y₂)` and `a = ε sin 2πx₁`:
- R5b's `Q(V,V) = ∫|∇⊥V|²` (flat ambient, B = 0) `= ∫a′² = 2π²ε²`;
- `β = −a dx₂` has `|dβ|² = a′²` and `δβ = 0`, so the Hodge energy is `2π²ε²`;
- the area `∫sqrt(1+t²a′²)` has second derivative `2π²ε²` at `t = 0`;
- both operators send V to `−a″∂_(y₂)`.

## R02 (P2): The smooth Stiefel manifold of 1.4 is pinned in Tau Ceti

**Location.**
- `README.md:49`: "the smooth Stiefel manifold of a general inner-product space".
- 1.4 at `:496–498`: "Define the smooth Stiefel manifold … as the level set `Gram = I`, proving it regular … through the frame variation `vA/2`".
- The API bullet at `:518` and the Check at `:527`.

**Claim.** The smooth Stiefel manifold, its regularity and its dimension are targets of this roadmap.

**Witness.** Tau Ceti `2fd255d9`, `TauCeti/Geometry/Manifold/Instances/Stiefel.lean`:
- `TauCeti.stiefel` (`:162`);
- `gramSym2Deriv_surjective` (`:129`, preimage `Σⱼ (t s(i,j)/2) vⱼ`, which is `vA/2`);
- `index_gramSym2Deriv` (`:144`, `k n − (k+1).choose 2`);
- `isCompact_stiefel` (`:200`) and `instIsManifold` (`:223`).

Also pinned: `TauCeti.finiteOrientedGrassmannian` (`Topology/Grassmannian/Oriented.lean:44`).

**Repair.**
1. 1.4 consumes `TauCeti.stiefel` with `TauCeti.mem_stiefel_iff`, `TauCeti.gramSym2Deriv_surjective`, `TauCeti.index_gramSym2Deriv`, `TauCeti.isCompact_stiefel` and its `IsManifold` instance. It keeps only the free proper SO(k) action, the quotient atlas through B1.4, and the comparisons.
2. List these declarations under "From Tau Ceti" with the file.
3. Delete the API bullet at `:518` (the dimension is pinned).
4. Rewrite the Owned-here bullet.
5. For the coordinate comparisons, cite the pinned carriers alongside C1.1a and T1.5:
   - `TauCeti.finiteGrassmannian` (`Topology/Grassmannian/Basic.lean:52`);
   - `TauCeti.finiteOrthonormalFrame` (`Topology/Grassmannian/Orthonormal.lean`);
   - `TauCeti.finiteOrientedGrassmannian`: compact, its `forget` map is a proper two-sheeted cover, and it is defined for positive rank only, matching the README's separate k = 0 clause.

Tested: `index_gramSym2Deriv` at k = 2, `E = ℝ³` gives `2·3 − 3 = 3`, the value of the Check at `:527`; at k = 1 it gives `n − 1`, the sphere.

## R03 (P3): `kahlerPowerForm` re-implements the pinned Riesz map `TauCeti.alternatingFormEquiv`

**Location.** `TauCetiRoadmap/CalibratedGeometry/Suggested.lean:181–205`. This is a hand-written `ContinuousAlternatingMap` with a twenty-line continuity proof ("expand each argument in a basis: `A` is a finite sum of products of coordinates").

**Claim.** `ωʳ/r!` needs its own construction.

**Witness.** On a scratch copy, `kahlerPowerForm' n r = kahlerPowerForm n r` closes by `ext v; simp [kahlerPowerForm', kahlerPowerForm]; rfl` (exit 0). Here `kahlerPowerForm' n r := (r!)⁻¹ • alternatingFormEquiv (EuclideanSpace ℂ (Fin n)) (2 * r) ⟨ω̂ʳ, _⟩`.

`TauCeti.alternatingFormEquiv` is at `AlternatingForm.lean:71`, and the README already lists it among the supplier contracts (`README.md:233`).

**Repair.** Replace the body by the tested definition:

```lean
def kahlerPowerForm (n r : ℕ) : EuclideanSpace ℂ (Fin n) [⋀^Fin (2 * r)]→L[ℝ] ℝ :=
  (r.factorial : ℝ)⁻¹ • alternatingFormEquiv (EuclideanSpace ℂ (Fin n)) (2 * r)
    ⟨(kahlerBivector n : ExteriorAlgebra ℝ (EuclideanSpace ℂ (Fin n))) ^ r, by
      simpa [pow_mul] using Submodule.pow_mem_pow _ (kahlerBivector n).2 r⟩
```

In 4.2 (`README.md:867–869`), say that `ωʳ/r!` is `(r!)⁻¹` times the form of `ω̂ʳ` under `TauCeti.alternatingFormEquiv`, and add that declaration to 4.2's *Needs:* line. `TauCeti.norm_alternatingFormEquiv_le` then gives `‖ωʳ/r!‖ ≤ ‖ω̂ʳ‖/r!` directly.

## R04 (P3): 1.4, 3.2 and 3.3 state theorems with no locator

**Location.**
- 1.4 (`README.md:494–514`): the oriented Grassmannian as a two-sheeted cover, and its comparisons.
- 3.2 (`:799–809`): constancy of `∫f_t*φ`, `H = 0` and stability of calibrated immersions.
- 3.3 (`:823–826`): the Riemannian product calibration theorem.

None of these paragraphs carries a source in parentheses.

**Claim.** These are theorems of the roadmap, so each needs a locator.

**Witness.** All three are in this review's seeded sample, and there is nothing to check. Readable sources state the facts:
- McLean1998 line 33: calibrated submanifolds are stable minimal;
- Harvey–Lawson Theorem II.4.2, p. 59: minimality;
- Harvey–Lawson Proposition II.7.10, p. 76: the product statement.

**Repair.**
- 3.2: add "(McLean1998, line 33; Harvey–Lawson 1982, Theorem II.4.2, p. 59, uncertified)" to the sentence on `H = 0` and stability.
- 3.3: add "(Harvey–Lawson 1982, Proposition II.7.10, p. 76, uncertified)" to the product calibration theorem.
- 1.4: once R02 is repaired, the Stiefel part is pinned. Add a textbook locator for the oriented Grassmannian and its two-sheeted cover, and record the work in `sources.toml`.

## R05 (P3): 6.5 states the second-variation identity for an embedded N; the Lean statement covers immersions

**Location.**
- `README.md:1150`: "Throughout, N is a compact embedded phase-θ special Lagrangian".
- 6.5 at `:1361`: "a smooth family of immersions `F_t` of closed N with `F_0` the inclusion".

**Claim.** The identity concerns the inclusion of an embedded N.

**Witness.** `secondVariation_volume_eq_hodgeEnergy` (`Suggested.lean:398–403`) takes an arbitrary special Lagrangian immersion `f`, and it holds for non-embedded ones. Take the double cover `f(x) = 2x` of `{y = 0}` in `ℂ/(ℤ+iℤ)` and `F_t = 2x + itε sin 2πx`. Both sides equal `π²ε²`.

**Repair.**
- Begin 6.5 with: "For a phase-θ special Lagrangian immersion f of a closed oriented N (the inclusion of this layer's embedded N is one), and a smooth family of immersions `F_t` with `F_0 = f` and velocity V at `t = 0` normal to `df(TN)`, …".
- Add "6.5 is stated for immersions" to the standing sentence at `:1150`.

## Previous findings

All four findings of the previous review are repaired at this head.

- **R01 (comass pinned): repaired.** `Suggested.lean` declares neither `frameVolume` nor `abs_eval_le_norm_mul_frameVolume`.
  - 1.1 (`README.md:394–403`) routes through `le_opNorm_mul_norm_ιMulti` and `opNorm_le_iff_le_mul_norm_ιMulti`.
  - 1.2 (`:426–442`) consumes `norm_ιMulti_sq` and `norm_ιMulti_le_prod_norm`, and keeps the comass form and the `normDet` identity as targets.
  - 1.3 (`:465–483`) derives the upper bound from `norm_formDualEquiv_le`.
  - The Scope bullet (`:87–92`), the Tau Ceti contract (`:223–241`) and the GeometricCurrents line (`:1438–1441`) name Tau Ceti as the owner.
- **R02 (second variation statable): repaired.** `secondVariation_volume_eq_hodgeEnergy` is at `Suggested.lean:392`, with `contractionPullback` and `hodgeEnergyDensity`, and the docstring is rewritten (`:40–45`). The author replaced the proposed `letI` by a `RiemannianBundle` instance plus `hmet`. A pretty-printed probe shows that `inner ℝ v w` in `hmet` is `InnerProductSpace.toInner` of `instNormedAddCommGroupOfRiemannianBundle…`, i.e. the instance's own metric, so `hmet` does tie it to `f*g`.
- **R03 (tubular neighbourhoods): repaired.** See `:103–109`, `:272–284` and 6.1 at `:1155–1179`. GeometricTopology Layer 1 is now cited for collars only (`:324–327`). The three `TauCeti.SmoothEmbedding` names resolve (`Riemannian/Basic.lean:113`, `Coordinates.lean:89, :146`), with the hypotheses as described.
- **R04 (period connectedness): repaired.** See `:251–254` and 5.3 at `:1066–1070`, matching `period_injective [PreconnectedSpace M]` (`DeRham/Period.lean:468`).

## Verified sound

**Gate, build, order.**
- The gate on this head reports `OK` with every scanner at 0. The worktree is clean, and `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean …/Suggested.lean`: exit 0 in 11 s. There are exactly eleven warnings, all `sorry`, at lines 70, 127, 161, 167, 216, 224, 257, 298, 307, 344 and 392.
- Dependency check: `depcheck: 234 roadmaps, 2417 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `ORDER.txt`: TangentialBordism 14, CalibratedGeometry 224, FukayaTheory (a consumer) 225.

**Signatures and padding.**
- `#check @name` was run on all 26 declarations and agrees with `signatures.md`. Each type was compared with its README statement.
- The five "dropped binder" leads are all definitions whose types do not need the binder: `IsCalibration`, `IsKahlerMetric`, `IsNormalizedHolomorphicVolumeForm`, `specialLagrangianForm` and `contractionPullback`. The last is pointwise `mfderiv`, which needs neither `FiniteDimensional` nor `IsManifold`. Every theorem about them carries the hypotheses. `hodgeEnergyDensity` keeps `IsManifold I' ∞ N`, which the rough Hodge star needs (`[IsManifold I 1 M]`, `HodgeStar.lean:64`).
- One-tactic probe `first | rfl | simp | infer_instance | norm_num | aesop` on all 11 theorems: none closes.
- None of the theorems restates a definition, mirrors a Check or treats a boundary case.
- The degree-two Wirtinger pair is the r = 1 case of 4.2, but it has its own simpler equality form (`v 1 = I • v 0`). Not raised.

**Seeded sample.** 15 targets. Every locator was read in the text; the cited theorems state what the README claims, with the same hypotheses.
- 1.1: HL II.(3.1), cache text line 370, printed p. 56; McLean1998 line 27.
- 1.2: HL Lemma II.3.5, line 393, p. 57.
- 1.4: no locator (R04).
- 1.5: HL (3.3), line 380, p. 57; Joyce2001SLLectures line 53.
- 1.6: HL Prop. II.7.10, line 1004, p. 76, whose decomposable factor and comass-one statement match; Zust2025Products line 59 (Thm 1.2), line 74 (Cor. 1.4) and line 76 (`294/256 > 1`).
- 2.1: Joyce lines 58–60 (a one-sided bound on oriented planes); HL Def. II.4.1, line 444, p. 59 (comass one and closed).
- 2.2: HL Lemma II.3.5; Joyce line 62.
- 3.2, 3.3: no locator (R04).
- 4.1: HL Thm II.6.11, line 807, p. 70; McLean1998 line 43.
- 5.1: Joyce Props 2.3 and 2.4, lines 96 and 107; HL Thm III.1.10 and Cor. III.1.11, lines 1412 and 1417, p. 89; McLean1998 Prop. 3.2, line 483.
- 5.2: Joyce line 98, dimension `(m²+m−2)/2`; McLean1998 Lemma 3.1, line 448.
- 5.3: McLean1998 lines 450–462 (SU(n) structure, closed holomorphic Ω); HL Prop. III.2.17, line 1647, p. 96, and (2.19) at line 1655.
- 6.1: McLean1998 lines 486, 493, 539–550, 572 (`F′(0)`) and 580 (Lemma 3.12).
- 6.2: McLean1998 lines 589–595.
- Also checked: HL Thm II.4.2, line 450, p. 59 (real current homology, matching the period hypothesis); HL Thm III.2.3, line 1493, p. 91; HL Thm III.2.13, line 1599, p. 95; McLean1998 Thm 3.13, line 598, p. 723 (`v = (JV)♭`, which is `β = ι_V ω` for `ω = g(J·,·)`).

**Library declarations opened at the pins.**
- Tau Ceti `2fd255d9`:
  - `Comass.lean:101, :115, :123, :147, :158, :168, :182, :191`;
  - `AlternatingForm.lean:71, :77, :154, :194`;
  - `ExteriorPower/Basic.lean:152, :156`;
  - `Alternating/Dual.lean:92`;
  - `Riemannian/HodgeStar.lean:73`, together with `wedge_hodgeStar_apply` and `hodgeStar_hodgeStar`;
  - `Riemannian/VolumeForm.lean:55`;
  - `Orientation/Basic.lean:32` and `fact_finrank_tangentSpace` at `:92`, which shows that an orientation indexed by `Fin k` forces dim N = k;
  - `TubularNeighborhood/Riemannian/Basic.lean:113` and `Coordinates.lean:89, :146`;
  - `DeRham/Period.lean:455, :468`;
  - `Symplectic/StandardCompatible.lean:72, :80` (`⟪x₁,y₂⟫ − ⟪y₁,x₂⟫`);
  - `SymplecticTransport.lean:61, :224` and `Transport.lean:58`;
  - `Hermitian.lean:260`;
  - `Alternating/Bilinear.lean` (no factor `2⁻¹`, as 5.2 says);
  - `Integration/Stokes.lean:37`;
  - `Instances/Stiefel.lean` and `Topology/Grassmannian/{Basic,Oriented,Orthonormal,Graph}.lean` (R02);
  - `SmoothSingular/` (no Stokes theorem for simplices, as the README says);
  - `SecondFundamentalForm.lean` (linear only; no Jacobi operator is pinned, as the docstring says).
- Mathlib `1b1ccf4b`: `LinearMap.normDet` and `normDet_sq_eq_det_gram` (`NormDet.lean:69, :303`), `normDet_of_subsingleton` (`:228`).
- `#check` was run on 104 backticked library names from the README in a scratch file; 82 elaborate. Of the other 22:
  - 19 live in Tau Ceti modules with no built object file and were resolved by declaration and namespace in the source;
  - 3 are written in short form and resolve as `TauCeti.SymplecticForm.Compatible.hermitianCore`, `TauCeti.SymplecticForm.Compatible.transport` (`SymplecticTransport.lean:224`) and `CovariantDerivative.leviCivitaConnection` (`LeviCivita.lean:360`), each with its file given in the README.

**Cross-roadmap citations resolved.**
- On main `32e1f526`:
  - DifferentialGeometry 1.4, 5.4, 12.5 (`:325, :524, :930`);
  - GeometricTopology Layer 1 collars (`:177`, item at `:205`) and smoothing item 1 (`:938`);
  - AlgebraicTopology Stages 2, 3 and 6 (`:326, :471, :946`);
  - SmoothBundlesConnections B1.4, B2.5, B5 (`:421, :802, :1072`);
  - CharacteristicClasses C1.1a; TopologicalKTheory T1.5 (`:228`) and T1.6a (`:328`); GeneralizedCohomology G4.0b;
  - LieGroups Layer 2 (`:356`);
  - PDE 1.4 (A4) (`:803`) and 5.6 (E25) (`:2097`);
  - ComplexKahlerGeometry K1, K2, K4, K5a, K6.0, K6.1;
  - RiemannianGeometry R1, R5a, R5a.1, R5a.2 (`:179, :1044, :1067, :1103`);
  - PseudodifferentialOperators P1.0, P5, P6;
  - HeegaardFloer F1.4 (`:2195`) and F2.6c (`:2915`, degree-two Wirtinger for a compatible J);
  - GeometricCurrents consumer lines `:65, :81, :88`.
- TangentialBordism B1.5 at #942's head `be5e94da` (`README.md:692`), which names CalibratedGeometry 2.4 as its consumer.
- Open revisions:
  - ComplexKahlerGeometry #1398 keeps K1, K2, K4, K5a, K5b.0 and K6.0 in its headings (`:267, :406, :849, :996, :1806, :1949`); #1234 keeps them too.
  - DifferentialGeometry #886 keeps 1.4, 5.4 and 12.5.
  - RiemannianGeometry #1683 and #1327 keep R5a–R5b.
  - `overlaps.md`: no other pull request changes this folder, and no id is dropped.
- GeometricCurrents' anchor `#c2-calibrated-immersions-and-integration` (`GeometricCurrents/README.md:92`) matches no heading here. This folder is new on main, so it is not a dropped id; noted for GeometricCurrents.

**Ownership.**
- `roadmaps grep` was run over the open heads and main for "special Lagrangian", "McLean", "calibration", "Wirtinger", "oriented Grassmannian", "Stiefel manifold", "smooth-to-singular" and "comass". No open roadmap builds calibrations, and HeegaardFloer F2.6c is cited correctly.
- ManifoldOptimization (#1506) owns a matrix Stiefel `St(n,p)`, and DGFloerPartII (#1799) consumes `TauCeti.stiefel`. Both point to the pinned owner (R02).

**Adversarial table.** Values were computed for the headlines, the sampled targets and the targets the findings touch.

| Statement | Instances | Values computed (each side) | Result |
|---|---|---|---|
| `norm_eq_sSup_abs_orthonormal` | `dx₁∧dx₂+dx₃∧dx₄` on ℝ⁴; k = 0, φ = −3; k = 3 on ℝ² | sup 1 at `(e₁,e₂)`, norm 1; `{3}`, `‖const‖ = 3`; `sSup ∅ = 0 = ‖0‖` | holds |
| 1.2 comass form, normDet identity | `((1,0),(1,1))`; `(v,v)`; empty frame | Gram `[[1,1],[1,2]]`, volume 1 vs `Π‖vᵢ‖ = √2`; 0; 1 = `normDet` on the zero space | holds |
| 1.3 upper bound | `dx₁∧dx₂+dx₃∧dx₄` | `1 ≤ √2 ≤ √6`; `‖φ̂‖² = 2 ≤ √6·√2·1` | holds |
| 1.4 Stiefel (R02) | k = 2, ℝ³; k = 1, ℝⁿ | pinned index `6 − 3 = 3` = Check; `n − 1` | pinned |
| 1.5 `IsCalibratedFrame` | `dx₁∧dx₂` on `(e₁,e₂)`, `(e₂,e₁)`, `(e₁,e₃)`; `((2,0,0),(0,1/2,0))`; k = 0, φ = ±1 | 1, −1, 0; value 1 but not orthonormal; T / F | holds |
| 1.6 products | `dx∧dx`; `ω₁∧ω₂`; Züst | 1 vs bound 2; 1 vs bound 6; `294/256 > 1` | holds |
| `IsCalibration` (2.1) | `dx₁∧dx₂`; `2dx₁∧dx₂`; `x₃dx₁∧dx₂`; k = 0, −2 | comass 1, closed; comass 2; `d = dx₁∧dx₂∧dx₃`; one-sided bound `−2 ≤ 1` accepted, absolute bound rejected | holds |
| `immersionVolume`, `IsCalibratedImmersion` (2.2) | circle radius 2, both orientations; plane `x₃ = x₁` | 4π both; `f*φ = dvol/√2` | holds |
| `immersionVolume_le_of_isCalibratedImmersion` | flat torus `(t,0)` vs `(t, sin2πt/4)`; reversed circle; k = 0 | periods `(1,0)` both, lengths `1 < ∫sqrt(1+(π/2)²cos²)`; period −1, hypothesis fails; `#N = Σ sign ≤ #N′` with `η = 1` | holds |
| 3.2 / 3.3 | equator `Sᵐ ⊂ S^(m+1)`; flat disk | `(cosᵐt)″(0) = −m`, `−2π` at m = 1; `Q(u) = ∫|∇u|² ≥ 0` | holds |
| R5b `Q` vs Hodge energy (R01) | `T²`, `V = a(x₁)∂_(y₂)`, `a = ε sin2πx₁` | `∫|∇⊥V|² = 2π²ε²`; `|dβ|² + |δβ|² → 2π²ε²`; `Vol″ = 2π²ε²`; `LV = −a″∂_(y₂)` both | identity holds; ownership is R5b's |
| `standardKahlerForm`, `norm_standardKahlerForm` | n = 1, `(1,i)`, `(i,1)`, `(1,1)`; n = 0 | 1, −1, 0; zero form, comass 0, so `hn` is needed | holds |
| `isCalibratedFrame_standardKahlerForm_iff` | `(1,i)`, `(i,1)`, `(1,−i)`, n = 2 `(e₁,e₂)`, n = 0 | T/T, F/F, F/F, F/F, F/F (no unit vector) | both directions |
| `kahlerBivector` | `⟪e_j∧ie_j, v∧w⟫` | `x_j(v)y_j(w) − x_j(w)y_j(v)`, sum = `Im⟪v,w⟫` | holds |
| `kahlerPowerForm`, `norm_kahlerPowerForm` | n = r = 2; r = 0; r = 3 > n = 2; R03 equality | `2/2! = 1`; constant 1; zero form, so `hr` is needed; equal to `(r!)⁻¹•alternatingFormEquiv ω̂ʳ` (scratch proof) | holds; pinned map (R03) |
| `isCalibratedFrame_kahlerPowerForm_iff` | n = 3, r = 2, `(e₁,ie₁,e₂,cos t·ie₂+sin t·e₃)`; r = 0; r > n | `cos t`: T/T at 0, F/F at π, π/2; empty frames T/T; no orthonormal 2r-frame, F/F | both directions |
| `IsKahlerMetric` | flat ℂ; `dx²+4dy²`; `|z|⁻²Re⟪,⟫` on `ℂ²∖0` | `ω(1,i) = 1`; `g(i,i) = 4 ≠ 1`; coefficient `−2x₁|z|⁻⁴` on `dx₁∧dx₂∧dy₂` | both clauses needed |
| `immersionVolume_le_of_isKahlerMetric` | r = 0; `{z₂ = 0}` disk | `#N ≤ #N′`; π vs any surface with equal periods | holds |
| `standardComplexVolume`, `norm_standardSpecialLagrangianForm` | n = 2, `(e₁,ie₂)`; n = 0, θ = π/2 | `det = i`; constant `cos(π/2) = 0`, so `hn` is needed | holds |
| `specialLagrangianFrame_iff` | n = 2: `(e₁, cos t e₂ + i sin t e₁)`; `(e₁,ie₂)` at θ = 0, π/2; `(e₁,ie₁)`; n = 0 | `det = cos t > 0` real but `Im⟪v₁,v₂⟫ = sin t ≠ 0`, F/F; `Re i = 0` F/F, `Re(−i·i) = 1` T/T; `Ω = 0` F/F; `cos θ = 1 ⇔ sin θ = 0 ∧ cos θ > 0` | Lagrangian clause needed; both directions |
| `IsNormalizedHolomorphicVolumeForm`, `specialLagrangianForm` | `dz`; `2dz`; `dz̄`; `dz₁` on ℂ²; θ + π, θ + π/2 | modulus 1; 2; `conj(i) = −i ≠ i`; 0 on `e₂`; `−φ_θ`; `Im(e^(−iθ)Ω)` | holds |
| `isCalibration_specialLagrangianForm` | n = m unitary frame; n > m; n = 0 | `Ω = c·det_u`, `|c| = 1`, `|det| ≤ Π‖vᵢ‖ = 1`; ℂ-dependent, so zero; `|Re(e^(−iθ)Ω)| ≤ 1` locally constant | holds |
| 5.2 symplectic comparison | `Im⟪v,w⟫` vs `ω₀(Rv,Rw)` | both `⟪Re v, Im w⟫ − ⟪Im v, Re w⟫`; n = 1, `(1,i)`: 1 = 1 | holds |
| 5.3 circle radius ρ | `ρe^(is)` | θ = s + π/2, `J grad θ = −e^(is)/ρ = H_tr`, `ι_H ω = −dθ` | holds |
| 6.1 contraction sign | `V = Σa_j∂_(y_j)` on ℝⁿ | `β = −Σa_j dx_j`; `ι_V Im Ω = Σ(−1)^(j−1)a_j dx_{ĵ} = −★β` | holds |
| 6.2 `Z_⊥` | S¹; two circles; Tⁿ | `∫f = 0`; pairing 2π ≠ 0 with the component class; `b₁ = n` | holds |
| 6.5 second jet | `A = (a)`; `diag(1,−1)`; `[[0,1],[−1,0]]` | `a²`; gap 0; Gram `(1+t²)I`, `det = 1−t²`, `″ = 4 = |W′|²` with `W₁₂ = 2t` | holds |
| `contractionPullback`, `hodgeEnergyDensity` | `T²`: `sin2πx₁ dx₂`, `sin2πx₁ dx₁` | `|dβ|² = 4π²cos²`, `δβ = 0`; `dβ = 0`, `(⋆d⋆β)² = 4π²cos²`; energy `2π²` each | holds; Gram norm, no `1/2!` |
| `secondVariation_volume_eq_hodgeEnergy` | m = 0: circle, `a = ε sin2πx`; double cover `f = 2x` (R05) | `∫a′² = 2π²ε²` both sides; `L″ = ∫a′²/2 = π²ε²`, `β = −2a dx`, `∫(a′²/4)·2dx = π²ε²` | holds for immersions |

## Not verifiable

- Lee2012ISM, Theorems 18.7 and 18.12 (2.3): recorded uncertified. The cache holds a copy taken from a personal web page; it was not read because it is not a legal source.
- Munkres1966EDT (2.4): waived; not read.
- HarveyLawson1982: the manifest records it as uncertified. The locators above were read in the operator's cached text of the article, taken from the YMSC archive copy of Acta Mathematica.
- Ownership against ComplexKahlerGeometry #1807 and #1808 was not checked file by file, because the brief gives no checkout for them. `overlaps.md` reports no dropped id from them.
- The truth of the eleven admitted theorems is not established by the build; the table above holds hand computations.

## Source issues

- none
