# Review of StratifiedSpacesAndTameTopology (pull request #1519 at 0b87012)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since d111a9c. The head is a merge of main into the branch: the folder `TauCetiRoadmap/StratifiedSpacesAndTameTopology/` is byte-identical to the one the previous review read, the pins are unchanged (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`), and the pull request changes nothing outside the folder relative to `origin/main`. So none of the six findings of the previous review is repaired, and they are the findings of this report, all P3. No new finding: the gate passes with the build, the elaboration is clean, and every supplier citation still resolves at the current main and open heads.

## R01 (P3) — The open-cone docstring says the two cone topologies differ for every noncompact `L`

Location: `TauCetiRoadmap/StratifiedSpacesAndTameTopology/Suggested.lean` 81–82, "For compact `L` this is the quotient topology of `L × [0, ∞)` with `L × {0}` collapsed; for noncompact `L` it is not." The same wording is in `README.md` 348–349, "so a definition by the quotient topology differs for noncompact `L`".

Claim: for every noncompact `L`, the uniform-collar topology is not the quotient topology.

Witness: `L = ω₁` (order topology) is countably compact, not compact. If an open `W ⊇ L × {0}` missed `(x_n, t_n)` with `t_n → 0`, then `V × [0, δ) ⊆ W` around `(x, 0)`, for `x` a cluster point of `(x_n)`, would contain some of them. So the topologies agree.

Repair: in `Suggested.lean` 81–82 write "…with `L × {0}` collapsed; for `L = ℕ` it is strictly coarser than that quotient topology." In `README.md` 349 write "…differs for `L = ℕ`; for countably compact `L`, such as `ω₁`, the two topologies agree." Convention 4 (98, "in general it is coarser") is already correct and stays. Only a docstring changes, so no statement changes. `L = ℕ` is Convention 4's own witness: `{apex} ∪ ⋃ₙ {n} × (0, 1/(n+1))` is quotient-open and contains no `ℕ × (0, ε)`.

## R02 (P3) — 7.2: the third Check does not separate `C^k` strata from `C^∞` strata

Location: `README.md` 939–940, "`|x|^{k + 1/2}` (semialgebraic) is `C^k` and not `C^{k+1}` at `0`: strata of class `C^k` for each finite `k` is the general statement, and `C^∞` needs 7.3."

Claim: the example shows why 7.2 asks only for `C^k` strata.

Witness: the graph of `x ↦ |x|^{k+1/2}` has the Whitney stratification `{0}` below its two open branches, all Nash curves. Condition (b) holds at `0`, with secant and tangent both tending to the horizontal. So the example has `C^∞` strata.

Repair: replace the Check with: "The graph of `x ↦ |x|^{k+1/2}` is a `C^k` submanifold of `ℝ²` but not a `C^{k+1}` one at the origin, where its tangent is horizontal. A `C^k` stratification may keep the graph as one stratum; a `C^{k+1}` stratification must split off the origin as a point below the two open branches." For a `C^∞` remark cite van den Dries and Miller, 4.8, Remark (1), at vdd-miller1996 lines 538–540. Tested at `k = 1`: `|x|^{3/2}` has derivative `(3/2)|x|^{1/2}·sign x`, continuous, and second derivative `(3/4)|x|^{−1/2}`, unbounded at `0`.

## R03 (P3) — 7.1: the locator is a whole chapter, and the first clause has no domain

Location: `README.md` 914–916, "Definable functions are `C¹` off a definable set of lower dimension; every finite family of definable sets is partitioned by a decomposition into `C¹` cells, … (van den Dries, Chapter 7)."

Claim: the clause is precise as written, and "Chapter 7" is an exact locator.

Witness: `C¹` is undefined on a domain that is neither open nor a manifold, and "lower" names no reference dimension. vdd-miller1996 lines 502–507 (4.2, p. 12) state both clauses for `C^p`, and line 477 makes the cells submanifolds.

Repair: write "Every definable `f : U → ℝ` on a definable open `U ⊆ Fin n → ℝ` is `C¹` outside a definable subset, closed in `U`, of dimension `< n`. Finitely many definable subsets of `Fin n → ℝ` are partitioned by one decomposition into `C¹` cells, each a connected `C¹` submanifold (van den Dries and Miller, 4.2(1)–(2) with `p = 1`)." Keep van den Dries, Chapter 7 only together with its numbered statement. Tested on `f(x) = x^{1/3}`, `U = ℝ`: cells `(−∞, 0)`, `{0}`, `(0, ∞)`; `f` is `C¹` on the two open cells and the exceptional set `{0}` has dimension `0 < 1`.

## R04 (P3) — 7.3: the consequence is stated for compact sets, but holds for closed ones

Location: `README.md` 945–947, "Consequently every compact semialgebraic set carries normalised Thom–Mather control data (AlgebraicTopologyPartII §16.1c), a smooth unfolding datum (6.3) and the reconstruction of 6.4."

Claim: compactness is needed.

Witness: `{xy = 0} ⊆ ℝ²` is closed, not compact. AlgebraicTopologyPartII §16.1c's fourth Check gives `T₀ = ℝ²`, `π₀ = 0`, `ρ₀ = x² + y²`. Then `Σ₀ = {0}`, `Σ₁` is four closed rays `|t| ≥ √ε`, `∂₀Σ₁` is four points, and `glue = {xy = 0}`.

Repair: write "Consequently every closed semialgebraic subset of `Fin n → ℝ` carries …". Nothing else changes: 7.2, §16.1c (closed subsets of a manifold, confirmed at the AlgebraicTopologyPartII head 4855915, README 1598) and 6.3 never use compactness. Tested on that instance: `{ρ₀ ≤ ε}` meets the axes in a compact cross, which gives properness, and each ray is a manifold with boundary whose boundary point lies in `∂₀Σ₁`.

## R05 (P3) — Six targets have neither a locator nor an "own" mark

Location: `README.md` 1.2 (267–271), 1.3 (285–294), 3.1 (435–439), 3.3 (478–488, carrying the headlines `ExitPathCategory.nonempty_equivalence_fundamentalGroupoid` and `OpenCone.nonempty_unique_hom_apex`), 5.3 (658–668) and 6.1 (723–736).

Claim: every target is either sourced or marked as the roadmap's own.

Witness: 2.4 ends "(Own example.)", 6.5 says "Own statement" and 6.6 "Own reformulation of 6.1". The six targets above carry neither a locator nor such a mark. Four of them are in the seeded sample.

Repair: append
- 1.2 and 1.3: "(own; for smooth strata, the incidence order and its restriction and product rules are AlgebraicTopologyPartII §16.1a)".
- 3.1: "(Woolf, Definition 2.1, po-paths; Lurie, *Higher Algebra*, Definition A.6.2)".
- 3.3: "(own; (c) is the 1-categorical form of Lurie, *Higher Algebra*, Theorem A.6.4(3), p. 1428, and Treumann's Example 1.3 is (e) for `L = S¹`)".
- 5.3: "(own; compare Joyce, Proposition 2.9)".
- 6.1: "(own definition, after the iterated fibration structures of Albin, Leichtnam, Mazzeo and Piazza, §2.2)".

Checked in the texts: woolf2009 line 151, lurie-ha lines 54760 and 54774–54779, treumann2009 lines 62–67, joyce2012 lines 221–226, almp2012 (arXiv:1112.0989v1 text) line 436.

## R06 (P3) — Three sentences describe the state of the repository on one day

Location: `README.md` 37–39, "A search of main and of the open roadmap pull requests for stratifications, … finds no other owner, except that"; 67–68, "No roadmap on main states them."; 969, "No roadmap on main or in an open roadmap pull request cites this one."

Claim: the README is timeless.

Witness: the repository README, "Roadmaps are timeless": a reader a year from now must not be able to tell how the roadmap came to say what it says. Each sentence reports a search or a pull-request state that will change.

Repair:
- 37–41: "DifferentialGeometry 5.5 owns the abstract boundary `∂̃M` of a manifold with corners, which it uses for Stokes' theorem; Layer 5 consumes it and builds the face structure on top of it, defining no second boundary carrier."
- 67–68: delete "No roadmap on main states them."
- 969: "ImplicitAtlases Layer 6.1 stratifies each thickening over a finite poset with the sets `X^{≥s}` open, which is a stratification in the sense of 1.1."

## Previous findings

- R01 — not repaired: `Suggested.lean` 81–82 still reads "for noncompact `L` it is not", and `README.md` 348–349 "differs for noncompact `L`".
- R02 — not repaired: `README.md` 939–940 still reads "`|x|^{k + 1/2}` (semialgebraic) is `C^k` and not `C^{k+1}` at `0`: strata of class `C^k` … and `C^∞` needs 7.3."
- R03 — not repaired: `README.md` 914–916 still reads "Definable functions are `C¹` off a definable set of lower dimension; … (van den Dries, Chapter 7)."
- R04 — not repaired: `README.md` 945–946 still reads "Consequently every compact semialgebraic set carries normalised Thom–Mather control data".
- R05 — not repaired: 1.2, 1.3, 3.1, 3.3, 5.3 and 6.1 (267–271, 285–294, 435–439, 478–488, 658–668, 723–736) still end on their `*Needs:*` line with no locator and no "own" mark.
- R06 — not repaired: `README.md` 37–39 "A search of main and of the open roadmap pull requests … finds no other owner", 67–68 "No roadmap on main states them.", 969 "No roadmap on main or in an open roadmap pull request cites this one."

## Verified sound

**The change.** `git diff --stat d111a9c HEAD -- TauCetiRoadmap/StratifiedSpacesAndTameTopology` is empty; `git diff --stat origin/main...HEAD` outside the folder is empty (the files the change summary lists outside the folder are main's own commits, merged in at 0b87012; the merge base is d974e46). `lake-manifest.json` and `lean-toolchain` are unchanged since d111a9c. The folder holds `README.md` (1024 lines), `Suggested.lean` (228 lines) and `metadata.toml`.

**Gate and order.** My run of the brief's gate command with `--build` and the candidate order prints every check at 0 and `OK` (`build=0`). The dependency check against the candidate order with `--movable` prints `depcheck: 239 roadmaps, 2324 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. In the candidate order this roadmap is line 226, right after AlgebraicTopologyPartII (225), with ShimuraVarieties at 105.

**Lean.**
- `lake env lean` on `Suggested.lean` exits 0 with exactly four `sorry` warnings, at lines 170, 179, 205 and 215.
- A scratch copy with `#check @name` for all 16 declarations gives the types recorded in the elaborated-signatures file; each matches its README statement, and no section binder is lost (the two cone theorems carry `[TopologicalSpace L]`, `(p : P)`, `(sL : Stratification L P)` and `hp`; the triangulation theorem carries `TauCeti.IsSemialgebraic A` and the finset hypothesis).
- `#print axioms` on `sphereStratification`, `OpenCone.stratification` and `ExitPathCategory` gives only `propext`, `Classical.choice`, `Quot.sound`: no sorry'd data.
- The one-tactic probe (`first | rfl | simp | infer_instance | decide | exact ⟨inferInstance⟩ | exact ⟨Classical.arbitrary _⟩ | trivial`) fails on all four theorems (errors at the four `sorry` sites).
- No `set_option`, no `lemma`. Imports: `Mathlib` and `TauCeti.Geometry.RealAlgebraic.Semialgebraic.Basic` and `.Function`, both present at the Tau Ceti pin.
- The two Lean names the citation tool lists as "found nowhere" (`ExitPathCategory.nonempty_equivalence_fundamentalGroupoid`, `OpenCone.nonempty_unique_hom_apex`, README 478 and 482) are this roadmap's own headlines, declared at `Suggested.lean` 170 and 179.

**Headline theorems** (unchanged from the previous review, re-read): 3.3(a), 3.3(e), 3.4 and the semialgebraic 4.3 are stated; 4.1, 6.3–6.4, 7.2 and 7.3 are named in the module docstring (33–41) with the carriers they lack (`OMinimalStructure`, `IsSmoothStratification`, `ControlData`, the abstract boundary). None is padding.

**Cross-roadmap citations resolved this round.**
- AlgebraicTopologyPartII at the #1694 head 4855915: §§16.1a–16.1e at README 1539, 1571, 1596, 1617, 1647; `IsSmoothStratification` (`Suggested.lean` 289), `ControlData` (307), `IsWhitneyStratification` (454); §16.1c for closed subsets (1598); the local conical structure in §16.1e (1659).
- ShimuraVarieties at the #933 head: §3.4b (818), §3.4c (848), §3.4d (878), §3.4e (900), §3.5a (939); `OMinimalStructure` (`Suggested.lean` 83), `DefinableMapOn` (115), `exists_oMinimalStructure_isSemialgebraic` (143).
- On main (e9fd8e4): RealAnalyticGeometry R1.1 (56), R2.1 (429), R5 (1007); AffineMorseLefschetz Layer 5 / A4.1 (946) and `finite_semialgebraic_triangulation` (`Suggested.lean` 129); GeometricTopology Layer 1 (177; collar theorem 206, tubular neighbourhoods 218); DifferentialGeometry 5.5 (528, abstract boundary 83); AlgebraicTopology Stage 7 (1573); `Completed/RealAlgebraicGeometry` present.
- ImplicitAtlases Layer 6.1 at the #974 head (README 696).
- Tau Ceti pin 2fd255d: `IsTriangulable` at `TauCeti/Topology/Triangulable/Basic.lean` 38.

**Ownership and overlaps.** `roadmaps grep --fixed -i` over main and the 468 open heads: "exit path", "exit-path", "conically stratified", "embedded corners" and `OpenCone` occur only in this roadmap; "Thom–Mather" only here and in AlgebraicTopologyPartII, which is consumed; `StratifiedSpacesAndTameTopology` only in this roadmap's own two namespace lines. `scratch/overlaps.md`: no other open pull request changes this roadmap, no dropped id, no id defined only by an open revision. The board packages (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) were not re-read; the previous review placed the last after this roadmap in the order.

**Sources: the sample.** The folder is unchanged, so the sampled locators are those the previous review certified; I re-read none of the texts beyond R05's witnesses. From the previous report (d111a9c): 1.1 and Convention 1 at lurie-ha 54489–54494; 2.1/Convention 4 at 54502–54514; 2.2 at 54515–54520; 2.3(b) at 55032–55048; 3.2 at woolf2009 151–157; 3.4 at treumann2009 71–75; 5.1 at joyce2012 151–158, 167–171, 190–198, 212–218; 5.2 at joyce2012 270–299; 6.2/6.3/Convention 6 at almp2012 (arXiv:1112.0989v1) 378–384, 555–559, 638–650; Convention 6 at aft2017 1089–1096 and nocera-volpe2023 287–291; 6.4 at aft2017 4305; 6.7 at mather2012 828, 852–854; 7.2 at vdd-miller1996 203–212, 530–532. Sampled targets 1.3, 1.4, 3.1, 3.3, 5.3, 6.1, 6.6 are own statements (1.3, 3.1, 3.3, 5.3, 6.1 lacking the mark: R05); 7.1 and 4.2 cite van den Dries 1998, not readable (below); 4.3 is own.

**Adversarial table.** No statement changed, so every row is carried from the previous report (r12 at d111a9c), whose values I re-derived where a finding depends on them (R01, R02, R04).

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. 1, 1.1 (r12) | `ℝ` over `{0<1}` both ways; Sierpiński; `ℝ` over `{0<1<2}` | `s⁻¹{1} = ℝ∖{0}` open vs `{0}` not; `{o}` open vs `{c}` not, lower-set version reverses both; preimages `(1,∞)`, `(0,∞)`; `(0,1]` locally closed, neither open nor closed | true | none |
| 1.2 (r12) | swap pushforward; product; restriction | swap: preimage of `{1}` is `{0}`, not open; upper set `{(0,1),(1,0),(1,1)}` ↦ `ℝ²∖{0}`, in general `⋃ s⁻¹(Ici p) × s⁻¹(Ici q)`; strata `{0}`, `(0,∞)` | true | R05 |
| 1.3 (r12) | `[0,1)∪{2}`; discrete `{a,b}`; finite `P` | `closure X₁ = [0,1) ∌ 2`; `{a}` maximal while `0` is not in `P`; complement of `s⁻¹(U)` is a finite union of closures | true | R05 |
| 1.4 (r12) | `[0,∞)²` | 4 vertices, 5 edges, 2 triangles, `χ = 1`; depths 2, 1, 0 | true | none |
| Conv. 4, 2.1 (r12, re-derived) | `L = ℕ`; `L = ω₁`; `∅`; `Fin 2` | quotient-open set contains no `ℕ×(0,ε)`; for `ω₁` a cluster point of `(x_n)` forces `W ⊇ V×[0,δ)`, so the topologies agree; `C(∅)` a point; `C(Fin 2) ≅ ℝ` | README true; Lean docstring false | R01 |
| 2.2 (r12) | `[0,1)∪{2}`; `K = {0}∪{1/n}`; `L = L' = Fin 2` | charts `C(pt)` at 0, `C(∅)` at 2, frontier fails; `Z` totally disconnected vs a connected interval; `L''` = square boundary, 4 points of index `(0,1)`/`(1,0)`, 4 arcs `(1,1)` | true | none |
| 2.3 (r12) | triangle boundary; 2-simplex; Lurie's `h` | vertex link 2 points; link in 2-simplex = edge with endpoints below interior; `h` has support `σ ∪ supp w_Y` for `t > 0`, `σ` at the apex | true | none (source misprint) |
| 2.4 (r12) | `ε ∈ (0,1]`, 7 traces | each trace open in its set; `(0,δ) ∉ W`; with `V₀₂` the disc, `W ∩ V₀₂ ∋ 0` contains no `(0,δ)` | true | none |
| 3.1 (r12) | `2t−1` on `[−1,1]`; `{a,b}`; `1−t` | indices `1,0,1`; no path `a → b` though `0 < 1`; reversed indices `1 → 0` | true | R05 |
| 3.2 (r12) | monoid `{1,e}` | relation 1: `e = e`; relation 2: `e = e·e`; relation 3: `e ≠ 1` | true | none |
| 3.3(a) Lean (r12) | `P = Unit`, `P = ∅` | every path is exit, exit homotopy = homotopy rel endpoints; `P = ∅` forces `X = ∅`, both categories empty | true | R05 |
| 3.3(e) Lean (r12) | `L = ∅`, `Fin 2`, `ℕ`, `ω₁` | `Hom(apex,apex) = {id}`; height `(1−u)h(t)+u·t·t₁`, then slide `(x(max(t,u)), t·t₁)`, heights `≤ max(h(t), t·t₁) → 0` uniformly | true | R05 |
| 3.4 Lean (r12) | `∞`; `z, w ∈ ℂ` | `Hom(∞,∞) = 1`, `Hom(z,w) = 1`, `Hom(z,∞) = 0`, `Hom(∞,z) = 1`; upper sets `∅, {1}, univ` ↦ `∅, ℂ, S²` | `≌ Fin 2`, true | none |
| 4.1 (r12) | simplices of `∅`, `{v}`, `{v,w}`; `(0,1]`; disc map | `∅`, `{v}`, open segment; `{1}°∪{0,1}° = (0,1]`; `‖(|x|/‖x‖∞)x‖∞ = |x|`, circle ↦ square boundary | true (vdD not readable) | none |
| 4.3 Lean (r12) | `n = 0`; `A = ∅`; `[0,∞)`; compact `A` | `T = {{pt}}`; `K` empty; `x/(1+x)` onto `[0,1)`; closed union ⇒ faces of `τ ∈ T` in `T` | true | none |
| 4.3 vs R2.1, A4.1 (r12) | R2.1 on `{A, Bᵢ}`; A4.1 with `m = n` | `X = closure A`, `τ(σ) ⊆ A` or `⊆ M∖A`, invert on `A`; `h = Φ⁻¹` on the subcomplex `T` | true | none |
| 5.1 (r12) | `[0,1]²`, teardrop, `n = 0` | corner `|j⁻¹| = 2`; teardrop `∂̃` an interval with both ends at the corner; `∂X = ∅` | true | none |
| 5.3 (r12) | left edge `k = 1`; adjacent edges; teardrop | `F ∩ bottom = {(0,0)}`, `F ∩ top = {(0,1)}`, `F ∩ right = ∅`; one corner, `2 − 2 = 0`; two sheets at the teardrop corner | true | R05 |
| 6.1 (r12) | `ℝ²` datum; `[0,1]` datum | 2 arcs, 4 half-lines, 4 corners; `π₁(corner) = (±√ε₀, 0)`; `{ε} ∩ {1−ε} = ∅` | true | R05 |
| 6.2 (r12) | fibre datum over `Σ₀` | arc ends glued to `(±√ε₀, 0)`: a circle | true | none |
| 6.3 (r12) | `ε₁ < ε₀/3`; cone; `[0,1]`; non-proper tube | `|x| ≤ |y| < √ε₁ ⇒ x²+2y² < 3ε₁ < ε₀`; corners in `T₁` iff `3ε₁ < ε₀`; cone `|p| ≥ √ε`; `[√ε, 1−√ε]`; 3 components vs 2 | true | none |
| 6.5 (r12) | `(0<1<2)` over `(0<1)`; `(0<2)` over `(0)` | 4 corners → 2 endpoints, `]1,2[ = ∅`; arcs bounded by corners, `]0,2[ = {1}` | true | none |
| 6.7 (r12) | 6.7 data, `ε = 1/8`; §16.1b fourth Check | `(−1/√8,0)∪(0,1/√8)` = 2 rays; `(−1/√8,1/√8) ≅ C(L₀)`; `M^a_{ac} ∋ 5` | true | none |
| Conv. 6 (r12) | `ℝ²`, `{0} < ℝ²∖{0}` | chain depth 1; AFT `2 − 0 = 2` | true | none |
| 7.1 (r12) | `x^{1/3}`; `|x|`; cusp | `C¹` off `{0}`, dim 0 < 1; three cells | true; domain unstated | R03 |
| 7.2 (r12, re-derived) | cone; `{xy=0}`; graph of `|x|^{k+1/2}` | 3 connected strata; origin and 4 half-axes; graph: Nash stratification `{0}` + 2 branches, secant and tangent at `0` both horizontal | statement true; third Check vacuous | R02 |
| 7.3 (r12, re-derived) | closed disc; `{xy=0}` (not compact) | 2 Nash strata; `Σ₀ = {0}`, `Σ₁` four rays `|t| ≥ √ε`, `∂₀Σ₁` four points, glue = `{xy=0}` | true; narrowed | R04 |

## Not verifiable

- vdd1998 (van den Dries, *Tame Topology and o-minimal Structures*): no legal source known to the sources service and no manifest key, so Chapter 8, (2.9) (4.1), Chapter 7 (7.1; R03 gives a verifiable replacement) and Chapter 4, §2 remain unchecked.
- bcr1998 Theorem 9.7.11 (7.3) and lee2013 Theorem 9.25 (5.4) are settled as uncertified.
- The out-of-scope remarks (69–75) cite Peterzil–Steinhorn 1999 Theorem 2.1, Andújar Guerrero 2025 Remark 5.9, Murayama–Shiota 2013 p. 160 and Commelin–Huber Proposition A.1, with no manifest keys; not re-read this round.
- Ownership against the board package LogicAndDefinabilityInNumberTheory (#164, 972ee8e) was not re-read this round; the previous review placed it after this roadmap in the order.
- Note for the worker (manifest only): the board `sources.toml` entry `almp2012` records arXiv `0906.1568v2`, whose proposition numbers (2.2, 2.3) differ from those of arXiv:1112.0989 (2.3, 2.5) that the README cites. It should carry `arxiv = "1112.0989v1"` and `doi = "10.24033/asens.2165"` with a version note; the manifest still lacks keys for vdd1998, Peterzil–Steinhorn, Andújar Guerrero, Murayama–Shiota, Huber and Grothendieck, and still lists `verona1984` and `thom1969`, which the README no longer cites.

## Source issues

- none (the folder is unchanged; the four source issues of the previous report, in lurie-ha Proposition A.6.8, mather2012 axiom (A10), nocera-volpe2023 Remark 2.21 and vdd-miller1996 D.16, were collected then and are not repeated here).
