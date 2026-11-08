# Review of ComplexComparisonPartII (pull request #848 at d0ac71a)

**Verdict:** needs changes

Incremental re-review of the 64 lines changed since `c2cb8bb` (README 60 lines, `Suggested.lean` 4 comment lines, nothing outside the folder).

- The gate passes and the dependency check reports 0 problems.
- `Suggested.lean` elaborates with exactly three `sorry` warnings; the three statements are unchanged and none closes with one tactic.
- Three of the previous five findings (R03, R04, R05) are repaired, and the repairs introduce no new problem: the widened generality is supported by SGA 1 XII 1.1 and 4.2 and SGA 4 XVI 4.1 at their locators, and the two new Checks compute correctly.
- The two blocking findings carried from the previous review are unchanged. Both are cross-pull-request ownership problems whose only repairs are a sentence in the pull-request description or a citation of the other roadmap; the head edits neither.

## R01 (P2) — DifferentialGeometry Layers 8 and 9 are cited, and the open revision of DifferentialGeometry drops them

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:544` ("The de Rham theorem and Poincaré duality are DifferentialGeometry Layers 8–9."); also :712–714 (Layer 8 `deRhamEquiv`, Layer 9 `finiteDimensional_deRhamCohomology`), :2896 ("Layers 5, 8 and 9"), :3668 and :3680 ("DifferentialGeometry Layer 8's `deRhamEquiv`").

**Claim:** The de Rham theorem and Poincaré duality are supplied by DifferentialGeometry Layers 8 and 9.

**Witness:** True on main (`DifferentialGeometry/README.md:816, 862`). At the head of #886 (a565de6, unchanged since 2026-10-30) the layer headings are 0–5, 5.6 and 12 only, and README:262 hands these results to DeRhamCohomologyAndDuality, which sits at `ORDER.txt:395`, after this roadmap at :43. The overlap report lists the same dropped id. The pull-request description names neither DifferentialGeometry nor #886.

**Repair:** The README stays as it is (its citations are correct against main, and no earlier owner exists; never add a *Needs:* edge to DeRhamCohomologyAndDuality). Add one sentence to the merge-order paragraph of the pull-request description: the README consumes `deRhamEquiv` and `finiteDimensional_deRhamCohomology` from DifferentialGeometry Layers 8–9 as they stand on main; #886 removes those layers, so before both merge #886 keeps them or gives an old → new map, or DeRhamCohomologyAndDuality moves ahead of this roadmap in the merge order. Carried from the previous review's R01.

## R02 (P2) — The holomorphic exponential sequence and the bijection Pic_hol ≅ H¹(O^×) still have two owners; the head asserts sole ownership without a settlement

**Location:** `README.md:146` (ownership row: "C5.4 is the single owner, on every complex manifold, of the holomorphic-to-smooth forgetful adapter, the frame-torsor bijection …, the holomorphic exponential sequence …"); also :90–93 (Summary) and :3636–3647 (the construction), and the new consumer bullet at :4907–4909 ("K3Surfaces §1.1 and GeometricQuantization §3.3 use C5.4's holomorphic exponential sequence …").

**Claim:** C5.4 is the single owner of the holomorphic exponential sequence, the frame-torsor bijection onto `H¹(M,O_M^×)` and the identification of its connecting map with the integral first Chern class, on every complex manifold.

**Witness:** At the head of #1234 (ComplexKahlerGeometry revision, a2c5e1c3, 2026-11-07, later than this head's commit), `ComplexKahlerGeometry/README.md:686–690` reads: K4.P owns, on every complex manifold, the holomorphic exponential sequence, the isomorphism `Pic_hol(M)≃H¹(M,𝒪×)` and the identification of its connecting map with the integral first Chern class, and supplies it to ComplexComparisonPartII C5.4, K3Surfaces 1.1 and GeometricQuantization §3.3, "which are its consumers"; :765–766 repeats "K4.P owns the generic `Pic_hol(M)`, the exponential segment". Two open heads each claim the same object on the same class of spaces, and the one this head names as consumers are the same two sections #1234 names. The pull-request description records no settlement. ComplexKahlerGeometry is on main and earlier in the merge order than this roadmap.

**Repair:** Settle one owner, in one of two ways, and record it.

- Preferred (the owner is the earlier roadmap): cite ComplexKahlerGeometry K4.P for the three items; keep in C5.4 only the identification of C1.9's `analyticPicardGroup` with K4.P's `Pic_hol` on manifolds, the explicit `δu` cocycle, the `O(±1)` and elliptic-curve Checks as Checks on the consumed map; rewrite :90–93, :146 and :4907–4909 accordingly (K3Surfaces and GeometricQuantization are then K4.P's consumers, not this roadmap's); and name #1234 in the merge-order paragraph of the description, because K4.P exists only at that head. The test instance survives: #1234 README:692–694 fixes `c₁(O(−1))·[ℂP¹]=−1` as this roadmap writes it.
- Otherwise: keep the target here and add to the merge-order paragraph of the description that C5.4 owns the holomorphic exponential sequence and that #1234 must drop K4.P's ownership sentence and its consumers line before both merge. The "single owner" wording at :146 is then correct only once #1234 changes.

Carried from the previous review's R02; the head chose the second settlement in the README but recorded it nowhere, and #1234 still claims ownership.

## Previous findings

- R01 — not repaired: "The de Rham theorem and Poincaré duality are DifferentialGeometry Layers 8–9." (:544); the pull-request description still names neither DifferentialGeometry nor #886.
- R02 — not repaired: ":146 C5.4 is the single owner, on every complex manifold, of … the holomorphic exponential sequence"; #1234 README:686 still says K4.P owns it; no settlement is recorded.
- R03 — repaired: `projectiveComplexGaga` (i) takes "`S` locally of finite type over `ℂ`" (:1828); `properSchemeGagaPushforward` takes `f` proper "of complex schemes locally of finite type" with the reduction to affine opens by C0.5's new open-restriction law (:1844, :1276); `relativeArtinComparison` takes "a morphism of finite type between complex schemes locally of finite type" (:4678–4679) with clause (iii) keeping a finite-type base (:4682); both Checks are added (:1851, :4729–4732).
- R04 — repaired: `Suggested.lean:62` and :90 carry the two layer comments, whose titles match README:1401 and :2659; `montelTheorem` is in the C1 row at :49.
- R05 — repaired: ":440 for this roadmap's convention `d_c = d^c/(4π)`"; the Kleiman entry adds "Theorem 6.16, pp. 58–59 (published numbering 9.6.16)" (:4982).

## Verified sound

**Gate and dependency check.** My run of the gate on this head printed, and exited 0:

```text
gate ComplexComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The dependency check with `--movable` printed, in full:

```text
depcheck: 243 roadmaps, 2465 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty. No `design/plan.json` is readable, so no gaps are declared and none should have been.

**Lean (pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`).**

- `lake env lean Suggested.lean` gives exactly three `declaration uses sorry` warnings (lines 67, 78, 95) and nothing else.
- The diff touches only the two `/-! ## Layer … -/` comments; the three statements are byte-identical to the previous head.
- One-tactic probe on a scratch copy (`first | rfl | simp | infer_instance | aesop` in place of each `sorry`): all three fail (two unsolved goals, one tactic failure). Nothing is padding.
- `#check @` of the three declarations in the same scratch file elaborates; the types equal those in the worker's signature file and lose no binder. `montelTheorem`: open set in a finite-dimensional complex normed space, locally bounded sequence, locally uniform subsequential holomorphic limit (README C1.6). `schwartzFiniteness`: complete metrizable Hausdorff locally convex complex spaces, surjective `g`, compact `h`, closed range of finite codimension (README C1.6). `nonempty_sheafSingularComparison`: `LocallyContractibleSpace`, arbitrary `A`, `ULift ℤ` chains (README C5.1, which states the `Nonempty` form).

**Sources read at the locators for the changed passages.**

- `sga1` line 9738 (XII Théorème 4.2, retyped p. 248): `f` proper between ℂ-schemes locally of finite type, `F` coherent, `θ^p` an isomorphism for all `p`. Supports `properSchemeGagaPushforward` as now stated, and the projective case (step 1 of the proof, line 9743) reduces to `P^r_Y` over a ball, supporting `projectiveComplexGaga` (i) over a base locally of finite type.
- `sga1` lines 9450–9453 (XII §1, retyped pp. 240–241): the analytification theorem is proved for affine schemes locally of finite type and glued, so `completedAnalyticStalkComparison` on a scheme locally of finite type (:968) is within XII 1.1.
- `sga4` line 28350 (XVI Théorème 4.1, p. 638): `f : X → S` of finite type between schemes locally of finite type over `Spec ℂ`; case (i) `f` proper, case (ii) `F` constructible; the base-change maps of XII 4.2 are bijective in all degrees for torsion abelian `F`. This is exactly the new hypothesis of `relativeArtinComparison` and the rewritten *Source* line (:4712–4714).
- `kleiman-picard` line 2782 (Theorem 6.16, p. 58), proof continuing past the p. 59 marker at line 2808: matches "pp. 58–59".

**Cross-roadmap citations resolved (copy named).**

- #1285 K3Surfaces (9e7760f): `README.md:358` is "### 1.1 Holomorphic Picard classes and analytic K3 surfaces"; :370–378 consume "ComplexComparisonPartII C5.4's exponential sequence and integral" Chern class. The consumer bullet at :4907 is accurate for that head.
- #1186 GeometricQuantization (663f762): `README.md:624` is "### 3.3 Integral root curves and the ordinary holomorphic Picard group"; :649–650 apply "the exponential-sequence segment from ComplexComparisonPartII C5.4". Accurate for that head.
- #1234 ComplexKahlerGeometry (a2c5e1c3): `README.md:686–690` and :765–766, the R02 witness.
- #886 DifferentialGeometry (a565de6): layer headings 0–5, 5.6, 12; :262 hands de Rham theorem and duality to DeRhamCohomologyAndDuality. `ORDER.txt:43` (this roadmap) and :395 (DeRhamCohomologyAndDuality). The R01 witness.
- README:1401 "## Layer C1: Analytic coherent cohomology and GAGA" and :2659 "## Layer C5: de Rham–Betti comparison, Hodge theory and logarithmic comparison" are the titles the Lean section comments use.
- EtaleCohomologyFoundations §0.8 `ClassicalAlgebraic.properSupports`, cited at :4683 for `Rf_!` by compactification, was resolved at the #1891 head in the previous round; the citations file lists it only as a Lean-name lead (it is a roadmap name, not a pinned declaration), as before.

**Ownership against open pull requests.** The overlap report lists no other pull request changing this roadmap and no id only an open revision defines; its one dropped id is R01. Of the closest roadmaps in vocabulary, #1234 is R02; #1398, #1807, #1808 and #1854 (other ComplexKahlerGeometry revisions) were checked through the overlap tool, which reports no dropped id cited here.

**Computed adversarial pass.** Rows for statements the diff leaves untouched carry the previous report's values (marked "prev."); rows for changed statements are computed here.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `completedAnalyticStalkComparison`, now locally of finite type (changed) | `X = ⊔_{k∈ℕ} A¹`, `x = a` in component `k`; `Spec ℂ[ε]/ε²` | `O_{X,x} = ℂ[z]_{(z−a)}`, `O_{X^an,x} = ℂ{z−a}`, both completions `ℂ[[z−a]]`, independent of `k`; dual numbers: both stalks `ℂ[ε]`, completion the identity, `ε` retained | Pass |
| C0.5 open-restriction law (new API clause) | `f : P¹_{A¹} → A¹`, `F = O(−2)`, `V = D(x)`; `V = ∅` | `R¹f_*F = O_{A¹}`; restriction to `V^an = ℂ*` is `θ¹` of `P¹_{G_m} → G_m`, the identity `O_{ℂ*} → O_{ℂ*}`; `V = ∅`: both sides zero | Pass |
| `projectiveComplexGaga` (i), base locally of finite type (changed) | `S = ⊔_{k∈ℕ} A¹`, `O(−2)` on `P¹_S`; `S = Spec ℂ[ε]/ε²`, `O`; `S = ∅` | `h¹(P¹,O(−2)) = h⁰(O) = 1` by Serre duality, so `R¹π_*O(−2) = O_S` on each component and `θ¹` is the identity componentwise; `q ≠ 1` gives 0 = 0; dual numbers: `π_*O = ℂ[ε]`, `ε` retained; `S = ∅`: 0 = 0 | Pass |
| `properSchemeGagaPushforward`, locally of finite type (changed) | `f = id`; `Y = ⊔_{k∈ℕ} A¹`, `X = P¹_Y`, `O(−2)`; `Spec ℂ[ε]/ε² → Spec ℂ` | `θ⁰ = id`, `R^{>0} = 0`; the ⊔ case is the row above, `Y` not quasi-compact but admitted by SGA 1 XII 4.2 (line 9738); `ℂ[ε]` in degree 0, 0 above; proper `f` over affine finite-type `V` makes `X_V` of finite type | Pass |
| `relativeArtinComparison` (i)–(ii), locally of finite type (changed) | `j : ⊔_{k∈ℕ} G_m ↪ ⊔_{k∈ℕ} A¹`, `K = μ_n`; `⊕_x (i_x)_*Λ` on `A¹` | `j` quasi-compact (preimage of a quasi-compact open meets finitely many components) and locally of finite type, hence of finite type; at the origin of component `k`: `(R¹j_*μ_n)_0 = K^{sh×}/n ≅ ℤ/n` generated by `z`, `H¹(Δ*,μ_n) ≅ ℤ/n`, `R^{≥2} = 0`, independent of `k`; the non-constructible sheaf still fails surjectivity on `H⁰` (prev.) | Pass |
| `relativeArtinComparison` (iii), finite-type base kept (changed) | `X = A¹ → Spec ℂ`; `f = id` on `Y = ⊔_{k∈ℕ} A¹` | `H^•_c(A¹) = (0,0,Λ(−1))` (prev.); `Y` of finite type over `ℂ` is Noetherian, hence qcqs; for `Y = ⊔ A¹` the compactification `⊔ P¹` is not proper over `Spec ℂ` (not quasi-compact), so clause (iii)'s finite-type hypothesis is used, and the clause excludes this `Y` | Pass |
| C5.4 elliptic-curve Check (new) | `E` genus 1, `L = O(p−q)`, `p ≠ q`; `O(p)`; `O_E` | `h⁰(O(p−q)) = 0` (a section with a pole gives a degree-1 map `E → P¹`; without a pole it is a constant vanishing at `q`), `deg = 0`, so `([L], δ[L]) = (≠1, 0)` while `([O_E], δ) = (1, 0)` and `([O(p)], δ) = (≠1, 1)`; `δ` does not separate `L` from `O_E`, `[·]` does | Pass |
| Riemann surface of `C` (seeded) | prev. | prev. report, same row | Pass |
| `functionFieldToMeromorphic`, `picardAnalytification` (seeded) | prev. | prev. report, same row | Pass |
| `IsDifferentialOperator` (seeded) | prev. | prev. report, same row | Pass |
| `artinDeRhamBetti` (seeded) | prev. | prev. report, same row | Pass |
| `CurrentCalculus` (seeded) | prev. | prev. report, same row | Pass |
| `realComplexCurrentComparison` (seeded) | prev. | prev. report, same row | Pass |
| `complexAlgebraicTopology` (seeded) | prev. | prev. report, same row | Pass |
| `topologicalCoefficientComparison` (seeded) | prev. | prev. report, same row | Pass |
| `riemannExistence` (seeded) | prev. | prev. report, same row | Pass |
| `artinComparison`, `IsIso (artinComparisonMap)`, `artinComparisonCompactSupport` (seeded) | prev. | prev. report, same rows | Pass |
| `artinSmoothTrace`, `adicArtinComparison` (seeded) | prev. | prev. report, same rows | Pass |
| `montelTheorem`, `schwartzFiniteness`, `nonempty_sheafSingularComparison` (Lean, unchanged) | prev. | prev. report, same rows | Pass |
| `integralLineBundleChernClass` (R02) | prev. | prev. report, same row | Pass; owner R02 |
| `multiplicativePeriodInterface` (R01) | prev. | prev. report, same row | Pass; ids R01 |

**Policy.** The 64 changed lines contain no copied passage, algorithm, `set_option`, sorry'd data, `lemma`, pull-request number, process word or machine path. The one process word of R05 is gone.

## Not verifiable

- Kleiman, *The Picard scheme*, published numbering "9.6.16" (:4982): the published chapter (FGA Explained, AMS) is paywalled; the arXiv locator Theorem 6.16, pp. 58–59, is verified, and the published chapter is Chapter 9, so the parenthetical is consistent.
- Dimca, SGA 4½, Hironaka 1975, Bochnak–Coste–Roy §9.2: as in the previous report; none is touched by the diff.

## Source issues

- none
