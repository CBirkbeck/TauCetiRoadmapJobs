<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7416#issuecomment-6692572733 -->
Review (claude) of 2229291

Verdict: needs_changes

1. **F01** (P2) §3.1 Koszul "iff" lacks nondegeneracy in the ⇐ direction

   Location: `packages/LorentzianGeometry/design/README.md` line 350, "Koszul formula: if `b` is symmetric and its pairings of differentiable fields are differentiable, then `IsLeviCivitaFor cov b` iff `2 b(∇_X Y, Z) = koszulBilinear I b X Y Z`"; the same in `plan.json` target 3.1, api `isLeviCivitaFor_iff_koszul`.

   Claim: for any symmetric pointwise field with differentiable pairings, the Levi-Civita laws are equivalent to the Koszul identity on differentiable fields.

   Witness: take `b = 0` on Minkowski `ℝ²` and the README's own connection `∇_v Y = DY(v) + v⁰ J Y` (§3.1 Check 3). Every term of `koszulBilinear` is a pairing by `b = 0`, so `0 = 0` holds for all differentiable `X, Y, Z`; but the torsion at `(e₀, e₁)` is `J e₁ = e₀ ≠ 0`, so `IsLeviCivitaFor` fails. The pinned converse lemma `TauCeti.Manifold.torsion_eq_zero_of_two_apply_eq_koszulBilinear` (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Basic.lean:195`) carries the hypothesis `hinjective` (nondegeneracy of `b x` against differentiable fields); `metricProductRule_of_two_apply_eq_koszulBilinear` (line 174) does not need it.

   Repair: state the bullet as "for symmetric `b` with differentiable pairings, `IsLeviCivitaFor cov b` implies the Koszul identity; if `b` is moreover nondegenerate at every point, the Koszul identity implies `IsLeviCivitaFor cov b`" (and the same in the plan's api statement). Tested on the instance: with `b = η` (nondegenerate) the same torsionful connection violates the Koszul identity, `2η(∇_{e₀} e₁, e₀) − koszul = 2η(J e₁, e₀) = −2 ≠ 0`, so the repaired iff holds there.

2. **F02** (P2) §4.4 and §4.5 use gluing without its hypotheses

   Location: `packages/LorentzianGeometry/design/README.md` lines 472–476 ("`p^* g` is a Lorentzian metric of the class of `g`, and `(M̂, p^*g)` carries the canonical time orientation"; "time-orientable iff `p` has a continuous section") and line 499 ("Time-oriented extensions"); `plan.json` 4.4 hypotheses `['g Lorentzian of class C^0']`, 4.5 api `IsExtendible.exists_timeOriented`.

   Claim: the cover carries a canonical time orientation, a continuous section of `p` yields a time orientation, and a time-oriented extendible manifold has a time-oriented extension, with no topological hypothesis on `M` (or `M̃`).

   Witness: §4.1 defines a time orientation as a class of *global continuous timelike vector fields*. The cover only gives a continuous cone field (locally, the field `X` of a trivialising `U`); passing from cones to a global field is the gluing of §4.2, which the README states for `M` Hausdorff and σ-compact, through `PartitionOfUnity.exists_isSubordinate` (`Mathlib/Topology/PartitionOfUnity.lean:430`, `[NormalSpace] [ParacompactSpace]`). The Conventions promise that `[T2Space M]` and `[SigmaCompactSpace M]` are "written exactly where a theorem uses them (gluing, partitions of unity)"; §4.4's `*Needs:*` line does not list §4.2, and §4.5 inherits the gap for `M̃`.

   Repair: add `[T2Space M] [SigmaCompactSpace M]` to §4.4's canonical orientation, section criterion and lifting statements (the cover is then Hausdorff and σ-compact too), add §4.2 to §4.4's `*Needs:*`, and add the same hypotheses on `M̃` (and `M`) to the time-oriented extension bullet of §4.5 and to `plan.json` 4.4/4.5. Tested: on Minkowski `ℝ²` (Hausdorff, σ-compact) the repaired statements give the two sections and the canonical orientation of the §4.4 Check unchanged.

3. **F03** (P2) §2.4 states a tautology in place of the constancy theorem

   Location: `packages/LorentzianGeometry/design/README.md` line 290: "so on a connected subset where `X` is timelike everywhere, or spacelike and nonzero everywhere, the causal character is constant".

   Claim: constancy of the causal character on connected sets (target.md final target 3; `minguzzi2019` lines 443–449).

   Witness: the hypothesis contains the conclusion ("timelike everywhere … the causal character is constant"), so the clause carries no content, and the theorem actually needed (by §4.3's future-directed curves and §5.3's "`L` is future- or past-directed on each component of `U`") is stated nowhere. Instance showing the content of the intended statement: on Minkowski `ℝ²`, `X(t, x) = ∂_t + x ∂_x` has `g(X, X) = −1 + x²`, timelike on `{|x| < 1}`, null on `{|x| = 1}`, spacelike on `{|x| > 1}`; on the connected set `{|x| < 1}`, which avoids the null and zero loci, it is timelike throughout.

   Repair: "the timelike locus and the nonzero-spacelike locus of `X` are disjoint open subsets of `U`; hence on a connected subset of `U` on which `X` is nowhere null and nowhere zero, `X` is timelike throughout or spacelike throughout." Add the instance above as a Check of §2.4 (`plan.json` 2.4 gains a test).

4. **F04** (P3) §1.8 "the null vectors of `W` are its nonzero elements" is ambiguous

   Location: `packages/LorentzianGeometry/design/README.md` line 190 (and `plan.json` 1.8 statement, last clause).

   Claim intended: the null vectors of a null hyperplane are the nonzero elements of its radical line. As written, "its" can be read as `W`, which would say every nonzero element of `W` is null; refuted by `W = ker(dt − dx¹)` in Minkowski `ℝ³`, which contains the spacelike `e₂`. Repair: "and the null vectors of `W` are exactly the nonzero elements of that radical line (§1.7)".

5. **F05** (P3) §3.3 chart-transformation law has no direction

   Location: `packages/LorentzianGeometry/design/README.md` line 377: "for a chart transition `φ`, `Γ̃ = (Dφ)⁻¹ ∘ (D²φ + Γ(Dφ ·, Dφ ·))`".

   The formula is correct only when `φ` maps the chart in which `Γ̃` is read to the chart in which `Γ` is read. Witness (one dimension, flat metric, `Γ = 0` in the coordinate `x`): for `x = φ(z) = z²` on `z > 0`, the geodesics `x = a + bt` give `z'' = −(z')²/z`, so `Γ̃ = 1/z = (2z)⁻¹ · 2 = (Dφ)⁻¹ D²φ`. Repair: say "for `φ` the transition from the chart of `Γ̃` to the chart of `Γ`" and record this witness as a Check.

6. **F06** (P3) swapped line numbers for the Hom-bundle lemmas

   Location: `packages/LorentzianGeometry/design/README.md` line 61: "`contMDiffAt_hom_bundle` and `contMDiffWithinAt_hom_bundle` (`Mathlib/Geometry/Manifold/VectorBundle/Hom.lean:72, 79`)". At the pin, line 72 is `contMDiffWithinAt_hom_bundle` and line 79 is `contMDiffAt_hom_bundle`. Repair: write `79, 72` (or swap the names).

7. **F07** (P3) §2.3 chart-independence locator does not support the statement

   Location: `packages/LorentzianGeometry/design/README.md` line 267: "(`minguzzi2019` §1.5, line 376 for smooth manifolds; `hawkingellis1973` §2.6)".

   `minguzzi2019` line 376 is the heading "1.5 Manifolds"; the section defines a Lorentzian manifold as a smooth manifold with a `C²` metric (lines 396–397) and says nothing about chart independence or Hölder classes. Repair: cite `minguzzi2019` lines 396–397 for the definition, `chrusciel2011` lines 234–236 for "locally Hölder" `C^{k,α}` (already cited in §2.1), keep `hawkingellis1973` §2.6 (uncertified) for chart independence, and state in the sentence that chart independence is a standard consequence of the `C^∞` transition maps proved here.

8. **F08** (P3) the existing global Hölder carrier is not named

   Location: `packages/LorentzianGeometry/design/README.md`, "Scope and ownership" and "From Tau Ceti" (lines 5–16, 65–82).

   The design report says Tau Ceti has only bounded global Hölder spaces, but the README names none. At the pin, `TauCeti.CkHolderSpace k α E F` (`TauCeti/Analysis/Holder/Iterated.lean:219–224`, with `HolderSpace` at `TauCeti/Analysis/Holder/Normed.lean:60`) is the global bounded `C^{k,α}` space on a whole normed space. Repair: add it to the Tau Ceti contract with one clause on how §2.1 differs (local, on a relatively open subset of `range I`, no global bound), so the duplication audit is visible in the README.

9. **F09** (P3) §3.4 smooth comparison omits `[T2Space M]`

   Location: `packages/LorentzianGeometry/design/README.md` line 386 ("for a smooth metric, `R_x` is Tau Ceti's `curvatureTensor` of `∇` and `Ric_x` its `ricciTensor`"). `CovariantDerivative.ricciTensor` (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Ricci.lean:65`) is declared under `[T2Space M]` and `[ContMDiffCovariantDerivative cov ∞]`; the contract records this but the bullet does not. Repair: add "for `M` Hausdorff" to the comparison bullet and `plan.json` 3.4.

10. **F10** (P3) theorem and page locators where the text has them

   Location: `packages/LorentzianGeometry/design/README.md`, §1.5, §1.7, §2.2, §4.1, §4.2, §5.4 and "References".

   Most locators are extraction line numbers only, although the texts carry theorem numbers and pages: `minguzzi2019` §1.3 p. 7, §1.4 Theorems 1.2–1.3 and Corollary 1.4 pp. 8–9, §1.7 pp. 10–11, Definition 1.6 p. 11; `chrusciel2011` §2.1 pp. 3–5 (Definition 2.1.1, Remark 2.1.2, Proposition 2.1.3), §2.2 pp. 5–6, footnote 2 p. 6; `sbierski2018` §1.1 p. 3, Definitions 2.1–2.2 p. 7, Definition 2.15 and Remark 2.16 p. 11; `galloway2004` §3 p. 5. Repair: add the theorem number and printed page next to each line locator (the line stays).

Files reviewed, read-only: `packages/LorentzianGeometry/design/README.md`, `packages/LorentzianGeometry/design/plan.json`, `packages/LorentzianGeometry/sources.toml`. No previous review. This is a design (no `Suggested.lean`), so elaboration, the one-tactic padding probe and the Lean-form checks do not apply; the headline-theorem statability is assessed for the package stage under "Verified sound". The sources manifest was not changed (every cited work is already recorded; no fetch was needed).

## Verified sound

**Principles.** No route-specific shortcut (every theorem is stated for all dimensions, all signatures where no step uses the signature, corners allowed where the proof allows them). No re-planned roadmap: the smooth nondegenerate theory is consumed from HopfRinow Layer 1 as realised at the pin, and the finite-regularity extension is new (the pinned carrier is `Cₛ^∞`, `NondegenerateMetric/Basic.lean:73`; the pinned `Nondegenerate/Regularity.lean` treats smooth metrics only). All suppliers are on main or earlier in the merge order; no copied passage (checked §1.3–§1.6, §2.6, §4.1–§4.5, §5.4 against the cited lines); no algorithm; no Lean file yet, so no sorry'd data or `set_option`.

**Gate.** Output:

```
candidate: LorentzianGeometry is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2348 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

**Supplier citations resolved on main** (content checkout, main): HopfRinow `Completed/HopfRinow/README.md:264–300` (Layer 1, "Nondegenerate Levi-Civita supplier", with the Koszul, Christoffel, signature, along-curve and family items); DifferentialGeometry `README.md:63` ("Boundary and corners"), `:357` (2.3, `IsCoveringMap.inducedChartedSpace`, `ContMDiff.of_comp_isCoveringMap`), `:918–922` (12.2 `mgradient`, 12.3 `hessian`, `laplaceBeltrami`); PDE `README.md:996–1011` (§1.7, `C^{k,α}(Ω)` and `C^{k,α}_loc(Ω)`); PseudodifferentialOperators `README.md:164` (P1.0), `:432` (`σ_geom(P)(df) = (1/m!)[…[P,f],…,f]`), `:462` (`σ_F = −σ_geom` for `∂²`); RiemannianGeometry `README.md:13–26` (Conventions, `R(X,Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_[X,Y] Z`, unit sphere curvature +1), `:179` (R1); LocalVariationalFieldTheory `README.md:601–612` (§3.8, `η = diag(+1,−1,−1,−1)`). Ownership against the 459 open roadmap pull requests (`roadmaps grep` for Lorentzian manifold/metric, time orientation, null hypersurface, optical function, wave operator, causal curve, inextendibility, time cone, `IsLorentzian`, local Hölder, hypersurface by defining function): no owner; NoncompactQuantumSymmetry and RelativisticQuantumFieldTheory use time orientation only on fixed Minkowski data; LocalVariationalFieldTheory `README.md:1037` assumes a time-oriented Lorentzian four-manifold without defining it. Board index: three packages, none Lorentzian. Declared gaps: none, correctly.

**Pinned declarations.** All 31 Mathlib citations and all 38 Tau Ceti citations of the supplier contracts opened at the pins at the stated file and line (one swapped pair, R06; `range_mfderiv_eq_ker_mfderiv` is at `RegularValue/Level.lean:505`, cited by file only). Statements read and compared: `ContMDiffNondegenerateMetric` is smooth-only (so §2.2 and §3.1–§3.3 are not duplicates); `IsMetricCompatible`, `IsLeviCivitaConnection`, `uniqueness` (`Nondegenerate/Basic.lean:185, 239, 280`), `leviCivitaConnection` with junk `0` on non-differentiable fields (`Existence.lean:102`); the Koszul lemmas' hypotheses (`LeviCivita/Basic.lean:174` needs `[IsManifold I 1 M]`, `:195` needs `[IsManifold I 2 M]`, `[FiniteDimensional ℝ E]` and `hinjective`; `:281, 288` need `hdiff`); `isLocallyConstant_sigPos_sigNeg_of_continuous` for any continuous family (`Signature.lean:104`); `mtangentConeAt I s y : Set E` read in the extended chart and intersected with `range I` (`TangentCone.lean:86`); `isManifold_regularLevel` under `[I.Boundaryless]` (`Level.lean:113, 435`); `IsPiecewiseContMDiffOn` existential strict partition (`PiecewisePath.lean:73`); `curveVelocityWithin` junk `0` (`MFDeriv/Curve.lean:135`); `accelerationWithin_eq_zero_iff` and `accelerationWithin_comp` (`Acceleration.lean:133, 157`), the latter giving `φ''γ' + φ'² D_tγ'`; `realCliffordForm` weights `+1` first, `−1` last (`RealForm/Basic.lean:113`); `sigNeg_prod` on `Q.prod Q'` (needs the equivalence to the orthogonal sum, both cited); `ODE_solution_unique_of_mem_Ioo` (Lipschitz on `s t`, both solutions in `s t`), `IsPicardLindelof`, `exists_isMIntegralCurveAt_of_contMDiffAt` (`[CompleteSpace E]`, interior point), `isMIntegralCurveOn_Ioo_eqOn_of_contMDiff_boundaryless`, `PartitionOfUnity.exists_isSubordinate` (`[NormalSpace] [ParacompactSpace]`), `SmoothPartitionOfUnity.exists_isSubordinate` (`[T2Space M] [SigmaCompactSpace M]`), `ContDiffPointwiseHolderAt` (pointwise big-O), `IsSmoothEmbedding` (immersion and embedding), `sigNeg := sigPos (−Q)`, `equivalent_one_neg_one_weighted_sum_squared` (`FiniteDimensional`, `SeparatingLeft`).

**Sources, seeded sample** (cached line-numbered texts; every locator found at its line): §1.1 `minguzzi2019` 296–300 (Lorentzian signature `(−,+,…,+)`, canonical basis) ✓; §1.5 `chrusciel2011` 84–98 (two components, stability under addition and positive scalars, same orientation iff `g(X,Y) < 0`), `minguzzi2019` 308–309, `minguzzi2019cone` 236–244 ✓; §1.6 `minguzzi2019` Theorem 1.2 (336–348), Theorem 1.3 (349–368), Corollary 1.4 (371), with the extension by continuity to zero vectors at 334–335 ✓ (README's "linearly dependent" covers `u = 0`); §1.7 `galloway2004` 176–181 (one-dimensional null space, tangent vectors not parallel to `K` spacelike) ✓; §2.1 `chrusciel2011` 234–236 (`C^{k,α}`: `k`-th derivatives locally Hölder) ✓; §2.4 `minguzzi2019` 439–452 (cone bundle, global timelike field, local timelike field from a chart) ✓; §2.6 `sbierski2018` Definition 2.1 (269–273: piecewise smooth, one-sided derivatives in the same component), `minguzzi2019` 323–326 (causal curves are regular) ✓; §3.4 `oneill1983` Ch. 3 uncertified, `chrusciel2011` 186–193 (Christoffel formula, contravariant metric) ✓; §3.5 `chrusciel2011` 184–193, `galloway2004` 183–185 ✓; §3.6 `chrusciel2011` 201–207 (`C^{1,1}` ⇒ Lipschitz Christoffel ⇒ existence and uniqueness), 232–233 (`C^{1,α}` non-uniqueness), 1305–1306; `minguzzi2019cone` 81–83; `minguzzi2019` 1025–1027 ✓; §4.2 `chrusciel2011` 99–112, 132–144 (gluing by a partition of unity), Proposition 2.1.3 at 163–171 (the extraction loses the division of (2.1.2); the README's formula is the correct one) ✓; §4.3 `chrusciel2011` 114–116 (exactly two choices), 118–120 (Definition 2.1.1, no connectedness), `sbierski2018` 265–268, Definition 2.2 (274–276) ✓; §5.1 `galloway2004` 174–175 ✓; §5.2 `galloway2004` 174–182 ✓; §5.3 `luoyu2023` 1005–1008 (`L` generating the null geodesics of `C_u`), `galloway2004` 176–181 ✓. Also read: `sbierski2018` 106–119 (`C⁰`-extendible, `C²`-inextendible example; curvature blow-up), 256–261 (smooth structure for convenience), 281–284 (restriction), 473–495 (Definition 2.15, Remark 2.16, footnote 6); `dafermosluk2017` 366–372; `rodnianskishlapentokhrothman2023` 262–264 (`1+1` quotient with boundary); `chruscielgrant2012` 64–73; `luoyu2023` 95, 422–424; `luoyu2023b` 211–214, 329–333, 417–418.

**Adversarial table** (values computed; curvature by central finite differences in pure Python, step `10⁻³`–`10⁻⁴`):

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Conv. signature, §1.1 | `η₂`, Euclidean, `diag(−1,0)`, `diag(−1,−1,1)`, `−η₄`, `−η₂`, `realCliffordForm 3 1`, dim 1, dim 0 | `sigNeg = 1, 0, 1 (degenerate), 2, 3, 1, 1`; `−xy` on `ℝ`: `sigNeg 1`; zero space `0` | holds; `−b` Lorentzian iff `dim 2` | none |
| §1.2 inverse form | `η`, `diag(−2,1)`, `[[0,−2],[−2,0]]`, `4η` | `b⁻¹(dt,dt) = −1`; `−½` (Gram model `−2`); inverse `[[0,−½],[−½,0]]`; `−¼`; isometry `b⁻¹(b♭u,b♭w) = (b♭u)(w) = b(u,w)` | holds | none |
| §1.3 trichotomy, orthogonality | `e₀`, `e₀+e₁`, `e₁`, `0`; `e₀±e₁`; `e₀+e₁`, `2(e₀+e₁)` | `−1, 0, 1, 0`; `η = −2`; `0` | holds; `0` spacelike by convention | none |
| §1.4 cones | `v = e₀`: `(2,1)`, `(−1,½)`; `v = e₁`: `(1,−½)`, `(−1,−½)`, `(0,−½)`; closure | `η(w,w) = −3`, `η(e₀,w) = −2`; `−¾`, `1`; `−¾`, `−¾`, `¼` (not convex); `η(e₀, −e₀+e₁) = 1` | holds; closure `{a ≥ ‖w_⊥‖}` ∋ 0 | none |
| §1.5 timecone theorem | `η₂`; dim 1 | closures meet in `{a ≥ ‖w_⊥‖} ∩ {−a ≥ ‖w_⊥‖} = {0}`; dim 1: two rays | holds both directions | none |
| §1.6 reverse C–S, triangle | `(2,1),(1,0)`; `(1,1),(1,−1)`; `(1,1),(2,2)`; `u, −u`; `u = 0` | `2 ≥ 1.732`; `2 > 0`; `0 = 0`; `−b(u,−u) = −3 < 0`; `0 = 0` | holds on one closed cone; equality iff dependent | none |
| §1.7 null hyperplanes | `n = e₀+e₁` in `ℝ²`, `ℝ³` | `n^⊥ = ℝn`; `n^⊥ = span(n, e₂)`, `η(e₂,e₂) = 1` | holds | R04 wording in §1.8 |
| §1.8 hyperplanes | `dt`, `dx`, `dt−dx` on `ℝ²`; dim 1 | `b⁻¹ = −1, 1, 0`; `b♯(dt−dx) = (−1,−1)`, `η((−1,−1),w) = w⁰−w¹`; dim 1: `W = 0`, `b⁻¹ < 0` | holds, three cases, both directions | none |
| §1.9 acoustical | `c = 2`, `v = (1,0)`; `1+1`, `v = 0.7`, `c = 1.3` | `a(B,B) = −4`; `(1,(3,0))`: `0`; `(1,(1,0))`: `−4`; Gram inverse row `(−¼, −¼, 0)`, `a⁻¹(dx¹,dx¹) = ¾`; `∂_t + (v±c)∂_x`: `0, 0` | holds; `a⁻¹ = −c⁻²B⊗B + Σ∂_i⊗∂_i` | none |
| §2.1 local Hölder | `|x|^α`, `x|x|`, `x² sin(1/x²)`, `√(x+y)` on `[0,1)²`; `C^{k+1} ⇒ C^{k,1}` on `s` rel. open in convex `C` | `f'(x_m) = −5.013, −15.853, −50.133` (`m = 1, 10, 100`); `√t` not Lipschitz at `0`; `B(x,r) ∩ C` convex and `D^{k+1}f` bounded there by continuity at `x`, mean value inequality | holds | none |
| §2.2 metric carrier | constant `η`; `diag(−1,x²)`; `diag(−1, sign x)` | `sigNeg 1` everywhere, degenerate at `x = 0`; discontinuous | excluded as required | none |
| §2.3 classes, chart independence | `diag(−1, 1+|x|^{3/2})`; quadrant `−(1+(x+y)^{3/2})dx²+dy²`; chart `(t,x) ↦ (t,x³)` | `(3/2) sgn(x)|x|^{1/2}` is `½`-Hölder, `(3/4)|x|^{−1/2}` unbounded; corner derivative not Lipschitz, `x+y > 0` off the corner; coefficient `(1/9)y^{−4/3}` | holds over the smooth atlas | R07 locator |
| §2.4 signature, openness | `diag(−1,x)`; `X = ∂_t + x∂_x` | index changes only through degeneracy; `g(X,X) = −1+x²` | first and third bullets hold; second is a tautology | R03 |
| §2.5 operations | `φ = log 2`; `φ(s,y) = (2s,y)`; `h = dt²+dx²`, `X = 2∂_t`, `X = ∂_t+∂_x`; `Ω = 1`, `u = t−x`, `v = t+x`; `θ⁰ = dt`, `θ¹ = t dx` | `−4`, `0`, `−¼` (vs `−2`, `−½`); `−4` (vs `−¼`); `−dt²+dx²` (vs `−7dt²+dx²`), `g(X,X) = 2−4 = −2`; `g(∂_u,∂_v) = −2`, `g⁻¹(du,du) = 0`, `g⁻¹(du,dv) = −½`; degenerate on `{t = 0}` | holds | none |
| §2.6 causal curves | `(s,s/2)`, `(s,s)`, `(s,2s)`, constant; breaks `(1,1)→(1,−1)`, `(1,0)→(−1,0)`, `(1,1)→(−1,−1)` | `−¾`, `0`, `3`; zero velocity; `η(e₀,(1,−1)) = −1` same cone; opposite cones; `η = 0` yet opposite | holds; `g(v₋,v₊) ≤ 0` insufficient | none |
| §3.1 Levi-Civita predicate, Koszul iff | flat `η`; `diag(−1,e^{2t})`; `A = v⁰w⁰e₀`; `A = v⁰Jw`; `b = 0` with `A = v⁰Jw` | compat defect `2e^{2t}` vs `0`; `−2`; torsion `e₀`, `η(Je₀,e₁) = 1 = −η(e₀,Je₁)`; Koszul `0 = 0`, torsion `e₀` | laws independent; iff fails for degenerate `b` | R01 |
| §3.2 existence, uniqueness | smooth `b`; differentiable `b` | tensoriality needs only `hdiff`; `koszulBilinear_{add,smul}_second` exist at `LeviCivita/Basic.lean:224, 235` | holds | none |
| §3.3 Christoffel, transformation | `k = 1, ∞`, `C^{1,α}`; `x = z²`, `Γ = 0` | `C⁰`, `C^∞`, `C^{0,α}`; `Γ̃ = 1/z = (Dφ)⁻¹D²φ` | holds with `φ` from the `Γ̃`-chart to the `Γ`-chart | R05 |
| §3.4 curvature | de Sitter `t = 0.37`; Milne `t = 1.3`; Sbierski `t = 0.5, 0.1`; sphere `θ = 1.1`; conformal formula | `Γ^t_{xx} = 0.4047 = cosh sinh`, `Γ^x_{tx} = 0.3540 = tanh`, `Ric = diag(−1, 1.1433)`, `Scal = 2.00000`; `Scal = −5·10⁻⁷`; `−0.34382, −8.40089` vs formula `−0.34382, −8.40036`; `Scal = 2.00000`; `R^t_{xtx} = cosh²`, `R^x_{txt} = −1` by hand; `−2e^{−2φ}□φ = −0.34382` at `t = 0.5` | holds, Lee's sign | R09 (`T2Space` for Ricci comparison) |
| §3.5 geodesics, pregeodesics | `f = 2`, `ψ(s) = e^{2s}/2`; general `ψ' = exp∫f` | `φ'' = −f(φ)φ'²` by differentiating `φ' = 1/ψ'(φ)`; `D(γ∘φ)' = φ''γ' + φ'² f γ' = 0` | holds | none |
| §3.6 `C^{1,1}` | half-space boundary point, outward `v`; uniqueness at boundary | no geodesic on an open interval; `ODE_solution_unique_of_mem_Ioo` with `s t` = chart target | existence interior only, uniqueness everywhere | none |
| §4.1 time orientations | Minkowski; `∅`; two copies; discontinuous field | `g(∂_t,−∂_t) = 1`; `1` class; `4` classes | continuity, nonemptiness, connectedness load-bearing | none |
| §4.2 gluing, existence | single chart; `X` nowhere zero, `h` smooth | constant-coordinate fields smooth, timelike nearby; `g_X(X,X) = −h(X,X)`; smooth representative `X'` gives `C^∞` `g_{X'}` | holds under `T2 + σ-compact` | none |
| §4.3 two orientations, future-directed | Minkowski; disconnected; closure of future cone | `Nat.card = 2`; `4`; causal `v` with `g(T,v) ≤ 0` and `≠ 0` ⇒ `< 0` | holds | none |
| §4.4 cover | Minkowski `ℝ²`; `∅`; two Möbius bands; lifts `(t,x) ↦ (t,x mod 2)`, `(−t,x+1 mod 2)`; deck `(t,y) ↦ (−t,y+1)` | fibres `2`, components `2`, sections `2`; `M̂ = ∅`, one section; two cylinders; `p∘lift = π` since `σ(t,x) = (−t,x+1)`, `σ_*∂_t = −∂_t` | holds; canonical orientation needs gluing | R02 |
| §4.5 extensions | Sbierski; `{t > 0}`; identity; covering `(0,1)×ℝ → ℝ×(ℝ/ℤ)`; time-oriented lift | `e^{2√|t|}` is `C^{0,½}`, `Scal → −∞`; image not proper; not injective; component of `M̃̂` surjects onto connected `M̃`, `p(ι̂M) = ιM ≠ M̃` | holds | R02 (hypotheses on `M̃`) |
| §5.1 hypersurfaces | light cone with/without vertex; `t`, `te^x`; quadrant face; `{x+y = 0}` at the corner | directions `(1,ω)` span `ℝ^{1+n}`; `d(te^x) = e^x dt` at `t = 0`; cone `ℝ_{≥0}e_y` spans `ker dx`; cone `{0}` spans `⊥` | holds; tangent-cone condition load-bearing | none |
| §5.2 null TFAE, null normals | `{t = 0}`, `{x = 0}`, `{t = x}`; two normals | `g⁻¹(df,df) = −1, 1, 0`; ratio of nonvanishing sections continuous | holds | none |
| §5.3 optical functions | `t − r`; `t`; double null `u`; `w = t² − |x|²` | `0`, `L = ∂_t + ∂_r`; `−1`; `−grad u = (2Ω²)⁻¹∂_v` from `g(a∂_v,∂_u) = 1`; `g⁻¹(dw,dw) = −4w`, `L = (2t, 2x)`, `DL(L) = (4t,4x) = 2L` | holds | none |
| §5.4 `∇_L L = κL` | `N = grad f`, `h = g⁻¹(df,df)`; `L = φN + W` | `g(∇_N N, Y) = Hess f(Y,N) = ½ Y(h)`; `∇_L L = (L(φ)/φ + φκ_N)L`; `|df(L)| ≤ C|f|` for `df(L) ∈ C¹` vanishing on `H` | holds at `g ∈ C¹`, `H ∈ C²`, `L ∈ C¹` | none |
| §5.5 wave operator, symbol | Minkowski `n = 3`; `½[[□,f],f]`; acoustical `1+1` | `−2`, `6`, `−8`; `[[□,f],f]u = 2u g⁻¹(df,df)` by expanding the Leibniz rule; `σ(dx−(v+c)dt) = 2·10⁻¹⁶`, `σ(dt) = −0.5917 = −1/c²` | holds; characteristic iff null | none |
| Conventions witnesses | `b♯(dt) = −e₀`; `L = ∂_t + ∂_r`; `g(∂_t, ∂_t+∂_x) = −1`; `□(t²) = −2`; `σ(dt−dx¹) = 0` | all recomputed | hold | none |

**Context checks.** `[T2Space M]` in §3.6, §4.2; `[SigmaCompactSpace M]` in §4.2; `[ConnectedSpace M]` in §4.3, §4.3a, §4.5; boundaryless models in §4.5, §5.1 (manifold structure), §5.3 (level sets), §5.4 (integral curves); the gluing hypotheses are missing in §4.4/§4.5 (R02). Dimension 1 checked through §1.5, §1.7, §1.8, §2.6, §5.1–§5.2 (vacuous or true as the Conventions claim).

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, six roadmaps), How to read the build, five layers with 31 numbered subsections each carrying a `*Needs:*` line, 18 `**Checks.**` blocks (every definition has at least three discriminating Checks; §1.9, §2.5, §4.4 have two to six), `### Examples` and `### Dependencies` in every layer, Downstream consumers, Worked examples, References. Unicode mathematics, no LaTeX delimiters, no pull-request numbers, dates, paths or process words (the word "lemma" occurs only in the mathematical name "division lemma"). Every cited work is in `sources.toml` with `cited_for` matching the sections.

**Headline theorems for the package stage** (from the Summary): timecone theorem, hyperplane classification, chart independence, Levi-Civita existence and uniqueness for differentiable nondegenerate metrics, `C^{1,1}` geodesic uniqueness, two-orientation theorem, time-oriented extension theorem, null-hypersurface equivalences, `∇_L L = κL`, characteristic iff null. All ten are statable at the pins with the simple definitions the README lists (predicates on `LinearMap.BilinForm ℝ V` and `sigNeg`; a continuous `ContMDiffSection` at order `0`; the local Hölder predicate; `IsLeviCivitaFor` on `CovariantDerivative`; the quotient `TimeOrientation`; `IsExtension` through `IsSmoothEmbedding`; `IsHypersurface` through `mtangentConeAt`); the time-oriented extension theorem is statable without constructing the cover. Padding: not applicable (no Lean file).

## Not verifiable

- `oneill1983` Ch. 2, 3, 5; `beemehrlicheasley1996` Ch. 3; `hawkingellis1973` §2.6, §6.1, Ch. 2; `wald1984` §8.1; `kupeli1987`; `christodoulou2007` Ch. 1–2: settled as uncertified, cited by locator only; every statement citing them also cites a readable source except the textbook references of §3.1–§3.4, which are standard and were checked by computation instead.
- `sbierski2018` line 119: the extraction garbles the exponent and the fraction of the scalar-curvature formula, so whether the printed text has `e^{2√t}` or `e^{−2√t}` could not be read; the README's `−½ e^{−2√t} t^{−3/2}` was recomputed here (finite differences and the conformal formula agree to five digits) and is correct.
- `chrusciel2011` line 168: the extraction drops the division in (2.1.2); the README's formula was checked by `g(X,X) = −h(X,X)` and the two §2.5 Checks.
- Ownership against the board target `CompressibleEulerEquations` (a consumer named in `target.md`): not in the board-packages index, so its text was not read; it is a consumer, not a supplier.
- Elaboration: not applicable at the design stage (no `Suggested.lean`).

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "222929196767e80bf6a219d01978d5ecad2729e9", "job": "REV-DESIGN-LorentzianGeometry", "model": "fable", "worker": "chris-x10"} -->
