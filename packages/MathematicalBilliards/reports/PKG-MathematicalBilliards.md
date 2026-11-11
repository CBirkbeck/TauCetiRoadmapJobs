# PKG-MathematicalBilliards: package report

Deliverables: `packages/MathematicalBilliards/README.md`, `packages/MathematicalBilliards/Suggested.lean`,
`packages/MathematicalBilliards/metadata.toml` (`topic = "math.DS"`), `packages/MathematicalBilliards/sources.toml`
(one `cited_for` correction). `design/plan.json` is unchanged: its `gaps` list stays empty, because every
prerequisite is stated by a supplier at the section cited.

## Headline theorems

| Headline (README section) | Status |
|---|---|
| Invariance of `sin δ dδ ds` under the billiard map of a `C^k` table, `k ≥ 2` (§3.3) | stated: `ConvexTable.measurePreserving_billiardMap` |
| Birkhoff's graph theorem: a rotational invariant curve of a twist homeomorphism of the closed annulus whose interior points are all non-wandering is a continuous graph (§5.3) | stated: `isGraph_of_isRotationalInvariantCurve` |
| Birkhoff's theorem for billiards: rotational invariant curves of the billiard map are Lipschitz graphs (§5.3) | stated: `ConvexTable.exists_lipschitzWith_of_isRotationalInvariantCurve` |
| Two geometrically distinct Birkhoff orbits of every coprime type `(p, q)`, `C^k`, `k ≥ 1` (§6.4) | stated: `ConvexTable.exists_two_periodic_orbits` |
| Continuous-time mean ergodic projection with its spectral atomic mass (§12.4.1) | stated: `exists_tendsto_twistedAverage` |
| The eigenfunction criterion for weak mixing of `ℝ`-actions (§12.5) | stated: `isWeaklyMixing_iff` |
| Measure preservation and reversibility of the polygonal billiard flow (§8.3) | not statable: no carrier for the polygonal billiard flow (glued phase space, reflected trajectories, singular set, identity extension) at the pins; a construction of Layers 7–8 |
| Non-ergodicity of rational polygonal billiards (§9.3) | not statable: lacks the same flow |
| Katok–Zemlyakov unfolding conjugacy (§11.4) | not statable: lacks the polygonal flow, the glued translation surface with its atlas, and directional flows (Layers 10–11) |
| Euler characteristic and genus of the Katok–Zemlyakov surface (§11.3) | not statable: `TauCeti.eulerChar` needs a finite CW type on the glued surface, whose construction is part of the target |

Definitions in `Suggested.lean`, all with real bodies: `ConvexTable`, `ConvexTable.billiardLift`,
`ConvexTable.billiardMap`, `phaseMeasure`, `IsTwistLift`, `nonwanderingSet`, `IsRotationalInvariantCurve`,
`ConvexTable.IsPeriodicConfiguration`, `IsWeaklyMixing`. There is one proved `example`: the unit circle is a
`ConvexTable ⊤ (2π)`. It checks that the carrier is inhabited and that the orientation sign is right
(the defining quantity is `1 − cos(t − s)`).

## Corrections and choices made while writing out the design

1. **Carrier.** Injectivity on `[0, ℓ)` was a field in the design. It follows from the strict
   left-of-tangent inequality (`γ t = γ s` would make the cross product `0`), so it is now a stated
   consequence. Positivity of `ℓ` is a `Fact (0 < ℓ)` parameter, following the convention of `AddCircle`.
2. **Billiard map as a total function.** In the design the lift was a map of the open strip, which
   would need a sorry'd membership proof. `ConvexTable.billiardLift` is now a total self-map of `ℝ × ℝ`.
   The exit parameter is the infimum of the `t ∈ (s, s + ℓ)` with `e × (γ t − γ s) ≥ 0`, and
   `δ₁ = arccos⟨e, τ(s₁)⟩`. On the strip that set is `[s₁, s + ℓ)`. `ConvexTable.billiardMap` is the
   induced self-map of `AddCircle ℓ × ℝ`, computed through `AddCircle.equivIco`. `μ_A` is a measure on
   `AddCircle ℓ × ℝ` concentrated on `A`.
   The README now records the junk values in a Convention, an API bullet and a Check: identity at
   `δ = 0`, and exit `0` (not `s + ℓ`) at `δ = π`. §2.3 says that the closed-cylinder extension is a
   separate map that agrees with the formula on the open strip and at `δ = 0`.
   §3.3 says that measure preservation includes measurability of the total map. That map is piecewise
   continuous on Borel pieces, so the claim is true.
3. **Twist lifts.** The design's `IsTwistLift` covered both closed and open strips. The Lean
   definition covers the closed finite strip, which is the case the headline uses. The open-strip
   condition and monotone twist maps are now prose notions. The README also states that a negative
   twist lift is exactly a map whose inverse satisfies `IsTwistLift`, and the headline uses
   `IsTwistLift ℓ F ∨ IsTwistLift ℓ F.symm`.
4. **Rotational invariant curves** are defined for self-maps of `AddCircle ℓ × Y`, with `Y` any space.
   The README notes that null-homotopy in `AddCircle ℓ × Y` and in the open annulus agree. Its API
   bullets are scoped to an interval `Y`.
5. **§5.3 split.** The design's single §5.3 theorem had three parts. They are now:
   - the abstract continuous-graph theorem (`isGraph_of_isRotationalInvariantCurve`);
   - the Lipschitz refinement for monotone twist maps (a prose target);
   - the billiard theorem with the Lipschitz conclusion (`ConvexTable.exists_lipschitzWith_of_isRotationalInvariantCurve`).

   Each Lean name now matches its README statement exactly. The route records that, for a negative
   twist, the proof applies the positive case to `H⁻¹`, and that the boundary circles are non-wandering
   because the non-wandering set is closed.
6. **§6.2.** New definition `ConvexTable.IsPeriodicConfiguration`: periodicity, strict gaps and the
   reflection law with unit chords. It has an API and five Checks, including the new negative control
   that without the strict gaps a collapsed configuration satisfies the law as `0 = 0`. §6.4 now asserts
   two configurations not related by `Γ`. That the first is a maximiser of `W` is part of the route
   (§6.3), as in the Lean statement.
7. **Layer 12.** `IsWeaklyMixing` reads measures as reals (`MeasureTheory.Measure.real`).
   - `isWeaklyMixing_iff` quantifies over all measurable solutions of the eigen-equation. This is
     equivalent to the design's form, because an a.e. zero `f` is constant.
   - §12.4.1 characterises the limit by `w ∈ E_a` and `v − w ⊥ E_a` (the orthogonal projection).
   - The atomic mass uses Mathlib's `charFun σ`; its convention `∫ exp(itξ) dσ` is confirmed by `charFun_apply_real`.
8. **Names.** The design's Layer 7–11 Lean names (polygonal table, phase space, flow, reflection group,
   translation groupoid, translation surface) and its sub-theorem names (curvature criterion,
   regularity, polygonal measure, non-ergodicity, weak mixing ⇒ ergodic) are now prose, because
   `Suggested.lean` does not declare them. The phase space is written `Z_P`. The design's inventory
   paragraph has been rewritten to list exactly the declarations of `Suggested.lean`.
9. **Locators.**
   - Source locators of the form `Key, §n` are now `Key, Section n`, so the citation tools do not read
     source keys as roadmaps.
   - ChaikaForni2026 is cited for weak mixing at its abstract and Theorem 1.1 (lines 9–28, p. 1) and for
     eigenvalues at Theorem 1.3 (lines 99–100, p. 3); the design's "§1, p. 3" did not match.
   - Herman1983 `cited_for` no longer lists §5.1, which does not cite it.
10. **Birkhoff1927.** The cached text recorded under this key is an access-error page (the source
    file contains "Request unsuccessful. Incapsula incident"), not the paper. No claim relies on it: it
    stays a background entry in References, and I removed it from the §6.4 docstring. The manifest
    entry still says `certified`; an operator may want to refetch it. It is not requested in
    `needs-references.toml`, because nothing depends on it.

Notions moved down from later roadmaps: none. What the README could not support: nothing beyond the
four unstatable headlines above. Those stay as README targets with intended signatures in prose.

## Duplication sweep (by object) and ownership

Searched with `roadmaps grep` (main and all open heads), plus grep of the pinned Mathlib and Tau Ceti,
for billiards, twist maps and lifts, non-wandering sets, invariant curves, rotation numbers, Birkhoff
orbits, polygonal and rational billiards, cone angles, translation surfaces, abelian differentials,
weak mixing, Wiener's lemma, Koopman operators and mean ergodic theorems.

- **Removals: none.** No definition or theorem of the design exists elsewhere as the same object.
- **Pinned libraries:** no billiard, twist-map, non-wandering, weak-mixing, translation-surface or
  Wiener objects. The single-operator mean ergodic theorems (Mathlib
  `ContinuousLinearMap.tendsto_birkhoffAverage_orthogonalProjection`, Tau Ceti
  `TauCeti.Probability.metProjection`) are cited in Scope as different objects. Witness: time-one
  averages of the circle rotation keep `e₁`, continuous averages give `0`.
- **Kept variants**, now cited in Scope:
  - FactorRigidity §8.2 (main): weak mixing of trace-preserving actions of discrete groups on tracial
    von Neumann algebras.
  - ProbabilisticAndMetricNumberTheory §4.9a: Koopman strong continuity for continuous actions on R₁
    Borel spaces. §4.6 of the same roadmap: strong mixing of single maps.
  - SymplecticGeometry/CotangentLagrangian C3.1: the smooth billiard map, its measure and
    `exists_billiard_periodic_reflection`. This roadmap's statements are the finite-regularity and
    winding-refined variants.
- **Other leads, not the same object:** UnboundedOperators (Nelson's particular translation surface),
  TeichmullerGeometry ("unfolding" hits are unrelated), GeometricTopology "flat surface" hits, and
  KacMoody "rational polygonal" hits. The "twist" hits are Galois twists.
- **Ownership against open pull requests:** checked through the indexed heads with `roadmaps grep` and
  `roadmaps show`. No open roadmap owns any object of this roadmap. No declaration of `Suggested.lean`
  shares a fully qualified name with a readable roadmap.
- **Overlaps:** none change this roadmap, and none drop an id it cites.

## Supplier citations

All were resolved on main (`content` at 32cc4c35):

- C3.1 is `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md` line 471. Its convex
  billiards paragraph starts at line 527, and `exists_billiard_periodic_reflection` is in its
  `Suggested.lean` line 246, with the hypotheses as contracted.
- I5.0 and I5.4 are `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md` lines 426 and 623.
  The continuity and cup-length statements are there.
- RiemannianGeometry/Surfaces §3.1 is at line 471; `integral_signedCurvature_add_sum_exteriorAngle_eq_two_pi`
  is in its `Suggested.lean` line 130.
- GeometricTopology §1.7 is at line 1049 and §2.3 at line 1386.

All library names in the contracts were checked at the pins. 47 declarations went through `#check` in
a scratch file. The six Tau Ceti names whose modules are not built were checked in source:
- `Polygon.IsSimple.isJordanCurve_boundary`, `TauCeti/Geometry/Polygon/Simple.lean:614`;
- `TauCeti.SimplePolygon`, same file, line 767;
- `natCard_connectedComponents_compl_eq_two`, `Inside.lean:190`;
- `frontier_connectedComponentIn`, `JordanCurve.lean:175`;
- `exists_homeomorph_image_sphere`, `Schoenflies.lean:122`;
- `natCard_connectedComponents_sdiff_range_eq_two`, `TwoSides.lean:137`.

`roadmaps resolve` on the new README reports no unresolved cross-roadmap citation and no unresolved
Lean name.

## Elaboration

`lake env lean packages/MathematicalBilliards/Suggested.lean`, run from the content checkout, exits 0
with exactly **6** warnings, each `declaration uses 'sorry'`, at lines 153, 192, 208, 233, 247 and 275.
There are no other messages. The only import beyond `import Mathlib` is
`TauCeti.Analysis.Semigroups.Group.Unitary`, whose object file exists at the pin. There is no
`set_option`, and no sorry'd data.

**Binder check.** A scratch file containing `#check @name` for all 15 declarations was elaborated once.
Every elaborated type carries its hypotheses explicitly:
- `[Fact (0 < ℓ)]` on every `ConvexTable` declaration;
- `2 ≤ k` on the measure and Lipschitz theorems;
- `0 < ℓ`, `a < b`, the lift relation and the `∨ symm` twist hypothesis on the graph theorem;
- `[MeasurableVAdd₂ ℝ X]`, `[IsProbabilityMeasure μ]`, `[VAddInvariantMeasure ℝ X μ]` on the criterion;
- `[CompleteSpace H]` and `U.IsUnitary` on the projection theorem.

Each matches its README statement, and no binder was lost; nothing had to change.

**Full gate.** The gate was run without `--build` on a throwaway local clone in the scratch directory,
which was deleted afterwards. Output:

```text
gate MathematicalBilliards: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

## Dependency check

```text
depcheck: 236 roadmaps, 2134 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line and no `moved:` line. MathematicalBilliards is at line 404 of the merge
order, after QuasiregularMaps. Every named supplier is on main, apart from
ProbabilisticAndMetricNumberTheory: that is an open roadmap at line 62, and it is cited only as a kept
variant in Scope.

## Adversarial pass

The numbers come from a pure-Python computation in scratch: the ellipse `(2 cos u, sin u)` was
reparametrised by arclength, and the Lean exit-parameter formula was evaluated literally.

| Statement | Instances tried | Values computed (both sides) | Result / change |
|---|---|---|---|
| `ConvexTable` carrier | unit circle; clockwise circle; `ℓ ≤ 0`; `t − s ∈ ℓℤ` | circle: `Im(conj(i e^{is})(e^{it} − e^{is})) = 1 − cos(t − s)`, `2` at `t − s = π`, `0` exactly on `2πℤ` (proved example compiles); clockwise: `cos(t − s) − 1 = −2` at `π`; `ℓ = 0` would admit non-closed convex arcs | the `Fact (0 < ℓ)` parameter excludes `ℓ ≤ 0`; injectivity field dropped as a consequence |
| `billiardLift` on the strip | ellipse at `(2, 0)`, `δ = π/4`; `δ = π/2`; unit circle `(0, π/3)` | exit `(1.19984, 0.80006)` vs `(6/5, 4/5)`; `cos δ₁ = 0.91034` vs `11/√146 = 0.91037`; `δ = π/2` exits at `(−2, 0)` with `δ₁ = 1.5708 = π/2`; circle `(2π/3, π/3)` | agrees with the reflection law; none |
| `billiardLift` off the strip (junk) | `δ = 0`, `δ = π`, `δ = 4 ∈ (π, 2π)` at `s = 0.3` | `δ = 0`: `s₁ = 0.3005` (grid `0.0005`), `δ₁ ≈ 0` (identity); `δ = π`: empty set, `s₁ = 0` (junk), not `s + ℓ = 9.988`; `δ = 4`: `s₁ = 0.3005` | added Convention, §2.1 Check and §2.3 sentence: the closed-cylinder extension is a separate map |
| `billiardMap` | representative choice `s` vs `s + ℓ` | equivariance `F(s + ℓ, δ) = F(s, δ) + (ℓ, 0)` on the strip, so the class is independent of the representative | none |
| `phaseMeasure` | total mass; image under `Ψ` | `ℓ · ∫₀^π sin = 2ℓ`; `μ_A(δ < π/2) = ℓ`; density `sin δ dδ = d(−cos δ)` gives `volume ⊗ Leb` on `(−1, 1)` | none |
| `measurePreserving_billiardMap` | ellipse Jacobian at `(2, 0)`, `δ = π/4`; measurability of the junk part | `sin δ/sin δ₁ = 1.7085` vs `√73/5 = 1.7088`; wrong ratio `0.5853`; `sin δ₁ · 1.7088 = 0.70711 = sin(π/4)`. Off `A` the map is continuous on `δ ∈ (π, 2π) ∪ {0}` (exit `s`) and on `δ ≡ π` (exit `0`), so it is measurable | true as stated; measurability noted in §3.3 |
| `IsTwistLift` | shear `(x + y, y)` on `ℝ × [0, 1]`; rotation `(x + 1/4, y)`; inverse shear | shear: `∂_yF₁ = 1 > 0`, lines `y = 0, 1` preserved; rotation: `F₁` constant in `y`, not strictly monotone; inverse shear: `∂_y = −1`, and its inverse (the shear) satisfies the predicate | `∨ symm` form captures negative twists; none |
| `nonwanderingSet` | translation `x ↦ x + 1` on `ℝ`; `(x, y²)` on `S¹ × [0, 1]`; identity | translation: empty set; `y²`: only the circles `y = 0, 1`; identity: everything | closedness for any self-map, invariance for homeomorphisms; API wording fixed |
| `IsRotationalInvariantCurve` | level circle of the circle table; small contractible circle; two level circles | degree `1`, invariant; degree `0` (null-homotopic); not the image of an injective `Circle` | general `Y` with the null-homotopy remark |
| `isGraph_of_isRotationalInvariantCurve` | shear on `S¹ × [0, 1]`, curves `y = c`; rotation by `1/4` with the wavy curve `t ↦ (t + 0.1 sin 8πt, 1 + 0.1 sin 8πt)`; negative twist (inverse shear) | shear: graphs of constants; rotation: `dx/dt = 1 − 0.8π = −1.513 < 0` somewhere, so not a graph, but the twist hypothesis fails (excluded); inverse shear: `F.symm` is the shear, so the hypothesis holds and the curves are graphs | none |
| `exists_lipschitzWith_of_isRotationalInvariantCurve` | circle table, `R = 1`; slope bound | curves `δ = c`: `ψ` constant, `K = 0`; ratio bound `1/(2R) = 1/2 ≥ 0` | none |
| `IsPeriodicConfiguration` | unit-circle equilateral `(1, 3)`; `(0, π/2, π)`; diameter `(1, 2)`; collapsed `(0, 0, 0; ℓ)` | components `(0.5, 0.5)`; `(0, 0.70711)` (fails); `(0, 0)`; collapsed: all chords `0`, totalised `u_j = 0`, law `0 = 0` | gap conditions are what exclude collapsed sequences; added as a Check |
| `exists_two_periodic_orbits` | ellipse `(1, 2)`; circle; distinctness formula | major axis `W = 8`, minor axis `W = 4`: not `Γ`-related; circle: a circle of critical configurations, any two non-`Γ`-related; inward derivative `2p(q − p)ℓ/q` at `ℓ = 2π`: `6.2832` for `(1, 2)`, `8.3776` for `(1, 3)` and `(2, 3)`; `(2, 4)` (not coprime) excluded | `∀ m n, ∃ j, s′_j ≠ s_{j+m} + nℓ` is exactly "different orbits on `A`"; none |
| `exists_tendsto_twistedAverage` | `ℂ²`, `U_t = diag(e^{2πit}, e^{4πit})`, `v = (1, 2)`; identity group; `v = 0` | averages at `T = 500`: `a = 0 → 0`, `a = 1 → (1, 0)`, `a = 2 → (0, 2)`, `a = 1/2 → 0`; `‖w‖² = 0, 1, 4, 0`, equal to the masses of `δ_{2π} + 4δ_{4π}` at `2πa`; `⟨v, U_{1/4}v⟩ = −4 + i = charFun(δ_{2π} + 4δ_{4π})(1/4)`; identity group: `w = v` at `a = 0`, `w = 0` at `a ≠ 0`, `σ = ‖v‖²δ₀` | the `charFun` convention matches; none |
| `IsWeaklyMixing` | two-point trivial action; horizontal torus flow, half-torus; one point | `|1/2 − 1/4| = 1/4`; average `0.125 = 1/8`; one point: residual `0` | `μ.real` form; none |
| `isWeaklyMixing_iff` | circle rotation flow `e₁`; two-point identity; one point; a.e. zero `f` | `e₁(x + t) = e^{2πit}e₁(x)`, nonconstant, and not weakly mixing (`1/8`); indicator of a point: eigenvalue `0`, nonconstant, residual `1/4`; one point: all `f` constant; `f = 0` a.e. is constant | equivalent to "every eigenfunction a.e. constant"; none |
| Scope: mean ergodic comparison | circle rotation flow on `AddCircle 1` | time-one map `= id`, Birkhoff averages of `e₁` equal `e₁`; `T⁻¹∫₀ᵀ e^{2πit}dt · e₁ = 0` at every integer `T` | the claim is correct |
| Convention witnesses (total maps, weak mixing) | `δ = π`; torus half-set | junk exit `0` vs extension `s + ℓ`; `∫₀¹ \|\|1/2 − t\| − 1/4\| dt = 1/8` | none |

Unchanged mathematics (Layers 1–4 geometry, 7–11, the Checks carried over from the design) keeps the
computed rows of the accepting design review. Its §12.4.1 and §6.4 rows were recomputed above.

## Sources

No new source was fetched, and `needs-references.toml` was not written: every cited text is either
cached (Herman1983, Hochman2012, BialyMironov2022, ChaikaForni2026) or settled as waived or uncertified.

These locators were re-read at the cited lines:
- Herman1983 lines 149–155, 188–192, 425–432, 803–807 and 1150–1154;
- BialyMironov2022 lines 103–104 and 261–263;
- ChaikaForni2026 lines 9–28 and 83–100;
- Hochman2012 lines 2483–2487, 2854–2855, 3076–3080, 3099–3103 and 3141–3143.

No source passage was copied. No suspicious instruction was found in any input.
