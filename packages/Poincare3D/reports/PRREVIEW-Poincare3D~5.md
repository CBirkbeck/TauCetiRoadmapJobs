# Review of Poincare3D (pull request #1740 at 81c2de1)

**Verdict:** needs changes

No blocking finding. The push gate passes at this head, the previous review's four findings are
repaired, and the mathematics checked out everywhere I computed it (table under *Verified
sound*). Three P3 requests remain: the pinned Mathlib's own statements of the two headlines are
not cited (R01), 14.1 puts a far-horizon supplier on the headline's critical path through one
`*Needs:*` line (R02), and one Lean name is absent from the README (R03).

**Repair status of the previous review's findings (r4 at c3ef974).**

- R01 (gate `layer-ids`, shape residue): repaired. The fifteen headings read `## Layer k:` (lines
  168, 267, 415, 521, 606, 692, 780, 859, 909, 1125, 1208, 1299, 1352, 1409, 1477; the worker's
  gate: `layer-ids=0`); `## Worked examples` at line 1534 with its six items; the "Completion
  checks" sentence is gone; lines 491–492 read "Include the Euclidean reduced-volume calculation,
  shrinking models, positive-start conversion and scale invariance in the API"; the
  `**From Mathlib.**` paragraph at lines 43–47 names the declarations formerly under Conventions.
- R02 (Munkres §10 cited for PL-to-smooth): repaired, by a different route. Lines 1423–1437 build
  the smooth atlas from Cairns, Theorem III (the normal-position construction, §§7–11), then obtain
  compatibility with the prescribed PL structure by smoothly triangulating the smooth manifold
  (Munkres, Theorem 10.6, cited now for what it proves, smooth-implies-PL), applying the
  dimension-three Hauptvermutung (Moise 36.2, GeometricTopology Layer 11) to get a PL
  homeomorphism from the prescribed PL manifold to that smooth triangulation, and pulling the
  atlas back along it. The relative form is dropped (lines 1423–1424 ask only for existence). The
  route is correct: with `(M, P)` the prescribed PL manifold, `S` the Cairns smooth structure,
  `T` a smooth triangulation of `(M, S)` with PL structure `P′`, Moise 36.2 gives a PL
  homeomorphism `h : (M, P) → (M, P′)`, and `h*S` is a smooth structure on the carrier `M`
  compatible with `P` because `S` is compatible with `P′`. The locators agree with the supplier's
  extracts (below). One consequence of the new route is R02 below.
- R03 (two locator slips): repaired. Lines 1093–1097: "§18.3, Definition 18.17 for family and
  class width; §18.4.2, Lemma 18.27 for the short-loop criterion and Corollary 18.28 for the
  small-loop filling bound, both on p. 434" (mt07 lines 19341, 19511, 19532; Lemma 18.27 and
  Corollary 18.28 lie on PDF page 477 = printed p. 434, under the heading "4.2. A reduction of
  Proposition 18.18" at line 19458; Definition 18.17 under "3.1" at line 19318). Lines 181–183:
  Hatcher Theorem 1.20 (line 1956), 3.30 (line 10453), 4.5 at §4.1 p. 346 (line 15109, PDF page
  355 = printed 346), 4.32 (line 15961).
- R04 (13.1's sphere-boundary extension target with no locator): repaired. Lines 1363–1374
  identify the boundary gluing with the standard connected-sum identification through the product
  neck (new 6.2 sentences, lines 745–748; 12.1 lines 1313–1315) and consume GeometricTopology
  Layer 1's disc theorem, Hirsch Theorem 6.6, Chapter 4 §6, p. 117, which is exactly the
  supplier's extract (`TauCetiRoadmap/GeometricTopology/references/hirsch-disc-theorem.md`,
  "Locus" line and the quoted theorem); 13.1's `*Needs:*` line (1397–1398) and Dependencies
  (1406–1407) list it; the Layer 13 row of the build table now also lists Layer 6 (line 156).

## R01 (P3) — duplication: the pinned Mathlib states both headlines and is not cited

Location: `TauCetiRoadmap/Poincare3D/README.md` lines 43–47 (`**From Mathlib.**`), 1378–1384
(13.1, "Assemble `poincare_3d_smooth` with exactly the hypotheses displayed in
`Suggested.lean`"), 1481–1488 (15.1); `TauCetiRoadmap/Poincare3D/Suggested.lean` lines 5–19
(module docstring) and 28–47.

Claim: the two headlines are stated as this roadmap's own targets, with no reference to a library
statement of the Poincaré conjecture.

Witness: at the pinned Mathlib, `Mathlib/Geometry/Manifold/PoincareConjecture.lean` line 41
defines `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M n : Prop` (for every charted
smooth structure on a `T2Space M`, `M ≃ₕ 𝕊ⁿ → Nonempty (M ≃ₘ⟮𝓡 n, 𝓡 n⟯ 𝕊ⁿ)`), and
`Wanted/Geometry/Manifold/PoincareConjecture.lean` lines 32–40 record as `proof_wanted`
`SimplyConnectedSpace.nonempty_homeomorph_sphere_three` and
`SimplyConnectedSpace.nonempty_sdiffeomorph_sphere_three`, whose hypotheses and conclusions are,
binder for binder, `poincare_3d_topological` and `poincare_3d_smooth` (the `Wanted` directory is
outside the `Mathlib` module, so neither is a declaration at the pin; `NonemptyDiffeomorphSphere`
is). The HomotopySpheres roadmap at its open head cites that file and line for the same object
(`TauCetiRoadmap/HomotopySpheres/README.md` lines 419–422), which is the house practice.

Repair: in `**From Mathlib.**` add "The smooth Poincaré statement
`ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere` (`Mathlib/Geometry/Manifold/PoincareConjecture.lean`)
is the library's form of the smooth endpoint; the two endpoints of `Suggested.lean` are the
dimension-three statements Mathlib records as wanted,
`SimplyConnectedSpace.nonempty_homeomorph_sphere_three` and
`SimplyConnectedSpace.nonempty_sdiffeomorph_sphere_three`
(`Wanted/Geometry/Manifold/PoincareConjecture.lean`), stated here under the same hypotheses."
Say the same in the module docstring of `Suggested.lean`. Then add to 15.1 (or 13.1) the adapter
targets to Mathlib's homotopy-equivalence forms: from `M ≃ₕ 𝕊³` deduce `SimplyConnectedSpace M`
(homotopy invariance of `π₁`, AlgebraicTopology Stage 1) and `CompactSpace M` (a connected
noncompact three-manifold has `H₃ = 0`, Hatcher, Proposition 3.29, p. 239; name its supplier,
AlgebraicTopology Stage 6 if it states it, else make it a target of 1.1), and conclude
`NonemptyDiffeomorphSphere M 3` and `HomotopyEquiv.nonempty_homeomorph_sphere` at `n = 3`; state
`theorem poincare_3d_smooth_homotopyEquiv … : ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M 3`
in `Suggested.lean` (it is statable at the pin and needs no new definition), and name it in 15.1.

## R02 (P3) — build order: 14.1's one `*Needs:*` line puts GeometricTopology's far-horizon comparison on the headline's path

Location: `README.md` lines 1465–1466 ("*Needs:* GeometricTopology Layers 1 and 11, including
Moise 35.3/36.2, and its smooth-implies-PL comparison; native manifold and realization APIs"),
with the statements at lines 1413–1444.

Claim: 14.1 contains three statements with different needs: (a) every compact Hausdorff
topological three-manifold carries some smooth atlas on its own topology, which is the Lean
headline `smoothable_closed_three_manifold` (lines 1439–1444: an alternative `ChartedSpace` with
an `IsManifold (𝓡 3) ∞ M` witness, nothing about a PL structure); (b) for a PL three-manifold a
smooth structure *compatible with the prescribed PL structure* (lines 1423–1437); (c) the
componentwise and empty-carrier adapter. Route (a) needs only Layer 11's Moise 35.3 (through
Layer 1's realization) and Cairns, Theorem III; route (b) additionally needs Munkres 10.6 from
GeometricTopology's smooth-implies-PL comparison and Moise 36.2. The single `*Needs:*` line
makes the headline's implementer wait for all of them.

Witness: `TauCetiRoadmap/GeometricTopology/README.md` on main, lines 930–942: the
smoothing-and-triangulation comparison "sits here, after the layers, on purpose", is "arguably its
own roadmap", and its item 1 (smooth implies PL, Whitehead/Munkres) is "already a substantial body
of work"; line 270 calls it "a major sub-project of its own". It is not a layer target of
GeometricTopology. The brief's rule: a target's `*Needs:*` line lists what its statement and its
route need, item by item, so that an implementer is not blocked behind an unrelated piece.

Repair: split 14.1 into "14.1 Smooth atlas on a closed topological three-manifold" (the headline,
`*Needs:* GeometricTopology Layers 1 and 11, including Moise 35.3; Cairns, Theorem III; native
manifold and realization APIs`) and "14.2 Compatibility with the prescribed PL structure"
(`*Needs:* 14.1; GeometricTopology Layer 11 Hauptvermutung, Moise 36.2; GeometricTopology's
smoothing-and-triangulation comparison, item 1 (smooth implies PL, Munkres Theorem 10.6)`), each
with its API bullets and three Checks (14.1 keeps the sphere, two-spheres and triangulability
Checks; 14.2 keeps the pullback Check at line 1463 and adds, for instance, that a smooth
triangulation of the pulled-back atlas is PL homeomorphic to the prescribed one, and that the
pulled-back atlas induces the original topology). Update the Layer 14 Dependencies (lines
1474–1475), the build-table row (line 157) and the `## How to read the build` sentence (lines
162–163) accordingly.

## R03 (P3) — README and Lean disagree: `poincare_3d_topological` is not named in the README

Location: `README.md` lines 1481–1486 ("… forget the smooth structure of its diffeomorphism to
obtain the exact topological `Homeomorph` endpoint in `Suggested.lean`"); `Suggested.lean` line
44.

Claim: the house rule is that every Lean name appears in the README. `poincare_3d_smooth` (line
1378) and `smoothable_closed_three_manifold` (line 1439) do; the third declaration is described
but never named.

Witness: `grep -n poincare_3d_topological README.md` returns nothing; the gate's
`readme-ids-missing` checks only the converse direction.

Repair: in 15.1 write "… to obtain `poincare_3d_topological`, the exact topological `Homeomorph`
endpoint in `Suggested.lean`" (and, with R01, say that it is Mathlib's wanted
`SimplyConnectedSpace.nonempty_homeomorph_sphere_three`).

## Verified sound

**Gate, diff and dependency check.** The worker's gate at 81c2de1: `set_option=0 blob=0 latex=0
tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0
mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0
empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0
stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. `git diff --stat
origin/main...HEAD -- . ':!TauCetiRoadmap/Poincare3D'` is empty; the folder holds `README.md`,
`Suggested.lean` and `metadata.toml` (`topic = "math.GT"`). `git diff c3ef974 HEAD --
Suggested.lean metadata.toml` is empty: the 157 changed lines are all in the README, as the
author's description says. The dependency check with the candidate merge order and `--movable`:

    depcheck: 230 roadmaps, 2135 edges, 0 problem(s)

No UPWARD or CYCLE line. The candidate order lists Poincare3D (line 204) directly after RicciFlow
(line 203), its only supplier not on main.

**Elaboration and signatures.** A scratch copy of `Suggested.lean` with `#check @name` for the
three declarations and for the Mathlib declarations the README names, plus two one-tactic probes,
elaborated with `lake env lean` in 5 s: the only warnings are the two `sorry`s (lines 29 and 36
of the copy). Each elaborated type equals the worker's `signatures.md` entry; no section binder
is lost (`poincare_3d_smooth` keeps `T2Space`, `ChartedSpace`, `IsManifold (𝓡 3) ∞`,
`SimplyConnectedSpace`, `CompactSpace`; `smoothable_closed_three_manifold` keeps `T2Space`,
`ChartedSpace`, `CompactSpace`; `poincare_3d_topological` keeps `T2Space`, `ChartedSpace`,
`SimplyConnectedSpace`, `CompactSpace`). The README's generality equals the Lean's (lines 16–21,
1378–1384, 1439–1444, 1481–1486). Nothing changed.

**Headlines and padding.** The README's headline theorems: the smooth Poincaré theorem (13.1),
smoothing of closed topological three-manifolds (14.1), the topological Poincaré theorem (15.1),
surgery-flow existence (7.2), finite extinction (11.2), reconstruction (12.1). The first three
are stated (the third proved from the first two through `Diffeomorph.toHomeomorph`, whose type I
printed at the pin); the last three are named in the module docstring (lines 12–18) as not
statable, with the carriers each lacks (a time-dependent metric family, reduced geometry, a
surgery flow), none of which exists at the pins. Mathlib's homotopy-equivalence form of the smooth
headline is statable and absent (R01). One-tactic probe on the two sorried statements:
`infer_instance`, `simp`, `exact ⟨Diffeomorph.refl _ _ _⟩` (type mismatch) and
`exact ⟨_, inferInstance⟩` all fail ("probe1 open", "probe2 open" in the elaboration output). No
padding.

**Library declarations opened at the pins (Tau Ceti 358314d4, Mathlib f6090c70).**
`TauCeti.TriangulationConjecture : ℕ → Prop` (`TauCeti/Topology/TriangulationConjecture.lean`
line 74); `TauCeti.IsTriangulable` (`TauCeti/Topology/Triangulable.lean` line 40);
`HomotopyGroup.pathLoopSpaceMulEquiv` (`TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean`
line 361); `TauCeti.GeometrizationConjecture : Prop` (`TauCeti/LowDimTopology/Geometrization.lean`
line 144); `ChartedSpace.secondCountable_of_sigmaCompact` (elaborated: `[SecondCountableTopology H]
[SigmaCompactSpace M] → SecondCountableTopology M`, as lines 46–47 say);
`Bundle.ContMDiffRiemannianMetric` (`Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean` line
244, inside `namespace Bundle`); `HomotopyGroup.Pi` (`Mathlib/Topology/Homotopy/HomotopyGroup.lean`
line 458, notation `π_`); `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere`
(`Mathlib/Geometry/Manifold/PoincareConjecture.lean` line 41, R01).

**Cross-roadmap citations resolved** (every one, on main at 8e3fb52 or at the open head named).
GeometricTopology: Layer 1 (line 223–231: connected sum takes the ball embeddings, independence
from the disc theorem, Hirsch Theorem 6.6, extract), Layer 2 (289), Layer 7 (627), Layer 8 (696;
lines 738–740 name the Poincaré conjecture as the special case its geometrization statement
yields, which 15.1 adapts to), Layer 11 (831; triangulation and Hauptvermutung, Moise 35.3 and
36.2 at printed pp. 252–253 in `references/moise-triangulation-dim3.md`), the
smoothing-and-triangulation comparison (930–942, item 1 smooth implies PL; R02) and its Munkres
extract (`references/munkres-smoothing-triangulations.md`: Theorem 10.5 p. 103, Theorem 10.6
pp. 103–104, as lines 1432–1433 and 1607–1609 cite). AlgebraicTopology Stages 1, 6, 8 (lines 289,
946, 1602) and 8.11a `basedLoopCWType` (1949–1950). DifferentialGeometry Layers 0–3, 5, 10, 12
(268–910). HopfRinow Layers 0–4 (`Completed/HopfRinow/README.md` lines 229–495). RiemannianGeometry
R1 (179), R4.9 (802, curve shortening on a fixed two-sphere, as lines 75–76 say), R5a (1044), R7.0
(1295). PDE Lanes A, C–F (223–341). ComplexKahlerGeometry K5a (33). GeometricMeasureTheory G1–G2
(106, 148). RicciFlow at its open head fff2322 (unchanged since the previous review): R1.1–R5.6
(lines 169–1042), Scope excluding surgery and naming Poincare3D as the consumer of its convergence
theorems (71–72), `## Downstream consumers` naming Poincare3D for Layers 1–5 (1655–1657). The
worker's citation check found no unresolved citation or Lean name; I confirmed the four new ones
(disc theorem, Hirsch extract, Munkres extract, smooth-implies-PL comparison).

**Ownership.** `roadmaps grep` over the 450 open pull requests and main (index of 2026-11-05):
"Ricci flow with surgery" (only RicciFlow, which excludes it), "finite extinction" (only
RiemannianGeometry's moving-disk formula, a different object), "κ-solution", "canonical
neighbourhood", "filling width" (none), "Cairns" (GeometricTopology's far-horizon section and
Orbifolds' Yang/Cairns route, neither a dimension-three smoothing), "compatible smoothing" (only
PlanarTopology, dimension two, and FourManifolds' Freedman–Quinn remark), "Plateau"
(GeometricCurrents G5 is the Euclidean integral-current Plateau problem, not Morrey's mapping
problem; PositiveMass 3.3 is coordinate-plane Plateau in an asymptotically flat end), "Poincaré
conjecture" (GeometricTopology's revision pull request plans the topological statement from the
pinned geometrization proposition, which is not a supplier; HomotopySpheres' Layer 10 recognition
is dimension ≥ 5 with explicit compactness; FourManifolds and MorseTheory only exclude it). Ricci
flow with surgery, reduced geometry, κ-solutions, canonical neighbourhoods, the standard cap,
loop-family width, curve shortening in a moving three-manifold, and dimension-three smoothing are
planned nowhere else among the files this brief gives me. Ownership against open pull requests was
checked through the sibling checkouts and the grep index.

**Sources read.** Cache ids: `mt07` = Morgan–Tian, Clay text (printed page = PDF page − 43);
`mt15` = arXiv 1512.00699v1; `hatcherAT` = Hatcher, *Algebraic Topology*, author-page text
(printed page = PDF page − 9). Locators checked at the text this round; the fifteen seeded sample
targets are marked *:

- 1.1*: Hatcher Theorem 1.20 (line 1956, van Kampen), 3.30 (10453, duality), 4.5 (15109, §4.1,
  printed p. 346), 4.32 (15961, Hurewicz); Proposition 3.29 (10370) for R01's adapter.
- 1.2*: mt07 Definitions 9.72–9.78 (lines 11304–11400: cap, C-component, ε-round, canonical
  neighbourhood, evolving neck).
- 1.3: Definition 4.10 (4519–4522).
- 2.1*: RicciFlow R1.1–R5.6 at fff2322 (above).
- 2.2: Theorems 3.27–3.29 (3767–3817), as in the previous review.
- 2.3*: Theorem 4.26 (4894–4900: `ν(x,0) ≥ −1`, `R ≥ −6/(4t+1)`, `R ≥ 2X(log X + log(1+t) − 3)`
  for `X = max(−ν, 0) > 0`), Theorem 4.37 (5088–5091, complete, nonnegative curvature operator,
  bounded curvature on each slice), Corollary 4.39 (5099–5103, `∂R/∂t ≥ 0` on ancient flows).
- 3.1, 3.2: Theorem 7.26 (8527), Definitions 14.1 and 14.8 (15804, 16050).
- 3.3*: Theorem 8.1 (8640–8643, `κ(τ₀, l₀, V, n)`), Theorem 8.10 (8937–8940, `|Rm(p,0)| ≤ 1`,
  `Vol B(p,0,1) ≥ ω`, `T ≤ T₀`).
- 4.1: Definitions 9.1–9.2 (9033–9045).
- 4.2*: Theorem 9.4 (9055, orientable two-dimensional κ-solutions are shrinking round spheres),
  Corollary 9.50(3) (10571–10572, every two-dimensional κ-solution is a shrinking family of
  compact round surfaces; item (1) carries a self-reference misprint, below), Theorem 9.42
  (10237–10240), Proposition 9.58 (10887–10888, universal `κ₀` for non-round solutions), Theorem
  9.59 (10941–10942, zero asymptotic volume).
- 5.1, 5.2: Theorem 9.93, Corollaries 9.94–9.95 (11800–11844); Theorem 10.2 (11893), 11.19
  (13213–13226).
- 6.1, 6.2: Definition 12.1 (13730–13733), Theorem 12.5 (13857); Definition 15.8 (16595),
  Proposition 15.3 (16351–16395), Lemma 15.11 (16652).
- 7.1, 7.2: Assumptions (1)–(7) (16291–16339); Theorem 15.9 (16610–16613), Corollary 15.10
  (16626–16629, compact three-manifold with no two-sided `RP²`), Lemma 17.12 (18612–18615).
- 8.1: Proposition 15.3, Definition 18.2 (18865), §18.3 (19311).
- 9.1, 9.2: Claim 18.16 (19326), Definition 18.17 (19341–19346), Lemma 19.2 (19634).
- 9.3*: Morrey, Hildebrandt, Jost: not readable (below); the strict-gap compactness and bubble
  removal are stated as built here.
- 9.4: Lemma 19.15 (20137–20140), §19.7, Corollary 19.16 (20227–20230).
- 9.5*: Lemmas 18.10 (19096–19099) and 18.11 (19168–19171, `dW₂/dt ≤ −4π − ½ R_min W₂`).
- 9.6*: Definition 18.17 (19341), Lemma 18.27 (19511–19514), Corollary 18.28 (19532–19534), both
  on printed p. 434 under §4.2 of Chapter 18.
- 10.1*: §§19.1–19.2 (19596–19621) and mt15 lines 10–34 (the missed connection-variation term,
  the extra term linear in `k`, the length-dependent constant, no effect on the compact-family
  application).
- 10.2*: Lemma 19.15, Corollary 19.16, Proposition 18.24 (19470–19478), Lemma 19.31 (20823–20826).
- 11.1*: Proposition 18.18 (19375–19384: `dW_ξ/dt ≤ −2π − ½ R_min W_ξ` as forward difference
  quotients, continuity off surgery times, `W_ξ(t) ≤ liminf` at surgery times).
- 11.2*: Theorem 18.1 (18688–18691); the barrier case analysis (19537–19576).
- 12.1: Proposition 15.3, Corollary 15.4(1) (16402–16405).
- 13.1* and 15.1*: Corollary 0.2(a) (314–315); Hirsch Theorem 6.6 and Munkres 10.5–10.6 through
  the GeometricTopology extracts; Moise 35.3/36.2 through its extract.

**Adversarial table.** Values computed on each side; rows marked † are new or recomputed for
passages this head changed.

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `poincare_3d_smooth` | `M = S³`; `S¹×S²`, `RP³`, Poincaré sphere; `∅`; `S³ ⊔ S³`; `ℝ³`; non-Hausdorff charted space | identity diffeomorphism; `π₁ = ℤ, ℤ/2, I*` so `SimplyConnectedSpace` fails; `SimplyConnectedSpace → PathConnectedSpace → Nonempty` excludes `∅`; disjoint union not path-connected; `ℝ³` not compact; `T2Space` fails | each counter-instance excluded by a hypothesis; conclusion is mt07 Cor 0.2(a); binders equal Mathlib's wanted `nonempty_sdiffeomorph_sphere_three` | R01 (cite) |
| `smoothable_closed_three_manifold` | `S³`; `S³ ⊔ S³`; `∅` | standard atlas; componentwise atlas (finitely many clopen components, lines 1446–1451); on `∅` every chart condition vacuous | true without `ConnectedSpace` | none |
| `poincare_3d_topological` | the proof term | `SimplyConnectedSpace → PathConnectedSpace`; `Diffeomorph.toHomeomorph` at `n = ∞` | elaborates with no `sorry` of its own; binders equal Mathlib's wanted `nonempty_homeomorph_sphere_three` | R01, R03 |
| † Mathlib form `NonemptyDiffeomorphSphere M 3` from the stated headline | `M ≃ₕ S³`, `M` a Hausdorff 3-manifold, not assumed compact or second countable | `π₁(M) ≅ π₁(S³) = 0`, `M` path-connected; `H₃(M) ≅ H₃(S³) = ℤ ≠ 0`, while Hatcher Prop 3.29 gives `H₃ = 0` for connected noncompact manifolds (no countability used), so `M` is compact; then `poincare_3d_smooth` applies | statable at the pin; derivable with 1.1's suppliers | R01 |
| closed simply connected 3-manifold (1.1) | `H₁, H₂, H₃, π₂, π₃`; Poincaré sphere; `S²×S¹` | `H₁ = π₁^{ab} = 0`; `w₁ = 0`; `H₂ ≅ H¹ = 0`; `H₃ ≅ ℤ`; Hurewicz `π₂ = 0`, `π₃ ≅ H₃ ≅ ℤ`; Poincaré sphere: `I*` perfect so `H₁ = 0`, `H₂ = 0`, `H₃ = ℤ`, `π₁ ≠ 0`; `π₁(S²×S¹) = ℤ` | correct; Checks discriminate; locators now exact | none |
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
| standard cap (6.1) | tip `f = 2 sin(r/2)`; cylinder `f = √2`; `f(0) > 0` | radial `−f″/f = ¼`, tangential `(1−f′²)/f² = ¼`; cylinder tangential `1/f² = ½`, radial `0`, `R = 2·½ = 1`; `f = √2` at `r = π/2` with `f′ = 1/√2`, so `r_tip < π/2` and a concave bridge with `f′ ↓ 0` exists; `f(0) > 0` gives a conical origin | consistent with Def 12.1 | none |
| surgery topology (6.2) | empty neck collection; separating neck; `RP³ # RP³` | identity; two capped children sharing the common region; the double-capped tube is the multi-cap clause (mt07 line 16369) | matches Prop 15.3 | none |
| † boundary parameterization of inserted balls (6.2, lines 745–748) | a separating neck `S² × (−ε⁻¹, ε⁻¹)` cut at `S² × {0}`; both children oriented from the parent | the left cap `B₁` meets its child along `S² × {0}` with the child on `z < 0`, the right cap `B₂` with its child on `z > 0`; the two ball embeddings `D³ → B₁`, `D³ → B₂` agree on `∂D³ = S² × {0}` and lie on opposite sides, so one preserves and one reverses the parent orientation; reversing the cut glues `∂(child₁ − B₁)` to `∂(child₂ − B₂)` by the identity of `S² × {0}` | exactly GeometricTopology Layer 1's connected-sum data (ball embeddings inducing opposite orientations, glued by the identification of ball boundaries) | none |
| surgery data (7.1) | single epoch, no events; empty slice | a product spacetime (Example 14.10, line 16061); empty manifolds are closed, continue empty | Checks hold | none |
| volume loss `c h³/δ` (7.2) | half a `δ`-neck of scale `h` | length `δ⁻¹h`, cross-section `≈ 8πh²`, removed `≈ 8πδ⁻¹h³`, cap sewn in `≤ (1+ε)Kh³`, `δ < K⁻¹`; growth `dVol/dt = −∫R ≤ (6/(1+4t)) Vol`, so `Vol(t) ≤ Vol(0)(1+4t)^{3/2}` | correct; source misprint `h²` (below) | none |
| ancestry (8.1) | no events; separating neck; discarded component | epoch identification; each child has one parent; no descendant | Checks hold | none |
| `π₂(Λ₀M, const) ≅ π₃(M)` (9.1) | fibration `ΩM → ΛM → M`, constant-loop section; `M = S³`; `S¹ × S²` | `π₂(ΛM) ≅ π₂(ΩM) ⊕ π₂(M) = π₃(M) ⊕ 0`; `π₂(ΩM) ≅ π₃(M)` is `pathLoopSpaceMulEquiv 1`; `S³`: `ℤ`; a loop winding the circle lies in a nontrivial component (components are conjugacy classes, mt07 line 19321) | true; Claim 18.16 agrees | none |
| filling area (9.2) | constant loop; `g ↦ Qg`; winding-one ramp | area `0`; 2-Jacobian scales by `Q`; a non-nullhomotopic loop has no spanning disk | Checks discriminate | none |
| Douglas gap (9.3) | annulus pinched to two disks; equality | the pinched competitor has area `Fill(γ₀) + Fill(γ₁)`, so the strict inequality excludes it; at equality no attainment conclusion | hypothesis necessary, as the Checks say | none |
| ramps (9.4, 10.2) | graph `θ ↦ (γ(θ),θ)`; `λ → 0` | circle projection has degree one, so the ramp is not nullhomotopic in `M × S¹_λ`; core-curve length `≥ λ`, so modulus bounds degenerate as `λ → 0` | Checks discriminate; Lemma 19.15's exponent is `λ`-free | none |
| `A′ ≤ −4π − (ρ/2)A` (9.5) | minimal sphere, Gauss equation in dimension 3; `S² × S¹` | `d/dt Area = −∫(R − Ric(ν,ν)) = −∫(R/2 + K_M(TΣ))`, `K_M(TΣ) = K_Σ − κ₁κ₂ ≥ K_Σ` on a minimal surface, `∫K_Σ = 2π(2 + Σ b_i) ≥ 4π` with branch orders `b_i ≥ 0`; `π₂(S²×S¹) = ℤ` | matches Lemma 18.11; branch points only help | none |
| † width and short loops (9.6, lines 1093–1097) | constant family; `g ↦ Qg`; loops of length `< ζ` with `ζ <` injectivity radius; the `η`/`ζ` quantifier order | `w = 0`; `w, W` scale by `Q`; Lemma 18.27: geodesic cones from `Γ(c)(x₀)` fill each loop, the family is homotopic to constant loops, `π₂ = 0` kills it; Corollary 18.28: `∀η ∃ζ<η/2` such that length `< ζ` gives a disk of area `< η`, so a family of such loops has `w < η` | the two locators and the quantifier order in the README agree with the text | none |
| `D⁺W ≤ −2π + 3W/(1+4t)` (11.1) | needs `W ≥ 0` | `−(R_min/2)W ≤ (3/(1+4t))W` | stated with `W ≥ 0` | none |
| profile `G` (11.1) | `G = (W₀+2π)(1+4t)^{3/4} − 2π(1+4t)` | `G(0) = W₀`; `G′ = 3(W₀+2π)(1+4t)^{−1/4} − 8π`; `−2π + 3G/(1+4t) = −2π + 3(W₀+2π)(1+4t)^{−1/4} − 6π` = same; `G < 0` once `(1+4t)^{1/4} > 1 + W₀/2π` | identity exact | none |
| integrated bound (11.2) | `u = (1+4t)^{−3/4} W` | `u′ ≤ (1+4t)^{−3/4}(−2π + 3W/(1+4t)) − 3(1+4t)^{−7/4}W = −2π(1+4t)^{−3/4}`; `∫₀ᵀ (1+4t)^{−3/4} dt = (1+4T)^{1/4} − 1`; a jump `e_j` at `t_j` adds `(1+4t_j)^{−3/4} e_j` | displayed inequality exact; `e_j = 0` is Proposition 18.18's `liminf` clause | none |
| † reconstruction (12.1, lines 1313–1315) | two-event prefix; terminal deletion; empty expression; a separating cut reversed | composition of two Prop 15.3 identifications; the terminal event has empty post-slice (Cor 15.4(1)); the empty connected sum is `S³` by convention with a separate nonempty initial component; reversal uses the 6.2 row's identity gluing, so the result is GeometricTopology's `connectedSum e₁ e₂` with the specified balls | consistent with Cor 15.4(1) and Layer 1's definition | none |
| † factor classification and `S³ # S³` (13.1, lines 1363–1374) | `S³/Γ` simply connected; `S² × S¹`; `S³ # S³` with the surgery balls | `Γ` trivial, round metric gives `S³` by Killing–Hopf; `π₁ = ℤ` excluded; after the disc theorem moves both balls to the standard hemisphere-ball, `S³ − int D³₊ = D³₋`, so `S³ # S³ = D³₋ ∪_{id} D³₋′ = S³` (two hemispheres glued along the equator by the identity, smooth through the collars of Layer 1's gluing); Hirsch 6.6 needs `Det D(f₁⁻¹f₀)(0) > 0`, which is the orientation-compatibility clause | correct; the locator matches the supplier's extract | none |
| † smoothing route (14.1, lines 1423–1437) | `S³`; two spheres; `∅`; a PL manifold `(M,P)` with Cairns structure `S`, smooth triangulation `T` with PL structure `P′` | Moise 36.2 applied to `id : |K_P| → |K_{P′}|` gives a PL homeomorphism `h : (M,P) → (M,P′)`; `h*S` is smooth on the carrier `M` and `P`-compatible since `S` is `P′`-compatible; on `∅` and on two spheres componentwise; without the detour, Cairns III alone gives the Lean headline | route sound; needs split for the headline | R02 |
| endpoint transport (15.1) | metric versus `T2`; second countable alone | a metric space is Hausdorff; compactness and charts give second countability; second countability does not give Hausdorffness (line with two origins) | Checks discriminate | R03 (name) |

## Not verifiable

- S. Cairns, Ann. Math. 41 (1940), Theorem III, p. 797, §§7–11, the convention on p. 796 (lines
  1425–1428, 1603–1606): JSTOR, paywalled; the sources service found no legal copy (its answer is
  recorded in the job's `needs-references.toml` under `cairns40`); nothing at arXiv, Numdam,
  EuDML, Project Euclid or an author page. Cited by locator only; the page and section numbers
  are the author's and are unchecked.
- C. B. Morrey, Ann. Math. 49 (1948), pp. 807–851 (lines 991, 1580–1581): JSTOR, paywalled; cited
  by locator only.
- S. Hildebrandt, Arch. Rational Mech. Anal. 35 (1969), pp. 47–82 (line 1582): the manifest
  records it `uncertified`.
- J. Jost, J. reine angew. Math. 359 (1985), pp. 37–54 (lines 994–995, 1585–1587): De Gruyter,
  paywalled; cited by locator only.
- A. J. S. Hamilton, Q. J. Math. 27 (1976), Theorem 2(1) (line 1602): Oxford Academic, HTTP 403.
- E. Moise, GTM 47, Chapters 35–36 (lines 1417, 1599–1600): Springer, paywalled; the
  GeometricTopology extract on main quotes Theorems 35.3 and 36.2 from printed pp. 252–253, which
  agrees with line 1417.
- J. Munkres, Ann. Math. Studies 54, Theorems 10.5–10.6, pp. 103–104, and M. Hirsch, GTM 33,
  Theorem 6.6, p. 117: paywalled; checked only through the GeometricTopology extracts on main
  (`references/munkres-smoothing-triangulations.md`, `references/hirsch-disc-theorem.md`), which
  quote the statements at those locators.
- Chow–Knopf, Surv. 110; Chow et al., Surv. 144 "Chapter 15" and Surv. 163 "Chapter 26" (lines
  1554–1565): AMS e-books, paywalled; chapter attributions not checked.
- Perelman, arXiv math/0211159 and math/0303109 (lines 1588–1592): cited without locators;
  nothing to check.

## Source issues

- **Misprint** in mt07 at Corollary 9.50(1), printed p. 213 (line 10565): the source says a
  two-dimensional flow satisfying the hypotheses of Proposition 9.50, a reference to the corollary
  itself; it should say Proposition 9.39, which its proof applies at line 10574; affects nothing.
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
