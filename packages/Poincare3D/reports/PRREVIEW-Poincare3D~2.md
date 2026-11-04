# Review of Poincare3D (pull request #1740 at 203af6e)

**Verdict:** needs changes

One P2 finding (R01) and a failing push gate (R02, R03) block acceptance. The mathematics of the
plan checked out everywhere I computed it (table under *Verified sound*); the remaining findings
are shape, policy and padding.

## R01 (P2) — P14 restates Moise's triangulation theorem that the pinned Tau Ceti states and GeometricTopology Layer 11 holds

Location: `TauCetiRoadmap/Poincare3D/README.md` lines 673–700 (P14: "Prove dimension-three
compatible PL existence (Moise/Hamilton) … This layer owns these dimension-three existence
results") and the supplier table, line 36 (GeometricTopology supplies "triangulation/realization
and smooth triangulation"; "dimension-three compatible PL/smooth existence in P14" is owned here).

Claim: this roadmap owns the existence of a triangulation (PL structure) of every closed
topological three-manifold.

Witness: the pinned Tau Ceti already states it: `TauCeti.TriangulationConjecture 3`
(`TauCeti/Topology/TriangulationConjecture.lean` line 70: every compact Hausdorff space charted on
`EuclideanSpace ℝ (Fin n)` is `TauCeti.IsTriangulable`, with `IsTriangulable` at
`TauCeti/Topology/Triangulable.lean` line 40, and its docstring naming Moise for `n ≤ 3`). On main,
GeometricTopology lists Moise's Theorems 35.3 and 36.2 under its Layer 11 references
(`TauCetiRoadmap/GeometricTopology/README.md` lines 1137–1139) and cites its Moise extract from the
Layer 11 build list (lines 883–884); the open revision of GeometricTopology plans their proofs and
the dimension-three PL-to-smooth theorem in a §11.2 (that revision is not a dependency, but it shows
the intended owner). The README neither cites the pinned statement nor says why Layer 11 is not the
owner.

Repair: in `## Exact supplier contracts` (From Tau Ceti) cite `TauCeti.IsTriangulable` and
`TauCeti.TriangulationConjecture` by name and file, and in P14 consume the triangulation theorem
and the dimension-three Hauptvermutung from GeometricTopology Layer 11 (Moise, Theorems 35.3 and
36.2), keeping here only what no roadmap plans: the dimension-three PL-to-smooth step (Cairns,
Theorem III; Munkres, *Elementary Differential Topology*, §10) and the transport of the result into
a `ChartedSpace (EuclideanSpace ℝ (Fin 3)) M` atlas with `IsManifold (𝓡 3) ∞ M`
(`smoothable_closed_three_manifold`). If the author reads Layer 11 as defining the predicate only,
the Scope section must say so in one clause and P14 must still cite the pinned statement; an
unmentioned second plan for the same theorem is what this finding objects to.

## R02 (P3, gate) — `Suggested.lean` imports four Mathlib submodules instead of `Mathlib`

Location: `TauCetiRoadmap/Poincare3D/Suggested.lean` lines 3–6 (`public import
Mathlib.Geometry.Manifold.Instances.Sphere`, `…Diffeomorph`, `…SimplyConnected`,
`…Pow.Deriv`).

Claim: the gate rules `imports`, `mathlib-subimports` and `no-import-mathlib` fail (gate: `imports=1
mathlib-subimports=4 no-import-mathlib=1 … FAIL`). No acceptance while the gate fails.

Witness: I replaced lines 3–6 by the single line `public import Mathlib` (keeping `module` and
`@[expose] public section`) on a scratch copy and elaborated it with `lake env lean`: the seven
declarations elaborate with exactly the types in the worker's signature list, the only warnings are
the four `sorry`s, and the sphere instances `ChartedSpace (EuclideanSpace ℝ (Fin 3)) (sphere 0 1)`
and `IsManifold (𝓡 3) ∞ (sphere 0 1)` resolve.

Repair: lines 3–6 become `public import Mathlib`.

## R03 (P3, gate) — commit-pinned blob link to RicciFlow

Location: `README.md` line 43 (`https://github.com/TauCetiProject/TauCetiRoadmap/blob/544d4ff5…/TauCetiRoadmap/RicciFlow/README.md`) and line 45 ("the explicit supplier contract in the RicciFlow proposal").

Claim: gate rule `blob` fails; the README also calls a roadmap a "proposal" (process word).

Witness: RicciFlow is an open roadmap pull request earlier in the merge order (its head fff2322
contains 544d4ff as an ancestor); its `## Downstream consumers` says Poincare3D consumes Layers 1–5.

Repair: `[RicciFlow](../RicciFlow/README.md), Layers 1–5 (R1–R5)`; delete the sentence at line 45.

## R04 (P3) — the README is not in TauCetiRoadmap form

Location: whole README. Title line 1 (not `# Roadmap: …`, no `**Summary.**`); `## Existing floor
and conventions` (line 55) for `## Conventions`; no `## Exact supplier contracts` (the supplier
table sits inside Scope); `## Dependency order` (line 121) for `## How to read the build`; layers
`## P1.`–`## P15.` with no `### k.n` subsections, no API bullets, no `**Checks.**` lists (the only
test prose is "Completion checks" at line 177, "acceptance examples" at 286 and `## Completion
examples` at 713), no `*Needs:*` line anywhere (count 0), no `### Examples`/`### Dependencies`
per layer, no `## Downstream consumers`, `## Mathematical references` for `## References`.

Claim: the house checklist ("every definition keeps its API list and at least three discriminating
Checks, every theorem its exact hypotheses, every claim its locator, every layer its dependencies")
cannot be applied to this text: there is no definition with three Checks and no target with a
`*Needs:*` line.

Witness: compare `TauCetiRoadmap/RicciFlow/README.md` at its head (headings at lines 16, 77, 134,
156, 167ff, each `### k.n` ending in `**Checks.**` and `*Needs:*`, each layer in `### Examples` /
`### Dependencies`).

Repair: rewrite into that shape. The mathematics can stay as it is (it checked out, see the table);
what is missing is the per-target structure: each definition (normalized metric, pointed
convergence, reduced length/volume, κ-noncollapse, ancient κ-solution, ε-neck/cap/canonical
neighbourhood, standard initial metric, surgery flow, `Fill_g`, `w_g`, `W_g`, ramp) with its API
bullets and at least three Checks (a computed value, a degenerate case, a non-example), each
theorem with its hypotheses in the sentence and a locator (see R05 for the locators), each target
with a `*Needs:*` line.

## R05 (P3) — almost every theorem lacks a locator

Location: the only locators in the layers are lines 199 (MT Theorems 3.27–3.29), 516 (MT Lemma
19.15, Section 19.7), 568 (MT Lemma 19.15, Corollary 19.16) and 751 (MT Corollary 0.2(a)); every
other theorem in P1–P15 is stated without one.

Claim: "every theorem its exact hypotheses and a locator".

Witness and repair (locators verified in the Clay text of Morgan–Tian, `mt07`): normalized initial
conditions, Definition 4.10 (line 4519, printed p. 67; exactly the all-radii form `Vol B(x,0,r) ≥
(ω_n/2) rⁿ` for `r ≤ 1` the README states); Hamilton–Ivey pinching and `R ≥ −6/(1+4t)`,
Theorem 4.26 (line 4894, p. 76); Hamilton's trace Harnack, Theorem 4.37 and Corollary 4.39 (lines
5088–5103, p. 81); pointed compactness with complete limit, Theorems 5.11 and 5.15 (lines 5450,
5531); two-dimensional κ-solutions, Theorem 9.4 and Corollary 9.50(3) (lines 9055, 10564);
universal κ₀ off the round branch, Proposition 9.58 (line 10887); zero asymptotic volume ratio,
Theorem 9.59 (line 10941); ε-neck/(C,ε)-cap (ball or punctured `RP³`)/C-component/ε-round
component and strong necks, Definitions 9.72–9.78 (lines 11304–11400, pp. 231–232); standard
initial metric and standard solution with `T = 1`, Definition 12.1 and Theorem 12.5 (lines 13730,
13857); existence of surgery flow for all time, Theorem 15.9 (line 16610); finitely many
surgeries per compact interval, Lemma 17.12 (line 18612); finite extinction, Theorem 18.1 (line
18688); least nontrivial sphere area and `dW₂/dt ≤ −4π − ½R_min W₂`, Lemma 18.10 and Lemma 18.11
(lines 19096, 19168); `dW_ξ/dt ≤ −2π − ½R_min W_ξ` as forward difference quotients, Proposition
18.18 (line 19375); the family deformation, Proposition 18.24 (line 19470); annuli of small area,
Lemma 19.31 (line 20823, Section 19.7 per the table of contents, line 259). Perelman's disk-width
form of the same inequality is `perelman03b` line 45.

## R06 (P3) — process narrative and external-code instructions

Location: lines 11–12 ("prototypes selected interfaces"); 73–77 (three Mathlib pull-request links,
"developing … interfaces", "adopt the resulting Mathlib interfaces as they land"); 45 ("proposal");
777–788 (`## Existing Lean formalizations`: two GitHub repositories at pinned revisions, a
"benchmark submission", "reuse and adaptation … of their code", "Preserve the applicable source
notices and attribution when integrating their code").

Claim: a README is timeless mathematics; it carries no process narrative, pull-request references
or instructions about importing code from outside the project.

Repair: delete lines 73–77 and 777–788; if the author wants to acknowledge the earlier
formalization, one sentence under `## References` naming it as prior work suffices, with no
revision hashes and no instruction to integrate its code.

## R07 (P3) — `Suggested.lean` docstring is an API-catalogue preface and omits the unstatable headlines

Location: `Suggested.lean` lines 8–21.

Claim: the docstring says the file "is not exhaustive", "suggest[s] Lean forms for selected
interfaces", speaks of "contributors and reviewers", "further prototypes" and "P1--P15". The form
is "<title>: target signatures", saying the roadmap is README.md, that the file states the headline
theorems against the pinned APIs, and which headlines are not statable and what each lacks.

Witness: the headline theorems the README builds toward that are not statable at the pins are the
existence of Ricci flow with surgery for every normalized closed orientable initial metric (MT
Theorem 15.9), its finite extinction for simply connected initial data (MT Theorem 18.1) and the
reconstruction of the initial manifold as a connected sum of spherical space forms and
`S²`-bundles (MT Theorem 0.1); each lacks a Ricci-flow and surgery carrier (no time-dependent metric
family, no reduced geometry, no surgery-flow structure exists in Mathlib or Tau Ceti at the pins).

Repair: rewrite the docstring in the required form and name those three with what they lack.

## R08 (P3) — padding in `Suggested.lean`

Location: `secondCountable_closed_three_manifold` (line 31), `extinctionBarrier` (line 37),
`hasDerivAt_extinctionBarrier` (line 42), `extinctionBarrier_eventually_negative` (line 48).

Claim: the first is proved by the one library lemma that is its statement
(`ChartedSpace.secondCountable_of_sigmaCompact`); the other three are calculus on an explicit
scalar function with no roadmap object in them (the README's own words at line 42: "normalization
check"), and they mirror the P11 Checks (`G(0) = W₀`, `G′ = −2π + 3G/(1+4t)`, `G(t) < 0` for large
`t`). I verified the identities (table rows 5–6) and ran the one-tactic probe (`simp
[extinctionBarrier]` closes neither; they are padding by the bare-scalar and Check-mirror rules,
not by the one-tactic rule).

Repair: delete the four declarations from `Suggested.lean`; keep the statements as P11 Checks in
the README (the README already states `G`).

## R09 (P3) — locator and citation slips

- Line 40: `[HopfRinow](../HopfRinow/README.md)` does not resolve; HopfRinow is a completed roadmap
  at `Completed/HopfRinow/README.md` (RiemannianGeometry links it as
  `../../Completed/HopfRinow/README.md`, its line 54). Layers 0–4 exist there (headings at its lines
  229–495).
- Line 764: Kleiner–Lott is Geometry & Topology 12 (2008) 2587–2858 (author text `kl08` line 6),
  not 2587–2855.
- Line 48: RiemannianGeometry R4.9 is curve shortening of Jordan curves on a smooth two-sphere
  (its heading at line 802), not "on a fixed surface"; say "on a smooth two-sphere".
- Line 469: AlgebraicTopology Stage 8's loop comparisons are based-loop comparisons (its items
  8.11 and 8.11b, `basedLoopCWType`, `ordinaryEMLoopComparison`, lines 1948–1996); the free-loop
  fibration and `π₂(Λ₀M) ≅ π₃(M)` are owned here (P9 states them), so name the Stage 8 item
  consumed and say that the free-loop identification is this roadmap's.
- Line 11: the sentence "P1–P15 specify the required mathematics" is a label system foreign to the
  house shape; the layers become `## Layer k` (R04).

## R10 (P3) — Scope should place this roadmap against the pinned geometrization statement

Location: `README.md` lines 29–33.

Claim: the Scope says GeometricTopology Layer 8 owns "faithful statements of geometrization", but
does not say that the geometrization statement already exists at the pin and is not proved here,
nor that this roadmap supplies the Poincaré statement GeometricTopology derives from it.

Witness: `TauCeti.GeometrizationConjecture` (`TauCeti/LowDimTopology/Geometrization.lean` line
144: closed orientable irreducible smooth three-manifolds, stated on `[MetricSpace M] [ChartedSpace
(EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) ∞ M] [CompactSpace M] [ConnectedSpace M]
[Orientable (𝓡 3) ∞ M]`, "stated, not proved"); the open revision of GeometricTopology states a
`poincare_conjecture` in its §8.6 as a consequence of it and says the analytic proof belongs to
RicciFlow, while RicciFlow at its head (`## Downstream consumers`, line 1655) says it supplies
Layers 1–5 to Poincare3D and owns no surgery.

Repair: one clause in Scope: the pinned `TauCeti.GeometrizationConjecture` is not proved here;
`poincare_3d_topological` is the theorem GeometricTopology Layer 8's Poincaré statement reduces to,
and this roadmap's carriers (`[TopologicalSpace M] [T2Space M]`) are more general than the pinned
`[MetricSpace M]` form, with the transport lemma named in P15.

## R11 (P3) — unused hypothesis in `smoothable_closed_three_manifold`

Location: `Suggested.lean` line 61, `[ConnectedSpace M]`.

Claim: the statement holds without it. Instance: `M = S³ ⊔ S³` (two components): each component
carries the standard smooth atlas, and their union is a smooth atlas on `M`; in general a compact
topological three-manifold has finitely many components, each closed and connected, and P14's
theorem applies to each. The README's P14 (line 695) keeps connectedness "to match the source
convention"; that is a reason to state the theorem for components, not to weaken the Lean form.

Repair: drop `[ConnectedSpace M]` from the Lean statement and from P14's statement, or keep both and
say in P14 that the general case follows by components.

## Verified sound

**Gate and build.** The worker's gate: `set_option=0 blob=1 … sorry-data=0 sorry-examples=0
… imports=1 mathlib-subimports=4 no-import-mathlib=1 … depcheck=0 … stray-files=0 outside-folder=0
build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/Poincare3D'` is empty: the
pull request changes only this folder. Dependency check run by me:

    depcheck: 205 roadmaps, 1655 edges, 0 problem(s)

No UPWARD or CYCLE line. Merge order: Poincare3D is listed directly after RicciFlow, its only
supplier that is not on main.

**Signatures.** With the repaired header (`module` / `public import Mathlib`) I elaborated
`#check @name` for all seven declarations: each type equals the worker's `signatures.md` entry; no
section binder is lost (`poincare_3d_smooth` keeps `T2Space`, `IsManifold (𝓡 3) ∞`,
`SimplyConnectedSpace`, `CompactSpace`; `poincare_3d_topological` keeps `T2Space`,
`SimplyConnectedSpace`, `CompactSpace`). Nothing changed.

**Library declarations opened at the pins.** `SimplyConnectedSpace`
(`Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean` line 40: nonempty
fundamental groupoid equivalent to a point; instance `PathConnectedSpace` at line 70, so the
headline hypotheses imply `Nonempty M` and `ConnectedSpace M`, which `poincare_3d_topological`'s
proof uses when it applies `smoothable_closed_three_manifold`);
`ChartedSpace.secondCountable_of_sigmaCompact` (elaborated type: `[SecondCountableTopology H]
[SigmaCompactSpace M] → SecondCountableTopology M`); `Diffeomorph.toHomeomorph` (any `n : ℕ∞ω`);
the sphere instances `ChartedSpace (EuclideanSpace ℝ (Fin 3)) (sphere (0 : EuclideanSpace ℝ (Fin
4)) 1)` and `IsManifold (𝓡 3) ∞ (sphere 0 1)` (both resolve by `inferInstance`);
`TauCeti.GeometrizationConjecture` (`LowDimTopology/Geometrization.lean` 144);
`TauCeti.TriangulationConjecture` (`Topology/TriangulationConjecture.lean` 70);
`TauCeti.IsTriangulable` (`Topology/Triangulable.lean` 40). No Ricci-flow, curve-shortening,
reduced-volume or surgery object exists in Mathlib or Tau Ceti at the pins (grep of both trees for
`Ricci`, `RicciFlow`, `curveShortening`, `reducedVolume`: no hits outside the geometrization
docstring), so the surgery headlines are rightly unstated.

**Cross-roadmap citations resolved (on main unless said).** GeometricTopology Layers 1, 2, 7, 8, 11
and the smoothing-and-triangulation comparison (headings at lines 177, 289, 627, 696, 831, 930;
connected sum at line 223, collars 14 mentions); AlgebraicTopology Stages 1–6 and 8 (289, 326,
471, 499, 849, 946, 1602); DifferentialGeometry Layers 0–3, 5–10, 12 (268–912; Sard is 10.2 at
line 884); HopfRinow Layers 0–4 (`Completed/HopfRinow/README.md` 229–495); RiemannianGeometry
R1–R5a, R4.9, R7.0 (179, 300, 347, 607, 802, 1042, 1044, 1295); PDE Lanes A, C–F (223, 285, 303,
322, 341); ComplexKahlerGeometry K5a (570); GeometricMeasureTheory G1–G2 (106, 148); RicciFlow
R1–R5 at its open head fff2322 (Layers 1–5 at 167–1076; R3.2 states the global Shi bounds under
`|Rm| ≤ K` on `M × [0, A/K]`, line 601; R4.2 the scalar maximum principle; `## Downstream
consumers` names Poincare3D, line 1655). All suppliers are on main or earlier in the merge order;
no upward citation.

**Ownership.** On main no roadmap plans Ricci flow with surgery, reduced geometry, κ-solutions,
canonical neighbourhoods, loop-family width or curve shortening in a moving three-manifold
(`roadmaps grep` over the 440 open pull requests and main for `ricci flow with surgery|reduced
volume|canonical neighbou?rhood|ancient κ|hamilton.ivey|finite extinction|poincaré conjecture`:
hits only in GeometricTopology (statements), RicciFlow (which excludes surgery, line 71),
FourManifolds and MorseTheory (mentions)). RiemannianGeometry R4.9 is curve shortening on a
two-sphere, consistent with the deferral at line 48. The one overlap found is R01 (Moise).
Ownership against open pull requests was checked through the sibling checkouts listed in the
brief and the `roadmaps grep` index of 2026-11-03.

**Sources read (locators checked in the cached texts).** `mt07` (Morgan–Tian, Clay text, 570
PDF pages; printed page = PDF page − 43): Theorem 0.1 line 307 and Corollary 0.2(a) line 314 (a
closed simply connected 3-manifold is diffeomorphic to `S³`; "manifold" means smooth, line 302);
Theorems 3.27, 3.28, 3.29 lines 3767–3817 (Shi: `T ≤ α/K`, `|Rm| ≤ K` on the parabolic ball over
`B(p,0,r)`, bound `C_k t^{-k/2}` on `B(p,0,r/2)`; 3.29 adds initial `C^l` bounds and gives
`t^{-max(k−l,0)/2}`): matches P2 lines 199–211 exactly. Definition 4.10 line 4519 (normalized);
Theorem 4.26 line 4894 (pinching); Theorem 4.37 line 5088 (Harnack); Theorems 5.11/5.15 lines
5450/5531 (compactness, complete limit); Definition 9.72 line 11304 (cap is a ball or punctured
`RP³`); Definition 9.77 line 11376 (four canonical-neighbourhood clauses); Definition 12.1 line
13730 and Theorem 12.5 line 13857 (standard metric: round cylinder of scalar curvature 1 outside a
ball, sectional curvature 1/4 near the tip; `T = 1`); Theorem 15.9 line 16610; Lemma 17.12 line
18612; Theorem 18.1 line 18688 (includes "no `RP²` with trivial normal bundle", the P1 claim);
Lemmas 18.10/18.11 lines 19096/19168; Proposition 18.18 line 19375; Proposition 18.24 line 19470;
Lemma 19.15 line 20137 (`dμ/dt ≤ (2n−1) max|Rm| μ`, forward difference quotients, `n ≥ 3`);
Corollary 19.16 line 20227 (exponent independent of `λ`); Lemma 19.31 line 20823 and the table of
contents line 259 (§19.7 = "annuli of small area"). `mt15` (arXiv 1512.00699v1) lines 10–34: the
missed connection-variation term in Lemma 19.7, the extra `C′k` term, the length-dependent
constant: matches P10 lines 555–561. `perelman03b` line 45: `dA/dt ≤ −2π − ½R_min A`. `topping14`
Theorems 1.1–1.3 (lines 43–165): the local-curvature-bound extension of Hamilton compactness fails
without a completeness hypothesis on the limit, as P2 line 240 states. `kl08` header lines 5–9.

**Adversarial table.** Values computed on each side.

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `poincare_3d_smooth` | `M = S³`; `M = S¹×S²`, `RP³`, Poincaré sphere; `M = ∅`; `M = S³ ⊔ S³`; `M = ℝ³`; a non-Hausdorff charted space | identity diffeo; `π₁ = ℤ, ℤ/2, I*` so `SimplyConnectedSpace` fails; `SimplyConnectedSpace` needs `Nonempty`; not path-connected; not compact; `T2Space` fails | hypotheses exclude every counter-instance; conclusion true by MT Cor 0.2(a) | none |
| `smoothable_closed_three_manifold` | `S³`; `S³ ⊔ S³`; `∅` | standard atlas; componentwise atlas (ConnectedSpace unused); excluded by `ConnectedSpace` | true; one unused hypothesis | R11 |
| `poincare_3d_topological` proof | typeclass path | `SimplyConnectedSpace → PathConnectedSpace → ConnectedSpace` (pin line 70) | proof term elaborates | none |
| normalized metric scaling (P1) | `g ↦ Qg`, `Q ≥ 1`, `r ≤ 1` | `vol_{Qg} B(x,r) = Q^{3/2} vol_g B(x, r/√Q) ≥ Q^{3/2}·½ω₃ (r/√Q)³ = ½ω₃ r³`; `|Rm|_{Qg} = Q⁻¹|Rm|_g` | all-radii bound and `|Rm| ≤ 1` preserved under scaling up; agrees with MT Def 4.10 | none |
| `R_min ≥ −6/(1+4t)` (P2) | `r(t) = −6/(1+4t)` against `r′ = ⅔r²`, `r(0) = −6` | `r′ = 24/(1+4t)²`, `⅔r² = 24/(1+4t)²`; `ν(0) ≥ −1 ⇒ R(0) = 2(λ+μ+ν) ≥ −6` | the ODE comparison function is exact; MT Thm 4.26(1) | none |
| Hamilton–Ivey `R ≥ 2(−ν)(log(−ν)+log(1+t)−3)` | hyperbolic `K ≡ −1`, `g(t) = (1+4t)g₀` | `t=0`: `−6 ≥ 2·1·(0+0−3) = −6` (equality); `t>0`: `ν = −1/(1+4t)`, RHS `= 2(1+4t)⁻¹(log(1+t) − log(1+4t) − 3) < −6/(1+4t) = R` | holds with the sectional-eigenvalue convention `R = 2(λ+μ+ν)` the README fixes; MT Thm 4.26 uses `R = 2 tr`, line 4928 | none |
| Harnack `∂ₜR + R/t + 2⟨∇R,V⟩ + 2Ric(V,V) ≥ 0` | shrinking cylinder `S²×ℝ`, `R = 1/(1−t)`, `V = 0`, ancient form | `∂ₜR = 1/(1−t)² > 0` | consistent with MT Thm 4.37 / Cor 4.39 | none |
| width ODE and integrating factor (P11) | `u = (1+4t)^{−3/4} W` | `u′ = (1+4t)^{−3/4}(W′ − 3W/(1+4t)) ≤ −2π(1+4t)^{−3/4}`; `∫₀ᵀ (1+4t)^{−3/4} = (1+4T)^{1/4} − 1` | the displayed bound `(1+4T)^{−3/4}W(T) ≤ W₀ + E − 2π((1+4T)^{1/4} − 1)` is exact; negative once `(1+4T)^{1/4} > 1 + (W₀+E)/(2π)` | none |
| `G(t) = (W₀+2π)(1+4t)^{3/4} − 2π(1+4t)` and `hasDerivAt_extinctionBarrier` | `t = 0`; derivative | `G(0) = W₀`; `G′ = 3(W₀+2π)(1+4t)^{−1/4} − 8π = −2π + 3G/(1+4t)` | Lean derivative value correct; at `t = −¼` the rpow is not differentiable, so `0 ≤ t` suffices | padding, R08 |
| `−(R_min/2)W ≤ 3W/(1+4t)` | needs `W ≥ 0` | `−R_min/2 ≤ 3/(1+4t)` | the README states `W ≥ 0` | none |
| `A′ ≤ −4π − (ρ/2)A` for a minimal sphere (P9) | Gauss equation in dim 3 | `d/dt Area = −∫(R − Ric(ν,ν)) = −∫(R/2 + K_M(TΣ))`, `K_M(TΣ) = K_Σ − κ₁κ₂ ≥ K_Σ` on a minimal surface, `∫K_Σ = 4π` | matches MT Lemma 18.11 (branch points only help) | none |
| `D⁺W ≤ −2π − (R_min/2)W` | same computation on disks, `χ(D²) = 1` | `∫_D K = 2π − ∫_{∂D} k_g` | MT Prop 18.18, Perelman `perelman03b` line 45 | none |
| standard cap profile (P6) | tip `f = 2 sin(r/2)`; cylinder `f = √2` | radial `−f″/f = ¼`, tangential `(1−f′²)/f² = ¼`; cylinder tangential `½`, radial `0`, `R = 2·½ = 1`; `f(r) = √2` at `r = π/2` with `f′ = 1/√2`, so the tip interval must end before `π/2` (README allows `r_tip` free) | consistent with MT Def 12.1; `S²(√2)` collapses at `t = 1`, matching `T = 1` | none |
| surgery volume loss `c h³/δ` (P7) | half a `δ`-neck of scale `h` | length `δ⁻¹h`, cross-section area `≈ 8πh²`, removed `≈ 8πδ⁻¹h³`, cap sewn in `≤ (1+ε)Kh³` with `δ < K⁻¹` | README's bound is correct; MT's text has `h²` (source issue below) | none |
| orientable cylinder quotient (P4) | `(x,z) ↦ (−x,−z)` on `S²×ℝ`; `RP²×ℝ` | antipodal map on `S²` reverses orientation, `z ↦ −z` reverses, composite preserves; `RP²×ℝ` nonorientable | the two quotient branches and the orientability exclusion are right | none |
| two-dimensional κ-solutions (P4) | `S²`, `RP²` | MT Thm 9.4 (orientable: round `S²`), Cor 9.50(3) (compact round surfaces) | "round spheres or free isometric quotients" | none |
| `π₂(Λ₀M, const) ≅ π₃(M)` (P9) | fibration `ΩM → ΛM → M` with the constant-loop section; `π₂(M) = 0` | `π₂(ΛM) ≅ π₃(M) ⊕ π₂(M) = π₃(M)`; for simply connected `M`, `ΛM` is connected | true; cf. MT line 19483 | none |
| closed simply connected 3-manifold homology (P1) | `H₁, H₂, H₃, π₂, π₃` | `H₁ = π₁^{ab} = 0`; orientable, `H₂ ≅ H¹ = 0`, `H₃ ≅ ℤ`; Hurewicz `π₂ = 0`, `π₃ ≅ H₃ ≅ ℤ` | correct | none |
| no two-sided `RP²` in an orientable 3-manifold (P1) | two-sided hypersurface | normal bundle trivial, so `RP²` would be orientable | correct; MT Thm 18.1 line 18690 | none |
| short-loop criterion `ζ(g)` (P9) | loops shorter than the injectivity radius | each loop has a canonical null-homotopy varying continuously in the loop | correct | none |
| Shi local estimate hypotheses (P2) | compare with MT Thm 3.28 | `T ≤ A/K`, `|Rm| ≤ K` on `B_{g(0)}(p,r) × [0,T]`, conclusion on `B(p,r/2)`, `C(n,k,K,A,r) t^{−k/2}` | identical | none |
| ε-cap topology (P5) | ball, punctured `RP³` | MT Def 9.72(1) | identical | none |
| Lemma 19.15 growth bound | `n ≥ 3`, degree-one ramps | `dμ/dt ≤ (2n−1) max|Rm| μ`, independent of `λ` | matches P10 line 566–569 | none |

## Not verifiable

- A. J. S. Hamilton, *The triangulation of 3-manifolds*, Q. J. Math. 27 (1976), "Theorem 2(1)"
  (README line 772): the DOI landing page (Oxford) returns 403; no legal copy found. Cited by
  locator only.
- S. Cairns, Ann. Math. 41 (1940), "Theorem III" (line 775): JSTOR, paywalled. Cited by locator only.
- E. Moise, GTM 47, Chapters 35–36 (line 770): Springer, paywalled (`moise77` uncertified). The
  GeometricTopology extract on main quotes Theorems 35.3 and 36.2 from printed pp. 252–253, which
  agrees with the chapter range.
- Chow–Knopf, Surv. 110 (line 735); Chow et al., Surv. 144 "Chapter 15" (line 740) and Surv. 163
  "Chapter 26" (line 745): AMS e-books, paywalled; the chapter attributions were not checked.
- The seeded sample: the worker's sample found no target by heading (the README has no `### k.n`
  headings); I checked instead every explicit locator in the README (lines 199, 516, 568, 751,
  763–775) and the fifteen Morgan–Tian statements listed under R05.

## Source issues

- **Misprint** in mt07 at Lemma 17.12, proof, printed p. 410 (line 18632): the source says that
  removing half a δ-neck of scale h lowers the volume by at least δ⁻¹h²/2; it should be δ⁻¹h³/2,
  volume scaling as the cube of the scale; affects nothing (only a positive lower bound is used).
- **Error** in mt07 at Lemma 19.7 and Corollary 19.10, Section 19.2, printed pp. 441–445: the
  source's evolution equation for the curvature of a curve under curve shortening in a Ricci flow
  omits the time derivative of the Levi-Civita connection, so the total-curvature bound lacks a
  term linear in the curvature; it should include that term, making the bound depend on the
  initial length as well; affects the proof (the application to a compact family survives);
  corrected in print at Morgan–Tian, *Correction to Section 19.2*, arXiv 1512.00699.
