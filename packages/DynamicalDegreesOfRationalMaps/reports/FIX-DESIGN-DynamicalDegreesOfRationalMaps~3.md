# Repair of DynamicalDegreesOfRationalMaps (design, round 3)

Files edited: `packages/DynamicalDegreesOfRationalMaps/design/README.md`, `packages/DynamicalDegreesOfRationalMaps/design/plan.json`. `packages/DynamicalDegreesOfRationalMaps/sources.toml` is unchanged: no source was added or dropped, and every `cited_for` entry still names a section that cites it. All six findings were checked on the mathematics and are correct. None is disputed.

## R01 (P2) — applied

§6.1 composition: "`f`, `g` reduced, `g ∘ f = [G(F)/h]`" → `f` dominant, `g` arbitrary; `G(F) ≢ 0` proved, with equality when `f` or `g` is a morphism (route added). New item: iterates of morphisms, constants through morphism composition / `compHom`. Checks added: constant into the Cremona base point, `σ ∘ [x_i²]`. Conventions and plan 6.1 updated.

## R02 (P2) — applied

Imported AlgebraicModuliForArithmeticGeometryPartII §1.5 (nefness, pullback, field base change, with `S = Spec K`), §1.7 (ii) (Kleiman; nef + ample over every field) and §0.1 (curve component law, now cited in §2.1). §3.1 is now the numerical interface and §3.2 the extension to nonintegral `Z` and real combinations. Removed `gap:numerical-nef-big-transfer`. §3.4 uses SchemeAndStackFoundations §5.10's `H² > 0` Hodge index directly.

## R03 (P1) — applied

§1.4: "`K(X) ⊗ K'` free of rank `e(f)`" → split by dimension. Equal dimension: a basis of `e(f) ≥ 1` elements, then localization. Larger source dimension: invariance of dimension gives `e = 0` on both sides, with no rank asserted. Projection negative control (`1, v, v², …`) and the `z²` basis Check added. Plan 1.4 updated.

## R04 (P2) — applied

§1.3: "`W_{f,g} = Γ_{(f, g∘f)}`" → the scheme-theoretic image of `(ι_U, f_U, (g∘f)_U) : U → X × Y × Z`. It is integral (reduced image of an integral source), projective, of dimension `d` and independent of `U`, with no integrality of `Y × Z` used. Check `ℙ¹_ℂ` over `ℝ` added (triple diagonal). Plan 1.3 updated.

## R05 (P3) — applied

Refreshed every Mathlib and Tau Ceti locator and the plan baseline against the pins (Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`). Added `LineBundleClass.IsAmple` as the ampleness used throughout, with a witness, plus `Scheme.Hom.isReduced_image` (§§1.2–1.3), `functionFieldMap`/`functionFieldAlgHom` (§1.1 now built on them), and the curve `intersectionNumber`. Very ample powers now come from AlgebraicModuliForArithmeticGeometry §1.4.

## R06 (P2) — applied

§4.1: the cycle pullback "∈ `CH_{d−k}(X)`" for real classes → an integral formula for line bundles, and a real-class item in `CH_*(T) ⊗ ℝ` through `ℝ`-linear extensions of `c_1 ∩` (additive, SchemeAndStackFoundations §5.3), pushforward and degree. The degree formula follows by multilinear expansion. `√2·O(1)` Check added. Plan 4.1 updated.

## Pattern search (other places checked or repaired)

- R01, composition with a non-dominant first map: the Conventions iterate line was repaired (dominant self-maps; morphism iterates through §6.1). §6.4 now says that `G` is dominant in `F ∘ G`. §1.1 functoriality, §1.3, §§4.4–4.5, Layer 5 and §6.2 already assume dominance.
- R02, duplicated ownership: Scope (the "no roadmap states these" line and the AbundanceStatement sentence were deleted), Summary, "How to read the build", §§3.5–3.6 (perturbation now cites AlgebraicModuliForArithmeticGeometryPartII §1.7 (ii); very ample multiples cite AlgebraicModuliForArithmeticGeometry §1.4). The Layer 3 Dependencies and the SchemeAndStackFoundations contract were updated: §4.15 (Nakai–Moishezon) is no longer used and was dropped from the README and the plan.
- R03, `e(f)` used as a rank: §1.1 multiplicativity, §1.2 alteration, §1.3, Layer 4 and §6.4 all assume equal dimension. Only §1.4 used it otherwise.
- R04, §1.2 applied to a non-variety target: only §1.3. §1.4 and §4.3 use the base change `(Γ_f)_{K'}` as a cycle, not as a graph of §1.2.
- R05: every locator in the contracts. §1.2 now cites the Tau Ceti reduced-image instance alongside stacks-morphisms Lemma 6.7, which remains the locator for the closure statement.
- R06, real classes in integral Chow groups: §2.2 is stated for line bundles only. No other occurrence.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| §6.1 composition (`f` dominant) | constant `(0,0,1)` then `σ`; `f=g=σ`; `f=[x_i²]`, `g=σ`; `f=σ`, `g=[x_i²]`; `f=id` | `G(F)=(0,0,0)` (excluded: `f` not dominant); `x_0x_1x_2·(x_0,x_1,x_2)`, `h=x_0x_1x_2`, degree `1≤4`; `(x_1²x_2², x_0²x_2², x_0²x_1²)`, gcd `1`, degree `4=2·2`; `((x_1x_2)², (x_0x_2)², (x_0x_1)²)`, degree `4=2·2`; `G(F)=G`, degree `deg g` | Hypothesis added; equality cases hold in both directions. |
| §6.1 equality route | `g` a morphism: `x_j^N ∈ (G)`; `f` a morphism of degree `≥1` is finite | a common prime of the `G_i(F)` divides every `F_j^N`, which contradicts reduced `F`; `f(V(p))` of dimension `d−1` inside `V(G)` of codimension `≥2` is impossible | Route added. |
| §6.1 morphism iterates | constant `c`; `[x_i²]`; Frobenius | `c^0=id`, degree `1=0^0`; `c^n=c`, degree `0=0^n`; degrees `2^n`; `p^n` | Correct for every `n ≥ 0`. |
| Conventions iterates | `z²`; constant | `f^2=z⁴` (defined); constant excluded from rational iterates, `c∘c=c` as morphisms | Repaired. |
| §1.4 `e(f_{K'})=e(f)` | projection `ℙ²⇢ℙ¹`; `z²` in char `0` and `2`; Cremona `ℚ→ℂ`; `ℙ¹_ℂ/ℝ` | `K(u,v)/K(u)`: `1,v,v²,…` independent, `e=0` on both sides; basis `{1,z}`, `e=2` on both sides; `e=1=1`; `ℂ(t)⊗_ℝℂ ≅ ℂ(t)×ℂ(t)` is not a domain, excluded by geometric integrality | Case split correct; negative control added. |
| §1.4 localization step | `R=K(X)⊗K'` free of rank `e` over the domain `B` | `T⁻¹R = R⊗_B Frac(B)` is a domain of dimension `e` over a field, hence a field, between `R` and `Frac R`, so equal to `K(X_{K'})` | Correct. |
| §1.3 `W_{f,g}` | `ℙ¹_ℂ/ℝ`, `f=g=id`; `σ,σ`; `z²,z²` | `Y×_ℝZ` has 2 components; `W` = triple diagonal, dimension `1`, projections of degree `1`; `W→Γ_id` birational, `(q_Y,q_Z)` of degree `1`; `(q_Y,q_Z)` of degree `2=e(f)≠4` | Construction valid without integral `Y×Z`. |
| §1.1 pullback via `functionFieldAlgHom` | `z²`; `σ` on two representatives (complement of 3 points, torus); `id` | `f^*(z)=z²`; `u↦1/u`, `v↦1/v` on both representatives; identity (`functionFieldAlgHom_id`) | Independent of representative. |
| §3.1 numerical form | `O(a)` on `ℙ¹`; `ℙ¹_ℂ/ℝ` with `O(1)`; a finite scheme | `χ(nO(a))=an+1`, coefficient `a`, nef iff `a≥0`; degree `2≥0`; no curves, everything nef (AlgebraicModuliForArithmeticGeometryPartII Check) | Correct. |
| §3.1 field extension | `ℙ¹_ℂ/ℝ`, `O(±1)` | `O(1)`: `2 = 1+1`, nef on both sides; `O(−1)`: `−2` over `ℝ`, `−1,−1` over `ℂ`, not nef on either side | Both directions agree. |
| §3.1 reduction (base field `K` versus `K'`) | `V=ℙ¹_ℂ/ℝ`, `K'=ℂ` | degree over `ℝ` is `2 = [ℂ:ℝ]·1` (`intersectionNumber_eq_finrank_mul`); same sign | Correct. |
| §3.1 big and nef pullback | `Bl_p ℙ²→ℙ²`; `z²` on `ℙ¹` | `1=1·1`; `(f^*O(1))=2=2·1` | Correct. |
| §3.2 nonnegativity | `O(1,0)²`; `O(1,0)O(0,1)`; double line `V(x²)`; `√2h_1+h_2`; `r=0` point of degree 2; `O(1,−1)` | `0`; `1`; `χ=2n+1`, `2=2·1`; `2√2`; `χ(O_P)=2≥0`; `−2` (not nef) | Correct; double-line Check added. |
| §3.4 route via SchemeAndStackFoundations §5.10 | `H=O(1,1)`, `D=O(1,−1)` on `ℙ¹×ℙ¹`; `H=2L+E`, `D=L` on `Bl_p` | `h=2`, `D''=2D`, `D''²=−8=2(2·(−2)−0)`; `h=3`, `P·H=2`, `D''=−L−2E`, `D''·H=0`, `D''²=−3=3(3−4)` | Algebra checked; ≤ 0 as required. |
| §4.1 real cycle pullback | `ℙ¹`, `id`, `M=O(1)`, `√2·O(1)`, `0`; additivity `O(1)⊗O(1)` | `[pt]`, degree `1`; `√2[pt]`, degree `√2`; `0`; `c_1(O(2))∩[ℙ¹]=2[pt]=[pt]+[pt]` | Integral and real versions consistent; no irrational integral cycle. |
| Ampleness convention | `O(1)`, `O` on `ℙ¹`; empty scheme | charts `x_0≠0`, `x_1≠0` affine; nonvanishing loci `∅` or `ℙ¹` (not affine); empty scheme ample vacuously | Witness correct. |
| AlgebraicModuliForArithmeticGeometry §1.4 contract | `O(1)`, `O(2)`, `O` on `ℙ¹` | very ample, very ample, globally generated but not very ample | Matches the supplier's Checks. |
| §2.1, case `r=1` | `V(y²)⊂ℙ²`; line ∪ point | `3−1=2=2·1`; `1` (point ignored) | Agrees with AlgebraicModuliForArithmeticGeometryPartII §0.1. |
| AlgebraicModuliForArithmeticGeometryPartII §1.5 base change | line `y=tx` over `K(t)` | `O(1)`-degree `1≥0`, detected by specialization, not by an image curve | Consistent with the §3.1 Check. |

Every Check and worked example that uses a changed object was recomputed: §1.1 (6 Checks), §1.3 (4), §1.4 (4), §3.1 (5), §3.2 (5), §3.4 (4), §4.1 (4), §6.1 (5), and the Worked-examples table (unchanged values: the Fibonacci, Cremona, Frobenius and `(x², y)` degrees do not involve non-dominant composition).

## Checks run

Dependency gate:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2139 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The new suppliers are earlier in the merge order: AlgebraicModuliForArithmeticGeometryPartII (line 262) and AlgebraicModuliForArithmeticGeometry (line 35), against the candidate's placement after line 341. Both are open pull requests that add new roadmap folders.

Citation resolver (`roadmaps resolve`): no cross-roadmap citation and no Lean name found nowhere. It does not check library names on this host, so I checked every backticked Mathlib and Tau Ceti name in the README against the pinned sources, by file and line (namespaces included). All resolve. I fully qualified the short Tau Ceti lemma names.

Lean: there is no `Suggested.lean` at the design stage, so the `#check @name` binder audit and elaboration are not applicable. No Lean command was run.

## Ownership against open work

- AlgebraicModuliForArithmeticGeometryPartII (open head) owns nefness, base change of nefness, Kleiman nonnegativity and nef + ample over arbitrary fields, and the curve component law. These are now imported, and only the numerical reading stays here.
- SchemeAndStackFoundations §5.10 (main) owns the smooth-surface Hodge index theorem for `H² > 0`. It is consumed. This roadmap keeps the reduction from singular surfaces over arbitrary fields.
- AlgebraicModuliForArithmeticGeometry §1.4 (open head) owns very ampleness of high powers. It is consumed.
- Tau Ceti owns the function-field map of dominant morphisms. §1.1 builds on it. Tau Ceti's `Birational/AlgHom.lean` and `Birational/RationalMap.lean` treat only sources whose local rings are valuation rings, so they do not duplicate §1.1.
- The other closest open roadmaps from the overlaps file were compared by scope, with no new conflict: ArakelovGeometryAndAbelianHeightsPartII (still the volume and Siu-volume supplier), HeightsRationalPointsAndObstructionsPartII, AdicCoefficientsAndComparisonsPartII and JacobianChallenge.
- No roadmap on main or at an open head cites DynamicalDegreesOfRationalMaps, so no outside citation breaks.

## Notes for the maintainer

- `gap:numerical-nef-big-transfer` is gone from this package (plan `gaps` is now empty, and the README has no supplier-gap line). StableReductionPartII's separate contract with the same slug is untouched.
- Section numbers are unchanged (§§3.1–3.2 keep their headings). Plan target 3.1 is now a `theorem` (`isNef_iff_intersectionNumber_nonneg / isNef_baseChange_iff`) and 3.2 is `intersectionNumber_nonneg_of_isNef`. These are prospective names only; there is no Lean file yet.
- This package now depends on two more open pull requests, AlgebraicModuliForArithmeticGeometryPartII and AlgebraicModuliForArithmeticGeometry, both earlier in the merge order.
- Sources: no new text was needed and none was fetched. Lazarsfeld and Fulton stay settled as uncertified and are cited by locator. No `needs-references.toml` entry was written.
- No suspicious instructions were found in the review or in the supplier texts read.
