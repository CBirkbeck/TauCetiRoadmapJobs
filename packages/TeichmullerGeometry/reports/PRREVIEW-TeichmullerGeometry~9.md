# Review of TeichmullerGeometry (pull request #1169 at a4b2942)

**Verdict:** needs changes

This is an incremental re-review of the 140 lines that changed since `2045060`.

Of the previous round's ten findings:

- seven are repaired;
- one is partly repaired (R05, carried as R03 below);
- two are not repaired (R01 and R10, carried as R01 and R04 below).

The repairs add one new P3 (R02). The gate passes and `Suggested.lean` elaborates. One finding blocks: the cyclic supply with FuchsianOrbifolds at #1168 (R01). The three P3s need no mathematics changed:

- in this README, a duplication of a pinned Tau Ceti instance (R02);
- in #903, a stale ownership clause (R03);
- in the pull-request description, the dependency list (R04).

## R01 (P2) — FuchsianOrbifolds at #1168 still consumes this roadmap, so the supply is cyclic

**Location.**
- README line 40: "Supply runs one way: GeometricTopology, ComplexCurveModuli and FuchsianOrbifolds supply this roadmap and consume nothing from it."
- README line 982: "FuchsianOrbifolds, a supplier of this roadmap, consumes none of these."

**Claim.**
- **This roadmap needs #1168.** It consumes the following, which exist only at #1168's head:
  - FuchsianOrbifolds Layer 0 item 2 in its PGL form;
  - Layer 4a;
  - Layer 7 items 1 and 4.

  Main's FuchsianOrbifolds ends at "## Layer 6" (its line 344).
- **#1168 consumes this roadmap.** #1168's head is unchanged at `62cca0d1`. Its Layer 9 (lines 1385–1466) consumes `T0`, `T4a`, `T9` and `T10`. Lines 986–993 of this README map those ids to:
  - Layer 0;
  - §§4.2–4.5;
  - §4.1 with Layer 10;
  - Layer 11.
- **Consequence.** Lines 40 and 982 are false at the head this roadmap depends on, and the two roadmaps supply each other. The dependency check reads only main, so it cannot see this cycle.

**Witness.** #1168, `TauCetiRoadmap/FuchsianOrbifolds/README.md`:
- line 32: "`Teichmuller T0,T4a,T9,T10 → Fuchsian L9`";
- line 1388: "consume TeichmullerGeometry T10's";
- line 1443: "Consume the following precise T9/T10 interfaces".

**Repair.**
- **In #1168 (same author).** Move Layer 9 (lines 1385–1466) to the later Fuchsian roadmap that this README's line 982 already names. Delete the `→ Fuchsian L9` edges at #1168 lines 32, 146–147, 183–189 and 1479–1486.
- **In this README.** No change is needed.
- **Re-test.** After the move, `grep -n Teichm` on #1168 returns only ownership notes, and no consumed id.

## R02 (P3) — §0.0b re-proves Tau Ceti's finite CW type of a punctured finite realization

**Location.** §0.0b, README line 137:

> "Prove that so has `M ∖ S` for every finite set `S` of interior points: subdivide so that the points of `S` are vertices; … deformation retracts `M ∖ S` onto the finite subcomplex …"

The same paragraph then claims "this finiteness statement" as "the roadmap's own".

**Claim.**
- **What is already at the pin.** After the subdivision step, the retraction and its conclusion are Tau Ceti's:
  - `AbstractSimplicialComplex.instFiniteCWTypeComplVertexImage` gives finite CW type to a finite realization minus any set of vertices.
  - It goes through `AbstractSimplicialComplex.complementHomotopyEquiv`, the open-star retraction in the barycentric subdivision. That is the route the README describes.
  - `Homeomorph.finiteCWType` carries the result to `M ∖ S`.
- **What the README says.** None of these three declarations is in the Tau Ceti contract (line 65) or in §0.0b's *Needs* (line 147), and the paragraph claims the argument as its own.
- **Why it matters.** This statement was added for Layers 8.3 and 10.4, so it is new in this round.

**Witness.**
- Tau Ceti `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Complement.lean`, line 92 (`complementHomotopyEquiv`) and line 132 (the instance).
- In a scratch file, `example … [Finite (Face K)] (s : Set ι) : TauCeti.FiniteCWType {x : Realization K // x ∉ K.vertex '' s} := inferInstance` elaborates.

**Repair.**
- **§0.0b.** Replace the retraction route with: "subdivide so that the points of `S` are vertices (a stellar subdivision at each point); the triangulation then carries `M ∖ S` homeomorphically onto the realization minus those vertices, which has finite CW type by Tau Ceti's `AbstractSimplicialComplex.instFiniteCWTypeComplVertexImage`, transported by `Homeomorph.finiteCWType`."
- **Citations.** Add both declarations to the Tau Ceti contract and to §0.0b's *Needs*.
- **Ownership clause.** Limit "the roadmap's own" to the subdivision step.
- **Tested** on `∂Δ³ ≅ S²` minus three vertices: the instance applies, and `TauCeti.eulerChar_compl_of_finite` gives `2 − 3 = −1`. That is the theta-graph value of the Check at line 142.

## R03 (P3) — #903 still assigns the smoothing of paths to its Layer 3.3 (previous R05, remainder)

**Location.**
- #903, `TauCetiRoadmap/GeometricTopology/README.md` lines 1389–1390: "a continuous path in `Diff(M)` need not be a smooth isotopy, and the smoothing of paths is Layer 3.3's."
- This README, line 12: "the parameter-smoothing converse is owned here for every compact manifold … GeometricTopology Layer 3 stating … but not this converse".

**Claim.**
- **This README's half is done.**
  - §0.2 (line 286) states the parameter-smoothing theorem for every compact manifold, closed or with a boundary collar.
  - Isotopy extension now comes from Tau Ceti.
  - Line 12 is accurate: #903's §3.3 (lines 1434–1478) states isotopy extension, the restriction fibration, relative isotopy extension, its continuous form and the disc theorem, and no path smoothing.
- **What remains in #903.** Its §3.1 still names its own Layer 3.3 as the owner. So two roadmaps claim the object, and a reader of #903 is sent to a section that does not contain it.

**Witness.** At #903's head `1806dd42`, `roadmaps grep` for path smoothing finds only #903 lines 1389–1390 and this README.

**Repair.**
- **In #903 (same author).** Replace "and the smoothing of paths is Layer 3.3's" with "and the smoothing of paths is not planned here".
- **In this README.** No change is needed.
- **Re-test.** `grep -n "smoothing of paths"` on #903 returns only that sentence.

## R04 (P3) — The description still declares the wrong dependencies (previous R10)

**Location.** The pull-request description:
- task list: "- [ ] depends on: #953";
- merge-order paragraph: "#271 (SurfaceTopology, mccorvie) → **this pull request** (#1169)".

**Claim.** The description is unchanged since the previous round.
- **#953 has merged.** ComplexKahlerGeometry is on main.
- **SurfaceTopology is barred as a supplier.** `grep -c SurfaceTopology` returns 0 for both files of this folder.
- **The real predecessors are missing.** The README cites ids that exist only at open revision heads:
  - GeometricTopology Layers 1.7.2, 3.1, 3.3, 3.4, 11.2.1 and 11.3, at #903;
  - FuchsianOrbifolds Layer 0 item 2 in PGL form, Layer 4a and Layer 7, at #1168. The overlaps report says #1168 "must merge first".
- **Consequence.** The merge chain computed from the task list names the wrong predecessor and misses both real ones.

**Witness.**
- Main's GeometricTopology has unnumbered `### Layer 1`, `### Layer 3` and `### Layer 11` (lines 177, 357 and 831), and no "11.2.1" or "1.7.2" anywhere.
- Main's FuchsianOrbifolds ends at Layer 6.

**Repair.** Make the task list read "- [ ] depends on: #903" and "- [ ] depends on: #1168", and drop #953. The computed merge-order paragraph then names #903 and #1168, not #271.

## Previous findings

- R01 — not repaired: line 40 still reads "GeometricTopology, ComplexCurveModuli and FuchsianOrbifolds supply this roadmap and consume nothing from it". #1168 is still at `62cca0d1`, and its Layer 9 consumes `T0`/`T4a`/`T9`/`T10`. Carried as R01.
- R02 — repaired: line 48, "`Δ⁺ = −div grad` … the negative of DifferentialGeometry Layer 12's and Tau Ceti's `laplaceBeltrami = div grad`". Line 77 names item 12.3. §4.5 Check 1 now uses the linearization `Δ⁺v = 2v`.
- R03 — repaired: line 16, "`OuterAut` of an arbitrary group, which differs from FiniteGroupInvariants Layer 3.1's `Out(G)` by dropping that roadmap's standing finiteness … agrees, for the discrete topology, with … `TauCeti.ContinuousOut`". §4.2 adds the clause and a Check.
- R04 — repaired: §8.3 applies `…FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree` with `ramificationDegree π = |F⁺| Σᵢ(1 − 1/mᵢ)`, and §10.4 does the same. Line 9 states how the kept forms differ from that theorem and from `TauCeti.TopBranchedCover`.
- R05 — partly repaired: §0.3 and lines 27 and 81 now take isotopy extension from `TauCeti.SmoothIsotopy.exists_diffeotopy_apply_eq`, and §0.2 owns path smoothing "for every compact manifold". #903 line 1390 still says "the smoothing of paths is Layer 3.3's". Carried as R03.
- R06 — repaired: line 101 reads "Layer 2.1 (B8, …), Layer 2.2 (B9, …), Layer 2.3 (B10, …)". `grep -n Lane` on the README returns nothing.
- R07 — repaired: §4.1 Check 1 now says the inverted rule "would send the identity matrix `I` to `z ↦ z̄` … takes `i` to `−i ∉ ℍ`". The §10.3 Check is deleted, and three Checks remain.
- R08 — repaired: §4.3 cites "Hatcher, *Algebraic Topology*, Proposition 1.26(a), p. 50, and the computation … following it, p. 51". §§1.1, 2.1 and 3.2 now carry the "roadmap's own" clause or a classical locator.
- R09 — repaired: the module docstring lists "Teichmüller's existence and uniqueness theorem … (Layer 7.5)" as not statable. The four instances at lines 221, 226, 259 and 263 have docstrings.
- R10 — not repaired: the description still reads "- [ ] depends on: #953", and the merge order still reads "#271 (SurfaceTopology, mccorvie) → **this pull request**". Carried as R04.

## Verified sound

### Mechanical checks at `a4b2942`

- **Gate.** My own run agrees with the worker's: `set_option=0 … sorry-data=0 … statement-hygiene=0 … depcheck=0 … outside-folder=0 source-material=0 build=0 OK`, exit 0.
- **Elaboration.** `lake env lean TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` exits 0 in 11 s. It gives 22 `declaration uses sorry` warnings and nothing else.
- **Dependency check.**
  - Output: `depcheck: 238 roadmaps, 2353 edges, 0 problem(s)`.
  - No UPWARD, CYCLE or `moved:` line. TeichmullerGeometry is line 283 of the merge order.
  - The check reads main, so the #1168 cycle (R01) is outside its view.
- **Other changes.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TeichmullerGeometry'` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **`Suggested.lean` diff.** It only adds docstrings: four instances, the `OuterAut` docstring, and two bullets of the module docstring.
  - No statement or binder changed. The worker's elaborated signatures for `OuterAut`, `innerAut_normal` and `dehn_nielsen_baer` match the previous round's.
  - The previous one-tactic probe therefore stands: 22 of 22 sorries resist, and there is no padding.

### Adversarial table

- **Carried rows.** Rows marked "prev. N" are carried unchanged from the previous report, `PRREVIEW-TeichmullerGeometry~8`. The statement each one reads is untouched by this diff, or only gained an ownership clause.
- **New rows.** The rows lettered A–Q cover the changed statements and the sampled targets that the previous table had no row for.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| prev. 1 | §0.0a `exists_pl_approximation_open` | `f = id`; `1/q` error | `g = id`; error infimum 0 excluded | true | none |
| prev. 2 | §0.0a half-plane form | `(x₀, x₁ + x₀²)` | keeps `x₀ ≥ 0`, fixes `x₀ = 0` | true | none |
| prev. 3 | §0.0b `image_boundary` | disc vs `S²` | `∂ = S¹` vs `∅` | true | none |
| prev. 4 | §0.0d closed-surface Epstein | `S²` identity vs antipodal map | degrees `1`, `−1`; `Mod(RP²) = 1` | true | none |
| prev. 5 | §0.0d relative form | disc conjugation; annulus twist | hypothesis fails; not homotopic rel `∂` | true | none |
| prev. 6–7 | §0.0f `word`, `eulerChar_model` | sphere, disc, `RP²`, Klein bottle, Dyck surface | `2, 1, 1, 0, −1` | correct | none |
| prev. 8–9 | classification, genus | torus vs genus 2 / Klein bottle / annulus | `(0,+,0)`, `(−2,+,0)`, `(0,−,0)`, `(0,+,2)`; `sInf ∅ = 0` | true | none |
| prev. 10 | §0.0g degree and `riemannHurwitz` | `zⁿ` on `Ĉ` and on the disc | `2 = 2n − 2(n−1)`; `1 = n − (n−1)` | true | text unchanged; R04 use repaired |
| prev. 11 | §0.0h `toTop_bijective` | disc conjugation; `S₄` on `∂Δ³` | `\|MCG(D²)\| = 2`; even permutations trivial | consistent | clause added |
| prev. 14 | §0.4 markings (sampled) | torus shear; genus-2 involution | `[[1,1],[0,1]] ≠ ±I`; `h_* = −I` realized | consistent | clause added |
| prev. 16 | §2.4 dimension (sampled) | `g = 1, 2, 3` | `0+0+1 = 1`; `3`; `6` | true | none |
| prev. 17 | §3.1 `Mod±` (sampled) | `S²`, `T²` | `ℤ/2`; `GL₂(ℤ)` | consistent | none |
| prev. 19 | §4.1 `exists_mulEquiv_isometryEquiv_glAction` | `diag(1,−1)`, `diag(−2,1)`, `λI` with `λ < 0` | `−z̄`; `dist = log 2` kept; `det = λ² > 0` | true | none |
| prev. 22 | §4.2 `η` | circle generator | translation `+1`; `loopDeck p` gives an antihomomorphism | true | none |
| prev. 25–28 | §5.2, §5.4, §5.4a (sampled) | `T²`, `S²`, Klein bottle; `(x,−y)`; `−I`, swap | `GL₂(ℤ)` on both sides; `1 ≤ 0` false; isotopic vs `diag(1,−1)`; det `1`, `−1` | true | none |
| prev. 29 | §5.6 stabilizers | `Aut(Π)`, `Inn(Π)` | infinite, empty fixed set; `1` | consistent | none |
| prev. 30 | §7.4 `measurable_riemann_mapping` | `μ = a`; `μ = 0`; `k < 0` | `f_z̄ = a/(1+a) = a f_z`; `0`; `hbound` false | true | none |
| prev. 32 | §8.2 `nielsen_realization` | `⟨−I⟩` on `T²` | `(½ − x, −y)` is a second lift | true | none |
| prev. 34 | §8.5 genus-two kernel (sampled) | `h = 0, 1, 2` | `r = 6`, `\|K\| = 2`; `2 ≥ 3` impossible; `\|K\| = 1` excluded | true | clause added |
| prev. 35 | §10.1 index bound | `(2,3,7)`; Bolza surface | `1/42`; `96 ≤ 168`, `96 > 84` | true | clause added |
| A | Conventions `Δ⁺` (lines 31, 48, 77) | `x²` on the flat plane; pinned equation at `φ = 0`, `K = −1` | `laplaceBeltrami = div(2x, 0) = 2`, `Δ⁺ = −2`; `−0 + (−1) + 1 = 0` | consistent with Tau Ceti `CurvatureEquation.lean` line 90 | R02 (prev.) repaired |
| B | §4.5 Check 1 | wrong sign `div grad u − 1 + e^(2u) = 0`; correct sign | linearizations `div grad v + 2v = 0`, i.e. `Δ⁺v = 2v`; `Δ⁺v + 2v = 0` gives `⟨Δ⁺v, v⟩ = −2‖v‖²`, so `v = 0` | discriminating | none |
| C | §0.0b `M ∖ S` has finite CW type | `S²` minus 3 points; minus a Cantor set; `∂Δ³` minus 3 vertices | `χ = 2 − 3 = −1` = theta graph `2 − 3`; `H₁` infinitely generated; pinned instance applies (probe) | true but duplicated | R02 |
| D | §0.2 for every compact manifold | `S¹`; `D²` with a collar | `π₀ = ℤ/2`, agreeing with #903 §3.1's Check; spliced `2π` rotation lies in `Diff₀` | true; second claimant at #903 | R03 |
| E | §0.3 via the pinned isotopy extension | `n = m = ⊤`; `σ(1)`; translated line `ℝ × {0}` | `⊤ + 1 ≤ ⊤` and `1 ≤ ⊤` give a smooth diffeotopy; `σ(1) = 1` gives `Φ₁ ∘ e₀ = e₁` on `K`; no compact support | true | prev. R05 first half repaired |
| F | §4.1 Check 1 | inverted conjugation rule | `I ↦ z̄`, `i ↦ −i`, `Im = −1 < 0` | the Check is correct now | prev. R07 repaired |
| G | §4.2 `OuterAut` vs `TauCeti.ContinuousOut` | `Q₈` discrete; `(ℝ, +)` usual topology | `24/4 = 6` both; `ContinuousOut ≅ ℝˣ`; Hamel swap gives `c² = 1`, so `b₂ = ±b₁`, a contradiction | true; pinned form needs only `SeparatelyContinuousMul` (`ContinuousAut/Basic.lean` line 311) | prev. R03 repaired |
| H | §4.3 locator (sampled) | hatcher2002 | line 2266 (p. 50) Prop. 1.26(a); lines 2318–2325 (p. 51) `[a₁,b₁]⋯[a_g,b_g]`, paths composed first-traverse | matches | prev. R08 repaired |
| I | §4.4 (sampled; clause added) | genus-2 holonomy; degree-`k` cover; reflection conjugate | `e = −2`; `k(−2) = 2 − 2(1+k)`; `+2`; Milnor–Wood `\|e\| ≤ 2` | consistent | none |
| J | §5.5 (sampled; consumes §0.3) | chain of `2g+1` curves | `V = 2g`, `E = 2 + 2(2g−1) = 4g`, `χ = −2g = 2 − 2g − b` gives `b = 2` | true; uses "Layer 0.3's isotopy extension", as §0.3 now states | none |
| K | §6.1 (sampled; locator added) | `cρc⁻¹` | `e = 2g − 2`, so `deg f = −1` | consistent; Imayoshi–Taniguchi Ch. 2 not verifiable | none |
| L | §7.3 (sampled) | `g = 2`; all twists `0` | `2(3g−3) = 6`, three lengths and three twists; reflection fixes the zero-twist point | consistent | none |
| M | §8.3 holomorphic Riemann–Hurwitz | hyperelliptic `g = 2`; `ℤ/3` in genus 3 with signature `(1; 3, 3)` | `R = 6·1 = 6`, `−2 = 2·2 − 6`; `R = 2·(3−1) = 4`, `−4 = 3·0 − 4` | true; pinned hypotheses checked by `#check` (one universe, compact `X`, Hausdorff, preconnected, three finite-CW instances) | prev. R04 repaired |
| N | §10.2 (sampled) and §10.4 count | index-2 cover; Klein quartic with `N = Π`, `e = 168`, `(0; 2,3,7)` | genus `1 + 2(g−1) = 2g − 1`; `84, 56, 24` points, `R = 84 + 112 + 144 = 340`, `−4 = 168·2 − 340` | true | none |
| O | Line 9: how the kept forms differ | `TopBranchedCover`; `FiniteHolomorphicMap` | base `OnePoint ℂ`, marked `{0,1,∞}` (`TopBranchedCover.lean` line 148); `ChartedSpace ℂ`, no boundary | accurate | none |
| P | §10.3 Checks after the deletion; §11.1 (sampled) | `N = Π`; genus-3 double cover; trace `k = 2`; Klein quartic | 3 Checks remain; `3h − 3 + r = 3·2 − 3 + 0 = 3`; `168 = 84·2`, arithmetic, not maximal | consistent | prev. R07 repaired |
| Q | Lines 40 and 982 (supply); PDE contract (line 101) | #1168 at `62cca0d`; PDE §2.3 | Layer 9 consumes `T0`/`T4a`/`T9`/`T10`; "weak type `(1,1)`, `Lᵖ`", "`L¹` … never stated" | supply false (R01); PDE matches | R01; prev. R06 repaired |

### Headline theorems

- **Stated.** Unchanged since the previous round:
  - PL approximation; invariance of the boundary; Epstein's two theorems;
  - the classification, the complete invariant and the genus;
  - degree and Riemann–Hurwitz; the PL comparison;
  - `Isom(ℍ) ≃ PGL₂(ℝ)`;
  - based realization, Baer–Epstein and Dehn–Nielsen–Baer;
  - the sphere and the torus;
  - measurable Riemann mapping; Nielsen lifting.
- **Named as not statable, each with the carrier it lacks.**
  - `Teich(Σ)` with its atlas, dimension and Fenchel–Nielsen coordinates;
  - completeness;
  - **added this round:** Thurston's earthquake theorem and Kerckhoff's convexity;
  - the fixed-point form of Nielsen realization; the fixed-locus dimension;
  - **added this round:** the genus-two kernel;
  - the four loci;
  - **added this round:** Teichmüller's extremal theorem;
  - the Euler number;
  - coherent orientations.
- **Missing.** None.

### Library declarations resolved at the pins

- **Opened at Tau Ceti `2fd255d`**, for the declarations this diff adds:
  - `Analysis/Complex/RiemannSurface/Branch/EulerCharacteristic.lean` line 130;
  - `Degree.lean` lines 134 (`FiniteHolomorphicMap`) and 121 (`degree`);
  - `LocalMultiplicity.lean` line 89;
  - `Ramification.lean` line 78 (`ramificationDegree = ∑ᶠ x, (localMultiplicity f x − 1)`);
  - `AlgebraicTopology/ThricePuncturedSphere/TopBranchedCover.lean` lines 148 and 347;
  - `Topology/Algebra/Group/ContinuousAut/Basic.lean` line 311;
  - `Geometry/Manifold/Riemannian/Laplacian.lean` line 238 (namespace `TauCeti.Manifold`);
  - `Riemannian/Hyperbolic/CurvatureEquation.lean` lines 90 and 166 (namespace `Bundle.ContMDiffRiemannianMetric`);
  - `Geometry/Manifold/SmoothIsotopy/Extension.lean` line 82, with hypotheses `I.Boundaryless`, `J.Boundaryless`, `[T2Space N]`, `[SigmaCompactSpace N]`, `FiniteDimensional ℝ E'`, `1 ≤ m`, `m + 1 ≤ n`;
  - `Topology/CWComplex/Classical/FiniteCWType.lean` lines 91 and 98;
  - `AlgebraicTopology/Cellular/EulerCharacteristic/Puncture.lean` line 113;
  - `AlgebraicTopology/SimplicialComplex/Realization/Complement.lean` lines 92 and 132 (R02).
- **Elaborated in a scratch probe, which exits 0.** `#check` of the holomorphic Riemann–Hurwitz theorem and of `eulerChar_compl_of_finite`, plus the two finite-CW `example`s of R02.

### Cross-roadmap citations resolved

- **Main (`35884a8`).**
  - DifferentialGeometry: line 45 ("`Δ = div ∘ grad`"), Layer 12 item 12.3 (line 921).
  - PDE: Layer 2 (line 1092), §§2.1–2.3 (lines 1098, 1148 and 1187; Riesz–Thorin in §2.2, weak `(1,1)` in §2.3).
  - The suppliers ComplexKahlerGeometry, ComplexCurveModuli, GeometricTopology and FuchsianOrbifolds exist.
- **#903 at `1806dd42`.**
  - §3.1 line 1369;
  - §3.3 line 1434, including "Relative isotopy extension … identity on an open set where the family is constant", which matches the contract at line 81;
  - §3.4 line 1481.
- **#1708 at `fc18b54`.** Line 104 keeps the standing carrier `[Group G] [Finite G]`, and §3.1 (line 665) defines `Out(G)`. Line 16's clause on how `OuterAut` differs is accurate.
- **#1168 at `62cca0d`.** Unchanged (R01).
- **Ownership against open pull requests.**
  - Checked against #903, #1168 and #1708.
  - `roadmaps grep` for path smoothing in `Diff(M)` finds only #903 and this roadmap.
  - The overlaps report lists no pull request that changes this roadmap and no dropped id. FuchsianOrbifolds Layer 7 exists only at #1168 (R04).

### Remarks on untouched text

- None.

## Not verifiable

- **Imayoshi–Taniguchi (Springer 1992) and Hubbard (Matrix Editions 2006).** These are new locators in changed passages:
  - Imayoshi–Taniguchi Chapter 2, in §4.5 and the sampled §6.1;
  - Imayoshi–Taniguchi Chapter 6 and Hubbard Chapter 6, in §2.1.

  Both books are commercial. The README marks them *uncertified*, the manifest does not record them, and the worker's sources cache has no copy. I did not read them.
- **Hirsch, Chapter 8, Theorem 1.3** (§0.3). The manifest settles `hirsch1976` as uncertified. The pinned Tau Ceti file cites the same theorem.
- **Carried from the previous round.** Farb–Margalit, Moise, Massey, Ahlfors–Bers, Douady–Earle, Wolpert and Munkres are paywalled. Kerckhoff 1983 is waived.

## Source issues

- none
