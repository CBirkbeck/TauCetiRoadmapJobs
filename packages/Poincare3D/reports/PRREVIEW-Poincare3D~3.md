# Review of Poincare3D (pull request #1740 at ab8645b)

**Verdict:** needs changes

One P2 finding (R01) and the failing push gate (R02) block acceptance. The mathematics checked out
everywhere I computed it (table under *Verified sound*); the other findings are policy, shape and
locator notes.

**Repair status of the previous review's findings (r2 at 203af6e).**

- R01 (Moise restated in P14): partly repaired. The re-plan of Moise's theorem is gone and the
  pinned `TauCeti.IsTriangulable` / `TauCeti.TriangulationConjecture 3` are cited (lines 736–740),
  but both existence theorems are now consumed from "GeometricTopology §11.2, proposal #903", a
  section that exists only in an open revision of GeometricTopology, which the rules never admit as a
  dependency. See R01 below.
- R02 (Mathlib submodule imports): repaired (`Suggested.lean` line 3 is `public import Mathlib`).
- R03 (blob link to RicciFlow): not repaired; a second blob link was added (R02 below).
- R04 (README shape): not repaired (0 `### k.n` headings, 0 `**Checks.**`, 0 `*Needs:*`).
- R05 (locators): largely repaired by the "Sources:" paragraphs in P1, P2, P4–P7, P9–P13; the
  residue is R05 below.
- R06 (process narrative): not repaired (lines 11–12, 83–90, 844–855 unchanged).
- R07 (docstring form): partly repaired; R07 below.
- R08 (padding): repaired (the four declarations are deleted; the README keeps the `G` checks at
  lines 646–648).
- R09 (citation slips): repaired (HopfRinow path, Kleiner–Lott pages, R4.9 wording, AlgebraicTopology
  8.11a with `basedLoopCWType`); the "P1–P15" sentence at line 12 remains (folded into R06).
- R10 (placement against the pinned geometrization): repaired (lines 30–37, 768–775).
- R11 (unused `ConnectedSpace`): repaired (`Suggested.lean` line 36–37; P14 lines 752–757 argue by
  components).

## R01 (P2) — P14 consumes dimension-three PL and smoothing existence from a revision pull request, not from a supplier

Location: `TauCetiRoadmap/Poincare3D/README.md` line 42 ("GeometricTopology §11.2 … proposal #903 |
Dimension-three compatible combinatorial triangulation/PL existence, PL-to-smooth existence and their
relative versions"), lines 50–51, 153, 729–734 ("GeometricTopology §11.2 … produces both … P14
specializes these theorems").

Claim: the two theorems `smoothable_closed_three_manifold` rests on (every closed topological
three-manifold is combinatorially triangulable, and every PL three-manifold carries a compatible
smooth structure) are supplied by GeometricTopology §11.2.

Witness: §11.2 exists only at the head of the GeometricTopology revision
(`TauCetiRoadmap/GeometricTopology/README.md` at that head, line 12745, which plans Moise 35.3/36.2 and
Munkres §10). A pull request that revises an existing roadmap is never a dependency: the roadmap is
cited as it is on main. On main, GeometricTopology Layer 11 (lines 831–928) defines `IsTriangulable`
and the combinatorial-manifold predicate, holds Moise's Theorems 35.3 and 36.2 through its extract
(`TauCetiRoadmap/GeometricTopology/references/moise-triangulation-dim3.md`, "The two layer-11
results"), and keeps "triangulable", "PL" and "smoothable" as three predicates with implications
"not equalities"; its smoothing comparison (lines 930–951) is a "far horizon" with the
topological-to-PL direction "genuinely speculative". Nothing on main, at the pins, or in a roadmap
earlier in the merge order plans the dimension-three PL-to-smooth theorem or its relative version. So
P14's proof plan uses a result with no admissible owner, and the citation form (a commit-pinned blob
link plus a pull-request number) is the one the gate refuses.

Repair (tested against the instance that refuted it: a closed topological three-manifold `M`
presented only by its charts): in P14, consume from GeometricTopology Layer 11 on main the
realization/combinatorial-manifold API and Moise's triangulation and Hauptvermutung theorems
(Moise, Theorems 35.3 and 36.2, printed pp. 252–253, as the Layer 11 extract quotes them), with the
pinned `TauCeti.TriangulationConjecture 3` as the closed-case statement; state here, as P14's own
target with its locator, the dimension-three PL-to-smooth theorem (Cairns, Ann. Math. 41 (1940),
Theorem III; Munkres, *Elementary Differential Topology*, §10) including the relative version P14
needs, and say in Scope in one clause that GeometricTopology Layer 11 owns the triangulation theorems
and this roadmap the dimension-three smoothing step until a GeometricTopology revision on main plans
it. Delete the §11.2 row (line 42) and the sentence at lines 50–53; line 153 cites "GeometricTopology
Layer 11". If the author prefers not to own the smoothing step, the alternative is a declared gap
`What GeometricTopology must provide (gap:dimension-three-pl-smoothing): every PL three-manifold
admits a smooth structure compatible with its PL structure, relative to a neighbourhood of a closed
subset on which one is given` under an `## Exact supplier contracts` section, but that form is read
by the intake only with a matching `plan.json` entry, which this pull request has none of.

## R02 (P3, gate) — two commit-pinned blob links and pull-request numbers in the README

Location: `README.md` line 42 (`…TauCetiRoadmap/blob/309be2f6…/GeometricTopology/README.md#L12745`),
line 48 (`…TauCetiRoadmap/blob/544d4ff5…/RicciFlow/README.md`), lines 42 and 50–51 ("proposal #903",
"#903 and #1023").

Claim: gate rule `blob` fails (`blob=2 … FAIL`); no acceptance while the gate fails. Pull-request
numbers and "proposal" are process words.

Witness: RicciFlow is an open roadmap earlier in the merge order (`merge-order-candidate.txt` lines
199–200); at its head (fff2322, of which 544d4ff is an ancestor) its `## Downstream consumers`
(line 1655) names Poincare3D as the consumer of Layers 1–5. The citation needs no link.

Repair: line 48 becomes `[RicciFlow](../RicciFlow/README.md), Layers 1–5 (R1–R5)`; line 42 and
lines 50–53 go with R01. Elsewhere the Tau Ceti blob links (lines 33, 505, 737, 739) point at the pin
358314d4 and resolve (checked below); they are legal but the house form is the declaration name and
file path, `TauCeti/LowDimTopology/Geometrization.lean`, without a link.

## R03 (P3) — P15 cites a GeometricTopology section that exists only in the revision, and names an undeclared Lean target

Location: `README.md` lines 768–769 ("Provide `poincare_3d_topological_geometricTopology` as the
adapter to GeometricTopology §8.6's `poincare_conjecture` presentation").

Claim: the adapter targets a `poincare_conjecture` in GeometricTopology §8.6.

Witness: on main GeometricTopology Layer 8 (lines 696–742) has no §8.6 and no `poincare_conjecture`;
both exist only at the revision head (its README line 12465; its `Suggested.lean` line 180, stated on
`[IsManifold (𝓡 3) 0 M] [SecondCountableTopology M]`). And `poincare_3d_topological_geometricTopology`
is a backticked name of this roadmap's own that `Suggested.lean` does not declare (it declares three
names, lines 29, 36, 44); the gate's name check does not see it because it carries no namespace.

Repair: write the sentence without backticks: "Provide the adapter to GeometricTopology Layer 8's
Poincaré statement (the instance of geometrization it names), on carriers with `MetricSpace` or
`SecondCountableTopology` in place of `T2Space`". Do not add the adapter to `Suggested.lean`: it
follows from `poincare_3d_topological` in one step (a metric space is Hausdorff), so it would be
padding.

## R04 (P3) — the README is not in TauCetiRoadmap form

Location: whole README. Title (line 1) is not `# Roadmap: …` and there is no `**Summary.**`;
`## Existing floor and conventions` (63) for `## Conventions`; the supplier table sits in Scope and
there is no `## Exact supplier contracts`; `## Dependency order` (131) for `## How to read the build`;
layers `## P1.`–`## P15.` with no `### k.n` subsections (count 0), no API bullets, no `**Checks.**`
lists (count 0), no `*Needs:*` lines (count 0), no `### Examples` / `### Dependencies` per layer,
no `## Downstream consumers`, `## Mathematical references` for `## References`.

Claim: the house checklist ("every definition keeps its API list and at least three discriminating
Checks, every theorem its exact hypotheses, every claim its locator, every layer its dependencies")
cannot be applied: no definition has three Checks and no target has a `*Needs:*` line.

Witness: `TauCetiRoadmap/RicciFlow/README.md` at its head (headings at lines 16, 77, 134, 156, 167
ff., each `### k.n` ending in `**Checks.**` and `*Needs:*`, each layer in `### Examples` /
`### Dependencies`).

Repair: rewrite into that shape. The mathematics stays (it checks out, see the table); each definition
(normalized metric, pointed convergence, reduced length and volume, κ-noncollapse, ancient
κ-solution, ε-neck, ε-cap, canonical neighbourhood, standard initial metric, surgery flow, `Fill_g`,
`w_g`, `W_g`, ramp) gets its API bullets and three Checks (a computed value, the degenerate case, a
non-example), each theorem its hypotheses in the sentence and its locator at the claim, each target a
`*Needs:*` line.

## R05 (P3) — locator residue

- Line 467–471: existence of the surgery flow for every normalized initial metric is Morgan–Tian
  Corollary 15.10 (mt07 line 16626); Theorem 15.9 (line 16610) is the extension step for flows
  already satisfying Assumptions (1)–(7). Cite both.
- Lines 698–699: the reconstruction of the initial manifold as a connected sum of spherical space
  forms and `S²`-bundles is Corollary 15.4(1) (mt07 line 16396–16404); the Chapter 18 proof of
  Theorem 0.1 (line 18698–18711) only invokes it. Cite Corollary 15.4(1).
- P3 has no locator for reduced-volume monotonicity or noncollapsing: Theorem 7.26 (mt07 line 8527,
  bounded-curvature complete flows) and Theorem 8.1 (line 8640, with its explicit dependence of `κ`
  on `τ₀`, `V`, `l₀`, `n`) are the statements P3 restates.
- P5 has no locator for bounded curvature at bounded distance or the singular-time limit:
  Theorem 10.2 (line 11893) and Theorem 11.19 (line 13225, under Assumptions 11.18).
- P6 (surgery, lines 418–436) and P8 (ancestry) carry no locator; P9's Douglas-gap annulus theorem
  cites Lemma 19.15 / Section 19.7 for the ramp case but nothing for the null-loop case.

## R06 (P3) — process narrative and external-code instructions

Location: lines 11–12 ("prototypes selected interfaces. P1–P15 specify the required mathematics"),
83–90 (three Mathlib pull-request links, "adopt the resulting Mathlib interfaces as they land"),
844–855 (`## Existing Lean formalizations`: two repositories at pinned revisions, a "benchmark
submission", "reuse and adaptation … of their code", "Preserve the applicable source notices …
when integrating their code").

Claim: a README is timeless mathematics; it carries no pull-request references, no instructions to
import code from outside the project, and no label system foreign to the house shape.

Repair: delete lines 83–90 and 844–855; if the earlier formalization is to be acknowledged, one
sentence under `## References` naming it as prior work, with no revision hashes and no instruction
to integrate its code. Line 12 goes with R04.

## R07 (P3) — docstring form

Location: `Suggested.lean` lines 5–19.

Claim: the module docstring is "<title>: target signatures", says the roadmap is README.md and this
file is not the roadmap, that it states the headline theorems against the pinned APIs, and names the
headline theorems not statable at the pins with what each lacks. The present text says "suggested
target signatures", "not exhaustive", "P1--P15", "Lean prototypes", and names the unstatable
headlines only through the layers that need carriers.

Repair: "Three-dimensional Poincaré: target signatures. The roadmap is README.md; this file is not
the roadmap. It states the headline theorems against the pinned Mathlib and Tau Ceti. Not statable at
the pins: existence of Ricci flow with surgery for every normalized closed orientable initial metric
(Morgan–Tian, Corollary 15.10), its finite extinction for simply connected initial data (Theorem
18.1), and reconstruction of the initial manifold as a connected sum of spherical space forms and
`S²`-bundles (Corollary 15.4): each lacks a time-dependent metric family, a reduced-geometry and a
surgery-flow carrier, none of which exists in Mathlib or Tau Ceti at the pins."

## Verified sound

**Gate and build.** The worker's gate at ab8645b: `set_option=0 blob=2 latex=0 tex=0 prnum=0
sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0
no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0
round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0
outside-folder=0 source-material=0 build=0 FAIL` (only `blob` fails, R02).
`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/Poincare3D'` is empty: the pull request
changes only this folder (README.md, Suggested.lean, metadata.toml with `topic = "math.GT"`). The
dependency check run by me:

    depcheck: 204 roadmaps, 1655 edges, 0 problem(s)

No UPWARD or CYCLE line. The merge order lists Poincare3D directly after RicciFlow, its only
supplier that is not on main.

**Elaboration.** I elaborated a scratch copy of `Suggested.lean` with `lake env lean` and appended
`#check @name` for the three declarations: the only warnings are the two `sorry`s (lines 29 and 36;
`poincare_3d_topological` is proved from the other two), and each elaborated type equals the
worker's `signatures.md` entry. No section binder is lost: `poincare_3d_smooth` keeps `T2Space`,
`ChartedSpace`, `IsManifold (𝓡 3) ∞`, `SimplyConnectedSpace`, `CompactSpace`;
`smoothable_closed_three_manifold` keeps `T2Space`, `ChartedSpace`, `CompactSpace`;
`poincare_3d_topological` keeps `T2Space`, `ChartedSpace`, `SimplyConnectedSpace`, `CompactSpace`.
Nothing changed. The README's generality equals the Lean's (lines 16–21 and 717–718, 745–746,
761–764).

**One-tactic probe.** Both sorried statements conclude `Nonempty (M ≃ₘ⟮𝓡 3, 𝓡 3⟯ S³)` or
`∃ atlas, IsManifold (𝓡 3) ∞ M` for an arbitrary `M` given only by typeclass hypotheses; no `simp`,
`rfl`, `infer_instance` or single library lemma produces a diffeomorphism or an atlas from these (the
pinned Mathlib has no `SimplyConnectedSpace` instance on the sphere, which I confirmed by a failed
`infer_instance` in the probe, and no theorem about simply connected compact charted spaces). Neither
is padding; `poincare_3d_topological` is the topological headline itself.

**Library declarations opened at the pins (Tau Ceti 358314d4, Mathlib f6090c70).**
`TauCeti.TriangulationConjecture` (`TauCeti/Topology/TriangulationConjecture.lean` line 74: `∀ M
[TopologicalSpace M] [T2Space M] [CompactSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M],
IsTriangulable M`; a `Prop`, not a proof); `TauCeti.IsTriangulable` (`TauCeti/Topology/Triangulable.lean`
line 40: homeomorphic to the realization of an abstract simplicial complex);
`TauCeti.GeometrizationConjecture` (`TauCeti/LowDimTopology/Geometrization.lean` line 144, on
`[MetricSpace M] [ChartedSpace …] [IsManifold (𝓡 3) ∞ M] [CompactSpace M] [ConnectedSpace M]
[Orientable (𝓡 3) ∞ M]`, hypothesis `IsSphereBoundsBall M`);
`HomotopyGroup.pathLoopSpaceMulEquiv` (`TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean` line
361: `π_(m+1)(Ω X x, refl x) ≃* π_(m+2)(X, x)`; `m = 1` gives the `π₂(ΩM) ≅ π₃(M)` P9 uses);
`ChartedSpace.secondCountable_of_sigmaCompact` (elaborated: `[SecondCountableTopology H]
[SigmaCompactSpace M] → SecondCountableTopology M`, as line 73 says); `Diffeomorph.toHomeomorph`
(any `n : ℕ∞ω`); the sphere instances `ChartedSpace (EuclideanSpace ℝ (Fin 3)) (sphere 0 1)` and
`IsManifold (𝓡 3) ∞ (sphere 0 1)` (the statements elaborate). The four Tau Ceti blob links in the
README (lines 33, 505, 737, 739) point at the pinned revision and the cited line numbers are exact.

**Cross-roadmap citations resolved.** On main: GeometricTopology Layers 1, 2, 7, 8, 11 (lines 177,
289, 627, 696, 831); AlgebraicTopology Stages 1–6, 8 (289–1602) and 8.11a `basedLoopCWType` (lines
1949–1950); DifferentialGeometry Layers 0–3, 5–10, 12 (268–910); HopfRinow Layers 0–4
(`Completed/HopfRinow/README.md` 229–495); RiemannianGeometry R4.9 (802, "on a smooth two-sphere" as
line 55 now says), R5a (1044), R7.0 (1295); PDE Lanes A, C–F (223, 285–341); ComplexKahlerGeometry
K5a (33); GeometricMeasureTheory G1–G2 (106, 148). At its open head fff2322: RicciFlow Layers 1–5
(167–1076), its Scope excluding surgery (line 71) and its `## Downstream consumers` naming
Poincare3D (1655). Not resolvable on an admissible supplier: GeometricTopology §11.2 and §8.6 (R01,
R03).

**Ownership.** `roadmaps grep` over the 441 open pull requests and main for Moise, PL-to-smooth,
compatible smoothing, Ricci flow with surgery, finite extinction, filling width, the Poincaré
conjecture, curve shortening, κ-solutions and canonical neighbourhoods: Ricci flow with surgery,
reduced geometry, κ-solutions, canonical neighbourhoods, loop-family width and curve shortening in a
moving three-manifold are planned nowhere else (RicciFlow excludes surgery; RiemannianGeometry R4.9 is
curve shortening on a fixed two-sphere; MorseTheory and FourManifolds only mention the conjecture).
The Poincaré statement is declared at the GeometricTopology revision head as `poincare_conjecture`
(its `Suggested.lean` line 180) with the analytic proof assigned to "RicciFlow", which in turn assigns
it to Poincare3D: this roadmap is the owner of the proof and the Scope paragraph (lines 30–37) now
says so. Dimension-three triangulation and smoothing: R01. Ownership against open pull requests was
checked through the sibling checkouts and the `roadmaps grep` index of 2026-11-04.

**Sources read.** Cache ids: `mt07` = Morgan–Tian, Clay text (570 PDF pages, printed page = PDF
page − 43); `mt15` = arXiv 1512.00699v1; `perelman03b` = arXiv math/0307245v1; `topping14` = arXiv
1110.3714v1; `kl08` = the Kleiner–Lott author text. Locators checked at the text (the worker's seeded
sample found no target by heading, so I took the README's own locators; the fifteen marked * are the
sample):

- mt07 Theorem 0.1 line 307, Corollary 0.2(a) line 314*, proof of 0.1 from 18.1 lines 18698–18711;
  Corollary 15.4(1) lines 16396–16404*.
- Theorems 3.27–3.29 lines 3767–3803* (Shi: `T ≤ A/K`, `|Rm| ≤ K` on `B_{g(0)}(p,r) × [0,T]`, bound
  on `B(p, r/2)`, `C t^{−k/2}`; 3.29 with initial `C^l` bounds): identical to lines 214–226.
- Definition 4.10 line 4519* (`|Rm| ≤ 1` and `Vol B(x,0,r) ≥ (ω_n/2) rⁿ` for `r ≤ 1`, all centres).
- Theorem 4.26 line 4894* (Hamilton–Ivey, `R ≥ −6/(1+4t)`); Theorem 4.37 line 5088 and Corollary 4.39
  line 5099* (ancient complete bounded nonnegative curvature operator gives `∂_t R ≥ 0`).
- Theorems 5.11 line 5450 and 5.15 line 5531* (based generalized flows, compact-closure balls,
  curvature bound `C(A, I)`, `Vol B(x_k,0,r₀) ≥ κ r₀ⁿ`; limit complete on each slice).
- Theorem 7.26 line 8527, Theorem 8.1 line 8640 (for R05).
- Theorem 9.4 line 9055* (orientable two-dimensional κ-solutions are shrinking round spheres);
  Corollary 9.50(3) line 10571 (compact round surfaces); Theorem 9.42 line 10237* (complete nonflat
  bounded nonnegative curvature, dimension 2 or 3, κ-noncollapsed gradient shrinking soliton: compact
  round, `S² × ℝ`, or its quotient by an isometric involution; the two involutions at line
  10895–10899: `RP² × ℝ` and the twisted bundle, `RP³` minus a point); Proposition 9.58 line 10887*
  (universal `κ₀` off the round branch); Theorem 9.59 line 10941* (zero asymptotic volume).
- Definitions 9.72–9.78 lines 11304–11387* (ε-neck, cap as ball or punctured `RP³`, C-component,
  ε-round component, canonical neighbourhood, strong neck).
- Theorem 10.2 line 11893, Theorem 11.19 line 13225 (for R05).
- Definition 12.1 line 13730 and Theorem 12.5 line 13857* (standard flow: unique, `T = 1`, positive
  curvature, `SO(3)`-invariant, asymptotic to the cylinder with `R = 1/(1−t)`).
- Theorem 15.9 line 16610* and Corollary 15.10 line 16626; Lemma 17.12 line 18612* (at most `N`
  surgery times, `N` depending on initial volume, `T_{i+1}`, `r_{i+1}`, `δ(T_{i+1})`).
- Theorem 18.1 line 18688* (compact connected normalized, `π₁` a free product of finite and infinite
  cyclic groups, no `RP²` with trivial normal bundle, extinction); Lemmas 18.10 line 19096 and 18.11
  line 19168 (`dW₂/dt ≤ −4π − ½ R_min W₂`, with the explicit comparison function at line 19182);
  Proposition 18.18 line 19375* (`dW_ξ/dt ≤ −2π − ½ R_min W_ξ`, forward difference quotients,
  `W_ξ(t) ≤ liminf` at surgery times); Proposition 18.24 line 19470 (family deformation on a compact
  Ricci flow, alternatives (i) length `< ζ`, (ii) area bound `+ ζ`).
- Lemma 19.15 line 20137, Corollary 19.16 line 20227, Lemma 19.31 line 20823.
- mt15 lines 10–34 (missed connection-variation term, extra linear term, length-dependent constant);
  perelman03b line 45 (`dA/dt ≤ −2π − ½ R_min A`); topping14 Theorems 1.1–1.3 (completeness of the
  limit is a hypothesis, not a consequence); kl08 header (Geom. Topol. 12 (2008) 2587–2858).

**Adversarial table.** Values computed on each side.

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `poincare_3d_smooth` | `M = S³`; `S¹×S²`, `RP³`, Poincaré sphere; `∅`; `S³ ⊔ S³`; `ℝ³`; a non-Hausdorff charted space | identity diffeomorphism; `π₁ = ℤ, ℤ/2, I*` so `SimplyConnectedSpace` fails; `SimplyConnectedSpace` gives `PathConnectedSpace` hence `Nonempty` (pin line 70 of `SimplyConnected.lean`); not path-connected; not compact; `T2Space` fails | every counter-instance excluded; conclusion is mt07 Cor 0.2(a) | none |
| `smoothable_closed_three_manifold` | `S³`; `S³ ⊔ S³`; `∅` | standard atlas; componentwise atlas (finitely many clopen components by compactness and local connectedness, lines 752–757); on `∅` every chart condition vacuous | true without `ConnectedSpace`, as now stated | none (R11 repaired) |
| `poincare_3d_topological` | typeclass path of the proof | `SimplyConnectedSpace → PathConnectedSpace → ConnectedSpace`; `Diffeomorph.toHomeomorph` at `n = ∞` | proof term elaborates with no `sorry` of its own | none |
| normalized metric scaling (P1, line 178–181) | `g ↦ Qg`, `Q ≥ 1`, `r ≤ 1` | `vol_{Qg} B(x,r) = Q^{3/2} vol_g B(x, r/√Q) ≥ Q^{3/2} · ½ω₃ (r/√Q)³ = ½ω₃ r³`; `|Rm|_{Qg} = Q⁻¹|Rm|_g`; `ν_{Qg} = Q⁻¹ν_g ≥ −1` | all three conditions survive scaling up; agrees with mt07 Def 4.10 | none |
| `R_min ≥ −6/(1+4t)` (P2, line 242) | `r(t) = −6/(1+4t)` against `r′ = ⅔ r²`, `r(0) = −6` | `r′ = 24/(1+4t)²`; `⅔ r² = ⅔ · 36/(1+4t)² = 24/(1+4t)²`; `ν(0) ≥ −1 ⇒ R(0) = 2(λ+μ+ν) ≥ −6` | comparison function exact; mt07 line 19176 agrees | none |
| Hamilton–Ivey (line 238) | hyperbolic `K ≡ −1`, `g(t) = (1+4t)g₀` (`Ric = −2g₀`, `∂_t g = 4g₀` ✓) | `ν = −1/(1+4t)`, `R = −6/(1+4t)`; `t = 0`: RHS `= 2·1·(0+0−3) = −6 = R`; `t > 0`: RHS `= (2/(1+4t))(log(1+t) − log(1+4t) − 3) < −6/(1+4t)` | holds with equality at `t = 0`, strict after | none |
| Harnack (line 247) | shrinking cylinder `S²×ℝ`, `R = 1/(1−t)`, `V = 0`, ancient form | `∂_t R = 1/(1−t)² > 0` | consistent with Cor 4.39 | none |
| width ODE and barrier (P11, lines 637–648) | `G = (W₀+2π)(1+4t)^{3/4} − 2π(1+4t)` | `G(0) = W₀ + 2π − 2π = W₀`; `G′ = 3(W₀+2π)(1+4t)^{−1/4} − 8π`; `−2π + 3G/(1+4t) = −2π + 3(W₀+2π)(1+4t)^{−1/4} − 6π` = same; mt07 line 19182's `w₂` is the `−4π` analogue with `T₀ = 0` | identity exact; `G < 0` once `(1+4t)^{1/4} > 1 + W₀/(2π)` | none |
| integrated bound (line 662) | `u = (1+4t)^{−3/4} W` | `u′ = (1+4t)^{−3/4}(W′ − 3W/(1+4t)) ≤ −2π(1+4t)^{−3/4}`; `∫₀ᵀ (1+4t)^{−3/4} dt = (1+4T)^{1/4} − 1`; a jump `e_j` at `t_j` adds `(1+4t_j)^{−3/4} e_j` to `u` | displayed inequality exact, weighted budget is the right weight | none |
| `−(R_min/2)W ≤ 3W/(1+4t)` (line 635) | needs `W ≥ 0` | `−R_min/2 ≤ 3/(1+4t)` | README states `W ≥ 0` | none |
| `A′ ≤ −4π − (ρ/2)A` (P9, line 567) | minimal sphere, Gauss equation in dimension 3 | `d/dt Area = −∫(R − Ric(ν,ν)) = −∫(R/2 + K_M(TΣ))`, `K_M(TΣ) = K_Σ − κ₁κ₂ ≥ K_Σ` on a minimal surface, `∫K_Σ = 4π` | matches Lemma 18.11; branch points only help | none |
| `D⁺W ≤ −2π − (R_min/2)W` (line 631) | disks, `χ(D²) = 1` | `∫_D K = 2π − ∫_{∂D} k_g` | Prop 18.18; perelman03b line 45 | none |
| standard cap (P6, lines 398–404) | tip `f = 2 sin(r/2)`; cylinder `f = √2` | radial `−f″/f = ¼`, tangential `(1−f′²)/f² = ¼`; cylinder tangential `1/f² = ½`, radial `0`, `R = 2·½ = 1`; `f = √2` at `r = π/2` with `f′ = 1/√2`, so `r_tip < π/2` and a concave bridge with `f′ ↓ 0` is needed, which `0 ≤ f′ ≤ 1`, `f″ ≤ 0` allow | consistent with Def 12.1; `S²(√2)` collapses at `t = 1`, matching `T = 1` | none |
| volume loss `c h³/δ` (P7, line 455) | half a `δ`-neck of scale `h` | length `δ⁻¹h`, cross-section area `≈ 8πh²`, removed `≈ 8πδ⁻¹h³`, cap sewn in `≤ (1+ε)Kh³`, `δ < K⁻¹` | correct; the source's `h²` is a misprint (below) | none |
| cylinder quotients (P4, lines 330–331) | `(x,z) ↦ (−x,−z)`; `RP² × ℝ` | antipodal on `S²` reverses, `z ↦ −z` reverses, composite preserves orientation; `RP² × ℝ` nonorientable; mt07 line 10898: the twisted bundle is `RP³` minus a point | branches and the orientability exclusion right; consistent with the cap model "`RP³` minus a ball" | none |
| Theorem 9.42 hypotheses vs P4 | the asymptotic soliton of P4 | κ-noncollapsed (inherited from the κ-solution), bounded nonnegative curvature, complete, nonflat; the flat Gaussian soliton is the excluded branch | README's "flat branch separated when the nonflat hypothesis is removed" is the right reading | none |
| `π₂(Λ₀M, const) ≅ π₃(M)` (P9, line 509) | fibration `ΩM → ΛM → M` with the constant-loop section; `π₂(M) = 0` | `π₂(ΛM) ≅ π₂(ΩM) ⊕ π₂(M) = π₃(M) ⊕ 0`, `π₂(ΩM) ≅ π₃(M)` is `pathLoopSpaceMulEquiv 1`; `ΛM` connected for simply connected `M` | true | none |
| closed simply connected 3-manifold (P1, line 162) | `H₁, H₂, H₃, π₂, π₃` | `H₁ = π₁^{ab} = 0`; `w₁ = 0` so orientable; `H₂ ≅ H¹ = 0`; `H₃ ≅ ℤ`; Hurewicz `π₂ = 0`, `π₃ ≅ H₃ ≅ ℤ` | correct | none |
| no two-sided `RP²` (P1, lines 165–167) | two-sided hypersurface in an orientable 3-manifold | trivial normal bundle so `RP²` would be orientable | correct; mt07 line 18690 | none |
| short-loop criterion `ζ(g)` (P9, line 579) | loops shorter than the injectivity radius | each has a canonical null-homotopy continuous in the loop | correct | none |
| Shi localized hypotheses (P2, lines 215–222) | compare with Theorem 3.28 | `T ≤ A/K`, `|Rm| ≤ K` on `B_{g(0)}(p,r) × [0,T]`, conclusion on `B(p, r/2)`, `C(n,k,K,A,r) t^{−k/2}` | identical | none |
| ε-cap topology (P5, line 123) | ball, punctured `RP³` | mt07 Def 9.72 | identical | none |
| Lemma 19.15 growth bound (P10, line 608) | `n ≥ 3`, degree-one ramps | `dμ/dt ≤ (2n−1) max|Rm| μ`, exponent independent of `λ` | matches | none |
| P14 proof route | a closed topological 3-manifold given by charts | needs: triangulation (Moise 35.3), PL structure (36.2), PL-to-smooth (Cairns/Munkres), transport to a `ChartedSpace` on the same carrier | the last three steps have no admissible owner at the cited location | R01 |

## Not verifiable

- A. J. S. Hamilton, *The triangulation of 3-manifolds*, Q. J. Math. 27 (1976), "Theorem 2(1)"
  (README line 839): Oxford Academic, paywalled; no copy at arXiv, Numdam, EuDML or an author page.
  Cited by locator only.
- S. Cairns, Ann. Math. 41 (1940), "Theorem III" (line 842): JSTOR, paywalled. Cited by locator only.
- E. Moise, GTM 47, Chapters 35–36 (line 837): Springer, paywalled; the GeometricTopology extract on
  main quotes Theorems 35.3 and 36.2 from printed pp. 252–253, which agrees with the chapter range.
- Chow–Knopf, Surv. 110 (line 801); Chow et al., Surv. 144 "Chapter 15" (807) and Surv. 163
  "Chapter 26" (812): AMS e-books, paywalled; the chapter attributions were not checked.
- Perelman, arXiv math/0211159 and math/0303109 (lines 826–827): cited without locators; nothing to
  check.
- The GeometricTopology revision's §11.2 and §8.6 were read as data (R01, R03); they are not
  suppliers.

## Source issues

- **Misprint** in mt07 at Lemma 17.12, proof, printed p. 410 (line 18632): the source says that
  removing half a δ-neck of scale h lowers the volume by at least δ⁻¹h²/2; it should be δ⁻¹h³/2,
  volume scaling as the cube of the scale; affects nothing (only a positive lower bound is used).
- **Error** in mt07 at Lemma 19.7 and Corollary 19.10, Section 19.2, printed pp. 441–445: the
  source's evolution equation for the curvature of a curve under curve shortening in a Ricci flow
  omits the time derivative of the Levi-Civita connection, so the total-curvature bound lacks a term
  linear in the curvature; it should include that term, making the bound depend on the initial length
  as well; affects the proof (the application to a compact family survives); corrected in print at
  Morgan–Tian, *Correction to Section 19.2*, arXiv 1512.00699.
