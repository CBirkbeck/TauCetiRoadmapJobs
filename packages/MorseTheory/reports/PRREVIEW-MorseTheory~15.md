# Review of MorseTheory (pull request #1682 at 1647f55)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/MorseTheory/` at head 1647f55be2c529d28eef8cc7ecbbf117ab6ffdbd. The folder changed by 283 lines since a78ce2c, the head the last review read. There is one finding, and it blocks.

- R01 is the last review's R01 (and the one before). Only a merge of main into the branch can repair it, and a repair job cannot do that, so it is marked re-raised. No edit to `README.md` or `Suggested.lean` is requested before the merge.
- The last review's R02, R03 and R04 are repaired at this head (see "Previous findings").
- The whole roadmap was reviewed again; no new finding survived verification.

## R01 (P1) — The branch is still not merged with main, so 82 Tau Ceti declarations the README and `Suggested.lean` call "pinned" do not exist at this head's pin

Re-raised: H01

**Location:**
- `TauCetiRoadmap/MorseTheory/README.md:38–40`: "The pinned Tau Ceti Morse library already proves a large part of Layers 1–4 and 6, and the targets it proves are consumed by the names that the Tau Ceti contract lists".
- The same claim runs through the Tau Ceti contract (lines 149–401), the "pinned" sentences of §1.1–§4.4 and §6.1, and `TauCetiRoadmap/MorseTheory/Suggested.lean:19–35`.

**Claim:** This head's `lake-manifest.json` still pins Tau Ceti a91d3aaf, Mathlib 6b7abb3c and Lean v4.35.0-rc3; main (94294cd) pins Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2. The merge base is still ffcc9d31, and `git merge-tree --write-tree origin/main HEAD` reports CONFLICT in both `README.md` and `Suggested.lean`.

I indexed the dotted library names backticked in the README (100 names) against the Tau Ceti tree at this head's pin and against the tree at 2fd255d (extracted from the package's git):
- 82 exist only at 2fd255d;
- 18 exist at both pins (among them `TauCeti.IsBicollar`, `TauCeti.IsBicollared`, `TauCeti.IsBicollar.disjoint_image_Ioi_Iio`, `TauCeti.brownBicollaring`, `maximalIntegralCurveInterval`, `IsMIntegralCurveOn.subset_maximalIntegralCurveInterval`, `IsMIntegralCurveOn.eqOn_maximalIntegralCurve`, `TauCeti.boundaryChartedSpace`);
- none exists only at a91d3aaf.

At this head that has the same three consequences as before:
1. **The deferred targets have no owner at the pin the build uses.** Every target of Layers 1–4 and 6 that the README defers as pinned (for example `TauCeti.criticalPoints`, `TauCeti.exists_sublevelDeformation`, `TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation`, `TauCeti.lsCategoryCount_univ_le_totalCriticalCount`, `IsLocalExtr.mem_criticalPoints`, `TauCeti.nonempty_homeomorph_sphere_of_union_closedBall`) is absent at a91d3aaf.
2. **Statable headlines are missing.** Reeb's theorem is statable at a91d3aaf from `TauCeti.IsMorse` alone and `Suggested.lean` omits it because it is "pinned".
3. **The docstring names missing declarations.** `Suggested.lean:20` names `TauCeti.criticalPoints I f` and lines 22–35 name eleven "proved" declarations; none exists at a91d3aaf.

The gate passes only because `Suggested.lean` imports four modules that exist at both pins.

**Witness:** At a91d3aaf, `TauCeti/Geometry/Manifold/Morse/` holds `Basic.lean`, `Index.lean`, `Prod.lean` and `Sphere/` (4 entries); at 2fd255d the same directory has 35 entries, among them `CriticalPoints.lean`, `Reeb.lean` and `Deformation.lean`.

**Why H01's reason does not settle it:** H01 is right that the merge is a branch operation for the worker: it touches `lake-manifest.json` and `lean-toolchain`, which a repair job may not edit. But the merge has not been done, so the contract is false at the pin the build uses, and no edit to the two roadmap files can repair that.

**Exact repair (for the worker or a human, not a repair job):**
1. Merge `origin/main` (94294cd) into the branch, resolving `README.md` and `Suggested.lean` to this head's text. This brings Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2.
2. In `Suggested.lean`:
   - import `TauCeti.Geometry.Manifold.Morse.CriticalPoints` and `TauCeti.Geometry.Manifold.Riemannian.Gradient.Basic`;
   - use `x ∈ TauCeti.criticalPoints I f`, `(TauCeti.criticalCount I f j).toNat`, `TauCeti.totalCriticalCount I f = 2` and `-TauCeti.Manifold.mgradient I f`;
   - delete the sentence at lines 19–20 that explains the zero-set spelling;
   - add Reeb's theorem and the pinned weak and strong inequalities to the docstring's list of consumed headlines.
3. Re-elaborate and re-run the gate at the new pins.
4. Update the pull request's title and description. They still announce "Palais–Smale compactness and nonproper gradient convergence" and `PalaisSmaleTargets.lean`, which README lines 74–79 place outside this roadmap.

Tested at 2fd255d by reading the sources: every contract entry opened this round and last round carries the hypotheses the README states (list under Verified sound).

## Previous findings

- **R01 (merge main into the branch): not repaired.** This is R01 above. The merge base is still ffcc9d31, and both files still conflict with main.
- **R02 (Brown's theorem re-encoded the bicollar): repaired.** `Suggested.lean:124–137` now takes `(f : Metric.sphere (0 : EuclideanSpace ℝ (Fin m)) 1 → Metric.sphere (0 : EuclideanSpace ℝ (Fin (m + 1))) 1) (hf : TauCeti.IsBicollared f)` and writes `Set.range f` for Σ in its three occurrences; the file imports `TauCeti.Geometry.Manifold.LocallyFlat.Bicollar`. README lines 386–394 cite `TauCeti.IsBicollar`, `TauCeti.IsBicollared`, `TauCeti.IsBicollar.disjoint_image_Ioi_Iio` and `TauCeti.IsBicollar.range_diff_range_eq_union` in the Tau Ceti contract; §4.4 (lines 1229–1247) states the theorem on the predicate, proves the two hypotheses equivalent (restriction of b to S^(m−1)×[−1,1]; conversely invariance of domain on S^(m−1)×(−1,1) and s↦s/(1+|s|)); the two-open-cell sketch (lines 1302–1305) takes the open annulus {r−η<|u|<r+η} with the radial map as the bicollar; and lines 1283–1287 say that composing with `TauCeti.brownBicollaring (m−1)` gives the locally flat Schoenflies theorem. The Lean statement elaborates with one `sorry` warning (line 124).
- **R03 (uniqueness applied at the endpoint t = 0): repaired.** README lines 1464–1484 compare γ with the maximal curve Γ through γ(t₁) at a positive time t₁: the shifted curve is integral on (−t₁,∞), `IsMIntegralCurveOn.subset_maximalIntegralCurveInterval` and `IsMIntegralCurveOn.eqOn_maximalIntegralCurve` give Γ(s)=γ(t₁+s), and the constants are C·e^(μt₁), c=μ, T=t₁+T₀. The *Needs:* line (1490–1496) lists the two maximal-curve lemmas and the Mathlib uniqueness lemma on which the second rests. The endpoint Check at line 1504 is the instance that refuted the old route (verified: adversarial row 21).
- **R04 (handle-attachment homeomorphism had no locator): repaired.** README lines 699–706 cite Nicolaescu, *An Invitation to Morse Theory*, Theorem 2.2.3, pp. 38–42, and Remark 2.2.5, p. 42, with the hypotheses (f exhaustive; the proof uses a compact band f⁻¹[c−ε,c+ε] with no other critical point). Verified at `nicolaescu-invitation` lines 1950–1959 (printed p. 38, running to p. 42 at line 2176) and 2177–2180 (p. 42): a critical value with a single critical point of index λ, ε small, {f≤c+ε} homeomorphic to {f≤c−ε} with a λ-handle of dimension m attached; the Remark covers several critical points on one level; lines 1962–1966 state the compact critical-free band. The reference entry (lines 1543–1546) names the author version and its URL, which is the cache's source.

## Verified sound

**Gate, dependencies, elaboration and signatures.**
- The worktree is clean at 1647f55. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/MorseTheory'` is empty.
- Gate rerun on this head: every check is 0, and the gate prints `OK`.
- Dependency check output: `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. MorseTheory and its suppliers DifferentialGeometry, AlgebraicTopology, GeometricTopology, CharacteristicClasses, ComplexKahlerGeometry, ComplexManifolds, DGFloer, HeegaardFloer and RiemannianGeometry are roadmaps on main.
- `lake env lean TauCetiRoadmap/MorseTheory/Suggested.lean` elaborates in 53 s. Its only output is 7 `declaration uses sorry` warnings, at lines 68, 94, 109, 124, 145, 159 and 173.
- `#check @name` for all 8 declarations, in one scratch file, matches `scratch/signatures.md` and the README statements: the standing binders (finite-dimensional E, boundaryless I, T2, `IsManifold I ∞`, second countable) are present on the five manifold theorems; `omit` drops them from Brown's theorem and the two-open-cell lemma, whose statements do not mention M; `bettiNumber` takes k and X in one universe, and `strong_morse_inequalities` resolves k to M's universe, as §4.1 says. Nothing changed after the check.
- **One-tactic probe.** I replaced each `sorry` by `first | rfl | simp | infer_instance | aesop | trivial | decide | exact ⟨_, rfl⟩` on a scratch copy. All 7 theorems fail (errors at lines 75, 103, 116, 136, 152, 164 and 184), so there is no padding.

**Library declarations opened, with hypotheses compared with the README.**
- At this head's pin and at 2fd255d (identical text), `TauCeti/Geometry/Manifold/LocallyFlat/Bicollar.lean`: `structure IsBicollar (f : N → M) (b : N × ℝ → M) : Prop` (line 101, fields `isOpenEmbedding` and `apply_zero`), `def IsBicollared f := ∃ b, IsBicollar f b` (108), `IsBicollar.isEmbedding` (135), `range_diff_range_eq_union` (171) and `disjoint_image_Ioi_Iio` (180: `Disjoint (b '' univ ×ˢ Ioi 0) (b '' univ ×ˢ Iio 0)`). The README's contract entry (lines 386–394) states exactly these.
- At both pins, `LocallyFlat/Sphere.lean:74`: `BrownBicollaring n` is `∀ f : sphere (0 : EuclideanSpace ℝ (Fin (n+1))) 1 → sphere (0 : EuclideanSpace ℝ (Fin (n+2))) 1, IsLocallyFlat (EuclideanSpace ℝ (Fin n)) ℝ f → IsBicollared f`, proved by `brownBicollaring` (`LocallyFlat/Brown.lean:39`) for every n including n=0. With n=m−1 and m≥1 the domain is the sphere in `Fin m` and the target the sphere in `Fin (m+1)`, as README lines 1283–1286 say.
- At both pins, `TauCeti/Geometry/Manifold/IntegralCurve/Maximal.lean` (root namespace, not `TauCeti.`): `maximalIntegralCurveInterval` (107), `IsMIntegralCurveOn.subset_maximalIntegralCurveInterval` (113: an integral curve on `Ioo a b` with `0 ∈ Ioo a b` and `γ 0 = x`), `maximalIntegralCurve` (215), and `IsMIntegralCurveOn.eqOn_maximalIntegralCurve` (249, under `variable [T2Space M] [IsManifold I 1 M] [BoundarylessManifold I M]` at 244, with `CMDiff 1 (fun y ↦ ⟨y, v y⟩)`); its proof uses `isMIntegralCurveOn_Ioo_eqOn_of_contMDiff_boundaryless` (line 264), as README line 1496 says.
- Mathlib at the head pin: `IsMIntegralCurveOn γ v s := ∀ t ∈ s, HasMFDerivAt[s] γ t …` (`IntegralCurve/Basic.lean:65`), so the curve equation on `Ici 0` is one-sided at 0 and two-sided at every t>0, as README lines 1467–1470 say; `isMIntegralCurveOn_Ioo_eqOn_of_contMDiff_boundaryless` needs `t₀ ∈ Ioo a b`, a C¹ field, `T2Space M`, `IsManifold I 1 M` and `BoundarylessManifold I M`.
- At this head's pin: `TauCeti.IsMorse` (`Morse/Basic.lean`) includes `ContMDiff … ∞`, so the headlines' `IsMorse` hypothesis carries smoothness.
- At 2fd255d (read from the extracted tree), the entries checked last round are unchanged: `CriticalPoints.lean` (`criticalPoints` 87, `IsLocalExtr.mem_criticalPoints` 213, `finite_criticalPoints_inter` 274, `criticalCount_neg` 426), `Lemma.lean:69` (`MorseChart` with weights ±1 and the factor 1/2), `PseudoGradient/Basic.lean:72`, `Generic/Strong.lean:110, 279, 290`, `GradientFlow.lean:208, 261, 282`, `HandleRetraction.lean:241` (a deformation retraction, not the handle homeomorphism, so §2.2's handle target is owned), `Inequalities.lean:393–429`, `MorseInequalities.lean:148`, `FreeModule/PID.lean:42`, `LusternikSchnirelmann.lean:454`, `Boundary/Charts.lean:195` (`boundaryChartedSpace`, at both pins).
- No Morse–Bott predicate exists at either pin or in Mathlib, so the docstring's statement that Layer 5 cannot be stated is correct.

**Cross-roadmap citations, resolved on main (94294cd):**
- DifferentialGeometry: Layer 3 (line 371); Layer 5 with 5.1 `boundaryOrientation_spec` (503, 509); Layer 10 with 10.2 Sard (877, 884); Layer 12 with 12.2 gradient and 12.3 Hessian (910, 918, 920).
- AlgebraicTopology: Stages 2, 4, 6 and 8 (326, 499, 946, 1602); Stage 4 items 4 and 5 (the disc over its boundary sphere with coproducts, the relative CW pushout, the cofibration tower equivalence and the subcomplex tower union: lines 535–700); "Stage 4.4" and "Stage 4.6" in the text (358, 271); `lsCupLength` and its bound in the categorical-cover supplement (1117–1123, 2101).
- GeometricTopology Layer 1 (177); CharacteristicClasses C2 (728); ComplexKahlerGeometry K7.1 (1407); ComplexManifolds Milestone 1 (172, anchor used at README line 1130); DGFloer Layer 1 item 3 `SpectralObject` (225–229, 391); SymplecticGeometry/ConvexityToric T2 (73); HeegaardFloer Lane M (70); RiemannianGeometry R3 (82, 89); AffineMorseLefschetz exists on main.

**Consumers of this roadmap.** On main and in the open pull requests, other roadmaps cite MorseTheory by the labels M1–M6 (MorseNovikov rev 1161: M1, M2, M4, M6; RiemannianGeometry rev 1683: M1–M5; DGFloer rev 1798 and DGFloerPartII rev 1799: M4, M5), which the layer headings keep, and by the two HeegaardFloer anchors `#m2-…` and `#m5-…` (main lines 647 and 1064; the same two anchors are the only ones into MorseTheory in every open checkout). README lines 461–467 map those anchors old → new, and the anchors computed from the headings (lines 577, 1349) agree. `scratch/overlaps.md` lists no other dropped id and no other pull request changing this roadmap.

**Ownership against open pull requests.**
- MorseNovikov (rev 1161), RiemannianGeometry (rev 1683), DGFloer (rev 1798) and DGFloerPartII (rev 1799) consume this roadmap by label and own none of its headlines.
- No open roadmap states the Morse CW model, the ℕ[t] identity, the two-critical-point sphere theorem with degenerate extrema, or the trapped-curve convergence (grep over all open heads for "exactly two critical points" finds only DGFloer's use of Reeb; "Palais–Smale" only HomotopySpheres, as an infinite-dimensional remark).
- **Brown's generalized Schoenflies theorem is also planned by GeometricTopology's open revision (#903, §2.2, its README line 1091), and FourManifolds (rev 936, line 223) declares `gap:brown-schoenflies` on GeometricTopology.** MorseTheory on main already owns the theorem (main README line 668 and the Scope at line 73), #903 revises an existing roadmap and is never a supplier, and GeometricTopology on main has no Schoenflies section. So this folder needs no change: #903 and #936 should cite MorseTheory §4.4 (M4.1), which now states the theorem on the same native predicate #903 names (`TauCeti.IsBicollared`, its line 330), so the settlement is a citation swap. PlanarTopology (#271) owns the planar (m=2) Schoenflies theorem by Jordan-curve methods, a different object.

**Sources: the seeded sample.** In Cohen–Iga–Norbury the printed page is the PDF page minus 13; in Nicolaescu the printed page is the PDF page minus 10; in Milnor's *Morse Theory* the cache (`65731a25…`, two-page spreads) has PDF page 9 = pp. 12–13, 13 = pp. 20–21, 21 = pp. 36–37.

| Target | Locator | Checked at | Result |
| --- | --- | --- | --- |
| 1.1 | none (pinned construction) | row 1 | citation only; R01 |
| 1.2 | none (pinned definitions) | row 2 | citation only; R01 |
| 1.3 | CIN Thm 5.3, pp. 36–37; Cor 5.4, p. 38 | cohen-iga-norbury lines 1322, 1423 | exact |
| 2.1 | Lee Cor 5.14, Prop 5.38 | uncertified (settled) | — |
| 2.2 | Milnor 1963 Thm 3.1, p. 12 | milnor cache lines 2225–2275 | exact: a<b, compact band, no critical points ⇒ diffeomorphic sublevels and deformation retract |
| 2.2 | Nicolaescu Thm 2.2.3, pp. 38–42; Rem 2.2.5, p. 42 | nicolaescu-invitation lines 1950–1959, 1962–1966, 2177–2180 | exact (R04) |
| 2.3 | Milnor 1963 Lemma 3.6, pp. 20–21 | milnor cache lines 3623–3640 | exact (Whitehead: homotopic attaching maps) |
| 2.4 | Milnor 1963 Thm 3.5, p. 20; CIN Thm 5.7, pp. 40–41 | milnor cache lines 3565–3592; CIN 1519–1521 | each M^a compact, one λ-cell per index-λ point |
| 3.1 | Hirsch Ch. 2 §1; Ch. 6 Thm 1.2 | uncertified (settled) | — |
| 3.2 | Milnor 1963 Cor 6.7, p. 36 | milnor cache lines 6228–6241 | exact: a Morse function with every M^a compact |
| 4.1 | CIN Cor 5.11 and proof, p. 42 | lines 1569–1596 | exact |
| 4.2 | Weber Thm 1.1, p. 2; proof pp. 2–3 | weber-conley lines 62–67, 73–76 | C² on a closed manifold; cat = least ℓ ≥ 1 open nullhomotopic sets |
| 4.3 | CIN Application 5.13, p. 43 | lines 1617–1619 | Morse, two critical points ⇒ homeomorphic to Sⁿ |
| 4.4 | Milnor 1959 Thm 1(3), p. 440; Cor 1, p. 442 | milnor-1959 lines 72–76, 117–119 | exact |
| 4.4 | Brown 1960 Thms 0–4, pp. 74–76; Thm 5, p. 76 | brown-1960 lines 25, 37, 60, 69, 84, 101–113 | exact; the n=1 gap is under Source issues and the README handles m=1 separately |
| 5.1 | CIN Thms 15.1, 15.4, 15.6–15.7, pp. 143, 146–148 | lines 4986, 5091, 5142–5158, 5161 | exact; 15.6's "E²" is the E¹ term in the README's convention (Source issues) |
| 6.1 | CIN Thm 4.6, pp. 27–29 | lines 1022–1025 | closed M; convergence only, and the README attributes the decay to the pin |

**Adversarial table.** Every value was computed this round; rows 1–19 recompute last round's instances and rows 20–26 cover this round's changes.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §1.1 model transport | self-model ℝ²; half-line model | df=(1,0) ↦ (1,0); range [0,∞) ≠ ℝ | Checks exact | R01 |
| 2 | §1.2 Hessians, counts | −x²+y²; constant on S¹; a point; f=0 and f=x² on ℝ | diag(−2,2), index 1, one point; encard ⊤ (Nat.card gives 0); count 1, index 0; λ(f)+λ(−f): 0+0=0≠1, 0+1=1 | nondegeneracy needed, and stated | R01 |
| 3 | §1.3 normal form, seminorm comparison | x²; x³−tx; δx² on [−1,1]; τ(y)=y/2 on K=[−2,2] | f=y², Hessian 2; ±√(t/3) for t>0, none for t<0; suprema (δ,2δ,2δ); (g∘τ)^(m)=(1/2)^m g^(m): (1,1,1/2) vs (1,2,2), C=1, reverse C=2^k | sound | none |
| 4 | §2.1 levels, faces | x on ℝ² at 0; x² at 0; x on [a,b]; x²+y², a=1 | derivative v↦(0,v), range span e₂ = ker(1,0); df=0; outward df=+1 at b, −1 at a; ∂M₁ on `EuclideanSpace ℝ (Fin 1)`, level on `Fin (2−1)→ℝ` | sound | R01 |
| 5 | §2.2 restriction, adapted fields | x², a<a′<b′<b; band [1,4]; z=√2x; −u²+v² | x∈[√a′,√b′] ↦ √a′ ↦ √a; X=−1/(2x): x²=4−t, hits 1 at t=3, equals −2x/(4x²); z′=−z ⇒ x′=−x, df(X)=−2x²; −2x reads z′=−2z; (−z₁,−z₂): df=z₁²−z₂²>0 at z₂=0; y=z/√2 reads (u,−v) | matches `MorseChart` normalization | none |
| 6 | §2.3 chart change | (x²−1)², c=1, ε=1/2, charts ±x√(2−x²); RP² top point | 1−x²(2−x²)=(x²−1)²; x²=1−1/√2, x=±0.5412, f=1/2; {f≤1/2}={0.5412≤\|x\|≤1.3066}, two components; 2−f=(2X²+Y²)/(1+X²+Y²) | Checks exact | none |
| 7 | `exists_morseCWModel` | S² height; x² on ℝ; ∅; f=x on ℝ; discrete ℕ, f(n)=n | cells (1,0,1); one 0-cell; none; f=x proper, unbounded below, no critical points ⇒ X=∅ ≄ ℝ; ℵ₀ 0-cells | `BddBelow` necessary and present; proper with `BddBelow` ⇔ compact sublevels | none |
| 8 | §3.1 strong topology | tolerance e^(−x²) vs constant 0.01; δψ on (0,1) | fails for \|x\|>√(ln 100)=2.146; at 0<x<δ, δψ(x)=δ>x | strong ≠ compact-open | none |
| 9 | §3.2 exhaustion | x² with \|g−f\|<1; ∅; discrete ℕ | g≥−1 and {g≤b}⊆{x²<b+1} compact; empty function proper, vacuously Morse; a constant has fibre ℕ, not compact | sound | R01 |
| 10 | `strong_morse_inequalities` | RP² over ℚ and 𝔽₂; c=(2,0,0,2), b=(1,0,0,1); point; ∅ | ℚ: q=(0,1,0), C−B=t+t²=(1+t)t; 𝔽₂: b=(1,1,1), Q=0; q₁=(0−2)−(0−1)=−1<0, C−B=1+t³=(1+t)(1−t+t²); 1=1; 0=0 | ℕ[t] encodes the strong inequalities; S_n+S_(n−1)=x_n checked | none |
| 11 | `bettiNumber` | point; S¹; discrete ℕ; RP² over ℚ and 𝔽₂ | (1,0,…); (1,1,0,…); H₀=k^(⊕ℕ) gives finrank 0; b₁=0 vs 1 | junk value documented | none |
| 12 | §4.2 bound, cup length | S¹; T²; RP² over 𝔽₂ and ℚ; S¹⊔S¹; ∅; point | 2≥2≥2; 4≥3≥3; 3≥3≥3 and 3≥3≥1; 4=2+2 while normalized 1+1≠3; 0+1≤0 fails; 1≥1≥1 | nonemptiness needed, and stated | none |
| 13 | §4.3 applications | CP¹, \|z₁\|²/(\|z₀\|²+\|z₁\|²); S² with c=(2,1,1) | near [1:w] ≈\|w\|², index 0; near [u:1] ≈1−\|u\|², index 2; c(−f)=(1,1,2); χ=2−1+1=2 | sound | none |
| 14 | `nonempty_homeomorph_sphere_of_two_criticalPoints` | h−h³/3; h²; two copies of S²; 2 points; 1 point | s=1−cos r: f=2/3−s²+s³/3=2/3−r⁴/4+O(r⁶), Hessian 0; h²: count ⊤ (m≥2) or 4 (m=1); ≥4; S⁰; 1≠2 | sound | none |
| 15 | `exists_twoEuclideanOpenCover_of_two_criticalPoints` | round S¹, f=h; case a+ε>b−δ; m=0 | ‖grad h‖=\|sin θ\|=√(1−h²), η=√3/2, (b−a)/η²=8/3; K⊆{f≤b−δ}⊆{f<a+ε}⊆B, so T=0; U={x}, V={y} ≃ `Fin 0 → ℝ` | sound | none |
| 16 | `exists_closedBall_homeomorph_closure_of_bicollar` | m=0; m=1; equator | S^(−1)=sphere of radius 1 in the zero space=∅, empty b is an open embedding, A={1}, B={−1}, closures ≃{0}, false ↔ (‖0‖=1); two open arcs with endpoints Σ, closures ≃[−1,1]; hemispheres | true on the native predicate | R02 |
| 17 | `nonempty_homeomorph_sphere_of_two_euclidean_opens` | S¹ as two arcs; point with m=0; ℝ^m | glued arcs ≃ S¹; 1 point vs #S⁰=2, so `0 < m` needed; not compact | sound | none |
| 18 | §5.1 Morse–Bott | y² vs y⁴; negative Möbius line; RP² | ker Hess=span e₁=TC vs ℝ²; H₀(S¹;ℤ^w)=ℤ/2 vs ℤ; E¹=(ℤ,ℤ,ℤ), d=2, E²=(ℤ,ℤ/2,0) | sound; CIN's "E²" is this E¹ | none |
| 19 | `exists_compactTrapped_gradient_limit` | x²; metric 4dx²; −u²+v² on u=0; e^(−x) | γ=x₀e^(−2t), E=x₀²e^(−4t), tail \|x₀\|e^(−2t); grad=x/2, γ=x₀e^(−t/2), distance 2\|x₀\|e^(−t/2); v=v₀e^(−2t); γ′=e^(−γ)>0, γ→∞, no trap | statement true | none |
| 20 | R01 citations | README dotted names at a91d3aaf vs 2fd255d | 82 only at 2fd255d, 18 at both, 0 only at a91d3aaf; Morse directory 4 vs 35 entries | contract unresolvable at the head's pin | R01 |
| 21 | §6.1 route (R03) | f=x², γ=x₀e^(−2t) on [0,∞), x₀ for t<0; t₁=1 | right derivative at 0 is −2x₀, left is 0, so no open interval around 0; Γ(s)=x₀e^(−2)e^(−2s)=γ(1+s) for s≥−1, both x₀ at s=−1, Γ(s)=x₀e^(−2−2s)≠x₀ for s<−1; bound C e^(−μ(t−t₁)) = (C·e^(μt₁))·e^(−μt) for t≥t₁+T₀ | repaired route closes; the Lean hypotheses of both maximal-curve lemmas are met | none |
| 22 | §4.4 equivalence of hypotheses (R02) | latitude bicollar θ(s)=(π/2)s/(1+\|s\|); Brown's band (x,t)↦(cos(πt/4)x, sin(πt/4)) | θ(±1)=±π/4, h=±√2/2, range of θ is (−π/2,π/2) so b is onto S^m minus the poles; the band on (−1,1) has \|h\|<√2/2, composed with s/(1+\|s\|) gives a bicollar with the same middle sphere | Checks exact | none |
| 23 | two-open-cell bicollar (R02) | b(θ,s)=(r+ηs/(1+\|s\|))θ, 0<η<r | radii run over (r−η,r+η)⊂(0,∞), s=0 gives radius r, inverse s=(ρ−r)/(η−\|ρ−r\|): homeomorphism onto the open annulus, open in U∩V | bicollar of Σ=∂D | none |
| 24 | m=1 collar sides | Σ at angles 0, π; b(±1,s) at ε s/(1+\|s\|) and π+ε s/(1+\|s\|), 0<ε<π/2 | the two arcs have length <π and are disjoint, so b is an open embedding; the side s>0 has one arc in each component | components not labelled by sides at m=1 | none |
| 25 | `brownBicollaring (m−1)` composition | m=1; m=0 | n=0: f:S⁰→S¹ with model `Fin 0`, domain sphere in `Fin 1` = S⁰ ✓; m=0 would need `Fin (0−1+1)=Fin 1 ≠ Fin 0`, so the README's m≥1 is exactly right | sound | none |
| 26 | §2.2 handle locator (R04) | Nicolaescu Thm 2.2.3 hypotheses vs README | single critical point on the level, ε small, {f≤c+ε} ≃ {f≤c−ε} ∪ λ-handle; compact band {\|f\|≤ε} with no other critical point (lines 1962–1966); several points by Remark 2.2.5 | exact | none |

## Not verifiable

- **Milnor, *Morse Theory* (1963):** now checked against the worker's sources cache (`65731a25…`, an OCR of two-page spreads), which an earlier job fetched; the roadmap's manifest as this brief lists it does not record the work, so the worker should add it (the page map is in the sample table). Nothing else is outstanding.
- **`hirsch-differential-topology` and `lee-smooth-manifolds`:** uncertified and settled; cited by locator.
- **Thomas Mark, Math240 Homework 11:** no legal text. It is used only for bibliographic attribution.
- **Elaboration at main's pins:** I may run Lean only from this worktree, at the head's pins, so I compared 2fd255d by reading its sources (extracted from the package's git into my scratch directory).
- **Ownership against ManifoldOptimization (#1506), the multi-roadmap pull request #1854 and SymplecticGeometry (#1651):** the brief gives no files for them, so ownership against them was not checked.

## Source issues

- **Misprint** in cohen-iga-norbury at Corollary 5.11, p. 42: the source says the alternating sums over k have summands c_i(f) and b_i(M) with the fixed index i; it should be c_k(f) and b_k(M); affects nothing.
- **Misprint** in cohen-iga-norbury at Application 5.13, proof, p. 43: the source says the lower disc is the preimage of [t₁,a], around a minimum called P; it should be the preimage of [t₀,a], around the minimum S; affects nothing.
- **Misprint** in cohen-iga-norbury at Theorem 15.6, p. 147: the source says the E² term of the filtration spectral sequence is the direct sum of the relative homologies of the disc bundles; in the standard indexing that is the E¹ term, E² being its homology under d¹; affects nothing (the roadmap states the E¹ convention explicitly).
- **Gap** in brown-1960 at Theorem 5, proof, p. 76: the source says to take the complementary domain of h(S^(n−1)×1) avoiding h(S^(n−1)×0), which for n=1 with co-rotating collar arcs does not exist; it should assume n≥2 or treat n=1 separately; affects the proof.
