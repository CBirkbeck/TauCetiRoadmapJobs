# Review of Poincare3D (pull request #1740 at b76a731)

**Verdict:** needs changes

No blocking finding. The push gate passes at this head, the previous review's three findings are
repaired, and every value I computed agrees with the roadmap (table under *Verified sound*).
Four P3 requests remain: the HopfRinow link now points where the roadmap is not on main (R01),
1.1 re-proves the compact-support lemma AlgebraicTopology Stage 6 already owns (R02), the
topological homotopy-equivalence adapter named in 15.2 is statable at the pin and absent from
`Suggested.lean` (R03), and the Lean file lacks its layer section comments (R04).

**Repair status of the previous review's findings (r5 at 81c2de1).**

- R01 (Mathlib's own statements of the headlines not cited): repaired. `README.md` lines 48–56
  name `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere`
  (`Mathlib/Geometry/Manifold/PoincareConjecture.lean`) and the two `proof_wanted` statements of
  `Wanted/Geometry/Manifold/PoincareConjecture.lean`, saying that `Wanted` "records the desired
  statements and does not supply their proofs"; lines 1557–1562 (15.1) match each endpoint to its
  wanted statement; the new 15.2 (lines 1579–1620) derives `SimplyConnectedSpace M` and
  `CompactSpace M` from `M ≃ₕ 𝕊³` through the new noncompact-vanishing target of 1.1 (lines
  194–209, Hatcher Proposition 3.29); `Suggested.lean` lines 59–62 state
  `poincare_3d_smooth_homotopyEquiv : NonemptyDiffeomorphSphere M 3` under `[TopologicalSpace M]
  [T2Space M]` only, which is exactly Mathlib's predicate at `n = 3` (its body, printed at the pin:
  `∀ (ChartedSpace ℝ³ M), IsManifold (𝓡 3) ∞ M → M ≃ₕ 𝕊³ → Nonempty (M ≃ₘ⟮𝓡 3, 𝓡 3⟯ 𝕊³)`); the
  module docstring (lines 10–15) names the three Mathlib statements. The mathematics of the
  adapter is sound (table rows below). One consequence is R03.
- R02 (14.1's single `*Needs:*` line put the far-horizon comparison on the headline's path):
  repaired. Lines 1441–1489 are "14.1. Smooth atlas on a closed topological three-manifold"
  (`*Needs:* GeometricTopology Layers 1 and 11, including Moise Theorem 35.3; Cairns, Theorem
  III; native manifold and realization APIs`), lines 1491–1522 "14.2. Compatibility with a
  prescribed PL structure" (`*Needs:* 14.1; … Moise Theorem 36.2; … comparison, item 1 (smooth
  implies PL; Munkres Theorem 10.6)`), each with API and three Checks; the build table (line 168),
  the `## How to read the build` sentence (172–175), the Layer 14 Dependencies (1531–1534), the
  supplier table (62) and the `**From Tau Ceti.**` paragraph (76–81) say which target consumes
  what, and 15.1 consumes 14.1 only (line 1540, 1578).
- R03 (`poincare_3d_topological` not named in the README): repaired, line 1543.

## R01 (P3) — locator: the HopfRinow link points where the roadmap is not on main

Location: `TauCetiRoadmap/Poincare3D/README.md` line 64 (`[HopfRinow](../HopfRinow/README.md),
Layers 0–4`).

Claim: the link was `../../Completed/HopfRinow/README.md` at the previous head and now reads
`../HopfRinow/README.md`.

Witness: on main (ffac513) the roadmap is `Completed/HopfRinow/README.md`; commit 8e789309
deleted `TauCetiRoadmap/HopfRinow/README.md`. The pull request's base predates that move, so the
new link resolves in this branch and dangles after merge. GeometricCurrents line 18 and
OptimalTransport line 903 on main link `../../Completed/HopfRinow/README.md`.

Repair: restore `[HopfRinow](../../Completed/HopfRinow/README.md), Layers 0–4`. The cited
layers exist there (Layers 0–4 at `Completed/HopfRinow/README.md` lines 229–495).

## R02 (P3) — duplication: 1.1 re-proves the compact-support lemma AlgebraicTopology Stage 6 owns

Location: `README.md` lines 196–202 ("Follow Hatcher, §3.3, Lemma 3.27 and Proposition 3.29,
p. 239: prove compact-support local-class detection using finite chart covers, then use
connectedness and a point outside a cycle's compact support …").

Claim: the first half of that route, Hatcher's Lemma 3.27 (for compact `K ⊂ M`, the unique
class in `H_n(M, M∖K)` with prescribed local images, and `H_i(M, M∖K) = 0` for `i > n`), is
written as built here.

Witness: `TauCetiRoadmap/AlgebraicTopology/README.md` on main, Stage 6 item 3 (lines
1180–1514): it defines the local system `or_U(x) = H_m(U, U∖{x}; ℤ)`, owns "the induced maps
on local homology, orientation systems, sections and compact classes … compact-support
uniqueness" (lines 1195–1200, 1319), and deduces "`H_i(U;L)=0` for i>m by compact support of
singular cycles and the pair/triple sequence (the route of Proposition 3.29)" (lines
1511–1513). What main does not state is the top-degree step for connected noncompact `M`
(`H_n = 0`): grep for `i≥n`/`i ≥ n` on main returns nothing, so that step is rightly 1.1's.

Repair: in 1.1 replace "prove compact-support local-class detection using finite chart covers,
then" by "consume AlgebraicTopology Stage 6 item 3's compact-support uniqueness (the unique
class in `H₃(M, M∖K; ℤ)` with given local images, for compact `K`) and its vanishing above the
dimension, then"; keep the sentence that follows (connectedness and a point outside the compact
support kill the local images, hence the class) as the step built here, and add "Stage 6 item 3"
to 1.1's `*Needs:*` line. If AlgebraicTopology's statement carries a hypothesis 1.1's Hausdorff
charted manifold lacks, say so in one clause and keep only that restatement.

## R03 (P3) — README and Lean: the topological homotopy-equivalence adapter is statable and absent

Location: `README.md` lines 1595–1598 ("Apply 15.1 in the topological presentation to prove the
dimension-three case of the wanted contract `ContinuousMap.HomotopyEquiv.nonempty_homeomorph_sphere`
in `Wanted/Geometry/Manifold/PoincareConjecture.lean`"); `Suggested.lean` lines 59–62.

Claim: 15.2 names two Mathlib-form endpoints; the file states the smooth one and not the
topological one, although every carrier of the latter exists at the pin.

Witness: `Wanted/Geometry/Manifold/PoincareConjecture.lean` lines 28–29 at the pin:
`[T2Space M] (n : ℕ) [ChartedSpace ℝⁿ M] : M ≃ₕ 𝕊ⁿ → Nonempty (M ≃ₜ 𝕊ⁿ)`; at `n = 3` it uses
only `ContinuousMap.HomotopyEquiv`, `ChartedSpace`, `Homeomorph` and `Metric.sphere`, all
present (the smooth sibling elaborates in the same file). It follows from
`poincare_3d_topological` once 1.1's compactness and simple-connectedness detection is in hand,
which is what 15.2 says. I rate it P3, as the previous review rated the smooth adapter, because
it is a corollary of two declarations already in the file.

Repair: add after line 62

    /-- Target 15.2: the topological Poincaré adapter for a homotopy-equivalent sphere
    (Mathlib's wanted `ContinuousMap.HomotopyEquiv.nonempty_homeomorph_sphere` at `n = 3`). -/
    theorem poincare_3d_topological_homotopyEquiv {M : Type*} [TopologicalSpace M] [T2Space M]
        [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] :
        M ≃ₕ sphere (0 : EuclideanSpace ℝ (Fin 4)) 1 →
          Nonempty (M ≃ₜ sphere (0 : EuclideanSpace ℝ (Fin 4)) 1) := by
      sorry

and name `poincare_3d_topological_homotopyEquiv` at line 1597 of 15.2 (`≃ₕ` is
`ContinuousMap.HomotopyEquiv`'s notation, open in the file through `Mathlib`).

## R04 (P3) — form: `Suggested.lean` states targets of three layers without layer section comments

Location: `TauCetiRoadmap/Poincare3D/Suggested.lean` lines 33, 40, 48, 59 (docstrings "Layer
13:", "Target 14.1:", "Layer 15:", "Target 15.2:").

Claim: the house form asks, where the file states targets of several layers, for
`/-! ## Layer k: <title> -/` section comments in README order; the file has none.

Witness: the file's declarations belong to Layers 13, 14 and 15 of the README (lines 1383,
1439, 1536); no `/-! ## Layer` line exists (`grep -n '/-! ## Layer' Suggested.lean` is empty).

Repair: insert `/-! ## Layer 13: Factor classification and the smooth endpoint -/` before line
33, `/-! ## Layer 14: Compatible smoothing in dimension three -/` before line 40 and
`/-! ## Layer 15: Topological endpoint and transport -/` before line 48 (the 15.2 adapter stays
under Layer 15).

## Verified sound

**Gate, diff and dependency check.** The worker's gate at b76a731: `set_option=0 blob=0 latex=0
tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0
mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0
empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0
stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. `git diff --stat
origin/main...HEAD -- . ':!TauCetiRoadmap/Poincare3D'` is empty; the folder holds `README.md`,
`Suggested.lean` and `metadata.toml` (`topic = "math.GT"`). A scan of the README for process
words (so far, checkpoint, handoff, round labels, pull request, optional, deferred, LaTeX
delimiters) finds none; `Suggested.lean` has no `lemma`, `set_option`, `#eval` or `#print`. The
dependency check with the candidate order and `--movable`:

    depcheck: 242 roadmaps, 2368 edges, 0 problem(s)

No UPWARD or CYCLE line. The candidate order lists Poincare3D (line 205) directly after
RicciFlow (line 204), its only supplier not on main; RicciFlow's head is unchanged since the
previous review (fff2322c, 2026-11-01).

**Elaboration and signatures.** A scratch copy of `Suggested.lean` with `#check @name` for the
four declarations and the Mathlib declarations the README names, `#print` of the Mathlib
predicate, and one-tactic probes, elaborated with `lake env lean` in 7 s: the only warnings on
the roadmap's declarations are the three `sorry`s (lines 12, 18, 35 of the copy). Each elaborated
type equals the worker's `signatures.md` entry; no section binder is lost
(`poincare_3d_smooth_homotopyEquiv` keeps `TopologicalSpace`, `T2Space` and nothing else, as the
predicate requires). The README's generality equals the Lean's (lines 16–21, 1409–1414,
1459–1463, 1540–1544, 1590–1595). Probes: `infer_instance`, `simp`, `exact ⟨Diffeomorph.refl _ _ _⟩`
and `exact ⟨_, inferInstance⟩` fail on `poincare_3d_smooth` and `smoothable_closed_three_manifold`
("probe1 open", "probe2 open"); on `poincare_3d_smooth_homotopyEquiv`, `simp [NonemptyDiffeomorphSphere]`
only unfolds the definition and leaves the goal, `exact fun _ _ _ => ⟨Diffeomorph.refl _ _ _⟩` fails;
even for `M = 𝕊³` the goal is not closed by the identity diffeomorphism, because the predicate
quantifies over every charted structure on `M`, not the standard one. No padding.

**Headlines.** The README's headline theorems: the smooth Poincaré theorem (13.1), smoothing of
closed topological three-manifolds (14.1), the topological Poincaré theorem (15.1), Mathlib's
homotopy-equivalence forms (15.2), surgery-flow existence (7.2), finite extinction (11.2),
reconstruction (12.1). The first three and the smooth form of the fourth are stated; the
topological form of the fourth is R03; the last three are named in the module docstring (lines
17–23) as not statable, with the carriers each lacks (a time-dependent metric family, reduced
geometry, a surgery flow), none of which exists at the pins.

**Library declarations opened at the pins (Tau Ceti 358314d4, Mathlib f6090c70).**
`ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere` (`Mathlib/Geometry/Manifold/PoincareConjecture.lean`
line 41; the `Wanted` statements at `Wanted/Geometry/Manifold/PoincareConjecture.lean` lines
28–40, outside the `Mathlib` module, which is why the worker's citation check lists the two names
as found nowhere: expected, and the README says so); `ContinuousMap.HomotopyEquiv.simplyConnectedSpace`
(elaborated: `[SimplyConnectedSpace Y] (e : HomotopyEquiv X Y) : SimplyConnectedSpace X`, the
transport 15.2 uses); `Diffeomorph.toHomeomorph`; `ChartedSpace.secondCountable_of_sigmaCompact`
(`[SecondCountableTopology H] [SigmaCompactSpace M] → SecondCountableTopology M`, as lines 46–47
and 14.1 use); `HomotopyGroup.Pi`; `Bundle.ContMDiffRiemannianMetric`
(`Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean`); `TauCeti.TriangulationConjecture`
(`TauCeti/Topology/TriangulationConjecture.lean` line 74), `TauCeti.IsTriangulable`
(`TauCeti/Topology/Triangulable.lean` line 40), `TauCeti.GeometrizationConjecture`
(`TauCeti/LowDimTopology/Geometrization.lean` line 144), `HomotopyGroup.pathLoopSpaceMulEquiv`
(`TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean` line 361).

**Cross-roadmap citations resolved** (every one, on main at ffac513 or at the open head named).
GeometricTopology: Layer 1 (lines 177–288; connected sum takes the ball embeddings, independence
from the disc theorem, Hirsch Theorem 6.6, lines 223–230 and the extract
`references/hirsch-disc-theorem.md`, "Locus" line: Theorem 6.6, Chapter 4 §6, printed p. 117),
Layer 2 (289), Layer 7 (627), Layer 8 (696; lines 738–740 name the Poincaré conjecture as the
instance of its geometrization statement), Layer 11 (831; Moise 35.3 at printed p. 252 and 36.2
at p. 253 through `references/moise-triangulation-dim3.md` lines 3, 19, 27), the
smoothing-and-triangulation comparison (930–952; item 1 is smooth implies PL, Munkres) and
`references/munkres-smoothing-triangulations.md` (Theorem 10.5 p. 103, Theorem 10.6 pp. 103–104,
lines 3, 46, 54). AlgebraicTopology Stages 1–3, 6 and 8 (lines 289, 326, 471, 946, 1602), Stage 6
item 3 local homology (1180; R02), 8.11a `basedLoopCWType` (1949–1950). DifferentialGeometry
Layers 0–3, 5–10, 12 (268–910). HopfRinow Layers 0–4 (`Completed/HopfRinow/README.md`, R01).
RiemannianGeometry R1 (179), R4.9 (802, curve shortening on a fixed two-sphere, as lines 83–84
say), R5a (1044), R7.0 (1295). PDE: its targets carry the lane letters A1–A7, C12–C15, D16–D19,
E, F27.x (lines 677–2616). ComplexKahlerGeometry K5a (33). GeometricMeasureTheory G1–G2 (106,
148). RicciFlow at fff2322: R1.1–R5.6 (lines 169–1070), Scope excluding surgery and naming
Poincare3D as the consumer of its convergence theorems (71–72), `## Downstream consumers` naming
Poincare3D for Layers 1–5 (1655–1660).

**Ownership.** `roadmaps grep` over the 460 open pull requests and main (index of 2026-11-06):
"Ricci flow with surgery" (only RicciFlow, which excludes it), "finite extinction" (only
RiemannianGeometry's moving-disk formula), "reduced volume" and "canonical neighbo" (only
unrelated symplectic and perfectoid uses), "Cairns" (GeometricTopology's comparison item 1 on
main and in its revision pull request #903: Cairns–Whitehead, smooth implies PL, not
dimension-three smoothing), "NonemptyDiffeomorphSphere" (HomotopySpheres at its open head, lines
419–422, cites the predicate for its dimension ≥ 5 recognition theorem with explicit compactness;
no `n = 3` statement), "nonempty_homeomorph_sphere" (MorseTheory's two-critical-point theorem, a
different hypothesis), "Proposition 3.29" (AlgebraicTopology's revision pull request #1663, lines
1383–1389, plans the general-`n` noncompact vanishing; a revision of an on-main roadmap is not a
supplier, and main does not state it, so 1.1's dimension-three corollary is the first owner
among citable texts; when that revision merges, 1.1's statement becomes a citation). The
GeometricTopology revision #903 (Layer 11.2, lines 12747–12760) also plans Moise's theorems and
a PL-compatible smoothing of three-manifolds; it is not citable for the same reason, and the
pull request's description acknowledges the coordination. Ownership against open pull requests
was checked through the sibling checkouts and the grep index.

**Sources read.** Cache ids: `mt07` = Morgan–Tian, Clay text (printed page = PDF page − 43);
`mt15` = arXiv 1512.00699v1; `hatcherAT` = Hatcher, *Algebraic Topology*, author-page text
(printed page = PDF page − 9). Locators checked at the text this round; the fifteen seeded
sample targets are marked *:

- 1.1*: Hatcher Theorem 1.20 (line 1956), 3.30 (10453), 4.5 at §4.1 printed p. 346 (15109; PDF
  page 355), 4.32 (15961); Lemma 3.27 (10255–10259: compact `A`, unique class in `H_n(M|A)`
  with given local images, `H_i(M|A) = 0` for `i > n`); Proposition 3.29 (10370–10385, PDF page
  248 = printed p. 239: connected noncompact `n`-manifold, `H_i(M;R) = 0` for `i ≥ n`; the proof
  takes an open `U ⊃ image(z)` with compact closure and uses Lemma 3.27 and the triple
  `(M, U ∪ V, V)`); Hatcher's manifold (10022–10024) is a Hausdorff space locally homeomorphic to
  `ℝⁿ`, with no countability, so lines 201–203 are right.
- 1.2*, 5.1*: Definitions 9.72–9.78 (11304–11400: `(C,ε)`-cap, Remark 9.73, Claim 9.74,
  `C`-component, `ε`-round, canonical neighbourhood, evolving `ε`-neck); Theorem 9.93
  (11800–11833, the seven cases with `RP² × ℝ` as (7)), Corollaries 9.94–9.95 (11835–11844, the
  latter under "no embedded `RP²` with trivial normal bundle").
- 2.2: Theorems 3.27–3.29 (3767–3817: 3.28 is the parabolic-ball form the README states,
  `T ≤ α/K`, bound on `B(p,0,r/2)`, `C_k t^{−k/2}`; 3.29 the initial-derivative form with
  `t^{−max(k−l,0)/2}`).
- 2.3: Definition 4.10 (4519–4525), Theorem 4.26 (4894–4900), Theorem 4.37 (5088–5093),
  Corollary 4.39 (5099–5103).
- 2.4: Theorems 5.11 (5450), 5.15 (5531–5542).
- 3.1*: Theorem 7.26 (8527–8541: complete bounded-curvature flow, unnormalized reduced volume
  `≤ (4π)^{n/2}`, non-increasing in `τ`, limit `(4π)^{n/2}` as `τ → 0`, which is the
  conversion the Conventions name).
- 3.2: Definitions 14.1 (15804) and 14.8 (16050).
- 3.3*: Theorem 8.1 (8640–8650, `κ(τ₀, l₀, V, n)`), Theorem 8.10 (8937–8942, `|Rm(p,0)| ≤ 1`,
  `Vol B(p,0,1) ≥ ω`, `T ≤ T₀`, conclusion `Vol B(p,t₀,r) ≥ κr³`).
- 4.1–4.2: Definitions 9.1–9.2 (9033–9045), Theorem 9.4 (9055), 9.42 (10237–10241), Corollary
  9.50(3) (10571), Proposition 9.58 (10887), Theorem 9.59 (10941).
- 5.2*: Theorem 10.2 (11893–11903), Assumptions 11.18 and Theorem 11.19 (13213–13239).
- 6.1*: Definition 12.1 (13730–13740: complete, `Rm ≥ 0`, `SO(3)`-invariant, isometric to
  `S²(R = 1) × ℝ₊` off a ball, constant curvature `1/4` near the tip), Theorem 12.5
  (13857–13870: uniqueness, `T = 1`, positive curvature, asymptotics).
- 6.2*: Proposition 15.3 (16351–16395), Definition 15.8 (16595), Lemma 15.11 (16652–16659).
- 7.1–7.2: Theorem 15.9 (16610–16623), Corollary 15.10 and its proof (16626–16646: any metric
  is scaled to a normalized one, Proposition 4.11 gives the first epoch, 15.9 extends; so the
  README's "every normalized initial metric" is what the proof gives), Lemma 17.12 (18612–18618).
- 8.1: Definition 18.2 (18865–18870), §18.3 (19311).
- 9.1*: Claim 18.16 (19326–19340); 9.2*: Definition 18.17 (19341–19350: Lipschitz spanning disks,
  boundary up to reparametrization, `W(Γ) = max A`, `W(ξ) = inf` over all not necessarily based
  families), Lemma 19.2 (19634–19640).
- 9.3: Morrey, Hildebrandt, Jost: not readable (below).
- 9.5*: Lemmas 18.10 (19096–19100) and 18.11 (19168–19173, `dW₂/dt ≤ −4π − ½R_min W₂`).
- 9.6: Lemma 18.27 (19511–19514), Corollary 18.28 (19532–19534), both printed p. 434.
- 10.1*: §§19.1–19.2 (19596–19620: the geometric equation `∂c/∂t = H = ∇_S S`, reparametrization
  invariance, Claim 19.1 local existence) and mt15 lines 10–34 and 119–130 (the corrected
  Lemma 19.7 carries the extra terms `2Ric(S,S)Ric(H,H) − 2(∇_S Ric)(S,H)`, the second linear in
  `k`, so the total-curvature constant depends on the initial length; no effect on the compact
  family).
- 10.2*: Lemma 19.15 (20137–20144, `n ≥ 3`, degree-one ramps, `dμ/dt ≤ (2n−1) max|Rm| μ`),
  Corollary 19.16 (20227–20231, exponent independent of `λ`), Proposition 18.24 (19470–19478),
  Lemma 19.31 (20823–20830).
- 11.1*: Proposition 18.18 (19375–19384: forward difference quotients, continuity off surgery
  times, `W_ξ(t) ≤ liminf` at surgery times).
- 11.2: Theorem 18.1 (18688–18695).
- 12.1: Corollary 15.4(1) (16402–16405).
- 13.1*, 15.1: Corollary 0.2(a) (314–315); Hirsch 6.6 and Munkres 10.5–10.6 through the
  GeometricTopology extracts.
- 14.1*: Moise 35.3 (printed p. 252) and 36.2 (p. 253) through the GeometricTopology extract;
  Cairns, Theorem III: not readable (below).

**Adversarial table.** Values computed on each side; rows marked † cover passages this head
changed.

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `poincare_3d_smooth` | `M = S³`; `S¹×S²`, `RP³`, Poincaré sphere; `∅`; `S³ ⊔ S³`; `ℝ³`; a non-Hausdorff charted space | identity; `π₁ = ℤ, ℤ/2, I*` (order 120) fail `SimplyConnectedSpace`; `SimplyConnectedSpace → PathConnectedSpace → Nonempty` excludes `∅`; the disjoint union is not path-connected; `ℝ³` is not compact; `T2Space` fails | each counter-instance excluded by a hypothesis; binders equal Mathlib's wanted `nonempty_sdiffeomorph_sphere_three` | none |
| `smoothable_closed_three_manifold` | `S³`; `S³ ⊔ S³`; `∅` | standard atlas; componentwise atlas (compact and locally connected give finitely many clopen components, lines 1467–1469); on `∅` every chart condition vacuous | true without `ConnectedSpace` | none |
| `poincare_3d_topological` | the proof term | `Diffeomorph.toHomeomorph` at `n = ∞` on the atlas 14.1 supplies | no `sorry` of its own; binders equal the wanted `nonempty_homeomorph_sphere_three` | none |
| † `poincare_3d_smooth_homotopyEquiv` (unfolded: `∀ atlas, IsManifold → M ≃ₕ 𝕊³ → Nonempty diffeo`) | `S³` with an arbitrary smooth atlas; `ℝ³`; `S¹×S²`; `∅`; `S³ ⊔ S³`; a point; the long line | Cor 0.2(a) applies to any closed simply connected smooth three-manifold, so any atlas on `S³` is diffeomorphic to the standard one; `H₃(ℝ³) = 0 ≠ ℤ`, premise false; `π₁(S¹×S²) = ℤ ≠ 0`; no map `S³ → ∅`; `π₀` has two elements, premise false; a point admits no `ChartedSpace ℝ³` (open subsets of `ℝ³` are infinite); the long line is noncompact, so `H₃ = 0` by Proposition 3.29 without countability, premise false | exact Mathlib predicate at `n = 3`; true under 13.1 and 1.1 | none |
| † 1.1 noncompact vanishing (`M` connected Hausdorff, locally `ℝ³`, noncompact ⇒ `H₃(M;ℤ) = 0`) | `ℝ³`; `S² × ℝ`; `S³ ∖ {pt}`; `S³` (compact); `S³ ⊔ ℝ³` (disconnected) | `H₃ = 0, 0, 0` (contractible, `≃ S²`, `≅ ℝ³`); `H₃(S³) = ℤ` so compactness is needed; `H₃(S³ ⊔ ℝ³) = ℤ ≠ 0` so connectedness is needed and the README states it (line 194) | matches Hatcher 3.29 at `n = 3`, `R = ℤ`; the Check at line 227 is the right negative control | R02 (cite the lemma) |
| † 15.2 compactness and simple connectedness from `M ≃ₕ 𝕊³` | `M ≃ₕ S³`; `ℝ³ ≃ₕ point` | `π₁(M) ≅ π₁(S³) = 0`, `M` path-connected, `H₃(M) ≅ ℤ`, so `M` compact by the previous row; for the point, `H₃ = 0` on both sides and `ℝ³` is noncompact, which is what the third Check (lines 1611–1613) says | adapter derivable from 1.1's suppliers; AT Stage 1 gives `π₁(S³) = 0`, Mathlib transports it (`HomotopyEquiv.simplyConnectedSpace`) | R03 (state the topological form) |
| † 14.1 absolute smoothing | `S³`; two spheres; `∅`; a compact charted `T2` carrier | compact + `ChartedSpace ℝ³` ⇒ σ-compact ⇒ second countable (`secondCountable_of_sigmaCompact`), and compact Hausdorff second countable ⇒ metrizable, so Moise's hypotheses hold; Moise 35.3 gives the triangulation, Cairns III an analytic atlas on the triangulated carrier, pulled back along the homeomorphism to `M`'s own topology; componentwise and vacuous on `∅` | route sound; the Lean headline needs only Moise 35.3 and Cairns III (`*Needs:*` line 1485–1486) | none |
| † 14.2 PL compatibility | `(M,P)` PL, `S` the Cairns structure, `T` a smooth triangulation of `(M,S)` with PL structure `P′` | Munkres 10.6 gives `T`; Moise 36.2 on `id : |K_P| → |K_{P′}|` gives a PL homeomorphism `h : (M,P) → (M,P′)`; `h*S` is smooth on the carrier `M` and `P`-compatible because `S` is `P′`-compatible; the three Checks (pullback compatibility, PL homeomorphism of triangulations, original topology) are the three facts used | route sound; off the headline's path | none |
| closed simply connected 3-manifold (1.1) | `H₁, H₂, H₃, π₂, π₃`; Poincaré sphere; `S²×S¹` | `H₁ = π₁^{ab} = 0`; `w₁ = 0`; `H₂ ≅ H¹ = 0`; `H₃ ≅ ℤ`; Hurewicz `π₂ = 0`, `π₃ ≅ H₃ ≅ ℤ`; Poincaré sphere: `I*` perfect so `H₁ = 0`, `H₂ = 0`, `H₃ = ℤ`, `π₁ ≠ 0`; `π₁(S²×S¹) = ℤ` | correct; Checks discriminate | none |
| round models (1.2) | unit `S³`; antipodal quotient; `S²`-bundles over `S¹` | `R = n(n−1) = 6`; `π₁(RP³) = ℤ/2`; two bundles, the orientable one is `S²×S¹` | correct | none |
| normalized metric scaling (1.3) | `g ↦ Qg`, `Q ≥ 1`, `r ≤ 1`; collapsed flat torus | `vol_{Qg} B(x,r) = Q^{3/2} vol_g B(x, r/√Q) ≥ Q^{3/2}·½ω₃ (r/√Q)³ = ½ω₃ r³`; `|Rm|_{Qg} = Q⁻¹|Rm|_g`; `ν_{Qg} = Q⁻¹ν_g ≥ −1`; flat `T³` with a circle of length `ℓ`: `|Rm| = 0`, `vol B(x,1) ≤ Cℓ → 0` | all three conditions survive; the negative Check is right; matches Definition 4.10 (`ω_n/2`, `r ≤ 1`) | none |
| Shi (2.2) | compare with Theorem 3.28; `k = 0`; `t → 0` | `T ≤ A/K`, `|Rm| ≤ K` on `B_{g(0)}(p,r)×[0,T]`, bound on `B(p,r/2)`, `C(n,k,K,A,r) t^{−k/2}`; `k = 0` gives the outer bound back; `t^{−k/2} → ∞` for `k ≥ 1` | identical to the source | none |
| `R_min ≥ −6/(1+4t)` (2.3) | `r(t) = −6/(1+4t)` against `r′ = ⅔ r²`, `r(0) = −6` | `r′ = 24/(1+4t)²`; `⅔ r² = ⅔·36/(1+4t)² = 24/(1+4t)²`; `ν(0) ≥ −1 ⇒ R(0) = 2(λ+μ+ν) ≥ −6` | comparison function exact; Theorem 4.26(1) | none |
| Hamilton–Ivey (2.3) | hyperbolic `K ≡ −1`, `g(t) = (1+4t)g₀` | `Ric(g₀) = −2g₀`, so `∂ₜg = 4g₀ = −2Ric` is a Ricci flow; `ν = −1/(1+4t)`, `R = −6/(1+4t)`; `t = 0`: RHS `= 2·1·(0+0−3) = −6 = R`; `t > 0`: RHS `= (2/(1+4t))(log(1+t) − log(1+4t) − 3) < −6/(1+4t)` | equality at `t = 0`, strict after; Theorem 4.26(2) exact | none |
| Harnack (2.3) | shrinking cylinder, `R = 1/(1−t)`, `V = 0` | `∂ₜR = 1/(1−t)² > 0` | consistent with Cor 4.39 | none |
| reduced volume (3.1, Conventions) | static `ℝⁿ` | `l = |x|²/4τ`; `∫(4πτ)^{−n/2} e^{−|x|²/4τ} dx = 1`; without `(4π)^{−n/2}`: `τ^{−n/2}(4πτ)^{n/2} = (4π)^{n/2}`, Theorem 7.26's bound and limit | both Checks exact | none |
| noncollapse (3.3) | Euclidean balls; `S³/Γ`; flat `T² × S¹_ℓ`, `ℓ → 0` | `vol B = ω_n rⁿ`; volume `2π²/|Γ|` so `κ` depends on `|Γ|`; `vol B(x,1) ≤ Cℓ → 0` with `|Rm| = 0` | Checks discriminate | none |
| ancient κ-solution (4.1) | round shrinking `S³`; flat `ℝ³`; `S³ ⊔ S³`; Definition 9.2 | round: nonflat, `Rm ≥ 0`, `R = 6/(c−4t) > 0`, κ-noncollapsed; flat fails nonflat and `R > 0`; disjoint union fails connected; `R > 0` follows from nonflat and `Rm ≥ 0` by the strong maximum principle, so the class equals Definition 9.2's | same class as the source | none |
| cylinder quotients (4.2) | `(x,z) ↦ (−x,−z)`; `RP² × ℝ` | antipodal on `S²` has degree `−1`, `z ↦ −z` reverses, composite preserves orientation; `RP² × ℝ` nonorientable; the twisted quotient is a punctured `RP³` (Theorem 9.93(5)) | branches and the exclusion right | none |
| canonical neighbourhoods (5.1) | exact cylinder; ball cap; punctured `RP³`; `RP² × ℝ` | `R = 1` on the scalar-one cylinder; both caps have a neck end (Def 9.72(1)–(2)); `RP² × ℝ` is Theorem 9.93(7), excluded by Cor 9.95's hypothesis, which orientability gives | Checks discriminate | none |
| standard cap (6.1) | tip `f = 2 sin(r/2)`; cylinder `f = √2`; `f(0) > 0` | radial `−f″/f = ¼`, tangential `(1−f′²)/f² = ¼`; cylinder: Gaussian curvature of `S²(√2)` is `½`, radial `0`, `R = 2·½ = 1`; `f = √2` at `r = π/2` with `f′ = 1/√2`, so `r_tip < π/2` and a concave bridge with `f′ ↓ 0` exists; `f(0) > 0` gives a conical origin | consistent with Def 12.1 | none |
| surgery topology (6.2) | empty neck collection; separating neck; `RP³ # RP³` | identity; two capped children sharing the common region; the double-capped tube is the multi-cap clause (line 16369) | matches Prop 15.3 | none |
| boundary parameterization (6.2, 12.1) | separating neck cut at `S² × {0}`; both children oriented from the parent | the two ball embeddings agree on `S² × {0}` and lie on opposite sides, so one preserves and one reverses the parent orientation; reversing the cut glues the two boundaries by the identity of `S² × {0}` | exactly GeometricTopology Layer 1's connected-sum data | none |
| surgery data (7.1) | single epoch, no events; empty slice | a product spacetime (Definition 14.1 and Example 14.10); empty manifolds are closed, continue empty | Checks hold | none |
| volume loss `c h³/δ` (7.2) | half a `δ`-neck of scale `h` | length `δ⁻¹h`, cross-section `≈ 8πh²`, removed `≈ 8πδ⁻¹h³`, cap sewn in `≤ (1+ε)Kh³`, `δ < K⁻¹`; growth `dVol/dt = −∫R ≤ (6/(1+4t)) Vol`, so `Vol(t) ≤ Vol(0)(1+4t)^{3/2}` | correct; source misprint `h²` (below) | none |
| ancestry (8.1) | no events; separating neck; discarded component | epoch identification; each child has one parent; no descendant | Checks hold | none |
| `π₂(Λ₀M, const) ≅ π₃(M)` (9.1) | fibration `ΩM → ΛM → M`, constant-loop section; `M = S³`; `S¹ × S²` | `π₂(ΛM) ≅ π₂(ΩM) ⊕ π₂(M) = π₃(M) ⊕ 0`; `π₂(ΩM) ≅ π₃(M)` is `pathLoopSpaceMulEquiv 1`; `S³`: `ℤ`; a loop winding the circle lies in a nontrivial component (components are conjugacy classes, line 19321) | true; Claim 18.16 agrees | none |
| filling area (9.2) | constant loop; `g ↦ Qg`; winding-one ramp | area `0`; 2-Jacobian scales by `Q`; a non-nullhomotopic loop has no spanning disk | Checks discriminate | none |
| Douglas gap (9.3) | annulus pinched to two disks; equality | the pinched competitor has area `Fill(γ₀) + Fill(γ₁)`, excluded by the strict inequality; at equality no attainment conclusion | hypothesis necessary, as the Checks say | none |
| ramps (9.4, 10.2) | graph `θ ↦ (γ(θ),θ)`; `λ → 0` | circle projection has degree one, so the ramp is not nullhomotopic in `M × S¹_λ`; core-curve length `≥ λ`, so modulus bounds degenerate as `λ → 0`; Lemma 19.15's exponent `(2n−1)max|Rm|` is `λ`-free | Checks discriminate | none |
| `A′ ≤ −4π − (ρ/2)A` (9.5) | minimal sphere, dimension 3; `S² × S¹` | `∂ₜ dA = −(R − Ric(ν,ν)) dA`; with `ν = e₃`, `R − Ric(ν,ν) = 2K₁₂ + K₁₃ + K₂₃ = K_M(TΣ) + R/2`; Gauss `K_Σ = K_M(TΣ) + κ₁κ₂ ≤ K_M(TΣ)` on a minimal surface; `∫K_Σ = 2π(2 + Σ b_i) ≥ 4π` with branch orders `b_i ≥ 0`; `π₂(S²×S¹) = ℤ` | matches Lemma 18.11; branch points only help | none |
| width and short loops (9.6) | constant family; `g ↦ Qg`; loops shorter than the injectivity radius | `w = 0`; `w, W` scale by `Q`; Lemma 18.27: geodesic cones from `Γ(c)(x₀)` fill each loop, the family is homotopic to constant loops, `π₂ = 0` kills it; Corollary 18.28: `∀η ∃ζ<η/2` with length `< ζ` giving area `< η` | locators and quantifier order agree with the text | none |
| `D⁺W ≤ −2π + 3W/(1+4t)` (11.1) | needs `W ≥ 0` | `−(R_min/2)W ≤ (3/(1+4t))W` | stated with `W ≥ 0` | none |
| profile `G` (11.1) | `G = (W₀+2π)(1+4t)^{3/4} − 2π(1+4t)` | `G(0) = W₀`; `G′ = 3(W₀+2π)(1+4t)^{−1/4} − 8π`; `−2π + 3G/(1+4t) = 3(W₀+2π)(1+4t)^{−1/4} − 8π`, equal; `G < 0` once `(1+4t)^{1/4} > 1 + W₀/2π` | identity exact | none |
| integrated bound (11.2) | `u = (1+4t)^{−3/4} W` | `u′ ≤ (1+4t)^{−3/4}(−2π + 3W/(1+4t)) − 3(1+4t)^{−7/4}W = −2π(1+4t)^{−3/4}`; `∫₀ᵀ (1+4t)^{−3/4} dt = (1+4T)^{1/4} − 1`; a jump `e_j` at `t_j` adds `(1+4t_j)^{−3/4} e_j` | displayed inequality exact; `e_j = 0` is Proposition 18.18's `liminf` clause | none |
| reconstruction (12.1) | two-event prefix; terminal deletion; empty expression; a separating cut reversed | composition of two Prop 15.3 identifications; the terminal event has empty post-slice (Cor 15.4(1)); the empty connected sum is `S³` by convention with a separate nonempty initial component; reversal uses the 6.2 row's identity gluing | consistent with Cor 15.4(1) and Layer 1's definition | none |
| factor classification and `S³ # S³` (13.1) | `S³/Γ` simply connected; `S² × S¹`; `S³ # S³` with the surgery balls | `Γ` trivial, round metric gives `S³`; `π₁ = ℤ` excluded; after the disc theorem moves both balls to the standard hemisphere, `S³ − int D³₊ = D³₋`, so `S³ # S³ = D³₋ ∪_{id} D³₋′ = S³`; Hirsch 6.6 needs `det D(f₁⁻¹f₀)(0) > 0`, the orientation-compatibility clause | correct | none |
| endpoint transport (15.1) | metric versus `T2`; second countable alone | a metric space is Hausdorff; compactness and charts give second countability; second countability does not give Hausdorffness (line with two origins) | Checks discriminate | none |

## Not verifiable

- S. Cairns, Ann. Math. 41 (1940), Theorem III, p. 797, §§7–11, the convention on p. 796 (lines
  1454–1458, 1709–1712): JSTOR, paywalled; the previous round's sources request found no legal
  copy and nothing is at arXiv, Numdam, EuDML, Project Euclid or an author page. Cited by locator
  only; the page and section numbers are the author's and are unchecked.
- C. B. Morrey, Ann. Math. 49 (1948), pp. 807–851 (lines 1022, 1686–1687): JSTOR, paywalled;
  cited by locator only.
- S. Hildebrandt, Arch. Rational Mech. Anal. 35 (1969), pp. 47–82 (line 1688): the manifest
  records it `uncertified`.
- J. Jost, J. reine angew. Math. 359 (1985), pp. 37–54 (lines 1025–1026, 1691–1693): De
  Gruyter, paywalled; cited by locator only.
- A. J. S. Hamilton, Q. J. Math. 27 (1976), Theorem 2(1) (line 1707): Oxford Academic; not
  readable.
- E. Moise, GTM 47, Chapters 35–36 (lines 1446, 1498, 1704–1705): Springer, paywalled; checked
  only through the GeometricTopology extract on main, which quotes Theorems 35.3 and 36.2 from
  printed pp. 252–253.
- J. Munkres, Ann. Math. Studies 54, Theorems 10.5–10.6, pp. 103–104, and M. Hirsch, GTM 33,
  Theorem 6.6, p. 117: checked only through the GeometricTopology extracts on main.
- Chow–Knopf, Surv. 110; Chow et al., Surv. 144 "Chapter 15" and Surv. 163 "Chapter 26" (lines
  1660–1671): AMS e-books, paywalled; chapter attributions not checked.
- Perelman, arXiv math/0211159, math/0303109, math/0307245; Kleiner–Lott; Topping (lines
  1694–1703): cited without locators; nothing to check.

## Source issues

- **Misprint** in mt07 at Corollary 9.50(1), printed p. 213 (line 10565): the source says a
  two-dimensional flow satisfying the hypotheses of Proposition 9.50, a reference to the corollary
  itself; it should say Proposition 9.39, which its proof applies at line 10574; affects nothing.
- **Misprint** in mt07 at Corollary 18.28, printed p. 434 (line 19533): the source says that a
  loop of length less than η bounds a disk of area less than η, leaving the ζ it introduces
  unused; it should say a loop of length less than ζ, as its use at line 19545 reads; affects
  nothing.
- **Misprint** in mt07 at Lemma 17.12, proof, printed p. 410 (line 18632): the source says that
  removing half a δ-neck of scale h lowers the volume by at least δ⁻¹h²/2; it should be δ⁻¹h³/2,
  volume scaling as the cube of the scale; affects nothing (only a positive lower bound is used).
- **Error** in mt07 at Lemma 19.7 and Corollary 19.10, Section 19.2, printed pp. 441–445: the
  source's evolution equation for the curvature of a curve under curve shortening in a Ricci flow
  omits the time derivative of the Levi-Civita connection, so the total-curvature bound lacks a
  term linear in the curvature; it should include that term, making the bound depend on the
  initial length as well; affects the proof (the application to a compact family survives);
  corrected in print at Morgan–Tian, *Correction to Section 19.2*, arXiv 1512.00699.
