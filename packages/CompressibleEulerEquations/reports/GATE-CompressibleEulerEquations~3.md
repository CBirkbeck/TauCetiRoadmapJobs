# GATE-CompressibleEulerEquations~3: answers to human review of 3a9f46e

Head after repairs: `26699db` (one commit on `3a9f46e`). It changes only cross-roadmap section
ids, in `TauCetiRoadmap/CompressibleEulerEquations/README.md` (59 lines) and in three docstrings of
`TauCetiRoadmap/CompressibleEulerEquations/Suggested.lean`. No statement, target, Check,
hypothesis or declaration type changed.

The comment by kim-em (2026-11-26T05:57Z) recommends approval and asks for no change. Its four
points are H01–H04 below. Each was rechecked against the README, `Suggested.lean` and the supplier
heads. That recheck found one defect that the comment does not mention. LorentzianGeometry's pull
request moved to head `43acb00` at 06:09Z, twelve minutes after the comment. That commit moves its
Part I to SemiRiemannianFoundations and renumbers its sections. Every LorentzianGeometry section
id this roadmap cited (§6.1, §6.3, §7.3, §8.1, §8.2, §8.3, §9.2, §11.4, §12.6, §12.7) therefore
pointed at the wrong section or at none. The repair is reported under H03, because the
definition-51 split cites the renumbered sections.

## H01 (kim-em) — answered

The closed-data paragraph of §8.1 (README lines 1867–1874) holds as stated, and Part II supports
it. Take two solutions `U`, `U′` on the slab `O` with the same data on `S`. Apply
`EquationOfState.isDevelopment_slab` to each, then use the largest-development clause both ways.
This gives `D⁺_{O,U′} = D⁺_{O,U}` with `U = U′` there. Both solutions are `C¹`, hence continuous,
on `O`, because `IsSolution` includes `ContDiffOn ℝ 1 U D`. So they agree on the closure in `O`.
At its head `028ca67`, CompressibleEulerEquationsPartII §2.1 states
`futureDomainOfDependence_inter_eq_interior`: in `{t > t₀}`, `D = interior Ď` and
`D ⊆ Ď ⊆ closure D`, for `S` with `interior (closure S) = S`. That hypothesis always holds for
`S = int F` with `F` closed. No change.

## H02 (kim-em) — answered

The Rarefaction waves bullet (README lines 2180–2186) is accurate. LuoYu2023a line 1458 is the
Main Theorem, for data posed on `Σ_δ^{u*}` and `C₀`. LuoYu2023b line 745 is Corollary 1 (the
solution on `D(δ)`) and line 769 is Theorem 2 (existence of rarefaction waves). Line 910 is
Definition 2.13 (centered rarefaction waves). At its head, Part II §3.3 names Luo–Yu's development
`𝒟(δ)` on `Σ_δ ∪ C₀` as one of its developments, and its Layer 4 is centered rarefaction waves
(§§4.1–4.2). No change.

## H03 (kim-em) — answered

This roadmap's half of the definition-33/51 split is unchanged. Its own §§1.1–1.3, 3.1–3.3 and
8.1–8.4 keep their ids and contents, and Part II at `028ca67` still cites them as before. The
LorentzianGeometry sections that the split names have new ids at that roadmap's head `43acb00`,
and the README now cites those. The definition-51 geometry is in its §1.3 (the hyperplane
trichotomy, formerly §6.3) and §§4.2–4.3 (null hypersurfaces and generators, formerly §§9.2–9.3).
The full map applied, old → new:

- §6.1 → §1.1: `minkowskiForm E`
- §6.3 → §1.3: causal type of hyperplanes by the sign of `g⁻¹(ζ, ζ)`
- §7.3 → §2.3: the acoustical form, its inverse, `B` timelike, the first Check's frame
- §8.1 → §3.1: time orientation by `[B]`
- §8.2 → §3.2: locally Lipschitz causal curves, restriction, concatenation
- §8.3 → §3.3: causal pasts in a spacetime
- §9.2 → §4.2: null hypersurfaces, equivalent form `g⁻¹(du, du) = 0`
- §11.4 → §6.4: limit curves parametrised by auxiliary arc length
- §12.6 → §7.6: causal curves and `D⁺_D(S)` in subsets
- §12.7 → §7.7: achronal boundaries and Cauchy horizons of `C¹` metrics

These are README lines 65, 83, 149–150, 416–441, 470, 479–498, 527–534, 565–566, 579–659, 707, 721,
2057–2069, 2151, 2161, 2263–2281 and 2572–2589, and `Suggested.lean` lines 23, 170 and 183. The
`*Needs:*` line of §8.4 also put its LorentzianGeometry item first. Once that item is renumbered to
§7.6, "§6.1 (moving cones)" after it could be read as LorentzianGeometry's §6.1, so the item now
comes last (lines 2148–2151). Each consumed statement was reread at the new id (table below).
Nothing this roadmap consumes is now stated only in SemiRiemannianFoundations. The causal-character
predicates come from there, but this roadmap reaches them through LorentzianGeometry §1.1, and every
theorem it uses is stated by LorentzianGeometry. So no supplier is added.

## H04 (kim-em) — answered

The supplier contracts name exactly two open roadmaps, LorentzianGeometry and
SymmetricHyperbolicSystems. Both are new-roadmap pull requests by other authors. The dependency
check finds no UPWARD or CYCLE edge, so the stated merge order is right. LorentzianGeometry now
consumes SemiRiemannianFoundations (open, new), so that roadmap merges before LorentzianGeometry and
therefore before this one. This roadmap does not cite it. SymmetricHyperbolicSystems at `5594d86`
keeps the ids cited here: §1.2 with `LinearSystem`, `LinearSystem.apply` and
`LinearSystem.IsSymmetricHyperbolic`, §2.1 the pointwise energy identity, and §2.2, §2.3 and §7.3.

## Adversarial pass on the changed citations

| Statement (README) | New id checked | Values computed / content compared | Result | Change |
|---|---|---|---|---|
| §3.1: `g_{c,v}` is LorentzianGeometry's acoustical form, `g(B,B) = −c²`, `g(X,B) = −c²τ`, inverse, `g⁻¹(dt,dt) = −c⁻²` | §2.3 | Its Check `c = 1`, `v = 2`: Gram `[[3, −2], [−2, 1]]`, det `3 − 4 = −1 = −c²`, `g(B,B) = 3 − 8 + 4 = −1`. Ours `n = 2`, `c = 2`, `v = (1, 0)`: Gram `[[−3, −1, 0], [−1, 1, 0], [0, 0, 1]]`, det `−3 − 1 = −4 = −c²`, `g(B,B) = −4`. §2.3 states each listed identity | holds | id only |
| §3.1 frame `(τ, ξ) ↦ (cτ, ξ − τv)` to `minkowskiForm E` | §2.3 first Check, §1.1 | §2.3 Check: isometry onto `(ℝ × ℝⁿ, minkowskiForm)`. §1.1: `minkowskiForm E v v = −v.1² + ‖v.2‖²`, Lorentzian for finite-dimensional `E`, Gram det `−1` | holds | id only |
| §3.1 hyperplane statements | §1.3 | §1.3: `ker ξ` spacelike iff `b⁻¹(ξ,ξ) < 0`, timelike iff `> 0`, null iff `= 0`. Its Check `ξ = dt` gives `b⁻¹ = −1`, spacelike. Ours `c = 2`, `v = 0`: `g⁻¹(dt,dt) = −1/4 < 0`, spacelike, the same sign. `ζ = dx`, `c = 1`: `g⁻¹ = 1 > 0`, timelike in both | holds | id only |
| Conventions and §3.1: `B` timelike, time oriented by `[B]` | §2.3, §3.1 | §2.3: `B` is a continuous timelike field where `c > 0` and `c`, `v` are continuous, and "§3.1 time orients it by `[B]`". §3.1 Check: `∂_t` is future timelike iff `c² > ‖v‖²`. At `c = 1`, `v = 2`, `g(∂_t, ∂_t) = 3 > 0`, consistent with `1 < 4` | holds | id only |
| §3.2: restriction, concatenation, piecewise `C¹` ⇒ Lipschitz | §3.2 | §3.2 proves restriction and concatenation for each class, and that piecewise-`C¹` future causal curves are locally Lipschitz causal curves | holds | id only |
| §§3.2–3.3: `TimeOrientedLorentzianFieldOn`, `IsFutureCausalCurveIn`, `IsPastInextendibleIn`, `futureDomainOfDependenceIn`, time functions, slice identity, determination, coverings | §7.6 | All are present. Its acoustical Check: `D = {t ≥ 0}`, `S = {t = 0, x¹ ≥ 0}` gives `D⁺_D(S) = {x¹ ≥ (v¹ + c)t}`. Our §3.3 Check with the open `S = {x¹ > 0}` gives `{x¹ > (v₀¹ + c₀)t}`, its interior in `{t > 0}` | holds | id only |
| §3.3 negative claims: §7.6 has no openness statement and no existence of past-inextendible extensions, and its slab statement is the slice identity only | §7.6 | Read §7.6 in full. Its bullets are `S ∩ D ⊆ D⁺`, monotonicity, reparametrisation and concatenation, past limits, open sets, time functions, slabs (slice identity), determination and coverings. It has neither openness nor an extension-existence statement | holds | id only |
| §3.3: causal pasts defined only in a spacetime | §3.3 | §3.3 defines `causalPast 𝔱 q = J⁻(q)` on a spacetime, and §7.6 defines no causal past in a subset | holds | id only |
| §3.2 limit curves differ from arc-length limit curves | §6.4 | §6.4: `h`-arc-length parametrised curves of a spacetime, with an auxiliary complete Riemannian `h` | holds | id only |
| §3.2 and §8.4: limit curve theorem and horizon nullity for locally Lipschitz metrics | §7.7 | §7.7: limit curve theorem for `C^{0,1}` metrics. For `S` closed in a temporal slice, `∂_U D⁺_U(S) ∩ {t > t₀} = H⁺_U(S) ∩ {t > t₀}`, null "in the sense of §4.2" where `C¹`. Its constant-state Check gives the boundary `{x¹ = (v¹ + c)t}`, null. Our §8.4 Check gives `∂_tφ + v∂_xφ = 1 = c|∂_xφ|`, null | holds | id only |
| Scope: §8.4 nullity is §4.2's equivalent form | §4.2 | §4.2: for `u` `C¹`, `du_p ≠ 0`, the level set is null iff `g⁻¹(du, du)(p) = 0`. Its acoustical Check: eikonal `(∂_t u + v·∇u)² = c²‖∇u‖²` | holds | id only |
| Scope: causal vectors nonzero, `dt(X) ≠ 0` | §2.3, §1.1 | §2.3: every causal `X` has `dt(X) ≠ 0`. §1.1 Check: `0` is spacelike and not causal | holds | id only |
| §8.4 `*Needs:*` reorder | the README's own §6.1, §8.1, §8.2 | Before: "LorentzianGeometry §7.6 (concatenation), §6.1 (moving cones), …" could be read as LorentzianGeometry §6.1 (time separation). After: own sections first, LorentzianGeometry §7.6 last | ambiguity removed | reorder |
| H01 recheck: `int F` regular open for closed `F` | — | `int F ⊆ int cl(int F) ⊆ int F`, because `cl(int F) ⊆ F`. `F = {x¹ ≥ 0}`: `int F = {x¹ > 0}`, `cl = F`. `F = [−1, 1] ∪ {5}`: `int F = (−1, 1)` and `cl(int F) = [−1, 1] ≠ F`, which is why the README conditions `{t₀} × closure S = {t₀} × F` on `F` being the closure of its interior | holds | none |

`Suggested.lean`: only three docstring lines changed (§12.6 → §7.6), so no declaration type
changed. The elaborated signatures in the worker's `signatures.md` therefore still apply: 35
declarations, none with a dropped section binder. No `#check @name` file was rerun, because the
build re-elaborated the file with unchanged types. The repair states nothing new, so ownership
against open pull requests needed no new check, and no source is cited newly, so no
`needs-references.toml` is written. The overlap tool did not report the LorentzianGeometry
renumbering: LorentzianGeometry is a new roadmap, not a revision of one on main. It was found by
reading LorentzianGeometry's README at its head `43acb00` and its latest commit. The PDE roadmap ids
cited in Scope (§§1.3–1.4, Layer 7, §§7.1–7.3) were checked on main and at its open revision, and
are unchanged.

## Build

`lake build TauCetiRoadmap.CompressibleEulerEquations.Suggested`: `Build completed successfully
(18246 jobs).`, with 14 `declaration uses 'sorry'` warnings, all from the file's sorry'd headline
theorems (lines 257, 278, 300, 335, 357, 391, 426, 441, 452, 465, 482, 499, 518, 535).

## Gate

`gate CompressibleEulerEquations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Dependency check

`depcheck: 112 roadmaps, 1287 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
