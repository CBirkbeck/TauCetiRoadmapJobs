# Review of StratifiedSpacesAndTameTopology (pull request #1519 at d111a9c)

**Verdict:** needs changes

All eight findings of the previous review are repaired at this head (see "Previous findings" below). Six new findings remain, all P3: one false remark in a `Suggested.lean` docstring, one Check that does not discriminate, one locator that names only a chapter, one hypothesis that narrows a target, a group of targets with no locator, and three time-bound sentences.

## R01 (P3) — The open-cone docstring says the two cone topologies differ for every noncompact `L`

Location: `TauCetiRoadmap/StratifiedSpacesAndTameTopology/Suggested.lean` 81–82, "For compact `L` this is the quotient topology of `L × [0, ∞)` with `L × {0}` collapsed; for noncompact `L` it is not." The same wording is in `README.md` 348–349, "so a definition by the quotient topology differs for noncompact `L`".

Claim: for every noncompact `L`, the uniform-collar topology is not the quotient topology.

Witness: `L = ω₁` (order topology) is countably compact, not compact. If an open `W ⊇ L × {0}` missed `(x_n, t_n)` with `t_n → 0`, then `V × [0, δ) ⊆ W` around `(x, 0)`, for `x` a cluster point of `(x_n)`, would contain some of them. So the topologies agree.

Repair: in `Suggested.lean` 81–82 write "…with `L × {0}` collapsed; for `L = ℕ` it is strictly coarser than that quotient topology." In `README.md` 349 write "…differs for `L = ℕ`; for countably compact `L`, such as `ω₁`, the two topologies agree." Convention 4 (98, "in general it is coarser") is already correct and stays. The change touches only a docstring, so no statement changes. `L = ℕ` is Convention 4's own witness: `{apex} ∪ ⋃ₙ {n} × (0, 1/(n+1))` is quotient-open and contains no `ℕ × (0, ε)`.

## R02 (P3) — 7.2: the third Check does not separate `C^k` strata from `C^∞` strata

Location: `README.md` 939–940, "`|x|^{k + 1/2}` (semialgebraic) is `C^k` and not `C^{k+1}` at `0`: strata of class `C^k` for each finite `k` is the general statement, and `C^∞` needs 7.3."

Claim: the example shows why 7.2 asks only for `C^k` strata.

Witness: the graph of `x ↦ |x|^{k+1/2}` has the Whitney stratification `{0}` below its two open branches, all Nash curves. Condition (b) holds at `0`, with secant and tangent both tending to the horizontal. So the example has `C^∞` strata.

Repair: replace the Check with this one. "The graph of `x ↦ |x|^{k+1/2}` is a `C^k` submanifold of `ℝ²` but not a `C^{k+1}` one at the origin, where its tangent is horizontal. A `C^k` stratification may keep the graph as one stratum; a `C^{k+1}` stratification must split off the origin as a point below the two open branches." For a `C^∞` remark, cite van den Dries and Miller, 4.8, Remark (1), at vdd-miller1996 lines 538–540: there are `C^∞` strata whenever the structure has `C^∞` cell decomposition. Tested at `k = 1`: `|x|^{3/2}` has derivative `(3/2)|x|^{1/2}·sign x`, which is continuous, and second derivative `(3/4)|x|^{−1/2}`, which is unbounded at `0`.

## R03 (P3) — 7.1: the locator is a whole chapter, and the first clause has no domain

Location: `README.md` 914–916, "Definable functions are `C¹` off a definable set of lower dimension; every finite family of definable sets is partitioned by a decomposition into `C¹` cells, … (van den Dries, Chapter 7)."

Claim: the clause is precise as written, and "Chapter 7" is an exact locator.

Witness: `C¹` is undefined on a domain that is neither open nor a manifold, and "lower" names no reference dimension. vdd-miller1996 lines 502–507 (4.2, p. 12) state both clauses for `C^p`, and line 477 makes the cells submanifolds.

Repair: write "Every definable `f : U → ℝ` on a definable open `U ⊆ Fin n → ℝ` is `C¹` outside a definable subset, closed in `U`, of dimension `< n`. Finitely many definable subsets of `Fin n → ℝ` are partitioned by one decomposition into `C¹` cells, each a connected `C¹` submanifold (van den Dries and Miller, 4.2(1)–(2) with `p = 1`)." Keep van den Dries, Chapter 7 only together with its numbered statement. Tested on `f(x) = x^{1/3}` with `U = ℝ`: the cells are `(−∞, 0)`, `{0}` and `(0, ∞)`. `f` is `C¹` on the two open cells, and the exceptional set `{0}` has dimension `0 < 1`.

## R04 (P3) — 7.3: the consequence is stated for compact sets, but holds for closed ones

Location: `README.md` 945–947, "Consequently every compact semialgebraic set carries normalised Thom–Mather control data (AlgebraicTopologyPartII §16.1c), a smooth unfolding datum (6.3) and the reconstruction of 6.4."

Claim: compactness is needed.

Witness: take `{xy = 0} ⊆ ℝ²`, which is closed but not compact. AlgebraicTopologyPartII §16.1c's fourth Check gives `T₀ = ℝ²`, `π₀ = 0`, `ρ₀ = x² + y²`. Then `Σ₀ = {0}`, `Σ₁` is four closed rays `|t| ≥ √ε`, `∂₀Σ₁` is four points, and `glue = {xy = 0}`.

Repair: write "Consequently every closed semialgebraic subset of `Fin n → ℝ` carries …". Nothing else changes, because 7.2, §16.1c (closed subsets of a manifold) and 6.3 never use compactness. You may add the instance above as a fourth Check. Tested on that instance: `{ρ₀ ≤ ε}` meets the axes in a compact cross, which gives properness, and each ray is a manifold with boundary whose boundary point lies in `∂₀Σ₁`.

## R05 (P3) — Six targets have neither a locator nor an "own" mark

Location: `README.md` 1.2 (267–271), 1.3 (285–294), 3.1 (435–439), 3.3 (478–488, which carries the two headlines `ExitPathCategory.nonempty_equivalence_fundamentalGroupoid` and `OpenCone.nonempty_unique_hom_apex`), 5.3 (658–668) and 6.1 (723–736).

Claim: every target is either sourced or marked as the roadmap's own.

Witness: 2.4 ends "(Own example.)", 6.5 says "Own statement" and 6.6 says "Own reformulation of 6.1". The six targets listed above carry neither a source locator nor such a mark. Four of them are in the seeded sample.

Repair: append the following.
- 1.2 and 1.3: "(own; for smooth strata, the incidence order and its restriction and product rules are AlgebraicTopologyPartII §16.1a)".
- 3.1: "(Woolf, Definition 2.1, po-paths; Lurie, *Higher Algebra*, Definition A.6.2)".
- 3.3: "(own; (c) is the 1-categorical form of Lurie, *Higher Algebra*, Theorem A.6.4(3), p. 1428, and Treumann's Example 1.3 is (e) for `L = S¹`)".
- 5.3: "(own; compare Joyce, Proposition 2.9)".
- 6.1: "(own definition, after the iterated fibration structures of Albin, Leichtnam, Mazzeo and Piazza, §2.2)".

Each of these I checked in the text: woolf2009 line 151, lurie-ha lines 54760 and 54774–54779, treumann2009 lines 62–67 (one arrow `0 → x`, since `β∘α = α`), joyce2012 lines 221–226, and almp2012 (arXiv:1112.0989v1 text) line 436.

## R06 (P3) — Three sentences describe the state of the repository on one day

Location: `README.md` 37–39, "A search of main and of the open roadmap pull requests for stratifications, … finds no other owner, except that"; 67–68, "No roadmap on main states them."; 969, "No roadmap on main or in an open roadmap pull request cites this one."

Claim: the README is timeless.

Witness: the repository README, "Roadmaps are timeless" (line 232): a reader a year from now must not be able to tell how the roadmap came to say what it says. Each of these sentences reports a search or a pull-request state that will change.

Repair:
- 37–41: "DifferentialGeometry 5.5 owns the abstract boundary `∂̃M` of a manifold with corners, which it uses for Stokes' theorem; Layer 5 consumes it and builds the face structure on top of it, defining no second boundary carrier."
- 67–68: delete "No roadmap on main states them."
- 969: "ImplicitAtlases Layer 6.1 stratifies each thickening over a finite poset with the sets `X^{≥s}` open, which is a stratification in the sense of 1.1."

## Previous findings

- R01 (6.7, local triviality of the whole tube): **repaired**. Lines 869–873 now read "for a small open ball `U ⊆ X_i` and `ε > 0` small as in the local conical structure of AlgebraicTopologyPartII §16.1e, `π_i : M^j_{ik} ∩ π_i⁻¹(U) ∩ {ρ_i < ε} → U` is trivial". The third Check (886–887) carries the cut. The negative control (888–894) has the right values: three components against two, then `(−1/√8, 0) ∪ (0, 1/√8)` and `(−1/√8, 1/√8)`. The cut matches §16.1e's local conical structure at the AlgebraicTopologyPartII head (674154f).
- R02 (Layer 4 identified bounded 4.3 with RealAnalyticGeometry R2.1): **repaired**. Lines 575–580 read "For compact `A`, the union of the open simplices of `T` is closed, so `T` is a subcomplex … For bounded `A`, 4.3 follows from RealAnalyticGeometry R2.1's bounded affine theorem … by inverting its homeomorphism on `A`". The Dependencies paragraph ends at 604 without the cycle remark. Both claims check out against R2.1 (main, README 429–475: `X = ⋃ closure(Bᵢ)`, with `τ(σ) ⊆ Bᵢ` or `⊆ M∖Bᵢ`) and against `finite_semialgebraic_triangulation` (main, `AffineMorseLefschetz/Suggested.lean` 129).
- R03 (subanalytic sets attributed to RealAnalyticGeometry): **repaired**. Lines 53–56 now give RealAnalyticGeometry only semianalytic sets, Nash regularity, semianalytic dimension and Łojasiewicz's triangulation, and give `ℝ_an,exp` to ShimuraVarieties §3.5a, which is present at the #933 head. Line 65 puts "Subanalytic sets" out of scope.
- R04 (depth attribution): **repaired**. Lines 110–118 cite ALMP §2.1 for the chain depth, and AFT Definition 2.4.4 and Nocera–Volpe Remark 2.21 for the codimension. They add the `ℝ²` witness, chain depth 1 against codimension 2.
- R05 (ALMP locator for gluing): **repaired**, with a different number from the one the previous review proposed. 6.2 (754–755) cites "Proposition 2.3 (§2.2)", 6.3 (780–781) "Proposition 2.5 (§2.3)", and References 994–998 name the numbering of the published text and of arXiv:1112.0989. I fetched arXiv:1112.0989v1: the blowdown is Proposition 2.3 (line 555), the resolution Proposition 2.5 (line 638) and the depth §2.1 (line 378). The previous review's "Proposition 2.2" was read from arXiv:0906.1568v2, the 2009 "Part I" preprint the manifest records, where the blowdown is 2.2 (line 601). The README's numbering is right for the version it names.
- R06 (unzipping): **repaired**. Lines 811 and 1007 read "Theorem 7.3.8", which is at aft2017 line 4305.
- R07 (`openSimplex`): **repaired**. The definition is deleted. `Suggested.lean` 222 and 225 use `intrinsicInterior ℝ (convexHull ℝ (τ : Set (Fin n → ℝ)))`. README 534–536 define the open simplex as the intrinsic interior, and the Checks at 551–552 and 590–592 no longer name a Lean declaration.
- R08 (path of `TauCeti.IsTriangulable`): **repaired**. Line 176 reads `TauCeti/Topology/Triangulable/Basic.lean`, and the definition is at line 38 of that file at the pin.

## Verified sound

**Gate and order.** My run of the brief's gate command (`--base origin/main`) reports every check at 0 except `depcheck=1`, whose single line is `depcheck: NOT IN ORDER: StratifiedSpacesAndTameTopology (insert it after its last supplier)`. That line comes from the public order file and is not a defect before insertion. The worker's gate at this head prints OK. The dependency check against the candidate order with `--movable` prints `depcheck: 239 roadmaps, 2353 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. In the candidate order this roadmap is line 225, right after AlgebraicTopologyPartII (224), with ShimuraVarieties at 103. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`. The pins are unchanged by the merge of main (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`).

**Lean.**
- `lake env lean` on `Suggested.lean` exits 0 with exactly four `sorry` warnings, at lines 170, 179, 205 and 215.
- A scratch copy with `#check @name` for all 16 declarations gives types that match their README statements, and no section binder is lost.
- `#print axioms` on `sphereStratification`, `OpenCone.stratification` and `ExitPathCategory` gives only `propext`, `Classical.choice` and `Quot.sound`, so there is no sorry'd data.
- The one-tactic probe (`first | rfl | simp | infer_instance | decide | exact ⟨inferInstance⟩ | exact ⟨Classical.arbitrary _⟩ | trivial`) fails on all four theorems.
- There is no `set_option` and no `lemma`. The imports are Mathlib and the two Tau Ceti semialgebraic modules actually used.

**Headline theorems.** The Summary (14–21) names these end theorems:
- 3.3(a), 3.3(e) and 3.4: stated.
- 4.1: not statable. It lacks ShimuraVarieties §3.4b's `OMinimalStructure`, and the docstring (33–34) says so. Its semialgebraic case 4.3 is stated.
- 6.3–6.4: not statable. They lack AlgebraicTopologyPartII's `IsSmoothStratification` and `ControlData` and DifferentialGeometry 5.5's abstract boundary (docstring 35–38).
- 7.2 and 7.3 are named as not statable at 39–41.

I kept 3.3(a) and 3.4 as headlines, not padding. 3.3(a) compares the quotient construction with Mathlib's `FundamentalGroupoid`. It needs the full structure theorem of 3.2, and a definition without the third relation of `ExitPathCategory.Rel` fails it. 3.4 needs 3.3(e) and a gluing argument at `∞`.

4.3 stays on `ℝ` although Mathlib has `IsRealClosed` (`Mathlib/FieldTheory/IsRealClosed/Basic.lean` 52). The reason is that Tau Ceti's Tarski–Seidenberg, `HasSemialgebraicProjections`, has its only instance on `ℝ` (`TauCeti/Geometry/RealAlgebraic/CAD/Existence.lean` 102), and ShimuraVarieties §3.4b's semialgebraic structure is on `ℝ`.

**Library declarations opened at the pins.**
- 25 names checked with `#check`: `Topology.WithUpperSet`, `Topology.IsUpperSet`, `Topology.IsUpperSet.closure_eq_lowerClosure`, `Topology.IsUpperSet.specializes_iff_le`, `IsLocallyClosed`, `OnePoint.isOpen_range_coe`, `Path.Homotopy.eval`, `Path.Homotopic`, `CategoryTheory.Paths.of`, `CategoryTheory.Quotient`, `HomRel`, `Preorder.smallCategory`, `Bundle.Trivialization`, `Manifold.IsSubmersionAt`, `Manifold.IsImmersionAt`, `EuclideanQuadrant`, `modelWithCornersEuclideanQuadrant`, `ModelWithCorners.boundary`, `ModelWithCorners.interior`, `tangentConeAt`, `Geometry.SimplicialComplex`, `intrinsicInterior`, `intrinsicInterior_singleton`, `TauCeti.IsSemialgebraic` and `TauCeti.IsSemialgebraicOn`.
- Tau Ceti declarations read in source:
  - `IsSemialgebraic` (`Semialgebraic/Basic.lean` 75) and `IsSemialgebraicOn` (`Function.lean` 49; its graph is in `σ ⊕ τ` coordinates, and it includes semialgebraicity of the domain).
  - `TauCeti.AbstractSimplicialComplex.orderComplex` (`OrderComplex.lean` 57; its faces are the nonempty finite chains).
  - `AbstractSimplicialComplex.Realization` (`Realization/Basic.lean` 71).
  - `TauCeti.IsTriangulable` (`Triangulable/Basic.lean` 38).
  - `TauCeti.IsCollar` (`Collar/Global.lean` 46: an open embedding of `N × Ico 0 1` whose zero slice is `f`).
  - `TauCeti.IsLocallyCollared` (213; the local collars meet `range f` only at height 0, which the chart collar of 5.4 satisfies).
  - `TauCeti.IsLocallyCollared.isCollared` (`Collar/Brown.lean` 459, with `[CompactSpace N] [T2Space M]` and injectivity, all satisfied in 5.4).
  - `TauCeti.IsCAD` (`CAD/Basic.lean` 147, with `Fin.tail` and coordinate `0`, as Convention 7 says).
  - `AffineIndependent.mem_intrinsicInterior_convexHull_iff` (`Analysis/Convex/OpenSimplex.lean` 60), which is 4.1's "strictly positive barycentric combinations" over `ℝ`.
- Neither pin has topological stratifications, open cones, exit paths, o-minimal structures or control data (grep). The only `Stratification` hit is Tau Ceti's model-theoretic `ModelTheory/Counting/Stratification.lean`, which is unrelated.

**Cross-roadmap citations resolved.**
- AlgebraicTopologyPartII at head 674154f: §§16.1a–16.1e are at README 1539–1671. They define `IsSmoothStratification`, `IsWhitneyStratification` and `ControlData` (`Suggested.lean` 289, 454, 307). §16.1a has the restriction and product rules and the frontier condition for the open simplices of a realization. The README's references to §16.1b's first, fourth and last Checks match. §16.1c is for closed subsets, and §16.1e has the local conical structure.
- ShimuraVarieties at the #933 head: §§3.4b–3.4e and §3.5a, with `OMinimalStructure` (83), `OMinimalStructure.DefinableMapOn` (115) and `exists_oMinimalStructure_isSemialgebraic` (143) in `TauCetiRoadmap.ShimuraVarieties`. §3.4c asks for a dense order without endpoints and §3.4e for an ordered group with definable addition, both satisfied by an ordered field.
- On main:
  - RealAnalyticGeometry R1.1 (56), R2.1 (429, including "the comparison with the abstract complex/realization carrier") and R5 (1007).
  - AffineMorseLefschetz A4.1 (Layer 5, 946).
  - GeometricTopology Layer 1 (177; the collar theorem as Lee 9.25 at 206–208, and the tubular neighbourhood theorem at 219).
  - DifferentialGeometry 5.5 (528–533, "Stokes on manifolds with corners through the abstract boundary").
  - AlgebraicTopology Stage 7 (1573).
  - RealAlgebraicGeometry under `Completed/`, whose scope (80) excludes general o-minimal structures and triangulation.
- ImplicitAtlases Layer 6.1 at the #974 head (81fc759, line 698) is described correctly as a user that does not cite this roadmap.

**Ownership and overlaps.**
- `roadmaps grep` over main and the 466 open heads finds no other owner for "embedded corners", "exit path", "conically stratified", `Stratification` or `OpenCone`.
- "Thom–Mather" occurs only in AlgebraicTopologyPartII, which is consumed. "o-minimal" belongs to ShimuraVarieties, which is consumed; the other hits (AbelianSchemesAndArithmeticModuliPartII and others) consume ShimuraVarieties §3.5a.
- `roadmaps grep StratifiedSpacesAndTameTopology` finds only this roadmap's own `namespace`/`end` lines.
- `scratch/overlaps.md` reports no other open pull request changing this roadmap, no dropped id, and no id defined only by an open revision.

**Sources: the sample.**
- 1.1 and Convention 1: lurie-ha lines 54489–54494 (Definition A.5.1, p. 1421; upward-closed sets are open).
- 2.1 and Convention 4: lurie-ha lines 54502–54514 (Definition A.5.3 with the uniform collar, and Remark A.5.4 for compact Hausdorff `L`).
- 2.2: lurie-ha lines 54515–54520 (Definition A.5.5, p. 1422; "image contains `x`" is equivalent to the README's `(z, apex) ↦ x`, because all indices of `L` exceed `a`).
- 2.3(b): lurie-ha lines 55032–55048 (Definition A.6.7 and Proposition A.6.8, p. 1435; locally finite, ordered by inclusion).
- 3.2: woolf2009 lines 151–157 (Definition 2.1).
- 3.4: treumann2009 lines 71–75 (Example 1.4, p. 2; two objects and one arrow `∞ → 0`).
- 5.1: joyce2012 lines 151–158 (Definition 2.3), 167–171 (Definition 2.5), 190–198 (Definition 2.6, `|i⁻¹(x)| = depth`), 212–213 (Proposition 2.7) and 216–218 (Lemma 2.8, `i_X` finite and proper).
- 5.2: joyce2012 lines 270–299 (Remark 2.11: (b) is "faces", (c) is "embedded corners", (c) implies (b), and (b) implies (c) for compact `X`; the teardrop).
- 6.2, 6.3, Convention 6: almp2012 (arXiv:1112.0989v1 text) lines 378–384 (chain depth, open strata depth 0), 555–559 (Proposition 2.3) and 638–650 (Proposition 2.5).
- Convention 6: aft2017 lines 1089–1096 (Definition 2.4.4, p. 20) and nocera-volpe2023 lines 287–291 (Remark 2.21).
- 6.4: aft2017 line 4305 (Theorem 7.3.8).
- 6.7: mather2012 lines 828 (`T_{X,Y} = T_X ∩ Y`, p. 491) and 852–854 ((A10)–(A11), p. 492).
- 7.2: vdd-miller1996 lines 203–212 (stratification with the frontier clause and Whitney's (b)) and 530–532 (4.8(1): `C^p` cells).
- 2.4, 4.3, 6.5: the author's own statements, checked in the table below.
- 1.2, 3.1, 5.3, 6.1: no locator (R05).
- 4.1 and 7.1: see Not verifiable and R03.

**Adversarial table** (values computed this round).

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. 1, 1.1 | `ℝ` over `{0<1}` both ways; Sierpiński; `ℝ` over `{0<1<2}` | `s⁻¹{1} = ℝ∖{0}` open vs `{0}` not; `{o}` open vs `{c}` not, lower-set version reverses both; preimages `(1,∞)`, `(0,∞)`; `(0,1]` locally closed, neither open nor closed | true | none |
| 1.2 | swap pushforward; product; restriction | swap: preimage of `{1}` is `{0}`, not open; upper set `{(0,1),(1,0),(1,1)}` ↦ `ℝ²∖{0}`, in general `⋃ s⁻¹(Ici p) × s⁻¹(Ici q)`; strata `{0}`, `(0,∞)` | true | R05 |
| 1.3 | `[0,1)∪{2}`; discrete `{a,b}`; finite `P` | `closure X₁ = [0,1) ∌ 2`; `{a}` maximal while `0` is not in `P`; complement of `s⁻¹(U)` is a finite union of closures | true | R05 |
| 1.4 | `[0,∞)²` | 4 vertices, 5 edges, 2 triangles, `χ = 1`; depths 2, 1, 0 (0, 1, 2 reversed) | true | none |
| Conv. 4, 2.1 | `L = ℕ`; `L = ω₁`; `∅`; `Fin 2` | quotient-open set contains no `ℕ×(0,ε)`; for `ω₁` a cluster point forces `W ⊇ L×[0,δ)`, so the topologies agree; `C(∅)` a point; `C(Fin 2) ≅ ℝ` | README true; Lean docstring false | R01 |
| 2.2 | `[0,1)∪{2}`; `K = {0}∪{1/n}`; `L = L' = Fin 2` | charts `C(pt)` at 0, `C(∅)` at 2, frontier fails; `Z` totally disconnected vs a connected interval; `L''` = square boundary, 4 points of index `(0,1)`/`(1,0)`, 4 arcs `(1,1)` | true | none |
| 2.3 | triangle boundary; 2-simplex; Lurie's `h` | vertex link 2 points; link in 2-simplex = edge with endpoints below interior; `h` has support `σ ∪ supp w_Y` for `t > 0`, `σ` at the apex | true | none (source misprint) |
| 2.4 | `ε ∈ (0,1]`, 7 traces | each trace open in its set; `(0,δ) ∉ W`; with `V₀₂` the disc, `W ∩ V₀₂ ∋ 0` contains no `(0,δ)` | true | none |
| 3.1 | `2t−1` on `[−1,1]`; `{a,b}`; `1−t` | indices `1,0,1`; no path `a → b` though `0 < 1`; reversed indices `1 → 0` | true | R05 |
| 3.2 | monoid `{1,e}` | relation 1: `e = e`; relation 2: `e = e·e`; relation 3: `e ≠ 1` | true | none |
| 3.3(a) Lean | `P = Unit`, `P = ∅` | every path is exit, exit homotopy = homotopy rel endpoints; `P = ∅` forces `X = ∅`, both categories empty | true | R05 |
| 3.3(e) Lean | `L = ∅`, `Fin 2`, `ℕ`, `ω₁` | `Hom(apex,apex) = {id}`; height `(1−u)h(t)+u·t·t₁`, then slide `(x(max(t,u)), t·t₁)`, heights `≤ max(h(t), t·t₁) → 0` uniformly, continuous at the apex for any `L` | true | R05 |
| 3.4 Lean | `∞`; `z, w ∈ ℂ` | `Hom(∞,∞) = 1`, `Hom(z,w) = 1`, `Hom(z,∞) = 0`, `Hom(∞,z) = 1`; upper sets `∅, {1}, univ` ↦ `∅, ℂ, S²` | `≌ Fin 2`, true | none |
| 4.1 | simplices of `∅`, `{v}`, `{v,w}`; `(0,1]`; disc map | `∅`, `{v}`, open segment; `{1}°∪{0,1}° = (0,1]`; `‖(|x|/‖x‖∞)x‖∞ = |x|`, circle ↦ square boundary | true (vdD not readable) | none |
| 4.3 Lean | `n = 0`; `A = ∅`; `[0,∞)`; compact `A` | `T = {{pt}}`; `K` empty; `x/(1+x)` onto `[0,1)`; closed union ⇒ faces of `τ ∈ T` in `T` (open simplices disjoint) | true | none |
| 4.3 vs R2.1, A4.1 | R2.1 on `{A, Bᵢ}`; A4.1 with `m = n` | `X = closure A`, `τ(σ) ⊆ A` or `⊆ M∖A`, invert on `A`; `h = Φ⁻¹` on the subcomplex `T` | true | none |
| 5.1 | `[0,1]²`, teardrop, `n = 0` | corner `|j⁻¹| = 2`; teardrop `∂̃` an interval with both ends at the corner; `∂X = ∅` | true | none |
| 5.3 | left edge `k = 1`; adjacent edges; teardrop | `F ∩ bottom = {(0,0)}`, `F ∩ top = {(0,1)}`, `F ∩ right = ∅`; one corner, `2 − 2 = 0`; two sheets at the teardrop corner | true | R05 |
| 6.1 | `ℝ²` datum; `[0,1]` datum | 2 arcs, 4 half-lines, 4 corners; `π₁(corner) = (±√ε₀, 0)`; `{ε} ∩ {1−ε} = ∅` | true | R05 |
| 6.2 | fibre datum over `Σ₀` | arc ends glued to `(±√ε₀, 0)`: a circle | true | none |
| 6.3 | `ε₁ < ε₀/3`; cone; `[0,1]`; non-proper tube | `|x| ≤ |y| < √ε₁ ⇒ x²+2y² < 3ε₁ < ε₀`; corners in `T₁` iff `3ε₁ < ε₀`; cone `|p| ≥ √ε`; `[√ε, 1−√ε]`; 3 components vs 2 | true | none |
| 6.5 | `(0<1<2)` over `(0<1)`; `(0<2)` over `(0)` | 4 corners → 2 endpoints, `]1,2[ = ∅`; arcs bounded by corners, `]0,2[ = {1}` | true | none |
| 6.7 | old R01 data, `ε = 1/8`; §16.1b fourth Check | `(−1/√8,0)∪(0,1/√8)` = 2 rays; `(−1/√8,1/√8) ≅ C(L₀)`; `M^a_{ac} ∋ 5` | true | none |
| Conv. 6 | `ℝ²`, `{0} < ℝ²∖{0}` | chain depth 1; AFT `2 − 0 = 2` | true | none |
| 7.1 | `x^{1/3}`; `|x|`; cusp | `C¹` off `{0}`, dim 0 < 1; three cells | true; domain unstated | R03 |
| 7.2 | cone; `{xy=0}`; graph of `|x|^{k+1/2}` | 3 connected strata; origin and 4 half-axes; the graph has a Nash stratification `{0}` + 2 branches | statement true; third Check vacuous | R02 |
| 7.3 | closed disc; `{xy=0}` (not compact) | 2 Nash strata; `Σ₀ = {0}`, `Σ₁` four rays, glue = `{xy=0}` | true; narrowed | R04 |

## Not verifiable

- vdd1998 (van den Dries, *Tame Topology and o-minimal Structures*): the sources service finds no legal source (the Cambridge landing page is in no licence class), and the manifest has no key for it. So Chapter 8, (2.9) (4.1), Chapter 7 (7.1; see R03 for a verifiable replacement) and Chapter 4, §2 are unchecked.
- bcr1998 Theorem 9.7.11 (7.3) and lee2013 Theorem 9.25 (5.4) are settled as uncertified.
- The out-of-scope remarks (69–75) cite Peterzil–Steinhorn 1999 Theorem 2.1, Andújar Guerrero 2025 Remark 5.9, Murayama–Shiota 2013 p. 160 and Commelin–Huber Proposition A.1. They have no manifest keys and were not re-read this round. Grothendieck's *Esquisse*, §5, is motivation only.
- Ownership against the board package LogicAndDefinabilityInNumberTheory (#164, 972ee8e; candidate order 321, after this roadmap) was not re-read this round.
- Note for the worker (manifest only, not the pull request): the board `sources.toml` entry `almp2012` records arXiv `0906.1568v2`. The README now cites the numbering of the published text and of arXiv:1112.0989, which differs (Propositions 2.3 and 2.5 there, 2.2 and 2.3 in 0906.1568). The entry should carry `arxiv = "1112.0989v1"` and `doi = "10.24033/asens.2165"`, with a version note. The manifest still lacks keys for vdd1998, Peterzil–Steinhorn, Andújar Guerrero, Murayama–Shiota, Huber and Grothendieck, and still lists `verona1984` and `thom1969`, which the README no longer cites.

## Source issues

- **Misprint** in lurie-ha at Proposition A.6.8, proof, p. 1435: the source says the open embedding `h` has image the points whose support strictly contains `σ`; it should be the points whose support contains `σ`, since `h` sends `Z × {apex}` onto the stratum of `σ`; affects nothing.
- **Misprint** in mather2012 at §8, axiom (A10), p. 492: the source says a nonempty `T_{X,Y}` forces `X < Y` with `<` strict, which fails for `Y = X` because `T_{X,X} = X`; it should exclude `Y = X`; affects nothing.
- **Misprint** in nocera-volpe2023 at Remark 2.21, arXiv:2105.09243v7 p. 9: the source's equality criterion puts `x` in the second stratum `X₁` of the chain; it should put `x` in `X₀`, where the chain starts; affects nothing.
- **Gap** in vdd-miller1996 at D.16 (revised version, note on p. 1): the authors report a gap in the proof of `C^p` Whitney stratification of maps, which they say is repairable; it should be closed by their announced corrigendum; affects nothing (7.2 uses 4.8(1), the stratification of sets).
