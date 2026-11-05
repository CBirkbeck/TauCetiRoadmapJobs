# Review of IncompressibleFlows (pull request #237 at 25bd83b)

**Verdict:** needs changes

The gate fails (sorry-data, imports, mathlib-subimports, no-import-mathlib, target-ids, metadata); the dependency check passes with no UPWARD or CYCLE line. Six findings block (R01–R06). The roadmap's mathematical content is largely right where it is specific: the adversarial table below found one false Lean statement (R02) and one junk-value defect (R06), and no false README formula. The blocking problems are ownership and form: a sorry'd definition, a non-Hilbert carrier, an unowned Aubin–Lions theorem, two layers that re-plan the PDE roadmap, and a `Suggested.lean` that states no headline theorem.

## R01 (P1) — `torusLerayProjection` is sorry'd data

Location: `TauCetiRoadmap/IncompressibleFlows/Suggested.lean` line 69, "noncomputable def torusLerayProjection : TorusVectorL2 d →L[ℂ] TorusVectorL2 d := by sorry".

Claim: the file defines the `L²` Leray projector.

Witness: the body is `sorry`, so the four theorems at lines 73–85 are statements about `sorryAx`; the gate rule "no `sorry` in the body of a `def`" fails on this line.

Repair: give it a real body on a native carrier or drop it. At the pins it is definable without `sorry`: with the fibre `EuclideanSpace ℂ d` (see R02) the set of `u` with `IsFourierDivergenceFree u` is a closed `ℂ`-submodule of a Hilbert space, and `Submodule.starProjection` (`Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean` line 124) is the Leray projector; the theorem then is that its Fourier coefficients are `leraySymbol k` applied to those of `u`. Alternatively keep `leraySymbol` only and state nothing about the `L²` operator.

## R02 (P1) — the `L²` carrier has the sup norm on fibres, so `norm_torusLerayProjection_le_one` is false and no orthogonality is statable

Location: `Suggested.lean` lines 59–60, "abbrev TorusVectorL2 (d : Type*) [Fintype d] := Lp (FourierVelocity d) 2 volume", and line 85, "‖torusLerayProjection (d := d)‖ ≤ 1".

Claim: `TorusVectorL2 d` is the Hilbert space of square-integrable vector fields, on which the Leray projector has norm at most one and is orthogonal (README Layer 2.1: "self-adjointness, norm one").

Witness: `FourierVelocity d = d → ℂ` carries `Pi.normedAddCommGroup`, the sup norm (`Pi.norm_def`: `‖f‖ = Finset.univ.sup (‖f ·‖₊)`, checked at the pin). For `d = Fin 3`, `k = (1,1,1)`, `a = (1,1,−1)`: `k·a = 1`, `|k|² = 3`, `leraySymbol k a = (2/3, 2/3, −4/3)` (verified by `fin_cases`/`norm_num` on a scratch copy). On the single mode `u = a·e^{2πi k·x}` the file's norm gives `‖u‖ = ‖a‖_∞ = 1` and `‖P u‖ = 4/3`, so the operator norm of the intended projector is at least 4/3. Moreover `InnerProductSpace ℂ (TorusVectorL2 (Fin 3))` fails to synthesise at the pin (`MeasureTheory.L2.innerProductSpace` in `Mathlib/MeasureTheory/Function/L2Space.lean` line 190 needs `InnerProductSpace 𝕜 E` on the fibre), so "orthogonal", "self-adjoint" and "Hodge decomposition" cannot be stated on this carrier. With the fibre `EuclideanSpace ℂ (Fin 3)` the same mode gives `‖a‖₂ = √3 ≈ 1.732` and `‖Pa‖₂ = √(8/3) ≈ 1.633`, consistent with norm one.

Repair: `abbrev TorusVectorL2 (d) [Fintype d] := Lp (EuclideanSpace ℂ d) 2 (volume : Measure (UnitAddTorus d))`, and `FourierVelocity d := EuclideanSpace ℂ d` so `leraySymbol` acts on the same fibre; `modeDot` becomes `∑ i, (k i : ℂ) * a i` on `EuclideanSpace`. Re-check the `InnerProductSpace` instance synthesises (it does for the `EuclideanSpace` fibre at the pin, checked).

## R03 (P1) — Aubin–Lions is attributed to the PDE roadmap, which does not state it

Location: `README.md` line 83, "Rellich--Kondrachov and Aubin--Lions compactness"; line 181, "consumes the PDE roadmap's Aubin--Lions theorem"; line 408, "use the PDE roadmap's Aubin--Lions compactness".

Claim: the PDE roadmap on main owns the Aubin–Lions compactness theorem.

Witness: `TauCetiRoadmap/PDE/README.md` on main contains no occurrence of "Aubin" (Lane A items on Rellich–Kondrachov, lines 115 and 243, and Lane F items 24–26, lines 343–349, name no Aubin–Lions theorem); across main and all 365 open roadmap pull requests the only "Aubin" hits are Yamabe's Aubin inequality and the Temperley–Lieb roadmaps. Leray–Hopf existence (Layer 7.3) rests on an unowned prerequisite.

Repair: make Aubin–Lions a target of Layer 0 here, with exact hypotheses (Banach spaces `X ↪↪ B ↪ Y`, `1 ≤ p < ∞`, bounded sets of `L^p(0,T;X)` with time derivatives bounded in `L^1(0,T;Y)` are relatively compact in `L^p(0,T;B)`, Simon's form) and a locator; or declare it as a gap `gap:aubin-lions` with supplier PDE, section Lane F, in `plan.json` and under the supplier contract.

## R04 (P1) — Layers 0.6 and 4.1–4.2 re-plan PDE Lane F items 24 and 26

Location: `README.md` lines 179–184 (Layer 0 item 6), "Package Bochner spaces `L^p(I; X)` ... the Gelfand triple ... Prove the representative theorem giving a strongly continuous `H`-valued path when `u in L^2(V)` and `partial_t u in L^2(V')`"; lines 300–308 (Layer 4 items 1–2), "on Euclidean space from the Gaussian kernel/Fourier transform ... `Lp -> Lq` decay ... analyticity".

Claim: these are this roadmap's targets.

Witness: `TauCetiRoadmap/PDE/README.md` on main, item 24 (line 343): Bochner spaces, the Gelfand triple `V ↪ H ↪ V*`, and the embedding `L²(V) ∩ H¹(V*) ↪ C([0,T];H)`; item 26 (line 348): the heat semigroup, generators, the heat kernel on `ℝⁿ` via the Fourier transform, and the smoothing estimates. A roadmap on main is built on, never re-planned.

Repair: in `## Exact supplier contracts`, cite PDE Lane F items 24 and 26 by name for the Gelfand triple, the `C([0,T];H)` representative theorem, and the Euclidean heat semigroup with its `L^p → L^q` smoothing. Keep here only what differs, saying in one clause how: the periodic Fourier realization `exp(−4π²νt|k|²)`, the vector-valued and divergence-free restrictions, the `L^{4/3}(V')` weak-continuity variant, and the Stokes semigroup as the restriction of the heat semigroup. Apply the same test to Layer 7.2's finite-dimensional Galerkin ODE against PDE item 25 (fluid-specific energy cancellation stays here).

## R05 (P2) — `Suggested.lean` states no headline theorem and its docstring names none as unstatable

Location: `Suggested.lean` lines 5–16 (module docstring), "The declarations below pin a few representation-sensitive boundaries"; the whole file.

Claim: the file is the roadmap's acceptance test.

Witness: the README's named completion targets (lines 609–627) list twelve headlines; none is stated, and the docstring names none of them with the carrier it lacks (it mentions "Leray--Hopf solutions, suitable solutions, Besov spaces, or parabolic Hausdorff measure" as things it avoids, not which theorem each blocks). At least two headlines are statable at the pins and absent: (a) the `L²` Leray projector theorem, with `Submodule.starProjection` onto the Fourier-divergence-free subspace on the `EuclideanSpace` fibre (R01/R02) and `UnitAddTorus.mFourierCoeff` (`Mathlib/Analysis/Fourier/AddCircleMulti.lean` line 247); (b) volume preservation by divergence-free flows: for `φ : Flow ℝ E` (`Mathlib/Dynamics/Flow.lean` line 82) on a finite-dimensional Euclidean `E` whose orbits satisfy `IsIntegralCurve (fun t => φ t x) (fun _ => v)` (`Mathlib/Analysis/ODE/Basic.lean` line 54) for a `C¹` field `v` with `LinearMap.trace ℝ E (fderiv ℝ v x) = 0` for all `x`, every `φ t` is `MeasurePreserving volume volume`. The eleven Lean names also appear nowhere in the README (rule: every Lean name appears in the README).

Repair: state the statable headlines; in the docstring list each remaining headline (Leray–Hopf existence, 2D uniqueness, Prodi–Serrin, Escauriaza–Seregin–Šverák, Fujita–Kato, CKN, Constantin–E–Titi) with the carrier it lacks (energy-class distributional Navier–Stokes solutions, Besov spaces, suitable weak solutions, parabolic Hausdorff measure); remove the process sentences "not exhaustive" and "Later signatures should be added only once"; name every kept declaration in the README.

## R06 (P2) — `IsMildSolutionOn` loses `[CompleteSpace X]`, so the Duhamel integral is junk on incomplete spaces

Location: `Suggested.lean` lines 101–107, "def IsMildSolutionOn (S : StronglyContinuousSemigroup X) ... u t = S t.toNNReal u0 + ∫ s in (0 : ℝ)..t, ...".

Claim: the predicate is the Duhamel formula for a `C₀`-semigroup on a Banach space `X`.

Witness: the elaborated signature (scratch `#check`) is `{X} [NormedAddCommGroup X] [NormedSpace ℝ X] → ... → Prop`, without `CompleteSpace X` (a `def` keeps only the section variables its type mentions). Mathlib's Bochner integral is `0` when `X` is not complete, so for an incomplete normed space the predicate collapses to `u t = S t u0`, and `IsMildSolutionOn.zero` (line 110) carries `[CompleteSpace X]` while the definition it is about does not.

Repair: add `[CompleteSpace X]` to the binder list of `IsMildSolutionOn` (or an `include` line). Consider `StronglyContinuousSemigroup.realOperator` (`TauCeti/Analysis/Semigroups/Basic.lean` line 159) in place of `S (t - s).toNNReal`.

## R07 (P3) — the README is not in roadmap shape: no targets, no `*Needs:*`, no Checks, no locators, no supplier contracts

Location: `README.md` throughout; the gate's target-ids rule fails at line 150, "layered README states no targets".

Claim: the README is the roadmap.

Witness: zero `### k.n` subsections, zero `*Needs:*` lines, zero `**Checks.**` lists, zero theorem or page locators in 754 lines (grep for "Thm", "Theorem n", "p. n", "§", "Chapter" finds none), no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, per-layer `### Examples`/`### Dependencies`, or `## Downstream consumers`. Statements such as "Prove boundedness and commutation of `P` on every periodic `H^s`" (line 228), "identify the closure in `Lp`" (line 272, which needs `div b = 0` or bounded divergence to be an isometry group), and every theorem of Layers 6–12 carry no exact hypotheses in the sentence and no locator. The supplier wording "Calderon--Zygmund/Riesz-transform lane" (line 229) names no PDE section; PDE Lane B item 10 (CZ singular integrals, Mihlin–Hörmander) is the owner.

Repair: rewrite in the house shape: each layer as `### k.n` prose targets with hypotheses in the sentence, a locator at each claim (e.g. Temam, Ch. III, Thm 3.1; Robinson–Rodrigo–Sadowski, Thm 4.4; CKN, Thm A; Lin, Thm 1.1; Kato 1984, Thm 1; ESS, Thm 1.1; Constantin–E–Titi, Thm 1; DiPerna–Lions, Thm II.2 and Thm III.1; Beale–Kato–Majda, Thm 1), `*Needs:*` lines, at least three discriminating Checks per definition, and `## Exact supplier contracts` naming PDE Lane A items 1–6, Lane B item 10, Lane F items 24–26, OneParameterSemigroups' Lumer–Phillips milestone (its README line 126), OptimalTransport Layer 8 items 3–4 (superposition, lines 1011–1048), DifferentialGeometry 3.5 (line 400), 12.4 and 12.5 (lines 923–930), and the pinned declarations below. Record the cited works with locators in `sources.toml`.

## R08 (P3) — imports violate the header rule

Location: `Suggested.lean` lines 1–3, "import Mathlib.Analysis.Fourier.AddCircleMulti / import Mathlib.MeasureTheory.Function.L2Space / import TauCeti.Analysis.Semigroups.Defs".

Claim: gate rules imports, mathlib-subimports and no-import-mathlib.

Witness: the gate reports all three; the file elaborates with `import Mathlib` plus the Tau Ceti module (checked on a scratch copy).

Repair: replace lines 1–2 by the single line `import Mathlib`.

## R09 (P3) — `metadata.toml` missing

Location: `TauCetiRoadmap/IncompressibleFlows/` (gate metadata rule).

Witness: the folder holds only `README.md` and `Suggested.lean`; a sibling on main, `TauCetiRoadmap/OptimalTransport/metadata.toml`, is the one-line `topic = "math.OC"`.

Repair: add `metadata.toml` with `topic = "math.AP"`.

## R10 (P3) — padding in `Suggested.lean`

Location: `Suggested.lean` lines 47 (`leraySymbol_zero`), 50 (`modeDot_leraySymbol`), 54 (`leraySymbol_idempotent`), 110 (`IsMildSolutionOn.zero`), 123–136 (`scaleVelocity`, `scalePressure`, `scaleForce`), 140–150 (`parabolicCylinder`, `mem_parabolicCylinder`).

Witness: on a scratch copy, `leraySymbol_zero` closes by `simp [leraySymbol]` and `mem_parabolicCylinder` by `exact Iff.rfl`; `IsMildSolutionOn.zero` closes by `simp [IsMildSolutionOn, hT]` followed by `exact continuousOn_const` and is the zero-solution boundary case; `modeDot_leraySymbol` and `leraySymbol_idempotent` are API lemmas about a symbol (two-line algebra once `modeNormSq k ≠ 0` is known); the three scaling definitions and the cylinder serve no stated theorem.

Repair: delete them from `Suggested.lean`; the README keeps the symbol identities, the zero solution, the scaling laws and the cylinder convention as targets and Checks (Layer 2.1, Layer 5.7, Layer 11 preamble).

## R11 (P3) — Layer 3.3 restates the Koopman operator that Mathlib, Tau Ceti and the Exchangeability roadmap already own

Location: `README.md` lines 266–269, "For a measure-preserving continuous flow construct pullback Koopman operators on scalar `Lp`, prove isometry and the group law".

Witness: `MeasureTheory.Lp.compMeasurePreservingₗᵢ` (`Mathlib/MeasureTheory/Function/LpSpace/Basic.lean` line 632) is the pullback isometry on `Lp` by a measure-preserving map, with `compMeasurePreserving` (line 561) and its composition law; Tau Ceti has `koopmanMarkov` (`TauCeti/Probability/Ergodic/KoopmanMarkov.lean` line 39) with `koopmanMarkov_comp` and `koopmanMarkov_iterate`; `TauCetiRoadmap/Exchangeability/README.md` item 7 (line 98) owns "Koopman operators ... for arbitrary measure-preserving maps".

Repair: cite these in the supplier contract; keep here only the flow-indexed group, strong continuity for `1 ≤ p < ∞`, the `L^∞` non-example, unitarity and adjoint on `L²`, and the generator identification.

## R12 (P3) — process narrative, external repositories and a future Mathlib object in the roadmap text

Location: `README.md` lines 107–119, "Three Lean Pool developments are prior art ... The exploratory `emberian/navier-stokes-proof` development"; line 175, "its bundled Bessel-potential successor"; lines 599–602 (Layer 13.4), "Prove that the concrete periodic calculus and Koopman results from the exploratory `navier-stokes-proof` development factor through the general API"; line 631, "Use the following as review guardrails"; lines 663–679, "## Ordering and claim size ... A useful implementation claim"; lines 747–754, "## Acknowledgements and provenance".

Witness: the README rules require a timeless text with no process narrative; Layer 13.4 is a target defined by an external repository rather than by mathematics; "successor" names a Mathlib object that does not exist at the pin (`MemSobolev` at `Mathlib/Analysis/Distribution/Sobolev.lean` line 149 is what exists), and a roadmap never waits for Mathlib.

Repair: move the provenance to a short secondary section or the pull-request text; delete Layer 13.4 or restate it as mathematics; cite `TemperedDistribution.MemSobolev` alone; drop "review guardrails" and "claim size" wording (the negative statements are useful as Checks or non-examples inside their layers).

## R13 (P3) — TeX double hyphens for dashes

Location: `README.md`, 117 lines containing `--` (e.g. line 1, "Navier--Stokes"); `Suggested.lean` docstrings likewise.

Repair: use the en dash "Navier–Stokes", "Caffarelli–Kohn–Nirenberg", "Leray–Hopf" throughout.

## R14 (P3) — sources: the `c₀` Onsager endpoint has no source, and the `ℝ²` Yudovich statement is narrower than its source

Location: `README.md` lines 566–568, "the endpoint refinement for `u in L3_t B^(1/3)_(3,c0)`"; line 445, "for `omega0 in L1 intersect L-infinity` with finite-energy velocity on `R^2`".

Witness: the reference list has Constantin–E–Titi 1994 but not the paper that proves the `c₀` endpoint (Cheskidov, Constantin, Friedlander, Shvydkoy, "Energy conservation and Onsager's conjecture for the Euler equations", Nonlinearity 21 (2008), 1233–1252). For Yudovich on `ℝ²`, `ω₀ = 1_{B₁}` lies in `L¹ ∩ L^∞` with `∫ω₀ = π ≠ 0`, so its Biot–Savart velocity decays like `1/|x|` and is not in `L²`; the source theorem (Majda–Bertozzi, Ch. 8, Thm 8.2) needs only `ω₀ ∈ L¹ ∩ L^∞` with velocity in `L²_loc`, so the extra hypothesis excludes the standard vortex-patch case.

Repair: add the 2008 paper with its theorem locator; state the `ℝ²` Yudovich theorem for `ω₀ ∈ L¹ ∩ L^∞` with the velocity given by Biot–Savart (locally finite energy), and keep the finite-energy case as a Check.

## Verified sound

Elaboration: `Suggested.lean` elaborates at the pins after building `TauCeti.Analysis.Semigroups.Defs`, with ten "declaration uses `sorry`" warnings and nothing else. Signatures: `#check @` on all 21 declarations in a scratch file; the only binder loss against the README is R06.

Dependency check output: `depcheck: 156 roadmaps, 1060 edges, 0 problem(s)`; the merge order lists IncompressibleFlows last (line 353), after every supplier it names (PDE, OneParameterSemigroups, OptimalTransport, DifferentialGeometry, all on main).

Library declarations opened at the pins (file and line): `UnitAddTorus` (`Mathlib/Topology/Instances/AddCircle/Real.lean` 52); `UnitAddTorus.mFourierCoeff` (`Mathlib/Analysis/Fourier/AddCircleMulti.lean` 247) and `mFourierBasis` (266); `TemperedDistribution.MemSobolev` (`Mathlib/Analysis/Distribution/Sobolev.lean` 149); `FourierMultiplier` (`Mathlib/Analysis/Distribution/FourierMultiplier.lean`); the Gagliardo–Nirenberg–Sobolev inequality (`Mathlib/Analysis/FunctionalSpaces/SobolevInequality.lean` 297); `Flow` (`Mathlib/Dynamics/Flow.lean` 82); `IsIntegralCurveOn/At/IsIntegralCurve` (`Mathlib/Analysis/ODE/Basic.lean` 44–54); `ContDiffBump` (`Mathlib/Analysis/Calculus/BumpFunction/Basic.lean` 70); `Lp.compMeasurePreservingₗᵢ` (`Mathlib/MeasureTheory/Function/LpSpace/Basic.lean` 632); `hausdorffMeasure` (`Mathlib/MeasureTheory/Measure/Hausdorff.lean` 535); `Submodule.starProjection` (`Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean` 124); `L2.innerProductSpace` hypotheses (`Mathlib/MeasureTheory/Function/L2Space.lean` 62, 190). Tau Ceti: `StronglyContinuousSemigroup` (`TauCeti/Analysis/Semigroups/Basic.lean` 41: `toFun : ℝ≥0 → X →L[ℝ] X`, `map_zero'`, `map_add'`, `continuousAt_zero'`), `realOperator` (159), `ContractionSemigroup` (224), Lumer–Phillips (`TauCeti/Analysis/Semigroups/Generation/LumerPhillips.lean`), Hille–Yosida (`Generation/HilleYosida/Limit.lean`); `W1p` (`TauCeti/Analysis/Sobolev/W1p.lean` 343, scalar values `Lp ℝ p`, gradient `Lp E p`), `W2p` (`W2p.lean`), `W3p` (`W3p.lean` 103); `HasWeakFDerivOn` (`TauCeti/Analysis/Sobolev/WeakDeriv.lean` 233, already vector-valued `u : E → F`); `koopmanMarkov` (`TauCeti/Probability/Ergodic/KoopmanMarkov.lean` 39). So every "Mathlib already supplies" and "Tau Ceti contains" claim of the README is true at the pins, except the "successor" of `MemSobolev` (R12).

Cross-roadmap citations resolved on main: PDE Lane A (weak-derivative `W^{k,p}`, Meyers–Serrin, trace, extension, Rellich–Kondrachov: lines 183–190, 232–243), Lane B item 10 (CZ, Mihlin–Hörmander, endpoints weak-`(1,1)` and `L^∞ → BMO`: 276–281), Lane F items 24–26 (343–349); OneParameterSemigroups (C₀ semigroups, generators, Hille–Yosida, Lumer–Phillips: lines 7–8, 26, 108, 126; no fractional powers or analytic semigroups, so Layer 4.5's `A^α` is correctly owned here); OptimalTransport (continuity equation lines 159, 262; superposition 1011–1048; its "transport equation" section 6B is Monge–Ampère, not DiPerna–Lions); DifferentialGeometry 3.5 time-dependent flows (line 400), 12.4 volume form (923), 12.5 divergence theorem (930). Aubin–Lions: not found (R03).

Ownership against open pull requests: `roadmaps grep` over main and the 365 open heads for Navier/Leray/Helmholtz, Koopman, Littlewood/Besov, DiPerna/renormalized, Biot, Aubin, Stokes or heat semigroup, Onsager/Yudovich, suitable weak/parabolic Hausdorff, Gelfand triple/Bochner space: no other roadmap builds incompressible-flow objects; the Littlewood–Paley/Besov hits are in PDE (main and its open revisions #93 and #1614, which revise an existing roadmap and are not dependencies) and the heat-semigroup hits are PDE item 26 and OptimalTransport (R04). Koopman is owned as in R11.

Adversarial table (statement; instances; values each side; result; change):

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `leraySymbol 0 a = a` | any `d`, `k = 0` | `if` branch returns `a`; `a` | true (one tactic) | R10 |
| `leraySymbol` transverse, idempotent | `d = Fin 3`, `k = (1,1,1)`, `a = (1,1,−1)` | `k·a = 1`, `|k|² = 3`, `Pa = (2/3,2/3,−4/3)`, `k·Pa = 2/3+2/3−4/3 = 0`, `P(Pa) = Pa` | true | none |
| `leraySymbol` in `d = 1` | `k = (2)`, `a = (5)` | `Pa = 5 − 2·10/4 = 0` | true (every non-constant 1D mode is a gradient) | none |
| `modeNormSq k ≠ 0` for `k ≠ 0` | integer `k` | `∑ kᵢ² ≥ 1` in `ℂ`; the `k = 0` branch avoids `0/0` | sound | none |
| `‖torusLerayProjection‖ ≤ 1` (sup-norm fibre) | `u = a e_k` as above | `‖u‖ = ‖a‖_∞ = 1`, `‖Pu‖ = 4/3` | FALSE | R02 |
| same with `EuclideanSpace` fibre | same | `‖a‖₂ = √3 ≈ 1.732`, `‖Pa‖₂ = √(8/3) ≈ 1.633` | true | R02 repair |
| `IsFourierDivergenceFree` | `k = 0`, any coefficient; `d = Fin 2`, `k = (1,0)`, `a = (1,0)` | `modeDot 0 c = 0`; `k·a = 1 ≠ 0` | constants pass, gradient mode fails | none |
| `torusLerayProjection_eq_self_iff` (intended `P`) | constant `u`; gradient mode | `Pu = u`, div-free; `Pu = 0 ≠ u`, `k·a = 1` | both directions consistent | none |
| `IsMildSolutionOn` at `T = 0` | `Icc 0 0 = {0}` | `∫₀⁰ = 0`, `u 0 = S 0 u0 = u0` by `map_zero'` | sound | none |
| Duhamel sign | `X = ℝ`, `S t = e^{−t}`, `f = 1`, `B = 0`, `u0 = 0` | `u(t) = ∫₀ᵗ e^{−(t−s)} ds = 1 − e^{−t}`, `u' = −u + 1 = −Au + f` | sign correct | none |
| `IsMildSolutionOn` on incomplete `X` | any incomplete normed space | Bochner integral `= 0`, predicate becomes `u t = S t u0` | junk | R06 |
| Scaling `u_λ, p_λ, f_λ` | powers of `λ` term by term | `∂ₜu_λ`, `(u_λ·∇)u_λ`, `Δu_λ`, `∇p_λ` all scale by `λ³`; so `f_λ = λ³ f(λ²t, λx)`; `λ = 1` identity | correct | R10 (padding only) |
| Scale invariance of `L^d`, `Ḣ^{d/2−1}`, Serrin class | `d` general | `‖u_λ‖_{L^d} = λ·λ^{−1}‖u‖`; `Ḣ^{d/2−1}` exponent `1 − d/2 + (d/2 − 1) = 0`; `L^p_t L^q_x` exponent `1 − d/q − 2/p = 0` iff `2/p + d/q = 1` | correct | none |
| `parabolicCylinder` | `z0 = (0,0)`, `r = 1`; `r = 0` | `B₁ × (−1,0)`, top excluded; `Ioo 0 0 = ∅` | backward, matches CKN | R10 |
| Fourier weight `(1+4π²|k|²)^{s/2}` vs gradient `2πik` | `k = e₁`, `s = 1` | `‖∇e_k‖² = 4π²‖e_k‖²`, `H¹` norm² `= 1 + 4π²` | consistent | none |
| Heat multiplier `exp(−4π²νt|k|²)` | `k = e₁` | `Δe_k = −4π² e_k`, decay `e^{−4π²νt}` | consistent | none |
| Mean-zero Poincaré constant | `u = e^{2πix}` | `‖u‖₂ = ‖∇u‖₂/(2π)`, equality | constant `1/(2π)` | none |
| Stokes sign `A = −PΔ` | mode `k` | `A e_k = 4π²|k|² e_k ≥ 0`, `⟨Au,u⟩ = ‖∇u‖²` | positive | none |
| Pressure Poisson `−Δp = div div(u⊗u) − div f` | `u = c` constant, `f = 0`; `u = 0`, `f = ∇φ` | `p = 0`; `p = φ` (mean zero) | sign consistent | none |
| Liouville formula sign | `b(x) = x` in 1D | `Φₜ x = eᵗx`, `d/dt DΦ = eᵗ = (div b)·DΦ` | correct | none |
| Transport pullback sign | `b = 1` in 1D, `ρ = ρ₀(x − t)` | `∂ₜρ + b∂ₓρ = −ρ₀' + ρ₀' = 0`; forward pullback gives `2ρ₀'` | inverse-flow pullback correct | none |
| Galerkin time-derivative space | `d = 2`; `d = 3` | `‖B(u,u)‖_{V'} ≤ ‖u‖₄² ≤ ‖u‖₂‖∇u‖₂ ∈ L²_t`; `≤ ‖u‖₂^{1/2}‖∇u‖₂^{3/2} ∈ L^{4/3}_t` | correct | none |
| Prodi–Serrin range `2/p+3/q ≤ 1, q > 3` | `(p,q) = (∞,3)` | `2/∞ + 3/3 = 1` but `q > 3` excludes it | endpoint correctly deferred to ESS | none |
| Shinbrot `2/p+2/q ≤ 1, q ≥ 4` | `(4,4)` | `1/2 + 1/2 = 1` | classical `L⁴L⁴` case included | none |
| Kato weight `t^{1/2−d/(2q)}` | `q = 2d` | `t^{1/4}` | matches Kato 1984 | none |
| DiPerna–Lions exponents | `p = 1` | `1/1 + 1/q ≤ 1` forces `q = ∞` | matches text | none |
| CET threshold | `u ∈ B^α_{3,∞}`, mollification scale `ε` | flux `≲ ε^{3α−1} → 0` iff `α > 1/3` | correct | none |
| Yudovich on `ℝ²` with finite energy | `ω₀ = 1_{B₁}` | `∫ω₀ = π`, velocity `∼ 1/|x|`, not `L²` | hypothesis narrower than source | R14 |
| Fujita–Kato index | `d = 3` | `d/2 − 1 = 1/2` | matches `H^{1/2}` | none |
| Local strong theory index | `d = 3` | `s > d/2 + 1 = 5/2` | standard | none |
| `W1p` scalar vs `HasWeakFDerivOn` vector-valued | pin | `W1p.value : Lp ℝ p`; `HasWeakFDerivOn (u : E → F)` | README claim true | none |

Fifteen sampled statements checked against the standard statements of the listed references (no locator exists to check against; see Not verifiable): Leray symbol; Hodge decomposition on the torus; Leray endpoint bounds `L¹ → L¹_weak`, `L^∞ → BMO`; pressure formula `p = ∑ RᵢRⱼ(uᵢuⱼ)` in `L^r` for `u ∈ L^{2r}`; Biot–Savart `L^{dp/(d−p)}` and gradient `L^p` bounds; DiPerna–Lions hypotheses including the growth condition; heat multiplier; `B : V × V → V'` in `d = 2, 3` and `H^s` bilinear estimate for `s > d/2`; local existence for `s > d/2 + 1`; BKM; Galerkin derivative spaces; Prodi–Serrin; Shinbrot; ESS `L^∞_t L³_x`; Leray's `1/2`-dimensional singular-time set; Fujita–Kato and Kato `L^d` classes; Besov duality range (`1 < p, r < ∞` is a safe sub-range of the true `1 ≤ p, r < ∞`); CKN `ε`-regularity and `P¹(S) = 0`; CET `α > 1/3`. All agree with the sources as stated, with the one narrowing in R14.

Declared gaps: none declared (no `design/plan.json`), and none needed beyond R03.

## Not verifiable

- Source locators: the README gives none (no theorem, section or page number anywhere), and the worker's seeded sample found no target by heading, so no locator could be checked at its text. The fifteen statements above were checked against the standard forms of the cited theorems, not at a locator; no source was fetched because there was nothing to fetch against. R07 asks for the locators.
- Ownership against open pull requests whose files this brief does not give was not checked beyond `roadmaps grep` over the index of 2026-10-27.
- The external repositories named in the README and the pull-request text (`emberian/navier-stokes-proof`, the fork pull-request stack, Lean Pool archives) were not read; they are not dependencies and the review treats them as data.

## Source issues

- none
