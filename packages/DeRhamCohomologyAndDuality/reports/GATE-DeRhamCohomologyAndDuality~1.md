# GATE-DeRhamCohomologyAndDuality~1 — answers to review of 101fd8f

The review (one comment by CBirkbeck, an AI review with findings F01–F09) is numbered H01–H09 in
order. The quoted review text ends in a truncated "Verified sound" section; all nine findings
precede the truncation. Repairs are in commit `2aaacd81` (not pushed).

## H01 (CBirkbeck) — applied

On main, `TauCetiRoadmap/DifferentialGeometry/README.md` layers 6–11 (lines 782–909) plan the de Rham complex, Mayer–Vietoris, the de Rham theorem (8.5), Poincaré duality (9.3), degree (10) and hairy ball (11), and its `Suggested.lean` declares `IsRegularPoint`, `IsRegularValue`, `dense_isRegularValue`, `finite_preimage_of_isRegularValue`, `mayerVietoris_induction` and `exists_eq_zero_of_inner_eq_zero` — the same names this folder declared. The split depends on the DifferentialGeometry revision (open), which under the contract cannot supply ownership. Change: `README.md` is recast as "differential geometry, Part II"; it imports DifferentialGeometry 0–11 by section, says where the base stops, and keeps only what DifferentialGeometry does not plan: continuous planar forms with local potentials (Layer 1), inward domination, the transfer lemma, relative smooth chains and relative approximation (Layer 2), the relative de Rham complex and isomorphism (Layer 3), the fundamental-class integration comparison and its boundary form (Layer 4), and finite-parameter relative transversality (Layer 5). The Lean declarations duplicating DifferentialGeometry (`exists_extDerivWithin_eq_of_starConvex`, `mayerVietoris_induction`, `IsRegularPoint`, `IsRegularValue`, `dense_isRegularValue`, `finite_preimage_of_isRegularValue`, the three hairy-ball theorems) are deleted.

Points for the human decision: (a) the folder name stays `DeRhamCohomologyAndDuality` (the brief allows edits only inside it); a Part II would normally be `DifferentialGeometryPartII`. (b) If the DifferentialGeometry revision is meant to land first and hand over layers 6–11, the pre-repair head `101fd8f` is the matching version, and this commit should be reverted rather than merged; the two PRs cannot both stand as they are now. (c) Main inconsistencies that this folder cannot fix: AlgebraicTopology (main, line 84) assigns the integration comparison to "DG9.3", and ComplexKahlerGeometry (main, around line 1383) cites "DG8.4's open-pair cone", "DG8.3's relative-chain comparison" and "DG9.3's relative integration formula". DifferentialGeometry's README on main plans none of these, so here they are §§2.4, 3.1–3.3 and 4.1. (d) DifferentialGeometry's `exists_smoothSimplex_homotopicRel` (main `Suggested.lean`, 8.3) is stated over every model with corners. The `3`-simplex in `[0, ∞)` with faces `(y−z)²`, `(x−z)²`, `(x−y)²` refutes it for targets with boundary (README, *Statements that must not enter the library*). That is a DifferentialGeometry defect to report there. §2.3 here proves the corner case of the absolute equivalence from the boundaryless one and leaves the statement to DifferentialGeometry 8.3.

## H02 (CBirkbeck) — applied

Confirmed at `TauCetiRoadmap/HeegaardFloer/README.md` (main) §2.1 "Sharp finite-dimensional Sard (F0.S)". Its Scope (line 20) says F0.S owns the sharp bound and that DifferentialGeometry 10.2 owns chart-transfer Sard. The sharp Sard theorem `addHaar_image_criticalPoints_eq_zero_of_contDiffOn` and the DR.5.2 prose are deleted, and Scope now cites HeegaardFloer §2.1, F0.S. The consumer paragraph that said HeegaardFloer consumes DR.5.2 is removed. No remaining target needs the sharp bound: every map in Layer 5 is `C^∞`, and §5.2 uses Tau Ceti's `TauCeti.addHaar_image_criticalPoints_eq_zero` (threshold `m² + 1`) in incidence charts.

## H03 (CBirkbeck) — applied

`Suggested.lean` line 1: `import Mathlib` → `module`, blank line, `import Mathlib` (the imports are otherwise unchanged, so the import contract — exactly `import Mathlib` followed by `TauCeti.*` modules — still holds). This is the convention on main (`TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean` starts with `module`). After the change `lake build TauCetiRoadmap.DeRhamCohomologyAndDuality.Suggested` reports only the four `declaration uses 'sorry'` warnings and the gate no longer lists `build`.

## H04 (CBirkbeck) — applied differently

The witness is right: `H⁰_dR(S⁰) = ℝ²`, while the old Check's formula "ℝ in degrees 0 and n" gives `ℝ`. The Check sat in the Mayer–Vietoris layer, which H01 removes, so it is gone with that layer (`H^k_dR(Sⁿ)` is DifferentialGeometry 7.3's acceptance). DifferentialGeometry 7.3 on main states no closed formula, so nothing there repeats the error. The rewritten README has no sphere-cohomology formula.

## H05 (CBirkbeck) — applied differently

The witnesses are right. For `S¹ → ℝ`, `H¹_dR(ℝ) = 0`; for the fold `S¹ ⊔ S¹ → S¹`, `f^*a = (a, a)` while `deg = 2`, so "the action of `f^*` on `H^n ≅ ℝ`" needs both manifolds compact and connected. The statement was DR.5.4, which H01 removes (the degree is DifferentialGeometry 10.3–10.4). Note for DifferentialGeometry: its main README 10.4 has the same phrase, "identification with the action of `f^*` on `H^n ≅ ℝ`", for compact `M` and connected `N`, and the same witnesses apply there.

## H06 (CBirkbeck) — applied differently

The witness is right: with the `ℕ` grading, `M = S¹`, `k = 2` gives `H²_dR = 0` against `(H^(1−2)_c)* = (H⁰_c(S¹))* = ℝ` under truncated subtraction. The pairing and duality (DR.4.1, DR.4.3) are removed by H01 (DifferentialGeometry 9.1, 9.3). The rewritten README states its only graded relative objects on `ℤ`, with negative degrees zero (Conventions, "Relative complexes"), and writes no `n − k` degree.

## H07 (CBirkbeck) — applied differently

The witnesses are right. `φ = x dy` has `dφ = dx ∧ dy ≠ 0`, and the constant `1` on a point has no degree-`−1` primitive, so the manifold Poincaré lemma needs `φ` closed and of degree `k + 1`. The statement (DR.1.2) is removed by H01: it is DifferentialGeometry 6.2's `exists_mextDeriv_eq_nhds`. The `x dy` witness is kept as a negative Check of `HasLocalPotentials` (§1.1), with the computation of mixed partials `0` and `1`.

## H08 (CBirkbeck) — applied

Every layer now ends with `### Examples` and `### Dependencies`, every target has a `*Needs:*` line, and every definition and theorem has at least three Checks with computed values. `HasLocalPotentials`: `dx` true, `x dy` false, the angular form locally true but with loop integral `2π`, and `d(|x|^(3/2))` true but not `C¹`. `IsRegularIncidenceParameter`: `x² + p` at `p = −1, 0, 1` gives regular, not regular, regular; with `j = id`, every `p` is regular. Strict inward cone: `(0, ∞)` at `0 ∈ [0, ∞)`, the open quadrant at the corner, all of `E` at interior points. The sections Suppliers, What Mathlib/Tau Ceti already has, and Boundaries are replaced by `## Exact supplier contracts` (From Mathlib / From Tau Ceti / From TauCetiRoadmap.DifferentialGeometry / From TauCetiRoadmap.AlgebraicTopology) and `## How to read the build`. The module docstring now names each headline that cannot be stated (§§2.3–2.4, 3.1–3.3, 4.1, 4.2) and the carrier each lacks.

## H09 (CBirkbeck) — applied

Each kept target now separates what a source proves from what is this roadmap's argument:
- §2.2: [Lee, Prop. 2.28] for exhaustion functions, made a target here (no smooth proper exhaustion exists at the Mathlib or Tau Ceti pins); [Lee, Ch. 9, collar neighbourhoods] for inward fields on the half-space model; the general convex-model semiflow is marked as this roadmap's.
- §3.1: [Bott–Tu, Ch. I, §6, relative de Rham theory], with the cocone identification and signs marked as this roadmap's.
- §4.1: [Bott–Tu, §5] for the compact boundaryless duality, with the chain-level comparison with AlgebraicTopology's classes marked as this roadmap's.
- §§5.2–5.3: [Lee, Thms. 6.35–6.36] for transversality to embedded submanifolds, with the incidence form against maps and the Haar-null refinement marked as this roadmap's.

Both books are paywalled. The locators are by theorem or section, are `uncertified`, and were not read here: the Lee numbers 6.35–6.36 agree with TangentialBordism's README, and the Bott–Tu §6 placement agrees with the secondary sources arXiv:1510.05740 (appendix) and arXiv:2109.07330. `sources.toml` is outside the files this job may edit, so no manifest entries were added. No text was requested.

## Lean signature check

All 8 declarations of `Suggested.lean` were checked with `#check @name` appended to a scratch copy of the file (the `module` header makes the declarations private to importers, so the checks run inside the module), elaborated once with `lake env lean`. Compared with the README:
- `exists_smooth_inward_deformation` carries `[FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]` explicitly.
- `addHaar_setOf_not_isRegularIncidenceParameter` carries the finite-dimensionality of `E, V, W, P` and `[MeasurableSpace P] [BorelSpace P]` in its own signature.
- `exists_isRegularIncidenceParameter_relativeTranslate` carries `E, V, W` finite-dimensional.
- The definitions keep only `NormedAddCommGroup`/`NormedSpace` binders, which is right for their bodies.
- No binder was lost.

The previous signature that looked to have lost a section binder belonged to `incidenceEquation`, whose body is plain subtraction, so nothing was lost there.

## Ownership against open work

Searched by object with `roadmaps grep` over main and the open heads:
- continuous-path local potentials: no other owner;
- strictly inward fields and inward domination: only the DifferentialGeometry revision (open), which hands them to this folder;
- relative transversality: TangentialBordism §2.1 (open, earlier in the order) has a different object (embedded submanifolds, dense good set), recorded in Scope;
- relative de Rham and fundamental-class integration: on main only as citations of DifferentialGeometry sections that do not plan them (H01 point c).

## Adversarial pass (changed or kept statements)

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `HasLocalPotentials` | `dx`; `x dy`; angular form on `ℂ∖{0}`; `d|x|^(3/2)` | potential `Re`; mixed partials `0 ≠ 1`; local `arg`, loop `2π`; `C¹` potential, form not `C¹` | true/false/true/true as stated | Checks added |
| `exists_hasFDerivAt_of_simplyConnected` | slit plane; `ℂ∖{0}` (not simply connected); `F` incomplete | `arg`; no global potential; potential differences need no limit | holds; hypothesis necessary; no `CompleteSpace` needed | prose corrected: completeness only for `curveIntegral` comparison |
| `exists_smooth_inward_deformation` | `[0,∞)`; `[0,1]` with field `1/2 − x`; field `x(1−x)`; boundaryless; empty `M` | `Φ(0,x)=x+1`, `Φ(1,x)=x`; `r(x)=1/2+(x−1/2)/e ∈ (0,1)`; `r(0)=0` not interior; `r=id`; vacuous | holds; the non-strict field fails the interior clause | new Lean headline |
| `IsRegularIncidenceParameter` | `x²+p`, `j=0`, `p=−1,0,1`; `j=id` | derivatives `±2`; `0`; empty fibre; `(u,v)↦2xu−v` onto | regular/not/regular; all regular | Checks |
| `addHaar_setOf_not_isRegularIncidenceParameter` | `x²+p`; `x²` without `p`; `V=0` | bad set `{0}`; bad set `ℝ` (universal transversality fails at `(0,p)`); empty | null; hypothesis necessary; vacuous | kept |
| `exists_isRegularIncidenceParameter_relativeTranslate` | `f=0, β=x², p=1, x=2`; `β=0, C=E`; `f=x², β=x², j=0` | `4`, fixes `C={0}`; `p=0`; `x²(1+p)` has derivative `0` at zero for every `p` | holds; holds; `hgood` necessary | Check added; an earlier draft Check claiming `β ≥ 0` is necessary was wrong (the case `β=x`, `f=j=0` violates `hgood`), so it was replaced |
| avoidance (`dim E + dim W < dim V`) | — | rank bound: an onto map `E×W → V` needs `dim V ≤ dim E + dim W` | true but a one-step rank argument | removed from Lean as padding, kept as README prose |
| relative `δ` sign | `(ℝ, ℝ∖{0})`, `b = 1_{(0,∞)}`, `c=[−1,1]` | `(0,b)` integrates to `−1`, so `δ[b]` gives `+1` = singular `b(∂c)=1`; opposite sign gives `−1` | convention pinned | Check |
| §4.2 boundary formula | `D¹`, `α=0`, `β=c₊,c₋`; `[0,1]`, `α=dx`, `β=x` | `−(c₊−c₋)`; `1−1=0` = exactness of `d(x,0)` | consistent | Checks |
| §3.3 | `(ℝ², ℝ²∖0)` | `H²≅ℝ` via `δ[dθ]` evaluating to `2π`; `H¹=0` from the LES `ℝ→ℝ` iso | consistent | Check |
| `exists_smooth_inward_deformation`, times `t ∈ ℝ` | `M = [0, ∞)` with field `1` vs. `M = [0,1)` with field `1` (noncomplete) | `ψ(s,x) = x + s` defined for all `s ≥ 0`; on `[0,1)` the flow leaves at `s = 1 − x`, so `Φ(t, x)` is undefined once `(1−t)² ≥ 1 − x` without rescaling | the statement needs a globally defined semiflow, which §2.2's rescaling `|Xf| ≤ 1/2` by a proper exhaustion supplies; `(1−t)² ≥ 0` keeps every time forward | none (route already rescales) |

`hnonneg` in the relative-translate theorem appears not to be needed for truth (surjectivity is an open condition near `C`), but the proof route uses it. Noted as P3, not changed.

## Build and gate

- `lake build TauCetiRoadmap.DeRhamCohomologyAndDuality.Suggested` at `2aaacd81`: exit 0, `Build completed successfully (8988 jobs)`; the only warnings are 4 × `declaration uses 'sorry'` (lines 54, 73, 109, 122). The module-system advisory is gone.
- `roadmaps resolve` on the README: no unresolved citations, no unresolved Lean names.
- Gate on the clean tree at `2aaacd81`:
  `gate DeRhamCohomologyAndDuality: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`, the only item being `depcheck: NOT IN ORDER: DeRhamCohomologyAndDuality (insert it after its last supplier)`.
- Direction check (`gate --depcheck … --movable`):
  ```text
  NOT IN ORDER: DeRhamCohomologyAndDuality (insert it after its last supplier)
  depcheck: 204 roadmaps, 1641 edges, 1 problem(s)
  ```
  There is no UPWARD and no CYCLE line. The only item is the design-stage "not in the merge order", which is not a defect before intake; the merge-order file was not edited. Suppliers: DifferentialGeometry and AlgebraicTopology (main), Mathlib and Tau Ceti. HeegaardFloer, GeometricTopology and TangentialBordism are named only as owners of excluded material, not consumed.

## Other edit

`README.md` lines 131 and 506: `IsLocallyCollared.isCollared` → `TauCeti.IsLocallyCollared.isCollared`, the declaration's name at the pinned Tau Ceti (`Geometry/Manifold/Boundary/Collar/Brown.lean:458`, which assumes a compact domain, as §4.2 does).

## Sources

The README cites [Lee] (Prop. 2.28, Ch. 9, Thms. 6.35–6.36) and [Bott–Tu] (Ch. I §§5–6) by locator only; both are paywalled books, not read here, and recorded as uncertified locators. `sources.toml` is outside the two files this job may edit, so no manifest entry was added and no text was requested in `needs-references.toml`.
