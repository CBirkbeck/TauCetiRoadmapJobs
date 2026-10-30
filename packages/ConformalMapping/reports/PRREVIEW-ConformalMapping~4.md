# Review of ConformalMapping (pull request #998 at aeaf7aa)

**Verdict:** accepted

No P1 or P2 finding survives this head. The three findings below are P3 notes the author may take or leave. Every blocking finding of the previous review (R01–R06 at `ea0f729`) is repaired; the details are under "Previous findings".

## R01 (P3) — The two auxiliary Lean files are unchanged and still break the Lean form rules

**Location.** `TauCetiRoadmap/ConformalMapping/CourseExamples.lean:1–2` ("import TauCeti.Analysis.Complex.Conformal.SchwarzPick.Derivative", "import Mathlib.Tactic") and `TauCetiRoadmap/ConformalMapping/UnivalentLimitsSuggested.lean:1,15–22` ("univalent_limit_dichotomy … := TauCeti.hurwitz_injOn hΩ hconn hF hconv hinj").

**Claim.** These files are acceptance-test material satisfying the Lean form rules.

**Witness.** Neither file has the single line `import Mathlib`; one imports `Mathlib.Tactic`. `univalent_limit_dichotomy` is the pinned `TauCeti.hurwitz_injOn` verbatim (`TauCeti/Analysis/Complex/Conformal/Hurwitz.lean:283`); its companion only adds "two distinct values exclude a constant". The other file computes `(1 − 9/16)/(1 − 1/4) = 7/12` and `2/3 > 7/12`, which are the §2.1 Example and Checks. None of the four names appears in the README.

**Repair.** Delete both files. The mathematics stays where it already is: §1.2's Checks and §2.1's Example. This is the unrepaired previous R07; the gate checks only `Suggested.lean`, so it does not catch it.

## R02 (P3) — §§6.5–6.6 still have no claim-level locator, and the folder records no source manifest

**Location.** `TauCetiRoadmap/ConformalMapping/README.md:1280` ("Use the power asymptotic from the supplier contract with `S + 1 = β > 0` to obtain escape of `f` to infinity") and `README.md:1303` ("Use the logarithmic limit in the supplier contract to obtain escape at infinity").

**Claim.** Every target carries a locator.

**Witness.** §6.5 and §6.6 each derive a new claim (escape of `f` to infinity from the native asymptotic, the sign of `β − 1`, the exclusion of `β = 0` and `β = 2`) with no source named; every other section now has one. The ten works of the References list are not recorded in a `sources.toml` in the folder (the brief's manifest line reads "none recorded yet").

**Repair.** Cite driscoll-trefethen §2.1, Figure 2.1, p. 10 (lines 341–346: the interior-angle convention at a vertex at infinity, `α ∈ [−2, 0]`, matching `−β − 1` here) for both ends, and ahlfors-complex Ch. 6 §2.2, p. 238, Exercises 2–3 (lines 8911–8916: the vertex at infinity and the half strip as special cases). Record the ten works under their existing keys (`ahlfors-complex`, `ahlfors-invariants`, `thomassen`, `driscoll-trefethen`, `conway`, `pommerenke`, `burckel`, `remmert`, `besicovitch`, `paulson`) when the package manifest is next written; this review edits no manifest. This is the remaining part of the previous R08.

## R03 (P3) — The layer table still advertises Layer 3 as delivering the packaging

**Location.** `TauCetiRoadmap/ConformalMapping/README.md:28` ("| 3 | The Riemann mapping theorem | conformal and bundled packaging of the Riemann map and its inverse |").

**Claim.** Layer 3 delivers the conformal and bundled packaging.

**Witness.** The summary (lines 9–16) no longer lists the packaging among the roadmap's own targets, "Already in the library" (lines 46–48) says the homeomorphism bundle, inverse holomorphy and conformality are pinned, and §3.1 (lines 573–576) now says "Use the bundle and inverse from the Layer 3 supplier contract". The table row is the only sentence left that says the opposite.

**Repair.** Change the row to what Layer 3 now does, for example "the normalized Riemann map consumed from the pin, with its bundle, inverse and automorphism comparison as supplier contracts". No other change.

## Previous findings, checked against this head

- **Previous R01 (P1): repaired.** `README.md:1167` now reads "the prevertices `±1, ±(3 + 2√2)` give a square", with the Jacobi form, the condition `2K(k) = K(√(1 − k²))`, the Möbius map `T(x) = (Lx − d)/(x + d)` and the old tuple as a negative control; `README.md:1345` is corrected too. Recomputed with `K(k) = π/(2·AGM(1, √(1 − k²)))`: at `k = 3 − 2√2`, `2K(k) = 3.16510345444743 = K(k′)`, ratio `1`; at `k = 1/√2`, lengths `3.70814935460274` and `1.85407467730137`, ratio `2`. `T(−1) = −L`, `T(0) = −1`, `T(1) = 1`, `T(∞) = L`, determinant `d(L + 1) = 16.4853 > 0`.
- **Previous R02 (P1): repaired.** `README.md:1316–1331` compares two bijections through `g⁻¹ ∘ f`, the Cayley conjugation and `TauCeti.exists_forall_unitDisc_eq_unitDiscStandardAutomorphismEquiv`, derives the stabilizer of infinity from the escape, and says "its inputs are the inverse and classification contracts, not the bounded prevertex theorem". The bounded-only `TauCeti.exists_prevertex_cayley_automorphism` is no longer in §6.7's Needs line (it remains, correctly, in §6.2's bounded contract).
- **Previous R03 (P2): repaired.** `README.md:1011–1012` now reads "Let `a < b` … For an open `U` with `filledHull C ⊆ U`, finite `S` avoiding `C`"; the annulus witness and the `a = b` witness are recorded as Checks at lines 1035–1039.
- **Previous R04 (P2): repaired.** `README.md:1247–1251` now says "prove that there exist such prevertices and constants … Arbitrary circle data specify a derivative but do not prescribe the image polygon", and the Check at line 1264 keeps `±1, ±√2` as the ratio-`2` control.
- **Previous R05 (P2): repaired.** `Suggested.lean:117` defines `continuousIndex` with a real body; `continuous_jordan_index` (line 127), `continuous_boundary_argument_principle` (line 140) and `compact_holomorphic_family` (line 41) are stated; the docstring (lines 24–29) says all listed headlines are statable.
- **Previous R06 (P2): repaired.** "Prove the packaging" is gone from §3.1 (line 573: "Use the bundle and inverse from the Layer 3 supplier contract"), "postcomposing" is the stated direction (line 575), and §§6.5–6.6 consume the native limits ("Use the power asymptotic from the supplier contract", line 1280; "Use the logarithmic limit", line 1303). The supplier contract (lines 218–225, 337–349) names all six providers. The stale table row is R03 above.
- **Previous R07 (P3): not repaired.** Both auxiliary files are byte-identical to the previous head (R01 above).
- **Previous R08 (P3): mostly repaired.** §4.1 cites "Ch. 6 §1.4, Theorem 4 and its preceding construction, pp. 234–235" (line 618), §4.2 separates Theorem 24 pp. 172–173 from Theorem 4 p. 235 (lines 651–653), Besicovitch reads "pp. 1–9" with the full title and DOI (lines 1378–1380), §5.3 cites Thomassen Theorem 2.12 p. 122, §6.3 cites Driscoll–Trefethen Theorem 2.1 p. 10 (2.2), and §§5.5–5.7, 5.9–5.10, 6.1, 6.4 carry Ahlfors or Driscoll–Trefethen locators that I verified below. §§6.5–6.6 and the manifest are R02.
- **Previous R09 (P3): repaired.** Lines 465–467 ("is `0` at `z = 0` for every `n`, is pointwise unbounded at each `z ≠ 0`"), 427–429 ("has no continuous extension at `1`, though it is analytic near every other boundary point") and 496–499 (`z + z²/(4(n + 1))`, derivative `1` at every index) are the suggested replacements; each is recomputed in the table.

No repair report marks any finding "not actionable in this package"; none of the findings above invokes that exception.

## Verified sound

This is a full review of the 1,394-line README, the eleven declarations of `Suggested.lean` and the four declarations of the two auxiliary files. The folder on main is the 210-line narrative form of the same seven-layer roadmap (`TauCetiRoadmap/ConformalMapping/README.md` on main, layers L0–L6, with L5 at main lines 125–127 already claiming the two-component theorem for a planar Jordan curve); this head rewrites that roadmap in TauCetiRoadmap form and adds the connecting targets. It is a revision of the existing roadmap in its own folder, not a second plan of the same objects, and the three main roadmaps that consume it (DifferentialGeometry, GeometricMeasureTheory, Isoperimetry) cite "ConformalMapping, L5" as the owner of Jordan separation, as this head does. No route-specific shortcut, re-planned roadmap, copied passage, computational algorithm, sorry'd data, `set_option`, process word or pull-request number was found in the four reviewed files (a scan for "so far, to be checked, current, removed, checkpoint, handoff, packet, round, optional, deferred, for later, TODO, #NNN" returned nothing).

**Gate and worktree.** HEAD is `aeaf7aae55e3ad9894e4f65558f34dc4f06514ab`; `git status --short` is empty; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ConformalMapping'` is empty. The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, both confirmed by `git rev-parse` in the package checkouts. The worker's gate at this head:

```text
gate ConformalMapping: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

I reran the prescribed dependency command with `--movable`:

```text
depcheck: 208 roadmaps, 1461 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. ConformalMapping is a roadmap on main (not in the merge order, as expected for a merged roadmap); its only roadmap supplier is the completed ContourIntegration (Layers 0–3 at `Completed/ContourIntegration/README.md:120–184`), and every other named roadmap (DifferentialGeometry 5.6.1, GeometricMeasureTheory G1–G2 and G6, Isoperimetry I6, GlobalHolomorphicFunctions GH0 and GH4, ModularForms, ConformalMappingPartII, HeegaardFloer, PDE) is named only as a consumer or as the owner of a deferred topic. I read every `*Needs:*` line (26 targets): each cites Mathlib, Tau Ceti, an earlier section of this roadmap, or ContourIntegration. No declared gaps exist.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/ConformalMapping/Suggested.lean` from the worktree exits 0 with exactly ten `declaration uses sorry` warnings (lines 41, 57, 69, 87, 100, 127, 140, 158, 175, 196) and nothing else. A scratch file importing the module and containing `#check @name` for all eleven declarations elaborated; every binder of the README statements is in the elaborated type: `a < b` and the interval, continuity, injectivity, variation, openness, `ProperSpace E`, the Jordan-domain and Jordan-curve hypotheses, the filter `cobounded ℂ ⊓ 𝓟 {z | 0 ≤ z.im}`, the nonimage condition `v k ∉ f '' {z | 0 ≤ z.im}`, the side and corner models, and the index-1 orientation hypothesis. No section variable was dropped (the file uses none). The imports are `import Mathlib` plus five `TauCeti.*` modules, each used and each present at the pin.

**Padding probe.** On a scratch copy, each of the ten admitted theorems was tried with `first | simp | rfl | infer_instance`: none closed (ten "unsolved goals" or "type class instance expected" errors). A second scratch copy importing only the libraries, with `continuousIndex` copied in, tried `exact?` on each: none closed ("could not close the goal" ten times). A first `exact?` run that imported the module itself found only the theorems themselves, which is not a library provider. The nearest native providers differ as before: `exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier` (`Jordan/Approach.lean:213`) chooses its map while `chosen_map_closed_disc_homeomorphism` keeps a given one; the pinned separation results need a locally straight piece; the all-finite necessity theorem (`PolygonalDomain.lean:496`) keeps every vertex factor while the source-infinity statement omits one. `continuousIndex` is a six-line real body on native functions; it is the only definition and it exists only to make two headlines statable. No `example`, no `#eval`, no `True` placeholder, no `lemma`.

**Pinned declarations opened.** Paths are relative to the Mathlib and Tau Ceti checkouts at the pins. A script resolved all 198 backticked library names of the README (declaration names and module paths); the namespaced ones were confirmed by hand. The statements that the README paraphrases were read at:

| Pinned file and line | What was checked |
|---|---|
| `TauCeti/Analysis/Complex/Conformal/Hyperbolic/Distance.lean:68` and `PseudoHyperbolic.lean:48` | `hyperbolicDist z w = Real.artanh ‖(z − w)/(1 − conj w · z)‖`, as the Conventions say; no factor two. |
| `Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean:42,58` | `dist z w = 2 * arsinh (dist z w / (2 * √(z.im * w.im)))` and `tanh_half_dist`, as the Conventions and §2.1 say. |
| `TauCeti/Analysis/Complex/Conformal/UnitDisc/Automorphism/Classification.lean:89` | the classification takes `f, g` holomorphic self-maps of the disc, mutually inverse on it, and returns a standard automorphism: exactly what §6.7's route feeds it after Cayley conjugation. |
| `TauCeti/Analysis/Complex/Conformal/Inverse/Function.lean:44` | `DifferentiableOn.invFunOn`: inverse holomorphy for a holomorphic injection on an open set, no boundedness. |
| `TauCeti/Analysis/Complex/Conformal/Biholomorph.lean:122,134,142,150,158,175` | the bundle, both coercions, inverse holomorphy and both conformality theorems named in the Layer 3 contract. |
| `TauCeti/Analysis/Complex/Conformal/SchwarzChristoffel/PolygonalDomain.lean:496` | all-finite necessity: the same `hside`, `hcorner`, limit and nonimage hypotheses as the source-infinity statement, with every vertex factor present; the private `_of_tendsto` form at line 423 takes the limit `L` of `z·logDeriv (deriv f)`. |
| `SchwarzChristoffel/Primitive.lean:75`, `Integrand.lean:71` | `schwarzChristoffelPrimitive a e z₀ z` is the wedge integral from `z₀ : UpperHalfPlane` of `∏ (z − a i)^(e i)`. |
| `SchwarzChristoffel/PrevertexUniqueness.lean:74` | `exists_prevertex_cayley_automorphism` still begins `(hUb : IsBounded U) (hUJ : IsJordanCurve (frontier U))`: bounded-only, hence correctly confined to §6.2. |
| `SchwarzChristoffel/Infinity/Basic.lean:376` | `tendsto_schwarzChristoffelPrimitive_atInfinity` needs `∑ e i < −1`, as §6.3's bullet says. |
| `SchwarzChristoffel/Disc/Basic.lean:174,336` | `schwarzChristoffelDiscPrimitive_option_zero` (an exponent-`0` prevertex changes nothing) and the `with_infty` transport with exponent `−∑ e i − 2` at `1`, as §6.4 says. |
| `SchwarzChristoffel/JordanPolygon.lean:134` | `exponent_sum_eq_neg_two_of_isJordanCurve_frontier`: `∑ e i = −2` from the local models. |
| `TauCeti/Analysis/Complex/Conformal/Jordan/Domain.lean:118,158,226,270` | `IsJordanDomain` (open, connected hence nonempty, bounded, Jordan frontier); the locally-straight domain theorem; `IsJordanDomain.isSimplyConnected`; the converse `isJordanDomain_of_isJordanCurve_frontier_image` with exactly the hypotheses §5.2 lists. |
| `TauCeti/Analysis/Complex/Conformal/Jordan/Approach.lean:185,213` | `IsJordanDomain.injOn_closedBall_of_conformal` (hypotheses: `0 < r`, holomorphic injective on the ball, continuous extension equal on the ball, image a Jordan domain) and the existential Carathéodory theorem. |
| `TauCeti/Analysis/Complex/Conformal/Jordan/UpperHalfPlane.lean:49,80` | the half-plane form with `p ∈ frontier Ω` sent to infinity, and the finite prevertex theorem with `p ∉ f '' {Im z ≥ 0}`. |
| `TauCeti/Analysis/Complex/Conformal/Reflection/Arc.lean:208` | charted reflection: holomorphic charts, conjugation-invariant targets, closed-side continuity, open-side holomorphy, `(d (f z)).im = 0` on the arc. |
| `TauCeti/Analysis/Complex/Conformal/Removability/Arc.lean:55` and `Removability/Circle.lean:167` | charted real-locus removability and circle removability (`0 < r`, open `Ω`). |
| `TauCeti/Analysis/Complex/Conformal/RiemannMapping/Normalization.lean:242` | `eqOn_id_of_isNormalizedRiemannMapOn_ball`, the §3.1 Check. |
| `TauCeti/Topology/JordanCurve/Basic.lean:108`, `TauCeti/Topology/FilledHull.lean:83` | `IsJordanCurve C := Nonempty (C ≃ₜ Circle)`; `filledHull K := {x | IsBounded (connectedComponentIn Kᶜ x)}` (so `K ⊆ filledHull K`). |
| `TauCeti/Analysis/Complex/PlaneSeparation/Basic.lean:262`, `JordanCurve.lean:130`, `LocalSeparation.lean:427,439` | Janiszewski; the frontier of a component once two points separate; the locally straight nonemptiness and frontier theorems. |
| `TauCeti/Analysis/Normed/Module/FilledHull.lean:231` | `connectedComponentIn_compl_eq_of_unbounded_component` needs `1 < Module.rank ℝ E`, bounded `K`. |
| `TauCeti/AlgebraicTopology/Singular/JordanBrouwer.lean:212` | `Nat.card (ZerothHomotopy (range h)ᶜ) = 2` for a continuous injection of spheres in adjacent dimensions. |
| `TauCeti/Analysis/Contour/Winding/Number/Basic.lean:76`, `Winding/Integer.lean:55`, `Winding/Proximity.lean:225`, `Winding/Number/Circle.lean:194` | `windingNumber γ a b z₀ : ℂ`; integrality for closed curves; the dog-on-a-leash theorem with its countable exceptional set and integrable derivatives; `windingNumber (circleMap c R) 0 (2π) w = 1` for `dist w c < R`. |
| `TauCeti/Analysis/Contour/Curve/Approximation.lean:69` | smooth approximation of `f : C(I, ℂ)` with the same endpoints. |
| `TauCeti/Analysis/Contour/PiecewiseC1On.lean:220` | `IsPiecewiseC1On.exists_countable_differentiableAt`. |
| `TauCeti/Geometry/Polygon/Simple.lean:93,136,288,332,346` | `IsSimple` structure, `three_le` under `[NeZero n]`, injective boundary parametrization, Jordan boundary, local edge neighbourhoods. |
| `Mathlib/Topology/Covering/AddCircle.lean:32`, `Mathlib/Analysis/SpecialFunctions/Complex/Circle.lean:421`, `Mathlib/Topology/Homotopy/Lifting.lean:256,262` | `isCoveringMap_coe`, `homeomorphCircle'`, `liftPath`, `eq_liftPath_iff`. |
| `Mathlib/Analysis/Analytic/Order.lean:48,62` | `analyticOrderAt` is `⊤` for a locally zero germ and `0` where `f` is not analytic; `analyticOrderNatAt` is its `toNat`. In `continuous_boundary_argument_principle` the function `f − w` is analytic at every point of the open `Ω` and not locally zero (it is nonzero on the nonempty frontier by `hw` and continuity), so the finite sum is the honest zero count. |
| `Mathlib/Analysis/Complex/HasPrimitives.lean:275`, `OpenMapping.lean:175`, `Topology/UniformSpace/CompactConvergence.lean:254` | Morera on a disc, the open mapping theorem, compact-open convergence equals locally uniform convergence. |

**Ownership and supply.** `roadmaps grep` by object: no other roadmap on main or in an open pull request with a supplied checkout defines an integer index of a continuous loop, a Darboux boundary-injectivity theorem, rectifiable-arc removability, or the Cayley comparison of `UpperHalfPlane.dist` with `hyperbolicDist`. Main's ConformalMapping L5 (main `README.md:125–127,141`) already claims the two-component theorem and filled-hull topology; DifferentialGeometry (`README.md:762`), GeometricMeasureTheory (`README.md:63`) and Isoperimetry (`README.md:66`) on main cite "ConformalMapping, L5" as the owner. GlobalHolomorphicFunctions at its open head (`README.md:142–145,1581,1636`) consumes L5 for Jordan separation and has no reverse edge into this roadmap; its line 817 says ConformalMapping L1 consumes its function-space topology, which this head's §1.1 does not (it uses Mathlib's compact-open topology and `TauCeti.isCompact_closure_range_iff_isLocallyBoundedOn`), so there is no supply from GH here. ConformalMappingPartII at its open head (`README.md:7,65,93`) reuses L1–L4 and keeps boundary correspondence and Schwarz–Christoffel here; its Cayley direction `C : 𝔻 → ℍ` with `C(0) = i` is the inverse of this roadmap's `c`, and `c(i) = 0`. `Completed/UniversalCovers/README.md:4,56` owns covers and deck groups, not the planar index. ContourIntegration Layers 0–3 are exactly the piecewise-`C¹` curve, cycle and winding-number calculus this roadmap consumes.

**Headline coverage.** The README names four end theorems (Jordan curve theorem, Jordan index theorem, Darboux boundary injectivity, source-infinity Schwarz–Christoffel) and lists its own targets in the summary. Stated in `Suggested.lean`: the four end theorems (`jordan_separation`, `continuous_jordan_index` with its piecewise-`C¹` case, `darboux_boundary_injectivity`, `eqOn_const_mul_schwarzChristoffelPrimitive_add_of_source_infinity_at_vertex`), the continuous-boundary argument principle, the compactness criterion, the Cayley comparison, rectifiable removability and the chosen-map closed-disc homeomorphism. The remaining own targets (§1.2 closedness, §§4.1–4.2 charts and reflection, §5.9, §5.10, §6.1, §6.7) are adapters or corollaries of stated headlines and are README targets; the docstring's claim that nothing statable is omitted is accurate for the end theorems. Every Lean name appears in the README at its section, and no backticked name of the roadmap's own in the README is undeclared (gate `readme-ids-missing=0`, confirmed by reading).

**Adversarial computations (78 rows).** `D` is the unit disc, `H` the upper half-plane, `C` a trace, `S` an exponent sum. "Retain" means the instance supports the statement as written. The rows cover all 26 sections, the eleven declarations, the fifteen seeded targets and every passage a finding touches.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: hyperbolic normalization | `z = i, w = 2i` | `dist_H = 2·arsinh(1/(2√2)) = 0.693147 = log 2`; `c(i) = 0`, `c(2i) = 1/3`, `artanh(1/3) = 0.346574 = (log 2)/2` | factor 2 exact | Retain |
| Conventions: winding orientation | CCW circle about `0`, about `3`; reversal | lift increments `2π, 0, −2π`; indices `1, 0, −1` | Agrees with `windingNumber_circleMap_eq_one_of_dist_lt` | Retain |
| Conventions: SC exponent | right angle, reflex angle | `α = π/2 → e = −1/2`; `α = 3π/2 → e = 1/2`; opening `(e + 1)π` returns `α` | Correct | Retain |
| §0.1 cycle argument principle | `z`, `z²`, `1/z` on CCW circle | integrals `2πi, 4πi, −2πi`; `2πi·(1, 2, −1)` | Equal | Retain |
| §0.1 linearity and reversal | twice the circle; reversed circle; circle about `3` | `4πi`; `−2πi`; `0` | Equal | Retain |
| §0.1 image winding | `(z − 1/2)(z + 1/2)` | two simple zeros inside; `f ∘ γ` index `2`; integral `4πi` | Equal | Retain |
| §0.2 finiteness | `z² − 1/4` on `D`; `f = 0` | zero set `{±1/2}`, boundary values nonzero; `f = 0` fails nonvanishing | Guards discriminate | Retain |
| §0.2 multiplicity transport | `f = z²`, `φ = 2z`; `f = z`, `φ = z²` | orders `2 = 2`; `2 ≠ 1` with `φ′(0) = 0` | Injectivity needed and present | Retain |
| §0.2 Check `sin(1/(1 − z))` | `zₙ = 1 − 1/(nπ)`, `xₙ = 1 − 1/(π/2 + 2nπ)` | values `0` and `1`, both sequences `→ 1`; at `−1` the value is `sin(1/2)` with an analytic extension | Repaired Check correct | Retain |
| §1.1 `compact_holomorphic_family` → | constants with values in `[0, 1]` | closed (continuous image of `[0,1]`), bound `1` on every compact; compact | Both conjuncts hold | Retain |
| §1.1 ← fails without closedness | constants in `(0, 1)` | bound `1`; limit `0 ∉ S`; not compact | Closedness needed | Retain |
| §1.1 ← fails without bound | `F n z = nz` | `F n 0 = 0`; on `|z| ≤ 1/2` sup `= n/2 → ∞`; no convergent subsequence | Local bound needed; repaired Check correct | Retain |
| §1.1 degenerate | `Ω = ⊥`; `S = ∅` | `C(∅, E)` a singleton, every `S` compact and closed; empty `S` compact, bound `M = 0` vacuous | Both sides true | Retain |
| §1.1 Hausdorffness for → | `E` a normed space | `C(Ω, E)` is T2, so compact implies closed | Needed and available | Retain |
| §1.2 dichotomy | `z/(n + 1)` on `D` | each injective (derivative `1/(n+1) ≠ 0`); limit `0` constant | Constant branch occurs | Retain |
| §1.2 normalized family Check | `z + z²/(4(n + 1))`, `n = 0` | value `0`, derivative `1`; quotient modulus `≥ 1 − 1/2 = 1/2`; `F₀(1/8) = 0.12890625 = 1/8 + 1/256` | Repaired Check correct at every index | Retain |
| §1.2 two-value closedness | limits with `g(0) = 0`, `g(1/8) = 1/8` | a constant would need `0 = 1/8` | Route valid | Retain |
| §1.2 disconnected control | two discs, `z/(n+1)` and `z` | limit constant on one disc, injective on the other | Preconnectedness needed | Retain |
| §2.1 headline | `z = i, w = 2i`; `z = w` | `log 2 = 2·(log 2)/2`; `0 = 2·0` | Equal | Retain |
| §2.1 two-point identities | `z = i, w = 1 + i` | `|z − w| = 1`, `|z − conj w| = √5`; `c(1+i) = (1 − 2i)/5`, modulus `0.447214 = 1/√5`; `dist = 2·arsinh(1/2) = 0.962424 = 2·artanh(1/√5)` | Equal | Retain |
| §2.1 norm identities (symbolic) | general `z, w` | numerators `2i(z − w)` and `2i(conj w − z)`; common denominator `|z + i||w + i|` | Identities hold | Retain |
| §2.1 infinitesimal and geodesics | `z = i`; `z = iy` | `|c′(i)| = 1/2`, pullback `2·(1/2)/(1 − 0) = 1 = 1/Im i`; `c(iy) = (y − 1)/(y + 1) ∈ (−1, 1)` | Transport correct | Retain |
| §2.1 non-example direction | `ζ = 0` under `ζ ↦ (ζ − i)/(ζ + i)` | image `−1 ∉ D` | Direction is content | Retain |
| §2.1 Example (Schwarz–Pick) | `f(1/2) = 3/4` | bound `(7/16)/(3/4) = 7/12 = 0.583333`; `2/3 − 7/12 = 1/12`; sharp composite derivative `(4/3)(7/16) = 7/12` | Correct | Retain (R01: keep as Example, delete the Lean file) |
| §3.1 normalization on `H` | `z₀ = i` | `c′(i) = 2i/(2i)² = −i/2`; `i·(−i/2) = 1/2 > 0` | Rotation by `i` correct | Retain |
| §3.1 postcomposition | `a` a disc automorphism, `f : H → D` | `a ∘ f : H → D`; `f ∘ a` undefined on `H` (`i ∉ D`) | Repaired direction correct | Retain |
| §3.1 controls | `Ω = ℂ`; `z²` on `D` | bounded entire map constant; `z²` conformal off `0` but `z² = (−z)²` | Hypotheses discriminate | Retain |
| §3.1 slit plane | `(√z − 1)/(√z + 1)` at `1` | value `0`, derivative `1/4 > 0` | Normalized | Retain |
| §4.1 regular analytic arcs | `t`, `t + it²`, `t + it³`, cusp `t² + it³` | derivatives at `0`: `1, 1, 1, 0` | Cusp excluded | Retain |
| §4.1 circle chart | `e = −i log z`, real `r` | `Im e(r) = −log r`: positive for `r < 1`, negative for `r > 1`; zero on `|z| = 1` | Interior is the positive side; real locus exact | Retain |
| §4.1 non-analytic control | `t + i|t|³` | third derivative jumps by `12i` at `0` | No analytic chart | Retain |
| §4.2 reflection | `id`, `z²` across the axis | extensions `id`, `z²`; `(conj z)² = conj(z²)` | Equal | Retain |
| §4.2 antiholomorphic control | `conj z` | difference quotients along `1` and `i` are `1` and `−1` | Holomorphy fails | Retain |
| §4.3 headline | segment `[−1, 1]`, `F = z` | length `2`; holomorphic on `V` | Consistent | Retain |
| §4.3 grid estimate | `L = 2`, mesh `δ`, `ω(t) = t` | squares met `O(1 + 2/δ)`, each error `≤ 4δ·√2δ`; total `O((2 + δ)√2 δ) → 0` | Mechanism correct | Retain |
| §4.3 controls | `1/(z − 1/2)`; `|z|²`; Koch arc | no continuous extension at `1/2`; Wirtinger derivative `z ≠ 0`; variation `∞` | Hypotheses fail as stated | Retain |
| §4.3 unused injectivity | the circle traversed twice on `[0, 4π]` | image has finite length, theorem true, `InjOn` fails | Hypothesis unused but matches the README's "Jordan arc" | Retain (note only) |
| §5.1 headline | `f = id`; `f = 2z` on `D` | extensions `id`, `2z`; boundary radii `1`, `2`; inverses `id`, `w/2` | Chosen map preserved | Retain |
| §5.1 controls | `r = 0`; slit disc | `ball c 0 = ∅`; slit point has two boundary preimages | Guards needed | Retain |
| §5.2 converse and half-plane form | `id`; `z²`; `p = 1`; `p = −1` | `z²(1) = z²(−1)` fails injectivity; `c(z) → 1`; `−c(z) = (i − z)/(z + i) → −1` | Correct | Retain |
| §5.3 `jordan_separation` | unit circle | components `D`, `{|z| > 1}`; bounded flags `true, false`; `filledHull = closed disc`, `filledHull \ C = D`; both frontiers the circle; every `z ∉ C` in one | All conjuncts | Retain |
| §5.3 generality and controls | square, Koch snowflake; segment; figure eight | no regularity field; complement counts `1` and `3` | Hypothesis necessary, regularity absent | Retain |
| §5.4 `continuousIndex` | CCW circle, lifts `2πt`, `2πt + 4π` | increments `2π` both; `n = 1` unique, `h.choose = 1` | Lift-independent | Retain |
| §5.4 sign and multiples | `exp(−2πit)`, `exp(4πit)` | increments `−2π`, `4π`; `n = −1, 2` | Correct | Retain |
| §5.4 guards | `a = b`; `w` on trace; `a > b` | constant loop `n = 0`; guard false, value `0`; guard false, value `0` | Documented fallback | Retain |
| §5.4 API | two CCW circles concatenated; reparametrization `s/2`; reversal | `4π → 2`; `2π → 1`; `−2π → −1` | Additive, invariant, negates | Retain |
| §5.5 integral comparison | unit circle; square `±1 ± i` | `(2πi)⁻¹∮dz/z = 1`; four sides each `Log(i) = iπ/2`, sum `2πi`, quotient `1` | Equal to index `1` | Retain |
| §5.5 proximity | `δ = γ + (1/2)exp(6πit)`; `δ = 3γ` | `1/2 < 1`, indices `1, 1`; `2 > 1`, hypothesis fails though indices agree | Sufficient, not necessary | Retain |
| §5.5 `a = b` | constant piecewise-`C¹` loop | integral over `[a, a]` is `0`; index `0` | Equal | Retain |
| §5.6 `continuous_jordan_index` | CCW circle, CW circle, square `0,1,1+i,i` | `(σ, exterior) = (1, 0), (−1, 0), (1, 0)`; trace homeomorphic to `Circle` | Correct | Retain |
| §5.6 interior-circle route | `F = id`, `w = 1/2`, `r = 3/4` | one simple zero of `F − w`; circle index `1`; boundary distance `1/2` | Route avoids boundary integrals | Retain |
| §5.6 figure-eight control | `sin 2πt + i sin 4πt` | lobe indices `+1`, `−1` | One sign false without injectivity | Retain |
| §5.6 piecewise-`C¹` case | `exp(2πit)` on `[0, 1]` | `windingNumber = 1` at `0`, `0` at `3`; `σ = 1` | Equal | Retain |
| §5.7 `continuous_boundary_argument_principle` | `D`, `z²`, `w = 0`; `z² − 1/4`, `w = 0`, `w = 2` | image index `2`, order sum `2`; `2 = 2`; `0 = 0` | Equal | Retain |
| §5.7 guards | `f = 2`, `w = 0`; `f = z`, `w = 1`; `f ≡ w` | constant loop index `0`, no zeros; `1 ∈ f '' frontier`, excluded; `f ≡ w` contradicts `hw` on the nonempty frontier, so `analyticOrderAt ≠ ⊤` never enters | Correct, sum honest | Retain |
| §5.7 orientation hypothesis | `γ` and its reversal | `hpositive` holds for exactly one of them by §5.6 | Hypothesis consistent, selects the sign | Retain |
| §5.8 `darboux_boundary_injectivity` | `id`; `z + z²/4`; `z²` on `[0,1]²` | `|f z − f z′| ≥ |z − z′|/2` on the closed disc; `z² = w²` in the closed quadrant forces `z = w` | Bijection onto the inside | Retain |
| §5.8 controls | `z²` on `D`; `conj z` on `D` | `f(1) = f(−1)`, `f(1/2) = f(−1/2)`; boundary degree `−1` | Frontier injectivity and holomorphy both needed | Retain |
| §5.9 Jordan-contour principle | `U = ℂ`, `f = 1/z`, `S = {0}`; annulus `1/2 < |z| < 2`, `S = ∅` | both sides `−2πi`; integral `−2πi` versus sum `0`, excluded by `0 ∉ U` | Repaired guard works | Retain |
| §5.9 `a = b` | constant curve | `Ico a a = ∅`, injective; trace a point, not Jordan | Excluded by `a < b` | Retain |
| §5.9 examples | CCW/CW circle with `z`; square with `(z − 1/2)/(z + 3)` | `2πi, −2πi`; `2πi` (zero inside, pole outside) | Equal | Retain |
| §5.10 extension | `D`, `id`, circle arc; upper half-disc with diameter | charted map `id`; target chart `id`, exterior goes to `Im < 0` | Side selection works | Retain |
| §5.10 corner control | `z^{3/2}` at a vertex | non-integer exponent, no holomorphic extension | Analytic-arc hypothesis essential | Retain |
| §6.1 square orientation and turns | `0, 1, 1+i, i`; reversed order | `d₀ = 1`, `m₀ = 1/2`, `1/2 + iε ∈ U` so `σ = 1`; `τ = π/2`, `e = −1/2`, `Σe = −2`, `Στ = 2π`; reversed: `σ = −1`, `τ = −π/2`, `e = −1/2` | Sign factor correct | Retain |
| §6.1 L-hexagon | `0, 2, 2+i, 1+i, 1+2i, 2i` | turns `/π = (1/2, 1/2, 1/2, −1/2, 1/2, 1/2)`, sum `2`; exponents five `−1/2`, one `+1/2` at `1 + i`, sum `−2`; opening `3π/2` | Correct | Retain |
| §6.1 straight marked vertex | `0, 1, 2, 1 + i` | turns `/π = (3/4, 0, 3/4, 1/2)`; exponents `−3/4, 0, −3/4, −1/2`, sum `−2` | Correct | Retain |
| §6.1 bow-tie | `0, 1+i, 1, i` | edges `0→1+i` and `1→i` cross at `(1+i)/2` | Not simple | Retain |
| §6.2 square prevertices | `±1, ±(3 + 2√2)`, `k = 3 − 2√2 = 0.171573` | `2K(k) = 3.16510345444743`, `K(k′) = 3.16510345444743`, ratio `1.0000000` | Repaired Check correct | Retain |
| §6.2 negative control | `±1, ±√2`, `k = 1/√2` | `3.70814935460274`, `1.85407467730137`, ratio `2`; `K(k) = K(k′)` indeed | Control correct | Retain |
| §6.2 Möbius `T` | `L = 3 + 2√2`, `d = 1 + √2` | `T(−1) = −5.828427 = −L`, `T(0) = −1`, `T(1) = 1`, `T(∞) = L`; determinant `d(L + 1) = 16.4853 > 0` | Carries `−1, 0, 1, ∞` to `−L, −1, 1, L` | Retain |
| §6.2 PSL versus PGL | `−1/z`; `−z` at `i` | `i`; `−i ∉ H` | Positive determinant needed | Retain |
| §6.3 headline sums | square, `e_k = −1/2`; triangle, `e_k = −2/3` | restricted sums `−3/2 = −2 − (−1/2)`, `−4/3 = −2 − (−2/3)`; tails `O(z^{−1/2})`, `O(z^{−1/3})` | Equal | Retain |
| §6.3 square Check | `T(z) = (z − 1)/(z + 1)` | `−1 → ∞ → 1 → 0 → −1`; pullback of `dz/√(z(z² − 1))` is `du/√(u(1 − u²)) = ±i·du/√(u(u² − 1))`, unimodular; `−1/z` only swaps opposite sides | Square, and the remark about `−1/z` correct | Retain |
| §6.3 Möbius repair | `ψ(w) = b − c/(w − r)`, `c > 0` | `Im ψ(w) = c·Im w/|w − r|² > 0`; determinant `c > 0`; `ψ(∞) = b`, `ψ(r) = ∞`; `g '' {Im ≥ 0} = f '' ({Im ≥ 0} \ {b}) ∪ {v_k}` omits `f(b)` | Route consistent | Retain |
| §6.3 degenerate `n` | `n = 0`; `n = 1`; `n = 2` | `Fin 0` empty, vacuous; a bounded open set with one vertex and otherwise straight frontier or with frontier in a segment does not exist, hypotheses unsatisfiable | Vacuous, not false | Retain |
| §6.4 disc derivative | `w = iᵏ` | `∏(1 − ζ/iᵏ) = 1 − ζ⁴`; value `1` at `0`; `Re(1 − ζ/w) ≥ 1 − |ζ| > 0` | Principal power fixed | Retain |
| §6.4 image claim | Cayley images of `±1, ±(3 + 2√2)` and of `±1, ±√2` | ratios `1` and `2` with equal exponents | Existence quantified over solved prevertices (repaired) | Retain |
| §6.5 sector end | quadrant `β = 1/2`; `H` itself `β = 1`; `β = 0`, `β = 2` | `S = −1/2 = β − 1`, map `√z`; `S = 0`, affine; `S + 1 = 0` and opening `2π` excluded | Correct | Retain |
| §6.6 half-strip | `{Re > 0, 0 < Im < π}` | vertices `0, iπ`, exponents `−1/2`, `S = −1`; `cosh` maps the strip onto `H` (`Im cosh(x + iy) = sinh x sin y > 0`) | Inverse of `cosh` correct | Retain |
| §6.7 stabilizer | quadrant, base point `i`; half-strip, prevertices `−1, 1`; `z ↦ −1/z` | `αi = i` gives `α = 1`; `−α + β = −1`, `α + β = 1` give `α = 1`, `β = 0`; `−1/z` sends `∞ ↦ 0` so `f` would tend to `g(0)`, finite | Correct | Retain |
| Lean `jordan_index_of_isPiecewiseC1On` | CCW circle | `IsJordanCurve`, `σ = 1`, exterior `0` | Correct | Retain |
| Lean `eqOn_…_source_infinity_at_vertex` constants | `F_k(z₀) = 0` | `f(z₀) = A·0 + B`, so `B = f(z₀)` and `A = f′(z₀)/F_k′(z₀)` | Constants match the pin's form | Retain |

**Seeded source sample (15 of 15 assessed).** The README flags no locator as unverified. Sources were fetched through the service; the four readable ones are institutional or publisher-authorized copies. Lines refer to the service's line-numbered text; printed pages were read from the page headers in the text.

| Seeded target | Source text and location | Outcome |
|---|---|---|
| 0.1 argument principle for a cycle | conway V.3.4: uncertified (paywalled). ahlfors-complex lines 5871–5879, Theorem 18, printed pp. 152–153, states the cycle form for cycles homologous to zero | Supports the cycle statement; the integral form and the image-winding reading (`n(Γ, 0)`) are at lines 5880–5882 |
| 0.2 multiplicity bookkeeping | conway IV.7.6: uncertified | Native `deriv_ne_zero_of_injOn` and `analyticOrderNatAt` supply the two facts; computed above |
| 1.1 compactness criterion | conway VII.2.9, remmert Ch. 7: uncertified | Native `isCompact_closure_range_iff_isLocallyBoundedOn` (`Montel/Precompact.lean`) plus closedness gives the statement; both directions instantiated above |
| 4.1 straightening charts | ahlfors-complex lines 8755–8768, Ch. 6 §1.4, printed p. 234 | Real-analytic complexification, regularity `φ′ ≠ 0`, simplicity, and the symmetric region; the exact real-locus and side clauses are the roadmap's own adapter, as it says |
| 4.2 reflection across analytic arcs | ahlfors-complex lines 6588–6595, Theorem 24, pp. 172–173; lines 8769–8787, Theorem 4, pp. 234–235 | Real-axis reflection and the free one-sided analytic arc are where the README now points; the charted pinned theorem matches |
| 4.3 rectifiable removability | besicovitch: no legal copy | Pagination 1–9 and DOI consistent with the publisher record noted by the previous review; the Morera grid estimate recomputed above |
| 5.1 chosen-map homeomorphism | pommerenke Thm 2.6: uncertified | Native providers at `Caratheodory.lean`, `Jordan/Approach.lean:185`, `BoundaryCorrespondence.lean` supply the route exactly as §5.1 lists it |
| 5.4 continuous index | burckel Ch. IV: uncertified; native `Argument/Lift.lean` lift read by the previous review | Definition matches the lift; integrality and lift-independence are owned targets |
| 5.5 integral comparison | ahlfors-complex lines 4470–4530, Ch. 4 §2.1, Lemma 1, printed pp. 114–116 | Lemma 1 (`∮dz/(z − a)` is a multiple of `2πi`), the index definition, reversal, local constancy and vanishing far away are all there |
| 5.8 Darboux | burckel Ch. IX: uncertified | Route through §§5.6–5.7 instantiated above |
| 5.9 Jordan-contour argument principle | ahlfors-complex lines 5871–5879, Theorem 18, pp. 152–153, combined with §5.6 | Theorem 18 is for cycles homologous to zero; the README derives null homology from the vanishing exterior index, as stated |
| 5.10 analytic boundary extension | ahlfors-complex lines 8769–8787, Theorem 4, p. 235 | Source assumes a free one-sided arc; the README owns one-sidedness and the inverse, as it says |
| 6.1 polygon data | driscoll-trefethen lines 309–332, §2.1, pp. 9–10 | Counterclockwise convention, interior angles `α ∈ (0, 2]`, total turn `Σ(1 − α) = 2` (2.1) |
| 6.4 disc formula | ahlfors-complex lines 8826–8907, Ch. 6 §2.2, pp. 236–238, formulas (3) and (5); driscoll-trefethen lines 108–131, §1.1, pp. 3–4 | Disc formula (3), accessory parameters, half-plane form (5); "the prevertices influence the side lengths" is Figure 1.3 |
| 6.7 source normalization | ahlfors-complex lines 3488–3495, Ch. 3 §3.4, pp. 83–84 | A real linear transformation preserves the upper half-plane exactly when `ad − bc > 0`: the positive-determinant claim the README attaches to this locator |

Also checked: ahlfors-invariants lines 270–326, Ch. 1 §1-1, pp. 1–3 (`ds = 2|dz|/(1 − |z|²)` on the disc, `|dz|/y` on the half-plane, geodesics orthogonal to the boundary), supporting §2.1; thomassen lines 291–304, Theorem 2.12, printed p. 122 (two regions, each with boundary `C`, no regularity); driscoll-trefethen lines 352–360, Theorem 2.1, p. 10, (2.2) (the product omits the factor of the vertex at `f(∞) = w_n`); ahlfors-complex lines 8958–8972, Ch. 6 §2.3, pp. 238–240 (vertices `±1, ±1/k`, horizontal side `2K`, vertical side `K′`), supporting the §6.2 Check's Jacobi form.

## Not verifiable

- **conway, pommerenke, burckel, remmert:** the service classifies the Springer and Birkhäuser citations as uncertified (paywalled). Locators V.3.4, IV.7.6, VII.2.6, VII.2.9, VII.4.2, IX.1.1, Thm 2.6, Ch. IV, Ch. IX and Ch. 7 are cited by locator alone. The mathematics at each was checked against the pinned declarations and the computations above, not against the books.
- **besicovitch:** no legal copy was found by the service (DOI and publisher page); the finite-length removability statement and its proof were not read. The `needs-references.toml` in scratch records the attempt.
- **paulson:** the Isabelle library page returned no legal text through the service; the previous review read the institutional distribution and confirmed the theorem's existence. Cited only for formalizability.
- **driscoll-trefethen:** the authorized excerpt ends at printed p. 10 during the proof of Theorem 2.1; sector, half-strip and uniqueness passages later in Chapter 2 were not available.
- **Open pull requests without a supplied checkout:** ownership against them was not checked, except that `roadmaps grep` surfaced the PlanarTopology folder of pull request #271, which plans the Jordan curve theorem and would make ConformalMapping L5 its consumer. That pull request is not in the merge order and also edits this folder; on main the owner of Jordan separation is ConformalMapping L5, which this head keeps, and DifferentialGeometry, GeometricMeasureTheory and Isoperimetry on main cite it so. Reconciling the two open pull requests is an operator decision, not a defect of this head.
- **ModularForms scope attribution** (`README.md:77`): main's ModularForms Layer 10 (`README.md:1024`) is the modular curve and dimension formulas; a λ-function or Picard programme was not located there. Nothing here depends on it.
- **Downstream consumer sentences** (`README.md:1364–1367`): ConformalMappingPartII's own contract reuses L1–L4, not only Layer 2; HeegaardFloer's README does not mention §4.2. These are informational, not supplier edges.

## Source issues

- none
