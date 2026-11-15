<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16339#issuecomment-6894910142 -->
Review (claude) of 975b2e4

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) an open roadmap in the same folder owns the objects of Layers 1–4 and §5.1–§5.4

   Location: `packages/LorentzianGeometry/design/README.md` line 7, "This roadmap owns: Lorentzian bilinear forms on finite-dimensional real vector spaces and their causal cones (Layer 1); …"; line 13, "Causality theory proper … is the proposed LorentzianGeometryPartII"; `plan.json` `"roadmap"`.

   Claim: this roadmap is the single owner of these objects, and causality theory has no owner yet.

   Witness: open pull request #2232 ("Add semi-Riemannian foundations and Lorentzian causality roadmap", a new roadmap folder, head `fc070ae`), `TauCetiRoadmap/LorentzianGeometry/README.md:1138`: `IsLorentzian b := b.IsSymm ∧ b.Nondegenerate ∧ sigNeg b.toQuadraticMap = 1`; `:1250`, `:1365`–`:1380`, `:1580`, `:1618`.

   The shared objects, by section (this design ↔ #2232's README, line of the heading or statement):

   | This design | #2232 | Same object |
   |---|---|---|
   | §1.1, §1.3 | §6.1 (`:1135`) | `LinearMap.BilinForm.IsLorentzian`, `IsTimelike`, null, causal, with the same definitions and the same namespace (`:221`) |
   | §1.4–§1.6 | §6.2 (`:1167`) | time cone `{w | b w w < 0 ∧ b v w < 0}`, two components, same-cone criterion, reverse Cauchy–Schwarz and triangle inequalities |
   | §1.7, §1.8 | §1.2 (`:458`), §6.3 (`:1215`) | null hyperplanes, the hyperplane trichotomy through `b⁻¹(ξ, ξ)` |
   | §1.9, §2.5 | §7.3 (`:1303`), §2.2 (`:596`–`:612`) | acoustical form, double null metric, restriction, pullback, conformal change |
   | §2.1, §2.3 | §2.3 (`:625`) | local Hölder classes of metrics, chart independence, agreement with PDE §1.7 |
   | §2.2 | §2.2 (`:564`), §7.1 (`:1250`) | `TauCeti.Manifold.LorentzianMetric`: here a `C^0` section with a class predicate, there the index-one subtype of `ContMDiffNondegenerateMetric` at order `k` |
   | §2.6, §4.3 | §8.2 (`:1406`) | piecewise `C¹` causal curves, future-directed curves, concatenation |
   | §3.1–§3.4 | §2.4 (`:657`), §2.5 (`:707`) | Levi-Civita connection and curvature at finite regularity |
   | §3.5, §3.6 | §3.2 (`:878`) | geodesics, pregeodesic reparametrisation, `C^{1,1}` flow |
   | §4.1, §4.2, §4.4 | §8.1 (`:1363`) | `TimelikeVectorField`, `TimeOrientation`, two orientations, smooth representatives, the time-orientation double cover, spacetimes |
   | §4.5 | §2.7 (`:783`) | `IsExtension`, extendibility |
   | §5.2–§5.4 | §9.2 (`:1564`), §9.3 (`:1615`) | null hypersurfaces, null normals, optical functions, `∇_L L = κ L`, generators |
   | Scope, line 13 | Layers 10–12 | causality theory, which this design assigns to a proposed Part II |

   Only §5.5 has no counterpart: #2232 puts "characteristic hypersurfaces of hyperbolic operators" outside its scope (`:80`–`:83`) and hands "characteristic for `□_g` iff null" to an unnamed hyperbolic-PDE roadmap (`:2349`). No other roadmap, open or on main, states the wave operator of a Lorentzian metric (search below).

   Consequences already visible: the two texts cannot both merge into one folder; `Suggested.lean` of #2232 declares `IsLorentzian`, `LorentzianMetric`, `TimelikeVectorField`, `TimeOrientation`, `IsExtension` (lines 138, 185, 202, 222, 108), the names this design's package would declare; and `sources.toml` of this package now holds eight works recorded for #2232 with `cited_for` in #2232's numbering (for instance `"12.4"`, `"10.1"`), so a section id there no longer says which text it means.

   Neither text is on main or in the merge order. #2232 is a pull request on the roadmap repository that adds a new roadmap, so it can be cited as a supplier; this text is a design with no pull request.

   Repair (it is a re-scoping, and which text owns the subject is a human decision, see the last section; the repair below is the one the supply rules give if #2232 stands):

   1. Give the roadmap a name and folder of its own, for what it keeps (for instance the wave operator of a Lorentzian metric and its characteristics), and consume "LorentzianGeometry" at its open head as a supplier, named in the merge-order paragraph.
   2. Delete the targets of the table and cite #2232 by section in their place: §6.1–§6.3 for Layer 1, §2.2–§2.3 and §7.1 for §2.1–§2.5, §2.4–§2.5 and §3.2 for Layer 3, §8.1–§8.2 and §2.7 for Layer 4, §9.2–§9.3 for §5.2–§5.4. Replace "the proposed LorentzianGeometryPartII" by #2232's Layers 10–12.
   3. Keep §5.5 (wave operator, principal symbol, Leibniz rule, "characteristic iff null"), stated on #2232's carrier `LorentzianMetric I M k` with `1 ≤ k`. Keep a further target only where it states something #2232 does not, saying the difference in one clause; candidates I checked against #2232's text and did not find there: the inhomogeneous change-of-chart law of §3.3, hypersurfaces by local defining functions with the tangent-cone condition at corners (§5.1), the lifting statement of §4.4 and the time-oriented extension of §4.5, the closedness and Hausdorff conditions of §5.4, the class of functions and sections of §2.3.
   4. In `sources.toml`, keep the entries; the `cited_for` ids of the retained targets are renumbered with the README.

   Tested on the witness: with step 2, `IsLorentzian` has one definition (`:1138`) and one owner, and with step 1 no folder is shared.

2. **F02** (P3) Mathlib's `Nondegenerate` is described as one-sided; at the pin it is two-sided

   Location: README line 41, "`LinearMap.BilinForm.Nondegenerate` (same file, line 291: left separation, the right condition following from symmetry)".

   Claim: the pinned definition is left separation only.

   Witness: `Mathlib/LinearAlgebra/BilinearForm/Properties.lean:291–292` at the pin: `abbrev Nondegenerate (B : BilinForm R M) : Prop := LinearMap.Nondegenerate B`; docstring `:281–283`: both left-separating and right-separating; `:276–277` records the change from the one-sided form.

   Repair: "(same file, line 291: an abbreviation of `LinearMap.Nondegenerate`, left and right separation; over a field in finite dimension each implies the other)". It matters since §1.2 now treats nonsymmetric `b`. Tested on §1.2's Check `b(u, w) = u⁰w¹ − u¹w⁰`: `b(u, ·) = 0` gives `u = 0` and `b(·, w) = 0` gives `w = 0`, so the form is nondegenerate in the pinned sense and the Check stands.

3. **F03** (P3) `TauCeti.mtangentConeAt` is used in §5.1 and is missing from the Tau Ceti contract

   Location: README line 562 ("the tangent cone `TauCeti.mtangentConeAt I H x`") and line 570 (`*Needs:*`); "Exact supplier contracts", "From Tau Ceti" (lines 49–65).

   Claim: the contract lists every Tau Ceti declaration consumed.

   Witness: `TauCeti/Geometry/Manifold/TangentCone.lean:86` at the pin, `def mtangentConeAt (s : Set M) (y : M) : Set E`; the name occurs in the README at lines 562 and 570 only. A script over all `*Needs:*` lines found no other library name absent from the contracts.

   Repair: add to "From Tau Ceti": "`TauCeti.mtangentConeAt` (`TauCeti/Geometry/Manifold/TangentCone.lean:86`): the tangent cone of a subset `s ⊆ M` at `y`, a subset of the model space `E`, read in the chart at `y`", and the same prerequisite stays in `plan.json` 5.1 (it is there).

Three findings: one P2 and two P3. The P2 is not about a statement: an open roadmap pull request (#2232) adds a roadmap in the same folder, `TauCetiRoadmap/LorentzianGeometry/`, that states nearly every object this design owns, under the same Lean names and with a different carrier. The three repairs of round 6 are verified, and the mathematics of the changed passages was recomputed and holds.

Files reviewed, read-only: `packages/LorentzianGeometry/design/README.md` (695 lines), `packages/LorentzianGeometry/design/plan.json` (5 layers, 34 targets, 0 gaps, baselines equal to `lake-manifest.json`), `packages/LorentzianGeometry/sources.toml` (25 entries, unchanged by this review). This is a design: there is no `Suggested.lean`, so elaboration, the `#check` comparison and the one-tactic padding probe do not apply, and this lane does not elaborate. No maintainer notes were left. No source was fetched and no `needs-references.toml` was written. No text read this round contained instructions.

## Repairs of round 6, finding by finding

| Id | Status | Repaired passage and check |
|---|---|---|
| R01 (P2) Lorentzian hypothesis | repaired | Line 106: "For Lorentzian `b`, the restriction of `b` to a subspace `W` is Lorentzian iff it is nondegenerate and `W` contains a timelike vector"; line 145: "For Lorentzian `b`, null vectors exist iff `dim V ≥ 2`". `plan.json`: `restrict_iff`, `not_isOrtho_of_isTimelike`, `exists_isNull_iff` and `not_isOrtho` begin "For Lorentzian b". Negative controls added as Checks (lines 114, 115, 155). |
| R02 (P3) `chrusciel2011` locator | repaired, by another citation | Lines 368, 386, 409 cite `barzenleymann2026` §7.1 (Definitions 41–42, (51), Theorem 6) and §7.3, §7.6. Read at the cache: §7.1 heading line 1773; Definition 41 line 1778 and (51) line 1799, p. 38; Definition 42 line 1808 and Theorem 6 lines 1812–1814, p. 39; §7.3 heading line 1895, Definition 43 line 1898, p. 41; Lemma 24 line 1925, (53) line 1945, (54) line 1948, p. 42; §7.6 heading line 2216, Definition 48 line 2228, (65)–(66) lines 2247–2254, p. 48; Definition 50 line 2290, p. 49. (53) is the README's convention, (54) its chart formula, (65)–(66) its Ricci trace over the first slot. `chrusciel2011` lines 187–193 are (2.2.2)–(2.2.3), p. 5. |
| R03 (P3) `ℝ^{n−1}` | repaired | Line 323: "for `n ≥ 1`, a function `Ω > 0` and a family `γ` … (coordinates `(u, v, θ¹, …, θ^{n−1})`; for `n = 1` there are no `θ^A` and `γ = 0`)"; `plan.json` 2.5 hypotheses carry "n ≥ 1". |

The repaired patterns were looked for in the rest of the design: the other API bullets of §1.1–§1.9 that need the Lorentzian hypothesis state it (rows below); the natural-number subtractions `dim V − 1`, `k − 1`, `k − 2`, `r − 1` are each guarded in their sentence; the sampled locators support their statements.

## Verified sound

**Principles.** No route-specific shortcut (every dimension, Layer 3 in every signature). No roadmap on main is re-planned: the smooth nondegenerate Levi-Civita theory is consumed from HopfRinow Layer 1 as the pinned Tau Ceti implements it. One direction of supply (gate below). No copied passage in the compared sections. No algorithm, no sorry'd data, no `set_option`. Grep of the README for LaTeX delimiters, pull-request numbers, round labels, machine paths, "removed", "optional", "deferred", "for later", "so far", "checkpoint": zero hits. The overlap with an open roadmap is R01.

**Gate.** Output:

```
candidate: LorentzianGeometry is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2231 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The six supplier roadmaps (HopfRinow, DifferentialGeometry, PDE, PseudodifferentialOperators, RiemannianGeometry, LocalVariationalFieldTheory) are on main; none is on the never-cite list. No repair of this round changed a supplier citation; `scratch/citations.md` lists no cross-roadmap citation found nowhere, and its 13 Lean names are this roadmap's own targets (design stage).

**Pins.** `lake-manifest.json`: Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`, equal to the README's baselines. Opened this round: `Mathlib/LinearAlgebra/BilinearForm/Properties.lean:276–292` (`Nondegenerate`, R02) and `:350` (`toDual (B) (b : B.Nondegenerate) : V ≃ₗ[K] Module.Dual K V`); `TauCeti/LinearAlgebra/QuadraticForm/Signature.lean:140, 309, 466` (`sigPos_smul_of_neg`, `sigNeg_prod`, `card_le_sigNeg_toQuadraticMap_of_iIsOrtho`); `TauCeti/Geometry/Manifold/Instances/Comap.lean:71, 194`; `TauCeti/Geometry/Manifold/TangentCone.lean:86` (R03). The other declarations of the contracts rest on round 6's script (102 names at their cited lines), the pins being unchanged.

**Sources, the seeded sample** (cached texts; printed pages from page markers and running heads). No locator is flagged unverified by the author.

- §1.4, §1.5: `chrusciel2011` lines 84–98, p. 3 (two components, stability under sums, (2.1.1) at 97) ✓; `minguzzi2019` lines 308–314 ✓; `minguzzi2019cone` lines 236–244 ✓.
- §1.6: `minguzzi2019` Theorem 1.2 lines 336–348, Theorem 1.3 lines 349–368 (page break at 361), Corollary 1.4 line 371 ✓; line 335 gives the extension to a zero vector that the README's "linearly dependent" uses.
- §1.9: `minguzzi2019` lines 296–300 ✓; `luoyu2023` line 95 ✓; `luoyu2023b` lines 211–214 ✓.
- §2.1: `chrusciel2011` footnote 2, lines 234–236, on the sheet headed 6 ✓.
- §2.2: `minguzzi2019` lines 396–397 (a `C²` metric there; the README states its own `C^0` definition) and 439–452 ✓; `sbierski2018` line 263 ✓; `chruscielgrant2012` lines 64–73 ✓.
- §2.3: `chrusciel2011` Definition 2.1.1, lines 118–120, p. 4 ✓; `minguzzi2019cone` lines 81–92 (the `C^{1,1}` class) ✓. Chart independence is proved in the README, not cited.
- §2.6: `sbierski2018` Definition 2.1, lines 269–273, p. 7 ✓; `minguzzi2019` footnote 1, lines 323–326 ✓.
- §3.1, §3.4: `barzenleymann2026`, as in the repair table ✓ (smooth pseudo-Riemannian, as the README says).
- §3.3: `chrusciel2011` lines 187–193, p. 5, and 201–203, p. 6 ✓.
- §3.6: `chrusciel2011` lines 201–207 and 232–233 ✓; lines 1305–1306 ✓; `minguzzi2019cone` lines 81–83 ✓; `minguzzi2019` lines 1025–1027 ✓.
- §4.1: `sbierski2018` lines 265–268 ✓; `chrusciel2011` lines 99–112 ✓; `minguzzi2019` lines 440–449 ✓; `minguzzi2019cone` lines 240–244 ✓.
- §4.2: `chrusciel2011` lines 132–144, p. 4 (partition of unity, sums of future timelike vectors) and Proposition 2.1.3, lines 163–171, p. 5 ✓; `minguzzi2019` lines 453–455 ✓.
- §4.4: `chrusciel2011` Remark 2.1.2, lines 121–131 ✓; `minguzzi2019` lines 456–465 ✓; `sbierski2018` Remark 2.16, lines 485–489 ✓. Both sources build the cover from path classes; the README's pairs `(x, cone)` are its own construction.

**Adversarial table** (the passages the repairs changed or added, the sampled targets and the headline theorems; values computed this round). Sections no repair touched and that carry computed rows in round 6 (§1.7–§1.9, §2.1, §2.4, §3.3, §3.5, §3.6, §4.3–§4.5, §5.1–§5.5) rest on those rows.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 restriction criterion | `η₃`: `W = ⟨e₀, e₁⟩`, `⟨e₁, e₂⟩`, `⟨e₀ + e₁, e₂⟩`, `0`; `diag(−1, −1, 1)`, `W = ℝ³` | Gram `diag(−1, 1)`, `sigNeg 1`; `diag(1, 1)`, `sigNeg 0`; `[[0, 0], [0, 1]]`, radical `ℝ(e₀ + e₁)`, values `c² ≥ 0`; `sigNeg 0`, both sides false; `sigNeg 2` with timelike `e₀` | holds with "Lorentzian `b`", fails without | none |
| §1.1 `−b` | Lorentzian `b`, `dim = 1, 2, 3` | `sigPos b = dim − 1 = 0, 1, 2`; `−b` Lorentzian iff `1` | `dim V = 2` | none |
| §1.2 isometry, symmetry, Gram matrix | `b = u⁰w¹ − u¹w⁰`, `G = [[0, 1], [−1, 0]]`; general `G` | `b♭e₀ = e¹`, `b♭e₁ = −e⁰`; `b♯e⁰ = −e₁`, `b♯e¹ = e₀`; `b⁻¹(e⁰, e¹) = 1`, `b⁻¹(e¹, e⁰) = −1`; `(Gᵀ)⁻¹ = [[0, 1], [−1, 0]]`, `G⁻¹ = [[0, −1], [1, 0]]`; in general `b♯e^j = Σ_k (G⁻¹)_{jk} e_k`, so `H_{ij} = (G⁻¹)_{ji}` | `H = (Gᵀ)⁻¹`; isometry law `b⁻¹(b♭u, b♭w) = (b♭u)(w) = b(u, w)` for every nondegenerate `b` | R02 (contract wording) |
| §1.2 Checks | `diag(−2, 1)`; `[[0, −2], [−2, 0]]`; `4η` | `−½`; inverse `[[0, −½], [−½, 0]]`; `−¼` | hold | none |
| §1.3 subspace with a timelike vector | `η₃`, `W = ⟨2e₀ + e₁, e₂⟩`; `diag(−1, −1, 1)`, `W = ⟨e₀, e₁ + e₂⟩` | `η₃(v, v) = −4 + 1 = −3`, `W ∩ v^⊥ = ℝe₂`, Gram `diag(−3, 1)`; Gram `[[−1, 0], [0, 0]]`, degenerate | holds for Lorentzian `b` only | none |
| §1.3 null existence | `−xy` on `ℝ`; `η` on `ℝ²`; Euclidean `ℝ²` | `−v² < 0`; `η(e₀ + e₁, e₀ + e₁) = 0`; `|v|² > 0` | holds for Lorentzian `b` | none |
| §1.4 time cone | `v = e₀`: `(2, 1)`, `(−1, ½)`; `v = e₁`: `(1, −½)`, `(−1, −½)`, midpoint `(0, −½)` | `η = −3`, `η(e₀, ·) = −2`; `−¾`, `+1`; `−¾`, `−¾`, `+¼` | Checks hold; convexity needs timelike `v` | none |
| §1.5 timecone theorem (headline) | `w = av + w_⊥`, `b(v, v) = −1`; dimension 1 | `b(w, w) = −a² + ‖w_⊥‖²`, `b(v, w) = −a`; cone `{a > ‖w_⊥‖}`; `ℝ ∖ {0}` in dimension 1 | two cones, closures meet in `0` | none |
| §1.6 reverse inequalities | `(2, 1), (1, 0)`; `(1, 1), (1, −1)`; `(1, 1), (2, 2)`; `u = 0`; `u, −u` | `2 ≥ √3`; `2 > 0`; `0 = 0`; `0 = 0`, dependent; `b(u, u) < 0` | hold on one closed cone | none |
| §2.2 definition | `diag(−1, x²)`; `diag(−1, sign x)` | degenerate at `x = 0`; discontinuous | excluded as stated | none |
| §2.3 Checks | `1 + |x|^{3/2}`; `|x|^{3/2}` at `±(a, 0)` | derivative `(3/2) sign(x)|x|^{1/2}`, second `(3/4)|x|^{−1/2}` unbounded; ratio `3√a/√(2a) = 2.1213` | `C^{1,½}`, not `C²` | none |
| §2.5 double null metric | `n = 1`; `n = 2`, `γ = r²dθ²`; `n = 0` | Gram `[[0, −2Ω²], [−2Ω², 0]]`, determinant `−4Ω⁴`, eigenvalues `±2Ω²`, `g⁻¹(du, dv) = −(2Ω²)⁻¹`; `sigNeg 1` in dimension 3; `0 − 1 = 0` in `ℕ`, dimension 2 against 1 | holds for `n ≥ 1` | none |
| §2.5 Check | `Ω = 1`, `u = t − x`, `v = t + x` | `du ⊗ dv + dv ⊗ du = 2(dt² − dx²)`, so `−2(…) = 4(−dt² + dx²)`; `g⁻¹(du, dv) = ¼(−1 − 1) = −½` | holds | none |
| §2.6 causal curves | velocities `(1, 1)` then `(1, −1)`; `(1, 0)` then `(−1, 0)`; `(1, 1)` then `(−1, −1)` | `η(e₀, ·) = −1, −1`: one closed cone; `η = 1 > 0`: opposite cones; `η = 0` but opposite cones | break condition is the cone condition | none |
| §3.1 definition | `η` with `A(v, w) = v⁰w⁰e₀`; `A(v, w) = v⁰Jw`; `(1 + |t|)η` | compatibility defect `−2`; torsion `Je₁ = e₀`; pairing `−(1 + |t|)`, one-sided derivatives `∓1` | three clauses each needed | none |
| §3.2 (headline) | `b = 0`; `b = η` | no `b♯`; trivial connection, Koszul `0 = 0` | hypotheses stated | none |
| §3.4 convention against (54) | `−dt² + cosh²t dx²` | `Γ^t_{xx} = cosh t sinh t`, `Γ^x_{tx} = tanh t`; `R^t_{txx} = ∂_tΓ^t_{xx} − Γ^x_{tx}Γ^t_{xx} = cosh² + sinh² − sinh² = cosh²t`; `Ric_{xx} = cosh²t`, `Ric_{tt} = −1`, `Scal = 1 + 1 = 2` | README, Conventions and source agree | none |
| §4.1 time orientations | `∂_t`, `−∂_t`, `∂_t + ½∂_x`; `M = ∅`; two copies | `g = +1`; `g = −1`; one class; `2² = 4` | holds | none |
| §4.2 gluing | `T = Σφ_iX_i` | finitely many nonzero summands in one convex cone (§1.5) at each point | timelike, `g(T, X_i) < 0` | none |
| §4.4 double cover | Minkowski `ℝ²`; `M = ∅`; Möbius band | two sheets; one (empty) section; cover `ℝ × ℝ/2ℤ`, deck `(t, y) ↦ (−t, y + 1)` | holds | none |
| §5.5 characteristic iff null (headline) | `dt`, `dx¹`, `dt − dx¹` | `σ = −1, 1, 0`; `□(t²) = −2` | holds | none (kept under R01) |

**Duplication audit.** `roadmaps grep -i` over the open heads and main for "wave operator", "d'Alembert", "characteristic hypersurface", "acoustical", "null hypersurface", "optical function", "Lorentzian metric/manifold", "time orient": outside #2232 the hits are RelativisticQuantumFieldTheory (constant-coefficient wave operators on Minkowski space, a cited book title), NoncompactQuantumSymmetry (orbits on a fixed quadratic space), PDE `:2944` (d'Alembert's formula in one dimension), HopfRinow `:299` and LocalVariationalFieldTheory `:1037` (consumer notes). None owns an object of this design. #2232 does: R01. `scratch/overlaps.md`: no id this README cites is dropped by an open pull request, none is defined only by a revision, and this is no second copy of a roadmap on main (main `1a19c9f` has no `LorentzianGeometry` folder). Board index: two packages, neither Lorentzian. Ownership against open pull requests was checked with `roadmaps show LorentzianGeometry --pr 2232` (README and `Suggested.lean`) and `roadmaps grep`.

Overlap check: read ManifoldOptimization, RelativisticQuantumFieldTheory, NoncompactQuantumSymmetry, SmoothBundlesConnections, HopfRinow, RiemannianGeometry, DifferentialGeometry; nothing shared with these (HopfRinow, RiemannianGeometry and DifferentialGeometry are cited suppliers; the others work on Riemannian manifolds, bundles or fixed Minkowski space); the roadmap of #2232, which the overlap file lists as changing this one, shares Layers 1–4 and §5.1–§5.4, owner to be settled as R01 says.

**Shape.** Summary; Scope and ownership; Conventions with computed witnesses; Exact supplier contracts; How to read the build; five layers named by their mathematics, Layers 3 and 4 independent, Layer 5 on 1–4; every numbered subsection has a `*Needs:*` line; every definition has at least three Checks; `### Examples` and `### Dependencies` close each layer; Downstream consumers, Worked examples, References. No layer is named after a source's chapter and the README does not say it follows a source.

**Headline theorems for the package stage** (from the Summary): the timecone theorem (§1.5), the hyperplane classification (§1.8), chart independence (§2.3), existence, uniqueness and regularity of the Levi-Civita connection (§3.2, §3.3), `C^{1,1}` geodesic uniqueness (§3.6), the two-orientation theorem (§4.3), the time-oriented extension theorem (§4.5), the null-hypersurface equivalences (§5.2), `∇_L L = κL` (§5.4), characteristic iff null (§5.5).

**Copyright.** Wording compared at every sampled locator above and at seven further prose passages: §1.4's definition against `chrusciel2011` lines 84–98, §1.5's proof sketch against `minguzzi2019` lines 340–348, §2.6's definition against `sbierski2018` lines 269–273, §3.1 against `barzenleymann2026` lines 1799–1809, §4.2's gluing against `chrusciel2011` lines 132–144, §4.4's construction against `chrusciel2011` lines 121–131 and `minguzzi2019` lines 456–465, §4.5's definition against `sbierski2018` lines 475–481. No run of shared words beyond formulas and standard names; the double cover and the proofs are the README's own. Arrangement: `minguzzi2019` §1.3–§1.9, §2, §3 and `chrusciel2011` §2.1–§2.2 against the five layers: only Layer 1 (§1.3–§1.6) meets a run of `minguzzi2019` (§1.3–§1.4), in the order §1.6's `*Needs:*` line (§1.4, §1.5) forces; Layers 2, 3 and 5 have no counterpart there. No table, figure or list of examples is taken over.

Source independence: 22 passages compared with 8 sources, none shared; largest share `minguzzi2019` and `chrusciel2011`, 23 each of 119 locators; contents compared with `minguzzi2019` and `chrusciel2011`: independent.

## Not verifiable

- `oneill1983` Ch. 2, 3, 5; `beemehrlicheasley1996` Ch. 3; `hawkingellis1973` Ch. 2, §6.1; `wald1984` §8.1; `kupeli1987`; `christodoulou2007` Ch. 1–2: settled as uncertified, cited by locator only.
- `barzenleymann2026`: the extraction drops most symbols of Definitions 41, 43, 48 and 50 (lines 1778–1779, 1898, 2228, 2290); the statements were identified by their numbered equations (51), (53), (54), (65), (66), which are legible.
- `chrusciel2011` line 168: the extraction prints (2.1.2) without its division sign; the README's formula was recomputed (`−dt² + dx²` from `h = dt² + dx²`, `X = 2∂_t`).
- Elaboration, `#check` comparison, padding probe: not applicable at the design stage; this lane does not elaborate.

## Source issues

- **Error** in chrusciel2011 at §2.1, printed p. 4 (lines 114–116): the source says a time-orientable manifold has precisely two time orientations, with no connectedness assumed; it should assume the manifold connected, since two disjoint copies of Minkowski space have four; affects a stated result.

## For the human reviewers

- **Scope.** Open pull request #2232 (another author) adds `TauCetiRoadmap/LorentzianGeometry/`, 13 layers, stating the objects of this design's Layers 1–4 and §5.1–§5.4 and causality theory; which text owns the subject, or whether they are combined, is undecided (R01).
- **Scope.** `packages/LorentzianGeometry/sources.toml` and `packages/LorentzianGeometry/reports/` hold entries and review reports of #2232 beside this design's (eight manifest entries with #2232's section ids; `PRREVIEW-LorentzianGeometry~1` to `~5`).
- **Licence.** `barzenleymann2026` (arXiv:2606.02616, 2026) is an unpublished expository preprint; §3.1, §3.2 and §3.4 cite it beside the uncertified `oneill1983` for the Levi-Civita theorem and the curvature definitions.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "975b2e46f4bfa6f636107932a2ac84e8de194edf", "job": "REV-DESIGN-LorentzianGeometry~7", "model": "fable", "worker": "chris-x26"} -->
