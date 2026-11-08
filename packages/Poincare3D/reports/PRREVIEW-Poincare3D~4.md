# Review of Poincare3D (pull request #1740 at c3ef974)

**Verdict:** needs changes

No blocking finding. The push gate fails on one style rule (`layer-ids`, R01), and three locator
or ownership notes remain (R02–R04). The mathematics checked out everywhere I computed it (table
under *Verified sound*).

**Repair status of the previous review's findings (r3 at ab8645b).**

- R01 (P14 consumed Moise/PL-to-smooth from a revision pull request): repaired. Lines 36–38 say
  "GeometricTopology Layer 11 owns the dimension-three triangulation and Hauptvermutung theorems;
  Layer 14 here owns dimension-three compatible smoothing"; the supplier row (line 45) cites
  Layers 1, 2, 7 and 11 on main; 14.1 (lines 1388–1397, 1400–1402) consumes Moise 35.3/36.2 from Layer 11 and
  states the PL-to-smooth theorem with its relative form as its own target. The §11.2 row and the
  "proposal" sentences are gone. One locator of the new target is wrong (R02 below, a slip the
  previous review's own repair text introduced).
- R02 (blob links, pull-request numbers): repaired (`blob=0 prnum=0`; line 51 cites RicciFlow by
  path and layers; the Tau Ceti declarations are named with their files at lines 31–33, 53–56).
- R03 (§8.6 citation and the undeclared adapter name): repaired (lines 1457–1465 cite
  "GeometricTopology Layer 8's Poincaré statement" with no backticked name of this roadmap's own;
  the gate's `readme-ids-missing=0`).
- R04 (README shape): repaired in substance: `# Roadmap:` title and `**Summary.**`; `## Scope and
  ownership`, `## Exact supplier contracts`, `## Conventions`, `## How to read the build`;
  33 `### k.n` subsections, each with API bullets, a `**Checks.**` list of three bullets and a
  `*Needs:*` line (counts 33/33/33); `### Examples` and `### Dependencies` per layer;
  `## Downstream consumers`, `## References`. What remains is the layer-heading punctuation the
  gate refuses and three small shape residues (R01).
- R05 (locator residue): repaired (Corollary 15.10 at line 822, Corollary 15.4(1) at line 1314,
  Theorems 7.26/8.1/8.10 at lines 426 and 491, Theorems 10.2/11.19 at line 665, Definition 15.8,
  Proposition 15.3 and Lemma 15.11 at line 752, Proposition 15.3/Definition 18.2/§18.3 at line 882,
  Lemma 19.15/§19.7 at lines 1024–1026 with the null-loop case routed to 9.3's Douglas-gap target).
- R06 (process narrative, external-code instructions): repaired (the Mathlib pull-request links and
  the `## Existing Lean formalizations` section are gone; one sentence under `## References`, lines
  1580–1582, names the prior formalization with no revision hashes).
- R07 (docstring form): repaired (`Suggested.lean` lines 5–19 name the three unstatable headlines
  with the carriers they lack).

## R01 (P3) — gate: layer headings and shape residue

Location: `TauCetiRoadmap/Poincare3D/README.md` lines 163, 264, 412, 518, 603, 689, 773, 852, 902,
1114, 1197, 1288, 1338, 1386, 1446 (`## Layer 1. Closed topology, models and normalization` and the
fourteen like it); line 1503 (`## Completion examples`); line 235 ("Completion checks include the
exact round sphere/quotient models …"); line 489 ("… are acceptance examples").

Claim: the gate's `layer-ids` rule ("a layer heading reads `Layer N: title`") fails fifteen times,
and no acceptance is possible while the gate fails. The worker's gate at this head:
`layer-ids=15 … FAIL`, every other scanner `0`, `build=0`; my run reproduces the fifteen lines.

Witness: `TauCetiRoadmap/RicciFlow/README.md` at its open head, lines 167, 321, 570 (`## Layer 1:
metric families and variation calculus`, …), which is the shape the gate accepts.

Repair: write `## Layer 1: Closed topology, models and normalization` and so on (a colon, not a
full stop, after the number) for all fifteen headings. In the same pass: rename `## Completion
examples` to `## Worked examples` (the house section name; its six numbered items are worked
examples); delete the sentence at line 235 (the three Checks below it already carry it) and replace
"are acceptance examples" at line 489 by "are the Checks below" — "completion" and "acceptance" are
process words; and add a `**From Mathlib.**` paragraph to `## Exact supplier contracts` naming the
declarations now listed only under `## Conventions` (`ChartedSpace`, `IsManifold`, `Diffeomorph`,
`Homeomorph`, `HomotopyGroup.Pi`, `ChartedSpace.secondCountable_of_sigmaCompact`), so that the
contracts section is the one place the suppliers are read from.

## R02 (P3) — locator: 14.1 cites Munkres §10 for the PL-to-smooth theorem; §10 proves the opposite direction

Location: `README.md` lines 1405–1407 ("Sources: Cairns, Theorem III, and Munkres, *Elementary
Differential Topology*, §10, for the dimension-three smoothing development") and line 1577
("§10: smoothing and the compatible triangulation interfaces used in Layer 14").

Claim: the target is "for every Hausdorff second-countable PL three-manifold without boundary …
the existence of a compatible smooth structure, including the relative form", and Munkres §10 is
cited for it.

Witness: Munkres, *Elementary Differential Topology*, Chapter II §10 contains Theorem 10.5
(uniqueness of smooth triangulations up to subdivision) and Theorem 10.6 (every non-bounded `Cʳ`
manifold has a `Cʳ` triangulation, with a relative form), as the GeometricTopology extract on main
quotes them (`TauCetiRoadmap/GeometricTopology/references/munkres-smoothing-triangulations.md`,
"Locus" and "Theorem 10.6"). That is smooth-implies-PL; the book has no PL-implies-smooth
theorem. The previous review's repair text proposed this locator; it was wrong, and I withdraw it.

Repair: keep Cairns, Theorem III (uncertified; see *Not verifiable*) and replace the Munkres
locator by a text that states the dimension-three PL-to-smooth theorem with its relative form, with
its theorem number: the obstruction-theoretic statement (every PL manifold whose smoothing
obstructions in `H^{i+1}(M; Γ_i)` vanish is smoothable, with `Γ_i = 0` for `i ≤ 3`, relative to a
smoothing given near a closed subset) in M. Hirsch and B. Mazur, *Smoothings of Piecewise Linear
Manifolds*, Ann. of Math. Studies 80 (1974), or J. Munkres, *Obstructions to the smoothing of
piecewise-differentiable homeomorphisms*, Ann. of Math. 72 (1960) 521–554, cited by theorem number
and marked uncertified if read by locator only. Line 1577 then describes that source. (The
GeometricTopology revision at its open head, §11.2, carries the same wrong Munkres locator; it is
not a supplier and is only noted so that the two texts are corrected together.)

## R03 (P3) — locator: two locator slips

- `README.md` line 1086 ("Source: Morgan–Tian, §18.3 and Corollary 18.28") for 9.6, whose
  short-loop criterion is "when `π₂(M)=0`, there is `ζ(g)>0` such that every continuous null-loop
  family whose members all have length less than `ζ(g)` represents the zero class". Witness:
  that statement is Lemma 18.27 (mt07 line 19511: compact `X` with trivial `π₂`, `ζ` below the
  injectivity radius, every family of loops of length `< ζ` represents the trivial element of
  `π₃`); Corollary 18.28 (line 19532) is the small-loop filling bound (a loop of length below `ζ`
  bounds a disk of area below `η`), which 9.6's "uniform small-loop-family width bound" does use.
  Repair: "Source: Morgan–Tian, §18.3, Lemma 18.27 for the short-loop criterion and Corollary
  18.28 for the small-loop width bound."
- `README.md` line 176 ("Source: Hatcher, §§1.2, 3.3 and 4.2, for van Kampen, duality, Hurewicz
  and Whitehead"). Witness: in the author-page text (hatcherAT), van Kampen is §1.2 (Theorem 1.20,
  line 1956), Poincaré duality §3.3 (Theorem 3.30, line 10453), Hurewicz §4.2 (Theorem 4.32, line
  15961), but Whitehead's theorem is Theorem 4.5 in §4.1, printed p. 346 (line 15109, before §4.2
  begins at p. 360). Repair: "§§1.2, 3.3, 4.1 and 4.2".

## R04 (P3) — ownership: 13.1's sphere-boundary extension target has no locator and duplicates the disc theorem

Location: `README.md` lines 1349–1352 ("Supply the dimension-two sphere boundary diffeomorphism
extension/isotopy result needed to extend the gluing over a three-ball, consuming
GeometricTopology's gluing API").

Claim: the smooth identity "a connected sum of round three-spheres along the collared ball
embeddings of Layer 12 is a three-sphere" needs a statement about diffeomorphisms of `S²`, built
here, with no source.

Witness: with the balls of Layer 12's reconstruction, `S³ # S³ = (S³ ∖ B) ∪ (S³ ∖ B′) = D³ ∪_id D³ =
S³` once the two ball embeddings are isotoped to standard ones; the statement that any two
orientation-compatible ball embeddings into a connected manifold are ambient isotopic is the disc
theorem, which GeometricTopology Layer 1 owns on main (`TauCetiRoadmap/GeometricTopology/README.md`
lines 223–231: Palais, Proc. AMS 11 (1960); Hirsch GTM 33, Chapter 4 §6, Theorem 6.6, with its
extract). The surgery gluing maps are the identifications through product necks, isotopic to the
identity by construction, so no theorem about `Diff(S²)` is needed. If the stronger statement
"every diffeomorphism of `S²` extends over `D³`" is intended, it is Smale's theorem (Proc. AMS 10
(1959) 621–626, `Diff(S²) ≃ O(3)`) and needs that locator.

Repair: replace the sentence by "Identify the surgery gluing maps with the identity through the
product necks and use GeometricTopology Layer 1's disc theorem (independence of the ball
embeddings) to identify the iterated connected sum of three-spheres with the three-sphere", and
list "GeometricTopology Layer 1 disc theorem" in 13.1's `*Needs:*` line; or, if Smale's theorem is
meant, state it with its locator.

## Verified sound

**Gate, diff and dependency check.** The worker's gate at c3ef974: `set_option=0 blob=0 latex=0
tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0
mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0
empty-sections=0 round-labels=0 long-fences=0 layer-ids=15 target-ids=0 depcheck=0 metadata=0
stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL` (only `layer-ids`, R01).
My own gate run reproduces the fifteen `layer-ids` lines (its `depcheck` line "NOT IN ORDER" is
the default order's view of a roadmap the candidate order lists; the dependency check with the
candidate order is below). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/Poincare3D'`
is empty: the pull request adds only `README.md`, `Suggested.lean` and `metadata.toml`
(`topic = "math.GT"`). The dependency check:

    depcheck: 236 roadmaps, 2075 edges, 0 problem(s)

No UPWARD or CYCLE line. The merge order lists Poincare3D (line 203) directly after RicciFlow
(line 202), its only supplier not on main.

**Elaboration and signatures.** `git diff ab8645b HEAD -- Suggested.lean` changes only the module
docstring and the three declaration docstrings; the statements and proof bodies are those of the
head the previous review elaborated. I elaborated a scratch copy with `lake env lean` (9 s) with
`#check @name` for the three declarations and for the five library declarations the README names:
the only warnings are the two `sorry`s (lines 33 and 40 of the copy); each elaborated type equals
the worker's `signatures.md` entry; no section binder is lost (`poincare_3d_smooth` keeps
`T2Space`, `ChartedSpace`, `IsManifold (𝓡 3) ∞`, `SimplyConnectedSpace`, `CompactSpace`;
`smoothable_closed_three_manifold` keeps `T2Space`, `ChartedSpace`, `CompactSpace`;
`poincare_3d_topological` keeps `T2Space`, `ChartedSpace`, `SimplyConnectedSpace`,
`CompactSpace`). Nothing changed. The README's generality equals the Lean's (lines 16–21,
1355–1360, 1410–1413, 1448–1453).

**Headlines and padding.** The README's headline theorems: the smooth Poincaré theorem (13.1),
compatible smoothing of closed topological three-manifolds (14.1), the topological Poincaré
theorem (15.1), surgery-flow existence (7.2), finite extinction (11.2), reconstruction (12.1). The
first three are stated (the third proved from the first two with `Diffeomorph.toHomeomorph`); the
last three are named in the docstring as not statable with the carriers each lacks (a
time-dependent metric family, reduced geometry, a surgery flow), none of which exists at the pins.
One-tactic probe: the two sorried statements are the ones probed at ab8645b (`simp`, `rfl`,
`infer_instance`, single lemmas all fail); I repeated `infer_instance` for `SimplyConnectedSpace
(sphere 0 1)` at the pin: it fails ("failed to synthesize"), so neither headline closes in one
tactic. No padding.

**Library declarations opened at the pins (Tau Ceti 358314d4, Mathlib f6090c70),** elaborated in
the probe: `TauCeti.TriangulationConjecture : ℕ → Prop` (`TauCeti/Topology/TriangulationConjecture.lean`
line 74; a `Prop`, unproved, as line 1393 says); `TauCeti.IsTriangulable`
(`TauCeti/Topology/Triangulable.lean` line 40); `HomotopyGroup.pathLoopSpaceMulEquiv : π_(m+1)(Ω X x)
≃* π_(m+2)(X, x)` (`TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean` line 361; `m = 1` is
9.1's shift); `ChartedSpace.secondCountable_of_sigmaCompact` (`[SecondCountableTopology H]
[SigmaCompactSpace M] → SecondCountableTopology M`, as lines 82–83 say); `TauCeti.GeometrizationConjecture :
Prop` (`TauCeti/LowDimTopology/Geometrization.lean` line 144).

**Cross-roadmap citations resolved** (every one, on main at a0ad405 or at the open head named):
GeometricTopology Layers 1, 2, 7, 8, 11 (lines 177, 289, 627, 696, 831), its Moise extract
(`references/moise-triangulation-dim3.md`, "Supports: layer 11", Theorems 35.3 and 36.2 at
printed pp. 252–253) and its disc theorem (lines 223–231); AlgebraicTopology Stages 1–6 and 8
(lines 289–1602) and 8.11a `basedLoopCWType` (lines 1949–1950); DifferentialGeometry Layers 0–3,
5–10, 12 (lines 268–912); HopfRinow Layers 0–4 (`Completed/HopfRinow/README.md` lines 229–495);
RiemannianGeometry R1–R5a (lines 179–1145), R4.9 (802, curve shortening on a smooth two-sphere, as
line 64 says), R7.0 (1295); PDE Lanes A, C–F (lines 223, 285–341); ComplexKahlerGeometry K5a (line
33); GeometricMeasureTheory G1–G2 (lines 106, 148). RicciFlow at its open head fff2322 (unchanged
since the previous review): Layers 1–5 with tags R1.1–R5.6 (lines 167–1076), its Scope excluding
surgery (line 71) and naming Poincare3D as the consumer of the convergence theorems (line 72), its
`## Downstream consumers` naming Poincare3D for Layers 1–5 (line 1655). RicciFlow R8.1's Harnack
is the surface case; 2.3's trace Harnack for complete flows with nonnegative curvature operator is
not planned there. The worker's citation check found no unresolved citation or Lean name; I
confirmed the two it would have missed (`poincare_conjecture`, `§8.6`) are gone.

**Ownership.** `roadmaps grep` over the 458 open pull requests and main (index of 2026-11-05):
Plateau/Douglas/branched minimal/harmonic replacement, curve shortening, free loop space,
PL-to-smooth/Cairns/smoothable, κ-solutions/canonical neighbourhoods/Hamilton–Ivey, filling
width. Ricci flow with surgery, reduced geometry, κ-solutions, canonical neighbourhoods, the
standard cap, loop-family width and curve shortening in a moving three-manifold are planned
nowhere else (RicciFlow excludes surgery; RiemannianGeometry R4.9 is curve shortening on a fixed
two-sphere; PositiveMass 3.3 builds coordinate-plane Plateau problems in an asymptotically flat end,
not Morrey's disk theorem; DGFloer's free-loop space is the `H¹` Morse-theoretic carrier and has
no evaluation-fibration comparison `π₂(Λ₀M) ≅ π₃(M)`, which Morgan–Tian Claim 18.16, mt07 line
19326, states on the `C¹` loop space 9.1 uses, mt07 line 19319; README line 59 names the shift). PlanarTopology's smoothing is
dimension two. The disc theorem is owned by GeometricTopology Layer 1 (R04). Dimension-three
PL-to-smooth: the GeometricTopology revision at its open head (§11.2) also plans it; a pull
request that revises a roadmap on main is not a supplier, the previous review asked this roadmap
to own the step until a revision lands on main, and the author's description records the overlap
for the human who merges: not a finding. Ownership against open pull requests was checked through
the sibling checkouts and the grep index.

**Sources read.** Cache ids: `mt07` = Morgan–Tian, Clay text (printed page = PDF page − 43);
`mt15` = arXiv 1512.00699v1; `hatcherAT` = Hatcher, *Algebraic Topology*, author-page text (the
service recorded it in the package manifest); `perelman03b`, `topping14`, `kl08` as in the
previous review. Locators checked at the text; the fifteen seeded sample targets are marked *:

- 1.1*: Hatcher §1.2 (Theorem 1.20, line 1956), §3.3 (Theorem 3.30, line 10453), §4.2 (Hurewicz
  4.32, line 15961); Whitehead 4.5 is §4.1 (R03).
- 1.2: mt07 Chapter 1 (table of contents, lines 150–200) and Definitions 9.72–9.78 (lines
  11304–11400: cap as ball or punctured `RP³`, C-component `S³` or `RP³`, ε-round, canonical
  neighbourhood, evolving neck).
- 1.3*: Definition 4.10 (line 4519: `|Rm| ≤ 1`, `Vol B(x,0,r) ≥ (ω_n/2) rⁿ` for `r ≤ 1`, all
  centres); `ν ≥ −1` is Theorem 4.26's hypothesis (line 4895).
- 2.1*: RicciFlow R1–R5 at fff2322 (above).
- 2.2*: Theorems 3.27–3.29 (lines 3767–3817): 3.28 has `T ≤ α/K`, `B(p,0,r)` of compact closure,
  `|Rm| ≤ K` on `P(x,0,r,T)`, conclusion `C_k t^{−k/2}` on `B(p,0,r/2) × (0,T]`, identical to
  lines 302–310; 3.29 adds initial `C^l` bounds on `U` and gives `t^{−max(k−l,0)/2}`, as lines
  311–314 say.
- 2.3: Theorem 4.26 (lines 4894–4900: `ν(x,0) ≥ −1`, `R ≥ −6/(4t+1)`, `R ≥ 2X(log X + log(1+t)
  − 3)` for `X = −ν > 0`), Theorem 4.37 (line 5088), Corollary 4.39 (line 5099).
- 2.4: Theorems 5.11 (line 5450) and 5.15 (line 5531).
- 3.1: Chapters 6–7 (contents lines 170–181), Theorem 7.26 (line 8527).
- 3.2*: Chapter 6; Definition 14.1 (line 15804, space-time with time function and time-slices),
  Definition 14.8 (line 16050, horizontal metric with `L_χ G = −2 Ric`, one-sided at exposed
  points).
- 3.3: Theorem 8.1 (line 8640, `κ(τ₀, l₀, V, n)`), Theorem 8.10 (line 8937: compact
  three-dimensional flows with `|Rm(·,0)| ≤ 1`, `Vol B(p,0,1) ≥ ω`, `r² ≤ t₀`).
- 4.1*: Definitions 9.1–9.2 (lines 9033–9045). Definition 9.2 asks bounded nonnegative curvature
  operator on each slice, connected, complete, nonflat; the README adds slab-boundedness and
  positive scalar curvature, both consequences (Corollary 4.39 gives `∂_t R ≥ 0`, so
  `sup R(·,t) ≤ sup R(·,0)` on `t ≤ 0`; the strong maximum principle gives `R > 0` on a nonflat
  slice): the same class.
- 4.2*: Theorem 9.4 (line 9055), Corollary 9.50 (line 10564), Theorem 9.42 (lines 10237–10253:
  dimension 2 or 3, κ-noncollapsed, complete nonflat bounded nonnegative curvature, gradient
  shrinking soliton; compact round, `S² × ℝ`, or its quotient by an isometric involution),
  Proposition 9.58 (line 10887, universal `κ₀` off the round branch; the three cylinder quotients
  at lines 10893–10895), Theorem 9.59 (line 10941).
- 5.1: Theorem 9.93 and Corollaries 9.94–9.95 (lines 11800–11844): canonical neighbourhoods for
  every point of a κ-solution unless it is `RP² × ℝ`, the derivative bounds (9.33)–(9.34)
  `|∇R| < C R^{3/2}`, `|∂_t R| < C R²`, and the exclusion for limits of flows with no two-sided
  `RP²`, as lines 615–629 state (the `RP²×ℝ` branch and its exclusion at lines 620–622).
- 5.2: Theorem 10.2 (line 11893), Assumptions 11.18 and Theorem 11.19 (lines 13213–13226).
- 6.1: Definition 12.1 (line 13730), Theorem 12.5 (line 13857).
- 6.2*: Chapters 13–15 (contents lines 219–232); Definition 15.8 (line 16595, the surgery operation
  with `δ(T)` and `r_{i+1}`), Proposition 15.3 (lines 16351–16395: pre-slice is a connected sum of
  the post-slice with `S²`-bundles over `S¹` and spherical space forms; discarded whole components
  are space forms, `RP³ # RP³` or `S²`-bundles, as 6.2's "multi-cap" clause allows), Lemma 15.11
  (line 16652).
- 7.1*: Definitions 14.1 and 14.8; Assumptions (1)–(7) (lines 16291–16339: compact slices with no
  two-sided `RP²`, discrete singular times, normalized initial data, exposed regions finite unions
  of balls, strong `δ(t)`-necks, canonical neighbourhoods on the disappearing region, maximal
  epochs), identical to 7.1's data list.
- 7.2: Theorem 15.9 (line 16610), Corollary 15.10 (line 16626, every compact three-manifold with no
  two-sided `RP²`, after normalizing), Lemma 17.12 (line 18612).
- 8.1*: Proposition 15.3, Definition 18.2 (line 18865, path of components), §18.3 (contents line
  250, text line 19311).
- 9.1*: §18.3 (line 19319: `ΛM` is the `C¹` loops with the `C¹` topology; Claim 18.16, line 19326,
  `π₂(ΛM,∗) ≅ π₃(M)` when `π₂(M) = 0`).
- 9.2: Definition 18.17 (line 19341, infimum of areas of Lipschitz spanning disks, continuous and
  reparametrization-invariant), Lemma 19.2 (line 19634).
- 9.3*: Morrey, Hildebrandt, Jost: not readable (below); the strict-gap compactness argument and
  the bubble removal are stated as built here.
- 9.4*: Lemma 19.15 (lines 20137–20144: `n ≥ 3`, degree-one ramps, `dμ/dt ≤ (2n−1) max|Rm| μ`),
  §19.7 (contents line 259, "annuli of small area"), Corollary 19.16 (line 20227, exponent
  independent of `λ`).
- 9.5: Lemmas 18.10 (line 19096) and 18.11 (line 19168).
- 9.6: Corollary 18.28 (line 19532); Lemma 18.27 (line 19511) is the criterion (R03).
- 10.1: §§19.1–19.2 and mt15 lines 10–34 (the missed connection-variation term, the extra term
  linear in `k`, the length-dependent constant; no effect on the compact-family application).
- 10.2*: Lemma 19.15, Corollary 19.16, Proposition 18.24 (lines 19470–19478: alternatives (i)
  length `< ζ`, (ii) area `≤ w_{A}(t₁) + ζ`), Lemma 19.31 (line 20823).
- 11.1: Proposition 18.18 (lines 19375–19384: `dW_ξ/dt ≤ −2π − ½ R_min W_ξ` as forward difference
  quotients, continuity off surgery times, `W_ξ(t) ≤ liminf` at surgery times).
- 11.2: Theorem 18.1 (line 18688); the case analysis at lines 19537–19576 (barrier `w(t₁) ≥ 0`
  versus `< 0`).
- 12.1: Proposition 15.3, Corollary 15.4(1) (lines 16402–16405).
- 13.1 and 15.1*: Corollary 0.2(a) (line 314).

**Adversarial table.** Values computed on each side.

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `poincare_3d_smooth` | `M = S³`; `S¹×S²`, `RP³`, Poincaré sphere; `∅`; `S³ ⊔ S³`; `ℝ³`; non-Hausdorff charted space | identity diffeomorphism; `π₁ = ℤ, ℤ/2, I*` so `SimplyConnectedSpace` fails; `SimplyConnectedSpace → PathConnectedSpace → Nonempty` excludes `∅`; disjoint union not path-connected; `ℝ³` not compact; `T2Space` fails | each counter-instance excluded by a hypothesis; conclusion is mt07 Cor 0.2(a) | none |
| `smoothable_closed_three_manifold` | `S³`; `S³ ⊔ S³`; `∅` | standard atlas; componentwise atlas (finitely many clopen components, lines 1417–1422); on `∅` every chart condition vacuous | true without `ConnectedSpace` | none |
| `poincare_3d_topological` | the proof term | `SimplyConnectedSpace → PathConnectedSpace`; `Diffeomorph.toHomeomorph` at `n = ∞` | elaborates with no `sorry` of its own | none |
| closed simply connected 3-manifold (1.1) | `H₁, H₂, H₃, π₂, π₃`; Poincaré sphere; `S²×S¹` | `H₁ = π₁^{ab} = 0`; `w₁ = 0`; `H₂ ≅ H¹ = 0`; `H₃ ≅ ℤ`; Hurewicz `π₂ = 0`, `π₃ ≅ H₃ ≅ ℤ`; Poincaré sphere: `I*` perfect so `H₁ = 0`, `H₂ = 0`, `H₃ = ℤ`, `π₁ ≠ 0`; `π₁(S²×S¹) = ℤ` | correct; Checks discriminate | R03 (Whitehead locator) |
| round models (1.2) | unit `S³`; antipodal quotient; `S²`-bundles over `S¹` | `R = n(n−1) = 6`; `π₁(RP³) = ℤ/2`; two bundles, the orientable one is `S²×S¹` | correct | none |
| normalized metric scaling (1.3) | `g ↦ Qg`, `Q ≥ 1`, `r ≤ 1`; collapsed flat torus | `vol_{Qg} B(x,r) = Q^{3/2} vol_g B(x, r/√Q) ≥ Q^{3/2}·½ω₃ (r/√Q)³ = ½ω₃ r³`; `|Rm|_{Qg} = Q⁻¹|Rm|_g`; `ν_{Qg} = Q⁻¹ ν_g ≥ −1`; flat `T³` with a circle of length `ℓ`: `|Rm| = 0`, `vol B(x,1) → 0` as `ℓ → 0` | all three conditions survive; the negative Check is right | none |
| Shi (2.2) | compare with Theorem 3.28; `k = 0`; `t → 0` | `T ≤ A/K`, `|Rm| ≤ K` on `B_{g(0)}(p,r)×[0,T]`, bound on `B(p,r/2)`, `C(n,k,K,A,r) t^{−k/2}`; `k = 0` gives the outer bound; `t^{−k/2} → ∞` | identical to the source | none |
| `R_min ≥ −6/(1+4t)` (2.3) | `r(t) = −6/(1+4t)` against `r′ = ⅔ r²`, `r(0) = −6` | `r′ = 24/(1+4t)²`; `⅔ r² = ⅔·36/(1+4t)² = 24/(1+4t)²`; `ν(0) ≥ −1 ⇒ R(0) = 2(λ+μ+ν) ≥ −6` | comparison function exact; Theorem 4.26(1) | none |
| Hamilton–Ivey (2.3) | hyperbolic `K ≡ −1`, `g(t) = (1+4t)g₀` | `ν = −1/(1+4t)`, `R = −6/(1+4t)`; `t = 0`: RHS `= 2·1·(0+0−3) = −6 = R`; `t > 0`: RHS `= (2/(1+4t))(log(1+t) − log(1+4t) − 3) < −6/(1+4t)` | equality at `t = 0`, strict after; Theorem 4.26(2) exact | none |
| Harnack (2.3) | shrinking cylinder, `R = 1/(1−t)`, `V = 0` | `∂_t R = 1/(1−t)² > 0` | consistent with Cor 4.39 | none |
| reduced volume (3.1, Conventions) | static `ℝⁿ` | `l = |x|²/4τ`; `∫(4πτ)^{−n/2} e^{−|x|²/4τ} dx = 1`; without `(4π)^{−n/2}`: `τ^{−n/2}(4πτ)^{n/2} = (4π)^{n/2}` | both Checks exact | none |
| noncollapse (3.3) | Euclidean balls; `S³/Γ`; flat `T² × S¹_ℓ`, `ℓ → 0` | `vol B = ω_n rⁿ`; volume `2π²/|Γ|` so `κ` depends on `|Γ|`; `vol B(x,1) ≤ Cℓ → 0` with `|Rm| = 0` | Checks discriminate | none |
| ancient κ-solution (4.1) | round shrinking `S³`; flat `ℝ³`; `S³ ⊔ S³`; Definition 9.2 | round: nonflat, `Rm ≥ 0`, `R = 6/(−4t+c) > 0`, κ-noncollapsed; flat fails nonflat and `R > 0`; disjoint union fails connected; slab bound follows from `∂_t R ≥ 0` | same class as Definition 9.2 | none |
| cylinder quotients (4.2) | `(x,z) ↦ (−x,−z)`; `RP² × ℝ` | antipodal reverses, `z ↦ −z` reverses, composite preserves orientation; `RP² × ℝ` nonorientable; twisted bundle is `RP³` minus a point (mt07 line 10895) | branches and the exclusion right | none |
| Theorem 9.42 hypotheses vs 4.2 | the asymptotic soliton | κ-noncollapsed, bounded nonnegative curvature, complete, nonflat; the flat Gaussian soliton is the separated branch | right reading | none |
| canonical neighbourhoods (5.1) | exact cylinder; ball cap; punctured `RP³`; `RP² × ℝ` | `R = 1` on the scalar-one cylinder; both caps have a neck end (Def 9.72(1)–(2)); `RP² × ℝ` is Theorem 9.93(7), excluded by Cor 9.95's no-two-sided-`RP²` hypothesis, which orientability gives | Checks discriminate | none |
| standard cap (6.1) | tip `f = 2 sin(r/2)`; cylinder `f = √2`; `f(0) > 0` | radial `−f″/f = ¼`, tangential `(1−f′²)/f² = ¼`; cylinder tangential `1/f² = ½`, radial `0`, `R = 2·½ = 1`; `f = √2` at `r = π/2` with `f′ = 1/√2`, so `r_tip < π/2` and a concave bridge with `f′ ↓ 0` exists (`0 ≤ f′ ≤ 1`, `f″ ≤ 0`); `f(0) > 0` gives a conical, not smooth, origin | consistent with Def 12.1; `S²(√2)` collapses at `t = 1`, matching `T = 1` | none |
| surgery topology (6.2) | empty neck collection; separating neck; `RP³ # RP³` | identity; two capped children sharing the common region; the double-capped tube is the multi-cap clause (mt07 line 16369) | matches Prop 15.3 | none |
| surgery data (7.1) | single epoch, no events; empty slice | a product spacetime (Example 14.10, line 16061); empty manifolds are closed, continue empty | Checks hold | none |
| volume loss `c h³/δ` (7.2) | half a `δ`-neck of scale `h` | length `δ⁻¹h`, cross-section `≈ 8πh²`, removed `≈ 8πδ⁻¹h³`, cap sewn in `≤ (1+ε)Kh³`, `δ < K⁻¹`; growth `dVol/dt = −∫R ≤ (6/(1+4t)) Vol`, so `Vol(t) ≤ Vol(0)(1+4t)^{3/2}` | correct; source misprint `h²` (below) | none |
| ancestry (8.1) | no events; separating neck; discarded component | epoch identification; each child has one parent; no descendant | Checks hold | none |
| `π₂(Λ₀M, const) ≅ π₃(M)` (9.1) | fibration `ΩM → ΛM → M`, constant-loop section; `M = S³`; `S¹ × S²` | `π₂(ΛM) ≅ π₂(ΩM) ⊕ π₂(M) = π₃(M) ⊕ 0`; `π₂(ΩM) ≅ π₃(M)` is `pathLoopSpaceMulEquiv 1`; `S³`: `ℤ`; a loop winding the circle lies in a nontrivial component (components are conjugacy classes, mt07 line 19321) | true; Claim 18.16 agrees | none |
| filling area (9.2) | constant loop; `g ↦ Qg`; winding-one ramp | area `0`; 2-Jacobian scales by `Q`; a non-nullhomotopic loop has no spanning disk | Checks discriminate | none |
| Douglas gap (9.3) | annulus pinched to two disks; equality | the pinched competitor has area `Fill(γ₀) + Fill(γ₁)`, so the strict inequality excludes it; at equality no attainment conclusion | hypothesis necessary, as the Checks say | none |
| ramps (9.4, 10.2) | graph `θ ↦ (γ(θ),θ)`; `λ → 0` | circle projection has degree one, so the ramp is not nullhomotopic in `M × S¹_λ`; core-curve length `≥ λ`, so modulus bounds degenerate as `λ → 0` | Checks discriminate; Lemma 19.15's exponent `(2n−1) max|Rm|` is `λ`-free | none |
| `A′ ≤ −4π − (ρ/2)A` (9.5) | minimal sphere, Gauss equation in dimension 3; `S² × S¹` | `d/dt Area = −∫(R − Ric(ν,ν)) = −∫(R/2 + K_M(TΣ))`, `K_M(TΣ) = K_Σ − κ₁κ₂ ≥ K_Σ` on a minimal surface, `∫K_Σ = 2π(2 + Σ b_i) ≥ 4π` with branch orders `b_i ≥ 0`; `π₂(S²×S¹) = ℤ` | matches Lemma 18.11; branch points only help | none |
| width (9.6) | constant family; `g ↦ Qg`; short loops | `w = 0`; `w, W` scale by `Q`; Lemma 18.27 needs `π₂ = 0` and `ζ <` injectivity radius | Checks hold | R03 (locator) |
| `D⁺W ≤ −2π + 3W/(1+4t)` (11.1) | needs `W ≥ 0` | `−(R_min/2)W ≤ (3/(1+4t))W` | stated with `W ≥ 0` | none |
| profile `G` (11.1) | `G = (W₀+2π)(1+4t)^{3/4} − 2π(1+4t)` | `G(0) = W₀ + 2π − 2π = W₀`; `G′ = 3(W₀+2π)(1+4t)^{−1/4} − 8π`; `−2π + 3G/(1+4t) = −2π + 3(W₀+2π)(1+4t)^{−1/4} − 6π` = same; `G < 0` once `(1+4t)^{1/4} > 1 + W₀/2π` | identity exact | none |
| integrated bound (11.2) | `u = (1+4t)^{−3/4} W` | `u′ ≤ (1+4t)^{−3/4}(−2π + 3W/(1+4t)) − 3(1+4t)^{−7/4}W = −2π(1+4t)^{−3/4}`; `∫₀ᵀ (1+4t)^{−3/4} dt = (1+4T)^{1/4} − 1`; a jump `e_j` at `t_j` adds `(1+4t_j)^{−3/4} e_j` | displayed inequality exact; `e_j = 0` is Proposition 18.18's `liminf` clause | none |
| reconstruction (12.1) | two-event prefix; terminal deletion; empty expression | composition of two Prop 15.3 identifications; the terminal event has empty post-slice (Cor 15.4(1)); the empty connected sum is `S³` by convention with a separate nonempty initial component | consistent with Cor 15.4(1) | none |
| factor classification (13.1) | `S³/Γ` simply connected; `S² × S¹`; `S³ # S³` | `Γ` trivial, round metric gives `S³` by Killing–Hopf (R4 item 7); `π₁ = ℤ` excluded; `D³ ∪_id D³ = S³` after the disc theorem | correct; the extension step is the disc theorem | R04 |
| smoothing (14.1) | `S³`; two spheres; `∅`; triangulable versus PL | standard atlas; componentwise; vacuous; Manolescu's five-manifolds are the separating instance (GeometricTopology Layer 11) | Checks discriminate; proof route needs Moise 35.3/36.2 (Layer 11) and a PL-to-smooth source | R02 (locator) |
| endpoint transport (15.1) | metric versus `T2`; second countable alone | a metric space is Hausdorff; compactness and charts give second countability; second countability does not give Hausdorffness (line with two origins) | Checks discriminate | none |

## Not verifiable

- C. B. Morrey, Ann. Math. 49 (1948), pp. 807–851 (lines 984, 1550): JSTOR, paywalled; no copy at
  arXiv, Numdam, EuDML, Project Euclid or an author page. Cited by locator only.
- S. Hildebrandt, Arch. Rational Mech. Anal. 35 (1969), pp. 47–82 (line 1552): Springer, paywalled;
  the service recorded it `uncertified`.
- J. Jost, J. reine angew. Math. 359 (1985), pp. 37–54 (lines 987–988, 1555): De Gruyter, paywalled; not found
  at GDZ by the service. Cited by locator only.
- S. Cairns, Ann. Math. 41 (1940), Theorem III (lines 1405, 1575): JSTOR, paywalled. Cited by locator only.
- A. J. S. Hamilton, Q. J. Math. 27 (1976), Theorem 2(1) (line 1571): Oxford Academic, HTTP 403.
  Cited by locator only.
- E. Moise, GTM 47, Chapters 35–36: Springer, paywalled; the GeometricTopology extract on main
  quotes Theorems 35.3 and 36.2 from printed pp. 252–253, which agrees with line 1392.
- Chow–Knopf, Surv. 110; Chow et al., Surv. 144 "Chapter 15" and Surv. 163 "Chapter 26" (lines
  1523–1535): AMS e-books, paywalled; chapter attributions not checked.
- Perelman, arXiv math/0211159 and math/0303109 (lines 1558–1562): cited without locators;
  nothing to check.
- The four paywalled texts are listed in the job's `needs-references.toml` (jost85, morrey48,
  cairns40, hamilton76); the review is not parked.

## Source issues

- **Misprint** in mt07 at Corollary 18.28, printed p. 434 (line 19533): the source says that a
  loop of length less than η bounds a disk of area less than η, leaving the ζ it introduces unused;
  it should say a loop of length less than ζ, as its use at line 19547 reads; affects nothing.
- **Misprint** in mt07 at Lemma 17.12, proof, printed p. 410 (line 18632): the source says that
  removing half a δ-neck of scale h lowers the volume by at least δ⁻¹h²/2; it should be δ⁻¹h³/2,
  volume scaling as the cube of the scale; affects nothing (only a positive lower bound is used).
- **Error** in mt07 at Lemma 19.7 and Corollary 19.10, Section 19.2, printed pp. 441–445: the
  source's evolution equation for the curvature of a curve under curve shortening in a Ricci flow
  omits the time derivative of the Levi-Civita connection, so the total-curvature bound lacks a term
  linear in the curvature; it should include that term, making the bound depend on the initial
  length as well; affects the proof (the application to a compact family survives); corrected in
  print at Morgan–Tian, *Correction to Section 19.2*, arXiv 1512.00699.
