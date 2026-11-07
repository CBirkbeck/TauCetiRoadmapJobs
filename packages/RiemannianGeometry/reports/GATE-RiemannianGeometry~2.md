# GATE-RiemannianGeometry~2: answers to review of 2f670bb (repairs at 82a58c9)

One unanswered comment (roed-math, 2026-11-06), making two points. Its closing request to move the
label back to `awaiting-review` is a process step for the worker, not a finding.

## H01 (roed-math) — applied

Of the two consistent owners the comment offers, the repair takes main's: `TauCetiRoadmap/RiemannianGeometry/README.md` no longer has an R7A section (old lines 2211–2445, jets, differential operators, symbols, density transpose, formal adjoint, Laplace type, canonical Bochner connection, isometric symbols). The scope paragraph (lines 24–32) now says "PseudodifferentialOperators P1.0 owns the smooth differential-operator, jet, symbol, density-transpose, formal-adjoint, Laplace-type and canonical Bochner-connection core", replacing "R7A owns … every later roadmap that needs this core consumes R7A". A PseudodifferentialOperators P1.0 entry is restored in the supplier contracts (lines 167–180), and R7 items 1–3, the Layer 7 Dependencies (line 2387) and the downstream order (line 2571) cite P1.0 where they cited R7A. The only part of R7A that P1.0 does not specify is kept as R7.3's variant (line 2267): for D:E→F with `c(ξ)*c(ξ)=|ξ|² Id_E` and possibly different ranks, D*D is Laplace type with scale one, derived from P1.0's composition and adjoint-symbol formulas, with four Checks (line 2286).

Evidence for P1.0 rather than ComplexKahlerGeometry Layer 5. On main, PseudodifferentialOperators states that it owns P1.0 (`TauCetiRoadmap/PseudodifferentialOperators/README.md` line 12) and specifies all of the old R7A: operators and jets (lines 390–393), density transpose and formal adjoint (404–407), symbols (427–457), Laplace type (438), ∇*∇ (443–450), the Dirac-type theorem and the canonical Bochner connection with the weighted-circle non-example (470–504). It names RiemannianGeometry R7 as the consumer (lines 451, 486). Main's ComplexKahlerGeometry K5a consumes P1.0 (`ComplexKahlerGeometry/README.md` lines 575–577), and so do main's SpinGeometry (lines 67–68) and Hyperfunctions (lines 36–37), as well as the open #1327 (RiemannianGeometry, lines 171–181) and #886 (DifferentialGeometry, line 1285). Only the open ComplexKahlerGeometry revisions #1398 (lines 25–26 and 36) and #1807 (line 1247) move the core to CKG Layer 5. A revision of an existing roadmap is never a dependency, so the cited owner is the one on main. #1398 itself says P1.0's statements are "reconciled on their side", and no open pull request revises PseudodifferentialOperators, so the citation "PseudodifferentialOperators P1.0" resolves whichever way #1398 settles. R7A dated from 2026-11-02 (`ff13a77f`), when PseudodifferentialOperators was still the open #952. With it as a supplier, the dependency check then reported UPWARD and CYCLE. It has been on main since 2026-11-04 (`d73b2339`), and with the P1.0 edges restored the check now reports `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`. The two-way relation at roadmap level is not a section cycle: P1.0 → R7 and R4.7 → P7a. R4.7 (README lines 1285–1290) cites no PseudodifferentialOperators target, and P1.0's dependencies (PDO lines 537–541) cite no RiemannianGeometry target. The scope paragraph now says so (line 32).

Same pattern elsewhere. R5b's "normal Jacobi differential operator, its ellipticity, principal symbol and formal self-adjointness" (line 2024) rested on Layer 7's R7A, which was a forward reference. The Layer 5 Dependencies now cite P1.0 for them (line 2091). R7 gains a two-sentence introduction (line 2231). The Kolář–Michor–Slovák and Gilkey reference entries are deleted because only R7A cited them. Neither is in `sources.toml`, so no manifest entry is orphaned. In `TauCetiRoadmap/RiemannianGeometry/Suggested.lean`, the docstring clause "the canonical Bochner connection and potential of a Laplace-type operator (R7A) …" (old lines 44–46) is deleted: that headline belongs to PseudodifferentialOperators. No declaration changed.

## H02 (roed-math) — applied

The observation is correct: the old README line 217 ("The R7A smooth core uses … ComplexKahlerGeometry K5a's pointwise metric and density line"), together with R7's use of K5a's Sobolev scales, tied the claimed core to K5a. With R7A gone, the paragraph (lines 234–243) now states the suppliers' own order: P1.0 uses SmoothBundlesConnections B2–B4, DifferentialGeometry's compact-support integration and "K5a's initial density bundle, independently of K5a's distributional and Sobolev completions, which then extend P1.0's fixed operators" (PDO lines 95–96, 400–407; CKG lines 575–577). R7 still consumes K5a's Sobolev, resolvent and Hodge theory. That edge is one-way, because K5a cites RiemannianGeometry only as a consumer (CKG lines 609, 1084).

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| R7.3 polarization ⇔ `c(ξ)*c(ξ)=|ξ|² Id` | α=β; line with c(ξ)=ξ, α=1, β=2 | α=β: `2c(α)*c(α)=2|α|²`; sum `1·2+2·1=4=2⟨1,2⟩`; difference `2−2=0` | equivalence holds; sign of sum pinned | Check 3 kept |
| R7.3 D*D Laplace type, scale 1 | D=∂ on ℝ, density dx; rank E=0; zero-dimensional base | `σ_geom(D*)=−ξ`, product `−ξ²`, Fourier `i²(−ξ²)=ξ²`, at ξ=2 value 4=1·2²; rank 0: both sides 0; dim 0: `|ξ|²=0`, order-2 symbol 0 | holds (in dim 0 the scale is not unique, but "scale one" is still true) | Check 1 |
| R7.3 equal-rank clause for D* | D=∂ (ranks 1,1); d:Ω⁰→Ω¹ on ℝ², ξ=(1,0) | ranks equal: `c c*=ξ²=|ξ|²`; ranks 1,2: `c c*=diag(1,0)`, η=(0,1) ↦ 0 ≠ η | clause needed and sufficient (for ξ≠0, `c(ξ)/|ξ|` is an isometry between equal finite ranks, hence unitary) | Check 2 |
| R7.3 "D*D minus rough Laplacian of a chosen metric connection has order ≤1" | trivial complex line, D=∂+i, ∇=d | `D*=−∂−i`, `D*D=−∂²−2i∂+1`, difference `−2i∂+1`, on x gives `x−2i` | order exactly 1, so "at most one" is sharp | Check 4 |
| R7.3 potential convention `L=s(∇ᴸ)*∇ᴸ+V` | `−∂²+3`; `D*D` above | ∇ᴸ=d, V=3 (opposite convention would give −3); `−(∂+i)²u=−u″−2iu′+u` = D*D, so ∇ᴸ=d+i dx, V=0 | added-potential sign agrees with item 4's `Δ_p=∇*∇+ℛ_p` | scale renamed s (c is the symbol) |
| d+i dx is metric | standard Hermitian metric on trivial line | `(s′+is)t̄+s(t̄′−it̄)=s′t̄+st̄′` | metric | none |
| Supplier contract: each P1.0 claim | PDO README text on main | operators/jets 390–393; transpose/adjoint 404–407; symbols/composition 427, 457, convention 70; ∇*∇ 443–450; Laplace type c>0 438; Bochner, metric under canonical density 474–480 | all present | Dirac-type for D:E→F not stated at line 470, so it is not assumed (the pre-R7A wording asserted it); R7.3 derives it |
| Scope: "P1.0 → R7 and R4.7 → P7a form no cycle" | R4.7 text; PDO P1.0 and P7a Needs | R4.7 cites no PDO target; P7a Needs R4.7 (PDO 1982); P1.0 Needs no RiemannianGeometry section (PDO 537–541); depcheck edges 2357 → 2359, 0 problems | holds | none |
| R5b on P1.0 | Layer order | before: symbol/self-adjointness from Layer 7 (forward); after: P1.0 on main | gap closed | Dependencies line 2091 |
| Order paragraph | PDO, CKG text | PDO 95–96, 400–407; CKG 575–577 | agrees | none |

**Signatures.** `Suggested.lean` changed only in the module docstring (three lines removed). No declaration, binder or `variable` changed, so the elaborated types are those of the previous round. No `#check` scratch file was elaborated this round: the only Lean command this job permits is the targeted build.

**Ownership against open pull requests**, checked by object with `roadmaps grep` over the 466 open heads and main (patterns for an owned differential-operator core and for "Bochner connection"):
- PseudodifferentialOperators P1.0 (main) is the only owner on main.
- #1398 and #1807 (ComplexKahlerGeometry revisions) claim CKG Layer 5 (H01). #1234 (another CKG revision) consumes P1.0 (line 973).
- FormalConnectionsOpers #1056 cites AlgebraicVectorBundles Layer 2 for algebraic differential operators on sheaves, which is a different object.
- No roadmap anywhere cites R7A, so deleting it breaks no citation.

**Overlap list.**
- `ComplexKahlerGeometry #k7-projective-torus-and-hopf-examples` (dropped by #1398 and #1807): the link at line 468 no longer carries the anchor. The label "ComplexKahlerGeometry K7.1" exists on main (line 1407), at #1398 (line 2154) and at #1807 (line 1962).
- DifferentialGeometry Layer 10 (lines 1241, 2207, 2223; dropped by #886): left unchanged. Main defines it (DG line 884, 10.2 Sard). #886 is a revision and is never a dependency, and it moves manifold Sard to DeRhamCohomologyAndDuality (#886 lines 259–262, 1376–1381), which is itself an open new-roadmap pull request. When #886 merges, these three citations move to DeRhamCohomologyAndDuality's manifold-Sard target.
- #1327 conflicts in both files. After this repair both heads cite PseudodifferentialOperators P1.0 for the operator core (#1327 lines 171–181, 2018–2044), so the owner no longer differs. This draft is rebased onto #1327 if #1327 merges first, keeping its convention changes without restating them.
- #1187 (pin bump) conflicts in `Suggested.lean`. Whichever merges second rebases and rebuilds at the resulting pins.
- The five closest-vocabulary roadmaps (RicciFlow, Poincare3D, PositiveMass, ManifoldOptimization, CalibratedGeometry) were not compared again beyond the operator-core search, in which none of them appears.

**Only an open revision defines:** none (the K7.1 citation resolves on main).

## Build

`lake build TauCetiRoadmap.RiemannianGeometry.Suggested`: Build completed successfully (9065 jobs), 23 `declaration uses 'sorry'` warnings, no errors.

## Gate

`gate RiemannianGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Dependency check (`--movable`): `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

Commit `82a58c9a` "RiemannianGeometry: review repairs (consume PseudodifferentialOperators P1.0 operator core; drop duplicate R7A)", not pushed.
